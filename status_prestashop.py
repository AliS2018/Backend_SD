import os
def OS_SCE(p_command):
    err = os.system(p_command)
    if err != 0:
        return err
    return None
def command(loki): 
    COMMAND="wget -q  -O /tmp/foo "
    COMMAND2=" | grep '200' /tmp/foo | wc -l"
    loader=COMMAND + loki + COMMAND2
    print(loader)
    OS_SCE(str(loader))
    
print("Please Type In Site's Domain Name: example.com")    
askme= str(input())
if (command(askme)== 0):
    print("0")
if (command(askme)== 1):
    print("-1")