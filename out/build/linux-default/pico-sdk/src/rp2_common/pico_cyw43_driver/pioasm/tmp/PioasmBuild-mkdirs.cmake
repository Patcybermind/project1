# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/usr/share/pico_sdk/tools/pioasm"
  "/workspaces/project1/out/build/linux-default/pioasm"
  "/workspaces/project1/out/build/linux-default/pico-sdk/src/rp2_common/pico_cyw43_driver/pioasm"
  "/workspaces/project1/out/build/linux-default/pico-sdk/src/rp2_common/pico_cyw43_driver/pioasm/tmp"
  "/workspaces/project1/out/build/linux-default/pico-sdk/src/rp2_common/pico_cyw43_driver/pioasm/src/PioasmBuild-stamp"
  "/workspaces/project1/out/build/linux-default/pico-sdk/src/rp2_common/pico_cyw43_driver/pioasm/src"
  "/workspaces/project1/out/build/linux-default/pico-sdk/src/rp2_common/pico_cyw43_driver/pioasm/src/PioasmBuild-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/workspaces/project1/out/build/linux-default/pico-sdk/src/rp2_common/pico_cyw43_driver/pioasm/src/PioasmBuild-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/workspaces/project1/out/build/linux-default/pico-sdk/src/rp2_common/pico_cyw43_driver/pioasm/src/PioasmBuild-stamp${cfgdir}") # cfgdir has leading slash
endif()
