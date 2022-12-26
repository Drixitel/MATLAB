# ECE 8 Robotics NOtes 10-13-22

- professor recants that the previous lecture was just a "look into the future" not a required course
- recall: Discrete Time models
- Prof. notes:
  - one week ago we had notes on discrete time models
  - see eqautions of position, velocity, delta
- question:
  - why is it discrete time
  - because it is expressed in k
  - and k is countable 1,2,3,4
  - vs t that can be 1, 1.01, 1.02, etc (decimals)
- professor referenced a graph from last week
  that shows an example of discrete time steps (dots along the line)

## Today: Trajectories to discrete time model

- Our first discrete time model

  - is given by the evolution of position $p_x$ at discrete times that is associated brick on the ground
    $$
    dp_x/dt = v_x \implies p_{x,k+1} = P_{x,k} + \delta v_{x,k}
    $$
    - where it is
    - position at k+1 "new position" = position at discrete time k + step size \* velocity at discrete time k

- Q: what is needed to calculate the rest of our positons i.e the ones we generate?

  - we need the starting position, where is it located
  - we need the starting velocity, how fast is it moveing and in what direction
  - the step size, or in general the model
    - how does current position given the previous postion evolve?
      - that is given by some physics law i.e model
  - summay:
    - Initial condition (temperature, position, etc)
    - velcity (the input from some force )
    - model of the system
    - this solves the evolution of the key variable as it moves forward in time

- Today:
  - we do 1D, then we do 2D, then 3D etc.

## Hand written notes

- for this discrete-time model we can compute the values of $p_{x1}, p_{x2},$ and so on, if we know:

  - $p_{x0}$ what we call "the initial position"
  - $v_{x0}, v_{x1},...$ and so on (the imput from a force)
  - the relationship between key variables $p_x$ and input $v_x$ (in this case), and this is what we call the model.

- General robotic systems (not just position)
  - we can treat a robotics system (robot) as a system with inputs and outputs
  - Prof.draws:
    - a square (could be any shape but square is convention)
    - the sqyare has arrows pointing in and out with the box representing the model
      - it contians an initial condition
    - for the case of $p_x$:
      - inputs are $v_{x0}, v_{x1},...$
      - the model is p*{x,k+1} = p*{x,k} + \delta v\_{x,k}
      - the output is $p_x$ where $x$ could be any desired number
        - given $p_{x0}$ we can get $p_{x1}, p_{x2}, ...$ and so on
        - see MATLAB code from lect. 5 for formal example
- relation to Quadrotor
  - the model for quadrotor depens on thrust, the user, the computer board that generates the voltages
  - we create the input and the motion of the quadroter is the output

## Return to MATLAB

- professor hints at useing loops to generate many steps
  - for or while loops
- example:

  - command: help for
  - for loop is just a program structure that allows you to repeat a desired code finite amount of times
  - for k = 1:10
  - dis(k)
  - end
  - this will display 1,2,3,4,5,6,7,8,9,10

- the code for the matlab example will be posted in canvas

## Errors

- professor emphaized when you run a code you get a red error in he terminal
- read it:
  - it gives the file with the issue and the line where the code is giving a prolem

## Code: PositionDiscreteTime2.m

- We spent time attempting to create a for loop and generate a graph
- the professor adds the code to the file and states he will keep the convention of the notes

  - for k = 1: N % where N is defined before as 100 (k = sweep variable)
  -     % calculate the trajectory for model given
        % paste the model
        px(k+1) = px(k) + Delta * vx;

- note p(0) is never an entry, every vector starts at 1 p(1) = 1st element in the vector

- spent the remainder of the class doimg Matlab, see his file PositionDiscretetime2.m

## TUESDAY

- did in class today, we did the trajectory of px
- next we will consider px and py 2 dimensions
- Q: can we plot them? - we will try this next week it's not required but it's suggested.
- we learn next week, how do we design our velocity and postion so that we can create the control algoirthm
- Quiz on Tuesday
