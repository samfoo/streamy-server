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
  libshadow-ruby1.8
}.each do |pkg|
  package pkg do
    action :install
  end
end

user "streamy" do
  action :create
end

group "lp" do
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

execute "generate locales" do
  command "locale-gen"
  action :run
end
