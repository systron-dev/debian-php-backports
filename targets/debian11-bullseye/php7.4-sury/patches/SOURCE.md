# Patch provenance

No additional patches. The source is Ondřej Surý's complete
`php7.4 1:7.4.33-37+debsuryorg12.1+php+1` package (packages.sury.org, built for
bookworm; the trixie variant differs only in `debian/changelog`), which carries the
fixes for CVE-2026-129538, CVE-2026-129496, CVE-2026-129289, CVE-2026-129292,
CVE-2026-129291, CVE-2026-128090, CVE-2026-126714, CVE-2026-115560, CVE-2026-15353,
CVE-2026-129506, CVE-2026-128064 and CVE-2026-127960, and the earlier bailout
mitigation for CVE-2026-109618 and CVE-2026-109619 in
`debian/patches/0163-Avoid-state-corruption-via-bailout.patch`.
The `.dsc` SHA256 is pinned in `target.conf`. It is the same file as for the other
`php7.4-sury` targets (`debian9-stretch`, `debian10-buster`, `ubuntu14.04-trusty`,
`ubuntu16.04-xenial`, `ubuntu18.04-bionic`, `ubuntu20.04-focal`): one source, rebuilt per
release. Bump the version, the SHA256 and the comment in all of them together.

The secure-DNS telemetry patches `0127` and `0197` are dropped, as on every `sury`
target.
