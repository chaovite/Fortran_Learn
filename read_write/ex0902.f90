program main
  implicit none
  character(len=20)::string
  open(10, file='test.txt')
  write(unit=10, fmt="(A20)") "Good morning."
  rewind(10)
  read(unit=10,fmt="(A20)") string
  write(*, *) string
  stop
end program     
      
