//Atualizado por: André Tavares - 02/08/2004 - pendência 17256 - a query estava trazendo os documentos em duplicidade
//                André Tavares - 09/09/2004 - pendência 17295 - Colocar os filtros Número do Documento e Valor. 

unit RPgtosRecbs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, uCmRptManager,
  TXComp, CmParamReport, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls,
  ppBands, ppVar, ppStrtch, ppMemo, ppPrnabl, ppClass, ppCache, ppComm,
  ppRelatv, ppProd, ppReport, TXRB;

type
  TRptPagtosRecbs = class(TFrmCmReport)
    spPgtosRecbs: TCMSqlParams;
    cdsPgtosRecbs: TCMClientDataSet;
    rpPgtosRecbs: TppReport;
    ppHeaderPgto: TppHeaderBand;
    ppTitPagtoRec: TppLabel;
    ppLine7: TppLine;
    rpNomeEmpresaPgto: TppLabel;
    rpPgtoLb1: TppLabel;
    rpPgtoLb2: TppLabel;
    rpPgtoLb3: TppLabel;
    rpPgtoLb4: TppLabel;
    rpPgtoLb5: TppLabel;
    rpPgtoLb6: TppLabel;
    rpPgtoLb7: TppLabel;
    rpPgtoLb8: TppLabel;
    rpPgtoLb9: TppLabel;
    rpPgtoLine1: TppLine;
    rpPgtoLine4: TppLine;
    ppDetailPgto: TppDetailBand;
    rpPgtoDBT1: TppDBText;
    rpPgtoDBT2: TppDBText;
    rpPgtoDBT3: TppDBText;
    rpPgtoDBT4: TppDBText;
    rpPgtoDBT5: TppDBText;
    rpPgtoDBT6: TppDBText;
    rpPgtoDBT7: TppDBText;
    rpPgtoDBT8: TppDBText;
    rpPgtoLine2: TppLine;
    dbmObs: TppDBMemo;
    ppFooterBand4: TppFooterBand;
    lblSistema: TppLabel;
    ppLine9: TppLine;
    ppCalc7: TppSystemVariable;
    ppCalc8: TppSystemVariable;
    rpPgtoSummaryBand1: TppSummaryBand;
    rpPgtoDBCalc1: TppDBCalc;
    rpPgtoLabel1: TppLabel;
    rpPgtoLine3: TppLine;
    pplPgtosRecbs: TppBDEPipeline;
    dsPgtosRecbs: TwwDataSource;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptPagtosRecbs: TRptPagtosRecbs;

implementation

{$R *.DFM}

procedure TRptPagtosRecbs.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
   inherited;
   CmpRptCM.ParamValues[1].LookupSettings.SQL.Text := 'SELECT C.NOMECONTRATO, C.IDCONTRATO '+
                                                      '  FROM CONTRATOCONTR C, CONTRATOUSUARIO U '+
                                                      ' WHERE C.IDCONTRATO = U.IDCONTRATO '+
                                                      '   AND U.IDUSUARIO = '+ FloatToStr(CrmRptCM.IdUsuario)+
                                                      ' ORDER BY C.NOMECONTRATO';

   CmpRptCM.ParamValues[2].LookupSettings.SQL.Text := 'SELECT DISTINCT '+
                                                      '       C.IDFORCLI, P.RAZAOSOCIAL '+
                                                      '  FROM CONTRATOCONTR C, CONTRATOUSUARIO U, '+
                                                      '       PESSOA P '+
                                                      ' WHERE C.IDCONTRATO = U.IDCONTRATO '+
                                                      '   AND C.IDFORCLI = P.IDPESSOA  '+
                                                      '   AND U.IDUSUARIO = '+ FloatToStr(CrmRptCM.IdUsuario)+
                                                      ' ORDER BY P.RAZAOSOCIAL';

   CmpRptCM.ParamValues[3].LookupSettings.SQL.Text := 'SELECT DISTINCT C.CODCONTRATOEMPR '+
                                                      '  FROM CONTRATOCONTR C, CONTRATOUSUARIO U '+
                                                      ' WHERE C.IDCONTRATO=U.IDCONTRATO '+
                                                      '   AND U.IDUSUARIO = '+ FloatToStr(CrmRptCM.IdUsuario)+
                                                      ' ORDER BY C.CODCONTRATOEMPR';
end;

procedure TRptPagtosRecbs.CrmRptCMBeforePrint(Sender: TObject);

  //início - André Tavares - 09/09/2004 - pendência 17295
  function NumOracle(pNum : Double): String;
  var i : integer;
      sAux : string;
  begin
    result := '';
    sAux := floatToStr(pNum);
    for i := 1 to length(sAux) do
    begin
      if sAux[i] = ',' then
        sAux[i] := '.'
     end;
       result := sAux;
  end;
  //fim - André Tavares - 09/09/2004 - pendência 17295

