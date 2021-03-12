settings.outformat = "pdf";
defaultpen(fontsize(12pt));
unitsize(1cm);
import "../../serlo.asy" as serlo;

int[] x_labels = {1};
int[] y_labels = {2};

draw_coordinates(7, 7, true, x_labels = x_labels, y_labels = y_labels);

// draw U
draw(3.75*(-1,-2) --3.75* (1,2), serlo_blue);
// draw G
draw(3.25*(-1,-2)-(0,1) --4.25*(1,2)-(0,1), serlo_green);
// label them
label("$U$", (2,4), NW);
label("$G$", (2,3), SE);
