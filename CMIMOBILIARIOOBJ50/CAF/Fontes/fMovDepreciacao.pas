unit fMovDepreciacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc, DBTables,
  Wwquery,uAutorizacao,uSistema, Gauges, wwdbdatetimepicker,
  CMDateTimePicker, DBClient, Provider;

type
  TCtaCtbDep = record
    iGrupo     : Integer;
    iTipoMov   : Integer;
    iPlano     : Integer;
    sTipoLanc  : String;
    sPlaConta  : String;
  end;
  //------------------------------------------------------------------------------------
  TfrmMovDepreciacao = class(TfrmOkCancelar)
    Panel1: TPanel;
    Data: TLabel;
    edDataFechamento: TCMDateTimePicker;
    qryGrupoBem: TwwQuery;
    qryGrupoBemIDPESSOA: TFloatField;
    qryGrupoBemIDBEM: TFloatField;
    qryGrupoBemIDGRUPO: TFloatField;
    qryGrupoBemFLGIMOVEL: TFloatField;
    qryBem: TwwQuery;
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
    QryCCrdCODCENTROCUSTO: TStringField;
    QryCCrdNOME: TStringField;
    QryCCrdTIPO: TStringField;
    QryCCrdPARTICIPACAO: TFloatField;
    QryCCrdIDCONJUNTO: TFloatField;
    qryPlanoConta: TwwQuery;
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
    qryAlteraBemCM: TwwQuery;
    qryVerUltDep: TwwQuery;
    qryCtaCtbDep: TwwQuery;
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
    qryReavaliacoesPLACA: TFloatField;
    qryVerUltDepDATAMOVIMENTACAO: TDateTimeField;
    qryReavaliacoesFLGULTREAVAL: TFloatField;
    qryVerUltDepOld: TwwQuery;
    DateTimeField1: TDateTimeField;
    qryMoedaCOTVALOR: TFloatField;
    qryReavaliacoesIDLOCALIZACAO: TFloatField;
    qryReavaliacoesIDRESPONSAVEL: TFloatField;
    chkDeprecImob: TCheckBox;
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
    qryAcrescimosPLACA: TFloatField;
    qryAcrescimosIDGRUPO: TFloatField;
    qryAcrescimosDESBEM: TStringField;
    qryAcrescimosDATAINICIODEP: TDateTimeField;
    qryAcrescimosIDCONJUNTO: TFloatField;
    qryAcrescimosIDLOCALIZACAO: TFloatField;
    qryAcrescimosIDRESPONSAVEL: TFloatField;
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
    qryBemPLACA: TFloatField;
    qryBemIDLOCALIZACAO: TFloatField;
    qryBemIDRESPONSAVEL: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure edDataFechamentoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    MensagemErro,
    sAtivProjetoPadrao : String;
    bCalcCM, bCalcDep  : Boolean;
    iFlgDeprec         : Integer;
  public
    { Public declarations }
    bErro            : boolean;            // verifica se há erro
    bErroAtualizacao : boolean;            // verifica se há erro na finalizacao
    bIntegraContab   : boolean;            // verifica se há integração com a contabilidade
    Exercicio,Periodo,Empresa : integer;
    Planilha    : longint;
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
    //------------------------------------------------------------------------------------
    aCtaCtbDep    : array of TCtaCtbDep;
    iMaxCtaCtbDep : Integer;
    //------------------------------------------------------------------------------------
    Function  Confirma_Atualizacao : boolean;
    Procedure Cancela_Atualizacao;
    Function  Calcula_Ultima_Depreciacao(dDataMov : tDateTime; Var dDataUlt : tDateTime) : Boolean;
    Procedure Calcula_Depreciacao_Bem;
    procedure ParamCorrecao(Var fCorrecao : Extended);
    Procedure ParamFatorPeriodo(var rFator,rTotDiaAno,rTotDia : Extended;
                                sDataUltDep : string);
    Procedure ContabilizaCorrMonetaria(Tipo : String; iPlanoConta : Integer;
                                      sAtivProjeto, sDesBem, sIdBem : string;
                                      fPlaca, ValOfi : Extended;
                                      iGrupo, iConjunto, iSubConta : Integer);
    Procedure RegistraCorrMonetaria(DtaFimD: string;
                                    rCmBem,rCmBem1,rCmBem2 : Extended;
                                    sIdBem,sCodCM:string);
    Procedure ContabilizaDepreciacao(Tipo : String; iPlanoConta : integer;
                                    sAtivProjeto, sDesbem, sIdBem : string;
                                    fPlaca, DepTotalO, CorrDep : Extended;
                                    iGrupo,iConjunto,iSubConta : Integer);
    Procedure RegistraDepreciacao(DtaFimD: string;
                                  DepTotalF,DepTotalG,DepTotalO,CorrDep : Extended;
                                  sIdBem,sCodDep,sCodCMDep:string);
    Procedure Localiza_ContaContabil(iGrupo, iMovimentacao: integer;
                                     sDebCred : string;
                                     iPlano : integer;
                                     var sPlaConta : string);
    Procedure MontaPlanilhaContabil(Histor, Histor1, Histor2, Histor3, Histor4,
                                    sCcDeb, sCCCre, sAtivProjeto,
                                    sContaCre, sContaDeb, sNumDoc : string;
                                    ValLanc : Extended;
                                    iGrupo, iPlano, iSubConta : Integer;
                                    sNomeContaDeb, sObrigaSubContaDeb,
                                    sNomeContaCre, sObrigaSubContaCre : String;
                                    iBem, iPessoa : Integer; fPlaca : Extended);
    Function RegistraPlanilhaContabil(Exercicio,Periodo : Integer) : Boolean;
    Function Busca_Grupo(iGrupo : Integer) : String;
    Function Testa_Periodo_Contabil(sData: string) : boolean;
    Procedure Atualiza_Depreciacao;
    Procedure Cancela_Depreciacao;
    Procedure Tot_HistoricoMovimentacao(iIdTipoMov, iPlanilha : Integer);
    Procedure Calcula_Depreciacao_Reav;
    Procedure Atualiza_Depreciacao_Reav;
    Procedure Cancela_Depreciacao_Reav;
    Procedure Calcula_Depreciacao_Acresc;
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

//========================================================================================
// Ativa a opção de depreciar o Imobiliario
//========================================================================================
//========================================================================================
procedure TfrmMovDepreciacao.FormCreate(Sender: TObject);
Var
   iAnoFim, iMesFim, iDiaFim,
   iAno, iMes, iDia           : Word;

begin
   inherited;
   qryReavaliacoes.Prepare;
   qryVerUltDep.Prepare;
   qryAlteraBem.Prepare;
   qryAlteraBemCM.Prepare;
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
   //-------------------------------------------------------------------------------------
   dtmAtivoFixo.qryParamCAF.Close;
   dtmAtivoFixo.qryParamCAF.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   dtmAtivoFixo.qryParamCAF.Open;
   iPlanoConta := dtmAtivoFixo.qryParamCAF.FieldByName('PLANOVIGENTE').AsInteger;
   //-------------------------------------------------------------------------------------
   // Calculo da data baseado na opção dos Parâmetros do CAF
   //-------------------------------------------------------------------------------------
   if Sistema.IdModulo = 7 then
   begin
      if copy(dtmAtivoFixo.qryParamCaf.FieldByName('SISTEMAS').AsString, 4, 1) <> '1' then
      begin
         iGrupoDeprec := 2;
      end else
      begin
         if chkDeprecImob.Checked then
            iGrupoDeprec := 1
         else
            iGrupoDeprec := 0;
      end;
   end else
   begin
      iGrupoDeprec := 1;
   end;
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
   qryVerUltDep.Close;
   qryVerUltDep.ParamByName('PIDPESSOA').AsInteger     := Sistema.IdEmpresa;
   qryVerUltDep.ParamByName('PFLGIMOVELINI').AsInteger := iGrupoDepIni;
   qryVerUltDep.ParamByName('PFLGIMOVELFIM').AsInteger := iGrupoDepFim;
   qryVerUltDep.Open;
   //-------------------------------------------------------------------------------------
   if (Sistema.IdModulo = 7) or (((Sistema.IdModulo <> 7) or chkDeprecImob.Checked) and
                                (dtmAtivoFixo.qryParamCAF.FieldByName('FLGDIARIO').AsString <> 'S')) then
   begin
      //----------------------------------------------------------------------------------
      // Calculo Anual
      //----------------------------------------------------------------------------------
      if dtmAtivoFixo.qryParamCAF.FieldByName('FLGTIPOCALC').AsString = 'A' then
      begin
         DecodeDate(qryVerUltDep.FieldByName('DATAMOVIMENTACAO').AsDateTime, iAno, iMes, iDia);
         iAnoFim := iAno + 1;
         iMesFim := 12;
         iDiaFim := 31;
      end else
      //----------------------------------------------------------------------------------
      // Calculo Mensal
      //----------------------------------------------------------------------------------
      if dtmAtivoFixo.qryParamCAF.FieldByName('FLGTIPOCALC').AsString = 'M' then
      begin
         DecodeDate(qryVerUltDep.FieldByName('DATAMOVIMENTACAO').AsDateTime + 28, iAno, iMes, iDia);
         DecodeDate(DiasUteis.UltDiaMes(iAno, iMes), iAnoFim, iMesFim, iDiaFim);
      end else
      //----------------------------------------------------------------------------------
      // Calculo Diario
      //----------------------------------------------------------------------------------
      if dtmAtivoFixo.qryParamCAF.FieldByName('FLGTIPOCALC').AsString = 'D' then
      begin
         DecodeDate(qryVerUltDep.FieldByName('DATAMOVIMENTACAO').AsDateTime + 1, iAnoFim, iMesFim, iDiaFim);
      end;
   end else
   begin
      DecodeDate(qryVerUltDep.FieldByName('DATAMOVIMENTACAO').AsDateTime + 1, iAnoFim, iMesFim, iDiaFim);
   end;
   edDataFechamento.Date := EncodeDate(iAnoFim, iMesFim, iDiaFim);
   //-------------------------------------------------------------------------------------
   bIntegraContab := AtivoFixo.IntegraContab(Sistema.IdEmpresa);
   //-------------------------------------------------------------------------------------
   qryCtaCtbDep.Close;
   qryCtaCtbDep.ParamByName('PLANO').AsInteger := iPlanoConta;
   qryCtaCtbDep.Open;
   iMaxCtaCtbDep := 0;
   while not qryCtaCtbDep.EOF do
   begin
      SetLength(aCtaCtbDep, iMaxCtaCtbDep + 1);
      //----------------------------------------------------------------------------------
      aCtaCtbDep[iMaxCtaCtbDep].iGrupo    := qryCtaCtbDep.FieldByName('IDGRUPO').AsInteger;
      aCtaCtbDep[iMaxCtaCtbDep].iTipoMov  := qryCtaCtbDep.FieldByName('IDTIPOMOVIMENTACAO').AsInteger;
      aCtaCtbDep[iMaxCtaCtbDep].iPlano    := qryCtaCtbDep.FieldByName('PLANO').AsInteger;
      aCtaCtbDep[iMaxCtaCtbDep].sTipoLanc := qryCtaCtbDep.FieldByName('TIPOLANCAMENTO').AsString;
      aCtaCtbDep[iMaxCtaCtbDep].sPlaConta := qryCtaCtbDep.FieldByName('PLACONTA').AsString;
      //----------------------------------------------------------------------------------
      iMaxCtaCtbDep := iMaxCtaCtbDep + 1;
      qryCtaCtbDep.Next;
   end;
   MensagemErro := '';
end;
//========================================================================================
procedure TfrmMovDepreciacao.bbtnConfirmarClick(Sender: TObject);
var
   dDataUltDep  : tDateTime;

begin
   inherited;
   MensagemErro := '';
   //-------------------------------------------------------------------------------------
   try
      if edDataFechamento.Text = '' then
         Raise Exception.Create('Data do Fechamento deve ser informada!');
      //----------------------------------------------------------------------------------
      // Calculo da data correta baseado na opção dos Parâmetros do CAF
      //----------------------------------------------------------------------------------
      if Sistema.IdModulo = 7 then
      begin
         if copy(dtmAtivoFixo.qryParamCaf.FieldByName('SISTEMAS').AsString, 4, 1) <> '1' then
         begin
            iGrupoDeprec := 2;
         end else
         begin
            if chkDeprecImob.Checked then
               iGrupoDeprec := 1
            else
               iGrupoDeprec := 0;
         end;
      end else
      begin
         iGrupoDeprec := 1;
      end;
      //----------------------------------------------------------------------------------
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
      //----------------------------------------------------------------------------------
      qryAuxContab.Close;
      qryAuxContab.Open;
      //----------------------------------------------------------------------------------
      // Integração Contábil
      //----------------------------------------------------------------------------------
      if bIntegraContab then
      begin
         if not Testa_Periodo_Contabil(edDataFechamento.Text) then
            Raise Exception.Create(MensagemErro);
         //-------------------------------------------------------------------------------   
         with dtmAtivoFixo do
         begin
            qryParamCAF.Close;
            qryParamCAF.ParamByName('PIDPESSOA').asInteger := Sistema.IdEmpresa;
            qryParamCAF.Open;
            if not qryParamCAF.IsEmpty then
               sAtivProjetoPadrao := qryParamCAF.FieldByName('ATIVPROJETO').AsString
            else
               Raise Exception.Create('O Parâmetro do Sistema ATIVIDADE/PROJETO Padrão está indefinido!');
         end;
      end;
      //----------------------------------------------------------------------------------
      StartTransacao;
      //----------------------------------------------------------------------------------
      bErro            := False;
      bErroAtualizacao := False;
      dDataUltDep      := edDataFechamento.Date;
      //----------------------------------------------------------------------------------
      Screen.Cursor         := crSQLWait;
      bbtnConfirmar.Enabled := False;
      bbtnSair.Enabled      := False;
      pnlStatus.Visible     := True;
      lblStatus.Caption     := 'Verificando Ultimo Fechamento ...';
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      if Calcula_Ultima_Depreciacao(edDataFechamento.Date,dDataUltDep) then
      begin
         if not bErro then Calcula_Depreciacao_Bem;
         if not bErro then Calcula_Depreciacao_Reav;
         if not bErro then Calcula_Depreciacao_Acresc;
      end else
         Raise Exception.Create('Data Igual ou Anterior ao Último Fechamento Realizado ! ' + DatetoStr(dDataUltDep));
      //----------------------------------------------------------------------------------
      if not bErro then
      begin
         if Confirma_Atualizacao then
         begin
            if not Sistema.GravaLogOperacoes('Fechamento de Periodo - ' + edDataFechamento.Text) then
               raise Exception.Create('Erro ao gravar Log de Operação');
            //----------------------------------------------------------------------------
            CommitTransacao;
            MsgDlg('Operação Realizada!','Informação',mtInformation,[mbOk],0);
         end else
         begin
            Raise Exception.Create(MensagemErro);
         end;
      end else
      begin
         Raise Exception.Create(MensagemErro);
      end;
   except
      on E : Exception do
      begin
         Cancela_Atualizacao;
         RollBackTransacao;
         MsgDlg('Operação não realizada!' + #13 + #13 +
                'Causa : ' + E.Message, 'Erro', mtError, [mbOk], 0);
      end;
   end;
   pnlStatus.Visible := False;
   Screen.Cursor := crDefault;
   bbtnConfirmar.Enabled := True;
   bbtnSair.Enabled      := True;
end;
//========================================================================================
Function TfrmMovDepreciacao.Confirma_Atualizacao : Boolean;
begin
   if not bErroAtualizacao then Atualiza_Depreciacao;
   if not bErroAtualizacao then Atualiza_Depreciacao_Reav;
   if not bErroAtualizacao then Atualiza_Depreciacao_Acresc;
   Result := not bErroAtualizacao;
end;
//========================================================================================
Procedure TfrmMovDepreciacao.Cancela_Atualizacao;
begin
   Cancela_Depreciacao;
   Cancela_Depreciacao_Reav;
   Cancela_Depreciacao_Acresc;
