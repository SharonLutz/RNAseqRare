RNAseqErrorCheck <-
function(x,y,z=NULL){
  
  # Check that x is a matrix (rare variants in region)
  if(is.null(nrow(x)) | is.null(ncol(x))){stop("Error: x must be a matrix.")}
  
  # Check that y is a vector (count)
  if(!is.vector(y)){stop("Error: y must be a vector.")}
  
  # Check their dimensions line up, nrow(X)==length(y)
  if(nrow(x)!=length(y)){stop("Error: nrow(x) must equal length(y).")}

  # Check x and z match: depending if y is a vector or a matrix
  # Rows match if z is a matrix, length of z matches rows of x if z is a matrix
  if(!is.null(z)){
    if(is.vector(z)){
      if(length(z)!=nrow(x)){stop("Error: length(z) must be equal to nrow(x).")}
    }else if(!is.null(nrow(z))&!is.null(ncol(z))){
      if(nrow(z)!=nrow(x)){stop("Error: nrow(z) must equal nrow(x).")}
    }else{stop("Error: z must either be a vector or a matrix.")}
  }

  # Check that y is >= 0
  if(sum(y>=0)!=length(y)){stop("Error: y must be >= 0.")}
  
}
