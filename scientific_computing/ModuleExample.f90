! ModuleExample . f90 : A module demo with a function 
! −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−− 
Module my_module
    Contains
    Real*8 Function f(x,y)
        Implicit None 
        Real*8 :: x,y
        f = sin(x*y) + 1.0
    End Function f 

    Subroutine f_sub(x,y,c) 
        Implicit None
        Real*8 :: x, y, c
        c = sin(x*y) + 1.0
        End Subroutine f_sub 
End Module
! −−− The main program that uses the module 

Program main
    Use my_module
    Implicit None
    Real*8 :: u=2.1415, v=1., c
    c = f(u,v)
    write (* ,*) 'function''s answer'
    call f_sub(u,v,c)
    write (* ,*) 'subroutine''s answer = ', c
End Program main
