//******************************************************************************
// Data      : 03/10/2006
// Código    : AL_8
// Pendencia : 22965
// Desc      : Segregação de Planos
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_7
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data     : 07/07/2006
// Código   : AL_6
// Desc     : Retirada do Saldo CCI de Custódia da BuscaTodosSaldosInvestLote
//******************************************************************************
// Data     : 08/06/2006
// Código   : AL_5
// Pendencia: 20777
// SOL      : 35179
// Desc     : Implementação de Provisão de Perda por fluxo de percentual
//******************************************************************************
// Data     : 03/04/2006
// Código   : AL_4
// Pendencia: 21403
// SOL      : 39846
// Desc     : Implementação de Saldo CC/CCI na Histcustodia
//******************************************************************************
// Data     : 23/05/2005
// Código   : AL_3
// Motivo   : Implementação do teste de período contabil em 3 camadas
//******************************************************************************
// Data     : 14/01/2005
// Código   : AL_02
// Motivo   : Alimenta carteira pra lucro
//******************************************************************************
// Data     : 14/01/2005
// Código   : AL_01
// Motivo   : Controle que verifica se há algum processamento
//******************************************************************************
// Data     : 23/12/2004
//******************************************************************************
unit FCadOperVendaPRP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCSInv, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, fcLabel, ExtCtrls, TREdit,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, uCtrlInvContab;

