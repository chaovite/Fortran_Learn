! Writing interface is very tedious! This work can be greatly simplified by using Module
program main
! this demonstrate the usage of interface.
implicit none
! write an interface for function random10 because its output is an array

interface
   function random10(lbound, ubound)
      implicit none
      real:: lbound, ubound
      real::random10(10)
   end function
end interface 

real::a(10)
! set the random seed
call RANDOM_SEED()
a = random10(1.0, 10.0)
write(*,"(10(F6.2))") a
stop

end program

function random10(lbound, ubound)
    implicit none
    real:: lbound, ubound
    real:: len
    real:: random10(10)
    real:: t
    integer:: i
    len = ubound - lbound 
    do i=1, 10
        call random_number(t)
        random10(i) = lbound + len*t
    end do
    return
end function


