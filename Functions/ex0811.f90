program main
! common is what Fortran 77 uses to define global variables.
    implicit none
      integer:: a , b
      ! divide global variables into 2 groups
      common /group1/ a
      common /group2/ b
      a = 1
      b = 2
      call ShowGroup1()
      call ShowGroup2()
      stop
      end program

subroutine showgroup1()
implicit none
integer:: num1
common /Group1/ num1
write(*,*) num1     
end subroutine

subroutine showgroup2() 
implicit none
integer:: num1
common /Group2/ num1
write(*,*) num1     
end subroutine
