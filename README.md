# n0kovo.github.io/installhashcat/
A quick bash script to build and install the latest dev version of hashcat on Debian based distros and optionally download a [collection of hashcat rules](https://github.com/n0kovo/hashcat-rules-collection) and wordlists, hosted as a GitHub Page for easy access. Made for myself to use on EC2 boxes and to learn some bash.

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
3) Clones the [hashcat repo](https://github.com/hashcat/hashcat) to `./installhashcat/`
4) Runs `make` and `make install`
5) If chosen when prompted:
    1) Clones [hashcat-rules-collection](https://github.com/n0kovo/hashcat-rules-collection)
    2) Checks hashmob.net API for list of latest wordlists
    3) Asks user to select max 5 wordlists
    4) Installs `aria2` if not already installed
    5) Installs `p7zip-full` if not already installed
    6) Installs `jq` if not already installed
    7) Downloads wordlists using `aria2c`
    8) Extracts wordlist archives using `7z`
    9) Deletes wordlist archives


