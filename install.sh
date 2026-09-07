#!/usr/bin/env bash
set -euo pipefail

REPO="darktunnelmika/dark-backhaul"
BRANCH="main"
RAW="https://raw.githubusercontent.com/${REPO}/${BRANCH}"
DEST="/usr/local/bin/darkbh"
BASE_DIR="/etc/dark-backhaul"

if [ "$(id -u)" -ne 0 ]; then
  echo "[-] Run as root."
  exit 1
fi

command -v curl >/dev/null 2>&1 || {
  echo "[-] curl is required."
  exit 1
}

echo "[+] Installing DARK VPN Backhaul Manager..."
curl -fsSL --retry 3 --max-time 60 "${RAW}/dark-backhaul.sh" -o "${DEST}"
chmod 0755 "${DEST}"
mkdir -p "${BASE_DIR}"
printf '%s\n' "${RAW}/dark-backhaul.sh" > "${BASE_DIR}/update.url"
chmod 700 "${BASE_DIR}"

echo "[+] Installed: ${DEST}"
echo "[+] Update source configured."
echo "[+] Starting darkbh..."
exec "${DEST}"
