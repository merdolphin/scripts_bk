	implicit none
c       the length ,mass, energy unit is Ang, Mp,kJ/mol

	character*70 fentr,fproj,favex,feigv,feigvc,fmass,fmasslab
	character*70 fcova,fcoor,fref,feigvcb,fconf

	character cpos*8,job,uplo,cbox*3,fileinp*70,fileproj*70

	integer na,i,nn,nt,nfile,ifile,ns,ifall
	integer j,k,kk,kka,nfskip,nd,nh,lwork,n1m,nc,sm
	real*8 tp,fct,s,kb,t,vkt,one,const
	parameter (sm=1,n1m=24,na=sm*n1m,tp=300.0,fct=0.632780034d0)
	parameter (kb=8.31451e-3,vkt=kb*tp,const=0.0d0,nd=2)
        parameter (nh=3,ns=nd*na,lwork=64*ns,one=1.0d0)
	real*8 dt,ratio,proj(ns),dih(na)
	real*8 sigij(ns*(ns+1)/2),sigi(ns),b(ns*(ns+1)/2),wks(ns,ns)
	real*8 x(ns),e,d1(ns),pi,vpi
	integer nl1,kinl,kleft,nlskip,np
	integer ktrans,krot,ten,nread,nltt,kref,iendcal
	integer ibox,kkall,nskip

	parameter(ten=10,vpi=180.0d0)
 11	format(a70)

	integer irot,k1,k2,k3

	irot=1
        job='V'
	uplo='U'
	pi=acos(-1.0d0)

C  calculate average coordinates and covariance matrix

	kk=0	
	kka=0
        nfskip=1

	fileinp="pca-dihedral.in"

	open(11,file=fileinp,status='old')
	
	read(11,*) nfile,dt,np
	read(11,11) fproj
	read(11,11) favex
	read(11,11) feigv
	read(11,11) feigvc
	read(11,11) feigvcb
	read(11,11) fcova

	
	write(*,*) nfile,'np=',np
	write(*,11) fproj
	write(*,11) favex
	write(*,11) feigv
	write(*,11) feigvc
	write(*,11) fcova
        write(*,*) dt
        read(11,*) nn,nskip
        write(*,*) nn,nskip

	do ifile=1,nfile

	read(11,11) fcoor
	write(*,11) fcoor

	open(1,file=fcoor,status='old')
	do i=1,nskip
	read(1,*) t
	enddo
	
	do nt=1,999999999

	read(1,*,end=25) t,(dih(j),j=1,na)

	do i=1,na
	x(2*i-1)=sin(dih(i)/vpi*pi)
	x(2*i  )=cos(dih(i)/vpi*pi)
	enddo	

	kk=kk+1
	
 21	format(a3)

27	format(a8)


	if( mod(kk,nfskip).eq.1 .or. nfskip.eq.1) then
	
	kka=kka+1

	if(kka.eq.1) then

        do j=1,ns
           sigi(j)=x(j)
	do i=j,ns
	   k3=i*(i-1)/2+j
	   sigij(k3)=x(j)*x(i)
        enddo
	enddo

c	write(95,*)  sigij
c	write(95,*) 'xxxxxxxxxxxxxxxxxxxxx'


	else

	do j=1,ns

	   sigi(j)=sigi(j)+x(j)

        do i=j,ns

	   k3=i*(i-1)/2+j
	   
           sigij(k3)=sigij(k3)+x(j)*x(i)
        enddo

	enddo

c	write(93,*) x

c	write(95,*)  sigij

	iendcal=0
	if(ifile.eq.nfile .and. nt.eq.nn) then
        do i=1,ns
        do j=1,i
	   k3=i*(i-1)/2+j
	   
          b(k3)=sigij(k3)/kka-(sigi(i)/kka)*
     &                        (sigi(j)/kka)
        enddo
        enddo
	


c	write(92,*) ds
c	write(92,*) 

******    unit of s kJ/mol

        open(81,file=fcova,form='unformatted',status='unknown')
        do i=1,ns
        write(81) (b(i*(i-1)/2+j),j=1,i)
        enddo
        close(81)



        ifall=0

c        call f02faf (job,uplo,ns,b,ns,d1,wks,lwork,ifall)
	k1=0
	call EIGEN (b,wks,ns,k1)
