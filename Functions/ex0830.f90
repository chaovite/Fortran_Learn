program main
! this demonstrate the usage of elemental function
implicit none
! declare the function interface
interface
    elemental real function func(num)
        implicit none
        real, intent(in)::num
        end function
end interface

integer i
real:: a(10) = (/(i, i=1, 10)/)
real:: b(10)

write(*,"(10F6.2)")a
b = func(a)
write(*,"(10F6.2)")b

stop
end program

elemental real function func(num)
    implicit none
    real, intent(in)::num
    func = sin(num) + cos(num)
    return
end function

