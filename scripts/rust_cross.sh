rustup target add arm-unknown-linux-gnueabihf
git clone https://github.com/raspberrypi/tools/ $HOME/rust-cross
echo "[target.arm-unknown-linux-gnueabihf]" >> $HOME/.cargo/config
echo "linker = \"$HOME/rust-cross/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc\"" >> $HOME/.cargo/config
