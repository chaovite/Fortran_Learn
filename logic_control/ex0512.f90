program main
      ! practice select case
      ! select case must use integer, character, logical
      ! float number and complex are not acceptable.
      ! case must be a constant, variable is not acceptable.
      implicit none
      integer score
      character grade
      write(*,*) "Input score:"
      read(*,*) score
      select case(score)
      case(90:100)
          grade = 'A'
      case(80:89)
          grade = 'B'
      case(70:79)
          grade = 'C'
      case(60:69)
          grade = 'D'
      case(:59)
          grade = 'E'
      case default
          grade = '?'
      end select
      write(*,"('Grade:',A1)") grade
      stop 
      end


