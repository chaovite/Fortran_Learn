! Select.f90 Demonstrate the use of Select Case control
!      structure
!-----------------------------------------------------
Program select_example
      Implicit None
      Integer :: wake, month
      do month = 12, 0, -1                  ! loop for 13 months
          print *, 'Month is ', month
          select case(month)
          case (0)
              print *, 'Last year'
          case (1)
              wake = 9
              print *, 'January,  wake = ', wake
          case (2)
              wake = 7
              print *, 'February, wake = ', wake
          case (4)
              wake = 6
              print *, 'April,    wake = ', wake
!          case default
 !             wake = 8
          end select
      end do
  End Program select_example

