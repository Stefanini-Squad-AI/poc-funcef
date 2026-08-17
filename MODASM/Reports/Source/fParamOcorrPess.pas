{ --------------------------------------------------------------------------------------------------
Rotina......: FormCreate
Nº SOL......: 73954
Nº KINTANA..: 523465
Data........: 16/07/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação para mostrar a aba "Lista" quando (tipo = tpRelatPorPessoa)
              Relatório de Ocorrências Médicas por Pessoa
---------------------------------------------------------------------------------------------------}

unit fParamOcorrPess;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelPessoalMT,
  DBTables, Db, Wwdatsrc, MAHlpBtn, StdCtrls, Buttons, TEdNum, Spin, wwdblook, ExtCtrls,
  Qrctrls, quickrpt, TB97, ComCtrls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, CMDateTimePicker,
  CheckLst, wwdbdatetimepicker, MontaSelect, uCmSqlParams, DBClient, uCMClientDataSet,
  CmParamReport, uCtrlTipOcMed, ColorCheckListBox;

type
  TTipoRelatOcorrMed = (tpRelatPorPessoa, tpRelatPorTipo);

  TfrmParamOcorrPess = class(TfrmSelPessoalMT)
    tbshRelatorio: TTabSheet;
    gbxFaixaData: TGroupBox;
    edData1: TCMDateTimePicker;
    edData2: TCMDateTimePicker;
    rgTipoRel: TRadioGroup;
    Label9: TLabel;
    gbxOpcaoFiltroCID: TGroupBox;
    rgFiltroCID: TRadioGroup;
    MontaSelectCID: TMontaSelect;
    pnlFiltroCID: TPanel;
    rgOpcaoCodCID: TRadioGroup;
    edCODCID: TEdit;
    bbtnBuscaCID: TBitBtn;
    gbxOcorr: TGroupBox;
    chklstTipoOcorr: TColorCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure edData1Exit(Sender: TObject);
    procedure rgFiltroCIDClick(Sender: TObject);
    procedure bbtnBuscaCIDClick(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlTipOcMed: TCtrlTipOcMed;

    ListaCodTipOcMed: TStringList;

    Tipo: TTipoRelatOcorrMed;

    procedure HabilitaBtOk;
  public
    constructor Create(AOwner: TComponent; TipoRelatorio: TTipoRelatOcorrMed); reintroduce;
  end;

var
  frmParamOcorrPess: TfrmParamOcorrPess;

implementation

uses uSistema, uCtrlPadroes, uCtrlFuncoesRH, fAguarde, dCds;

{$R *.DFM}

constructor TfrmParamOcorrPess.Create(AOwner: TComponent; TipoRelatorio: TTipoRelatOcorrMed);
begin
  Tipo := TipoRelatorio;
  inherited Create(AOwner);
end;

procedure TfrmParamOcorrPess.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTipOcMed := TCtrlTipOcMed.Create;
  CtrlTipOcMed.InitializeAs(Padroes);

  ListaCodTipOcMed := TStringList.Create;

  // Crio a lista de Tipos de Ocorrência a selecionar
  dmCds.Cds.Data := CtrlTipOcMed.ListTipoOcorrenciaMed;
  while not(dmCds.Cds.EOF) do
  begin
    ListaCodTipOcMed.Add(dmCds.Cds.FieldByName('CODTIPOOCMED').asString);
    chklstTipoOcorr.Items.Add(dmCds.Cds.FieldByName('DESCRTIPOOCMED').asString);
    dmCds.Cds.Next;
  end;

  edData1.Date := (Date - 365);
  edData2.Date := (Date);
  pgctrlPrincipal.ActivePage := tbshRelatorio;
  IrPaginaResult := false;

  if (Tipo = tpRelatPorPessoa) then
    Self.Caption := 'Relatório de Ocorrências Médicas por Pessoa'
  else
    Self.Caption := 'Relatório de Ocorrências Médicas por Tipo';

  // Alterado por FHBS - SOL: 73954 KTN: 523465
  if (Tipo = tpRelatPorPessoa) then
    tbsListaFunc.TabVisible := True;
  // Fim - Alterado por FHBS
end;

procedure TfrmParamOcorrPess.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlTipOcMed);
  FreeAndNil(ListaCodTipOcMed);
  inherited;
