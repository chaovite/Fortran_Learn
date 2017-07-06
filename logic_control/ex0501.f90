! pratice using if
Program main
implicit none
real(kind=4) :: speed
write(*,*) "speed:"
read(*,*) speed ! read in speed
if (speed > 100.0) then
    ! speed > 100
    write(*,*) "slow down!!"
end if
stop 
end

