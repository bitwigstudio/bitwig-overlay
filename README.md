# Bitwig Overlay
Bitwig is one of the few delivering commercial studio software for Linux. Software is available as .deb files and updated quite
regulary. The purpose of this overlay is to simplify the installation and upgrade of Bitwig Studio and possibly accompanying
software later on.


# Usage instuctions
## Dependencies

This is an overlay developed and tested on Funtoo/Gentoo Linux. It should probably work very well in Sabayon Linux as
well, however we have no means to verify that.


## Installation
### General
```bash
# make sure the repo directory exists
mkdir /etc/portage/repos.conf

# install our repo
cat << 'EOF' > /etc/portage/repos.conf/bitwig-overlay.conf
[bitwig-overlay]
location = /usr/local/portage/bitwig-overlay
sync-type = git
sync-uri = https://github.com/bitwigstudio/bitwig-overlay.git
EOF

# sync
emaint -r bitwig-overlay sync

# install
emerge -a bitwig-studio
```

For more information on the subject, please, check: https://wiki.gentoo.org/wiki//etc/portage/repos.conf

# java
We have removed the bundled jre binary so we can setup and use a system-wide version. Please, read: https://wiki.gentoo.org/wiki/Java in order to be able to setup `oracle-jre-bin`.

# Bug, comments and requests
Please post a ticket here on GitHub.
