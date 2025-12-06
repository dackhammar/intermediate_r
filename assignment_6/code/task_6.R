# ----
# Task Functions, Loops, Conditionals and Classes
# Intermediate R
# Johan Blixt Dackhammar
# ----

# ---- Create three S3 class objects ----
obj1 <- list(x = 1)
obj2 <- list(x = 1, y = 1)
obj3 <- list(x = 1, y = 1, z = 1)
class(obj1) <- "Point1D"
class(obj2) <- "Point2D"
class(obj3) <- "Point3D"

# ---- Create a generic point method ----
point <- function(...) {
  UseMethod("point")
}

# ---- Create three regular methods ----
point.Point1D <- function(point1,point2) {
  return(point1$x - point2$x)
}
point.Point2D <- function(point1,point2) {
  return(sqrt((point1$x - point2$x)^2 + (point1$y - point2$y)^2))
}
point.Point3D <- function(point1,point2) {
  return(sqrt((point1$x - point2$x)^2 + (point1$y - point2$y)^2 + (point1$z - point2$z)^2))
}

# ---- Create three lists with 10 empty null elements ----
my_1D <- vector("list", 10)
my_2D <- vector("list", 10)
my_3D <- vector("list", 10)

# ---- Populate the lists with point objects and random values ----
for (n in 1:length(my_1D)) {
  my_1D[[n]] <- list(x = sample(1:20,1))
  class(my_1D[[n]]) <- "Point1D"
}
for (n in 1:length(my_2D)) {
  my_2D[[n]] <- list(
    x = sample(1:20,1),
    y = sample(1:20,1)
  )
  class(my_2D[[n]]) <- "Point2D"
}
for (n in 1:length(my_3D)) {
  my_3D[[n]] <- list(
    x = sample(1:20,1),
    y = sample(1:20,1),
    z = sample(1:20,1)
  )
  class(my_3D[[n]]) <- "Point3D"
}

# ---- Create a function "point_distance" ----
# Function should take an "origin" single value and a "end points" list argument

point_distance <- function(origin,end_points) {
  sapply(end_points, \(end_point) point(origin,end_point))
}

# ---- Make function calls to "point_distance" ----
# First create 0 origin objects
origin_1D <- list(x = 0)
origin_2D <- list(x = 0, y = 0)
origin_3D <- list(x = 0, y = 0, z = 0)
class(origin_1D) <- "Point1D"
class(origin_2D) <- "Point2D"
class(origin_3D) <- "Point3D"
# Call the function
distance_1D <- point_distance(origin_1D,my_1D)
distance_2D <- point_distance(origin_2D,my_2D)
distance_3D <- point_distance(origin_3D,my_3D)
