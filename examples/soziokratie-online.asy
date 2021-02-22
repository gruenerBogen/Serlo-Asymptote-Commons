settings.outformat = "pdf";

import flowchart;
import "../serlo.asy" as serlo;

defaultpen(linecap(0)+linejoin(0)+serlo_blue+Helvetica());
unitsize(1cm);

void my_draw_arrow(path p) {
  draw(p, arrow=Arrow(TeXHead));
}

block start = roundrectangle(Label("Entscheidungswunsch", white), (0, 2), serlo_blue, serlo_blue);
block brainstorm = roundrectangle(Label("Brainstorming \& Diskussion online", white), serlo_blue, serlo_blue);
block vorschlag = roundrectangle(Label("Vorschlag", white), (0, -2), serlo_blue, serlo_blue);
block veto = roundrectangle(Label("Veto?", white), (0, -4), serlo_blue, serlo_blue);
block diskussion = roundrectangle(Label("Diskussion", white), (4, -3), serlo_blue, serlo_blue);
block priv_d_online_d = roundrectangle(Label("persönliche Diskussion \& online Dokumentation", white), (0,-6), serlo_blue, serlo_blue);
block einigung = roundrectangle(Label("Veto zurückgezogen?", white), (0, -8), serlo_blue, serlo_blue);
block neuer_vorschlag = roundrectangle(Label("Neuer Vorschlag?", white), (6, -7), serlo_blue, serlo_blue);
block angenommen = roundrectangle(Label("Angenommen", white), (0,-10), serlo_blue, serlo_blue);

draw(start);
draw(brainstorm);
draw(vorschlag);
draw(veto);
draw(diskussion);
draw(priv_d_online_d);
draw(einigung);
draw(neuer_vorschlag);
draw(angenommen);

defaultpen(linecap(0)+linejoin(0)+black+Helvetica());

//my_draw_arrow(brainstorm.bottom() -- vorschlag.top());
add(new void(picture pic, transform t) {
    blockconnector operator --= blockconnector(pic, t);
    start--Down--Arrow--brainstorm;
    brainstorm--Down--Arrow--vorschlag;
    vorschlag--Right--Label("Ab 2. Vorschlag", 0.5, NE)--Down--Arrow--diskussion;
    vorschlag--Down--Arrow--veto;
    veto--Down--Label("Ja", 0.25, W)--Arrow--priv_d_online_d;
    diskussion--Down--Left--Arrow--veto;
    priv_d_online_d--Down--Arrow--einigung;
    veto--Left--Label("Nein", 0.01, NW)--block(-5, veto.center.y)--Down--Right--Arrow--angenommen;
    einigung--Down--Label("Ja", 0.25, W)--Arrow--angenommen;
    einigung--Right--Label("Nein", 0.02, NE)--Up--Arrow--neuer_vorschlag;
    neuer_vorschlag--Up--Label("Ja", 0.05, E)--Left--Arrow--block(vorschlag.center+(0, 1));
    neuer_vorschlag--Right--Label("Nein", 0.5, E)--Up--Left--Arrow--brainstorm;
  });
