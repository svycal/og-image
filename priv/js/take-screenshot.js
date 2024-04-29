const core = require("puppeteer-core");
const fs = require("fs");
const os = require("node:os");

const executablePath =
  process.platform === "win32"
    ? "C:\\Program Files (x86)\\Google\\Chrome\\Application\\chrome.exe"
    : process.platform === "linux"
    ? "/usr/bin/google-chrome"
    : "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome";

/**
 * Takes a rendered screenshot of an HTML page.
 *
 * @param {string} html - the contents of the page.
 * @param {boolean} isDev - whether we are in development mode.
 * @returns a Base64 encoded string of the screenshot.
 */
async function takeScreenshot(html) {
  let file;

  const browser = await core.launch({
    executablePath,
    headless: true,
    args: [
      "--disable-gpu",
      "--disable-dev-shm-usage",
      "--disable-setuid-sandbox",
      "--no-sandbox",
    ],
  });

  try {
    const page = await browser.newPage();

    // Set the viewport size to match standard open graph image cards
    await page.setViewport({ width: 1200, height: 630 });

    // Set the content to our rendered HTML
    await page.setContent(html, { waitUntil: "domcontentloaded" });

    // Wait until all images and fonts have loaded
    //
    // See: https://github.blog/2021-06-22-framework-building-open-graph-images/#some-performance-gotchas
    await page.evaluate(async () => {
      const selectors = Array.from(document.querySelectorAll("img"));
      await Promise.all([
        document.fonts.ready,
        ...selectors.map((img) => {
          // Image has already finished loading, let’s see if it worked
          if (img.complete) {
            // Image loaded and has presence
            if (img.naturalHeight !== 0) return;
            // Image failed, so it has no height
            throw new Error("Image failed to load");
          }
          // Image hasn’t loaded yet, added an event listener to know when it does
          return new Promise((resolve, reject) => {
            img.addEventListener("load", resolve);
            img.addEventListener("error", reject);
          });
        }),
      ]);
    });

    // Take the screenshot of the page
    file = await page.screenshot({ type: "png", encoding: "base64" });

    await page.close();
  } finally {
    await browser.close();
  }

  // Sometimes this fails with `ENOTEMPTY: directory not empty`. This is not
  // really supposed to happen, but I suspect when it does it's due to a race
  // condition of some kind where a directory is getting modified during the
  // recursive delete operation. We can just swallow this and figure it will
  // eventually succeed on subsequent requests. It might be a good idea to move
  // this into an Oban-managed cron task so that it won't affect the performance
  // of the screenshot process.
  try {
    deletePuppeteerProfiles();
  } catch {}

  return file;
}

/**
 * Delete puppeteer profiles from temp directory to free up space
 * See: https://github.com/puppeteer/puppeteer/issues/6414
 */
function deletePuppeteerProfiles() {
  const tmpdir = os.tmpdir();

  fs.readdirSync(tmpdir).forEach((file) => {
    if (file.startsWith("puppeteer_dev_chrome_profile")) {
      fs.rmSync(`/${tmpdir}/${file}`, { recursive: true, force: true });
    }
  });
}

module.exports = takeScreenshot;
