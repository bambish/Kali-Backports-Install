#!/bin/bash
# Def vars
KaliPreference="Package: *\nPin: release o=Kali\nPin-Priority: 90"
KaliSourceList="deb [trusted=yes] http://http.kali.org/kali kali-rolling main"
KaliSourceListSrc="deb-src [trusted=yes] http://http.kali.org/kali kali-rolling main"

function RequestUser () {
    read -r -p "Do you want include $1 packages to repository? [Y/n]" response
    response=${response,,} # tolower
    if [[ $response =~ ^(yes|y| ) ]] || [[ -z $response ]]; then
        echo true
    else
        echo false
    fi
}

# Include contrib
if $(RequestUser 'contrib'); then
    KaliSourceList+=' contrib'
    KaliSourceListSrc+=' contrib'
fi

# Include non-free
if $(RequestUser 'non-free'); then
    KaliSourceList+=' non-free'
    KaliSourceListSrc+=' non-free'
fi

echo -e $KaliSourceList >> /etc/apt/sources.list.d/kali.list

# Include sources
if $(RequestUser 'sources'); then
    echo -e $KaliSourceListSrc >> /etc/apt/sources.list.d/kali.list
fi

echo -e $KaliPreference >> /etc/apt/preferences.d/90-kali

# Add repo Kali key
apt update
apt install kali-archive-keyring
