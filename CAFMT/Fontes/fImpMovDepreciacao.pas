unit fImpMovDepreciacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc, DBTables,
  Wwquery,uAutorizacao,uSistema, Gauges, wwdbdatetimepicker,
  CMDateTimePicker, DBClient, Provider;

type
  TfrmMovDepreciacao = class(TfrmOkCancelar)
    Panel1: TPanel;
    Data: TLabel;
    EData: TCMDateTimePicker;
    qryGrupoBem: TwwQuery;
    qryGrupoBemIDPESSOA: TFloatField;
    qryGrupoBemIDBEM: TFloatField;
    qryGrupoBemIDGRUPO: TFloatField;
    qryGrupoBemFLGIMOVEL: TFloatField;
    qryParamCaf: TwwQuery;
    qryParamCafNUMDIASANO: TFloatField;
    qryParamCafIDPESSOA: TFloatField;
    qryParamCafMOEDAOFICIAL: TFloatField;
    qryParamCafMOEDAGERENCIAL: TFloatField;
    qryParamCafMOEDAFISCAL: TFloatField;
    qryParamCafFLGCALCCM: TFloatField;
    qryParamCafFLGTIPOCALC: TStringField;
    qryParamCafSISTEMAS: TStringField;
    qryParamCafINTEGRACONTAB: TStringField;
    qryParamGlob: TwwQuery;
    qryParamGlobUNIDNEGOC: TFloatField;
    qryReavaliacoes: TwwQuery;
    updReavaliacoes: TUpdateSQL;
    qryAcrescimos: TwwQuery;
    updAcrescimos: TUpdateSQL;
    qryInsHistorico: TwwQuery;
    QryCCrd: TwwQuery;
    qryCotacao: TwwQuery;
    qryCotacaoMOECODIGO: TFloatField;
    qryCotacaoCOTDATA: TDateTimeField;
    qryCotacaoINDICEBASE: TFloatField;
    qryCotacaoCOTVALOR: TFloatField;
    qryCotacaoCOTMESREF: TStringField;
    qryUpdGrupo: TwwQuery;
    updGrupo: TUpdateSQL;
    qryAuxContab: TwwQuery;
    qryAuxContabLACNUMDOC: TStringField;
    qryAuxContabLACDEBCRE: TStringField;
    qryAuxContabLACHIST1: TStringField;
    qryAuxContabLACHIST2: TStringField;
    qryAuxContabLACHIST3: TStringField;
    qryAuxContabLACHIST4: TStringField;
    qryAuxContabLACHIST5: TStringField;
    qryAuxContabCODCENTROCUSTO: TStringField;
    qryAuxContabUNIDNEGOC: TFloatField;
    qryAuxContabPLACONTA: TStringField;
    qryAuxContabLACVALOR: TFloatField;
    qryAuxContabLACVALOFICIAL: TFloatField;
    qryAuxContabLACVALGERENCIAL: TFloatField;
    qryAuxContabPLANO: TFloatField;
    qrySubConta: TwwQuery;
    qrySubContaNOMESUBCONTA: TStringField;
    qrySubContaCODSUBCONTA: TFloatField;
    qrySubContaIDPESSOA: TFloatField;
    updAuxContab: TUpdateSQL;
    qryGrupo: TwwQuery;
    qryAux: TwwQuery;
    qryContasxCc: TwwQuery;
    qryContasxCcCODCENTROCUSTO: TStringField;
    qryHistCtb: TwwQuery;
    qryMoeda: TwwQuery;
    qryTemp: TwwQuery;
    qryUltDeprec: TwwQuery;
    qryParamCafATIVPROJETO: TFloatField;
    qryAuxContabCODSUBCONTA: TFloatField;
    QryCCrdCODCENTROCUSTO: TStringField;
    QryCCrdNOME: TStringField;
    QryCCrdTIPO: TStringField;
    QryCCrdPARTICIPACAO: TFloatField;
    QryCCrdIDCONJUNTO: TFloatField;
    qryPlanoConta: TwwQuery;
    qryPlanoContaPLATIPCONVGER: TStringField;
    qryPlanoContaPLATIPCONVOFICIAL: TStringField;
    qryPlanoContaPLANO: TFloatField;
    qryPlanoContaPLACCUST: TStringField;
    pnlStatus: TPanel;
    lblStatus: TLabel;
    pnlprgBar: TPanel;
    prgBar: TGauge;
    qryUpdGrupoIDGRUPO: TFloatField;
    qryUpdGrupoMOECODIGO: TFloatField;
    qryUpdGrupoNOME: TStringField;
    qryUpdGrupoTIPO: TStringField;
    qryUpdGrupoSTATUS: TStringField;
    qryUpdGrupoVALALUGUEL: TFloatField;
    qryUpdGrupoDEPRECIACAO: TFloatField;
    qryUpdGrupoCLASSE: TStringField;
    qryUpdGrupoDATAULTDEP: TDateTimeField;
    qryUpdGrupoDATARECALCDEP: TDateTimeField;
    qryUpdGrupoULTIDBEM: TFloatField;
    qryUpdGrupoFLGIMOVEL: TFloatField;
    qryGrupoIDPESSOA: TFloatField;
    qryGrupoIDGRUPO: TFloatField;
    qryGrupoMOECODIGO: TFloatField;
    qryGrupoNOME: TStringField;
    qryGrupoTIPO: TStringField;
    qryGrupoSTATUS: TStringField;
    qryGrupoVALALUGUEL: TFloatField;
    qryGrupoDEPRECIACAO: TFloatField;
    qryGrupoCLASSE: TStringField;
    qryGrupoDATAULTDEP: TDateTimeField;
    qryGrupoDATARECALCDEP: TDateTimeField;
    qryGrupoULTIDBEM: TFloatField;
    qryGrupoFLGIMOVEL: TFloatField;
    qry: TwwQuery;
    qryVALOROPERACAO: TFloatField;
    qryIDPESSOA: TFloatField;
    qryDATAMOVIMENTACAO: TDateTimeField;
    qryIDIMOVEL: TFloatField;
    qryIDCARTEIRAINVEST: TFloatField;
    qryAlteraBem: TwwQuery;
    qryBem: TwwQuery;
    qryVerUltDep: TwwQuery;
    qryCtaCtbDep: TwwQuery;
    qryCtaCtbDepIDGRUPO: TFloatField;
    qryCtaCtbDepIDTIPOMOVIMENTACAO: TFloatField;
    qryCtaCtbDepPLANO: TFloatField;
    qryCtaCtbDepPLACONTA: TStringField;
    qryCtaCtbDepTIPOLANCAMENTO: TStringField;
    qryBemIDBEM: TFloatField;
    qryBemIDPESSOA: TFloatField;
    qryBemVALORG: TFloatField;
    qryBemVALFIS: TFloatField;
    qryBemDEPFIS: TFloatField;
    qryBemBAIXATOTAL: TStringField;
    qryBemUNIDNEGOC: TFloatField;
    qryBemDEPLANC: TFloatField;
    qryBemCMDEP: TFloatField;
    qryBemCMBEM: TFloatField;
    qryBemTAXADEP: TFloatField;
    qryBemDTAINCLUSAO: TDateTimeField;
    qryBemFLGDEPREC: TFloatField;
    qryBemDATAULTDEP: TDateTimeField;
    qryBemIDGRUPO: TFloatField;
    qryBemDESBEM: TStringField;
    qryBemIDCONJUNTO: TFloatField;
    qryBemDATAINICIODEP: TDateTimeField;
    qryBemDATARECALCDEP: TDateTimeField;
    qryBemCODSUBCONTA: TFloatField;
    qryBemVALCTB: TFloatField;
    qryReavaliacoesIDBEM: TFloatField;
    qryReavaliacoesIDPESSOA: TFloatField;
    qryReavaliacoesVALORG: TFloatField;
    qryReavaliacoesCMBEM: TFloatField;
    qryReavaliacoesDEPLANC: TFloatField;
    qryReavaliacoesCMDEP: TFloatField;
    qryReavaliacoesDATAREAVALIACAO: TDateTimeField;
    qryReavaliacoesDATAULTDEP: TDateTimeField;
    qryReavaliacoesIDREAVALIACAO: TFloatField;
    qryReavaliacoesIDMOVIMENTACAO: TFloatField;
    qryReavaliacoesDEPGER: TFloatField;
    qryReavaliacoesDEPFIS: TFloatField;
    qryReavaliacoesVALFIS: TFloatField;
    qryReavaliacoesVALGER: TFloatField;
    qryReavaliacoesFLGDEPREC: TFloatField;
    qryReavaliacoesTAXADEP: TFloatField;
    qryReavaliacoesIDGRUPO: TFloatField;
    qryReavaliacoesDESBEM: TStringField;
    qryReavaliacoesDATAINICIODEP: TDateTimeField;
    qryReavaliacoesIDCONJUNTO: TFloatField;
    qryReavaliacoesUNIDNEGOC: TFloatField;
    qryReavaliacoesCODSUBCONTA: TFloatField;
    qryAcrescimosIDBEM: TFloatField;
    qryAcrescimosIDPESSOA: TFloatField;
    qryAcrescimosVALORG: TFloatField;
    qryAcrescimosCMBEM: TFloatField;
    qryAcrescimosDEPLANC: TFloatField;
    qryAcrescimosCMDEP: TFloatField;
    qryAcrescimosDATAACRESCIMO: TDateTimeField;
    qryAcrescimosDATAULTDEP: TDateTimeField;
    qryAcrescimosTAXADEP: TFloatField;
    qryAcrescimosIDACRESCIMO: TFloatField;
    qryAcrescimosIDMOVIMENTACAO: TFloatField;
    qryAcrescimosDEPGER: TFloatField;
    qryAcrescimosDEPFIS: TFloatField;
    qryAcrescimosVALFIS: TFloatField;
    qryAcrescimosVALGER: TFloatField;
    qryAcrescimosFLGDEPREC: TFloatField;
    qryAcrescimosUNIDNEGOC: TFloatField;
    qryAcrescimosCODSUBCONTA: TFloatField;
    qryAcrescimosIDGRUPO: TFloatField;
    qryAcrescimosDESBEM: TStringField;
    qryAcrescimosDATAINICIODEP: TDateTimeField;
    qryAcrescimosIDCONJUNTO: TFloatField;
    qryReavaliacoesPLACA: TFloatField;
    qryAcrescimosPLACA: TFloatField;
    qryAuxContabIDPLANOPREV: TFloatField;
    qryAuxContabIDPATRO: TFloatField;
    qryVerUltDepDATAMOVIMENTACAO: TDateTimeField;
    qryBemPLACA: TFloatField;
    qryReavaliacoesFLGULTREAVAL: TFloatField;
    dspBem: TDataSetProvider;
    cdsBem: TClientDataSet;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EDataExit(Sender: TObject);
    Procedure Confirma_Atualizacao;
    Procedure Cancela_Atualizacao;
    Procedure FormCreate(Sender: TObject);
    //Procedure Atualiza_Carteira(var bErro : Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    bErro            : boolean;            // verifica se há erro
    bErroDeprec      : boolean;            // verifica se há erro na depreciação
    bErroAtualizacao : boolean;            // verifica se há erro na finalizacao
    bIntegraContab   : boolean;            // verifica se há integração com a contabilidade
    resultperiodo,exercicio,periodo,empresa : integer;
    planilha    : longint;
    Pln         : longint;
    CodConjunto : integer;
    CodBem      : integer;
    sMascara    : String;
    bTestaConta : Boolean;
    fCotGerencial, fCotFiscal : Extended;
    sMensagem : string;
    dDataUltDepAnt : tDateTime;
    iGrupoDeprec, iPlanoConta : Integer;
    iGrupoDepIni, iGrupoDepFim : Integer;
    aCtaCtbDep    : array [1..1500, 1..5] of Extended;
    iMaxCtaCtbDep : Integer;
    //------------------------------------------------------------------------------------
    Function Calcula_Ultima_Depreciacao(dDataMov : tDateTime; Var dDataUlt : tDateTime) : Boolean;
    Procedure Calcula_Depreciacao_Bem(var bErro:boolean);
    procedure ParamCorrecao(Var fCorrecao : Extended);
    Procedure ParamFatorPeriodo(var rFator,rTotDiaAno,rTotDia : Extended;
                                sDataUltDep : string);
    Procedure LocalizaContasContabCorrMonetaria(
                                              var iPlanoConta : Integer;
                                              var debito,credito,sCCDebito,sCCCredito: string;
                                              var bErro:boolean; Tipo:Char; iGrupo : Integer);
    Procedure MontaRateioCorrMonetaria(iPlanoConta : Integer;
                                       debito,credito,sCCDebito,sCCCredito,sAtivProjeto,
                                       sDesBem,sIdBem : string; fPlaca : Extended;
                                       ValOfi : Extended;
                                       Var bErro : Boolean;
                                       iGrupo,iConjunto : Integer);
    Procedure RegistraCorrMonetaria(DtaFimD: string;
                                    rCmBem,rCmBem1,rCmBem2 : Extended;
                                    sIdBem,sCodCM:string);
    Procedure LocalizaContasContabDepreciacao(var iPlanoConta : Integer;
                                      var debito,debitocm,credito,creditocm,sCCDebito,
                                          sCCDebitocm,sCCCredito,sCCCreditocm :string;
                                      var bErro : Boolean; Tipo : Char; iGrupo : Integer;
                                          fCorrecao : Extended);
    Procedure MontaRateioDepreciacao(iPlanoConta : integer;
                                    Debito,DebitoCm,Credito,CreditoCm,sCCDebito,
                                    sCCDebitocm,sCCCredito,sCCCreditoCm,sAtivProjeto,
                                    sDesbem,sIdBem : string; fPlaca : Extended;
                                    DepTotalO,DepTotalF,DepTotalG,CorrDep : Extended;
                                    Var bErro : boolean; iGrupo,iConjunto,iSubConta : integer);
    Procedure RegistraDepreciacao(DtaFimD: string;
                                  DepTotalF,DepTotalG,DepTotalO,CorrDep : Extended;
                                  sIdBem,sCodDep,sCodCMDep:string);
    Procedure Localiza_ContaeCentroCusto(iGrupo, iMovimentacao: integer;
                                         sDebCred : string;
                                         iPlano : integer;
                                         var sPlaConta : string;
                                         var sCCusto : string);
    Procedure Monta_Contabilidade(sDebCred,Histor,Histor1,Histor2,
                                  Histor3,Histor4,Cc,sAtivProjeto,
                                  sContaCred,sContaDeb,sNumDoc : string;
                                  ValLanc,ValF,ValG : Extended;
                                  iGrupo,iPlano,iSubConta : Integer;
                                  sObrigaCC,sNomeConta,sObrigaSubConta : String;
                                  iBem,iPessoa : Integer;fPlaca : Extended;
                                  Var bErro : Boolean);
    Procedure Tot_Contabilidade(Exercicio,Periodo : Integer);
    Procedure Busca_Grupo(iGrupo : Integer; var sGrupo : string);
    Procedure LancaContabilidade(sDebCred, Histor,Histor1,Histor2,Histor3,Histor4,
                                 Cc, sSubConta, sAtivProjeto, sContaCred,sContaDeb,
                                 sIdBem : string;
                                 Exercicio,Periodo : integer;
                                 ValLanc,ValF,ValG : Extended;
                                 iPlano : integer);
    Procedure Monta_qryPlanoConta(iPlano : Integer;
                                  sConta : String;
                                  Var sPlaCCust : String);
    Function Testa_Periodo_Contabil(sData: string) : boolean;
    Procedure Atualiza_Depreciacao;
    Procedure Cancela_Depreciacao;
    Procedure Tot_HistoricoMovimentacao(iIdTipoMov, iPlanilha : Integer);
    Procedure Calcula_Depreciacao_Reav(Var bErro:boolean);
    Procedure Atualiza_Depreciacao_Reav;
    Procedure Cancela_Depreciacao_Reav;
    Procedure Calcula_Depreciacao_Acresc(var bErro:boolean);
    Procedure Atualiza_Depreciacao_Acresc;
    Procedure Cancela_Depreciacao_Acresc;
    procedure Calcula_Moedas(fValOfi : Extended; dData : tDateTime; Var fValFis, fValGer : Extended);
    Procedure Verifica_Cotacao_Moeda(dData : tDateTime; sMoeda : string);
  end;