end;
//========================================================================================
procedure TfrmMovDepreciacao.edDataFechamentoExit(Sender: TObject);
Var
   iAnoFim, iMesFim, iDiaFim,
   iAno,    iMes,    iDia           : Word;

begin
   inherited;
   if edDataFechamento.Text = '' then
   begin
      MsgDlg('Forneça o Data do Fechamento','Erro',mtError,[mbOk],0);
      edDataFechamento.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if (Sistema.IdModulo = 7) or (((Sistema.IdModulo <> 7) or chkDeprecImob.Checked) and
                                 (dtmAtivoFixo.qryParamCAF.FieldByName('FLGDIARIO').AsString <> 'S')) then
   begin
      //----------------------------------------------------------------------------------
      // Calculo Anual
      //----------------------------------------------------------------------------------
      if dtmAtivoFixo.qryParamCAF.FieldByName('FLGTIPOCALC').AsString = 'A' then
      begin
         DecodeDate(edDataFechamento.Date, iAno, iMes, iDia);
         iAnoFim := iAno + 1;
         iMesFim := 12;
         iDiaFim := 31;
      end else
      //----------------------------------------------------------------------------------
      // Calculo Mensal
      //----------------------------------------------------------------------------------
      if dtmAtivoFixo.qryParamCAF.FieldByName('FLGTIPOCALC').AsString = 'M' then
      begin
         DecodeDate(edDataFechamento.Date, iAno, iMes, iDia);
         DecodeDate(DiasUteis.UltDiaMes(iAno, iMes), iAnoFim, iMesFim, iDiaFim);
      end else
      //----------------------------------------------------------------------------------
      // Calculo Diario
      //----------------------------------------------------------------------------------
      if dtmAtivoFixo.qryParamCAF.FieldByName('FLGTIPOCALC').AsString = 'D' then
      begin
         if Sistema.IdModulo = 7 then
         begin
            if copy(dtmAtivoFixo.qryParamCaf.FieldByName('SISTEMAS').AsString, 4, 1) <> '1' then
            begin
               iGrupoDeprec := 2;
            end else
            begin
               if chkDeprecImob.Checked then
                  iGrupoDeprec := 1
               else
                  iGrupoDeprec := 0;
            end;
         end else
         begin
            iGrupoDeprec := 1;
         end;
         //-------------------------------------------------------------------------------
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
         //-------------------------------------------------------------------------------
         qryVerUltDep.Close;
         qryVerUltDep.ParamByName('PIDPESSOA').AsInteger     := Sistema.IdEmpresa;
         qryVerUltDep.ParamByName('PFLGIMOVELINI').AsInteger := iGrupoDepIni;
         qryVerUltDep.ParamByName('PFLGIMOVELFIM').AsInteger := iGrupoDepFim;
         qryVerUltDep.Open;
         //-------------------------------------------------------------------------------
         DecodeDate(qryVerUltDep.FieldByName('DATAMOVIMENTACAO').AsDateTime + 1, iAnoFim, iMesFim, iDiaFim);
      end;
   end else
   begin
      DecodeDate(qryVerUltDep.FieldByName('DATAMOVIMENTACAO').AsDateTime + 1, iAnoFim, iMesFim, iDiaFim);
   end;
   edDataFechamento.Date := EncodeDate(iAnoFim, iMesFim, iDiaFim);
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
   DecodeDate(strtodate(edDataFechamento.Text) , iAnoFim, iMesFim, iDiaFim);
   //-------------------------------------------------------------------------------------
   // Calculo do Fator Temporal baseado na opção dos Parâmetros do CAF
   //-------------------------------------------------------------------------------------
   if (Sistema.IdModulo = 7) or (((Sistema.IdModulo <> 7) or chkDeprecImob.Checked) and
                                 (dtmAtivoFixo.qryParamCAF.FieldByName('FLGDIARIO').AsString <> 'S')) then
   begin
      //----------------------------------------------------------------------------------
      // Calculo Anual
      //----------------------------------------------------------------------------------
      if dtmAtivoFixo.qryParamCAF.FieldByName('FLGTIPOCALC').AsString = 'A' then
      begin
         if strtodate(edDataFechamento.Text) = strtodate(sDataUltDep) then
         begin
            rFator := 0;
         end else
         begin
            sAnoIni    := '01/01/' + inttostr(iAnoIni);
            sAnoFim    := '31/12/' + inttostr(iAnoIni);
            rTotDia    := (strtodate(edDataFechamento.Text) - strtodate(sDataUltDep)) + 1;
            rTotDiaAno := (strtodate(sAnoFim) - strtodate(sAnoIni)) + 1;
            rFator     := (rTotDia / rTotDiaAno);
         end;
      end else
      //----------------------------------------------------------------------------------
      // Calculo Mensal
      //----------------------------------------------------------------------------------
      if dtmAtivoFixo.qryParamCAF.FieldByName('FLGTIPOCALC').AsString = 'M' then
      begin
         iNDias := round((strtodate(edDataFechamento.Text) - strtodate(sDataUltDep)) + 1);
         if strtodate(edDataFechamento.Text) = strtodate(sDataUltDep) then
         begin
            rFator := 0;
         end else
         begin
            //----------------------------------------------------------------------------
            if iMesIni = iMesFim then
            begin
               DecodeDate(DiasUteis.UltDiaMes(iAnoFim,iMesFim),iAno,iMes,iDia);
               rFator := (1 / 12) * (iNDias / iDia);
            end else
            //----------------------------------------------------------------------------
            begin
               dDataInit := (edDataFechamento.Date - 32);
               DecodeDate(dDataInit,iAnoInit,iMesInit,iDiaInit);
               DecodeDate(DiasUteis.UltDiaMes(iAnoInit,iMesInit),iAnoInit,iMesInit,iDiaInit);
               dDataInit := EncodeDate(iAnoInit,iMesInit,iDiaInit);
               //-------------------------------------------------------------------------
               if dDataInit = strtodate(sDataUltDep) then
                  rFator := (1 / 12)
               else
                  rFator := (1 / 12) * (iNDias / 30.44);
            end;
         end;
      end else
      //----------------------------------------------------------------------------------
      // Calculo Diário
      //----------------------------------------------------------------------------------
      begin
         if strtodate(edDataFechamento.Text) = strtodate(sDataUltDep) then
         begin
            rFator := 0;
         end else
         begin
            iNDias := round(strtodate(edDataFechamento.Text) - strtodate(sDataUltDep));
            rFator := iNDias / 365.25;
         end;
      end;
   end else
   //-------------------------------------------------------------------------------------
   // Calculo diário para o INVESTIMOB
   //-------------------------------------------------------------------------------------
   begin
      if strtodate(edDataFechamento.Text) = strtodate(sDataUltDep) then
      begin
         rFator := 0;
      end else
      begin
         iNDias := round(strtodate(edDataFechamento.Text) - strtodate(sDataUltDep));
         rFator := iNDias / 365.25;
      end;
   end;
end;
//========================================================================================
// Verifica a Ultima Depreciacao Realizada
//----------------------------------------------------------------------------------------
Function TfrmMovDepreciacao.Calcula_Ultima_Depreciacao(dDataMov : tDateTime; Var dDataUlt : tDateTime) : Boolean;
begin
   qryVerUltDep.Close;
   qryVerUltDep.ParamByName('PIDPESSOA').AsInteger     := Sistema.IdEmpresa;
   qryVerUltDep.ParamByName('PFLGIMOVELINI').AsInteger := iGrupoDepIni;
   qryVerUltDep.ParamByName('PFLGIMOVELFIM').AsInteger := iGrupoDepFim;
   qryVerUltDep.Open;
   //-------------------------------------------------------------------------------------
   if qryVerUltDep.IsEmpty then
   begin
      dDataUlt := dDataMov;
      Result := True;
   end else
   begin
      if qryVerUltDep.FieldByName('DATAMOVIMENTACAO').IsNull then
      begin
         dDataUlt := dDataMov;
         Result := True;
      end else
      begin
         dDataUlt := strtodate(qryVerUltDep.FieldByName('DATAMOVIMENTACAO').AsString);
         Result := qryVerUltDep.FieldByName('DATAMOVIMENTACAO').AsDateTime < dDataMov;
      end;
   end;
end;
//========================================================================================
// Cálculo da Depreciação e da Correção Monetária do Bem
//========================================================================================
Procedure TfrmMovDepreciacao.Calcula_Depreciacao_Bem;
var
   sDataUltDep,
   sAtivProjeto                                  : String;
   dDataInicioDep                                : tDateTime;
   rTaxa,rFator,rTotDiaAno,rTotDia,
   fCorrecao,
   fDepLanc,DepTotalF,DepTotalG,fCmDep,fCmBem,
   fValCmBem, fValDepLanc, fValCmDep             : Extended;

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
   qryBem.Close;
   qryBem.Params[0].AsInteger  := Sistema.IdEmpresa;
   qryBem.Params[1].AsInteger  := iGrupoDepIni;
   qryBem.Params[2].AsInteger  := iGrupoDepFim;
   qryBem.Params[3].AsDateTime := edDataFechamento.Date;
   qryBem.Open;
   //-------------------------------------------------------------------------------------
   if not dtmAtivoFixo.sprSaldoContabBem.Prepared then
      dtmAtivoFixo.sprSaldoContabBem.Prepare;
   //-------------------------------------------------------------------------------------
   case iGrupoDeprec of
      0 : lblStatus.Caption := 'Depreciação - '+ inttostr(qryBem.RecordCount) +' Bens não Imóveis ';
      1 : lblStatus.Caption := 'Depreciação - '+ inttostr(qryBem.RecordCount) +' Bens Imóveis';
   else
      lblStatus.Caption := 'Depreciação - '+ inttostr(qryBem.RecordCount) +' Bens';
   end;
   prgBar.MaxValue := qryBem.RecordCount;
   prgBar.Progress := 0;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   try
      //----------------------------------------------------------------------------------
      // Processar os Bens
      //----------------------------------------------------------------------------------
      while not qryBem.EOF do
      begin
         prgBar.Progress := prgBar.Progress + 1;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         // Atualiza Parâmetros
         //-------------------------------------------------------------------------------
         if qryBem.FieldByName('DATAINICIODEP').IsNull then
            dDataInicioDep := qryBem.FieldByName('DTAINCLUSAO').AsDateTime
         else
            dDataInicioDep := qryBem.FieldByName('DATAINICIODEP').AsDateTime;
         //-------------------------------------------------------------------------------
         if qryBem.FieldByName('DATAULTDEP').IsNull then
         begin
            sDataUltDep := datetostr(dDataInicioDep);
         end else
         begin
            if qryBem.FieldByName('DATAULTDEP').AsDateTime > dDataInicioDep then
               sDataUltDep := qryBem.FieldByName('DATAULTDEP').AsString
            else
               sDataUltDep := datetostr(dDataInicioDep);
         end;
         //-------------------------------------------------------------------------------
         // Registra o Último Lancamento de Depreciacao para armazenamento futuro
         //-------------------------------------------------------------------------------
         dDataUltDepAnt := strtodate(sDataUltDep);
         //-------------------------------------------------------------------------------
         // Calcula o fator de tempo de Correção Monetária para o BEM
         //-------------------------------------------------------------------------------
         ParamFatorPeriodo(rFator,rTotDiaAno,rTotDia,sDataUltDep);
         //-------------------------------------------------------------------------------
         // Calcular a Correção Monetária no Periodo
         //-------------------------------------------------------------------------------
         fValCmBem := qryBem.FieldByName('CMBEM').AsFloat;
         fValCmDep := qryBem.FieldByName('CMDEP').AsFloat;
         fCmBem := 0;
         fCmDep := 0;
         bCalcCM := False;
         if fCorrecao <> 0 then
         begin
            //----------------------------------------------------------------------------
            // cmbem := cmbem mes ant + (valor bem + sua correcao ) * fator
            //----------------------------------------------------------------------------
            fCmBem    := (qryBem.FieldByName('VALORG').AsFloat + qryBem.FieldByName('CMBEM').AsFloat) * (fCorrecao - 1);
            fValCmBem := qryBem.FieldByName('CMBEM').AsFloat + fCmBem;
            //----------------------------------------------------------------------------
            // corrigir a depreciacao lançada
            //----------------------------------------------------------------------------
            fCmDep    := (qryBem.FieldByName('DEPLANC').AsFloat + qryBem.FieldByName('CMDEP').AsFloat) * (fCorrecao - 1);
            fValCmDep := qryBem.FieldByName('CMDEP').AsFloat + fCmDep;
            //----------------------------------------------------------------------------
            RegistraCorrMonetaria(edDataFechamento.Text,fCmBem,0,0,
                                  qryBem.FieldByName('IDBEM').AsString,'15');
            if bErro then
               raise Exception.Create(MensagemErro);
            //----------------------------------------------------------------------------
            // Integração Contábil
            //----------------------------------------------------------------------------
            if bIntegraContab then
            begin
               ContabilizaCorrMonetaria('B', iPlanoConta, sAtivProjeto,
                                        qryBem.FieldByName('DESBEM').AsString,
                                        qryBem.FieldByName('IDBEM').AsString,
                                        qryBem.FieldByName('PLACA').AsFloat,
                                        fCmBem,
                                        qryBem.FieldByName('IDGRUPO').AsInteger,
                                        qryBem.FieldByName('IDCONJUNTO').AsInteger,
                                        qryBem.FieldByName('CODSUBCONTA').AsInteger);
               if bErro then
                  raise Exception.Create(MensagemErro);
            end;
            //----------------------------------------------------------------------------
            // Atualiza Bem
            //----------------------------------------------------------------------------
            qryAlteraBemCM.ParamByName('IDPESSOA').AsFloat         := qryBem.FieldByName('IDPESSOA').AsFloat;
            qryAlteraBemCM.ParamByName('IDBEM').AsInteger          := qryBem.FieldByName('IDBEM').AsInteger;
            qryAlteraBemCM.ParamByName('CMBEM').AsFloat            := fValCmBem;
            qryAlteraBemCM.ParamByName('DATAINICIODEP').AsDateTime := dDataInicioDep;
            qryAlteraBemCM.ParamByName('DATAULTDEP').AsDateTime    := strtodate(edDataFechamento.Text);
            qryAlteraBemCM.ParamByName('DATARECALCDEP').AsDateTime := strtodate(sDataUltDep);
            qryAlteraBemCM.ExecSQL;
            //----------------------------------------------------------------------------
            bCalcCM := True;
         end;
         //-------------------------------------------------------------------------------
         // Calcular a Depreciação do Periodo
         //-------------------------------------------------------------------------------
         fValDepLanc := qryBem.FieldByName('DEPLANC').AsFloat;
         if qryBem.FieldByName('FLGDEPREC').IsNull then
            iFlgDeprec := 0
         else
            iFlgDeprec := qryBem.FieldByName('FLGDEPREC').AsInteger;
         //-------------------------------------------------------------------------------
         bCalcDep := False;
         if (iFlgDeprec = 0) and (rFator > 0) and (qryBem.FieldByName('TAXADEP').AsFloat > 0) then
         begin
            //----------------------------------------------------------------------------
            // Calcula a quota proporcional de depreciação do bem
            //----------------------------------------------------------------------------
            rTaxa := ((qryBem.FieldByName('TAXADEP').AsFloat / 100) * rFator);
            fDepLanc := (rTaxa * (qryBem.FieldByName('VALORG').AsFloat + fValCmBem));
            if abs(fDepLanc) >= 0.01 then
               fDepLanc := strtofloat(FormatFloat('#0.00',((fDepLanc * 100) / 100)));
            //----------------------------------------------------------------------------
            // Ajusta qdo for termino de periodo de depreciação
            //----------------------------------------------------------------------------
            if ((fValDepLanc + fDepLanc + fValCmDep) >= (qryBem.FieldByName('VALORG').AsFloat + fValCmBem)) then
            begin
               fDepLanc := (qryBem.FieldByName('VALORG').AsFloat + fValCmBem) - (fValDepLanc + fValCmDep);
               if abs(fDepLanc) >= 0.01 then
                  fDepLanc := strtofloat(FormatFloat('#0.00',((fDepLanc * 100) / 100)));
               iFlgDeprec := 1;
            end;
            //----------------------------------------------------------------------------
            // Se o valor absoluto calculado for maior ou igual a 0,01 registrar,
            // caso contrário, deixar para acumular na próxima depreciação.
            //----------------------------------------------------------------------------
            if abs(fDepLanc) >= 0.01 then
            begin
               fValDepLanc := qryBem.FieldByName('DEPLANC').AsFloat + fDepLanc;
               //-------------------------------------------------------------------------
               // Integração Contábil
               //-------------------------------------------------------------------------
               if bIntegraContab then
               begin
                  if qryBem.FieldByName('UNIDNEGOC').IsNull then
                     sAtivProjeto := sAtivProjetoPadrao
                  else
                     sAtivProjeto := qryBem.FieldByName('UNIDNEGOC').AsString;
                  //----------------------------------------------------------------------
                  // Lançamento em Planilha
                  //----------------------------------------------------------------------
                  ContabilizaDepreciacao('B',iPlanoConta,sAtivProjeto,
                                         qryBem.FieldByName('DESBEM').AsString,
                                         qryBem.FieldByName('IDBEM').AsString,
                                         qryBem.FieldByName('PLACA').AsFloat,
                                         fDepLanc,fCmDep,
                                         qryBem.FieldByName('IDGRUPO').AsInteger,
                                         qryBem.FieldByName('IDCONJUNTO').AsInteger,
                                         qryBem.FieldByName('CODSUBCONTA').AsInteger);
                  if bErro then
                     Raise Exception.Create(MensagemErro);
               end;
               //-------------------------------------------------------------------------
               Calcula_Moedas(fDepLanc, edDataFechamento.Date, DepTotalF, DepTotalG);
               if bErro then
                  Raise Exception.Create(MensagemErro);
               //-------------------------------------------------------------------------
               RegistraDepreciacao(edDataFechamento.Text,DepTotalF,DepTotalG,fDepLanc,fCmDep,
                                   qryBem.FieldByName('IDBEM').AsString,'14','21');
               if bErro then
                  Raise Exception.Create(MensagemErro);
               //-------------------------------------------------------------------------
               qryAlteraBem.ParamByName('IDPESSOA').AsFloat         := qryBem.FieldByName('IDPESSOA').AsFloat;
               qryAlteraBem.ParamByName('IDBEM').AsInteger          := qryBem.FieldByName('IDBEM').AsInteger;
               qryAlteraBem.ParamByName('DEPLANC').AsFloat          := fValDepLanc;
               qryAlteraBem.ParamByName('CMDEP').AsFloat            := fValCmDep;
               qryAlteraBem.ParamByName('DATAINICIODEP').AsDateTime := dDataInicioDep;
               qryAlteraBem.ParamByName('DATAULTDEP').AsDateTime    := strtodate(edDataFechamento.Text);
               qryAlteraBem.ParamByName('DATARECALCDEP').AsDateTime := strtodate(sDataUltDep);
               qryAlteraBem.ParamByname('FLGDEPREC').AsInteger      := iFlgDeprec;
               qryAlteraBem.ExecSQL;
               //-------------------------------------------------------------------------
               bCalcDep := True;
            end;
            //----------------------------------------------------------------------------
            // Se houve calculo de correção monetária e/ou depreciação,
            // atualizar Grupo e Saldo Contábil
            //----------------------------------------------------------------------------
            if bCalcDep or bCalcCM then
            begin
               //-------------------------------------------------------------------------
               // Atualiza a tabela GRUPO
               //-------------------------------------------------------------------------
               if qryBem.FieldByName('IDGRUPO').AsInteger <> qryUpdGrupo.FieldByname('IDGRUPO').AsInteger then
               begin
                  if qryUpdGrupo.Locate('IDGRUPO',qryBem.FieldByname('IDGRUPO').AsInteger,[]) then
                  begin
                     qryUpdGrupo.Edit;
                     qryUpdGrupo.FieldByName('DATAULTDEP').AsDateTime := strtodate(edDataFechamento.Text);
                     qryUpdGrupo.Post;
                  end;
               end;
               //-------------------------------------------------------------------------
               // Atualiza a tabela SALDOCONTABBEM
               //-------------------------------------------------------------------------
               if not AtivoFixo.AtualizaSaldoContabBem(Sistema.IdModulo,
                                                       qryBem.FieldByName('IDPESSOA').AsInteger,
                                                       qryBem.FieldByName('IDBEM').AsInteger,
                                                       StrtoDate(edDataFechamento.Text),
                                                       0,fCmBem,fDepLanc,fCmDep,
                                                       0,0,0,0, 0,0,0,0,
                                                       qryBem.FieldByName('IDGRUPO').AsInteger,
                                                       qryBem.FieldByName('IDLOCALIZACAO').AsInteger,
                                                       qryBem.FieldByName('IDRESPONSAVEL').AsInteger,0) then
                  Raise Exception.Create(AtivoFixo.MensagemErro);
            end;
         end;
         qryBem.Next
      end;
   except
      on E : Exception do
      begin
         bErro := True;
         MensagemErro := 'Erro na Depreciação do Bem PLACA ' + qryBem.FieldByName('PLACA').AsString + #13 + #13 +
                         E.Message;
      end;
   end;
