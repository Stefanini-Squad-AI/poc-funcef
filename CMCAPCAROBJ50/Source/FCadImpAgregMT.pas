unit FCadImpAgregMT;

// Alterações:
// -----------------------------------------------------------------------------
// Rotina    : várias
// Autor(a)  : André Pontes
// Data      : 08/03/2007
// Pendência : 22654 (reabertura)
// Descrição : Ajustes na habilitação da natureza da operação
//             Ajustes na gravação da natureza da operação      
// -----------------------------------------------------------------------------
// Rotina    : Apply Insert e Edit
// Autor(a)  : Marcus Oliveira
// Data      : 27/02/2007
// Pendência : 24573
// Descrição : Obrigar que no paramentro do sistema, tenha sido preenchido o campo Tipo de Documento para CPMF
//             no caso de querer usar o código de imposto "20 - CPMF"
// -----------------------------------------------------------------------------
// Rotina    : várias
// Autor(a)  : André Pontes
// Data      : 02/02/2007
// Pendência : 22654
// Descrição : Gravação da natureza da operação, necessária à gravação da LancIRRF quando o
//             imposto apenas gera valor
// -----------------------------------------------------------------------------
// Rotina    : ???
// Autor(a)  : André Tavare
// Data      : 14/01/2007
// Pendência : 24064
// Descrição : ???
// -----------------------------------------------------------------------------
// Rotina    : Divs
// Autor(a)  : Alex Pereira
// Data      : 01/09/2004
// Pendência : 17464
// Descrição : Corrigindo pendências 15378, 15379
//             Modificada também a query sqlcontab
// -----------------------------------------------------------------------------
// Rotina    : SqlCentroRespon
// Autor(a)  : André Tavares
// Data      : 25/05/2004
// Pendência : 15378, 15379
// Descrição : Adequação da query SqlCentroRespon para exibir o código externo e filtragem pelo IDPLANCENTRESPON
// -----------------------------------------------------------------------------
// Rotina    : CmeCadastroFind
// Autor(a)  : Alex Pereira
// Data      : 22/12/2003
// Pendência : 14365
// Descrição : Habilitar o PNLDOC apenas em operações de insert ou edit
// -----------------------------------------------------------------------------
// Rotina    : sbtnAlterarClick, sbtnAlterarClick, bbtnConfirmarClick, bbtnCancelarClick
// Autor(a)  : Gleyber
// Data      : 18/08/2003
// Pendência : 14365
// Descrição : Habilitar o PNLDOC apenas em operações de insert ou edit
// -----------------------------------------------------------------------------
// Rotina    :
// Autor(a)  : André Pontes
// Data      : 01/07/2003
// Pendência :
// Descrição : Cadastro alterado para gravar data de início e término de vigência de um imposto agregado
//            Tabela: FAIXATIPOAGREG
//            Campos: DATAINI e DATAFIM
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// Rotinas   : CmpForCliExit, FazerTipoRD\
// Data      : 01/09/2003
// Autor     : David Ayrolla
// Descrição : Filtragem dos tipos de desembolso pelo campo ATIVO
// Pendência : 14458
// -----------------------------------------------------------------------------



(*******************************************************************************
 Implementado em 27/07/1999 - Versão 02.11.02
 Responsável: Gustavo Viegas
 Cadastro de Impostos agregados com tabela de retenção para o contas a pagar e
 receber;
 20/08/1999 - 02.12.06
  Inclusão dos campos: Percentual da Base na tabela de retenção e momento de lançamento
  do imposto;
 23/08/1999 - 02.13.00
  Inclusão dos campos valor a abater por dependente
  Alteração do default do campo Percentual da Base para 100%
 10/02/2000 - 2.15.02
  Implementação da tela no Contas a Receber
 25/01/2000 - 02.16.04
  Inclusão da Indicação de cálculo pelo valor bruto ou líquido do lançamento.
  Ultilizado para retenções de impostos no almoxarifado.
 04/02/2000 - 02.17.03
  Inclusão da Indicação do lançamento do imposto somente na baixa do documento.
  Neste caso é considerada sempre;
 20/03/2000 - 2.17.18
  Implementação do Tratamento fiscas 'Lança Imposto Como Documento' e dos dados
  para lançamento de documento resultante desse imposto
 29/03/2000 - 02.18.03
  Correção no erro de constraint ao Inserir Imposto Sem Indicar o Fornecedor/Cliente;
  Correção na consulta da contabilização após inserir um Imposto/Agregado;
  Correção no tamanho da tela;
  Correção na montagem da consulta do Centro De Custo e Habilitação do Combo para a
  indicação do mesmo de acordo com a Conta Contábil Escolhida;
  Correção na montagem da consulta do Tipo de Desembolso e Habilitação do Combo para a
  indicação do mesmo de acordo com a indicação do fornecedor ou não;
  Filtrar Atividade/Projeto, Centro de Custo e Centro de Responsabilidade Por Empresa
  Proprietária;
 17/05/2000 - Alterações Funcef
  Implementação da visualização das contas sintéticas na pesquisa da conta contábil
 *******************************************************************************)

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IvDictio, IvMulti, IvEMulti, MontaSelect, Wwdatsrc, TB97Ctls, MAHlpBtn,
  TB97Tlbr, StdCtrls, Buttons, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, Mask, wwdbedit, TREdit, wwdblook, DBCtrls,
  CMProcuraSubTipo, CMProcuraMask, CmEventosCadastro, ImgList, uCMTypes,
  FCadastroMestreDetMT, DBClient, uCMClientDataSet, uCmSqlParams, Db,
  uCtrlParamIntegra, uCtrlTipoAgre, wwdbdatetimepicker, CMDateTimePicker,
  Wwdbspin, uCtrlTerceirosCapCar, uCtrlParamCAP, Wwdotdot, Wwdbcomb;

