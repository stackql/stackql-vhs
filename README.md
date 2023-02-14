# stackql-vhs

Generates a GIF file from a sequence of `stackql` shell commands using [charmbracelet/vhs](https://github.com/charmbracelet/vhs).  

![stackql-vhs](images/stackql.gif)

## Usage

```bash
# modify stackql.tape with commands to run
# (providers will need to be pulled to a local .stackql directory first)
docker build --no-cache -t stackql-vhs .
docker run --rm -v $PWD:/vhs stackql-vhs stackql.tape
```

## Acknowledgements
[__charmbracelet/vhs__](https://github.com/charmbracelet/vhs)
