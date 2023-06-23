# crc32c v1.2

This is an amalgamation of [Mark Adler's](https://github.com/madler) hardware-accelerated C-language implementation of the CRC-32C (Castagnoli) algorithm as found on [Stack Overflow](https://stackoverflow.com/a/17646775), additional [code of his](https://github.com/madler/brotli/blob/46ecea69a993a7ebd2de4a60ae6042d31e26213f), and some other bits and bobs created by me (Dan Cassidy), all in order to create a `crc32c` binary that could be easily compiled.

None of the C code was developed by me. I simply collected the disparate parts, tweaked things ever so slightly, added a few complimentary files, and stuck the resultant bits in a git repo.


## Compiling

NOTE: Requires `make` and `gcc`.

Run `make`.


## Installing

Run `sudo make install` to install the `crc32c` binary to "/usr/local/bin" (compiling it first, if necessary).

Alternatively, you can just manually copy the binary to wherever you need it.


## Usage

`crc32c [[-]nnn] < data` will checksum anything passed in via the stdin stream `nnn` times (defaults to `1`), preferably using the hardware implementation. If `nnn` is negative, the software implementation is forced.

- `echo "foo" > foo.txt; crc32c < foo.txt`: 9626347b
- `crc32c <<< "text to checksum"`: c748368b
- `echo "more text to checksum" | crc32c`: bc55db06


## File Origins

- .gitignore: Created for this repo
- Makefile: Created for this repo
- README.md: Created for this repo
- crc32c.c: <https://stackoverflow.com/a/17646775> (first code block), retrieved 2023-06-22
    - the `TEST` macro is a graft onto the end of this file and comes from <https://github.com/madler/brotli/blob/46ecea69a993a7ebd2de4a60ae6042d31e26213f/crc32c.c#L426-L472>, retrieved 2023-06-22
    - NOTE: The `TEST` macro is altered to remove the preceding `0x` from the checksum when printed to keep the resulting binary's behavior consistent with that of other checksum-generating tools.
- generate_crc32c_h.c: <https://stackoverflow.com/a/17646775> (second code block), retrieved 2023-06-22
- load.c: <https://github.com/madler/brotli/blob/46ecea69a993a7ebd2de4a60ae6042d31e26213f/load.c>, retrieved 2023-06-22
- load.h: <https://github.com/madler/brotli/blob/46ecea69a993a7ebd2de4a60ae6042d31e26213f/load.h>, retrieved 2023-06-22


## Licenses

- .gitignore: [MIT](https://opensource.org/license/mit/), Copyright 2023 Dan Cassidy
- Makefile: [MIT](https://opensource.org/license/mit/), Copyright 2023 Dan Cassidy
- README.md: [MIT](https://opensource.org/license/mit/), Copyright 2023 Dan Cassidy
- crc32c.c: [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/), via the Stack Exchange Terms of Service as detailed [here](https://stackoverflow.com/help/licensing) and [here](https://stackoverflow.com/posts/17646775/timeline#history_b8f3e8c5-356e-43b8-9069-d1f69b06039b)
    - The `TEST` macro is [Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0), via the [license in its origin repo](https://github.com/madler/brotli/blob/46ecea69a993a7ebd2de4a60ae6042d31e26213f/LICENSE)
- generate_crc32c_h.c: [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/), via the Stack Exchange Terms of Service as detailed [here](https://stackoverflow.com/help/licensing) and [here](https://stackoverflow.com/posts/17646775/timeline#history_b8f3e8c5-356e-43b8-9069-d1f69b06039b)
- load.c: [Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0), via the [license in its origin repo](https://github.com/madler/brotli/blob/46ecea69a993a7ebd2de4a60ae6042d31e26213f/LICENSE)
- load.h: [Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0), via the [license in its origin repo](https://github.com/madler/brotli/blob/46ecea69a993a7ebd2de4a60ae6042d31e26213f/LICENSE)
