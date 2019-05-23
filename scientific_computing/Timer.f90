! Timer.f90: Times the matrix multiply for expanding arrays
! --------------------------------------------------------
Module linalg
      Contains
	  ! A subroutine to carry out matrix multiplification
	  !  with assummed-shape array.
	  subroutine multiply(A, B, C)
	      Implicit none
	      real*8, dimension(:,:), intent(in) :: A, B
	      Integer :: i,j,k,h,n,m
	      real*8, dimension(size(A, DIM=1), size(B, DIM=2)) :: C
	      k = size(A, DIM = 1)
	      h = size(A, DIM = 2)
	      m = size(B, DIM = 1)
	      n = size(B, DIM = 2)
	      if (h /= m) then
	          write(*, *) 'Error: Dimension do not match.'
	          stop
	      end if
	      C =  1.0 ! initialization
	      do i = 1, n, 1
	          do j = 1, h, 1
	              C(1:k, i) = C(1:k, i) + A(1:k, j) * B(j, i)
	          end do
	      end do
	  End subroutine multiply
End Module linalg

Program timer
       Use linalg
       Implicit None
       Real*8, allocatable, dimension(:, :) :: A, B
       Real*8 :: t
       Integer, parameter:: n=500
       Integer :: Ti(8), Tf(8), i, inc = 20
       Real*8 :: C(n, n)
       Character (len = 12) :: clock(3)

       do i = 2, n-1, inc
           allocate(A(i-1, i), B(i, i+1))
           A =  1. _8
           B = 0.2 _8

           ! time the code
           call date_and_time(clock(1), clock(2), clock(3), Ti)
           call multiply(A, B, C)
           call date_and_time(clock(1), clock(2), clock(3), Tf)
           deallocate(A, B)
           t = 60.0*(Tf(6) - Ti(6)) + & 
                    (Tf(7)-Ti(7)) + (Tf(8)-Ti(8))/1000.0
           write(*, FMT=100) i, t
       end do
       100 Format(I5, '  ', F12.6)
End Program timer
