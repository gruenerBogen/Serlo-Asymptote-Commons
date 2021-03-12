settings.outformat = "pdf";
defaultpen(fontsize(12pt));
unitsize(1cm);
import "../../serlo.asy" as serlo;

draw_coordinates(6,6, draw_scale=true, draw_labels=true);

pair z = sqrt(.5)*(1,1);
pair w = (5,1);
pair zw = z*w;

draw_vector((0,0) -- z, serlo_blue);
draw_vector((0,0) -- w, serlo_green);

label("$w$", w, NE);
label("$z$", z, NE);

draw_vector((0,0) -- zw, serlo_green);
label("$z\cdot w$", zw, NE);

draw(unitcircle);

draw(arc((0,0), .6, 0, 45), arrow=vect_arrow);

draw(arc((0,0), 1.5, 0, degrees(cplx_arg(w, false))), arrow=vect_arrow);

draw(arc((0,0), 2.5, 0, degrees(cplx_arg(zw, false))), arrow=vect_arrow);

label("$\varphi$", (.25,0), S);
label("$\psi$", (1.3,0), S);
label("$\varphi + \psi$", rotate(degrees(cplx_arg(zw, false))/2)*(2.5,0), NE);
