## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## Caching Inverse of Matrix:
## Matrix inversion is generally a costly computation and there could be some 
## benefit in caching the inverse of a matrix instead of computong it it repeatedly.
## Below pair of functions are used to create a special object that can store a matrix and cache its inverse.
## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
        inverse <- NULL
        setMatrix <- function(y) {
                x <<- y
                inverse <<- NULL
        }
        getMatrix <- function(){
                x  
        } 
        cacheInverse <- function(solve){
                inverse <<- solve
        }
        getInverse <- function(){
                inverse
        }
  
        list(setMatrix = setMatrix, 
                getMatrix = getMatrix,
                cacheInverse = cacheInverse,
                getInverse = getInverse)
}


## Write a short comment describing this function

## This function computes the inverse of the special matrix created by 
## makeCacheMatrix above. If the inverse has already been calculated and  
## matrix is not changed, then it should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inverse <- x$getInverse()
  
        if(!is.null(inverse)) {
                message("getting cached data")
                return(inverse)
        }
  
        data <- x$getMatrix()
        inverse <- solve(data, ...)
        x$cacheInverse(inverse)
        inverse
}
