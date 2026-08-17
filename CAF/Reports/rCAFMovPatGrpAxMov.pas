unit rCAFMovPatGrpAxMov;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, uCMfileUtils,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc, 
  DBTables, Wwquery, uCmRptManager, TXComp, CmParamReport, uCmSqlParams,
  DBClient, uCMClientDataSet, IvDictio, IvMulti, uCtrlPadroes;

type
  TRptCAFMovPatGrpAxMov = class(TFrmCmReport)
    sqlMovPatGrpAxMov: TCMSqlParams;
    sqlGrpAnaliticos: TCMSqlParams;
    cdsGrpAnaliticos: TCMClientDataSet;
    sqlTransfPer: TCMSqlParams;
    cdsTransfPer: TCMClientDataSet;
    sqlVerUltFec: TCMSqlParams;
    cdsVerUltFec: TCMClientDataSet;
    rpMovPatGrpAxMov: TppReport;
    ppHeaderBand10: TppHeaderBand;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel77: TppLabel;
    pplbldata1: TppLabel;
    rbLabel80: TppLabel;
    rpMovPatGrpLine1: TppLine;
    rbLabel82: TppLabel;
    rpMovPatGrpLabel1: TppLabel;
    ppDetailBand10: TppDetailBand;
    rbdbeClasse: TppDBText;
    ppDBText48: TppDBText;
    ppFooterBand10: TppFooterBand;
    ppLine20: TppLine;
    ppLabel81: TppLabel;
    ppCalc19: TppSystemVariable;
    ppCalc20: TppSystemVariable;
    ppMovPatGrpAxMov: TppBDEPipeline;
    dsMovPatGrpAxMov: TwwDataSource;
    ppLabel2: TppLabel;
    sqlMovPer: TCMSqlParams;
    cdsMovPer: TCMClientDataSet;
    cdsMovPatGrpAxMov: TCMClientDataSet;
    ppLabel7: TppLabel;
    ppLine1: TppLine;
    ppLine19: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText3: TppDBText;
    ppDBText7: TppDBText;
    ppDBText9: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppLine2: TppLine;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLabel6: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel11: TppLabel;
    ppLabel1: TppLabel;
    ppLabel4: TppLabel;
    rpedSaldoAtual: TppVariable;
    rpedSaldoAnt: TppVariable;
    ppLine3: TppLine;
    cdsParamCaf: TCMClientDataSet;
    sqlParamCaf: TCMSqlParams;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ppDetailBand10BeforePrint(Sender: TObject);
    procedure ppGroupHeaderBand1AfterPrint(Sender: TObject);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
  private
    function DataUltFechamento : TDate;
    function ConvNum(fNum : Extended) : Extended;

  public
    iGrupoIni     : Integer;
    sTipoGrupo,
    sClasseGrupo,
    sMascaraGrupo : String;
    bInvestImob   : Boolean;
  end;

var
  RptCAFMovPatGrpAxMov: TRptCAFMovPatGrpAxMov;

implementation

{$R *.DFM}

