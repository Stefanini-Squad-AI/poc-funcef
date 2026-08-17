unit RegCmOld50;

interface

Uses Classes;

Procedure Register;

implementation

Uses CMFRMPROP, cmseldlg, CMStrGrd, cmstrgrd2, DBCtrls2, DBGrid2, Grids2,
     OpenArqText, TEdNum, Wwdbgrd2 ;


procedure Register;
begin
  RegisterComponents('CM Old',[TCMFormProp, TcmSelectDlg, TCMStringGrid,
  TCMStringGrid2, TDBEdit2, TDBGrid2, TDrawGrid2 , TOpenArqText, TEditNum,
  TwwDBGrid2]);
end;


end.
