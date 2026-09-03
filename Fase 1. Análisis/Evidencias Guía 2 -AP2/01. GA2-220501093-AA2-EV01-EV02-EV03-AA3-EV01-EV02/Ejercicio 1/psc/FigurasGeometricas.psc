Algoritmo FigurasGeometricas
	Definir opcion Como Entero
	Definir continuar Como Caracter
	
	Repetir
		Escribir "--- Menú de Cálculos Geométricos ---"
		Escribir "1. Cuadrado"
		Escribir "2. Rectángulo"
		Escribir "3. Círculo"
		Escribir "4. Salir"
		Escribir "Elige una opción:"
		Leer opcion
		
		Si opcion <> 4 Entonces
			Segun opcion Hacer
				1:
					Definir l Como Real
					Escribir "Ingresa el lado del cuadrado:"
					Leer l
					Mientras l <= 0 Hacer
						Escribir "Error: El valor debe ser positivo. Intenta de nuevo:"
						Leer l
					FinMientras
					Escribir "Área: ", calcular_area_cuadrado(l)
					Escribir "Perímetro: ", calcular_perimetro_cuadrado(l)
					
				2:
					Definir b, a Como Real
					Escribir "Ingresa la base:"
					Leer b
					Escribir "Ingresa la altura:"
					Leer a
					Mientras b <= 0 o a <= 0 Hacer
						Escribir "Error: Los valores deben ser positivos. Reintenta:"
						Leer b
						Leer a
					FinMientras
					Escribir "Área: ", calcular_area_rectangulo(b, a)
					Escribir "Perímetro: ", calcular_perimetro_rectangulo(b, a)
					
				3:
					Definir r Como Real
					Escribir "Ingresa el radio del círculo:"
					Leer r
					Mientras r <= 0 Hacer
						Escribir "El radio debe ser mayor a 0:"
						Leer r
					FinMientras
					Escribir "Área: ", calcular_area_circulo(r)
					Escribir "Perímetro: ", calcular_perimetro_circulo(r)
					
				De Otro Modo:
					Escribir "Opción no válida."
			Fin Segun
			
			Escribir "¿Quieres hacer otro cálculo? (s/n)"
			Leer continuar
		SiNo
			continuar <- 'n'
		Fin Si
		
	Hasta Que continuar = 'n' O continuar = 'N'
	
	Escribir "¡Gracias por usar el programa!"
FinAlgoritmo

// --- FUNCIONES DEL CUADRADO ---
Funcion area <- calcular_area_cuadrado(lado)
	Definir area Como Real
	area <- lado * lado
FinFuncion

Funcion peri <- calcular_perimetro_cuadrado(lado)
	Definir peri Como Real
	peri <- 4 * lado
FinFuncion

// --- FUNCIONES DEL RECTÁNGULO ---
Funcion area <- calcular_area_rectangulo(base, altura)
	Definir area Como Real
	area <- base * altura
FinFuncion

Funcion peri <- calcular_perimetro_rectangulo(base, altura)
	Definir peri Como Real
	peri <- (2 * base) + (2 * altura)
FinFuncion

// --- FUNCIONES DEL CÍRCULO ---
Funcion area <- calcular_area_circulo(radio)
	Definir area Como Real
	// Usamos PI de PSeInt para más precisión
	area <- PI * (radio ^ 2)
FinFuncion

Funcion peri <- calcular_perimetro_circulo(radio)
	Definir peri Como Real
	peri <- 2 * PI * radio
FinFuncion