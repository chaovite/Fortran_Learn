! planetary_motion.f90: Newton's universal law of gravitation 
!    Solving trajectory of planet's motion
! -----------------------------------------------------
Subroutine trajectory_planet(npts, t, x0, y0, vx0, vy0, p)      
      ! solving trajectory using verlet method
      Implicit None
      Integer, intent(in) :: npts        ! number of time grid points
      ! initial positions, velocity, p parameters.
      Real*8,  intent(in) :: t, x0, y0, vx0, vy0, p
      ! Positions of the trajectory, and times
      Real*8, dimension(npts) :: Xs, Ys, Ts 
      Real*8 :: vx, vy, ax,ay, dt, ti, r
      Integer :: i
      Character (len=50) :: filename 
      write(filename, "('trajectory_planet_p_', F3.1,'.dat')") p
      open(1, file=filename,status='REPLACE')
      write(1, "(A16,4(X, A16))") 'T', 'X', 'Y'
      
      ti = 0d0
      Xs(1) = x0
      Ys(1) = y0
      Ts(1) = ti
      write(1, "(F16.8, 2(X, F16.8))") Ts(1), Xs(1), Ys(1)

      dt    = t/dble(npts-1)
      vx    = vx0
      vy    = vy0
      do i = 1 , npts-1, 1
          ti      = i * dt
          Ts(i+1) = ti
          ! acceleration
          r       = sqrt(Xs(i)**2.0 + Ys(i)**2.0)
          ! use newton's gravitation law to calculate acceleration
          ax      = - Xs(i)/r**(p+1.)
          ay      = - Ys(i)/r**(p+1.)
          ! time integration numerically using verlet's method
          Xs(i+1) = Xs(i) + vx*dt ! + 0.5*ax*dt**2.0
          Ys(i+1) = Ys(i) + vy*dt ! + 0.5*ay*dt**2.0
          ! analytical solution with no drag
          vx      = vx + ax*dt
          vy      = vy + ay*dt
          write(1, "(F16.8,2(X, F16.8))") & 
                    Ts(i+1), Xs(i+1), Ys(i+1)      
      end do
      close(1, status='KEEP')
end subroutine trajectory_planet

Program planet_motion
     Implicit none
     Integer:: npts = 500000
     real*8 :: pi
     real*8 :: x0 = 0.5, y0 = 0., vx0 = 0., vy0 = 1.1
     real*8 :: t  = 5.0, p = 2.0 
     call trajectory_planet(npts, t, x0, y0, vx0, vy0, p)      
End program planet_motion

