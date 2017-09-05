import operaciones as op
from dec_to_bin import binario

def parte_2(p_2):
    respuesta = "Parte 2:\n"
    for prueba in p_2:
        P = "0"
        N = "0"
        Z = "0"
        C = "0"
        partes = prueba.split()
        if len(partes) == 2:
            numero = binario(partes[1])
            if partes[0] == "¬":
                resultado = op.negativo(numero)
            if partes[0] == "<<":
                resultado = op.rotar_izq(numero)
            if partes[0] == ">>":
                resultado = op.rotar_der(numero)
            if partes[0] == "<":
                resultado = op.desp_izq(numero)
            if partes[0] == ">":
                resultado = op.desp_der(numero)
        else:
            tipo = "int"
            if "." in (partes[0] or partes[2]):
                tipo = "float"
            a = binario(partes[0], tipo)
            b = binario(partes[2], tipo)
            if partes[1] == "+":
                if tipo == "int":
                    resultado = op.sumar_int(a, b)[1:]
                    if op.menor(resultado, a) and op.menor(resultado, b):
                        C = "1"
                else:
                    resultado = op.sumar_restar_float(a, b, "sumar")
                    if op.menor(resultado[1:], a) and op.menor(resultado[1:], b):
                        C = "1"
            if partes[1] == "-":
                if tipo == "int":
                    resultado = op.restar_int(a, b)
                    if op.menor(a, b):
                        N = "1"
                else:
                    resultado = op.sumar_restar_float(a, b, "restar")
                    if op.menor(a[1:], b[1:]):
                        N = "1"
            if partes[1] == "&&":
                resultado = op.AND(a, b)
            if partes[1] == "||":
                resultado = op.OR(a, b)
            if partes[1] == "^":
                resultado = op.XOR(a, b)
        if resultado[-1] == "1":
            P = "1"
        if "1" not in resultado:
            Z = "1"
        respuesta = respuesta + P + "-" + N + "-" + Z + "-" + C + "\n"
    return respuesta