var
  frmMovDepreciacao: TfrmMovDepreciacao;

implementation

uses dBaseDados, uLancContab, uDatabase, uMensErro, uIntegraBack, uDiasUteis, uAtivoFixo,
     dAtivoFixo, uFuncaoGeral;

{$R *.DFM}

procedure TfrmMovDepreciacao.FormCreate(Sender: TObject);
Var
   iAnoFim, iMesFim, iDiaFim,
   iAno, iMes, iDia           : Word;

begin
   inherited;
   DecodeDate((date() - 30), iAno, iMes, iDia);
   DecodeDate(DiasUteis.UltDiaMes(iAno, iMes), iAnoFim, iMesFim, iDiaFim);
   eData.Date := EncodeDate(iAnoFim, iMesFim, iDiaFim);
   //-------------------------------------------------------------------------------------
   if qryParamCaf.Active then qryParamCaf.Close; 
   qryParamCaf.ParamByName('IDPESSOA').asInteger := Sistema.IdEmpresa;
   qryParamCaf.Prepare;
   qryParamGlob.ParamByName('IDPESSOA').asInteger := Sistema.IdEmpresa;
   qryParamGlob.Prepare;
   //-------------------------------------------------------------------------------------
   qryReavaliacoes.Prepare;
   qryVerUltDep.Prepare;
   qryAlteraBem.Prepare;
   qryGrupoBem.Prepare;
   qryHistCtb.Prepare;
   qryCotacao.Prepare;
   //qryConta.Prepare;
   qryGrupo.Prepare;
   qryUpdGrupo.Prepare;
   qryPlanoConta.Prepare;
   qryCCrd.Prepare;
   qryAuxContab.Prepare;
   qryInsHistorico.Prepare;
   qryContasxCc.Prepare;
   qryParamGlob.Open;
   qryParamCaf.Open;
   //-------------------------------------------------------------------------------------
   if (Sistema.IdModulo = 7) then
   begin
      if copy(qryParamCafSISTEMAS.AsString, 4, 1) <> '1' then
      begin
         iGrupoDeprec := 2;
      end else
      begin
         iGrupoDeprec := 0;
      end;
   end else
   begin
     iGrupoDeprec := 1;
   end;
   //-------------------------------------------------------------------------------------
   // Captura o Plano de Contas Vigente
   //-------------------------------------------------------------------------------------
   with dtmAtivoFixo.qryParamCaf do
   begin
      Close;
      ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      Open;
      iPlanoConta := FieldByName('PLANOVIGENTE').AsInteger;
   end;
   //-------------------------------------------------------------------------------------
   bIntegraContab := qryParamCafINTEGRACONTAB.AsString = 'S';
   //-------------------------------------------------------------------------------------
   qryCtaCtbDep.Close;
   qryCtaCtbDep.ParamByName('PLANO').AsInteger := iPlanoConta;
   qryCtaCtbDep.Open;
   iMaxCtaCtbDep := 0;
   while not qryCtaCtbDep.EOF do
   begin
      iMaxCtaCtbDep := iMaxCtaCtbDep + 1;
      //----------------------------------------------------------------------------------
      aCtaCtbDep[iMaxCtaCtbDep,1] := qryCtaCtbDepIDGRUPO.AsFloat;
      aCtaCtbDep[iMaxCtaCtbDep,2] := qryCtaCtbDepIDTIPOMOVIMENTACAO.AsFloat;
      aCtaCtbDep[iMaxCtaCtbDep,3] := qryCtaCtbDepPLANO.AsFloat;
      if (qryCtaCtbDepTIPOLANCAMENTO.AsString = 'D') then
         aCtaCtbDep[iMaxCtaCtbDep,4] := 0
      else
         aCtaCtbDep[iMaxCtaCtbDep,4] := 1;
      aCtaCtbDep[iMaxCtaCtbDep,5] := qryCtaCtbDepPLACONTA.AsFloat;
      //----------------------------------------------------------------------------------
      qryCtaCtbDep.Next;
   end;
end;
//========================================================================================
procedure TfrmMovDepreciacao.bbtnConfirmarClick(Sender: TObject);
var
   bErro        : Boolean;
   dDataUltDep  : tDateTime;

begin
   inherited;
   //-------------------------------------------------------------------------------------
   if (eData.Text = '') then
   begin
      MsgDlg('Data da Depreciação não pode estar vazia! ','Erro',mtError,[mbOk],0);
      eData.SetFocus;
      bErro := True;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   pln      := 0;
   planilha := 0;
   //-------------------------------------------------------------------------------------
   qryAuxContab.Close;
   qryAuxContab.Open;
   //-------------------------------------------------------------------------------------
   if bIntegraContab then
     if not Testa_Periodo_Contabil(eData.text) then
     begin
        bErro := True;
        exit;
     end;
   //-------------------------------------------------------------------------------------
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
      dtmBaseDados.dbBaseDados.StartTransaction;
   //-------------------------------------------------------------------------------------
   bErro       := False;
   bErroDeprec := False;
   dDataUltDep := eData.Date;
   pnlStatus.Visible := True;
   lblStatus.Caption := 'Verificando Ultima Depreciação ...';
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   Screen.Cursor := crSQLWait;
   bbtnConfirmar.Enabled := False;
   bbtnSair.Enabled      := False;
   if Calcula_Ultima_Depreciacao(eData.Date,dDataUltDep) then
   begin
      if not bErro then Calcula_Depreciacao_Bem(bErro);
      if not bErro then Calcula_Depreciacao_Reav(bErro);
      if not bErro then Calcula_Depreciacao_Acresc(bErro);
      //if not bErro then Atualiza_Carteira(bErro);
   end else
   begin
      MsgDlg('Data Anterior a Ultima Depreciação Realizada ! ' + DatetoStr(dDataUltDep),
             'Erro', mtError, [mbOk], 0);
      bErro       := True;
      bErroDeprec := True;
   end;
   pnlStatus.Visible := False;
   Screen.Cursor := crDefault;
   //-------------------------------------------------------------------------------------
   try
      if not bErro then
      begin
         if dtmBaseDados.dbBaseDados.InTransaction then
         begin
            bErroAtualizacao := False;
            Confirma_Atualizacao;
            if not bErroAtualizacao then
            begin
               dtmBaseDados.dbBaseDados.Commit;
               MsgDlg('Operação realizada!','Informação',mtInformation,[mbOk],0);
            end else
            begin
               dtmBaseDados.dbBaseDados.RollBack;
               MsgDlg('Operação não realizada!','Erro',mtError,[mbOk],0);
            end;
         end;
      end else
         if not bErroDeprec then
            if dtmBaseDados.dbBaseDados.InTransaction then
            begin
               //Cancela_Atualizacao;
               dtmBaseDados.dbBaseDados.RollBack;
               MsgDlg('Operação não realizada!','Erro',mtError,[mbOk],0);
            end;
   except
      Cancela_Atualizacao;
      if dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.RollBack;
      MsgDlg('Operação não realizada !','Erro',mtError,[mbOk],0);
   end;
   bbtnConfirmar.Enabled := True;
   bbtnSair.Enabled      := True;
end;
//========================================================================================
Procedure TfrmMovDepreciacao.Confirma_Atualizacao;
begin
   if not bErroAtualizacao then Atualiza_Depreciacao;
   if not bErroAtualizacao then Atualiza_Depreciacao_Reav;
   if not bErroAtualizacao then Atualiza_Depreciacao_Acresc;
end;
//========================================================================================
Procedure TfrmMovDepreciacao.Cancela_Atualizacao;
begin
   Cancela_Depreciacao;
   Cancela_Depreciacao_Reav;
   Cancela_Depreciacao_Acresc;
end;
//========================================================================================
Procedure TfrmMovDepreciacao.ParamFatorPeriodo(var rFator,rTotDiaAno,rTotDia : Extended;
                                               sDataUltDep : string);
var
   iMesIni,iAnoIni,iDiaIni,
   iMesFim,iAnoFim,iDiaFim,
   iDia,iMes,iAno,iNDias      : Word;
   sAnoIni,sAnoFim            : string;
   dDataInit                  : tDate;
   iMesInit,iAnoInit,iDiaInit : Word;

begin
   DecodeDate(strtodate(sDataUltDep), iAnoIni, iMesIni, iDiaIni);
   DecodeDate(strtodate(eData.Text) , iAnoFim, iMesFim, iDiaFim);
   //-------------------------------------------------------------------------------------
   // Calculo Anual
   //-------------------------------------------------------------------------------------
   if qryParamCAF.FieldByName('FLGTIPOCALC').AsString = 'A' then
   begin
      sAnoIni    := '01/01/' + inttostr(iAnoIni);
      sAnoFim    := '31/12/' + inttostr(iAnoIni);
      rTotDia    := (strtodate(eData.Text) - strtodate(sDataUltDep)) + 1;
      rTotDiaAno := (strtodate(sAnoFim) - strtodate(sAnoIni)) + 1;
      rFator     := (rTotDia / rTotDiaAno);
   end else
   //-------------------------------------------------------------------------------------
   // Calculo Mensal
   //-------------------------------------------------------------------------------------
   if qryParamCaf.FieldByName('FLGTIPOCALC').AsString = 'M' then
   begin
      iNDias := round((strtodate(eData.Text) - strtodate(sDataUltDep)) + 1);
      //----------------------------------------------------------------------------------
      if iMesIni = iMesFim then
      begin
         DecodeDate(DiasUteis.UltDiaMes(iAnoFim,iMesFim),iAno,iMes,iDia);
         rFator := (1 / 12) * (iNDias / iDia);
      end else
      //----------------------------------------------------------------------------------
      begin
         dDataInit := (eData.Date - 32);
         DecodeDate(dDataInit,iAnoInit,iMesInit,iDiaInit);
         DecodeDate(DiasUteis.UltDiaMes(iAnoInit,iMesInit),iAnoInit,iMesInit,iDiaInit);
         dDataInit := EncodeDate(iAnoInit,iMesInit,iDiaInit);
         //-------------------------------------------------------------------------------
         if dDataInit = strtodate(sDataUltDep) then
            rFator := (1 / 12)
         else
            rFator := (1 / 12) * (iNDias / 30.44);
      end;
   end else
   //-------------------------------------------------------------------------------------
   // Calculo Diário
   //-------------------------------------------------------------------------------------
   begin
      iNDias := round((strtodate(eData.Text) - strtodate(sDataUltDep)) + 1);
      DecodeDate(DiasUteis.UltDiaMes(iAnoFim, iMesFim), iAno, iMes, iDia);
      rFator := (1 / 12 / iDia) * iNDias;
   end;
end;
//========================================================================================
// Verifica a Ultima Depreciacao Realizada
//----------------------------------------------------------------------------------------
Function TfrmMovDepreciacao.Calcula_Ultima_Depreciacao(dDataMov : tDateTime; Var dDataUlt : tDateTime) : Boolean;
begin
   case iGrupoDeprec of
      0 : begin
             iGrupoDepIni := 0;
             iGrupoDepFim := 0;
          end;
      1 : begin
             iGrupoDepIni := 1;
             iGrupoDepFim := 1;
          end;
      2 : begin
             iGrupoDepIni := 0;
             iGrupoDepFim := 1;
          end;
      else
          begin
             iGrupoDepIni := 2;
             iGrupoDepFim := 2;
          end;
   end;
   //-------------------------------------------------------------------------------------
   qryVerUltDep.Close;
   qryVerUltDep.ParamByName('PIDPESSOA').AsInteger     := Sistema.IdEmpresa;
   qryVerUltDep.ParamByName('PFLGIMOVELINI').AsInteger := iGrupoDepIni;
   qryVerUltDep.ParamByName('PFLGIMOVELFIM').AsInteger := iGrupoDepFim;
   qryVerUltDep.ParamByName('PDATAMOV').AsDateTime     := dDataMov;
   qryVerUltDep.Open;
   //-------------------------------------------------------------------------------------
   Result := qryVerUltDep.IsEmpty;
   if qryVerUltDep.IsEmpty then
      dDataUlt := dDataMov
   else begin
      qryVerUltDep.Last;
      dDataUlt := qryVerUltDepDATAMOVIMENTACAO.AsDateTime;
   end;
end;
//========================================================================================
// Cálculo da Depreciação e da Correção Monetária do Bem
//========================================================================================
Procedure TfrmMovDepreciacao.Calcula_Depreciacao_Bem(var bErro:boolean);
var
   sDataUltDep,
   Debito,DebitoCm,Credito,CreditoCm,
   sCCDebito,sCCDebitoCm,sCCCredito,sCCCreditoCm,
   sAtivProjeto                                  : String;
   dDataInicioDep                                : tDateTime;
   rTaxa,rFator,rTotDiaAno,rTotDia,
   fCorrecao,
   fDepLanc,DepTotalF,DepTotalG,fCmDep,fCmBem,
   fValCmBem, fValDepLanc, fValCmDep             : Extended;
   iFlgDeprec                                    : Integer;

