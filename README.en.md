# DARK VPN · BACKHAUL

<p align="center">
  <b>🌐 Language / زبان</b><br>
  <a href="README.en.md"><b>English</b></a> •
  <a href="README.fa.md">فارسی</a>
</p>

```text
╭────────────────────────────────────────────────────────────────╮
│ ██████╗  █████╗ ██████╗ ██╗  ██╗                              │
│ ██╔══██╗██╔══██╗██╔══██╗██║ ██╔╝                              │
│ ██║  ██║███████║██████╔╝█████╔╝                               │
│ ██║  ██║██╔══██║██╔══██╗██╔═██╗                               │
│ ██████╔╝██║  ██║██║  ██║██║  ██╗                              │
│ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝                              │
│ B A C K H A U L   ·   reverse tunnel                          │
╰────────────────────────────────────────────────────────────────╯
```

<p align="center">
  <b>Advanced Backhaul Reverse Tunnel Manager</b><br>
  <code>Version 1.9.0</code><br>
  Support: <code>@mikakhadm</code>
</p>

---

## Overview

**DARK VPN Backhaul Manager** is a Bash-based manager for installing, creating, operating, monitoring, testing and troubleshooting reverse tunnels powered by **Musixal/Backhaul**.

> **IRAN = Server**  
> **KHAREJ = Client**  
> The Pair Code is generated on IRAN and pasted on KHAREJ.

## Quick Install

```bash
curl -fsSL https://raw.githubusercontent.com/darktunnelmika/dark-backhaul/main/install.sh | bash
```

Then:

```bash
darkbh
```

## Architecture

```text
USER
  │
  ▼
┌──────────────────────┐
│      IRAN SERVER     │
│   Backhaul Server    │
│   User-facing Ports  │
└──────────┬───────────┘
           │ Reverse Tunnel
           ▼
┌──────────────────────┐
│     KHAREJ SERVER    │
│   Backhaul Client    │
│ Xray / Panel / Apps  │
└──────────────────────┘
```

## Main Features

- Guided IRAN / KHAREJ tunnel creation
- Pair Code V2 with B1 backward compatibility
- Multi-port forwarding and custom target mapping
- Transports: `tcp`, `tcpmux`, `ws`, `wsmux`, `wss`, `wssmux`, `udp`
- Real performance profiles: Stable, Balanced, Low Ping, Turbo
- Advanced tuning overrides
- Endpoint management
- systemd services and boot startup
- Scheduled restart timers
- Live dashboard
- Kernel-level live connection inspection
- Traffic accounting
- Live logs, errors and event summaries
- Drop / reconnect pattern analysis
- Latency, passive throughput and active throughput tests
- KHAREJ speed responder
- Health check and link test
- Config fingerprint comparison
- IRAN reachability testing
- TLS / certificate manager
- Certificate auto-discovery
- Let's Encrypt via `acme.sh`
- Self-signed and manual certificates
- Certificate expiry monitoring
- Partial tunnel cleanup
- Safe service stop / force kill
- Automatic config regeneration
- Manual config editing
- Random tunnel tokens
- IP / NAT detection
- Port conflict checks
- Dependency installer
- Backhaul core update
- Script self-update
- Custom update source
- Install as `darkbh`
- Full uninstall

## Performance Profiles

| Profile | Best for |
|---|---|
| Stable | Lossy or unstable routes |
| Balanced | General use |
| Low Ping | Gaming and latency-sensitive traffic |
| Turbo | High user / connection counts |

## Tunnel Management

```text
Start
Stop
Restart
Ports
Tuning
Endpoint
Scheduled Restart
Speed Test
Logs + Connections
Show Config
Pair Code
Edit Config
Delete Tunnel
```

## Diagnostics

```text
Live Log
Last 60 Lines
Health Check
Link Test
Config Fingerprint
Reach Iran Server
Speed Responder
Toggle Debug Logs
```

## Core Manager

```text
Latest GitHub Release
Local files from /root/backhaul
Custom URL
```

Supported architectures:

```text
amd64
arm64
arm
386
```

## Update Source

```text
https://raw.githubusercontent.com/darktunnelmika/dark-backhaul/main/dark-backhaul.sh
```

## Server Paths

```text
/etc/dark-backhaul/
/etc/dark-backhaul/tunnels/
/etc/dark-backhaul/certs/
/usr/local/bin/backhaul
/usr/local/bin/darkbh
```

## Upstream

The core comes from **Musixal/Backhaul**.  
DARK VPN Backhaul Manager is an independent management layer.

## Version & Support

```text
DARK VPN Backhaul Manager
Version: 1.9.0
Support: @mikakhadm
```

<p align="center">
  <b>🌐 Language / زبان</b><br>
  <a href="README.en.md"><b>English</b></a> •
  <a href="README.fa.md">فارسی</a>
</p>
