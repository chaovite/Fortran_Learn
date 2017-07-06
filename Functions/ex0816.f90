program main
implicit none
integer:: num(5) = (/1,2,3,4,5/)
call showone(num)
call showarray5(num)
call showarray3(num)
call showarray3(num(2))
call showarray2X2(num)
end program

subroutine showone(a)
    implicit none
    integer:: a(1)
    write(*,*) a
end subroutine

subroutine showarray5(a)
    implicit none
    integer:: a(5)
    write(*,*) a
end subroutine

subroutine showarray3(a)
implicit none
integer::a(3)
write(*,*) a
end subroutine

subroutine showarray2x2(a)
implicit none
integer:: a(2,2)
write(*,*) rank(a)
write(*,"(4(I2))") a(1,1), a(2,1), a(1,2), a(2,2)
end subroutine


