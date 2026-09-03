Algoritmo OperacionesConArreglos
	Definir n, i Como Entero
	
	Escribir "--- Analizador de Datos (Arreglos) ---"
	
	// 1. Preguntar cuántos números quiere ingresar
	Repetir
		Escribir "¿Cuántos números deseas ingresar en la lista?"
		Leer n
		Si n <= 0 Entonces
			Escribir "Error: Debes ingresar al menos un número."
		FinSi
	Hasta Que n > 0
	
	// 2. Definir el arreglo con el tamaño n
	Dimension lista[n]
	
	// 3. Llenar el arreglo
	Para i <- 1 Hasta n Hacer
		Escribir "Ingresa el número ", i, ":"
		Leer lista[i]
	FinPara
	
	// 4. Llamar al procedimiento para analizar
	analizar_arreglo(lista, n)
	
FinAlgoritmo

// Procedimiento para procesar los datos
SubProceso analizar_arreglo(datos, cantidad)
	Definir suma, promedio, max, min Como Real
	Definir j Como Entero
	
	// Inicializamos variables con el primer elemento
	suma <- 0
	max <- datos[1]
	min <- datos[1]
	
	// Recorremos el arreglo para los cálculos
	Para j <- 1 Hasta cantidad Hacer
		// Acumular para la suma
		suma <- suma + datos[j]
		
		// Buscar el mayor
		Si datos[j] > max Entonces
			max <- datos[j]
		FinSi
		
		// Buscar el menor
		Si datos[j] < min Entonces
			min <- datos[j]
		FinSi
	FinPara
	
	// Calcular el promedio
	promedio <- suma / cantidad
	
	// Mostrar resultados formateados
	Escribir "---------------------------------------"
	Escribir "RESULTADOS DEL ANÁLISIS:"
	Escribir "---------------------------------------"
	Escribir "Sumatoria total: ", suma
	// En PSeInt, para mostrar 2 decimales se suele usar Redon
	Escribir "Promedio de los elementos: ", redon(promedio * 100) / 100
	Escribir "Número más grande (Máximo): ", max
	Escribir "Número más pequeño (Mínimo): ", min
	Escribir "---------------------------------------"
FinSubProceso