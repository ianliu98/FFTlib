subroutine z1f4kbi ( ido, l1, na, cc, in1, ch, in2, wa )

!*****************************************************************************80
!
!! Z1F4KB is an FFTPACK5 auxiliary routine.
!
!  License:
!
!    Licensed under the GNU General Public License (GPL).
!
!  Modified:
!
!    26 Ausust 2009
!
!  Author:
!
!    Original complex single precision by Paul Swarztrauber, Richard Valent.
!    Complex double precision version by John Burkardt.
!
!  Reference:
!
!    Paul Swarztrauber,
!    Vectorizing the Fast Fourier Transforms,
!    in Parallel Computations,
!    edited by G. Rodrigue,
!    Academic Press, 1982.
!
!    Paul Swarztrauber,
!    Fast Fourier Transform Algorithms for Vector Computers,
!    Parallel Computing, pages 45-63, 1984.
!
!  Parameters:
!
  implicit none

  integer ( kind = 4 ) ido
  integer ( kind = 4 ) in1
  integer ( kind = 4 ) in2
  integer ( kind = 4 ) l1

  real ( kind = 8 ) cc(in1,l1,ido,4)
  real ( kind = 8 ) ch(in2,l1,4,ido)
  real ( kind = 8 ) ci2
  real ( kind = 8 ) ci3
  real ( kind = 8 ) ci4
  real ( kind = 8 ) cr2
  real ( kind = 8 ) cr3
  real ( kind = 8 ) cr4
  integer ( kind = 4 ) i
  integer ( kind = 4 ) k
  integer ( kind = 4 ) na
  real ( kind = 8 ) ti1
  real ( kind = 8 ) ti2
  real ( kind = 8 ) ti3
  real ( kind = 8 ) ti4
  real ( kind = 8 ) tr1
  real ( kind = 8 ) tr2
  real ( kind = 8 ) tr3
  real ( kind = 8 ) tr4
  real ( kind = 8 ) wa(ido,3,2)

  if ( 1 < ido .or. na == 1 ) then

    do k = 1, l1
      ti1 = cc(2,k,1,1)-cc(2,k,1,3)
      ti2 = cc(2,k,1,1)+cc(2,k,1,3)
      tr4 = cc(2,k,1,4)-cc(2,k,1,2)
      ti3 = cc(2,k,1,2)+cc(2,k,1,4)
      tr1 = cc(1,k,1,1)-cc(1,k,1,3)
      tr2 = cc(1,k,1,1)+cc(1,k,1,3)
      ti4 = cc(1,k,1,2)-cc(1,k,1,4)
      tr3 = cc(1,k,1,2)+cc(1,k,1,4)
      ch(1,k,1,1) = tr2+tr3
      ch(1,k,3,1) = tr2-tr3
      ch(2,k,1,1) = ti2+ti3
      ch(2,k,3,1) = ti2-ti3
      ch(1,k,2,1) = tr1+tr4
      ch(1,k,4,1) = tr1-tr4
      ch(2,k,2,1) = ti1+ti4
      ch(2,k,4,1) = ti1-ti4
    end do

    do i = 2, ido
      do k = 1, l1
        ti1 = cc(2,k,i,1)-cc(2,k,i,3)
        ti2 = cc(2,k,i,1)+cc(2,k,i,3)
        ti3 = cc(2,k,i,2)+cc(2,k,i,4)
        tr4 = cc(2,k,i,4)-cc(2,k,i,2)
        tr1 = cc(1,k,i,1)-cc(1,k,i,3)
        tr2 = cc(1,k,i,1)+cc(1,k,i,3)
        ti4 = cc(1,k,i,2)-cc(1,k,i,4)
        tr3 = cc(1,k,i,2)+cc(1,k,i,4)
        ch(1,k,1,i) = tr2+tr3
        cr3 = tr2-tr3
        ch(2,k,1,i) = ti2+ti3
        ci3 = ti2-ti3
        cr2 = tr1+tr4
        cr4 = tr1-tr4
        ci2 = ti1+ti4
        ci4 = ti1-ti4

        ch(1,k,2,i) = wa(i,1,1)*cr2-wa(i,1,2)*ci2
        ch(2,k,2,i) = wa(i,1,1)*ci2+wa(i,1,2)*cr2
        ch(1,k,3,i) = wa(i,2,1)*cr3-wa(i,2,2)*ci3
        ch(2,k,3,i) = wa(i,2,1)*ci3+wa(i,2,2)*cr3
        ch(1,k,4,i) = wa(i,3,1)*cr4-wa(i,3,2)*ci4
        ch(2,k,4,i) = wa(i,3,1)*ci4+wa(i,3,2)*cr4

       end do
    end do

  else

    do k = 1, l1
       ti1 = cc(2,k,1,1)-cc(2,k,1,3)
       ti2 = cc(2,k,1,1)+cc(2,k,1,3)
       tr4 = cc(2,k,1,4)-cc(2,k,1,2)
       ti3 = cc(2,k,1,2)+cc(2,k,1,4)
       tr1 = cc(1,k,1,1)-cc(1,k,1,3)
       tr2 = cc(1,k,1,1)+cc(1,k,1,3)
       ti4 = cc(1,k,1,2)-cc(1,k,1,4)
       tr3 = cc(1,k,1,2)+cc(1,k,1,4)
       cc(1,k,1,1) = tr2+tr3
       cc(1,k,1,3) = tr2-tr3
       cc(2,k,1,1) = ti2+ti3
       cc(2,k,1,3) = ti2-ti3
       cc(1,k,1,2) = tr1+tr4
       cc(1,k,1,4) = tr1-tr4
       cc(2,k,1,2) = ti1+ti4
       cc(2,k,1,4) = ti1-ti4
    end do

  end if

  return
end