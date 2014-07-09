# Architecture and Design

## Architecture

The program is made of following modules. For each module, we give its
secrets.

* Bounded_String_Instance: knows to handle Bounded_String of a given
  size
* Random: knows how to generate a random number
* Cmd_Line: knows how to parse command-line arguments and prints help
* Words: knows the lists of words
* Passphrase: knows how to generate a passphrase
* Dice_Passphrase: the main program, knows how to call other modules

## Design

> Note: I'm not a specialist in cryptography. If you think the approach
> below is flawed, let me know.

### Finding number of sentences to print (ALG-1)

We define `#Adjectives` the number of adjectives in the list of
adjectives. Same definition for `#Nouns` and `#Verbs`.

The number of bits of entropy in an Adjective-Noun-Verb sentence is:

    entropy_bits_per_sentence = |_ log2(#Adjectives * #Nouns * #Verbs) _|

As we request 32 bits of entropy (REQ-SEC-1), the number of sentences to
print is:

    number_sentences_to_print = |_ 32 / entropy_bits_per_sentence _| + 1

In above computations, `|_ x _|` is lowest integer rounding of `x`. We
add 1 to be on the secure side, i.e. to provide more entropy than
needed.

### Computing a random number in [a, b] interval (ALG-2)

We want to compute a random number in [a, b] with a >= 0 and b <= the
biggestpositive machine integer.

We define `interval_size = b - a + 1`.

We assume we have a randomness source that gives at random an integer
`random_source` between 1 and `max_random_per_call` when called:

* For `/dev/random`, `max_random_per_call = 256`
* For a dice, `max_random_per_call = 6`

We want to build an integer `random_range` such that we can equally
chose all integers in interval [0, b-a]. We compute it such that:

    random_range >= interval_size

To build `random_range`, we call the randomness source enough times such
that `random_range >= interval_size`, shifting the random bits generated
previously:

```
random_range = random_source
while (random_range < interval_size):
    random_range = random_range * max_random_per_call + random_source
```

Then, the random number returned is:

    random_returned = a + random_range mod interval_size


### How to chose a word in a word list at random (ALG-3)

We assume `#Words` is a number of words in a word list. We chose a
random number `i` between 1 and `#Words` and return word `i` of the word
list.

