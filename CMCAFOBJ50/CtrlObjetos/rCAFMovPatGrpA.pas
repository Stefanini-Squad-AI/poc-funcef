unit rCAFMovPatGrpA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, uCMfileUtils,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc, uAtivoFixo,
  DBTables, Wwquery, uCmRptManager, TXComp, CmParamReport, uCmSqlParams,
  DBClient, uCMClientDataSet;

type
  TRptCAFMovPatGrpA = class(TFrmCmReport)
    sqlMovPatGrpA: TCMSqlParams;
    sqlGrpAnaliticos: TCMSqlParams;
    cdsGrpAnaliticos: TCMClientDataSet;
    sqlGrpSinteticos: TCMSqlParams;
    cdsGrpSinteticos: TCMClientDataSet;
    sqlParamCaf: TCMSqlParams;
    cdsParamCaf: TCMClientDataSet;
    cdsMovPatAux: TCMClientDataSet;
    sqlTransfPer: TCMSqlParams;
    cdsTransfPer: TCMClientDataSet;
    sqlVerUltFec: TCMSqlParams;
    cdsVerUltFec: TCMClientDataSet;
    rpMovPatGrpA: TppReport;
    ppHeaderBand10: TppHeaderBand;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    pplbldata1: TppLabel;
    rbLabel80: TppLabel;
    rpMovPatGrpLine1: TppLine;
    rbLabel82: TppLabel;
    rpMovPatGrpLabel1: TppLabel;
    ppDetailBand10: TppDetailBand;
    rbdbeClasse: TppDBText;
    ppDBText48: TppDBText;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppDBText54: TppDBText;
    ppFooterBand10: TppFooterBand;
    ppLine20: TppLine;
    ppLabel81: TppLabel;
    ppCalc19: TppSystemVariable;
    ppCalc20: TppSystemVariable;
    ppMovPatGrpA: TppBDEPipeline;
    dsMovPatGrpA: TwwDataSource;
    sqlMovPatAux: TCMSqlParams;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel1: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel10: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    sqlMovPer: TCMSqlParams;
    cdsMovPer: TCMClientDataSet;
    cdsMovPatGrpA: TCMClientDataSet;
    ppLabel7: TppLabel;
    ppLine1: TppLine;
    ppLine19: TppLine;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ppDetailBand10BeforePrint(Sender: TObject);
  private
    function DataUltFechamento : TDate;

  public
    iGrupoIni     : Integer;
    sMascaraGrupo : String;
    bInvestImob   : Boolean;
  end;

var
  RptCAFMovPatGrpA: TRptCAFMovPatGrpA;

implementation

{$R *.DFM}

procedure TRptCAFMovPatGrpA.CrmRptCMBeforePrint(Sender: TObject);
var
   fSaldoAnterior, fValCustoAnt,
   fValCustoAquis, fValCustoEnt,
   fValCustoSai, fValCustoBx,
   fValCustoAtual, fValDeprecAnt,
   fValDeprecAquis, fValDeprecEnt,
   fValDeprecSai, fValDeprecBx,
   fValDeprecAtual, fSaldoAtual    : Currency;
   iTam, iAux                      : Integer;
   iDiaIni, iMesIni, iAnoIni,
   iDiaFim, iMesFim, iAnoFim       : Word;

