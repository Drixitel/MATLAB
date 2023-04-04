# ECE8 Robotics Notes 10-20-22

- See file: PlanarPositionDiscreteTimeWithStepInput.m
- Class begins with MATLAB
- Prof. changes file and requests:

  - to have desired points

- prof.Q:

  - how do we assign the desired positions?
    - as simple as letting some variables be those values
    - px_final = #
      - prof. Notation: pxd = #
    - py_final = #
      - prof. NOtation: pyd = #

- Prof plots the initial and desired final positions on the graph in the MATLAB file
- Result:
  - the robot missed the desired position
- Prof Q:
  - What can we do the code to make the robot get to the correct position?
  - student: slope
  - prof: we can adjust vx (velocity in x) to adjust the robots speed and direction
    - this requires the angle
- Prof Q:
  - what can we do if the robot is close to the target?
    - we can adjust the allowed movements to stay within the target distance

# Handwritten Notes Lecture 9

- Today we will learn to design the input to 2 discrete-time model to reach a target location
- Recall:

  - In MATLAB, we obtained the following position plot in the last lecture:
    - see prof. notes where he draws a graph of px vs py
      - where px is on the horizontal
      - py is on the vertical
      - red line begins at 1 and moves upward to the point (2,1)
      - The line/path is the result of applying velocity inputs
    - prof add two graphs to the position graph
      - vx vs k
      - vy vs k
      - where vx and vy are velocity in the x and y directions respectively
      - these graphs look like straight lines because they represent constant motion

- Prof Q:

  - what is k=0, where is the time on these graphs?
  - the position on px vs py (starting position)
    - (px,py) = (1,0) is also written like this:
      - (px(k),py(k)) = (px(0),py(0)), (1,0) at k=0
  - professor connects how the velocity graphs correspond to the position graphs
    - just by drawing lines to both graphs
  - To the planar Model
    - planar = plane model, working only in 2D e.g. (px,pk)
    - px,k+1 = px,k + delta + vx,k
    - same but in y
  - Given desired positions (pxd,pyd)

    - find inputs vx,k and vy,k so that (pxk, pyk) reaches pxd pyd at some discrete time k
    - aka: for some k
      - px,k = pxd
      - pyk, = pyd
    - aka: The Robot reached it's gaol position
    - e.g.: the drone reaches the height you want it to reach

    - Goal:
      - figure out a way to reach a particular point

# Solve the Q: reaching a particular point

- prof. returns to MATLAB
  - There is a desired position in the code
  - we know our point is located in the time region where k = 50
    - we want to change the velocity in this location so that vy = 0 (no more vertical motion) and vx= not zero
      - this will let us more to the right in the horizontal direction
- Professors adjusts his code to include these adjustments

  - he changes the conditions in the code (in an if statement)

- Difficult to write what he is doing but in summary:
  - in the code we have several if statements that control the speed in x and y directions
  - we keep adjusting their values and conditions to change the path of the robot
  - this is only possible by checking the result position graph with looking at the velocity graphs
- Simulation Horizon:
  - \# of steps "N"
    - We can reduce the number of steps to make the robot stop operating
- To stop the robot:
  - we can adjust the horizon or create another if statement to turn all the velocities to zero if the position is near the target

# Issue with previous method

- this method does not work for any initial condition
- it only works for the specific one we fiddle around with

- Q:

  - What would we do if we needed to go to a particular location to be able to get to that location?
    - "what is the 1st thing to do to get to the door?"
    - examine/assess the desired location
    - plan the route
    - this is called the error signal

- Error signal

  - determine the error between where you are relative to the door
  - if error is zero then this means we are at the desired location.
  - this will tell us/robot how well we're doing at reaching the location
    - the larger the error the father way we are and the worse we are doing
    - the close the better and this is a smaller error
  - Doing this will remove the fiddling we do
  - ONce the error is defined we can then define the px and py inputs
  - delta = 0.01
  - pick initials
  - set counter
  - create a for loop

    - error in x = px desired - px(i) "current position"
    - same for y " "
    - define velocity inputs
      - vx(i) = error in x
      - vy(i) = error in y
        - now add the issue for a different initial condition - vx(i) = error in x - vy(i) = error in y
    - generate the rest of the values px(i+1)
    - increase the counter
      - k(i+1) = k(i) +1

  - we could also store the error
  - main difference:
    - the velocity is now based on the starting and end point

- Student Q: Why did he pick N =600 vs N = 60

  - Answer:
    - N represents how many samples we do, or steps we take fully
    - when N is too low we may not get to the position but the direction will show it tried
    - with too many N it would still get to the location but we will have more sample points
      - more dots on the graph
    - Conclusion: the number of N can be anything, just need it to be enough to reach the desired point

  # Summary in Prof. Handwritten notes

  - The class is RECORDED?? I HAD NO IDEA
    - During our work in MATLAB we tried to find vx,k and vy,k to steer
      - px,k to pxd
      - py,k to pyd
    - though, this will require multiple tries. More importantly this will require that we recalculate vx,k and vy,k if either px,d py,d or px,0 py,0 change

  # Introduction to feedback

  - See diagraph in prof notes

    - consider the planar model
      - px,k+1 = px,k + delta vx,k
      - py,k+1 = py,k + delta vy,k
    - and, desired positions
      - pxd, pyd
    - we compute the input velocities vx,k and vy,k using the error signals
    - ex = pxd - px,k
    - ey = pyd - py,k

  - See boxed diagram in prof. notes (puts the model equations in a box)
    - Controller:
      - this is our assignment of the error "quality assignment"
      - vx,k = ex and vy,k = ey
    - the box diagram is called a CLOSED - LOOP system
      - because the code we used "shown with lines in the diagram" feeds back the current positions px, py to the inputs

  # Changing the code to have one with for-loop and one with while-loop

  - See MATLAB files for examples from today's lect
  - Wile loops
    - while expression
    -     code to run  ! this code is executed so long as the expression is true
    - end

- Tolerance
  - set a level of closeness parameter
  - say we want a very small error basically zero
    - we can set a tol = 0.0001 "desired closeness"
      -e.g.: while ex >= tol && ey >= tol ! while the tolerance is too large keep running
      - where && means and (both must apply)
      - review Boolean logic for more insight
      - A && B means:
        - work but only if both A and B are true
      - ex and ey can be negative depending on position so we wil need to use
        - abs(ex) to remove negatives from ex and just compare the size to tol
