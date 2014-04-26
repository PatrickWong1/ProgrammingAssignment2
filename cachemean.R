cachemean <- function(x, ...) {
  m <- x$getmean()           #query the x vector's cache         
  if(!is.null(m)) {           #if there is a cache
    message("getting cached data") 
    return(m)                #just return the cache, no computation needed
  }
  data <- x$get()             #if there's no cache
  m <- mean(data, ...)        #we actually compute them here
  x$setmean(m)                #save the result back to x's cache
  m                           #return the result
}