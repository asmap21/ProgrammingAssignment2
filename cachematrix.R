

## This function acts as a way to store and cache an inverse of a matrix

makeCacheMatrix <- function(x = matrix()) {

  m <- NULL
  set <- function(y){
    x<<-y
    m<<- NULL
  }
  
  get<-function(){
    x
  }
  setInv<-function(solve){
    m <<-solve
  } 
  
  getInv<-function() {
    m
  }
  
  list(set=set,get=get,setInv=setInv,getInv=getInv)
}


## This function acts as a way to call an inverse of a matrix, input requires is the makeCacheMatrix function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
         m<-x$getInv()
 if(!is.null(m)){   #if inverse is in cache
   message("getting cached data")
   m
 }
 else{  #if inverse is not in cache
   message("need to calculate inverse")
   matrix<-x$get()
   m <- solve(matrix,...)
   x$setInv(m)
   m
 }
}

###to run
### define matrix: x <- matrix(1:4,2,2)
### assign variable ot function:  f<-CacheMatrix()
### call set function:  f$set(x)
### call cacheSolve: cacheSolve(f)
### returns "need to calculate inverse"
### call cacheSolve: cacheSolve(f) again
### returns "getting cached data"
