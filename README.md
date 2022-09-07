# n0kovo.github.io/installhashcat/
A quick bash script to build and install the latest dev version of hashcat on Debian based distros, hosted as a GitHub Page for easy access. Made for myself to use on EC2 boxes.

#### Requirements:
- `apt`
- `bash`
- `sudo`

#### Usage:
1) Read the script ([index.html](https://github.com/n0kovo/installhashcat/blob/main/index.html)).<br>
Don't pipe stuff to bash without reading it first!

2) `curl https://n0kovo.github.io/installhashcat/ | sudo bash`
3) Profit

#### What does it do?
1) Installs `git` if not already installed
2) Installs `build-essential` if not already installed
3) Clones the [hashcat repo](https://github.com/hashcat/hashcat) to `/tmp/hashcat_install/`
4) Runs `make` and `make install`
5) Deletes the temporary folder
