//******************************************************************************
// Data     : 10/06/2008
// Código   : AL_2
// Pendencia: 22229
// SOL      : 42585
// Desc     : Implementação de ajuste para habilitar a rotina de contabilização e
//             intregração financeira, por custo e variação.
//******************************************************************************
// Data     : 05/06/2007
// Código   : AL_1
// Pendencia: 22229
// SOL      : 42585
// Desc     : Implementação do Receimento de Amortização Bloqueada (3 camadas).
//            Este Cadastro é somente para Fundo de Ações,Imobiliário, Direito Creditório e Participações
//            No grid somente será exibido as amortizações referente ao Tipo de Investimento utilizado pelo usuário
//            com padrão de 12 decimais para qtd de cotas.
//            Na Inclusão será sugerido se só houver um: O Tipo de Fundo, a Patrocinadora,Fundo de Investimento e a Operação
//            O Tipo de Fundo será filtrado de acordo com o tipo de Investimento do Usuário. Após informar o tipo o
//            o sistema irá sugeir a Data de Operação (data do último fechamento do fundo em Tipo de Fundo)
//            O Plano Patrocinadora sugerido será o definido para o Usuário, porém poderá ser alterado.
//            O Fundo de Investimento sugerido será de acordo com o Tipo de Investimento do usuário.
//            Após a informação do Fundo de Invetimento trazer a qtd de decimal a ser utilizado pela qdt cotas
//            O Tipo de Operação será sempre -171 = Amortização Bloqueada/Tipo de Investimento do Usuário, sem considerar
//            o idmercado. Todos os campos serão obrigatórios
//            É necessário incluir a Operação = -171 para os tipo de investimento = 6,7,9,10
//******************************************************************************
unit FCadAmortizacaoBloq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMDetCSInv, Db, StdCtrls, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker, DBTables, Wwquery, CmEventosCadastro, ImgList,
  MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr,
  fcLabel, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls,uCtrlParamInvest,uMensErro,dBaseDados,UDataBase,
  TREdit,uCtrlInvContab,uOperComum,uFundoComum, DBCtrls, UDiasUteisInv, UBibliotecaInvest;

