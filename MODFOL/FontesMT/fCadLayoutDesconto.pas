unit fCadLayoutDesconto;


// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//------------------------------------------------------------------------------
//Autor(a)   : Douglas Siqueira
//Data       : 21/12/2012
//Pendência  : SOL 108804 KTN 494141	
//Descricao  : Retirar visualização na Folha de Pagamento de dados de outros módulos, 
//tais como: layout de arquivos TXT, tabelas genéricas, rubricas, formas de cálculo etc.
// Menus: * Cadastro / Tabelas Auxiliares / Tabela REGRA/Forma de Cálculo - Forma de Cálculo
// e Tabela Genérica * Sistema / Utilitários / Layout de Arquivos TXT * Cadastros / Rubricas
// por Empresa * Cadastros / Rubricas Salariais * Cadastros / Motivos e Ações Impedir o mesmo
//acesso aos dados da folha por outros módulos.


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadastroMT,
  StdCtrls, TREdit, ExtCtrls, DBCtrls, Wwdbspin, wwdbdatetimepicker, CMDateTimePicker,
  wwdblook, Mask, wwdbedit, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect, TB97,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls,
  ComCtrls, DBClient, uCMClientDataSet, uCtrlLayoutDesconto, uCtrlListTerceirosRH,
  uCtrlProvDesc;

type
  TfrmCadLayoutDesconto = class(TfrmCadastroMT)
    dsDet: TwwDataSource;
    MontaSelectRubrica: TMontaSelect;
    pnlDecricao: TPanel;
    Label13: TLabel;
    dbedDescricao: TwwDBEdit;
    GroupBox1: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    dbedMatriculaPos: TwwDBEdit;
    dbedMatriculaTam: TwwDBEdit;
    rgTipoIdent: TRadioGroup;
    dblcTipoDoc: TwwDBLookupCombo;
    GroupBox2: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label16: TLabel;
    dbedRubricaPos: TwwDBEdit;
    dbedRubricaTam: TwwDBEdit;
    gbxOcorrencias: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dbedPosOcorr: TwwDBEdit;
    dbedTamOcorr: TwwDBEdit;
    gbxParcelas: TGroupBox;
    Label7: TLabel;
    Label3: TLabel;
    dbedPosParc: TwwDBEdit;
    dbedTamParc: TwwDBEdit;
    gbxValor: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    dbedtPosicaoValor: TwwDBEdit;
    dbedtTamValor: TwwDBEdit;
    dbedtDepDecimalValor: TwwDBEdit;
    dbedNumDecimais: TwwDBEdit;
    CdsDet: TCMClientDataSet;
    Bevel1: TBevel;
    Label6: TLabel;
    memRubrica: TMemo;
    sbtnSelRubrica: TSpeedButton;
    CdsTipoDoc: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure rgTipoIdentClick(Sender: TObject);
    procedure sbtnSelRubricaClick(Sender: TObject);
    procedure dbedRubricaPosChange(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlProvDesc: TCtrlProvDesc;
    CtrlLayoutDesconto: TCtrlLayoutDesconto;

    sDescricao: string;
    dIdRubrica: double;

    procedure Sel(IdLayout: double);
    function  GravarRegistro(Exclusao: boolean): boolean;
  end;

var
  frmCadLayoutDesconto: TfrmCadLayoutDesconto;

implementation

uses uCMTypes, uSistema, uMensErro, uCtrlPadroes, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmCadLayoutDesconto.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  CtrlLayoutDesconto := TCtrlLayoutDesconto.Create;
  CtrlLayoutDesconto.InitializeAs(Padroes);
  CtrlLayoutDesconto.Cds := Cds;
  CtrlLayoutDesconto.CdsDet := CdsDet;
  Sel(-1);

  CdsTipoDoc.Data := CtrlListTerceirosRH.ListTipoDocumento;

  with (MontaSelectRubrica.Filtro) do
  begin
    Clear;
    Add('RUBRICAXPESS.IDPESSOA    = '+IntToStr(Sistema.IdEmpresa));
    Add('PROVDESC.FLGTPRUBRICA LIKE (''%F%'')');
    Add('PROVDESC.IDPROVENTO      = RUBRICAXPESS.IDRUBRICA');
  end;

  rgTipoIdent.ItemIndex := 0;
  rgTipoIdentClick(Sender);
end;

procedure TfrmCadLayoutDesconto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlLayoutDesconto);
  FreeAndNil(CtrlProvDesc);
  FreeAndNil(CtrlListTerceirosRH);
  inherited;
