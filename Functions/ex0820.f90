program main
! this demonstrate the life cycle of local variables.   
implicit none
      call sub()
      call sub()
      call sub()
end program

subroutine sub()
    implicit none
    integer:: count = 1 ! note the variable initialization is done ONLY ONCE!!
    save count ! count will live forever
    write(*,*)  count
    count = count + 1
    return
end subroutine

    