end;
//========================================================================================
Procedure TfrmMovDepreciacao.Atualiza_Depreciacao;
begin
   try
      qryUpdGrupo.ApplyUpdates;
      //----------------------------------------------------------------------------------
      if bIntegraContab then
      begin
         if not RegistraPlanilhaContabil(Exercicio,Periodo) then
            Raise Exception.Create(MensagemErro);
         //-------------------------------------------------------------------------------
         Tot_HistoricoMovimentacao(14,Planilha);
         Tot_HistoricoMovimentacao(18,Planilha);
         Tot_HistoricoMovimentacao(35,Planilha);
      end;
   except
      on E : Exception do
      begin
         bErroAtualizacao := True;
         MensagemErro := 'Erro no Registro do Fechamento !' + #13 + #13 +
                         'Excessão : ' + E.Message;
      end;
   end;
end;
//========================================================================================
Procedure TfrmMovDepreciacao.Cancela_Depreciacao;
begin
   if qryUpdGrupo.State = dsEdit then
      qryUpdGrupo.CancelUpdates;
end;
//========================================================================================
// Cálculo da Depreciação e da Correção Monetária da Reavaliação
//========================================================================================
Procedure TfrmMovDepreciacao.Calcula_Depreciacao_Reav;
var
   iPosition                                      : Integer;
   fCorrecao,
   fDepLanc,DepTotalF,DepTotalG,fCmDep,fCmBem     : Extended;
   sDataUltDep,
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
   qryReavaliacoes.ParamByName('PDATAMOV').asDateTime := edDataFechamento.Date;
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
         qryReavaliacoes.Edit;
         //-------------------------------------------------------------------------------
         if bIntegraContab then
            if qryReavaliacoes.FieldByName('UNIDNEGOC').IsNull then
               sAtivProjeto := sAtivProjetoPadrao
            else
               sAtivProjeto := qryReavaliacoes.FieldByName('UNIDNEGOC').AsString;
         //-------------------------------------------------------------------------------
         if qryReavaliacoes.FieldByName('DATAULTDEP').IsNull then
         begin
            sDataUltDep := datetostr(qryReavaliacoes.FieldByName('DATAREAVALIACAO').AsDateTime);
         end else
         begin
            sDataUltDep := datetostr(qryReavaliacoes.FieldByName('DATAULTDEP').AsDateTime);
         end;
         //-------------------------------------------------------------------------------
         // Armazena o ultimo Lancamento de Depreciacao para armazenamento futuro
         //-------------------------------------------------------------------------------
         dDataUltDepAnt := qryReavaliacoes.FieldByName('DATAULTDEP').asDateTime;
         //-------------------------------------------------------------------------------
         // Retorna o Fator de Depreciação da Reavaliação do Bem
         //-------------------------------------------------------------------------------
         ParamFatorPeriodo(rFator,rTotDiaAno,rTotDia,sDataUltDep);
         fCmBem := 0;
         fCmDep := 0;
         //-------------------------------------------------------------------------------
         // Calcular a Correção Monetária do Periodo
         //-------------------------------------------------------------------------------
         bCalcCM := False;
         if fCorrecao > 0 then
         begin
            //----------------------------------------------------------------------------
            // cmbem := cmbem mes ant + (valor bem + sua correcao ) * fator
            //----------------------------------------------------------------------------
            fCmBem := (qryReavaliacoes.FieldByName('VALORG').AsFloat +
                       qryReavaliacoes.FieldByName('CMBEM').AsFloat) * (fCorrecao - 1);
            qryReavaliacoes.FieldByName('CMBEM').AsFloat := qryReavaliacoes.FieldByName('CMBEM').AsFloat + fCmBem;
            //----------------------------------------------------------------------------
            // corrigir a depreciacao lançada
            //----------------------------------------------------------------------------
            fCmDep := (qryReavaliacoesDEPLANC.AsFloat +
                       qryReavaliacoesCMDEP.AsFloat ) * (fCorrecao - 1);;
            qryReavaliacoesCMDEP.AsFloat := qryReavaliacoesCMDEP.AsFloat + fCmDep;
            //----------------------------------------------------------------------------
            // Contabilização
            //----------------------------------------------------------------------------
            if bIntegraContab then
            begin
               ContabilizaCorrMonetaria('R', iPlanoConta, sAtivProjeto,
                                        qryReavaliacoes.FieldByName('DESBEM').AsString,
                                        qryReavaliacoes.FieldByName('IDBEM').AsString,
                                        qryReavaliacoes.FieldByName('PLACA').AsFloat,
                                        fCmBem,
                                        qryReavaliacoes.FieldByName('IDGRUPO').AsInteger,
                                        qryReavaliacoes.FieldByName('IDCONJUNTO').AsInteger,
                                        qryReavaliacoes.FieldByName('CODSUBCONTA').AsInteger);
               if bErro then
                  Raise Exception.Create(MensagemErro);
            end;
            //----------------------------------------------------------------------------
            RegistraCorrMonetaria(edDataFechamento.Text,fCmBem,0,0,
                                  qryReavaliacoesIDBEM.AsString,'22');
            if bErro then
               Raise Exception.Create(MensagemErro);
            //----------------------------------------------------------------------------
            bCalcCM := True;
         end;
         //-------------------------------------------------------------------------------
         // Calcular a Depreciação do Periodo
         //-------------------------------------------------------------------------------
         fDepLanc := 0;
         if qryReavaliacoes.FieldByName('FLGDEPREC').IsNull then
            iFlgDeprec := 0
         else
            iFlgDeprec := qryReavaliacoes.FieldByName('FLGDEPREC').AsInteger;
         //-------------------------------------------------------------------------------
         bCalcDep := False;
         if (iFlgDeprec <> 1)  and (qryReavaliacoes.FieldByName('TAXADEP').AsFloat > 0) and (rFator > 0) then
         begin
            //----------------------------------------------------------------------------
            // Calcula a quota proporcional de depreciação do bem
            //----------------------------------------------------------------------------
            rTaxa    := ((qryReavaliacoes.FieldByName('TAXADEP').AsFloat / 100) * rFator);
            fDepLanc := (rTaxa * (qryReavaliacoes.FieldByName('VALORG').AsFloat +
                                  qryReavaliacoes.FieldByName('CMBEM').AsFloat));
            if abs(fDepLanc) >= 0.01 then
               fDepLanc := strtofloat(FormatFloat('#0.00',((fDepLanc * 100) / 100)));
            //----------------------------------------------------------------------------
            // Ajusta qdo for termino de periodo de depreciação
            //----------------------------------------------------------------------------
            if abs(qryReavaliacoes.FieldByName('DEPLANC').AsFloat + fDepLanc + qryReavaliacoes.FieldByName('CMDEP').AsFloat) >
               abs(qryReavaliacoes.FieldByName('VALORG').AsFloat + qryReavaliacoes.FieldByName('CMBEM').AsFloat) then
            begin
               if (qryReavaliacoes.FieldByName('VALORG').AsFloat + qryReavaliacoes.FieldByName('CMBEM').AsFloat) <> 0 then
               begin
                  fDepLanc := (qryReavaliacoes.FieldByName('VALORG').AsFloat + qryReavaliacoes.FieldByName('CMBEM').AsFloat) -
                              (qryReavaliacoes.FieldByName('DEPLANC').AsFloat + qryReavaliacoes.FieldByName('CMDEP').AsFloat);
                  if abs(fDepLanc) >= 0.01 then
                     fDepLanc := strtofloat(FormatFloat('#0.00',((fDepLanc * 100) / 100)));
               end;      
               iFlgDeprec := 1;
            end;
            //----------------------------------------------------------------------------
            // Se o valor absoluto calculado for maior ou igual a 0,01 registrar,
            // caso contrário, deixar para acumular na próxima depreciação.
            //----------------------------------------------------------------------------
            if abs(fDepLanc) >= 0.01 then
            begin
               qryReavaliacoes.FieldByName('FLGDEPREC').AsInteger   := iFlgDeprec;
               qryReavaliacoes.FieldByName('DEPLANC').AsFloat       := qryReavaliacoes.FieldByName('DEPLANC').AsFloat + fDepLanc;
               qryReavaliacoes.FieldByName('DATAULTDEP').AsDateTime := strtodate(edDataFechamento.text);
               //-------------------------------------------------------------------------
               Calcula_Moedas(fDepLanc, edDataFechamento.Date, DepTotalF, DepTotalG);
               if bErro then
                  Raise Exception.Create(MensagemErro);
               //-------------------------------------------------------------------------
               RegistraDepreciacao(edDataFechamento.Text,DepTotalF,DepTotalG,fDepLanc,fCmDep,
                                   qryReavaliacoesIDBEM.AsString,
                                   '18','19');
               if bErro then
                  Raise Exception.Create(MensagemErro);
               //-------------------------------------------------------------------------
               // Integração Contábil
               //-------------------------------------------------------------------------
               if bIntegraContab then
               begin
                  ContabilizaDepreciacao('R',iPlanoConta,sAtivProjeto,
                                         qryReavaliacoes.FieldByName('DESBEM').AsString,
                                         qryReavaliacoes.FieldByName('IDBEM').AsString,
                                         qryReavaliacoes.FieldByName('PLACA').AsFloat,
                                         fDepLanc,fCmDep,
                                         qryReavaliacoes.FieldByName('IDGRUPO').AsInteger,
                                         qryReavaliacoes.FieldByName('IDCONJUNTO').AsInteger,
                                         qryReavaliacoes.FieldByName('CODSUBCONTA').AsInteger);
                  if bErro then
                     Raise Exception.Create(MensagemErro);
               end;
               bCalcDep := True;
            end;
         end;
         //-------------------------------------------------------------------------------
         if bCalcCM or bCalcDep then
         begin
            //----------------------------------------------------------------------------
            // Atualiza a tabela SALDOCONTABBEM
            //----------------------------------------------------------------------------
            if qryReavaliacoesFLGULTREAVAL.AsInteger = 0 then
            begin
               if not AtivoFixo.AtualizaSaldoContabBem(Sistema.IdModulo,
                                                       qryReavaliacoes.FieldByName('IDPESSOA').AsInteger,
                                                       qryReavaliacoes.FieldByName('IDBEM').AsInteger,
                                                       StrtoDate(edDataFechamento.Text),
                                                       0,0,0,0,
                                                       0,fCmBem,fDepLanc,fCmDep,
                                                       0,0,0,0,
                                                       qryReavaliacoes.FieldByName('IDGRUPO').AsInteger,
                                                       qryReavaliacoes.FieldByName('IDLOCALIZACAO').AsInteger,
                                                       qryReavaliacoes.FieldByName('IDRESPONSAVEL').AsInteger,
                                                       0) then
                  Raise Exception.Create(AtivoFixo.MensagemErro);
            end else
            begin
               if not AtivoFixo.AtualizaSaldoContabBem(Sistema.IdModulo,
                                                       qryReavaliacoes.FieldByName('IDPESSOA').AsInteger,
                                                       qryReavaliacoes.FieldByName('IDBEM').AsInteger,
                                                       StrtoDate(edDataFechamento.Text),
                                                       0,0,0,0,
                                                       0,0,0,0,
                                                       0,fCmBem,fDepLanc,fCmDep,
                                                       qryReavaliacoes.FieldByName('IDGRUPO').AsInteger,
                                                       qryReavaliacoes.FieldByName('IDLOCALIZACAO').AsInteger,
                                                       qryReavaliacoes.FieldByName('IDRESPONSAVEL').AsInteger,
                                                       0) then
                  Raise Exception.Create(AtivoFixo.MensagemErro);
            end;
         end;
         //-------------------------------------------------------------------------------
         iPosition := iPosition + 1;
         prgBar.Progress := iPosition;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         qryReavaliacoes.Post;
         qryReavaliacoes.Next
      end;
   except
      on E : Exception do
      begin
         bErro := True;
         MensagemErro := 'Erro na Depreciação da Reavaliação do Bem PLACA ' + qryReavaliacoes.FieldByName('PLACA').AsString + #13 + #13 + E.Message;
      end;
   end;
