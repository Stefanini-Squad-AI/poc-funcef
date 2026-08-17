// -----------------------------------------------------------------------------
// Pendência   : 20892
// Responsável : Daniel Simões
// Data        : 13/04/2006
// Descrição   : Adicionado o campo "DATAINICIO" na query para poder ser
//               visualizado no Report Designer...
// -----------------------------------------------------------------------------
//Atualizado por: André Tavares - pendência 17255 - 02/08/2004 - substitui o número da nota fiscal por nodocumento se nulo
//                André Tavares - pendência 17294 - Colocar os filtros Número do Documento, Valor e Data de Vencimento.
//                André Tavares - pendência 17968 - Adicionada a coluna renovação na query do relatório.
// -----------------------------------------------------------------------------
unit RExtrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, uCmRptManager,
  TXComp, CmParamReport, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls,
  ppBands, ppVar, ppStrtch, ppMemo, ppPrnabl, ppClass, ppCache, ppComm,
  ppRelatv, ppProd, ppReport, ppModule, raCodMod, ppRegion, ppSubRpt, TXRB;

type
  TRptExtrato = class(TFrmCmReport)
    spExtrato: TCMSqlParams;
    cdsExtrato: TCMClientDataSet;
    rpExtrato: TppReport;
    pplExtrato: TppBDEPipeline;
    dsExtrato: TwwDataSource;
    ppHeaderPgto: TppHeaderBand;
    ppTitPagtoRec: TppLabel;
    lblEmpresa: TppLabel;
    rpPgtoLb4: TppLabel;
    ppDetailPgto: TppDetailBand;
    rpPgtoDBT1: TppDBText;
    rpPgtoDBT5: TppDBText;
    rpPgtoDBT6: TppDBText;
    rpPgtoDBT7: TppDBText;
    ppDBText4: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppCalc7: TppSystemVariable;
    lblSistema: TppLabel;
    ppCalc8: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    rpPgtoLb1: TppLabel;
    rpPgtoLb2: TppLabel;
    ppDBText1: TppDBText;
    rpPgtoDBT2: TppDBText;
    rpPgtoLine1: TppLine;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppRegion2: TppRegion;
    ppLabel7: TppLabel;
    iTotPagoContr: TppDBCalc;
    ppLabel11: TppLabel;
    iTotContr: TppDBCalc;
    ppLabel12: TppLabel;
    iVlrSaldoContr: TppVariable;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    rpPgtoLine4: TppLine;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppRegion1: TppRegion;
    ppLabel6: TppLabel;
    iTotVlrPagoObj: TppDBCalc;
    ppLabel8: TppLabel;
    itotVlrContObj: TppDBCalc;
    ppLabel9: TppLabel;
    iVlrSaldoObj: TppVariable;
    cdsExtratoIDCONTRATO: TFloatField;
    cdsExtratoIDOBJETO: TFloatField;
    cdsExtratoIDITEM: TFloatField;
    cdsExtratoCODCONTRATOEMPR: TStringField;
    cdsExtratoNOMECONTRATO: TStringField;
    cdsExtratoDATAINICIO: TDateTimeField;
    cdsExtratoNOMEOBJETO: TStringField;
    cdsExtratoNOME_ITEM: TStringField;
    cdsExtratoVALORTOTALOBJETO: TFloatField;
    cdsExtratoDATAVENCPARCELA: TDateTimeField;
    cdsExtratoQTDEPARCELA: TFloatField;
    cdsExtratoVALOROBJPARCELA: TFloatField;
    cdsExtratoVLRMOEDACORRENTE: TFloatField;
    cdsExtratoNUMNOTAFISCAL: TStringField;
    cdsExtratoRENOVACAO: TMemoField;
    cdsExtratoOBSERVACAO: TMemoField;
    cdsExtratoCODDOCUMENTO: TFloatField;
    cdsExtratoVALORENCARGO: TFloatField;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptExtrato: TRptExtrato;

implementation

{$R *.DFM}

