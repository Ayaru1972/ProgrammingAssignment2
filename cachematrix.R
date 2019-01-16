##This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <-function( ma=matrix()){

## Initialize the inverse property
i <- NULL

## Method to set the matrix
set <- function(matrix){
    ma <<- matrix
    i <<- NULL
}

## Method to get matrix
get <- function()
{
ma
}

##Method to set the inverse of matrix
setInverse <- function(inverse) {
i <<- inverse
}

##Method to get inverse
getInverse <- functuion()
{
i
}

##Return a list of the methods
list(set=set ,get=get,setInverse=setInverse,getInverse=getInverse)

}


##The following function calculates the inverse of the matrix created "makeCacheMatrix. 
##However, it first checks to see if the inverse has already been calculated.
##If so,it gets the inverse from the cache and skips the computation. 
##Otherwise, it calculates the inverse of the matrix and sets the value of the inverse
##in the cache via the setinverse function.
 
chacheSolve <- function( x,...){

ma <- x$getInverse()
if(!is.null(ma)){
message("getting chached data")
return(ma)
}
##Get the matrix from our object
data <-x$get()

##Calculate the inverse using matrix multiplication
ma <- solve(data) %*%data

## set the inverse to the object
x$setInverse(ma)

##Return the matrix

ma

}
