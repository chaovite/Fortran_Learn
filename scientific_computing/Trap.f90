!Trap.f90: Trapezoid integration
!-------------------------------
Function fun(t)
      ! define an function for integration
      implicit None
      real*8 :: t, fun
      fun = t**2.0
End function

! Main function that implement the trapezoid integration rule
Program trap
      implicit None
      Integer :: N, i
      Real*8  :: fun, f, t, a, b, h, w, res
      write(*,*) "Enter initial and final t value:"
      read(*,*) a, b
      write(*, *) "Enter number of integration points:"
      read(*,*) N
      h = (b-a)/dble(N-1)
      res = 0.0
      do i = 1, N, 1
          t = a + h*dble(i-1)           ! time t_i
          f = fun(t)                    ! f at t_i
          ! set weights w_i
          if (i == 1 .or. i==N) then
              w = h/2
          else
              w = h
          endif
          res = res + f*w
      end do
      write(*,*) 'The integration is:', res
end program trap