begin
   DepTotalF := 0;
   DepTotalG := 0;
   //-------------------------------------------------------------------------------------
   // Define qual o grupo de bens que será depreciado
   //-------------------------------------------------------------------------------------
   case iGrupoDeprec of
      0 : begin
             iGrupoDepIni := 0;
             iGrupoDepFim := 0;
          end;
      1 : begin
             iGrupoDepIni := 1;
             iGrupoDepFim := 1;
          end;
      2 : begin
             iGrupoDepIni := 0;
             iGrupoDepFim := 1;
          end;
      else
          begin
             iGrupoDepIni := 2;
             iGrupoDepFim := 2;
          end;
   end;
   //-------------------------------------------------------------------------------------
   // Retorna a Correção do Período
   //-------------------------------------------------------------------------------------
   ParamCorrecao(fCorrecao);
   //-------------------------------------------------------------------------------------
   qryUpdGrupo.Close;
   qryUpdGrupo.ParamByName('PIDPESSOA').asInteger := Sistema.IdEmpresa;
   qryUpdGrupo.Open;
   //-------------------------------------------------------------------------------------
   lblStatus.Caption := 'Preparando ...';
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   cdsBem.Close;
   cdsBem.Params[0].AsInteger  := Sistema.IdEmpresa;
   cdsBem.Params[1].AsInteger  := iGrupoDepIni;
   cdsBem.Params[2].AsInteger  := iGrupoDepFim;
   cdsBem.Params[3].AsDateTime := eData.Date;
   cdsBem.Open;
   //-------------------------------------------------------------------------------------
   if not dtmAtivoFixo.sprSaldoContabBem.Prepared then
      dtmAtivoFixo.sprSaldoContabBem.Prepare;
   //-------------------------------------------------------------------------------------
   case iGrupoDeprec of
      0 : lblStatus.Caption := 'Depreciação - '+ inttostr(cdsBem.RecordCount) +' Bens não Imóveis ';
      1 : lblStatus.Caption := 'Depreciação - '+ inttostr(cdsBem.RecordCount) +' Bens Imóveis';
   else
      lblStatus.Caption := 'Depreciação - '+ inttostr(cdsBem.RecordCount) +' Bens';
   end;
   prgBar.MaxValue := cdsBem.RecordCount;
   prgBar.Progress := 0;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   try
      while not cdsBem.EOF do
      begin
         prgBar.Progress := prgBar.Progress + 1;
         Application.ProcessMessages;
         //----------------------------------------------------------------------------
         // Integração Contábil
         //----------------------------------------------------------------------------
         if bIntegraContab then
            if cdsBem.FieldByName('UNIDNEGOC').IsNull then
            begin
               with dtmAtivoFixo.qryParamCaf do
               begin
                  Close;
                  ParamByName('PIDPESSOA').asInteger := Sistema.IdEmpresa;
                  Open;
                  if not IsEmpty then
                     sAtivProjeto := FieldByName('ATIVPROJETO').AsString
                  else
                     sAtivProjeto := '';
               end;
            end else
            begin
               sAtivProjeto := cdsBem.FieldByName('UNIDNEGOC').AsString;
            end;
         //-------------------------------------------------------------------------------
         // Atualiza Parametros
         //-------------------------------------------------------------------------------
         if cdsBem.FieldByName('DATAINICIODEP').IsNull then
            dDataInicioDep := cdsBem.FieldByName('DTAINCLUSAO').AsDateTime
         else
            dDataInicioDep := cdsBem.FieldByName('DATAINICIODEP').AsDateTime;
         //-------------------------------------------------------------------------------
         if cdsBem.FieldByName('DATAULTDEP').IsNull then
         begin
            sDataUltDep := datetostr(dDataInicioDep);
         end else
         begin
            if cdsBem.FieldByName('DATAULTDEP').AsDateTime > dDataInicioDep then
               sDataUltDep := cdsBem.FieldByName('DATAULTDEP').AsString
            else
               sDataUltDep := datetostr(dDataInicioDep);
         end;
         //-------------------------------------------------------------------------------
         // Registra o Último Lancamento de Depreciacao para armazenamento futuro
         //-------------------------------------------------------------------------------
         dDataUltDepAnt := strtodate(sDataUltDep);
         //-------------------------------------------------------------------------------
         // Calcula o fator de tempo de depreciação para o BEM
         //-------------------------------------------------------------------------------
         ParamFatorPeriodo(rFator,rTotDiaAno,rTotDia,sDataUltDep);
         //-------------------------------------------------------------------------------
         // Se Calcula a Correção -> Calcular a Correção do Mês
         //-------------------------------------------------------------------------------
         fValCmBem := cdsBem.FieldByName('CMBEM').AsFloat;
         fValCmDep := cdsBem.FieldByName('CMDEP').AsFloat;
         fCmBem := 0;
         fCmDep := 0;
         if (fCorrecao > 0) then
         begin
            //----------------------------------------------------------------------------
            // cmbem := cmbem mes ant + (valor bem + sua correcao ) * fator
            //----------------------------------------------------------------------------
            fCmBem    := (cdsBem.FieldByName('VALORG').AsFloat + cdsBem.FieldByName('CMBEM').AsFloat) * (fCorrecao - 1);
            fValCmBem := cdsBem.FieldByName('CMBEM').AsFloat + fCmBem;
            //----------------------------------------------------------------------------
            // corrigir a depreciacao lançada
            //----------------------------------------------------------------------------
            fCmDep    := (cdsBem.FieldByName('DEPLANC').AsFloat + cdsBem.FieldByName('CMDEP').AsFloat) * (fCorrecao - 1);
            fValCmDep := cdsBem.FieldByName('CMDEP').AsFloat + fCmDep;
            //----------------------------------------------------------------------------
            RegistraCorrMonetaria(eData.Text,fCmBem,0,0,
                                  cdsBem.FieldByName('IDBEM').AsString,'15');
            //----------------------------------------------------------------------------
            // Integração Contábil
            //----------------------------------------------------------------------------
            if bIntegraContab then
            begin
               LocalizaContasContabCorrMonetaria(iPlanoConta,
                                                 debito,credito,
                                                 sCCDebito,sCCCredito,
                                                 bErro,'B',
                                                 cdsBem.FieldByName('IDGRUPO').AsInteger);
               if bErro then exit;
               //-------------------------------------------------------------------------
               MontaRateioCorrMonetaria(iPlanoConta,debito,credito,
                                        sCCDebito,sCCCredito,sAtivProjeto,
                                        cdsBem.FieldByName('DESBEM').AsString,
                                        cdsBem.FieldByName('IDBEM').AsString,
                                        cdsBem.FieldByName('PLACA').AsFloat,
                                        fCmBem,bErro,
                                        cdsBem.FieldByName('IDGRUPO').AsInteger,
                                        cdsBem.FieldByName('IDCONJUNTO').AsInteger);
               if bErro then exit;
            end;
         end;
         //-------------------------------------------------------------------------------
         // Se calcula a depreciação -> Calcular a Depreciação do Mes
         //-------------------------------------------------------------------------------
         fValDepLanc := cdsBem.FieldByName('DEPLANC').AsFloat;
         fDepLanc := 0;
         if (cdsBem.FieldByName('FLGDEPREC').IsNull) then
            iFlgDeprec := 0
         else
            iFlgDeprec := cdsBem.FieldByName('FLGDEPREC').AsInteger;
         //-------------------------------------------------------------------------------
         if (iFlgDeprec = 0) and (rFator > 0) and (cdsBem.FieldByName('TAXADEP').AsFloat > 0) then
         begin
            rTaxa := ((cdsBem.FieldByName('TAXADEP').AsFloat / 100) * rFator);
            fDepLanc := (rTaxa * (cdsBem.FieldByName('VALORG').AsFloat + fValCmBem));
            if abs(fDepLanc) >= 0.01 then
               fDepLanc := strtofloat(FormatFloat('#0.00',((fDepLanc * 100) / 100)));
            //----------------------------------------------------------------------------
            if ((fValDepLanc + fDepLanc + fValCmDep) >= (cdsBem.FieldByName('VALORG').AsFloat + fValCmBem)) then
            begin
               fDepLanc := (cdsBem.FieldByName('VALORG').AsFloat + fValCmBem) - (fValDepLanc + fValCmDep);
               iFlgDeprec := 1;
            end;
            fValDepLanc := cdsBem.FieldByName('DEPLANC').AsFloat + fDepLanc;
            //----------------------------------------------------------------------------
            RegistraDepreciacao(eData.Text,DepTotalF,DepTotalG,fDepLanc,fCmDep,
                                cdsBem.FieldByName('IDBEM').AsString,'14','21');
            //----------------------------------------------------------------------------
            // Integração Contábil
            //----------------------------------------------------------------------------
            if bIntegraContab then
            begin
               //-------------------------------------------------------------------------
               // Lançamento em Planilha
               //-------------------------------------------------------------------------
               LocalizaContasContabDepreciacao(iPlanoConta,
                                               debito,debitoCM,credito,creditoCM,
                                               sCCDebito,sCCDebitoCM,sCCCredito,sCCCreditoCM,
                                               bErro,'B',
                                               cdsBem.FieldByName('IDGRUPO').AsInteger,
                                               fCorrecao);
               if bErro then exit;
               //-------------------------------------------------------------------------
               DepTotalf := fDepLanc;
               DepTotalg := fDepLanc;
               MontaRateioDepreciacao(iPlanoConta,debito,
                                      debitocm,credito,creditocm,sCCDebito,
                                      sCCDebitocm,sCCCredito,sCCCreditocm,sAtivProjeto,
                                      cdsBem.FieldByName('DESBEM').AsString,
                                      cdsBem.FieldByName('IDBEM').AsString,
                                      cdsBem.FieldByName('PLACA').AsFloat,
                                      fDepLanc,deptotalf,deptotalg,fCmDep,bErro,
                                      cdsBem.FieldByName('IDGRUPO').AsInteger,
                                      cdsBem.FieldByName('IDCONJUNTO').AsInteger,
                                      cdsBem.FieldByName('CODSUBCONTA').AsInteger);
               if bErro then exit;
            end;
         end;
         //-------------------------------------------------------------------------------
         qryAlteraBem.ParamByName('IDPESSOA').AsFloat         := cdsBem.FieldByName('IDPESSOA').AsFloat;
         qryAlteraBem.ParamByName('IDBEM').AsInteger          := cdsBem.FieldByName('IDBEM').AsInteger;
         qryAlteraBem.ParamByName('CMBEM').AsFloat            := fValCmBem;
         qryAlteraBem.ParamByName('DEPLANC').AsFloat          := fValDepLanc;
         qryAlteraBem.ParamByName('CMDEP').AsFloat            := fValCmDep;
         qryAlteraBem.ParamByName('DATAINICIODEP').AsDateTime := dDataInicioDep;
         qryAlteraBem.ParamByName('DATAULTDEP').AsDateTime    := strtodate(eData.Text);
         qryAlteraBem.ParamByName('DATARECALCDEP').AsDateTime := strtodate(sDataUltDep);
         qryAlteraBem.ParamByname('FLGDEPREC').AsInteger      := iFlgDeprec;
         qryAlteraBem.ExecSQL;
         //-------------------------------------------------------------------------------
         if cdsBem.FieldByname('IDGRUPO').AsInteger <> qryUpdGrupo.FieldByname('IDGRUPO').AsInteger then
         begin
            if qryUpdGrupo.Locate('IDGRUPO',cdsBem.FieldByname('IDGRUPO').AsInteger,[]) then
            begin
               qryUpdGrupo.Edit;
               qryUpdGrupo.FieldByName('DATAULTDEP').AsDateTime := strtodate(eData.Text);
               qryUpdGrupo.Post;
            end;
         end;
         //-------------------------------------------------------------------------------
         // Atualiza a tabela SALDOCONTABBEM
         //-------------------------------------------------------------------------------
         if not AtivoFixo.AtualizaSaldoContabBem(Sistema.IdModulo,
                                                 cdsBem.FieldByName('IDPESSOA').AsInteger,
                                                 cdsBem.FieldByName('IDBEM').AsInteger,
                                                 StrtoDate(eData.Text),
                                                 0,fCmBem,fDepLanc,fCmDep,
                                                 0,0,0,0, 0,0,0,0, 0) then
            Raise eExcessaoCAF.Create('Depreciação : AtualizaSaldoContabBem');
         //-------------------------------------------------------------------------------
         cdsBem.Next
      end;
      if cdsBem.ChangeCount > 0 then
         cdsBem.ApplyUpdates(-1);
   except
      cdsBem.CancelUpdates;
      msgdlg('Erro na Depreciação do Bem PLACA ' + cdsBem.FieldByName('PLACA').AsString,'Erro',mtError,[mbOk],0);
   end;
end;
//========================================================================================
Procedure TfrmMovDepreciacao.Atualiza_Depreciacao;
begin
   try
      qryupdGrupo.ApplyUpdates;
      if bIntegraContab then
      begin
         Tot_Contabilidade(Exercicio,Periodo);
         if (Planilha <= 0) then
         begin
            bErroAtualizacao := True;
            Exit;
         end;
         Tot_HistoricoMovimentacao(14,Planilha);
         Tot_HistoricoMovimentacao(18,Planilha);
         Tot_HistoricoMovimentacao(35,Planilha);
      end;
   except
      bErroAtualizacao := True;
   end;
end;
//========================================================================================
Procedure TfrmMovDepreciacao.Cancela_Depreciacao;
begin
   qryupdGrupo.ApplyUpdates;
end;
//========================================================================================
// Cálculo da Depreciação e da Correção Monetária da Reavaliação
//========================================================================================
Procedure TfrmMovDepreciacao.Calcula_Depreciacao_Reav(Var bErro:boolean);
var
   iPosition                                      : Integer;
   fCorrecao,
   fDepLanc,DepTotalF,DepTotalG,fCmDep,fCmBem     : Extended;
   sDataUltDep,
   Debito,DebitoCm,Credito,CreditoCm,
   sCCDebito,sCCDebitoCm,sCCCredito,sCCCreditoCm,
   sAtivProjeto                                   : String;
   rTaxa,
   rFator,rTotDiaAno,rTotDia                      : Extended;

