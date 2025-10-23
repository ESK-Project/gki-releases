# Generic ESK Kernel Release Repo

![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/ESK-Project/gki_kernel_builder/release.yml) [![Telegram](https://img.shields.io/badge/Telegram-2CA5E0?logo=telegram&logoColor=white)](https://t.me/xaga_kernel)

An custom android12-5.10 Generic Kernel Image

---

## Download

Get the latest **AnyKernel3 zip** from the release: [Github Release](https://github.com/ESK-Project/gki-releases/releases/latest)

---

## How to flash

### 1. Userspace (Recommended)

Flash directly from Android using any of these kernel flasher apps:
- **Franco Kernel Manager (FKM)**
- **Kernel Flasher**
- **Horizon Kernel Flasher**
- Or any other compatible tool

### 2. Recovery

1. Reboot your device into **recovery mode**.  
2. Flash the ZIP using **ADB sideload**:
  ```bash
  adb sideload <file.zip>
  ```

3. Example
  
  ```bash
  adb sideload ESK-5.10.245-SUKI.img
  ```

---

## Builds

All builds are automatically produced by:
[`ESK-Project/esk_builder@gki`](https://github.com/ESK-Project/esk_builder/tree/gki)

---

## Notes

* Kernel source is in the [`android12-5.10-lts`](https://github.com/ESK-Project/android12-5.10-lts) repo.
* When reporting issues, include device, ROM + Android version, build tag, and logs (dmesg/last\_kmsg).
