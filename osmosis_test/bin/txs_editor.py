import sys


if len(sys.argv) != 2:
    tx_num=10000
else:
    tx_num = int(sys.argv[1])
print("tx_num:",tx_num)

numNode = 3

input_txsFileName = "txs_node4_total10000.csv"
output_txsFileName = "result_"+str(tx_num)+".csv"



src_ip = []


def find_ip(l):
    start = l.index("\"");
    return start

def get_ip(l):
    start = l.index(",")
    return start

i = 0
with open("../env.sh") as src:
    for line in src:
        if "HOSTS[" in line:
            # print(line)
            if "#" in line:
                continue
            if "PRIVATE_" in line:
                continue
            start = find_ip(line)
            src_ip.append(line[start+1:-2])
            print(src_ip[i])
            i += 1

i = 0

final = open(output_txsFileName, "w+")


cnt = 1
with open(input_txsFileName) as dst:
    for line in dst:
        # print(line)
        start = get_ip(line)
        dummy = line[:start]
        l = line.replace(dummy, src_ip[i])
        i = (i+1)%numNode
        # print (l)
        final.write(l)
        if cnt >= tx_num:
            break
        else:
            cnt = cnt + 1
            # print(cnt)