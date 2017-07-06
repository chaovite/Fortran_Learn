program main
implicit none
integer i,j
integer, parameter::size=5
integer::m(size, size)

forall(i=1:size,j=1:size, i>j) m(i,j) = 1
forall(i=1:size,j=1:size, i==j) m(i,j) = 2
forall(i=1:size,j=1:size, i<j) m(i,j) = 3

write(*,"(5(I2),/)") m

end program 
