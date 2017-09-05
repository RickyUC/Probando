from operaciones import sumar_int


def binario(numero_literal, tipo):
    numero = convertir_decimal(numero_literal)
    if tipo == "int":
        bin_16 = (16 - len(int_binario(numero))) * "0" + int_binario(numero)
    else:
        entero = int_binario(numero // 1)
        reservados = len(entero)
        if len(entero) < 11:
            if "1" not in entero:
              reservados = 0
            bin_11 = entero + float_binario(numero % 1, reservados)
        else:
            bin_11 = entero
        uno = bin_11.find("1")
        if uno == -1:
          exp_bin = "0" * 5
          bin_11 = "0" * 11
        else:
          if uno > len(entero):
            exp = len(entero) - uno - 1
          else:
            exp = len(entero) + uno - 1
          exp_bin = int_binario(15 + exp)
          bin_11 = bin_11[uno + 1: 11 + uno]
        if len(exp_bin) < 5:
            exp_bin = "0" * (5 - len(exp_bin)) + exp_bin
        bin_16 = "0" + exp_bin + bin_11
    return bin_16
 
def convertir_decimal(numero):
    largo = len(numero)
    punto = numero.find(".")
    if punto == -1:
        punto = largo
        dec = 0
    else:
        dec = transformar_digitos(numero[punto + 1:], "float")
    entero = numero[: punto]
    total = transformar_digitos(entero, "int") + dec
    return total
 
def transformar_digitos(numero, tipo):
    to_int = {"1": 1, "2": 2, "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8,
              "9": 9, "0": 0}
    pos = len(numero) - 1
    if tipo == "int":
        numero = numero[:: -1]
    decimal = 0
    while pos >= 0:
        if tipo == "int":
            decimal += to_int[numero[pos]] * 10 ** (pos)
        else:
            decimal += to_int[numero[pos]] * 10 ** (-pos -1)
        pos -= 1
    return decimal
 
def int_binario(numero):
    if numero == 0:
        return "0"
    binario = ""
    while numero > 1:
        if numero % 2 == 0:
            binario += "0"
        else:
            binario += "1"
        numero //= 2
    binario += "1"
    return binario[::-1]
 
def float_binario(numero, bits_entero):
    binario = ""
    libres = 12 - bits_entero
    uno = 0
    while numero != 0.0 and len(binario) < libres + uno + 1:
        numero *= 2
        if numero >= 1:
            binario += "1"
            numero -= 1
        else:
            binario += "0"
        uno = binario.find("1")
    while len(binario) >= libres + uno:
        if binario[libres + uno - 1] == "1":
            redondear = (libres + uno - 1) * "0" + "1"
            binario = sumar_int(binario[:libres + uno], redondear)
        binario = binario[:len(binario) - 1]
    if len(binario) - uno < 11 - bits_entero:
        binario += "0" * (11 - bits_entero - len(binario) + uno)
    return binario