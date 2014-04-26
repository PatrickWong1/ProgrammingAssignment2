## These functions cache the inverse of a Matrix
## 

## This function creates a special matrix object that will cache its
## inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) s <<- solve
  getsolve <- function() s
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## This function computes the inverse of the matrix from the function
## above.  If the inverse has alredy been calculated, then this function 
## will return what is in the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  s <- x$getsolve()           #Check cache         
  if(!is.null(s)) {           
    message("getting cached data") 
    return(s)                 #Return the cached value 
  }
  data <- x$get()             #Cache null, 
  s <- solve(data, ...)       #compute inverse
  x$setsolve(s)               #save result s in cache
  s                           #display result
}

