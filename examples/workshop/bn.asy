settings.outformat = "pdf";
defaultpen(fontsize(12pt));
unitsize(1cm);
import "../../serlo.asy" as serlo;

path e1 = scale(2,1)*unitcircle;
path e2 = shift(-.5,0)*scale(1,.5)*unitcircle;

fill(e1 ^^ e2, evenodd+gray);

draw(e1);
draw(e2);

label("$A_n$", (-.5,0));
label("$A_{n+1}$", (.8,-1.2));

label("$B_n$", (1,0));
