unit FOkAtualizarLancamentosContabeis;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, uCtrlLancamento, uCtrlPadroes, uSistema,
  Db, DBTables, Wwquery, uCtrlParamIntegra, wwdblook;

type
  TfrmOkAtualizarLancamentosContabeis = class(TfrmOkCancelar)
    Label2: TLabel;
    DtTmPckrReferencia: TDateTimePicker;
    QryIntegracaoContabil: TwwQuery;
    QrySaldoContabil: TwwQuery;
    ChckBxEstorno: TCheckBox;
    ChckBxSimulado: TCheckBox;
    QryInsLog: TwwQuery;
    QryInsOcorrencia: TwwQuery;
    QryHistContabilizacao: TwwQuery;
    Toolbar971: TToolbar97;
    ToolbarSep972: TToolbarSep97;
    BtBtnDesfazer: TBitBtn;
    QryUnidadeNegocio: TwwQuery;
    QryCentroCustoC: TwwQuery;
    Label3: TLabel;
    Label1: TLabel;
    DBLkpCmbBxUnidadeNegocio: TwwDBLookupCombo;
    DBLkpCmbBxCentroCustoC: TwwDBLookupCombo;
    Label4: TLabel;
    DBLkpCmbBxCentroCustoD: TwwDBLookupCombo;
    QryCentroCustoD: TwwQuery;
    QryUnidadeNegocioUNECODIGO: TStringField;
    QryUnidadeNegocioNOME: TStringField;
    QryUnidadeNegocioUNETIPO: TStringField;
    QryUnidadeNegocioUNIDNEGOC: TFloatField;
    QryCentroCustoCCODEXTERNO: TStringField;
    QryCentroCustoCNOME: TStringField;
    QryCentroCustoCCODCENTROCUSTO: TStringField;
    QryCentroCustoCSTATUSGRUPOCDC: TStringField;
    QryCentroCustoDCODEXTERNO: TStringField;
    QryCentroCustoDNOME: TStringField;
    QryCentroCustoDCODCENTROCUSTO: TStringField;
    QryCentroCustoDSTATUSGRUPOCDC: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure DtTmPckrReferenciaChange(Sender: TObject);
    procedure BtBtnDesfazerClick(Sender: TObject);
  private
    { Private declarations }
    CtrlLancamento: TCtrlLancamento;
    bOCORRENCIA: Boolean;
    dDT_EFETIVACAO: TDateTime;
    fPlnCodigo, fSALDO_CONTA, fVALOR_LANCAMENTO, fVL_VARIAVEL: Extended;
    iCD_PLANO, iCD_PESSOA_PATROC, iCD_GRUPO_CONTABIL: Integer;
    sIR_ULTIMA_CONTABILIZACAO, sVARIAVEL, sCONTA_CREDITO, sCONTA_DEBITO,
      sCD_CONTA_CONTABIL, sNO_VARIAVEL, sIR_TIPO_CONTA: String;
    sIR_CONTABILIZADO, sIR_SIMULADO: Char;
    function getSaldoContaContabil(sCD_CONTA_CONTABIL: String; dDT_REFERENCIA: TDateTime): Extended;
    function setLancamento(qry: TDataSet): String;
    function existemCriticas: Boolean;
    procedure getContabilizacao;
    procedure setLogLancamento;
    procedure setOcorrencia(sOcorrencia: String);
    procedure setOcorrenciaRelatorio(sOcorrencia: String);
    procedure AtualizaVariaveis;
  public
    { Public declarations }
  end;

var
  frmOkAtualizarLancamentosContabeis: TfrmOkAtualizarLancamentosContabeis;

implementation

uses uGlobal, DRelatsAtuarial, dBaseDados;

{$R *.DFM}

procedure TfrmOkAtualizarLancamentosContabeis.FormCreate(Sender: TObject);
begin
  QryUnidadeNegocio.Open;
  QryCentroCustoC.Close;
  QryCentroCustoC.ParamByName('IDPLANCENTCUST').asInteger := ParamIntegra.PlanoCentroCusto;
  QryCentroCustoC.Open;
  QryCentroCustoD.Close;
  QryCentroCustoD.ParamByName('IDPLANCENTCUST').asInteger := ParamIntegra.PlanoCentroCusto;
  QryCentroCustoD.Open;

  DtTmPckrReferencia.Date := Date;

  CtrlLancamento := TCtrlLancamento.Create;
  CtrlLancamento.InitializeAs(Padroes);

  inherited;
end;

