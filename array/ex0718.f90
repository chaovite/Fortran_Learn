program main
implicit none
integer, parameter::size = 10
integer:: a(size)= (/ 5,3,6,4,8,7,1,9,2,10 /)
integer:: i, j, t
write(*,"(10(I3))") a
do i = 1, size - 1
    do j = i+1, size
        if (a(j) < a(i)) then
          call swapI(a(i), a(j))
       end if
    end do 
end do
write(*,"(10(I3))") a
stop
end program

subroutine swapI(a, b)
! swap integers
implicit none
integer:: a, b, t
t = a
a = b
b = t
return
end subroutine

