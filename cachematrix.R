## Put comments here that give an overall description of what your
## functions do

## Function to create the special matrix that is able to cache its computed inverse

makeCacheMatrix <- function(x = matrix()) {
m=NULL
set = function (y) {
x <<- y
m <<- NULL
}
get = function () x
setInverse = function (solve) m <<- solve
getInverse = function () m
list(set=set, get=get, setInverse=setInverse, getInverse=getInverse)
}


## If matrix is new or updated, computes its inverse, else return the value of the cached inverse

cacheSolve <- function(x, ...) {
m <- x$getInverse ()
if(!is.null(m)) {
message("getting cached data")
return(m)
}
data <- x$get()
m <- solve(data, ...)
x$setInverse(m)
m
}
