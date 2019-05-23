! Laplace.f90: use relaxation method to solve Laplace equation
! V,xx + V,yy = 0 on 0<=x<=100, 0<=y<=100
! V = 0 on the outer boundary. 
! V = -100, 25<=x<=75, y = 30; V = 100, 25<=x<=75, y = 60
! Relaxation algorithm:      
!   V[i,j] = (V[i-1, j] + V[i+1, j] + V[i, j+1] + V[i, j-1])/4
! keep the boundary values fix 
!
program Laplace
      Implicit None
      Integer, parameter :: Nmax = 100
      Integer :: tmax = 9999
      Integer :: i, j, k, im, ip, jm, jp
      real*8, dimension(Nmax, Nmax) :: V
      character (len=80) ::filename

      ! internal boundaries
      im = 25
      ip = 75
      jm = 40
      jp = 60

      ! initialization
      V = 0d0
      V(im:ip, jm) = -100d0
      V(im:ip, jp) =  100d0
      do k = 1, tmax,1 ! iterate for tmax steps
          do i = 2, Nmax-1, 1
              do j=2, Nmax-1, 1
                  ! only change the values away from the boundary!
                  if (.not. ((j==jm .or. j==jp) & 
                     .and. (i>=im .and. i<=ip))) then
                      ! relaxation/averaging
                      V(i,j) = (V(i-1,j) + V(i+1, j) & 
                             + V(i, j+1) + V(i,j-1))/4d0
                  end if
              end do
          end do
      end do
      
     ! write results into a file
     write(filename, "('laplace_steps_',I4,'.dat')") tmax
     open(unit = 1, file= filename,status='REPLACE')
     do i = 1, Nmax, 1
         ! each row of data in the file is one column in V
         write(1, "(100F13.6)") V(:,i)
     end do
     close(1, status='KEEP')
end program Laplace