c        if(ifall .ne. 0) then
c          write(*,*) 'ifall= ',ifall
c          stop
c        endif

        open(51,file=feigv,status='unknown')
        do i=1,ns
	d1(i)=b(i*(i+1)/2)
        write(51,75) i,d1(i)
        enddo
        close(51)


        endif

	

	endif	
	endif
	enddo	!nt
	close(1)

	enddo   !ifile

23	format(1x,3f25.9)
	
25	continue

	close(11)
	close(41)
        close(1)

	do i=1,ns
	sigi(i)=sigi(i)/kka
	enddo

        open(11,file=favex,status='unknown')
        do i=1,ns/nd
        write(11,23) (sigi(nd*i-nd+j),j=1,nd)
        enddo
        close(11)


	open(11,file=feigvc,status='unknown')
	do i=1,ns/nd
	write(11,71) (nd*i-nd+j,j=1,nd)
	write(11,72) (d1(nd*i-nd+j),j=1,nd) 	
	write(11,73) 'X','Y','X','Y'
	
        k1=i*nd-1 
        k2=i*nd

	do j=1,ns/nd
	
	write(11,74) j,(wks(nd*j-nd+k,k1),k=1,nd),
     &  (wks(nd*j-nd+k,k2),k=1,nd)
	enddo

	enddo
71	format(3i22)
72	format(17x,f9.4,14x,f9.4,14x,f9.4)
73	format(14x,a1,6x,a1,6x,a1,8x,a1,6x,a1,6x,a1,8x,a1,6x,a1,6x,a1)
74	format(i4,6x,3f7.2,2x,3f7.2,2x,3f7.2)
75	format(i6,e25.15)
	close(11)

        open(11,file=feigvcb,form='unformatted',status='unknown')
	do i=1,ns
	write(11) (wks(j,i),j=1,ns)
	enddo
	close(11)
	
	write(*,*) 'projection begin'

	WRITE(*,*) 'TOTAL data is ',kka
c	if(kka.gt.-1) stop

	kkall=kka
C******************  projection begin******************
	kk=0	
        kka=0


        open(11,file=fileinp,status='old')

        read(11,*)  i
	read(11,11) fproj
        read(11,11) fentr
	read(11,11) fentr
	read(11,11) fentr
	read(11,11) fentr
	read(11,11) fentr

        read(11,*) nn,nskip
        write(*,*) nn,nskip

	
	open(61,file=fproj,form='unformatted',status='unknown')
	write(61) kkall

        do ifile=1,nfile
        read(11,11) fcoor
        write(*,11) fcoor

        open(1,file=fcoor,status='old')

        do i=1,nskip
        read(1,*) t
        enddo

        do nt=1, kkall

        kk=kk+1

        read(1,*) t,(dih(j),j=1,na)

        do i=1,na
        x(2*i-1)=sin(dih(i)/vpi*pi)
        x(2*i  )=cos(dih(i)/vpi*pi)
        enddo   



        if(mod(kk,nfskip).eq.1 .or. nfskip.eq.1) then
	
	kka=kka+1
	
	do i=1,np
          s=0.0d0
          do j=1,ns
            s=s+(x(j)-sigi(j))*wks(j,i)
          enddo
	  proj(i)=s
        enddo  

	write(61) kka*dt*nfskip,(proj(i),i=1,np)

	endif

	enddo
	enddo
	close(61)

	goto 901	
500	write(*,*) 'read data error'
	write(*,*) 'ifile,nt,i, ',ifile,nt,i
901	continue
	
 	end

        subroutine adjust(n,x,xp,xc,xb,ibox)
        implicit none
        integer n,i,j,k,dtj,na,ibox
        real*8 p,x(n),dd
        real*8 xp(n)
        real*8 xc(n)
        real*8 xd(3),xb(3)
C  period of othorgoal box

	if(ibox.eq.1) then
	
        do i=1,n/3
	do j=1,3
           xd(j)=x(3*i-3+j)-xp(3*i-3+j)
	   xd(j)=xd(j)-int(xd(j)/xb(j))*xb(j)
              
	   if(abs(xd(j)).gt.xb(j)/2.0) then
c              xd(j)=xd(j)-abs(xd(j))/xd(j)*xb(j)
	     if(xd(j).gt.0.0) then
	       p=1.0d0
	     else
	       p=-1.0d0
	     endif
	    xd(j)=xd(j)-p*xb(j)
           endif
	   if(abs(xd(j)).gt.xb(j)/2.0d0) stop 'xd too large'
           xc(3*i-3+j)=xc(3*i-3+j)+xd(j)