end;
//========================================================================================
Procedure TfrmMovDepreciacao.Atualiza_Depreciacao_Reav;
begin
   try
      qryReavaliacoes.ApplyUpdates;
   except
      on E : Exception do
      begin
         bErroAtualizacao := True;
         MensagemErro := E.Message;
      end;
   end;
end;
//========================================================================================
Procedure TfrmMovDepreciacao.Cancela_Depreciacao_Reav;
begin
   if qryReavaliacoes.State = dsEdit then
      qryReavaliacoes.CancelUpdates;
end;
//========================================================================================
// Cálculo da Depreciação e da Correção Monetária do Acréscimo de Valor
//========================================================================================
Procedure TfrmMovDepreciacao.Calcula_Depreciacao_Acresc;
var
   iPosition                                      : Integer;
   fCorrecao,
   fDepLanc,DepTotalF,DepTotalG,fCmDep,fCmBem     : Extended;
   sDataUltDep,
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
   qryAcrescimos.ParamByName('PDATAMOV').asDateTime := edDataFechamento.Date;
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
         qryAcrescimos.Edit;
         //-------------------------------------------------------------------------------
         if iGrupoDeprec < 2 then
         begin
            qryGrupoBem.Close;
            qryGrupoBem.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
            qryGrupoBem.ParamByName('PIDBEM').AsInteger    := qryAcrescimos.FieldByName('IDBEM').AsInteger;
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
         if bIntegraContab then
            if qryAcrescimos.FieldByName('UNIDNEGOC').IsNull then
               sAtivProjeto := sAtivProjetoPadrao
            else
               sAtivProjeto := qryAcrescimos.FieldByName('UNIDNEGOC').AsString;
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
         // Calcular a Correção Monetária do Periodo
         //-------------------------------------------------------------------------------
         bCalcCM := False;
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
               ContabilizaCorrMonetaria('A',iPlanoConta, sAtivProjeto,
                                        qryAcrescimos.FieldByName('DESBEM').AsString,
                                        qryAcrescimos.FieldByName('IDBEM').AsString,
                                        qryAcrescimos.FieldByName('PLACA').AsFloat,
                                        fCmBem,
                                        qryAcrescimos.FieldByName('IDGRUPO').AsInteger,
                                        qryAcrescimos.FieldByName('IDCONJUNTO').AsInteger,
                                        qryAcrescimos.FieldByName('CODSUBCONTA').AsInteger);
               if bErro then
                  Raise Exception.Create(MensagemErro);
            end;
            //----------------------------------------------------------------------------
            RegistraCorrMonetaria(edDataFechamento.Text,fCmBem,0,0,
                                  qryAcrescimosIDBEM.AsString,'34');
            if bErro then
               Raise Exception.Create(MensagemErro);
            //----------------------------------------------------------------------------
            bCalcCM := True;
         end;
         //-------------------------------------------------------------------------------
         // Calcular a Depreciação do Periodo
         //-------------------------------------------------------------------------------
         fDepLanc := 0;
         if qryAcrescimos.FieldByName('FLGDEPREC').IsNull then
            iFlgDeprec := 0
         else
            iFlgDeprec := qryAcrescimos.FieldByName('FLGDEPREC').AsInteger;
         //-------------------------------------------------------------------------------
         bCalcDep := False;
         if (iFlgDeprec <> 1) and (rFator > 0) and (qryAcrescimos.FieldByName('TAXADEP').AsFloat > 0) then
         begin
            //----------------------------------------------------------------------------
            // Calcula a quota proporcional de depreciação do bem
            //----------------------------------------------------------------------------
            rTaxa    := ((qryAcrescimos.FieldByName('TAXADEP').AsFloat / 100) * rFator);
            fDepLanc := (rTaxa * (qryAcrescimos.FieldByName('VALORG').AsFloat +
                                   qryAcrescimos.FieldByName('CMBEM').AsFloat));
            if abs(fDepLanc) >= 0.01 then
               fDepLanc := strtofloat(FormatFloat('#0.00',((fDepLanc * 100) / 100)));
            //----------------------------------------------------------------------------
            // Ajusta qdo for termino de periodo de depreciação
            //----------------------------------------------------------------------------
            if (qryAcrescimos.FieldByName('DEPLANC').AsFloat + fDepLanc + (qryAcrescimos.FieldByName('CMDEP').AsFloat)) >=
               (qryAcrescimos.FieldByName('VALORG').AsFloat + (qryAcrescimos.FieldByName('CMBEM').AsFloat)) then
            begin
               fDepLanc := (qryAcrescimos.FieldByName('VALORG').AsFloat + qryAcrescimos.FieldByName('CMBEM').AsFloat) -
                           (qryAcrescimos.FieldByName('DEPLANC').AsFloat + qryAcrescimos.FieldByName('CMDEP').AsFloat);
               if abs(fDepLanc) >= 0.01 then
                  fDepLanc := strtofloat(FormatFloat('#0.00',((fDepLanc * 100) / 100)));
               iFlgDeprec := 1;
            end;
            //----------------------------------------------------------------------------
            // Se o valor absoluto calculado for maior ou igual a 0,01 registrar,
            // caso contrário, deixar para acumular na próxima depreciação.
            //----------------------------------------------------------------------------
            if abs(fDepLanc) >= 0.01 then
            begin
               if bIntegraContab then
               begin
                  ContabilizaDepreciacao('A',iPlanoConta,sAtivProjeto,
                                         qryAcrescimos.FieldByName('DESBEM').AsString,
                                         qryAcrescimos.FieldByName('IDBEM').AsString,
                                         qryAcrescimos.FieldByName('PLACA').AsFloat,
                                         fDepLanc,fCmDep,
                                         qryAcrescimos.FieldByName('IDGRUPO').AsInteger,
                                         qryAcrescimos.FieldByName('IDCONJUNTO').AsInteger,
                                         qryAcrescimos.FieldByName('CODSUBCONTA').AsInteger);
                  if bErro then
                     Raise Exception.Create(MensagemErro);
               end;
               //-------------------------------------------------------------------------
               qryAcrescimos.FieldByName('FLGDEPREC').AsInteger   := iFlgDeprec;
               qryAcrescimos.FieldByName('DEPLANC').AsFloat       := qryAcrescimos.FieldByName('DEPLANC').AsFloat + fDepLanc;
               qryAcrescimos.FieldByName('DATAULTDEP').AsDateTime := strtodate(edDataFechamento.Text);
               //-------------------------------------------------------------------------
               Calcula_Moedas(fDepLanc, edDataFechamento.Date, DepTotalF, DepTotalG);
               if bErro then
                  Raise Exception.Create(MensagemErro);
               //-------------------------------------------------------------------------
               RegistraDepreciacao(edDataFechamento.Text, DepTotalF, DepTotalG, fDepLanc, fCmDep,
                                   qryAcrescimosIDBEM.AsString, '35', '36');
               if bErro then
                  Raise Exception.Create(MensagemErro);
               //-------------------------------------------------------------------------
               bCalcDEP := True;
            end;
         end;
         //-------------------------------------------------------------------------------
         iPosition := iPosition + 1;
         prgBar.Progress := iPosition;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         if bCalcCM or bCalcDEP then
         begin
            //----------------------------------------------------------------------------
            // Atualiza a tabela SALDOCONTABBEM
            //----------------------------------------------------------------------------
            if not AtivoFixo.AtualizaSaldoContabBem(Sistema.IdModulo,
                                                    qryAcrescimos.FieldByName('IDPESSOA').AsInteger,
                                                    qryAcrescimos.FieldByName('IDBEM').AsInteger,
                                                    StrtoDate(edDataFechamento.Text),
                                                    0,fCmBem,fDepLanc,fCmDep,
                                                    0,0,0,0,
                                                    0,0,0,0,
                                                    qryAcrescimos.FieldByName('IDGRUPO').AsInteger,
                                                    qryAcrescimos.FieldByName('IDLOCALIZACAO').AsInteger,
                                                    qryAcrescimos.FieldByName('IDRESPONSAVEL').AsInteger,
                                                    0) then
               Raise Exception.Create(AtivoFixo.MensagemErro);
         end;
         //-------------------------------------------------------------------------------
         qryAcrescimos.Post;
         qryAcrescimos.Next;
      end;
   except
      on E : Exception do
      begin
         bErro := True;
         MensagemErro := 'Erro na Depreciação do Acréscimo de Valor do Bem PLACA ' + qryReavaliacoes.FieldByName('PLACA').AsString + #13 + #13 + E.Message;
      end;
   end;
end;
//========================================================================================
Procedure TfrmMovDepreciacao.Atualiza_Depreciacao_Acresc;
begin
   try
      qryAcrescimos.ApplyUpdates;
   except
      on E : Exception do
      begin
         bErroAtualizacao := True;
         MensagemErro := E.Message;
      end;
   end;
end;
//========================================================================================
Procedure TfrmMovDepreciacao.Cancela_Depreciacao_Acresc;
begin
   if qryAcrescimos.State = dsEdit then
      qryAcrescimos.CancelUpdates;
end;
//========================================================================================
Procedure TfrmMovDepreciacao.Localiza_ContaContabil(iGrupo, iMovimentacao: integer;
                                                    sDebCred : string;
                                                    iPlano : integer;
                                                    var sPlaConta : string);
var
   iInd : Integer;

begin
   iInd := 0;
   while (iInd < iMaxCtaCtbDep) and
         ((aCtaCtbDep[iInd].iGrupo <> iGrupo) or (aCtaCtbDep[iInd].iTipoMov <> iMovimentacao) or
          (aCtaCtbDep[iInd].iPlano <> iPlano) or (aCtaCtbDep[iInd].sTipoLanc <> sDebCred)) do
         iInd := iInd + 1;
   //-------------------------------------------------------------------------------------
   if iInd < iMaxCtaCtbDep then
      sPlaConta := aCtaCtbDep[iInd].sPlaConta
   else
      sPlaConta := '';
end;
//========================================================================================
Procedure TfrmMovDepreciacao.ContabilizaDepreciacao(Tipo : String; iPlanoConta : integer;
                                                    sAtivProjeto, sDesbem, sIdBem : string;
                                                    fPlaca, DepTotalO, CorrDep : Extended;
                                                    iGrupo,iConjunto,iSubConta : integer);
var
   Particip1,Particip2,
   ValLanc                                  : Extended;
   Debito,DebitoCm,Credito,CreditoCm,
   sGrupo, sTipoMov1,
   Histor,Histor1,Histor2,Histor3,Histor4,
   sCcDeb, sCcCre, sNumDoc,
   sNomeContaDeb, sNomeContaCre,
   sObrigaSubContaDeb, sObrigaSubContaCre,
   sObrigaCCDeb, sObrigaCCCre               : String;
   iTipoMov1                                : Integer;

