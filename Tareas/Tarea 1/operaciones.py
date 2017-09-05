def negativo (numero):
    resultado = ""
    for digito in numero:
        if digito == "1":
            resultado += "0"
        elif digito == "0":
            resultado += "1"
    return resultado

def rotar_izq (numero):
    inicial = numero[:1]
    resultado = numero[1:] + inicial
    return resultado

def rotar_der (numero):
    final = numero[-1]
    resultado = final + numero[:-1]
    return resultado

def desp_izq (numero):
    resultado = numero[1:] + "0"
    return resultado

def desp_der (numero):
    resultado = "0" + numero[:-1]
    return resultado

def sumar_int (a, b):
    carry = "0"
    a = a[::-1]
    b = b[::-1]
    resultado = ""
    for i in range(len(a)):
        if carry == "1":
            if a[i] == "1" and b[i] == "1":
                resultado += "1"
            elif a[i] == "0" and b[i] == "0":
                resultado += "1"
                carry = "0"
            else:
                resultado += "0"
        else:
            if a[i] == "1" and b[i] == "1":
                resultado += "0"
                carry = "1"
            elif a[i] == "0" and b[i] == "0":
                resultado += "0"
            else:
                resultado += "1"
    resultado += carry
    return resultado[::-1]

def sumar_restar_float (a, b, operacion):
    cero = "0"
    if a[1:6] == "00000":
        return b
    elif b[1:6] == "00000":
        return a
    a_mant = "1" + a[6:16]
    b_mant = "1" + b[6:16]
    if menor(a[1:6], b[1:6]):
        exp = b[1:6]
        mover = bin_to_dec(restar_int(b[1:6], a[1:6])[1:])
        for i in range(mover):
            a_mant = desp_der(a_mant)
    else:
        exp = a[1:6]
        mover = bin_to_dec(restar_int(a[1:6], b[1:6])[1:])
        for i in range(mover):
            b_mant = desp_der(b_mant)
    if operacion == "sumar":
        res = sumar_int(a_mant, b_mant)
    else:
        res = restar_int(a_mant, b_mant)
        if menor(a[1:6], b[1:6]):
            cero = "1"
    while len(res) > 11:
        if res[0] == "1":
            exp = restar_int(exp, "00001")[1:]
            if res[11] == "1":
                res = sumar_int(res, "0"* 11 + "1")[:12]
            else:
                res = res[1:12]
        if res[0] == "0":
            res = res[1:]
        if len(res) == 10:
            res += "0"
    return cero + exp + res[1:]

def restar_int (a, b):
    b = negativo(b)
    uno = "0" * (len(a) - 1) + "1"
    b = sumar_int(b, uno)[1:]
    return sumar_int(a, b)

def AND (a, b):
    resultado = ""
    for i in range(len(a)):
        if a[i] == "1" and b[i] == "1":
            resultado += "1"
        else:
            resultado += "0"
    return resultado

def OR (a, b):
    resultado = ""
    for i in range(len(a)):
        if a[i] == "0" and b[i] == "0":
            resultado += "0"
        else:
            resultado += "1"
    return resultado

def XOR (a, b):
    resultado = ""
    for i in range(len(a)):
        if a[i] == b[i]:
            resultado += "0"
        else:
            resultado += "1"
    return resultado

def menor(a, b):
    for i in range(len(a)):
        if a[i] == "1" and b[i] == "0":
            return False
        elif a[i] == "0" and b[i] == "1":
            return True
    return False

def bin_to_dec(binario):
    binario = binario[::-1]
    numero = 0
    for i in range(len(binario)):
        if binario[i] == "1":
            numero += 2**(i)
    return numero