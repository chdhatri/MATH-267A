data("Cars93", package = "MASS")

  #The graph shows a frequency histogram of Cars93$Price with right-closed bins on a
  #black background, with hotpink bars and cyan border around the bars.
  par(bg="black")
  hist(Cars93$Price,right=TRUE,col="hotpink",border="cyan",
       ann=FALSE, axes=FALSE, xlim=c(0,80),lwd=2,
       xaxt="n",yaxt="n",xlab="",ylab="")
  
  #Thefiguremarginsare(5,5,3,1).
  par(mar=c(5,5,3,1))
  
  #The horizontal axis is limegreen with orangered tick marks. 
  #The tick marks are labeled in a bold, san serif typeface, 
  #with a font size that is 0.75 times the default value and colored whitesmoke.
 
  
   axis(1,col="limegreen",xaxp=c(0,70,1), xaxs="i",
       at = seq.int(0, 70, by = 10),
       col.ticks = "orangered",col.axis="whitesmoke",
   family="sans", font=2, tcl=-0.5, cex.axis=0.75)
   
  
   # The vertical axis is purple with a line width of twice the default value. 
   #The major tick marks are aquamarine with a line width of twice the default value; 
   #they are labeled in a bold, italic, and serif typeface, 
   #with a font size that is twice the default value and colored tomato.
   
   axis(2, col="purple",lwd=2,   
        at = seq.int(0, 30, by = 10),
        col.ticks = "aquamarine", lwd.ticks=2,
        tcl= -0.3)
   axis(2, col="purple",lwd=2, yaxp=c(0,30,1),yaxs="i",  
        at = seq.int(0, 30, by = 10),
        col.ticks = "aquamarine", lwd.ticks=2,col.axis = "tomato",
        family="serif", font=4, tcl= 0.3, las=2,  cex.axis=2)
   
  
   #The minor tick marks are gold with a line width of twice the default value; 
   #they are labeled in a bold, sans serif typeface using the default font size
   ?axis
   axis(2,col="purple",lwd=2,tcl=0.5,col.ticks ="gold",lwd.ticks=2,family = 'sans',
        at=c(15,25),font=2,col.axis="gold",padj=4.5)
   
   # The label for the horizontal axis is yellow and right-justified, 
   #with a font size that is twice the default value, and has a italic, 
   #sans serif typeface.
   mtext("Horizontal axis", col="yellow", side=1, cex=2, family="sans", line=3, font=3, adj=1,padj=0, at=c(70))
   
   
   #The label for the vertical axis is skyblue and centered, 
   #with a font size that is 1.5 times the default value, 
   #and has a san serif typeface.
   mtext("Vertical axis", col="skyblue", side=2, cex=1.5, line=3, adj=0.5,family="sans")
   
   #The main title “Gaudy” is blue and centered, with a font size that is three times the default value, 
   #and has a bold, monospaced typeface.
   mtext("Gaudy", col="blue", family="mono", font=2,side=3, cex=3, adj=0.5)
   
   #The text “Histogram” is blue with a font size that is three times the default value. 
   #It is positioned at the coordinate (25, 15) and rotated 40◦ 
   #counterclockwise with respect to the horizontal axis.
   text(25, 15, "Histogram", srt = 40, xpd = TRUE, pos = 3, col="blue",cex=3)

   ?text
  # graphics.off()
  
  