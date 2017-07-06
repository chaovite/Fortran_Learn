program main
    ! this demonstrate the danger of have different types in main and subroutines.
    ! for global variables.
    implicit none
    real::a
    common a
    a = 1.0
    write(*,"('True:',F8.2)") a
    call showcommon()
end program
subroutine showcommon()
implicit none
integer:: num1
common num1
write(*,"('False :', I16)") num1
return
end subroutine

