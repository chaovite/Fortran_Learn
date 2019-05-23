! Function.f90: Program calls a simple function
! ____________________________________________
Real*8 Function f(x, y)
      Implicit None
      Real*8 :: x, y
      f = 1.0d0 + sin(x*y)
End Function f

! main program
Program Main
     ! Implicit None
      Real*8 :: Xin=0.25d0, Yin=2d0, c , f ! declarations (also f)
      c = f(Xin, Yin)
      write(*,*) 'f(Xin, Yin)=', c
End Program Main
