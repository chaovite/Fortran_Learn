program main
      implicit none
      real*4 :: a
      real*4 :: b = 3.0
      real, parameter :: eps = 1e-6
      a = sqrt(b)**2 - b ! should be equal to zero in theory
      
      if (abs(a-0.0)<eps) then
          write(*,*) "a = 0"
      else
          write(*,*) "a is not equal to 0"
      end if
      stop 
      end

