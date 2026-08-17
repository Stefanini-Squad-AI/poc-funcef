//N. WO..............: B_MIGRACAO_ORACLE_2025
//Data da Alteração..: 10/10/2025
//Responsável........: Leandro Pocebon
//Descrição..........: Ajuste consulta SQL campo NSA.
//******************************************************************************

//Rotina.............: VerificaCampos, bbtnImprime
//N. WO..............: 12517
//Data da Alteração..: 02/08/2024
//Responsável........: Leandro Pocebon
//Descrição..........: Não obrigar o usuario a informar o local para salvar em
//                     arquivo.
//******************************************************************************
//Rotina.............: bbtnImprime
//N. WO..............: 18806
//Data da Alteração..: 10/06/2024
//Responsável........: Helen V Bianchi
//Descrição..........: Criação do Relatório de Tarifa Bancaria
//                     Alterando o campo VALOR e VLRTARIFA para Float
//******************************************************************************
//Rotina.............: HabilitaMovimFinanc
//N. SIG.............: 129996
//Data da Alteração..: 26/10/2022
//Responsável........: Everson Cunha
//Descrição..........: Definição do novo parâmetro padrão "Histórico Padrão"
//******************************************************************************
//Rotina.............: HabilitaMovimFinanc
//N. SIG.............: 119161
//Data da Alteração..: 10/09/2021
//Responsável........: Cássio Rovaroto
//Descrição..........: Definição do novo parâmetro padrão para o Centro de
//                     Responsabilidade.
//******************************************************************************
//N. SIG.............: 115043
//Data da Alteração..: 14/04/2021
//Responsável........: Ewerton Beltramini
//Descrição..........: Alteração do valor defaul do campo lkpPortadorConta
//                     (CODPORTADOR)
//******************************************************************************
//Rotina.............: HabilitaMovimFinanc
//N. SIG.............: 111231
//Data da Alteração..: 20/11/2020
//Responsável........: André Imakawa
//Descrição..........: Alteração do valor defaul do campo Atividade
//******************************************************************************
//Rotina.............: FormCreate, InicializaForm, dtpDataLancamentoExit,
//N. SIG.............: 99578
//Data da Alteração..: 24/04/2020
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Correção no procedimento de conciliação de tarifa.
//******************************************************************************
//Rotina.............: lkpTipoRecebDesembChange, HabilitaMovimFinanc
//N. SIG.............: 99500
//Data da Alteração..: 20/04/2020
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Alteração na forma de determinação de conta contábil.
//******************************************************************************
//Rotina.............: HabilitaMovimFinanc
//N. SIG.............: 99438
//Data da Alteração..: 14/04/2020
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Alteração da conta contábil padrão de conciliação de
//                     tarifa.
//******************************************************************************
//Rotina.............: HabilitaMovimFinanc, InicializaForm, bbtnConfirmarClick,
//                     grdTarifaBancariaFieldChanged, lkpConvenioBancarioExit,
//                     FormCreate, HabilitaMovimFinanc, InicializaForm
//N. SIG.............: 98429
//Data da Alteração..: 06/03/2020
//Alteração Form.....: fConcTarifaBancaria
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Melhorias no procedimento de conciliação de tarifas
//                     bancárias.
//******************************************************************************
//Rotina.............: chkAssocMovimFinancClick, MontaRegistrosTarifa,
//                     FormCreate, FormClose, btnLocalizarClick
//N. SIG.............: 80588
//Data da Alteração..: 28/02/2020
//Alteração Form.....: fConcTarifaBancaria
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Melhoria sobre o procedimento de conciliação de tarifa.
//******************************************************************************
//N. SIG.............: 46651
//Data da Alteração..: 17/01/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Criação da funcionalidade de conciliação de tarifas
//                     bancárias.
//******************************************************************************

unit fConcTarifaBancaria;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Mask, wwdbedit, TREdit, DBCtrls, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, Grids, Wwdbigrd, Wwdbgrid, Db,
  DBClient, uCMClientDataSet, uCmSqlParams, uCtrlMovimFinanc, uCtrlParamFinanc,
  uCtrlListTercFinanc, uCtrlHistPadrao, uCtrlFinanc, uCtrlPlanPrevContabPatro,
  CMProcuraMask, FTelaAut, uCtrlIntBanco, uCtrlTarifaBancaria, uCMMath, UDatabase,
  MontaSelect, QExport3, QExport3XLS, ppBands, ppClass, ppVar, ppCtrls,
  ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport, ppDB, ppDBPipe,
  ppDBBDE, Wwdatsrc, DBTables, Wwquery, Provider, jpeg,ShellAPI,
  ppParameter;

