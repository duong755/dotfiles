const GO_DEV_URL = "https://go.dev/dl";

/**
 *
 * @param {string} version
 * @param {string} arch
 * @returns {string}
 */
function getDownloadUrl(version, arch = "linux-amd64") {
  return `${GO_DEV_URL}/${version}.${arch}.tar.gz`;
}

exports.GO_DEV_URL = GO_DEV_URL;
exports.getDownloadUrl = getDownloadUrl;