end;

procedure TfrmCadLayoutDesconto.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
  begin
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
    if (Cds.FieldByName('COLCODIGODEP').asInteger = 0) then
      rgTipoIdent.ItemIndex := 0
    else
      rgTipoIdent.ItemIndex := 1;
    rgTipoIdentClick(Sender);
  end;
  rgTipoIdent.Enabled := false;
end;

procedure TfrmCadLayoutDesconto.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
  Cds.FieldByName('COLCODIGODEP').asInteger := 0;

  CdsDet.Insert;
  CdsDet.FieldByName('NUMDECIMAIS').asInteger := 2;

  memRubrica.Text := '';
  rgTipoIdent.ItemIndex := 0;
  dbedDescricao.SetFocus;
end;

procedure TfrmCadLayoutDesconto.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  if not(CdsDet.IsEmpty) then
    CdsDet.Edit;
end;

procedure TfrmCadLayoutDesconto.CmeCadastroDelete(Sender: TObject);
begin
  if not(CdsDet.IsEmpty) then
    CdsDet.Delete;
  inherited;
end;

procedure TfrmCadLayoutDesconto.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadLayoutDesconto.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro(false);
end;

procedure TfrmCadLayoutDesconto.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro(false);
end;

procedure TfrmCadLayoutDesconto.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro(true);
  if (Accept) then
    memRubrica.Text := '';
end;

procedure TfrmCadLayoutDesconto.dsStateChange(Sender: TObject);
begin
  inherited;
  rgTipoIdent.Enabled := (Cds.State in [dsInsert, dsEdit]);
  if (rgTipoIdent.Enabled) then
    dbedDescricao.SetFocus;

  rgTipoIdentClick(Sender);
end;

procedure TfrmCadLayoutDesconto.dbedRubricaPosChange(Sender: TObject);
begin
  sbtnSelRubrica.Enabled := (StrToIntDef(dbedRubricaPos.Text, 0) = 0) and
    (StrToIntDef(dbedRubricaTam.Text, 0) = 0);

  if (sbtnSelRubrica.Enabled) then
    memRubrica.Text := sDescricao;
end;

procedure TfrmCadLayoutDesconto.rgTipoIdentClick(Sender: TObject);
begin
  dblcTipoDoc.Visible := (rgTipoIdent.ItemIndex = 1);
  if (dblcTipoDoc.Visible) then
  begin
    dblcTipoDoc.LookUpValue := Cds.FieldByName('COLCODIGODEP').asString;
    dblcTipoDoc.UpDate;
  end;
end;

procedure TfrmCadLayoutDesconto.sbtnSelRubricaClick(Sender: TObject);
begin
  MontaSelectRubrica.Executar;
  if (MontaSelectRubrica.RetornouValor) then
  begin
    dIdRubrica := StrToFloat(MontaSelectRubrica.ValoresChave[0]);
    memRubrica.Text := Trim(MontaSelectRubrica.ValoresChave[1]);
  end;
end;

procedure TfrmCadLayoutDesconto.bbtnConfirmarClick(Sender: TObject);
var
  bInserindo: boolean;
