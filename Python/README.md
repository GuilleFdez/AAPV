### Ejecución del código

En esta carpeta se proporciona el código de la función escogida traducida a Python, y optimizada dentro de este lenguaje. Se ha logrado una optimización de un orden de magnitud en el tiempo de ejecución, pasando de unos 0,7 segundos para la ejecución de un slice temporal a los 0,07 segundos por slice. 

Dentro del código se puede modificar la función que se quiere ejecutar para obtener la imagen temporal: si se desea que sea la traducida desde C++ directamente, o la optimizada mediante software. Para ello solo se debe añadir o eliminar el 2 que acompaña al nombre de la función en la línea 136 del ficheor Python.

El código se puede ejecutar de la siguiente forma:

~~~
python3 -i get_time_img_cpu.py
~~~

Y ejecutar lo siguiente dentro del intérprete de Python:

~~~
>>> main()
~~~

De esta forma el código comenzará a ejecutarse y a medida que lo haga irá generando las imágenes temporales, que serán guardadas con extensión .jpg en esta misma carpeta. Al acabar la ejecución, se muestra el resultado del tiempo medio de ejecución de todos los slice temporales de eventos en los que se han dividido el fichero de eventos.

En este caso, se deben generar un total de 31 imágenes temporales. 
