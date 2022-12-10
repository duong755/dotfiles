import sys
import re
from typing import List


class Semver(object):
    def __init__(self, version_str: str):
        numbers = re.findall("\d+", version_str)
        if len(numbers) < 3:
            raise ValueError(
                f"{version_str} is not a valid version string here")
        self.major = int(numbers[0])
        self.minor = int(numbers[1])
        self.patch = int(numbers[2])

    def __lt__(self, other):
        if (self.major < int(other.major)):
            return True
        elif (self.major == int(other.major) and self.minor < int(other.minor)):
            return True
        elif (self.major == int(other.major) and self.minor == int(other.minor) and self.patch < int(other.patch)):
            return True
        return False

    def __gt__(self, other):
        if self.major > int(other.major):
            return True
        elif self.major == int(other.major) and self.minor > int(other.minor):
            return True
        elif self.major == int(other.major) and self.minor == int(other.minor) and self.patch > int(other.patch):
            return True
        return False

    def __eq__(self, other):
        return self.major == other.major and self.minor == other.minor and self.patch == other.patch

    def __le__(self, other):
        return not self.__gt__(other)

    def __ge__(self, other):
        return not self.__lt__(other)

    def __ne__(self, other):
        return not self.__eq__(other)

    def __cmp__(self, other):
        if self.__eq__(other):
            return 0
        elif self.__lt__(other):
            return -1
        return 1

    def __str__(self) -> str:
        return f"{self.major}.{self.minor}.{self.patch}"


def latest_version(versions: List[Semver]) -> Semver:
    if versions.__len__() == 0:
        raise ValueError("List is empty")
    elif versions.__len__() == 1:
        return versions[0]

    the_latest = versions[0]
    for version in versions:
        if version.__gt__(the_latest):
            the_latest = version

    return the_latest


def extract_version_str(filename: str) -> Semver:
    """
    Extract version string x.y.z from filename
    """
    matches = re.findall("\d+\.\d+\.\d+", filename)
    if len(matches) > 0:
        return Semver(matches[0])
    return None


filenames = sys.argv[1:]
all_versions = [extract_version_str(filename) for filename in filenames]

print(latest_version(versions=all_versions))
