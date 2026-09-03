Algoritmo ContadorDePalabras
    Definir frase, continuar Como Caracter
    Definir total Como Entero
    
    Repetir
        Escribir "--- Contador de Palabras ---"
        Escribir "Ingresa el texto que quieres analizar:"
        Leer frase
        
        // Verificamos si el texto no está vacío
        Si Longitud(frase) = 0 Entonces
            Escribir "No ingresaste ningún texto."
        SiNo
            // Llamada a la función
            total <- calcular_total_palabras(frase)
            
            Escribir "---------------------------------------"
            Escribir "El texto contiene ", total, " palabras."
            Escribir "---------------------------------------"
        FinSi
        
        Escribir "¿Deseas analizar otro texto? (s/n)"
        Leer continuar
    Hasta Que continuar = "n" O continuar = "N"
    
    Escribir "¡Programa finalizado!"
FinAlgoritmo

// Función con lógica de "interruptor" para contar palabras
Funcion cant <- calcular_total_palabras(texto)
    Definir cant, i Como Entero
    Definir en_palabra Como Logico
    Definir letra Como Caracter
    
    cant <- 0
    en_palabra <- Falso // Este es nuestro interruptor
    
    // Recorremos cada letra del texto
    Para i <- 1 Hasta Longitud(texto) Hacer
        letra <- Subcadena(texto, i, i)
        
        Si letra <> " " Entonces
            // Si la letra no es un espacio y el interruptor está apagado
            // significa que empezamos una palabra nueva
            Si en_palabra = Falso Entonces
                cant <- cant + 1
                en_palabra <- Verdadero // Encendemos el interruptor
            FinSi
        SiNo
            // Si encontramos un espacio, apagamos el interruptor
            en_palabra <- Falso
        FinSi
    FinPara
    
    // Retornamos el total acumulado
FinFuncion