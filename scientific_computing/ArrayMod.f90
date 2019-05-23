! ArrayMod.f90: Array Modification
! -----------------------------------
Program array_mod
      Implicit None
      Interface
          subroutine modify(x, y, z)
              Real, intent(inout) :: x, y(:), z(:,:)
          End subroutine modify
      End Interface
      Integer :: i, j  ! instance arrays
     Real:: a, b(3), c(3,3)
     a = 1.6180339887
     do i = 1, 3, 1
        b(i) = a*i*i
       do j =1 ,3,1
          c(i,j) = a*sin(1.0*i)*cos(1.0*j)
      end do
     end do 
     write(*,*) 'Scalar-before a = ', a
     write(*,*) 'Vector-before b = [',(b(i), i=1,3),']'
     do i = 1, 3, 1
      if (i == 2) then
          write(*, *) 'Before c = [', (c(i,j), j=1,3,1), ']'
      else
          write(*,*) '             ', (c(i,j), j=1,3,1), ']'
      end if
     end do
     call modify(a,b,c)
     write(*,*) 'Scalar-before a = ', a
     write(*,*) 'Vector-before b = [',(b(i), i=1,3),']'
     do i = 1, 3, 1
      if (i == 2) then
          write(*, *) 'Before c = [', (c(i,j), j=1,3,1), ']'
      else
          write(*,*) '             ', (c(i,j), j=1,3,1), ']'
      end if
     end do
End Program array_mod

!
subroutine modify(x,y,z)
      Implicit None
      Integer :: i, j
      Real, intent(inout) :: x, y(:), z(:,:)
      x = 3.14159265358979
      do  i=1,3,1
          y(i) = x * (i**3)
          do j = 1,3,1
              z(i,j) = x*sin(2.0*i)*cos(3.0*j)
          end do
      end do
End subroutine modify