procedure TfrmOkAtualizarLancamentosContabeis.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  QryUnidadeNegocio.Close;
  QryCentroCustoC.Close;
  QryCentroCustoD.Close;
  
  FreeAndNil(CtrlLancamento);
  DtmRelatsAtuarial.ClntDtSttegracaoContabil.Close;
  inherited;
end;

procedure TfrmOkAtualizarLancamentosContabeis.bbtnConfirmarClick(Sender: TObject);
var
  sCONTA_AUXILIAR: String;
begin
  getContabilizacao;

  if existemCriticas then
    Exit;

  with QryIntegracaoContabil do
   Try
     Screen.Cursor := crHourGlass;
     bOCORRENCIA := False;
     DtmRelatsAtuarial.ClntDtSttegracaoContabil.CreateDataSet;

     if not ChckBxSimulado.Checked then
      begin
        //Grava a Log de Ocorrências caso NÃO seja Simulação.
        if dtmBaseDados.dbBaseDados.inTransaction then
          dtmBaseDados.dbBaseDados.Commit;

        dtmBaseDados.dbBaseDados.StartTransaction;
      end;

     Close;
     ParamByName('DT_REFERENCIA').asDateTime := DtTmPckrReferencia.Date;
     Open;

     dDT_EFETIVACAO := Now;
     fPlnCodigo := 0;

     //Registra Data de Efetivação no Log
     setLogLancamento;

     while not Eof do
      begin
        AtualizaVariaveis;
        sVARIAVEL := sNO_VARIAVEL;

        while (sVariavel = FieldByName('NO_VARIAVEL').asString) and
              (not Eof) do
         begin
           AtualizaVariaveis;

           if sIR_TIPO_CONTA = 'C' then
             sCONTA_CREDITO := sCD_CONTA_CONTABIL
           else if sIR_TIPO_CONTA = 'D' then
             sCONTA_DEBITO := sCD_CONTA_CONTABIL;

           sVariavel := sNO_VARIAVEL;
           Next;
         end;//while

        ///Inverter as Contas(C/D), caso seja ESTORNO
        if sIR_CONTABILIZADO = 'E' then
         begin
           sCONTA_AUXILIAR := sCONTA_DEBITO;

           sCONTA_DEBITO := sCONTA_CREDITO;
           sCONTA_CREDITO := sCONTA_AUXILIAR;
         end;


        /// Saldo da Conta de Débito --- Confirmar ///
        fSALDO_CONTA := getSaldoContaContabil(sCONTA_DEBITO, DtTmPckrReferencia.Date);

        if fSALDO_CONTA = 0 then
          fVALOR_LANCAMENTO := fVL_VARIAVEL
        else
          fVALOR_LANCAMENTO := fVL_VARIAVEL - fSALDO_CONTA;


        ///Inverter o Padrão, caso ocorra ajuste para diminuição do Saldo Contabil
        if fVALOR_LANCAMENTO < 0 then
         begin
           sCONTA_AUXILIAR := sCONTA_DEBITO;
           
           sCONTA_DEBITO := sCONTA_CREDITO;
           sCONTA_CREDITO := sCONTA_AUXILIAR;
         end;

        //Registra Lançamentos no Log
        setLancamento(QryIntegracaoContabil);
      end;//while
   Finally
     Close;
     Screen.Cursor := crDefault;

     if bOCORRENCIA then
      begin
        if dtmBaseDados.dbBaseDados.inTransaction then
          dtmBaseDados.dbBaseDados.Rollback;
        MessageDlg('Processo concluído.' + #13#10 + 'Nenhum Lançamento foi gerado.' +
           'Verifique o relatório de Ocorrências.', mtWarning, [mbOk], 0);
      end
     else
      begin
        if dtmBaseDados.dbBaseDados.inTransaction then
          dtmBaseDados.dbBaseDados.Commit;
        MessageDlg('Processo concluído com sucesso.', mtInformation, [mbOk], 0);
      end;

     if DtmRelatsAtuarial.ClntDtSttegracaoContabil.RecordCount > 0 then
       DtmRelatsAtuarial.rpOcorrenciasIntegracaoContabil.Print;

     DtmRelatsAtuarial.ClntDtSttegracaoContabil.Close;
   End;
end;

function TfrmOkAtualizarLancamentosContabeis.getSaldoContaContabil(sCD_CONTA_CONTABIL: String;
    dDT_REFERENCIA: TDateTime): Extended;
var
  iDia, iMes, iAno: Word;
