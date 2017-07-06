program main
      implicit none
      real(kind=4) :: rain
      integer*2 :: wind_speed
      logical r,w
      write(*,*) "wind speed in degree:"
      read(*,*) wind_speed
      write(*,*) "rain in cm:"
      read(*,*) rain
      r = rain>500
      w = wind_speed>=10

      if (r .or. w) then
          write(*,*) "STAY HOME! BE SAFE"
      else
          write(*,*) "No interuption, Normal"
      end if
      stop 
      end
