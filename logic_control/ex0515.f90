program main
      implicit none
      integer i
      integer, parameter :: n=10
      data i /0/
10    write(*, '(1X, A3, I2)') 'i=', i
      i = i + 1
      if (i .lt. n) goto 10
      stop 
end
