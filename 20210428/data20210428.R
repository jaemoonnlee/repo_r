# vector is a set consist of scalar.
# c(): vector
ex_vector <- c(10,9,8,7,6,5,4,3,2,1) # same result when i write c(10:1)
cat(ex_vector)

ex_vector[c(1,5)]# show index 1 and 5
ex_vector[1:3]# show index 1 to 3
ex_vector[3:6]# show index 3 to 6
class(c(1))


mat1 <- matrix(ex_vector, nrow=2, ncol=3)# num[1:2, 1:3]
mat1
#   [,1][,2][,3]
#[1,] 10  8   6
#[2,] 9   7   5

mat2 <- matrix(ex_vector, nrow=3, ncol=2)
mat2
#   [,1][,2]
#[1,] 10  7
#[2,] 9   6
#[3,] 8   5

mat3 <- matrix(ex_vector, nrow=3, ncol=3, T)
#mat3 <- matrix(ex_vector, nrow=3, ncol=3, byrow=True)
mat3
#   [,1][,2][,3]
#[1,] 10  9   8
#[2,] 7   6   5
#[3,] 4   3   2

arr <- c(1:12)
array(arr, dim=c(2,2,3))
array(arr, dim=c(2,2,3), dimnames = list(c('1행', '2행'),
                                         c('1열', '2열'),
                                         c('1페이지', '2페이지', '3페이지')))


array(mat3, dim=c(2,2,2))
