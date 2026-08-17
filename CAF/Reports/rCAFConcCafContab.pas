unit rCAFConcCafContab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, 
  Dialogs, FCmReport, ppBands, ppClass, ppCtrls, ppVar, ppPrnabl, ppCache,
  ppProd, ppReport, DB, Wwdatsrc, ppComm, ppRelatv, ppDB, ppDBPipe,
  ppDBBDE, DBTables, Wwquery, uCmRptManager, TXComp, CmParamReport,
  DBClient, uCMClientDataSet, uCmSqlParams, uCMfileUtils, uCtrlPadroes,
  IvDictio, IvMulti;

type
  TRptCAFConcCafContab = class(TFrmCmReport)
    ppConsCafContab: TppBDEPipeline;
    dsConsCafContab: TwwDataSource;
    rpConsCafContab: TppReport;
    ppHeaderBand26: TppHeaderBand;
    ppLabel155: TppLabel;
    ppLabel156: TppLabel;
    RptConAlmoxContabLine1: TppLine;
    LbPer13: TppLabel;
    RptConAlmoxContabLabel5: TppLabel;
    RptConAlmoxContabLabel6: TppLabel;
    RptConAlmoxContabLabel7: TppLabel;
    RptConAlmoxContabLabel8: TppLabel;
    RptConAlmoxContabLabel9: TppLabel;
    RptConAlmoxContabLabel10: TppLabel;
    ppLine70: TppLine;
    RptConAlmoxContabLabel1: TppLabel;
    RptConAlmoxContabLabel2: TppLabel;
    RptConAlmoxContabLabel3: TppLabel;
    rpConsCafContabLabel1: TppLabel;
    rpConsCafContabLabel2: TppLabel;
    ppDetailBand20: TppDetailBand;
    RptConAlmoxContabDBText2: TppDBText;
    RptConAlmoxContabDBText3: TppDBText;
    RptConAlmoxContabDBText4: TppDBText;
    RptConAlmoxContabDBText5: TppDBText;
    RptConAlmoxContabDBText6: TppDBText;
    RptConAlmoxContabDBText7: TppDBText;
    rpConsCafContabDBText1: TppDBText;
    ppFooterBand26: TppFooterBand;
    ppLine71: TppLine;
    ppLabel179: TppLabel;
    ppCalc50: TppSystemVariable;
    ppCalc51: TppSystemVariable;
    RptConAlmoxContabSummaryBand1: TppSummaryBand;
    RptConAlmoxContabLabel13: TppLabel;
    RptConAlmoxContabDBCalc1: TppDBCalc;
    RptConAlmoxContabDBCalc2: TppDBCalc;
    RptConAlmoxContabDBCalc3: TppDBCalc;
    RptConAlmoxContabDBCalc4: TppDBCalc;
    RptConAlmoxContabDBCalc5: TppDBCalc;
    RptConAlmoxContabDBCalc6: TppDBCalc;
    rpConsCafContabGroup1: TppGroup;
    rpConsCafContabGroupHeaderBand1: TppGroupHeaderBand;
    rpConsCafContabDBText3: TppDBText;
    rpConsCafContabGroupFooterBand1: TppGroupFooterBand;
    rpConsCafContabLine3: TppLine;
    rpConsCafContabGroup2: TppGroup;
    rpConsCafContabGroupHeaderBand2: TppGroupHeaderBand;
    rpConsCafContabDBText2: TppDBText;
    rpConsCafContabLine1: TppLine;
    rpConsCafContabGroupFooterBand2: TppGroupFooterBand;
    rpConsCafContabLine2: TppLine;
    sqlConsCafContab: TCMSqlParams;
    cdsConsCafContab: TCMClientDataSet;
    cdsVerUltFec: TCMClientDataSet;
    sqlVerUltFec: TCMSqlParams;
    cdsMovCaf: TCMClientDataSet;
    sqlMovCaf: TCMSqlParams;
    cdsMovTrf: TCMClientDataSet;
    sqlMovTrf: TCMSqlParams;
    cdsCafxContab: TCMClientDataSet;
    sqlCafxContab: TCMSqlParams;
    cdsTrfCaf: TCMClientDataSet;
    sqlTrfCaf: TCMSqlParams;
    _cds: TCMClientDataSet;
    cdsPlano: TCMClientDataSet;
    sqlPlano: TCMSqlParams;
    sqlContaContabilComCC: TCMSqlParams;
    sqlContaContabilSemCC: TCMSqlParams;
    cdsParamCaf: TCMClientDataSet;
    sqlParamCaf: TCMSqlParams;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
    bInvestImob     : Boolean;
    sMascaraCCusto,
    sMascaraPlano   : String;
    iMoedaOficial,
    iPlanoConta     : Integer;
    //------------------------------------------------------------------------------------
    function DataUltFechamento : String;
    function LeParamCafxContab(iEmpresa, iGrupo, iTipoMov : Integer;
                               sTipoLanc: String;
                               iPlano : Integer; Var sPlaConta : String;
                               bCtaxCCusto : Boolean = False;
                               sCodCentroCusto : string = '') : Boolean;
    function ContaContabilSemCC(iEmpresa, iGrupo, iTipoMov, iPlano : Integer;
                                sTipoLanc : String) : String;
    function ContaContabilComCC(iEmpresa, iGrupo, iTipoMov, iPlano : Integer;
                                sTipoLanc, sCodCentroCusto : String) : String;
  public
    { Public declarations }
  end;

var
  RptCAFConcCafContab: TRptCAFConcCafContab;

implementation

{$R *.dfm}

procedure TRptCAFConcCafContab.CmpRptCMBeforeExecute(var CanExecute: Boolean);
var
   iAux, iDia, iMes, iAno : Word;
