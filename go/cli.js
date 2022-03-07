const { program, Command } = require("commander");
const { lastValueFrom } = require("rxjs");

const {
  goGetVersions,
  goGetAllVersions,
  goGetLatestStableVersion,
} = require("./go-version");

program
  .addCommand(new Command("ls"))
  .option(
    "--version-type <string>",
    "Version type: latest, stable, unstable, archive, all",
    "latest"
  )
  .action(async function (options) {
    switch (options.versionType) {
      case "latest": {
        const version = await lastValueFrom(goGetLatestStableVersion());
        console.log(version);
        break;
      }
      case "stable": {
        const versions = await lastValueFrom(goGetVersions("stable"));
        versions.forEach(function (version) {
          console.log(version);
        });
        break;
      }
      case "unstable": {
        const versions = await lastValueFrom(goGetVersions("unstable"));
        versions.forEach(function (version) {
          console.log(version);
        });
        break;
      }
      case "archive": {
        const versions = await lastValueFrom(goGetVersions("archive"));
        versions.forEach(function (version) {
          console.log(version);
        });
        break;
      }
      case "all": {
        const versions = await lastValueFrom(goGetAllVersions());
        versions.forEach(function (version) {
          console.log(version);
        });
        break;
      }
      default: {
        const errorMessage =
          "Version type must be 'all', 'stable', 'unstable', or 'archive'";
        console.error(errorMessage);
        process.exit(1);
      }
    }
  });

program.parse(process.argv, { from: "user" });
