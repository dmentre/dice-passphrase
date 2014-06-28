# High-level requirements

## Program objective

`dice-passphrase` is a command-line program to generate a random
passphrase. The passphrase is made of "sentences" of form
Adjective-Noun-Verb so as to be hopefully easy to remember. Each
Adjective, Noun or Verb is extracted from a pre-defined list.

The randomness comes either for /dev/random in automated mode or user
input rolling a dice (thus the program name) in manual mode.

It is inspired by
[Diceware](http://world.std.com/~reinhold/diceware.html). However a
passphrase can be generated automatically by the program.

## User interface

REQ-UI-1: Program shall take following command-line options:
* No option: default, automated mode;
* `--manual`: manual mode;
* `--help`: display help and exit.

REQ-UI-2: In --manual mode, program shall ask the user to roll a die and
read dice roll result entered by the user, and do so as many times as
needed to produce needed randomness for passphrase generation. Dice roll
input is an integer between 1 and 6.

REQ-UI-3: Program shall generate and print on standard output a
passphrase. The passphrase is a sequence of sentences. A sentence is a
triple (Adjective, Noun, Verb).

REQ-UI-4: Program output shall be on a single line. Adjective, Noun and
Verb of a sentence are printed in lower case, separated by a space and
ending with a dot (`.`).

> Program output example: `blue dice rolls. orange man thinks.`

REQ-UI-5: Adjectives, Nouns and Verbs of a passphrase are taken in three
pre-defined lists. Those lists should be made such as maximizing the
hability to remember a list's words.


## Security

REQ-SEC-1: Programm shall produce a passphrase corresponding to at least
32 bits of entropy.

REQ-SEC-2: Randomness source is either `/dev/random` device in automated
mode or dice rolls result entered by user in manual mode.

REQ-SEC-3: The program shall not be able to produce a Run Time Error
(integer overflow, out-of-bound array access, division by zero, ...).

REQ-SEC-4: The memory used by the program should be cleaned-up onced no
longer needed by the program.
