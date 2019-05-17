!Limits.f90:   Determines machine precision
!__________________________________________
Program Limits
      Implicit None
      Integer :: i, n
      Integer :: epsilon_m
      n = 100                    ! Establish the number of iterations
      ! Set initial values:
      epsilon_m = 1
      ! Within the DO-LOOP, calculate each step and print.
      ! This loop will execute 60 times in a row as i is 
      !   incremented from 1 to n (since n=60):
      do i = 1, n, 1                  ! Begin the do-loop
          epsilon_m=epsilon_m*2       ! Increase epsilon_m
          print *, i,-1*epsilon_m     ! Print values so far
      end do
End Program Limits

