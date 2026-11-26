unit FPRelIncBenef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, DBTables, Wwquery, StdCtrls, wwdblook, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls;

type
  Tfrmfprelincbenef = class(TfrmOkCancelar)
    grpMesRef: TGroupBox;
    dblkfolha: TwwDBLookupCombo;
    qryHist: TwwQuery;
    qryMesRef: TwwQuery;
    qryHistIDHSTFOLHABENEF: TFloatField;
    qryHistHISTORICO: TStringField;
    qryMesAnt: TwwQuery;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmfprelincbenef: Tfrmfprelincbenef;

implementation

uses dRelFolha,Ubiblioteca,USistema,UFuncoesFolha;

{$R *.DFM}

procedure Tfrmfprelincbenef.bbtnConfirmarClick(Sender: TObject);
var
  sMesAnt, sMesAtu: string;
  sIdHstFolha: Integer;
begin
  inherited;
  with qryMesRef do
  begin
      close;
      ParamByName('IDHSTF').AsInteger := qryHist.fieldbyname('IDHSTFOLHABENEF').Asinteger;
      sIdHstFolha                     := qryHist.fieldbyname('IDHSTFOLHABENEF').Asinteger;
      Open;
  end;

  // mes atual
  sMesAtu := qryMesRef.fieldbyname('MESREFERENCIA').AsString;

  with qryMesAnt do
  begin
      close;
      ParamByName('IDHSTREF').AsInteger := qryMesRef.ParamByName('IDHSTF').AsInteger;
      ParamByName('MESREF').AsString    := sMesAtu;
      Open;
  end;

  // mes anterior
  sMesAnt := qryMesAnt.fieldbyname('MESANTER').AsString;

  with dtmRelFolha do
  begin
   qryIncBenMesFolha.close;
   qryIncBenMesFolha.ParamByName('MESANT').AsString   := sMesAnt;
   qryIncBenMesFolha.ParamByName('MESATU').AsString   := sMesAtu;
   qryIncBenMesFolha.ParamByName('IDHSTFB').AsInteger := sIdHstFolha;
   qryIncBenMesFolha.Open;

   rpIncBenMesFolhaMesAno.Caption := 'Mes/Ano : ' + Copy(sMesAtu,6,2) + '/' + Copy(sMesAtu,1,4);
  end;

end;

procedure Tfrmfprelincbenef.FormActivate(Sender: TObject);
begin
  inherited;
  qryhist.close;
  qryhist.open;
end;

procedure Tfrmfprelincbenef.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryhist.close;
  qryMesRef.close;
  qryMesAnt.close;
end;

end.
