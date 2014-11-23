## The following couple of functions will calculate the inverse of a matrix
## The inverse will be cached so that it can be retrieved in case of need.

## This function cretes an object that stores the matrix and its inverse 
## there are 4 methods: two to read the values of the stored items, 
## two to set the values of the stored items

makeCacheMatrix <- function(x = matrix()) {

## initialize the inverse matrix
	inverse_cache <- NULL 

## method to store the original matrix
	set <- function(n) {
			x <<- n
			inverse_cache <<- NULL
		}

## method to retrieve the original matrix
	get <- function() x

## method to set the inverse matrix
	storeInverse <- function(inverse) inverse_cache <<- inverse

## method to retrieve the inverse matrix
	retrieveInverse <- function() inverse_cache

## list methods
	list(set=set, get=get, storeInverse=storeInverse, retrieveInverse=retrieveInverse)

}	
  
## This function will search the cache for an inverse of the matrix "x"
## if the function is found in the cache, then this function will return the vaules stored in the cache
## otherwise, the inverse will be calculated.

cacheSolve <- function(x, ...) {

	
}



## sample test:
## > x <- matrix(runif(16,0,100), nrow = 4, ncol= 4)
## > test = makeCacheMatrix(x)
## > test$get()
## > x