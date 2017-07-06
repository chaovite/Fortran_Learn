! This demonstrate initialization and usasge of fortran array.
program main
implicit none
integer, parameter:: row = 2
integer, parameter:: col = 2
integer :: a(2,2) = reshape((/ 1,2,3,4 /),(/row, col/)) ! must reshape the array
integer :: b(4) = (/ 5,6,7,8 /)
integer :: c(2)

write(*,*) a
write(*,*) a(:,1)
c = a(:,1) 
write(*,*) c
c = a(2,:)
write(*,*) c
write(*,*) c(2:1:-1)

c = b(1:4:2)
write(*,*) c
stop
end program
