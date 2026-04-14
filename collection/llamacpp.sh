echo "This installation will install llamacpp with TurboQuant"
sleep 3
apt update -y
apt install -y cmake build-essential git libandroid-spawn
git clone https://github.com/animehacker/llama-turboquant.git
cd llama-turboquant
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j$(nproc)

for f in bin/*; do
  [ -x "$f" ] && ln -sf "$PWD/$f" "$PREFIX/bin/"
done

cd

rm llamacpp.sh
echo "Installation finished."
