      implicit none
      integer ng,n1,n2,nn,ng0,k1,i,j,k,np,kall,ntt
      parameter (nn=5000,ng0=nn*nn)
      real*8 v1,v2,da1,da2,s,vv(ng0),t,v11,v12,v21,v22
	real*8 dkt,g,dm,y(nn),ymax1,ymax2,temp
      character*80 fin1,fin2,fout,fn3
	character*20 xlabel,ylabel,toplabel
	integer iform,ixymax,nskip
11     format(a80)
13     format(a20)


	open(1,file='free-ene-gp2dmp-plotmtv-general.in',status='old')
	read(1,*) iform
	
	read(1,11) fin1

	read(1,11) fout
        read(1,*) temp
	read(1,*) np,n1,n2,ng,ixymax
	read(1,13) xlabel
	read(1,13) ylabel
	read(1,13) toplabel
        read(1,*) nskip,ntt
	if (ixymax .ne. 0) then
          read(1,*) v11,v12
          read(1,*) v21,v22
	endif
	close(1)

        data vv/ng0*0.0d0/

	dkt=8.31/1000.0*temp/4.182  ! in unit of kcal/mol

	write(*,11) fin1
	write(*,11) fout
	write(*,*) 'read data column ',n1,n2
	write(*,*) 'temp,dkt=',temp,dkt

	kall=999999999
	
	if (ixymax.eq.0) then
        s=0.0

	v11=10000
	v12=-10000

        v21=10000
        v22=-10000


	if(iform.eq.0) then
          open(1,file=fin1,status='old',form='unformatted')
	  read(1) kall
          write(*,*) 'kall=',kall
	else
          open(1,file=fin1,status='old')
        endif

 	if(ntt.eq.0) ntt=kall
 	write(*,*) 'ntt-nskip= ',ntt-nskip

	do j=1,nskip

        if(iform.eq.0) then
          read(1,end=20,err=900) t,(y(i),i=1,np)
        else
          read(1,*,end=20,err=900) t,(y(i),i=1,np)
        endif

	enddo


	do j=1,ntt-nskip

        if(iform.eq.0) then
          read(1,end=20,err=900) t,(y(i),i=1,np)
        else
          read(1,*,end=20,err=900) t,(y(i),i=1,np)
	endif

	v1=y(n1)
	v2=y(n2)

        if(v11.gt.v1) v11=v1
        if(v12.lt.v1) v12=v1
        if(v21.gt.v2) v21=v2
        if(v22.lt.v2) v22=v2

	enddo
	
20	close(1)

	write(*,*) 'ntt= ',j-1
C	ntt=j-1

	v11=v11-0.2
	v12=v12+0.2
	v21=v21-0.2
        v22=v22+0.2
       endif  ! ixymax == 0

	da1=(v12-v11)/ng
	da2=(v22-v21)/ng

	write(*,*) 'ymax1= ',v11,v12
	write(*,*) 'ymax2= ',v21,v22
      
        if(iform.eq.0) then
          open(1,file=fin1,status='old',form='unformatted')
          read(1) kall
          write(*,*) 'kall=',kall
        else
          open(1,file=fin1,status='old')
        endif

        if(ntt.eq.0) ntt=kall
        write(*,*) 'ntt-nskip= ',ntt-nskip

        do j=1,nskip

        if(iform.eq.0) then
          read(1,end=40,err=900) t,(y(i),i=1,np)
        else
          read(1,*,end=40,err=900) t,(y(i),i=1,np)
        endif

        enddo


        do k1=1,ntt-nskip
	
        if(iform.eq.0) then
          read(1,end=40) t,(y(i),i=1,np)
        else
          read(1,*,end=40) t,(y(i),i=1,np)
        endif

	v1=y(n1)
        v2=y(n2)
	
	
	if (v1 .gt. v11 .and. v1 .lt. v12 .and. 
     C      v2 .gt. v21 .and. v2 .lt. v22) then
	
      i=int((v1-v11)/da1)
      if(v1.gt.v11) i=i+1

      j=int((v2-v21)/da2)
      if(v2.gt.v21) j=j+1

      k=(i-1)*ng+j
c	write(*,*) 'v1,v2 = ',v1,v2
c	write(*,*) 'i,j= ',i,j
	
c	write(*,*) 'k= ',k
c	read(*,*) i
      
      vv(k)=vv(k)+1.0
      s=s+1.0
      endif

	enddo

	goto 40


900	write(*,*) 'data error'
	write(*,*) 'j=',j
	stop 
 40   close(1)
	
	k1=k1-1
      write(*,*) 's=',s
      write(*,*) 'k1=',k1
      write(*,*) 'data usage:', s/k1*100,"%"

      fn3='gp2dmp36'  

	dm=0.0
      do i=1,ng
      do j=1,ng
         k=(i-1)*ng+j
c         write(1,12) (i*1.0-0.5)*da1+v11,(j*1.0-0.5)*da2+v21, vv(k)/s
	 if( dm .lt. vv(k)) dm=vv(k)
      enddo
      enddo

	s=0.0
      do i=1,ng
      do j=1,ng
         k=(i-1)*ng+j
	 if(vv(k).eq.0.0) then 
	    g=-20000.0
	 else
	    g=dkt*log(dm/vv(k))
	 endif
	if(s.lt.g) s=g
      enddo
      enddo
	
	write(*,*) 'Max g = ',s

      open(1,file=fout,status='unknown')
      open(2,file=fn3,status='unknown')
	write(1,*) '$DATA=CONTOUR'
	write(1,*) '%contstyle=2'
	write(1,*) '%nx=',ng
	write(1,*) '%ny=',ng
	write(1,*) '%xmin=',v11
	write(1,*) '%ymin=',v21
	write(1,*) '%xmax=', v12
        write(1,*) '%ymax=', v22
        write(1,*) '%nsteps=50'
        write(1,'("%xlabel=",a20)')   xlabel
        write(1,'("%ylabel=",a20)')   ylabel
	write(1,'("%toplabel=",a20)') toplabel
	
C$DATA=CONTOUR
C %contstyle=2
C %nx= 50
C %ny= 50
C %xmin= -2.85817384
C %ymin= -2.20088001
C %xmax=  2.85817384
C %ymax=  2.20088001
C %nsteps=50
C %xlabel=PC-1 (A)
C %ylabel=PC-2 (A)
C %toplabel=Dihedral-PCA-100ns

      do j=1,ng
      do i=1,ng

         k=(i-1)*ng+j
         if(vv(k).eq.0.0) then
            g=s+0.01
         else
            g=dkt*log(dm/vv(k))
         endif
         write(1,12) g
	 write(2,12) (i*1.0-0.5)*da1+v11,(j*1.0-0.5)*da2+v21, g
      enddo
      enddo

	write(1,*) '$END'
      close(1)
 12   format(1x,3f20.9)

      end
