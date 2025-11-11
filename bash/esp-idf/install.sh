sudo apt update
sudo apt install git wget flex bison gperf python3 python3-venv python3-pip cmake ninja-build ccache libffi-dev libssl-dev dfu-util

git clone -b v5.3 https://github.com/espressif/esp-idf.git
cd esp-idf
./install.sh esp32


. ./export.sh


idf.py --version


idf.py create-project hello_world
cd hello_world
idf.py set-target esp32
idf.py build
idf.py flash
idf.py monitor
