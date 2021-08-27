from timeit import timeit

def for_loop():
    res = []
    for i in range(1_000_000):
        res.append(i)
    return res

def for_list():
    return [i for i in range(1_000_000)]


expsize = 1000
time1 = timeit(for_loop, number=expsize)
time2 = timeit(for_list, number=expsize)

print(f'List Comp is {round(time1/time2, 2)} times faster than for loop')