! Math.f90: demo some Fortran math functions
! ___________________________________________
Program Math_test                       ! Begin main program
      Real*8 :: x = 1.0, y, z           ! Declare variables x, y, z
      y = sin(x)                        ! Call the sine function
      z = exp(x) +  1.0                 ! Call the exponential function
      print *, x, y, z                  ! Print x, y, z
      ! There are certain limits of 
      !    input for default math functions
      print *, 'sqrt(-1)',sqrt(-1.0)
      print *, 'cos^-1(2)',acos(2.0)
      print *, 'log(0)',log(0.0)
End Program Math_test                   ! End main program

