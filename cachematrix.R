## Put comments here that give an overall description of what your
## functions do

## set the matrix value
## get matrix value
## set the inverse matrix value
## get the inverse matrix value

makeCacheMatrix <- function(x = matrix()) {
    a <- NULL
    set <- function(y) {
        x <<- y
        a <<- NULL
    }
    get <- function() x
    setinverse <- function(inv) a <<- inv
    getinverse <- function() a
    list(
    set = set,
    get = get,
    setinverse = setinverse,
    getinverse = getinverse
    )
}


## Calculate the inverse matrix for the set values
## Use cached values if and when available

cacheSolve <- function(x, ...) {
    a <- x$getinverse()
    if(!is.null(a)) {
        message("calling cached data")
        return(a)
    }
    m <- x$get()
    a <- solve(m, ...)
    x$setinverse(a)
    a
}