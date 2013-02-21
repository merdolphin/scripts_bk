	implicit none
	character a4*4,fileproj(10)*70,filinp*70
	integer i,j,k,ns0,ns,na,nv,kall
	parameter (ns0=10000*3)
	real*8 p(ns0)

	a4="proj"

	write(*,*) 'input the file name of projection'
	read(*,1) filinp
	write(*,*) 'input the numbers of eigenvector,
     &   number of degree of freedom'
	read(*,*) nv
1	format(a70)

c	ns=na*3

	ns=nv+1

	do j=1,nv 
        call getfilname(a4,j,fileproj(j))
	open(30+j,file=fileproj(j),status='unknown')
	enddo

	open(21,file=filinp,status='old',form='unformatted')
	read(21) kall	
	do i=1,kall
	read(21) (p(j),j=1,ns)

	do j=1,nv
	write(30+j,22) p(1),p(j+1)
	enddo

	enddo
22	format(2f25.15)

	do j=1,nv
        close(30+j)
        enddo

	end



        subroutine getfilname(a4,j,fileproj)
        implicit none
        character a4*4,fileproj*70
        integer j,i,j1,kk0,kk1,k,nn
        parameter(nn=6)
        character b(nn)

        if(j.ge.10**nn .or. j.lt. 0) stop 'j out of range '
        j1=j
        kk0=ichar("0")
c       write(*,*) kk0

c        kk1=ichar("1")
c        write(*,*) kk1

        fileproj=".dat"

        do k=1,nn
          i=j1/10**(nn-k)
          j1=j1-i*10**(nn-k)
          b(k)=char(kk0+i)
        enddo

        do k=nn,1,-1
        fileproj=b(k)//fileproj
        enddo

        fileproj=a4//fileproj

c       write(*,*) fileproj

        end

