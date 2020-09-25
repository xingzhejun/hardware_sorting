import random

f = open("test.txt", 'w')

for i in range(4096):
    f.write("{}".format(random.randint(0, 1)))

f.close()
