!trap_simpson_compare.f90: convergence test for 
!  trapezoid and simpson integration
!-------------------------------
Function fun(t)
      ! define an function for integration
      implicit None
      real*8 :: t, fun
      fun = cos(t)
End function

Program trap_simp_converge
      implicit None
      Integer :: N, i, ind 
      Real*8  :: fun, f, t, a, b, h, wt, ws 
      
      Real*8  :: res_t, res_s, res_a, err_t, err_s
      open(1, file='trap_simp.dat', status='REPLACE')

      a = 0.0
      b = 3.0
      res_a = sin(b)-sin(a)            ! analytical results
      100 format('Start and end times: ', G16.3, 1X, G16.3, /)
      200 format(A16, 1X, A16,1X, A16,/)
      300 format(I16, 1X, F20.16, 1X, F20.16, /)
      write(*, 100) a, b
      write(1, 100) a, b
      write(*, 200) 'N-1', 'Trapezoid', 'Simpson'
      write(1, 200) 'N-1', 'Trapezoid', 'Simpson'

      do ind = 3, 12, 1
         N = 2**ind + 1         ! number of grid points 
         h = (b-a)/dble(N-1)    ! grid spacing
         res_s = 0.0
         res_t = 0.0
         do i = 1, N, 1
             t = a + h*dble(i-1)           ! time t_i
             f = fun(t)                    ! f at t_i
             ! set weights w_i
             if (i == 1 .or. i==N) then
                 wt = h/2.0  ! trapezoid
                 ws = h/3.0  ! simpson
             else
                 wt = h
                 if (mod(i, 2) == 0) then
                     ws = h*4.0/3.0
                 else
                     ws = h*2.0/3.0 
                 endif
             endif
             res_s = res_s + f*ws
             res_t = res_t + f*wt
         end do
         err_s = abs(res_s-res_a)
         err_t = abs(res_t-res_a)
         write(*, 300) N-1, err_t, err_s
         write(1, 300) N-1, err_t, err_s
      end do
      close(1, status='KEEP')
end program trap_simp_converge
