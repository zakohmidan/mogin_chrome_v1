cd /dockerstartup/
echo " * 2 ++++++++++++++++++++++++ > DONE !!! S2 -- N -- M "
cd /dockerstartup/
echo " * 3 ------------- > INSTALL google-chrome " $US_PS

mkdir -p /root/EXTRAT/

#######################################################################################
DEBIAN_FRONTEND=noninteractive apt-get install -y --fix-missing  supervisor
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
apt update &&  apt install google-chrome-stable ffmpeg -y


wget https://chromedriver.storage.googleapis.com/109.0.5414.74/chromedriver_linux64.zip && unzip chromedriver_linux64.zip && chmod +x chromedriver && cp chromedriver /usr/bin/ && cp chromedriver /usr/bin/chromedriver-109

# https://chromedriver.storage.googleapis.com/109.0.5414.74/chromedriver_linux64.zip
sed -i 's/"$HERE\/chrome"/"$HERE\/chrome" --disable-gpu --disable-software-rasterizer --disable-dev-shm-usage --no-sandbox/g' /opt/google/chrome/google-chrome



############## firefox-60.0

wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#wget -q https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
wget -q https://github.com/thingst0d0/g00rm/raw/main/ocs-url_3.1.0-0ubuntu1_amd64.deb
#########################################################################################

echo " * 3 ------------- > INSTALL GH0STAV0-v0.32.0 "

##wget -q https://github.com/mozilla/GH0STAV0/releases/download/v0.26.0/geckodriver-v0.26.0-linux64.tar.gz && tar -xf geckodriver-v0.26.0-linux64.tar.gz
##chmod +x geckodriver
#mv geckodriver /usr/bin/geckodriver-26
git clone https://github.com/GH0STAV0/SDA_ALL.git /root/SDA_ALL




#bash -c 'echo \"exec /etc/X11/Xsession /usr/bin/xfce4-session\" > /etc/chrome-remote-desktop-session'

echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session


echo "$US_PS"
username="azer"
password="azer"




#####
useradd -m $username
adduser $username sudo
echo $username':'$password | sudo chpasswd
sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd
mkdir -p /home/azer/.config
chown azer:azer /home/azer/.config
apt install --assume-yes xfce4 desktop-base xfce4-terminal nano
apt remove --assume-yes gnome-terminal
apt --assume-yes autoremove
apt install --assume-yes ./chrome-remote-desktop_current_amd64.deb
apt install --assume-yes ./google-chrome-stable_current_amd64.deb
#ocs-url_3.1.0-0ubuntu1_amd64.deb
#apt install --assume-yes ./
#adduser azer chrome-remote-desktop
#DISPLAY= /opt/google/chrome-remote-desktop/start-host --code="4/0AWgavderlsPEPkuGg1tVHX7LWh9qB_d9gaOKvHil56EE-4QJ1_SoJBToV5Khe01x2eQECQ" --redirect-url="https://remotedesktop.google.com/_/oauthredirect" --name=$(hostname) --pin=001122
wget -O ~/wall.jpg https://w.wallhaven.cc/full/9m/wallhaven-9m7l2k.jpg
xfconf-query --create xfce4-desktop -p /backdrop/screen0/monitor0/workspace0/last-image -s ~/wall.jpg

xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/workspace0/last-image -s ~/wall.jpg
export $(dbus-launch)


#rm *.tar.bz2 *.tar.gz