type
  TfrmCadOperVendaPRP = class(TfrmCadastroCSInv)
    qryCarteira: TwwQuery;
    qryCarteiraDESCCARTINVEST: TStringField;
    qryCarteiraIDCARTEIRAINVEST: TFloatField;
    qryCarteiraID: TFloatField;
    qryCarteiraIDCARTEIRAGERENC: TFloatField;
    qryInvestimento: TwwQuery;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    qryInvestimentoSIGLAEMISSOR: TStringField;
    qryInvestimentoIDEMISSOR: TFloatField;
    dsInvestimento: TwwDataSource;
    qryCustodiante: TwwQuery;
    qryCustodianteSGLCUSTODIANTE: TStringField;
    qryCustodianteIDCUSTODIANTE: TFloatField;
    qryCustodia: TwwQuery;
    qryCustodiaSALDOBLOQUEADO: TFloatField;
    qryCustodiaSALDOLIBERADO: TFloatField;
    qryCustodiaIDCUSTODIA: TFloatField;
    qryOperacaoInvest: TwwQuery;
    Label2: TLabel;
    lkcCarteira: TwwDBLookupCombo;
    Label1: TLabel;
    lkcInvestimento: TwwDBLookupCombo;
    Label5: TLabel;
    lkcCustodiante: TwwDBLookupCombo;
    Label6: TLabel;
    edData: TCMDateTimePicker;
    Label7: TLabel;
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
    edQuantidade: TDBRealEdit;
    qryBuscaBoletaOperacaoInvest: TwwQuery;
    qryTipoOperacao: TwwQuery;
    qryTipoOperacaoIDTIPOINVEST: TFloatField;
    qryTipoOperacaoIDTIPOOPERACAO: TFloatField;
    qryTipoOperacaoIDMERCADO: TFloatField;
    qryTipoOperacaoCODTIPDOC: TFloatField;
    qryTipoOperacaoDESCTIPOOPERACAO: TStringField;
    qryTipoOperacaoNATUREZAOPERACAO: TStringField;
    qryTipoOperacaoTIPOCUSTODIA: TStringField;
    qryTipoOperacaoVENCIMENTO: TFloatField;
    qryTipoOperacaoFLGGERACONTAB: TFloatField;
    qryTipoOperacaoFLGGERACAPCAR: TFloatField;
    qryTipoOperacaoRECPAG: TStringField;
    qryTipoOperacaoTIPCREDOR: TStringField;
    qryTipoOperacaoFLGGERACAF: TFloatField;
    qryTipoOperacaoFLGTRANSF: TStringField;
    qryTipoOperacaoFLGCORRET: TStringField;
    qryTipoOperacaoTRGDTINCLUSAO: TDateTimeField;
    qryTipoOperacaoTRGUSERINCLUSAO: TStringField;
    qryTipoOperacaoFLGORDMOVINV: TStringField;
    qryTipoOperacaoIDMOTIVOBLOQUEIO: TFloatField;
    qryTipoOperacaoFLGOPDIREITO: TStringField;
    qryTipoOperacaoFLGAGE: TStringField;
    qryTipoOperacaoFLGDATAEX: TStringField;
    qryTipoOperacaoFLGDATACOM: TStringField;
    qryTipoOperacaoFLGINVORIGEM: TStringField;
    qryTipoOperacaoFLGPERC: TStringField;
    qryTipoOperacaoFLGPARIDADE: TStringField;
    qryTipoOperacaoFLGPRZBOLSA: TStringField;
    qryTipoOperacaoFLGPRZEMP: TStringField;
    qryTipoOperacaoFLGATADEC: TStringField;
    qryTipoOperacaoFLGFORMAPAGREC: TStringField;
    qryTipoOperacaoFLGDIVACAO: TStringField;
    qryTipoOperacaoFLGINIPAG: TStringField;
    qryTipoOperacaoFLGJUROS: TStringField;
    qryTipoOperacaoMOTBLOQCARTORIG: TFloatField;
    qryTipoOperacaoMOTBLOQCARTDEST: TFloatField;
    qryTipoOperacaoTIPSALDOCARTORIG: TStringField;
    qryTipoOperacaoTIPSALDOCARTDEST: TStringField;
    qryTipoOperacaoFLGTRATAIR: TStringField;
    qryTipoOperacaoSIGLATIPOOPER: TStringField;
    qryTipoOperacaoFLGISENTOIR: TStringField;
    qryTipoOperacaoFLGGRAVAIRLITIGIO: TStringField;
    qryTipoOperacaoFLGOPGERENC: TStringField;
    qryTipoOperacaoTIPOMOVTO: TStringField;
    qryTipoOperacaoSTAATIVO: TStringField;
    qryTipoOperacaoFLGRENTABILIDADE: TStringField;
    qryTipoOperacaoFLGCONTAINVEST: TFloatField;
    qryTipoOperacaoFLGMOVCOTA: TStringField;
    qryTipoOperacaoFLGCOTARECDES: TStringField;
    qryTipoOperacaoFLGDATAVENCIMENTO: TStringField;
    qryOperacaoInvestNUMDOCUMENTO: TStringField;
    qryOperacaoInvestIDCARTEIRAINVEST: TFloatField;
    qryOperacaoInvestIDCARTEIRAGERENC: TFloatField;
    qryOperacaoInvestIDINVESTIMENTO: TFloatField;
    qryOperacaoInvestIDCUSTODIANTE: TFloatField;
    qryOperacaoInvestDATAOPERACAO: TDateTimeField;
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    sPrivBoleta        : String;
    fPrivValorOper, fPrivSaldoAquiPro, fPrivSaldoVariacaoPro,
    fPrivSaldoIrApuPro : Double;
    procedure Seleciona(iIdOperacaoInvest: Integer);
    procedure AtualizaForm;
  public
    { Public declarations }
  end;

var
  frmCadOperVendaPRP: TfrmCadOperVendaPRP;

implementation

{$R *.DFM}

uses uMensErro, uSistema, DBaseDados, uDataBase, UBibliotecaInvest, UOperacaoInvest,
     UOperComum, dOperComum, dRendaVariavel, URendaVariavel;