begin
  // Critica os dados do Mestre
  if (Trim(dbedMatriculaPos.Text) = '') then
  begin
    MsgDlg('Digite a posição do campo que identifica o Empregado.', 'Aviso',
      mtWarning, [mbOk,mbHelp], 0);
    dbedMatriculaPos.SetFocus;
    exit;
  end;

  if (Trim(dbedMatriculaTam.Text) = '') then
  begin
    MsgDlg('Digite o tamanho do campo que identifica o Empregado.', 'Aviso',
      mtWarning, [mbOk,mbHelp], 0);
    dbedMatriculaTam.SetFocus;
    exit;
  end;

  if ((Trim(dbedRubricaPos.Text) = '')  and (Trim(dbedRubricaTam.Text) <> '')) or
     ((Trim(dbedRubricaPos.Text) <> '') and (Trim(dbedRubricaTam.Text)  = '')) then
  begin
    if (Trim(dbedRubricaPos.Text) = '') then
    begin
      MsgDlg('Digite a posição do campo que identifica a Rubrica.', 'Aviso',
        mtWarning, [mbOk,mbHelp], 0);
      dbedRubricaPos.SetFocus;
    end
    else
    begin
      MsgDlg('Digite o tamanho do campo que identifica a Rubrica.', 'Aviso',
        mtWarning, [mbOk,mbHelp], 0);
      dbedRubricaTam.SetFocus;
    end;
    exit;
  end;

  // Critica os dados do Detalhe
  if ((Trim(dbedRubricaPos.Text) = '') or (Trim(dbedRubricaTam.Text) = '')) then
    if (Trim(memRubrica.Text) = '') then
    begin
      MsgDlg('Uma Rubrica deve ser selecionada.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
      memRubrica.SetFocus;
      exit;
    end;

  if ((Trim(dbedPosParc.Text)  = '') and (Trim(dbedTamParc.Text) <> '')) or
     ((Trim(dbedPosParc.Text) <> '') and (Trim(dbedTamParc.Text)  = '')) then
  begin
    MsgDlg('Parcelas: Posição e Tamanho ambos preenchidos ou ambos em branco.', 'Aviso',
      mtWarning, [mbOk,mbHelp], 0);
    dbedPosParc.SetFocus;
    exit;
  end;

  if (Trim(dbedtDepDecimalValor.Text)  <> '') and ((Trim(dbedNumDecimais.Text) = '') or
     (Trim(dbedNumDecimais.Text)  = '0')) then
  begin
    MsgDlg('Separador Sem Casas Decimais ?. Verifique.', 'Aviso',
      mtWarning, [mbOk,mbHelp], 0);
    dbedtDepDecimalValor.SetFocus;
    exit;
  end;

  if ((Trim(dbedPosOcorr.Text)  = '') and (Trim(dbedTamOcorr.Text) <> '')) or
     ((Trim(dbedPosOcorr.Text) <> '') and (Trim(dbedTamOcorr.Text)  = '')) then
  begin
    MsgDlg('Ocorrências: Posição e Tamanho ambos preenchidos ou ambos em branco.', 'Aviso',
      mtWarning, [mbOk,mbHelp], 0);
    dbedPosOcorr.SetFocus;
    exit;
  end;

  if (Trim(dbedtPosicaoValor.Text) = '') then
  begin
    MsgDlg('Digite a posição do Valor.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dbedtPosicaoValor.SetFocus;
    exit;
  end;

  if (Trim(dbedtTamValor.Text) = '') then
  begin
    MsgDlg('Digite o tamanho do Valor.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dbedtTamValor.SetFocus;
    exit;
  end;

  if (rgTipoIdent.ItemIndex = 0) then
    Cds.FieldByName('COLCODIGODEP').Clear;

  if (dIdRubrica > 0) then
    CdsDet.FieldByName('IDRUBRICA').asString := FloatToStr(dIdRubrica)
  else
    CdsDet.FieldByName('IDRUBRICA').Clear;

  CdsDet.FieldByName('IDEMPRESA').asInteger := Sistema.IdEmpresa;
  CdsDet.Post;

  bInserindo := (Cds.State = dsInsert);
  inherited;
  if not(bInserindo) then
    Sel(Cds.FieldByName('IDLAYOUT').asFloat);
end;

procedure TfrmCadLayoutDesconto.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if (Cds.IsEmpty) then
    Sel(-1)
  else
    Sel(Cds.FieldByName('IDLAYOUT').asFloat);

  rgTipoIdent.ItemIndex := 0;
  rgTipoIdentClick(Sender);
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmCadLayoutDesconto.Sel(IdLayout: double);
begin
  Cds.Data := CtrlLayoutDesconto.ListMestre(IdLayout);
  CdsDet.Data := CtrlLayoutDesconto.ListDetalhe(IdLayout);

  dIdRubrica := CdsDet.FieldByName('IDRUBRICA').asFloat;
  sDescricao := Trim(CtrlProvDesc.GetDescricaoRubrica(
    CdsDet.FieldByName('IDRUBRICA').asFloat, Sistema.IdEmpresa));
  memRubrica.Text := sDescricao;
end;

function TfrmCadLayoutDesconto.GravarRegistro(Exclusao: boolean): boolean;
begin
  if (Exclusao) then
    Result := CtrlLayoutDesconto.Excluir
  else
   ///douglas.siqueira SOL108804
    begin
    Cds.FieldByName('IDMODULO').asFloat:=21;
    Result := CtrlLayoutDesconto.Gravar;
    end;
   ///douglas.siqueira SOL108804


  if not(Result) then
    raise exception.Create(CtrlLayoutDesconto.MessageInfo);
end;

end.
