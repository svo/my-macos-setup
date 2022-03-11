# My OSX Setup

## Testing

If no Virtual Machine already in place:

```
vagrant up
```

If Virtual Machine already created:

```
vagrant provision
```

## Building

### Including Bootstrapping

```
./prepare.sh && ./build.sh
```

Above sets up `brew`, `python`, `pip` and `ansible` before running the `playbook.yml`.

### Ansible Only

```
./build.sh
```
