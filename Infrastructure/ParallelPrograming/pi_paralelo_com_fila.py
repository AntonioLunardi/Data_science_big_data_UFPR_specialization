from multiprocessing import Process, Queue
import time
fila = Queue()

PROCS = 16

def pi(start, end, step, sums):
    print('Start: ' , str(start))
    print('End: ' , str(end))
    sum = 0.0
    for i in range(start, end):
        x = (i+0.5) * step
        sum = sum + 4.0/(1.0+x*x)
    sums.put(sum)
    
if __name__ == '__main__':
    
    num_steps = 100_000_000 # 100.000.000
    sum = 0.0
    step = 1.0/num_steps
    proc_size = num_steps // PROCS # Divisão com resultado inteiro
    
    tic = time.time()
    workers = []
    
    for i in range(PROCS):
        worker = Process(target=pi, args=(i*proc_size, (i+1)*proc_size - 1, step, fila,))
        workers.append(worker)
        
    for worker in workers:
        worker.start()
    for worker in workers:
        worker.join()
    toc = time.time()
    
    for i in range(PROCS):
        sum += fila.get()
    pi = step * sum
    print('Valor Pi: %.20f ' %pi)
    print('Tempo Pi: %.8f s' %(toc-tic))