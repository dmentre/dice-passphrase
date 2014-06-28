# Low-level requirements

## Program wide

LLREQ-PROG-1 (REQ-SEC-3): The program shall be implemented in SPARK
2014. Procedures that cannot be implemented in SPARK 2014 shall not be
able to produce a Run Time Error.

## Random

LLREQ-RND-1: A function shall generating a random number in given
interval [a, b]. We shall assume a >= 0 and b <= the biggestpositive
machine integer.

LLREQ-RND-2: The function generating random shall use ALG-2 algorithm.

LLREQ-RND-3 (REQ-UI-2, REQ-SEC-2): In manual mode, function generating
random shall ask the user to roll a die and read dice roll result
entered by the user. It shall do so as many times as needed by following
ALG-2 algorithm.

LLREQ-RND-4 (REQ-SEC-2): In automated mode, function generating random
shall use `/dev/random` device as entropy source.

LLREQ-RND-5 (REQ-SEC-4): Before returning random result, the function
generating random shall reset all internal variables to zero.

LLREQ-RND-6 (REQ-UI-2): Function taking dice input from user shall read
an integer between 1 and 6 and return it.

## Cmd_Line

LLREQ-CMDLINE-1 (REQ-UI-1): Module Cmd_Line shall store the current
program mode.

LLREQ-CMDLINE-2 (REQ-UI-1): Module Cmd_Line shall set program mode to
manual or automated.

LLREQ-CMDLINE-3 (REQ-UI-1):Module Cmd_Line shall take following
command-line options:
* No option: default, automated mode;
* `--manual`: manual mode;
* `--help`: display help and exit.

## Words

LLREQ-WORDS-1 (REQ-UI-5): Three arrays shall store pre-defined lists for
Adjectives, Nouns and Verbs.

LLREQ-WORDS-2 (REQ-UI-5): Word arrays should be made such as maximizing
the hability to remember a list's words.

## Passphrase

LLREQ-PASSPHRASE-1 (REQ-UI-3): A procedure shall generate and print on
standard output a passphrase. The passphrase is a sequence of
sentences.

LLREQ-PASSPHRASE-2 (REQ-SEC-1): The procedure generating a passphrase
shall do it according to ALG-1 algorithm.

LLREQ-PASSPHRASE-2 (REQ-UI-4): Program output shall be on a single
line. Adjective, Noun and Verb of a sentence are printed in lower case,
separated by a space and ending with a dot (`.`).

LLREQ-PASSPHRASE-3 (REQ-UI-3): A procedure shall generate a sentence as
a triple (Adjective, Noun, Verb) indexes in words arrays.

LLREQ-PASSPHRASE-4: The procedure generating a sentence shall do it
following ALG-3 algorithm.

LLREQ-PASSPHRASE-5 (REQ-SEC-4): After generating a sentence, the
procedure doing it shall reset all its internal state to zero.

## Main

LLREQ-CMDLINE-1 (REQ-UI-1): Program shall read command line options and
set program mode accordingly.

LLREQ-CMDLINE-2 (REQ-SEC-2, REQ-UI-2): Program shall generate a sentence
using mode set on command line.
