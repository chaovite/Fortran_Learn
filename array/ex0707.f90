program main
implicit none
integer, parameter::row = 2
integer, parameter::col = 2
integer r
integer c
integer :: m(row, col)  
data((m(r,c), c=1,col),r=1,row) /1,2,3,4/

write(*,"(I3,I3,/,I3,I3)") ((m(r, c), c = 1, col), r = 1, row)
stop
end program

