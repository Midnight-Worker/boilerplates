# pip install esptool

curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh

arduino-cli config init
arduino-cli core update-index

arduino-cli core update-index
arduino-cli core install esp32:esp32

arduino-cli board list
#arduino-cli compile --fqbn esp32:esp32:esp32 my_sketch
#arduino-cli upload -p /dev/ttyUSB0 --fqbn esp32:esp32:esp32 my_sketch