procedure TRptExtrato.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
   inherited;
   CmpRptCM.ParamValues[0].LookupSettings.SQL.Text := 'SELECT C.NOMECONTRATO, C.IDCONTRATO '+
                                                      '  FROM CONTRATOCONTR C, CONTRATOUSUARIO U '+
                                                      ' WHERE C.IDCONTRATO = U.IDCONTRATO '+
                                                      '   AND U.IDUSUARIO = '+ FloatToStr(CrmRptCM.IdUsuario)+
                                                      ' ORDER BY C.NOMECONTRATO';

   CmpRptCM.ParamValues[1].LookupSettings.SQL.Text := 'SELECT DISTINCT '+
                                                      '       C.IDFORCLI, P.RAZAOSOCIAL '+
                                                      '  FROM CONTRATOCONTR C, CONTRATOUSUARIO U, '+
                                                      '       PESSOA P '+
                                                      ' WHERE C.IDCONTRATO = U.IDCONTRATO '+
                                                      '   AND C.IDFORCLI = P.IDPESSOA  '+
                                                      '   AND U.IDUSUARIO = '+ FloatToStr(CrmRptCM.IdUsuario)+
                                                      ' ORDER BY P.RAZAOSOCIAL';

   CmpRptCM.ParamValues[2].LookupSettings.SQL.Text := 'SELECT DISTINCT C.CODCONTRATOEMPR '+
                                                      '  FROM CONTRATOCONTR C, CONTRATOUSUARIO U '+
                                                      ' WHERE C.IDCONTRATO=U.IDCONTRATO '+
                                                      '   AND U.IDUSUARIO = '+ FloatToStr(CrmRptCM.IdUsuario)+
                                                      ' ORDER BY C.CODCONTRATOEMPR';
end;

procedure TRptExtrato.CrmRptCMBeforePrint(Sender: TObject);
var sSql : String;

  //início - André Tavares - 09/09/2004 - pendência 17294
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
  //fim - André Tavares - 09/09/2004 - pendência 17294

