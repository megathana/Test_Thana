def simpleCipher(encrypted, k):
    decrypted = ""
    for char in encrypted:
        # คำนวณตำแหน่งใหม่โดยเลื่อนไป k ตำแหน่งทวนเข็มนาฬิกา
        new_char = chr((ord(char) - ord('A') - k) % 26 + ord('A'))
        decrypted += new_char
    return decrypted

result = simpleCipher("VTAOG", 2)
print(result)
