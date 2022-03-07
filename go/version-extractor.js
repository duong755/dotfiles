const { Observable } = require("rxjs");

/**
 *
 * @param {Document} document
 * @returns {Observable<string>}
 */
function extractStableVersions(document) {
  const versionType = "stable";
  const heading = document.getElementById(versionType);
  return new Observable((observer) => {
    const firstVersionElement = heading?.nextElementSibling;
    (function _extractVersionString(element) {
      if (element && element.id?.startsWith("go")) {
        if (element.matches("div.toggleVisible")) {
          const versionString = element.id;
          observer.next(versionString);
          _extractVersionString(element.nextElementSibling);
        } else {
          observer.complete();
        }
      } else {
        observer.complete();
      }
    })(firstVersionElement);
  });
}

/**
 *
 * @param {Document} document
 * @returns {Observable<string>}
 */
function extractUnstableVersions(document) {
  const versionType = "unstable";
  const heading = document.getElementById(versionType);
  return new Observable((observer) => {
    const firstVersionElement = heading?.nextElementSibling;
    (function _extractVersionString(element) {
      if (element && element.id?.startsWith("go")) {
        if (element.matches("div.toggle")) {
          const versionString = element.id;
          observer.next(versionString);
          _extractVersionString(element.nextElementSibling);
        } else {
          observer.complete();
        }
      } else {
        observer.complete();
      }
    })(firstVersionElement);
  });
}

/**
 *
 * @param {Document} document
 * @returns {Observable<string>}
 */
function extractArchiveVersions(document) {
  const versionType = "archive";
  const archiveContainer = document.getElementById(versionType);
  const versionElements = archiveContainer?.getElementsByClassName("toggle");
  return new Observable((observer) => {
    if (versionElements) {
      Array.from(versionElements).forEach((element) => {
        const versionString = element.id;
        observer.next(versionString);
      });
    }
    observer.complete();
  });
}

exports.extractStableVersions = extractStableVersions;
exports.extractUnstableVersions = extractUnstableVersions;
exports.extractArchiveVersions = extractArchiveVersions;
