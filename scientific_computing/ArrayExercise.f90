! ArrayCreate.f90: A program to declare and initialize arrays
Program main
      Implicit none
      ! two equivalent ways to declare an array
      Real*8, dimension(8) :: A
      Real*8  :: B(8)
      ! declare 2D arrays
      Real*8  :: I1(3,3)
      Real*8, dimension(3,3) :: I2

      Integer :: i, j
      A(2) = 1.
      B(1) = 0.
      do i = 1, 8, 1
          A(i) = i
          B(i) = i + 1
      end do

      ! print vector
      write(*, *) 'A = '
      write(*,"(8F8.2)") (A(i), i=1, 8)
      write(*, *) 'B = 1'
      write(*,"(8F8.2)") (B(i), i=1, 8)

      ! Note that in fortran
      ! first index i refers to the column
      !   second index j refers to the row

      do i = 1, 3, 1
          do j = 1, 3, 1
              I1(i,j) = i - j
              I2(i,j) = j - i
          end do
      end do

      ! print matrix I1
      write(*, *) 'I1 = '
      do i =1, 3, 1
          write(*, "(3F8.3)") (I1(i, j), j = 1, 3)
      end do

      write(*, *) 'I2 = '
      do i =1, 3, 1
          write(*, "(3F8.3)") (I2(i, j), j = 1, 3)
      end do
      print *, 'I1='
      print *, I1

end program main