Type
  TFrmCadImpAgregMT = Class(TFrmCadastroMestreDetMT)
    DbeNome: TwwDBEdit;
    Label1: TLabel;
    DbrValFix: TDBRealEdit;
    Label2: TLabel;
    Label3: TLabel;
    DbeValMin: TDBRealEdit;
    lblAlterador: TLabel;
    RgAcumulaValor: TDBRadioGroup;
    Label4: TLabel;
    DbreValIni: TDBRealEdit;
    DbreValFin: TDBRealEdit;
    Label5: TLabel;
    Label6: TLabel;
    DbreValAbatVal: TDBRealEdit;
    DbreValAbatCalc: TDBRealEdit;
    Label7: TLabel;
    Label8: TLabel;
    DbRePercCust: TDBRealEdit;
    DBRealEdit8: TDBRealEdit;
    DbReValFixAbat: TLabel;
    RgDataLancto: TDBRadioGroup;
    Label9: TLabel;
    DBRealEdit3: TDBRealEdit;
    Label10: TLabel;
    DbeValDepend: TDBRealEdit;
    Label11: TLabel;
    CmbTratFisc: TwwDBLookupCombo;
    CkbValBruto: TDBCheckBox;
    CkbBaixaDoc: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    TbsNovoDoc: TTabSheet;
    DsContab: TwwDataSource;
    CkbAlteraBaixa: TDBCheckBox;
    dblkAlterador: TwwDBLookupCombo;
    CdsCentroRespon: TCMClientDataSet;
    SqlCentroRespon: TCMSqlParams;
    CdsUnidNegocS: TCMClientDataSet;
    SqlUnidNegocS: TCMSqlParams;
    CdsUnidNegoc: TCMClientDataSet;
    SqlUnidNegoc: TCMSqlParams;
    CdsTratFisc: TCMClientDataSet;
    SqlTratFisc: TCMSqlParams;
    CdsSubConta: TCMClientDataSet;
    SqlSubConta: TCMSqlParams;
    CdsTipoDoc: TCMClientDataSet;
    SqlTipoDoc: TCMSqlParams;
    CdsContab: TCMClientDataSet;
    SqlContab: TCMSqlParams;
    CdsCCusto: TCMClientDataSet;
    SqlCCusto: TCMSqlParams;
    CdsAlt: TCMClientDataSet;
    SqlAlt: TCMSqlParams;
    CdsTipoRD: TCMClientDataSet;
    SqlTipoRD: TCMSqlParams;
    CdsDet: TCMClientDataSet;
    SqlDet: TCMSqlParams;
    Sql: TCMSqlParams;
    DBChkFLGUSAVALFORCLI: TDBCheckBox;
    TabSheet1: TTabSheet;
    PnlContabImposto: TPanel;
    Label20: TLabel;
    Label12: TLabel;
    CContabil: TCMProcuraMaskContabil;
    cmbCCusto: TwwDBLookupCombo;
    dblkSubconta: TwwDBLookupCombo;
    wwDBLookupCombo1: TwwDBLookupCombo;
    lblCentroCusto: TLabel;
    PnlDoc: TPanel;
    lblTipoDocum: TLabel;
    lblTipoRD: TLabel;
    lblCentroRespon: TLabel;
    lblUnidNegoc: TLabel;
    dblcTipoDoc: TwwDBLookupCombo;
    dblcTipoRD: TwwDBLookupCombo;
    dblcCentroRespon: TwwDBLookupCombo;
    dblcUnidNegoc: TwwDBLookupCombo;
    CmpForCli: TCMProcuraForCli;
    RgDC: TDBRadioGroup;
    GrdContab: TwwDBGrid;
    grpDataVigencia: TGroupBox;
    DBedtDataIni: TCMDateTimePicker;
    DBedtDataFim: TCMDateTimePicker;
    Label13: TLabel;
    Label14: TLabel;
    grbxApuracao: TGroupBox;
    dbspedApura: TwwDBSpinEdit;
    dbSpedLancto: TwwDBSpinEdit;
    lblApura: TLabel;
    lblLancto: TLabel;
    sqlPlaconta: TCMSqlParams;
    cdsPlaconta: TCMClientDataSet;
    dbedCodExt: TwwDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    dblcPrograma: TwwDBLookupCombo;
    Label17: TLabel;
    cdsProgramaTF: TCMClientDataSet;
    sqlProgramaTF: TCMSqlParams;
    lblNatureza: TLabel;
    DBcboNatureza: TwwDBLookupCombo;
    cdsNatuRendimento: TClientDataSet;
    grCentroCusto: TGroupBox;
    dblkccustDocImp: TwwDBLookupCombo;
    dbchkCentCust: TDBCheckBox;
    cdsCCustoContab: TCMClientDataSet;
    sqlCCustoContab: TCMSqlParams;
    CmbTipoImp: TwwDBComboBox;

    procedure FormCreate(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure CmbTratFiscCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure CmpForCliExit(Sender: TObject);
    procedure dblcUnidNegocExit(Sender: TObject);
    procedure dblcCentroResponExit(Sender: TObject);
    procedure CContabilExit(Sender: TObject);
    procedure dblcTipoRDEnter(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure CContabilApertouBotao(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeDetalheAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CdsDetAfterInsert(DataSet: TDataSet);
    procedure CdsContabAfterInsert(DataSet: TDataSet);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbchkCentCustClick(Sender: TObject);
    procedure CmbTipoImpChange(Sender: TObject);

  private // Private declarations

    CtrlTipoAgre  : TCtrlTipoAgre;
    CtrlTerceiros : TCtrlTerceirosCapCar;  // André Pontes - pendência 22654 - 02/02/2007

    CtrlParamCAP  : TCtrlParamCAP;

    MensagemErro  : String;

    bTestaForCli  : Boolean;

    Function VerificaFaixa: Boolean;
    procedure SetaQueryAlterador;
    procedure FazerQryCCusto;
    procedure FazerTipoRD;


  public  // Public declarations


  end;



var
  FrmCadImpAgregMT: TFrmCadImpAgregMT;



implementation
{$R *.DFM}
uses
  uSistema, uDataBase, uFuncaoGeral, uMensErro;



procedure TFrmCadImpAgregMT.CmeCadastroFind(Sender: TObject);
Begin
  inherited;

  if Montaselect.RetornouValor then
  begin
    Repaint;

    Cds.Close;
    CdsDet.Close;
    Sql.Prepare;
    Sql.Params[0].AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
    Sql.Open;

    bTestaForCli := cds.fieldByName('IDFORCLI').isNull;

    SqlDet.Prepare;
    SqlDet.Params[0].AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
    SqlDet.Open;

    SetaQueryAlterador;
    FazerQryCCusto;

    CdsContab.Close;
    SqlContab.Prepare;
    SqlContab.Params[0].AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
    SqlContab.Open;

    CmpForCliExit(Self);

    PnlDoc.Enabled := False;  // Alex - 22/12/2003 - Pendência 14365

    // André Pontes - pendência 22654 - 08/03/2007
    DBedCodExt.Enabled  := CmbTipoImp.ItemIndex = 1;
    Label15.Enabled     := CmbTipoImp.ItemIndex = 1;
  End;
End;



procedure TFrmCadImpAgregMT.CmeCadastroInsert(Sender: TObject);
Begin
  pgctrlDetalhe.ActivePage := tbsDet;
  tbcDetalhe.TabIndex := 0;

  inherited;

  dblkAlterador.Enabled := False;

  Cds.FieldByName('FLGCALCVALBRUTO').AsString := 'S';
  Cds.FieldByName('FLGACUMULA').AsString := 'N';
  Cds.FieldByName('FLGTIPOCALC').AsString := '2';
  Cds.FieldByName('LANCAMENTOIMPOSTO').AsString := 'L';
  Cds.FieldByName('FLGLANCAIMPOSTO').AsString := 'L';
  Cds.FieldByName('FLGASSOCIACLASFIS').AsString := 'S';
  Cds.FieldByName('FLGALTERARETENCAO').AsString := 'N';
  Cds.FieldByName('FLGUSAVALFORCLI').AsString   := 'N';
  Cds.FieldByName('RECPAG').AsString := ParamIntegra.Recpag;
  Cds.FieldByName('IDPESSOA').AsInteger := Sistema.idEmpresa;

  If CmbTipoImp.Canfocus Then
    CmbTipoImp.SetFocus;

  CdsDet.Close;
  SqlDet.Prepare;
  SqlDet.Params[0].AsInteger := Cds.FieldByName('CODTIPOCUSTAGREG').AsInteger;
  SqlDet.Open;

  FazerQryCCusto;
  
  SqlContab.Prepare;
  SqlContab.Params[0].AsInteger := Cds.FieldByName('CODTIPOCUSTAGREG').AsInteger;
  SqlContab.Open;
End;

procedure TFrmCadImpAgregMT.CmeCadastroEdit(Sender: TObject);
Begin
  pgctrlDetalhe.ActivePage := tbsDet;
  tbcDetalhe.TabIndex := 0;

  inherited;

  If CmbTipoImp.Canfocus Then   CmbTipoImp.SetFocus;
End;

procedure TFrmCadImpAgregMT.CmeCadastroConfirma(Sender: TObject);
Begin
  inherited;

  pgctrlDetalhe.ActivePage := tbsDet;
  tbcDetalhe.TabIndex := 0;
End;

procedure TFrmCadImpAgregMT.CmeCadastroCancel(Sender: TObject);
Begin
  inherited;
  sql.Prepare;
  sql.Open;
  SqlDet.Prepare;
  SqlDet.Open;
  dblkAlterador.Enabled := True;
End;

procedure TFrmCadImpAgregMT.FormCreate(Sender: TObject);
Begin
  bTestaForCli := false;

  CtrlTipoAgre := TCtrlTipoAgre.Create;
  CtrlTipoAgre.InitializeAs(ParamIntegra);

  // André Pontes - pendência 22654 - 02/02/2007
  CtrlTerceiros := TCtrlTerceirosCapCar.Create;
  CtrlTerceiros.InitializeAs(ParamIntegra);

  CtrlTipoAgre.cds        := Cds;
  CtrlTipoAgre.cdsfaixa   := CdsDet;
  CtrlTipoAgre.cdstipCust := CdsContab;

  // André Pontes - pendência 22654 - 02/02/2007
  cdsNatuRendimento.Data := CtrlTerceiros.ListNatureza(Sistema.idEmpresa, ParamIntegra.RecPag); 

  sql.Prepare;
  Sql.ParamByName('PCODTIPOCUSTAGREG').AsInteger := -1;
  sql.Open;

  SqlDet.Prepare;
  SqlDet.ParamByName('PCODTIPOCUSTAGREG').AsInteger := -1;
  SqlDet.Open;

  inherited;

  If ParamIntegra.RecPag = 'P' Then
  Begin
    CmpForCli.ForCli := fcFornecedor;
    CmpForCli.Caption := 'Fornecedor';

// Daniel Simões - 25/01/2006 - Início------------------------------------------
    HelpContext           := 30056;
    bbtnAjuda.HelpContext := 30056;
    DBChkFLGUSAVALFORCLI.Caption := 'Utiliza dados do Cadastro do Fornecedor para Cálculo do Imposto';
    lblTipoRD.Caption := 'Tipo de Desembolso';
  end
  Else
  begin
    HelpContext           := 40075;
    bbtnAjuda.HelpContext := 40075;
// Daniel Simões - 25/01/2006 - Fim---------------------------------------------

    CmpForCli.ForCli := fcCliente;
    CmpForCli.Caption := 'Cliente';
    DBChkFLGUSAVALFORCLI.Caption := 'Utiliza dados do Cadastro do Cliente para Cálculo do Imposto';
    lblTipoRD.Caption := 'Tipo de Recebimento';
  End;
  SqlAlt.Prepare;
  SqlAlt.ParamByName('PRECPAG').AsString := ParamIntegra.RecPag;
  SqlAlt.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
  SqlAlt.ParamByName('PACRESDECRES').AsString := FuncaoGeral.Decode(ParamIntegra.RecPag, 'R', 'C', 'D');
  SqlAlt.Open;

  MontaSelect.Filtro.Add('(((TIPOAGRE.CODTRATFISCD = ''' + FuncaoGeral.Decode(ParamIntegra.RecPag, 'R', '8', 'A') +
    ''') AND (TIPOALTERADOR.ACRESDECRES = ''C'')) OR ' +
    ' ((TIPOAGRE.CODTRATFISCD = ''' + FuncaoGeral.Decode(ParamIntegra.RecPag, 'R', 'A', '8') +
    ''') AND (TIPOALTERADOR.ACRESDECRES = ''D'')) OR ' +
    ' (TIPOALTERADOR.ACRESDECRES IS NULL))');
  MontaSelect.Filtro.Add('TIPOAGRE.IDPESSOA = ' + FloatToStr(Sistema.IdEmpresa));

  CdsTratFisc.Close;
  SqlTratFisc.Open;

  If ParamIntegra.IntegraContab Then
  Begin
    PnlContabImposto.Enabled := True;
    CContabil.Plano := ParamIntegra.Plano;
    CContabil.Mascara := ParamIntegra.MascaraPlano;
    FazerQryCCusto;
  End
  Else
    PnlContabImposto.Enabled := False;

  SqlUnidNegocS.Prepare;
  SqlUnidNegocS.ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
  SqlUnidNegocS.Open;

  SqlSubConta.Prepare;
  SqlSubConta.ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
  SqlSubConta.Open;

  SqlCentroRespon.Prepare;
  SqlCentroRespon.ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
  SqlCentroRespon.Open;

  SqlUnidNegoc.Prepare;
  SqlUnidNegoc.ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
  SqlUnidNegoc.Open;

  sqlProgramaTF.Open;

  If ParamIntegra.RecPag = 'R' Then
    SqlTipoDoc.SQL.Text :=
      'SELECT CODTIPDOC,DESCRICAO,DEBCRE, FLGENGLOBAPARCELA, FLGGERANUMDOC, FLGDOCFISCAL FROM TIPODOCRECPAG WHERE RECPAG = ''R'' ORDER BY DEBCRE DESC,DESCRICAO'
  Else
    SqlTipoDoc.SQL.Text :=
      'SELECT CODTIPDOC,DESCRICAO,DEBCRE, FLGENGLOBAPARCELA, FLGGERANUMDOC, FLGDOCFISCAL FROM TIPODOCRECPAG WHERE RECPAG = ''P'' ORDER BY DEBCRE,DESCRICAO';
  SqlTipoDoc.Open;

  CmpForCli.Mensagens.EmBranco := CmpForCli.Caption + CmpForCli.Mensagens.EmBranco;
  CmpForCli.Mensagens.NaoExiste := CmpForCli.Caption + CmpForCli.Mensagens.NaoExiste;

         if   Cds.FieldByName('CODIMPOSTO').AsInteger = 1 then
              CmbTipoImp.ItemIndex := 0;
End;



Function TFrmCadImpAgregMT.VerificaFaixa: Boolean;
var
  rOldvalor: Real;
Begin
  Result := True;
  If CmeCadastro.Operacao In [OpInserir, OpAlterar] Then
  Begin
    If Trim(Cds.FieldByName('DESCCUSTAGREG').AsString) = '' Then
    Begin
      MsgDlg('Favor informar o nome do Imposto.', 'Aviso', mtError, [mbOk], 0);
      If DbeNome.CanFocus Then
        DbeNome.SetFocus;
      Result := False;
      Exit;
    End;

    If CdsDet.IsEmpty Then
    Begin
      MsgDlg('Tabela de retenção não informada', 'Aviso', mtError, [mbOk], 0);
      Result := False;
    End
    Else
    Begin
      CdsDet.First;
      rOldvalor := CdsDet.FieldByName('VLRFINALFAIXA').AsFloat;
      CdsDet.Next;
      While Not CdsDet.Eof Do
      Begin
        If (CdsDet.FieldByName('VLRINICIALFAIXA').AsFloat < rOldvalor) Then
        Begin
          MsgDlg('O Valor incial da faixa é menor que o valor final anterior, verifique.', 'Aviso', mtError, [mbOk], 0);
          Result := False;
          Exit;
        End
        Else
        Begin
          rOldvalor := CdsDet.FieldByName('VLRFINALFAIXA').AsFloat;
          CdsDet.Next;
        End;
      End;
    End;
  End;
End;

procedure TFrmCadImpAgregMT.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
var
  sDebCre: String;
Begin
  inherited;
  Accept := False;

  //início - andre tavares - pendência 24064 - 17/01/2007
  if trim(CmpForCli.text) = '' then
    if cds.state in [dsEdit, dsInsert] then
      Cds.fieldByName('IDFORCLI').Clear;

  if (not Cds.fieldByName('IDFORCLI').isnull) and bTestaForCli then
    if MsgDlg('É recomendável que o fornecedor não seja preenchido, ele será obtido automaticamente pelo banco liquidante?','Confirmação',mtConfirmation, [mbYes, mbNo], 0) = mrNO then
    begin
      if cds.state in [dsEdit, dsInsert] then
        Cds.fieldByName('IDFORCLI').Clear;
    end;

  if (CmbTratFisc.LookupValue = 'B') and (not dbchkCentCust.checked) and cds.fieldByName('CODCENTROCUSTO').isNull then
  begin
    Accept := False;
    MsgDlg('Obrigatório Informar o Centro de Custo.', 'Aviso', mtError, [mbOk], 0);
    if dbchkCentCust.CanFocus then
      dbchkCentCust.setFocus;
    exit;
  end;

  //fim - andre tavares - pendência 24064 - 17/01/2007


  sqlPlaconta.Prepare;
  sqlPlaconta.ParamByName('PLANO').AsInteger := ParamIntegra.Plano;
  sqlPlaconta.ParamByName('PLACONTA').AsString := CContabil.Conta.Numero;
  sqlPlaconta.Open;

  If CmeCadastro.Operacao In [OpInserir, OpAlterar] Then
  Begin
    If Trim(CmpForCli.Text) = '' Then
      Cds.FieldByName('IDFORCLI').Clear;
    Cds.FieldByName('CODTRATFISCE').AsString := Cds.FieldByName('CODTRATFISCD').AsString;
     case CmbTipoImp.ItemIndex of
         0:  Cds.FieldByName('CODIMPOSTO').AsInteger:=1;
         1:  Cds.FieldByName('CODIMPOSTO').AsInteger:=2;
         2:  Cds.FieldByName('CODIMPOSTO').AsInteger:=15;
         3:  Cds.FieldByName('CODIMPOSTO').AsInteger:=16;
         4:  Cds.FieldByName('CODIMPOSTO').AsInteger:=17;
         5:  Cds.FieldByName('CODIMPOSTO').AsInteger:=18;
         6:  Cds.FieldByName('CODIMPOSTO').AsInteger:=19;
         7:  Cds.FieldByName('CODIMPOSTO').AsInteger:=20;
    end;
  End;

  If VerificaFaixa And
    ((Not ParamIntegra.IntegraContab) Or (CContabil.Valida = VcOk)) And
    (CmpForCli.Valida = VcOk) Then
  Begin
  //catia - 22654 - 10/07/2006
    If (Trim(CmbTipoImp.Text) = '') Then
       MsgDlg('Obrigatório Informar o Código do Imposto.', 'Aviso', mtError, [mbOk], 0);
  //fim
    If (CmbTratFisc.LookupValue = 'B') Then   //lança imposto como novo documento
    Begin
      If (Trim(dblcPrograma.Text) = '') Then   //andre tavares - pendência 24064 - 17/01/2007
    Begin
        MsgDlg('Obrigatório Informar o Programa.', 'Aviso', mtError, [mbOk], 0);
        if dblcPrograma.canfocus then
          dblcPrograma.setFocus;
      end;
      If (Trim(dblcTipoDoc.Text) = '') Then
        MsgDlg('Obrigatório Informar o Tipo de Documento.', 'Aviso', mtError, [mbOk], 0)
      Else If (Trim(dblcTipoRD.Text) = '') Then
        MsgDlg('Obrigatório Informar o ' + lblTipoRD.Caption + '.', 'Aviso', mtError, [mbOk], 0)
      Else If (Trim(dblcCentroRespon.Text) = '') Then
        MsgDlg('Obrigatório Informar Centro de Responsabilidade.', 'Aviso', mtError, [mbOk], 0)
      Else If (ParamIntegra.IntegraContab) And
        (CContabil.Conta.ObrigaSubConta) And
        (Trim(dblkSubconta.Text) = '') Then
        MsgDlg('A Conta Contábil Informada Obriga Sub-Conta.', 'Aviso', mtError, [mbOk], 0)
      else if (trim(cdsPlaconta.fieldByName('PLACCUST').asString) = 'S') and (trim(cdsContab.fieldByName('CODCENTROCUSTO').asString) = '') then
        MsgDlg('A Conta Contábil Informada Obriga Centro de Custo.', 'Aviso', mtError, [mbOk], 0)
      Else If (ParamIntegra.IntegraContab) And
        (CdsContab.RecordCount > 1) then
        MsgDlg('Para contabilização de Impostos do Tipo Lança como novo documento só é permitido o Cadastro de uma Conta Contábil.', 'Aviso', mtError, [mbOk], 0)
      Else Accept := True;
    End
    Else
    Begin
       If (CmbTratFisc.LookupValue = '9') And (ParamIntegra.IntegraContab) then
       begin
          if (CdsContab.RecordCount = 1) And
             (Trim(CdsContab.FieldByName('DEBCRE').AsString) = '') Then
             MsgDlg('Para contabilização de Impostos do Tipo Somente Calcula Valor é obrigatórios a indicação do D/C da conta contábil.', 'Aviso', mtError, [mbOk], 0)
          else
          if (CdsContab.RecordCount > 2) then
             MsgDlg('Para contabilização de Impostos do Tipo Somente Calcula Valor só é permitido o Cadastro de no máximo 2 contas contábeis.', 'Aviso', mtError, [mbOk], 0)
          else
             if (CdsContab.RecordCount = 2) then
             begin
                 CdsContab.First;
                 sDebCre := CdsContab.FieldByName('DEBCRE').AsString;
                 CdsContab.Next;
                 If (Trim(sDebCre) = '') Or
                    (Trim(CdsContab.FieldByName('DEBCRE').AsString) = '') then
                    MsgDlg('Para contabilização de Impostos do Tipo Somente Calcula Valor é obrigatório a indicação do D/C.', 'Aviso', mtError, [mbOk], 0)
                 Else if sDebCre = CdsContab.FieldByName('DEBCRE').AsString then
                       MsgDlg('Para contabilização de Impostos do Tipo Somente Calcula Valor é os valores de D/C tem de ser diferentes para as contas indicadas.', 'Aviso', mtError, [mbOk], 0)
                 else Accept := True;
             end
             else Accept := True;
       end
       else Accept := True;
    End;
  End;
End;

procedure TFrmCadImpAgregMT.bbtnOkDetClick(Sender: TObject);
Begin
  If (CdsDet.FieldByName('VLRINICIALFAIXA').AsFloat > CdsDet.FieldByName('VLRFINALFAIXA').AsFloat) And
    (CdsDet.FieldByName('VLRFINALFAIXA').AsFloat > 0) Then
  Begin
    MsgDlg('O Valor incial da faixa é maior que o valor final, verifique.', 'Aviso', mtError, [mbOk], 0);
    Exit;
    If DbreValFin.CanFocus Then
      DbreValFin.SetFocus;
  End;

  inherited;

End;

procedure TFrmCadImpAgregMT.CmbTratFiscCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
Begin
  inherited;
  SetaQueryAlterador;
End;

procedure TFrmCadImpAgregMT.SetaQueryAlterador;
var
  ssql: String;
Begin
  If ((Trim(CmbTratFisc.Text) = '') Or
    (CdsTratFisc.FieldByName('CODTRATFISC').AsString = '9') Or
    (CdsTratFisc.FieldByName('CODTRATFISC').AsString = 'B')) Then
  Begin
    If CmeCadastro.Operacao <> OpInserir Then
    Begin
      ssql := SqlAlt.SQL.text;
      SqlAlt.SQL.text := ' SELECT CODALTERADOR,DESCRICAO,ACRESDECRES FROM  TIPOALTERADOR ' +
        ' WHERE  (RECPAG = :PRECPAG) AND      (IDPESSOA = :PIDPESSOA) AND ' +
        ' codalterador=' + inttostr(Cds.FieldByName('CODALTERADOR').asinteger);
      SqlAlt.Prepare;
      SqlAlt.ParamByName('PRECPAG').AsString := ParamIntegra.RecPag;
      SqlAlt.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      SqlAlt.open;
      SqlAlt.SQL.text := ssql;
    End;
    dblkAlterador.Enabled := False;
    If CmeCadastro.Operacao In [OpInserir, Opalterar] Then
    Begin
      Cds.FieldByName('CODALTERADOR').Clear;
    End;
  End
  Else
  Begin
    CdsAlt.Close;                                                                           
    SqlAlt.Prepare;
    SqlAlt.ParamByName('PRECPAG').AsString := ParamIntegra.RecPag;
    SqlAlt.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
    If (CdsTratFisc.FieldByName('CODTRATFISC').AsString = '8') Then
      SqlAlt.ParamByName('PACRESDECRES').AsString := FuncaoGeral.Decode(ParamIntegra.RecPag, 'R', 'C', 'D')
    Else
      SqlAlt.ParamByName('PACRESDECRES').AsString := FuncaoGeral.Decode(ParamIntegra.RecPag, 'R', 'D', 'C');
    SqlAlt.Open;

    dblkAlterador.Enabled := True;
  End;

  dblkAlterador.RefreshDisplay;

  PnlDoc.Enabled := CdsTratFisc.FieldByName('CODTRATFISC').AsString = 'B';
  PnlContabImposto.Enabled := ParamIntegra.IntegraContab And
                             (trim(CdsTratFisc.FieldByName('CODTRATFISC').AsString) <> 'B'); //andre tavares - pendência 24776 - 19/03/2007
End;

procedure TFrmCadImpAgregMT.FazerQryCCusto;
Begin
  If ParamIntegra.IntegraContab Then
  Begin
    CdsCCusto.Close;
    SqlCCusto.Prepare;
    SqlCCusto.ParamByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
    SqlCCusto.Open;

    CdsCCustoContab.Close;
    SqlCCustoContab.Prepare;
    SqlCCustoContab.ParamByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
    SqlCCustoContab.ParamByName('PLANO').AsInteger     := ParamIntegra.Plano;
    SqlCCustoContab.ParamByName('PLACONTA').AsString   := CContabil.Conta.Numero;
    SqlCCustoContab.Open;
  End;
End;

procedure TFrmCadImpAgregMT.CmpForCliExit(Sender: TObject);
Begin
  inherited;

  If (CmeCadastro.Operacao In [OpInserir, OpAlterar]) And
    (ActiveControl.Tag <> 9999) Then
  Begin
    If (CmpForCli.Valida = VcOk) Then
    Begin
      If (ParamIntegra.IntegraContab) And (Trim(CmpForCli.Text) <> '') Then
      Begin
        If trim(CmpForCli.ForCliReg.CContabil) = '' Then
        Begin
          MsgDlg('Como a contabilidade está integrada, é obrigatório preencher a conta contabil deste ' +
            FuncaoGeral.Decode(ParamIntegra.RecPag, 'R', 'Cliente', 'Fornecedor'), 'Erro', mtError, [mbOk],
            0);
          bbtnCancelar.Click;
          exit;
        End;
      End;

      If ParamIntegra.RecPag = 'P' Then
      Begin
        SqlTipoRD.SQL.Text := 'SELECT DISTINCT T.CODTIPRECDES, T.RECPAG, T.IDPESSOA, T.PLANO, T.PLACONTA, ' +
          'T.IDUSUARIOINCLUSAO, T.DESCRICAO, T.ANASINT, T.PLACONTACREDITO, T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO  FROM ' +
          'TIPORECEBDESEMB T, FORNXDESEMB F ' +
          ' WHERE (T.ANASINT = ''A'') AND ' +
          '       (T.RECPAG        = ''' + ParamIntegra.RecPag + ''') AND  ' +
          '       (T.IDPESSOA      = ' + InttoStr(Sistema.idempresa) + ') AND ' +
          '       (F.IDPESSOA      = ' + IntToStr(CmpForCli.ForCliReg.Id) + ') AND ' +
          '       (F.RECPAG        = T.RECPAG) AND  ' +
          '       (T.ATIVO <> ''N'') and ' +

          '       (F.IDEMPRESAPROP = T.IDPESSOA) AND ' +
          '       (F.CODTIPRECDES  = T.CODTIPRECDES) ' +
          ' ORDER BY T.DESCRICAO';
        SqlTipoRD.Open;
        If CdsTipoRD.IsEmpty Then
        Begin
          SqlTipoRD.SQL.Text :=
            'SELECT DISTINCT T.CODTIPRECDES, T.RECPAG, T.IDPESSOA, T.PLANO, T.PLACONTA, ' +
            'T.IDUSUARIOINCLUSAO, T.DESCRICAO, T.ANASINT, T.PLACONTACREDITO, T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO  FROM ' +
            'TIPORECEBDESEMB T, RAMOXDESEMB R ' +
            ' WHERE (T.ANASINT = ''A'') AND ' +
            '       (T.RECPAG           = ''' + ParamIntegra.RecPag + ''') AND  ' +
            '       (T.IDPESSOA         = ' + InttoStr(Sistema.idempresa) + ') AND ' +
            '       (R.IDRAMOFORNECEDOR IN (SELECT IDRAMOFORNECEDOR FROM FORNXRAMO WHERE IDPESSOA = ' + IntToStr(CmpForCli.ForCliReg.Id) +
            ')) AND ' +
            '       (R.RECPAG           = T.RECPAG)   AND ' +
            '       (R.IDPESSOA         = T.IDPESSOA) AND ' +
            '       (T.ATIVO <> ''N'') and ' +

            '       (R.CODTIPRECDES     = T.CODTIPRECDES) ' +
            ' ORDER BY T.DESCRICAO';
          SqlTipoRD.Open;
          If CdsTipoRD.IsEmpty Then
            FazerTipoRD;
        End
        Else
        Begin
          dblcTipoRD.LookupValue := CdsTipoRD.FieldByName('CODTIPRECDES').AsString;
          dblcTipoRD.Text := CdsTipoRD.FieldByName('DESCRICAO').AsString;
        End;
      End
      Else
      Begin
        SqlTipoRD.SQL.Text := 'SELECT DISTINCT T.CODTIPRECDES, T.RECPAG, T.IDPESSOA, T.PLANO, T.PLACONTA, ' +
          'T.IDUSUARIOINCLUSAO, T.DESCRICAO, T.ANASINT, T.PLACONTACREDITO, T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO  FROM ' +
          'TIPORECEBDESEMB T, CLIXRECEB F ' +
          ' WHERE (T.ANASINT = ''A'') AND ' +
          '       (T.RECPAG        = ''' + ParamIntegra.RecPag + ''') AND  ' +
          '       (T.IDPESSOA      = ' + InttoStr(Sistema.idempresa) + ') AND ' +
          '       (F.IDPESSOA      = ' + IntToStr(CmpForCli.ForCliReg.Id) + ') AND ' +
          '       (F.RECPAG        = T.RECPAG) AND  ' +
          '       (F.IDEMPRESA     = T.IDPESSOA) AND ' +
          '       (T.ATIVO <> ''N'') and ' +                    

          '       (F.CODTIPRECDES  = T.CODTIPRECDES) ' +
          ' ORDER BY T.DESCRICAO';
        SqlTipoRD.Open;
        If CdsTipoRD.IsEmpty Then
        Begin
          If Sistema.TipoEmpresa = 'P' Then
          Begin
            SqlTipoRD.SQL.Text := 'SELECT DISTINCT T.CODTIPRECDES, T.RECPAG, T.IDPESSOA, T.PLANO, T.PLACONTA, ' +
              'T.IDUSUARIOINCLUSAO, T.DESCRICAO, T.ANASINT, T.PLACONTACREDITO, T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO  FROM ' +
              'TIPORECEBDESEMB T, TIPOCLIXRECEB TR ' +
              ' WHERE (T.ANASINT = ''A'') AND ' +
              '       (T.RECPAG           = ''' + ParamIntegra.RecPag + ''') AND  ' +
              '       (T.IDPESSOA         = ' + InttoStr(Sistema.idempresa) + ') AND ' +
              '       (TR.IDTIPOCLIENTE IN (SELECT IDTIPOCLIENTE FROM CLIXTIPOCLI WHERE IDPESSOA = ' + IntToStr(CmpForCli.ForCliReg.Id) +
              ')) AND ' +
              '       (TR.RECPAG           = T.RECPAG)   AND ' +
              '       (TR.IDPESSOA         = T.IDPESSOA) AND ' +
              '       (T.ATIVO <> ''N'') and ' +

              '       (TR.CODTIPRECDES     = T.CODTIPRECDES) ' +
              ' ORDER BY T.DESCRICAO';
            SqlTipoRD.Open;
            If CdsTipoRD.IsEmpty Then
              FazerTipoRD;
          End
          Else
          Begin
            SqlTipoRD.SQL.Text := 'SELECT DISTINCT T.CODTIPRECDES, T.RECPAG, T.IDPESSOA, T.PLANO, T.PLACONTA, ' +
              'T.IDUSUARIOINCLUSAO, T.DESCRICAO, T.ANASINT, T.PLACONTACREDITO, T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO  FROM ' +
              'TIPORECEBDESEMB T, TIPOCLIXRECEB TR ' +
              ' WHERE (T.ANASINT = ''A'') AND ' +
              '       (T.RECPAG           = ''' + ParamIntegra.RecPag + ''') AND  ' +
              '       (T.IDPESSOA         = ' + InttoStr(Sistema.idempresa) + ') AND ' +
              '       (TR.IDTIPOCLIENTE IN (SELECT IDTIPOCLIENTE FROM CLIENTEPESS WHERE IDPESSOA = ' + IntToStr(CmpForCli.ForCliReg.Id) +
              ')) AND ' +
              '       (TR.RECPAG           = T.RECPAG)   AND ' +
              '       (TR.IDPESSOA         = T.IDPESSOA) AND ' +
              '       (T.ATIVO <> ''N'') and ' +

              '       (TR.CODTIPRECDES     = T.CODTIPRECDES) ' +
              ' ORDER BY T.DESCRICAO';
            SqlTipoRD.Open;
            If CdsTipoRD.IsEmpty Then
              FazerTipoRD;
          End;
        End
        Else
        Begin
          dblcTipoRD.LookupValue := CdsTipoRD.FieldByName('CODTIPRECDES').AsString;
          dblcTipoRD.Text := CdsTipoRD.FieldByName('DESCRICAO').AsString;
        End;
      End;
      dblcTipoRD.Enabled := True;
      If ParamIntegra.RecPag = 'P' Then
        CdsTipoRD.Fields[0].EditMask := ParamIntegra.MascaraDesemb + ';0;_'
      Else
        CdsTipoRD.Fields[0].EditMask := ParamIntegra.MascaraReceb + ';0;_';
      If CmeCadastro.Operacao = OpAlterar Then
      Begin
        dblcTipoRD.LookupValue := Cds.FieldByName('CODTIPRECDES').AsString;
        dblcTipoRD.Text := CdsTipoRD.FieldByName('DESCRICAO').AsString;
      End;
    End
    Else
      dblcTipoRD.Enabled := False;
  End;
End;

procedure TFrmCadImpAgregMT.dblcUnidNegocExit(Sender: TObject);
Begin
  inherited;
  If (Trim(dblcUnidNegoc.Text) <> '') And (ActiveControl.Tag <> 9999) And (CdsUnidNegoc.FieldByName('UNETIPO').AsString <> 'A') Then
  Begin
    MsgDlg('Atividade\Projeto tem de ser analítico', 'Atenção', mtWarning, [mbOk], 0);
    If dblcUnidNegoc.CanFocus Then
      dblcUnidNegoc.SetFocus;
  End;
End;

procedure TFrmCadImpAgregMT.dblcCentroResponExit(Sender: TObject);
Begin
  inherited;
  If (Trim(dblcCentroRespon.Text) <> '') And (ActiveControl.Tag <> 9999) And (CdsCentroRespon.FieldByName('ANALITICOSINTET').AsString <>
    'A') Then
  Begin
    MsgDlg('Centro de Responsabilidade analítico', 'Atenção', mtWarning, [mbOk], 0);
    If dblcCentroRespon.CanFocus Then
      dblcCentroRespon.SetFocus;
  End;
End;

procedure TFrmCadImpAgregMT.CContabilExit(Sender: TObject);
Begin
  inherited;
  CContabil.AceitaTipoConta := SoAnalitica;
  FazerQryCCusto;
End;

procedure TFrmCadImpAgregMT.dblcTipoRDEnter(Sender: TObject);
Begin
  inherited;
  If Not CdsTipoRd.Active Then
    FazerTipoRD;
End;

procedure TFrmCadImpAgregMT.sbtnProcurarClick(Sender: TObject);
Begin
  inherited;
  If Not CdsTipoRd.Active Then
    FazerTipoRD;
End;

procedure TFrmCadImpAgregMT.CContabilApertouBotao(Sender: TObject);
Begin
  inherited;
  CContabil.AceitaTipoConta := Indiferente;
End;

procedure TFrmCadImpAgregMT.FazerTipoRD;
Begin
  SqlTipoRD.SQL.Text :=
    'SELECT CODTIPRECDES, RECPAG, PLACONTACREDITO, PLANO, PLACONTA, DESCRICAO, ANASINT, FLGOBRIGARESERVA, FLGCALCULAIMPOSTO ' +
    'FROM TIPORECEBDESEMB WHERE (ANASINT = ''A'') AND (RECPAG = ''' + ParamIntegra.RecPag +
    ''') AND ' +
    ' (ATIVO <> ''N'') and ' +

    '(IDPESSOA = ' + InttoStr(Sistema.idempresa) + ') ORDER BY DESCRICAO';
  SqlTipoRD.Open;
End;

procedure TFrmCadImpAgregMT.CmeCadastroAfterConfirma(Sender: TObject);
Begin
  inherited;
  sql.Prepare;
  sql.Open;
  SqlDet.Prepare;
  SqlDet.Open;
End;

procedure TFrmCadImpAgregMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
Begin
  inherited;
  accept := CtrlTipoAgre.ExcluirTipoagreDet(sistema.IdEmpresa, sistema.IdModulo, sistema.IdUsuario);
End;

procedure TFrmCadImpAgregMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
  var       //Marcus Oliveira P. 24573 27/02/2007  inicio
    cdsAux : TCMClientDataSet;
Begin
  inherited;
  cdsAux := TCMClientDataSet.Create(nil);

  CtrlParamCAP := TCtrlParamCap.Create;
  CtrlParamCAP.InitializeAs(ParamIntegra);

  cdsAux.data := CtrlParamCAP.ListParamCAP(ParamIntegra.RecPag, Sistema.IdEmpresa);

  if ( cds.FieldByName('CODIMPOSTO').AsInteger = 20 ) and ( trim(cdsAux.FieldByName('CODTIPDOCCPMF').AsString) = '' ) then

    MessageDlg('Para utilizar o imposto 20 - CPMF, é necessário ir em ' + #13 +
               'Sistemas \ Configuraçãoes \ Parametro do sistema e selecionar ' + #13 +
               'o Tipo de Documento para CPMF. ', mtError, [mbOK], 0 );

  if ( ( cds.FieldByName('CODIMPOSTO').AsInteger = 20 ) and
       ( cdsAux.FieldByName('CODTIPDOCCPMF').AsInteger <> cds.FieldByName('CODTIPDOC').AsInteger ) ) then

    MessageDlg('O Tipo de Documento da aba "Dados para lançamento do documento" ' + #13 +
               'deve ser igual ao tipo de documento para CPMF definido no    ' + #13 +
               'parâmetro do sistema. ' , mtError, [mbOK], 0 )
  else
  begin
    Cds.DisableControls;
    accept := CtrlTipoAgre.GravarTipoagreDet(sistema.IdEmpresa, sistema.IdModulo, sistema.IdUsuario);
    Cds.EnableControls;
  end;
  cdsAux.Free;
  FreeAndNil(CtrlParamCAP);
          //Marcus Oliveira P. 24573 27/02/2007 fim
End;

procedure TFrmCadImpAgregMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
  var       //Marcus Oliveira P. 24573 27/02/2007  inicio
    cdsAux : TCMClientDataSet;
Begin
  inherited;
  cdsAux := TCMClientDataSet.Create(nil);

  CtrlParamCAP := TCtrlParamCap.Create;
  CtrlParamCAP.InitializeAs(ParamIntegra);

  cdsAux.data := CtrlParamCAP.ListParamCAP(ParamIntegra.RecPag, Sistema.IdEmpresa);

  //Marcus Oliveira P. 24573 27/02/2007  inicio
  if ( cds.FieldByName('CODIMPOSTO').AsInteger = 20 ) and ( trim(cdsAux.FieldByName('CODTIPDOCCPMF').AsString) = '' ) then

    MessageDlg('Para utilizar o imposto 20 - CPMF, é necessário ir em ' + #13 +
               'Sistemas \ Configuraçãoes \ Parametro do sistema e selecionar ' + #13 +
               'o Tipo de Documento para CPMF. ', mtError, [mbOK], 0 );

  if ( ( cds.FieldByName('CODIMPOSTO').AsInteger = 20 ) and
       ( cdsAux.FieldByName('CODTIPDOCCPMF').AsInteger <> cds.FieldByName('CODTIPDOC').AsInteger ) ) then

    MessageDlg('O Tipo de Documento da aba "Dados para lançamento do documento" ' + #13 +
               'deve ser igual ao tipo de documento para CPMF definido no    ' + #13 +
               'parâmetro do sistema. ' , mtError, [mbOK], 0 )
  else
  begin
    Cds.DisableControls;
    accept := CtrlTipoAgre.GravarTipoagreDet(sistema.IdEmpresa, sistema.IdModulo, sistema.IdUsuario);
    Cds.EnableControls;
  end;

  cdsAux.Free;
  FreeAndNil(CtrlParamCAP);
  //Marcus Oliveira P. 24573 27/02/2007 fim

End;

procedure TFrmCadImpAgregMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
Begin
  inherited;
  If CtrlTipoAgre.MessageInfo <> '' Then
    MsgDlg(CtrlTipoAgre.MessageInfo, 'Erro', mtError, [mbOK], 0);

End;

procedure TFrmCadImpAgregMT.CmeCadastroDelete(Sender: TObject);
Begin
  CdsDet.First;
  While Not CdsDet.Eof Do
    CdsDet.Delete;
  CdsContab.First;
  While Not CdsContab.Eof Do
    CdsContab.Delete;
  inherited;
End;

procedure TFrmCadImpAgregMT.CmeDetalheAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
Begin
  inherited;
  If CtrlTipoAgre.MessageInfo <> '' Then
    MsgDlg(CtrlTipoAgre.MessageInfo, 'Erro', mtError, [mbOK], 0);
End;

procedure TFrmCadImpAgregMT.CdsDetAfterInsert(DataSet: TDataSet);
begin
  inherited;
  CdsDet.FieldByName('CODTIPOCUSTAGREG').AsInteger := Cds.FieldByName('CODTIPOCUSTAGREG').AsInteger;
  CdsDet.FieldByName('PERCBASE').AsFloat := 100;
  If DbreValIni.Canfocus Then  DbreValIni.SetFocus;
end;

procedure TFrmCadImpAgregMT.CdsContabAfterInsert(DataSet: TDataSet);
begin
  inherited;
  CdsContab.FieldByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
  CdsContab.FieldByName('IDEMPRESA').AsFloat := Sistema.IdEmpresa;
  CdsContab.FieldByName('PLANO').AsFloat := ParamIntegra.Plano;
  CdsContab.FieldByName('CODTIPOCUSTAGREG').AsFloat := Cds.FieldByName('CODTIPOCUSTAGREG').AsInteger;
end;

procedure TFrmCadImpAgregMT.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  PnlDoc.Enabled := True;  // Gleyber - 18/08/2003 - Pendência 14365
end;

procedure TFrmCadImpAgregMT.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  PnlDoc.Enabled := True;  // Gleyber - 18/08/2003 - Pendência 14365
end;

procedure TFrmCadImpAgregMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  PnlDoc.Enabled := False;  // Gleyber - 18/08/2003 - Pendência 14365
end;

procedure TFrmCadImpAgregMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  PnlDoc.Enabled := False;  // Gleyber - 18/08/2003 - Pendência 14365
end;



procedure TFrmCadImpAgregMT.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  FazerQryCCusto;
end;



procedure TFrmCadImpAgregMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  CtrlTerceiros.Free;   // André Pontes - pendência 22654 - 02/02/2007
end;


//andre tavares - pendência 24064 - 17/01/2006
procedure TFrmCadImpAgregMT.dbchkCentCustClick(Sender: TObject);
begin
  inherited;
  if dbchkCentCust.checked then
  begin
    if cds.state in [dsEdit, dsInsert] then
      cds.fieldByName('CODCENTROCUSTO').Clear;
    dblkccustDocImp.Text := '';
    dblkccustDocImp.LookupValue := '';
    dblkccustDocImp.Enabled := false;
  end
  else
    dblkccustDocImp.Enabled := true;
end;



procedure TFrmCadImpAgregMT.CmbTipoImpChange(Sender: TObject);
begin
  inherited;
  // André Pontes - pendência 22654 - 08/03/2007
  DBedCodExt.Enabled  := CmbTipoImp.ItemIndex = 1;
  Label15.Enabled     := CmbTipoImp.ItemIndex = 1;
end;

end.

