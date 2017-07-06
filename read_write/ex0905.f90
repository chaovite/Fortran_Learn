program main
implicit none
  character(len=79)::filename
  character(len=25)::buffer
  integer, parameter::fid = 10
  integer::status = 0
  logical alive
  
  write(*,*) "Filename:"
  read(*,"(A256)") filename
  inquire(file=filename, exist = alive)
  !##############################################################################################################################################################################################
  if (alive) then
          open(unit=fid,file=filename,&
          access="sequential", status="old")
        do while (.true.)
            read(unit=fid, fmt="(A25)", iostat = status) buffer
            if (status /= 0) exit
            write(*, *) buffer
        end do
    else
        write(*,*) TRIM(filename),"doesn't exist."
    end if
stop
end program