procedure TfrmCadOperVendaPRP.Seleciona(iIdOperacaoInvest: Integer);
var iIdCarteiraInvest, iIdCarteiraGerenc: Integer;
begin
   iIdCarteiraInvest := 0;
   iIdCarteiraGerenc := 0;

   OperComum.LimpaParametros(qry);
   qry.ParamByName('IDOPERACAOINVEST').AsInteger := iIdOperacaoInvest;
   qry.Open;

   if not qry.IsEmpty then
   begin
      sPrivBoleta := qryNUMDOCUMENTO.AsString;

      with qryBuscaBoletaOperacaoInvest do
      begin
         ParamByName('NUMDOCUMENTO').AsString := sPrivBoleta;
         Open;
         First;
         while not EOF do
         begin
            iIdCarteiraInvest := FieldByName('IDCARTEIRAINVEST').AsInteger;
            if FieldByName('IDCARTEIRAGERENC').AsInteger <> 0 then
               iIdCarteiraGerenc := FieldByName('IDCARTEIRAGERENC').AsInteger;
            Next;
         end;
         Close;
      end;

      //Preenche a combo lkcCarteira
      if iIdCarteiraGerenc = 0 then
         qryCarteira.Locate('IDCARTEIRAINVEST', iIdCarteiraInvest, [])
      else
         qryCarteira.Locate('IDCARTEIRAINVEST;IDCARTEIRAGERENC',
                            VarArrayOf([iIdCarteiraInvest, iIdCarteiraGerenc]),
                            []);
      lkcCarteira.Text := qryCarteiraDESCCARTINVEST.AsString;
   end
   else
      sPrivBoleta := '';
end;

procedure TfrmCadOperVendaPRP.AtualizaForm;
begin

//Função que limpa os campos e muda o estado dos botões do form

lkcCarteira.Text     := '';
lkcInvestimento.Text := '';
lkcCustodiante.Text  := '';
edData.Date          := pRPI.DATAULTFECH;
edQuantidade.Value   := 0;
sbtnApagar.Enabled   := False;
end;

procedure TfrmCadOperVendaPRP.FormShow(Sender: TObject);
begin
   inherited;
   Seleciona(-1);
   if pRPI.FLGCARTGERENC = 'N' then
   begin
      with qryCarteira do
      begin
         Close;
         SQL.Clear;
         SQL.Add('  SELECT (IDCARTEIRAINVEST+1) AS ID, ');
	      SQL.Add('         IDCARTEIRAINVEST,           ');
         SQL.Add('         0 AS IDCARTEIRAGERENC,      ');
         SQL.Add('         DESCCARTINVEST              ');
         SQL.Add('    FROM CARTEIRAINVEST              ');
         SQL.Add('   WHERE IDTIPOINVEST = 2            ');
         SQL.Add('ORDER BY DESCCARTINVEST              ');
      end;
   end;
   qryCarteira.Open;
   qryInvestimento.Open;
   qryTipoOperacao.Open;
   qryCustodiante.Open;
   sbtnAlterar.Visible  :=False;
   edData.Date          := pRPI.DATAULTFECH;
   edQuantidade.Value   := 0;
end;

procedure TfrmCadOperVendaPRP.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
var sTipoOperacao, sInvestimento, swMensErro,
    swTipoRecDesBol, sNatureza, sTipo: String;
    iIdTipoOperacao, iPlano, iPlanilha, iDocumento, iwPlanilha,
    iwDocumento, iwPlano, iIdHistCartInv, iIdOperacaoInvest,
    iIdHistCustodiaOrig, iIdHistCustodiaDest, iidOperCustodia,
    iIdCarteiraInvest, iIdCarteiraGerenc: Integer;
    bCriaLancto: Boolean;
    dDataMov: TDateTime;
    fSaldoQtd, fSaldoVlr, fSaldoInutil, fSaldoAqui, fPU,
    fSaldoRend, fSaldoVariacao, fSaldoIrApu, fQuantidade: Double;
    iContador, i: byte;
