#!/bin/sh
htmlPath=./docs/index.html

_addPkg()
{
	xbps-rindex -a ./${pkg}
	xbps-rindex --privkey ~/keys/privkey.pem --signedby 'Toasterbirb <git@toasterbirb.com>' --sign-pkg "${pkg}"
	xbps-rindex --sign --signedby 'Toasterbirb <git@toasterbirb.com>' --privkey ~/keys/privkey.pem ./
}

_updatePackageList()
{
	rm -f $htmlPath
	echo "<link rel = 'stylesheet' type='text/css' href='./style.css'><h1>Package list</h1><ul>" >> $htmlPath
	echo $packages >> $htmlPath
	echo "</ul>" >> $htmlPath
}

pkg=$1
[ -n "$pkg" ] && _addPkg

# Update the pacakge list website
packages="$(ls *.xbps | sed 's/\.x86_64\.xbps//g; s/^/<li>/g; s/$/<\/li>/g')"
_updatePackageList
