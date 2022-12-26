# ECE 8 Robotics Notes 10-25-22

- Notes to memorize from previous quiz:

  - Types of Dynamic eqautions
    - Ordinary time (t)
    - Discrete time (k)
  - Velcotity equation - given
  - Forward Euler Method
    - See lecture 10-6-22
      > $p_{x,k+1} = p_{x,1} + \Delta \cdot v_{x,k}$
    - Example:
      - Given: $v_{x,k}= x^2$, $\Delta >0$, and input $u(t)$ some forcing function?
        > Euler: $x_{k+1} = x_k + \Delta x^2_k$
  - Dynamic Equation of Position and Force
    - $f= ma$
    - $f = m \frac{d^2p_x}{dt^2}$
    - or dot notation
    - $f = m\dot{v}$, $\quad\dot{v}= \frac{dv}{dt}= \frac{d}{dt}\frac{dp_x}{dt}$

- Midterm
  - paper exam

# Lecture 10

- introduce: proportional control
  - a variation of the pervious class

## Example 7 : Cruise Control System

- see diagram in handwritten notes of a car ona hill
- movement to the right has a label
  - $v_k$
  - Given desired velocity $v_d$ design an algoithm that gauruntes tht the vehicle velocity $v_k$ converges to $v_d$ even in the precense of a terrain change. In particular see diagram, where the hill is the terrain change.
  - inital incline is zero
  - going up the hill = positive incline
  - going down the hil = negative incline
- Converge
  - meaning we get close to a desired value
- To solve this problem
  - finding an algorthm
  - Soln:
    - we design an algorithm that measures velocity $v_k$ and adjusts the gas pedal or the break pedal appropriately to attain $v_k$ converge to $v_d$ "get as close as possible"
- Q: Guess what would be placed in out closed loop system diagram
  - A: professor redraws the diagram "velocity model"
  - loop: in == velocity model == out
    - in : desired speed $v_d$
    - out: current sppeed $v_k$
    - loop out $v_k$ into in $v_d$ by using error equations
      - $e = v_d -v_k$
    - in the velocity model:
      - recall: $\frac{dp_x}{dt} = v_x$
      - use forward Euler to create the model
      - see next notes to find this
    - Red box: PROPORTIONAL CONTROL
      - $k(v_d - v_k) + u*$
      - wher $u*$ is an input
      - design $u*$ such that we have the steady state input or fixed input
        - the control algorithm will only give a constant input
- Learn how to jump between forward Euler and continuous time model for any system

## Velocity model

- the model we will use is obtained by modeling the change of velocity as a function of several parameters playing a role in the problem set up
- in this case we will use the following discrete time model
  > $$ v\_{k+1} = v_k + \Delta (\frac{-bv_k +h_k + u_k}{m}) $$

where,

- $v_k$ is the forward velocity "speed" "current"
- $\Delta$ step size
- $h_k$ represents the incline of the road
  - so if $h_k = 0 $ the road is flat
  - if $h_k>0$ is positive, then we are in downhil
  - if $h_k<0$ is negative, then we are uphill
  - $m$ mass of the vehicle
- $u_k$ is the force i.e. the control
  - if $u_k>0$ we are increasing the speed
    - gass pedal is pressed
  - if $u_k<0$ we are decreasing the speed
    - break pedal is pressed
  - if $u_k=0$ then no effect on speed
- $-bv_k$ some sort of resistance
  - the value $-b$ will remove speed until the vehicle stops moving, unless we have a stronger force that overcomsit
    - for now, we will assume $b$ is a constant
  - friction
    - e.g.:
      - contact with ground
      - air affects
      - water
      - grit from the road
- Kinetic Energy
  - $K = \frac{1}{2}mv^2$

## Handwritten Notes

- professor completes the closed loop diagram by pluggin in the velocity model
- we can only control the $u_k$, so we call it the control input
- disturbance variables: $h_k$ incline
  - this is shown as an input but it does not loop, it's only in (not out)
- Stage one:
  - code the work done so far

## Matlab

- simulate the previous system for

  - $\Delta = 0.01$
  - $b$ = 0.5
  - m = 20
  - $h_k = 0 $ for all k
  - $u_k = 0 $ for all k
  - $v_0 = 10$
  - $v_d = 56$
  - plot $v_k$ vs $t$
  - for 10 seconds
  - horizontal is 0, $\Delta$, $2\Delta$, ... 10 $\Delta$

- we obtained $v_k$ decreases to zero as expected
- Now, let's make the vehicle reach $v_d$

## Control system

- To achieve convergence of $v_k$ to $v_d$ we need to properly design $u_k$.
- One way is through proportional control (P control)
- the structure is the given eqn.s in the newest closed loop model the prof has drawn
- Namely, the input $u_k$ is assigned as follows:
  > $$u_k = k (v_d - v_k) + u*$$
- k : control gain
- $v_d- v_k$ is the error
- $u*$ is the constant that induces $v_k = v_d$
- To design $u*$, notice that if $v_0 = v_d$ then we have
  > $$v_{k+1} = v_k + \Delta (\frac{-bv_k + u_k}{m})$$
- where $h_k = 0$ for all k
- Then for the k=0 case
  > $$ v_1 = v_d + \Delta (\frac{-bv_d + u_0}{m})$$
- if $u_0 = k (v_d - v_0) + u* = u*$

  > $$v_1 = v_d + \Delta(\frac{-bv_d + u*}{m})$$

- if we want v_1 = v_d then
- vd = vd + delta(-bvd + u\*/m)
- we want -bvd + u\*/m = 0
  - u\* = bvd
- the correct choice
- To design k, for now, try k>0 and k<0 to achieve convergence to vd

Thursday: Review for 1hour, recorded
End of Thur, Quiz on previous lecture

- familiarize the closed loop diagram
  Tuesday: Midterm, just bring a pen/pencil
  Review: lectures, be capable to write code, discrete to continous models, trajectory, inputs, sensors, quizes
  Friday:
