%w{
  usbutils
  pulseaudio
  bluez
  bluez-tools
  libbluetooth-dev
  python-gobject
  python-gobject-2
  qdbus
  pulseaudio-module-bluetooth
  alsa-utils
}.each do |pkg|
  package pkg do
    action :install
  end
end

directory "/apps" do
  owner "root"
  group "root"
  mode 0777
  action :create
end

user "streamy" do
  home "/apps/streamy"
  supports manage_home: true
  action :create
end

%w{lp pulse audio}.each do |g|
  group g do
    action :modify
    members "streamy"
    append true
  end
end

group "pulse" do
  action :modify
  members "streamy"
  append true
end

cookbook_file "/etc/bluetooth/main.conf" do
  source "bluetooth/main.conf"
  mode 0644
  owner "root"
  group "root"
  action :create
end

cookbook_file "/etc/bluetooth/audio.conf" do
  source "bluetooth/audio.conf"
  mode 0644
  owner "root"
  group "root"
  action :create
end

cookbook_file "/etc/pulse/daemon.conf" do
  source "pulse/daemon.conf"
  mode 0644
  owner "root"
  group "root"
  action :create
end
