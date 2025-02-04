#!/bin/bash

# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run as root!"
  exit 1
fi

echo "Updating system repositories..."
yum update -y

# Install Development Tools (C++ compiler, make, etc.)
echo "Installing Development Tools..."
yum groupinstall "Development Tools" -y

# Install GCC and G++ compilers
echo "Installing GCC and G++ compilers..."
yum install gcc gcc-c++ -y

# Install additional essential C++ libraries
echo "Installing additional essential C++ libraries..."
yum install libstdc++-devel libtool automake autoconf make cmake -y

# Install Debugger (GDB)
echo "Installing GDB (GNU Debugger)..."
yum install gdb -y

# Install CMake (if you're using it for C++ projects)
echo "Installing CMake..."
yum install cmake -y

# Install additional libraries required for C++ projects
echo "Installing other required C++ libraries..."
yum install boost-devel boost-static boost-doc boost-test boost-program-options boost-thread boost-filesystem -y
yum install sqlite-devel -y
yum install openssl-devel -y
yum install zlib-devel -y
yum install ncurses-devel -y
yum install libcurl-devel -y
yum install wxGTK3-devel -y

# Install libraries for multithreading (if required)
echo "Installing libraries for threading support..."
yum install pthread-devel -y

# Install libraries for JSON manipulation (if you use JSON in your projects)
echo "Installing JSON libraries..."
yum install jsoncpp-devel -y

# Install libraries for networking (if needed)
echo "Installing networking libraries..."
yum install libevent-devel -y
yum install libpcap-devel -y

# Install unit testing libraries (Google Test, Catch2, etc.)
echo "Installing unit testing libraries..."
yum install gtest-devel -y
yum install catch-devel -y

# Install some advanced libraries like Qt (GUI development)
echo "Installing Qt libraries (for GUI development)..."
yum install qt5-qtbase-devel qt5-qtdeclarative-devel qt5-qtx11extras-devel qt5-qttools-devel -y

# Install other important utilities for C++ developers
echo "Installing additional utilities..."
yum install vim git git-core git-all -y

# Install Boost libraries
echo "Installing Boost libraries..."
yum install boost-devel boost-program-options boost-system boost-filesystem boost-thread boost-chrono boost-date-time boost-regex boost-test -y

# Install tools for building and packaging
echo "Installing tools for packaging..."
yum install rpm-build rpmdevtools -y

# Verify installation of tools
echo "Verifying installation of tools and libraries..."
gcc --version
g++ --version
make --version
cmake --version
gdb --version
git --version

echo "All necessary C++ development tools and libraries have been installed successfully!"
