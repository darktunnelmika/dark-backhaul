# DARK VPN · BACKHAUL

<p align="center">
  <b>🌐 زبان / Language</b><br>
  <a href="README.md">English</a> •
  <a href="README.fa.md"><b>فارسی</b></a>
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
  <b>مدیریت حرفه‌ای Reverse Tunnel بر پایه Backhaul</b><br>
  <code>Version 1.9.0</code><br>
  Support: <code>@mikakhadm</code>
</p>

---

## معرفی پروژه

**DARK VPN Backhaul Manager** یک اسکریپت Bash برای نصب، ساخت، مدیریت، مانیتورینگ، تست و عیب‌یابی تونل‌های Reverse بر پایه **Musixal/Backhaul** است.

هدف پروژه این است که راه‌اندازی و مدیریت Backhaul بین ایران و خارج بدون نیاز به نوشتن دستی کانفیگ و تنظیمات پیچیده انجام شود.

> **IRAN = Server**  
> **KHAREJ = Client**  
> Pair Code روی ایران ساخته می‌شود و روی خارج وارد می‌شود.

## نصب سریع

```bash
curl -fsSL https://raw.githubusercontent.com/darktunnelmika/dark-backhaul/main/install.sh | bash
```

سپس:

```bash
darkbh
```

## معماری