type  
  TfrmConcTarifaBancaria = class(TfrmOkCancelar)
    pnlControles: TPanel;
    pnlTarifaBanc: TPanel;
    pnlMovimFinanc: TPanel;
    lblDataMovimentacao: TLabel;
    dtpDataMovimentacao: TCMDateTimePicker;
    lblConvenioBancario: TLabel;
    lkpConvenioBancario: TwwDBLookupCombo;
    btnLocalizar: TBitBtn;
    lblData: TLabel;
    dtpDataLancamento: TCMDateTimePicker;
    lblValor: TLabel;
    lblDocumento: TLabel;
    dbEdtNumDocumento: TwwDBEdit;
    lblHistPadrao: TLabel;
    lkpHistPadrao: TwwDBLookupCombo;
    lblHistorico: TLabel;
    dbEdtHistorico: TwwDBEdit;
    pnlTitMovimFinanc: TPanel;
    lblUnidNegoc: TLabel;
    lkpAtividade: TwwDBLookupCombo;
    lblCentroRespon: TLabel;
    lkpCentroRespon: TwwDBLookupCombo;
    lbl1: TLabel;
    lkpTipoDocumento: TwwDBLookupCombo;
    lblTipoRD: TLabel;
    lkpTipoRecebDesemb: TwwDBLookupCombo;
    lbl2: TLabel;
    lkpCentroCusto: TwwDBLookupCombo;
    cdsUnidNeg: TCMClientDataSet;
    cds: TCMClientDataSet;
    ds: TDataSource;
    cdsCentroRespon: TCMClientDataSet;
    cdsTipoRecDes: TCMClientDataSet;
    cdsTipoDoc: TCMClientDataSet;
    cdsCentroCusto: TCMClientDataSet;
    cdsHistPadrao: TCMClientDataSet;
    lblCaixaBanco: TLabel;
    lkpPortadorConta: TwwDBLookupCombo;
    cdsPortadorConta: TCMClientDataSet;
    cdsPortadorForma: TCMClientDataSet;
    sql: TCMSqlParams;
    cdsTarifaBancaria: TCMClientDataSet;
    dsTarifaBancaria: TDataSource;
    lbl3: TLabel;
    lkpPrograma: TwwDBLookupCombo;
    cdsPrograma: TCMClientDataSet;
    dsPortadorForma: TDataSource;
    dsPortadorConta: TDataSource;
    cdsDet: TCMClientDataSet;
    cdsDetAux: TCMClientDataSet;
    dsDet: TDataSource;
    cdsContab: TCMClientDataSet;
    lblDataDisponib: TLabel;
    dtpDataDisponib: TCMDateTimePicker;
    grdTarifaBancaria: TwwDBGrid;
    mContab: TCMProcuraMaskContabil;
    dsContab: TDataSource;
    cdsContabAux: TCMClientDataSet;
    cdsMovimFinanc: TCMClientDataSet;
    edtValor: TRealEdit;
    chkArqRetorno: TCheckBox;
    cdsTarifaxMovimFinanc: TCMClientDataSet;
    chkAssocMovimFinanc: TCheckBox;
    MontaSelect: TMontaSelect;
    GroupBox2: TGroupBox;
    Label15: TLabel;
    sbPasta: TSpeedButton;
    edPasta: TEdit;
    pplRelatTarifa: TppBDEPipeline;
    bbtnImprime: TBitBtn;
    cdsTarifaBancariaSEL: TFloatField;
    cdsTarifaBancariaIDARQUIVOPAGTO: TFloatField;
    cdsTarifaBancariaNSA: TStringField;
    cdsTarifaBancariaRAZAOSOCIAL: TStringField;
    cdsTarifaBancariaNODOCUMENTO: TFloatField;
    cdsTarifaBancariaCODDOCUMENTO: TFloatField;
    cdsTarifaBancariaVALOR: TFloatField;
    cdsTarifaBancariaCODFORMA: TFloatField;
    cdsTarifaBancariaFORMARECPAG: TStringField;
    cdsTarifaBancariaVLRTARIFA: TFloatField;
    cdsTarifaBancariaTIPO_TARIFA: TFloatField;
    sdDialog: TSaveDialog;
    rptRelatTarifa: TppReport;
    ppParameterList1: TppParameterList;
    ppHeaderBand6: TppHeaderBand;
    ppLine15: TppLine;
    ppLabel24: TppLabel;
    ppLine16: TppLine;
    ppLabel25: TppLabel;
    ppLblTitulo2: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppImage1: TppImage;
    pplblEmpresa: TppLabel;
    bndDetContaCC: TppDetailBand;
    dbtxtCCustoCC: TppDBText;
    ppDBText3: TppDBText;
    ppDBText6: TppDBText;
    ppLblVlTar: TppLabel;
    ppFooterBand6: TppFooterBand;
    ppLine17: TppLine;
    ppLabel32: TppLabel;
    ppCalc12: TppSystemVariable;
    ppCalc10: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppLine1: TppLine;
    ppLabel11: TppLabel;
    ppLine2: TppLine;
    ppDBCalc1: TppDBCalc;
    ppLblVlTotalTar: TppLabel;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnLocalizarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure grdTarifaBancariaFieldChanged(Sender: TObject;
      Field: TField);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure lkpPortadorContaChange(Sender: TObject);
    procedure chkAssocMovimFinancClick(Sender: TObject);
    procedure lkpConvenioBancarioExit(Sender: TObject);  //Cássio Rovaroto - SIG nº 80588
    procedure lkpTipoRecebDesembChange(Sender: TObject);
    procedure dtpDataLancamentoExit(Sender: TObject);
    procedure bbtnImprimeClick(Sender: TObject);
    procedure ppLine1Print(Sender: TObject);
    procedure bndDetContaCCBeforePrint(Sender: TObject);
    procedure sbPastaClick(Sender: TObject); //Cássio Rovaroto - SIG nº 99500
  private
    { Private declarations }
    CtrlMovimFinanc: TCtrlMovimFinanc;
    CtrlListTerceiros: TCtrlListTercFinanc;
    CtrlHistPadrao: TCtrlHistPadrao;
    CtrlParamFinanc: TCtrlParamFinanc;
    CtrlFinanc : TCtrlFinanc;
    CtrlPlanPrevContabPatro: TCtrlPlanPrevContabPatro;
    CtrlIntBanco: TCtrlIntBanco;
    CtrlTarifaBancaria: TCtrlTarifaBancaria;
    sIdArquivoPagto: string;
    sCodForma: string;
    sHistLancFinancContab: string;
    sContaBanco : String;
    sCCustoBanco : String;
    rSubContaBanco: Double;
    sPathArquivoRet: string;
    iIndiceBanco: Integer;
    sListaDocumento: TStringList;
    iQtdDocEfetivados: Integer;
    sMsg: string;
    cdsRateioDocumArq: TCMClientDataSet;
    sNSAArqRet: string;
    fArquivoRet: TextFile;
    iQtdDoc: integer;
    rValorOriginal: Double;
    sCodPortForma: string; //Cássio Rovaroto - SIG nº98429
    dDataLancamento: TDate;//Cássio Rovaroto - SIG nº99578


    procedure HabilitaMovimFinanc;
    procedure InicializaForm;
    procedure GerenciaObjetos;
    procedure MontaRegistrosTarifa; //Cássio Rovaroto - SIG nº 80588

    function LancaMovimFinanc: Boolean;
    function LeituraArqRetorno(pArquivo: string; pIndiceBanco: Integer): Boolean;
    function MontaContab: Boolean;
    function MontaDadosTarifaBancaria(pPathArquivoRet: string; pIndiceBanco: Integer): Boolean;
    function MontaMovimFinanc: Boolean;
    function GetRateioDocumArquivo(pVlrRealizado: Double): Boolean;
    function MontaRateioFinanc: Boolean;
    function TotalizaValores: string;
    function VerificaCampos: Boolean;
    function VerificaMovimRealizado: Boolean;
    function RecuperaContaContabDesemb(pCodTipRecDes: string): string;
  public
    { Public declarations }
  end;

var
  frmConcTarifaBancaria: TfrmConcTarifaBancaria;

implementation
uses DBaseDados, uSistema, uCtrlParamIntegra, fAssocArqRet;
{$R *.DFM}

procedure TfrmConcTarifaBancaria.FormCreate(Sender: TObject);
begin
  inherited;
  InicializaForm;
  sListaDocumento := TStringList.Create;// Cássio Rovaroto - SIG nº 80588
  iQtdDoc:= 0;
  rValorOriginal:= 0;
  sCodPortForma := EmptyStr; //Cássio Rovaroto - SIG nº98429
  dDataLancamento := Now(); //Cássio Rovaroto - SIG nº 99578
end;

procedure TfrmConcTarifaBancaria.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  GerenciaObjetos;
  FreeAndNil(sListaDocumento);
  inherited;
end;

procedure TfrmConcTarifaBancaria.btnLocalizarClick(Sender: TObject);
var
  i, iTpOperacao: integer;
  sArquivoRet: TStrings;
