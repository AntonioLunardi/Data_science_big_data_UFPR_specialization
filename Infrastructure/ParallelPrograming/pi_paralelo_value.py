from multiprocessing import Process, Value
import time

PROCS = 16

def pi(val, start, end, step, sums):
    print('Start: ' , str(start))
    print('End: ' , str(end))
    sum = 0.0
    for i in range(start, end):
        x = (i+0.5) * step
        with val.get_lock():
            val.value += sum
    
    
if __name__ == '__main__':
    
    num_steps = 1_000_000 # 100.000.000
    step = 1.0/num_steps
    proc_size = num_steps // PROCS # Divisão com resultado inteiro
    tic = time.time()
    workers = []
    v = Value('d', 0, lock=True)
    
    for i in range(PROCS):
        worker = Process(target=pi, args=(v, i*proc_size, (i+1)*proc_size - 1, step, sum,))
        workers.append(worker)
        
    for worker in workers:
        worker.start()
    for worker in workers:
        worker.join()
    toc = time.time()
    
    for i in range(PROCS):
        sum += sum.get()
    pi = step * v.value
    print('Valor Pi: %.20f ' %pi)
    print('Tempo Pi: %.8f s' %(toc-tic))