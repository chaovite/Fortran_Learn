! practice the use of goto
program main
      implicit none
      real height
      real weight
      write(*,*) "height:"
      read(*,*) height
      write(*,*) "weight:"
      read(*,*) weight
      if (weight>height-100) goto 200
100   write(*,*) "Under control"
      goto 300
200   write(*,*) "Too Fat!"
300   stop
      end