begin
  inherited;
  if lkpConvenioBancario.Text = EmptyStr then
  begin
    Application.MessageBox('Informe o convênio bancário.', 'Informação', MB_ICONINFORMATION + MB_OK);
    Exit;
  end;

  if not(chkAssocMovimFinanc.Checked) and (dtpDataMovimentacao.Text = EmptyStr)  then
  begin
    Application.MessageBox('Informe a data da movimentação.', 'Informação', MB_ICONINFORMATION + MB_OK);
    Exit;
  end;

  //Cássio Rovaroto SIG nº 80588 - Início
  if chkAssocMovimFinanc.Checked then
  begin
    //Chama MontaSelect do Movimento Financeiro.
    MontaSelect.Executar;


    if MontaSelect.RetornouValor then
    begin
      if not MontaDadosTarifaBancaria(EmptyStr, StrToInt(MontaSelect.ValoresChave[0])) then
      begin
        Application.MessageBox('Foram encontrados erros na montagem das linhas de tarifa bancária.', 'Aviso', MB_ICONINFORMATION);
        Exit;
      end
      else
      begin
        MontaRegistrosTarifa;
        Exit;
      end;
    end
    else
    begin
      Application.MessageBox('Não foram encontrados documentos para o movimento selecionado.', 'Aviso', MB_ICONINFORMATION);
      Exit;
    end;
  end;

  if chkArqRetorno.Checked then
  begin
    if frmAssocArqRet = nil then
    begin
      try
        frmAssocArqRet := TfrmAssocArqRet.Create(Application);
        frmAssocArqRet.sNumEmpresaBanco := cdsPortadorForma.FieldByName('NUMEMPRESABANCO').AsString;
        frmAssocArqRet.sRecPag := cdsPortadorForma.FieldByName('RECPAG').AsString;
        frmAssocArqRet.ShowModal;
        iTpOperacao := frmAssocArqRet.iTipoOperacao;
        sPathArquivoRet := frmAssocArqRet.sPathArquivoRetorno;
        iIndiceBanco := frmAssocArqRet.iIndiceBanco;
      finally
        FreeAndNil(frmAssocArqRet);
      end;
    end;

    if iTpOperacao = 0 then
      Exit
    else
    begin
      //sListaDocumento := TStringList.Create;
      if not MontaDadosTarifaBancaria(sPathArquivoRet, iIndiceBanco) then
      begin
        Application.MessageBox('Foram encontrados erros na montagem das linhas de tarifa bancária.', 'Aviso', MB_ICONINFORMATION);
        Exit;
      end
      else
        MontaRegistrosTarifa;
    end;
  end
  else
  begin
    cdsTarifaBancaria.Data := CtrlTarifaBancaria.ListTarifasBancariasArq(cdsPortadorForma.FieldByName('CODPORTFORMA').AsInteger, dtpDataMovimentacao.Date);
    if not cdsTarifaBancaria.IsEmpty then
    begin
      pnlTarifaBanc.Enabled := True;
      lkpConvenioBancario.Enabled := False;
      dtpDataMovimentacao.Enabled := False;
      HabilitaMovimFinanc;
      dbEdtNumDocumento.SetFocus;
    end
    else
      MessageDlg('Não existem registros de tarifas bancárias emitidas para o convênio e período informados.', mtWarning, [mbOK], 0);
  end;
end;

procedure TfrmConcTarifaBancaria.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Deseja realmente cancelar o lançamento?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES then
  begin
    InicializaForm;
    lkpConvenioBancario.SetFocus;
  end;
end;

function TfrmConcTarifaBancaria.TotalizaValores: String;
var
  dVlrRealizado: Double;
  i: Integer;
begin
  dVlrRealizado := 0;
  i := 0;
  sIdArquivoPagto := EmptyStr;
  sCodForma := EmptyStr;
  cdsTarifaBancaria.First;
  cdsTarifaBancaria.DisableControls;
  while not cdsTarifaBancaria.Eof do
  begin
    if (cdsTarifaBancaria.FieldByName('SEL').AsInteger = 1) and
       (cdsTarifaBancaria.FieldByName('VLRTARIFA').AsFloat <> 0) then
    begin
      Inc(i);
      dVlrRealizado := dVlrRealizado + cdsTarifaBancaria.FieldByName('VLRTARIFA').AsFloat;

      if cdsTarifaBancaria.FieldByName('TIPO_TARIFA').AsInteger = 1 then
      begin
        if sIdArquivoPagto = EmptyStr then
          sIdArquivoPagto := cdsTarifaBancaria.FieldByName('IDARQUIVOPAGTO').AsString
        else
          sIdArquivoPagto := sIdArquivoPagto + ',' + cdsTarifaBancaria.FieldByName('IDARQUIVOPAGTO').AsString;

        if sCodForma = EmptyStr then
          sCodForma := cdsTarifaBancaria.FieldByName('CODFORMA').AsString
        else
          sCodForma := sCodForma + ',' + cdsTarifaBancaria.FieldByName('CODFORMA').AsString;
      end;
    end;
    cdsTarifaBancaria.Next;
  end;

  if (sIdArquivoPagto <> EmptyStr) then
    if i > 1 then
      sIdArquivoPagto := 'IN (' + sIdArquivoPagto + ')'
    else
      sIdArquivoPagto := ' = ' + sIdArquivoPagto;

  if (sCodForma <> EmptyStr) then
    if i > 1 then
      sCodForma := 'IN (' + sCodForma + ')'
    else
      sCodForma := ' = ' + sCodForma;

  cdsTarifaBancaria.First;
  cdsTarifaBancaria.EnableControls;
  
  Result := FloatToStrF(dVlrRealizado, ffNumber, 12, 2);
end;

procedure TfrmConcTarifaBancaria.HabilitaMovimFinanc;
begin
  pnlMovimFinanc.Enabled := True;
  bbtnConfirmar .Enabled := True;
  bbtnCancelar.Enabled := True;
  btnLocalizar.Enabled := False;
  dtpDataLancamento.Text := DateToStr(Now);
  dtpDataDisponib.Text := DateToStr(Now);
  cdsTipoRecDes.Data := CtrlListTerceiros.ListTipoRDxCResponFinanc(Sistema.IdEmpresa, '', 'S');

  //Cássio Rovaroto - SIG nº 119161 - Início
  //if cdsCentroRespon.Locate('NOME', 'GEFIN', []) then
  if cdsCentroRespon.Locate('NOME', 'COFIN', []) then
  //Cássio Rovaroto - SIG nº 119161 - Fim
    lkpCentroRespon.Text:= cdsCentroRespon.FieldByName('NOME').AsString;

  //Cássio Rovaroto - SIG nº98429 - Início
  //if cdsCentroCusto.Locate('NOME', 'GEFIN', []) then
  //  lkpCentroCusto.Text := cdsCentroCusto.FieldByName('NOME').asString;
  //Cássio Rovaroto - SIG nº98429 - Fim

  //if cdsHistPadrao.Locate('HISTPADFINAN', '5', []) then //CAP -            //Everson Cunha - SIG129996
  if cdsHistPadrao.Locate('HISTPADFINAN', '23', []) then  //TARIFA BANCARIA  //Everson Cunha - SIG129996
    lkpHistPadrao.Text := cdsHistPadrao.FieldByName('DESCRICAO').AsString;

  if cdsTipoDoc.Locate('CODTIPDOC', '51', []) then
    lkpTipoDocumento.Text := cdsTipoDoc.FieldByName('DESCRICAO').AsString;

  if cdsPortadorConta.Locate('CODPORTADOR', '3', []) then
  lkpPortadorConta.Text := cdsPortadorConta.FieldByName('DESCRICAO').AsString;

  //Ewerton Beltramini - SIG 115043 - 14/04/2021 - Incicio...
  if cdsPortadorConta.Locate('CODPORTADOR', '32', []) then
    lkpPortadorConta.Text := cdsPortadorConta.FieldByName('DESCRICAO').AsString;
  //Ewerton Beltramini - SIG 115043 - 14/04/2021 - Fim.

  if cdsTipoRecDes.Locate('CODTIPRECDES', '0020019', []) then
    lkpTipoRecebDesemb.Text := cdsTipoRecDes.FieldByName('DESCRICAO').AsString;

  if cdsUnidNeg.Locate('UNIDNEGOC', '194', []) then     // Andre Imakawa - SIG 111231
    lkpAtividade.Text := cdsUnidNeg.FieldByName('NOME').asString;

  if cdsPrograma.Locate('IDPROGRAMA', '4', []) then
    lkpPrograma.Text := cdsPrograma.FieldByName('DESCPROGRAMA').asString;

  //Cássio Rovaroto - SIG nº 99500 - Início
  //cdsContab.Insert;
  //Cássio Rovaroto - SIG nº 99438 - Início
  //Cássio Rovaroto - SIG nº 98429 - Início
  //cdsContab.FieldByName('PLACONTA').asString := '4291059901        ';
  //cdsContab.FieldByName('PLACONTA').asString := '52640203          ';
  //Cássio Rovaroto - SIG nº 98429 - Fim
  //Cássio Rovaroto - SIG nº 99438 - Fim
  //cdscontab.Post;
  //Cássio Rovaroto - SIG nº 99500 - Fim

  edtValor.Text := TotalizaValores;
  rValorOriginal := edtValor.Value;
