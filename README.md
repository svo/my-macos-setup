# My OSX Setup

## Building

### Including Bootstrapping

```
./build.sh
```

Above sets up `brew`, `python`, `pip` and `ansible` before running the `playbook.yml`.

### Ansible Only

```
ansible-playbook -i "localhost," -c local -K playbook.yml
```