begin
  with QrySaldoContabil do
   Try
     DecodeDate(dDT_REFERENCIA, iAno, iMes, iDia);

     Close;
     ParamByName('ANO').asInteger := iAno;
     ParamByName('DT_SALDO').asDateTime := Int(dDT_REFERENCIA);
     ParamByName('CD_CONTA_CONTABIL').asString := sCD_CONTA_CONTABIL;
     ParamByName('CD_PLANO_CONTA').asInteger := ParamIntegra.Plano;
     Open;

     Result := FieldByName('SALDO').asFloat;
   Finally
     Close;
   End;
end;

function TfrmOkAtualizarLancamentosContabeis.setLancamento(qry: TDataSet): String;
var
  bPLANILHA: Boolean;
begin
  if fVALOR_LANCAMENTO = 0 then
    Exit;

  with qry do
    bPLANILHA := CtrlLancamento.InsereLancaContab(
       '2',
       Sistema.IdEmpresa,
       Sistema.IdModulo,
       Sistema.IdUsuario,
       ParamIntegra.Plano,
       QryUnidadeNegocio.FieldByName('UNIDNEGOC').asFloat, //liUnidNegoc
       0, //liSubContaDeb
       0, //liSubContaCre
       iCD_PLANO,
       iCD_PESSOA_PATROC,
       fPlnCodigo, //liPlnCodigo
       0, //iNumLanc
       DateToStr(DtTmPckrReferencia.Date),
       '', //sNumDoc
       FieldByName('DS_HISTORICO_PADRAO').asString, 
       '', //sHist2
       '', //sHist3
       '', //sHist4
       '', //sHist5
       '03', //sTipoOper
       '', //cCCustd
       sCONTA_DEBITO,
       '', //cCCustc
       sCONTA_CREDITO,
       '', //sCodHist
       fVALOR_LANCAMENTO,
       False, //bJunta
       Sistema.UsaPlanoPatro
       );


  if fPlnCodigo <= 0 then
    fPlnCodigo := CtrlLancamento.RetornoPlnCodigo;

  if bPLANILHA then
    setOcorrencia('Lançamento Incluído com sucesso.')
  else
   begin
     bOCORRENCIA := True;
     setOcorrencia('Erro ao inserir Lançamento: ' + CtrlLancamento.MessageInfo);
   end;
end;

procedure TfrmOkAtualizarLancamentosContabeis.setLogLancamento;
begin
  with QryInsLog do
   Try
     ParamByName('DT_EFETIVACAO').asDateTime := dDT_EFETIVACAO;
     ParamByName('IR_CONTABILIZADO').asString := sIR_CONTABILIZADO;
     ParamByName('DT_REFERENCIA').asDateTime := DtTmPckrReferencia.Date;

     ExecSQL;
   Except  End;
end;

procedure TfrmOkAtualizarLancamentosContabeis.setOcorrencia(sOcorrencia: String);
begin
  setOcorrenciaRelatorio(sOcorrencia);

  if not ChckBxSimulado.Checked then
    with QryInsOcorrencia do
     Try
       ParamByName('DT_EFETIVACAO').asDateTime := dDT_EFETIVACAO;
       ParamByName('CD_PLANO').asInteger := iCD_PLANO;
       ParamByName('CD_GRUPO_CONTABIL').asInteger := iCD_GRUPO_CONTABIL;
       ParamByName('NO_VARIAVEL').asString := sNO_VARIAVEL;
       ParamByName('CD_CONTA_CREDITO').asString := sCONTA_CREDITO;
       ParamByName('CD_CONTA_DEBITO').asString := sCONTA_DEBITO;
       ParamByName('VL_CALCULADO').asFloat := fVL_VARIAVEL;
       ParamByName('VL_SALDO_CONTA').asFloat := fSALDO_CONTA;
       ParamByName('VL_DIFERENCA').asFloat := fVALOR_LANCAMENTO;
       ParamByName('DS_MENSAGEM').asString := sOcorrencia;

       ExecSQL;
     Except  End;
end;

procedure TfrmOkAtualizarLancamentosContabeis.setOcorrenciaRelatorio(sOcorrencia: String);
begin
  if not DtmRelatsAtuarial.ClntDtSttegracaoContabil.Active then
    DtmRelatsAtuarial.ClntDtSttegracaoContabil.CreateDataSet;

  DtmRelatsAtuarial.ClntDtSttegracaoContabil.InsertRecord([
     dDT_EFETIVACAO,
     sIR_CONTABILIZADO,
     sIR_SIMULADO,
     DateToStr(DtTmPckrReferencia.Date),
     iCD_PLANO,
     iCD_GRUPO_CONTABIL,
     sNO_VARIAVEL,
     sCONTA_CREDITO,
     sCONTA_DEBITO,
     fVL_VARIAVEL,
     fSALDO_CONTA,
     fVALOR_LANCAMENTO,
     sOcorrencia]);
