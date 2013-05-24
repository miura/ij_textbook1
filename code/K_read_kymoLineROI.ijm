//kymograph Line ROI coordinates reader
//Kota Miura (miura a embl.de)

var xyscale=1.0000;
var dt=1.0000;

macro "Set Scale" {
	xyscale=getNumber("scale in um/ pixel?",xyscale);
}

macro "Set Time Resolution" {
	dt=getNumber("time in sec?",dt);
}

macro "Show Line Coordinates and Speed" {
	print("-------------------");
	velocity=1.00000;
	dx=1.0000;
	dy=1.0000;
	
	getLine(x1, y1, x2, y2, lineWidth);
	print("start ("+x1+" , "+y1+")   end ("+ x2 + " , " + y2 + ") ");
	dx=abs(x2-x1);
	dy=abs(y2-y1);
	dx *= xyscale;
	dy *= dt;
	velocity= dx/dy;
	if ((xyscale==1) && (dt==1)) {
		print("dx = "+ dx +"   dy = " + dy);
		print("Velocity = "+ d2s(velocity, 3) +" [pixels/frame]");
	} else {
		print("dx = "+ dx +"um   during:" + dy + "sec");
		print("Velocity = "+ d2s(velocity, 3) +" [um/s]");
	}
	
}