begin
   try
      if Tipo = 'B' then
      begin
         //-------------------------------------------------------------------------------
         // Busca conta a débito para a Depreciação
         //-------------------------------------------------------------------------------
         Localiza_ContaContabil(iGrupo,14,'D',iPlanoConta,Debito);
         //-------------------------------------------------------------------------------
         if Debito = '' then
         begin
            sGrupo := Busca_Grupo(iGrupo);
            Raise Exception.Create('Conta a Débito para o Movimento Cálculo da Depreciação do Grupo ' +
                                   sGrupo + ' não cadastrada !');
         end;
         //-------------------------------------------------------------------------------
         // Busca conta a crédito para a Depreciação
         //-------------------------------------------------------------------------------
         Localiza_ContaContabil(iGrupo,14,'C',iPlanoConta,Credito);
         //-------------------------------------------------------------------------------
         if Credito = '' then
         begin
            sGrupo := Busca_Grupo(iGrupo);
            Raise Exception.Create('Conta a Crédito para o Movimento Cálculo da Depreciação do Grupo '
                                   + sGrupo + ' não Cadastrada !');
         end;
         //-------------------------------------------------------------------------------
         if CorrDep <> 0 then
         begin
            //----------------------------------------------------------------------------
            // Busca conta a débito para a Correcao da Depreciação
            //----------------------------------------------------------------------------
            Localiza_ContaContabil(iGrupo,21,'D',iPlanoConta,DebitoCM);
            //----------------------------------------------------------------------------
            if DebitoCM = '' then
            begin
               sGrupo := Busca_Grupo(iGrupo);
               Raise Exception.Create('Conta a Débito para o Movimento Cálculo da Correção Monetária'+
                                      ' da Depreciação do Grupo ' + sGrupo + ' não Cadastrada !');
            end;
            //----------------------------------------------------------------------------
            // Busca conta a crédito para a Correção da Depreciação
            //----------------------------------------------------------------------------
            Localiza_ContaContabil(iGrupo,21,'C',iPlanoConta,CreditoCM);
            //----------------------------------------------------------------------------
            if CreditoCM = '' then
            begin
               sGrupo := Busca_Grupo(iGrupo);
               Raise Exception.Create('Conta a crédito para o Movimento Cálculo da Correção Monetária'+
                                      ' da Depreciação do Grupo ' + sGrupo + ' não Cadastrada !');
            end;
         end;
      end else
      //----------------------------------------------------------------------------------
      if Tipo = 'R' then
      begin
         if DepTotalO > 0 then
         begin
            iTipoMov1 := 18;
            sTipoMov1 := '';
         end else
         begin
            iTipoMov1 := 69;
            sTipoMov1 := 'Negativa';
         end;
         //-------------------------------------------------------------------------------
         // Busca conta a débito para Reavaliação
         //-------------------------------------------------------------------------------
         Localiza_ContaContabil(iGrupo,iTipoMov1,'D',iPlanoConta,Debito);
         //-------------------------------------------------------------------------------
         if Debito = '' then
         begin
            sGrupo := Busca_Grupo(iGrupo);
            Raise Exception.Create('Conta a Débito para o Movimento Depreciação da Reavaliação ' + sTipoMov1 + #13 +
                                   ' do Grupo ' + sGrupo + ' não cadastrada !');
         end;
         //-------------------------------------------------------------------------------
         // Busca conta a crédito para a Reavaliação
         //-------------------------------------------------------------------------------
         Localiza_ContaContabil(iGrupo,iTipoMov1,'C',iPlanoConta,Credito);
         //-------------------------------------------------------------------------------
         if Credito = '' then
         begin
            sGrupo := Busca_Grupo(iGrupo);
            Raise Exception.Create('Conta a Crédito para o Movimento Depreciação da Reavaliação ' + sTipoMov1 + #13 +
                                   ' do Grupo ' + sGrupo + ' não cadastrada !');
         end;
         //-------------------------------------------------------------------------------
         if CorrDep <> 0 then
         begin
            CreditoCM := Credito;
            DebitoCM  := Debito;
         end;
      end else
      if Tipo = 'A' then
      begin
         //-------------------------------------------------------------------------------
         // Busca conta a débito para a Acréscimo
         //-------------------------------------------------------------------------------
         Localiza_ContaContabil(iGrupo,35,'C',iPlanoConta,Credito);
         //-------------------------------------------------------------------------------
         if Credito = '' then
         begin
            sGrupo := Busca_Grupo(iGrupo);
            Raise Exception.Create('Conta a Crédito para o Movimento Depreciação do Acréscimo de Valor do '+
                                   'Grupo ' + sGrupo + ' não cadastrada !');
         end;
         //-------------------------------------------------------------------------------
         // Busca conta a crédito para a Acréscimo
         //-------------------------------------------------------------------------------
         Localiza_ContaContabil(iGrupo,35,'D',iPlanoConta,Debito);
         //-------------------------------------------------------------------------------
         if Debito = '' then
         begin
            sGrupo := Busca_Grupo(iGrupo);
            Raise Exception.Create('Conta a Débito para o Movimento Depreciação do Acréscimo de Valor do '+
                                   'Grupo ' + sGrupo + ' não cadastrada !');
         end;
         //-------------------------------------------------------------------------------
         if CorrDep <> 0 then
         begin
            CreditoCM := Credito;
            DebitoCM  := Debito;
         end;
      end;
      //----------------------------------------------------------------------------------
      // Registra o Rateio por Centro de Custo na Pré-Planilha
      //----------------------------------------------------------------------------------
      Particip1 := 0;
      Particip2 := 0;
      Histor1   := '';
      Histor2   := '';
      Histor3   := '';
      Histor4   := '';
      sNumDoc   := FormatDateTime('yyyymmdd',edDataFechamento.Date);
      //----------------------------------------------------------------------------------
      qryCcRD.Close;
      qryCcRD.ParamByName('EMPRESA').AsInteger  := Sistema.IdEmpresa;
      qryCcRD.ParamByName('CONJUNTO').AsInteger := iConjunto;
      qryCcRD.Open;
      //----------------------------------------------------------------------------------
      qryCcRD.First;
      while not qryCcRD.EOF do
      begin
         //-------------------------------------------------------------------------------
         // Montagem da Partida Dobrada da Depreciação
         //-------------------------------------------------------------------------------
         if Particip1 < 100 then
         begin
            Histor := 'Depreciacao';
            sCCDeb := '';
            sCCCre := '';
            //----------------------------------------------------------------------------
            // Pesquisa a Centro de Custo na Conta Contábil a Débito
            //----------------------------------------------------------------------------
            sObrigaCCDeb := 'N';
            FuncaoGeral.TestaContaCC(True, iPlanoConta, Debito,
                                     sObrigaCCDeb, sNomeContaDeb, sObrigaSubContaDeb);
            if sObrigaCCDeb = 'S' then
            begin
               if qryCcRD.FieldByName('TIPO').AsString = 'A' then
               begin
                  sCCDeb    := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
                  Particip1 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
               end else
               begin
                  Raise Exception.Create('O Rateio de Custo do Conjunto ' + qryCcRD.FieldByname('IDCONJUNTO').AsString +
                                         ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                                         'de Conjuntos!');
               end;
            end;
            //----------------------------------------------------------------------------
            // Pesquisa o Centro de Custo na Conta Contábil a Crédito
            //----------------------------------------------------------------------------
            sObrigaCCCre := 'N';
            FuncaoGeral.TestaContaCC(True, iPlanoConta, Credito,
                                     sObrigaCCCre, sNomeContaCre, sObrigaSubContaCre);
            if sObrigaCCCre = 'S' then
            begin
               if qryCcRD.FieldByName('TIPO').AsString = 'A' then
               begin
                  sCCCre    := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
                  Particip1 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
               end else
               begin
                  Raise Exception.Create('O Rateio de Custo do Conjunto ' + qryCcRD.FieldByName('IDCONJUNTO').AsString +
                                         ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                                         'de Conjuntos!');
               end;
            end;
            //----------------------------------------------------------------------------
            if (sCCDeb = '') and (sCCCre = '') then
               Particip1 := 100;
            //----------------------------------------------------------------------------
            // Calcula o Valor Rateado
            //----------------------------------------------------------------------------
            ValLanc := (DepTotalO * Particip1) / 100;
            //----------------------------------------------------------------------------
            MontaPlanilhaContabil(Histor,Histor1,Histor2,Histor3,Histor4,
                                  sCcDeb, sCCCre ,sAtivProjeto,
                                  Credito, Debito, sNumDoc, ValLanc,
                                  iGrupo, iPlanoConta, iSubConta,
                                  sNomeContaDeb, sObrigaSubContaDeb,
                                  sNomeContaCre, sObrigaSubContaCre,
                                  strtoint(sIdBem),Sistema.IdEmpresa,fPlaca);
            if bErro then
               Raise Exception.Create(MensagemErro);
         end;
         //-------------------------------------------------------------------------------
         // Montagem da Partida Dobrada da Correção Monetária da Depreciação
         //-------------------------------------------------------------------------------
         if CorrDep <> 0 then
         begin
            if Particip2 < 100 then
            begin
               Histor := 'Correcao Monetaria da Depreciacao';
               sCCDeb := '';
               sCCCre := '';
               //-------------------------------------------------------------------------
               // Pesquisa a Centro de Custo na Conta Contábil a Débito
               //-------------------------------------------------------------------------
               sObrigaCCDeb := 'N';
               FuncaoGeral.TestaContaCC(True, iPlanoConta, DebitoCM,
                                        sObrigaCCDeb, sNomeContaDeb, sObrigaSubContaDeb);
               if sObrigaCCDeb = 'S' then
               begin
                  if qryCcRD.FieldByName('TIPO').AsString = 'A' then
                  begin
                     sCCDeb    := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
                     Particip2 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
                  end else
                  begin
                     Raise Exception.Create('O Rateio de Custo do Conjunto ' + qryCcRD.FieldByName('IDCONJUNTO').AsString +
                                            ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                                            'de Conjuntos!');
                  end;
               end;
               //-------------------------------------------------------------------------
               // Pesquisa o Centro de Custo na Conta Contábil a Crédito
               //-------------------------------------------------------------------------
               sObrigaCCCre := 'N';
               FuncaoGeral.TestaContaCC(True, iPlanoConta, CreditoCM,
                                        sObrigaCCCre, sNomeContaCre, sObrigaSubContaCre);
               if sObrigaCCCre = 'S' then
               begin
                  if qryCcRD.FieldByName('TIPO').AsString = 'A' then
                  begin
                     sCCCre    := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
                     Particip2 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
                  end else
                  begin
                     Raise Exception.Create('O Rateio de Custo do Conjunto ' + qryCcRD.FieldByName('IDCONJUNTO').AsString +
                                            ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                                            'de Conjuntos!');
                  end;
               end;
               //-------------------------------------------------------------------------
               if (sCCDeb = '') and (sCCCre = '') then
                  Particip1 := 100;
               //-------------------------------------------------------------------------
               // Calcula o Valor Rateado
               //-------------------------------------------------------------------------
               ValLanc := (CorrDep * Particip2) / 100;
               //-------------------------------------------------------------------------
               MontaPlanilhaContabil(Histor,Histor1,Histor2,Histor3,Histor4,
                                     sCcDeb, sCCCre ,sAtivProjeto,
                                     CreditoCM, DebitoCM, sNumDoc, ValLanc,
                                     iGrupo, iPlanoConta, iSubConta,
                                     sNomeContaDeb, sObrigaSubContaDeb,
                                     sNomeContaCre, sObrigaSubContaCre,
                                     strtoint(sIdBem),Sistema.IdEmpresa,fPlaca);
               if bErro then
                  Raise Exception.Create(MensagemErro);
            end;
         end;
         //-------------------------------------------------------------------------------
         qryCcRD.Next;
      end;
   except
      On E : Exception do
      begin
         MensagemErro := E.Message;
         bErro := True;
      end;
   end;
end;
//========================================================================================
Procedure TfrmMovDepreciacao.MontaPlanilhaContabil(Histor, Histor1, Histor2, Histor3, Histor4,
                                                   sCcDeb, sCCCre, sAtivProjeto,
                                                   sContaCre, sContaDeb, sNumDoc : string;
                                                   ValLanc : Extended;
                                                   iGrupo, iPlano, iSubConta : Integer;
                                                   sNomeContaDeb, sObrigaSubContaDeb,
                                                   sNomeContaCre, sObrigaSubContaCre : String;
                                                   iBem, iPessoa : Integer; fPlaca : Extended);
Var
   iCodSubContaDeb, iCodSubContaCre,
   iPatro, iPlanoPrev                    : Integer;
   fValOfi, fPercRateio                  : Extended;
   sTipoLanc,
   sPlaTipConvOfiDeb, sPlaTipConvOfiCre,
   sPlaTipConvGerDeb, sPlaTipConvGerCre  : String;
   bParamContab                          : Boolean;

