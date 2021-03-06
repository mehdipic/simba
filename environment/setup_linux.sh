#
# Setup script for Linux. Must be sourced from the simba root folder.
#

# Add the simba bin folder to the path
export PATH=$PATH:$(readlink -f bin)

# ESP8266 toolchain
export PATH=$PATH:$(readlink -f ../esp-open-sdk/xtensa-lx106-elf/bin)

# ESP32 toolchain
export PATH=$PATH:$(readlink -f ../xtensa-esp32-elf/bin)

# RUST bindgen
export PATH=$PATH:$(readlink -f ../rust-bindgen/target/debug)

# st-link (STM32)
export PATH=$PATH:$(readlink -f ../stlink)

# dfu-util (Photon)
export PATH=$PATH:$(readlink -f ../dfu-util/src)

# nrfjprog (nRF5)
export PATH=$PATH:$(readlink -f ../nrf/nrfjprog)

# The root of the simba repository.
export SIMBA_ROOT=$(readlink -f .)

export PYLINTRC=$(readlink -f environment/pylintrc)

# Arduino release repository.
export SIMBA_ARDUINO_ROOT=$(readlink -f ../simba-arduino)

# Arduino IDE folder.
export ARDUINO_ROOT=$(readlink -f ../../arduino-1.6.10)

# Source the user defined setup.
if [ -f ~/.simbarc ]; then
    source ~/.simbarc
fi

# ESP IDF path.
export IDF_PATH=${SIMBA_ROOT}/3pp/esp32/esp-idf

# Xvisor root.
export XVISOR_ROOT=${SIMBA_ROOT}/3pp/xvisor

# ARM toolchains.
export PATH=$PATH:$(readlink -f ../gcc-linaro-7.2.1-2017.11-x86_64_aarch64-elf/bin)
export PATH=$PATH:$(readlink -f ../gcc-linaro-7.2.1-2017.11-x86_64_aarch64-linux-gnu/bin)

# PowerPC toolchain.
export FREESCALE_POWERPC_EABIVLE_ROOT=$(readlink -f ../../Freescale/S32_Power_v1.1/Cross_Tools/powerpc-eabivle-4_9)
export PATH=${PATH}:${FREESCALE_POWERPC_EABIVLE_ROOT}/bin
