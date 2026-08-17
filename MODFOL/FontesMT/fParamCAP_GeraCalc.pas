// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamCAP_GeraCalc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fOkCancelar, Db,
  DBClient, uCMClientDataSet, StdCtrls, CheckLst, wwdblook, wwdbdatetimepicker, IvMulti,
  CMDateTimePicker, IvDictio, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  BfDialogs, BrowseFolder, uProcuraDir, ColorCheckListBox, uCtrlListTerceirosRH,
  uCtrlBancoPortFolha, CMProcuraMask, uCmSqlParams, IniFiles;

type
  TfrmParamCAP_GeraCalc = class(TfrmOkCancelar)
    gbxDataPag: TGroupBox;
    dtDataPag: TCMDateTimePicker;
    gbxPortForma: TGroupBox;
    dblckPortadorForma: TwwDBLookupCombo;
    chkPagEletronico: TCheckBox;
    pnlPagEletronico: TPanel;
    Label4: TLabel;
    edPastaArqPag: TEdit;
    bbtnSelPastaPag: TBitBtn;
    chkCAP: TCheckBox;
    pnlCAP: TPanel;
    pnlOpcoesCAP: TPanel;
    chkRateioCC: TCheckBox;
    chkCriaDocIndividual: TCheckBox;
    gbxTipoDesemb: TGroupBox;
    chklstTipoDesemb: TColorCheckListBox;
    bbtnSelTipo: TBitBtn;
    bbtnInvTipo: TBitBtn;
    CdsPortadorForma: TCMClientDataSet;
    ProcuraDirDlg: TProcuraDirDlg;
    CMProcuraMaskContabil: TCMProcuraMaskContabil;
    dsAux: TDataSource;
    sqlAux: TCMSqlParams;
    CdsAux: TCMClientDataSet;
    chkConsTipoDesemb: TCheckBox;
    procedure chkPagEletronicoClick(Sender: TObject);
    procedure bbtnSelPastaPagClick(Sender: TObject);
    procedure chkCAPClick(Sender: TObject);
    procedure bbtnSelTipoClick(Sender: TObject);
    procedure bbtnInvTipoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlBancoPortFolha: TCtrlBancoPortFolha;

    ArqConfig: TIniFile; // Arquivo de alterações
    sMascaraPlano: string;

    procedure CriarListaDesemb;
    // Ler alterações a partir do arquivo de configurações
    procedure LerAlteracoes;
    // Gravar alterações feitas na tela no arquivo de configurações
    procedure GravarAlteracoes;

  public
    ListaCodTipoDesemb: TStringList;
    sListaTipoDesembSel: string;
    ExibeDataPagamento: boolean;
    iPlano: integer;
  end;

var
  frmParamCAP_GeraCalc: TfrmParamCAP_GeraCalc;

implementation

uses uSistema, dCds, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmParamCAP_GeraCalc.FormCreate(Sender: TObject);
var
  iCodPortFormaPadrao: integer;
begin
  inherited;
  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlBancoPortFolha := TCtrlBancoPortFolha.Create;
  CtrlBancoPortFolha.InitializeAs(Padroes);

  ListaCodTipoDesemb := TStringList.Create;

  // Preencher Lista dos Tipos de Desembolso
  CriarListaDesemb;

  CdsPortadorForma.Data := CtrlBancoPortFolha.ListPortadorXConta;
  iCodPortFormaPadrao := CtrlBancoPortFolha.GetCodPortFormaPadrao;
  if (iCodPortFormaPadrao > 0) then
  begin
    dblckPortadorForma.LookupValue := IntToStr(iCodPortFormaPadrao);
    dblckPortadorForma.Update;
  end;

  chkPagEletronico.Checked := true;
  chkCAP.Checked := true;

  ExibeDataPagamento := true;

  iPlano := CtrlListTerceirosRH.GetPlano(Sistema.IdEmpresa);
  sMascaraPlano := CtrlListTerceirosRH.GetMascaraPlano(iPlano);

  CMProcuraMaskContabil.Mascara := CtrlListTerceirosRH.GetMascaraPlano(iPlano);
  CMProcuraMaskContabil.Plano := iPlano;
  LerAlteracoes;
  CMProcuraMaskContabil.DataSource := dsAux;

  edPastaArqPag.Text := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  //Ádler Teodoro de Souza SOL 109421 KINTANA 496332


end;

