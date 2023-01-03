# 9_27 NOTES:

- Changed to typed notes because we moved to using MATLAB
- Notes will be written in cronological order

1.  Watched a brief video tutorial on MATLAB (see video), it was never slowed down so we assume it was just used as an introduction

    `Clarified`: this video is what is expected for us to know by the end of the quarter, but not expected now

2.  Professor Mentioned: at the end of class he would work to have eveyone up-to-date on MATLAB

3.  Actuator: motors/(things that move in the real world)

4.  Reminder: Every programing tool requires understanding of synax (naming convention), and understanding how to take what you know in (coding/science/etc) and apply it to your program.

5.  Passed around a notbook where all students wrote thier name and "Favorite Robot" i.e Rumba, cellphone

6.  Prof spent time helping students install MATLAB

    - When installing be sure to add the following packages
      - controls system tool box
      - Image processing toolbox
      - Robotics system toolbox
      - Symbolic toolbox
      - Similink

7.  Octave (GNU) open source

    - If you continue using MATLAB after you graduate and no longer have acces to free software install Octave this is free

8.  The remaining of the course is done on MATLAB he is focuing on specifics, I'm currently downloading the software as he continues on a MATLAB tutorial.

9.  Covered:

    - adding 2 numbers
    - `>> 1+1`
    - ans = 2
    - created a variable named `ans` and it took on the value 2
      - If you do not asign your equations then the variable `ans` will always be overwritten
    - Command: `help ___`
    - gives information on how to use ceratin functions in MATLAB
    - e.g.: `help sin`
      - gives info on the function sine and how to use it
      - clink on the hyperlinks to see how to use sin to plot things, (you can copy code available and praste it into your code to see how it works)

10. In `Workspace`
    - Say you defined a variable `x = -pi:0.01:pi;` (given)
    - then in `Workspace` the variable `x` will appear
      - Value: 1x629 (629 is given and a result from the interval)
      - 1x629 = a matrix, 1 column and 629 elements (rows)
    - click on it to see the many different values that appear
    - ` -pi:0.01:pi` is an interval
11. `x = -pi:0.01:pi;`: is a vecotor
12. We are now rerunning with:

    - x = pi:0.0001:pi, this increased the number of steps
    - that means 0.0001 is the size of the step you might want

13. We are creating a script
    - select `new script `(new live is for online only - do not select)
    - in the resources sometimes there are (open live scripts) you can take that code and use it if it's easier
14. Code:
    % Hello world example for lec. 2 --ECE Fall 2022

    % From the help in Matlab sine function we test the following code:

    % define the range of the argument of the sine fuction
    x = -pi: 0.01:pi; % creates (row) vector x from -pi to ...
    he is typing very fast, and this script will be included in lect notes by him so I will no longer write this down.

    the symbol `%` allows you to use comments and they are not processed by the complier (the program)

    the command `xlabel('write the label you want)`

15. Save files (but we must know exactly where we are storing the files to use later)

16. Select Arrow (`Run`)

17. Nothing popped up when he ran the code, therefore we use:
    (DEBUGGERS- PLACE THIS AT THE TOP OF YOUR SCRIPT B4 ALL WORK EVERY TIME) - close all; % this closes all open windows - clear all; % deletes the Workspace variales

        THIS EFFECTIVLY RE LAUNCHES MATLAB SO YOU HAVE A CLEAN ATTEMPT AT RUNNING THE SCRIPT (CODE)

18. What the semi-colen does (`;`) which is at the end of most all of our lines of code
    - it surpresses output
    - e.g: maybe we want to create `x` (some variable) but I do not want to see all the computation
19. Command `clc`: Clears your `Command Window`
20. Prof proceeded to define things on paper then moved back to Matlab to define variables
    - three variables defined
      - error_speed
      - ref_speed
      - current_speed
      - error_speed = ref_speed - current_speed
21. Prof moves back and forth between paper and Matlab
22. Command window has a (bottom arrow that stores your previous commands)
23. Professor is creating a new script to show the vectors of a rover as it moves in 2 dimentions (Px,Py) (a flat plane) as time moves forward

24. See script to see that commands used to show evolution of vectors
25. After creating the script the professors verified the Workspace variable with the equation he used in the script (just addition)
26. Announcement HW:
    - Plot the points that were found in the script mentioned previously on a graph in matlab
    - Hint is given in the script
    - syllabus will be uploaded today
    - Office hours are posted
    - all the remaining details are in canvas
    - email the professor if none of the hours listed (office hours) if different hours are needed
    - quizzes after each class
    - practice midterms will be given
    - Special Lectures offered - Nov 8: on Zoom and try to have a labtop - Dec 6 & 8: will be real world experiments
      (`all in syllubus if more info is needed`)
    - Makde sure to have `ECE8` in your email to get a quick response
      - if you do not it may not be responded to right away
    - Exams = CLOSED NOTE
