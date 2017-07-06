program main
implicit none
integer, parameter::students = 5
integer :: scores(students)
integer :: i
write(*,*) "Total number of students", students
do i = 1, students
write(*,"('Number ',I2)") i
read(*, *) scores(i)
end do

! Query the scores
do while(.true.)
write(*,*) 'Query'
read(*,*) i
if (i<=0 .or. i>students) exit
write(*,*) scores(i)
end do
stop
end
          
