OSX initialization script
===

This script has been desinged to initialize OSX development environment.

### What it does
1. Install brew packages
  - You can specify packeages via config file
    + brew packeages: `scripts/packages.txt`
    + brew cask packages: `scripts/packages-cask.txt`
3. Set JAVA\_HOME
4. Install ruby and pivotal git script 

### QuickStart
2. Open `init.sh` and edit configuration
  - CONFIG\_FILE
  - RUBY\_VERSION
3. Invoke `$ sh init.sh`
  - NOTE: `homebrew` occasionally asks you to provide password during installation

