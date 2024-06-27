# stackql-vhs

Generates a GIF file from a sequence of `stackql` shell commands using [charmbracelet/vhs](https://github.com/charmbracelet/vhs).  

![stackql-vhs](/images/stackql.gif)

## Prerequisites

Download providers required to the local `.stackql` directory:

```bash
curl -L https://bit.ly/stackql-zip -O && unzip stackql-zip
./stackql exec "registry pull google"
./stackql exec "registry pull aws"
./stackql exec "registry pull okta"
# ... add any other providers you want to use
```

## Usage

To run using Docker (recommended):

```bash
# modify tape with commands to run
# (providers will need to be pulled to a local .stackql directory first)
docker buildx build --no-cache -t stackql-vhs .
docker run --rm -v $PWD:/vhs stackql-vhs stackql.tape
# if you need to use creds in your tape routines, use env vars from the host as shown here
docker run \
-e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
-e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
--rm -v $PWD:/vhs stackql-vhs tapes/pystackql/pystackql.tape

docker run \
-e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
-e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
-e OKTA_API_TOKEN=$OKTA_API_TOKEN \
-e GOOGLE_CREDENTIALS="$GOOGLE_CREDENTIALS" \
--rm -v $PWD:/vhs stackql-vhs tapes/stackql/stackql.tape
```

To run directly:

```bash
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
sudo apt update && sudo apt install vhs ffmpeg
sudo apt-get update
sudo apt-get install -y build-essential cmake git libjson-c-dev libwebsockets-dev
git clone https://github.com/tsl0922/ttyd.git
cd ttyd && mkdir build && cd build
cmake ..
make && sudo make install
```

## To minimize image size

```bash
node imagemin/minimizeImages.js tapes/stackql/stackql.gif tapes/stackql/optimized
```

## Acknowledgements
[__charmbracelet/vhs__](https://github.com/charmbracelet/vhs)

 