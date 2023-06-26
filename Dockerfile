FROM ubuntu:latest

LABEL com.github.actions.name="rocm-setup"
LABEL com.github.actions.description="Setup AMD ROCm™ Platform for GPUs"
LABEL com.github.actions.icon="box"
LABEL com.github.actions.color="red"

LABEL repository="https://github.com/neoblizz/rocm-setup"
LABEL maintainer="Muhammad Awad <mawad@duck.com>"

# Install dependencies
RUN apt-get update && apt-get -y install wget build-essential git

# Install ROCm
RUN wget https://repo.radeon.com/amdgpu-install/5.4/ubuntu/jammy/amdgpu-install_5.4.50400-1_all.deb
RUN apt-get -y install ./amdgpu-install_5.4.50400-1_all.deb
RUN DEBIAN_FRONTEND=noninteractive  amdgpu-install --accept-eula -y --usecase=rocm,hiplibsdk --no-dkms

# Set environment variables
ENV PATH="$PATH:/opt/rocm/bin:/opt/rocm/rocprofiler/bin:/opt/rocm/hip/bin"
ENV LD_LIBRARY_PATH="/opt/rocm/lib:/opt/rocm/llvm/lib:/opt/rocm/hip/lib"

# Install CMake
ARG CMAKE_VERSION=3.25.1
RUN wget https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-linux-x86_64.sh &&\
    chmod +x cmake-${CMAKE_VERSION}-linux-x86_64.sh &&\
    mkdir /opt/cmake && \
    ./cmake-${CMAKE_VERSION}-linux-x86_64.sh  --skip-license --prefix=/opt/cmake  &&\
    ln -s /opt/cmake/bin/* /usr/local/bin/

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
