//******************************************************************************
// Data      : 19/03/2008
// Código    : AL_8
// Pendencia : 27461
// SOL       : 79683
// Desc      : Abertura da QueryPlanoPatro
//******************************************************************************
// Data      : 23/01/2007
// Código    : AL_7
// Pendencia : 22988
// SOL       :
// Desc      : Implementação de Segregação de Planos
//******************************************************************************
// Data      : 03/07/2006
// Código    : AL_6
// Pendencia : 24774
// SOL       : 55877
// Desc      : Acerto na Integração Contábil e Financeira
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_5
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
//Data	     : 06/03/2006
//Código     : Al_4
//Pendencia  :
//SOL        :
//Motivo(S)  : Implementação da trava de fechamento de renda variavel
//******************************************************************************
//Data	     :  03/10/2005
//           :  AL_3
//Função     :  Implementação do campo de observação
//******************************************************************************
//Data	     :  23/05/2005
//           :  AL_2
//Função     :  Implementação do teste de período contabil em 3 camadas
//******************************************************************************
//Data	     :  17/03/2005
//           :  AL_1
//Função     :  Ajuste para caso o usuário não escolha nenhuma contra-parte, não faz financeiro
//             Alterada a query de carteira para só mostrar as carteiras próprias (DFM)
//******************************************************************************

unit FCadOperAjusteCustoRV;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCSInv, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, fcLabel, ExtCtrls, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, TREdit, uCtrlInvContab, DBCtrls;

