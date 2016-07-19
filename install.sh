wget -o https://download.jetbrains.com/upsource/upsource-$1.zip
unzip upsource-$1.zip -d upsource
cd upsource
mkdir docker
cp -R ../docker ./docker
