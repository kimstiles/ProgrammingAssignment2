## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  #return list object with set, get,.. references to functions
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    #inverse exists for this data
    message("getting cached data")
    return(m)
  }
  #inverse does not exist get data from cache matrix object
  data <- x$get()
  #run solve on the data
  m <- solve(data, ...)
  # save the inverse back to the cache matrix object
  x$setinverse(m)
  # return invers
  m
}
