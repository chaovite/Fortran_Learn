program main
implicit none
integer, parameter:: students = 5
integer i
integer :: scores(students) = 50 
!DATA(scores(i), i = 1,5) /1,2,3,4,5/
do while (.true.)
    write(*,*)'Query:'
    read(*,*)i
    if (i<0 .or. i>students) exit
    write(*, *) scores(i)
end do
stop
end

