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

# ECE 8 Robotics 11-22-22

- Today is the last zoom instruction
- review lecture is on Friday during office hours and it will be Hybrid
- The next lectures are in the lab
- Friday,Sat,Sun of this next week there are office hours to complete lab 4
- OH 1hr per day (see canvas for times):
  - Tomorrow
  - Friday
  - Saturday
  - Sunday
- Similar set up for the final

# Lecture 17

- Question from Lecture 16
  - Find a range for $k$
  - Suppose that $b, m, \Delta$ are given Find the values of $K$ such that conditions 1 and 2 are satisfied.
    $$
    ? \quad<K< \quad?
    $$
  - what are the upper and lower bounds
- Our previous equation was:
  $$
  -1< a < 1\\
  $$
  $$
  -1< 1 - \Delta\frac{b}{m}- \Delta\frac{K}{m} < 1
  $$

## Solve for $K$

- First we solve for arbitrary $K$ by leaving $b,m,\Delta$ as variables
- At the end of lecture 16 we posed the question asking for the appropriate range of $K$ when $b,m,\Delta$ are given. To find the range of $K$ we proceed from example 9:

- Bound on the Left:
  <!-- prettier-ignore -->
    \begin{align*}
  -1&< 1 - \Delta\frac{b}{m}- \Delta\frac{K}{m}\\
  \Delta\frac{K}{m} -1 &<1-\Delta\frac{b}{m} \\
  \Delta\frac{K}{m} &<1-\Delta\frac{b}{m} + 1\\
  \Delta\frac{K}{m} &<2-\Delta\frac{b}{m}\\
  K &<\frac{m}{\Delta}(2 - \Delta\frac{b}{m})
  \end{align*}

<!-- prettier-ignore -->
- Bound on the Right:
<!-- prettier-ignore -->
  
  \begin{align*}
  1 - \Delta\frac{b}{m}- \Delta\frac{K}{m} &< 1\\
  1- \Delta\frac{b}{m}&<1+\Delta\frac{K}{m}\\
  1- \Delta\frac{b}{m}-1&<\Delta\frac{K}{m}\\
  -\Delta\frac{b}{m}&<\Delta\frac{K}{m}\\
  -\frac{\Delta b}{m}\cdot\frac{m}{\Delta}&<K\\
  -b <K
  \end{align*}

<!-- prettier-ignore -->
- Full Bounds:
  $$
  -b <K <\frac{m}{\Delta}(2 - \Delta\frac{b}{m})
  $$

## In class Exercise

- Given the discrete time system:
  <!-- prettier-ignore -->
  \begin{align}
  x_{k+1} = Qx_k + bu_k
  \end{align}
  <!-- prettier-ignore -->
- Controlled by the proportional controller:
  <!-- prettier-ignore -->
  \begin{align}
  u_k = K(x_d - x_k) + u_*
  \end{align}
  <!-- prettier-ignore -->
- Where $x_d$ is the desired reference value for $x$, $K$ is the proportional gain, and $u_*$ is a controller parameter inducing the desired equilibrium point.

---

1. Design $u_*$ so that the equilibrium point $x_{eq} = x_d$

- Answer: let $x_eq = x_k = x_d$ in the previous equations (1)(2)
  <!-- prettier-ignore -->
  \begin{align*}
  x_d&= ax_d + bK(x_d - x_d) + u_*\\
  x_d &= ax_d + u_*\\
  u_* &= x_{d}\frac{(1-a)}{b}
  \end{align*}
  <!-- prettier-ignore -->

---

Work:

- if this is what we want, then solving for $u_k$
  <!-- prettier-ignore -->
  \begin{align*}
  f(x_{eq}) = ax_{eq} + bu_k &= x_{eq}\\
  x_{eq}(a-1) + bu_k &= 0\\
  x_{eq}(a-1) &= -bu_k\\
  x_{eq} &= \frac{-bu_k}{(a-1)}\\
  \end{align*}
  <!-- prettier-ignore -->

<!-- prettier-ignore -->
\begin{align*}
x_{eq} &= \frac{-bu_k}{a-1}\\
\leftrightarrow\\
u_k &=- x_{eq}\frac{(a-1)}{b}\\
u_k &=x_{eq}\frac{(1-a)}{b}\\
\end{align*}

<!-- prettier-ignore -->
<!-- prettier-ignore -->
- next we plug in $ u*k = K(x*d - x*k) + u_*$ and solve for $u_*$


  <!-- prettier-ignore -->
  \begin{align*}
  u_k &= K(x_d - x_k) + u_*\\
  u_k &= K(x_d - x_k) + u_*\\
  u_k &= K(x_{eq} - x_{eq}) + u_*\\
  u_k &= u_*\\
  \end{align*}
  <!-- prettier-ignore -->
- therefor if $x_{eq} = x_d$ we get
  <!-- prettier-ignore -->
  \begin{align}
  u_* = u_k = x_{d}\frac{(1-a)}{b} \quad b\neq 0
  \end{align}
  <!-- prettier-ignore -->

---

2. Design $K$ so that the equilibrium point $x_{eq} = x_d$ is stable and attractive, were $a,b,x_d$ are given

- To find $K$ we need the system in the correct form
  $$
  x_{k+1} = Qx_k + bu_k
  $$
- Answer: $K \neq \frac{a}{b}$ and
  $$
  \frac{a-1}{b} <K<\frac{a+1}{b}
  $$

---

Work:

<!-- prettier-ignore -->
\begin{align*}
x_{k+1} &= Qx_k + bu_k\\
&= ax_k + b(K(x_d-x_k) + u_*)\\
&= ax_k + bKx_d - bKx_k + bu_*\\
& = (a-bK)x_k + bKx_d + bu_*
\end{align*}

<!-- prettier-ignore -->
- Let $a' = (a-bK)$
- apply conditions
- Condition 1: $a'\neq 0$
  <!-- prettier-ignore -->
  \begin{align*}
  a'&\neq 0 \\
  \implies \\
  a-bK &\neq 0\\
  -bK &\neq -a \\
  K &\neq \frac{a}{b}
  \end{align*}
  <!-- prettier-ignore -->
- Condition 2: $-1<a'<1$
  $$
  -1<a'<1
  $$
  $$
  -1<a-bK<1
  $$

## Other control strategies (FYI)

Proportional control is just one type of control strategy for robotics. There are many others!

- We used: $u_k = K(x_d -x_k) + u_*$
- e.g.: Proportional - Derivative Control (PD control)
  - In PD control we add an extra term that incorporates the derivative of the error signa
    $$
    u_k = K_p(x_d -x_k) + u_* + "K_d(\dot{x_d} - \dot{x_k})"
    $$
  - where $K_p$ is proportional gain
  - where $K_d$ is derivative gain
  - NOTE: this is discrete time so derivative is not always possible, so we implement the following approximation
    - Given a function of time $g(t)$ its derivative is
      $$
      \frac{dg(t)}{dt} = \lim\limits_{h\rightarrow 0}\frac{g(t+h)-g(t)}{h}\\
      \approx \frac{\xi_k - \xi_{k-1}}{\Delta}\\
      = \text{first order approximation of }\frac{dg(t)}{dt}
      $$
  - more info on this google: `NUMERICAL RECIPES `

![Figure showing the proportional and derivative control diagram ](images/kkk.png)

- Proportional Integral Derivative Control
  - K_p: proportional gain
  - K_d: derivative gain
  - K_I: integral gain

## End of class

- Making sure programs work for lab
- Lecture 13 has all the notes needed for this lab
- Lecture 13 has code for the circle movement
