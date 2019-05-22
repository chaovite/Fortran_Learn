! ProjectileAir.f90: Projectile Program 
!    Solving trajectory of projectile in the air with drag
! -----------------------------------------------------
Subroutine trajectory_euler(npts, x0, y0, v0, theta, k, n)      
      ! solving trajectory using forward euler's method
      Implicit None
      Integer, intent(in) :: npts        ! number of time grid points
      ! initial positions, velocity, take-off angle, k, n parameters.
      Real*8,  intent(in) :: x0, y0, v0, theta, k, n
      ! Positions of the trajectory, and times
      Real*8, dimension(npts) :: Xs, Ys, aXs, aYs, Ts 
      Real*8 :: g=9.81d0, vx, vy, tmax, dt, t
      Integer :: i
      Character (len=50) :: filename 
      write(filename, "('trajectory_euler_k', F4.2,'_n_',F3.1,'.dat')") k, n 
      open(1, file=filename,status='REPLACE')
      write(1, "(A16,4(X, A16))") 'T', 'X', 'Y','aX', 'aY'
      
      t = 0d0
      Xs(1) = x0
      Ys(1) = y0
      aXs(1) = x0
      aYs(1) = y0
      Ts(1) = t
      write(1, "(F16.8,4(X, F16.8))") Ts(1), Xs(1), Ys(1), aXs(1), aYs(1)

      tmax  = 2*v0*sin(theta)/g
      dt    = tmax/dble(npts-1)
      vx    = v0*cos(theta)
      vy    = v0*sin(theta)
      do i = 1 , npts-1, 1
          t       = i * dt
          Ts(i+1) = t
          ! time integration numerically
          Xs(i+1) = Xs(i) + vx*dt
          Ys(i+1) = Ys(i) + vy*dt
          ! analytical solution with no drag
          aXs(i+1)= x0 + v0*cos(theta)*t
          aYs(i+1)= y0 + v0*sin(theta)*t - g*t*t/2d0
          vx      = vx - k*abs(vx)**n*vx/abs(vx)*dt
          vy      = vy - (g + k*abs(vy)**n*vy/abs(vy))*dt
          write(1, "(F16.8,4(X, F16.8))") & 
                    Ts(i+1), Xs(i+1), Ys(i+1), aXs(i+1), aYs(i+1)
      end do
      close(1, status='KEEP')
end subroutine trajectory_euler

Subroutine trajectory_verlet(npts, x0, y0, v0, theta, k, n)      
      ! solving trajectory using verlet's method
      Implicit None
      Integer, intent(in) :: npts        ! number of time grid points
      ! initial positions, velocity, take-off angle, k, n parameters.
      Real*8,  intent(in) :: x0, y0, v0, theta, k, n
      ! Positions of the trajectory, and times
      Real*8, dimension(npts) :: Xs, Ys, aXs, aYs, Ts 
      Real*8 :: g=9.81d0, vx, vy, ax, ay, tmax, dt, t
      Integer :: i
      Character (len=50) :: filename 
      write(filename, "('trajectory_verlet_k', F4.2,'_n_',F3.1,'.dat')") k, n 
      open(1, file=filename,status='REPLACE')
      write(1, "(A16,4(X, A16))") 'T', 'X', 'Y','aX', 'aY'
      
      t = 0d0
      Xs(1) = x0
      Ys(1) = y0
      aXs(1) = x0
      aYs(1) = y0
      Ts(1) = t
      write(1, "(F16.8,4(X, F16.8))") Ts(1), Xs(1), Ys(1), aXs(1), aYs(1)

      tmax  = 2*v0*sin(theta)/g
      dt    = tmax/dble(npts-1)
      vx    = v0*cos(theta)
      vy    = v0*sin(theta)
      do i = 1 , npts-1, 1
          t       = i * dt
          Ts(i+1) = t
          ! acceleration
          ax      = - k*abs(vx)**n*vx/abs(vx)
          ay      = - (g + k*abs(vy)**n*vy/abs(vy))
          ! time integration numerically
          Xs(i+1) = Xs(i) + vx*dt + 0.5*ax*dt**2.0
          Ys(i+1) = Ys(i) + vy*dt + 0.5*ay*dt**2.0
          ! analytical solution with no drag
          aXs(i+1)= x0 + v0*cos(theta)*t
          aYs(i+1)= y0 + v0*sin(theta)*t - g*t*t/2d0
          vx      = vx + ax*dt
          vy      = vy + ay*dt
          write(1, "(F16.8,4(X, F16.8))") & 
                    Ts(i+1), Xs(i+1), Ys(i+1), aXs(i+1), aYs(i+1)
      end do
      close(1, status='KEEP')
end subroutine trajectory_verlet

Program projectile
     Implicit none
     Integer:: npts = 20
     real*8 :: pi
     real*8 :: x0 = 0., y0 = 0., v0 = 20., theta, k, n
     !real*8, dimension(npts) :: Xs, Ys, Ts
     pi = 4.D0*DATAN(1.D0)
     theta = pi/4.
     k = 0.
     n = 1.
     call trajectory_euler(npts, x0, y0, v0, theta, k, n) 
     call trajectory_verlet(npts, x0, y0, v0, theta, k, n)
End program projectile

