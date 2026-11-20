#!/usr/bin/env bash
# Version suffix handling, shared by build/build.sh and tests/install/run.sh.
# Sourced before build/build.conf, whose PHP_COMMON_VERSION uses VERSION_SUFFIX.
#
# The committed NEW_VERSION values in targets/ carry a "+animaa<N>" suffix (+animaa1,
# +animaa2, +animaa4~squeeze). VERSION_SUFFIX replaces that suffix in a local build, so
# one knob renames every package without editing 24 files:
#
#   VERSION_SUFFIX=+example1 make build-debian11-bullseye/php7.4-sury
#
# With no override the committed values are left alone, which also keeps targets that
# carry another counter (+animaa2) or a distribution tag (~squeeze) as they are.

VERSION_SUFFIX_DEFAULT=+animaa1
# "set" only when the caller gave a non-empty value: an explicit request, even one that
# names the default, must replace the counter a target carries (+animaa2, +animaa4).
VERSION_SUFFIX_SET="${VERSION_SUFFIX:+set}"
VERSION_SUFFIX="${VERSION_SUFFIX:-$VERSION_SUFFIX_DEFAULT}"

apply_version_suffix() {
    [ -n "${NEW_VERSION:-}" ] || return 0
    [ -n "$VERSION_SUFFIX_SET" ] || return 0
    case "$VERSION_SUFFIX" in
        +?*) ;;
        *)
            echo "ERROR: VERSION_SUFFIX '$VERSION_SUFFIX' must start with '+'" >&2
            return 1 ;;
    esac
    # Greedy prefix: the last "+animaa<N>" is the one replaced, and whatever follows it
    # stays ("+animaa4~squeeze" keeps its "~squeeze" tail).
    if [[ ! "$NEW_VERSION" =~ ^(.*)\+animaa([0-9]+)(.*)$ ]]; then
        echo "ERROR: $NEW_VERSION (in the target's target.conf) carries no" \
             "'+animaa<N>' suffix to replace" >&2
        return 1
    fi
    NEW_VERSION="${BASH_REMATCH[1]}$VERSION_SUFFIX${BASH_REMATCH[3]}"
}
