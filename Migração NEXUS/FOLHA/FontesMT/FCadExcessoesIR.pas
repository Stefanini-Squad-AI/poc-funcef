{====>   DESENVOLVEDOR NÃO ESQUEÇA DE COMENTAR SUAS ALTERAÇÕES AO LONGO DO
         CÓDIGO, ASSIM COMO COLOCAR A DESCRIÇÃO DA IMPLEMENTAÇÃO/ALTERAÇÃO
         NO HISTÓRICO DE ALTERAÇÕES NO FINAL DESTE ARQUIVO ********************}
unit FCadExcessoesIR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid,UMensErro,
  DBCtrls, Mask, wwdbedit, wwdbdatetimepicker, CMDateTimePicker, MskEdDlg,
  TREdit;

type
  TFrmCadExcessoesIR = class(TfrmCadastroCS)
    edNome: TEdit;
    Label2: TLabel;
    MontaSelectPart: TMontaSelect;
    edPatro: TEdit;
    Label4: TLabel;
    Label3: TLabel;
    edPlano: TEdit;
    Bevel1: TBevel;
    qryAux: TwwQuery;
    rdgdestino: TRadioGroup;
    GroupBox1: TGroupBox;
    chkisento: TCheckBox;
    chkirtotal: TCheckBox;
    edtnumdepirrf: TEdit;
    Label10: TLabel;
    Label1: TLabel;
    wwDBGrid1: TwwDBGrid;
    qryIDPLANOPREV: TFloatField;
    qryIDPESSJUR: TFloatField;
    qryIDPESSOA: TFloatField;
    qryBENEFICIO: TStringField;
    qryFLGDESCIRMES: TFloatField;
    qryIDBENEFICIO: TFloatField;
    qryIDSITBENEFICIO: TFloatField;
    grbInfSalFam: TGroupBox;
    lblNumDepSalFam: TLabel;
    edtNumDepSalFam: TEdit;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LimpaEdts;
    procedure MostraBox;
  private
    { Private declarations }
    iIdPessoa,lIdPessJur,lIdPlanoPrev : integer; // identificadores do participante
  public
    { Public declarations }
  end;

var
  FrmCadExcessoesIR: TFrmCadExcessoesIR;

implementation

uses UAdmPrevFB, uObjFolha;

{$R *.DFM}

procedure TFrmCadExcessoesIR.sbtnProcurarClick(Sender: TObject);
var
     sIdParticipante,
     sIdPatrocin,
     sIdPlanoPrev,
     SSQL : string;
begin
//  inherited;
  LimpaEdts;
  MontaSelectPart.Executar;

  if (MontaSelectPart.ValoresChave.Count > 0) and
     (MontaSelectPart.ValoresChave[0] <> '') then
  begin
    edNome.Text      := MontaSelectPart.ValoresChave[10];
    edPlano.Text     := MontaSelectPart.ValoresChave[1];
    edPatro.Text     := MontaSelectPart.ValoresChave[2];
    sIdParticipante  := MontaSelectPart.ValoresChave[9];
    sIdPatrocin      := MontaSelectPart.ValoresChave[4];
    sIdPlanoPrev     := MontaSelectPart.ValoresChave[5];
    iIdPessoa           := StrToInt(sIdParticipante);
    lIdPessJur          := StrToInt(sIdPatrocin);
    lIdPlanoPrev        := StrToInt(sIdPlanoPrev);
    sbtnAlterar.Enabled := true;
    sbtnAlterar.Visible := true;

    qry.close;
    qry.parambyname('PIDPLANOPREV').Value := lIdPlanoPrev;
    qry.parambyname('PIDPESSJUR').value   := lIdPessJur;
    qry.parambyname('PIDPESSOA').value    := iIdPessoa;
    qry.open;

    qryaux.close;
    qryaux.sql.clear;
    qryaux.sql.add('SELECT ' +
                   'NVL(FLGDESTCC,0) AS FLGDESTCC   , '+
                   'NVL(NUMDEPIRRF,0) AS NUMDEPIRRF , '+
                   'NVL(NUMDEPSALF,0) AS NUMDEPSALF , '+ 
                   'NVL(FLGISENTOIRRF,0) AS FLGISENTOIRRF, '+
                   'NVL(FLGSOMAIRSUPINSS,0) AS FLGSOMAIRSUPINSS ' +
                   'FROM ' +
                   'PESSOAFISICA '+
                   'WHERE IDPESSOA = '+ inttostr(iIdPessoa));
    qryaux.Open;
    If not qryaux.Isempty then
       MostraBox;
    SBTNPROCURAR.down := false;
  end;
