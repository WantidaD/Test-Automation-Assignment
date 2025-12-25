from cipher import simpleCipher

def test_simple_cipher_example():
    """Decrypt 'VTAOG' with k=2 should return 'TRYME'"""
    encrypted = "VTAOG"
    k = 2
    expected = "TRYME"

    result = simpleCipher(encrypted, k)

    assert result == expected

def test_wrap_around():
    """Wrap-around case: 'AB' with k=2 should return 'YZ'"""
    encrypted = "AB"
    k = 2
    expected = "YZ"

    assert simpleCipher(encrypted, k) == expected

def test_no_shift():
    encrypted = "HELLO"
    k = 0
    expected = "HELLO"

    assert simpleCipher(encrypted, k) == expected