CACHE=$2

if [ "$CACHE" == "" ]; then
	echo "Installing Upsource Version $1"
	URL=https://download.jetbrains.com/upsource/upsource-$1.zip
	echo "Downloading $URL"
	wget "$URL"
	CACHE=upsource-$1.zip
fi

FILENAME=$(basename "$CACHE")
FILENAME="${FILENAME%.*}"
echo "Unziping $FILENAME from $CACHE"
unzip $CACHE -d ./ &&
mv $FILENAME upsource &&
cd upsource &&
mkdir docker &&
cp -R ../docker/ ./ &&
cd docker &&
docker-compose up -d &&
docker-compose logs -f --tail=30