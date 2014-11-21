## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

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


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
         m<-x$getInv()
 if(!is.null(m)){
   message("getting cached data")
   m
 }
 else{
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