procedure TfrmParamCAP_GeraCalc.FormDestroy(Sender: TObject);
begin
  GravarAlteracoes;
  
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlBancoPortFolha);
  FreeAndNil(ListaCodTipoDesemb);
  inherited;
end;

procedure TfrmParamCAP_GeraCalc.FormShow(Sender: TObject);
begin
  inherited;
  if not(ExibeDataPagamento) then
  begin
    gbxPortForma.Left := 10;
    gbxPortForma.Width := 416;
    dblckPortadorForma.Width := 401;
    gbxDataPag.Visible := false;
  end;
end;

procedure TfrmParamCAP_GeraCalc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caHide;
end;

procedure TfrmParamCAP_GeraCalc.chkPagEletronicoClick(Sender: TObject);
begin
  edPastaArqPag.Enabled := chkPagEletronico.Checked;
  bbtnSelPastaPag.Enabled := chkPagEletronico.Checked;
end;

procedure TfrmParamCAP_GeraCalc.bbtnSelPastaPagClick(Sender: TObject);
begin
  ProcuraDirDlg.Directory := edPastaArqPag.Text;
  if (ProcuraDirDlg.Execute) then
    edPastaArqPag.Text := ProcuraDirDlg.Directory;
end;

procedure TfrmParamCAP_GeraCalc.chkCAPClick(Sender: TObject);
begin
  chkRateioCC.Enabled := chkCAP.Checked;
  chkCriaDocIndividual.Enabled := chkCAP.Checked;
  chkConsTipoDesemb.Enabled := chkCAP.Checked;
  chklstTipoDesemb.Enabled := chkCAP.Checked;
  bbtnSelTipo.Enabled := chkCAP.Checked;
  bbtnInvTipo.Enabled := chkCAP.Checked;
  CMProcuraMaskContabil.Enabled := chkCAP.Checked;
end;

procedure TfrmParamCAP_GeraCalc.bbtnSelTipoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoDesemb.Items.Count-1 do
    chklstTipoDesemb.Checked[c] := true;
  chklstTipoDesemb.Repaint;
end;

procedure TfrmParamCAP_GeraCalc.bbtnInvTipoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoDesemb.Items.Count-1 do
    chklstTipoDesemb.Checked[c] := not(chklstTipoDesemb.Checked[c]);
  chklstTipoDesemb.Repaint;
end;

procedure TfrmParamCAP_GeraCalc.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  // Lista dos Tipos de Desembolso selecionados
  FU.CriaListaOpcoes(chklstTipoDesemb, ListaCodTipoDesemb, sListaTipoDesembSel, ',', false);
end;

procedure TfrmParamCAP_GeraCalc.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  sListaTipoDesembSel := '';
end;

procedure TfrmParamCAP_GeraCalc.CriarListaDesemb;
var
  c: integer;
begin
  c := 0;
//  dmCds.Cds.Data := CtrlListTerceirosRH.ListTipoDocRecebDesembXContabFolha(Sistema.IdEmpresa);
  dmCds.Cds.Data := CtrlListTerceirosRH.ListTipoCentroRepons(Sistema.IdEmpresa,IntToStr(Sistema.IdUsuario) ,'1');//CtrlListTerceirosRH.ListTipoDocRecebDesembXContabFolha(Sistema.IdEmpresa);
  chklstTipoDesemb.Items.Clear;
  ListaCodTipoDesemb.Clear;
  while not(dmCds.Cds.EOF) do
  begin
    chklstTipoDesemb.Items.Add(dmCds.Cds.FieldByName('DESCRICAO').asString);
    chklstTipoDesemb.Checked[c] := true;
    ListaCodTipoDesemb.Add(dmCds.Cds.FieldByName('CODTIPRECDES').asString);
    dmCds.Cds.Next;
    Inc(c);
  end;
end;

procedure TfrmParamCAP_GeraCalc.LerAlteracoes;
begin
  // Recuperar as últimas alterações das opções
  //ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  sqlAux.Open;
  CdsAux.Insert;
  CdsAux.FieldByName('CONTA').asString :=
    ArqConfig.ReadString('PARAMCAP_GERACALC', 'ContaContabilFavorecido', '');
  CdsAux.Post;
  CdsAux.Edit;
end;

procedure TfrmParamCAP_GeraCalc.GravarAlteracoes;
begin
  ArqConfig.WriteString('PARAMCAP_GERACALC', 'ContaContabilFavorecido',
    CdsAux.FieldByName('CONTA').asString);
  ArqConfig.Free;
end;

end.