type
  TFrmCadAmortizacaoBloq = class(TfrmCadastroMDetInv)
    DtEdDataOperacao: TCMDateTimePicker;
    dblkTipoFundo: TwwDBLookupCombo;
    DblkFundosInvest: TwwDBLookupCombo;
    lblDataOper: TLabel;
    lblTipoFundo: TLabel;
    Label14: TLabel;
    QryTipoFundo: TwwQuery;
    QryTipoFundoIDTIPOFUNDOINVEST: TFloatField;
    QryTipoFundoIDTIPOINVEST: TFloatField;
    QryTipoFundoDESCTIPOFUNDOINV: TStringField;
    QryTipoFundoDATAULTFECH: TDateTimeField;
    QryHistFundoInvest: TwwQuery;
    QryHistFundoInvestIDFUNDOINVEST: TFloatField;
    QryHistFundoInvestDESCFUNDOINVEST: TStringField;
    QryHistFundoInvestIDGESTORCARTEIRA: TFloatField;
    QryHistFundoInvestTRGDTINCLUSAO: TDateTimeField;
    QryHistFundoInvestTRGUSERINCLUSAO: TStringField;
    QryHistFundoInvestMOECODIGO: TFloatField;
    QryHistFundoInvestIDCARTEIRAINVEST: TFloatField;
    QryHistFundoInvestIDTIPOFUNDOINVEST: TFloatField;
    QryHistFundoInvestCNPJFUNDO: TStringField;
    QryHistFundoInvestSTAEXCLUSIVO: TStringField;
    QryHistFundoInvestPZOCARENCIA: TFloatField;
    QryHistFundoInvestPZOANIVERSARIO: TFloatField;
    QryHistFundoInvestPZOLIQAPLIC: TFloatField;
    QryHistFundoInvestPZOLIQRESG: TFloatField;
    QryHistFundoInvestQTDDECQTD: TFloatField;
    QryHistFundoInvestQTDDECVALOR: TFloatField;
    QryHistFundoInvestSTAFUNDO: TStringField;
    QryHistFundoInvestPZOAMORTIZACAO: TFloatField;
    QryHistFundoInvestPERCTXPERFORM: TFloatField;
    QryHistFundoInvestPERCTXADM: TFloatField;
    QryHistFundoInvestCODFUNCETIP: TStringField;
    QryHistFundoInvestSTAPROVISIONAIR: TStringField;
    QryHistFundoInvestSTAPROVISIONAIOF: TStringField;
    QryHistFundoInvestCONTRCETIP: TStringField;
    QryHistFundoInvestDATAINICIOFUNDO: TDateTimeField;
    QryHistFundoInvestPZOCOTAPLIC: TFloatField;
    QryHistFundoInvestIDTIPOINVEST: TFloatField;
    QryHistFundoInvestDTAINIPROC: TDateTimeField;
    QryTipoOperacao: TwwQuery;
    QryTipoOperacaoDESCTIPOOPERACAO: TStringField;
    QryTipoOperacaoIDTIPOINVEST: TFloatField;
    QryTipoOperacaoIDTIPOOPERACAO: TFloatField;
    QryTipoOperacaoIDMERCADO: TFloatField;
    QryTipoOperacaoCODTIPDOC: TFloatField;
    QryTipoOperacaoNATUREZAOPERACAO: TStringField;
    QryTipoOperacaoTIPOCUSTODIA: TStringField;
    QryTipoOperacaoVENCIMENTO: TFloatField;
    QryTipoOperacaoFLGGERACONTAB: TFloatField;
    QryTipoOperacaoFLGGERACAPCAR: TFloatField;
    QryTipoOperacaoRECPAG: TStringField;
    QryTipoOperacaoTIPCREDOR: TStringField;
    QryTipoOperacaoFLGGERACAF: TFloatField;
    QryTipoOperacaoFLGTRANSF: TStringField;
    QryTipoOperacaoFLGCORRET: TStringField;
    QryTipoOperacaoFLGORDMOVINV: TStringField;
    QryTipoOperacaoIDMOTIVOBLOQUEIO: TFloatField;
    QryTipoOperacaoFLGOPDIREITO: TStringField;
    QryTipoOperacaoFLGAGE: TStringField;
    QryTipoOperacaoFLGDATAEX: TStringField;
    QryTipoOperacaoFLGDATACOM: TStringField;
    QryTipoOperacaoFLGINVORIGEM: TStringField;
    QryTipoOperacaoFLGPERC: TStringField;
    QryTipoOperacaoFLGPARIDADE: TStringField;
    QryTipoOperacaoFLGPRZBOLSA: TStringField;
    QryTipoOperacaoFLGPRZEMP: TStringField;
    QryTipoOperacaoFLGATADEC: TStringField;
    QryTipoOperacaoFLGFORMAPAGREC: TStringField;
    QryTipoOperacaoFLGDIVACAO: TStringField;
    QryTipoOperacaoFLGINIPAG: TStringField;
    QryTipoOperacaoFLGJUROS: TStringField;
    QryTipoOperacaoMOTBLOQCARTORIG: TFloatField;
    QryTipoOperacaoMOTBLOQCARTDEST: TFloatField;
    QryTipoOperacaoFLGOBRIGAOBS: TStringField;
    QryTipoOperacaoTIPSALDOCARTORIG: TStringField;
    QryTipoOperacaoTIPSALDOCARTDEST: TStringField;
    QryTipoOperacaoFLGTRATAIR: TStringField;
    QryTipoOperacaoSIGLATIPOOPER: TStringField;
    QryTipoOperacaoFLGISENTOIR: TStringField;
    QryTipoOperacaoFLGGRAVAIRLITIGIO: TStringField;
    QryTipoOperacaoFLGOPGERENC: TStringField;
    QryTipoOperacaoTIPOMOVTO: TStringField;
    QryTipoOperacaoSTAATIVO: TStringField;
    QryTipoOperacaoFLGRENTABILIDADE: TStringField;
    QryTipoOperacaoFLGCONTAINVEST: TFloatField;
    QryTipoOperacaoFLGMOVCOTA: TStringField;
    QryTipoOperacaoFLGCOTARECDES: TStringField;
    QryTipoOperacaoFLGDATAVENCIMENTO: TStringField;
    DBEQtdCota: TDBRealEdit;
    DBEVlrRecebido: TDBRealEdit;
    Label1: TLabel;
    Label3: TLabel;
    QryTipoCota: TwwQuery;
    QryTipoCotaIDTIPOCOTA: TFloatField;
    QryTipoCotaDESCTIPOCOTA: TStringField;
    qryDetalheIDOPERACAOFUNDO: TFloatField;
    qryDetalheDESCTIPOFUNDOINV: TStringField;
    qryDetalheIDFUNDOINVEST: TFloatField;
    qryDetalheDESCFUNDOINVEST: TStringField;
    qryDetalheDATAOPERACAO: TDateTimeField;
    qryDetalheIDPLANPREVCTBPATR: TFloatField;
    qryDetalhePLANPRVCONTABPATRO: TStringField;
    qryDetalheIDTIPOFUNDOINVEST: TFloatField;
    qryDetalheIDTIPOOPERACAO: TFloatField;
    qryDetalheDESCTIPOOPERACAO: TStringField;
    qryDetalheQTDOPERACAO: TFloatField;
    qryDetalheVLROPERACAO: TFloatField;
    qryDetalheIDTIPOINVEST: TFloatField;
    qryDetalheOBSERVACAO: TMemoField;
    qryDetalheIDTIPOCOTA: TFloatField;
    qryDetalheDESCTIPOCOTA: TStringField;
    qryDetalhePLANO: TFloatField;
    qryDetalheCODDOCUMENTO: TFloatField;
    qryDetalhePLNCODIGO: TFloatField;
    qryDetalheIDCARTEIRAINVEST: TFloatField;
    qryDetalheDATALIQUIDACAO: TDateTimeField;
    dbmObs: TDBMemo;
    Label2: TLabel;
    qryAux: TwwQuery;
    dblTipoCota: TwwDBLookupCombo;
    lblTipocota: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure dblkTipoFundoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkTipoFundoExit(Sender: TObject);
    procedure DblkFundosInvestEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dblkTipoFundoEnter(Sender: TObject);
    procedure DblkFundosInvestExit(Sender: TObject);
    procedure DblkFundosInvestCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure CmeDetalheBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure DtEdDataOperacaoExit(Sender: TObject);
    procedure dblTipoCotaExit(Sender: TObject);
    procedure dblTipoCotaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblTipoCotaEnter(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);

  private
    { Private declarations }
    sVarAnt, sDataOpeAnt   : String;
    bModif    : Boolean;
    procedure AbreQry(iOperFundo : Integer = -1);
    Procedure StatusDetInclui;
    Procedure StatusGeral;

  public
    { Public declarations }
  end;

