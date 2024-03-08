# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/usr/share/pico_sdk/tools/elf2uf2"
  "/workspaces/project1/out/build/linux-default/elf2uf2"
  "/workspaces/project1/out/build/linux-default/elf2uf2"
  "/workspaces/project1/out/build/linux-default/elf2uf2/tmp"
  "/workspaces/project1/out/build/linux-default/elf2uf2/src/ELF2UF2Build-stamp"
  "/workspaces/project1/out/build/linux-default/elf2uf2/src"
  "/workspaces/project1/out/build/linux-default/elf2uf2/src/ELF2UF2Build-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/workspaces/project1/out/build/linux-default/elf2uf2/src/ELF2UF2Build-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/workspaces/project1/out/build/linux-default/elf2uf2/src/ELF2UF2Build-stamp${cfgdir}") # cfgdir has leading slash
endif()