begin
   DepTotalF  := 0;
   DepTotalG  := 0;
   //-------------------------------------------------------------------------------------
   // Define qual o grupo de bens que será depreciado
   //-------------------------------------------------------------------------------------
   case iGrupoDeprec of
      0 : begin
             iGrupoDepIni := 0;
             iGrupoDepFim := 0;
          end;
      1 : begin
             iGrupoDepIni := 1;
             iGrupoDepFim := 1;
          end;
      2 : begin
             iGrupoDepIni := 0;
             iGrupoDepFim := 1;
          end;
      else
          begin
             iGrupoDepIni := 2;
             iGrupoDepFim := 2;
          end;
   end;
   //-------------------------------------------------------------------------------------
   // Retorna a Taxa de CORREÇÃO MONETÁRIA do Periodo
   //-------------------------------------------------------------------------------------
   ParamCorrecao(fCorrecao);
   //-------------------------------------------------------------------------------------
   qryReavaliacoes.Close;
   qryReavaliacoes.ParamByName('PIDPESSOA').asInteger := Sistema.IdEmpresa;
   qryReavaliacoes.ParamByName('PDATAMOV').asDateTime := eData.Date;
   qryReavaliacoes.ParamByName('PFLGIMOVELINI').AsInteger := iGrupoDepIni;
   qryReavaliacoes.ParamByName('PFLGIMOVELFIM').AsInteger := iGrupoDepFim;
   qryReavaliacoes.Open;
   if qryReavaliacoes.IsEmpty then
      exit;
   //-------------------------------------------------------------------------------------
   case iGrupoDeprec of
      0 : lblStatus.Caption := 'Depreciação - '+ inttostr(qryReavaliacoes.RecordCount) +' Reavaliações não Imóveis ';
      1 : lblStatus.Caption := 'Depreciação - '+ inttostr(qryReavaliacoes.RecordCount) +' Reavaliações de Imóveis';
   else
      lblStatus.Caption := 'Depreciação - '+ inttostr(qryReavaliacoes.RecordCount) +' Reavaliações';
   end;
   //-------------------------------------------------------------------------------------
   prgBar.MaxValue   := qryReavaliacoes.RecordCount;
   prgBar.Progress   := 0;
   iPosition         := 0;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   try
      qryReavaliacoes.First;
      while not qryReavaliacoes.EOF do
      begin
         if bIntegraContab then
         begin
            //----------------------------------------------------------------------------
            // Le a Unidade de Negocio / Atividade Projeto da Tabela de Parametros
            //----------------------------------------------------------------------------
            if qryReavaliacoesUNIDNEGOC.IsNull then
            begin
               with dtmAtivoFixo.qryParamCaf do
               begin
                  Close;
                  ParamByName('PIDPESSOA').asInteger := Sistema.IdEmpresa;
                  Open;
                  if not IsEmpty then
                     sAtivProjeto := FieldByName('ATIVPROJETO').AsString
                  else
                     sAtivProjeto := '';
               end;
            end else
            begin
               sAtivProjeto := qryReavaliacoesUNIDNEGOC.AsString;
            end;
         end;
         //-------------------------------------------------------------------------------
         if (qryReavaliacoesDATAULTDEP.IsNull) then
         begin
            sDataUltDep := datetostr(qryReavaliacoesDATAREAVALIACAO.AsDateTime);
         end else
         begin
            sDataUltDep := datetostr(qryReavaliacoesDATAULTDEP.AsDateTime);
         end;
         //-------------------------------------------------------------------------------
         // Armazena o ultimo Lancamento de Depreciacao para armazenamento futuro
         //-------------------------------------------------------------------------------
         dDataUltDepAnt := qryReavaliacoesDATAULTDEP.asDateTime;
         //-------------------------------------------------------------------------------
         // Retorna o Fator de Depreciação da Reavaliação do Bem
         //-------------------------------------------------------------------------------
         ParamFatorPeriodo(rFator,rTotDiaAno,rTotDia,sDataUltDep);
         fCmBem := 0;
         fCmDep := 0;
         //-------------------------------------------------------------------------------
         qryReavaliacoes.Edit;
         //-------------------------------------------------------------------------------
         // Calcular a Correção do Mês, caso esteja setada.
         //-------------------------------------------------------------------------------
         if fCorrecao > 0 then
         begin
            //----------------------------------------------------------------------------
            // cmbem := cmbem mes ant + (valor bem + sua correcao ) * fator
            //----------------------------------------------------------------------------
            fCmBem := (qryReavaliacoesVALORG.AsFloat +
                       qryReavaliacoesCMBEM.AsFloat) * (fCorrecao - 1);
            qryReavaliacoesCMBEM.AsFloat := qryReavaliacoesCMBEM.AsFloat + fCmBem;
            //----------------------------------------------------------------------------
            // corrigir a depreciacao lançada
            //----------------------------------------------------------------------------
            fCmDep := (qryReavaliacoesDEPLANC.AsFloat +
                       qryReavaliacoesCMDEP.AsFloat ) * (fCorrecao - 1);;
            qryReavaliacoesCMDEP.AsFloat := qryReavaliacoesCMDEP.AsFloat + fCmDep;
            //----------------------------------------------------------------------------
            // Busca plano de contas correspondente à movimentação da Correção Monetária
            //----------------------------------------------------------------------------
            if bIntegraContab then
            begin
               //-------------------------------------------------------------------------
               LocalizaContasContabCorrMonetaria(iPlanoConta,
                                                 debito,credito,
                                                 sCCDebito,sCCCredito,
                                                 bErro,'R',
                                                 qryReavaliacoesIDGRUPO.AsInteger);
               if bErro then exit;
               //-------------------------------------------------------------------------
               MontaRateioCorrMonetaria(iPlanoConta,debito,credito,
                                        sCCDebito,sCCCredito,sAtivProjeto,
                                        qryReavaliacoesDESBEM.AsString,
                                        qryReavaliacoesIDBEM.AsString,
                                        qryReavaliacoesPLACA.AsFloat,
                                        fCmBem,bErro,
                                        qryReavaliacoesIDGRUPO.AsInteger,
                                        qryReavaliacoesIDCONJUNTO.AsInteger);
               if bErro then exit;
            end;
            //----------------------------------------------------------------------------
            RegistraCorrMonetaria(eData.Text,fCmBem,0,0,
                                  qryReavaliacoesIDBEM.AsString,'22');
         end;
         //-------------------------------------------------------------------------------
         // Se calcula a depreciação -> Calcular a Depreciação do Mes
         //-------------------------------------------------------------------------------
         fDepLanc := 0;
         if ((qryReavaliacoesFLGDEPREC.AsInteger = 0) or (qryReavaliacoesFLGDEPREC.IsNull)) and
             (rFator > 0) and (qryReavaliacoesTAXADEP.AsFloat > 0) then
         begin
            //----------------------------------------------------------------------------
            rTaxa     := ((qryReavaliacoesTAXADEP.AsFloat / 100) * rFator);
            fDepLanc := (rTaxa * (qryReavaliacoesVALORG.AsFloat +
                                   qryReavaliacoesCMBEM.AsFloat));
            if abs(fDepLanc) >= 0.01 then
               fDepLanc := strtofloat(FormatFloat('#0.00',((fDepLanc * 100) / 100)));
            //----------------------------------------------------------------------------
            if abs(qryReavaliacoesDEPLANC.AsFloat + fDepLanc + qryReavaliacoesCMDEP.AsFloat) >
               abs(qryReavaliacoesVALORG.AsFloat + qryReavaliacoesCMBEM.AsFloat) then
            begin
               if (qryReavaliacoesVALORG.AsFloat + qryReavaliacoesCMBEM.AsFloat) <> 0 then
                  fDepLanc := (qryReavaliacoesVALORG.AsFloat + qryReavaliacoesCMBEM.AsFloat) -
                              (qryReavaliacoesDEPLANC.AsFloat + qryReavaliacoesCMDEP.AsFloat);
               qryReavaliacoesFLGDEPREC.AsInteger := 1;
            end;
            qryReavaliacoesDEPLANC.AsFloat := qryReavaliacoesDEPLANC.AsFloat + fDepLanc;
            qryReavaliacoesDATAULTDEP.AsDateTime := strtodate(eData.text);
            //----------------------------------------------------------------------------
            RegistraDepreciacao(eData.Text,DepTotalF,DepTotalG,fDepLanc,fCmDep,
                                qryReavaliacoesIDBEM.AsString,
                                '18','19');
            //----------------------------------------------------------------------------
            // Integração Contábil
            //----------------------------------------------------------------------------
            if bIntegraContab then
            begin
               LocalizaContasContabDepreciacao(iPlanoConta,
                                               debito,debitoCM,credito,creditoCM,
                                               sCCDebito,sCCDebitoCM,sCCCredito,sCCCreditoCM,
                                               bErro,
                                               'R',
                                               qryReavaliacoesIDGRUPO.AsInteger,
                                               fCorrecao);
               if bErro then exit;
               //-------------------------------------------------------------------------
               Calcula_Moedas(fDepLanc, eData.Date, DepTotalF, DepTotalG);
               //-------------------------------------------------------------------------
               MontaRateioDepreciacao(iPlanoConta,debito,
                                      debitocm,credito,creditocm,sCCDebito,
                                      sCCDebitocm,sCCCredito,sCCCreditocm,sAtivProjeto,
                                      qryReavaliacoesDESBEM.Asstring,
                                      qryReavaliacoesIDBEM.Asstring,
                                      qryReavaliacoesPLACA.AsFloat,
                                      fDepLanc,deptotalf,deptotalg,fCmDep,bErro,
                                      qryReavaliacoesIDGRUPO.AsInteger,
                                      qryReavaliacoesIDCONJUNTO.AsInteger,
                                      qryReavaliacoesCODSUBCONTA.AsInteger);
               if bErro then exit;
            end;
         end;
         //-------------------------------------------------------------------------------
         // Atualiza a tabela SALDOCONTABBEM
         //-------------------------------------------------------------------------------
         if qryReavaliacoesFLGULTREAVAL.AsInteger = 0 then
         begin
            if not AtivoFixo.AtualizaSaldoContabBem(Sistema.IdModulo,
                                                    qryReavaliacoesIDPESSOA.AsInteger,
                                                    qryReavaliacoesIDBEM.AsInteger,
                                                    StrtoDate(eData.Text),
                                                    0,0,0,0,
                                                    0,fCmBem,fDepLanc,fCmDep,
                                                    0,0,0,0,
                                                    0) then
               Raise eExcessaoCAF.Create('Depreciação : AtualizaSaldoContabBem');
         end else
         begin
            if not AtivoFixo.AtualizaSaldoContabBem(Sistema.IdModulo,
                                                    qryReavaliacoesIDPESSOA.AsInteger,
                                                    qryReavaliacoesIDBEM.AsInteger,
                                                    StrtoDate(eData.Text),
                                                    0,0,0,0,
                                                    0,0,0,0,
                                                    0,fCmBem,fDepLanc,fCmDep,
                                                    0) then
               Raise eExcessaoCAF.Create('Depreciação : AtualizaSaldoContabBem');
         end;
         //-------------------------------------------------------------------------------
         iPosition := iPosition + 1;
         prgBar.Progress := iPosition;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         qryReavaliacoes.Next
      end;
   except
      msgdlg('Erro na Depreciação da Reavaliação do Bem ' + qryReavaliacoesIDBEM.AsString,
             'Erro',mtError,[mbOk],0);
      raise;
   end;
end;
//========================================================================================
Procedure TfrmMovDepreciacao.Atualiza_Depreciacao_Reav;
begin
   try
      qryReavaliacoes.ApplyUpdates;
   except
      bErroAtualizacao := True;
   end;
end;
//========================================================================================
Procedure TfrmMovDepreciacao.Cancela_Depreciacao_Reav;
begin
   qryReavaliacoes.CancelUpdates;
end;
//========================================================================================
// Cálculo da Depreciação e da Correção Monetária do Acréscimo de Valor
//========================================================================================
Procedure TfrmMovDepreciacao.Calcula_Depreciacao_Acresc(var bErro:boolean);
var
   iPosition                                      : Integer;
   fCorrecao,
   fDepLanc,DepTotalF,DepTotalG,fCmDep,fCmBem     : Extended;
   sDataUltDep,
   Debito,DebitoCm,Credito,CreditoCm,
   sCCDebito,sCCDebitoCm,sCCCredito,sCCCreditoCm,
   sAtivProjeto                                   : String;
   rTaxa,
   rFator,rTotDiaAno,rTotDia                      : Extended;


begin
   //-------------------------------------------------------------------------------------
   DepTotalF  := 0;
   DepTotalG  := 0;
   //-------------------------------------------------------------------------------------
   // Define qual o grupo de bens que será depreciado
   //-------------------------------------------------------------------------------------
   case iGrupoDeprec of
      0 : begin
             iGrupoDepIni := 0;
             iGrupoDepFim := 0;
          end;
      1 : begin
             iGrupoDepIni := 1;
             iGrupoDepFim := 1;
          end;
      2 : begin
             iGrupoDepIni := 0;
             iGrupoDepFim := 1;
          end;
      else
          begin
             iGrupoDepIni := 2;
             iGrupoDepFim := 2;
          end;
   end;
   //-------------------------------------------------------------------------------------
   // Retorna a Taxa de CORREÇÃO MONETÁRIA do Periodo
   //-------------------------------------------------------------------------------------
   ParamCorrecao(fCorrecao);
   //-------------------------------------------------------------------------------------
   qryAcrescimos.Close;
   qryAcrescimos.ParamByName('PIDPESSOA').asInteger := Sistema.IdEmpresa;
   qryAcrescimos.ParamByName('PDATAMOV').asDateTime := eData.Date;
   qryAcrescimos.ParamByName('PFLGIMOVELINI').AsInteger := iGrupoDepIni;
   qryAcrescimos.ParamByName('PFLGIMOVELFIM').AsInteger := iGrupoDepFim;
   qryAcrescimos.Open;
   if qryAcrescimos.IsEmpty then
      exit;
   //-------------------------------------------------------------------------------------
   case iGrupoDeprec of
      0 : lblStatus.Caption := 'Depreciação - '+ inttostr(qryAcrescimos.RecordCount) +' Acréscimos não Imóveis';
      1 : lblStatus.Caption := 'Depreciação - '+ inttostr(qryAcrescimos.RecordCount) +' Acréscimos de Imóveis';
   else
      lblStatus.Caption := 'Depreciação - '+ inttostr(qryAcrescimos.RecordCount) +' Acréscimos';
   end;
   //-------------------------------------------------------------------------------------
   prgBar.MaxValue   := qryAcrescimos.RecordCount;
   prgBar.Progress   := 0;
   iPosition         := 0;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   try
      qryAcrescimos.First;
      while not qryAcrescimos.EOF do
      begin
         if (iGrupoDeprec < 2) then
         begin
            qryGrupoBem.Close;
            qryGrupoBem.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
            qryGrupoBem.ParamByName('PIDBEM').AsInteger    := qryAcrescimosIDBEM.AsInteger;
            qryGrupoBem.Open;
            if (qryGrupoBemFLGIMOVEL.AsInteger <> iGrupoDeprec) then
            begin
               iPosition := iPosition + 1;
               prgBar.Progress := iPosition;
               Application.ProcessMessages;
               //-------------------------------------------------------------------------
               qryAcrescimos.Next;
               Continue;
            end;
         end;
         //-------------------------------------------------------------------------------
         // Le a Unidade de Negocio / Atividade Projeto da Tabela de Parametros
         //-------------------------------------------------------------------------------
         if qryAcrescimos.FieldByName('UNIDNEGOC').IsNull then
         begin
            with dtmAtivoFixo.qryParamCaf do
            begin
               Close;
               ParamByName('PIDPESSOA').asInteger := Sistema.IdEmpresa;
               Open;
               if not IsEmpty then
                  sAtivProjeto := FieldByName('ATIVPROJETO').AsString
               else
                  sAtivProjeto := '';
            end;
         end else
         begin
            sAtivProjeto := qryAcrescimosUNIDNEGOC.AsString;
         end;
         //-------------------------------------------------------------------------------
         qryAcrescimos.Edit;
         //-------------------------------------------------------------------------------
         if qryAcrescimosDATAULTDEP.IsNull then
            sDataUltDep := datetostr(qryAcrescimosDATAACRESCIMO.AsDateTime)
         else
            sDataUltDep := datetostr(qryAcrescimosDATAULTDEP.AsDateTime);
         //-------------------------------------------------------------------------------
         // Armazena o ultimo Lancamento de Depreciacao para armazenamento futuro
         //-------------------------------------------------------------------------------
         dDataUltDepAnt := qryAcrescimosDATAULTDEP.asDateTime;
         //-------------------------------------------------------------------------------
         // Retorna o Fator de Depreciação da Reavaliação do Bem
         //-------------------------------------------------------------------------------
         ParamFatorPeriodo(rFator,rTotDiaAno,rTotDia,sDataUltDep);
         fCmBem := 0;
         fCmDep := 0;
         //-------------------------------------------------------------------------------
         // Calcular a Correção do Mês, caso esteja setada.
         //-------------------------------------------------------------------------------
         if fCorrecao > 0 then
         begin
            //----------------------------------------------------------------------------
            // cmbem := cmbem mes ant + (valor bem + sua correcao ) * fator
            //----------------------------------------------------------------------------
            fCmBem := (qryAcrescimosVALORG.AsFloat +
                       qryAcrescimosCMBEM.AsFloat) * (fCorrecao - 1);
            qryAcrescimosCMBEM.AsFloat := qryAcrescimosCMBEM.AsFloat + fCmBem;
            //----------------------------------------------------------------------------
            // corrigir a depreciacao lançada
            //----------------------------------------------------------------------------
            fCmDep := (qryAcrescimosDEPLANC.AsFloat +
                       qryAcrescimosCMDEP.AsFloat ) * (fCorrecao - 1);
            qryAcrescimosCMDEP.AsFloat := qryAcrescimosCMDEP.AsFloat + fCmDep;
            //----------------------------------------------------------------------------
            // Busca plano de contas correspondente à movimentação da Correção Monetária
            //----------------------------------------------------------------------------
            if bIntegraContab then
            begin
               LocalizaContasContabCorrMonetaria(iPlanoConta,
                                                 debito,credito,
                                                 sCCDebito,sCCCredito,
                                                 bErro,'A',
                                                 qryAcrescimosIDGRUPO.AsInteger);
               if bErro then exit;
               //-------------------------------------------------------------------------
               MontaRateioCorrMonetaria(iPlanoConta,debito,credito,
                                        sCCDebito,sCCCredito,sAtivProjeto,
                                        qryAcrescimosDESBEM.AsString,
                                        qryAcrescimosIDBEM.AsString,
                                        qryAcrescimosPLACA.AsFloat,
                                        fCmBem,bErro,
                                        qryAcrescimosIDGRUPO.AsInteger,
                                        qryAcrescimosIDCONJUNTO.AsInteger);
               if bErro then exit;
            end;
            //----------------------------------------------------------------------------
            RegistraCorrMonetaria(eData.Text,fCmBem,0,0,
                                  qryAcrescimosIDBEM.AsString,'34');
         end;
         //-------------------------------------------------------------------------------
         // Se calcula a depreciação -> Calcular a Depreciação do Mes
         //-------------------------------------------------------------------------------
         fDepLanc := 0;
         if ((qryAcrescimosFLGDEPREC.AsInteger = 0) or (qryAcrescimosFLGDEPREC.IsNull)) and
             (rFator > 0) and (qryAcrescimosTAXADEP.AsFloat > 0) then
         begin
            //----------------------------------------------------------------------------
            rTaxa     := ((qryAcrescimosTAXADEP.AsFloat / 100) * rFator);
            fDepLanc := (rTaxa * (qryAcrescimosVALORG.AsFloat +
                                   qryAcrescimosCMBEM.AsFloat));
            if abs(fDepLanc) >= 0.01 then
               fDepLanc := strtofloat(FormatFloat('#0.00',((fDepLanc * 100) / 100)));
            //----------------------------------------------------------------------------
            if (qryAcrescimosDEPLANC.AsFloat + fDepLanc + (qryAcrescimosCMDEP.AsFloat)) >=
               (qryAcrescimosVALORG.AsFloat + (qryAcrescimosCMBEM.AsFloat)) then
            begin
               if (qryAcrescimosVALORG.AsFloat + qryAcrescimosCMBEM.AsFloat) <> 0 then
                  fDepLanc := (qryAcrescimosVALORG.AsFloat + qryAcrescimosCMBEM.AsFloat) -
                               (qryAcrescimosDEPLANC.AsFloat + qryAcrescimosCMDEP.AsFloat);
               qryAcrescimosFLGDEPREC.AsInteger := 1;
            end;
            qryAcrescimosDEPLANC.AsFloat       := qryAcrescimosDEPLANC.AsFloat + fDepLanc;
            qryAcrescimosDATAULTDEP.AsDateTime := strtodate(eData.Text);
            //----------------------------------------------------------------------------
            RegistraDepreciacao(eData.Text, DepTotalF, DepTotalG, fDepLanc, fCmDep,
                                qryAcrescimosIDBEM.AsString, '35', '36');
            //----------------------------------------------------------------------------
            if bIntegraContab then
            begin
               LocalizaContasContabDepreciacao(iPlanoConta,                                   // Plano de Contas
                                               debito,debitoCM,credito,creditoCM,             // Conta Contábil
                                               sCCDebito,sCCDebitoCM,sCCCredito,sCCCreditoCM, // Centro de Custo
                                               bErro,                                         // bErro = true se não encontrado
                                               'A',                                           // Tipo = 'A' -> Acréscimo de Valor
                                               qryAcrescimosIDGRUPO.AsInteger,                // Grupo do Bem
                                               fCorrecao);
               if bErro then exit;
               //-------------------------------------------------------------------------
               Calcula_Moedas(fDepLanc, eData.Date, DepTotalF, DepTotalG);
               //-------------------------------------------------------------------------
               MontaRateioDepreciacao(iPlanoConta,debito,
                                      debitocm,credito,creditocm,sCCDebito,
                                      sCCDebitocm,sCCCredito,sCCCreditocm,sAtivProjeto,
                                      qryAcrescimosDESBEM.Asstring,
                                      qryAcrescimosIDBEM.Asstring,
                                      qryAcrescimosPLACA.AsFloat,
                                      fDepLanc,DepTotalF,DepTotalG,fCmDep,bErro,
                                      qryAcrescimosIDGRUPO.AsInteger,
                                      qryAcrescimosIDCONJUNTO.AsInteger,
                                      qryAcrescimosCODSUBCONTA.AsInteger);
               if bErro then exit;
            end;
         end;
         //-------------------------------------------------------------------------------
         iPosition := iPosition + 1;
         prgBar.Progress := iPosition;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         // Atualiza a tabela SALDOCONTABBEM
         //-------------------------------------------------------------------------------
         if not AtivoFixo.AtualizaSaldoContabBem(Sistema.IdModulo,
                                                 qryAcrescimosIDPESSOA.AsInteger,
                                                 qryAcrescimosIDBEM.AsInteger,
                                                 StrtoDate(eData.Text),
                                                 0,fCmBem,fDepLanc,fCmDep,
                                                 0,0,0,0,
                                                 0,0,0,0,
                                                 0) then
            Raise eExcessaoCAF.Create('Depreciação : AtualizaSaldoContabBem');
         //-------------------------------------------------------------------------------
         qryAcrescimos.Next
      end;
   except
      msgdlg('Erro na Depreciação do Acréscimo do Bem ' + qryAcrescimosIDBEM.AsString,
             'Erro',mtError,[mbOk],0);
      raise;
   end;
