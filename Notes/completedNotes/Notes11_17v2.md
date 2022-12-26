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

# ECE 8 Robotics Notes 11-17-22

Recall

$$
x_{k+1} = a \cdot x_k
$$

- where all variable in this equations are real numbers
- The value of $a$ can tell us about the stability or attractiveness of our equilibrium point $x_{eq}$
  $$
  \begin{cases}
  a \neq 0 \\
  |a| <1
  \end{cases}
  $$
  Recall:
  For the cruise control

$$
v_{k+1} = v_k + \Delta \frac{-bv_k}{m}\\
$$

$$
v_{k+1} = v_k - (\Delta \frac{b}{m})v_k\\
$$

# Lecture 16

## Derivation of $\Delta$ Bounds for any $m$ or $b$

The equilibrium point is : Asymptotically stable
In this lecture, we will use the design conditions

$$
\begin{cases}
a \neq 0 \\
|a| <1
\end{cases}
$$

to assure mathematically that the equilibrium point is stable and attractive. (Asymptotically stable $x_{eq}$

RECAP from lecture 15:

$$
v_{k+1} = v_k + \Delta \frac{-bv_k}{m}\\
$$

$$
v_{k+1} = v_k - (\Delta \frac{b}{m})v_k\\
$$

$$
v_{k+1} = (1- \Delta \frac{b}{m})v_k\\
$$

Where we let $a$ be

$$
a = 1- \Delta \frac{b}{m}
$$

## Apply condition $a\neq 0$

---

$$
a = 1- \Delta \frac{b}{m} \neq 0
$$

$$
1- \Delta \frac{b}{m} \neq 0
$$

$$
\Delta \frac{b}{m} \neq 1
$$

So, given the physics parameters $b$ and $m$ we need to pick a $\Delta$ that

$$
\Delta \frac{b}{m} \neq 1
$$

or equivalently

$$
\Delta \neq \frac{m}{b}
$$

- Question:
  - why do we let $a = 1- \Delta \frac{b}{m} \neq 0$
  - Recall the model must be of this form:
    $$
    x_{k+1} = something \cdot x_k
    $$
    or
    $$
    v_{k+1} = something \cdot v_k
    $$
  - in the cruise control (something =$1- \Delta \frac{b}{m}$)
  - let $a=1- \Delta \frac{b}{m}$
  - next, we use our required condition $a\neq 0$
  - so then we get again $a=1- \Delta \frac{b}{m}\neq0$
- Question:
  - why does $a\neq0$
  - examine if our system does have $a=0$
    $$
    x_{k+1} = a \cdot x_k
    $$
    $$
    x_{k+1} = 0 \cdot x_k
    $$
    $$
    x_{k+1} = 0
    $$
  - all values wil be zero and stay zero, and these systems are not interesting to examine, so we want to ignore them

## Apply 2nd condition $|a|<1$

- take what we know about $a$
  $$
  a = 1- \Delta \frac{b}{m}
  $$
- apply absolute values
  $$
  |a| = |1- \Delta \frac{b}{m}| <1
  $$
- this is equivalent to the following, replacing $a$
  $$
  -1<a<1
  $$
  $$
  -1<1- \Delta \frac{b}{m}<1
  $$
- given $b$ and $m$ we need to pick $\Delta$ range
- We do this by solving for $\Delta$ by breaking up the inequality into two equations, the LHS

  <!-- prettier-ignore -->
  \begin{align*}
  -1< 1- \Delta \frac{b}{m}\\
  \Delta  \frac{b}{m} -1 <1\\
  \Delta  \frac{b}{m}  <1+1\\
  \Delta  \frac{b}{m}  <2\\
  \end{align*}

  <!-- prettier-ignore -->
  $$
  \Delta    <2\frac{m}{b}\\
  $$

  We can divide by $m$ or $b$ if we assume they are positive and non zero. This is the "upper bound"
  Next we do the other side (RHS),

  <!-- prettier-ignore -->
  \begin{align*}
  1- \Delta \frac{b}{m}<1\\
  1<1+ \Delta \frac{b}{m}\\
  1-1 <\Delta \frac{b}{m}\\
  0<\Delta \frac{b}{m}\\
  \end{align*}

  <!-- prettier-ignore -->
  $$
  0 \cdot \frac{m}{b} <\Delta
  $$

  $$
  0  <\Delta
  $$

  This is the lower bound

- So now, our bounds on Delta:
  $$0< \Delta  <2\frac{m}{b}$$
- Now, if we are given any $m$ or $b$ we can plug those values in and pick any $\Delta$ in this range to get a stable attractive trajectory.
- BOUNDS: To clarify
  - Upper bound: $2\frac{m}{b}$
    - $\Delta$, our step size cannot be larger than this or equal to this
  - Lower bound: $0$
    - $\Delta$, our step size cannot be lower than this (so not negative) or equal to this, so not zero.

## Switched to Matlab

- possible quiz subject
  - logical 0 = False
  - logical 1 = True

## Example 10

Consider the cruise control problem with proportional control.
We are going to plug in $u^*$ as $u_k$

![Figure of our cruise control system using friction and proportional control](images/new.png)

- recall K and $u^*$ are designed

  We want the form

  $$
  v_{k+1} = something \cdot v_k
  $$

so we get,

<!-- prettier-ignore -->
\begin{align*}
v_{k+1} &= v_k + \Delta (\frac{-bv_k + K(v_d -v_k)+ \mu^*}{m})\\
&=v_k - \Delta\frac{bv_k}{m} + \Delta \frac{K(v_d -v_k)}{m} + \Delta\frac{\mu^*}{m}\\
&=v_k - \Delta\frac{bv_k}{m} + \Delta\frac{Kv_d}{m} - \Delta\frac{Kv_k}{m} + \Delta\frac{\mu^*}{m}\\
& = v_k - \Delta\frac{bv_k}{m}- \Delta\frac{Kv_k}{m} + \Delta\frac{Kv_d}{m} +\Delta\frac{\mu^*}{m}\\
 & = (1 - \Delta\frac{b}{m}- \Delta\frac{K}{m})\cdot v_k +  \frac{Kv_d}{m} +\Delta\frac{\mu^*}{m}\\
\end{align*}

<!-- prettier-ignore -->
so we can let $a$ be,

$$
a = 1 - \Delta\frac{b}{m}- \Delta\frac{K}{m}
$$

So to guarantee stability and attractively of $v_{eq} = v_d$ we apply the design parameters to that the two conditions are met

$$
\begin{cases}
a = 1 - \Delta\frac{b}{m}- \Delta\frac{K}{m}\neq 0\\
|a| <1
\end{cases}
$$

The second condition is the same as:

$$
-1< a < 1\\
-1< 1 - \Delta\frac{b}{m}- \Delta\frac{K}{m} < 1
$$

but if we are given $\Delta$ we can then solve for the bounds of $K$.

To do: Suppose that $b, m, \Delta$ are given Find the values of $K$ such that conditions 1 and 2 are satisfied.
