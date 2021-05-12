# Arquitectura de Altas Prestaciones para Visión

Este repositorio ha sido creado para la asignatura de mismo nombre del Máster en Ciencia de Datos e Ingeniería de Computadores de la Universidad de Granada para el curso 2021. Dentro del mismo de puede encontrar todos los ficheros de código pertenecientes al trabajo final de la asignatura. Este trabajo consiste en la aceleración hardware de un algoritmo de procesamiento de imágenes captadas mediante sistemas de visión bioinspirados o cámara de eventos (DVS). 

### Estructura de ficheros

Para facilitar el acceso al repositorio y su código, se explica a continuación cómo están organizados sus archivos:

* **Jupyter Notebook:** Incluye el notebook de Jupyter para ejeuctar la prueba del overlay desarrollado para pynq.

* **Overlay:** Incluye los tres ficheros necesarios para la ejecución del overlay creado sobre python.

* **Python:** Cuenta con el código de la función del algoritmo principal traducida de C++ a Python, con la intención de ser ejecutada sobre la Pynq Z2. El código incluye todo lo necesario para la lectura del fichero y los pasos posteriores hasta la ejecución de la función principal. Además, cuenta con un fichero de eventos a procesar.

* **Vitis HLS:** En esta carpeta se puede encontrar los ficheros de descripción del IP propio para la aceleración, así como los resultados generados tras la síntesis usando Vitis HLS y el fichero ZIP de exportación como IP.

* **Vivado:** Contiene todo lo relacionado con la creación del layout utilizado para crear el Overlay de Pynq. Se puede ejecutar el proyecto completo usando el software Vivado.

### Implementación

Multiples problemas han llevado a que la implementación del Overlay de Pynq no funcione correctamente, resultando imposible la aceleración hardware del algoritmo. A pesar de ello, se ha logrado implementar una solución eficaz en Python, ejecutando de una forma más óptima la función elegida del paper, llegando incluso a revar un orden de magnitud el tiempo de ejecución, pasando de los 0,7 segundos por slice de tiempo, a los 0,07 segundos. 

### Conclusiones

Los resultados obtenidos durante la realización de este trabajo no han sido los esperados. En ello han inluido diversos factores, como la complejidad de un diseño de aceleradores hardware personalizados para la aplicación, la dificultad de mover datos entre PS y PL, los problemas de entendimiento entre Python y C++ al ser lenguajes tan diferentes, la poca información avanzada encontrada sobre el tema, muchos post de foros donde las soluciones dadas no funcionan, etc. 

Como trabajo futuro se propone seguir trabajando hasta lograr la realización completa del trabajo, expandiéndolo hasta conseguir la implementación y aceleración completa del código del algoritmo presentado en el paper sobre una FPGA, y utilizando C++, dejando de un lado Python. 