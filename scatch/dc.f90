!practice declaration
program main

integer a ! integer
integer(kind=4) b
real(kind=4)::c,d
logical t,f
t = .true.
f = .false.
write(*,*) t, f

c = 100000000.0
d = 0.1
print *, c, " + ", d, " = ", c+d

a = 1
b = a + 1
print *, b + a/2
print *, b
write(*,*) "b=", ((a+a-a*10)/10.2 + 1)**2
write(*,*) a/2
stop
end


