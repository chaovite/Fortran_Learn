! ChangeArray.f90: Change array with function
! -------------------------------------------
Program ChangeArray
      Implicit None
      Interface
          Function f(x)
              Real, dimension(:), intent(in)::x
              Real :: f(size(x))
          End Function
      End Interface
      
      Real :: x(3), y(3)
      Integer :: i
      x(1) = 1.0
      x(2) = 2.0
      x(3) = 3.0
      write(*,*) 'Input:'
      write(*,*) (x(i), i=1,3)
      y = f(x)   ! the values of x is modified by function f
      write(*,*) 'Output:'
      write(*,*)(x(i),i=1,3)

      x = 1.0
      y = 0.0
      y(1) = x(1)
      write(*,*) 'x,y-before='
      write(*,*) x
      write(*,*) y
      x(1:3) = 10.0
      write(*,*) 'x, y-after'
      write(*,*) (x(i), i=1,3)
      write(*,*) y
End Program ChangeArray

Function f(x)
      Implicit None
      Real, dimension(:) :: x
      Real :: f(size(x))
      ! first element is modified in this function
      f = x/3.0
      x(1) = 1000 
End Function f
