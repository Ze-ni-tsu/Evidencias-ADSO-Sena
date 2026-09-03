Algoritmo VerificacionPrimos
	Definir num Como Entero
	
	Escribir "--- Verificador de Números Primos ---"
	
	// Solicitar número y validar que sea mayor a 1
	Repetir
		Escribir "Introduce un número entero mayor a 1:"
		Leer num
		Si num <= 1 Entonces
			Escribir "Error: El número debe ser mayor a 1 para ser analizado."
		FinSi
	Hasta Que num > 1
	
	// Llamamos a la función y mostramos el resultado
	Si es_primo(num) Entonces
		Escribir "El número ", num, " ES PRIMO."
	SiNo
		Escribir "El número ", num, " NO ES PRIMO."
		// Opcional: mostrar un mensaje extra
		Escribir "Tiene otros divisores además de 1 y sí mismo."
	FinSi
	
FinAlgoritmo

// Función para determinar si n es primo
Funcion resultado <- es_primo(n)
	Definir resultado Como Logico
	Definir i, acumulador Como Entero
	
	// Casos base según la checklist
	Si n <= 1 Entonces
		resultado <- Falso
	SiNo
		Si n = 2 Entonces
			resultado <- Verdadero
		SiNo
			Si n % 2 = 0 Entonces
				// Si es par y mayor a 2, no es primo
				resultado <- Falso
			SiNo
				// Si es impar, buscamos divisores desde 3 hasta n-1
				acumulador <- 0
				Para i <- 3 Hasta n - 1 Hacer
					Si n % i = 0 Entonces
						acumulador <- acumulador + 1
					FinSi
				FinPara
				
				// Si no encontramos ningún divisor en el ciclo
				Si acumulador = 0 Entonces
					resultado <- Verdadero
				SiNo
					resultado <- Falso
				FinSi
			FinSi
		FinSi
	FinSi
FinFuncion