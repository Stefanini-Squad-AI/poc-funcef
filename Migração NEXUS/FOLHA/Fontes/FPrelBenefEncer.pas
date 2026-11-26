unit FPrelBenefEncer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, DBTables, Wwquery, StdCtrls, wwdblook, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  MontaSelect, usistema, dbasedados;

type
  Tfrmfprelbenefencer = class(TfrmOkCancelar)
    grpMesRef: TGroupBox;
    dblkfolha: TwwDBLookupCombo;
    qryHist: TwwQuery;
    qryHistIDHSTFOLHABENEF: TFloatField;
    qryHistHISTORICO: TStringField;
    qryMesRef: TwwQuery;
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
  frmfprelbenefencer: Tfrmfprelbenefencer;

implementation

uses dRelFolha, UFuncoesFolha;

{$R *.DFM}

procedure Tfrmfprelbenefencer.bbtnConfirmarClick(Sender: TObject);
var
  sMesAnt, sMesAtu: string;
  sIdHstFolha: Integer;
begin
  inherited;
  dtmBaseDados.dbBaseDados.StartTransaction;
  if not Sistema.GravaLogOperacoes('Emissão: '+caption) then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  with qryMesRef do
  begin
      close;
      ParamByName('IDHSTF').AsInteger := qryHist.fieldbyname('IDHSTFOLHABENEF').Asinteger;
      Open;
  end;

  // mes atual
  sMesAtu := qryMesRef.fieldbyname('MESREFERENCIA').AsString;

  with dtmRelFolha do
  begin
   qryBenEncer.close;
   qryBenEncer.ParamByName('MESREF').AsString := sMesAtu;
   qryBenEncer.open;

   rpBenEncerMesAno.Caption := 'Mes/Ano : ' + Copy(sMesAtu,6,2) + '/' + Copy(sMesAtu,1,4);
  end;

end;

procedure Tfrmfprelbenefencer.FormActivate(Sender: TObject);
begin
  inherited;
  qryhist.close;
  qryhist.open;
end;

procedure Tfrmfprelbenefencer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryhist.close;
  qryMesRef.close;
  qryMesAnt.close;  
end;

end.
{==============================================================================|
| UNIT:                                                                        |
| DESCRIÇÃO FUNCIONAL:                                                         |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 28/08/2004 A 28/08/2004                         |
| PENDÊNCIA: 17803                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| Não utilizar mais CMINTBANCO em 2 camadas e substituir a unit uBiblioteca    |
| pela uString.                                                                |
|                                                                              |
|------------------------------------------------------------------------------}