procedure TRptCAFMovPatGrpAxMov.CrmRptCMBeforePrint(Sender: TObject);
var
   iAux : Integer;
   iDiaIni, iMesIni, iAnoIni,
   iDiaFim, iMesFim, iAnoFim : Word;

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
      cdsMovPatGrpAxMov.Close;
      cdsMovPatGrpAxMov.IndexFieldNames := '';
      sqlMovPatGrpAxMov.Prepare;
      sqlMovPatGrpAxMov.Open;
      //----------------------------------------------------------------------------------
      DecodeDate(CmpRptCM.ParamValues[0].AsDateTime, iAnoIni, iMesIni, iDiaIni);
      DecodeDate(CmpRptCM.ParamValues[1].AsDateTime, iAnoFim, iMesFim, iDiaFim);
      //----------------------------------------------------------------------------------
      // Registra as movimentações realizadas no periodo especificado
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[2].AsInteger <> 0 then
      begin
         if sTipoGrupo = 'S' then
         begin
            sqlMovPer.SQL.Strings[18] := ' AND (LTRIM(RTRIM(G.CLASSE)) LIKE ' + #39 + sClasseGrupo + '%' + #39 + ') ';
         end else
         begin
            sqlMovPer.SQL.Strings[18] := ' AND SB.IDGRUPO = '+IntToStr(CmpRptCM.ParamValues[2].AsInteger);
         end;
      end else
      begin
         sqlMovPer.SQL.Strings[18] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[3].AsInteger = 0 then
      begin
         sqlMovPer.SQL.Strings[19] := ' AND G.FLGIMOVEL = 0 ';
         ppLabel7.Caption := 'IMOBILIZADO';
      end else
      if CmpRptCM.ParamValues[3].AsInteger = 1 then
      begin
         sqlMovPer.SQL.Strings[19] := ' AND G.FLGIMOVEL = 1 ';
         ppLabel7.Caption := 'INVESTIMENTOS IMOBILIÁRIOS';
      end else
      begin
         sqlMovPer.SQL.Strings[19] := ' ';
         ppLabel7.Caption := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[4].AsBoolean then
      begin
         sqlMovPer.SQL.Strings[20] := ' ';
      end else
      begin
         sqlMovPer.SQL.Strings[20] := ' AND B.CONTROLE = ''T'' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[5].AsBoolean then
      begin
         sqlMovPer.SQL.Strings[21] := ' ';
      end else
      begin
         sqlMovPer.SQL.Strings[21] := ' AND B.BAIXATOTAL <> ''S'' ';
      end;
      //----------------------------------------------------------------------------------
      sqlMovPer.Prepare;
      sqlMovPer.ParamByName('IDPESSOA').AsFloat  := CrmRptCM.IdEmpresa;
      sqlMovPer.ParamByName('DATAINI').AsDate    := (EncodeDate(iAnoIni,iMesIni,iDiaIni));
      sqlMovPer.ParamByName('DATAFIM').AsDate    := (EncodeDate(iAnoFim,iMesFim,iDiaFim));
      sqlMovPer.ParamByName('MOECODIGO').AsFloat := cdsParamCAF.FieldByName('MOEDAOFICIAL').AsFloat;
      sqlMovPer.ParamByName('IDTAXADEP').AsFloat := 1;
      sqlMovPer.Open;
      //----------------------------------------------------------------------------------
      while not cdsMovPer.EOF do
      begin
         if not cdsMovPatGrpAxMov.Locate('IDGRUPO;IDTIPOMOVIMENTACAO',
                                          VarArrayOf([cdsMovPer.FieldByName('IDGRUPO').AsInteger,
                                                      cdsMovPer.FieldByName('IDTIPOMOVIMENTACAO').AsInteger]),[]) then
         begin
            cdsMovPatGrpAxMov.Append;
            cdsMovPatGrpAxMov.FieldByName('IDGRUPO').AsFloat               := cdsMovPer.FieldByName('IDGRUPO').AsFloat;
            cdsMovPatGrpAxMov.FieldByName('CLASSE').AsString               := cdsMovPer.FieldByName('CLASSE').AsString;
            cdsMovPatGrpAxMov.FieldByName('DESCGRUPO').AsString            := cdsMovPer.FieldByName('NOME').AsString;
            cdsMovPatGrpAxMov.FieldByName('IDTIPOMOVIMENTACAO').AsInteger  := cdsMovPer.FieldByName('IDTIPOMOVIMENTACAO').AsInteger;
            cdsMovPatGrpAxMov.FieldByName('DESCTIPOMOVIMENTACAO').AsString := cdsMovPer.FieldByName('DESCTIPOMOVIMENTACAO').AsString;
         end;
         //-------------------------------------------------------------------------------
         case cdsMovPatGrpAxMov.FieldByName('IDTIPOMOVIMENTACAO').AsInteger of
              01,03,08,
              32,53,54,
              09,07,10,
              15,22,34 : cdsMovPatGrpAxMov.FieldByName('VALCUSTOENT').AsCurrency := ConvNum(cdsMovPatGrpAxMov.FieldByName('VALCUSTOENT').AsCurrency + cdsMovPer.FieldByName('SOMAVALOFI').AsCurrency);
              23,13,16,
              06,20,70,
              37,25,28,
              38       : cdsMovPatGrpAxMov.FieldByName('VALCUSTOSAI').AsCurrency := ConvNum(cdsMovPatGrpAxMov.FieldByName('VALCUSTOSAI').AsCurrency + cdsMovPer.FieldByName('SOMAVALOFI').AsCurrency);
              14,18,69,
              33,35,17,
              21,19,36 : cdsMovPatGrpAxMov.FieldByName('VALDEPRECENT').AsCurrency := ConvNum(cdsMovPatGrpAxMov.FieldByName('VALDEPRECENT').AsCurrency + cdsMovPer.FieldByName('SOMAVALOFI').AsCurrency);
              24,27,71,
              39,26,29,
              40       : cdsMovPatGrpAxMov.FieldByName('VALDEPRECSAI').AsCurrency := ConvNum(cdsMovPatGrpAxMov.FieldByName('VALDEPRECSAI').AsCurrency + cdsMovPer.FieldByName('SOMAVALOFI').AsCurrency);
         end;
         //-------------------------------------------------------------------------------
         cdsMovPer.Next;
      end;
      cdsMovPer.Close;
      //----------------------------------------------------------------------------------
      // Registra as transferências
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[2].AsInteger <> 0 then
      begin
         if sTipoGrupo = 'S' then
         begin
            sqlTransfPer.SQL.Strings[29] := ' AND (LTRIM(RTRIM(G.CLASSE)) LIKE ' + #39 + sClasseGrupo + '%' + #39 + ') ';
         end else
         begin
            sqlTransfPer.SQL.Strings[29] := ' AND SC.IDGRUPO = '+IntToStr(CmpRptCM.ParamValues[2].AsInteger);
         end;
      end else
      begin
         sqlTransfPer.SQL.Strings[29] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[3].AsInteger = 0 then
      begin
         sqlTransfPer.SQL.Strings[30] := ' AND G.FLGIMOVEL = 0 ';
         ppLabel7.Caption := 'IMOBILIZADO';
      end else
      if CmpRptCM.ParamValues[3].AsInteger = 1 then
      begin
         sqlTransfPer.SQL.Strings[30] := ' AND G.FLGIMOVEL = 1 ';
         ppLabel7.Caption := 'INVESTIMENTOS IMOBILIÁRIOS';
      end else
      begin
         sqlTransfPer.SQL.Strings[30] := ' ';
         ppLabel7.Caption := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[4].AsBoolean then
      begin
         sqlTransfPer.SQL.Strings[31] := ' ';
      end else
      begin
         sqlTransfPer.SQL.Strings[31] := ' AND B.CONTROLE = ''T'' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[5].AsBoolean then
      begin
         sqlTransfPer.SQL.Strings[32] := ' ';
      end else
      begin
         sqlTransfPer.SQL.Strings[32] := ' AND B.BAIXATOTAL <> ''S'' ';
      end;
      //----------------------------------------------------------------------------------
      sqlTransfPer.Prepare;
      sqlTransfPer.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlTransfPer.ParamByName('DATAINI').AsDate := (EncodeDate(iAnoIni,iMesIni,iDiaIni));
      sqlTransfPer.ParamByName('DATAFIM').AsDate := (EncodeDate(iAnoFim,iMesFim,iDiaFim));
      sqlTransfPer.ParamByName('MOECODIGO').AsFloat := cdsParamCAF.FieldByName('MOEDAOFICIAL').AsFloat;
      sqlTransfPer.ParamByName('IDTAXADEP').AsFloat := 1;
      sqlTransfPer.Open;
      //----------------------------------------------------------------------------------
      while not cdsTransfPer.EOF do
      begin
         if not cdsMovPatGrpAxMov.Locate('IDGRUPO;IDTIPOMOVIMENTACAO',
                                    VarArrayOf([cdsTransfPer.FieldByName('IDGRUPO').AsInteger, 05]),[]) then
         begin
            cdsMovPatGrpAxMov.Append;
            cdsMovPatGrpAxMov.FieldByName('IDGRUPO').AsFloat               := cdsTransfPer.FieldByName('IDGRUPO').AsFloat;
            cdsMovPatGrpAxMov.FieldByName('CLASSE').AsString               := cdsTransfPer.FieldByName('CLASSE').AsString;
            cdsMovPatGrpAxMov.FieldByName('DESCGRUPO').AsString            := cdsTransfPer.FieldByName('DESCGRUPO').AsString;
            cdsMovPatGrpAxMov.FieldByName('IDTIPOMOVIMENTACAO').AsInteger  := 05;
            cdsMovPatGrpAxMov.FieldByName('DESCTIPOMOVIMENTACAO').AsString := 'TRANSFERÊNCIA DE GRUPO';
            cdsMovPatGrpAxMov.FieldByName('VALCUSTOENT').AsCurrency        := ConvNum(cdsMovPatGrpAxMov.FieldByName('VALCUSTOENT').AsCurrency + cdsTransfPer.FieldByName('VALORG').AsCurrency);
            cdsMovPatGrpAxMov.FieldByName('VALDEPRECENT').AsCurrency       := ConvNum(cdsMovPatGrpAxMov.FieldByName('VALDEPRECENT').AsCurrency + cdsTransfPer.FieldByName('DEPLANC').AsCurrency);
            cdsMovPatGrpAxMov.Post;
         end else
         begin
            cdsMovPatGrpAxMov.Edit;
            cdsMovPatGrpAxMov.FieldByName('VALCUSTOENT').AsCurrency  := ConvNum(cdsMovPatGrpAxMov.FieldByName('VALCUSTOENT').AsCurrency + cdsTransfPer.FieldByName('VALORG').AsCurrency);
            cdsMovPatGrpAxMov.FieldByName('VALDEPRECENT').AsCurrency := ConvNum(cdsMovPatGrpAxMov.FieldByName('VALDEPRECENT').AsCurrency + cdsTransfPer.FieldByName('DEPLANC').AsCurrency);
            cdsMovPatGrpAxMov.Post;
         end;
         //-------------------------------------------------------------------------------
         if not cdsMovPatGrpAxMov.Locate('IDGRUPO;IDTIPOMOVIMENTACAO',
                                    VarArrayOf([cdsTransfPer.FieldByName('IDGRUPANT').AsInteger, 05]),[]) then
         begin
            cdsMovPatGrpAxMov.Append;
            cdsMovPatGrpAxMov.FieldByName('IDGRUPO').AsFloat               := cdsTransfPer.FieldByName('IDGRUPANT').AsFloat;
            cdsMovPatGrpAxMov.FieldByName('CLASSE').AsString               := cdsTransfPer.FieldByName('CLASSEANT').AsString;
            cdsMovPatGrpAxMov.FieldByName('DESCGRUPO').AsString            := cdsTransfPer.FieldByName('DESCGRUPOANT').AsString;
            cdsMovPatGrpAxMov.FieldByName('IDTIPOMOVIMENTACAO').AsInteger  := 05;
            cdsMovPatGrpAxMov.FieldByName('DESCTIPOMOVIMENTACAO').AsString := 'TRANSFERÊNCIA DE GRUPO';
            cdsMovPatGrpAxMov.FieldByName('VALCUSTOSAI').AsCurrency        := ConvNum(cdsMovPatGrpAxMov.FieldByName('VALCUSTOSAI').AsCurrency  + cdsTransfPer.FieldByName('VALORG').AsCurrency);
            cdsMovPatGrpAxMov.FieldByName('VALDEPRECSAI').AsCurrency       := ConvNum(cdsMovPatGrpAxMov.FieldByName('VALDEPRECSAI').AsCurrency + cdsTransfPer.FieldByName('DEPLANC').AsCurrency);
            cdsMovPatGrpAxMov.Post;
         end else
         begin
            cdsMovPatGrpAxMov.Edit;
            cdsMovPatGrpAxMov.FieldByName('VALCUSTOSAI').AsCurrency  := ConvNum(cdsMovPatGrpAxMov.FieldByName('VALCUSTOSAI').AsCurrency  + cdsTransfPer.FieldByName('VALORG').AsCurrency);
            cdsMovPatGrpAxMov.FieldByName('VALDEPRECSAI').AsCurrency := ConvNum(cdsMovPatGrpAxMov.FieldByName('VALDEPRECSAI').AsCurrency + cdsTransfPer.FieldByName('DEPLANC').AsCurrency);
            cdsMovPatGrpAxMov.Post;
         end;
         //-------------------------------------------------------------------------------
         cdsTransfPer.Next;
      end;
      cdsTransfPer.Close;
      //----------------------------------------------------------------------------------
      // Processa os saldos anteriores
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[2].AsInteger <> 0 then
      begin
         if sTipoGrupo = 'S' then
         begin
            sqlGrpAnaliticos.SQL.Strings[29] := ' AND (LTRIM(RTRIM(G.CLASSE)) LIKE ' + #39 + sClasseGrupo + '%' + #39 + ') ';
         end else
         begin
            sqlGrpAnaliticos.SQL.Strings[29] := ' AND SCB1.IDGRUPO = '+IntToStr(CmpRptCM.ParamValues[2].AsInteger);
         end;
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[29] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[3].AsInteger = 0 then
      begin
         sqlGrpAnaliticos.SQL.Strings[30] := ' AND G.FLGIMOVEL = 0 ';
         ppLabel7.Caption := 'IMOBILIZADO';
      end else
      if CmpRptCM.ParamValues[3].AsInteger = 1 then
      begin
         sqlGrpAnaliticos.SQL.Strings[30] := ' AND G.FLGIMOVEL = 1 ';
         ppLabel7.Caption := 'INVESTIMENTOS IMOBILIÁRIOS';
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[30] := ' ';
         ppLabel7.Caption := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[4].AsBoolean then
      begin
         sqlGrpAnaliticos.SQL.Strings[31] := ' ';
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[31] := ' AND B.CONTROLE = ''T'' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[5].AsBoolean then
      begin
         sqlGrpAnaliticos.SQL.Strings[32] := ' ';
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[32] := ' AND B.BAIXATOTAL <> ''S'' ';
      end;
      //----------------------------------------------------------------------------------
      sqlGrpAnaliticos.Prepare;
      sqlGrpAnaliticos.ParamByName('IDPESSOA').AsFloat  := CrmRptCM.IdEmpresa;
      sqlGrpAnaliticos.ParamByName('DATASLD').AsDate    := (EncodeDate(iAnoIni,iMesIni,iDiaIni) - 1);
      sqlGrpAnaliticos.ParamByName('MOECODIGO').AsFloat := cdsParamCAF.FieldByName('MOEDAOFICIAL').AsFloat;
      sqlGrpAnaliticos.ParamByName('IDTAXADEP').AsFloat := 1;
      sqlGrpAnaliticos.Open;
      //----------------------------------------------------------------------------------
      while not cdsGrpAnaliticos.EOF do
      begin
         if cdsMovPatGrpAxMov.Locate('IDGRUPO',cdsGrpAnaliticos.FieldByName('IDGRUPO').AsInteger,[]) then
         begin
            while (not cdsGrpAnaliticos.EOF) and (cdsGrpAnaliticos.FieldByName('IDGRUPO').AsInteger = cdsMovPatGrpAxMov.FieldByName('IDGRUPO').AsInteger) do
            begin
               cdsMovPatGrpAxMov.Edit;
               cdsMovPatGrpAxMov.FieldByName('SALDOANTERIOR').AsCurrency := cdsGrpAnaliticos.FieldByName('VALCTB0').AsCurrency;
               cdsMovPatGrpAxMov.FieldByName('VALCUSTOANT').AsCurrency   := cdsGrpAnaliticos.FieldByName('VALORG0').AsCurrency;
               cdsMovPatGrpAxMov.FieldByName('VALDEPRECANT').AsCurrency  := cdsGrpAnaliticos.FieldByName('DEPLANC0').AsCurrency;
               cdsMovPatGrpAxMov.Post;
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
      // Processa os saldos atuais
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[2].AsInteger <> 0 then
      begin
         if sTipoGrupo = 'S' then
         begin
            sqlGrpAnaliticos.SQL.Strings[29] := ' AND (LTRIM(RTRIM(G.CLASSE)) LIKE ' + #39 + sClasseGrupo + '%' + #39 + ') ';
         end else
         begin
            sqlGrpAnaliticos.SQL.Strings[29] := ' AND SCB1.IDGRUPO = '+IntToStr(CmpRptCM.ParamValues[2].AsInteger);
         end;
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[29] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[3].AsInteger = 0 then
      begin
         sqlGrpAnaliticos.SQL.Strings[30] := ' AND G.FLGIMOVEL = 0 ';
         ppLabel7.Caption := 'IMOBILIZADO';
      end else
      if CmpRptCM.ParamValues[3].AsInteger = 1 then
      begin
         sqlGrpAnaliticos.SQL.Strings[30] := ' AND G.FLGIMOVEL = 1 ';
         ppLabel7.Caption := 'INVESTIMENTOS IMOBILIÁRIOS';
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[30] := ' ';
         ppLabel7.Caption := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[4].AsBoolean then
      begin
         sqlGrpAnaliticos.SQL.Strings[31] := ' ';
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[31] := ' AND B.CONTROLE = ''T'' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[5].AsBoolean then
      begin
         sqlGrpAnaliticos.SQL.Strings[32] := ' ';
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[32] := ' AND B.BAIXATOTAL <> ''S'' ';
      end;
      //----------------------------------------------------------------------------------
      sqlGrpAnaliticos.Prepare;
      sqlGrpAnaliticos.ParamByName('IDPESSOA').AsFloat  := CrmRptCM.IdEmpresa;
      sqlGrpAnaliticos.ParamByName('DATASLD').AsDate    := EncodeDate(iAnoFim,iMesFim,iDiaFim);
      sqlGrpAnaliticos.ParamByName('MOECODIGO').AsFloat := cdsParamCAF.FieldByName('MOEDAOFICIAL').AsFloat;
      sqlGrpAnaliticos.ParamByName('IDTAXADEP').AsFloat := 1;
      sqlGrpAnaliticos.Open;
      //----------------------------------------------------------------------------------
      while not cdsGrpAnaliticos.EOF do
      begin
         if cdsMovPatGrpAxMov.Locate('IDGRUPO',cdsGrpAnaliticos.FieldByName('IDGRUPO').AsInteger,[]) then
         begin
            while (not cdsGrpAnaliticos.EOF) and (cdsGrpAnaliticos.FieldByName('IDGRUPO').AsInteger = cdsMovPatGrpAxMov.FieldByName('IDGRUPO').AsInteger) do
            begin
               cdsMovPatGrpAxMov.Edit;
               cdsMovPatGrpAxMov.FieldByName('VALCUSTOATUAL').AsCurrency  := cdsGrpAnaliticos.FieldByName('VALORG0').AsCurrency;
               cdsMovPatGrpAxMov.FieldByName('VALDEPRECATUAL').AsCurrency := cdsGrpAnaliticos.FieldByName('DEPLANC0').AsCurrency;
               cdsMovPatGrpAxMov.FieldByName('SALDOATUAL').AsCurrency     := cdsGrpAnaliticos.FieldByName('VALCTB0').AsCurrency;
               cdsMovPatGrpAxMov.Post;
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
      if cdsMovPatGrpAxMov.IsEmpty then
         Raise Exception.Create('Não houve movimentação com os parâmetros fornecidos!');
      //----------------------------------------------------------------------------------
      // Classificando ...
      //----------------------------------------------------------------------------------
      cdsMovPatGrpAxMov.IndexFieldNames := 'CLASSE;IDTIPOMOVIMENTACAO';
      cdsMovPatGrpAxMov.First;
      //----------------------------------------------------------------------------------
      rbdbeClasse.DisplayFormat := sMascaraGrupo;
      rbLabel80.Text := CmpRptCM.ParamValues[0].AsString;
      rbLabel82.Text := CmpRptCM.ParamValues[1].AsString;
   except
      on E : Exception do
      begin
         CMDebugToFile('MOVIMENTO PATRIMONIAL POR GRUPO x MOVIMENTO!' + #13 + #10 + E.Message);
      end;
   end;
end;

procedure TRptCAFMovPatGrpAxMov.ppGroupHeaderBand1AfterPrint(Sender: TObject);
begin
   inherited;
   rpedSaldoAnt.AsCurrency   := cdsMovPatGrpAxMov.FieldByName('SALDOANTERIOR').AsCurrency;
   rpedSaldoAtual.AsCurrency := cdsMovPatGrpAxMov.FieldByName('SALDOATUAL').AsCurrency;
end;

procedure TRptCAFMovPatGrpAxMov.CmpRptCMBeforeExecute(var CanExecute: Boolean);
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
   CmpRptCM.ParamValues[2].LookupSettings.SQL.Text := ' SELECT G.CLASSE, G.NOME, G.IDGRUPO, G.TIPO '+
                                                      ' FROM GRUPO G, ' +
                                                      '      PLANOGRUPO PG ' +
                                                      ' WHERE PG.IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                      '   AND G.INATIVO = 0 ' +
                                                      '   AND PG.IDGRUPO = G.IDGRUPO ' +
                                                      ' ORDER BY G.CLASSE ';
end;

procedure TRptCAFMovPatGrpAxMov.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   Application.ProcessMessages;
end;

function TRptCAFMovPatGrpAxMov.DataUltFechamento : TDate;
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
   sqlVerUltFec.ParamByName('PIDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
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

function TRptCAFMovPatGrpAxMov.ConvNum(fNum : Extended) : Extended;
begin
   Result := strtofloat(Format('%20.5f',[fNum]));
end;

procedure TRptCAFMovPatGrpAxMov.ppDetailBand10BeforePrint(Sender: TObject);
begin
   inherited;
   if ppDetailBand10.Count <= 14 then
      ppLine1.Visible := True
   else
      ppLine1.Visible := False;
end;

procedure TRptCAFMovPatGrpAxMov.CmpRptCMParamControlExit(Sender: TPainelControles; Index: Integer);
begin
   inherited;
   if Index = 2 then
   begin
      sTipoGrupo := Sender.CdsDisplay.FieldByName('TIPO').AsString;
      sClasseGrupo := trim(Sender.CdsDisplay.FieldByName('CLASSE').AsString);
   end;
   // Sender.CtrlLookup.Text;
end;

end.
