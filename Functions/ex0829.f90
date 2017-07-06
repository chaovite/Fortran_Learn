program main
implicit none
integer::n 
integer, external::fact

write(*,*) "N = "
read(*,*) n
write(*,*)n
write(*,"(I2,'!= ', I8)") n, fact(n)

stop
end program

recursive integer function fact(n)result(ans)
implicit none
integer, intent(in):: n
if (n < 0) then
    ans = -1
    return
else if (n <= 1) then
    ans = 1
    return
end if

ans = n * fact(n-1)
return
end function