```text
کاربر
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

## قابلیت‌های اصلی

- نصب و بروزرسانی Backhaul Core
- ساخت Tunnel ایران و خارج
- Pair Code V2 با سازگاری B1
- Multi-Port
- Port Mapping به Target دلخواه
- مدیریت پورت بدون ساخت مجدد Tunnel
- Transportهای `tcp`, `tcpmux`, `ws`, `wsmux`, `wss`, `wssmux`, `udp`
- Performance Profile واقعی: Stable / Balanced / Low Ping / Turbo
- Advanced Tuning و Override پارامترهای واقعی Backhaul
- مدیریت Endpoint
- systemd Service برای هر Tunnel
- اجرای خودکار بعد از Reboot
- Scheduled Restart
- Live Dashboard
- Live Connections از Socketهای واقعی Kernel
- Traffic Accounting
- Live Log
- Errors Only
- Event Summary
- تحلیل علت Drop / Reconnect
- Latency Test واقعی از مسیر Tunnel
- Passive Throughput
- Active Throughput
- Speed Responder سمت خارج
- Health Check
- Link Test
- Config Fingerprint
- Reach Iran Server
- TLS / Certificate Manager
- Auto Discovery گواهی‌ها
- Let's Encrypt با `acme.sh`
- Self-Signed Certificate
- Manual Certificate
- Certificate Expiry Monitoring
- تشخیص و پاک‌سازی Tunnel ناقص
- Safe Stop و Force Kill در صورت گیر کردن systemd
- Config Regeneration
- نمایش Config
- ویرایش دستی Config
- Token تصادفی
- تشخیص IP و NAT
- بررسی Port Conflict
- Dependency Installer
- Core Update
- Script Auto Update
- تغییر Update Source
- نصب به عنوان دستور `darkbh`
- Uninstall کامل

## Transportها

```text
tcp
tcpmux
ws
wsmux
wss
wssmux
udp
```

| Transport | کاربرد |
|---|---|
| `tcp` | ساده و مستقیم |
| `tcpmux` | مناسب Connection و User بیشتر |
| `ws` | WebSocket |
| `wsmux` | WebSocket + Multiplexing |
| `wss` | WebSocket Secure + TLS |
| `wssmux` | TLS + WebSocket + MUX |
| `udp` | سناریوهای UDP |

## Performance Profiles

| Profile | مناسب برای |
|---|---|
| **Stable** | مسیرهای ناپایدار و دارای Packet Loss |
| **Balanced** | استفاده عمومی |
| **Low Ping** | Gaming و Latency پایین |
| **Turbo** | User و Connection بالا |

پارامترهایی که توسط Profile و Tuning کنترل می‌شوند:

```text
Connection Pool
Channel Size
Heartbeat
Keepalive
MUX Connections
Aggressive Pool
Retry Interval
Dial Timeout
TCP NoDelay
MUX Frame Size
Receive Buffer
Stream Buffer
MUX Version
```

## Pair Code

Pair Code روی سرور ایران ساخته می‌شود:

```text
DBH-xxxxxxxxxxxxxxxxxxxxxxxx
```

و اطلاعات لازم برای ساخت سمت خارج را حمل می‌کند:

```text
Iran IP
Tunnel Port
Token
Transport
Performance Profile
Scheduled Restart
Port Mapping
```

## Multi-Port و Port Mapping

مثال:

```text
443
2053
2083
8443
5000
```

Target سفارشی:

```text
443  -> 127.0.0.1:443
2053 -> 127.0.0.1:2053
```

## Manage Tunnel

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

اطلاعات نمایش داده‌شده:

```text
State
Role
Transport
Profile
Uptime
Reconnect Events
Scheduled Restart
Certificate
Traffic
Endpoint
```

## Dashboard و Live Connections

Dashboard وضعیت Tunnelها و سیستم را نمایش می‌دهد.

Live Connections مستقیماً از `ss -tin` خوانده می‌شود و می‌تواند موارد زیر را نمایش دهد:

```text
Peer IP
Peer Port
RTT
Bytes Sent
Bytes Received
Current Rate
```

## Traffic Accounting

در سمت ایران حجم و Rate ترافیک قابل نمایش است:

```text
Total In
Total Out
Current In Rate
Current Out Rate
```

## Logs و تحلیل Drop

```text
Live Connections
Live Log
Last 80 Lines
Errors Only
Event Summary
Why Is It Dropping
```

تحلیل Drop مواردی مثل Control Close، Token Error، MUX، Restart و Reconnect را بررسی می‌کند.

## Speed Test

سه حالت اصلی:

### Latency
Round Trip واقعی با TCP Probe از مسیر Tunnel.

### Passive Throughput
اندازه‌گیری ترافیک واقعی بدون ساخت بار آزمایشی.

### Active Throughput
با Speed Responder سمت KHAREJ، سقف تقریبی سرعت Tunnel اندازه‌گیری می‌شود.

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

Health Check می‌تواند Core، systemd، Listening Portها، Reachability، TLS و Reconnect Eventها را بررسی کند.

## Config Fingerprint

برای مقایسه دو سرور بدون نمایش Token اصلی:

```text
Port
Transport
Profile
Token Hash
Core Version
```

## TLS و Certificate

برای `wss` و `wssmux` مدیریت Certificate داخلی وجود دارد.

پشتیبانی از:

```text
Let's Encrypt / Certbot
acme.sh
x-ui style certificates
Custom paths
Self-signed certificate
Manual certificate
```

بررسی‌ها:

```text
Certificate exists
Private key exists
Certificate / Key match
Expiry date
Days remaining
```

## Scheduled Restart

```text
Off
1h
6h
12h
24h
```

## Core Manager

روش‌های نصب Core:

```text
Latest GitHub Release
Local files from /root/backhaul
Custom URL
```

معماری‌ها:

```text
amd64
arm64
arm
386
```

## Auto Update

Source رسمی:

```text
https://raw.githubusercontent.com/darktunnelmika/dark-backhaul/main/dark-backhaul.sh
```

قبل از Update، Marker پروژه و Syntax با `bash -n` بررسی می‌شود و نسخه قبلی Backup می‌شود.

## مسیر فایل‌ها

```text
/etc/dark-backhaul/
/etc/dark-backhaul/tunnels/
/etc/dark-backhaul/certs/
/usr/local/bin/backhaul
/usr/local/bin/darkbh
```

Systemd:

```text
/etc/systemd/system/backhaul@.service
/etc/systemd/system/backhaul-restart@.service
/etc/systemd/system/backhaul-restart@.timer
```

## راه‌اندازی پیشنهادی

### ایران

```text
1. darkbh
2. Core
3. New tunnel - IRAN
4. Tunnel Name
5. Tunnel Port
6. User Ports
7. Transport
8. Performance Profile
9. Scheduled Restart
10. Copy Pair Code
```

### خارج

```text
1. darkbh
2. Core
3. New tunnel - KHAREJ
4. Paste Pair Code
5. Create / Start Tunnel
6. Diagnostics
```

## Uninstall

برای حذف کامل باید عبارت زیر تأیید شود:

```text
UNINSTALL
```

## Upstream

Core پروژه از **Musixal/Backhaul** استفاده می‌کند.  
DARK VPN Backhaul Manager یک Manager مستقل برای ساده‌سازی و مدیریت Backhaul است.

## نسخه و پشتیبانی

```text
DARK VPN Backhaul Manager
Version: 1.9.0
Support: @mikakhadm
```

<p align="center">
  <b>🌐 زبان / Language</b><br>
  <a href="README.md">English</a> •
  <a href="README.fa.md"><b>فارسی</b></a>
</p>
