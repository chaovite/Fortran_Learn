program main
      ! the use intent to specify if a parameter passed in can be
      ! modified or not
      ! intent(in): parameters are read only
      ! intent(out): parameters need to be modified. (if not, there will
      ! be warning.)
     implicit none
     integer :: a = 4
     integer :: b = 2
     call div(a, b)
     write(*,*) a, b
     stop
end program 

subroutine div(a, b)
    implicit none
    integer, intent(in) :: a
    integer, intent(out):: b
    b = a/2
    return
end subroutine