begin
   inherited;
   //-------------------------------------------------------------------------------------
   //--- Captura as Mascaras
   //-------------------------------------------------------------------------------------
   with sqlParamCaf do
   begin
      Prepare;
      ParamByName('PIDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      Open;
      iPlanoConta   := cdsParamCAF.FieldByName('PLANOVIGENTE').AsInteger;
      iMoedaOficial := cdsParamCAF.FieldByName('MOEDAOFICIAL').AsInteger;
      bInvestImob   := copy(cdsParamCAF.FieldByName('SISTEMAS').AsString, 4, 1) = '1';
      //----------------------------------------------------------------------------------
      sMascaraCCusto := trim(cdsParamCAF.FieldByName('MASCARACC').AsString);
      iAux := 1;
      while iAux <= length(sMascaraCCusto) do
      begin
         if sMascaraCCusto[iAux] = '9' then
            sMascaraCCusto[iAux] := '0';
         iAux := iAux + 1;
      end;
      sMascaraCCusto := sMascaraCCusto + ';0; ';
   end;
   //-------------------------------------------------------------------------------------
   cdsPlano.Close;
   sqlPlano.Prepare;
   sqlPlano.ParamByName('PPLANO').AsInteger := iPlanoConta;
   sqlPlano.Open;
   sMascaraPlano := trim(cdsPlano.FieldByName('MASCARA').AsString);
   iAux := 1;
   while iAux <= length(sMascaraPlano) do
   begin
      if sMascaraPlano[iAux] = '9' then
         sMascaraPlano[iAux] := '#';
      iAux := iAux + 1;
   end;
   sMascaraPlano := sMascaraPlano + ';0; ';
   //-------------------------------------------------------------------------------------
   DecodeDate(strtodate(DataUltFechamento),iAno,iMes,iDia);
   //-------------------------------------------------------------------------------------
   CmpRptCM.ParamValues[0].TextDefault := datetostr(EncodeDate(iAno, iMes, 01));
   CmpRptCM.ParamValues[1].TextDefault := datetostr(EncodeDate(iAno, iMes, iDia));
   CmpRptCM.ParamValues[2].LookupSettings.SQL.Text := ' SELECT G.CLASSE, G.NOME, G.IDGRUPO '+
                                                      ' FROM GRUPO G, ' +
                                                      ' PLANOGRUPO PG ' +
                                                      ' WHERE (PG.IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) + ') ' +
                                                      '   AND (G.TIPO = ''A'') ' +
                                                      '   AND (PG.IDGRUPO = G.IDGRUPO) ' +
                                                      ' ORDER BY G.CLASSE ';
end;

function TRptCAFConcCafContab.DataUltFechamento : String;
var
   iGrupoDeprec,
   iGrupoDepIni,
   iGrupoDepFim : Integer;

begin
   //-------------------------------------------------------------------------------------
   // Calculo da data baseado na opção dos Parâmetros do CAF
   //-------------------------------------------------------------------------------------
   if CrmRptCM.IdModulo = 7 then
   begin
      if not bInvestImob then
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
   sqlVerUltFec.Prepare;
   sqlVerUltFec.ParamByName('PIDPESSOA').AsFloat       := CrmRptCM.IdEmpresa;
   sqlVerUltFec.ParamByName('PFLGIMOVELINI').AsInteger := iGrupoDepIni;
   sqlVerUltFec.ParamByName('PFLGIMOVELFIM').AsInteger := iGrupoDepFim;
   sqlVerUltFec.Open;
   //-------------------------------------------------------------------------------------
   if not cdsVerUltFec.IsEmpty then
      Result := DateToStr(cdsVerUltFec.FieldByName('DATAULT').AsDateTime)
   else
      Result := '';
   //-------------------------------------------------------------------------------------
   cdsVerUltFec.Close;
end;

procedure TRptCAFConcCafContab.CrmRptCMBeforePrint(Sender: TObject);
var
   iGrupoNovo, iGrupoAtual           : Integer;
   sDebito,    sCredito,
   sDebitoCM,  sCreditoCM,
   sDebitoD,   sCreditoD,
   sDebitoCMD, sCreditoCMD,
   sReavDebito,    sReavCredito,
   sReavDebitoCM,  sReavCreditoCM,
   sReavDebitoD,   sReavCreditoD,
   sReavDebitoCMD, sReavCreditoCMD,
   sAVDebito,    sAVCredito,
   sAVDebitoCM,  sAVCreditoCM,
   sAVDebitoD,   sAVCreditoD,
   sAVDebitoCMD, sAVCreditoCMD       : String;
