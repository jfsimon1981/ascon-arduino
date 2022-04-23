ASCON Suite for Arduino
=======================

This repository builds a number of useful cryptographic primitives around
the ASCON permutation, customized for use as an Arudino library.

This code is a direct port of the more general-purpose [ASCON Suite](https://github.com/rweather/ascon-suite) library.
If you find a bug or wish to contribute to this project, then please
submit a merge request to ASCON Suite instead of this repository.
The only exceptions are for Arduino-specific files and examples that
do not appear in the other repository.

API's are provided for the following areas:

* Authenticated Encryption with Associated Data (AEAD)
* Hashing
* HMAC-based Key Derivation Function (HKDF)
* Hashed Message Authentication Code (HMAC)
* ISAP AEAD Mode with Side Channel Protections
* Keyed Message Authentication Code (KMAC)
* Password-Based Key Derivation Function (PBKDF2)
* Pseudorandom Number Generation (PRNG)
* Synthetic Initialization Vector (SIV)
* Extensible Output Functions (XOF)
* Direct Access to the ASCON Permutation

See the [HTML documentation](https://rweather.github.io/ascon-suite/index.html)
of [ASCON Suite](https://github.com/rweather/ascon-suite) for more
information on the functionality in the library.

Using the Library
-----------------

To use the library, include the \<ASCON\.h\> header file, which will include
all of the functions and types from the library into your sketch:

    #include <ASCON.h>

    void setup()
    {
        ...
    }

    void loop()
    {
        ...
    }

History
-------

The functionality in this library was originally prototyped in the
[LWC Finalists](https://github.com/rweather/lwc-finalists) repository.
The [ASCON Suite](https://github.com/rweather/ascon-suite) repository
extracts and expands the ASCON-specific parts of the original repository.

Contact
-------

For more information on this code, to report bugs, or to suggest
improvements, please contact the author Rhys Weatherley via
[email](mailto:rhys.weatherley@gmail.com).
