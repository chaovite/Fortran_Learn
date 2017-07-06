!pratice multidimensional array
program main
implicit none
integer, parameter :: row=2
integer, parameter :: col=2
integer:: matrix(row, col, 3)

integer m !counter of matrix
integer r !counter of rows
integer c !counter of columns

! read in the values of two matrix
do m = 1, 2
    write(*,"('Matrix ',I2)") m
    do r = 1, row
        do c = 1, col
            write(*,"('(',I2,',',I2,')')") r, c
            read(*,*) matrix(r,c,m)
        end do
    end do
end do

! add first two matrix and print the third matrix
write(*,*) 'Matrix 3:'
do r = 1, row
    do c = 1, col
        matrix(r,c,3) = matrix(r, c, 1) + matrix(r, c, 2)
    end do
    ! print this row
    write(*,"('(',I2,',',I2,')')") matrix(r,1,3), matrix(r,2,3)
end do
stop 
end program