begin
   inherited;
   try
      Screen.Cursor := crSQLWait;
      //----------------------------------------------------------------------------------
      cdsCafxContab.Close;
      if CmpRptCM.ParamValues[4].AsBoolean then
      begin
         sqlCafxContab.SQL.Strings[12] := 'AND PLN.PLNEFETIVADO = ''S'' ';
      end else
      begin
         sqlCafxContab.SQL.Strings[12] := ' ';
      end;
      //----------------------------------------------------------------------------------
      sqlCafxContab.Prepare;
      sqlCafxContab.ParamByName('IDPESSOA').AsFloat    := CrmRptCM.IdEmpresa;
      sqlCafxContab.ParamByName('PDATAINI').AsDateTime := CmpRptCM.ParamValues[0].AsDateTime;
      sqlCafxContab.ParamByName('PDATAFIM').AsDateTime := CmpRptCM.ParamValues[1].AsDateTime;
      sqlCafxContab.Open;
      if cdsCafxContab.IsEmpty then
         Raise Exception.Create('Não houve Lançamentos Contábeis com os Parâmetros Fornecidos!');
      //----------------------------------------------------------------------------------
      cdsMovCaf.Close;
      if CmpRptCM.ParamValues[2].AsInteger <> 0 then
      begin
         sqlMovCaf.SQL.Strings[37] := ' AND LANC.IDGRUPO = '+IntToStr(CmpRptCM.ParamValues[2].AsInteger);
      end else
      begin
         sqlMovCaf.SQL.Strings[37] := ' ';
      end;
      //----------------------------------------------------------------------------------
      sqlMovCaf.Prepare;
      sqlMovCaf.ParamByName('IDPESSOA').AsFloat    := CrmRptCM.IdEmpresa;
      sqlMovCaf.ParamByName('PDATAINI').AsDateTime := CmpRptCM.ParamValues[0].AsDateTime;
      sqlMovCaf.ParamByName('PDATAFIM').AsDateTime := CmpRptCM.ParamValues[1].AsDateTime;
      sqlMovCaf.ParamByName('MOECODIGO').AsInteger := iMoedaOficial;  // Real
      sqlMovCaf.ParamByName('IDTAXADEP').AsInteger := 1;              // Brasil
      sqlMovCaf.Open;
      if cdsMovCAF.IsEmpty then
         Raise Exception.Create('Não houve Movimentação do Ativo Fixo com os Parâmetros Fornecidos!');
      //----------------------------------------------------------------------------------
      while not cdsMovCaf.EOF do
      begin
         //-------------------------------------------------------------------------------
         // Pesquisa em CafxContab : Data, Conta Contábil e Centro de Custo á Debito
         // se não encontrar pesquisa Data e Conta Contábil á Debito.
         //-------------------------------------------------------------------------------
         if cdsCafxContab.Locate('DATA;CONTACONTABIL;CENTROCUSTO',
                                 VarArrayOf([cdsMovCaf.FieldByName('DATA').AsDateTime,
                                             cdsMovCaf.FieldByName('CONTADB').AsString,
                                             cdsMovCaf.FieldByName('CODCENTROCUSTO').AsString]),[]) then
         begin
            cdsCafxContab.Edit;
            cdsCafxContab.FieldByName('VLCAFDEB').AsFloat := cdsCafxContab.FieldByName('VLCAFDEB').AsFloat + cdsMovCaf.FieldByName('VALOR').AsFloat;
            cdsCafxContab.Post;
         end else
         begin
            if cdsCafxContab.Locate('DATA;CONTACONTABIL',
                                    VarArrayOf([cdsMovCaf.FieldByName('DATA').AsDateTime,
                                                cdsMovCaf.FieldByName('CONTADB').AsString]),[]) then
            begin
               cdsCafxContab.Edit;
               cdsCafxContab.FieldByName('VLCAFDEB').AsFloat := cdsCafxContab.FieldByName('VLCAFDEB').AsFloat + cdsMovCaf.FieldByName('VALOR').AsFloat;
               cdsCafxContab.Post;
            end;
         end;
         //-------------------------------------------------------------------------------
         // Pesquisa em CafxContab : Data, Conta Contábil e Centro de Custo á Crédito
         // se não encontrar pesquisa Data e Conta Contábil á Crédito.
         //-------------------------------------------------------------------------------
         if cdsCafxContab.Locate('DATA;CONTACONTABIL;CENTROCUSTO',
                                 VarArrayOf([cdsMovCaf.FieldByName('DATA').AsDateTime,
                                             cdsMovCaf.FieldByName('CONTACR').AsString,
                                             cdsMovCaf.FieldByName('CODCENTROCUSTO').AsString]),[]) then
         begin
            cdsCafxContab.Edit;
            cdsCafxContab.FieldByName('VLCAFCRE').AsFloat := cdsCafxContab.FieldByName('VLCAFCRE').AsFloat + cdsMovCaf.FieldByName('VALOR').AsFloat;
            cdsCafxContab.Post;
         end else
         begin
            if cdsCafxContab.Locate('DATA;CONTACONTABIL',
                                    VarArrayOf([cdsMovCaf.FieldByName('DATA').AsDateTime,
                                                cdsMovCaf.FieldByName('CONTACR').AsString]),[]) then
            begin
               cdsCafxContab.Edit;
               cdsCafxContab.FieldByName('VLCAFCRE').AsFloat := cdsCafxContab.FieldByName('VLCAFCRE').AsFloat + cdsMovCaf.FieldByName('VALOR').AsFloat;
               cdsCafxContab.Post;
            end;
         end;
         //-------------------------------------------------------------------------------
         cdsMovCaf.Next;
      end;
      //----------------------------------------------------------------------------------
      // Processa as Contabilizacoes das Transferências
      //----------------------------------------------------------------------------------
      cdsTrfCaf.Close;
      sqlTrfCaf.Open;
      //----------------------------------------------------------------------------------
      cdsMovTrf.Close;
      if CmpRptCM.ParamValues[2].AsInteger <> 0 then
      begin
         sqlMovTrf.SQL.Strings[09] := 'AND B.IDGRUPO = '+IntToStr(CmpRptCM.ParamValues[2].AsInteger);
      end else
      begin
         sqlMovTrf.SQL.Strings[09] := ' ';
      end;
      //----------------------------------------------------------------------------------
      sqlMovTrf.Prepare;
      sqlMovTrf.ParamByName('IDPESSOA').AsFloat    := CrmRptCM.IdEmpresa;
      sqlMovTrf.ParamByName('PDATAINI').AsDateTime := CmpRptCM.ParamValues[0].AsDateTime;
      sqlMovTrf.ParamByName('PDATAFIM').AsDateTime := CmpRptCM.ParamValues[1].AsDateTime;
      sqlMovTrf.Open;
      //----------------------------------------------------------------------------------
      while not cdsMovTrf.EOF do
      begin
         iGrupoNovo  := cdsMovTrf.FieldByName('IDGRUPO').AsInteger;
         iGrupoAtual := cdsMovTrf.FieldByName('IDGRUPANT').AsInteger;
         //-------------------------------------------------------------------------------
         LeParamCafxContab(Trunc(CrmRptCM.IdEmpresa),Trunc(iGrupoNovo) ,01,'D',iPlanoConta,sDebito);
         LeParamCafxContab(Trunc(CrmRptCM.IdEmpresa),Trunc(iGrupoAtual),01,'D',iPlanoConta,sCredito);
         cdsTrfCaf.Append;
         cdsTrfCaf.FieldByName('DATA').AsDateTime   := cdsMovTrf.FieldByName('DATAMOVIMENTACAO').AsDateTime;
         cdsTrfCaf.FieldByName('GRUPO').AsInteger   := cdsMovTrf.FieldByName('IDGRUPO').AsInteger;
         cdsTrfCaf.FieldByName('TIPOMOV').AsInteger := 01;
         cdsTrfCaf.FieldByName('VALOR').AsFloat     := cdsMovTrf.FieldByName('TRFVALORG').AsFloat;
         cdsTrfCaf.FieldByName('CONTADB').AsString  := sDebito;
         cdsTrfCaf.FieldByName('CONTACR').AsString  := sCredito;
         cdsTrfCaf.Post;
         //-------------------------------------------------------------------------------
         LeParamCafxContab(Trunc(CrmRptCM.IdEmpresa),Trunc(iGrupoNovo) ,15,'D',iPlanoConta,sDebitoCM);
         LeParamCafxContab(Trunc(CrmRptCM.IdEmpresa),Trunc(iGrupoAtual),15,'D',iPlanoConta,sCreditoCM);
         cdsTrfCaf.Append;
         cdsTrfCaf.FieldByName('DATA').AsDateTime   := cdsMovTrf.FieldByName('DATAMOVIMENTACAO').AsDateTime;
         cdsTrfCaf.FieldByName('GRUPO').AsInteger   := cdsMovTrf.FieldByName('IDGRUPO').AsInteger;
         cdsTrfCaf.FieldByName('TIPOMOV').AsInteger := 15;
         cdsTrfCaf.FieldByName('VALOR').AsFloat     := cdsMovTrf.FieldByName('TRFCMBEM').AsFloat;
         cdsTrfCaf.FieldByName('CONTADB').AsString  := sDebitoCM;
         cdsTrfCaf.FieldByName('CONTACR').AsString  := sCreditoCM;
         cdsTrfCaf.Post;
         //-------------------------------------------------------------------------------
         LeParamCafxContab(Trunc(CrmRptCM.IdEmpresa),Trunc(iGrupoAtual),14,'C',iPlanoConta,sDebitoD);
         LeParamCafxContab(Trunc(CrmRptCM.IdEmpresa),Trunc(iGrupoNovo) ,14,'C',iPlanoConta,sCreditoD);
         cdsTrfCaf.Append;
         cdsTrfCaf.FieldByName('DATA').AsDateTime   := cdsMovTrf.FieldByName('DATAMOVIMENTACAO').AsDateTime;
         cdsTrfCaf.FieldByName('GRUPO').AsInteger   := cdsMovTrf.FieldByName('IDGRUPO').AsInteger;
         cdsTrfCaf.FieldByName('TIPOMOV').AsInteger := 14;
         cdsTrfCaf.FieldByName('VALOR').AsFloat     := cdsMovTrf.FieldByName('TRFDEPLANC').AsFloat;
         cdsTrfCaf.FieldByName('CONTADB').AsString  := sDebitoD;
         cdsTrfCaf.FieldByName('CONTACR').AsString  := sCreditoD;
         cdsTrfCaf.Post;
         //-------------------------------------------------------------------------------
         LeParamCafxContab(Trunc(CrmRptCM.IdEmpresa),Trunc(iGrupoNovo) ,21,'C',iPlanoConta,sDebitoCMD);
         LeParamCafxContab(Trunc(CrmRptCM.IdEmpresa),Trunc(iGrupoAtual),21,'C',iPlanoConta,sCreditoCMD);
         cdsTrfCaf.Append;
         cdsTrfCaf.FieldByName('DATA').AsDateTime   := cdsMovTrf.FieldByName('DATAMOVIMENTACAO').AsDateTime;
         cdsTrfCaf.FieldByName('GRUPO').AsInteger   := cdsMovTrf.FieldByName('IDGRUPO').AsInteger;
         cdsTrfCaf.FieldByName('TIPOMOV').AsInteger := 21;
         cdsTrfCaf.FieldByName('VALOR').AsFloat     := cdsMovTrf.FieldByName('TRFCMDEP').AsFloat;
         cdsTrfCaf.FieldByName('CONTADB').AsString  := sDebitoCMD;
         cdsTrfCaf.FieldByName('CONTACR').AsString  := sCreditoCMD;
         cdsTrfCaf.Post;
         //-------------------------------------------------------------------------------
         if cdsMovTrf.FieldByName('TRFREAVVALORG').AsFloat >= 0 then
         begin
            LeParamCafxContab(Trunc(CrmRptCM.IdEmpresa),Trunc(iGrupoNovo) ,08,'D',iPlanoConta,sReavDebito);
            LeParamCafxContab(Trunc(CrmRptCM.IdEmpresa),Trunc(iGrupoAtual),08,'D',iPlanoConta,sReavCredito);
            cdsTrfCaf.Append;
            cdsTrfCaf.FieldByName('DATA').AsDateTime   := cdsMovTrf.FieldByName('DATAMOVIMENTACAO').AsDateTime;
            cdsTrfCaf.FieldByName('GRUPO').AsInteger   := cdsMovTrf.FieldByName('IDGRUPO').AsInteger;
            cdsTrfCaf.FieldByName('TIPOMOV').AsInteger := 08;
            cdsTrfCaf.FieldByName('VALOR').AsFloat     := cdsMovTrf.FieldByName('TRFREAVVALORG').AsFloat;
            cdsTrfCaf.FieldByName('CONTADB').AsString  := sReavDebito;
            cdsTrfCaf.FieldByName('CONTACR').AsString  := sReavCredito;
            cdsTrfCaf.Post;
            //----------------------------------------------------------------------------
            LeParamCafxContab(Trunc(CrmRptCM.IdEmpresa),Trunc(iGrupoNovo) ,22,'D',iPlanoConta,sReavDebitoCM);
            LeParamCafxContab(Trunc(CrmRptCM.IdEmpresa),Trunc(iGrupoAtual),22,'D',iPlanoConta,sReavCreditoCM);
            cdsTrfCaf.Append;
            cdsTrfCaf.FieldByName('DATA').AsDateTime   := cdsMovTrf.FieldByName('DATAMOVIMENTACAO').AsDateTime;
            cdsTrfCaf.FieldByName('GRUPO').AsInteger   := cdsMovTrf.FieldByName('IDGRUPO').AsInteger;
            cdsTrfCaf.FieldByName('TIPOMOV').AsInteger := 22;
            cdsTrfCaf.FieldByName('VALOR').AsFloat     := cdsMovTrf.FieldByName('TRFREAVCMBEM').AsFloat;
            cdsTrfCaf.FieldByName('CONTADB').AsString  := sReavDebitoCM;
            cdsTrfCaf.FieldByName('CONTACR').AsString  := sReavCreditoCM;
            cdsTrfCaf.Post;
            //----------------------------------------------------------------------------
            LeParamCafxContab(Trunc(CrmRptCM.IdEmpresa),Trunc(iGrupoAtual),18,'C',iPlanoConta,sReavDebitoD);
            LeParamCafxContab(Trunc(CrmRptCM.IdEmpresa),Trunc(iGrupoNovo) ,18,'C',iPlanoConta,sReavCreditoD);
            cdsTrfCaf.Append;
            cdsTrfCaf.FieldByName('DATA').AsDateTime   := cdsMovTrf.FieldByName('DATAMOVIMENTACAO').AsDateTime;
            cdsTrfCaf.FieldByName('GRUPO').AsInteger   := cdsMovTrf.FieldByName('IDGRUPO').AsInteger;
            cdsTrfCaf.FieldByName('TIPOMOV').AsInteger := 18;
            cdsTrfCaf.FieldByName('VALOR').AsFloat     := cdsMovTrf.FieldByName('TRFREAVDEPLANC').AsFloat;
            cdsTrfCaf.FieldByName('CONTADB').AsString  := sReavDebitoD;
            cdsTrfCaf.FieldByName('CONTACR').AsString  := sReavCreditoD;
            cdsTrfCaf.Post;
            //----------------------------------------------------------------------------
            LeParamCafxContab(Trunc(CrmRptCM.IdEmpresa),Trunc(iGrupoNovo) ,19,'C',iPlanoConta,sReavDebitoCMD);
            LeParamCafxContab(Trunc(CrmRptCM.IdEmpresa),Trunc(iGrupoAtual),19,'C',iPlanoConta,sReavCreditoCMD);
            cdsTrfCaf.Append;
            cdsTrfCaf.FieldByName('DATA').AsDateTime   := cdsMovTrf.FieldByName('DATAMOVIMENTACAO').AsDateTime;
            cdsTrfCaf.FieldByName('GRUPO').AsInteger   := cdsMovTrf.FieldByName('IDGRUPO').AsInteger;
            cdsTrfCaf.FieldByName('TIPOMOV').AsInteger := 19;
            cdsTrfCaf.FieldByName('VALOR').AsFloat     := cdsMovTrf.FieldByName('TRFREAVCMDEP').AsFloat;
            cdsTrfCaf.FieldByName('CONTADB').AsString  := sReavDebitoCMD;
            cdsTrfCaf.FieldByName('CONTACR').AsString  := sReavCreditoCMD;
            cdsTrfCaf.Post;
            //----------------------------------------------------------------------------
         end else
         begin
            LeParamCafxContab(Trunc(CrmRptCM.IdEmpresa),Trunc(iGrupoNovo) ,23,'C',iPlanoConta,sReavDebito);
            LeParamCafxContab(Trunc(CrmRptCM.IdEmpresa),Trunc(iGrupoAtual),23,'C',iPlanoConta,sReavCredito);
            cdsTrfCaf.Append;
            cdsTrfCaf.FieldByName('DATA').AsDateTime   := cdsMovTrf.FieldByName('DATAMOVIMENTACAO').AsDateTime;
            cdsTrfCaf.FieldByName('GRUPO').AsInteger   := cdsMovTrf.FieldByName('IDGRUPO').AsInteger;
            cdsTrfCaf.FieldByName('TIPOMOV').AsInteger := 23;
            cdsTrfCaf.FieldByName('VALOR').AsFloat     := cdsMovTrf.FieldByName('TRFREAVVALORG').AsFloat;
            cdsTrfCaf.FieldByName('CONTADB').AsString  := sReavDebito;
            cdsTrfCaf.FieldByName('CONTACR').AsString  := sReavCredito;
            cdsTrfCaf.Post;
            //----------------------------------------------------------------------------
            LeParamCafxContab(Trunc(CrmRptCM.IdEmpresa),Trunc(iGrupoNovo) ,22,'C',iPlanoConta,sReavDebitoCM);
            LeParamCafxContab(Trunc(CrmRptCM.IdEmpresa),Trunc(iGrupoAtual),22,'C',iPlanoConta,sReavCreditoCM);
            cdsTrfCaf.Append;
            cdsTrfCaf.FieldByName('DATA').AsDateTime   := cdsMovTrf.FieldByName('DATAMOVIMENTACAO').AsDateTime;
            cdsTrfCaf.FieldByName('GRUPO').AsInteger   := cdsMovTrf.FieldByName('IDGRUPO').AsInteger;
            cdsTrfCaf.FieldByName('TIPOMOV').AsInteger := 22;
            cdsTrfCaf.FieldByName('VALOR').AsFloat     := cdsMovTrf.FieldByName('TRFREAVCMBEM').AsFloat;
            cdsTrfCaf.FieldByName('CONTADB').AsString  := sReavDebitoCM;
            cdsTrfCaf.FieldByName('CONTACR').AsString  := sReavCreditoCM;
            cdsTrfCaf.Post;
            //----------------------------------------------------------------------------
            LeParamCafxContab(Trunc(CrmRptCM.IdEmpresa),Trunc(iGrupoAtual),18,'D',iPlanoConta,sReavDebitoD);
            LeParamCafxContab(Trunc(CrmRptCM.IdEmpresa),Trunc(iGrupoNovo) ,18,'D',iPlanoConta,sReavCreditoD);
            cdsTrfCaf.Append;
            cdsTrfCaf.FieldByName('DATA').AsDateTime   := cdsMovTrf.FieldByName('DATAMOVIMENTACAO').AsDateTime;
            cdsTrfCaf.FieldByName('GRUPO').AsInteger   := cdsMovTrf.FieldByName('IDGRUPO').AsInteger;
            cdsTrfCaf.FieldByName('TIPOMOV').AsInteger := 18;
            cdsTrfCaf.FieldByName('VALOR').AsFloat     := cdsMovTrf.FieldByName('TRFREAVDEPLANC').AsFloat;
            cdsTrfCaf.FieldByName('CONTADB').AsString  := sReavDebitoD;
            cdsTrfCaf.FieldByName('CONTACR').AsString  := sReavCreditoD;
            cdsTrfCaf.Post;
            //----------------------------------------------------------------------------
            LeParamCafxContab(Trunc(CrmRptCM.IdEmpresa),Trunc(iGrupoNovo) ,19,'D',iPlanoConta,sReavDebitoCMD);
            LeParamCafxContab(Trunc(CrmRptCM.IdEmpresa),Trunc(iGrupoAtual),19,'D',iPlanoConta,sReavCreditoCMD);
            cdsTrfCaf.Append;
            cdsTrfCaf.FieldByName('DATA').AsDateTime   := cdsMovTrf.FieldByName('DATAMOVIMENTACAO').AsDateTime;
            cdsTrfCaf.FieldByName('GRUPO').AsInteger   := cdsMovTrf.FieldByName('IDGRUPO').AsInteger;
            cdsTrfCaf.FieldByName('TIPOMOV').AsInteger := 19;
            cdsTrfCaf.FieldByName('VALOR').AsFloat     := cdsMovTrf.FieldByName('TRFREAVCMDEP').AsFloat;
            cdsTrfCaf.FieldByName('CONTADB').AsString  := sReavDebitoCMD;
            cdsTrfCaf.FieldByName('CONTACR').AsString  := sReavCreditoCMD;
            cdsTrfCaf.Post;
         end;
         //-------------------------------------------------------------------------------
         if cdsMovTrf.FieldByName('TRFAVVALORG').AsFloat >= 0 then
         begin
            LeParamCafxContab(Trunc(CrmRptCM.IdEmpresa),Trunc(iGrupoNovo) ,09,'D',iPlanoConta,sAVDebito);
            LeParamCafxContab(Trunc(CrmRptCM.IdEmpresa),Trunc(iGrupoAtual),09,'D',iPlanoConta,sAVCredito);
            cdsTrfCaf.Append;
            cdsTrfCaf.FieldByName('DATA').AsDateTime   := cdsMovTrf.FieldByName('DATAMOVIMENTACAO').AsDateTime;
            cdsTrfCaf.FieldByName('GRUPO').AsInteger   := cdsMovTrf.FieldByName('IDGRUPO').AsInteger;
            cdsTrfCaf.FieldByName('TIPOMOV').AsInteger := 09;
            cdsTrfCaf.FieldByName('VALOR').AsFloat     := cdsMovTrf.FieldByName('TRFAVVALORG').AsFloat;
            cdsTrfCaf.FieldByName('CONTADB').AsString  := sAVDebito;
            cdsTrfCaf.FieldByName('CONTACR').AsString  := sAVCredito;
            cdsTrfCaf.Post;
            //----------------------------------------------------------------------------
            LeParamCafxContab(Trunc(CrmRptCM.IdEmpresa),Trunc(iGrupoNovo) ,34,'D',iPlanoConta,sAVDebitoCM);
            LeParamCafxContab(Trunc(CrmRptCM.IdEmpresa),Trunc(iGrupoAtual),34,'D',iPlanoConta,sAVCreditoCM);
            cdsTrfCaf.Append;
            cdsTrfCaf.FieldByName('DATA').AsDateTime   := cdsMovTrf.FieldByName('DATAMOVIMENTACAO').AsDateTime;
            cdsTrfCaf.FieldByName('GRUPO').AsInteger   := cdsMovTrf.FieldByName('IDGRUPO').AsInteger;
            cdsTrfCaf.FieldByName('TIPOMOV').AsInteger := 34;
            cdsTrfCaf.FieldByName('VALOR').AsFloat     := cdsMovTrf.FieldByName('TRFAVCMBEM').AsFloat;
            cdsTrfCaf.FieldByName('CONTADB').AsString  := sAVDebitoCM;
            cdsTrfCaf.FieldByName('CONTACR').AsString  := sAVCreditoCM;
            cdsTrfCaf.Post;
            //----------------------------------------------------------------------------
            LeParamCafxContab(Trunc(CrmRptCM.IdEmpresa),Trunc(iGrupoAtual),35,'C',iPlanoConta,sAVDebitoD);
            LeParamCafxContab(Trunc(CrmRptCM.IdEmpresa),Trunc(iGrupoNovo) ,35,'C',iPlanoConta,sAVCreditoD);
            cdsTrfCaf.Append;
            cdsTrfCaf.FieldByName('DATA').AsDateTime   := cdsMovTrf.FieldByName('DATAMOVIMENTACAO').AsDateTime;
            cdsTrfCaf.FieldByName('GRUPO').AsInteger   := cdsMovTrf.FieldByName('IDGRUPO').AsInteger;
            cdsTrfCaf.FieldByName('TIPOMOV').AsInteger := 35;
            cdsTrfCaf.FieldByName('VALOR').AsFloat     := cdsMovTrf.FieldByName('TRFAVDEPLANC').AsFloat;
            cdsTrfCaf.FieldByName('CONTADB').AsString  := sAVDebitoD;
            cdsTrfCaf.FieldByName('CONTACR').AsString  := sAVCreditoD;
            cdsTrfCaf.Post;
            //----------------------------------------------------------------------------
            LeParamCafxContab(Trunc(CrmRptCM.IdEmpresa),Trunc(iGrupoNovo) ,36,'C',iPlanoConta,sAVDebitoCMD);
            LeParamCafxContab(Trunc(CrmRptCM.IdEmpresa),Trunc(iGrupoAtual),36,'C',iPlanoConta,sAVCreditoCMD);
            cdsTrfCaf.Append;
            cdsTrfCaf.FieldByName('DATA').AsDateTime   := cdsMovTrf.FieldByName('DATAMOVIMENTACAO').AsDateTime;
            cdsTrfCaf.FieldByName('GRUPO').AsInteger   := cdsMovTrf.FieldByName('IDGRUPO').AsInteger;
            cdsTrfCaf.FieldByName('TIPOMOV').AsInteger := 36;
            cdsTrfCaf.FieldByName('VALOR').AsFloat     := cdsMovTrf.FieldByName('TRFAVDEPLANC').AsFloat;
            cdsTrfCaf.FieldByName('CONTADB').AsString  := sAVDebitoCMD;
            cdsTrfCaf.FieldByName('CONTACR').AsString  := sAVCreditoCMD;
            cdsTrfCaf.Post;
         end else
         begin
            LeParamCafxContab(Trunc(CrmRptCM.IdEmpresa),Trunc(iGrupoNovo) ,09,'C',iPlanoConta,sAVDebito);
            LeParamCafxContab(Trunc(CrmRptCM.IdEmpresa),Trunc(iGrupoAtual),09,'C',iPlanoConta,sAVCredito);
            cdsTrfCaf.Append;
            cdsTrfCaf.FieldByName('DATA').AsDateTime   := cdsMovTrf.FieldByName('DATAMOVIMENTACAO').AsDateTime;
            cdsTrfCaf.FieldByName('GRUPO').AsInteger   := cdsMovTrf.FieldByName('IDGRUPO').AsInteger;
            cdsTrfCaf.FieldByName('TIPOMOV').AsInteger := 09;
            cdsTrfCaf.FieldByName('VALOR').AsFloat     := cdsMovTrf.FieldByName('TRFAVVALORG').AsFloat;
            cdsTrfCaf.FieldByName('CONTADB').AsString  := sAVDebito;
            cdsTrfCaf.FieldByName('CONTACR').AsString  := sAVCredito;
            cdsTrfCaf.Post;
            //----------------------------------------------------------------------------
            LeParamCafxContab(Trunc(CrmRptCM.IdEmpresa),Trunc(iGrupoNovo) ,34,'C',iPlanoConta,sAVDebitoCM);
            LeParamCafxContab(Trunc(CrmRptCM.IdEmpresa),Trunc(iGrupoAtual),34,'C',iPlanoConta,sAVCreditoCM);
            cdsTrfCaf.Append;
            cdsTrfCaf.FieldByName('DATA').AsDateTime   := cdsMovTrf.FieldByName('DATAMOVIMENTACAO').AsDateTime;
            cdsTrfCaf.FieldByName('GRUPO').AsInteger   := cdsMovTrf.FieldByName('IDGRUPO').AsInteger;
            cdsTrfCaf.FieldByName('TIPOMOV').AsInteger := 34;
            cdsTrfCaf.FieldByName('VALOR').AsFloat     := cdsMovTrf.FieldByName('TRFAVCMBEM').AsFloat;
            cdsTrfCaf.FieldByName('CONTADB').AsString  := sAVDebitoCM;
            cdsTrfCaf.FieldByName('CONTACR').AsString  := sAVCreditoCM;
            cdsTrfCaf.Post;
            //----------------------------------------------------------------------------
            LeParamCafxContab(Trunc(CrmRptCM.IdEmpresa),Trunc(iGrupoAtual),35,'D',iPlanoConta,sAVDebitoD);
            LeParamCafxContab(Trunc(CrmRptCM.IdEmpresa),Trunc(iGrupoNovo) ,35,'D',iPlanoConta,sAVCreditoD);
            cdsTrfCaf.Append;
            cdsTrfCaf.FieldByName('DATA').AsDateTime   := cdsMovTrf.FieldByName('DATAMOVIMENTACAO').AsDateTime;
            cdsTrfCaf.FieldByName('GRUPO').AsInteger   := cdsMovTrf.FieldByName('IDGRUPO').AsInteger;
            cdsTrfCaf.FieldByName('TIPOMOV').AsInteger := 35;
            cdsTrfCaf.FieldByName('VALOR').AsFloat     := cdsMovTrf.FieldByName('TRFAVDEPLANC').AsFloat;
            cdsTrfCaf.FieldByName('CONTADB').AsString  := sAVDebitoD;
            cdsTrfCaf.FieldByName('CONTACR').AsString  := sAVCreditoD;
            cdsTrfCaf.Post;
            //----------------------------------------------------------------------------
            LeParamCafxContab(Trunc(CrmRptCM.IdEmpresa),Trunc(iGrupoNovo) ,36,'D',iPlanoConta,sAVDebitoCMD);
            LeParamCafxContab(Trunc(CrmRptCM.IdEmpresa),Trunc(iGrupoAtual),36,'D',iPlanoConta,sAVCreditoCMD);
            cdsTrfCaf.Append;
            cdsTrfCaf.FieldByName('DATA').AsDateTime   := cdsMovTrf.FieldByName('DATAMOVIMENTACAO').AsDateTime;
            cdsTrfCaf.FieldByName('GRUPO').AsInteger   := cdsMovTrf.FieldByName('IDGRUPO').AsInteger;
            cdsTrfCaf.FieldByName('TIPOMOV').AsInteger := 36;
            cdsTrfCaf.FieldByName('VALOR').AsFloat     := cdsMovTrf.FieldByName('TRFAVCMDEP').AsFloat;
            cdsTrfCaf.FieldByName('CONTADB').AsString  := sAVDebitoCMD;
            cdsTrfCaf.FieldByName('CONTACR').AsString  := sAVCreditoCMD;
            cdsTrfCaf.Post;
         end;
         //-------------------------------------------------------------------------------
         cdsMovTrf.Next;
      end;
      //----------------------------------------------------------------------------------
      cdsTrfCaf.First;
      while not cdsTrfCaf.EOF do
      begin
         //-------------------------------------------------------------------------------
         //--- Pesquisa em CafxContab : Data, Conta Contábil á Débito
         //-------------------------------------------------------------------------------
         if cdsCafxContab.Locate('DATA;CONTACONTABIL',
                                 VarArrayOf([cdsTrfCaf.FieldByName('DATA').AsDateTime,
                                             cdsTrfCaf.FieldByName('CONTADB').AsString]),[]) then
         begin
            cdsCafxContab.Edit;
            cdsCafxContab.FieldByName('VLCAFDEB').AsFloat := cdsCafxContab.FieldByName('VLCAFDEB').AsFloat + cdsTrfCaf.FieldByName('VALOR').AsFloat;
            cdsCafxContab.Post;
         end;
         //-------------------------------------------------------------------------------
         //--- Pesquisa em CafxContab : Data, Conta Contábil á Crédito
         //-------------------------------------------------------------------------------
         if cdsCafxContab.Locate('DATA;CONTACONTABIL',
                                 VarArrayOf([cdsTrfCaf.FieldByName('DATA').AsDateTime,
                                             cdsTrfCaf.FieldByName('CONTACR').AsString]),[]) then
         begin
            cdsCafxContab.Edit;
            cdsCafxContab.FieldByName('VLCAFCRE').AsFloat := cdsCafxContab.FieldByName('VLCAFCRE').AsFloat + cdsTrfCaf.FieldByName('VALOR').AsFloat;
            cdsCafxContab.Post;
         end;
         //-------------------------------------------------------------------------------
         cdsTrfCaf.Next;
      end;
      //----------------------------------------------------------------------------------
      // Alimenta a Query do Relatório
      //----------------------------------------------------------------------------------
      cdsConsCafContab.Close;
      sqlConsCafContab.Prepare;
      sqlConsCafContab.ParamByName('PDATAINI').AsDateTime := -1;
      sqlConsCafContab.ParamByName('PDATAFIM').AsDateTime := -1;
      sqlConsCafContab.Open;
      cdsCafxContab.First;
      while not cdsCafxContab.EOF do
      begin
         if (cdsCafxContab.FieldByName('VLCAFDEB').AsFloat <> 0) or (cdsCafxContab.FieldByName('VLCAFCRE').AsFloat <> 0) then
         begin
            if CmpRptCM.ParamValues[3].AsBoolean and
               ((cdsCafxContab.FieldByName('VLCAFDEB').AsFloat - cdsCafxContab.FieldByName('VLCONTABDEB').AsFloat) = 0) and
               ((cdsCafxContab.FieldByName('VLCAFCRE').AsFloat - cdsCafxContab.FieldByName('VLCONTABCRE').AsFloat) = 0) then
            begin
               cdsCafxContab.Next;
               Continue;
            end;
            //----------------------------------------------------------------------------
            cdsConsCafContab.Append;
            cdsConsCafContab.FieldByName('DATA').AsDateTime        := cdsCafxContab.FieldByName('DATA').AsDateTime;
            cdsConsCafContab.FieldByName('CONTACONTABIL').AsString := cdsCafxContab.FieldByName('CONTACONTABIL').AsString;
            cdsConsCafContab.FieldByName('CENTROCUSTO').AsString   := cdsCafxContab.FieldByName('CENTROCUSTO').AsString;
            cdsConsCafContab.FieldByName('VLCONTABDEB').AsCurrency := cdsCafxContab.FieldByName('VLCONTABDEB').AsCurrency;
            cdsConsCafContab.FieldByName('VLCONTABCRE').AsCurrency := cdsCafxContab.FieldByName('VLCONTABCRE').AsCurrency;
            cdsConsCafContab.FieldByName('VLCAFDEB').AsCurrency    := cdsCafxContab.FieldByName('VLCAFDEB').AsCurrency;
            cdsConsCafContab.FieldByName('VLCAFCRE').AsCurrency    := cdsCafxContab.FieldByName('VLCAFCRE').AsCurrency;
            cdsConsCafContab.FieldByName('DIFVALDEB').AsCurrency   := (cdsCafxContab.FieldByName('VLCAFDEB').AsFloat - cdsCafxContab.FieldByName('VLCONTABDEB').AsFloat);
            cdsConsCafContab.FieldByName('DIFVALCRE').AsCurrency   := (cdsCafxContab.FieldByName('VLCAFCRE').AsFloat - cdsCafxContab.FieldByName('VLCONTABCRE').AsFloat);
            cdsConsCafContab.Post;
         end;
         cdsCafxContab.Next;
      end;
      cdsCafxContab.Close;
      //----------------------------------------------------------------------------------
      LbPer13.Caption := 'De ' + datetostr(CmpRptCM.ParamValues[0].AsDateTime) + ' a ' + datetostr(CmpRptCM.ParamValues[1].AsDateTime);
      rpConsCafContabDbText1.DisplayFormat := sMascaraCCusto;
      rpConsCafContabDbText2.DisplayFormat := sMascaraPlano;
      //----------------------------------------------------------------------------------
      Screen.Cursor := crDefault;
  except
     On E : Exception Do
     begin
        CMDebugToFile('CONCILIAÇÃO ENTRE ATIVO FIXO X CONTABILIDADE : ' + E.Message);
     end;
  end;