c           if(abs(xc(3*i-3+j)-x(3*i-3+j)) .gt. 1.0d-3) then
c	      write(*,*) xc(3*i-3+j),x(3*i-3+j)
c	   endif

        enddo
	enddo
	
	endif

	if(ibox.eq.2) then
C  period of octhedral cubic box


        do i=1,n/3

        dd=0.0d0

        do j=1,3
           xd(j)=x(3*i-3+j)-xp(3*i-3+j)
           xd(j)=xd(j)-int(xd(j)/xb(1))*xb(1)

           if(abs(xd(j)).gt.xb(1)/2.0) then
              xd(j)=xd(j)-abs(xd(j))/xd(j)*xb(1)
           endif

           dd=dd+abs(xd(j))
        enddo
          if(dd .gt. 0.75*xb(1)) then
            do j=1,3
             xd(j)=xd(j)-abs(xd(j))/xd(j)*xb(1)*0.5d0
            enddo
          endif

          do j=1,3
           xc(3*i-3+j)=xc(3*i-3+j)+xd(j)
          enddo
        enddo
	
	endif

	if(ibox.ne.1 .and. ibox.ne.2) then
	write(*,*) "ibox= ",ibox
	stop
	endif
	
        end

        subroutine disperid(n,x,xp,xc,xb)
        implicit none
        integer n,i,j,k,dtj,na
        real*8 pi,x(n)
        real*8 xp(n)
        real*8 xc(n)
        real*8 xd(3),xb(3)
C  period of othorgoal box


        do i=1,n/3
        do j=1,3
           xd(j)=x(3*i-3+j)-xp(3*i-3+j)
           xd(j)=xd(j)-int(xd(j)/xb(j))*xb(j)

           if(abs(xd(j)).gt.xb(j)/2.0) then
              xd(j)=xd(j)-abs(xd(j))/xd(j)*xb(j)
           endif
	   if(abs(xd(j)).gt.xb(j)/2.0) stop 'distance too large'
           xc(3*i-3+j)=xd(j)
        enddo
        enddo

        end


C     SUBROUTINE LSQSTR (NR, W, XP, X, E, IROT, NDIM)
C
CCCCCC W.F. VAN GUNSTEREN, CAMBRIDGE, JULY 1979 CCCCCCCCCCCCCCCCCCCCCCC
C      I.G. TIRONI, ZUERICH, AUGUST 1995                                 
C                                                                      
COMMENT   LSQSTR ROTATES THE ATOMS WITH COORDINATES X ABOUT THE ORIGIN 
C     SUCH THAT THE FUNCTION E = 0.5 * SUM OVER ALL NR ATOMS OF        
C     W*(X-XP)**2 HAS A MINIMUM. HERE W DENOTES THE WEIGHT FACTORS AND 
C     XP ARE THE REFERENCE COORDINATES. FOR A DESCRIPTION OF THE       
C     METHOD SEE A.D. MCLACHLAN, J. MOL. BIOL. 128 (1979) 49.          
C     IF THE SUBROUTINE FAILS, IT IS RETURNED WITH A MESSAGE AND       
C     IROT=0.                                                          
C                                                                      
C     NR = NUMBER OF ATOMS                                             
C     W(1..NR) = ATOMIC WEIGHT FACTORS                                 
C     XP(1..3*NR) = REFERENCE ATOM COORDINATES                         
C     X(1..3*NR) = ATOM COORDINATES; DELIVERED WITH THE ROTATED ONES   
C     E = DELIVERED WITH THE MINIMUM VALUE OF THE FUNCTION E (IROT=2)  
C     IROT = 1 : X IS ROTATED, E IS NOT COMPUTED                       
C          = 2 : X IS ROTATED AND E IS COMPUTED                        
C     NDIM = MUNBER OF DIMENSIONS (RESTRICTED TO 3)
C                                                                      
C     LSQSTR USES SUBR. EIGEN.                                         
C                                                                      
COMMEND
      
      SUBROUTINE LSQSTR (NR, W, XP, X, E, IROT, NDIM)
      implicit double precision (a-h,o-z)

C     ARGS
      INTEGER NR, IROT, NDIM
      REAL*8 W(NR), XP(NDIM * NR), X(NDIM * NR),
     $     E

