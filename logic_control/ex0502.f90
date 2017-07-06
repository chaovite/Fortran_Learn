program main
      implicit none
      real(kind=4) :: height
      real(kind=4) :: weight

      write(*,*) "height:"
      read(*,*) height
      write(*,*) "weight:"
      read(*,*) weight
      if (weight>height-100) then
          write(*,*) "TOO FAT!!"
      else
          write(*,*) "Under Control (^.^)"
      end if
      stop
      end
