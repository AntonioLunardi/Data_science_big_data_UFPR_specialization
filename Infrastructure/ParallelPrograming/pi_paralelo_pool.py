from multiprocessing import Pool
import itertools
import time

PROCS = 8

def pi(start, end, step):
    print ('Start: ', str(start))
    print ('End: ', str(end))
    sum = 0.0
    for i in range(start, end):
        x = (i+0.5) * step
        sum = sum + 4.0/(1.0+x*x)
    return sum
    
if __name__ == '__main__':

    num_steps = int(100_000_000)
    step = 1.0/num_steps
    proc_size = num_steps // PROCS # Divisão INTEIRA
    tic = time.time()

    res = []
    p = Pool(PROCS)
    for i in range(PROCS):
        res.append(p.apply_async(pi, (i*proc_size, (i+1)*proc_size - 1, step,)))

    print(sum([r.get() for r in res])/num_steps)

    toc = time.time()
    print ('Tempo de cálculo: %.8f s' %(toc-tic))