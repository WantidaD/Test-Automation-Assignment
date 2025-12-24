def simpleCipher(encrypted, k):
    decrypted = ""

    for char in encrypted:
        position = ord(char) - ord('A')
        new_position = (position - k) % 26
        decrypted += chr(new_position + ord('A'))

    return decrypted