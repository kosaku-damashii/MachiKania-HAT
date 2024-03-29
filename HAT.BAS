WIDTH 80:USEGRAPHIC 9:GCLS
USEVAR DR,SX,SY,MAXW
MAXW=SYSTEM(22)
DIM D(MAXW)
FOR I=0 TO MAXW
  D(I)=100
NEXT
DR#=3.14/180
FOR Y=-180 TO 180 STEP 6
  FOR X=-180 TO 180 STEP 6
    R#=DR#*SQRT#(FLOAT#(X*X+Y*Y))
    Z#=100*COS#(R#)-30*COS#(3*R#)
    SX=INT(90+FLOAT#(X)/3-FLOAT#(Y)/6)
    SY=INT(40-FLOAT#(Y)/6-Z#/4)
    IF SX>=0 AND MAXW>=SX THEN
      IF D(SX)>SY THEN BOXFILL SX*2,SY*2,SX*2+1,SY*2+1,4:D(SX)=SY
    ENDIF
  NEXT
NEXT
WHILE INKEY()=0:WEND
END
