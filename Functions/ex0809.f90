program main
      ! this program practice the use of functions
implicit none
integer, parameter:: players = 5
real::   angles(players)      = (/30,45,35,50,40/)
real::   speeds(players)      = (/25, 20, 21, 27, 22/)
real::   distances(players)
real, external::compute_distance

integer:: i
do i = 1, players
   distances(i) = compute_distance(angles(i), speeds(i))
   write(*,"('Player: ', I2,', angle: ', F4.1,', speed: ',F4.1, ', distance: ', F8.2)") & 
      & i, angles(i), speeds(i), distances(i) 
end do
stop

end program

real function angle_to_rad(degree)
! convert degree to rad
    implicit none
    real::degree
    real, parameter::pi = 3.14159
    angle_to_rad = degree*pi/180.0
    return
end function 

real function compute_distance(angle, speed)
! compute distance given angle (degree) and speed (m/s).
    implicit none
    real:: angle, speed, distance, angle_rad
    real:: v_horizontal, v_vertical, time    
    real, external:: angle_to_rad  
    real:: g = 9.81 ! gravitational acceleration
    angle_rad = angle_to_rad(angle)
    v_vertical          = speed*sin(angle_rad)
    v_horizontal        = speed*cos(angle_rad)
    time                = v_vertical*2/g
    compute_distance    = time*v_horizontal
    return
end function 