begin
  inherited;
  sSql := 'SELECT OC.IDCONTRATO, '+#13+
          '       OC.IDOBJETO, '+#13+
          '       OC.IDITEM, '+#13+
          '       C.CODCONTRATOEMPR, '+#13+
          '       C.NOMECONTRATO, '+#13+
          '       C.DATAINICIO, '+#13+ // Daniel Simões - P: 20892 - 13/04/2006
          '       O.NOMEOBJETO, '+#13+
          '       I.NOME_ITEM, '+#13+
          '       OC.VALORTOTALOBJETO, '+#13+
          '       P.DATAVENCPARCELA, '+#13+
          '       P.QTDEPARCELA, '+#13+
          '       P.VALOROBJPARCELA, '+#13+
          '       P.VLRMOEDACORRENTE, '+#13+
         //início - andré tavares - pendência 17255 - 02/08/2004
          '       DECODE(P.NUMNOTAFISCAL, NULL, DECODE(D.NODOCUMENTO, NULL, '' '', D.NODOCUMENTO) || DECODE(D.COMPLDOCUMENTO, NULL, '' '', ''/'' || D.COMPLDOCUMENTO), P.NUMNOTAFISCAL) AS NUMNOTAFISCAL, '+#13+
         //fim - andré tavares - pendência 17255 - 02/08/2004
          '       C.RENOVACAO, '+#13+ //andre tavares - pendência 17968 - 10/01/2005
          '       C.OBSERVACAO, '+#13+ //andre tavares - pendência 17968 - 10/01/2005
          '       D.CODDOCUMENTO, '+#13+//andre tavares - pendência 17968 - 10/01/2005
          '       LANCTO.VALORENCARGO '+#13+//andre tavares - pendência 17968 - 10/01/2005
          '  FROM PARCELAREALCONTR P, '+#13+
          '       OBJETOSXITEMCONTR OC, '+#13+
          '       ITEMCONTRATUAL I, '+#13+
          '       OBJETOCONTRATUAL O, '+#13+
          '       CONTRATOCONTR C, '+#13+
          //início - andré tavares - pendência 17255 - 02/08/2004
          '       DOCUMENTO D, '+#13+
          //fim - andré tavares - pendência 17255 - 02/08/2004
          //inicio - andre tavares - pendência 17968 - 10/01/2005
          ' (SELECT SUM(DECODE(L.DEBCRE,''D'',DECODE(D1.RECPAG,''R'',L.VALOR,L.VALOR * -1),DECODE(D1.RECPAG,''R'',L.VALOR * -1,L.VALOR)) ) AS VALORENCARGO , '+#13+
          '         D1.CODDOCUMENTO            '+#13+
          '  FROM LANCTODOCUM L,  DOCUMENTO D1 '+#13+
          '  WHERE L.OPERACAO = 4 AND D1.CODDOCUMENTO = L.CODDOCUMENTO '+#13+
          '  GROUP BY D1.CODDOCUMENTO) LANCTO '+#13+
          //fim - andre tavares - pendência 17968 - 10/01/2005
          ' WHERE P.IDCONTRATO = OC.IDCONTRATO '+#13+
          '   AND P.IDOBJETO   = OC.IDOBJETO '+#13+
          '   AND P.IDITEM     = OC.IDITEM '+#13+
          '   AND C.IDCONTRATO = OC.IDCONTRATO '+#13+
          '   AND O.IDOBJETO   = OC.IDOBJETO '+#13+
          '   AND I.IDITEM     = OC.IDITEM '+#13+

          // Marchetti - Pendencia 16347
          // Devido ao fato do documento ainda nao ter sido gerado o
          // mesmo não pode ser ilustrado no relatório
          '  AND P.CODDOCUMENTO = D.CODDOCUMENTO '+#13+

          '  AND D.CODDOCUMENTO = LANCTO.CODDOCUMENTO(+) '+#13;  //andre tavares - pendência 17968 - 10/01/2005

      if not(CmpRptCM.ParamValues[0].IsNull) then
         sSql := sSql + '    AND C.IDCONTRATO = '+IntToStr(CmpRptCM.ParamValues[0].AsInteger)+#13;

      if not(CmpRptCM.ParamValues[1].IsNull) then
         sSql := sSql + '    AND C.IDFORCLI = '+IntToStr(CmpRptCM.ParamValues[1].AsInteger)+#13;

      if not(CmpRptCM.ParamValues[2].IsNull) then
         sSql := sSql + '    AND C.CODCONTRATOEMPR = '+QuotedStr(CmpRptCM.ParamValues[2].AsString)+#13;


      //início - André Tavares - 09/09/2004 - pendência 17294
      if trim(CmpRptCM.ParamValues[3].asString) <> '' then
      begin
         sSql := sSql + 'AND (D.NODOCUMENTO LIKE '''+ trim(CmpRptCM.ParamValues[3].asString)+ ''')';
      end;

      if trim(CmpRptCM.ParamValues[4].asString) <> '' then
      begin
         sSql := sSql + 'AND (D.COMPLDOCUMENTO LIKE '''+ trim(CmpRptCM.ParamValues[4].asString)+ ''')';
      end;

      if trim(CmpRptCM.ParamValues[5].asString) <> '0,00' then
      begin
         sSql := sSql + ' AND (P.VALOROBJPARCELA = '+ NumOracle(strToFloat(CmpRptCM.ParamValues[5].asString)) +')';
       end;

      if trim(CmpRptCM.ParamValues[6].asString) <> '' then
      begin
         sSql := sSql + ' AND (P.DATAVENCPARCELA = TO_DATE('+ quotedStr(CmpRptCM.ParamValues[6].asString) +', ''DD/MM/YYYY''))';
      end;
      //fim - André Tavares - 09/09/2004 - pendência 17294


      sSql := sSql + ' ORDER BY C.NOMECONTRATO, O.NOMEOBJETO, I.NOME_ITEM, P.DATAVENCPARCELA ';

  spExtrato.Sql.Clear;
  spExtrato.Sql.Text := sSql;
  spExtrato.Open;
end;

procedure TRptExtrato.FormCreate(Sender: TObject);
begin
  inherited;
  spExtrato.Open;
end;

end.
