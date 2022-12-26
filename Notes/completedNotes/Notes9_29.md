# ECE 8 Robotics Date: 9-29-22

- ^: superscript
- \_: subscript

* Started class looking at everyone's plots - I guess the homework was recommended? not sure
* Today a key point will be a vectors and matricies
* The professor proceeded to hand written notes, which I will suplement with typed notes

# A vector

- Comments from class: a quantity (number) with a direction
- Imaage 1 (left):
  - In 2-dimensions (2D)
  - we have a 2-d vector
  - with two components (vx: in x-dimension), (vy: in y-dimension)
    - x: horizontal
    - y: verticle
    - x and y are real numbers (any number)
      - e.g.: x = 3, y = 2 or x =0, y =500, etc.
- A Real Number:
  - any number from (-infinity to + infinity)
  - infinity is not an actual number
- Image 2 (right):
  - In 3-dimension (3D)
  - same x and y dimension (components)
  - but one more comming out is z-dimension
- The brackets with (vx,vy) or (vx,vy,vz) is the notatoin of a vector in coloumn form
- the R^2 and R^3 are ways to represent the Real number dimension in short hand, it's also the space where the vecotors "live"
- n-dimensional:
  - this is just adding a new dimension up to any number
  - but we can not visualize anything beyond 3
  - however a normal 4D vector is (x,y,z,t) where x,y,z are positions in space and t is time
  - he has a yellow coloumn vecotor represented in his hand written notes
  - Important we will use maybe up to 4D but more common 3D vectors
- Vectors:
  - a vector is a collection of finite collection of real numbers
- Boxed notes:
  - A vector v has magnitude (size/length) and orientation (where the arrow points)
  - Formulas given for n-dimension but we only need up to like 3 for magnitude
  - orientation: review trig
    - Important: to find the angle itself
      - NOTE: sin(<v) is NOT the angle
      - <v is the angle
    - to get it use inverse sine, inverse cosine, inverse tangent
      - aka: arc sine, arc cosine, arc tangent
- Triangle drawing:
  - hypotenous : Pathagorean theorem = sqrt(vx^2 + vy^2)
  - The magnitiude is the hypotenus
  - refresh some trigonometry of right angle triangles
  - Angle of the vector: angle of the triangle
    - use sine, cosine, tangent
    - Professor notation: < v , angle(v)
      - this is "the angle of the vector v"
    - the professor gave the formulas
      - these formulas work for all right triangles
- Example: Consider again the vehicle on the plane

  - we are in 2D
  - Px, Py are the lines of space
  - but current px and current py are the current positions of the vehicle
  - We can take those current positions and create a position column vector in 2D
  - Again since we can draw all vectors 3D,2D,1D this means we can draw the vector p= [px,py] in R2 (R2 the plane space)
    - it will look like a line
  - Professor noted:
    - the vehicle can change the slope of the line and size of the line if it is moved

- Example: This is in 3D, with lines labeled px,py,pz (BRICK)

  - a 3D brick is drawn
  - a dashed box is also drawn
  - center = center of mass (the perfectly balanced point)
  - the 3D vector is P= [px,py,pz]
  - the brick is rotated in 3D but the center of mass is the same, as in the vector position is the same
  - switched over to write out by hand the 6 dimensional vector

- Moved to Matlab

  - learned to plot a vector
  - command:
    - plot(X,Y, 'o')
    - add marker with 'o'
    - double click axis bar to get properties
  - see script done in class for more details
  - use command man to get more information

- Matrices:
  - is composed of multiple column vectors
  - the 6D vector made previously is considered a "snap shot" of the vehicle
  - if we have many "snap shots" then we can put all of them (all of the column vectors) in to a matrix side by side.
  - Notation:
    - matirx is now labeled A with entires little a
    - entry notation: (a_12)
      - the first number is the column the second number is the row in the matirx
      - so 1 = column 1
      - and 2 = row 2
    - New space is R^{nxm} where,
      - n = number of rows
      - m = number of columns
  - Uses:
    - A large matrix will be many "snap shots" (columns) in time for the vehicle when it moves in time.
- Usefullness "example 2" in hand written notes:

  - Consider the matrix defined as,
  - A = ... ( a 2 x 2 matrix) this means we are in a plane (in 2D)
  - Next he shows vector-Matrix Multiplication
  - Look up if not recalled, might also be called matrix multiplication
  - The matrix - what it does
    - it can stretch the vector
    - rotate the vector
    - translate the vector (move side to side/ up or down)
    - or all of the above at the same time
    - and it can do all of the above depending on what the matrix A is made out of (what kind of entires it has)
    - google: type of matricies that can do either specifically rotate, reflect, etc (they are specific)
  - After taking our vector and multiplying it by the matrix A we will get a new vector in a new orienation (or size), we can then plot this new vector to see the physical changes
  - The professor draws out the old and new vecotor in 2D

- Switched back to Matlab
- Announcement:

  - HW: plot the matrix data: p-data
  - Guess: use a forloop or an animation
  - Best guess: a forloop to plot all the vectors on a plot at the same time
  - the script will be uploaded to canvas

- Lab announcement

  - Files needed for lab 1

    - ece8 .pdf file
      - full instructions to the lab
    - .mat file
      - this is the file that has all the data as part of one of the exsercises

  - Lab is due next Friday, Date/time are on pdf
  - Submission:
    - found in assingments Lab 1
    - format is started in lab .pdf file
