# ECE 8 Robotics Notes 10-11-22

- Professor is not here today

- drones are passed out and recording is given

## Video: Applications

- farmers use drones
  - gives birds eye view of land
  - multispectral camera
  - map terrain
  - process data to understand the dynamics of the terrain
  - vinyards most often because of difficult terrain
- search & rescue
- construction site evolution process
- warehouse logistics
  - location of items with drones to prevent potential injury and monitor stock items
- delivery of goods
  - proper attachement is key
  - cable attachment is a potential risk depending on situation
- entertainment
- Drones

  - use gps
  - positioning
  - uses this to create a map of a region of the farm
  - can be adapted with cage to access location for assessment and prevent damage to propellers
  - types: classification by propulsion
    - wing type
    - rotor type
  - other classification
    - military
    - weight dependence
  - capabilities
    - maneuvarability
    - flight time
      - fly up to 5 min
      - 30 min for delivery etc.
    - data gathering
      - and or send the data back to the user while in air
      - network in-able
      - onboard storage only
    - payload
      - carring capabilities for subsytems

- See links in references (in slides) for more information/applications/math-focused papers

- Next Module: we will see a Quadroter Drone and how it's currently used

- End of 1st video

- Jake (tutor for the class):
  - helps in the lab, is who designed the lab
  - Quadroter:
    - ST (company?)
    - the chip found on the drones which were passed around
      - hobby dones hard ware was compressed to the ST chip
    - FRAME
      - 3D plastic mechanical frame
        - not injection molded
        - Stratus printer ?
    - ACTUATOR:
      - motors found on the drone
      - small cheap DC brushless motor (there are brush motors but brushless is prefered)
        - single pull have no steps and are preferred
    - PROPELLERS:
      - size and weight
    - SENSORS
      - IMU: Internal measure unit
        - can check acceleration
        - gyroscope: understand self roations
        - magnetometer: for relative position
        - pressure sensor: for altitude sensing
    - COMPUTING:
      - microcontroller
      - ARM cortex
      - ST microcontroller
    - COMMUNICATION
      - Bluetooth
      - RX controller
    - POWER
      - liPo batteries
        - 5 min life
      - ESC electronic speed controler
        - have mosfets: they switch the power of the rotors onn and off to test the speed of the rotor?
    - USER INTERFACE
      - something, he was too fast
  - keywords:
    - microcontrollers

## 2nd Presentation

- presentation gives specs
- at home one can be built simply

- question posed by student:
  - what is the purpose of the tape on the ground?
    - it is a defined space for the drone, as the origin point/reference point

## 3rd Presentation

- Principles of motion and physics
- 4 motors have 6 degrees of freedom (i.e less actuators thatn dof)
  - the 6 are x,y,z, pith,roll, yaw
- Verticle motion
  - ascend and decend
  - propellers give thrust (the faster the spin the more thrust)
- translational
  - roll or pitch the drone
  - to pitch or roll we can make the front 2 propellers to move faster then the back 2
  - yall:
    - rotation in the plane
    - speed up the CW prop and slow down the CCW prop
      - math to further understand but again it's the idea of isolating roations
- Math to know
  - torque
    - the moment about a body
    - the sum of tau = I alpha
    - analogous to F=ma
    - I:moment of inertia
      - resistance of motion
  - rigid body model for the quadrotor
    - see slides for the equations

## Circuitry presenation

- Compoents
- power
- signals
- FCU: flight control unit
- Capacity = dischage \* discharge time

  - 100mA will take 65h to drain a 6500mAh battery

- discharge rate
  - max discharge = burst rate \* mAh
  - e.g.: 10C \* 650mAh will give 6.5A
  - 10C is usually written on the battery
- clock switch analogy (motors)
  - light switch
  - multipole moter (stepper motor)
  - the switch is the pwm pulse width modulation
    - duty cycle: is a period s.t the % of time that the signal is high
    - single pull motors best used with: duty cycle PWM

## Programming /Computing pt1 presentation

- software/coding
- mmaterial is lost on me

## Last presentation

- controlers on the drone and one off the drone
- in any control system we require:
  - a command to the state you want
  - a command to tell the current state
- PID:
  - commands the rotors and reduces the error between the current and desired angle
  - cannot have one PID do all 4
    - we we use several PID controllers and outputs the motor commands
  - within a PID
    - it has 2 PID's in series
    - takes in current and outputs desired rates
    - the error is given to the 2nd controller and the 2nd one is then the one that outputs the commands
    - update rate:
      - innr loop runs fater than the outer
        - this is a good convention
        - the inner loop should convege before the outer syste changes "its mind"
- Position feed back control
  - optitrack IPS: indoor positioning system
  - computes simialr to PID but relative to the space it is in to move the drone to a new position

## Info on Lab 2

- Leaning control flow of programming
  - if statements
  - loop statements
- if:
  - starts with if
  - ends with end
- condition: is it tru or false
  - e.g: given x = 2
    - if x > 4
    - print (x)
    - since this is not tru it will not print
  - see lab for a better example
- if vs switch
  - if our if blocks are 5 or more then use a switch instead
    - the compiler will use jump tables and it uses an inefficient compiline
    - switch uses hashmap
- Loops

  - while
  - fore

  - Due 10/21 next friday 6pm
