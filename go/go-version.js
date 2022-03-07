const {
  from,
  mergeMap,
  reduce,
  Observable,
  throwError,
  concatMap,
  take,
} = require("rxjs");
const { JSDOM } = require("jsdom");
const axios = require("axios").default;

const { GO_DEV_URL } = require("./string");
const {
  extractStableVersions,
  extractUnstableVersions,
  extractArchiveVersions,
} = require("./version-extractor");

async function getHtml() {
  /**
   *
   * @type {import("axios").AxiosResponse<string, string>}
   */
  const response = await axios.get(GO_DEV_URL);
  const html = response.data;
  const dom = new JSDOM(html);
  return dom.window.document;
}

/**
 *
 * @description Get stable versions, unstable versions, archive versions sequentially
 * @returns {Observable<string[]>}
 */
function goGetAllVersions() {
  return from(getHtml()).pipe(
    mergeMap((document) => {
      return from(["stable", "unstable", "archive"]).pipe(
        concatMap((versionType) => {
          switch (versionType) {
            case "stable": {
              return extractStableVersions(document);
            }
            case "unstable": {
              return extractUnstableVersions(document);
            }
            case "archive": {
              return extractArchiveVersions(document);
            }
            default: {
              const message = `Version type is not equal to "stable", "unstable", or "archive"`;
              return throwError(() => message);
            }
          }
        })
      );
    }),
    reduce((/** @type {string[]} */ acc, version) => acc.concat(version), [])
  );
}

/**
 *
 * @description Get Go versions by type (stable, unstable, or archive)
 * @param {string} versionType
 * @returns {Observable<string[]>}
 */
function goGetVersions(versionType) {
  return from(getHtml()).pipe(
    mergeMap((document) => {
      switch (versionType) {
        case "stable": {
          return extractStableVersions(document);
        }
        case "unstable": {
          return extractUnstableVersions(document);
        }
        case "archive": {
          return extractArchiveVersions(document);
        }
        default: {
          const message = `Version type is not equal to "stable", "unstable", or "archive"`;
          return throwError(() => message);
        }
      }
    }),
    reduce((/** @type {string[]} */ acc, version) => acc.concat(version), [])
  );
}

/**
 *
 * @returns {Observable<string>}
 */
function goGetLatestStableVersion() {
  return from(getHtml()).pipe(
    mergeMap((document) => {
      return extractStableVersions(document);
    }),
    take(1)
  );
}

exports.getHtml = getHtml;
exports.goGetVersions = goGetVersions;
exports.goGetAllVersions = goGetAllVersions;
exports.goGetLatestStableVersion = goGetLatestStableVersion;
