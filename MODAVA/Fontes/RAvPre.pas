unit RAvPre;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RSimples, Qrctrls, quickrpt, ExtCtrls, Db, Wwdatsrc, DBTables, Wwtable,
  Wwquery, IvDictio, IvMulti, IvEMulti;

type
  TrelAvPre = class(TrelSimples)
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    tblFuncio: TwwTable;
    tblCargo: TwwTable;
    dsFunc: TwwDataSource;
    QRDBText3: TQRDBText;
    qrbRodape: TQRBand;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    dsHst: TwwDataSource;
    qryHstava: TwwQuery;
    qrdbFortes: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText7: TQRDBText;
    tblPeso: TwwTable;
    qrdbTipAval: TQRDBText;
    qrsdFatores: TQRSubDetail;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    qrlPeso: TQRLabel;
    qrlNota: TQRLabel;
    QRDBText8: TQRDBText;
    qrChildObserv: TQRChildBand;
    QRDBText9: TQRDBText;
    procedure FormCreate(Sender: TObject);
    procedure ColumnHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsdFatoresBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  relAvPre: TrelAvPre;
  iUltGrupo: Integer;

implementation

uses FSelRelAvPre;

{$R *.DFM}



procedure TrelAvPre.FormCreate(Sender: TObject);
begin
  inherited;
  tblFuncio.Open;
  tblCargo.Open;
  tblPeso.Open;
   { Executa a query }
   qryHstAva.Close;
   qryHstAva.SQL.Clear;
   qryHstAva.SQL.Add('SELECT H.*, FA.IDGRUPOFATORAVAL, FA.DESCRFATORAVAL, GA.DESCRICAO, ');
   qryHstAva.SQL.Add('FA.OBSFATORAVAL ');
   qryHstAva.SQL.Add('FROM HSTDESEMP H, FATORAVAL FA,GRUPOFATORAVAL GA');
   qryHstAva.SQL.Add('WHERE H.IDPESSOA = ');
   qryHstAva.SQL.Add(frmSelRelAvPre.qryPessoal.FieldByName('IDPESSOA').AsString);
   qryHstAva.SQL.Add(' AND H.CODTIPOAVAL = ');
   qryHstAva.SQL.Add(frmSelRelAvPre.qryAval.FieldByName('CODTIPOAVAL').AsString);
   qryHstAva.SQL.Add(' AND H.NUMSEQ = ');
   qryHstAva.SQL.Add(frmSelRelAvPre.qryAval.FieldByName('NUMSEQ').AsString);
   qryHstAva.SQL.Add(' AND H.IDFATORAVAL = FA.IDFATORAVAL');
   qryHstAva.SQL.Add(' AND FA.IDGRUPOFATORAVAL = GA.IDGRUPOFATORAVAL(+)');
   if frmSelRelAvPre.cmbOrderBy.ItemIndex = 0 then
      qryHstAva.SQL.Add(' ORDER BY FA.IDGRUPOFATORAVAL,FA.IDFATORAVAL')
   else
      qryHstAva.SQL.Add(' ORDER BY GA.DESCRICAO, FA.DESCRFATORAVAL');
   qryHstAva.Open;
   iUltGrupo := 0;
   qrChildObserv.Enabled := (frmSelRelAvPre.rgObserv.ItemIndex = 0);   
end;




procedure TrelAvPre.ColumnHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  PrintBand := not qryHstava.Eof;
end;

procedure TrelAvPre.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if (qryHstava.FieldByName('IDGRUPOFATORAVAL').AsInteger = iUltGrupo) then
  begin
     PrintBand := False;
     exit;
  end;
  iUltGrupo := qryHstava.FieldByName('IDGRUPOFATORAVAL').AsInteger;

end;


procedure TrelAvPre.qrsdFatoresBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  qrlPeso.Caption := '';
  qrlNota.Caption := '';
  if  tblPeso.FindKey([tblCargo.FieldByName('CODGRPFUNC').Value,
                   qryHstava.FieldByName('IDFATORAVAL').Value]) then begin
      qrlPeso.Caption := IntToStr(tblPeso.FieldByName('PESO').Value);
      qrlNota.Caption := IntToStr(tblPeso.FieldByName('PESO').Value *
                          qryHstava.FieldByName('GRAU').Value);
  end;
end;

end.