end;

procedure TfrmConcTarifaBancaria.grdTarifaBancariaFieldChanged(
  Sender: TObject; Field: TField);
var
  RegAtual: TBookmark;
  iQtdDocSel: Integer;
begin
  inherited;
  //Cássio Rovaroto - SIG nº 98429 - Início
  iQtdDocSel := 0;
  RegAtual := cdsTarifaBancaria.GetBookmark;

  edtValor.Text := TotalizaValores;

  cdsTarifaBancaria.DisableControls;
  cdsTarifaBancaria.First;

  while not cdsTarifaBancaria.Eof do
  begin
    if cdsTarifaBancaria.FieldByName('SEL').AsInteger = 1 then
      Inc(iQtdDocSel);
    cdsTarifaBancaria.Next;
  end;

  cdsRateioDocumArq.Delete;
  cdsRateioDocumArq.Data := CtrlTarifaBancaria.ListRateioFinanc(StrToInt(MontaSelect.ValoresChave[0]), cdsTarifaBancaria.FieldByName('VLRTARIFA').asFloat, iQtdDocSel);
  cdsTarifaBancaria.EnableControls;

  if RegAtual <> nil then
    cdsTarifaBancaria.GotoBookmark(RegAtual); // Voltando ao registro atual
  //Cássio Rovaroto - SIG nº 98429 - Fim  
end;

procedure TfrmConcTarifaBancaria.InicializaForm;
begin
  CtrlMovimFinanc := TCtrlMovimFinanc.Create(Sistema.IdEmpresa, Sistema.IdModulo,
                                               Sistema.IdUsuario, Sistema.UsaPlanoPatro);
  CtrlMovimFinanc.Initialize(dtmBaseDados.dbBaseDados, True);

  CtrlListTerceiros := TCtrlListTercFinanc.Create;
  CtrlListTerceiros.Initialize(dtmBaseDados.dbBaseDados, True);

  CtrlHistPadrao := TCtrlHistPadrao.Create;
  CtrlHistPadrao.Initialize(dtmBaseDados.dbBaseDados, True);

  CtrlParamFinanc := TCtrlParamFinanc.Create;
  CtrlParamFinanc.Initialize(dtmBaseDados.dbBaseDados, True);

  CtrlFinanc := TCtrlFinanc.Create(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario, True);
  CtrlFinanc.InitiAlizeAs(ParamIntegra);

  CtrlPlanPrevContabPatro := TCtrlPlanPrevContabPatro.Create;
  CtrlPlanPrevContabPatro.InitializeAs(ParamIntegra);

  CtrlIntBanco := TCtrlIntBanco.Create;
  CtrlIntBanco.InitializeAs(ParamIntegra);

  CtrlTarifaBancaria := TCtrlTarifaBancaria.Create;
  CtrlTarifaBancaria.InitializeAs(ParamIntegra);

  CtrlMovimFinanc.CdsMovimFinanc := cdsMovimFinanc;
  CtrlMovimFinanc.CdsRateioFinanc := cdsDetAux;
  CtrlMovimFinanc.CdsContabil := cdsContabAux;

  cdsRateioDocumArq := TCMClientDataSet.Create(nil);

  cdsPortadorForma.Data := CtrlTarifaBancaria.ListConveniosTarifados(); //Cássio Rovaroto - SIG nº 98429
  cdsPortadorConta.Data := CtrlListTerceiros.ListPortadorConta(Sistema.IdEmpresa, 0);
  cdsHistPadrao.Data := CtrlHistPadrao.ListHsitoricoPadrao(0);
  cdsTipoDoc.Data := CtrlListTerceiros.ListTipoDoc('');
  cdsPrograma.Data := CtrlListTerceiros.ListPrograma;
  cdsCentroCusto.Data := CtrlListTerceiros.ListCentroCustoxConta(Sistema.IdEmpresa, 0, '', ParamIntegra.PlanoCentroCusto);
  cdsTarifaBancaria.Data := CtrlTarifaBancaria.ListTarifaArquivoRetNova(-1);
  cdsUnidNeg.Data := CtrlListTerceiros.ListUnidNegocio(Sistema.IdEmpresa, 0, 'A', '');
  cdsCentroRespon.Data := CtrlListTerceiros.ListCentroResponxUsuario(Sistema.IdEmpresa, Sistema.IdUsuario, ParamIntegra.PlanoCentroRespon);
  cds.Data := CtrlTarifaBancaria.ListMovimFinancTarifa;
  cdsMovimFinanc.Data := CtrlTarifaBancaria.ListMovimFinancTarifa;
  cdsDet.Data := CtrlTarifaBancaria.ListRateioFinancTarifa;
  cdsContab.Data := CtrlMovimFinanc.ListContabil(0);
  cdsContabAux.Data := CtrlMovimFinanc.ListContabil(0);
  cdsTarifaxMovimFinanc.Data := CtrlTarifaBancaria.ListTarifaxMovimFinanc(-1);
  CtrlTarifaBancaria.CdsTarifaxMovimFinanc := cdsTarifaxMovimFinanc;

    //O CDS aux será utilizado para tratar as informações de tela para depois ser inserido no CDS de detalhe.
  cdsDetAux.Data := CtrlTarifaBancaria.ListRateioFinancTarifa;

  pnlMovimFinanc.Enabled := False;
  bbtnCancelar.Enabled := False;
  bbtnConfirmar.Enabled := False;
  pnlTarifaBanc.Enabled := False;
  btnLocalizar.Enabled := True;
  dtpDataMovimentacao.Enabled := True;
  //dtpDataMovimentacao.Text := EmptyStr; //Cássio Rovaroto - SIG nº98429
  dtpDataLancamento.Enabled := True;
  //dtpDataLancamento.Text := EmptyStr; //Cássio Rovaroto - SIG nº98429
  dtpDataDisponib.Enabled := True;
  //dtpDataDisponib.Text := EmptyStr; //Cássio Rovaroto - SIG nº98429
  lkpConvenioBancario.Enabled := True;
  mContab.Plano := ParamIntegra.Plano;
  mContab.Mascara := ParamIntegra.MascaraPlano;
  chkArqRetorno.Enabled := True;
  chkArqRetorno.Checked:= False;
  edtValor.Value := 0;
  iQtdDocEfetivados := 0;
  chkAssocMovimFinanc.Checked := True;
  grdTarifaBancaria.RedrawGrid;

  lkpConvenioBancario.LookupValue :=  sCodPortForma;  //Cássio Rovaroto - SIG nº98429
  dtpDataLancamento.Date := dDataLancamento;

end;

