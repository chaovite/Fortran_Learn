program main
implicit none
open(unit=10, file='hello.txt')
write(10, *) 'Hello world!'
stop 
end      
      