begin
   try
      if ValLanc = 0 then
         exit;
      //----------------------------------------------------------------------------------
      fValOfi := abs(ValLanc);
      //----------------------------------------------------------------------------------
      // Verifica se Centro de Custo está associado a Conta Contábil a Debito
      //----------------------------------------------------------------------------------
      if sCcDeb <> '' then
      begin
         with dtmAtivoFixo.qryContasxCc do
         begin
            Close;
            ParamByName('PIDEMPRESA').asInteger      := iPessoa;
            ParamByName('PPLANO').asInteger          := iPlano;
            ParamByName('PPLACONTA').asString        := trim(sContaDeb);
            ParamByName('PCODCENTROCUSTO').asString  := trim(sCcDeb);
            Open;
            if isEmpty then
               Raise Exception.Create('Grupo ' + Busca_Grupo(iGrupo) + ' - Associe o Centro de Custo ' + sCCDeb +
                                      ' à Conta Contábil ' + sContaDeb + ' no Plano ' + inttostr(iPlano) +
                                      ' usando o Cadastro de Plano de Contas no Sistema Contabilidade!');
         end;
      end;
      //----------------------------------------------------------------------------------
      // Verifica se Centro de Custo está associado a Conta Contábil a Credito
      //----------------------------------------------------------------------------------
      if sCcCre <> '' then
      begin
         with dtmAtivoFixo.qryContasxCc do
         begin
            Close;
            ParamByName('PIDEMPRESA').asInteger      := iPessoa;
            ParamByName('PPLANO').asInteger          := iPlano;
            ParamByName('PPLACONTA').asString        := trim(sContaCre);
            ParamByName('PCODCENTROCUSTO').asString  := trim(sCcCre);
            Open;
            if isEmpty then
               Raise Exception.Create('Grupo ' + Busca_Grupo(iGrupo) + ' - Associe o Centro de Custo ' + sCCCre +
                                      ' à Conta Contábil ' + sContaCre + ' no Plano ' + inttostr(iPlano) +
                                      ' usando o Cadastro de Plano de Contas no Sistema Contabilidade!');
         end;
      end;
      //----------------------------------------------------------------------------------
      // Verifica se a SubConta está associada a Conta Contábil a Debito
      //----------------------------------------------------------------------------------
      if sObrigaSubContaDeb = 'S' then
      begin
         with dtmAtivoFixo.qryContasxSubC do
         begin
            Close;
            ParamByName('PIDEMPRESA').asInteger   := Sistema.IdEmpresa;
            ParamByName('PPLANO').asInteger       := iPlano;
            ParamByName('PPLACONTA').asString     := sContaDeb;
            ParamByName('PCODSUBCONTA').asInteger := iSubConta;
            Open;
            if isEmpty then
            begin
               if iSubConta <= 0 then
                  Raise Exception.Create('Grupo ' + Busca_Grupo(iGrupo) + ' - A SubConta é obrigatória na Conta Contábil ' + sContaDeb +
                                         ' no Plano ' + inttostr(iPlano) + '. Informe-a.')
               else
                  Raise Exception.Create('Grupo ' + Busca_Grupo(iGrupo) + ' - Associe a SubConta ' + inttostr(iSubConta) +
                                         ' à Conta Contábil ' + sContaDeb + ' no Plano ' + inttostr(iPlano) +
                                         ' usando o Cadastro de Plano de Contas no Sistema da Contabilidade');
            end;
            iCodSubContaDeb := iSubConta;
         end;
      end else
         iCodSubContaDeb := 0;
      //----------------------------------------------------------------------------------
      // Verifica se a SubConta está associada a Conta Contábil a Credito
      //----------------------------------------------------------------------------------
      if sObrigaSubContaCre = 'S' then
      begin
         with dtmAtivoFixo.qryContasxSubC do
         begin
            Close;
            ParamByName('PIDEMPRESA').asInteger   := Sistema.IdEmpresa;
            ParamByName('PPLANO').asInteger       := iPlano;
            ParamByName('PPLACONTA').asString     := sContaCre;
            ParamByName('PCODSUBCONTA').asInteger := iSubConta;
            Open;
            if isEmpty then
            begin
               if iSubConta <= 0 then
                  Raise Exception.Create('Grupo ' + Busca_Grupo(iGrupo) + ' - A SubConta é obrigatória na Conta Contábil ' + sContaCre +
                                         ' no Plano ' + inttostr(iPlano) + '. Informe-a.')
               else
                  Raise Exception.Create('Grupo ' + Busca_Grupo(iGrupo) + ' - Associe a SubConta ' + inttostr(iSubConta) +
                                         ' à Conta Contábil ' + sContaCre + ' no Plano ' + inttostr(iPlano) +
                                         ' usando o Cadastro de Plano de Contas no Sistema da Contabilidade');
            end;
            iCodSubContaCre := iSubConta;
         end;
      end else
         iCodSubContaCre := 0;
      //----------------------------------------------------------------------------------
      // Pesquisa o Rateio de PlanoPatrocinadora do Bem para o calculo do rateio.
      // Caso não haja rateio definido, usa o padrão setado nos Parâmetros do Sistema.
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         qryRatPP.Close;
         qryRatPP.ParamByName('PIDBEM').AsInteger     := iBem;
         qryRatPP.ParamByName('PIDEMPRESA').AsInteger := iPessoa;
         qryRatPP.Open;
         //-------------------------------------------------------------------------------
         repeat
            if qryRatPP.IsEmpty then
            begin
               with dtmAtivoFixo.qryParamCAF do
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
               iPatro      := qryRatPP.FieldByName('IDPATRO').AsInteger;
               iPlanoPrev  := qryRatPP.FieldByName('IDPLANOPREV').AsInteger;
               fPercRateio := qryRatPP.FieldByName('PPBPERCRATEIO').AsFloat / 100;
            end;
            //----------------------------------------------------------------------------
            // Realiza o registro como partida simples qdo PACDOBRADA = 'N'
            //----------------------------------------------------------------------------
            if dtmAtivoFixo.qryParamCAF.FieldByName('PACDOBRADA').AsString = 'N' then // Partida Simples
            begin
               if dtmAtivoFixo.qryParamCAF.FieldByName('FLGCONTABFECHAM').AsInteger = 0 then // Analítico
               begin
                  //----------------------------------------------------------------------
                  // Realiza o registro da Conta a Debito
                  //----------------------------------------------------------------------
                  sTipoLanc := 'D';
                  bParamContab := qryAuxContab.Locate('PLANO;PLACONTA;IDGRUPO;LACDEBCRE;CODCENTROCUSTO;CODSUBCONTA;UNIDNEGOC;IDPATRO;IDPLANOPREV',
                                                      VarArrayOf([iPlano,sContaDeb,iGrupo,sTipoLanc,sCcDeb,iCodSubContaDeb,strtoint(sAtivProjeto),iPatro,iPlanoPrev]),[]);
                  //----------------------------------------------------------------------
                  if not bParamContab then
                  begin
                     //-------------------------------------------------------------------
                     // Posiciona a tabela PlanoConta para obter informações adicionais da
                     // conta contábil envolvida no lançamento a Débito
                     //-------------------------------------------------------------------
                     qryPlanoConta.Close;
                     qryPlanoConta.ParamByName('PPLANO').AsInteger   := iPlano;
                     qryPlanoConta.ParamByName('PPLACONTA').AsString := sContaDeb;
                     qryPlanoConta.Open;
                     sPlaTipConvOfiDeb := qryPlanoConta.FieldByName('PLATIPCONVOFICIAL').AsString;
                     sPlaTipConvGerDeb := qryPlanoConta.FieldByName('PLATIPCONVGER').AsString;
                     //-------------------------------------------------------------------
                     qryAuxContab.Append;
                     qryAuxContab.FieldByName('PLANO').AsInteger            := iPlano;
                     qryAuxContab.FieldByName('PLACONTA').AsString          := sContaDeb;
                     qryAuxContab.FieldByName('IDGRUPO').AsInteger          := iGrupo;
                     qryAuxContab.FieldByName('LACDEBCRE').AsString         := sTipoLanc;
                     qryAuxContab.FieldByName('CODCENTROCUSTO').AsString    := sCcDeb;
                     //-------------------------------------------------------------------
                     if iCodSubContaDeb <> 0 then
                        qryAuxContab.FieldByName('CODSUBCONTA').AsInteger := iCodSubContaDeb
                     else
                        qryAuxContab.FieldByName('CODSUBCONTA').Clear;
                     //-------------------------------------------------------------------
                     qryAuxContab.FieldByName('CODSUBCONTA').AsInteger      := iCodSubContaDeb;
                     qryAuxContab.FieldByName('UNIDNEGOC').AsString         := sAtivProjeto;
                     qryAuxContab.FieldByName('IDPATRO').AsInteger          := iPatro;
                     qryAuxContab.FieldByName('IDPLANOPREV').AsInteger      := iPlanoPrev;
                     qryAuxContab.FieldByName('PLATIPCONVOFIDEB').AsString  := sPlaTipConvOfiDeb;
                     qryAuxContab.FieldByName('PLATIPCONVGERDEB').AsString  := sPlaTipConvGerDeb;
                     qryAuxContab.FieldByName('PLATIPCONVOFICRE').Clear;
                     qryAuxContab.FieldByName('PLATIPCONVGERCRE').Clear;
                     qryAuxContab.FieldByName('LACNUMDOC').AsString         := sNumDoc;
                     qryAuxContab.FieldByName('LACHIST1').AsString          := Histor;
                     qryAuxContab.FieldByName('LACHIST2').AsString          := Busca_Grupo(iGrupo);
                     qryAuxContab.FieldByName('LACHIST3').AsString          := Histor3;
                     qryAuxContab.FieldByName('LACHIST4').AsString          := Histor4;
                     qryAuxContab.FieldByName('LACHIST5').AsString          := '';
                     //-------------------------------------------------------------------
                     qryAuxContab.FieldByName('LACVALOR').AsFloat           := fValOfi * fPercRateio;
                  end else
                  begin
                     qryAuxContab.Edit;
                     qryAuxContab.FieldByName('LACVALOR').AsFloat := qryAuxContab.FieldByName('LACVALOR').AsFloat + (fValOfi * fPercRateio);
                  end;
                  //----------------------------------------------------------------------
                  // Realiza o registro da Conta a Credito
                  //----------------------------------------------------------------------
                  sTipoLanc := 'C';
                  bParamContab := qryAuxContab.Locate('PLANO;PLACONTA;IDGRUPO;LACDEBCRE;CODCENTROCUSTO;CODSUBCONTA;UNIDNEGOC;IDPATRO;IDPLANOPREV',
                                                      VarArrayOf([iPlano,sContaCre,iGrupo,sTipoLanc,sCcCre,iCodSubContaCre,strtoint(sAtivProjeto),iPatro,iPlanoPrev]),[]);
                  //----------------------------------------------------------------------
                  if not bParamContab then
                  begin
                     //-------------------------------------------------------------------
                     // Posiciona a tabela PlanoConta para obter informações adicionais da
                     // conta contábil envolvida no lançamento a Credito
                     //-------------------------------------------------------------------
                     qryPlanoConta.Close;
                     qryPlanoConta.ParamByName('PPLANO').AsInteger   := iPlano;
                     qryPlanoConta.ParamByName('PPLACONTA').AsString := sContaCre;
                     qryPlanoConta.Open;
                     sPlaTipConvOfiCre := qryPlanoConta.FieldByName('PLATIPCONVOFICIAL').AsString;
                     sPlaTipConvGerCre := qryPlanoConta.FieldByName('PLATIPCONVGER').AsString;
                     //-------------------------------------------------------------------
                     qryAuxContab.Append;
                     qryAuxContab.FieldByName('PLANO').AsInteger            := iPlano;
                     qryAuxContab.FieldByName('PLACONTA').AsString          := sContaCre;
                     qryAuxContab.FieldByName('IDGRUPO').AsInteger          := iGrupo;
                     qryAuxContab.FieldByName('CODCENTROCUSTO').AsString    := sCcCre;
                     //-------------------------------------------------------------------
                     if iCodSubContaCre <> 0 then
                        qryAuxContab.FieldByName('CODSUBCONTA').AsInteger := iCodSubContaCre
                     else
                        qryAuxContab.FieldByName('CODSUBCONTA').Clear;
                     //-------------------------------------------------------------------
                     qryAuxContab.FieldByName('LACDEBCRE').AsString         := sTipoLanc;
                     qryAuxContab.FieldByName('UNIDNEGOC').AsString         := sAtivProjeto;
                     qryAuxContab.FieldByName('IDPATRO').AsInteger          := iPatro;
                     qryAuxContab.FieldByName('IDPLANOPREV').AsInteger      := iPlanoPrev;
                     qryAuxContab.FieldByName('PLATIPCONVOFIDEB').Clear;
                     qryAuxContab.FieldByName('PLATIPCONVGERDEB').Clear;
                     qryAuxContab.FieldByName('PLATIPCONVOFICRE').AsString  := sPlaTipConvOfiCre;
                     qryAuxContab.FieldByName('PLATIPCONVGERCRE').AsString  := sPlaTipConvGerCre;
                     qryAuxContab.FieldByName('LACNUMDOC').AsString         := sNumDoc;
                     qryAuxContab.FieldByName('LACHIST1').AsString          := Histor;
                     qryAuxContab.FieldByName('LACHIST2').AsString          := Busca_Grupo(iGrupo);
                     qryAuxContab.FieldByName('LACHIST3').AsString          := Histor3;
                     qryAuxContab.FieldByName('LACHIST4').AsString          := Histor4;
                     qryAuxContab.FieldByName('LACHIST5').AsString          := '';
                     //-------------------------------------------------------------------
                     qryAuxContab.FieldByName('LACVALOR').AsFloat := fValOfi * fPercRateio;
                  end else
                  begin
                     qryAuxContab.Edit;
                     qryAuxContab.FieldByName('LACVALOR').AsFloat := qryAuxContab.FieldByName('LACVALOR').AsFloat + (fValOfi * fPercRateio);
                  end;
               end else
               //-------------------------------------------------------------------------
               if dtmAtivoFixo.qryParamCAF.FieldByName('FLGCONTABFECHAM').AsInteger = 1 then // Sintético - CBS
               begin
                  //----------------------------------------------------------------------
                  // Processa a Conta a Debito
                  //----------------------------------------------------------------------
                  sTipoLanc := 'D';
                  bParamContab := qryAuxContab.Locate('PLANO;PLACONTA;IDGRUPO;CODCENTROCUSTO;CODSUBCONTA;UNIDNEGOC;IDPATRO;IDPLANOPREV',
                                                       VarArrayOf([iPlano,sContaDeb,iGrupo,sCcDeb,iCodSubContaDeb,strtoint(sAtivProjeto),iPatro,iPlanoPrev]),[]);
                  if not bParamContab then
                  begin
                     //-------------------------------------------------------------------
                     // Posiciona a tabela PlanoConta para obter informações adicionais da
                     // conta contábil envolvida no lançamento a Débito
                     //-------------------------------------------------------------------
                     qryPlanoConta.Close;
                     qryPlanoConta.ParamByName('PPLANO').AsInteger   := iPlano;
                     qryPlanoConta.ParamByName('PPLACONTA').AsString := sContaDeb;
                     qryPlanoConta.Open;
                     sPlaTipConvOfiDeb := qryPlanoConta.FieldByName('PLATIPCONVOFICIAL').AsString;
                     sPlaTipConvGerDeb := qryPlanoConta.FieldByName('PLATIPCONVGER').AsString;
                     //-------------------------------------------------------------------
                     qryAuxContab.Append;
                     qryAuxContab.FieldByName('PLANO').AsInteger            := iPlano;
                     qryAuxContab.FieldByName('PLACONTA').AsString          := sContaDeb;
                     qryAuxContab.FieldByName('IDGRUPO').AsInteger          := iGrupo;
                     qryAuxContab.FieldByName('LACDEBCRE').AsString         := sTipoLanc;
                     qryAuxContab.FieldByName('CODCENTROCUSTO').AsString    := sCcDeb;
                     //-------------------------------------------------------------------
                     if iCodSubContaDeb <> 0 then
                        qryAuxContab.FieldByName('CODSUBCONTA').AsInteger := iCodSubContaDeb
                     else
                        qryAuxContab.FieldByName('CODSUBCONTA').Clear;
                     //-------------------------------------------------------------------
                     qryAuxContab.FieldByName('CODSUBCONTA').AsInteger      := iCodSubContaDeb;
                     qryAuxContab.FieldByName('UNIDNEGOC').AsString         := sAtivProjeto;
                     qryAuxContab.FieldByName('IDPATRO').AsInteger          := iPatro;
                     qryAuxContab.FieldByName('IDPLANOPREV').AsInteger      := iPlanoPrev;
                     qryAuxContab.FieldByName('PLATIPCONVOFIDEB').AsString  := sPlaTipConvOfiDeb;
                     qryAuxContab.FieldByName('PLATIPCONVGERDEB').AsString  := sPlaTipConvGerDeb;
                     qryAuxContab.FieldByName('PLATIPCONVOFICRE').Clear;
                     qryAuxContab.FieldByName('PLATIPCONVGERCRE').Clear;
                     qryAuxContab.FieldByName('LACNUMDOC').AsString         := sNumDoc;
                     qryAuxContab.FieldByName('LACHIST1').AsString          := Histor;
                     qryAuxContab.FieldByName('LACHIST2').AsString          := Busca_Grupo(iGrupo);
                     qryAuxContab.FieldByName('LACHIST3').AsString          := Histor3;
                     qryAuxContab.FieldByName('LACHIST4').AsString          := Histor4;
                     qryAuxContab.FieldByName('LACHIST5').AsString          := '';
                     //-------------------------------------------------------------------
                     qryAuxContab.FieldByName('LACVALORDEB').AsFloat := fValOfi * fPercRateio;
                     qryAuxContab.FieldByName('LACVALORCRE').AsFloat := 0;
                  end else
                  begin
                     qryAuxContab.Edit;
                     qryAuxContab.FieldByName('LACVALORDEB').AsFloat := qryAuxContab.FieldByName('LACVALORDEB').AsFloat + (fValOfi * fPercRateio);
                  end;
                  //----------------------------------------------------------------------
                  // Processa a Conta a Crédito
                  //----------------------------------------------------------------------
                  sTipoLanc := 'C';
                  bParamContab := qryAuxContab.Locate('PLANO;PLACONTA;IDGRUPO;CODCENTROCUSTO;CODSUBCONTA;UNIDNEGOC;IDPATRO;IDPLANOPREV',
                                                      VarArrayOf([iPlano,sContaCre,iGrupo,sCcCre,iCodSubContaCre,strtoint(sAtivProjeto),iPatro,iPlanoPrev]),[]);
                  if not bParamContab then
                  begin
                     //-------------------------------------------------------------------
                     // Posiciona a tabela PlanoConta para obter informações adicionais da
                     // conta contábil envolvida no lançamento a crédito
                     //-------------------------------------------------------------------
                     qryPlanoConta.Close;
                     qryPlanoConta.ParamByName('PPLANO').AsInteger   := iPlano;
                     qryPlanoConta.ParamByName('PPLACONTA').AsString := sContaCre;
                     qryPlanoConta.Open;
                     sPlaTipConvOfiCre := qryPlanoConta.FieldByName('PLATIPCONVOFICIAL').AsString;
                     sPlaTipConvGerCre := qryPlanoConta.FieldByName('PLATIPCONVGER').AsString;
                     //-------------------------------------------------------------------
                     qryAuxContab.Append;
                     qryAuxContab.FieldByName('PLANO').AsInteger            := iPlano;
                     qryAuxContab.FieldByName('PLACONTA').AsString          := sContaCre;
                     qryAuxContab.FieldByName('IDGRUPO').AsInteger          := iGrupo;
                     qryAuxContab.FieldByName('LACDEBCRE').AsString         := sTipoLanc;
                     qryAuxContab.FieldByName('CODCENTROCUSTO').AsString    := sCcCre;
                     //-------------------------------------------------------------------
                     if iCodSubContaDeb <> 0 then
                        qryAuxContab.FieldByName('CODSUBCONTA').AsInteger := iCodSubContaCre
                     else
                        qryAuxContab.FieldByName('CODSUBCONTA').Clear;
                     //-------------------------------------------------------------------
                     qryAuxContab.FieldByName('CODSUBCONTA').AsInteger      := iCodSubContaCre;
                     qryAuxContab.FieldByName('UNIDNEGOC').AsString         := sAtivProjeto;
                     qryAuxContab.FieldByName('IDPATRO').AsInteger          := iPatro;
                     qryAuxContab.FieldByName('IDPLANOPREV').AsInteger      := iPlanoPrev;
                     qryAuxContab.FieldByName('PLATIPCONVOFIDEB').Clear;
                     qryAuxContab.FieldByName('PLATIPCONVGERDEB').Clear;
                     qryAuxContab.FieldByName('PLATIPCONVOFICRE').AsString  := sPlaTipConvOfiCre;
                     qryAuxContab.FieldByName('PLATIPCONVGERCRE').AsString  := sPlaTipConvGerCre;
                     qryAuxContab.FieldByName('LACNUMDOC').AsString         := sNumDoc;
                     qryAuxContab.FieldByName('LACHIST1').AsString          := Histor;
                     qryAuxContab.FieldByName('LACHIST2').AsString          := Busca_Grupo(iGrupo);
                     qryAuxContab.FieldByName('LACHIST3').AsString          := Histor3;
                     qryAuxContab.FieldByName('LACHIST4').AsString          := Histor4;
                     qryAuxContab.FieldByName('LACHIST5').AsString          := '';
                     //-------------------------------------------------------------------
                     qryAuxContab.FieldByName('LACVALORDEB').AsFloat := 0;
                     qryAuxContab.FieldByName('LACVALORCRE').AsFloat := fValOfi * fPercRateio;
                  end else
                  begin
                     qryAuxContab.Edit;
                     qryAuxContab.FieldByName('LACVALORCRE').AsFloat := qryAuxContab.FieldByName('LACVALORCRE').AsFloat + (fValOfi * fPercRateio);
                  end;
               end;
            end else
            //----------------------------------------------------------------------------
            // Realiza o registro como partida dobrada
            //----------------------------------------------------------------------------
            begin
               bParamContab := qryAuxContab.Locate('PLANO;PLACONTADEB;PLACONTACRE;IDGRUPO;CODCENTROCUSTODEB;CODCENTROCUSTOCRE;CODSUBCONTADEB;CODSUBCONTACRE;UNIDNEGOC;IDPATRO;IDPLANOPREV',
                                                   VarArrayOf([iPlano,sContaDeb,sContaCre,iGrupo,sCcDeb,sCcCre,iCodSubContaDeb,iCodSubContaCre,strtoint(sAtivProjeto),iPatro,iPlanoPrev]),[]);
               //-------------------------------------------------------------------------
               if not bParamContab then
               begin
                  //----------------------------------------------------------------------
                  // Posiciona a tabela PlanoConta para obter informações adicionais da
                  // conta contábil envolvida no lançamento a Débito
                  //----------------------------------------------------------------------
                  qryPlanoConta.Close;
                  qryPlanoConta.ParamByName('PPLANO').AsInteger   := iPlano;
                  qryPlanoConta.ParamByName('PPLACONTA').AsString := sContaDeb;
                  qryPlanoConta.Open;
                  sPlaTipConvOfiDeb := qryPlanoConta.FieldByName('PLATIPCONVOFICIAL').AsString;
                  sPlaTipConvGerDeb := qryPlanoConta.FieldByName('PLATIPCONVGER').AsString;
                  //----------------------------------------------------------------------
                  // Posiciona a tabela PlanoConta para obter informações adicionais da
                  // conta contábil envolvida no lançamento a Credito
                  //----------------------------------------------------------------------
                  qryPlanoConta.Close;
                  qryPlanoConta.ParamByName('PPLANO').AsInteger   := iPlano;
                  qryPlanoConta.ParamByName('PPLACONTA').AsString := sContaCre;
                  qryPlanoConta.Open;
                  sPlaTipConvOfiCre := qryPlanoConta.FieldByName('PLATIPCONVOFICIAL').AsString;
                  sPlaTipConvGerCre := qryPlanoConta.FieldByName('PLATIPCONVGER').AsString;
                  //----------------------------------------------------------------------
                  qryAuxContab.Append;
                  qryAuxContab.FieldByName('PLANO').AsInteger            := iPlano;
                  qryAuxContab.FieldByName('PLACONTADEB').AsString       := sContaDeb;
                  qryAuxContab.FieldByName('PLACONTACRE').AsString       := sContaCre;
                  qryAuxContab.FieldByName('IDGRUPO').AsInteger          := iGrupo;
                  qryAuxContab.FieldByName('CODCENTROCUSTODEB').AsString := sCcDeb;
                  qryAuxContab.FieldByName('CODCENTROCUSTOCRE').AsString := sCcCre;
                  //----------------------------------------------------------------------
                  if iCodSubContaDeb <> 0 then
                     qryAuxContab.FieldByName('CODSUBCONTADEB').AsInteger := iCodSubContaDeb
                  else
                     qryAuxContab.FieldByName('CODSUBCONTADEB').Clear;
                  //----------------------------------------------------------------------
                  if iCodSubContaCre <> 0 then
                     qryAuxContab.FieldByName('CODSUBCONTACRE').AsInteger := iCodSubContaCre
                  else
                     qryAuxContab.FieldByName('CODSUBCONTACRE').Clear;
                  //----------------------------------------------------------------------
                  qryAuxContab.FieldByName('UNIDNEGOC').AsString         := sAtivProjeto;
                  qryAuxContab.FieldByName('IDPATRO').AsInteger          := iPatro;
                  qryAuxContab.FieldByName('IDPLANOPREV').AsInteger      := iPlanoPrev;
                  qryAuxContab.FieldByName('PLATIPCONVOFIDEB').AsString  := sPlaTipConvOfiDeb;
                  qryAuxContab.FieldByName('PLATIPCONVGERDEB').AsString  := sPlaTipConvGerDeb;
                  qryAuxContab.FieldByName('PLATIPCONVOFICRE').AsString  := sPlaTipConvOfiCre;
                  qryAuxContab.FieldByName('PLATIPCONVGERCRE').AsString  := sPlaTipConvGerCre;
                  qryAuxContab.FieldByName('LACNUMDOC').AsString         := sNumDoc;
                  qryAuxContab.FieldByName('LACHIST1').AsString          := Histor;
                  qryAuxContab.FieldByName('LACHIST2').AsString          := Busca_Grupo(iGrupo);
                  qryAuxContab.FieldByName('LACHIST3').AsString          := Histor3;
                  qryAuxContab.FieldByName('LACHIST4').AsString          := Histor4;
                  qryAuxContab.FieldByName('LACHIST5').AsString          := '';
                  //----------------------------------------------------------------------
                  qryAuxContab.FieldByName('LACVALOR').AsFloat := fValOfi * fPercRateio;
               end else
               begin
                  qryAuxContab.Edit;
                  qryAuxContab.FieldByName('LACVALOR').AsFloat := qryAuxContab.FieldByName('LACVALOR').AsFloat + (fValOfi * fPercRateio);
               end;
            end;
            //----------------------------------------------------------------------------
            if not qryRatPP.IsEmpty then
               qryRatPP.Next;
            //----------------------------------------------------------------------------
         until qryRatPP.EOF;
      end;
   except
      On E : Exception do
      begin
         MensagemErro := E.Message;
         bErro := True;
      end;
   end;
