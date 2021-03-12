settings.outformat = "pdf";
defaultpen(fontsize(12pt));
unitsize(1cm);
import "../../serlo.asy" as serlo;

draw((-.5,0) -- (11.5,0), arrow=Arrow(TeXHead));

path markierung = (0,-.06) -- (0,.06);

for(int i = 0; i < 12; ++i) {
  draw(shift(i,0)*markierung);
}

for(int i = 0; i <= 11; ++i) {
  if(i % 2 == 1) {
    continue;
  }
  label("$" + ((string) i) + "$", (i,0), S);
}
