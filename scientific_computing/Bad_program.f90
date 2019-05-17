! Function.f90: Program calls a simple function
! Demonstrate a bad program with argument type mismatch
! ____________________________________________
Real*8 Function f(x, y)
      Implicit None
      Real*8 :: x, y
      f = 1.0 + sin(x*y)
End Function f

! main program
Program Main
      Implicit None
      Real*8 :: Yin=1., f ! declarations (also f)
      Integer :: i
      do i = 1, 10
          write(*,*) 'f(',i, ',', Yin,')=', f(i, Yin) ! i has the wrong type
      end do
End Program Main