begin
   inherited;
   with spPgtosRecbs.SQL do
   begin
      Clear;
      Add('SELECT  ');
      Add('   /*+FIRST_ROWS*/ ');
      //início - André Tavares - 02/08/2004 - pendência 17256
      Add('   DISTINCT '); // tem que ser com distinct mesmo
      //fim - André Tavares - 02/08/2004 - pendência 17256
      Add('   C.NOMECONTRATO, ');
      Add('   P.RAZAOSOCIAL, ');
      Add('   D.NODOCUMENTO||DECODE(D.COMPLDOCUMENTO,'''','' '',''/'')||D.COMPLDOCUMENTO AS DOC, ');
      Add('   D.DATAPROGRAMADA,L.DATALANCTO,R.NUMCHQBORDERO,D.OBS, ');
      Add('   DECODE(D.RECPAG,''P'',DECODE(L.DEBCRE,''D'',L.VALOR,(L.VALOR*-1)),'+
          'DECODE(L.DEBCRE,''C'',L.VALOR,(L.VALOR*-1))) VALOR ');
      Add('FROM ');
      Add('   CONTRATOCONTR C,');
      Add('   MEDICAO M, ');
      Add('   PARCELAMEDICAO PM, ');
      Add('   DOCUMENTO D, ');
      Add('   LANCTODOCUM L, ');
      Add('   PESSOA P, ');
      Add('   RECBTOPAGTO R ');
      Add('WHERE ');
      Add('   (C.IDCONTRATO = M.IDCONTRATO) AND ');
      Add('   (M.IDMEDICAO = PM.IDMEDICAO) AND ');
      Add('   (PM.CODDOCUMENTO = D.CODDOCUMENTO) AND ');
      Add('   (RTrim(L.OPERACAO) = ''5'') AND ');
      Add('   (D.CODDOCUMENTO = L.CODDOCUMENTO) AND ');
      Add('   (L.ESTORNO IS NULL) AND ');
      Add('   (D.IDFORCLI = P.IDPESSOA) AND ');
      Add('   (L.NUMLANCTO = R.NUMLANCTO) AND ');
      Add('   (D.IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') ');

      case CmpRptCM.ParamValues[0].AsInteger  of
         0: Add('    AND (D.RECPAG = ''P'') ');
         1: Add('    AND (D.RECPAG = ''R'') ');
      end;

      if not(CmpRptCM.ParamValues[1].IsNull) then
         Add('    AND (C.IDCONTRATO = '+IntToStr(CmpRptCM.ParamValues[1].AsInteger)+') ');

      if not(CmpRptCM.ParamValues[2].IsNull) then
         Add('    AND (C.IDFORCLI = '+IntToStr(CmpRptCM.ParamValues[2].AsInteger)+') ');

      if not(CmpRptCM.ParamValues[3].IsNull) then
         Add('    AND (RTrim(C.CODCONTRATOEMPR) = '+QuotedStr(CmpRptCM.ParamValues[3].AsString)+') ');

      if not(CmpRptCM.ParamValues[4].IsNull) then
         Add('  AND (D.DATAPROGRAMADA >= TO_DATE('''+
         FormatDateTime('dd/mm/yyyy', CmpRptCM.ParamValues[4].AsDateTime)+''',''dd/mm/yyyy'')) ');

      if not(CmpRptCM.ParamValues[5].IsNull) and
            ((CmpRptCM.ParamValues[4].AsDateTime<=CmpRptCM.ParamValues[5].AsDateTime) or
             (CmpRptCM.ParamValues[4].IsNull)) then
         Add('  AND (D.DATAPROGRAMADA <= TO_DATE('''+
         FormatDateTime('dd/mm/yyyy', CmpRptCM.ParamValues[5].AsDateTime)+''',''dd/mm/yyyy'')) ');

      //início - André Tavares - 09/09/2004 - pendência 17295
      if trim(CmpRptCM.ParamValues[6].asString) <> '' then
      begin
        Add('AND (D.NODOCUMENTO LIKE '''+ trim(CmpRptCM.ParamValues[6].asString)+ ''')');
      end;

      if trim(CmpRptCM.ParamValues[7].asString) <> '' then
      begin
        Add('AND (D.COMPLDOCUMENTO LIKE '''+ trim(CmpRptCM.ParamValues[7].asString)+ ''')');
      end;

      if trim(CmpRptCM.ParamValues[8].asString) <> '0,00' then
      begin
        Add(' AND (DECODE(D.RECPAG,''P'',DECODE(L.DEBCRE,''D'',L.VALOR,(L.VALOR*-1)), DECODE(L.DEBCRE,''C'',L.VALOR,(L.VALOR*-1))) = '+
             NumOracle(strToFloat(CmpRptCM.ParamValues[8].asString)) +')');
       end;
      //fim - André Tavares - 09/09/2004 - pendência 17295


      Add('ORDER BY D.DATAPROGRAMADA, P.RAZAOSOCIAL');
   end;
   spPgtosRecbs.Open;
end;

end.
