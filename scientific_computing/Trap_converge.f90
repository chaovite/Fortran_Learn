!Trap.f90: convergence test for trapezoid integration
!-------------------------------
Function fun(t)
      ! define an function for integration
      implicit None
      real*8 :: t, fun
      fun = t**2.0
End function

! Main function that implement the trapezoid integration rule
Program trap_converge
      implicit None
      Integer :: N, i, ind 
      Real*8  :: fun, f, t, a, b, h, w 
      
      Real*8  :: res, res_a, err
      open(1, file='trap_converge_test.dat', status='REPLACE')

      a = 0.0
      b = 3.0
      res_a = 9.0               ! analytical results
      100 format('Start and end times: ', G16.3, 1X, G16.3, /)
      200 format(A16, 1X, A16, 1X, A16,1X, A16,/)
      300 format(I16, 1X, F16.12, 1X, F16.12,1X,F16.12, /)
      write(*, 100) a, b
      write(1, 100) a, b
      write(*, 200) 'N', 'res', 'res_a', 'err'
      write(1, 200) 'N', 'res', 'res_a', 'err'

      do ind = 3, 10, 1
         N = 2**ind             ! number of grid points 
         h = (b-a)/dble(N-1)    ! grid spacing
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
         err = abs(res-res_a)
         write(*, 300) N, res, res_a, err
         write(1, 300) N, res, res_a, err
      end do
      close(1, status='KEEP')
end program trap_converge
