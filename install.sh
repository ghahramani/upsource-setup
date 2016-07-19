CACHE=$2

if [ "$CACHE" == "" ]; then
	echo "Installing Upsource Version $1"
	URL=https://download.jetbrains.com/upsource/upsource-$1.zip
	echo "Downloading $URL"
	wget "$URL"
	CACHE=upsource-$1.zip
fi

FILENAME="${CACHE%.*}"
echo "Unziping $CACHE"
unzip $CACHE &&
mv $FILENAME upsource &&
cd upsource &&
mkdir docker &&
cp -R ../docker/ ./ &&
cd docker &&
docker-compose up -d &&
docker-compose logs -f --tail=30