size(8cm,0);
import tube;
import graph3;
defaultpen(fontsize(10pt));
currentlight=Headlamp;

currentprojection=orthographic(-5,-2,1.6);

triple or = (0,0,0);

// track path
real B = 1000;      //
real R = 16000; // track radius
real alf = 12;    // track arc angle
triple C = (0,R,0);

path3 railR = arc(C,(0,B/2,0),C+((R-B/2)*Sin(alf),-(R-(B/2))*Cos(alf),0));
path3 railL = arc(C,(0,-B/2,0),C+((R+B/2)*Sin(alf),-(R+B/2)*Cos(alf),0));

//rail half  section
path sec = (0,0) -- (74.613,0) .. (76.200,1.588) -- (76.200,8.631) ..
            (73.795,11.711) -- (26.423,23.554) .. (12.121,39.838) ..
            (8.731,98.425) .. (11.104,129.385)  .. (15.472,138.885) ..
            (19.571,141.418) -- (31.316,144.354) .. (37.298,152.216) --
            (36.848,170.198) .. (27.779,183.143) .. (17.780,185.293) ..
            (0,185.738); 
// create full section using mirror
path secT = buildcycle(reflect((0,0),(0,1))*sec,sec);


// solid render
draw(tube(railR,rotate(-88.6)*secT),white,render(merge=true));
draw(tube(railL,rotate(-91.4)*secT),white,render(merge=true));

// coordinate system
label("$O$",or,S);
dot(or);
draw(L=Label("$X$", position=Relative(1.1), align=NE),or--or+(200,0,0),red,Arrow3);
draw(L=Label("$Y$", position=Relative(1.1), align=W),or--or+(0,200,0),green,Arrow3);
draw(L=Label("$Z$", position=Relative(1.1), align=N),or--or+(0,0,200),blue,Arrow3);

// center line
draw(arc(C,(0,0,0),C+(R*Sin(alf),-R*Cos(alf),0)),dashdotted); 


// rail coordinate system
triple ror = C + (R*Sin(alf/2),-R*(Cos(alf/2)),0);

label("$O^t$",ror,S);
dot(ror);
draw(L=Label("$X^t$", position=Relative(1.1), align=NE),ror--ror+(200*Cos(alf/2),200*Sin(alf/2),0),red,Arrow3);
draw(L=Label("$Y^t$", position=Relative(1.1), align=W),ror--ror+(-200*Sin(alf/2),200*Cos(alf/2),0),green,Arrow3);
draw(L=Label("$Z^t$", position=Relative(1.1), align=N),ror--ror+(0,0,200),blue,Arrow3);