end;
//========================================================================================
Procedure TfrmMovDepreciacao.Atualiza_Depreciacao_Acresc;
begin
   try
      qryAcrescimos.ApplyUpdates;
   except
      bErroAtualizacao := True;
   end;
end;
//========================================================================================
Procedure TfrmMovDepreciacao.Cancela_Depreciacao_Acresc;
begin
   qryAcrescimos.CancelUpdates;
end;
//========================================================================================
Procedure TfrmMovDepreciacao.LocalizaContasContabDepreciacao(
                                  var iPlanoConta : Integer;
                                  var debito,debitocm,credito,creditocm,
                                      sCCDebito,sCCDebitocm,sCCCredito,sCCCreditocm :string;
                                  var bErro : Boolean; Tipo : Char; iGrupo : Integer;
                                      fCorrecao : Extended);
var
   sGrupo : string;

begin
   if Tipo = 'B' then
   begin
      //----------------------------------------------------------------------------------
      // Busca conta a débito para a Depreciação
      //----------------------------------------------------------------------------------
      Localiza_ContaeCentroCusto(iGrupo,14,'D',iPlanoConta,Debito,sCCDebito);
      //----------------------------------------------------------------------------------
      if (Debito = '') then
      begin
         Busca_Grupo(iGrupo,sGrupo);
         MsgDlg('Conta a Débito para o Movimento Cálculo da Depreciação do Grupo ' +
                sGrupo + ' não cadastrada !','Erro',mtError,[mbOk],0);
         bErro := True;
         exit;
      end;
      //----------------------------------------------------------------------------------
      // Busca conta a crédito para a Depreciação
      //----------------------------------------------------------------------------------
      Localiza_ContaECentroCusto(iGrupo,14,'C',iPlanoConta,Credito,sCCCredito);
      //----------------------------------------------------------------------------------
      if (Credito = '') then
      begin
         Busca_Grupo(iGrupo,sGrupo);
         msgdlg('Conta a Crédito para o Movimento Cálculo da Depreciação do Grupo '
                + sGrupo + ' não Cadastrada !','Erro',mtError,[mbOk],0);
         bErro := True;
         exit;
      end;
      //==================================================================================
      if fCorrecao > 0 then
      begin
         //-------------------------------------------------------------------------------
         // Busca conta a débito para a Correcao da Depreciação
         //-------------------------------------------------------------------------------
         Localiza_ContaeCentroCusto(iGrupo,21,'D',iPlanoConta,DebitoCM,sCCDebitoCM);
         //-------------------------------------------------------------------------------
         if (DebitoCM = '') then
         begin
            Busca_Grupo(iGrupo,sGrupo);
            MsgDlg('Conta a Débito para o Movimento Cálculo da Correção Monetária'+
                   ' da Depreciação do Grupo ' + sGrupo + ' não Cadastrada !','Erro',
                   mtError,[mbOk],0);
            bErro := True;
            exit;
         end;
         //-------------------------------------------------------------------------------
         // Busca conta a crédito para a Correção da Depreciação
         //-------------------------------------------------------------------------------
         Localiza_ContaeCentroCusto(iGrupo,21,'C',iPlanoConta,CreditoCM,sccCreditoCM);
         //-------------------------------------------------------------------------------
         if (CreditoCM = '') then
         begin
            Busca_Grupo(iGrupo,sGrupo);
            MsgDlg('Conta a crédito para o Movimento Cálculo da Correção Monetária'+
                   ' da Depreciação do Grupo ' + sGrupo + ' não Cadastrada !','Erro',
                   mtError,[mbOk],0);
            bErro := True;
            exit;
         end;
      end;
   end else
   //-------------------------------------------------------------------------------------
   if Tipo = 'R' then
   begin
      //----------------------------------------------------------------------------------
      // Busca conta a débito para a Reavaliação
      //----------------------------------------------------------------------------------
      Localiza_ContaECentroCusto(iGrupo,18,'C',iPlanoConta,Credito,sCCCredito);
      //----------------------------------------------------------------------------------
      if (Credito = '') then
      begin
         Busca_Grupo(iGrupo,sGrupo);
         MsgDlg('Conta a Crédito para o Movimento Depreciação da Reavaliação do ' +
                'Grupo ' + sGrupo + ' não cadastrada !','Erro',mtError,[mbOk],0);
         bErro := true;
         exit;
      end;
      //----------------------------------------------------------------------------------
      // Busca conta a crédito para Reavaliação
      //----------------------------------------------------------------------------------
      Localiza_ContaECentroCusto(iGrupo,18,'D',iPlanoConta,Debito,sCCDebito);
      //----------------------------------------------------------------------------------
      if (Debito = '') then
      begin
         Busca_Grupo(iGrupo,sGrupo);
         MsgDlg('Conta a Débito para o Movimento Depreciação da Reavaliação do '+
                'Grupo ' + sGrupo + ' não cadastrada !','Erro',mtError,[mbOk],0);
         bErro := True;
         exit;
      end;
      //----------------------------------------------------------------------------------
      if fCorrecao > 0 then
      begin
         CreditoCM    := Credito;
         sCCCreditoCM := sCCCredito;
         DebitoCM     := Debito;
         sCCDebitoCM  := sCCDebito;
      end;
      //----------------------------------------------------------------------------------
   end else
   if Tipo = 'A' then
   begin
      //----------------------------------------------------------------------------------
      // Busca conta a débito para a Acréscimo
      //----------------------------------------------------------------------------------
      Localiza_ContaECentroCusto(iGrupo,35,'C',iPlanoConta,Credito,sCCCredito);
      //----------------------------------------------------------------------------------
      if (Credito = '') then
      begin
         Busca_Grupo(iGrupo,sGrupo);
         MsgDlg('Conta a Crédito para o Movimento Depreciação do Acréscimo de Valor do '+
                'Grupo ' + sGrupo + ' não cadastrada !','Erro',mtError,[mbOk],0);
         bErro := true;
         exit;
      end;
      //----------------------------------------------------------------------------------
      // Busca conta a crédito para a Acréscimo
      //----------------------------------------------------------------------------------
      Localiza_ContaECentroCusto(iGrupo,35,'D',iPlanoConta,Debito,sCCDebito);
      //----------------------------------------------------------------------------------
      if (Debito = '') then
      begin
         Busca_Grupo(iGrupo,sGrupo);
         MsgDlg('Conta a Débito para o Movimento Depreciação do Acréscimo de Valor do '+
                'Grupo ' + sGrupo + ' não cadastrada !','Erro',mtError,[mbOk],0);
         bErro := True;
         exit;
      end;
      //----------------------------------------------------------------------------------
      if (fCorrecao > 0) then
      begin
         CreditoCM    := Credito;
         sCCCreditoCM := sCCCredito;
         DebitoCM     := Debito;
         sCCDebitoCM  := sCCDebito;
      end;
      //----------------------------------------------------------------------------------
   end;
end;
//========================================================================================
Procedure TfrmMovDepreciacao.MontaRateioDepreciacao(iPlanoConta : integer;
                                                    Debito,DebitoCm,Credito,CreditoCm,sCCDebito,
                                                    sCCDebitocm,sCCCredito,sCCCreditoCm,sAtivProjeto,
                                                    sDesbem,sIdBem : string; fPlaca : Extended;
                                                    DepTotalO,DepTotalF,DepTotalG,CorrDep : Extended;
                                                    var bErro : boolean; iGrupo,iConjunto,iSubConta : integer);

var
   Particip1,Particip2,Particip3,Particip4,
   ValLanc,ValLancG,ValLancF                : Extended;
   Histor,Histor1,Histor2,Histor3,Histor4,
   Cc                                       : String;
   sNomeConta,sObrigaSubConta,sObrigaCC     : String;

begin
   try
      //----------------------------------------------------------------------------------
      Particip1 := 0;
      Particip2 := 0;
      Particip3 := 0;
      Particip4 := 0;
      Histor1   := sDesBem;
      Histor2   := '';
      Histor3   := '';
      Histor4   := '';
      sNomeConta      := '';
      sObrigaSubConta := '';
      //----------------------------------------------------------------------------------
      qryCcRD.Close;
      qryCcRD.ParamByName('EMPRESA').AsInteger  := Sistema.IdEmpresa;
      qryCcRD.ParamByName('CONJUNTO').AsInteger := iConjunto;
      qryCcRD.Open;
      //----------------------------------------------------------------------------------
     {qryTemp.Close;
      qryTemp.SQL.Text := ' SELECT CODSUBCONTA FROM BEM ' +
                          ' WHERE (IDBEM = ' + sIdBem + ')';
      qryTemp.Open;
      if (not qryTemp.IsEmpty) then
      begin
         iSubConta := qryTemp.FieldByName('CODSUBCONTA').AsInteger
      end else
      begin
         iSubConta := 0;
      end; }
      //----------------------------------------------------------------------------------
      qryCcRD.First;
      while not qryCcRD.EOF do
      begin
         if (Particip1 <= 100) then
         begin
            Histor := 'Depreciacao';
            //----------------------------------------------------------------------------
            sObrigaCC       := '';
            FuncaoGeral.TestaContaCC(True, iPlanoConta, Debito,
                                     sObrigaCC, sNomeConta, sObrigaSubConta);
            //----------------------------------------------------------------------------
            if sObrigaCC = 'S' then
            begin
               if qryCcRDTIPO.AsString = 'A' then
               begin
                  Particip1 := qryCcRDPARTICIPACAO.AsFloat;
                  Cc        := qryCcRDCODCENTROCUSTO.AsString;
               end else
               begin
                  MsgDlg('O Rateio de Custo do Conjunto ' + qryCcRDIDCONJUNTO.AsString +
                         ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                         'de Conjuntos!','Erro',mtError,[mbOk],0);
                  bErro := True;
                  exit;
               end;
            end else
            begin
               Particip1 := 100;
               Cc        := '';
            end;
            //----------------------------------------------------------------------------
            ValLanc  := (DepTotalO * Particip1) / 100;
            ValLancF := (DepTotalF * Particip1) / 100;
            ValLancG := (DepTotalG * Particip1) / 100;
            //----------------------------------------------------------------------------
            Monta_Contabilidade('D',Histor,Histor1,Histor2,Histor3,Histor4,
                                Cc,sAtivProjeto,'',Debito,sIdBem,ValLanc,ValLancF,ValLancG,
                                iGrupo,iPlanoConta,iSubConta,
                                sObrigaCC,sNomeConta,sObrigaSubConta,
                                strtoint(sIdBem),Sistema.IdEmpresa,fPlaca,bErro);
            if bErro then exit;
         end;
         //-------------------------------------------------------------------------------
         if (Particip3 <= 100) then
         begin
            Histor := 'Depreciacao';
            //----------------------------------------------------------------------------
            sObrigaCC       := '';
            FuncaoGeral.TestaContaCC(True, iPlanoConta, Credito,
                                     sObrigaCC, sNomeConta, sObrigaSubConta);
            //----------------------------------------------------------------------------
            if sObrigaCC = 'S' then
            begin
               if qryCcRDTIPO.AsString = 'A' then
               begin
                  Particip3 := qryCcRDPARTICIPACAO.AsFloat;
                  Cc        := qryCcRDCODCENTROCUSTO.AsString;
               end else
               begin
                  MsgDlg('O Rateio de Custo do Conjunto ' + qryCcRDIDCONJUNTO.AsString +
                         ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                         'de Conjuntos!','Erro',mtError,[mbOk],0);
                  bErro := True;
                  exit;
               end;
            end else
            begin
               Particip3 := 100;
               Cc        := '';
            end;
            //----------------------------------------------------------------------------
            ValLanc  := (DepTotalO * Particip3) / 100;
            ValLancF := (DepTotalF * Particip3) / 100;
            ValLancG := (DepTotalG * Particip3) / 100;
            //----------------------------------------------------------------------------
            Monta_Contabilidade('C',Histor,Histor1,Histor2,Histor3,Histor4,
                                Cc,sAtivProjeto,Credito,'',sIdBem,ValLanc,ValLancF,ValLancG,
                                iGrupo,iPlanoConta,iSubConta,
                                sObrigaCC,sNomeConta,sObrigaSubConta,
                                strtoint(sIdBem),Sistema.IdEmpresa,fPlaca,bErro);
            if bErro then exit;
         end;
         //-------------------------------------------------------------------------------
         if CorrDep <> 0 then
         begin
            if (Particip2 <= 100) then
            begin
               Histor := 'Correcao Monetaria da Depreciacao';
               //-------------------------------------------------------------------------
               sObrigaCC := '';
               FuncaoGeral.TestaContaCC(True, iPlanoConta, DebitoCM,
                                        sObrigaCC, sNomeConta, sObrigaSubConta);
               //-------------------------------------------------------------------------
               if sObrigaCC = 'S' then
               begin
                  if qryCcRDTIPO.AsString = 'A' then
                  begin
                     Particip2 := qryCcRDPARTICIPACAO.AsFloat;
                     Cc        := qryCcRDCODCENTROCUSTO.AsString;
                  end else
                  begin
                     MsgDlg('O Rateio de Custo do Conjunto ' + qryCcRDIDCONJUNTO.AsString +
                            ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                            'de Conjuntos!','Erro',mtError,[mbOk],0);
                     bErro := True;
                     exit;
                  end;
               end else
               begin
                  Particip2 := 100;
                  Cc        := '';
               end;
               //-------------------------------------------------------------------------
               ValLanc  := (CorrDep * Particip2) / 100;
               //-------------------------------------------------------------------------
               Monta_Contabilidade('D',Histor,Histor1,Histor2,Histor3,Histor4,
                                   Cc,sAtivProjeto,'',DebitoCM,sIdBem,vallanc,0,0,
                                   iGrupo,iPlanoConta,iSubConta,
                                   sObrigaCC,sNomeConta,sObrigaSubConta,
                                   strtoint(sIdBem),Sistema.IdEmpresa,fPlaca,bErro);
               if bErro then exit;
            end;
            //----------------------------------------------------------------------------
            if (Particip4 <= 100) then
            begin
               Histor := 'Correcao Monetaria da Depreciacao';
               //-------------------------------------------------------------------------
               sObrigaCC := '';
               FuncaoGeral.TestaContaCC(True, iPlanoConta, CreditoCM,
                                        sObrigaCC, sNomeConta, sObrigaSubConta);
               //-------------------------------------------------------------------------
               if sObrigaCC = 'S' then
               begin
                  if qryCcRDTIPO.AsString = 'A' then
                  begin
                     Particip4 := qryCcRDPARTICIPACAO.AsFloat;
                     Cc        := qryCcRDCODCENTROCUSTO.AsString;
                  end else
                  begin
                     MsgDlg('O Rateio de Custo do Conjunto ' + qryCcRDIDCONJUNTO.AsString +
                            ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                            'de Conjuntos!','Erro',mtError,[mbOk],0);
                     bErro := True;
                     exit;
                  end;
               end else
               begin
                  Particip4 := 100;
                  Cc        := '';
               end;
               //-------------------------------------------------------------------------
               ValLanc  := (CorrDep * Particip4) / 100;
               //-------------------------------------------------------------------------
               Monta_Contabilidade('C',Histor,Histor1,Histor2,Histor3,Histor4,
                                    Cc,sAtivProjeto,CreditoCm,'',sIdBem,ValLanc,0,0,
                                    iGrupo,iPlanoConta,iSubConta,
                                    sObrigaCC,sNomeConta,sObrigaSubConta,
                                    strtoint(sIdBem),Sistema.IdEmpresa,fPlaca,bErro);
               if bErro then exit;
            end;
         end;
         //-------------------------------------------------------------------------------
         qryCcRD.Next;
      end;
   except
      bErro := True;
   end;
