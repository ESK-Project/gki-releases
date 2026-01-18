#!/data/data/com.termux/files/usr/bin/bash
#
# Standalone script to check boot image format
# Adapted from bintang, with modifications.
#

err() {
    echo "[ERROR] $*" >&2
    [ -n "${temp:-}" ] && rm -rf "$temp"
    exit 1
}

check_cmd() {
    command -v "$1" &>/dev/null
}

install_magiskboot() {
    local magiskboot_url dest
    magiskboot_url="https://raw.githubusercontent.com/ESK-Project/gki-releases/refs/heads/main/scripts/magiskboot"
    dest="$PREFIX/bin/magiskboot"

    curl -fsSL "$magiskboot_url" -o "$dest"
    chmod 755 "$dest"
}

# Check environment
if [ -z "${PREFIX:-}" ]; then
    err "\$PREFIX is not set. Are you running this in Termux?"
fi

# Check boot image/magiskboot existence
if ! check_cmd "magiskboot"; then
    check_cmd "curl" || pkg install curl -y
    install_magiskboot
fi

boot_path=$(realpath "$1")
if [ -z "${boot_path:-}" ]; then
    err "boot.img required."
elif [ ! -f "$boot_path" ]; then
    err "File '$boot_path' doesn't exist."
fi

# Setup environment
rm -rf "$PREFIX/tmp"/* 2>/dev/null
temp=$(mktemp -d)
pushd "$temp" >/dev/null || err "pushd failed"

# Get boot format
dst="$temp/$(basename "$boot_path")"
cp "$boot_path" "$dst"
boot_path="$dst"

output=$(magiskboot unpack "$boot_path" 2>&1)
rc=$?

if [ "$rc" -ne 0 ]; then
    err "Failed to unpack boot image"
fi

kernel_fmt=$(echo "$output" | grep 'KERNEL_FMT' | awk '{print $2}' | cut -f2 -d '[' | cut -f1 -d ']')

echo "Your kernel format is $kernel_fmt"

popd >/dev/null || err "popd failed"
rm -rf "$temp"
exit 0