end;

procedure TfrmOkAtualizarLancamentosContabeis.getContabilizacao;
begin
  Try
    QryHistContabilizacao.Close;
    QryHistContabilizacao.ParamByName('DT_REFERENCIA').asDateTime := DtTmPckrReferencia.Date;
    QryHistContabilizacao.Open;

    sIR_ULTIMA_CONTABILIZACAO := QryHistContabilizacao.FieldByName('IR_CONTABILIZADO').asString;
  Finally
    QryHistContabilizacao.Close;
  End;
end;

procedure TfrmOkAtualizarLancamentosContabeis.DtTmPckrReferenciaChange(Sender: TObject);
begin
  getContabilizacao;
end;

procedure TfrmOkAtualizarLancamentosContabeis.AtualizaVariaveis;
begin
  iCD_PLANO := QryIntegracaoContabil.FieldByName('CD_PLANO').asInteger;
  iCD_PESSOA_PATROC := QryIntegracaoContabil.FieldByName('CD_PESSOA_PATROC').asInteger;
  iCD_GRUPO_CONTABIL := QryIntegracaoContabil.FieldByName('CD_GRUPO_CONTABIL').asInteger;
  sCD_CONTA_CONTABIL := QryIntegracaoContabil.FieldByName('CD_CONTA_CONTABIL').asString;
  sNO_VARIAVEL := QryIntegracaoContabil.FieldByName('NO_VARIAVEL').asString;
  sIR_TIPO_CONTA := QryIntegracaoContabil.FieldByName('IR_TIPO_CONTA').asString;
  fVL_VARIAVEL := QryIntegracaoContabil.FieldByName('VL_VARIAVEL').asFloat;
end;

procedure TfrmOkAtualizarLancamentosContabeis.BtBtnDesfazerClick(Sender: TObject);
begin
  if CtrlLancamento.ExcluiLancaContab(Sistema.IdUsuario,
       fPlnCodigo,
       Sistema.idModulo,
       0,
       Sistema.UsaPlanoPatro,
       True) then
    MessageDlg('Lançamentos desfeitos.', mtInformation, [mbOk], 0)
  else
    MessageDlg('Não foi possível desfazer os Lançamentos.' + #13#10 +
       CtrlLancamento.MessageInfo, mtWarning, [mbOk], 0);
end;

function TfrmOkAtualizarLancamentosContabeis.existemCriticas: Boolean;
begin
  Result := False;
  if Trim(DBLkpCmbBxUnidadeNegocio.DisplayValue) = '' then
   begin
     MessageDlg('Informe a Atividade/Projeto.', mtWarning, [mbOk], 0);
     DBLkpCmbBxUnidadeNegocio.SetFocus;
     Result := True;
     Exit;
   end;

  if Trim(DBLkpCmbBxCentroCustoC.DisplayValue) = '' then
   begin
     MessageDlg('Informe o Centro de Custo (Crédito).', mtWarning, [mbOk], 0);
     DBLkpCmbBxCentroCustoC.SetFocus;
     Result := True;
     Exit;
   end;

  if Trim(DBLkpCmbBxCentroCustoD.DisplayValue) = '' then
   begin
     MessageDlg('Informe o Centro de Custo (Débito).', mtWarning, [mbOk], 0);
     DBLkpCmbBxCentroCustoD.SetFocus;
     Result := True;
     Exit;
   end;


  if ChckBxEstorno.Checked then
    sIR_CONTABILIZADO := 'E' //Estorno
  else
    sIR_CONTABILIZADO := 'C'; //Contabilização

  if ChckBxSimulado.Checked then
    sIR_SIMULADO := 'S'
  else
   begin
     sIR_SIMULADO := 'N';

     if ChckBxEstorno.Checked then
      begin
        //Só ESTORNA caso já tenha contabilizado a Referência anteriormente.
        if sIR_ULTIMA_CONTABILIZACAO <> 'C' then
         begin
           MessageDlg('Não existem Lançamentos a serem estornados para a Referência selecionada.',
              mtWarning, [mbOk], 0);
           Result := True;
           Exit;
         end;
      end
     else
      begin
        //Só CONTABILIZA caso não tenha processado, ou já tenha estornado a referência anteriormente.
        if sIR_ULTIMA_CONTABILIZACAO = 'C' then
         begin
           MessageDlg('Não foi possível continuar.' + #13#10 + 'A Referência já foi contabilizada.',
              mtWarning, [mbOk], 0);
           Result := True;
           Exit;
         end;
      end; //else
   end; //else
end;

end.
