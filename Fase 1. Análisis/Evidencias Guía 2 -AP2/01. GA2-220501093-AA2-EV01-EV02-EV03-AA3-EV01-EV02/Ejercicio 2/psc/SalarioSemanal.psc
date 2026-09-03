Algoritmo SalarioSemanal
	// Definir las variables que vamos a usar
	Definir horas_trabajadas, valor_hora Como Real
	Definir horas_extras, pago_normal, pago_extras, salario_total Como Real
	
	Escribir "--- Cálculo de Nómina Semanal ---"
	
	// Pedir y validar las horas trabajadas
	Repetir
		Escribir "Ingrese el total de horas trabajadas en la semana:"
		Leer horas_trabajadas
		Si horas_trabajadas < 0 Entonces
			Escribir "Error: Las horas no pueden ser negativas."
		FinSi
	Hasta Que horas_trabajadas >= 0
	
	// Pedir y validar el valor por hora
	Repetir
		Escribir "Ingrese el pago por hora normal:"
		Leer valor_hora
		Si valor_hora <= 0 Entonces
			Escribir "Error: El valor por hora debe ser mayor a cero."
		FinSi
	Hasta Que valor_hora > 0
	
	// Lógica para calcular el salario
	Si horas_trabajadas <= 40 Entonces
		// Caso sin horas extras
		pago_normal <- horas_trabajadas * valor_hora
		pago_extras <- 0
		horas_extras <- 0
		salario_total <- pago_normal
	SiNo
		// Caso con horas extras (más de 40)
		horas_extras <- horas_trabajadas - 40
		pago_normal <- 40 * valor_hora
		// El 150% es lo mismo que multiplicar por 1.5
		pago_extras <- horas_extras * (valor_hora * 1.5)
		salario_total <- pago_normal + pago_extras
	FinSi
	
	// Mostrar los resultados (Desglose)
	Escribir "---------------------------------------"
	Escribir "RESUMEN DE PAGO:"
	Escribir "Horas normales (base 40): ", horas_trabajadas - horas_extras
	
	Si horas_extras > 0 Entonces
		Escribir "Horas extras realizadas: ", horas_extras
		Escribir "Pago por concepto de extras: $", pago_extras
	FinSi
	
	Escribir "Pago por horas normales: $", pago_normal
	Escribir "---------------------------------------"
	Escribir "TOTAL A PAGAR: $", salario_total
	Escribir "---------------------------------------"
	
FinAlgoritmo