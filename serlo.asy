// Serlo coporate identity colours
pen serlo_blue = rgb("007ec1");
pen serlo_green = rgb("95bc1a");
pen serlo_gray = rgb("404040");

// TODO make pen for Serlo fons

// Arrow heads
arrowbar coordinate_arrow = Arrow(TeXHead);
arrowbar vect_arrow = Arrow(size=4, angle=20);

// If we have a pointy arrow the arrow tip is slighly too long.
// To compensate for this issue, you can slightliy shorten the arrow
// by a fixed length, e.g. 0.025. (0.025 works for unitsize = 1cm)
real arrow_length_correction = 0.025;

void draw_vector(path vect, pen p = currentpen) {
  pair b = beginpoint(vect);
  pair e = endpoint(vect);

  // Prevent error from empty vector path
  if(b == e)
    return;
  
  if(linejoin(defaultpen) == 0) {
    pair direction = unit(e - b);
    e -= direction*arrow_length_correction;
  }
  draw(b -- e, arrow=vect_arrow, p);
}

// We do a lot of maths so including the maths packages here will save
// typing work later.
usepackage("amsmath");
usepackage("amssymb");

// This stuff is also inside the Wikibooks TeX header and seems useful
// https://www.mediawiki.org/wiki/Extension:Math/TeX-header
usepackage("amsfonts");

// This definition of the Wikibooks TeX header might conflict with the hyperref
// package, when used in conjuction.
texpreamble("\newcommand{\C}{\mathbb{C}}");

// These are non-porblematic definitions from the Wikibooks TeX header.
texpreamble("\newcommand{\R}{\mathbb{R}}");
texpreamble("\newcommand{\Z}{\mathbb{Z}}");
texpreamble("\newcommand{\N}{\mathbb{N}}");
texpreamble("\newcommand{\Q}{\mathbb{Q}}");

