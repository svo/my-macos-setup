# My macOS Setup

[![Continuous integration](https://github.com/svo/my-macos-setup/actions/workflows/main.yml/badge.svg?branch=main)](https://github.com/svo/my-macos-setup/actions/workflows/main.yml)

## Building

### Including Bootstrapping

```
./prepare.sh && ./build.sh
```

Above sets up `brew`, `python`, `pipx` and `ansible` before running the `playbook.yml`.

### Ansible Only

```
./build.sh
```

### Additional Steps

* if you encounter "Ignore insecure directories and continue [y] or abort compinit [n]?" in your terminal try: `compaudit | xargs chmod g-w`