end;
//========================================================================================
function TfrmMovDepreciacao.RegistraPlanilhaContabil(Exercicio,Periodo : Integer) : Boolean;
Var
   sTipOper,
   sContaDeb, sContaCre,
   sCcDeb, sCcCre,
   sSubContaDeb, sSubContaCre,
   sPlaTipConvOfiDeb, sPlaTipConvOfiCre,
   sPlaTipConvGerDeb, sPlaTipConvGerCre,
   sValLanc, sCodDebCred, sDebCred,
   sPlaCCust, sMensagem                  : String;
   bJunta                                : Boolean;
   fValLanc                              : Extended;

begin
   try
      with dtmAtivoFixo do
      begin
         lblStatus.Caption := 'Registrando a Planilha Contábil';
         prgBar.MaxValue   := qryAuxContab.RecordCount;
         prgBar.Progress   := 0;
         //-------------------------------------------------------------------------------
         // Inicializa uma nova planilha contábil
         //-------------------------------------------------------------------------------
         pln := 0;
         Planilha := pln;
         //-------------------------------------------------------------------------------
         if not dtmAtivoFixo.qryParamCAF.Active then
         begin
            dtmAtivoFixo.qryParamCAF.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
            dtmAtivoFixo.qryParamCAF.Open;
         end;
         sTipOper := dtmAtivoFixo.qryParamCAF.FieldByName('TIPOPERCTB').AsString;
         bJunta   := False;
         //-------------------------------------------------------------------------------
         // Registra os lançamentos da planilha na contabilidade
         //-------------------------------------------------------------------------------
         qryAuxContab.First;
         while not qryAuxContab.EOF do
         begin
            sContaDeb         := '';
            sContaCre         := '';
            sCcDeb            := '';
            sCcCre            := '';
            sSubContaDeb      := '';
            sSubContaCre      := '';
            sPlaTipConvOfiDeb := '';
            sPlaTipConvOfiCre := '';
            sPlaTipConvGerDeb := '';
            sPlaTipConvGerCre := '';
            sValLanc          := FormatFloat('#0.00',qryAuxContab.FieldByName('LACVALOR').AsFloat);
            fValLanc          := StrToFloat(sValLanc);
            sPlaCCust         := '';
            sMensagem         := '';
            //----------------------------------------------------------------------------
            // Alimenta os elementos contábeis de acordo com o tipo de partida
            //----------------------------------------------------------------------------
            if dtmAtivoFixo.qryParamCAF.FieldByName('PACDOBRADA').AsString = 'N' then
            begin
               if dtmAtivoFixo.qryParamCAF.FieldByName('FLGCONTABFECHAM').AsInteger = 0 then
               begin
                  if qryAuxContab.FieldByName('LACDEBCRE').AsString = 'D' then
                  begin
                     sCodDebCred       := '0';
                     sDebCred          := qryAuxContab.FieldByName('LACDEBCRE').AsString;
                     sContaDeb         := qryAuxContab.FieldByName('PLACONTA').AsString;
                     sCcDeb            := qryAuxContab.FieldByName('CODCENTROCUSTO').AsString;
                     sSubContaDeb      := qryAuxContab.FieldByName('CODSUBCONTA').AsString;
                     sPlaTipConvOfiDeb := qryAuxContab.FieldByName('PLATIPCONVOFIDEB').AsString;
                     sPlaTipConvGerDeb := qryAuxContab.FieldByName('PLATIPCONVGERDEB').AsString;
                  end else
                  begin
                     sCodDebCred       := '1';
                     sDebCred          := qryAuxContab.FieldByName('LACDEBCRE').AsString;
                     sContaCre         := qryAuxContab.FieldByName('PLACONTA').AsString;
                     sCcCre            := qryAuxContab.FieldByName('CODCENTROCUSTO').AsString;
                     sSubContaCre      := qryAuxContab.FieldByName('CODSUBCONTA').AsString;
                     sPlaTipConvOfiCre := qryAuxContab.FieldByName('PLATIPCONVOFICRE').AsString;
                     sPlaTipConvGerCre := qryAuxContab.FieldByName('PLATIPCONVGERCRE').AsString;
                  end;
               end else
               //-------------------------------------------------------------------------
               if dtmAtivoFixo.qryParamCAF.FieldByName('FLGCONTABFECHAM').AsInteger = 1 then
               begin
                  if qryAuxContab.FieldByName('LACVALORDEB').AsFloat > qryAuxContab.FieldByName('LACVALORCRE').AsFloat then
                  begin
                     sCodDebCred       := '0';
                     sDebCred          := 'D';
                     sContaDeb         := qryAuxContab.FieldByName('PLACONTA').AsString;
                     sCcDeb            := qryAuxContab.FieldByName('CODCENTROCUSTO').AsString;
                     sSubContaDeb      := qryAuxContab.FieldByName('CODSUBCONTA').AsString;
                     sPlaTipConvOfiDeb := qryAuxContab.FieldByName('PLATIPCONVOFIDEB').AsString;
                     sPlaTipConvGerDeb := qryAuxContab.FieldByName('PLATIPCONVGERDEB').AsString;
                     fValLanc          := qryAuxContab.FieldByName('LACVALORDEB').AsFloat - qryAuxContab.FieldByName('LACVALORCRE').AsFloat;
                  end else
                  //----------------------------------------------------------------------
                  if qryAuxContab.FieldByName('LACVALORDEB').AsFloat < qryAuxContab.FieldByName('LACVALORCRE').AsFloat then
                  begin
                     sCodDebCred       := '1';
                     sDebCred          := 'C';
                     sContaCre         := qryAuxContab.FieldByName('PLACONTA').AsString;
                     sCcCre            := qryAuxContab.FieldByName('CODCENTROCUSTO').AsString;
                     sSubContaCre      := qryAuxContab.FieldByName('CODSUBCONTA').AsString;
                     sPlaTipConvOfiCre := qryAuxContab.FieldByName('PLATIPCONVOFICRE').AsString;
                     sPlaTipConvGerCre := qryAuxContab.FieldByName('PLATIPCONVGERCRE').AsString;
                     fValLanc          := qryAuxContab.FieldByName('LACVALORCRE').AsFloat - qryAuxContab.FieldByName('LACVALORDEB').AsFloat;
                  end else
                  begin
                     sCodDebCred       := '2';
                     sDebCred          := '';
                     sContaDeb         := qryAuxContab.FieldByName('PLACONTA').AsString;
                     sContaCre         := qryAuxContab.FieldByName('PLACONTA').AsString;
                     sCcDeb            := qryAuxContab.FieldByName('CODCENTROCUSTO').AsString;
                     sCcCre            := qryAuxContab.FieldByName('CODCENTROCUSTO').AsString;
                     sSubContaDeb      := qryAuxContab.FieldByName('CODSUBCONTA').AsString;
                     sSubContaCre      := qryAuxContab.FieldByName('CODSUBCONTA').AsString;
                     sPlaTipConvOfiDeb := qryAuxContab.FieldByName('PLATIPCONVOFIDEB').AsString;
                     sPlaTipConvGerDeb := qryAuxContab.FieldByName('PLATIPCONVGERDEB').AsString;
                     sPlaTipConvOfiCre := qryAuxContab.FieldByName('PLATIPCONVOFICRE').AsString;
                     sPlaTipConvGerCre := qryAuxContab.FieldByName('PLATIPCONVGERCRE').AsString;
                     fValLanc          := qryAuxContab.FieldByName('LACVALORCRE').AsFloat - qryAuxContab.FieldByName('LACVALORDEB').AsFloat;
                  end;
               end;
            end else
            begin
               sCodDebCred       := '2';
               sDebCred          := '';
               sContaDeb         := qryAuxContab.FieldByName('PLACONTADEB').AsString;
               sContaCre         := qryAuxContab.FieldByName('PLACONTACRE').AsString;
               sCcDeb            := qryAuxContab.FieldByName('CODCENTROCUSTODEB').AsString;
               sCcCre            := qryAuxContab.FieldByName('CODCENTROCUSTOCRE').AsString;
               sSubContaDeb      := qryAuxContab.FieldByName('CODSUBCONTADEB').AsString;
               sSubContaCre      := qryAuxContab.FieldByName('CODSUBCONTACRE').AsString;
               sPlaTipConvOfiDeb := qryAuxContab.FieldByName('PLATIPCONVOFIDEB').AsString;
               sPlaTipConvGerDeb := qryAuxContab.FieldByName('PLATIPCONVGERDEB').AsString;
               sPlaTipConvOfiCre := qryAuxContab.FieldByName('PLATIPCONVOFICRE').AsString;
               sPlaTipConvGerCre := qryAuxContab.FieldByName('PLATIPCONVGERCRE').AsString;
            end;
            //----------------------------------------------------------------------------
            if fValLanc <> 0 then
            begin
               Planilha := LancaContab(True,'BaseDados',                                  // Base de Dados
                                       edDataFechamento.Text,                             // Data de Lançamento
                                       inttostr(Sistema.IdModulo),                        // Sistema de origem - tabela Módulo
                                       sCodDebCred,                                       // 0=> Débito, 1=> Crédito 2=>Partida Dobrada
                                       sDebCred,                                          // D=> Débito e C=> Crédito
                                       sPlaTipConvOfiDeb,                                 // Conversão à débito
                                       sPlaTipConvGerDeb,                                 // Conversão à débito
                                       sPlaTipConvGerDeb,                                 // Conversão à débito
                                       sPlaTipConvGerDeb,                                 // Conversão à débito
                                       'O',                                               // Origem da aplicação a débito
                                       sPlaTipConvOfiCre,                                 // Conversão à Crédito
                                       sPlaTipConvGerCre,                                 // Conversão à Crédito
                                       sPlaTipConvGerCre,                                 // Conversão à Crédito
                                       sPlaTipConvGerCre,                                 // Conversão à Crédito
                                       'O',                                               // Origem da aplicação a crédito
                                       qryAuxContab.FieldByName('LACNUMDOC').AsString,    // Número do Documento
                                       qryAuxContab.FieldByName('LACHIST1').AsString,     // Histórico 1
                                       qryAuxContab.FieldByName('LACHIST2').AsString,     // Histórico 2
                                       qryAuxContab.FieldByName('LACHIST3').AsString,     // Histórico 3
                                       qryAuxContab.FieldByName('LACHIST4').AsString,     // Histórico 4
                                       qryAuxContab.FieldByName('LACHIST5').AsString,     // Histórico 5
                                       sTipOper,                                          // Tipo de Operacao
                                       sCcDeb,                                            // ccusto a débito
                                       sContaDeb,                                         // Conta Contábil a débito
                                       sCcCre,                                            // ccusto a crédito
                                       sContaCre,                                         // conta contábil a crédito
                                       Exercicio,                                         // exercício (perexercício)
                                       Periodo,                                           // pernumero (tabperiodo)
                                       Sistema.IdEmpresa,                                 // pessoa
                                       Sistema.IdUsuario,                                 // usuário
                                       qryAuxContab.FieldByName('PLANO').AsInteger,       // plano
                                       fValLanc,                                          // valor do lançamento
                                       0,
                                       0,
                                       0,
                                       0,
                                       0,
                                       0,
                                       0,
                                       0,
                                       qryAuxContab.FieldByName('UNIDNEGOC').AsString,    // unidade de negócio
                                       bJunta,                                            // bjunta = false
                                       0,                                                 //
                                       0,                                                 //
                                       sSubContaDeb,                                      // subconta a Débito
                                       sSubContaCre,                                      //
                                       '',                                                //
                                       '',                                                //
                                       pln,                                               // Se 0, Cria Nova Pln, Senão Grava na pln
                                       sMensagem,
                                       IntegraBack.MascaraPlano,
                                       True,
                                       0,
                                       qryAuxContab.FieldByName('IDPLANOPREV').AsInteger, // Plano Previdenciário
                                       qryAuxContab.FieldByName('IDPATRO').AsInteger,     // Patrocinadora
                                       Sistema.UsaPlanoPatro                              // EmpresaProp usa Plano/Patrocinadora
                                       );
               pln := Planilha;
            end;
            //----------------------------------------------------------------------------
            if pln = -1 then
               raise Exception.Create('Erro no lançamento do Grupo '+qryAuxContab.FieldByName('LACHIST2').AsString+' da planilha contábil!');
            //----------------------------------------------------------------------------
            prgBar.Progress := prgBar.Progress + 1;
            qryAuxContab.Next;
         end;
         Result := True;
      end;
   except
      on E : Exception do
      begin
         Result := False;
         MensagemErro := E.Message;
      end;
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
   if dtmAtivoFixo.qryParamCAF.FieldByName('FLGCALCCM').AsInteger = 1 then
   begin
      //----------------------------------------------------------------------------------
      // Data de Referência
      //----------------------------------------------------------------------------------
      DecodeDate(edDataFechamento.date, iAnoFim, iMesFim, iDiaFim);
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
      qryCotacao.ParamByName('MOECODIGO').AsInteger := dtmAtivoFixo.qryParamCAF.FieldByName('MOEDAFISCAL').AsInteger;
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
Procedure TfrmMovDepreciacao.ContabilizaCorrMonetaria(Tipo : String; iPlanoConta : Integer;
                                                      sAtivProjeto, sDesBem, sIdBem : string;
                                                      fPlaca, ValOfi : Extended;
                                                      iGrupo,iConjunto,iSubConta : Integer);
