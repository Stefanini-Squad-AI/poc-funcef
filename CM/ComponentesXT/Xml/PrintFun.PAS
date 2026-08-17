unit PrintFun;

interface

uses
  RPBase, Classes;

type

procedure PrintDottedCircle(Report: TBaseReport; x, y, r, DashLength: Double);
procedure PrintDottedCirclularArc(Report: TBaseReport; x, y, r, bang, eang, DashLength: Double);
procedure PrintDottedLine(Report: TBaseReport; x1, y1, x2, y2, DashLength: Double);

implementation

uses
  Windows, SysUtils, RPDefine, Graphics, Printers, Strlib;

// print the circle at (x, y) with radius r with dotted lines with each dot
// DashLength long.  Note that using the Ellipse function with the Pen.Style
// set to psDot does not do this as HP Deskjets and perhaps some other printers
// draw solid lines using this API.
procedure PrintDottedCircle(Report: TBaseReport; x, y, r, DashLength: Double);
var
  ang, ange, angi, circum: Double;
  i, NumDashes: Integer;
  Dash: Boolean;
begin
  with Report do begin
    // make sure radius is positive
    r := Abs(r);
    // calculate circumfrence
    circum := 2 * Pi * r;
    // start at angle 0
    ang := 0;
    // use an integral number of dashes / spaces (makes the code simpler
    // the circle probably looks better this way too)
    NumDashes := Round(0.5 * circum / DashLength) * 2;
    if NumDashes = 0 then Exit;
    // calculate length of each dash
    angi := 2 * Pi / NumDashes;

    Dash := True;
    // draw each dash
    for i := 1 to NumDashes do begin
      ange := ang + angi;
      if Dash then
        Arc(x - r, y + r, x + r, y - r, x + r * cos(ang), y - r * sin(ang),
             x + r * cos(ange), y - r * sin(ange));
      ang := ange;
      Dash := not Dash;
    end;
  end;
end;

// draw a dotted arc from angle bang to angle eang on the circle at (x, y) with
// radius r.  Make each dash DashLength long.  Note that using the Arc function
// with the Pen.Style set to psDot does not do this as HP Deskjets and perhaps
// some other printers draw solid lines using this API.
procedure PrintDottedCirclularArc(Report: TBaseReport; x, y, r, bang, eang, DashLength: Double);
var
  ang, ange, angi, circum: Double;
  i, NumDashes: Integer;
  Dash: Boolean;
begin
  with Report do begin
    // no negative radiuses
    r := Abs(r);
    // this is probably overkill, but it works
    bang := 2 * Pi * Frac(bang / (2 * Pi));
    eang := 2 * Pi * Frac(eang / (2 * Pi));
    if bang > eang then eang := eang + 2 * Pi;

    // use the same calcs you would for a circle but ratio them to the angle
    // being shown
    circum := 2 * Pi * r;
    ang := bang;
    NumDashes := Round((eang - bang) / (2 * Pi) * circum / DashLength);
    if NumDashes = 0 then Exit;
    angi := (eang - bang) / NumDashes;

    Dash := True;
    for i := 1 to NumDashes do begin
      ange := ang + angi;
      if Dash then
        Arc(x - r, y + r, x + r, y - r, x + r * cos(ang), y - r * sin(ang),
            x + r * cos(ange), y - r * sin(ange));
      ang := ange;
      Dash := not Dash;
    end;
  end;
end;

// print the line from (x1, y1) to (x2, y2)with dotted lines with each dot
// DashLength long.  Note that using the MoveTo/LineTo functions with the Pen.Style
// set to psDot does not do this as HP Deskjets and perhaps some other printers
// draw solid lines using this API.
procedure PrintDottedLine(Report: TBaseReport; x1, y1, x2, y2, DashLength: Double);
var
  xi, yi, linelen: Double;
  i, DashCntM1: Integer;
  Dash: Boolean;
begin
  with Report do begin
    MoveTo(x1, y1);
    linelen := Sqrt(Sqr(x2 - x1) + Sqr(y2 - y1)); // line length
    if linelen = 0 then Exit;
    xi := DashLength * (x2 - x1) / linelen; // dash inc in x
    yi := DashLength * (y2 - y1) / linelen; // desh inc in y
    Dash := True;
    DashCntM1 := Trunc(linelen / DashLength);
    for i := 1 to DashCntM1 do begin
      x1 := x1 + xi;
      y1 := y1 + yi;
      if Dash then
        LineTo(x1, y1)
      else
        MoveTo(x1, y1);
      Dash := not Dash;
    end;
    // last dash
    if Dash then
      LineTo(x2, y2)
    else
      MoveTo(x2, y2);
  end;
end;

end.

