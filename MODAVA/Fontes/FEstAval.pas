unit FEstAval;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSelPessoal, Db, DBTables, Wwtable, Wwdatsrc, MAHlpBtn, StdCtrls,
  Buttons, TEdNum, Spin, wwdblook, ExtCtrls, OleCtrls, chartfx3, Wwquery,
  TB97, ComCtrls, IvDictio, IvMulti, IvEMulti, TB97Tlbr,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmEstAval = class(TfrmSelPessoal)
    ds2: TwwDataSource;
    tblAval: TwwTable;
    Chart1: TChartfx;
    procedure FormCreate(Sender: TObject);
    procedure bbtnOutraVezClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEstAval: TfrmEstAval;
  TAM : Integer;
  MINMAX : array[1..8,1..8] of integer;

implementation

uses FSelEstAval;

{$R *.DFM}


procedure TfrmEstAval.FormCreate(Sender: TObject);
begin
  inherited;
  cbxCandidatos.Enabled := False;
  rgSequencia.Visible := False;
  TAM := 0;
  if  frmSelEstAval.ednMax1.Text <> ''  then  TAM := TAM + 1;
  if  frmSelEstAval.ednMax2.Text <> ''  then  TAM := TAM + 1;
  if  frmSelEstAval.ednMax3.Text <> ''  then  TAM := TAM + 1;
  if  frmSelEstAval.ednMax4.Text <> ''  then  TAM := TAM + 1;
  if  frmSelEstAval.ednMax5.Text <> ''  then  TAM := TAM + 1;
  if  frmSelEstAval.ednMax6.Text <> ''  then  TAM := TAM + 1;
  if  frmSelEstAval.ednMax7.Text <> ''  then  TAM := TAM + 1;
  if  frmSelEstAval.ednMax8.Text <> ''  then  TAM := TAM + 1;

end;

procedure TfrmEstAval.bbtnOutraVezClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrNone;
  rgSequencia.Visible := False;
  Chart1.Visible := False;
end;

procedure TfrmEstAval.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmEstAval.bbtnConfirmarClick(Sender: TObject);
var
  IND, TotQtdAva : Integer;
  YMAX : Double;
begin
  inherited;
  tblAval.Open;
  ModalResult := mrNone;
  Chart1.OpenDataEx({COD_VALUES}1,1,TAM);
  if  frmSelEstAval.ednMax1.Text <> ''  then  begin
                Chart1.Legend[0] := frmSelEstAval.ednMin1.Text + ' a ' +
                                    frmSelEstAval.ednMax1.Text;
                Val(frmSelEstAval.ednMin1.Text, MINMAX[1,1], J);
                Val(frmSelEstAval.ednMax1.Text, MINMAX[2,1], J);
  end;
  if  frmSelEstAval.ednMax2.Text <> ''  then  begin
                Chart1.Legend[1] := frmSelEstAval.ednMin2.Text + ' a ' +
                                    frmSelEstAval.ednMax2.Text;
                Val(frmSelEstAval.ednMin2.Text, MINMAX[1,2], J);
                Val(frmSelEstAval.ednMax2.Text, MINMAX[2,2], J);
  end;
  if  frmSelEstAval.ednMax3.Text <> ''  then  begin
                Chart1.Legend[2] := frmSelEstAval.ednMin3.Text + ' a ' +
                                    frmSelEstAval.ednMax3.Text;
                Val(frmSelEstAval.ednMin3.Text, MINMAX[1,3], J);
                Val(frmSelEstAval.ednMax3.Text, MINMAX[2,3], J);
  end;
  if  frmSelEstAval.ednMax4.Text <> ''  then  begin
                Chart1.Legend[3] := frmSelEstAval.ednMin4.Text + ' a ' +
                                    frmSelEstAval.ednMax4.Text;
                Val(frmSelEstAval.ednMin4.Text, MINMAX[1,4], J);
                Val(frmSelEstAval.ednMax4.Text, MINMAX[2,4], J);
  end;
  if  frmSelEstAval.ednMax5.Text <> ''  then  begin
                Chart1.Legend[4] := frmSelEstAval.ednMin5.Text + ' a ' +
                                    frmSelEstAval.ednMax5.Text;
                Val(frmSelEstAval.ednMin5.Text, MINMAX[1,5], J);
                Val(frmSelEstAval.ednMax5.Text, MINMAX[2,5], J);
  end;
  if  frmSelEstAval.ednMax6.Text <> ''  then  begin
                Chart1.Legend[5] := frmSelEstAval.ednMin6.Text + ' a ' +
                                    frmSelEstAval.ednMax6.Text;
                Val(frmSelEstAval.ednMin6.Text, MINMAX[1,6], J);
                Val(frmSelEstAval.ednMax6.Text, MINMAX[2,6], J);
  end;
  if  frmSelEstAval.ednMax7.Text <> ''  then  begin
                Chart1.Legend[6] := frmSelEstAval.ednMin7.Text + ' a ' +
                                    frmSelEstAval.ednMax7.Text;
                Val(frmSelEstAval.ednMin7.Text, MINMAX[1,7], J);
                Val(frmSelEstAval.ednMax7.Text, MINMAX[2,7], J);
  end;
  if  frmSelEstAval.ednMax8.Text <> ''  then  begin
                Chart1.Legend[7] := frmSelEstAval.ednMin8.Text + ' a ' +
                                    frmSelEstAval.ednMax8.Text;
                Val(frmSelEstAval.ednMin8.Text, MINMAX[1,8], J);
                Val(frmSelEstAval.ednMax8.Text, MINMAX[2,8], J);
  end;

  Chart1.ThisSerie := 0;
  Chart1.Decimals  := 0;
  TotQtdAva := 0;
  Chart1.Title[{TOPTIT}2] := 'Estatística por Faixa de Pontuação';

  For  IND := 0  to  (TAM - 1)  do
   	  Chart1.Value[IND] := 0;

  While Not tblPessoal.Eof  do  begin
     tblAval.First;
     while (not tblAval.Eof)  do begin
        if (tblAval.FieldByName('DATAREAL').Value >=
            frmSelEstAval.EdData1.Date) and
           (tblAval.FieldByName('DATAREAL').Value <=
            frmSelEstAval.EdData2.Date) and
           (tblAval.FieldByName('CODTIPOAVAL').Value =
            frmSelEstAval.qryTipAval.FieldByName('CODTIPOAVAL').Value) then begin
               for  IND := 0  to  (TAM-1)  do
                  if  (tblAval.FieldByName('AVALIACAO').Value >= MINMAX[1,IND+1])  and
                      (tblAval.FieldByName('AVALIACAO').Value <= MINMAX[2,IND+1])  then
                       Chart1.Value[IND] := Chart1.Value[IND] + 1;
        end;
        tblAval.Next;
     end;
     tblPessoal.Next;
  end;
  tblAval.Close;

   For IND := 0 to (TAM - 1) do TotQtdAva := TotQtdAva +
                                round(Chart1.Value[IND]);


   Chart1.Title[{BOTTOMTIT}3] := 'Total de Avaliações: ' +
                                  IntToStr(TotQtdAva);

   {Close the VALUES channel}
   YMAX := 0;
   for IND := 0  to  TAM - 1  do
       if  Chart1.Value[IND] > YMAX  then  YMAX := Chart1.Value[IND];
   Chart1.Adm[1] := YMAX;
   Chart1.CloseData({COD_VALUES}1);
   Chart1.Visible := True;

end;

end.