var
   Particip1,ValLanc                                    : Extended;
   Histor,Histor1,Histor2,Histor3,Histor4,
   Debito, Credito,
   sCcDeb,sCcCre,
   sNomeContaDeb,sNomeContaCre,
   sGrupo,
   sObrigaCcDeb, sObrigaCcCre,
   sObrigaSubContaDeb,sObrigaSubContaCre,sNumDoc        : string;

begin
   try
      if Tipo = 'B' then
      begin
         //-------------------------------------------------------------------------------
         // Busca conta a débito para a Correção Monetária do Bem
         //-------------------------------------------------------------------------------
         Localiza_ContaContabil(iGrupo,15,'D',iPlanoConta,Debito);
         //-------------------------------------------------------------------------------
         if Debito = '' then
         begin
            sGrupo := Busca_Grupo(iGrupo);
            Raise Exception.Create('Conta a débito para o Movimento Cálculo da Correção Monetária do '+
                                   'Grupo ' + sGrupo + ' não cadastrada !');
         end;
         //-------------------------------------------------------------------------------
         // Busca conta a crédito para a Correção Monetária do Bem
         //-------------------------------------------------------------------------------
         Localiza_ContaContabil(iGrupo,15,'C',iPlanoConta,Credito);
         //-------------------------------------------------------------------------------
         if Credito = '' then
         begin
            sGrupo := Busca_Grupo(iGrupo);
            Raise Exception.Create('Conta a crédito para o Movimento Cálculo da Correção Monetária do '+
                                   'Grupo ' + sGrupo + ' não cadastrada !');
         end;
         //-------------------------------------------------------------------------------
      end else
      if Tipo = 'R' then
      begin
         //-------------------------------------------------------------------------------
         // Busca conta a débito para Reavaliação
         //-------------------------------------------------------------------------------
         Localiza_ContaContabil(iGrupo,22,'D',iPlanoConta,Debito);
         //-------------------------------------------------------------------------------
         if Debito = '' then
         begin
            sGrupo := Busca_Grupo(iGrupo);
            Raise Exception.Create('Conta a débito para o Movimento Correção Monetária da Reavaliação '+
                                   'do grupo ' + sGrupo + ' não cadastrada !');
         end;
         //-------------------------------------------------------------------------------
         // Busca conta a crédito para Reavaliacao
         //-------------------------------------------------------------------------------
         Localiza_ContaContabil(iGrupo,22,'C',iPlanoConta,Credito);
         //-------------------------------------------------------------------------------
         if Credito = '' then
         begin
            sGrupo := Busca_Grupo(iGrupo);
            Raise Exception.Create('Conta a crédito para o Movimento Correção Monetária da Reavaliação '+
                                   'do grupo ' + sGrupo + ' não cadastrada !');
         end;
      end else
      if Tipo = 'A' then
      begin
         //-------------------------------------------------------------------------------
         // Busca conta a débito para Acréscimo
         //-------------------------------------------------------------------------------
         Localiza_ContaContabil(iGrupo,34,'D',iPlanoConta,Debito);
         //-------------------------------------------------------------------------------
         if Credito = '' then
         begin
            sGrupo := Busca_Grupo(iGrupo);
            Raise Exception.Create('Conta a crédito para o Movimento Correção Monetária do Acréscimo de Valor'+
                                   ' do grupo ' + sGrupo + ' não cadastrada !');
         end;
         //-------------------------------------------------------------------------------
         // Busca conta a crédito para Acréscimo
         //-------------------------------------------------------------------------------
         Localiza_ContaContabil(iGrupo,34,'C',iPlanoConta,Credito);
         //-------------------------------------------------------------------------------
         if Debito = '' then
         begin
            sGrupo := Busca_Grupo(iGrupo);
            Raise Exception.Create('Conta a débito para o Movimento Correção Monetária do Acréscimo de Valor'+
                                   ' do grupo ' + sGrupo + ' não cadastrada !');
         end;
      end;
      //----------------------------------------------------------------------------------
      // Registra o Rateio por Centro de Custo na Pré-Planilha
      //----------------------------------------------------------------------------------
      Particip1 := 0;
      Histor1   := '';
      Histor2   := '';
      Histor3   := '';
      Histor4   := '';
      sNumDoc   := FormatDateTime('yyyymmdd',edDataFechamento.Date);
      //----------------------------------------------------------------------------------
      qryCcRD.Close;
      qryCcRD.ParamByName('EMPRESA').AsInteger  := Sistema.IdEmpresa;
      qryCcRD.ParamByName('CONJUNTO').AsInteger := iConjunto;
      qryCcRD.Open;
      //----------------------------------------------------------------------------------
      qryCcRD.First;
      while not qryCcRD.EOF do
      begin
         //-------------------------------------------------------------------------------
         // Montagem da Partida Dobrada da Correção Monetária
         //-------------------------------------------------------------------------------
         if Particip1 < 100 then
         begin
            Histor := 'Correcao Monetaria';
            sCCDeb := '';
            sCCCre := '';
            //----------------------------------------------------------------------------
            // Pesquisa a Centro de Custo na Conta Contábil a Débito
            //----------------------------------------------------------------------------
            sObrigaCCDeb := 'N';
            FuncaoGeral.TestaContaCC(True, iPlanoConta, Debito,
                                     sObrigaCCDeb, sNomeContaDeb, sObrigaSubContaDeb);
            if sObrigaCCDeb = 'S' then
            begin
               if qryCcRD.FieldByName('TIPO').AsString = 'A' then
               begin
                  sCCDeb    := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
                  Particip1 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
               end else
               begin
                  Raise Exception.Create('O Rateio de Custo do Conjunto ' + qryCcRD.FieldByname('IDCONJUNTO').AsString +
                                         ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                                         'de Conjuntos!');
               end;
            end;
            //----------------------------------------------------------------------------
            // Pesquisa o Centro de Custo na Conta Contábil a Crédito
            //----------------------------------------------------------------------------
            sObrigaCCCre := 'N';
            FuncaoGeral.TestaContaCC(True, iPlanoConta, Credito,
                                     sObrigaCCCre, sNomeContaCre, sObrigaSubContaCre);
            if sObrigaCCCre = 'S' then
            begin
               if qryCcRD.FieldByName('TIPO').AsString = 'A' then
               begin
                  sCCCre    := qryCcRD.FieldByName('CODCENTROCUSTO').AsString;
                  Particip1 := qryCcRD.FieldByName('PARTICIPACAO').AsFloat;
               end else
               begin
                  Raise Exception.Create('O Rateio de Custo do Conjunto ' + qryCcRD.FieldByName('IDCONJUNTO').AsString +
                                         ' foi feito com Centros de Custo Sintéticos. Altere em Cadastro '+
                                         'de Conjuntos!');
               end;
            end;
            //----------------------------------------------------------------------------
            if (sCCDeb = '') and (sCCCre = '') then
               Particip1 := 100;
            //----------------------------------------------------------------------------
            // Calcula o Valor Rateado
            //----------------------------------------------------------------------------
            ValLanc := (ValOfi * Particip1) / 100;
            //----------------------------------------------------------------------------
            MontaPlanilhaContabil(Histor,Histor1,Histor2,Histor3,Histor4,
                                  sCcDeb, sCCCre ,sAtivProjeto,
                                  Credito, Debito, sNumDoc, ValLanc,
                                  iGrupo, iPlanoConta, iSubConta,
                                  sNomeContaDeb, sObrigaSubContaDeb,
                                  sNomeContaCre, sObrigaSubContaCre,
                                  strtoint(sIdBem),Sistema.IdEmpresa,fPlaca);
            if bErro then
               Raise Exception.Create(MensagemErro);
         end;
         //-------------------------------------------------------------------------------
         qryCcRD.Next;
      end;
   except
      On E : Exception do
      begin
         MensagemErro := E.Message;
         bErro := True;
      end;
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
                                                 -1,-1,-1,-1,-1,-1,-1,-1,-1,'',2,True);
      if iSeqHist = -1 then
         Raise Exception.Create(AtivoFixo.MensagemErro);
   except
      on E : Exception do
      begin
         bErro := True;
         MensagemErro := 'Erro na gravação do registro de movimentação do bem '+sIdBem+' !' + #13 + #13 +
                         'Excessão : ' + E.Message;
      end;
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
                                                    -1,-1,-1,-1,-1,-1,-1,-1,-1,'',2,True);
         if iSeqHist = -1 then
            Raise Exception.Create(AtivoFixo.MensagemErro);
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
                                                    -1,-1,-1,-1,-1,-1,-1,-1,-1,'',2,True);
         if iSeqHist = -1 then
            Raise Exception.Create(AtivoFixo.MensagemErro);
      end;
   except
      on E : Exception do
      begin
         bErro := True;
         MensagemErro := 'Erro na gravação do registro de movimentação do bem '+sIdBem+' !' + #13 + #13 +
                         'Excessão : ' + E.Message;
      end;
   end;
end;
//========================================================================================
Function TfrmMovDepreciacao.Busca_Grupo(iGrupo : Integer) : string;
begin
   //-------------------------------------------------------------------------------------
   // Busca Grupo Utilizado para pesquisa de Contas Cadastradas ou não
   //-------------------------------------------------------------------------------------
   qryGrupo.Close;
   qryGrupo.ParamByName('PIDGRUPO').AsInteger  := iGrupo;
   qryGrupo.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   qryGrupo.Open;
   if not qryGrupo.Eof then
      Result := qryGrupo.FieldByName('NOME').AsString
   else
      Result := '';
end;
//========================================================================================
Function TfrmMovDepreciacao.Testa_Periodo_Contabil(sData: string) : boolean;
Var
   iEmpresa, ResultPeriodo : Integer;

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
   Result := False;
   if ResultPeriodo = 1 then
   begin
      MensagemErro := 'Período Contábil inexistente ! Impossível gerar lançamento contábil da '+
                      'movimentação do Bem. Altere a data da movimentação. ';
   end else
   if ResultPeriodo = 2 then
   begin
      MensagemErro := 'Período encontrado, mas não é único ! Impossível gerar lançamento '+
                      'contábil da movimentação do Bem. Altere a data de movimentação.';
   end else
   if ResultPeriodo = 3 then
   begin
      MensagemErro := 'Período já bloqueado pela Contabilidade ! Impossível gerar lançamento '+
                      'contábil da movimentação do Bem. Altere a data de movimentação.';
   end else
   if ResultPeriodo = 4 then
   begin
      MensagemErro := 'Período já bloqueado pela Integração ! Impossível gerar lançamento '+
                      'contábil da movimentação do Bem. Altere a data de movimentação.';
   end else
   begin
      Result := True;
   end;
end;
//========================================================================================
Procedure TfrmMovDepreciacao.Tot_HistoricoMovimentacao(iIdTipoMov, iPlanilha : Integer);
begin
   qryHistCtb.ParamByName('PIDTIPOMOVIMENTACAO').AsInteger := iIdTipoMov;
   qryHistCtb.ParamByName('PDATAMOVIMENTACAO').AsDateTime  := edDataFechamento.Date;
   qryHistCtb.ParamByName('PPLNCODIGO').AsInteger          := iPlanilha;
   qryHistCtb.ExecSQL;
end;
//========================================================================================
procedure TfrmMovDepreciacao.Calcula_Moedas(fValOfi : Extended; dData : tDateTime;
                                            Var fValFis, fValGer : Extended);
begin
   if dtmAtivoFixo.qryParamCAF.FieldByName('MOEDAGERENCIAL').AsString <> '' then
   begin
      if ((fCotGerencial = 0) or (fCotFiscal = 0)) then
      begin
         // Busca Cotacoes do dia das moedas
         // Gerencial
         Verifica_Cotacao_Moeda(dData,dtmAtivoFixo.qryParamCaf.fieldbyname('MOEDAGERENCIAL').AsString);
         fCotGerencial := qryMoeda.fieldbyname('COTVALOR').AsFloat;
         // Fiscal
         Verifica_Cotacao_Moeda(dData,dtmAtivoFixo.qryParamCaf.fieldbyname('MOEDAFISCAL').AsString);
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
begin
   bErro := False;
   //-------------------------------------------------------------------------------------
   qryTemp.Close;
   qryTemp.SQL.Text := ' SELECT MOECODIGO,MOEPERIODICIDADE,MOEDESC  ' +
                       ' FROM  MOEDA ' +
                       ' WHERE MOECODIGO = ' + sMoeda;
   qryTemp.Open;
   //-------------------------------------------------------------------------------------
   if qryTemp.FieldByName('MOEPERIODICIDADE').AsString = 'A' then
   begin
      sData := copy(datetostr(dData),7,4);
      qryMoeda.Close;
      qryMoeda.SQL.Text := ' SELECT COTVALOR ' +
                           ' FROM COTACAOMOEDA ' +
                           ' WHERE (MOECODIGO = ' + sMoeda + ') ' +
                           '   AND (SUBSTR(COTMESREF,3,4) = ' + #39 + sData + #39 + ') ';
      qryMoeda.Open;
      //----------------------------------------------------------------------------------
      if qryMoeda.IsEmpty then
      begin
         MensagemErro := 'Cotação não cadastrada -> '+qryTemp.FieldByName('MOEDESC').AsString +
                         ' do Ano ' + sData ;
         bErro := True;
      end;
   end;
   //-------------------------------------------------------------------------------------
   if qryTemp.FieldByName('MOEPERIODICIDADE').AsString = 'M' then
   begin
      sData := copy(datetostr(dData),4,2) + copy(datetostr(dData),7,4);
      qryMoeda.Close;
      qryMoeda.SQL.Text := ' SELECT COTVALOR ' +
                           ' FROM COTACAOMOEDA ' +
                           ' WHERE (MOECODIGO = ' + sMoeda + ') ' +
                           '   AND (COTMESREF = ' + #39 + sData + #39 + ') ';
      qryMoeda.Open;
      //----------------------------------------------------------------------------------
      if qryMoeda.IsEmpty then
      begin
         MensagemErro := 'Cotação não cadastrada -> ' + qryTemp.FieldByName('MOEDESC').AsString +
                         ' do Mês ' + sData;
         bErro := True;
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
         MensagemErro := 'Cotação não cadastrada -> '+qryTemp.FieldByName('MOEDESC').AsString +
                         ' do Dia ' + sData;
         bErro := True;
      end;
   end;
end;
//========================================================================================
procedure TfrmMovDepreciacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryVerUltDep.Close;
   qrySubConta.Close;
   qryAcrescimos.Close;
   qryReavaliacoes.Close;
   qryCotacao.Close;
   qryGrupo.Close;
   qryPlanoConta.Close;
   qryCCrd.Close;
   qryAuxContab.Close;
   qryContasxCc.Close;
   qryGrupoBem.Close;
   qryVerUltDep.UnPrepare;
   qryGrupoBem.UnPrepare;
   qrySubConta.unprepare;
   qryReavaliacoes.unprepare;
   qryCotacao.unprepare;
   qryGrupo.unprepare;
   qryPlanoConta.unprepare;
   qryCCrd.unprepare;
   qryAuxContab.unprepare;
   qryInsHistorico.unprepare;
   qryContasxCc.unprepare;
   qryHistCtb.unPrepare;
   qryAlteraBem.unPrepare;
   qryAlteraBemCM.unPrepare;
end;

end.

