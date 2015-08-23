## ### Assignment: Caching the Inverse of a Matrix

## Matrix inversion is usually a costly computation and there may be some
## benefit to caching the inverse of a matrix rather than computing it
## repeatedly. For this assignment I will write a pair of functions that
## cache the inverse of a matrix.

## The first function is `makeCacheMatrix`: This function creates a 
## special "matrix" object that can cache its inverse.
## The second function is `cacheSolve`: This function computes the 
## inverse of the special
## "matrix" returned by `makeCacheMatrix` above. If the inverse has
## already been calculated (and the matrix has not changed), then
## `cacheSolve` should retrieve the inverse from the cache.

## Computing the inverse of a square matrix can be done with the `solve`
## function in R. For example, if `X` is a square invertible matrix, then
##`solve(X)` returns its inverse.

## For these functions, assume that the matrix supplied is always
## invertible.

## Function number one - makeCacheMatrix
## Null Matrix then assign it's values
## Assign the inverse values of the matrix
## Get the inverse value of the matrix with 'solve'

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        setinverse <- function(inverse) inv <<- inverse
        retrieveinverse <- function() inv
        ## Store functions in list (not all are functions)
        list(matrix=y, setinverse=setinverse, retrieveinverse=retrieveinverse)
}


## Write a short comment describing this function
## The cacheSolve functon will return the inverse of matrix y

cacheSolve <- function(x, ...) {
        inv <- x$retrieveinverse()
        if(!is.null(invofmatrix)) {
                message("Retrieving inverse cached data...")
                return(inv)
        }
        data <- x$matrix
        inv <- solve(data)
        x$setinverse(invofmatrix)
        invofmatrix
}
## Here is a sample run on what to expect
## A couple of ways of creating a matrix
## > y <- matrix(2:5, 2, 2)
## > y = cbind(c(2, 3, 2), c(1,2,1), c(1, 1, 2))
## > m = makeCacheMatrix(y)
## > m$matrix
## [,1] [,2] [,3]
## [1,]    2    1    1
## [2,]    3    2    1
## [3,]    2    1    2
## > cacheSolve(m)
## [,1] [,2] [,3]
## [1,]    3   -1   -1
## [2,]   -4    2    1
## [3,]   -1    0    1
## The second matrix is the INV of the first.
## run it again to see if the computation is cached
## > cacheSolve(m)
## Retrieving INV cached data.
## [,1] [,2] [,3]
## [1,]    3   -1   -1
## [2,]   -4    2    1
## [3,]   -1    0    1