C     LOCAL
      INTEGER KDIM, MAXOM, MAXC
      PARAMETER (KDIM = 3, MAXOM = 6, MAXC = 21)
      
      INTEGER NEW, M1, M2, I, J, M
      REAL*8  XJ(KDIM), XPJ(KDIM), U(KDIM,KDIM),
     $     COM(MAXC), OM(MAXOM, MAXOM), 
     $     VH(KDIM,KDIM), VK(KDIM,KDIM), 
     $     TWO, SQT2, DU, SIG, SIGD

C     R(KDIM,KDIM)

C     WEIRD THINGS...
C      EQUIVALENCE (U(1,1), R(1,1))
      
      SAVE NEW, TWO, SQT2

      DATA NEW/0/
C
C     BEGIN

      IF (NEW.NE.0) GOTO 8
      NEW=1
      TWO=2.E0
      SQT2= SQRT(TWO)
    8 CONTINUE
C
C*****CALCULATE THE MATRIX U AND ITS DETERMINANT
      DO 40 M2=1,3
      DO 38 M1=1,3
   38 U(M1,M2)=0.E0
   40 CONTINUE
      I=0
      DO 70 J=1,NR
      DO 50 M=1,3
      XJ(M)=X(I+M)
   50 XPJ(M)=XP(I+M)
      DO 60 M2=1,3
      DO 58 M1=1,3
   58 U(M1,M2)=U(M1,M2)+W(J)*XJ(M1)*XPJ(M2)
   60 CONTINUE
      I=I+3
   70 CONTINUE
C
      DU= U(1,1)*U(2,2)*U(3,3)+U(1,3)*U(2,1)*U(3,2)
     2   +U(1,2)*U(2,3)*U(3,1)-U(3,1)*U(2,2)*U(1,3)
     3   -U(3,3)*U(2,1)*U(1,2)-U(3,2)*U(2,3)*U(1,1)
      IF ( ABS(DU).LT.1.E-10) GOTO 1002
      SIGD=DU/ ABS(DU)
C
C*****CONSTRUCT OMEGA, DIAGONALIZE IT AND DETERMINE H AND K
      M=0
      DO 130 M1=1,6
      DO 128 M2=1,M1
      M=M+1
      IF (M1.GT.3.AND.M2.LE.3) GOTO 126
      COM(M)=0.E0
      GOTO 128
  126 COM(M)=U(M2,M1-3)
  128 CONTINUE
  130 CONTINUE
C
      CALL EIGEN (COM,OM,6,0)
      IF (DU.LT.0.E0.AND. ABS(COM(3)-COM(6)).LT.1.E-5) GOTO 1004
C
      DO 140 M2=1,3
      DO 138 M1=1,3
      VH(M1,M2)=SQT2*OM(M1,M2)
  138 VK(M1,M2)=SQT2*OM(M1+3,M2)
  140 CONTINUE
      SIG= (VH(2,1)*VH(3,2)-VH(3,1)*VH(2,2))*VH(1,3)
     2    +(VH(3,1)*VH(1,2)-VH(1,1)*VH(3,2))*VH(2,3)
     3    +(VH(1,1)*VH(2,2)-VH(2,1)*VH(1,2))*VH(3,3)
      IF (SIG.GT.0.E0) GOTO 160
      DO 150 M=1,3
      VH(M,3)=-VH(M,3)
  150 VK(M,3)=-VK(M,3)
  160 CONTINUE
C
C*****DETERMINE R AND ROTATE X
      DO 230 M2=1,3
      DO 228 M1=1,3
  228 U(M1,M2)=VK(M1,1)*VH(M2,1)+VK(M1,2)*VH(M2,2)
     2         +SIGD*VK(M1,3)*VH(M2,3)
  230 CONTINUE
C
      I=0
      DO 270 J=1,NR
      DO 250 M=1,3
  250 XPJ(M)=X(I+M)
      DO 260 M1=1,3
      XJ(M1)=0.E0
      DO 258 M2=1,3
  258 XJ(M1)=XJ(M1)+U(M1,M2)*XPJ(M2)
  260 X(I+M1)=XJ(M1)
      I=I+3
  270 CONTINUE
C
C*****CALCULATE E, WHEN REQUIRED
      IF (IROT.LT.2) RETURN
      E=0.E0
      I=0
      DO 290 J=1,NR
      DO 288 M=1,3
      I=I+1
  288 E=E+W(J)*(X(I)-XP(I))**2
  290 CONTINUE
      E=E/2.E0
      RETURN