end;
//========================================================================================
Procedure TfrmMovDepreciacao.Localiza_ContaeCentroCusto(iGrupo, iMovimentacao: integer;
                                                        sDebCred : string;
                                                        iPlano : integer;
                                                        var sPlaConta : string;
                                                        var sCCusto : string);
var
   iInd, iDebCred : Integer;

begin
   if (sDebCred = 'D') then
      iDebCred := 0
   else
      iDebCred := 1;
   //-------------------------------------------------------------------------------------
   iInd := 1;
   while (iInd <= iMaxCtaCtbDep) and
         ((aCtaCtbDep[iInd,1] <> strtofloat(inttostr(iGrupo))) or (aCtaCtbDep[iInd,2] <> strtofloat(inttostr(iMovimentacao))) or
          (aCtaCtbDep[iInd,3] <> strtofloat(inttostr(iPlano))) or (aCtaCtbDep[iInd,4] <> strtofloat(inttostr(iDebCred)))) do
         iInd := iInd + 1;
   //-------------------------------------------------------------------------------------
   if (iInd <= iMaxCtaCtbDep) then
      sPlaConta := trim(FormatFloat('##################',aCtaCtbDep[iInd,5]))
   else
      sPlaConta := '';
   //-------------------------------------------------------------------------------------
   sCCusto   := '';
  {qryConta.Close;
   qryConta.ParamByName('IGRUPO').AsInteger        := iGrupo;
   qryConta.ParamByName('IMOVIMENTACAO').AsInteger := iMovimentacao;
   qryConta.ParamByName('SDEBCRED').AsString       := sDebCred;
   qryConta.ParamByName('PLANO').AsInteger         := iPlano;
   qryConta.Open;
   //-------------------------------------------------------------------------------------
   sPlaConta := qryConta.FieldByName('PLACONTA').AsString;}
end;
//========================================================================================
Procedure TfrmMovDepreciacao.Monta_Contabilidade(sDebCred,Histor,Histor1,Histor2,
                                                 Histor3,Histor4,Cc,sAtivProjeto,
                                                 sContaCred,sContaDeb,sNumDoc : string;
                                                 ValLanc,ValF,ValG : Extended;
                                                 iGrupo,iPlano,iSubConta : integer;
                                                 sObrigaCC,sNomeConta,sObrigaSubConta : String;
                                                 iBem,iPessoa : Integer;fPlaca : Extended;
                                                 Var bErro : boolean);
var
   sConta,
   sCC               : String;
   iCodSubConta,
   iPatro,iPlanoPrev : Integer;
   fPercRateio       : Extended;

begin
   if ((strtofloat(Format('%17.5f',[ValLanc])) = 0) and
       (strtofloat(Format('%17.5f',[ValF])) = 0)    and
       (strtofloat(Format('%17.5f',[ValG])) = 0))   then
      exit;
   sCC := CC;
   iCodSubConta := iSubConta;
   //-------------------------------------------------------------------------------------
   if sContaCred <> '' then
      sConta := sContaCred
   else
      sConta := sContaDeb;
   //-------------------------------------------------------------------------------------
   if (ValLanc < 0) and (sCC = '0204') and ((sConta = '6213050302') or (sConta = '6213030302')) then
      Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   // Verifica se a conta contábil possui Centro de Custo
   //-------------------------------------------------------------------------------------
   if sObrigaCC = 'S' then
   begin
      with dtmAtivoFixo.qryContasxCc do
      begin
         Close;
         ParamByName('PIDEMPRESA').asInteger      := Sistema.IdEmpresa;
         ParamByName('PPLANO').asInteger          := iPlano;
         ParamByName('PPLACONTA').asString        := trim(sConta);
         ParamByName('PCODCENTROCUSTO').asString  := trim(sCc);
         Open;
         if isEmpty then
         begin
            if sCC = '' then
            begin
               MsgDlg('Bem '+floattostr(fPlaca)+' - O Centro de Custo é obrigatório na Conta Contábil ' + sConta +
                      ' no Plano ' + inttostr(iPlano) + '. Cadastre-o na Contabilidade.',
                      'Erro', mtError,[mbOk],0);
            end else
            begin
               MsgDlg('Bem '+floattostr(fPlaca)+' - Associe o Centro de Custo ' + sCC + ' à Conta Contábil ' + sConta +
                      ' no Plano ' + inttostr(iPlano) + ' usando o Cadastro de Plano ' +
                      'de Contas no Sistema da Contabilidade', 'Erro', mtError,[mbOk],0);
            end;
            bErro := True;
            exit;
         end;
      end;
   end else
   begin
      sCC := '';
   end;
   //-------------------------------------------------------------------------------------
   // Verifica se a conta contábil possui SubConta
   //-------------------------------------------------------------------------------------
   if sObrigaSubConta = 'S' then
   begin
      with dtmAtivoFixo.qryContasxSubC do
      begin
         Close;
         ParamByName('PIDEMPRESA').asInteger   := Sistema.IdEmpresa;
         ParamByName('PPLANO').asInteger       := iPlano;
         ParamByName('PPLACONTA').asString     := sConta;
         ParamByName('PCODSUBCONTA').asInteger := iCodSubConta;
         Open;
         if isEmpty then
         begin
            if iCodSubConta <= 0 then
            begin
               MsgDlg('Bem '+floattostr(fPlaca)+' - A SubConta é obrigatória na Conta Contábil ' + sConta +
                      ' no Plano ' + inttostr(iPlano) + '. Informe-a.',
                      'Erro', mtError,[mbOk],0);
            end else
            begin
               MsgDlg('Bem '+floattostr(fPlaca)+' - Associe a SubConta ' + inttostr(iCodSubConta) +
                      ' à Conta Contábil ' + sConta + ' no Plano ' + inttostr(iPlano) +
                      ' usando o Cadastro de Plano de Contas no Sistema da Contabilidade',
                      'Erro', mtError,[mbOk],0);
            end;
            bErro := True;
            exit;
         end;
      end;
   end else
   begin
      iCodSubConta := 0;
   end;
   //-------------------------------------------------------------------------------------
   // Pesquisa o Rateio de PlanoPatrocinadora do Bem para o calculo do rateio.
   // Caso não haja rateio definido, usa o padrão setado nos Parâmetros do Sistema.
   //-------------------------------------------------------------------------------------
   with dtmAtivoFixo do
   begin
      qryRatPP.Close;
      qryRatPP.ParamByName('PIDBEM').AsInteger     := iBem;
      qryRatPP.ParamByName('PIDEMPRESA').AsInteger := iPessoa;
      qryRatPP.Open;
      //----------------------------------------------------------------------------------
      repeat
         if qryRatPP.IsEmpty then
         begin
            with dtmAtivoFixo.qryParamCaf do
            begin
               Close;
               ParamByName('PIDPESSOA').asInteger := iPessoa;
               Open;
               if not IsEmpty then
               begin
                  iPatro     := FieldByName('PATROPADRAO').AsInteger;
                  iPlanoPrev := FieldByName('PLANPREVPADRAO').AsInteger;
               end else
               begin
                  iPatro     := IntegraBack.PatroGlobal;
                  iPlanoPrev := IntegraBack.PlanoPrevGlobal;
               end;
            end;
            fPercRateio := 1;
         end else
         begin
            iPatro      := qryRatPP.FieldByName('IDPLANOPREV').AsInteger;
            iPlanoPrev  := qryRatPP.FieldByName('IDPATRO').AsInteger;
            fPercRateio := qryRatPP.FieldByName('PPBPERCRATEIO').AsFloat / 100;
         end;
         //-------------------------------------------------------------------------------
         if not (qryAuxContab.Locate('PLANO;PLACONTA;CODCENTROCUSTO;LACDEBCRE;UNIDNEGOC;IDPATRO;IDPLANOPREV',
                 VarArrayOf([iPlano,sConta,Cc,sDebCred,strtoint(sAtivProjeto),iPatro,iPlanoPrev]),[])) then
         begin
            with qryAuxContab do
            begin
               Append;
               FieldByName('PLANO').AsInteger         := iPlano;
               FieldByName('PLACONTA').AsString       := sConta;
               FieldByName('CODCENTROCUSTO').AsString := sCc;
               FieldByName('LACDEBCRE').AsString      := sDebCred;
               FieldByName('LACNUMDOC').AsString      := sNumDoc;
               FieldByName('LACHIST1').AsString       := Histor;
               FieldByName('LACHIST2').AsString       := inttostr(iGrupo);
               FieldByName('LACHIST3').AsString       := Histor3;
               FieldByName('LACHIST4').AsString       := Histor4;
               FieldByName('LACHIST5').AsString       := '';
               FieldByName('UNIDNEGOC').AsString      := sAtivProjeto;
               //-------------------------------------------------------------------------
               if iCodSubConta <> 0 then
               begin
                  FieldByName('CODSUBCONTA').AsInteger := iCodSubConta;
               end else
               begin
                  FieldByName('CODSUBCONTA').Clear;
               end;
               //-------------------------------------------------------------------------
               FieldByName('IDPATRO').AsInteger          := iPatro;
               FieldByName('IDPLANOPREV').AsInteger      := iPlanoPrev;
               FieldByName('LACVALOR').AsFloat        := ValLanc * fPercRateio;
               FieldByName('LACVALOFICIAL').AsFloat   := ValF * fPercRateio;
               FieldByName('LACVALGERENCIAL').AsFloat := ValG * fPercRateio;
            end;
         end else
         begin
            with qryAuxContab do
            begin
               Edit;
               FieldByName('LACVALOR').AsFloat        := FieldByName('LACVALOR').AsFloat + (ValLanc * fPercRateio);
               FieldByName('LACVALOFICIAL').AsFloat   := FieldByName('LACVALOFICIAL').AsFloat + (ValF * fPercRateio);
               FieldByName('LACVALGERENCIAL').AsFloat := FieldByName('LACVALGERENCIAL').AsFloat + (ValG * fPercRateio);
            end;
         end;
         //-------------------------------------------------------------------------------
         if not qryRatPP.IsEmpty then
            qryRatPP.Next;
         //-------------------------------------------------------------------------------
      until qryRatPP.EOF;
   end;
end;
//========================================================================================
Procedure TfrmMovDepreciacao.Tot_Contabilidade(Exercicio,Periodo : Integer);
var
   sContaDeb,sContaCred,
   sGrupo                 : String;
   iPosition              : Integer;

begin
   prgBar.MaxValue := qryAuxContab.RecordCount;
   iPosition       := 0;
   prgBar.Progress := iPosition;
   //-------------------------------------------------------------------------------------
   qryAuxContab.First;
   while not qryAuxContab.Eof do
   begin
      sContaCred := '';
      sContaDeb  := '';
      if qryAuxContab.FieldByName('LACDEBCRE').AsString = 'C' then
         sContaCred := qryAuxContab.FieldByName('PLACONTA').AsString
      else
         sContaDeb  := qryAuxContab.FieldByName('PLACONTA').AsString;
      //----------------------------------------------------------------------------------
      // Localiza o Grupo
      //----------------------------------------------------------------------------------
      Busca_Grupo(strtoint(qryAuxContab.FieldByName('LACHIST2').AsString), sGrupo);
      qryAuxContab.edit;
      qryAuxContab.FieldByName('LACHIST2').AsString := 'Grupo ' + sGrupo;
      //----------------------------------------------------------------------------------
      LancaContabilidade(qryAuxContab.FieldByName('LACDEBCRE').AsString     ,
                         qryAuxContab.FieldByName('LACHIST1').AsString      ,
                         qryAuxContab.FieldByName('LACHIST2').AsString      ,
                         qryAuxContab.FieldByName('LACHIST3').AsString      ,
                         qryAuxContab.FieldByName('LACHIST4').AsString      ,
                         qryAuxContab.FieldByName('LACHIST5').AsString      ,
                         qryAuxContab.FieldByName('CODCENTROCUSTO').AsString,
                         qryAuxContab.FieldByName('CODSUBCONTA').AsString   ,
                         qryAuxContab.FieldByName('UNIDNEGOC').AsString     ,
                         sContaCred                                         ,
                         sContaDeb                                          ,
                         qryAuxContab.FieldByName('LACNUMDOC').AsString     ,
                         Exercicio                                          ,
                         Periodo                                            ,
                         qryAuxContab.FieldByName('LACVALOR').AsFloat       ,
                         qryAuxContab.FieldByName('LACVALOFICIAL').AsFloat  ,
                         qryAuxContab.FieldByName('LACVALGERENCIAL').AsFloat,
                         qryAuxContab.FieldByName('PLANO').AsInteger);
      //----------------------------------------------------------------------------------
      if pln = -1 then
      begin
         bErro := True;
         MsgDlg('Atenção! Erro na geração da Planilha.','Erro',mtError,[mbOk],0);
         exit;
      end;
      //----------------------------------------------------------------------------------
      iPosition       := 0;
      prgBar.Progress := iPosition;
      qryAuxContab.Next;
   end;
end;
//========================================================================================
procedure TfrmMovDepreciacao.ParamCorrecao(Var fCorrecao : Extended);
var
   fValAtual, fValAnt        : Extended;
   iMesFim, iAnoFim, iDiaFim : Word;
   sMesRef, sMesRefA         : String;
