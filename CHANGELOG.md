# Changelog

All notable changes to DARK VPN Backhaul Manager are recorded here.
This project follows [Semantic Versioning](https://semver.org/).

## [1.9.2] - 2026-09-07

### Security

- **Pair Code injection (critical).** A crafted Pair Code could place shell
  metacharacters into the `TOKEN` field. That value was written verbatim into
  `meta.conf`, which `load_meta` then sourced, executing the payload as root
  on the next load. Pair Codes pass through validation before use, and
  `meta.conf` is no longer sourced.
- `load_meta` parses `meta.conf` as key/value data against a whitelist of
  known keys. Unknown keys are ignored and no value is ever evaluated.
- Added `valid_token` (8-128 chars, `A-Z a-z 0-9 + / = . _ @ : -`) and
  `valid_ports_csv`. Both the Pair Code path and manual entry use them.
- `valid_ip4` now range-checks each octet and rejects leading zeros.
  `valid_host` rejects hostnames beginning with `-`.
- The manual edge-IP prompt validates its input instead of accepting any string.
- All temporary files use `mktemp`. Removed the fixed paths
  `/tmp/backhaul.pkg`, `/tmp/bh-*` and `/tmp/acme.$$.log`, which were open to
  symlink attacks on multi-user hosts.
- The SHA-256 of every downloaded core binary is displayed before installation.
- Custom core URLs must use HTTPS and now require explicit confirmation.

### Changed

- **Tunnel menu regrouped.** `Pair code` has its own PAIRING section instead of
  sitting under INSPECT, and appears only on the IRAN side. `Speed test` and
  `Logs + connections` moved from CONFIGURE to INSPECT, since neither changes
  anything. `Edit config by hand` and `Delete tunnel` moved to a new ADVANCED
  section, away from the read-only actions. All key bindings are unchanged.
- `Ports` is hidden on the KHAREJ side rather than shown with an
  "iran side only" note; pressing `4` there explains where to configure them.

### Compatibility

- Existing tunnels, `meta.conf` files and B1/B2 Pair Codes work unchanged.
- A manually entered token containing characters outside the allowed set will
  now be rejected. Tokens produced by the script are unaffected.

## [1.9.0] - earlier

- First public release.
