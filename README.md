# ESK Kernel Release Repo

![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/ESK-Project/gki_kernel_builder/release.yml) [![Telegram](https://img.shields.io/badge/Telegram-2CA5E0?logo=telegram&logoColor=white)](https://t.me/xaga_kernel)

Custom kernel for **xaga(in)** / **xagapro(in)**. Supports **AOSP** and **HyperOS**.

---

## Download

Get the latest **Boot Image** / **AnyKernel3 zip** from the release: [Github Release](https://github.com/ESK-Project/esk-releases/releases/latest)

---

## How to flash

1. Userspace (recommeneded)
- Flash with your favorite kernel flasher (FKM, Kernel Flasher, Horizon, …).

2. Recovery
- Reboot to recovery
- Adb sideload the zip

---

## Builds

All builds are produced by the kernel builder:
[`ESK-Project/gki_kernel_builder`](https://github.com/ESK-Project/gki_kernel_builder)

---

## Notes

* Kernel source is in the [`android_kernel_xiaomi_mt6895`](https://github.com/ESK-Project/android_kernel_xiaomi_mt6895) repo.
* When reporting issues, include device, ROM + Android version, build tag, and logs (dmesg/last\_kmsg).
