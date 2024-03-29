import os

def showMenu():
    print("###################################################################################################")
    print("#                                       Welcome to MIPS                                           #")
    print("###################################################################################################")
    print("# 1- Create the library to perform the simulation                                                 #")
    print("# 2- Perform the simulation                                                                       #")
    print("# 3- Show results                                                                                 #")
    print("# 4- Show fpga project in Quartus Prime                                                           #")
    print("# 8- Clean results and library                                                                    #")
    print("# 9- Exit                                                                                         #")
    print("# Note: If you dont know what are you doing, simple input the numbers in order one by one         #")
    print("###################################################################################################")

librarier = "vlib work"
syntetizer = "vlog"
simulator = "vsim"

testbench = "testbench"
files = testbench + ".sv libMips.sv auxModules.sv cores/instructionDecode/instructionDecode.sv cores/instructionDecode/registerDatabase.sv cores/instructionFetch/instructionFetch.sv cores/instructionFetch/instructionMemory.sv cores/instructionFetch/programCounter.sv cores/instructionFetch/adderProgramCounter.sv cores/instructionFetch/branchController.sv cores/executing/alu.sv cores/executing/aritimeticalControl.sv cores/executing/executing.sv cores/executing/hiLoRegister.sv cores/executing/mdlu.sv cores/executing/outputExecuting.sv cores/memory/memoryDatabase.sv cores/memory/memory.sv cores/writeBack/writeBack.sv controller.sv"
exit = 0

showMenu()
selection = int(input("Type an option: "))

while exit == 0:
    if selection == 0:
        showMenu()
        selection = int(input("Type another option or type 0 to show the menu again: "))

    elif selection == 1:

        print("Creating library...")
        os.system(librarier)

        selection = int(input("Type another option or type 0 to show the menu again: "))

    elif selection == 2:

        print("Syntetizing simulation...")
        os.system(syntetizer + " " + files)
        
        selection = int(input("Type another option or type 0 to show the menu again: "))

    elif selection == 3:

        print("Showing simulation...")
        os.system(simulator + " " + testbench)

        selection = int(input("Type another option or type 0 to show the menu again: "))

    elif selection == 4:
        print("Opening Quartus Prime...")
        os.system("simpleMips.qpf")

        selection = int(input("Type another option or type 0 to show the menu again: "))

    elif selection == 8:

        print("Cleaning...")
        # Please dont uncomment this until the work is finished +_+
        os.system("git clean -ffxd :/")

        selection = int(input("Type another option or type 0 to show the menu again: "))

    elif selection == 9:
        exit=1

    else:
        selection = int(input("Type another option or type 0 to show the menu again: "))

print("Thank ya")