var
  FrmCadAmortizacaoBloq: TFrmCadAmortizacaoBloq;

implementation


{$R *.DFM}

procedure TFrmCadAmortizacaoBloq.FormCreate(Sender: TObject);
begin
  inherited;

  OperComum.LimpaParametros(QryTipoOperacao);
  QryTipoOperacao.ParamByName('IDTIPOINVEST').AsInteger := CtrlPinv.IdTipoInvest;
  QryTipoOperacao.Open;

  OperComum.LimpaParametros(QryTipoFundo);
  QryTipoFundo.ParamByName('IDTIPOINVEST').AsInteger := CtrlPinv.IdTipoInvest;
  QryTipoFundo.Open;

  QryTipoCota.Open;
  QryHistFundoInvest.Open;
end;



procedure TFrmCadAmortizacaoBloq.dblkTipoFundoCloseUp(Sender: TObject;LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

  bModif := modified;
  if ((bModif) and (Trim(dblkTipoFundo.Text) <> '')) then
  begin
    DtEdDataOperacao.Text := QryTipoFundoDATAULTFECH.AsString;

    DblkFundosInvest.clear;
    OperComum.LimpaParametros(QryHistFundoInvest);
    QryHistFundoInvest.ParamByName('IDTIPOINVEST').AsInteger := CtrlPinv.IdTipoInvest;
    QryHistFundoInvest.ParamByName('IDTIPOFUNDOINVEST').AsInteger := QryTipoFundoIDTIPOFUNDOINVEST.AsInteger;
    QryHistFundoInvest.ParamByName('DATAOPERACAO').AsString := DtEdDataOperacao.text;
    QryHistFundoInvest.Open;

    Qrydetalhe.close;
  end;

  StatusGeral;
end;



procedure TFrmCadAmortizacaoBloq.dblkTipoFundoExit(Sender: TObject);
begin
  inherited;
  if ((Not bModif) and
     (sVarAnt <> dblkTipoFundo.LookupValue) and
     (Trim(dblkTipoFundo.Text) <> '')) then
  begin
     DtEdDataOperacao.Text := QryTipoFundo.fieldbyname('DATAULTFECH').AsString;

     DblkFundosInvest.clear;
     OperComum.LimpaParametros(QryHistFundoInvest);
     QryHistFundoInvest.ParamByName('IDTIPOINVEST').AsInteger := CtrlPinv.IdTipoInvest;
     QryHistFundoInvest.ParamByName('IDTIPOFUNDOINVEST').AsInteger := QryTipoFundoIDTIPOFUNDOINVEST.AsInteger;
     QryHistFundoInvest.ParamByName('DATAOPERACAO').AsString := DtEdDataOperacao.text;
     QryHistFundoInvest.Open;

  end;

  bModif := false;
  StatusGeral;
end;

procedure TFrmCadAmortizacaoBloq.DblkFundosInvestEnter(Sender: TObject);
begin
  inherited;

  sVarAnt := DblkFundosInvest.lookupvalue;
end;

procedure TFrmCadAmortizacaoBloq.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  inherited;

  QryTipoOperacao.Close;
  QryHistFundoInvest.Close;
  QryTipoFundo.Close;
  QryDetalhe.Close;
  QryTipoCota.Close;
end;

procedure TFrmCadAmortizacaoBloq.FormShow(Sender: TObject);
begin
  // Verificar se existe a Operação
  If Not (QryTipoOperacao.IsEmpty) then
  begin
    inherited;
    // Verificamdo se vai exibir ou não o Tipo de Cota
    If ((CtrlPinv.IdTipoInvest = 9) or
        (CtrlPinv.IdTipoInvest = 10)) then
    begin
      lblTipocota.visible := True;
      dblTipoCota.visible := True;
    end
    else
    begin
      lblTipocota.visible := False;
      dblTipoCota.visible := False;
    end;

    // Sugerindo o Tipo de Fundo + data de operacao quando houver somente 1
    If QryTipoFundo.RecordCount = 1 then
    begin
      dblkTipoFundo.LookupValue := QryTipoFundo.fieldbyname('IDTIPOFUNDOINVEST').AsString;
      DtEdDataOperacao.date := QryTipoFundo.fieldbyname('DATAULTFECH').AsDateTime;
    end;

    If dblkTipoFundo.CanFocus then
       dblkTipoFundo.SetFocus;

    StatusGeral;

    MontaSelect.Filtro.Add('OPERACAOFUNDO.IDTIPOINVEST = '+IntToStr(iTipoInvestUsu));
    MontaSelect.Filtro.Add('OPERACAOFUNDO.IDPLANPREVCTBPATR = '+IntToStr(iPlanPrevCtbPatro));
  end
  else
  begin
    MsgDlg('O tipo de operação Amortização Bloqueada (-171), não foi cadastrado! Não será possível efetuar a operação.',
           'Mensagem do Sistema',mtInformation,[MbOk],0);
    Close;
  end;
end;



procedure TFrmCadAmortizacaoBloq.dblkTipoFundoEnter(Sender: TObject);
begin
  inherited;

  // Pegando para saber se foi alterado
  sVarAnt := dblkTipoFundo.LookupValue;
end;



procedure TFrmCadAmortizacaoBloq.DblkFundosInvestExit(Sender: TObject);
begin
  inherited;
  if ((Not bModif) and
     (dblkTipoFundo.lookupvalue <> '') and
     (Trim(DblkFundosInvest.Text) <> '') and
     (sVarAnt <> DblkFundosInvest.LookupValue) and
     (DtEdDataOperacao.Text <> '')) then
  begin
    If ((CtrlPinv.IdTipoInvest = 9) or (CtrlPinv.IdTipoInvest = 10)) then
    begin
      If (dblTipoCota.text <> '') then
         AbreQry
      else
         QryDetalhe.Close;
    end
    else
      AbreQry;
  end;

  bModif := false;
  StatusGeral;
end;



procedure TFrmCadAmortizacaoBloq.AbreQry(iOperFundo: Integer);
begin
  OperComum.LimpaParametros(QryDetalhe);
  QryDetalhe.ParamByName('IDPLANPREVCTBPATR').AsInteger := CtrlPinv.IdPlanPrevCtbPatr;
  QryDetalhe.ParamByName('IDTIPOINVEST').AsInteger := CtrlPinv.IdTipoInvest;
  QryDetalhe.ParamByName('IDFUNDOINVEST').AsInteger :=  strtoint(DblkFundosInvest.lookupvalue);
  QryDetalhe.ParamByName('DATAOPERACAO').AsString :=  DtEdDataOperacao.Text;

  If dblTipoCota.Text <> '' then
     QryDetalhe.ParamByName('IDTIPOCOTA').AsInteger := strtoint(dblTipoCota.lookupvalue);

  If iOperFundo > 0 then
     QryDetalhe.ParamByName('IDOPERACAOFUNDO').AsInteger := iOperFundo;

  QryDetalhe.Open;

  //Atualizando Decimais quantidade cotas
  If (QryHistFundoInvest.FieldByName('QTDDECQTD').AsInteger  = null) or (QryHistFundoInvest.FieldByName('QTDDECQTD').AsInteger  = 0) then
     DBEQtdCota.DecDigits := 12 // Padrão para quando não informado a quantidade
  else
     DBEQtdCota.DecDigits := QryHistFundoInvest.FieldByName('QTDDECQTD').AsInteger; // Aceita o valor informado
  // Aqui se for null ou zero já vem com a mascara de 12 para decimais
  qryDetalheQTDOPERACAO.DisplayFormat := MontaMascaraDecQtdHist(StrToInt(DblkFundosInvest.LookupValue),DtEdDataOperacao.Text);

  //Atualizando Decimais valor cotas
  If (QryHistFundoInvest.FieldByName('QTDDECVALOR').AsInteger  = null) or (QryHistFundoInvest.FieldByName('QTDDECVALOR').AsInteger  = 0) then
     DBEVlrRecebido.DecDigits := 2 // Padrão para quando não informado a quantidade
  else
     DBEVlrRecebido.DecDigits := QryHistFundoInvest.FieldByName('QTDDECVALOR').AsInteger; // Aceita o valor informado
  // Aqui se for null ou zero já vem com a mascara de 12 para decimais
  qryDetalheVLROPERACAO.DisplayFormat :=  MontaMascaraDecVlrHist(StrToInt(DblkFundosInvest.LookupValue),DtEdDataOperacao.Text);

  //QryDetalhe.Sql.SavetoFile('c:\QryBloqueada.txt');

  StatusGeral;
end;



procedure TFrmCadAmortizacaoBloq.DblkFundosInvestCloseUp(Sender: TObject;LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

  bmodif := modified;
  if ((bmodif) and (dblkTipoFundo.lookupvalue <> '') And
      (DblkFundosInvest.lookupvalue <> '') And
      (DtEdDataOperacao.Text <> '')) then
  begin
    If ((CtrlPinv.IdTipoInvest = 9) or (CtrlPinv.IdTipoInvest = 10)) then
    begin
      If (dblTipoCota.text <> '') then
         AbreQry
      else
         QryDetalhe.Close;
    end
    else
      AbreQry;
  end
  else
    QryDetalhe.Close;

  StatusGeral;
end;

procedure TFrmCadAmortizacaoBloq.sbtnInsDetClick(Sender: TObject);
begin
  If (Trim(dblkTipoFundo.Text) <> '') and
     (Trim(DblkFundosInvest.Text) <> '') and
     (DtEdDataOperacao.Date <> 0) and
     (((dblTipoCota.Text <> '') and ((CtrlPinv.IdTipoInvest = 9)  or (CtrlPinv.IdTipoInvest = 10))) or
      ((dblTipoCota.Text = '')  and ((CtrlPinv.IdTipoInvest <> 9) and (CtrlPinv.IdTipoInvest <> 10)))) then
  begin
    // Testa Peridodo Contabil se houver Contábil e Financeiro para Operação
    if (QryTipoOperacaoFLGGERACONTAB.AsString = 'S') or  (QryTipoOperacaoFLGGERACAPCAR.AsString = 'S') then
    begin
      if not CtrlInvContab.TestaPeriodo(DtEdDataOperacao.Text,CtrlPinv.IdTipoInvest ) then
       begin
         MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
         if DtEdDataOperacao.CanFocus then
            DtEdDataOperacao.SetFocus;
         Exit;
       end;
   end;

   //Atualizando Status do detalhe
   StatusDetInclui;

   inherited;

   end
   else
   begin
     Qrydetalhe.close;
     StatusGeral;
   end;
end;



procedure TFrmCadAmortizacaoBloq.CmeDetalheBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
  Accept := True;
  if trim(dblkTipoFundo.text) = '' then
  begin
    MsgDlg('Informe o Tipo de Fundo para realizar a Operação.','Mensagem do Sistema', mtInformation,[MbOk],0);
    If dblkTipoFundo.CanFocus then
       dblkTipoFundo.SetFocus;
    Accept := False;
  end
  Else if trim(DblkFundosInvest.text) = '' then
       begin
         MsgDlg('Informe o Fundo de Investimento para realizar a Operação.','Mensagem do Sistema', mtInformation,[MbOk],0);
         If DblkFundosInvest.CanFocus then
            DblkFundosInvest.SetFocus;
         Accept := False;
       end
  Else if DtEdDataOperacao.Text = '' then
       begin
         MsgDlg('Informe a Data da Operação.','Mensagem do Sistema' ,MtWarning,[mbok],0);
         If DtEdDataOperacao.CanFocus then
            DtEdDataOperacao.SetFocus;
         Accept := False;
       end
  Else if (trim(dblTipoCota.text) = '') and
          ((CtrlPInv.IdTipoInvest = 9) or (CtrlPInv.IdTipoInvest = 10)) then
       begin
         MsgDlg('Informe o Tipo de Cota para realizar a Operação.','Mensagem do Sistema', mtInformation,[MbOk],0);
         if dblTipoCota.CanFocus then
            dblTipoCota.SetFocus;
         Accept := False;
       end;

 inherited;

end;

procedure TFrmCadAmortizacaoBloq.StatusDetInclui;
begin
  // Desabilitando campos para inclusao
  sbtnProcurar.Enabled    := False;

  pnlMestre.Enabled       := False;

  pnlControlesDet.Enabled := True;

  sbtnExcluiDet.Enabled   := False;

  sbtnAltDet.Visible      := False;
  sbtnAltDet.Enabled      := False;

  sbtnConsDet.Visible     := False;
  sbtnConsDet.Enabled     := False;

  bbtnOkDet.Visible       := True;
  bbtnOkDet.Enabled       := True;

  bbtnCancelarDet.Visible := True;
  bbtnCancelarDet.Enabled := True;

  bbtnVoltarDet.Visible   := False;
  bbtnVoltarDet.Enabled   := False;

end;

procedure TFrmCadAmortizacaoBloq.bbtnOkDetClick(Sender: TObject);
Var
  iIdForCli, iPlanilha, iDocumento, iPlano : Integer;
  sMsg: String;
  dDataAplic: TdateTime;
begin
  if DBEQtdCota.Value = 0 then
  begin
    MsgDlg('O valor da  Quantidade de Cotas deverá ser maior que zero.','Mensagem do Sistema' ,MtWarning,[mbok],0);
    if DBEQtdCota.CanFocus then
       DBEQtdCota.SetFocus;
    exit;
  end
  else if DBEVlrRecebido.Value = 0.00 then
       begin
         MsgDlg('O Valor da Operação deverá ser maior que zero.','Mensagem do Sistema' ,MtWarning,[mbok],0);
         if DBEVlrRecebido.CanFocus then
            DBEVlrRecebido.SetFocus;
         exit;
       end;

 //Verificar se existem alguma atualizaçao em andamento
 if VerEmAbertura(QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
    exit;

 try // Finally
   try  // Except

     // Inicia Transação
     if not dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.StartTransaction;

     if dsDet.DataSet.State in [dsInsert] then
        QryDetalhe.FieldByName('IDOPERACAOFUNDO').AsInteger := LeUltRegistro(nil,'OPERACAOFUNDO');

     QryDetalhe.FieldByName('DATAOPERACAO').AsDateTime     := DtEdDataOperacao.Date;
     QryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger     := StrToInt(DblkFundosInvest.LookupValue);
     QryDetalhe.FieldByName('IDTIPOOPERACAO').AsInteger    := QryTipoOperacaoIDTIPOOPERACAO.AsInteger;
     QryDetalhe.FieldByName('IDTIPOINVEST').AsInteger      := CtrlPinv.IdTipoInvest;
     //Calculando a Data de Liquidacao
     dDataAplic := (DtEdDataOperacao.Date+QryHistFundoInvestPZOLIQAPLIC.AsInteger);

     if  not DiasUteisInv.DiaUtil(dDataAplic,-1{cidade},1{país},''{estado},True{Considera bancário},False{Extraordinario},False{sábado útil}) then
         dDataAplic :=
            DiasUteisInv.PrimeiroDiaUtilPosterior(dDataAplic,-1{cidade},1{país},''{estado},True{Considera bancário},False{Extraordinario},False{sábado útil});
     QryDetalhe.FieldByName('DATALIQUIDACAO').AsDateTime   := dDataAplic;
     QryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger  := QryHistFundoInvestIDCARTEIRAINVEST.AsInteger;
     QryDetalhe.FieldByName('IDPLANPREVCTBPATR').AsInteger := CtrlPinv.IdPlanPrevCtbPatr;

     if ((CtrlPinv.IdTipoInvest = 9) or (CtrlPinv.IdTipoInvest = 10)) then
        QryDetalhe.FieldByName('IDTIPOCOTA').AsInteger := QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger;

     bbtnConfirmar.Enabled := True;

     iIdForCli := 0;
     iIdForCli := OperComum.BuscaForCli(CtrlPinv.IdTipoInvest,
                                        QryHistFundoInvestIDGESTORCARTEIRA.AsInteger, {HistFundoInvest}
                                        QryTipoOperacaoIDTIPOOPERACAO.AsInteger, {TipoOperacao}
                                        CtrlPinv.IdTipoClienteEMI);

     ///////////////////////
     // Contabilizando
     ///////////////////////
     iPlanilha  := -1;
     iDocumento := -1;
     iPlano     := -1;

     //AL_2
     if not ContabilizacaoFinanceiro(iPlano, iPlanilha, iDocumento,
                                     QryTipoOperacaoIDTIPOOPERACAO.AsInteger, {TipoOperacao}
                                     CtrlPinv.IdTipoInvest,
                                     QryHistFundoInvestIDCARTEIRAINVEST.AsInteger, {HistFundoInvest}
                                     QryHistFundoInvestIDTIPOFUNDOINVEST.AsInteger,{HistFundoInvest}
                                     iIdForCli,
                                     QryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger,
                                     QryDetalhe.FieldByName('DATAOPERACAO').AsDateTime,
                                     QryDetalhe.FieldByName('DATALIQUIDACAO').AsDateTime,
                                     QryTipoOperacaoTIPOMOVTO.AsString,  {TipoOperacao=OPE}
                                     QryTipoOperacaoNATUREZAOPERACAO.AsString,  {Natureza=A}
                                     QryHistFundoInvestDESCFUNDOINVEST.AsString+' / '+CtrlPinv.PlanPrevCtbPatr,
                                     True,
                                     QryDetalhe.FieldByName('VLROPERACAO').AsFloat,
                                     0, 0, 0, 0,
                                     QryDetalhe.FieldByName('VLROPERACAO').AsFloat,
                                     QryDetalhe.FieldByName('VLROPERACAO').AsFloat,
                                     -1, 0, 0, 0) Then
        raise Exception.Create('Não foi possível efetuar a integralização do Contábil/Financeiro.');

     qryDetalhe.FieldByName('PLANO').Clear;
     if iPlano > 0 then
        qryDetalhe.FieldByName('PLANO').AsInteger     := iPlano;

     qryDetalhe.FieldByName('PLNCODIGO').Clear;
     if iPlanilha > 0 then
        qryDetalhe.FieldByName('PLNCODIGO').AsInteger := iPlanilha;

        qryDetalhe.FieldByName('CODDOCUMENTO').Clear;
     if iDocumento > 0 then
        qryDetalhe.FieldByName('CODDOCUMENTO').AsInteger := iDocumento;

     qryDetalhe.Post;
     qryDetalhe.CommitUpdates;

     inherited;

     If dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.Commit;

     pnlControlesDet.SendToBack;

    except
      on E:Exception Do
         begin
           MsgDlg('Não foi possível efetuar a Operação:'+#13+E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
           dtmBaseDados.dbBaseDados.Rollback;
           pnlControlesDet.SendToBack;
           CmeDetalhe.Cancel(Self);
           AplicaAlteracoes([qryDetalhe]);
         end;
    end;
 finally
   AbreQry; // Aqui não é preciso checar os cpos obrigatorios, pq depois de uma inculsao está ok
   bbtnCancelarDetClick(Sender); // Se deu algum erro cancelo
   StatusGeral;
 end; // Fim Finally
end;



procedure TFrmCadAmortizacaoBloq.StatusGeral;
begin
  // Filtros
  dblkTipoFundo.Enabled    := True;
  DblkFundosInvest.Enabled := True;
  DtEdDataOperacao.Enabled := True;

  //Botoes Mestre
  sbtnInserir.Visible  := False;
  sbtnAlterar.Visible  := False;
  sbtnApagar.Visible   := False;
  sbtnProcurar.Enabled := True;

  // Se a Qry está vazia
  if (qryDetalhe.IsEmpty) then
  begin
    // Se os filtros estão vazios
    If ((Trim(dblkTipoFundo.Text) = '') or
        (Trim(DblkFundosInvest.Text) = '') or
        (DtEdDataOperacao.Date = 0)) or
        ((dblTipoCota.Text = '') and ((CtrlPinv.IdTipoInvest = 9) or (CtrlPinv.IdTipoInvest = 10))) then
    begin
       // Tudo desabilitado
       sbtnInsDet.Enabled    := False;
       sbtnAltDet.Visible    := False;
       sbtnAltDet.Enabled    := False;
       sbtnExcluiDet.Enabled := False;
       sbtnConsDet.Visible   := False;
       sbtnConsDet.Enabled   := False;
    end
    else If (Trim(dblkTipoFundo.Text) <> '') and
            (Trim(DblkFundosInvest.Text) <> '') and
            (DtEdDataOperacao.Date <> 0) and
            (((dblTipoCota.Text <> '') and ((CtrlPinv.IdTipoInvest = 9)  or (CtrlPinv.IdTipoInvest = 10))) or
             ((dblTipoCota.Text = '')  and ((CtrlPinv.IdTipoInvest <> 9) and (CtrlPinv.IdTipoInvest <> 10)))) then
         begin
            sbtnInsDet.Enabled    := True; // Só habilita o botão incluir
            sbtnAltDet.Visible    := False;
            sbtnAltDet.Enabled    := False;
            sbtnExcluiDet.Enabled := False;
            sbtnConsDet.Visible   := False;
            sbtnConsDet.Enabled   := False;
         end;
  end
  else
  begin
    // Se os filtros estão vazios
    If ((Trim(dblkTipoFundo.Text) = '') or
        (Trim(DblkFundosInvest.Text) = '') or
        (DtEdDataOperacao.Date = 0)) or
        ((dblTipoCota.Text = '') and ((CtrlPinv.IdTipoInvest = 9) or (CtrlPinv.IdTipoInvest = 10))) then
    begin
      // Tudo desabilitado
      sbtnInsDet.Enabled    := False;
      sbtnAltDet.Visible    := False;
      sbtnAltDet.Enabled    := False;
      sbtnExcluiDet.Enabled := False;
      sbtnConsDet.Visible   := False;
      sbtnConsDet.Enabled   := False;
    end
    else If (Trim(dblkTipoFundo.Text) <> '') and
            (Trim(DblkFundosInvest.Text) <> '') and
            (DtEdDataOperacao.Date <> 0) and
            (((dblTipoCota.Text <> '') and ((CtrlPinv.IdTipoInvest = 9)  or (CtrlPinv.IdTipoInvest = 10))) or
             ((dblTipoCota.Text = '')  and ((CtrlPinv.IdTipoInvest <> 9) and (CtrlPinv.IdTipoInvest <> 10)))) then
         begin
           sbtnInsDet.Enabled    := False;
           sbtnAltDet.Visible    := False;
           sbtnAltDet.Enabled    := False;
           sbtnExcluiDet.Enabled := True; // Só habilita o botão excluir houver registro
           sbtnConsDet.Visible   := False;
           sbtnConsDet.Enabled   := False;
         end;
  end; // Fim da QryDetalhe cheia

  bbtnOkDet.Enabled        := False;
  bbtnCancelarDet.Enabled  := False;
  bbtnVoltarDet.Enabled    := False;

end;



procedure TFrmCadAmortizacaoBloq.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;

  If dtmBaseDados.dbBaseDados.InTransaction then
     dtmBaseDados.dbBaseDados.Rollback;

  StatusGeral;
end;



procedure TFrmCadAmortizacaoBloq.sbtnExcluiDetClick(Sender: TObject);
Var
   iOperacao, iFundo, iPlanilha, iDocumento, iPlano : Integer;
   wDataOper: TDateTime;
begin
  If (Trim(dblkTipoFundo.Text) <> '') and
     (Trim(DblkFundosInvest.Text) <> '') and
     (DtEdDataOperacao.Date <> 0) and
     (((dblTipoCota.Text <> '') and ((CtrlPinv.IdTipoInvest = 9)  or (CtrlPinv.IdTipoInvest = 10))) or
      ((dblTipoCota.Text = '')  and ((CtrlPinv.IdTipoInvest <> 9) and (CtrlPinv.IdTipoInvest <> 10)))) then
  begin
    sbtnProcurar.enabled := False;
    try // Finally
      if not (qryDetalhe.IsEmpty) then
      begin
        //Verificar se existem alguma atualizaçao em andamento
        if VerEmAbertura(QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
           Exit;

        // Testa PeridodoContabil se houver Contábil e Financeiro para Operação
        If (QryTipoOperacaoFLGGERACONTAB.AsString = 'S') or  (QryTipoOperacaoFLGGERACAPCAR.AsString = 'S') then
        begin
          if not CtrlInvContab.TestaPeriodo(DtEdDataOperacao.Text,CtrlPinv.IdTipoInvest ) then
          begin
            MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
            if DtEdDataOperacao.CanFocus then
               DtEdDataOperacao.SetFocus;
            Exit;
          end;
        end;

        if MsgDlg('Confirma Exclusão ?','Mensagem ',mtInformation,[mbYes, mbNo],0) = mrYes Then
        begin
          try
            iOperacao := qryDetalhe.FieldByName('IDOPERACAOFUNDO').AsInteger;
            iDocumento:= qryDetalhe.FieldByName('CODDOCUMENTO').AsInteger;
            iPlanilha := qryDetalhe.FieldByName('PLNCODIGO').AsInteger;
            iPlano    := qryDetalhe.FieldByName('PLANO').AsInteger;
            iFundo    := qryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger;
            wDataOper := QryDetalhe.FieldByName('DATAOPERACAO').AsDateTime;

            // Inicia Transação
            if not dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.StartTransaction;

            //Vou apagar de HistFundo
            if Not ExecutaQuery(qryAux, 'DELETE FROM HISTFUNDO WHERE '+
                                        'IDOPERACAOFUNDO           = '+ QryDetalhe.FieldByName('IDOPERACAOFUNDO').AsString) then
               raise Exception.Create('Ocorreu um Problema na exclusão da operação.');

            // Exclui Dados do Historico
            if not ProcExcluiFundo(iDocumento,
                                   iPlanilha,
                                   iPlano,
                                   CtrlPinv.IdTipoInvest,
                                   wDataOper,
                                   True,
                                   QryDetalhe.FieldByName('IDOPERACAOFUNDO').AsInteger) then
               raise Exception.Create('Ocorreu um Problema na exclusão do Contábil da operação.');


            inherited;

            if dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.Commit;

            MsgDlg('Operação Concluida com Sucesso.','Mensagem do Sistema', MtConfirmation,[MbOk],0);

          except
            On E:Exception Do
               Begin
                 MsgDlg('Não foi possível excluir a Amortização Bloqueada:'+#13+ E.Message,'Mensagem do Sitema',mtWarning,[mbOk],0);
                 dtmBaseDados.dbBaseDados.Rollback;
                 CmeDetalhe.Cancel(Self);
                End;
          end; // Try Except
        end; // Confirma Exclusao
      end; // Se a Qry não está vazia
    finally
      bbtnCancelarDetClick(Sender);
      StatusGeral;
      AbreQry;
    end; // Finally
   end
   else
   begin
     Qrydetalhe.close;
     StatusGeral;
   end;
end;

procedure TFrmCadAmortizacaoBloq.DtEdDataOperacaoExit(Sender: TObject);
begin
  inherited;
  if (dblkTipoFundo.text <> '') and (DtEdDataOperacao.text <> '') then
  begin
    //Não será permitido lançamento para dia não útil, com excessão do Imobiliário
    if not DiasUteisInv.DiaUtil(DtEdDataOperacao.Date,-1{cidade},1{país},''{estado},True{Considera bancário},False{Extraordinario},False{sábado útil}) and
       (CtrlPinv.IdTipoInvest <> 7) then
    begin
      MsgDlg('Não é permitido lançar uma Operação em um dia não útil.','Mensagem do Sistema', mtInformation,[MbOk],0);
      If DtEdDataOperacao.CanFocus then
      begin
        DtEdDataOperacao.Clear;
        DtEdDataOperacao.SetFocus;
      end;
    end;

    OperComum.LimpaParametros(QryHistFundoInvest);
    QryHistFundoInvest.ParamByName('IDTIPOINVEST').AsInteger := CtrlPinv.IdTipoInvest;
    QryHistFundoInvest.ParamByName('IDTIPOFUNDOINVEST').AsInteger := QryTipoFundoIDTIPOFUNDOINVEST.AsInteger;
    QryHistFundoInvest.ParamByName('DATAOPERACAO').AsString := DtEdDataOperacao.text;
    QryHistFundoInvest.Open;

  end;
  QryDetalhe.close;
  StatusGeral;
end;



procedure TFrmCadAmortizacaoBloq.dblTipoCotaExit(Sender: TObject);
begin
  inherited;
  if ((Not bModif) and (dblkTipoFundo.lookupvalue <> '') and
      (Trim(DblkFundosInvest.Text) <> '') and
      (sVarAnt <> dblTipoCota.LookupValue) and
      (DtEdDataOperacao.Text <> '') and (dblTipoCota.text <> '')) then
     AbreQry  // É necessário checar os campos obrigatórios
  else if Trim(dblTipoCota.Text) = '' then
          qryDetalhe.Close;

  bModif := false;
  StatusGeral;
end;


procedure TFrmCadAmortizacaoBloq.dblTipoCotaCloseUp(Sender: TObject;LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  bmodif := modified;
  if ((bmodif) and (dblkTipoFundo.lookupvalue <> '') and
      (DblkFundosInvest.lookupvalue <> '') and
      (DtEdDataOperacao.Text <> '') and (dblTipoCota.text <> '')) then
     AbreQry // É necessário checar os cpos obrigatórios
  else
     qryDetalhe.Close;
  StatusGeral;

end;



procedure TFrmCadAmortizacaoBloq.dblTipoCotaEnter(Sender: TObject);
begin
  inherited;
  sVarAnt := dblTipoCota.lookupvalue;
end;



procedure TFrmCadAmortizacaoBloq.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
    begin
      DtEdDataOperacao.DateTime := StrToDate(MontaSelect.ValoresChave[2]);

      QryTipoFundo.Locate('IDTIPOFUNDOINVEST',MontaSelect.ValoresChave[1],[]);
      dblkTipoFundo.Text               := QryTipoFundo.FieldByName('DESCTIPOFUNDOINV').AsString;
      dblkTipoFundo.LookupValue        := MontaSelect.ValoresChave[1];
      dblkTipoFundo.PerformSearch;

      OperComum.LimpaParametros(QryHistFundoInvest);
      QryHistFundoInvest.ParamByName('IDTIPOINVEST').AsInteger := CtrlPinv.IdTipoInvest;
      QryHistFundoInvest.ParamByName('DATAOPERACAO').AsString  := MontaSelect.ValoresChave[2];
      QryHistFundoInvest.ParamByName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(MontaSelect.ValoresChave[1]);
      QryHistFundoInvest.Open;
      QryHistFundoInvest.Locate('IDFUNDOINVEST',MontaSelect.ValoresChave[3],[]);
      DblkFundosInvest.Text             := QryHistFundoInvest.FieldByName('DESCFUNDOINVEST').AsString;
      DblkFundosInvest.LookupValue      := MontaSelect.ValoresChave[3];
      DblkFundosInvest.PerformSearch;

      if ((CtrlPinv.IdTipoInvest = 9) or (CtrlPinv.IdTipoInvest = 10)) then
      begin
        QryTipoCota.Locate('IDTIPOCOTA',MontaSelect.ValoresChave[5],[]);
        dblTipoCota.Text  := QryTipoCota.FieldByName('DESCTIPOCOTA').AsString;
        dblTipoCota.lookupvalue :=  MontaSelect.ValoresChave[5];
        dblTipoCota.PerformSearch;
      end;
      AbreQry;
      StatusGeral;
  end;
  pnlFundo.Enabled  := True;
  pnlMestre.Enabled := True;
end;

end.


