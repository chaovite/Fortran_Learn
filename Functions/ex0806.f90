program main
      ! this program practice the use of subroutines
implicit none
integer, parameter:: players = 5
real::   angles(players)      = (/30,45,35,50,40/)
real::   speeds(players)      = (/25, 20, 21, 27, 22/)
real::   distances(players)

integer:: i
do i = 1, players
   call compute_distance(angles(i), speeds(i), distances(i))
   write(*,"('Player: ', I2,', angle: ', F4.1,', speed: ',F4.1, ', distance: ', F8.2)") & 
      & i, angles(i), speeds(i), distances(i) 
end do
stop

end program

subroutine to_rad(degree, angle_rad)
! convert degree to rad
    implicit none
    real::degree, angle_rad
    real, parameter::pi = 3.14159
    angle_rad = degree*pi/180.0
    return
end subroutine

subroutine compute_distance(angle, speed, distance)
! compute distance given angle (degree) and speed (m/s).
    implicit none
    real:: angle, speed, distance, angle_rad
    real:: v_horizontal, v_vertical, time      
    real:: g = 9.81 ! gravitational acceleration
    call to_rad(angle, angle_rad)
    v_vertical          = speed*sin(angle_rad)
    v_horizontal        = speed*cos(angle_rad)
    time                = v_vertical*2/g
    distance            = time*v_horizontal
    return
end subroutine



