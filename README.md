CoderDojoWifi turns a Raspberry PI (+Edimax Wi-Fi) into a free wifi hotspot to distribute:

* material about the CoderDojo session
* installer packages (ie. Scratch)
* other info

The contents are sync'ed from a Google Drive folder with:

$ gsync --progress -u -d -r -vi drive://coderdojoSource /home/pi

They become available at this URL:

http://10.10.0.1

_Note: this is a very early stage project. Any contribution is very appreciated!_

Based on the following posts:

* http://www.daveconroy.com/turn-your-raspberry-pi-into-a-wifi-hotspot-with-edimax-nano-usb-ew-7811un-rtl8188cus-chipset/
* http://www.ducky-pond.com/posts/2013/Sep/setup-a-web-server-on-rpi/
