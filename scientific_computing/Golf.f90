!Golf.f90: The GOLF program
!_____________________________
Program golf_double
      Implicit None
      Real*8 :: Up, Tp, v, theta, T, uxval, uyval, u, phi
      Real*8 , Parameter :: PI = 3.14159265358979323846 _8
      Real*8 :: gamma1, Ux, Uy ! declaration of functions
      ! Set initial variables for Michelle:
      Up = 1.0 _8/sqrt(3.0 _8)
      Tp = 2.6e7 _8
      v  = 0.5 _8
      theta = 150.0 _8 * PI /180.0 _8
      ! Cll functions to get variables for Ben:
      T = gamma1(Up)*Tp
      uxval = Ux(Up, theta, v)
      uyval = Uy(Up, theta, v)
      u = sqrt(uxval**2 + uyval**2)
      phi = atan2(uyval, uxval)
      ! Display results:
      print *, 'T  =', T
      print *, 'ux =', uxval
      print *, 'uy =', uyval
      print *, 'u  =', u
      print *, 'phi=', phi
End Program golf_double

! Function gamme(v), time dilation function
Real*8 Function gamma1(v)
      Implicit none
      Real*8 :: v
      gamma1 = 1.0 _8 / sqrt(1.0 _8 - v**2)
End Function gamma1

! Function Ux return x velocity
Real*8 Function Ux(Up, theta, v)
      Implicit none
      Real*8:: Up, theta, v, Upx
      Upx = Up*cos(theta)
      Ux  = (Upx + v)/(1.0 _8 + v*Upx)
End Function Ux

! Function Uy return y velocity
Real*8 Function Uy(Up, theta, v)
      Implicit none
      Real*8 :: Up, theta, v, Upx, Upy
      Real*8 :: gamma1
      Upy = Up*sin(theta)
      Upx = Up*cos(theta)
      Uy  = Upy/(gamma1(v)*(1.0 _8 + v*Upx))
End Function Uy
