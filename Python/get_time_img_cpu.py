import numpy as np
from time import time
from timeit import timeit
import cv2 as cv
import sys

# Resolución de la cámara
RES_X = 180
RES_Y = 240

# Conversión de tiempo
def FROM_SEC(time):
    return float(1000000000 * time)

# Emulación de variable estática para nombre de imágenes
class staticvar():
    num: int = 0

_staticvar = staticvar()


# Clase para la medición de tiempos y estadísticas de ejecución
class stats():
    start_time: int = 0
    count: int = 0
    acc: int = 0
    stamps = []

    def init(self):
        self.start_time = time()

    def end(self):
        t = time() - self.start_time
        self.stamps.append(t)
        self.acc = self.acc + t
        self.count = self.count + 1

    def result(self):
        return self.acc / self.count

    def measures(self):
        return self.stamps
        
tiempos = stats()


# Clase Evento
class Event():

    t: float    # Timestamp
    x: int      # Coordenada X
    y: int      # Coordenada Y

    def __init__(self, t, x, y):
        self.t = t
        self.x = x
        self.y = y

    def show(self):
        print("Event: ", self.t, self.x, self.y)


# Clase que define un array de eventos
class EventArray():

    events = []
    on_time_change = FROM_SEC(0.033000)
    on_event_change = 20000
    event_diff = 0
    current_slice_time = 0
    last_slice_time = 0

    def add_event(self, e):
        self.events.append(e)
        self.event_diff = self.event_diff + 1
        self.current_slice_time = e.t

        time_diff = self.current_slice_time - self.last_slice_time

        # Solo se ejecuta el paso del algoritmo si se tienen 20.000 eventos leidos o si el tiempo entre el primer y último evento es 0.033 seg
        if(self.event_diff < self.on_event_change and time_diff < self.on_time_change):
            return False

        EventArray().recompute(self)
        return True

    def recompute(self, ea):
        optimizer = OptimizerRolling()
        optimizer.set_cloud(ea.events)
        optimizer.set_scale(3)
        optimizer.run()
        ea.event_diff = 0
        ea.last_slice_time = ea.current_slice_time
        ea.events = []


# Clase para ejecutar los pasos del algoritmo
class OptimizerRolling():

    events = []
    scale: int = 0
    metric_wsizex: int = 0
    metric_wsizey: int = 0
    scale_img_x: int = 0
    scale_img_y: int = 0
    x_shift: float = 0.0
    y_shift: float = 0.0
    x_max: int = 0
    x_min: int = RES_X
    y_max: int = 0
    y_min: int = RES_Y

    def set_cloud(self, events):
        self.events = events
        for e in events:
            if e.x > self.x_max: self.x_max = e.x
            elif e.x < self.x_min: self.x_min = e.x
            if e.y > self.y_max: self.y_max = e.y
            elif e.y < self.y_min: self.y_min = e.y


    def set_scale(self, sc):
        assert(sc % 2 != 0)
        self.scale = sc

        self.metric_wsizex = self.scale * (self.x_max - self.x_min)
        self.metric_wsizey = self.scale * (self.y_max - self.y_min)

        self.x_shift = - int(float((self.x_max - self.x_min) / 2) + self.x_min) * float(self.scale) + float(self.metric_wsizex) / 2.0 + int(self.scale / 2)
        self.y_shift = - int(float((self.y_max - self.y_min) / 2) + self.y_min) * float(self.scale) + float(self.metric_wsizey) / 2.0 + int(self.scale / 2)
    

    def run(self):
        tiempos.init()
        # Ejecuta la función optimizada
        time_img = get_time_img_cpu2(self.events, self.metric_wsizex, self.metric_wsizey, self.scale, self.x_shift, self.y_shift)
        tiempos.end()
        cv.imwrite('time_img' + str(_staticvar.num) + ".jpg", time_img * 255)
        _staticvar.num = _staticvar.num + 1



# Función principal del algoritmo para obtener la imagen temporal
# (Versión directamente traducida de C++)
def get_time_img_cpu(eventos, w, h, scale, x_sh, y_sh):

    w = int(w)
    h = int(h)
    scale = int(scale)
    x_sh = int(x_sh)
    y_sh = int(y_sh)

    project_img_avg = np.zeros((w + scale, h + scale), dtype = np.single)
    project_img_cnt = np.zeros((w + scale, h + scale), dtype = np.single)
    
    for e in eventos:

        x = e.x * scale + x_sh
        y = e.y * scale + y_sh

        if ((x >= w + int(scale / 2)) or (x < int(scale / 2)) or (y >= h + int(scale / 2)) or (y < int(scale / 2))):
            continue

        for jx in range((x - int(scale / 2)), (x + int(scale / 2))):
            for jy in range((y - int(scale / 2)), (y + int(scale / 2))):
                project_img_avg[jx, jy] = project_img_avg[jx, jy] + float(e.t) / 1000000000.0
                project_img_cnt[jx, jy] = project_img_cnt[jx, jy] + 1

    
    for jx in range(0, (w + scale) - 1):
        for jy in range(0, (h + scale) - 1):
            if(project_img_cnt[jx, jy] < 1): continue 
            project_img_avg[jx, jy] = project_img_avg[jx, jy] / project_img_cnt[jx, jy]

    return project_img_avg



# Función principal del algoritmo para obtener la imagen temporal
# (Versión optimizada en Python)
def get_time_img_cpu2(eventos, w, h, scale, x_sh, y_sh):

    w = int(w)
    h = int(h)
    scale = int(scale)
    x_sh = int(x_sh)
    y_sh = int(y_sh)

    project_img_avg = np.zeros((w + scale, h + scale), dtype = np.single)
    project_img_cnt = np.zeros((w + scale, h + scale), dtype = np.single)
    project_img_res = np.zeros((w + scale, h + scale), dtype = np.single)
    
    for e in eventos:

        x = e.x * scale + x_sh
        y = e.y * scale + y_sh

        project_img_avg[x, y] = project_img_avg[x, y] + float(e.t) / 1000000000.0
        project_img_cnt[x, y] = project_img_cnt[x, y] + 1
        tmp = project_img_avg[x, y] / project_img_cnt[x, y]

        for jx in range((x - int(scale / 2)), (x + int(scale / 2))):
            for jy in range((y - int(scale / 2)), (y + int(scale / 2))):
                project_img_res[jx, jy] = tmp 

    return project_img_res



# Comienza leyendo el fichero de eventos y a ejecutar el código completo
def read_file(file_name):

    events_array = EventArray()
    t_0 = 0 # Primer timestamp del fichero
    i = 0   # Número de eventos leídos

    file = open(file_name)
    for line in file:
        line_split = line.split()
        t = float(line_split[0])
        y = int(line_split[1])
        x = int(line_split[2])

        if(t_0 == 0):
            t_0 = t

        e = Event(FROM_SEC(t - t_0), x, y)
        events_array.add_event(e)
        i = i + 1
    file.close()  



# Función principal de la ejecución con muestra de información
def main():
    print('RUNNING...\n')
    read_file('events.txt')
    print('FINISH!\n')
    print('Average execution time (get_time_img_cpu): ', tiempos.result(), 'seconds')


