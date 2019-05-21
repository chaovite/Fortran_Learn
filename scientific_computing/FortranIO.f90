! FortranIO.f90: input/output example
!-------------------------------------
Program demo_IO
      Implicit None
      Real*8 :: PI, r, power, area
      Character (LEN=50) :: name
      PI = 3.14159265358979
      write(*,*) 'Enter your name: '                ! Output string
      read(*, *) name                               ! Input string
      write(*,*) 'Ciao, ', name                     ! Output string + variable
      write(*,*) 'Now, enter radius & power: '
      read(*,*) r, power                            ! Input 2 variables
      area = PI*(r**power)                          ! Compute area
      write(*, 100)  name, r, area, power           ! Write to screen
      write(*, 200)  name, r, area, power           ! Write to screen
      open(1, FILE='data.dat', STATUS='REPLACE')    ! Open file
      write(1, 100) name, r, area                   ! write to file + format
      close(1, status='KEEP')                       ! close file
      write(*,*) 'See data.dat for the answer in the file.'
      stop
      100 Format(/,'Example 1:',/,'Hello',T10, A8,/,5X, &
                 'The area of a circel with radius ',F16.6, &
                 2X, 'is ', 2E12.3)
      200 Format('Example 2:  ', a8, 1X, 3G12.3, /////,'end')
End Program demo_IO