C
C*****PRINT ERROR MESSAGES
 1002 PRINT 1102
      IROT=0
      RETURN
 1004 PRINT 1104
      IROT=0
      RETURN
C
 1102 FORMAT (/,' DETERMINANT OF U EQUALS ZERO')
 1104 FORMAT (/,' DETERMINANT OF U IS NEGATIVE AND CAPITAL OMEGA HAS D',
     $     'EGENERATE EIGENVALUES')
C
C     END LSQSTR
      END

C     $Id: eigen.f,v 1.3 1995/12/02 17:20:44 ili Exp $
C

COMMSUBR EIGEN
C
C      SUBROUTINE EIGEN (A,R,N,MV)
C
CCCCCC W.F. VAN GUNSTEREN, CAMBRIDGE, JUNE 1979 CCCCCCCCCCCCCCCCCCCCCCC
C      I. TIRONI, ZUERICH, SEPT.  1995                                 
C                                                                      
C     SUBROUTINE EIGEN (A,R,N,MV)                                      
C                                                                      
COMMENT   EIGEN COMPUTES EIGENVALUES AND EIGENVECTORS OF THE REAL*8      
C     SYMMETRIC N*N MATRIX A, USING THE DIAGONALIZATION METHOD         
C     DESCRIBED IN "MATHEMATICAL METHODS FOR DIGITAL COMPUTERS", EDS.  
C     A.RALSTON AND H.S.WILF, WILEY, NEW YORK, 1962, CHAPTER 7.        
C     IT HAS BEEN COPIED FROM THE IBM SCIENTIFIC SUBROUTINE PACKAGE.   
C                                                                      
C     A(1..N*(N+1)/2) = MATRIX TO BE DIAGONALIZED, STORED IN SYMMETRIC 
C                       STORAGE MODE, VIZ. THE I,J-TH ELEMENT (I.GE.J) 
C                       IS STORED AT THE LOCATION K=I*(I-1)/2+J IN A;  
C                       THE EIGENVALUES ARE DELIVERED IN DESCENDING    
C                       ORDER ON THE DIAGONAL, VIZ. AT THE LOCATIONS   
C                       K=I*(I+1)/2                                    
C     R(1..N,1..N) = DELIVERED WITH THE CORRESPONDING EIGENVECTORS     
C                    STORED COLUMNWISE                                 
C     N = ORDER OF MATRICES A AND R                                    
C     MV = 0 : EIGENVALUES AND EIGENVECTORS ARE COMPUTED               
C        = 1 : ONLY EIGENVALUES ARE COMPUTED                           
C                                                                      
COMMEND

      SUBROUTINE EIGEN (A, R, N, MV)
      implicit double precision (a-h,o-z)

C     ARGS
      INTEGER N, MV
      REAL*8 A(N*(N + 1)/2), R(N * N)

C     LOCAL
      INTEGER I, IA, IQ, IJ, IL, ILR, ILQ, 
     $     IM, IMR, IMQ, IND, J, JQ,
     $     K, 
     $     L, LL, LQ, LM, MQ, M, MM 
      REAL*8 RANGE, ANORM, ANRMX, THR,
     $     X, Y, SINCS, SINX2, SINX, COSX, COSX2

C
C     BEGIN

C
C*****GENERATE IDENTITY MATRIX
      RANGE=1.E-12
      IF (MV-1) 10,25,10
   10 IQ=-N
      DO 20 J=1,N
      IQ=IQ+N
      DO 20 I=1,N
      IJ=IQ+I
      R(IJ)=0.E0
      IF (I-J) 20,15,20
   15 R(IJ)=1.E0
   20 CONTINUE
C
C*****COMPUTE INITIAL AND FINAL NORMS (ANORM AND ANRMX)
   25 ANORM=0.E0
      DO 35 I=1,N
      DO 35 J=I,N
      IF (I-J) 30,35,30
   30 IA=I+(J*J-J)/2
      ANORM=ANORM+A(IA)*A(IA)
   35 CONTINUE
      IF (ANORM) 165,165,40
   40 ANORM=1.414E0* SQRT(ANORM)
      ANRMX=ANORM*RANGE/REAL(N)
C
C*****INITIALIZE INDICATORS AND COMPUTE THRESHOLD, THR
      IND=0
      THR=ANORM
   45 THR=THR/REAL(N)
   50 L=1
   55 M=L+1