end;

procedure TfrmParamOcorrPess.edData1Exit(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamOcorrPess.rgFiltroCIDClick(Sender: TObject);
begin
  pnlFiltroCID.Visible := (rgFiltroCID.ItemIndex = 0);
end;

procedure TfrmParamOcorrPess.bbtnBuscaCIDClick(Sender: TObject);
begin
  MontaSelectCID.Executar;
  if (MontaSelectCID.RetornouValor) then
    edCODCID.Text := MontaSelectCID.ValoresChave[0];
end;

procedure TfrmParamOcorrPess.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoOcorr.Items.Count-1 do
    chklstTipoOcorr.Checked[c] := true;
  chklstTipoOcorr.Repaint;
end;

procedure TfrmParamOcorrPess.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoOcorr.Items.Count-1 do
    chklstTipoOcorr.Checked[c] := not(chklstTipoOcorr.Checked[c]);
  chklstTipoOcorr.Repaint;
end;

procedure TfrmParamOcorrPess.bbtnConfirmarClick(Sender: TObject);
var
  sListaIdFuncSel, sListaCodTipOcMedSel: string;
begin
  if (Tipo = tpRelatPorPessoa) then
    frmAguarde.Mostra('Ocorrências Médicas por Pessoa')
  else
    frmAguarde.Mostra('Ocorrências Médicas por Tipo');

  frmAguarde.Pos := 0;
  inherited;
  FU.CriaListaOpcoes(chklstTipoOcorr, ListaCodTipOcMed, sListaCodTipOcMedSel, ',', false);
  sListaIdFuncSel := '';
  while not(CdsPrincipal.EOF) do
  begin
    if (sListaIdFuncSel = '') then
      sListaIdFuncSel := CdsPrincipal.FieldByName('IDPESSOA').asString
    else
      sListaIdFuncSel := sListaIdFuncSel +','+ CdsPrincipal.FieldByName('IDPESSOA').asString;

    CdsPrincipal.Next;
  end;

  Cmp_Padrao.ParamByName('NomeEmpresa').asString := Sistema.NomeEmpresa;
  Cmp_Padrao.ParamByName('ListaCodTipOcMed').asString := sListaCodTipOcMedSel;
  Cmp_Padrao.ParamByName('ListaIdFunc').asString := sListaIdFuncSel;
  Cmp_Padrao.ParamByName('DataInicial').asDateTime := edData1.Date;
  Cmp_Padrao.ParamByName('DataFinal').asDateTime := edData2.Date;
  Cmp_Padrao.ParamByName('RelatorioAnalitico').asBoolean := (rgTipoRel.ItemIndex = 0);

  if (rgFiltroCID.ItemIndex = 0) and (edCODCID.Text <> '') then
  begin
    Cmp_Padrao.ParamByName('CodCID').asString := edCODCID.Text;
    Cmp_Padrao.ParamByName('BuscaCodCIDCompleto').asBoolean := (rgOpcaoCodCID.ItemIndex = 0);
  end
  else
  begin
    Cmp_Padrao.ParamByName('CodCID').asString := '';
    Cmp_Padrao.ParamByName('BuscaCodCIDCompleto').asBoolean := false;
  end;
end;

// ------------------------------------------------------------------------------------------
// Funções do Form
// ------------------------------------------------------------------------------------------

procedure TfrmParamOcorrPess.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := (Trim(edData1.Text) <> '') and (Trim(edData2.Text) <> '') and
    (edData1.Date <= edData2.Date);
end;

end.
