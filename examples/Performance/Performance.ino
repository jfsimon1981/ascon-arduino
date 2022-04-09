/*
 * Copyright (C) 2022 Southern Storm Software, Pty Ltd.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included
 * in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */

// This sketch runs performance tests on the ASCON primitives.

#include <ASCON.h>

#if defined(ESP8266)
extern "C" void system_soft_wdt_feed(void);
#define crypto_feed_watchdog() system_soft_wdt_feed()
#else
#define crypto_feed_watchdog() do { ; } while (0)
#endif

typedef int (*aead_cipher_encrypt_t)
    (unsigned char *c, size_t *clen,
     const unsigned char *m, size_t mlen,
     const unsigned char *ad, size_t adlen,
     const unsigned char *npub,
     const unsigned char *k);
typedef int (*aead_cipher_decrypt_t)
    (unsigned char *m, size_t *mlen,
     const unsigned char *c, size_t clen,
     const unsigned char *ad, size_t adlen,
     const unsigned char *npub,
     const unsigned char *k);
typedef int (*aead_hash_t)
    (unsigned char *out, const unsigned char *in, size_t inlen);

#if defined(__AVR__)
#define DEFAULT_PERF_LOOPS 200
#define DEFAULT_PERF_LOOPS_16 200
#define DEFAULT_PERF_HASH_LOOPS 100
#else
#define DEFAULT_PERF_LOOPS 1000
#define DEFAULT_PERF_LOOPS_16 3000
#define DEFAULT_PERF_HASH_LOOPS 1000
#endif

static int PERF_LOOPS = DEFAULT_PERF_LOOPS;
static int PERF_LOOPS_16 = DEFAULT_PERF_LOOPS_16;
static int PERF_HASH_LOOPS = DEFAULT_PERF_HASH_LOOPS;
static bool PERF_MASKING = false;

#define MAX_DATA_SIZE 128
#define MAX_TAG_SIZE 32

static unsigned char const key[32] = {
    0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
    0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F,
    0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17,
    0x18, 0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x1F
};
static unsigned char const nonce[16] = {
    0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
    0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F
};
static unsigned char plaintext[MAX_DATA_SIZE];
static unsigned char ciphertext[MAX_DATA_SIZE + MAX_TAG_SIZE];

void perfCipherEncrypt128(aead_cipher_encrypt_t encrypt)
{
    unsigned long start;
    unsigned long elapsed;
    size_t len;
    int count;

    for (count = 0; count < MAX_DATA_SIZE; ++count)
        plaintext[count] = (unsigned char)count;

    Serial.print("   encrypt 128 byte packets ... ");

    start = micros();
    for (count = 0; count < PERF_LOOPS; ++count) {
        encrypt(ciphertext, &len, plaintext, 128, 0, 0, nonce, key);
    }
    elapsed = micros() - start;

    Serial.print(elapsed / (128.0 * PERF_LOOPS));
    Serial.print("us per byte, ");
    Serial.print((128.0 * PERF_LOOPS * 1000000.0) / elapsed);
    Serial.println(" bytes per second");
}

void perfCipherDecrypt128
    (aead_cipher_encrypt_t encrypt, aead_cipher_decrypt_t decrypt)
{
    unsigned long start;
    unsigned long elapsed;
    size_t clen;
    size_t plen;
    int count;

    for (count = 0; count < MAX_DATA_SIZE; ++count)
        plaintext[count] = (unsigned char)count;
    encrypt(ciphertext, &clen, plaintext, 128, 0, 0, nonce, key);

    Serial.print("   decrypt 128 byte packets ... ");

    start = micros();
    for (count = 0; count < PERF_LOOPS; ++count) {
        decrypt(plaintext, &plen, ciphertext, clen, 0, 0, nonce, key);
    }
    elapsed = micros() - start;

    Serial.print(elapsed / (128.0 * PERF_LOOPS));
    Serial.print("us per byte, ");
    Serial.print((128.0 * PERF_LOOPS * 1000000.0) / elapsed);
    Serial.println(" bytes per second");
}

void perfCipherEncrypt16(aead_cipher_encrypt_t encrypt)
{
    unsigned long start;
    unsigned long elapsed;
    size_t len;
    int count;

    for (count = 0; count < MAX_DATA_SIZE; ++count)
        plaintext[count] = (unsigned char)count;

    Serial.print("   encrypt  16 byte packets ... ");

    start = micros();
    for (count = 0; count < PERF_LOOPS_16; ++count) {
        encrypt(ciphertext, &len, plaintext, 16, 0, 0, nonce, key);
    }
    elapsed = micros() - start;

    Serial.print(elapsed / (16.0 * PERF_LOOPS_16));
    Serial.print("us per byte, ");
    Serial.print((16.0 * PERF_LOOPS_16 * 1000000.0) / elapsed);
    Serial.println(" bytes per second");
}

