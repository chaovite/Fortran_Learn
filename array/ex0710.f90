program main
implicit none
integer :: i
real :: income(10) = (/(real(i), i = 10000, 100000, 10000)/)
real :: tax(10) = 0

where (income<30000.0)
    tax = income*0.10
elsewhere (income<50000.0)
    tax = income*0.15
elsewhere
    tax = income*0.2
end where

write(*,"('Income: ',10(F8.1, 1X))") income
write(*,"('Tax:', 10(F8.1, 1X))") tax
stop
end program
