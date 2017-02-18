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
```

### Beta
If you're one of the lucky individuals that have been chosen to beta test it, here's how to install those versions:

```bash
# Go to your Bitwig online account and get the .deb file for the beta version via your browser

# move the file to where portage stores the distfiles
mv ~/Downloads//usr/portage/distfiles/bitwig-studio-2.0beta.deb /usr/portage/distfiles/

# fix permissions
chown portage:portage /usr/portage/distfiles/bitwig-studio-2.0beta.deb

# proceed with installation
emerge -a =bitwig-studio-2.0beta
```

For more information on the subject, please, check: https://wiki.gentoo.org/wiki//etc/portage/repos.conf


# Bug, comments and requests
Please post a ticket here on GitHub.
