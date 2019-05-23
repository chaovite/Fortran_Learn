! ArrayCreate.f90: A program to declare and initialize arrays
Program main
      Implicit none
      ! two equivalent ways to declare an array
      Real*8, dimension(8) :: A, C
      Real*8  :: B(8)
      ! declare 2D arrays
      Real*8  :: I1(3,3)
      Real*8, dimension(3,3) :: I2, D
      Integer :: i, j

      ! write an interface for subroutine (Not recommended!)
      ! It is recommended to use a module to pass procedures with 
      !   assumed-shaped arrawy      
      interface
         subroutine multiply(A, B, C)
              Implicit none
              real*8, dimension(:,:), intent(in) :: A, B
              Integer :: i,j,k,h,n,m
              real*8, dimension(size(A, DIM=1), size(B, DIM=2)) :: C
         end subroutine
      end interface

      A(2) = 1.
      B(1) = 0.
      do i = 1, 8, 1
          A(i) = i
          B(i) = i + 1
      end do

      ! print vector
      write(*, *) 'A = '
      write(*,"(8F8.2)") A
      write(*, *) 'B = '
      write(*,"(8F8.2)") B
     
      write(*,*) 'Element-wise operation. REALLY POWERFUL!!!' 
      ! Array magic, elementwise operations
      C = A * B
      write(*,*) 'C = A * B = '
      write(*,"(8F8.2)") C
      
      ! try if this magic works for other intinsic functions
      !  The answer is YES!!!
      write(*, *) 'C**2 = '
      write(*,"(8F8.2)") C**2


      A = 1.0
      write(*, *) 'A=1.0:' 
      write(*,"(8F8.2)") A

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
          write(*, "(3F8.2)") I1(i, 1:3)
      end do

      write(*, *) 'I2 = '
      do i =1, 3, 1
          write(*, "(3F8.2)") I2(i, 1:3)
      end do
      
      ! Note when fortran outputs an array
      !  It outputs column by column.
      write(*, *) 'I1='
      write(*, "(3F8.2)") I1
      write(*, *)

      ! check the size of the array
      write(*, *) 'size(I1, DIM=1) = ', size(I1, DIM=1)
      write(*, *) 'size(I1) = ', size(I1) ! output the total size of the array

      call multiply(I1, I2, D)
      write(*, *) 'D = multiply(I1, I2):'
      write(*, "(3F8.2)") D
end program main


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
            C(:, i) = C(:, i) + A(:, j) * B(j, i)
        end do
    end do
End subroutine multiply


