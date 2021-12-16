#!/bin/sh
pkg=$1

xbps-rindex -a ./${pkg}
xbps-rindex --privkey ~/keys/privkey.pem --signedby 'Toasterbirb <git@toasterbirb.com>' --sign-pkg "${pkg}"
xbps-rindex --sign --signedby 'Toasterbirb <git@toasterbirb.com>' --privkey ~/keys/privkey.pem ./
