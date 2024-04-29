const twemoji = require("@twemoji/api");

/**
 * Takes a string and converts emoji to images.
 *
 * @param {*} text - the text to convert.
 * @returns a string with the emoji replaced with images.
 */
function emojify(text) {
  return twemoji.parse(text);
}

module.exports = emojify;
