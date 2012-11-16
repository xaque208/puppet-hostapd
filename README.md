# Puppet-hostapd

Hostap is the wireless control daemon for FreeBSD and OpenBSD.  This module
stands up a Puppet powered wireless network for those geeks who like to run
their wireless networks just so.

# Implementation

    # ----------
    # Wireless AP
    # ----------
    class { "hostapd":
      ssid         => "soap",
      interface    => 'wlan0',
      wpa          => {
        passphrase => 'p4perstree+',
        key_mgmt   => 'WPA-PSK',
        pairwise   => 'CCMP TKIP',
      }
    }

