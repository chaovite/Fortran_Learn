! Iterate.f90: Series expansion of 1/(1-x).
! 1/(1-x)=1+x+x^2+x^3+... .
! The summation of terms is repeated 1000 times or 
!   until the new terms are smaller than 10^-7 of the sum.

Program Iterate
      implicit None
      Real*8 :: s, term, x
      Real*8, parameter :: eps = 1e-7  ! relative tol.
      Integer :: i
      Integer, parameter :: N=1000     ! max iteration #

      s    = 0.0                       ! the sum
      print *, 'Please input, x = '
      read *, x                        ! input x
      i    = 0
      term = 1.0
      do while (i<N .AND. term>eps*s)
          s = s + term
          i =  i + 1
          print *, 'i=', i, '  sum=', s, 'term =', term
          term = term*x
      end do
end Program Iterate
