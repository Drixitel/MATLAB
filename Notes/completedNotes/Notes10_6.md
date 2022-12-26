# 10-6 notes

- professor passes a notepad for names and favorite equation
- open Matlab and asks students about what each item does
- Reminds the class of the quiz at 4:30 regarding matlab
- Reminds the class of HW due tomorrow at 6
  MATLAB
- row vector as a range [# #]
- Using ode to solve the differential equaiton
- professor discussed how the plot function works use help if need to review
- to find more about ode also use help and examples
  - the equation the professors is using is literally from the help examples
- How differential eqations work:
  - the solution is always an integration
  - e.g.: ydot = 1 is
    - the slope of 1
    - velocity is 1
    - so the solution is a line
- recall:
  - points seen on a graph are data points "instances"
  - aka a discrete time model
  - a discrete time model does not require a differential equation model

HANDWRITTEN NOTES:

- We left off on a sum of forces lecture, i.e. the brick on the floor
- recall
  - a force can cause motion
  - the direction of the force will always be the direction of motion i.e the direction of velocity

NEW NOTES: Lecture 5

- Discete time models - used from now on to capture the evolution of key variables i.e. (position, velocity, etc.) of robotic systems
  Example 4:
- we take the equations from the previous lecture
- Prof:

  - Consider the differential equations governing the position of the brick in terms of velocity, which is given
  - dpx/dt = vx

- Prof clarifies: - Notes that given a velocity signal vx we can calculate the positoin trajectory px as a function of time - px = vx \* t - assuming vx is constant - to do this we conisder the MATLAB EXAMPLE - see PositionODE.m file from the professor - ode45( @ (t,p_x)) vx, tspan, px0) - ode45 (@(t,p_x)1, [0 1], 1) - to calculate px we need an INITIAL CONDITOIN - this is px0 = 1 - we chose 1
  SWITCH TO MATLAB
- makes several chnages to file and jumps between notes and file

- Prof. Draws a graph of px vs t[s]

  - on the verticle we mark 1 and 2
  - on the horizontal we mark 1
  - we draw a line emenating from 1 on the vertical
  - draws a line below the graph that represents discrete time k that matches with every discrete point "data point" on the graph
    - on the graph we mark px,1, px,2 and so on that corrolate with discrete time k

- note:
  - MATLAB calculates px in discrete time instances
  - no technology can calculate continously, continuity is just a math concept
  - everything must be discrete
  - MATLAB calulates
    - (px,1), (px,2) , ... ,(px, k)
    - px,1 comes from the first initial condition px,0
    - the only way the system can calculate all possible px,k values we need the model (equation)
    - Prof, it calculates all the px,values from the discete time model of the Brick (we are still thinking of the brick)
- recall:
  - discrete time = k

Q: What is the discrete time model?

- Taylor series
- Forward euler model (IMPORANT)

  - 1st order approximation model = a linear model

- What are we looking for? :
  - we look for a way to relate, in the brick example,
    - px,0 to px,1
    - but how?
    - Also want:
      - from px,1 to px,2 and so on
  - Also we would want to propatage forward in discrete time the key variable px
  - ANSWER:
    - a for loop
    - the forward euler model
- Prof:

  - There are many ways to do this, and a simple method is the so-called
    - FORWARD EULER MODEL
  - In simple words, given a step size \delta defining the amount of seconds elapsed between calulations of px, the forward Euler method for the position of the brick example leads to the following relationship between

    - px,0 and px,1 and so on

  - px,0 ... px,1
  - px,1 ... px,2
  -      ...

- Prof draws a plot of px vs t (time):
  - delta is a chamge or a difference in time, so it has units of seconds
  - equation:
    - px,1 = px,0 + \delta vx, 0
      - this is a fancy way of DIRT
      - Distance = rate \* time
      - px = p0 + vx \*t , but this time p0 is just our initial step
  - see notes for full diagram of steps
- Prof. Notes:

  - For the brick trajectory, the forward Euler method leads to
    - px, k+1 = px,1 + \delta \* vx,k
    - aka fancy distance equation

- Question asked: does \delta ever change with k?

  - Answer: yes it can be \delta, k but for this class we will assume \delta is constant

- Prof. Recaps:
  - Important: Velocity is the derivative of position
  - the plot we have is the case where velocity is equal to 1
  - we have a function on matlab that can solve it, but to make it simpler is to make an equation that maps one point to another point
    - that map is the forward euler model
      - which takes the differenaial eqn and takes it and creates a discrete time model, like the one we just mentioned
      - this can be done in every dimension and it is identical, the only thing that changes is the subscrip from x to y or to z
- Prof. In simple words:
  - Forward Euler does the following:
    - given a continous time model (an ode/differential equatoin) of our robot of the form,
      - \ydot = f(y,u,t) : a function that has y,u,t appearing in it explicitly (this is also a way to say velcity)
    - along with an initial condition y0
    - and a 2nd input u(t)
    - it calculates a discrete trajectory y via the following discrete time model
    - y is a key variable
    - y becomes y,k+1 = yk + \delta \* f(yk,uk,k\delta)

SWITCHED TO MATLAB

- created a new script PositionDiscreteTime.m
- To see the points on your graph we add the sytle '\*' to the plot() function

QUADROTOR

- Example 5
  - see drawing of quadrotor in professors notes
  - 4 propellers
    - each one can generate a force, labeled with F_1, F_2 and so on
  - has mass m
  - Can create a model for the velocity of the quadrotor and it is given by Newton's law
    - the sum of foces is equal to the mass times the time derivative of the velocity
    - will also have gravity
    - reiew some physics to better understand the motion before the next lecture