begin
   Application.ProcessMessages;
   try
      inherited;
      sqlParamCaf.Prepare;
      sqlParamCaf.ParamByName('PIDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlParamCaf.Open;
      bInvestImob := copy(cdsParamCAF.FieldByName('SISTEMAS').AsString, 4, 1) = '1';
      //----------------------------------------------------------------------------------
      sMascaraGrupo := cdsParamCaf.FieldByName('MASCCODGRUPO').AsString;
      iAux := 1;
      while iAux <= length(sMascaraGrupo) do
      begin
         if sMascaraGrupo[iAux] = '9' then
            sMascaraGrupo[iAux] := '#';
         iAux := iAux + 1;
      end;
      sMascaraGrupo := sMascaraGrupo + ';0; ';
      //----------------------------------------------------------------------------------
      // Prepara os datasets que irão receber o resultado do processamento
      //----------------------------------------------------------------------------------
      sqlMovPatAux.Prepare;
      sqlMovPatAux.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlMovPatAux.Open;
      sqlMovPatAux.Prepare;
      sqlMovPatGrpA.Open;
      //----------------------------------------------------------------------------------
      DecodeDate(CmpRptCM.ParamValues[0].AsDateTime, iAnoIni, iMesIni, iDiaIni);
      DecodeDate(CmpRptCM.ParamValues[1].AsDateTime, iAnoFim, iMesFim, iDiaFim);
      //**********************************************************************************
      // Processa os saldos anteriores
      //**********************************************************************************
      if CmpRptCM.ParamValues[2].AsInteger <> 0 then
      begin
         sqlGrpAnaliticos.SQL.Strings[20] := ' AND (SB.IDGRUPO = '+IntToStr(CmpRptCM.ParamValues[2].AsInteger)+') ';
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[20] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[3].AsInteger = 0 then
      begin
         sqlGrpAnaliticos.SQL.Strings[21] := ' AND (G.FLGIMOVEL = 0) ';
         ppLabel7.Caption := 'IMOBILIZADO';
      end else
      if CmpRptCM.ParamValues[3].AsInteger = 1 then
      begin
         sqlGrpAnaliticos.SQL.Strings[21] := ' AND (G.FLGIMOVEL = 1) ';
         ppLabel7.Caption := 'INVESTIMENTOS IMOBILIÁRIOS';
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[21] := ' ';
         ppLabel7.Caption := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[4].AsBoolean then
      begin
         sqlGrpAnaliticos.SQL.Strings[22] := ' ';
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[22] := ' AND (B.CONTROLE = ''T'') ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[5].AsBoolean then
      begin
         sqlGrpAnaliticos.SQL.Strings[23] := ' ';
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[23] := ' AND (B.BAIXATOTAL <> ''S'') ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[8].AsInteger = 1 then
         sqlGrpAnaliticos.SQL.Strings[25] := ' AND (B.TAXADEP = 0)'
      else
         sqlGrpAnaliticos.SQL.Strings[25] := ' ';
      //----------------------------------------------------------------------------------
      sqlGrpAnaliticos.Prepare;
      //----------------------------------------------------------------------------------
      // Filtragem pela qualificação da depreciação
      // 0 - Todos
      // 1 - Não Depreciáveis
      // 2 - Parcialmente Depreciados
      // 3 - Totalmente Depreciados
      //----------------------------------------------------------------------------------
      case CmpRptCM.ParamValues[8].AsInteger of
         0: begin
               sqlGrpAnaliticos.ParamByName('PDEPREC').AsInteger    := 0;
               sqlGrpAnaliticos.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
         1: begin
               sqlGrpAnaliticos.ParamByName('PDEPREC').AsInteger    := 0;
               sqlGrpAnaliticos.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
         2: begin
               sqlGrpAnaliticos.ParamByName('PDEPREC').AsInteger    := 0;
               sqlGrpAnaliticos.ParamByName('PNOTDEPREC').AsInteger := 0;
            end;
         3: begin
               sqlGrpAnaliticos.ParamByName('PDEPREC').AsInteger    := 1;
               sqlGrpAnaliticos.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
      else  begin
               sqlGrpAnaliticos.ParamByName('PDEPREC').AsInteger    := 0;
               sqlGrpAnaliticos.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
      end;
      //----------------------------------------------------------------------------------
      sqlGrpAnaliticos.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlGrpAnaliticos.ParamByName('DATASLD').AsDate   := (EncodeDate(iAnoIni,iMesIni,iDiaIni) - 1);
      sqlGrpAnaliticos.Open;
      //----------------------------------------------------------------------------------
      while not cdsGrpAnaliticos.EOF do
      begin
         if cdsMovPatAux.Locate('IDGRUPO',cdsGrpAnaliticos.FieldByName('IDGRUPO').AsInteger,[]) then
         begin
            while (not cdsGrpAnaliticos.EOF) and (cdsGrpAnaliticos.FieldByName('IDGRUPO').AsInteger = cdsMovPatAux.FieldByName('IDGRUPO').AsInteger) do
            begin
               cdsMovPatAux.Edit;
               cdsMovPatAux.FieldByName('SALDOANTERIOR').AsCurrency := cdsGrpAnaliticos.FieldByName('VALCTB0').AsCurrency;
               cdsMovPatAux.FieldByName('VALCUSTOANT').AsCurrency   := cdsGrpAnaliticos.FieldByName('VALORG0').AsCurrency;
               cdsMovPatAux.FieldByName('VALDEPRECANT').AsCurrency  := cdsGrpAnaliticos.FieldByName('DEPLANC0').AsCurrency;
               //-------------------------------------------------------------------------
               cdsGrpAnaliticos.Next;
            end;
         end else
         begin
            cdsGrpAnaliticos.Next;
         end;
      end;
      cdsGrpAnaliticos.Close;
      //**********************************************************************************
      // Registra as movimentações realizadas no periodo especificado
      //**********************************************************************************
      if CmpRptCM.ParamValues[2].AsInteger <> 0 then
      begin
         sqlMovPer.SQL.Strings[50] := ' AND (SB.IDGRUPO = '+IntToStr(CmpRptCM.ParamValues[2].AsInteger)+') ';
      end else
      begin
         sqlMovPer.SQL.Strings[50] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[3].AsInteger = 0 then
      begin
         sqlMovPer.SQL.Strings[51] := ' AND (G.FLGIMOVEL = 0) ';
         ppLabel7.Caption := 'IMOBILIZADO';
      end else
      if CmpRptCM.ParamValues[3].AsInteger = 1 then
      begin
         sqlMovPer.SQL.Strings[51] := ' AND (G.FLGIMOVEL = 1) ';
         ppLabel7.Caption := 'INVESTIMENTOS IMOBILIÁRIOS';
      end else
      begin
         sqlMovPer.SQL.Strings[51] := ' ';
         ppLabel7.Caption := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[4].AsBoolean then
      begin
         sqlMovPer.SQL.Strings[52] := ' ';
      end else
      begin
         sqlMovPer.SQL.Strings[52] := ' AND (B.CONTROLE = ''T'') ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[5].AsBoolean then
      begin
         sqlMovPer.SQL.Strings[53] := ' ';
      end else
      begin
         sqlMovPer.SQL.Strings[53] := ' AND (B.BAIXATOTAL <> ''S'') ';
      end;
      //----------------------------------------------------------------------------------
      // Filtragem pela qualificação da depreciação
      // 0 - Todos
      // 1 - Não Depreciáveis
      // 2 - Parcialmente Depreciados
      // 3 - Totalmente Depreciados
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[8].AsInteger = 1 then
         sqlMovPer.SQL.Strings[55] := ' AND (B.TAXADEP = 0)'
      else
         sqlMovPer.SQL.Strings[55] := ' ';
      //----------------------------------------------------------------------------------
      sqlMovPer.Prepare;
      //----------------------------------------------------------------------------------
      // Filtragem pela qualificação da depreciação
      // 0 - Todos
      // 1 - Não Depreciáveis
      // 2 - Parcialmente Depreciados
      // 3 - Totalmente Depreciados
      //----------------------------------------------------------------------------------
      case CmpRptCM.ParamValues[8].AsInteger of
         0: begin
               sqlMovPer.ParamByName('PDEPREC').AsInteger    := 0;
               sqlMovPer.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
         1: begin
               sqlMovPer.ParamByName('PDEPREC').AsInteger    := 0;
               sqlMovPer.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
         2: begin
               sqlMovPer.ParamByName('PDEPREC').AsInteger    := 0;
               sqlMovPer.ParamByName('PNOTDEPREC').AsInteger := 0;
            end;
         3: begin
               sqlMovPer.ParamByName('PDEPREC').AsInteger    := 1;
               sqlMovPer.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
      else  begin
               sqlMovPer.ParamByName('PDEPREC').AsInteger    := 0;
               sqlMovPer.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
      end;
      //----------------------------------------------------------------------------------
      sqlMovPer.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlMovPer.ParamByName('DATAINI').AsDate   := (EncodeDate(iAnoIni,iMesIni,iDiaIni));
      sqlMovPer.ParamByName('DATASLD').AsDate   := (EncodeDate(iAnoFim,iMesFim,iDiaFim));
      sqlMovPer.Open;
      //----------------------------------------------------------------------------------
      while not cdsMovPer.EOF do
      begin
         if cdsMovPatAux.Locate('IDGRUPO',cdsMovPer.FieldByName('IDGRUPO').AsInteger,[]) then
         begin
            while (not cdsMovPer.EOF) and (cdsMovPer.FieldByName('IDGRUPO').AsInteger = cdsMovPatAux.FieldByName('IDGRUPO').AsInteger) do
            begin
               cdsMovPatAux.Edit;
               cdsMovPatAux.FieldByName('VALCUSTOAQUIS').AsCurrency  := cdsMovPer.FieldByName('VALCUSTOAQUIS').AsCurrency;
               cdsMovPatAux.FieldByName('VALCUSTOENT').AsCurrency    := cdsMovPer.FieldByName('VALCUSTOENT').AsCurrency;
               cdsMovPatAux.FieldByName('VALCUSTOSAI').AsCurrency    := cdsMovPer.FieldByName('VALCUSTOSAI').AsCurrency;
               cdsMovPatAux.FieldByName('VALCUSTOBX').AsCurrency     := cdsMovPer.FieldByName('VALCUSTOBX').AsCurrency;
               cdsMovPatAux.FieldByName('VALDEPRECAQUIS').AsCurrency := cdsMovPer.FieldByName('VALDEPRECPER').AsCurrency;
               cdsMovPatAux.FieldByName('VALDEPRECENT').AsCurrency   := cdsMovPer.FieldByName('VALDEPRECENT').AsCurrency;
               cdsMovPatAux.FieldByName('VALDEPRECSAI').AsCurrency   := cdsMovPer.FieldByName('VALDEPRECSAI').AsCurrency;
               cdsMovPatAux.FieldByName('VALDEPRECBX').AsCurrency    := cdsMovPer.FieldByName('VALDEPRECBX').AsCurrency;
               //-------------------------------------------------------------------------
               cdsMovPer.Next;
            end;
         end else
         begin
            cdsMovPer.Next;
         end;
      end;
      cdsMovPer.Close;
      //**********************************************************************************
      // Registra as transferências
      //**********************************************************************************
      if CmpRptCM.ParamValues[2].AsInteger <> 0 then
      begin
         sqlTransfPer.SQL.Strings[24] := ' AND (SB.IDGRUPO = '+IntToStr(CmpRptCM.ParamValues[2].AsInteger)+') ';
      end else
      begin
         sqlTransfPer.SQL.Strings[24] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[3].AsInteger = 0 then
      begin
         sqlTransfPer.SQL.Strings[25] := ' AND (G.FLGIMOVEL = 0) ';
         ppLabel7.Caption := 'IMOBILIZADO';
      end else
      if CmpRptCM.ParamValues[3].AsInteger = 1 then
      begin
         sqlTransfPer.SQL.Strings[25] := ' AND (G.FLGIMOVEL = 1) ';
         ppLabel7.Caption := 'INVESTIMENTOS IMOBILIÁRIOS';
      end else
      begin
         sqlTransfPer.SQL.Strings[25] := ' ';
         ppLabel7.Caption := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[4].AsBoolean then
      begin
         sqlTransfPer.SQL.Strings[26] := ' ';
      end else
      begin
         sqlTransfPer.SQL.Strings[26] := ' AND (B.CONTROLE = ''T'') ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[5].AsBoolean then
      begin
         sqlTransfPer.SQL.Strings[27] := ' ';
      end else
      begin
         sqlTransfPer.SQL.Strings[27] := ' AND (B.BAIXATOTAL <> ''S'') ';
      end;
      //----------------------------------------------------------------------------------
      // Filtragem pela qualificação da depreciação
      // 0 - Todos
      // 1 - Não Depreciáveis
      // 2 - Parcialmente Depreciados
      // 3 - Totalmente Depreciados
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[8].AsInteger = 1 then
         sqlTransfPer.SQL.Strings[29] := ' AND (B.TAXADEP = 0)'
      else
         sqlTransfPer.SQL.Strings[29] := ' ';
      //----------------------------------------------------------------------------------
      sqlTransfPer.Prepare;
      //----------------------------------------------------------------------------------
      // Filtragem pela qualificação da depreciação
      // 0 - Todos
      // 1 - Não Depreciáveis
      // 2 - Parcialmente Depreciados
      // 3 - Totalmente Depreciados
      //----------------------------------------------------------------------------------
      case CmpRptCM.ParamValues[8].AsInteger of
         0: begin
               sqlTransfPer.ParamByName('PDEPREC').AsInteger    := 0;
               sqlTransfPer.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
         1: begin
               sqlTransfPer.ParamByName('PDEPREC').AsInteger    := 0;
               sqlTransfPer.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
         2: begin
               sqlTransfPer.ParamByName('PDEPREC').AsInteger    := 0;
               sqlTransfPer.ParamByName('PNOTDEPREC').AsInteger := 0;
            end;
         3: begin
               sqlTransfPer.ParamByName('PDEPREC').AsInteger    := 1;
               sqlTransfPer.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
      else  begin
               sqlTransfPer.ParamByName('PDEPREC').AsInteger    := 0;
               sqlTransfPer.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
      end;
      //----------------------------------------------------------------------------------
      sqlTransfPer.ParamByName('PIDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlTransfPer.ParamByName('PDATAINI').AsDate   := (EncodeDate(iAnoIni,iMesIni,iDiaIni));
      sqlTransfPer.ParamByName('PDATAFIM').AsDate   := (EncodeDate(iAnoFim,iMesFim,iDiaFim));
      sqlTransfPer.Open;
      //----------------------------------------------------------------------------------
      while not cdsTransfPer.EOF do
      begin
         if cdsMovPatAux.Locate('IDGRUPO',cdsTransfPer.FieldByName('IDGRUPO').AsInteger,[]) then
         begin
            cdsMovPatAux.Edit;
            cdsMovPatAux.FieldByName('VALCUSTOENT').AsCurrency  := cdsMovPatAux.FieldByName('VALCUSTOENT').AsCurrency + cdsTransfPer.FieldByName('VALORG').AsCurrency;
            cdsMovPatAux.FieldByName('VALDEPRECENT').AsCurrency := cdsMovPatAux.FieldByName('VALDEPRECENT').AsCurrency + cdsTransfPer.FieldByName('DEPLANC').AsCurrency;
            cdsMovPatAux.Post;
         end;
         if cdsMovPatAux.Locate('IDGRUPO',cdsTransfPer.FieldByName('IDGRUPANT').AsInteger,[]) then
         begin
            cdsMovPatAux.Edit;
            cdsMovPatAux.FieldByName('VALCUSTOSAI').AsCurrency  := cdsMovPatAux.FieldByName('VALCUSTOSAI').AsCurrency  + cdsTransfPer.FieldByName('VALORG').AsCurrency;
            cdsMovPatAux.FieldByName('VALDEPRECSAI').AsCurrency := cdsMovPatAux.FieldByName('VALDEPRECSAI').AsCurrency + cdsTransfPer.FieldByName('DEPLANC').AsCurrency;
            cdsMovPatAux.Post;
         end;
         cdsTransfPer.Next;
      end;
      cdsTransfPer.Close;
      //**********************************************************************************
      // Processa os saldos atuais
      //**********************************************************************************
      if CmpRptCM.ParamValues[2].AsInteger <> 0 then
      begin
         sqlGrpAnaliticos.SQL.Strings[20] := ' AND (SB.IDGRUPO = '+IntToStr(CmpRptCM.ParamValues[2].AsInteger)+') ';
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[20] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[3].AsInteger = 0 then
      begin
         sqlGrpAnaliticos.SQL.Strings[21] := ' AND (G.FLGIMOVEL = 0) ';
         ppLabel7.Caption := 'IMOBILIZADO';
      end else
      if CmpRptCM.ParamValues[3].AsInteger = 1 then
      begin
         sqlGrpAnaliticos.SQL.Strings[21] := ' AND (G.FLGIMOVEL = 1) ';
         ppLabel7.Caption := 'INVESTIMENTOS IMOBILIÁRIOS';
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[21] := ' ';
         ppLabel7.Caption := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[4].AsBoolean then
      begin
         sqlGrpAnaliticos.SQL.Strings[22] := ' ';
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[22] := ' AND (B.CONTROLE = ''T'') ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[5].AsBoolean then
      begin
         sqlGrpAnaliticos.SQL.Strings[23] := ' ';
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[23] := ' AND (B.BAIXATOTAL <> ''S'') ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[8].AsInteger = 1 then
         sqlGrpAnaliticos.SQL.Strings[25] := ' AND (B.TAXADEP = 0)'
      else
         sqlGrpAnaliticos.SQL.Strings[25] := ' ';
      //----------------------------------------------------------------------------------
      sqlGrpAnaliticos.Prepare;
      //----------------------------------------------------------------------------------
      // Filtragem pela qualificação da depreciação
      // 0 - Todos
      // 1 - Não Depreciáveis
      // 2 - Parcialmente Depreciados
      // 3 - Totalmente Depreciados
      //----------------------------------------------------------------------------------
      case CmpRptCM.ParamValues[8].AsInteger of
         0: begin
               sqlGrpAnaliticos.ParamByName('PDEPREC').AsInteger    := 0;
               sqlGrpAnaliticos.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
         1: begin
               sqlGrpAnaliticos.ParamByName('PDEPREC').AsInteger    := 0;
               sqlGrpAnaliticos.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
         2: begin
               sqlGrpAnaliticos.ParamByName('PDEPREC').AsInteger    := 0;
               sqlGrpAnaliticos.ParamByName('PNOTDEPREC').AsInteger := 0;
            end;
         3: begin
               sqlGrpAnaliticos.ParamByName('PDEPREC').AsInteger    := 1;
               sqlGrpAnaliticos.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
      else  begin
               sqlGrpAnaliticos.ParamByName('PDEPREC').AsInteger    := 0;
               sqlGrpAnaliticos.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
      end;
      //----------------------------------------------------------------------------------
      sqlGrpAnaliticos.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlGrpAnaliticos.ParamByName('DATASLD').AsDate   := EncodeDate(iAnoFim,iMesFim,iDiaFim);
      sqlGrpAnaliticos.Open;
      //----------------------------------------------------------------------------------
      while not cdsGrpAnaliticos.EOF do
      begin
         if cdsMovPatAux.Locate('IDGRUPO',cdsGrpAnaliticos.FieldByName('IDGRUPO').AsInteger,[]) then
         begin
            while (not cdsGrpAnaliticos.EOF) and (cdsGrpAnaliticos.FieldByName('IDGRUPO').AsInteger = cdsMovPatAux.FieldByName('IDGRUPO').AsInteger) do
            begin
               cdsMovPatAux.Edit;
               cdsMovPatAux.FieldByName('VALCUSTOATUAL').AsCurrency  := cdsGrpAnaliticos.FieldByName('VALORG0').AsCurrency;
               cdsMovPatAux.FieldByName('VALDEPRECATUAL').AsCurrency := cdsGrpAnaliticos.FieldByName('DEPLANC0').AsCurrency;
               cdsMovPatAux.FieldByName('SALDOATUAL').AsCurrency     := cdsGrpAnaliticos.FieldByName('VALCTB0').AsCurrency;
               //-------------------------------------------------------------------------
               cdsGrpAnaliticos.Next;
            end;
         end else
         begin
            cdsGrpAnaliticos.Next;
         end;
      end;
      cdsGrpAnaliticos.Close;
      //----------------------------------------------------------------------------------
      // Calcula os Grupos Sintéticos
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[2].AsInteger = 0 then
      begin
         sqlGrpSinteticos.SQL.Strings[4] := ' AND (G.FLGIMOVEL = 0) ';
      end else
      if CmpRptCM.ParamValues[2].AsInteger = 1 then
      begin
         sqlGrpSinteticos.SQL.Strings[4] := ' AND (G.FLGIMOVEL = 1) ';
      end;
      sqlGrpSinteticos.Prepare;
      sqlGrpSinteticos.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlGrpSinteticos.Open;
      //----------------------------------------------------------------------------------
      while not cdsGrpSinteticos.EOF do
      begin
         iTam := length(cdsGrpSinteticos.FieldByName('CLASSE').AsString);
         fSaldoAnterior  := 0;
         fValCustoAnt    := 0;
         fValCustoAquis  := 0;
         fValCustoEnt    := 0;
         fValCustoSai    := 0;
         fValCustoBx     := 0;
         fValCustoAtual  := 0;
         fValDeprecAnt   := 0;
         fValDeprecAquis := 0;
         fValDeprecEnt   := 0;
         fValDeprecSai   := 0;
         fValDeprecBx    := 0;
         fValDeprecAtual := 0;
         fSaldoAtual     := 0;
         //-------------------------------------------------------------------------------
         cdsMovPatAux.Locate('CLASSE',trim(cdsGrpSinteticos.FieldByName('CLASSE').AsString),[loPartialKey]);
         while (not cdsMovPatAux.EOF) and
               (copy(cdsMovPatAux.FieldByName('CLASSE').AsString,1,iTam) = cdsGrpSinteticos.FieldByName('CLASSE').AsString) do
         begin
            fSaldoAnterior  := AtivoFixo.ConvNum(fSaldoAnterior  + cdsMovPatAux.FieldByName('SALDOANTERIOR').AsCurrency);
            fValCustoAnt    := AtivoFixo.ConvNum(fValCustoAnt    + cdsMovPatAux.FieldByName('VALCUSTOANT').AsCurrency);
            fValCustoAquis  := AtivoFixo.ConvNum(fValCustoAquis  + cdsMovPatAux.FieldByName('VALCUSTOAQUIS').AsCurrency);
            fValCustoEnt    := AtivoFixo.ConvNum(fValCustoEnt    + cdsMovPatAux.FieldByName('VALCUSTOENT').AsCurrency);
            fValCustoSai    := AtivoFixo.ConvNum(fValCustoSai    + cdsMovPatAux.FieldByName('VALCUSTOSAI').AsCurrency);
            fValCustoBx     := AtivoFixo.ConvNum(fValCustoBx     + cdsMovPatAux.FieldByName('VALCUSTOBX').AsCurrency);
            fValCustoAtual  := AtivoFixo.ConvNum(fValCustoAtual  + cdsMovPatAux.FieldByName('VALCUSTOATUAL').AsCurrency);
            fValDeprecAnt   := AtivoFixo.ConvNum(fValDeprecAnt   + cdsMovPatAux.FieldByName('VALDEPRECANT').AsCurrency);
            fValDeprecAquis := AtivoFixo.ConvNum(fValDeprecAquis + cdsMovPatAux.FieldByName('VALDEPRECAQUIS').AsCurrency);
            fValDeprecEnt   := AtivoFixo.ConvNum(fValDeprecEnt   + cdsMovPatAux.FieldByName('VALDEPRECENT').AsCurrency);
            fValDeprecSai   := AtivoFixo.ConvNum(fValDeprecSai   + cdsMovPatAux.FieldByName('VALDEPRECSAI').AsCurrency);
            fValDeprecBx    := AtivoFixo.ConvNum(fValDeprecBx    + cdsMovPatAux.FieldByName('VALDEPRECBX').AsCurrency);
            fValDeprecAtual := AtivoFixo.ConvNum(fValDeprecAtual + cdsMovPatAux.FieldByName('VALDEPRECATUAL').AsCurrency);
            fSaldoAtual     := AtivoFixo.ConvNum(fSaldoAtual     + cdsMovPatAux.FieldByName('SALDOATUAL').AsCurrency);
            cdsMovPatAux.Next;
         end;
         //-------------------------------------------------------------------------------
         cdsMovPatAux.Locate('CLASSE',cdsGrpSinteticos.FieldByName('CLASSE').AsString,[]);
         cdsMovPatAux.Edit;
         cdsMovPatAux.FieldByName('SALDOANTERIOR').AsCurrency  := fSaldoAnterior ;
         cdsMovPatAux.FieldByName('VALCUSTOANT').AsCurrency    := fValCustoAnt   ;
         cdsMovPatAux.FieldByName('VALCUSTOAQUIS').AsCurrency  := fValCustoAquis ;
         cdsMovPatAux.FieldByName('VALCUSTOENT').AsCurrency    := fValCustoEnt   ;
         cdsMovPatAux.FieldByName('VALCUSTOSAI').AsCurrency    := fValCustoSai   ;
         cdsMovPatAux.FieldByName('VALCUSTOBX').AsCurrency     := fValCustoBx    ;
         cdsMovPatAux.FieldByName('VALCUSTOATUAL').AsCurrency  := fValCustoAtual ;
         cdsMovPatAux.FieldByName('VALDEPRECANT').AsCurrency   := fValDeprecAnt  ;
         cdsMovPatAux.FieldByName('VALDEPRECAQUIS').AsCurrency := fValDeprecAquis;
         cdsMovPatAux.FieldByName('VALDEPRECENT').AsCurrency   := fValDeprecEnt  ;
         cdsMovPatAux.FieldByName('VALDEPRECSAI').AsCurrency   := fValDeprecSai  ;
         cdsMovPatAux.FieldByName('VALDEPRECBX').AsCurrency    := fValDeprecBx   ;
         cdsMovPatAux.FieldByName('VALDEPRECATUAL').AsCurrency := fValDeprecAtual;
         cdsMovPatAux.FieldByName('SALDOATUAL').AsCurrency     := fSaldoAtual    ;
         //-------------------------------------------------------------------------------
         cdsGrpSinteticos.Next;
      end;
      cdsGrpSinteticos.Close;
      //----------------------------------------------------------------------------------
      if cdsMovPatAux.IsEmpty then
         Raise Exception.Create('Não houve movimentação com os parâmetros fornecidos!');
      //----------------------------------------------------------------------------------
      // Transferindo dados para o relatório
      //----------------------------------------------------------------------------------
      cdsMovPatAux.First;
      while not cdsMovPatAux.EOF do
      begin
         if CmpRptCM.ParamValues[6].AsBoolean or
            ((cdsMovPatAux.FieldByName('SALDOANTERIOR').AsCurrency + cdsMovPatAux.FieldByName('SALDOATUAL').AsCurrency) <> 0) then
         begin
            if (not CmpRptCM.ParamValues[7].AsBoolean) or
               (CmpRptCM.ParamValues[7].AsBoolean and (cdsMovPatAux.FieldByName('S_A').AsString = 'S')) then
            begin
               cdsMovPatGrpA.Append;
               cdsMovPatGrpA.FieldByName('IDGRUPO').AsInteger         := cdsMovPatAux.FieldByName('IDGRUPO').AsInteger;
               cdsMovPatGrpA.FieldByName('CLASSE').AsString           := cdsMovPatAux.FieldByName('CLASSE').AsString;
               cdsMovPatGrpA.FieldByName('DESCGRUPO').AsString        := cdsMovPatAux.FieldByName('DESCGRUPO').AsString;
               cdsMovPatGrpA.FieldByName('S_A').AsString              := cdsMovPatAux.FieldByName('S_A').AsString;
               cdsMovPatGrpA.FieldByName('SALDOANTERIOR').AsCurrency  := cdsMovPatAux.FieldByName('SALDOANTERIOR').AsCurrency ;
               cdsMovPatGrpA.FieldByName('VALCUSTOANT').AsCurrency    := cdsMovPatAux.FieldByName('VALCUSTOANT').AsCurrency   ;
               cdsMovPatGrpA.FieldByName('VALCUSTOAQUIS').AsCurrency  := cdsMovPatAux.FieldByName('VALCUSTOAQUIS').AsCurrency ;
               cdsMovPatGrpA.FieldByName('VALCUSTOENT').AsCurrency    := cdsMovPatAux.FieldByName('VALCUSTOENT').AsCurrency   ;
               cdsMovPatGrpA.FieldByName('VALCUSTOSAI').AsCurrency    := cdsMovPatAux.FieldByName('VALCUSTOSAI').AsCurrency   ;
               cdsMovPatGrpA.FieldByName('VALCUSTOBX').AsCurrency     := cdsMovPatAux.FieldByName('VALCUSTOBX').AsCurrency    ;
               cdsMovPatGrpA.FieldByName('VALCUSTOATUAL').AsCurrency  := cdsMovPatAux.FieldByName('VALCUSTOATUAL').AsCurrency ;
               cdsMovPatGrpA.FieldByName('VALDEPRECANT').AsCurrency   := cdsMovPatAux.FieldByName('VALDEPRECANT').AsCurrency  ;
               cdsMovPatGrpA.FieldByName('VALDEPRECAQUIS').AsCurrency := cdsMovPatAux.FieldByName('VALDEPRECAQUIS').AsCurrency;
               cdsMovPatGrpA.FieldByName('VALDEPRECENT').AsCurrency   := cdsMovPatAux.FieldByName('VALDEPRECENT').AsCurrency  ;
               cdsMovPatGrpA.FieldByName('VALDEPRECSAI').AsCurrency   := cdsMovPatAux.FieldByName('VALDEPRECSAI').AsCurrency  ;
               cdsMovPatGrpA.FieldByName('VALDEPRECBX').AsCurrency    := cdsMovPatAux.FieldByName('VALDEPRECBX').AsCurrency   ;
               cdsMovPatGrpA.FieldByName('VALDEPRECATUAL').AsCurrency := cdsMovPatAux.FieldByName('VALDEPRECATUAL').AsCurrency;
               cdsMovPatGrpA.FieldByName('SALDOATUAL').AsCurrency     := cdsMovPatAux.FieldByName('SALDOATUAL').AsCurrency    ;
               cdsMovPatGrpA.Post;
            end;
         end;
         //-------------------------------------------------------------------------------
         cdsMovPatAux.Next;
      end;
      cdsMovPatAux.Close;
      //----------------------------------------------------------------------------------
      rbdbeClasse.DisplayFormat := sMascaraGrupo;
      rbLabel80.Text := CmpRptCM.ParamValues[0].AsString;
      rbLabel82.Text := CmpRptCM.ParamValues[1].AsString;
   except
      on E : Exception do
      begin
         CMDebugToFile('Erro no Relatório MOVIMENTO PATRIMONIAL POR GRUPO - ANALÍTICA!' + #13 + #10 +
                       'Causa : ' + E.Message);
      end;
   end;
end;

procedure TRptCAFMovPatGrpA.CmpRptCMBeforeExecute(var CanExecute: Boolean);
var
   dDataUltFec : TDate;
   iDiaFim, iMesFim, iAnoFim : Word;

begin
   inherited;
   dDataUltFec := DataUltFechamento;
   DecodeDate(dDataUltFec, iAnoFim, iMesFim, iDiaFim);
   CmpRptCM.ParamValues[0].TextDefault := DateToStr(EncodeDate(iAnoFim,iMesFim,01));
   CmpRptCM.ParamValues[1].TextDefault := DateToStr(dDataUltFec);
   //-------------------------------------------------------------------------------------
   CmpRptCM.ParamValues[2].LookupSettings.SQL.Text := ' SELECT G.CLASSE, G.NOME, G.IDGRUPO '+
                                                      ' FROM GRUPO G, ' +
                                                      ' PLANOGRUPO PG ' +
                                                      ' WHERE (PG.IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) + ') ' +
                                                      '   AND (G.TIPO = ''A'') ' +
                                                      '   AND (PG.IDGRUPO = G.IDGRUPO) ' +
                                                      ' ORDER BY G.CLASSE ';
end;

procedure TRptCAFMovPatGrpA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   Application.ProcessMessages;
end;

function TRptCAFMovPatGrpA.DataUltFechamento : TDate;
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
      Result := cdsVerUltFec.FieldByName('DATAULT').AsDateTime
   else
      Result := -1;
   //-------------------------------------------------------------------------------------
   cdsVerUltFec.Close;
end;

procedure TRptCAFMovPatGrpA.ppDetailBand10BeforePrint(Sender: TObject);
begin
   inherited;
   if ppDetailBand10.Count <= 14 then
      ppLine1.Visible := True
   else
      ppLine1.Visible := False;
end;

end.