function TfrmConcTarifaBancaria.LancaMovimFinanc: Boolean;
var
   bResposta: Boolean;
   iCodLancFinanc, iId: Integer;
begin
  Result := True;

  if VerificaCampos then
  begin
    if not MontaRateioFinanc then
    begin
      Result := False;
      Application.MessageBox('Há problemas na definição do rateio do lançamento.', 'Erro', MB_ICONERROR +  MB_OK);
      Exit;
    end;

    if not MontaContab then
    begin
      Result := False;
      Application.MessageBox('Há problemas na definição dos valores de contabilização do lançamento.', 'Erro', MB_ICONERROR +  MB_OK);
      Exit;
    end;

    if not MontaMovimFinanc then
    begin
      Result := False;
      Application.MessageBox('Há problemas na definição do lançamento.', 'Erro', MB_ICONERROR +  MB_OK);
      Exit;
    end;

    cdsContabAux.First;
    cdsMovimFinanc.Edit;
    
    bResposta := CtrlMovimFinanc.GravaFinanceiro(False, opInclusao, ParamIntegra.Plano, ParamIntegra.IntegraContab, False);
                      
    if (bResposta)then
    begin
      if not(chkAssocMovimFinanc.Checked) then
      begin
        iCodLancFinanc:= CtrlMovimFinanc.codLancFinanc;
        cdsTarifaBancaria.First;

        while not cdsTarifaBancaria.Eof do
        begin
          if cdsTarifaBancaria.FieldByName('SEL').AsString = '1' then
          begin
            cdsTarifaxMovimFinanc.Insert;
            cdsTarifaxMovimFinanc.FieldByName('NSA').AsString := cdsTarifaBancaria.FieldByName('NSA').AsString;
            cdsTarifaxMovimFinanc.FieldByName('CODLANCFINANC').AsInteger := iCodLancFinanc;
            cdsTarifaxMovimFinanc.Post;
          end;
          cdsTarifaBancaria.Next;
        end;
      end;

      if not CtrlTarifaBancaria.AplicaTarifaxMovimFinanc then
      begin
        Application.MessageBox(PChar(CtrlTarifaBancaria.MessageInfo), 'Erro', MB_ICONERROR + MB_OK);
        Abort;
        Exit;
      end;
    end
    else
    begin
      Application.MessageBox(PChar(CtrlMovimFinanc.MessageInfo), 'Erro', MB_ICONERROR + MB_OK);
      Abort;
      Exit;
    end;
  end
  else
    Result := False;
end;

function TfrmConcTarifaBancaria.MontaContab: Boolean;
begin
  Result := True;
  try
    while not cdsDetAux.Eof do
    begin
      //Débito
      cdsContabAux.Insert;
      cdsContabAux.FieldByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
      cdsContabAux.FieldByName('LACDEBCRE').AsString := 'D';
      cdsContabAux.FieldByName('LACTIPO').AsString := '0';
      cdsContabAux.FieldByName('PLANO').AsFloat := ParamIntegra.Plano;
      cdsContabAux.FieldByName('LACNUMDOC').AsString := dbEdtNumDocumento.Text;
      cdsContabAux.FieldByName('UNIDNEGOC').AsInteger := cdsDetAux.FieldByName('UNIDNEGOC').AsInteger;
      cdsContabAux.FieldByName('LACVALOR').AsFloat := cdsDetAux.FieldByName('VALOR').AsFloat;
      cdsContabAux.FieldByName('LACHIST1').AsString := Copy(sHistLancFinancContab, 1, 50);
      cdsContabAux.FieldByName('LACHIST2').AsString := Copy(sHistLancFinancContab, 51, 50);
      cdsContabAux.FieldByName('LACHIST3').AsString := Copy(sHistLancFinancContab, 102, 50);
      cdsContabAux.FieldByName('IDPLANOPREV').AsInteger := cdsDetAux.FieldByName('IDPLANOPREV').AsInteger;
      cdsContabAux.FieldByName('IDPATRO').AsInteger := cdsDetAux.FieldByName('IDPATRO').AsInteger;
      cdsContabAux.FieldByName('PLACONTA').AsString := mContab.Conta.Numero;
      cdsContabAux.FieldByName('CODCENTROCUSTO').AsString := cdsCentroCusto.FieldByName('CODCENTROCUSTO').AsString;
      cdsContabAux.Post;

      //Crédito
      cdsContabAux.Insert;
      cdsContabAux.FieldByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
      cdsContabAux.FieldByName('LACDEBCRE').AsString := 'C';
      cdsContabAux.FieldByName('LACTIPO').AsString := '0';
      cdsContabAux.FieldByName('PLANO').AsFloat := ParamIntegra.Plano;
      cdsContabAux.FieldByName('LACNUMDOC').AsString := dbEdtNumDocumento.Text;
      cdsContabAux.FieldByName('UNIDNEGOC').AsInteger := cdsDetAux.FieldByName('UNIDNEGOC').AsInteger;
      cdsContabAux.FieldByName('LACVALOR').AsFloat := cdsDetAux.FieldByName('VALOR').AsFloat;
      cdsContabAux.FieldByName('LACHIST1').AsString := Copy(sHistLancFinancContab, 1, 50);
      cdsContabAux.FieldByName('LACHIST2').AsString := Copy(sHistLancFinancContab, 51, 50);
      cdsContabAux.FieldByName('LACHIST3').AsString := Copy(sHistLancFinancContab, 102, 50);
      cdsContabAux.FieldByName('IDPLANOPREV').AsInteger := cdsDetAux.FieldByName('IDPLANOPREV').AsInteger;
      cdsContabAux.FieldByName('IDPATRO').AsInteger := cdsDetAux.FieldByName('IDPATRO').AsInteger;
      cdsContabAux.FieldByName('PLACONTA').AsString := sContaBanco;
      cdsContabAux.FieldByName('CODCENTROCUSTO').AsString := sCCustoBanco;
      cdsContabAux.Post;

      cdsDetAux.Next;
    end;
  except
    Result := False;
  end;
end;

function TfrmConcTarifaBancaria.MontaRateioFinanc: Boolean;
var
  cdsAux: TCMClientDataSet;
  dVlrRateioFinancAcum : Double;
