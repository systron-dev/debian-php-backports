# Patch provenance

No additional patches. The source is Ondřej Surý's complete
`php7.3 7.3.33-41+debsuryorg12.1+php+1` package (packages.sury.org, built for
bookworm; the other variants differ only in `debian/changelog`), which carries the
fixes for CVE-2026-129538, CVE-2026-129496, CVE-2026-129289, CVE-2026-129292,
CVE-2026-129291, CVE-2026-128090, CVE-2026-126714, CVE-2026-115560,
CVE-2026-15353, CVE-2026-129506, CVE-2026-128064 and CVE-2026-127960, and the
earlier bailout mitigation for CVE-2026-109618 and CVE-2026-109619 in
`debian/patches/0142-Avoid-state-corruption-via-bailout.patch` with its follow-up
`0144-missing-in-previous-Avoid-state-corruption-via-bailo.patch`.
The `.dsc` SHA256 is pinned in `target.conf`. It is the same file as for
`debian9-stretch/php7.3-sury` and `ubuntu16.04-xenial/php7.3-sury`: one source, rebuilt
per release. Bump the version, the SHA256 and the comment in all three together.

The secure-DNS telemetry patches `0125` and `0224` are dropped, as on every `sury` target.
