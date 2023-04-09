# cmd-dfd
A linux command wrapper based on ```df``` for displaying the difference in disk space before and after running the provided command.

## build from src
```shell
sudo apt install -y shc
```
```shell
shc -f cmd-df.sh -o cmd-df && sudo mv cmd-df /usr/local/bin/
```

## Quick Install
```shell
git clone https://github.com/jet-c-21/cmd-dfd.git && \
cd cmd-dfd && \
sudo apt install -y shc && \
shc -f cmd-df.sh -o cmd-df && sudo mv cmd-df /usr/local/bin/ && \
cd .. && \
rm -rf cmd-dfd
```

