# Patch provenance

No additional patches. The source is Ondřej Surý's complete
`php7.0 7.0.33-97+debsuryorg12.1+php+1` package (packages.sury.org, built for
bookworm; the other variants differ only in `debian/changelog`), which carries the
fixes for CVE-2026-129538, CVE-2026-129496, CVE-2026-129289, CVE-2026-129292,
CVE-2026-129291, CVE-2026-128090, CVE-2026-126714, CVE-2026-115560,
CVE-2026-15353, CVE-2026-129506, CVE-2026-128064 and CVE-2026-127960, and the
earlier bailout mitigation for CVE-2026-109618 and CVE-2026-109619 in
`debian/patches/0229-Avoid-state-corruption-via-bailout.patch`.
The `.dsc` SHA256 is pinned in `target.conf`.

Changes:

- the secure-DNS telemetry patches `0220` and `0351` are dropped from the series,
- `php-common` is rebuilt from Sury's `php-defaults` 101+debsuryorg12.1+php+1
  (`.dsc` SHA256 pinned in `build/build.conf`) without the `Breaks` field of
  `php-common`: it lists older PECL extension packages (`php-apcu (<< 5.1.24-1~)`,
  `php-imagick (<< 3.7.0-12~)`, …) that do not work with PHP 8, and would make apt
  remove working extensions here.
