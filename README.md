# cmd-dfd
A linux command wrapper based on ```df``` for displaying the difference in disk space before and after running the provided command.

## build from src

### amd64
```shell
sudo apt install -y shc
```
```shell
shc -f cmd-dfd.sh -o cmd-dfd && sudo mv cmd-dfd /usr/local/bin/
```

## Quick Install

### amd64
```shell
git clone https://github.com/jet-c-21/cmd-dfd.git && \
cd cmd-dfd && \
./amd64_install.sh
```

### arm64
```shell
git clone https://github.com/jet-c-21/cmd-dfd.git && \
cd cmd-dfd && \
./arm64_install.sh
```