end;

procedure TFrmCadExcessoesIR.MostraBox;
begin
  edtnumdepirrf.text   := Inttostr(qryaux.fieldbyname('NUMDEPIRRF').asInteger);
  edtNumDepSalFam.Text := IntToStr(qryAux.FieldByName('NUMDEPSALF').AsInteger);
  If qryaux.fieldbyname('FLGISENTOIRRF').asInteger = 0 then
    chkisento.state := cbUnchecked
  else
    chkisento.state := cbchecked;

  If qryaux.fieldbyname('FLGSOMAIRSUPINSS').asInteger = 0 then
    chkirtotal.state := cbUnchecked
  else
    chkirtotal.state := cbchecked;

  rdgdestino.enabled   := true;
  rdgdestino.itemindex := qryaux.fieldbyname('FLGDESTCC').asInteger;
end;

procedure TFrmCadExcessoesIR.bbtnConfirmarClick(Sender: TObject);
var
   nvalisento,
   nvaltotal : integer;
begin
  If qry.State in [dsInsert] Then
  Begin
    ShowMessage('Não será possível alterar, pois não há benefício para esse beneficiário.');
    bbtnCancelarClick(Self);
    Exit;
  End;

  inherited;
  If chkisento.state = cbUnchecked then 
    nvalisento := 0
  else
    nvalisento := 1;
  If chkirtotal.state = cbUnchecked then 
    nvaltotal := 0
  else
    nvaltotal := 1;
  qryaux.close;
  qryaux.sql.clear;
  qryaux.SQL.add(' UPDATE PESSOAFISICA SET '+
                 ' NUMDEPIRRF = '+EDTNUMDEPIRRF.TEXT  +
                 ', NUMDEPSALF = '+edtNumDepSalFam.Text +
                 ', FLGISENTOIRRF = '+ INTTOSTR(nvalisento) +
                 ', FLGSOMAIRSUPINSS = '+ Inttostr(nvaltotal) +
                 ', FLGDESTCC = '+ IntToStr(rdgdestino.ItemIndex) +
                 ' WHERE IDPESSOA = '+ inttostr(iIdPessoa));
  qryaux.execsql;
  MsgDlg('Alteração efetuada.','Atenção',mtinformation,[mbOk,mbHelp],0);
end;

procedure TFrmCadExcessoesIR.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  SBTNPROCURAR.enabled := false;

  If SistemaFolha.FlgNumDepIRNumDepSalFam = 1 Then
  Begin
    edtnumdepirrf.Enabled   := False;
    Label10.Enabled         := False;
    edtNumDepSalFam.Enabled := False;
    lblNumDepSalFam.Enabled := False;
  End
  Else
  Begin
    edtnumdepirrf.Enabled   := True;
    Label10.Enabled         := True;
    edtNumDepSalFam.Enabled := True;
    lblNumDepSalFam.Enabled := True;
  End;
end;

procedure TFrmCadExcessoesIR.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  QRY.CLOSE;
  SBTNPROCURAR.ENABLED := TRUE;
  SBTNALTERAR.ENABLED  := FALSE;
  LimpaEdts;
end;

procedure TFrmCadExcessoesIR.FormCreate(Sender: TObject);
begin
  inherited;
  Limpaedts;
end;

procedure TFrmCadExcessoesIR.LimpaEdts;
begin
  edtnumdepirrf.text   := '';
  edtNumDepSalFam.Text := '';
  chkisento.state      := cbUnchecked;
  chkirtotal.state     := cbUnchecked;
  rdgdestino.ItemIndex := -1;
  rdgdestino.enabled   := false;
  ednome.text          := '';
  edpatro.text         := '';
  edplano.text         := '';
end;

end.

{==============================================================================|
| UNIT: FCADEXCESSOESIR                                                        |
| DESCRIÇÃO FUNCIONAL:                                                         |
|                                                                              |
|                                                                              |
|                                                                              |
|==============================================================================|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 09/09/2002 A 09/09/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   - Permitir procurar pelo dependente (pensionistas).                        |
|   - Controle do parâmetro FlgNumDepIRNumDepSalFam para deixar ou não as      |
|   ComboBoxes de Número de Dependentes de IR e de Salário Família.            |
|                                                                              |
|------------------------------------------------------------------------------}
