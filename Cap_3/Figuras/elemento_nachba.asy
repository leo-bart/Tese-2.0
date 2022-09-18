size(8cm,0);
import tube;
import graph3;
defaultpen(fontsize(10pt));

currentprojection=orthographic(5,4,2);

real L = 6.;
picture undef,def = new picture;
transform3 transf = shift((3,0,6)) * rotate(17,Y);
def = transf * undef;

// points
triple n1 = (0,0,0);
triple n2 = (L/2,0,0);
triple n3 = (L,0,0);
triple or = (-0.6*L,1,-1);

// undeformed beam
path3 pu = n1--n2--n3;
draw(undef,tube(pu,polygon(4)),nullpen,black,render(merge=true));
dot(undef,pu,red);
for (int i = size(pu);i > 0; --i){
  label(undef,(string) i,point(pu,i-1),NW);
}

// inertial frame
label("$O$",or,NE);
draw(or--or+(1,0,0),Arrow3);
draw(or--or+(0,1,0),Arrow3);
draw(or--or+(0,0,1),Arrow3);


label(undef,"Configuração de referência",(0,0,-2),NE);
label(def,"Configuração deformada",(-1,0,-2),E);

draw(undef,or--n1,linewidth(0.1mm), Arrow3);
label(undef,"$\mathbf{q}_{r0}^{(1)}$",or--n1,NE);
draw(undef,n1--transf*n1,linewidth(0.1mm), Arrow3);
label(undef,"$\mathbf{u}_{r}^{(1)}$",n1--transf*n1,SW);

draw(undef,n3--n3+(0,1,0),linewidth(0.1mm),Arrow3);
draw(undef,"$\mathbf{q}_{\eta 0}^{(3)}$",n3+(0,1,0),E);
draw(undef,n3--n3+(0,0,1),linewidth(0.1mm),Arrow3);
draw(undef,"$\mathbf{q}_{\zeta 0}^{(3)}$",n3+(0,0,1),N);

// deformed beam
path3 p=n1..n2+(0.1Z)..n3+(0,-0.2,0.12);
draw(def,tube(p,polygon(4)),nullpen,black,render(merge=true));
dot(def,p,red);
for (int i = size(p);i > 0; --i){
  label(def,(string) i,point(p,i-1),N);
}

add(undef);
add(def);