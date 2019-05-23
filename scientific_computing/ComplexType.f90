! ComplexType.f90: Using complex procedure and type definitions
! -------------------------------------------------------------
Module complex_module
      ! Define complex type
      Type public_complex
          Real :: re=0.0, im=0.0   ! set default values.
      End Type public_complex

      ! Add the functions for complex mathematics
      Contains
          !-------------initialization--------
          subroutine init(a, re, im)
              Implicit None
              Type(public_complex), intent(out) :: a
              real, intent(in) :: re, im
              a%re = re
              a%im = im
          end subroutine init

          !-------------conjugate-------------
          Function conjugate(a)  result(b)
              Implicit None
              Type (public_complex), intent(in) :: a
              Type (public_complex) :: b
              b%re = a%re
              b%im = -a%im
          End Function conjugate

          !------------modulus---------------
          Function modulus(a) result(b)
              Implicit None
              Type (public_complex), intent(in) :: a
              real :: b
              b   = sqrt(a%re**2 + a%im**2)
          End Function modulus
          
          !------------phase----------------
          Function phase(a) result(b)
              Implicit None
              Type (public_complex), intent(in) :: a
              real :: b
              b   = atan2(a%im, a%re)
          End Function phase

          ! ------------addition--------------
          Function add(a, b)
              Implicit None
              Type (public_complex), intent(in) :: a , b
              Type (public_complex) :: add
              add%re  = a%re + b%re
              add%im  = a%im + b%im
          End Function add

          !-------------subtract b from a--------------
          Function subtract(a, b)
              Implicit None
              Type (public_complex), intent(in) :: a , b
              Type (public_complex) :: subtract
              subtract%re  = a%re - b%re
              subtract%im  = a%im - b%im
          End Function subtract
          !--------------multiple a and b--------------
          Function multiply(a, b)
              Implicit none
              Type (public_complex), intent(in) :: a, b
              Type (public_complex) :: multiply
              multiply%re = a%re*b%re - a%im*b%im
              multiply%im = a%im*b%re + a%re*b%im
          End Function multiply
          !-------------divide a by b------------------
          Function divide(a, b)
              Implicit none
              Type (public_complex), intent(in) :: a, b
              Type (public_complex) :: divide
              real :: r
              if (b%re==0. .and. b%im==0.) then
                  write(*,*) 'Error, division by zero ', & 
                             b%re, '+', b%im, 'i'
                  stop
              end if
              r         = (b%re**2 + b%im**2)
              divide%re = (a%re*b%re + a%im*b%im)/r
              divide%im = (a%im*b%re - a%re*b%im)/r
          End Function divide

          Function print_complex(a)
              Implicit None
              Type (public_complex), intent(in) :: a
              Character ch
              Character(len=80) :: print_complex
              if (a%im>=0.0) then
                  ch = '+'
              else
                  ch = '-'
              end if
              write(print_complex, "(F16.5, 5X, A1, F16.5,'i')") &
                    a%re, ch, abs(a%im) 
          End Function print_complex

End Module complex_module

Program Main_program
        Use complex_module
        Implicit None
        Type(public_complex) :: a, b, c
        Character(len=80) :: ch, ch_p
        
        call init(a, 1., 2.)
        !a%re = 1.
        !a%im = 2.
        !b%re = 3.
        !b%im = 4.

        if (a%im>=0.0) then
            ch = '+'
        else
            ch = '-'
        end if
        write(*,*) 'a     = ', print_complex(a)

        if (b%im>=0.0) then
            ch = '+'
        else
            ch = '-'
        end if
        write(*,*) 'b     = ', print_complex(b)

        c = add(a, b)
        if (c%im>=0.0) then
            ch = '+'
        else
            ch = '-'
        end if
        write(*,*) 'a + b = ', print_complex(c)

        c = subtract(a, b)
        if (c%im>=0.0) then
            ch = '+'
        else
            ch = '-'
        end if
        write(*,*) 'a - b = ', print_complex(c)
        write(*,*) '    b = ', print_complex(b)

        c = multiply(a, b)
        if (c%im>=0.0) then
            ch = '+'
        else
            ch = '-'
        end if
        write(*,*) 'a * b = ', print_complex(c)

        c = divide(a, b)
        if (c%im>=0.0) then
            ch = '+'
        else
            ch = '-'
        end if
        write(*,*) 'a / b = ', print_complex(c) 
        write(*,*) '    b = ', print_complex(b)

End program main_program
