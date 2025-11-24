# My macOS Setup

[![Continuous integration](https://github.com/svo/my-macos-setup/actions/workflows/main.yml/badge.svg?branch=main)](https://github.com/svo/my-macos-setup/actions/workflows/main.yml)

An Ansible-based automation framework for configuring a complete macOS development environment with programming languages, tools, and applications. For more context, see the accompanying blog post at [qual.is/posts/my-macos-setup](https://www.qual.is/posts/my-macos-setup).

## Architecture

This project uses Ansible to automate macOS setup through a role-based architecture:

### Project Structure

```
my-macos-setup/
├── playbook.yml          # Main Ansible playbook
├── roles/                # Role-based configuration modules
│   ├── brew/             # Homebrew package manager
│   ├── git/              # Git version control
│   ├── vim/              # Vim text editor
│   ├── terminal/         # Shell and terminal utilities
│   ├── docker/           # Docker and Colima
│   ├── java/             # Java ecosystem (JDK, Gradle, Maven)
│   ├── node/             # Node.js and npm
│   ├── ruby/             # Ruby and rbenv
│   ├── golang/           # Go language
│   ├── kotlin/           # Kotlin language
│   ├── clojure/          # Clojure language
│   ├── python/           # Python and pyenv
│   ├── iac/              # Infrastructure as Code tools
│   ├── development/      # Development tools (databases, APIs)
│   ├── productivity/     # Productivity applications
│   ├── security/         # Security tools
│   ├── ai/               # AI and ML tools
│   ├── media/            # Media applications
│   ├── design/           # Design tools
│   ├── internet/         # Web browsers and communication
│   ├── ios/              # iOS development tools
│   ├── system/           # System utilities
│   └── keyboard/         # Keyboard customization
├── bin/                  # Utility scripts
├── prepare.sh            # Bootstrap script
└── build.sh              # Ansible execution script
```

## Building

### Including Bootstrapping

```bash
./prepare.sh && ./build.sh
```

Above sets up `brew`, `python`, `pipx` and `ansible` before running the `playbook.yml`.

### Ansible Only

```bash
./build.sh
```

### Upgrading Packages

```bash
./upgrade.sh
```

### Additional Steps

* if you encounter "Ignore insecure directories and continue [y] or abort compinit [n]?" in your terminal try: `compaudit | xargs chmod g-w`

## Contributing

### Conventions

#### Task Naming Convention

All Ansible task names must follow this pattern:
```
- name: <action> <package> <description>
```

Examples:
- `Install jq command-line JSON processor`
- `Configure rbenv shell integration`

**Pattern**: Action verb + package/component + descriptive purpose/type

#### Module Usage

- Use appropriate Ansible modules (prefer `community.general.homebrew` over shell commands)

#### Shell Integration

When adding shell integrations:
- Use `ansible.builtin.blockinfile` for configuration
- Add to `~/.zshrc` for shell-specific settings
- Add to `~/.zprofile` for environment variables
- Use descriptive markers: `# {mark} ANSIBLE MANAGED BLOCK FOR <TOOL>`
