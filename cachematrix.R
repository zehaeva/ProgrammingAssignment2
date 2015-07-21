## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  ## initalize cache
  cache <- NULL
  ## function to set everything up
  set <- function(y) {
    x <<- y
    cache <<- NULL
  }
  ## getter function for main matrix
  get <- function() x
  ## set and get for the cache
  setcache <- function(solve) cache <<- solve
  getcache <- function() cache
  
  list(set = set, get = get,
       setcache = setcache,
       getcache = getcache)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  # get the cache!
  m <- x$getcache()
  #is it really there?
  if(!is.null(m)) {
    return(m) # it is! return it!
  }
  # I guess there wasn't any cache to be had
  data <- x$get()
  #let's solve this
  m <- solve(data, ...)
  # and store it!
  x$setcache(m)
  #and I guess those who called me can have a copy
  m
}
