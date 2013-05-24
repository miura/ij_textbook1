var linewidth = 8; 
var size =50;
macro "vertical stripes"{
	vertical(size);
}

function vertical(winsize){
	newImage("stripes", "8-bit black", winsize, winsize, 1);
	setForegroundColor(255, 255, 255);
	setLineWidth(linewidth);
	for(i=0; i<getWidth();i+=linewidth*2 ){
  		drawLine(i, 0, i, getHeight());
	}
	run("Gaussian Blur...", "sigma=1");	
}

macro "diagonal stripes"{
	vertical(size*2);
	run("Rotate... ", "angle=45 grid=0 interpolation=Bilinear");
	run("Specify...", "width="+size+" height="+size+" x="+size/2+" y="+size/2+"");
	run("Crop");
}



