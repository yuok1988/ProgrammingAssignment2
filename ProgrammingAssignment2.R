## I change and set x as matrix.
## I put a value from solve function s as a null
## I change every "mean" to "solve"
makeCacheMatrix <- function(x = matrix()) {
  s <- NULL
  set <- function(y) {
    x <<- y
    v <<- NULL
  }
  getsolve <- function() x
  setsolve <- function(solve) s <<- solve
  getmatrix <- function() s
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## I changed every "mean" to "solve". In addition "m" to "s"
cacheSolve <- function(x, ...) {
  s <- x$getsolve()
  if(!is.null(s)) {
    message("getting inversed matrix")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setsolve(s)
  s
}
s <- matrix(sample(1:100,8),2,2)
s1 <- makeCacheMatrix(s)
cacheSolve(s1)