begin
   inherited;
   dDataMov          := edData.Date;
   fQuantidade       := edQuantidade.Value;
   iIdCarteiraInvest := qryCarteiraIDCARTEIRAINVEST.AsInteger;
   iIdCarteiraGerenc := qryCarteiraIDCARTEIRAGERENC.AsInteger;

   try
      // Inicia Transacao
      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;

      sPrivBoleta := 'RV-' + Copy(DateToStr(dDataMov),9,2) + '/' +
                       FormatFloat('0000', LeUltRegistro(Nil,'CONTDOCRENVAR' +
                       Copy(DateToStr(dDataMov),9,2)));
      sTipo       := qryTipoOperacaoTIPOCUSTODIA.AsString;

      with dmRendaVariavel.qryInsBoleta  do
      begin
         OperComum.LimpaParametros(dmRendaVariavel.qryInsBoleta, True);
         ParamByName('IDBOLETA').AsString     := sPrivBoleta;
         ParamByName('STATUS').AsString       := 'P';
         ParamByName('DATABOLETA').AsDateTime := dDataMov;
         ParamByName('TIPMOVBOLETA').AsString := 'OPE';
         ExecSQL;
      end;

      //Se for Carteira Gerencial repete para gravar na Carteira de Investimento
      if iIdCarteiraGerenc <> 0 then
         iContador := 1
      else
         //Se não for Carteira Gerencial grava apenas a Carteira de Investimento
         iContador := 0;

      for i := 0 to iContador do
      begin
         //Se for Carteira Gerencial repete para gravar na Carteira de Investimento
         //Antes de gravar Carteira de Investimento a variável do IdCarteiraGerencial
         //recebe zero
         if i = 1 then
         iIdCarteiraGerenc := 0;

         // Inicia a OperacaoInvest
         // Gera Novo id de Operação
         iIdOperacaoInvest := LeUltRegistro(Nil,'OPERACAOINVEST');
         //AL_4
         //AL_5
         //AL_6
         OperComum.BuscaTodosSaldosInvestLote(iIdCarteiraInvest, iIdCarteiraGerenc, qryInvestimentoIDINVESTIMENTO.AsInteger,
                                              9999999, qryCustodianteIDCUSTODIANTE.AsInteger, '', DateToStr(dDataMov), -1,
                                              fSaldoQtd,    fSaldoVlr,    fSaldoInutil  , fSaldoInutil, fSaldoAqui,
                                              fSaldoRend,   fSaldoInutil, fSaldoVariacao, fSaldoInutil, fSaldoInutil,
                                              fSaldoInutil, fSaldoIrApu,  fSaldoInutil,   fSaldoInutil, fSaldoInutil,
                                              fSaldoInutil, fSaldoInutil, fSaldoInutil,   fSaldoInutil);
         if (fSaldoQtd < fQuantidade) then
            raise Exception.Create('Quantidade Superior ao Saldo do Investimento.');

         fPU                   := OperComum.Round(OperComum.DivValorZero(fSaldoAqui, fSaldoQtd), 9);
         fPrivSaldoAquiPro     := OperComum.Round(fPU * fQuantidade, 2);

         fPU                   := OperComum.Round(OperComum.DivValorZero(fSaldoVariacao, fSaldoQtd), 9);
         fPrivSaldoVariacaoPro := OperComum.Round(fPU * fQuantidade, 2);

         fPU                   := OperComum.Round(OperComum.DivValorZero(fSaldoIrApu, fSaldoQtd), 9);
         fPrivSaldoIrApuPro    := OperComum.Round(fPU * fQuantidade, 2);

         fPrivValorOper        :=  OperComum.Round(OperComum.DivValorZero((fQuantidade * fSaldoVlr), fSaldoQtd), 2);

         // Inclui Dados na Tabela OPERACAOINVEST.
         if i = 1 then
            qry.Insert;
         qryIDOPERACAOINVEST.AsInteger := iIdOperacaoInvest;
         qryIDCORRETVALORES.Clear;
         qryMOECODIGO.AsInteger        := pRPI.MOECODIGO;
         qryIDMODULO.AsInteger         := Sistema.IdModulo;
         qryEMPRESAPROP.AsInteger      := Sistema.IdEmpresa;
         qryIDINVESTIMENTO.AsInteger   := qryInvestimentoIDINVESTIMENTO.AsInteger;
         qryIDCARTEIRAINVEST.AsInteger := iIdCarteiraInvest;
         qryIDCARTEIRAGERENC.AsInteger := iIdCarteiraGerenc;
         if iIdCarteiraGerenc = 0 then
            qryIDCARTEIRAGERENC.Clear;
         qryIDTIPOINVEST.AsInteger     := 2;
         qryIDTIPOOPERACAO.AsInteger   := qryTipoOperacaoIDTIPOOPERACAO.AsInteger;
         qryDATAOPERACAO.AsString      := DateToStr(dDataMov);
         qryNUMDOCUMENTO.AsString      := sPrivBoleta;
         qryQTDEOPERACAO.AsFloat       := fQuantidade;
         qryPRECOUNITOPERACAO.AsFloat  := 0;
         qryVLROPERACAO.AsFloat        := fPrivValorOper;
         qryDATAVENCOPER.AsString      := DateToStr(dDataMov);
         qryIDFORCLI.Clear;
         qryIDCUSTODIANTE.AsInteger    := qryCustodiante.FieldByName('IDCUSTODIANTE').AsInteger;
         qryVLRIR.AsFloat              := 0;
         qryFLGSTATUSFECHBOL.AsString  := 'F';
         qryFLGSTATUSORDMOV.AsString   := 'L';
         qryIDPLANPREVCTBPATR.AsInteger:= iPlanPrevCtbPatro;
         qry.ApplyUpdates;

         iIdHistCustodiaOrig := -1;
         iIdHistCustodiaDest := -1;
         if iIdCarteiraGerenc = 0 then
         begin
            // Atualiza na HISTCUSTODIA
            //AL_4
            //AL_8
            OperacaoInvest.InsereCustodia(iIdCarteiraInvest,
                                          qryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger,
                                          qryCustodiante.FieldByName('IDCUSTODIANTE').AsInteger,
                                          -1,
                                          iIdOperacaoInvest,
                                          -1,
                                          '',
                                          sTipo,
                                          dDataMov,
                                          fQuantidade,
                                          iIdHistCustodiaOrig,
                                          iPlanPrevCtbPatro);
            // Insere no OPERCUSTODIA
            iIdOperCustodia := LeUltRegistro(Nil,'OPERCUSTODIA');
            if not OperacaoInvest.AlimentaOperCustodia(iIdOperCustodia,
                                                       iIdHistCustodiaOrig,
                                                       iIdHistCustodiaDest,
                                                       -1,
                                                       -1,
                                                       iIdCarteiraInvest,
                                                       iIdCarteiraInvest,
                                                       qryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger,
                                                       qryCustodiante.FieldByName('IDCUSTODIANTE').AsInteger,
                                                       qryCustodiante.FieldByName('IDCUSTODIANTE').AsInteger,
                                                       -1,
                                                       -1,
                                                       fQuantidade,
                                                       dDataMov,
                                                       '',
                                                       sPrivBoleta,
                                                       iPlanPrevCtbPatro) then
               raise Exception.Create('Não Foi Possivel Gravar a Operação na Custódia');

            with dtmOperComum.QryLocal do
            begin
               Close;
               SQL.Clear;
               SQL.Add('UPDATE OPERACAOINVEST                                       ');
               SQL.Add('   SET IDOPERCUSTODIA = ' + IntToStr(iIdOperCustodia) + ' ');
               SQL.Add(' WHERE IDOPERACAOINVEST = '+ IntToStr(iIdOperacaoInvest)   );
               ExecSQL;
            end;
            OperacaoInvest.AtualizaSaldosCustodia;
         end;

         iIdTipoOperacao := qryTipoOperacaoIDTIPOOPERACAO.AsInteger;
         iwPlano         := -1;
         sNatureza       := qryTipoOperacaoNATUREZAOPERACAO.AsString;

         with dtmOperComum.QryLocal do
         begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT DESCTIPOOPERACAO FROM TIPOOPERACAO ');
            SQL.Add('WHERE (IDTIPOOPERACAO = '+ IntToStr(iIdTipoOperacao)+')');
            Open;
            sTipoOperacao := FieldByName('DESCTIPOOPERACAO').AsString;
            Close;
         end;
         with dtmOperComum.QryLocal do
         begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT DESCINVESTIMENTO FROM INVESTIMENTO ');
            SQL.Add('WHERE (IDINVESTIMENTO = '+ QryInvestimentoIDINVESTIMENTO.AsString+')');
            Open;
            sInvestimento := FieldByName('DESCINVESTIMENTO').AsString;
            Close;
         end;

         // Variáveis para Contabilização
         bCriaLancto := False;
         iPlanilha := -1;
         iPlano    := -1;
         iDocumento:= -1;

         //AL_02 -
         //Lucro
         if not OperComum.AlimentaCarteira(Sistema.IdEmpresa,
                                           79,
                                           qryInvestimentoIDINVESTIMENTO.AsInteger,
                                           2,
                                           iidOperacaoInvest,
                                           -1,
                                           iIdTipoOperacao,
                                           iIdCarteiraInvest,
                                           iIdCarteiraGerenc,
                                           -1,
                                           -1,
                                           iPlanilha,
                                           iDocumento,
                                           iPlano,
                                           dDataMov,
                                           fPrivValorOper,
                                           fQuantidade,
                                           pRPI.VLRCOTAINICART,
                                           0, 0, 0, 0, 0, 0, 0, 0, 0,
                                           'L' ,sNatureza,
                                           '',
                                           'LUCRO/PREJUIZO NA VENDA'+' - '+
                                           sInvestimento,
                                           'LUC', '', '', True,
                                           -1,
                                           iPlanPrevCtbPatro,
                                           iIdHistCartInv) then
            raise Exception.Create('Não Foi Possivel Atualizar a Carteira');

         // Caso Operacao de Venda (NATURMOV = 'D') MArca o Regsitro de Lucro Com Flag (1) Para ser Recalculado
         ExecutaQuery(dtmOperComum.QryLocal,'UPDATE HISTCARTINV SET FLGCALCSALDO = ''2'' '+
                                            'WHERE 	(TIPMOVCARTINV    = ''LUC'') AND '+
                                            '      	(IDOPERACAOINVEST = '+
                                            IntToStr(iidOperacaoInvest)+')');

         if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
            raise Exception.Create('Não Foi Possivel Atualizar os Saldos');
         //AL_02 -- Fim

         //Credito na Carteira
         if not OperComum.AlimentaCarteira(Sistema.IdEmpresa,
                                           79,
                                           qryInvestimentoIDINVESTIMENTO.AsInteger,
                                           2,
                                           iidOperacaoInvest,
                                           -1,
                                           iIdTipoOperacao,
                                           iIdCarteiraInvest,
                                           iIdCarteiraGerenc,
                                           -1,
                                           -1,
                                           iPlanilha,
                                           iDocumento,
                                           iPlano,
                                           dDataMov,
                                           fPrivValorOper,
                                           fQuantidade,
                                           1,0,0,0,0,0,0,0,0,0,
                                           sNatureza,
                                           sNatureza,
                                           '',
                                           sTipoOperacao +' : '+ sInvestimento,
                                           'OPE', '', '', True, -1,
                                           iPlanPrevCtbPatro,
                                           iIdHistCartInv) then
            raise Exception.Create('Não Foi Possivel Atualizar a Carteira');

         ExecutaQuery(dtmOperComum.QryLocal,'UPDATE HISTCARTINV SET MOVIMAQUI = '+ TrocaVirgulaPonto(FloatToStr(fPrivSaldoAquiPro))+','+
                                            ' VLRVARIACAO = '+TrocaVirgulaPonto(FloatToStr(fPrivSaldoVariacaoPro))+','+
                                            ' VLRIRAPU = '+TrocaVirgulaPonto(FloatToStr(fPrivSaldoIrApuPro))+' '+
                                            ' WHERE IDHISTCARTINV = '+IntToStr(iIdHistCartInv));

         if not OperComum.AtualizaSaldos(1,-1) then
            raise Exception.Create('Não Foi Possivel Atualizar os Saldos');

         if iIdCarteiraGerenc = 0 then
         begin
            OperComum.BuscaFlgContab(iIdTipoOperacao);
            // Custo
            swTipoRecDesBol := '';
            OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2,
                                    qryInvestimentoIDINVESTIMENTO.AsInteger,
                                    iIdTipoOperacao, -1,
                                    qryInvestimentoIDEMISSOR.AsInteger,
                                    iIdCarteiraInvest,
                                    pRPI.MOECODIGO, '', '', '', '', '',
                                    swTipoRecDesBol, bCriaLancto, 0,
                                    fPrivValorOper,
                                    dDataMov{edData.DateTime}, dDataMov{edData.DateTime},
                                    iPlano, iPlanilha, iDocumento, swMensErro);
            if Trim(swMensErro) <> '' then
               raise Exception.Create('Ocorreu um erro ao Contabilizar o Valor da Operação');

            iPlano := iwPlano;
            // Variacao
            swTipoRecDesBol := '';
            OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2,
                                    qryInvestimentoIDINVESTIMENTO.AsInteger,
                                    iIdTipoOperacao, -1,
                                    qryInvestimentoIDEMISSOR.AsInteger,
                                    iIdCarteiraInvest,
                                    pRPI.MOECODIGO, '', '', '', '', '',
                                    swTipoRecDesBol, bCriaLancto, 0,
                                    fPrivSaldoVariacaoPro,
                                    dDataMov{edData.DateTime},dDataMov{edData.DateTime},
                                    iPlano, iPlanilha, iDocumento, swMensErro);
            if Trim(swMensErro) <> '' then
               raise Exception.Create('Ocorreu um erro ao Contabilizar a Variação Proporcional');

            // Grava Planilha e Documento na Boleta
            if (iPlanilha > 0) or (iDocumento > 0) then
            begin
               OperComum.LimpaParametros(DMRendaVariavel.qryUpdBoleta);
               DMRendaVariavel.qryUpdBoleta.ParamByName('IDBOLETA').AsString := sPrivBoleta;

               if iPlanilha > 0 then
               begin
                  DMRendaVariavel.qryUpdBoleta.ParamByName('PLANO').AsInteger    := iPlano;
                  DMRendaVariavel.qryUpdBoleta.ParamByName('PLANILHA').AsInteger := iPlanilha;
               end;

               if iDocumento > 0 then
                  DMRendaVariavel.qryUpdBoleta.ParamByName('CODDOCUMENTO').AsInteger := iDocumento;

               DMRendaVariavel.qryUpdBoleta.ExecSQL;
            end;
         end;

         if dDataMov <= pRPI.DATAULTFECH then
            RendaVariavel.MarcarFlagReproc(qryInvestimentoIDINVESTIMENTO.AsInteger,
                                           -1, -1, dDataMov{edData.DateTime});
      end; // fim do FOR

      // Comita Transacao
      DtmBaseDados.dbBaseDados.Commit;

      MsgDlg('Operação efetivada', 'Informação', mtInformation, [mbOk], 0);
   except on e: exception do begin
      MessageBox(Handle,PChar('Operação não efetivada.'+#13+'Motivo: '+e.message),'Erro',
                 MB_OK or MB_APPLMODAL or MB_ICONERROR);
      DtmBaseDados.dbBaseDados.RollBack;
      Exit;
      end;
   end;
end;

procedure TfrmCadOperVendaPRP.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      Seleciona(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadOperVendaPRP.CmeCadastroInsert(Sender: TObject);
begin
   CmeCadastro.RepetirInsert := False;
   inherited;
end;

procedure TfrmCadOperVendaPRP.sbtnInserirClick(Sender: TObject);
begin
   inherited;
   if lkcCarteira.CanFocus then
      lkcCarteira.SetFocus;
end;

procedure TfrmCadOperVendaPRP.sbtnApagarClick(Sender: TObject);
// AL_3
begin
   // AL_01 - 14/01/2005
   // Não executa se houver processamento
   if RendaVariavel.VerEmAbertura then Exit;

   if (MsgDlg('Exclui todas as Operações dessa Boleta ?',
              'Mensagem do Sistema', mtConfirmation, [mbYes,mbNo],0) = mrYes)  then
   begin
      sPrivBoleta := qryNUMDOCUMENTO.AsString;
      try
         // Abre a única transação deste processo
         if not(dtmBaseDados.dbBaseDados.InTransaction) then
            DtmBaseDados.dbBaseDados.StartTransaction;
         if not RendaVariavel.ExcluiBoleta(sPrivBoleta, true) then
            Raise Exception.Create('Não é possível fazer a Exclusão dessa Boleta.');
         DtmBaseDados.dbBaseDados.Commit;
         // Monta Registro do Parâmetro
         Operacaoinvest.RetParamInvest1(pRPI, 'BaseDados');
         RendaVariavel.MarcarFlagReproc(qryInvestimentoIDINVESTIMENTO.AsInteger,
                                        -1, -1, edData.DateTime);
         MsgDlg('Operação concluída com sucesso.','Mensagem do Sistema', mtInformation,[MbOk],0);
      except
         on E: Exception do
         begin
            // Rollbacka Transação
            DtmBaseDados.dbBaseDados.Rollback;
            MsgDlg('Erro: ' + E.Message,
                   'Mensagem do Sistema ',mtError,[mbOK],0);
         end;
      end;
      AtualizaForm;
  end;
end;

procedure TfrmCadOperVendaPRP.bbtnConfirmarClick(Sender: TObject);
begin

   // AL_01 - 14/01/2005
   // Não executa se houver processamento
   if RendaVariavel.VerEmAbertura then Exit;

   if Trim(lkcCarteira.Text) = '' then
   begin
      MsgDlg('A Carteira não foi escolhida!','Aviso!', MtWarning, [MbOk], 0);
      if lkcCarteira.CanFocus then
         lkcCarteira.SetFocus;
      Exit;
   end;

   if Trim(lkcInvestimento.Text) = '' then
   begin
      MsgDlg('O Investimento não foi escolhido!','Aviso!', MtWarning, [MbOk], 0);
      if lkcInvestimento.CanFocus then
         lkcInvestimento.SetFocus;
      Exit;
   end;

   if Trim(lkcCustodiante.Text) = '' then
   begin
      MsgDlg('O Custodiante não foi escolhido!','Aviso!', MtWarning, [MbOk], 0);
      if lkcCustodiante.CanFocus then
         lkcCustodiante.SetFocus;
      Exit;
   end;

   if Trim(edData.Text) = '' then
   begin
      MsgDlg('A Data não foi preenchida!','Aviso!', MtWarning, [MbOk], 0);
      if edData.CanFocus then
         edData.SetFocus;
      Exit;
   end;

   // AL_3
   //AL_7
   if not CtrlInvContab.TestaPeriodo(edData.Text, 2) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Aviso', mtWarning, [mbOk], 0);
      if edData.CanFocus then
         edData.SetFocus;
      Exit;
   end;

   if edQuantidade.Value = 0 then
   begin
      MsgDlg('A Quantidade não foi preenchida!','Aviso!', MtWarning, [MbOk], 0);
      if edQuantidade.CanFocus then
         edQuantidade.SetFocus;
      Exit;
      end;

   if edQuantidade.Value < 0 then
   begin
      MsgDlg('Quantidade inválida(Negativa)!','Mensagem do Sistema',mtWarning,[mbOK],0);
      if edQuantidade.CanFocus then
         edQuantidade.SetFocus;
      Exit;
   end;

   //Query que verifica se houve operação na data escolhida pelo usuário
   OperComum.LimpaParametros(qryOperacaoInvest);
   with qryOperacaoInvest do
   begin
      Prepare;
      ParamByName('IDTIPOOPERACAO').AsInteger      := -117;
      ParamByName('IDCARTEIRAINVEST').AsInteger    := qryCarteiraIDCARTEIRAINVEST.AsInteger;
      if qryCarteiraIDCARTEIRAGERENC.AsInteger <> 0 then
         ParamByName('IDCARTEIRAGERENC').AsInteger := qryCarteiraIDCARTEIRAGERENC.AsInteger;
      ParamByName('IDCUSTODIANTE').AsInteger       := qryCustodianteIDCUSTODIANTE.AsInteger;
      ParamByName('IDINVESTIMENTO').AsInteger      := qryInvestimentoIDINVESTIMENTO.AsInteger;
      ParamByName('DATAOPERACAO').AsString         := edData.Text;
      Open;
      if not EOF then
      begin
         MsgDlg('Já existe operação pra esse dia!', 'Aviso', mtWarning,[mbOK],0);
         Exit;
      end;
   end;

   inherited;
   Seleciona(qryIDOPERACAOINVEST.AsInteger);
end;

procedure TfrmCadOperVendaPRP.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   AtualizaForm;
end;

end.