begin
   fCorrecao := 0;
   //-------------------------------------------------------------------------------------
   // Se calcula correção monetária -> calcula a correção do mês
   //-------------------------------------------------------------------------------------
   if qryParamCaf.FieldByName('FLGCALCCM').AsInteger = 1 then
   begin
      //----------------------------------------------------------------------------------
      // Data de Referência
      //----------------------------------------------------------------------------------
      DecodeDate(eData.date, iAnoFim, iMesFim, iDiaFim);
      //----------------------------------------------------------------------------------
      if iMesFim < 10 then
         sMesRef := '0' + InttoStr(iMesFim) + InttoStr(iAnoFim)
      else
         sMesRef := InttoStr(iMesFim) + InttoStr(iAnoFim);
      //----------------------------------------------------------------------------------
      if (iMesFim - 1) < 0 then
         sMesRefA := InttoStr(iAnoFim - 1) + '12'
      else
         if (iMesFim - 1) < 10 then
            sMesRefA := '0' + InttoStr(iMesFim - 1) + InttoStr(iAnoFim)
         else
            sMesRefA := InttoStr(iMesFim - 1) + InttoStr(iAnoFim);
      //----------------------------------------------------------------------------------
      fValAtual := 1;
      fValAnt   := 1;
      qryCotacao.Close;
      qryCotacao.ParamByName('MOECODIGO').AsInteger := qryParamCaf.FieldByName('MOEDAFISCAL').AsInteger;
      qryCotacao.ParamByName('COTMESREF').AsString  := sMesRef;
      qryCotacao.Open;
      //----------------------------------------------------------------------------------
      if not qryCotacao.isEmpty then
      begin
         fValAtual := qryCotacao.FieldByName('COTVALOR').AsFloat;
         qryCotacao.Close;
         qryCotacao.ParamByName('COTMESREF').AsString := sMesRefA;
         qryCotacao.Open;
         if not qryCotacao.isEmpty Then
            fValAnt := qryCotacao.FieldByName('COTVALOR').AsFloat;
      end;
      fCorrecao := fValAtual / fValAnt;
   end;
end;
//========================================================================================
Procedure TfrmMovDepreciacao.LocalizaContasContabCorrMonetaria(
                                          var iPlanoConta : integer;
                                          var debito,credito,sCCDebito,sCCCredito: string;
                                          var bErro:boolean; Tipo:Char; iGrupo : Integer);
var
   sGrupo : string;

begin
   if Tipo = 'B' then
   begin
      //----------------------------------------------------------------------------------
      // Busca conta a débito para a Correção Monetária do Bem
      //----------------------------------------------------------------------------------
      Localiza_ContaeCentroCusto(iGrupo,15,'D',iPlanoConta,Debito,sCCDebito);
      //----------------------------------------------------------------------------------
      // Busca conta a crédito para a Correção Monetária do Bem
      //----------------------------------------------------------------------------------
      Localiza_ContaeCentroCusto(iGrupo,15,'C',iPlanoConta,Credito,sCCCredito);
      //----------------------------------------------------------------------------------
      if (Credito = '') then
      begin
         Busca_Grupo(iGrupo,sGrupo);
         msgdlg('Conta a crédito para o Movimento Cálculo da Correção Monetária do '+
                'Grupo ' + sGrupo + ' não cadastrada !','Erro',mtError,[mbOk],0);
         bErro := true;
         exit;
      end;
      //----------------------------------------------------------------------------------
      if (Debito = '') then
      begin
         Busca_Grupo(iGrupo, sGrupo);
         msgdlg('Conta a débito para o Movimento Cálculo da Correção Monetária do '+
                'Grupo ' + sGrupo + ' não cadastrada !','Erro', mtError, [mbOk], 0);
         bErro := true;
         exit;
      end;
      //----------------------------------------------------------------------------------
   end else
   if Tipo = 'R' then
   begin
      //----------------------------------------------------------------------------------
      // Busca conta a crédito para Reavaliacao
      //----------------------------------------------------------------------------------
      Localiza_ContaeCentroCusto(iGrupo,22,'C',iPlanoConta,Credito,sCCCredito);
      //----------------------------------------------------------------------------------
      // Busca conta a débito para Reavaliação
      //----------------------------------------------------------------------------------
      Localiza_ContaeCentroCusto(iGrupo,22,'D',iPlanoConta,Debito,sCCDebito);
      //----------------------------------------------------------------------------------
      if (Credito = '') then
      begin
         Busca_Grupo(iGrupo,sGrupo);
         msgdlg('Conta a crédito para o Movimento Correção Monetária da Reavaliação '+
                'do grupo ' + sGrupo + ' não cadastrada !','Erro',mtError,[mbOk],0);
         bErro := True;
         exit;
      end;
      //----------------------------------------------------------------------------------
      if (Debito = '') then
      begin
         Busca_Grupo(iGrupo,sGrupo);
         msgdlg('Conta a débito para o Movimento Correção Monetária da Reavaliação '+
                'do grupo ' + sGrupo + ' não cadastrada !','Erro',mtError,[mbOk],0);
         bErro := True;
         exit;
      end;
   end else
   if Tipo = 'A' then
   begin
      //----------------------------------------------------------------------------------
      // Busca conta a crédito para Acréscimo
      //----------------------------------------------------------------------------------
      Localiza_ContaeCentroCusto(iGrupo,34,'C',iPlanoConta,Credito,sCCCredito);
      //----------------------------------------------------------------------------------
      // Busca conta a débito para Acréscimo
      //----------------------------------------------------------------------------------
      Localiza_ContaeCentroCusto(iGrupo,34,'D',iPlanoConta,Debito,sCCDebito);
      //----------------------------------------------------------------------------------
      if (Credito = '') then
      begin
         Busca_Grupo(iGrupo,sGrupo);
         msgdlg('Conta a crédito para o Movimento Correção Monetária do Acréscimo de Valor'+
                ' do grupo ' + sGrupo + ' não cadastrada !','Erro',mtError,[mbOk],0);
         bErro := True;
         exit;
      end;
      //----------------------------------------------------------------------------------
      if (Debito = '') then
      begin
         Busca_Grupo(iGrupo,sGrupo);
         msgdlg('Conta a débito para o Movimento Correção Monetária do Acréscimo de Valor'+
                ' do grupo ' + sGrupo + ' não cadastrada !','Erro',mtError,[mbOk],0);
         bErro := True;
         exit;
      end;
   end;
end;
//========================================================================================
Procedure TfrmMovDepreciacao.MontaRateioCorrMonetaria(
                                           iPlanoConta : Integer;
                                           debito,credito,sCCDebito,sCCCredito,sAtivProjeto,
                                           sDesBem,sIdBem : string; fPlaca : Extended;
                                           ValOfi : Extended;
                                           Var bErro : Boolean;
                                           iGrupo,iConjunto : Integer);
var
   Particip1,Particip2,ValLanc                         : Extended;
   Histor,Histor1,Histor2,Histor3,Histor4,Cc,sPlaCCust,
   sObrigaCC,sNomeConta,sObrigaSubConta                : string;
   iSubConta : Integer;

begin
   Histor    := 'Correcao Monetaria';
   Histor1   := sDesBem;
   Histor2   := '';
   Histor3   := '';
   Histor4   := '';
   Particip1 := 0;
   Particip2 := 0;
   //-------------------------------------------------------------------------------------
   qryTemp.Close;
   qryTemp.SQL.Text := ' SELECT PLACA FROM BEM ' +
                       ' WHERE (IDBEM = ' + sIdBem + ')';
   qryTemp.Open;
   if not qryTemp.IsEmpty then
   begin
      Histor4 := inttostr(qryTemp.FieldByName('PLACA').AsInteger);
   end else
   begin
      Histor4 := '';
   end;
   //-------------------------------------------------------------------------------------
   qryTemp.Close;
   qryTemp.SQL.Text := ' SELECT CODSUBCONTA FROM BEM ' +
                       ' WHERE (IDBEM = ' + sIdBem + ')';
   qryTemp.Open;
   if not qryTemp.IsEmpty then
   begin
      iSubConta := qryTemp.FieldByName('CODSUBCONTA').AsInteger;
   end else
   begin
      iSubConta := 0;
   end;
   //-------------------------------------------------------------------------------------
   // Busca RateioDepreciação do Bem
   //-------------------------------------------------------------------------------------
   qryCcRD.Close;
   qryCcRD.ParamByName('EMPRESA').AsFloat    := Sistema.IdEmpresa;
   qryCcRD.ParamByName('CONJUNTO').AsInteger := iConjunto ;
   qryCcRD.Open;
   //-------------------------------------------------------------------------------------
   qryCcRD.First;
   while not qryCcRD.EOF do
   begin
      if (Particip1 < 100) then
      begin
         if not bIntegraContab then
         begin
            Particip1 := qryCcRDPARTICIPACAO.AsFloat;
            Cc        := qryCcRDCODCENTROCUSTO.AsString;
            ValLanc   := (ValOfi * Particip1) / 100;
         end else
         begin
            //----------------------------------------------------------------------------
            Monta_qryPlanoConta(iPlanoConta,Debito,sPlaCCust);
            //----------------------------------------------------------------------------
            if sPlaCCust <> 'S' then
            begin
               Particip1 := 100;
               Cc        := '';
            end else
            begin
               Particip1 := qryCcRDPARTICIPACAO.AsFloat;
               Cc        := qryCcRDCODCENTROCUSTO.AsString
            end;
            ValLanc := (ValOfi * Particip1) / 100;
         end;
         //----------------------------------------------------------------------------
         Monta_Contabilidade('D',Histor,Histor1,Histor2,Histor3,Histor4,
                             Cc,sAtivProjeto,'',Debito,sIdBem,ValLanc,0,0,
                             iGrupo,iPlanoConta,iSubConta,
                             sObrigaCC,sNomeConta,sObrigaSubConta,
                             strtoint(sIdBem),Sistema.IdEmpresa,fPlaca,bErro);
         if bErro then exit;
      end;
      //----------------------------------------------------------------------------------
      if (Particip2 < 100) then
      begin
         if not bIntegraContab then
         begin
            Particip2 := qryCcRDPARTICIPACAO.AsFloat;
            Cc        := qryCcRDCODCENTROCUSTO.AsString;
            ValLanc   := (ValOfi * Particip2) / 100;
         end else
         begin
            //----------------------------------------------------------------------------
            Monta_qryPlanoConta(iPlanoConta,Credito,sPlaCCust);
            //----------------------------------------------------------------------------
            if sPlaCCust <> 'S' then
            begin
               Particip2 := 100;
               Cc        := '';
            end else
            begin
               Particip2 := qryCcRDPARTICIPACAO.AsFloat;
               Cc        := qryCcRDCODCENTROCUSTO.AsString
            end;
            ValLanc := (ValOfi * Particip2) / 100;
         end;
         //----------------------------------------------------------------------------
         Monta_Contabilidade('C',Histor,Histor1,Histor2,Histor3,Histor4,
                            Cc,sAtivProjeto,Credito,'',sIdBem,ValLanc,0,0,
                            iGrupo,iPlanoConta,iSubConta,
                            sObrigaCC,sNomeConta,sObrigaSubConta,
                            strtoint(sIdBem),Sistema.IdEmpresa,fPlaca,bErro);
         if bErro then exit;
         //----------------------------------------------------------------------------
      end;
      qryCcRD.Next;
   end;
end;
//========================================================================================
Procedure TfrmMovDepreciacao.RegistraCorrMonetaria(DtaFimD: string;
                                                   rCmBem,rCmBem1,rCmBem2 : Extended;
                                                   sIdBem,sCodCM:string);
var
   iSeqHist,
   iIdReavalAcresc : Integer;

begin
   try
      if (sCodCM = '22') then // CM Reavaliacao
         iIdReavalAcresc := qryReavaliacoesIDREAVALIACAO.AsInteger
      else
      if (sCodCM = '24') then // CM Acrescimo
         iIdReavalAcresc := qryAcrescimosIDACRESCIMO.AsInteger
      else
         iIdReavalAcresc := -1;
      //----------------------------------------------------------------------------------
      iSeqHist := AtivoFixo.RegistraMovimentacao(strtoint(sIdBem), Sistema.IdEmpresa,
                                                 Sistema.IdModulo,
                                                 strtoint(sCodCM), // 15, 22, 34
                                                 strtodate(DtaFimD), iIdReavalAcresc,
                                                 rCmBem, rCmBem1, rCmBem2,
                                                 dDataUltDepAnt,
                                                 -1,-1,-1,-1,-1,-1,-1,-1,-1,'',True);
      if iSeqHist = -1 then
         Raise eExcessaoCAF.Create('Depreciação : RegistraMovimentacao');
   except
      bErro := True;
      MsgDlg('Erro na gravação do registro de movimentação do bem '+sIdBem+' !',
             'Erro',mtError,[mbOk],0);
   end;
end;
//========================================================================================
Procedure TfrmMovDepreciacao.RegistraDepreciacao(DtaFimD: string;
                                                 DepTotalF,DepTotalG,DepTotalO,CorrDep:Extended;
                                                 sIdBem,sCodDep,sCodCMDep:string);
var
   iSeqHist,
   iIdReavalAcresc : Integer;

begin
   try
      if DepTotalO <> 0 then
      begin
         if sCodDep = '18' then // Depreciacao da Reavaliacao
            iIdReavalAcresc := qryReavaliacoesIDREAVALIACAO.AsInteger
         else
         if sCodDep = '35' then // Depreciacao do Acrescimo
            iIdReavalAcresc := qryAcrescimosIDACRESCIMO.AsInteger
         else
            iIdReavalAcresc := -1;
         //-------------------------------------------------------------------------------
         iSeqHist := AtivoFixo.RegistraMovimentacao(strtoint(sIdBem), Sistema.IdEmpresa,
                                                    Sistema.IdModulo,
                                                    strtoint(sCodDep), // 14, 18, 35
                                                    strtodate(DtaFimD), iIdReavalAcresc,
                                                    DepTotalO, DepTotalG, DepTotalF,
                                                    dDataUltDepAnt,
                                                    -1,-1,-1,-1,-1,-1,-1,-1,-1,'',True);
         if iSeqHist = -1 then
            Raise eExcessaoCAF.Create('Depreciação : RegistraMovimentacao');
      end;
      //----------------------------------------------------------------------------------
      // Registra a Correção Monetária da Depreciação
      //----------------------------------------------------------------------------------
      if CorrDep <> 0 then
      begin
         if sCodCMDep = '19' then // CM Depreciacao da Reavaliacao
            iIdReavalAcresc := qryReavaliacoesIDREAVALIACAO.AsInteger
         else
         if sCodCMDep = '36' then // CM Depreciacao do Acrescimo
            iIdReavalAcresc := qryAcrescimosIDACRESCIMO.AsInteger
         else
            iIdReavalAcresc := -1;
         //-------------------------------------------------------------------------------
         DepTotalG := 0.00;
         DepTotalF := 0.00;
         //-------------------------------------------------------------------------------
         iSeqHist := AtivoFixo.RegistraMovimentacao(strtoint(sIdBem), Sistema.IdEmpresa,
                                                    Sistema.IdModulo,
                                                    strtoint(sCodCMDep), // 21, 19, 36
                                                    strtodate(DtaFimD), iIdReavalAcresc,
                                                    CorrDep,DepTotalF,DepTotalG,
                                                    dDataUltDepAnt,
                                                    -1,-1,-1,-1,-1,-1,-1,-1,-1,'',True);
         if iSeqHist = -1 then
            Raise eExcessaoCAF.Create('Depreciação : RegistraMovimentacao');
      end;
   except
      bErro := True;
      MsgDlg('Erro na gravação do registro de movimentação do bem '+sIdBem+' !',
             'Erro',mtError,[mbOk],0);
      raise;
   end;
end;
//========================================================================================
Procedure TfrmMovDepreciacao.Busca_Grupo(iGrupo : Integer; var sGrupo : string);
begin
   //-------------------------------------------------------------------------------------
   // Busca Grupo Utilizado para pesquisa de Contas Cadastradas ou não
   //-------------------------------------------------------------------------------------
   qryGrupo.Close;
   qryGrupo.ParamByName('PIDGRUPO').AsInteger  := iGrupo;
   qryGrupo.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   qryGrupo.Open;
   if not qryGrupo.Eof then
      sGrupo := qryGrupoNOME.AsString
   else
      sGrupo := '';
end;
//========================================================================================
Procedure TfrmMovDepreciacao.LancaContabilidade(sDebCred,
                                                Histor,Histor1,Histor2,Histor3,Histor4,
                                                Cc,sSubConta,sAtivProjeto,
                                                sContaCred,sContaDeb,
                                                sIdBem : string;
                                                Exercicio,Periodo : integer;
                                                ValLanc,ValF,ValG : Extended;
                                                iPlano : integer);
var
   sSistOri, sCodDebCred,
   sValLanc, sPlaCCust,
   sCcCred, sCcDeb,
   sSubContaD, sSubContaC,
   sTipOper : string;

