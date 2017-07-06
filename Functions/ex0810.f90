program ex0810
      implicit none
      integer :: a, b
      common a, b ! define a and b as the 1st and 2nd global variables.
      a = 1
      b = 2
      call ShowCommon()
      stop
end program


subroutine ShowCommon()
    !show the first 2 global variables
    implicit none
    integer:: num1, num2
    common num1, num2 ! define num1 and num2 as the 1st and 2nd global variables defined in common block
    write(*,*) num1, num2
    return
end subroutine
