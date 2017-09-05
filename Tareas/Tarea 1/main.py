from parte2 import parte_2

#Leer el archivo y separarlo en partes p_1, p_2 y bonus
path = input("Ingresa la ruta del test: ")
with open(path) as test:
    p_1 = []
    p_2 = []
    bonus = []
    parte = 0
    for linea in test:
        if "Parte 1 - " in linea:
            parte += 1
            continue
        if "Parte 2 - " in linea:
            parte += 1
            continue
        if "Bonus - " in linea:
            parte += 1
            continue
        if parte == 1:
            p_1.append(linea.strip("\n"))
        if parte == 2:
            p_2.append(linea.strip("\n"))
        if parte == 3:
            bonus.append(linea.strip("\n"))

resultado = ""
resultado += parte_2(p_2)

with open("Resultados.txt", "w") as respuesta:
    respuesta.write(resultado)