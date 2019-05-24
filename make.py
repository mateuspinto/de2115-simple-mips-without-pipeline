import os

def showMenu():
    print("###################################################################################################")
    print("#                                       Welcome to MIPS                                           #")
    print("###################################################################################################")
    print("# 1- Create the library to perform the simlation                                                  #")
    print("# 2- Perform the simlation                                                                        #")
    print("# 3- Show results                                                                                 #")
    print("# 4- Clean results and library                                                                    #")
    print("# 9- Exit                                                                                         #")
    print("# Note: If you dont know what are you doing, simple input the numbers in order one by one         #")
    print("###################################################################################################")

librarier = "vlib work"
syntetizer = "vlog"
simulator = "vsim"

testbench = "testbench"
files = testbench + ".sv libMips.sv auxModules.sv cores/instructionDecode/instructionDecode.sv cores/instructionDecode/registerDatabase.sv cores/instructionFetch/instructionFetch.sv cores/instructionFetch/instructionMemory.sv cores/instructionFetch/programCounter.sv cores/instructionFetch/adderProgramCounter.sv cores/instructionFetch/branchController.sv cores/executing/alu.sv cores/executing/aritimeticalControl.sv cores/executing/executing.sv cores/memory/memoryDatabase.sv cores/memory/memory.sv cores/writeBack/writeBack.sv controller.sv mips.sv fpgaIntegration/displaySevSegm/binaryToHexSevSegm.sv fpgaIntegration/displaySevSegm/displaySevSegm.sv fpgaIntegration/fpgaController/clockChooser.sv fpgaIntegration/fpgaController/infoChooser.sv"
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

        print("Cleaning...")
        # Please dont uncomment this until the work is finished +_+
        os.system("git clean -ffxd :/")

        selection = int(input("Type another option or type 0 to show the menu again: "))

    elif selection == 9:
        exit=1

print("Thank ya")