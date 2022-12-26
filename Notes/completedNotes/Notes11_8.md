---
header-includes:
  - \usepackage{enumitem}
  - \setlistdepth{20}
  - \renewlist{itemize}{itemize}{20}
  - \renewlist{enumerate}{enumerate}{20}
  - \setlist[itemize]{label=$\cdot$}
  - \setlist[itemize,1]{label=\textbullet}
  - \setlist[itemize,2]{label=--}
  - \setlist[itemize,3]{label=o}
output:
  rmarkdown::pdf_document:
    keep_tex: yes
---

# ECE 8 Robotics Notes 11-8-22

- There was no canvas zoom link. I was late this is dumb
- See slides provided by Santiago
- Limits

  - limiting the degrees of freedom limits our understanding of all the existing dynamics
  - models more closely related to the real world dynamics will provide a closer comparison

- Coppelian Sim

  - visualization simulations
  - can solve full kinematics of a system
  - can do motion planning
  - can include vision sensors/image processing for detection in (volume/space)

- video presenation (this is what Santiago wants to have us do)
  - Q: how would we model a simulation that moves around an abstruction
  - A: we install CoppeliaSim and
- Why does the drone crash?
  - A: this sim is dependent on proportional control
    - using the current and desired locatoins
    - a large error, will cause the drone to behave in an extreme way, caussing the model to crash
    - this allows us to set limitations of our sim
- Steps:

  - Make sure Sim folder is the same folder used in Matlab
  - Run sim - setup
  - Run Matlab script - position plotting
  - move the target
  - end the sim
  - matlab plots the trajectory

- Challenge, make the target move in a square
- plot the trajectories
  - plot of the target
    - the equation provided in tracking code
  - plot of the position of the drone
    - plotting file