type
  TfrmCadOperAjusteCustoRV = class(TfrmCadastroCSInv)
    Label7: TLabel;
    qryOperacao: TwwQuery;
    dblOperacao: TwwDBLookupCombo;
    qryIDOPERACAOINVEST: TFloatField;
    qryIDCUSTODIANTE: TFloatField;
    qryIDCONTRATOIMOVEL: TFloatField;
    qryIDCORRETVALORES: TFloatField;
    qryMOECODIGO: TFloatField;
    qryIDMODULO: TFloatField;
    qryEMPRESAPROP: TFloatField;
    qryIDINVESTDEST: TFloatField;
    qryIDCARTEIRAINVEST: TFloatField;
    qryIDINVESTIMENTO: TFloatField;
    qryIDTIPOINVEST: TFloatField;
    qryIDTIPOOPERACAO: TFloatField;
    qryIDINSTFIN: TFloatField;
    qryDATAOPERACAO: TDateTimeField;
    qryNUMDOCUMENTO: TStringField;
    qryQTDEOPERACAO: TFloatField;
    qryPRECOUNITOPERACAO: TFloatField;
    qryVLROPERACAO: TFloatField;
    qryDATAVENCOPER: TDateTimeField;
    qryVLROPERACAOOM: TFloatField;
    qryIDFORCLI: TFloatField;
    qryOBSERVACAO: TStringField;
    qryIDORDMOVINV: TFloatField;
    qryIDCARTORIDEST: TFloatField;
    qryFLGCUSTODIA: TStringField;
    qryIDLOTE: TStringField;
    qryTRGDTINCLUSAO: TDateTimeField;
    qryTRGUSERINCLUSAO: TStringField;
    qryDATAAGE: TDateTimeField;
    qryDATAEX: TDateTimeField;
    qryDATACOM: TDateTimeField;
    qryINVORIGEM: TFloatField;
    qryPERCENTUAL: TFloatField;
    qryPARIDADE: TFloatField;
    qryPRZBOLSA: TDateTimeField;
    qryPRZEMPRESA: TDateTimeField;
    qryATADECISAO: TDateTimeField;
    qryFORMAPAGREC: TStringField;
    qryDIVPORACAO: TFloatField;
    qryINIPAGTO: TDateTimeField;
    qryJUROSCAP: TStringField;
    qryIDCUSTORIG: TFloatField;
    qryIDCUSTDEST: TFloatField;
    qryIDOPERACAODIREITO: TFloatField;
    qryFLGSTATUSFECHBOL: TStringField;
    qryFLGSTATUSORDMOV: TStringField;
    qryIDTERCEIRO: TFloatField;
    qryDATALIQOPER: TDateTimeField;
    qryVLRIR: TFloatField;
    qryIDOPERACAOORIGEM: TFloatField;
    qryVLRREMUNERACAO: TFloatField;
    qryVLRIRREMUNER: TFloatField;
    qryCODFINANCEIRO: TFloatField;
    qryIDPLANPREVCTBPATR: TFloatField;
    qryIDCARTEIRAGERENC: TFloatField;
    qryPUMERCADO: TFloatField;
    qryORIGDEST: TStringField;
    qryCODDOCUMENTO: TFloatField;
    qryIDOPERCUSTODIA: TFloatField;
    qryInvestimento: TwwQuery;
    dblInvestimento: TwwDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    dbDtaOperacao: TCMDateTimePicker;
    dbrVlrOperacao: TDBRealEdit;
    Label16: TLabel;
    lblBoleta: TfcLabel;
    Label3: TLabel;
    dblCarteira: TwwDBLookupCombo;
    qryCarteira: TwwQuery;
    Label4: TLabel;
    dblContraParte: TwwDBLookupCombo;
    qryContraParte: TwwQuery;
    qryAux: TwwQuery;
    qryOperacaoIDTIPOINVEST: TFloatField;
    qryOperacaoIDTIPOOPERACAO: TFloatField;
    qryOperacaoIDMERCADO: TFloatField;
    qryOperacaoCODTIPDOC: TFloatField;
    qryOperacaoDESCTIPOOPERACAO: TStringField;
    qryOperacaoNATUREZAOPERACAO: TStringField;
    qryOperacaoTIPOCUSTODIA: TStringField;
    qryOperacaoVENCIMENTO: TFloatField;
    qryOperacaoFLGGERACONTAB: TFloatField;
    qryOperacaoFLGGERACAPCAR: TFloatField;
    qryOperacaoRECPAG: TStringField;
    qryOperacaoTIPCREDOR: TStringField;
    qryOperacaoFLGGERACAF: TFloatField;
    qryOperacaoFLGTRANSF: TStringField;
    qryOperacaoTRGDTINCLUSAO: TDateTimeField;
    qryOperacaoTRGUSERINCLUSAO: TStringField;
    qryOperacaoFLGCORRET: TStringField;
    qryOperacaoFLGORDMOVINV: TStringField;
    qryOperacaoIDMOTIVOBLOQUEIO: TFloatField;
    qryOperacaoFLGOPDIREITO: TStringField;
    qryOperacaoFLGAGE: TStringField;
    qryOperacaoFLGDATAEX: TStringField;
    qryOperacaoFLGDATACOM: TStringField;
    qryOperacaoFLGINVORIGEM: TStringField;
    qryOperacaoFLGPERC: TStringField;
    qryOperacaoFLGPARIDADE: TStringField;
    qryOperacaoFLGPRZBOLSA: TStringField;
    qryOperacaoFLGPRZEMP: TStringField;
    qryOperacaoFLGATADEC: TStringField;
    qryOperacaoFLGFORMAPAGREC: TStringField;
    qryOperacaoFLGDIVACAO: TStringField;
    qryOperacaoFLGINIPAG: TStringField;
    qryOperacaoFLGJUROS: TStringField;
    qryOperacaoMOTBLOQCARTORIG: TFloatField;
    qryOperacaoMOTBLOQCARTDEST: TFloatField;
    qryOperacaoTIPSALDOCARTORIG: TStringField;
    qryOperacaoTIPSALDOCARTDEST: TStringField;
    qryOperacaoFLGTRATAIR: TStringField;
    qryOperacaoSIGLATIPOOPER: TStringField;
    qryOperacaoFLGISENTOIR: TStringField;
    qryOperacaoFLGGRAVAIRLITIGIO: TStringField;
    qryOperacaoFLGOPGERENC: TStringField;
    qryOperacaoTIPOMOVTO: TStringField;
    qryOperacaoSTAATIVO: TStringField;
    qryOperacaoFLGRENTABILIDADE: TStringField;
    qryOperacaoFLGMOVCOTA: TStringField;
    qryOperacaoFLGCONTAINVEST: TFloatField;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    qryInvestimentoIDMOEDACONTAB: TFloatField;
    qryInvestimentoIDEMISSOR: TFloatField;
    qryInvestimentoIDTIPOINVEST: TFloatField;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    qryInvestimentoFLGATIVO: TStringField;
    qryInvestimentoOBSINVESTIMENTO: TStringField;
    qryInvestimentoDESCCLASSINVEST: TStringField;
    qryInvestimentoCODISIN: TStringField;
    qryInvestimentoIDCLASSETIT: TFloatField;
    qryInvestimentoCARENCIA: TFloatField;
    qryInvestimentoTRGDTINCLUSAO: TDateTimeField;
    qryInvestimentoTRGUSERINCLUSAO: TStringField;
    qryInvestimentoSTAOPCAO: TStringField;
    qryInvestimentoIDCARTEIRASPC: TFloatField;
    qryInvestimentoFLGRFXANTIGO: TStringField;
    qryContraParteIDFORCLI: TFloatField;
    qryContraParteSGLFORCLI: TStringField;
    qryCarteiraIDCARTEIRAINVEST: TFloatField;
    qryCarteiraDESCCARTINVEST: TStringField;
    //Al_3
    dbmObservacao: TDBMemo;
    Label5: TLabel;
    //AL_7
    qryPlanoPatro: TwwQuery;
    qryPlanoPatroPLANPRVCONTABPATRO: TStringField;
    qryPlanoPatroPLANOCONTABIL: TStringField;
    qryPlanoPatroPATROCINADORA: TStringField;
    qryPlanoPatroIDPLANPREVCTBPATR: TFloatField;
    qryPlanoPatroIDPLANOPREV: TFloatField;
    qryPlanoPatroIDPATRO: TFloatField;
    dblPlanoPatro: TwwDBLookupCombo;
    Label6: TLabel;
    procedure CmeCadastroInsert(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qryBeforePost(DataSet: TDataSet);
    procedure qryAfterPost(DataSet: TDataSet);
    procedure dblOperacaoExit(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Sel(ioper:Integer);
  public
    { Public declarations }
  end;

var
  frmCadOperAjusteCustoRV: TfrmCadOperAjusteCustoRV;

implementation

uses uMensErro, UDataBase, dRendaVariavel, UOperComum, uSistema, dBaseDados,
     UBibliotecaInvest, URendaVariavel;

{$R *.DFM}

procedure TfrmCadOperAjusteCustoRV.Sel(ioper: Integer);
begin
   OperComum.LimpaParametros(qry);
   qry.ParamByName('IDOPERACAOINVEST').AsInteger := iOper;
   qry.Open;

   if not qry.IsEmpty then
   begin
      lblBoleta.Caption := qryNUMDOCUMENTO.AsString;
      // AL_1
      qryCarteira.Locate('IDCARTEIRAINVEST', qryIDCARTEIRAINVEST.AsInteger, []);
      dblCarteira.Text := qryCarteiraDESCCARTINVEST.AsString;
   end
   else
      lblBoleta.Caption := '';
end;

procedure TfrmCadOperAjusteCustoRV.bbtnConfirmarClick(Sender: TObject);
begin
   if Trim(dblOperacao.Text) = '' then
   begin
     MsgDlg('Informe o Tipo de Operação', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if dblOperacao.CanFocus then
        dblOperacao.SetFocus;
     Exit;
   end;

   //AL_7
   if Trim(dblPlanoPatro.Text) = '' then
   begin
      MsgDlg('Informe o Plano / Patrocinadora', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if dblPlanoPatro.CanFocus then
         dblPlanoPatro.SetFocus;
      Exit;
   end;

   if Trim(dblCarteira.Text) = '' then
   begin
     MsgDlg('Informe a Carteira', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if dblCarteira.CanFocus then
        dblCarteira.SetFocus;
     Exit;
   end;

   if Trim(dblInvestimento.Text) = '' then
   begin
     MsgDlg('Informe o Investimento', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if dblInvestimento.CanFocus then
        dblInvestimento.SetFocus;
     Exit;
   end;

   // AL_1
   if qryOperacaoFLGGERACAPCAR.AsInteger = 1 then
   begin
      if Trim(dblContraParte.Text) = '' then
      begin
        MsgDlg('Informe a Contra Parte', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
        if dblContraParte.CanFocus then
           dblContraParte.SetFocus;
        Exit;
      end;
   end;

   if Trim(dbDtaOperacao.Text) = '' then
   begin
     MsgDlg('Informe a Data da Operação', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if dbDtaOperacao.CanFocus then
        dbDtaOperacao.SetFocus;
     Exit;
   end;

   //AL_2
   //AL_5
   if not CtrlInvContab.TestaPeriodo(dbDtaOperacao.Text, 2) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if dbDtaOperacao.CanFocus then
         dbDtaOperacao.SetFocus;
      Exit;
   end;

   if dbrVlrOperacao.Value = 0 then
   begin
     MsgDlg('Informe o Valor da Operação', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if dbrVlrOperacao.CanFocus then
        dbrVlrOperacao.SetFocus;
     Exit;
   end;

   // Padrão comita a Operação
   inherited;

   Sel(qryIDOPERACAOINVEST.AsInteger);

end;

procedure TfrmCadOperAjusteCustoRV.qryBeforePost(DataSet: TDataSet);
var idOperacaoInvest: Integer;
begin
   lblBoleta.Caption := 'RV-' + Copy(dbDtaOperacao.Text,9,2) + '/' +
                        FormatFloat('0000', LeUltRegistro(Nil,'CONTDOCRENVAR' + Copy(dbDtaOperacao.Text,9,2)));

   with dmRendaVariavel, dmRendaVariavel.qryInsBoleta, OperComum do
   begin
      LimpaParametros(qryInsBoleta, True);
      ParamByName('IDBOLETA').AsString     := lblBoleta.Caption;
      ParamByName('STATUS').AsString       := 'P';
      ParamByName('DATABOLETA').AsDateTime := dbDtaOperacao.DateTime;
      ParamByName('TIPMOVBOLETA').AsString := 'AJC';
      ParamByName('IDFORCLI').AsInteger    := qryContraParteIDFORCLI.AsInteger;
      ExecSQL;
   end;

   idOperacaoInvest := LeUltRegistro(Nil,'OPERACAOINVEST');

   qryIDOPERACAOINVEST.AsInteger := idOperacaoInvest;
   qryIDCORRETVALORES.Clear;
   qryMOECODIGO.AsInteger        := pRPI.MOECODIGO;
   qryIDMODULO.AsInteger         := Sistema.IdModulo;
   qryEMPRESAPROP.AsInteger      := Sistema.IdEmpresa;
   qryIDCARTEIRAINVEST.AsInteger := QryCarteiraIDCARTEIRAINVEST.AsInteger;
   // AL_1
   qryIDCARTEIRAGERENC.Clear;
   qryIDTIPOINVEST.AsInteger     := 2;
   qryNUMDOCUMENTO.AsString      := lblBoleta.Caption;
   qryQTDEOPERACAO.AsFloat       := 0;
   qryPRECOUNITOPERACAO.AsFloat  := 0;
   qryDATAVENCOPER.AsDateTime    := dbDtaOperacao.DateTime;
   qryIDFORCLI.AsInteger         := qryContraParteIDFORCLI.AsInteger;
   qryIDLOTE.AsString            := '';
   qryIDCUSTODIANTE.Clear;
   qryVLRIR.AsFloat              := 0;
   qryFLGSTATUSFECHBOL.AsString  := 'F';
   qryFLGSTATUSORDMOV.AsString   := 'L';
   //AL_7
   // Atualiza no Banco para depois Poder Alimentar a Carteira e o Contábil
   inherited;
end;

procedure TfrmCadOperAjusteCustoRV.qryAfterPost(DataSet: TDataSet);
var iIdHistCartInv, iPlanilha, iPlano, iDocumento, iContraParte: Integer;
    bCriaLancto : Boolean;
    wTipoRecDesBol, wMensErro: String;
begin

   // Atualiza no Banco para depois Poder Alimentar a Carteira e o Contábil
   inherited;

   // Baixa as alterações do Padrão no Banco
   qry.ApplyUpdates;

   try
      //AL_6
      bCriaLancto := True;

      iPlanilha := -1;
      iPlano    := -1;
      iDocumento:= -1;

      // AL_1
      if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                                        qryInvestimentoIDINVESTIMENTO.AsInteger,
                                        2, qryIDOPERACAOINVEST.AsInteger ,-1,
                                        qryOperacaoIDTIPOOPERACAO.AsInteger,
                                        qryCarteiraIDCARTEIRAINVEST.AsInteger, 0,
                                        -1,-1,iPlanilha,iDocumento, iPlano,
                                        dbDtaOperacao.DateTime,
                                        dbrVlrOperacao.Value, 0,
                                        1,0,0,0,0,0,0,0,0,0,
                                        qryOperacaoNATUREZAOPERACAO.AsString ,
                                        qryOperacaoNATUREZAOPERACAO.AsString , '',
                                        qryOperacaoDESCTIPOOPERACAO.AsString + ' : ' + qryInvestimentoDESCINVESTIMENTO.AsString,
                                        'OPE', '', '', True,-1,
                                        //AL_7
                                        qryIDPLANPREVCTBPATR.AsInteger,
                                        iIdHistCartInv) Then
         raise Exception.Create('Não Foi Possivel Atualizar a Carteira');

      if not OperComum.AtualizaSaldos(1,-1) then
         raise Exception.Create('Não Foi Possivel Atualizar os Saldos');


      // AL_1
      OperComum.BuscaFlgContab(qryOperacaoIDTIPOOPERACAO.AsInteger);

      wTipoRecDesBol := '';

      // AL_1
      if qryOperacaoFLGGERACAPCAR.AsInteger = 1 then
         iContraParte := qryContraParteIDFORCLI.AsInteger
      else
         iContraParte := -1;

      OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo,2,
                              QryInvestimentoIDINVESTIMENTO.AsInteger,
                              qryOperacaoIDTIPOOPERACAO.AsInteger,-1,
                              iContraParte,
                              QryCarteiraIDCARTEIRAINVEST.AsInteger,
                              pRPI.MOECODIGO, '','','','','',
                              wTipoRecDesBol, bCriaLancto,
                              //AL_6
                              dbrVlrOperacao.Value,
                              dbrVlrOperacao.Value,
                              dbDtaOperacao.DateTime, dbDtaOperacao.DateTime,
                              iPlano, iPlanilha, iDocumento, wMensErro,
                              //AL_7
                              '', True, True, 0, True, qryIDPLANPREVCTBPATR.AsInteger);
      if Trim(wMensErro) <> '' then
         Raise Exception.Create('Ocorreu um problema ao Contabilizar o Valor da Operação');

      // Grava Planilha e Documento na Boleta
      try
         if (iPlanilha > 0) or (iDocumento > 0) then
         begin
            OperComum.LimpaParametros(DMRendaVariavel.qryUpdBoleta);
            DMRendaVariavel.qryUpdBoleta.ParamByName('IDBOLETA').AsString := lblBoleta.Caption;
            DMRendaVariavel.qryUpdBoleta.ParamByName('STATUS').AsString   := 'F';

            if iPlanilha > 0 then
            begin
               DMRendaVariavel.qryUpdBoleta.ParamByName('PLANO').AsInteger     := iPlano;
               DMRendaVariavel.qryUpdBoleta.ParamByName('PLNCODIGO').AsInteger := iPlanilha;
            end;

            if iDocumento > 0 then
               DMRendaVariavel.qryUpdBoleta.ParamByName('CODDOCUMENTO').AsInteger := iDocumento;

            DMRendaVariavel.qryUpdBoleta.ExecSQL;
         end;
      except
         Raise Exception.Create('Não foi possível atualizar a Boleta');
      end;

      //AL_7      
      // Marca o papel para Reprocessamento
      if dbDtaOperacao.DateTime <= pRPI.DATAULTFECH then
         RendaVariavel.MarcarFlagReproc(QryInvestimentoIDINVESTIMENTO.AsInteger,-1,
                                        qryIDPLANPREVCTBPATR.AsInteger, dbDtaOperacao.DateTime);
   except
      on E: Exception do
      begin
         MsgDlg('Ocorreu o seguinte problema na operação:' + #13 + E.Message,'Mensagem do Sistema ',mtWarning,[mbOK],0);
      end;
   end;
end;

procedure TfrmCadOperAjusteCustoRV.CmeCadastroInsert(Sender: TObject);
begin
  CmeCadastro.RepetirInsert := False;
  inherited;
end;

procedure TfrmCadOperAjusteCustoRV.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadOperAjusteCustoRV.sbtnInserirClick(Sender: TObject);
begin
   inherited;
   if dblOperacao.CanFocus then
      dblOperacao.SetFocus;
end;

procedure TfrmCadOperAjusteCustoRV.sbtnAlterarClick(Sender: TObject);
begin
   inherited;
   if dblOperacao.CanFocus then
      dblOperacao.SetFocus;
end;

procedure TfrmCadOperAjusteCustoRV.sbtnApagarClick(Sender: TObject);
var iOper: Integer;
begin
//   inherited;
   try // Finally
      iOper := qryIDOPERACAOINVEST.AsInteger;

      // AL_4
      if RendaVariavel.VerEmAbertura then
         Exit;

      //AL_5
      if not CtrlInvContab.TestaPeriodo(dbDtaOperacao.Text, 2) then
      begin
         MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
         Exit;
      end;

      try
         if not dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.StartTransaction;
         if (MsgDlg('Deseja realmente excluir esta Operação?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
         begin
            if not RendaVariavel.ExcluiBoleta(lblBoleta.Caption, True) then
               Raise Exception.Create('Não é possível fazer a Exclusão dessa Operação.');

            DtmBaseDados.dbBaseDados.Commit;
            MsgDlg('Operação excluída com sucesso.','Mensagem do Sistema', mtInformation,[MbOk],0);
         end
         else
         begin
            dtmBaseDados.dbBaseDados.Rollback;
            Sel(iOper);  // Posiciona no mesmo registro
         end;
      except
         on E: Exception do
         begin
            dtmBaseDados.dbBaseDados.Rollback;
            MsgDlg(E.Message, 'Mensagem do Sistema ', mtWarning,[mbOK],0);
            Sel(iOper);  // Posiciona no mesmo registro
         end;
      end;
   finally
      Sel(iOper);
      CmeCadastro.AtualizaBotoes(Self);
   end;
end;

procedure TfrmCadOperAjusteCustoRV.FormShow(Sender: TObject);
begin
   inherited;
   Sel(-1);
end;

procedure TfrmCadOperAjusteCustoRV.dblOperacaoExit(Sender: TObject);
begin
   inherited;
   dblContraParte.Enabled := qryOperacaoFLGGERACAPCAR.AsInteger = 1;
end;

procedure TfrmCadOperAjusteCustoRV.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   lblBoleta.Caption := '';
end;

end.
