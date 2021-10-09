# import.sh

A shell scripting utility that simplifies the process of importing other shell script modules. It allows you to organize your shell scripts into modular libraries and reuse them as needed.

## Features

1. Import local shell modules with ease.
2. Fetch and import shell modules from a URL.
3. Resolve dependencies in a clean and straightforward manner.

## Installation

To install `import.sh`, simply make it executable and move it to a directory in your PATH:

    git clone git@github.com:song940/import.sh.git /usr/local/import.sh
    ln -sf ../import.sh/import.sh /usr/local/bin

## Usage

To use `import.sh`, start your script with the shebang:

    #!/usr/bin/env import.sh

Then, you can use the `import` function to include other shell modules:

    import "string"
    import "http"

Modules are expected to be in the `/usr/local/import.sh/lib` directory by default, but you can change this by modifying the `IMPORT_MODULE_PATH` variable in `import.sh`.

To fetch and use modules from a URL, provide the full URL to the `import` function:

    import "https://example.com/path/to/module.sh"

## Example

Here's a simple script that uses `import.sh`:

    #!/usr/bin/env import.sh

    import "os"
    import "string"
    import "http"

    if string_starts_with "abc" "b"; then
      http_get "https://google.com"
    fi

This script imports the `string` and `http` modules, and then uses a function (`string_starts_with`) from the `string` module.

## Contributing

If you have improvements or bug fixes:

1. Fork the repository on GitHub.
2. Make your changes in a branch.
3. Submit a pull request.

## License

This script is released under the MIT License. Please see the included LICENSE file for more details.