void perfCipherDecrypt16
    (aead_cipher_encrypt_t encrypt, aead_cipher_decrypt_t decrypt)
{
    unsigned long start;
    unsigned long elapsed;
    size_t clen;
    size_t plen;
    int count;

    for (count = 0; count < MAX_DATA_SIZE; ++count)
        plaintext[count] = (unsigned char)count;
    encrypt(ciphertext, &clen, plaintext, 16, 0, 0, nonce, key);

    Serial.print("   decrypt  16 byte packets ... ");

    start = micros();
    for (count = 0; count < PERF_LOOPS_16; ++count) {
        decrypt(plaintext, &plen, ciphertext, clen, 0, 0, nonce, key);
    }
    elapsed = micros() - start;

    Serial.print(elapsed / (16.0 * PERF_LOOPS_16));
    Serial.print("us per byte, ");
    Serial.print((16.0 * PERF_LOOPS_16 * 1000000.0) / elapsed);
    Serial.println(" bytes per second");
}

void perfCipher(const char *name, aead_cipher_encrypt_t encrypt,
                aead_cipher_decrypt_t decrypt)
{
    crypto_feed_watchdog();
    Serial.print(name);
    Serial.print(':');
    Serial.println();

    perfCipherEncrypt128(encrypt);
    perfCipherDecrypt128(encrypt, decrypt);
    perfCipherEncrypt16(encrypt);
    perfCipherDecrypt16(encrypt, decrypt);

    Serial.println();
}

// Reduce the maximum hash buffer size on Uno because there isn't enough RAM.
#if defined(ARDUINO_AVR_UNO)
#define HASH_BUFSIZ 512
#else
#define HASH_BUFSIZ 1024
#endif

static unsigned char hash_buffer[HASH_BUFSIZ];

void perfHash_N(aead_hash_t hash_func, int size)
{
    unsigned long start;
    unsigned long elapsed;
    unsigned long long len;
    int count, loops;

    for (count = 0; count < size; ++count)
        hash_buffer[count] = (unsigned char)count;

    Serial.print("   hash ");
    if (size < 1000) {
        if (size < 100)
            Serial.print("  ");
        else
            Serial.print(" ");
    }
    Serial.print(size);
    Serial.print(" bytes ... ");

    // Adjust the number of loops to do more loops on smaller sizes.
    if (size < HASH_BUFSIZ)
        loops = PERF_HASH_LOOPS * 4;
    else
        loops = PERF_HASH_LOOPS;

    start = micros();
    for (count = 0; count < loops; ++count) {
        hash_func(ciphertext, hash_buffer, size);
    }
    elapsed = micros() - start;

    Serial.print(elapsed / (((double)size) * loops));
    Serial.print("us per byte, ");
    Serial.print((1000000.0 * size * loops) / elapsed);
    Serial.println(" bytes per second");
}

void perfHash(const char *name, aead_hash_t hash_func)
{
    crypto_feed_watchdog();
    Serial.print(name);
    Serial.print(':');
    Serial.println();

    perfHash_N(hash_func, HASH_BUFSIZ);
    perfHash_N(hash_func, 128);
    perfHash_N(hash_func, 16);

    Serial.println();
}

void setup()
{
    Serial.begin(9600);
    Serial.println();

    perfCipher("ASCON-128", ascon128_aead_encrypt, ascon128_aead_decrypt);
    perfCipher("ASCON-128a", ascon128a_aead_encrypt, ascon128a_aead_decrypt);
    perfCipher("ASCON-80pq", ascon80pq_aead_encrypt, ascon80pq_aead_decrypt);

    perfCipher("ASCON-128-SIV", ascon128_siv_encrypt, ascon128_siv_decrypt);
    perfCipher("ASCON-128a-SIV", ascon128a_siv_encrypt, ascon128a_siv_decrypt);
    perfCipher("ASCON-80pq-SIV", ascon80pq_siv_encrypt, ascon80pq_siv_decrypt);

    perfHash("ASCON-HASH", ascon_hash);
    perfHash("ASCON-HASHA", ascon_hasha);
    perfHash("ASCON-XOF", ascon_xof);
    perfHash("ASCON-XOFA", ascon_xofa);
}

void loop()
{
}
