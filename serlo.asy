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

void draw_coordinates(int x_dimen, int y_dimen, bool draw_scale = false,
		      bool draw_labels = false, real unit_size = 1,
		      int[] x_labels = {}, int[] y_labels = {}) {
  // Draw axes
  draw((-(x_dimen+0.5)*unit_size,0) --((x_dimen+0.5)*unit_size,0),
       arrow=Arrow(TeXHead));
  draw((0,-(y_dimen+0.5)*unit_size) -- (0, (y_dimen+0.5)*unit_size),
       arrow=Arrow(TeXHead));
  if(draw_scale) {
    for(int i=-x_dimen; i <=x_dimen; ++i) {
      if(i == 0) {
	continue;
      }
      draw((i*unit_size,-.06)--(i*unit_size,.06), linewidth(.3));
    }
    for(int i=-y_dimen; i <=y_dimen; ++i) {
      if(i == 0) {
	continue;
      }
      draw((-.06,i*unit_size)--(.06, i*unit_size), linewidth(.3));
    }
  }

  if(draw_labels) {
    for(int i=-x_dimen; i <=x_dimen; ++i) {
      if(i == 0) {
	continue;
      }
      label("$" + ((string) i) + "$", (i*unit_size,-.06), S);
    }
    for(int i = -y_dimen; i <= y_dimen; ++i) {
      if(i == 0) {
	continue;
      }
      label("$" + ((string) i) + "$", (-.06,i*unit_size), W);
    }
  } else {
    for(int i = 0; i < x_labels.length; ++i) {
      label("$" + ((string) x_labels[i]) + "$", (x_labels[i]*unit_size,-.06), S);
    }
    for(int i = 0; i < y_labels.length; ++i) {
      label("$" + ((string) y_labels[i]) + "$", (-.06,y_labels[i]*unit_size), W);
    }
  }
}

/**
 * Give the argument of a complex number as a value either between -pi and pi
 * (the latter included) or between 0 and 2*pi (the former included) - depending
 * on the value of allow_negative_angle.
 */
real cplx_arg(pair z, bool allow_negative_angle = true) {
  if(z == (0,0)) {
    return 0;
  }
  real argument = atan2(z.y, z.x);
  if(allow_negative_angle || argument > 0) {
    return argument;
  }
  return 2*pi+argument;
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
