settings.outformat = "svg";
defaultpen(fontsize(10pt)+linecap(0)+linejoin(0));
// label("Hello World!")
unitsize(1cm);

import serlo;

path cropped_line(real slope, real start_x, real end_x, pair intersection_pt = (0,0)) {
  real t = intersection_pt.y - slope*intersection_pt.x;
  return (start_x, slope*start_x + t) -- (end_x, slope*end_x + t);
}

path support_vector(real slope, path affine_subspace) {
  path support_vector_long = cropped_line(slope,beginpoint(affine_subspace).x,endpoint(affine_subspace).x);
  pair meetpoint = intersectionpoint(support_vector_long, affine_subspace);
  return (0,0) -- meetpoint;
}

// Document Parameters
// Colours
pen subspace_colour = rgb(0, 0.5, 0);
pen affine_subspace_colour = rgb(0, 0, 0.5);
pen complement_colour = orange;
pen proj_colour = subspace_colour;

// Space slopes
real subspace_slope = -1;
// The slopes used for the book are -3 (a) and .6 (b).
real complement_slope = -3;

// Support vector slopes
real s_vect_slope = 3;
real s_vect2_slope = .2;

// Draw the picture

// Draw coordinate system
draw((-1,0) -- (2,0), arrow=coordinate_arrow);
draw((0,-1) -- (0,2), arrow=coordinate_arrow);

path subspace = cropped_line(subspace_slope, -1.1, 2.1);
path affine_subspace = cropped_line(subspace_slope, -1.1, 2.1, (.5,.5));

draw(subspace, subspace_colour);
draw(affine_subspace, affine_subspace_colour);

//path support_vector_long = cropped_line(1,0,2);
//path support_vector = (0, 0) -- intersectionpoint(support_vector_long, affine_subspace)-(0.01,0.01);
path s_vect = support_vector(s_vect_slope, affine_subspace);
path s_vect2 = support_vector(s_vect2_slope, affine_subspace);

draw_vector(s_vect, affine_subspace_colour);
draw_vector(s_vect2, affine_subspace_colour);

// Draw complement and support vector in complement
path complement = cropped_line(complement_slope,-1,2);
draw(complement, complement_colour);

path complement_s_vect = support_vector(complement_slope, affine_subspace);
draw_vector(complement_s_vect, proj_colour);

// Draw projection to subspace along the chosen complement
path proj_s_vect = endpoint(complement_s_vect) -- endpoint(s_vect);
path proj_s_vect2 = endpoint(complement_s_vect) -- endpoint(s_vect2);
draw_vector(proj_s_vect, proj_colour);
draw_vector(proj_s_vect2, proj_colour);

clip(box((-1,-1),(2,2)));
