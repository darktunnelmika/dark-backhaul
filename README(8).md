# DARK VPN · Backhaul Manager

A Bash manager for [Musixal/Backhaul](https://github.com/Musixal/Backhaul), built for simple IRAN ↔ KHAREJ reverse-tunnel deployment and day-to-day operation.

**Script version:** `v1.9.0`  
**Support:** `@mikakhadm`

> Role model used by this manager: **IRAN = server** and **KHAREJ = client**. The Pair Code is generated on IRAN and pasted on KHAREJ.

## Features

- Guided IRAN / KHAREJ tunnel creation
- Pair Code for fast two-server setup
- Multi-port forwarding and custom `host:port` targets
- Transports: `tcp`, `tcpmux`, `ws`, `wss`, `wsmux`, `wssmux`, `udp`
- Performance profiles: Stable, Balanced, Low Ping, Turbo
- Advanced tuning overrides
- TLS certificate discovery, self-signed certificates, and Let's Encrypt issuance via `acme.sh`
- systemd service management and scheduled restart timers
- Live dashboard, connection view, traffic counters, logs, and event summaries
- Latency, passive throughput, and active throughput tests
- Health check, link test, reachability test, and config fingerprint
- Core installer/updater for Musixal/Backhaul releases
- Script self-update source support
- Full uninstall

## Quick install

Run as `root`:

```bash
curl -fsSL https://raw.githubusercontent.com/darktunnelmika/dark-backhaul/main/install.sh | bash
```

After installation, launch it any time with:

```bash
darkbh
```

## Manual install

```bash
curl -fsSL https://raw.githubusercontent.com/darktunnelmika/dark-backhaul/main/dark-backhaul.sh -o /usr/local/bin/darkbh
chmod +x /usr/local/bin/darkbh
mkdir -p /etc/dark-backhaul
echo 'https://raw.githubusercontent.com/darktunnelmika/dark-backhaul/main/dark-backhaul.sh' > /etc/dark-backhaul/update.url
darkbh
```

## Basic setup flow

### 1. IRAN server

1. Open `darkbh`
2. Install/update the Backhaul core
3. Choose **New tunnel - IRAN**
4. Set tunnel name and tunnel port
5. Add the user-facing forwarded ports
6. Pick a performance profile and transport
7. Copy the generated Pair Code

### 2. KHAREJ server

1. Open `darkbh`
2. Install the same Backhaul core version
3. Choose **New tunnel - KHAREJ**
4. Paste the Pair Code from IRAN
5. Start the tunnel

The real service/panel stays on the KHAREJ side while user-facing ports are exposed on IRAN.

## Requirements

- Linux server with root access
- Bash
- systemd for service management
- Outbound HTTPS access for online core/script/certificate installation
- Supported package manager: `apt`, `dnf`, `yum`, or `apk`

The script installs common missing dependencies automatically where supported.

## Files used on the server

```text
/etc/dark-backhaul/                 configuration and tunnel metadata
/etc/dark-backhaul/tunnels/         per-tunnel configuration
/usr/local/bin/backhaul             Backhaul core
/usr/local/bin/darkbh                manager command (after install)
```

## Upstream project

This manager downloads and runs the Backhaul core from:

- https://github.com/Musixal/Backhaul

DARK VPN Backhaul Manager is a separate management script and is not the upstream Backhaul project.
