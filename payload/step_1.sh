echo " * 2 ------------- > INSTALL S -- N -- M "

DEBIAN_FRONTEND=noninteractive apt-get -f install  -y \
        apt-utils \
        jq \
        nano \
        psmisc \
        sudo \
        cron python3-pil  \
        software-properties-common python3 python3-dev python3-numpy \
        openvpn autocutsel  python3-pip python3-tk python3-dev  pwgen  \
        wget openssh-server locate nano gedit screen  net-tools curl git tor \
        xfce4-goodies xfce4\
        thunar tumbler xarchiver \
        mugshot thunar-archive-plugin \
        dbus-x11 xauth xinit x11-xserver-utils xdg-utils \
        tightvncserver novnc python3-websockify python3-pyvirtualdisplay \
        build-essential pwgen supervisor \
        xvfb xserver-xephyr ttf-wqy-zenhei python2.7 < /dev/null > /dev/null


pip3 install selenium==4.0.0.a1 pymysql pyvirtualdisplay faker-e164 Faker PySocks stem  bs4   ConfigParser lxml  speechrecognition requests \
 pyvirtualdisplay pydub pyautogui emojis emoji  \
 mysql-connector-python device_detector selenium-stealth undetected_chromedriver

apt install --assume-yes xfce4 desktop-base xfce4-terminal xscreensaver  < /dev/null > /dev/null
apt --assume-yes autoclean
apt-get --assume-yes autoclean
echo " * 2 ++++++++++++++++++++++++ > DONE !!! S -- N -- M "
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
