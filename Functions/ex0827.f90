! This demonstrate the usage of variable input parameters.
! This also demonstrate changing the order of input parameters by parsing by names
! functions with optional input parameters must have interface declared excepted for module
program main
implicit none
interface 
    real function func(x, a, b, c)
         implicit none
         real::x
         real, optional:: a,b,c
         end function

end interface
write(*, *) func(2.0, c = 1.0)
write(*, *) func(2.0, a = 2.0, b = 1.0)
stop
end program   

real function func(x, a, b, c)
    implicit none
    real x ! this input is required
    real, optional:: a, b, c ! optional parameters
    real ra, rb, rc
    if (present(a)) then
        ra = a
    else
        ra = 0.0
    end if

    if (present(b)) then
        rb = b
    else
        rb = 0.0
    end if
    
    if (present(c)) then
        rc = c
    else
        rc = 0.0
    end if

    func = ra*x**2 + rb*x + rc
    return
end function
