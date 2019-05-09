# ECDH-1PU

Internet Draft describing the `ECDH-1PU` JWE encryption algorithm.

`ECDH-1PU` is a variant on the existing `ECDH-ES` algorithm, which performs
an additional ECDH key agreement between the static private key of the sender
and the static public key of the recipient. The resulting shared secret is
concatenated with the ephemeral-static shared secret from the normal `ECDH-ES`
method and both are fed into the ConcatKDF to derive the AES/HMAC keys.

This additional key agreement step provides sender authentication, achieving
the security goal of *public key authenticated encryption*. The recipient can
be assured of the authenticity and integrity of a received JWE without needing
a separate signature to be applied (and resulting bloating of size due to the need
for nested JOSE structures).

The security assurances of this encryption mode closely relate to those of the
NIST "one-pass unified model" of [SP 800-56A (rev. 3) - section 6.2.1.2][1]
and the [Noise Protocol Framework's "K" one-way pattern][2].

## Two-way handshake

While most JOSE encryption modes only consider one-shot messages sent from a
sender to one or more recipients, the `ECDH-1PU` mode can also support two-way
interactive handshakes. If Alice sends a message encrypted with `ECDH-1PU`
to Bob's long-term public key, and then Bob responds to Alice's ephemeral public
key also using `ECDH-1PU`, then the result is a handshake similar in principle
(but not in detail) to the [Noise KK handshake pattern][3].

[1]: https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-56Ar3.pdf 
[2]: https://noiseprotocol.org/noise.html#one-way-handshake-patterns 
[3]: https://noiseprotocol.org/noise.html#interactive-handshake-patterns-fundamental
