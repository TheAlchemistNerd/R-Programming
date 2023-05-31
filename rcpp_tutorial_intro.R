library(Rcpp)
cppFunction(
  'int add(int x, int y, int z){
      int sum = x + y + z;
      return sum;
  }'
)

cppFunction(
  'int signC(int x) {
      if (x > 0) {
          return 1;
      } else if (x == 0) {
          return 0;
      } else {
          return -1;
      }
  }'
)

sumR <- function(x) {
  total <- 0
  for (i in seq_along(x)) {
    total <- total + x[i]
  }
  total
}

cppFunction(
  'double sumC(NumericVector x) {
      int n = x.size();
      double total = 0;
      for (int i = 0; i < n; ++i) {
          total += x[i];
      }
      return total;
  }'
)

# calculating euclidean distance