C
C*****COMPUT SIN AND COS
   60 MQ=(M*M-M)/2
      LQ=(L*L-L)/2
      LM=L+MQ
      IF ( ABS(A(LM))-THR) 130,65,65
   65 IND=1
      LL=L+LQ
      MM=M+MQ
      X=0.5E0*(A(LL)-A(MM))
      Y=-A(LM)/ SQRT(A(LM)*A(LM)+X*X)
      IF (X) 70,75,75
   70 Y=-Y
   75 SINX=Y/ SQRT(2.E0*(1.E0+( SQRT(1.E0-Y*Y))))
      SINX2=SINX*SINX
      COSX= SQRT(1.E0-SINX2)
      COSX2=COSX*COSX
      SINCS=SINX*COSX
C
C*****ROTATE L AND M COLUMNS
      ILQ=N*(L-1)
      IMQ=N*(M-1)
      DO 125 I=1,N
      IQ=(I*I-I)/2
      IF (I-L) 80,115,80
   80 IF (I-M) 85,115,90
   85 IM=I+MQ
      GOTO 95
   90 IM=M+IQ
   95 IF (I-L) 100,105,105
  100 IL=I+LQ
      GOTO 110
  105 IL=L+IQ
  110 X=A(IL)*COSX-A(IM)*SINX
      A(IM)=A(IL)*SINX+A(IM)*COSX
      A(IL)=X
  115 IF (MV-1) 120,125,120
  120 ILR=ILQ+I
      IMR=IMQ+I
      X=R(ILR)*COSX-R(IMR)*SINX
      R(IMR)=R(ILR)*SINX+R(IMR)*COSX
      R(ILR)=X
  125 CONTINUE
      X=2.E0*A(LM)*SINCS
      Y=A(LL)*COSX2+A(MM)*SINX2-X
      X=A(LL)*SINX2+A(MM)*COSX2+X
      A(LM)=(A(LL)-A(MM))*SINCS+A(LM)*(COSX2-SINX2)
      A(LL)=Y
      A(MM)=X
C
C*****TESTS FOR COMPLETION
C
C*****TEST FOR M = LAST COLUMN
  130 IF (M-N) 135,140,135
  135 M=M+1
      GOTO 60
C
C*****TEST FOR L = SECOND FROM LAST COLUMN
  140 IF (L-(N-1)) 145,150,145
  145 L=L+1
      GOTO 55
  150 IF (IND-1) 160,155,160
  155 IND=0
      GOTO 50
C
C*****COMPARE THRESHOLD WITH FINAL NORM
  160 IF (THR-ANRMX) 165,165,45
C
C*****SORT EIGENVALUES AND EIGENVECTORS
  165 IQ=-N
      DO 185 I=1,N
      IQ=IQ+N
      LL=I+(I*I-I)/2
      JQ=N*(I-2)
      DO 185 J=I,N
      JQ=JQ+N
      MM=J+(J*J-J)/2
      IF (A(LL)-A(MM)) 170,185,185
  170 X=A(LL)
      A(LL)=A(MM)
      A(MM)=X
      IF (MV-1) 175,185,175
  175 DO 180 K=1,N
      ILR=IQ+K
      IMR=JQ+K
      X=R(ILR)
      R(ILR)=R(IMR)
  180 R(IMR)=X
  185 CONTINUE
C
C     END EIGEN
      END

	subroutine rmmassct(na,ns,x,mm,tm)
	implicit none
	integer na,ns,nd
	real*8 x(ns),mm(na)
	real*8 xc(3),tm
	integer i,j,k
	
	do i=1,3
	xc(i)=0.0d0
	enddo

	do j=1,3
	
	do i=1,na 
	xc(j)=xc(j)+mm(i)*x(3*i-3+j)
	enddo

	enddo
	
	
	do j=1,3
	xc(j)=xc(j)/tm
	do i=1,na
	x(3*i-3+j)=x(3*i-3+j)-xc(j)
	enddo

	enddo

91	format(7f15.9)
	end


        subroutine fdct(ns,na,nc,n1m,x,mm,ttm,xm)
        implicit none
        integer ns,na,nc,n1m
        real*8 x(ns),mm(na)
        real*8 xm(nc),tm,ttm
        integer i,j,k,m,m1

	do j=1,nc/3
	do k=1,3
	  tm=0.0d0
	do i=1,n1m

	m1=(j-1)*n1m+i
	m=3*m1-3+k
        
	  tm=tm+mm(m1)*x(m)
	enddo
          xm(3*j-3+k)=tm/(ttm*ttm)
	enddo
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

