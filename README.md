# Bitwig Overlay
Bitwig is one of the few delivering commercial studio software for Linux. Software is available as .deb-files and updated quite regular. The purpose of this overlay is to simplify the installation and upgrade of Bitwig Studio and possibly accompanying software later on.

# Usage instuctions
## Dependencies

This is an overlay developed and tested on Funtoo Linux. It should probably work very well in Gentoo and Sabayon Linux as well, however I have no means to verify that. 
Overlays in general depends on layman and the assumption here relies on layman being installed. 


## Installation
A non officcial overlay (as this is) is not directly fetchable with layman. You have to manually register the overlay. 

Start by copying  `bitwig-overlay.xml` into `/etc/layman/overlays`

Run `layman-updater -R` to re-read the overlay-directory.

You will now also have to run `layman -L` to list all overlays or layman will not find syncthing-overlay. 

Finally add the overlay to portage: `layman -a bitwig-overlay`

As a security measure layman will ask for confirmation before this overlay is added. 

You can now install included applications as usual using emerge.

# Bug, comments and requests
Please post a tickethere on GitHub. 
