! Area.f90: Calculates the area of a circle, sample program
!-----------------------------------------------------------
Program Circle_area                            ! Begin main program
      Implicit None                            ! Declare all variables
      Real*8 :: radius, circum, area           ! Declare Reals
      Real*8 :: PI=3.14159265358979323846      ! Declare, assign Real
      Integer :: model_n = 1                   ! Declare, assign Ints
      print *, 'Enter a radius:'               ! Talk to user
      read *, radius                           ! Read into radius
      circum = 2.0 * PI * radius               ! Calc circumference
      area   = radius ** 2 * PI            ! Calc area
      print *, 'Program number =', model_n     ! Print program number
      print *, 'Radius =', radius              ! Print radius
      print *, 'Circumference =', circum       ! Print circumference
      print *, 'Area =', area                  ! Print area
End Program Circle_area
