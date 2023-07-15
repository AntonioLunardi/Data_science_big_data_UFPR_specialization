from multiprocessing import Process, Pipe, Lock
import time

PROCS = 16
def pi(lk, start, end, step, sums):
    print('Start: ' , str(start))
    print('End: ' , str(end))
    sum = 0.0
    for i in range(start, end):
        x = (i+0.5) * step
        sum = sum + 4.0/(1.0+x*x)
        
        
    with lk:
        sums.send(sum)
    
if __name__ == '__main__':
    # Inicialização do Pipe
    a, b = Pipe()
    #w = Process(target=worker, args=(a, ))
    #m = Process(target = master, args=(b, ))
    
    num_steps = 100_000_000 # 100.000.000
    sum = 0.0
    step = 1.0/num_steps
    proc_size = num_steps // PROCS # Divisão com resultado inteiro
    
    tic = time.time()
    workers = []
    lock = Lock()
    
    for i in range(PROCS):
        worker = Process(target=pi, args=(lock, i*proc_size, (i+1)*proc_size - 1, step, a,))
        workers.append(worker)
        
    for worker in workers:
        worker.start()
    for worker in workers:
        worker.join()
    toc = time.time()
    
    for i in range(PROCS):
        sum += b.recv()
    pi = step * sum
    print('Valor Pi: %.20f ' %pi)
    print('Tempo Pi: %.8f s' %(toc-tic))