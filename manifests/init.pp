class hostapd (
  $ssid,
  $interface = 'wlan0',
  $wpa       = {
    passphrase => "supersecret",
    key_mgmt   => "WPA-PSK",
    pairwise   => 'CCMP TKIP',
  }
){

  file { "/etc/hostapd.conf":
    owner   => 'root',
    group   => '0',
    mode    => '0600',
    content => template("hostapd/hostapd.conf.erb"),
    notify  => Service["hostapd"],
  }

  service { "hostapd":
    ensure  => running,
    enable  => true,
    require => File["/etc/hostapd.conf"],
  }

}