begin
  Result := True;
  cdsAux := TCMClientDataSet.Create(nil);
  dVlrRateioFinancAcum := 0;

  try
    try
      if (chkArqRetorno.Checked) or (chkAssocMovimFinanc.Checked) then
      begin
        cdsRateioDocumArq.First;
        cdsAux := cdsRateioDocumArq;
        //cdsAux.Filtered := False;
        //cdsAux.Filter := ' VALOR > 0';
        //cdsAux.Filtered := True;
      end
      else
        cdsAux.Data := CtrlTarifaBancaria.ListaRateioTarifa(sIdArquivoPagto, sCodForma);
      while not cdsAux.Eof do
      begin
        cdsDetAux.Insert;
        cdsDetAux.FieldByName('UNIDNEGOC').AsInteger := cdsUnidNeg.FieldByName('UNIDNEGOC').AsInteger;
        cdsDetAux.FieldByName('CODCENTRORESPON').AsString := cdsCentroRespon.FieldByName('CODCENTRORESPON').AsString;
        cdsDetAux.FieldByName('CODTIPRECDES').AsString := cdsTipoRecDes.FieldByName('CODTIPRECDES').AsString;
        cdsDetAux.FieldByName('CODTIPDOC').AsInteger := cdsTipoDoc.FieldByName('CODTIPDOC').AsInteger;
        cdsDetAux.FieldByName('CODCENTROCUSTO').AsString := cdsCentroCusto.FieldByName('CODCENTROCUSTO').AsString;
        cdsDetAux.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
        cdsDetAux.FieldByName('IDPROGRAMA').AsInteger := cdsPrograma.FieldByName('IDPROGRAMA').AsInteger;
        cdsDetAux.FieldByName('IDPLANOPREV').AsInteger := cdsAux.FieldByName('IDPLANOPREV').AsInteger;
        cdsDetAux.FieldByName('IDPATRO').AsInteger := cdsAux.FieldByName('IDPATRO').AsInteger;
        cdsDetAux.FieldByName('RECPAG').AsString := 'P';

        if cdsAux.RecNo = cdsAux.RecordCount then
          cdsDetAux.FieldByName('VALOR').AsFloat := edtValor.Value - dVlrRateioFinancAcum
        else
        begin
          if cdsAux.FieldByName('VALOR').AsFloat = 0 then
            cdsDetAux.FieldByName('VALOR').AsFloat := 0.01
          else
          cdsDetAux.FieldByName('VALOR').AsFloat := cdsAux.FieldByName('VALOR').AsFloat;
          
          dVlrRateioFinancAcum := dVlrRateioFinancAcum + cdsAux.FieldByName('VALOR').AsFloat;
        end;
        cdsDetAux.Post;
        cdsAux.Next;
      end;
      cdsDetAux.First;
    except
      Result := False;
    end;
  finally
    FreeAndNil(cdsAux);
  end;
end;

procedure TfrmConcTarifaBancaria.bbtnConfirmarClick(Sender: TObject);
var dVlrTarifa: Double;
begin
  inherited;
  sHistLancFinancContab := dbEdtHistorico.Text + ' - ' + lkpPortadorConta.Text;

  if rValorOriginal <> edtValor.Value then
  begin
    //Cássio Rovaroto - SIG nº 98429 - Início
    if iQtdDoc > 1 then
      dVlrTarifa := cdsTarifaBancaria.FieldByName('VLRTARIFA').asFloat
    else
      dVlrTarifa := edtValor.Value;
    //Cássio Rovaroto - SIG nº 98429 - Fim

    cdsRateioDocumArq.Delete;
    cdsRateioDocumArq.Data := CtrlTarifaBancaria.ListRateioFinanc(StrToInt(MontaSelect.ValoresChave[0]), dVlrTarifa, iQtdDoc);
  end;

  if LancaMovimFinanc then
  begin
    if edPasta.Text <> EmptyStr then //Leandro wo12517
      bbtnImprimeClick(Sender);//WO10886 - Helen V Bianchi //Lendro WO12257
    Application.MessageBox('Lançamento realizado com sucesso.', 'Informação', MB_ICONINFORMATION + MB_OK);
    GerenciaObjetos;
    InicializaForm;
    lkpConvenioBancario.SetFocus;
  end;
end;

