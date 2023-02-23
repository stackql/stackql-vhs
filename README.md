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

```bash
# modify stackql.tape with commands to run
# (providers will need to be pulled to a local .stackql directory first)
docker build --no-cache -t stackql-vhs .
# or
docker build -t stackql-vhs .
docker run --rm -v $PWD:/vhs stackql-vhs stackql.tape
# if you need to use creds in your tape routines, use env vars from the host as shown here
docker run -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY --rm -v $PWD:/vhs stackql-vhs pystackql.tape
```
## Acknowledgements
[__charmbracelet/vhs__](https://github.com/charmbracelet/vhs)