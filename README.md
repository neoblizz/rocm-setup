# ROCm™ Setup

> ⚡ Not officially supported by AMD.

This action installs AMD's ROCm™ platform within a GitHub workflow. Only `ubuntu-20.04` or `ubuntu-22.04` runners are supported.

## Quick Start
```yml
steps:
- name: rocm-setup
  uses: neoblizz/rocm-setup@v0.1.0-beta
  with:
    rocm: '5.5.0'
```

## Inputs (work-in-progress)
`rocm`
Define a ROCm™ version, default is set to the latest.

`method`
Installation method, can be either 'amdgpu' or 'package-manager'. 'amdgpu' installs the ROCm packages using amdgpu-install script and the 'package-manager' method uses 'apt-get' like familiar packages.

`use-github-cache`
Use GitHub cache to cache downloaded installer on GitHub servers.
