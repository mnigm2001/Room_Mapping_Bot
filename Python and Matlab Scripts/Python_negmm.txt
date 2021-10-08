import serial
import math

X = 0
#Run for 10 measurements with x incremented by 10
for j in range(10):
    
    s = serial.Serial("COM3", 115200)
    output = ''
    print("Opening: " + s.name)
    
    f=open("projectfile2dx4.xyz", "a")                      #Open the data file to write
    angle = 22.5;
    for i in range(19):
        x = s.read()        # read one byte
        c = x.decode()      # convert byte type to str
        output+=c
        
        while(c!= "\n"):
            x = s.read()        # read one byte
            c = x.decode()
            output+=c
        print("output: " + output)
        
        ans = output.split()        #Split the answer to extract just the number at index 0 
        
        #If the number is a digit
        if (ans[0].isdigit()):
            ans = int(output)                                   #Type cast the string to an int
            x=X
            y = float(ans)*math.sin(angle*(math.pi/180))        #Determine the y value of the measurement
            z = float(ans)*math.cos(angle*(math.pi/180))        #Determine the z value of the measurement
            print(x, y, z)
            f.write("{} {} {}\n".format(x,y,z))                 #Append the xyz values into the xyz file
            angle += 22.5
        output = ''
    X+= 1                                                       #Increment the x value by 10cm
    f = open("projectfile2dx4.xyz", "r")                        #At the end of the slice, print all of the values
    print(f.read())
    f.close()
    print("Closing: " + s.name)
    s.close();
