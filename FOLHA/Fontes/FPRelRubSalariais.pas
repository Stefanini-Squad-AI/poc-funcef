unit FPRelRubSalariais;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, DBTables, Wwquery, StdCtrls, wwdblook, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls;

type
  TFrmRelRubSalariais = class(TfrmOkCancelar)
    grbGrupo: TGroupBox;
    dblkGrupoRubrica: TwwDBLookupCombo;
    qryGrupoRubrica: TwwQuery;
    rdoTipoRub: TRadioGroup;
    grbCompoeIRRF: TGroupBox;
    chkCompoeIR: TCheckBox;
    grbCompoePensAlim: TGroupBox;
    chkCompoePensAlim: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelRubSalariais: TFrmRelRubSalariais;

implementation

Uses dRelRubSalariais, uMensErro;

{$R *.DFM}

procedure TFrmRelRubSalariais.FormShow(Sender: TObject);
begin
  inherited;
  qryGrupoRubrica.Open;
end;

procedure TFrmRelRubSalariais.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryGrupoRubrica.Close;
end;

procedure TFrmRelRubSalariais.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If Trim(dblkGrupoRubrica.Text) = '' Then
  Begin
    MsgDlg('Por favor, escolha o grupo da rubrica.', 'Informação', mtInformation, [mbOk], 0);
    dblkGrupoRubrica.SetFocus;
    ModalResult := mrNone;
    Exit;
  End;

  dtmRelRubSalariais.qryRelRubSalariais.Close;
  dtmRelRubSalariais.qryRelRubSalariais.Sql.Clear;
  dtmRelRubSalariais.qryRelRubSalariais.Sql.Add(
  ' SELECT '+
    ' P.IDPROVENTO, '+
    ' P.DESCRICAO, '+
    ' P.CODPROVDESC, '+
    ' P.DESCRPROVDESC, '+
    ' DECODE(NVL(P.FLGIRRF, 0), 0, ''NÃO'', 1, ''SIM'') AS COMPOEIR, '+
    ' DECODE(NVL(P.FLGDESCPENSAO, 0), 0, ''NÃO'', 1, ''SIM'') AS COMPOEPENSALIM, '+
    ' DECODE(P.FLGDESCONTO, 0, ''PROVENTO'', 1, ''DESCONTO'', 2, ''OUTROS'') AS TIPORUBRICA, '+
    ' G.DESCRICAO AS DESCRGRUPO, '+
    ' I.NOMEINFORME '+

  ' FROM '+
    ' PROVDESC P, '+
    ' GRUPORUBRICA G, '+
    ' INFORME I '+

  ' WHERE '+
    ' P.IDGRUPORUBRICA    = G.IDGRUPORUBRICA(+) AND '+
    ' P.IDINFORME         = I.IDINFORME(+)      AND '+
    ' G.IDGRUPORUBRICA    = '+QuotedStr(dblkGrupoRubrica.LookupValue)+' AND '+
    ' P.FLGDESCONTO       = '+IntToStr(rdoTipoRub.ItemIndex));

   If chkCompoeIR.Checked Then
     dtmRelRubSalariais.qryRelRubSalariais.Sql.Add(' AND P.FLGIRRF = 1 ')
   Else
     dtmRelRubSalariais.qryRelRubSalariais.Sql.Add(' AND P.FLGIRRF = 0 ');

   If chkCompoePensAlim.Checked Then
     dtmRelRubSalariais.qryRelRubSalariais.Sql.Add(' AND P.FLGDESCPENSAO = 1 ')
   Else
     dtmRelRubSalariais.qryRelRubSalariais.Sql.Add(' AND P.FLGDESCPENSAO = 0 ');

   dtmRelRubSalariais.qryRelRubSalariais.Open;
end;

end.
{==============================================================================|
| UNIT: FPRELRUBSALARIAIS                                                      |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   RELATÓRIO DE RUBRICAS SALARIAIS                                            |
|                                                                              |
|==============================================================================}

