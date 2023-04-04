# ECE8 Notes 10-4

- started lecture with a video

  - we did not need to understand the video, it was a highlight to the future
  - Keywords:
    - velocity, force, load, time
  - time plays a role:
    - in acceleration and velocity but it is hidden in these
      - the dot, double dot represents derivatives d/dt (derivatives with respect to time)
      - implicitly shown with time, (you can not see the variable t)
    - time is shown in the load: f(t)
      - explicitly shown (you can clearly see the variable t)

- Notes will be typed, and should be read in accompany to the professors handwritten notes

# Lecture 4:

- Topics:

  - dynamics

- def: dynamics
  - student reponse: movement/interactions
  - prof: TIME MUST PLAY A ROLE
    - they capture the variations (over time) of the key variables and inputs of a physical object
  - e.g.:
    - 1st excersise in the lab
    - see the image drawn of a line on a (x,y) - axis
    - if we say the horizontal axis is time, and verticle axis is the key variable of a physical obj, then the plot of the line is a dynamic evolution of a key variable
- key variables:

  - Of interest:
    - translatoinal position in (x,y,z) 3D space aka (px,py,pz)
      - translational: up/down/left/right/forward/back
      - placed into a vector
      - 3D space = 3D coordinate system
      - professor draws a diagram
      - NOTE: SOMETIMES Z AXIS WILL POINT DOWN, NOT UP AND IS NORMAL
      - "tells you where in space the obj is"
    - Rotatoinal/orientation/attitude position (angles):
      - "tells the orientation in one place"
      - are relative to x,y,z positions
      - roll = phi, pitch = theta, yaw =psi
        - roll: rotation about x - axis
        - pitch: rotation about y - axis
        - yall: rotation about z - axis
      - these can give roational velocities
    - translational velocity in (x,y,z) direction
      - translational velocity = (vx,vy,vz)
        - where the subscript tells what direction the speed is moving
    - Rotatoinal velocity relative to x,y,z directoins
    - Others:
      - power
      - temp
      - ... (important limiting properties)

## Time

- is (keyword)
- time in a dynamic model description can be of two main times
  - ordinary time
    - label:(t)
    - assume all time starts at zero
    - t >= 0
    - t = [0, infinty]
    - t = [0, ... current time]
    - this time changes continuously as our world time changes
  - Discrete time
    - is a sample of time at an isolated instance
    - e.g.:
      - want to know the wheather so you check it 2-3 times a day (not every second to every day)
    - label: k = 0,1,2,3,...
      - k is a positive integer
      - is discrete counter of events that occur in my robotics system, typically associated to a computing mechanism
    - e.g.:
      - suppose that information about a range (position) sensor in my robot is available every 5 seconds
      - then we can associate the value of (k) to each such event
        - First event of sampling range
          - k =0
        - Second event of sampling range
          - k = 1
        - Third k = 3, fourth k=4, ...
      - now we can say that out system measurements evolve as a discrete time (k)
      - Assume k = 1 happened 5 seconds after k= 0 then,
      - we can also relate (k) to ordinary time (t)
        - k = 0 is associated to t_0 =0 seconds
        - k = 1 " " to t_1 =5 s
        - k = 2 " " to t_2 =10 s
        - ...
        - k = (k-th sample) is associated to t_k = k x 5 s

Return to Graph: From lab1 ex. 2a

- Professor drew another graph of a line
- y on the vertical
- time t on the horizontal
- professor adds tick marks of intances k associated to ordinary time t

  - shown in yellow/orange tick marks

- Question:
  - how can you make a quad-order? an obj with 4 propelers
  - you can spin them and cause the obj to lift upwards
- How do propelers look?
  - they have a twist/warped shape
  - as they spin they transfer "twisting/angular motion" into forward motion by moving the air away from them
- Dynamical model:
  - requires some kind of force that would cause something else to move as time advances.

# Dynamics of (most) Robotic System

- they are captured by mathematical models described by dynamic equations (aka equations of motion/ Newton's laws)
- The equations of motions are described with physics principles
- this class will not teach these, it is provided
- Profrssor references the video from class:
  - variable u: is position aka displacement (what we call vector P)

# Notes from notion:

    -  symbol of sideways (e) is "in"
    - vector in R2
    - vecotr \sidways-e R2
    - Use Latex to have a better idea
        - the command: \RR^{2} = R2, \in = sideways in
    - prof adds more commands - see his notes

# Dynamic Equations (2 types)

- 1: in ordinary/continuous time
- 2: in discrete time
- eqn = equation
- def:
  - A dynamic equatoin can be of ordinary time (or continuous/ bc time evolves continuously) type or of discrete-time (recall weather example).
  - turns out that ordinary time will give differential eqations

# Continuous-time dynamic equations (or Continuous-time models)

- these are differential eqations
- differentials define derivatives
- Def:
  - these are differential eqns that involve derivatives with respect to ordinary time (d/dt). We define the derivative of a quantity with respect to ordinary time using the symbol (d/dt) or (a dot above a variable - directly on top) see professors notes for clarification.
  - two dots above a variable means second derivative of that variable (take the derivative twice)

## Example 3: Brick and Force

- Prof: moving an object of mass (m) with a force applied to it
- Formal:
  - Consider a brick on the ground with a force applied to it creating motion in the x-direction (horizontal direction)
  - professor draws a box
  - prof draws a point to represent the center of mass of the brick (so we can consider it as a point consentrated mass)
    - this means we can focus on the point instead of the dimension of the brick
  - prof draws a force represented by an arrow to the right
    - this will drag the brick to the right
  - We want to derive a continous time dynamic eqation relating the position of the brick and the force over time

### Q: how to relate positon to forces

- Things we know about the brick on the floor:
  - mass is known
  - external force (arrow) is applied to where the mass is concentrated (point in box)
  - assumption: no friction
  - ignoring gravity because we are only moving in x and gravity affects y (vertical)
  - motion is in the x-direction due to force being in the x-direction
    - this means we only need px from the vectors we mentioned previously
  - velocity is the change of position over ORDINARY TIME
    - how to relate vx and px
      - "DiRT" D=rt "Distance = rate \* time"
    - d/dt(px) = vx
    - see prof notes to see the notation
- If vx is constant, px(t) = vx \* t
  - this is Distance = rate \* time which only is allowed if the RATE IS CONSTANT
    - aka we never "change the velocity to faster or slower"

### Newtwon's sum of forces law (physics)

- sum of forces is equal to mass times acceleration
- unpack:
  - Sum of forces in example 3 is only "the applied force on the box" = f
  - mass = m
  - acceleration is the derivative with respect to time of velocity : d/dt(v_x)
- Return to prof notes to see in yellow his formula:
  - f = m \* d/dt(v_x)
  - mass is positive and not zero, so we can divide it over
  - new formula:
    - d/dt(v_x) = f/m
  - include other equation we created:
    - d/dt P_x = v_x

# Relationship of position to force

- is the set of equtions we
- called: 2ND ORDER MODEL
  - d/dt P_x = v_x
  - d/dt(v_x) = f/m
- KEY VARIABLES:
  - P_x, v_x
- force = input
- time = ordinary time
- if force = f =1
- then d/dt(v_x) = 1
- then v_x = t (a line of slope 1)

  - because the derivative of t is 1

- prof said: we will be creating block diagrams
- converges = approaches a specific point/value
- feedback:

  - adjust the force to stear the velocity
  - the sensors give feedback on location to keep the object in the desired position

- moved to matlab
- Using command (ode45)

  - gives the ability to do differential eqations
  - gives solns.
  - see help ode45 for more

- Quiz on how to use Matlab on Thur at the end of class