function TfrmConcTarifaBancaria.VerificaCampos: Boolean;
begin
  Result := True;
  if lkpPortadorConta.Text = EmptyStr then
  begin
    Application.MessageBox('Indique a Conta Bancária para o lançamento.', 'Informação', MB_ICONINFORMATION + MB_OK);
    lkpPortadorConta.SetFocus;
    Result := False;
    Exit;
  end;

  if dtpDataLancamento.Text = EmptyStr then
  begin
    Application.MessageBox('Indique a data do lançamento.', 'Informação', MB_ICONINFORMATION + MB_OK);
    dtpDataLancamento.SetFocus;
    Result := False;
    Exit;
  end;

  if dtpDataDisponib.Text = EmptyStr then
  begin
    Application.MessageBox('Indique a data de disponibilidade.', 'Informação', MB_ICONINFORMATION + MB_OK);
    dtpDataDisponib.SetFocus;
    Result := False;
    Exit;
  end;

  if edtValor.Value = 0 then
  begin
    Application.MessageBox('Selecione, no mínimo, um arquivo para o lançamento.', 'Informação', MB_ICONINFORMATION + MB_OK);
    Result := False;
    Exit;
  end;

  if dbEdtNumDocumento.Text = EmptyStr then
  begin
    Application.MessageBox('Indique o número do documento.', 'Informação', MB_ICONINFORMATION + MB_OK);
    dbEdtNumDocumento.SetFocus;
    Result := False;
    Exit;
  end;

  if lkpTipoDocumento.Text = EmptyStr then
  begin
    Application.MessageBox('Indique o tipo de documento.', 'Informação', MB_ICONINFORMATION + MB_OK);
    lkpTipoDocumento.SetFocus;
    Result := False;
    Exit;
  end;

  if lkpTipoRecebDesemb.Text =  EmptyStr then
  begin
    Application.MessageBox('Indique o tipo de desembolso.', 'Informação', MB_ICONINFORMATION + MB_OK);
    lkpTipoRecebDesemb.SetFocus;
    Result := False;
    Exit;
  end;

  if lkpHistPadrao.Text = EmptyStr then
  begin
    Application.MessageBox('Indique um histórico padrão.', 'Informação', MB_ICONINFORMATION + MB_OK);
    lkpHistPadrao.SetFocus;
    Result := False;
    Exit;
  end;

  if dbEdtHistorico.Text = EmptyStr then
  begin
    Application.MessageBox('Informe o histórico do lançamento.', 'Informação', MB_ICONINFORMATION + MB_OK);
    dbEdtHistorico.SetFocus;
    Result := False;
    Exit;
  end;

  if lkpCentroRespon.Text = EmptyStr then
  begin
    Application.MessageBox('Indique um centro de responsabilidade.', 'Informação', MB_ICONINFORMATION + MB_OK);
    lkpCentroRespon.SetFocus;
    Result := False;
    Exit;
  end;

  if lkpCentroCusto.Text = EmptyStr then
  begin
    Application.MessageBox('Indique um centro de custo.', 'Informação', MB_ICONINFORMATION + MB_OK);
    lkpCentroCusto.SetFocus;
    Result := False;
    Exit;
  end;

  //Cássio Rovaroto - SIG nº 80588 - Início
  //if VerificaMovimRealizado then
  if (not chkAssocMovimFinanc.Checked) and (VerificaMovimRealizado) then
  //Cássio Rovaroto - SIG nº 80588 - Fim
    if Application.MessageBox(pChar(sMsg), 'Informação', MB_ICONINFORMATION + MB_YESNO) = ID_NO then
    begin
      Result := False;
      Exit;
    end;
    //WO10886 - Helen V Bianchi - Inicio
   if edPasta.Text = EmptyStr then
   begin
    // Leandro WO12517 - Inicio
    //Application.MessageBox('Indique a pasta para salvar o Relatorio.', 'Informação', MB_ICONINFORMATION + MB_OK);
    if (MessageDlg('Pasta para salvar o Relatorio não informada.' + #10#13 +'Deseja Proseguir?' , mtWarning, [mbYes, mbNo], 0) = mrNo) then
    begin
      edPasta.SetFocus;
      Result := False;
      Exit;
    end;
    // Leandro WO12517 - fim
   end;
   //WO10886 - Helen V Bianchi - Inicio
end;

function TfrmConcTarifaBancaria.MontaMovimFinanc: Boolean;
begin
  Result := True;
  try
    cdsMovimFinanc.Insert;
    cdsMovimFinanc.FieldByName('IDMODULO').AsInteger := Sistema.IdModulo;
    cdsMovimFinanc.FieldByName('HISTPADFINAN').AsInteger := cdsHistPadrao.FieldByName('HISTPADFINAN').AsInteger;
    cdsMovimFinanc.FieldByName('IDUSUARIOINCLUSAO').AsInteger := Sistema.IdUsuario;
    cdsMovimFinanc.FieldByName('CODPORTADOR').AsInteger := cdsPortadorConta.FieldByName('CODPORTADOR').AsInteger;
    cdsMovimFinanc.FieldByName('VALORLANCFINAN').AsFloat := edtValor.Value;
    cdsMovimFinanc.FieldByName('VALOROUTRAMOEDA').AsFloat := 0;
    cdsMovimFinanc.FieldByName('NUMCHQBORDERO').AsString := dbEdtNumDocumento.Text;
    cdsMovimFinanc.FieldByName('DATALANCFINAN').AsDateTime := dtpDataLancamento.DateTime;
    cdsMovimFinanc.FieldByName('ENTRADASAIDA').asString := 'S';
    cdsMovimFinanc.FieldByName('HISTORICO').AsString := dbEdtHistorico.Text;
    cdsMovimFinanc.FieldByName('STATUSCONCILIA').AsString := 'N'; //Não conciliado
    cdsMovimFinanc.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
    cdsMovimFinanc.FieldByName('DATADISPFINANC').AsDateTime := dtpDataDisponib.DateTime;
    cdsMovimFinanc.FieldByName('CONCILIADO').AsString := 'N';
    cdsMovimFinanc.Post;
  except
    Result := False;
  end;
end;

procedure TfrmConcTarifaBancaria.bbtnSairClick(Sender: TObject);
begin
  if not cdsTarifaBancaria.IsEmpty then
  begin
    if Application.MessageBox('Deseja realmente encerrar a funcionalidade?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES then
      GerenciaObjetos
    else
      Exit;
  end
  else
    GerenciaObjetos;

  inherited;
end;

procedure TfrmConcTarifaBancaria.lkpPortadorContaChange(Sender: TObject);
begin
  inherited;
  if (Trim(lkpPortadorConta.Text) <> '') Then
  begin
    if (ParamIntegra.IntegraContab) And (Sistema.IdModulo = 9) then
    begin
      if (Trim(cdsPortadorConta.FieldByName('PLACONTA').AsString) = '') Then
      begin
        Application.MessageBox('Como a contabilidade está integrada, é obrigatório ' +
                              'preencher a conta contabil desta Conta Bancária/Caixa',
                              'Erro', MB_ICONERROR + MB_OK);
        Exit;
      end;

      sContaBanco := cdsPortadorConta.FieldByName('PLACONTA').AsString;
      sCCustoBanco := cdsPortadorConta.FieldByName('CODCENTROCUSTO').AsString;
      rSubContaBanco := cdsPortadorConta.FieldByName('CODSUBCONTA').AsFloat;
    end;
  end;
end;

function TfrmConcTarifaBancaria.MontaDadosTarifaBancaria(pPathArquivoRet: string; pIndiceBanco: Integer): Boolean;
begin
  Result := True;
  if not LeituraArqRetorno(pPathArquivoRet, pIndiceBanco) then
  begin
    Application.MessageBox(PChar(sMsg), 'Atenção', MB_ICONERROR + MB_OK);
    Result := False;
    Exit;
  end;
end;

function TfrmConcTarifaBancaria.LeituraArqRetorno(pArquivo: string;
  pIndiceBanco: Integer): Boolean;
var
  i: Integer;
  sLinha, s, x: string;
  cdsAux: TCMClientDataSet;
begin
  Result := True;
  i:= 0;
  //Cássio Rovaroto - SIG nº 80588 - Início
  cdsAux := TCMClientDataSet.Create(nil);
  sListaDocumento.Clear;

  try
    if pArquivo = EmptyStr then
    begin
      cdsAux.Data := CtrlTarifaBancaria.ListTarifaArquivoRetNova(pIndiceBanco);

      if not cdsAux.IsEmpty then
      begin
        sNSAArqRet := EmptyStr;
        iQtdDocEfetivados := cdsAux.RecordCount;
        Result:= True;

        while not cdsAux.Eof do
        begin
         sListaDocumento.Add(cdsAux.FieldByName('CODDOCUMENTO').asString);
         cdsAux.Next;
        end;
      end
      else
      begin
         Result := False;
         sMsg := 'Não há documentos financeiros identificados.';
         Exit;
      end;
    end
    else
    begin
    //Cássio Rovaroto - SIG nº 80588 - Fim
      try
        AssignFile(fArquivoRet, pArquivo);
        Reset(fArquivoRet);
        Readln(fArquivoRet, sLinha);

        if Copy(sLinha, 8, 1) <> '0' then
        begin
          Result := False;
          sMsg := 'Arquivo não corresponde a um arquivo de retorno válido.';
          Exit;
        end;
        Reset(fArquivoRet);

        while not Eof(fArquivoRet) do
        begin
          Readln(fArquivoRet, sLinha);
          case pIndiceBanco of
          8,60:
            begin
              if Copy(sLinha, 8, 1) = '0' then
                sNSAArqRet := Copy(sLinha, 158, 6);

              if Copy(sLinha, 14, 1) = 'T' then  //T = Movimentação de carteira
              begin
                if (Copy(sLinha, 16, 2) = '06') or (Copy(sLinha, 16, 2) = '09') then
                begin
                  Inc(iQtdDocEfetivados);
                  sListaDocumento.Add(Trim(Copy(sLinha, 106, 25)));
                end
                else
                //02 = Entrada Confirmada
                //Copy(sLinha, 214, 10) = 28.3T - Motivo a Ocorrência
                if (Copy(sLinha, 16, 2) = '02') and (Trim(Copy(sLinha, 214, 10)) = EmptyStr) then
                begin
                  Inc(iQtdDocEfetivados);
                  sListaDocumento.Add(Trim(Copy(sLinha, 106, 25)));
                end;
              end;
            end;
          end;
        end;
        CloseFile(fArquivoRet);
      except
        Result := False;
        sMsg := 'Houve um problema na leitura do arquivo de retorno.';
      end;
    end;

  finally
    FreeAndNil(cdsAux);
  end;
end;

function TfrmConcTarifaBancaria.GetRateioDocumArquivo(pVlrRealizado: Double): Boolean;
var
  sSQL, sWhere: string;
  i: Integer;
begin
  Result := True;
  i:= 0;
  sWhere := EmptyStr;

  while i <= sListaDocumento.Count - 1 do
  begin
    if i = 0 then
      sWhere := '(' + sListaDocumento[i]
    else
      sWhere := sWhere + ', ' + sListaDocumento[i];
    Inc(i);
  end;
  sWhere := sWhere + ')';
   iQtdDoc := i;
  //cdsRateioDocumArq.Data := CtrlTarifaBancaria.ListRateioDocumArquivo(sWhere, pVlrRealizado);
  cdsRateioDocumArq.Data := CtrlTarifaBancaria.ListRateioFinanc(StrToInt(MontaSelect.ValoresChave[0]), pVlrRealizado, iQtdDoc);

  if cdsRateioDocumArq.IsEmpty then
  begin
    Result := False;
    sMsg := 'Não há rateio para os documentos do arquivo de retorno.';
  end;
end;

function TfrmConcTarifaBancaria.VerificaMovimRealizado: Boolean;
begin
  Result := False;
  cdsTarifaBancaria.First;

  while not cdsTarifaBancaria.Eof do
  begin
    if cdsTarifaBancaria.FieldByName('SEL').AsString = '1' then
    begin
      if CtrlTarifaBancaria.ListMovimFinancParaTarifa(cdsTarifaBancaria.FieldByName('NSA').AsString) then
      begin
        Result := True;
        sMsg := 'Já existe um lançamento realizado para o arquivo com NSA ' + cdsTarifaBancaria.FieldByName('NSA').AsString +'. ' + #13#10+
                'Deseja continuar o lançamento?';
        Break;
      end;
    end;
    cdsTarifaBancaria.Next;
  end;
  cdsTarifaBancaria.First;
end;

procedure TfrmConcTarifaBancaria.GerenciaObjetos;
begin
  if Assigned(CtrlMovimFinanc) then
    FreeAndNil(CtrlMovimFinanc);

  if Assigned(CtrlMovimFinanc) then
    FreeAndNil(CtrlListTerceiros);

  if Assigned(CtrlHistPadrao) then
    FreeAndNil(CtrlHistPadrao);

  if Assigned(CtrlParamFinanc) then
    FreeAndNil(CtrlParamFinanc);

  if Assigned(CtrlFinanc) then
    FreeAndNil(CtrlFinanc);

  if Assigned(CtrlPlanPrevContabPatro) then
    FreeAndNil(CtrlPlanPrevContabPatro);

  if Assigned(CtrlIntBanco) then
    FreeAndNil(CtrlIntBanco);

  if Assigned(CtrlTarifaBancaria) then
    FreeAndNil(CtrlTarifaBancaria);

   cdsMovimFinanc.EmptyDataSet;
   cdsDetAux.EmptyDataSet;
   cdsContabAux.EmptyDataSet;

end;

procedure TfrmConcTarifaBancaria.MontaRegistrosTarifa;
begin
  cdsTarifaBancaria.Data := CtrlTarifaBancaria.ListTarifaArquivoRetNova(StrToInt(MontaSelect.ValoresChave[0]));
  if not cdsTarifaBancaria.IsEmpty then
  begin
    pnlTarifaBanc.Enabled := True;
    lkpConvenioBancario.Enabled := False;
    dtpDataMovimentacao.Enabled := False;
    chkArqRetorno.Enabled := False;
    HabilitaMovimFinanc;
    dbEdtNumDocumento.SetFocus;

    if not GetRateioDocumArquivo(cdsTarifaBancaria.FieldByName('VLRTARIFA').asFloat) then
    begin
      Application.MessageBox(PChar(sMsg), 'Atenção', MB_ICONERROR + MB_OK);
      Exit;
    end;
  end
  else
    MessageDlg('Não existem registros de tarifas bancárias emitidas para o convênio e período informados.', mtWarning, [mbOK], 0);
end;

procedure TfrmConcTarifaBancaria.chkAssocMovimFinancClick(Sender: TObject);
begin
  inherited;
  if chkAssocMovimFinanc.Checked then
  begin
    lblDataMovimentacao.Visible := False;
    dtpDataMovimentacao.Visible := False;
  end
  else
  begin
    lblDataMovimentacao.Visible := True;
    dtpDataMovimentacao.Visible := True;
  end;

end;

procedure TfrmConcTarifaBancaria.lkpConvenioBancarioExit(Sender: TObject);
begin
  inherited;
  sCodPortForma := lkpConvenioBancario.LookupValue;
end;

function TfrmConcTarifaBancaria.RecuperaContaContabDesemb(
  pCodTipRecDes: string): string;
begin

end;

procedure TfrmConcTarifaBancaria.lkpTipoRecebDesembChange(Sender: TObject);
var
  sPlaContaDesemb: string;
begin
  inherited;
  sPlaContaDesemb := cdsTipoRecDes.FieldByName('PLACONTA').asString;

  if (sPlaContaDesemb = EmptyStr) then
  begin
    sPlaContaDesemb := CtrlListTerceiros.ListContaContabDesemb(cdsTipoRecDes.FieldByName('CODTIPRECDES').asString, 'P')
  end;

  if not cdsContab.Locate('PLACONTA', sPlaContaDesemb, [])then
  begin
    cdsContab.Insert;
    cdsContab.FieldByName('PLACONTA').asString := cdsTipoRecDes.FieldByName('PLACONTA').asString;
    cdscontab.Post;
  end;
end;

procedure TfrmConcTarifaBancaria.dtpDataLancamentoExit(Sender: TObject);
begin
  inherited;
  dDataLancamento := dtpDataLancamento.Date;
end;

procedure TfrmConcTarifaBancaria.bbtnImprimeClick(Sender: TObject);
var  vBuffer : String;
begin
  inherited;
   //WO10886 - Nova Funcionalidade
   // Leandro WO12517 - Inicio
   //if edPasta.Text = EmptyStr then
   //begin
   // Application.MessageBox('Indique a pasta para salvar o Relatorio.', 'Informação', MB_ICONINFORMATION + MB_OK);
   // edPasta.SetFocus;
   // Exit;
   //end;
   // Leandro WO12517 - Fim

   TRY
     Screen.Cursor := crHourGlass;
     //PDF
     Application.ProcessMessages;
     //Associa Nome da Empresa
     pplblEmpresa.Caption:=Sistema.NomeEmpresa;
     ppLabel1.caption            := lkpConvenioBancario.Text ;
     ppLblTitulo2 .caption       := 'Data do Lançamento: ' + dtpDataLancamento.Text  ;
     cdsTarifaBancaria.First;
     rptRelatTarifa.DeviceType       := 'PDFFile';
     rptRelatTarifa.AllowPrintToFile := True;
     rptRelatTarifa.ShowPrintDialog  := False;
     rptRelatTarifa.TextFileName     := EdPasta.Text;
     rptRelatTarifa.Print;

     vBuffer := EdPasta.Text;

  FINALLY
      Screen.Cursor := crDefault;
  END;

  ShellExecute(Application.Handle, nil, PChar(vBuffer), nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmConcTarifaBancaria.ppLine1Print(Sender: TObject);
begin
  inherited;
  ppLblVlTotalTar.Caption :=  edtValor.Text ;  //WO10886 - Helen V Bianchi
end;

procedure TfrmConcTarifaBancaria.bndDetContaCCBeforePrint(Sender: TObject);
begin
  inherited;
  //WO10886 - Helen V Bianchi - Inicio
  if cdsTarifaBancariaSEL.Value = 0 then
     ppLblVlTar.Caption := '0'
  else
     ppLblVlTar.Caption := cdsTarifaBancariaVLRTARIFA.AsString;
  //WO10886 - Helen V Bianchi - Fim
end;

procedure TfrmConcTarifaBancaria.sbPastaClick(Sender: TObject);
begin
  inherited;
  //WO10886 - Helen V Bianchi - Inicio
  sdDialog.DefaultExt := '*.pdf';
  sdDialog.Filter := 'Arquivo PDF (*.pdf)|*.pdf|Todos os arquivos (*.*)|*.*';

  if ( sdDialog.Execute ) then
     edPasta.Text := sdDialog.FileName;
  //WO10886 - Helen V Bianchi - Fim
end;

end.
