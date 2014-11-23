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
## otherwise, the inverse will be calculated and then stored in the cache.

cacheSolve <- function(x, ...) {

## retrieve the inverse from the cache

        inverse <- x$retrieveInverse()

## if the inverse in the cache exists, then it will be returned and the function ends 
	if( !is.null(inverse) ) {
		message("getting cached data")
		return(inverse)
	}

## Retrieve the original matrix
	matrice_originale <- x$get()
	
## Calculate the inverse matrix 
	inverse <- solve(matrice_originale)
	
## Store the result of the previous step
	x$storeInverse(inverse)
	
## Return the calculated inverse matrix
	inverse
	
}


## sample test:
## > originalMatrix <- matrix(sample(1:100,16), nrow = 4, ncol= 4)
## > test = makeCacheMatrix(originalMatrix)
## > cacheSolve(test)
## > inverse <- cacheSolve(test)

## the cached data has been retrieved

## > test_inverse = makeCacheMatrix(inverse)
## > inverseOfInverse <- cacheSolve(test_inverse)

## the inverse is different, so it is calculated again

## now we have a matrix that must be the same of the originalMatrix

## > originalMatrix
## > inverse
## > inverseOfInverse

## > cacheSolve(test_inverse)

## will retrieved the cached data of the last calculated inverse