begin
   sPlaCCust := '';
   sMensagem := '';
   sCcCred   := '';
   sCcDeb    := '';
   //-------------------------------------------------------------------------------------
   with dtmAtivoFixo.qryParamCaf do
   begin
      Close;
      ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      Open;
      sTipOper := FieldByName('TIPOPERCTB').AsString;
   end;
   //-------------------------------------------------------------------------------------
   qryPlanoConta.Close;
   qryPlanoConta.ParamByName('PPLANO').AsFloat   := iPlano;
   if sDebCred = 'D' then
   begin
      sSubContaD := sSubConta;
      sCcDeb     := Cc;
      qryPlanoConta.ParamByName('PPLACONTA').AsString := sContaDeb;
   end else
   begin
      sSubContaC := sSubConta;
      sCcCred    := Cc;
      qryPlanoConta.ParamByName('PPLACONTA').AsString := sContaCred;
   end;
   qryPlanoConta.Open;
   //-------------------------------------------------------------------------------------
   sSistOri := inttostr(Sistema.IdModulo);
   if sDebCred  = 'D' then
      sCodDebCred  := '0'
   else
      sCodDebCred  := '1';
   //-------------------------------------------------------------------------------------
   sValLanc := FormatFloat('#0.00',ValLanc);
   ValLanc  := StrToFloat(sValLanc);
   //-------------------------------------------------------------------------------------
   if ValLanc <> 0.00 then
      try
         Planilha := LancaContab(True,'BaseDados',                                        // Base de Dados
                                 eData.Text,                                              // Data de Lançamento
                                 sSistOri,                                                // Sistema de origem - tabela Módulo
                                 sCodDebCred,                                             // 0=> Débito e 1=> Crédito
                                 sDebCred,                                                // D=> Débito e C=> Crédito
                                 qryPlanoContaPLATIPCONVOFICIAL.AsString,                 // Conversão à débito
                                 qryPlanoContaPLATIPCONVGER.AsString,                     // Conversão à débito
                                 qryPlanoContaPLATIPCONVGER.AsString,                     // Conversão à débito
                                 qryPlanoContaPLATIPCONVGER.AsString,                     // Conversão à débito
                                 'O',                                                     // Origem da aplicação a débito
                                 qryPlanoContaPLATIPCONVOFICIAL.AsString,                 // Conversão à Crédito
                                 qryPlanoContaPLATIPCONVGER.AsString,                     // Conversão à Crédito
                                 qryPlanoContaPLATIPCONVGER.AsString,                     // Conversão à Crédito
                                 qryPlanoContaPLATIPCONVGER.AsString,                     // Conversão à Crédito
                                 'O',                                                     // Origem da aplicação a crédito
                                 sIdBem,                                                  // qryBens.FieldByName('IDNOTA').AsString, // Número do Documento
                                 Histor,                                                  // Histórico 1
                                 Histor1,                                                 // Histórico 2
                                 Histor2,                                                 // Histórico 3
                                 Histor3,                                                 // Histórico 4
                                 Histor4,                                                 // Histórico 5
                                 sTipOper,                                                //
                                 sCcDeb,                                                  // ccusto a débito
                                 sContaDeb, {debito}                                      // Conta Contábil a débito
                                 sCcCred,                                                 // ccusto a crédito
                                 sContaCred,{credito}                                     // conta contábil a crédito
                                 Exercicio,                                               // exercício (perexercício)
                                 Periodo,                                                 // pernumero (tabperiodo)
                                 Sistema.IdEmpresa,                                       // pessoa
                                 Sistema.IdUsuario,                                       // usuário
                                 iPlano,                                                  // plano
                                 ValLanc,                                                 // valor do lançamento
                                 0,
                                 0,
                                 0,
                                 0,
                                 0,
                                 0,
                                 0,
                                 0,
                                 sAtivProjeto,                                            // unidade de negócio
                                 False,                                                   // bjunta = false
                                 0,                                                       //
                                 0,                                                       //
                                 sSubContaD,                                                      // subconta a credito
                                 sSubContaC,                                                      //
                                 '',                                                      //
                                 '',                                                      //
                                 pln,           // Se 0, Cria Nova Pln, Senão Grava na pln
                                 sMensagem,
                                 IntegraBack.MascaraPlano,
                                 True,
                                 0,
                                 2, // IntegraBack.PlanoPrevGlobal, // Plano Previdenciário
                                 1, // IntegraBack.PatroGlobal,     // Patrocinadora
                                 Sistema.UsaPlanoPatro              // Empresa usa Plano/Patrocinadora
                                 );
         pln := Planilha;
      except
         pln := -1;
      end;
end;
//========================================================================================
Procedure TfrmMovDepreciacao.Monta_qryPlanoConta(iPlano : Integer;
                                                 sConta : String;
                                                 Var sPlaCCust : String);
begin
   qryPlanoConta.Close;
   qryPlanoConta.ParamByName('PPLANO').AsFloat       := iPlano;
   qryPlanoConta.ParamByName('PPLANOCONTA').AsString := sConta;
   qryPlanoConta.Open;
   if not qryPlanoConta.IsEmpty then
      sPlaCCust := qryPlanoContaPLACCUST.AsString
   else
      sPlaCCust := '';
end;
//========================================================================================
Function TfrmMovDepreciacao.Testa_Periodo_Contabil(sData: string) : boolean;
Var
   iEmpresa : Integer;

Begin
   iEmpresa := Sistema.IdEmpresa;
   //-------------------------------------------------------------------------------------
   // busca exercício e número do período referente a data informada
   //-------------------------------------------------------------------------------------
   ResultPeriodo := TestaPeriodo(True,'BaseDados',sData,'2',Exercicio,Periodo,
                                 iEmpresa,sMensagem);
   //-------------------------------------------------------------------------------------
   // Testa retornos de erro da função
   //-------------------------------------------------------------------------------------
   if ResultPeriodo = 1 then
   begin
      MsgDlg('Período Contábil inexistente ! Impossível gerar lançamento contábil da '+
             'movimentação do Bem. Altere a data da movimentação. ','Erro',
             mtError,[mbOk],0);
      bErro    := True;
      Planilha := 0;
      Pln      := 0;
      result   := false;
      exit;
   end else
      if ResultPeriodo = 2 then
      begin
         MsgDlg('Período encontrado, mas não é único ! Impossível gerar lançamento '+
                'contábil da movimentação do Bem. Altere a data de movimentação.','Erro',
                mtError,[mbOk],0);
         bErro    := True;
         Planilha := 0;
         Pln      := 0;
         result   := false;
         exit;
      end else
         if ResultPeriodo = 3 then
         begin
            MsgDlg('Período já bloqueado pela Contabilidade ! Impossível gerar lançamento '+
                   'contábil da movimentação do Bem. Altere a data de movimentação.','Erro',
                   mtError,[mbOk],0);
            bErro    := True;
            Planilha := 0;
            Pln      := 0;
            result   := False;
            exit;
         end else
            if ResultPeriodo = 4 then
            begin
               MsgDlg('Período já bloqueado pela Integração ! Impossível gerar lançamento '+
                      'contábil da movimentação do Bem. Altere a data de movimentação.','Erro',
                      mtError,[mbOk],0);
               bErro    := True;
               planilha := 0;
               Pln      := 0;
               result   := False;
               exit;
            end;
   //-------------------------------------------------------------------------------------
   result := True;
end;
//========================================================================================
Procedure TfrmMovDepreciacao.Tot_HistoricoMovimentacao(iIdTipoMov, iPlanilha : Integer);
begin
   qryHistCtb.ParamByName('PIDTIPOMOVIMENTACAO').AsInteger := iIdTipoMov;
   qryHistCtb.ParamByName('PDATAMOVIMENTACAO').AsDateTime  := eData.Date;
   qryHistCtb.ParamByName('PPLNCODIGO').AsInteger          := iPlanilha;
   qryHistCtb.ExecSQL;
end;
//========================================================================================
procedure TfrmMovDepreciacao.Calcula_Moedas(fValOfi : Extended; dData : tDateTime;
                                            Var fValFis, fValGer : Extended);
begin
   //-------------------------------------------------------------------------------------
   if (qryParamCaf.FieldByName('MOEDAGERENCIAL').AsString <> '') then
   begin
      if ((fCotGerencial = 0) or (fCotFiscal = 0)) then
      begin
         // Busca Cotacoes do dia das moedas
         // Gerencial
         Verifica_Cotacao_Moeda(dData,qryParamCaf.fieldbyname('MOEDAGERENCIAL').AsString);
         fCotGerencial := qryMoeda.fieldbyname('COTVALOR').AsFloat;
         // Fiscal
         Verifica_Cotacao_Moeda(dData,qryParamCaf.fieldbyname('MOEDAFISCAL').AsString);
         fCotFiscal    := qryMoeda.fieldbyname('COTVALOR').AsFloat;
      end;
      //----------------------------------------------------------------------------------
      if fValOfi <> 0 then
      begin
         //-------------------------------------------------------------------------------
         // Calcula Valor na moeda Gerencial de acordo com a cotação do dia fornecido
         //-------------------------------------------------------------------------------
         if fCotGerencial = 0 then
         begin
            msgdlg('Cotação da moeda Gerencial em '+datetostr(dData)+' não cadastrada ! '+
                   'Valor Gerencial não será calculado!','Erro',mtError,[mbOk],0);
            fValGer := 0;
         end else
            fValGer := fValOfi / fCotGerencial;
         //-------------------------------------------------------------------------------
         // Calcula Valor Atual na moeda Fiscal
         //-------------------------------------------------------------------------------
         if fCotFiscal = 0 then
         begin
            msgdlg('Cotação da moeda Fiscal em '+datetostr(dData)+' não cadastrada ! '+
                   'Valor Fiscal não será calculado!','Erro',mtError,[mbOk],0);
            fValFis := 0;
         end else
            fValFis := fValOfi / fCotFiscal;
      end;
   end;
end;
//========================================================================================
Procedure TfrmMovDepreciacao.Verifica_Cotacao_Moeda(dData : tDateTime; sMoeda : string);
var
   sData : string;
Begin
   bErro := false;
   //-------------------------------------------------------------------------------------
   qryTemp.Close;
   qryTemp.SQL.Text := ' SELECT MOECODIGO,MOEPERIODICIDADE,MOEDESC  ' +
                       ' FROM  MOEDA ' +
                       ' WHERE MOECODIGO = ' + sMoeda;
   qryTemp.Open;
   //-------------------------------------------------------------------------------------
   if qryTemp.FieldByName('MOEPERIODICIDADE').AsString = 'M' then
   begin
      sData := copy(datetostr(dData),4,2) + copy(datetostr(dData),7,4);
      qryMoeda.Close;
      qryMoeda.SQL.Text := ' SELECT COTVALOR ' +
                           ' FROM COTACAOMOEDA ' +
                           ' WHERE MOECODIGO = ' + sMoeda +
                           '   AND COTMESREF = ' + #39 + sData + #39;
      qryMoeda.Open;
      //----------------------------------------------------------------------------------
      if qryMoeda.IsEmpty then
      begin
         msgdlg('Cotação não cadastrada -> '+qryTemp.fieldbyname('MOEDESC').AsString
                + ' do Mês ' + sData ,'Erro',mtError, [mbOk], 0);
      end;
   end;
   //-------------------------------------------------------------------------------------
   if qryTemp.fieldbyname('MOEPERIODICIDADE').AsString = 'D' then
   begin
      sData := datetostr(dData);
      qryMoeda.Close;
      qryMoeda.SQL.Text := ' SELECT COTVALOR ' +
                           ' FROM COTACAOMOEDA ' +
                           ' WHERE MOECODIGO = ' + sMoeda +
                           '   AND COTDATA = TO_DATE('+#39+sData+#39+','+#39+'dd/MM/yyyy'+#39+')';
      qryMoeda.Open;
      //----------------------------------------------------------------------------------
      if qryMoeda.isEmpty then
      begin
         msgdlg('Cotação não cadastrada -> '+qryTemp.fieldbyname('MOEDESC').AsString
                + ' do Dia ' + sData ,'Erro',mtError, [mbOk], 0);
      end;
   end;
end;
//========================================================================================
procedure TfrmMovDepreciacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   inherited;
   qryVerUltDep.Close;
   qrySubConta.Close;
   cdsBem.Close;
   qryParamCaf.Close;
   qryParamGlob.Close;
   qryReavaliacoes.Close;
   qryCotacao.Close;
   //qryConta.Close;
   qryGrupo.Close;
   qryPlanoConta.Close;
   qryCCrd.Close;
   qryAuxContab.Close;
   qryContasxCc.Close;
   qryGrupoBem.Close;
   qryVerUltDep.UnPrepare;
   qryGrupoBem.UnPrepare;
   qrySubConta.unprepare;
   qryParamCaf.unprepare;
   qryParamGlob.unprepare;
   qryReavaliacoes.unprepare;
   qryCotacao.unprepare;
   //qryConta.unprepare;
   qryGrupo.unprepare;
   qryPlanoConta.unprepare;
   qryCCrd.unprepare;
   qryAuxContab.unprepare;
   qryInsHistorico.unprepare;
   qryContasxCc.unprepare;
   qryHistCtb.unPrepare;
   qryAlteraBem.Prepare;
end;
//========================================================================================
procedure TfrmMovDepreciacao.eDataExit(Sender: TObject);
Var
   iAnoFim, iMesFim, iDiaFim,
   iAno, iMes, iDia           : Word;

begin
   inherited;
   if eData.Text = '' then
   begin
      MsgDlg('Preencha o campo Data','Erro',mtError,[mbOk],0);
      eData.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if qryParamCAF.FieldByName('FLGTIPOCALC').AsString = 'A' then
   begin
      DecodeDate(eData.Date, iAno, iMes, iDia);
      eData.Date := EncodeDate(iAno, 12, 31);
   end else
   if qryParamCaf.FieldByName('FLGTIPOCALC').AsString = 'M' then
   begin
      DecodeDate(eData.Date, iAno, iMes, iDia);
      DecodeDate(DiasUteis.UltDiaMes(iAno, iMes), iAnoFim, iMesFim, iDiaFim);
      eData.Date := EncodeDate(iAnoFim, iMesFim, iDiaFim);
   end;
end;
//========================================================================================
//procedure TfrmMovDepreciacao.Atualiza_Carteira(var bErro : Boolean);
//begin
//   bErro := False;
//   if ( (Sistema.IdModulo = 64) and (Modulo.bIntegraGestao) ) then begin
//      lblStatus.Caption := 'Atualizando Carteira';
//      prgBar.Progress   := 0;
//      try
//         if not(qry.Prepared) then qry.Prepare;
//         qry.ParamByName('DATADEPREC').asDateTime := eData.Date;
//         qry.Open;
//         //-------------------------------------------------------------------------------
//         prgBar.MaxValue := qry.RecordCount;
//         qry.First;
//         while not qry.EOF do begin
//            OperComum.AlimentaCarteira(Sistema.idEmpresa, 64{iModuloOrigem}, qryIDIMOVEL.asInteger{iInvestimento},
//                      3{iTipoInvest}, -1{iOperacao}, -1{iLancImovel}, -1{itipoOperacao},
//                      qryIDCARTEIRAINVEST.asInteger{iCarteira}, -1{iDespesaOperacao}, -1{iDespesaCarteira},
//                      -1{iPlanilha}, -1{iDocumento}, IntegraBack.Plano, EData.Date, qryVALOROPERACAO.asFloat{fValorOperacao},
//                      0{Quantidade}, Modulo.fVlrPrimeiraCota, 0, 0, 0, 0, 0, 0, 0, 'P'{sNaturezaMovimento},
//                      ' '{sNaturezaOperacao}, ''{sLote}, 'Depreciação'{sHistorico}, 'DEP'{TipoMovimento},
//                      ''{flgCustodia}, ''{sRecPag}, False{bMostraMsg});
//            qry.Next;
//            prgBar.Progress := prgBar.Progress + 1;
//         end;
//         //-------------------------------------------------------------------------------
//         qry.Close;
//      except
//         bErro := True;
//      end;
//   end;
//end;

end.

