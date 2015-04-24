## We will create 2 functions. First function will create an object to store a matrix.
## The second function will cache its inverse.

## The first function is called makeCacheMatrix. This function will create a matrix
## which is a list containing a function to:
   ## 1/-set the value of the matrix
   ## 2/-get the value of the matrix
   ## 3/-set the value of the inverse
   ## 4/-get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
	i <- NULL 					                
	set <- function(y) {			
     		x <<- y 					                    
     		i <<- NULL
	}
	get <- function() x 				            
	setinverse <- function(solve) i <<- solve 	 
	getinverse <- function() i 			        
	list(set = set, get = get,
    		setinverse = setinverse,
     		getinverse = getinverse)
}


## The second function is called cacheSolve . This function will calculate the inverse of the above "matrix".
## It will first check if the inverse of the matrix has already been calculated. 
## If yes, it will get the inverse from the cache and skips the computation. 
## Otherwise, it will calculate the inverse of the data and sets the value of the inverse in the cache via 
## the 'set_inverse' function.

cacheSolve <- function(x, ...) {
	## Return a matrix that is the inverse of 'x'

	i <- x$get_inverse()				
	if(!is.null(i)) {					
     		message("getting cached data")		
     		return(i)
	}
	data <- x$get()					
	i <- solve(data, ...)				
	x$setinverse(i)					
	i 
}