end;

function TRptCAFConcCafContab.LeParamCafxContab(iEmpresa, iGrupo, iTipoMov : Integer;
                                                sTipoLanc: String;
                                                iPlano : Integer; Var sPlaConta : String;
                                                bCtaxCCusto : Boolean;
                                                sCodCentroCusto : string) : Boolean;
begin
   if not bCtaxCCusto then
   begin
      sPlaConta := ContaContabilSemCC(iEmpresa, iGrupo, iTipoMov, iPlano, sTipoLanc);
   end else
   begin
      sPlaConta := ContaContabilComCC(iEmpresa, iGrupo, iTipoMov, iPlano, sTipoLanc, sCodCentroCusto);
      if sPlaConta = '' then
         sPlaConta := ContaContabilSemCC(iEmpresa, iGrupo, iTipoMov, iPlano, sTipoLanc);
   end;
   Result := sPlaConta <> '';
end;

function TRptCAFConcCafContab.ContaContabilSemCC(iEmpresa, iGrupo, iTipoMov, iPlano : Integer;
                                                 sTipoLanc : String) : String;
begin
   _cds.Close;
   sqlContaContabilSemCC.ClientDataSet := _cds;
   sqlContaContabilSemCC.Prepare;
   sqlContaContabilSemCC.ParamByName('IDGRUPO').AsInteger            := iGrupo;
   sqlContaContabilSemCC.ParamByName('IDTIPOMOVIMENTACAO').AsInteger := iTipoMov;
   sqlContaContabilSemCC.ParamByName('TIPOLANCAMENTO').AsString      := sTipoLanc;
   sqlContaContabilSemCC.ParamByName('IDPESSOA').AsInteger           := iEmpresa;
   sqlContaContabilSemCC.ParamByName('PLANO').AsInteger              := iPlano;
   sqlContaContabilSemCC.Open;
   if _cds.RecordCount = 1 then
      Result := trim(_cds.FieldByName('PLACONTA').AsString)
   else
      Result := '';
end;

function TRptCAFConcCafContab.ContaContabilComCC(iEmpresa, iGrupo, iTipoMov, iPlano : Integer;
                                                 sTipoLanc, sCodCentroCusto : String) : String;
begin
   _cds.Close;
   sqlContaContabilComCC.ClientDataSet := _cds;
   sqlContaContabilComCC.Prepare;
   sqlContaContabilComCC.ParamByName('IDGRUPO').AsInteger            := iGrupo;
   sqlContaContabilComCC.ParamByName('IDTIPOMOVIMENTACAO').AsInteger := iTipoMov;
   sqlContaContabilComCC.ParamByName('TIPOLANCAMENTO').AsString      := sTipoLanc;
   sqlContaContabilComCC.ParamByName('IDPESSOA').AsInteger           := iEmpresa;
   sqlContaContabilComCC.ParamByName('PLANO').AsInteger              := iPlano;
   sqlContaContabilComCC.ParamByName('IDEMPRESA').AsInteger          := iEmpresa;
   sqlContaContabilComCC.ParamByName('CODCENTROCUSTO').AsString      := sCodCentroCusto;
   sqlContaContabilComCC.Open;
   Result := trim(_cds.FieldByName('PLACONTA').AsString);
end;

end.
