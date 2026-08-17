unit dRelInvestImob;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppCtrls, ppBands, ppPrnabl, ppClass, ppProd, ppReport, Db,
  DBTables, Wwquery, Wwdatsrc, ppComm, ppCache, ppDB, ppDBBDE, ppStrtch,
  ppMemo, ppVar, ppRelatv, ppDBPipe;

type
  TdtmRelInvestImob = class(TdtmReports)
    qryQuadroImoveis: TwwQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    dsQuadroImoveis: TwwDataSource;
    pplQuadroImoveis: TppBDEPipeline;
    rptQuadroImoveis: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText2: TppDBText;
    ppReport1DBMemo1: TppDBMemo;
    ppReport1DBText1: TppDBText;
    ppReport1DBMemo2: TppDBMemo;
    ppReport1DBText2: TppDBText;
    rptQuadroImoveis_Separador: TppLine;
    rptQuadroImoveisDBText1: TppDBText;
    rptQuadroImoveisLabel2: TppLabel;
    ppFooterBand2: TppFooterBand;
    ppCalc3: TppSystemVariable;
    ppLine1: TppLine;
    ppLabel7: TppLabel;
    ppCalc4: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLine3: TppLine;
    ppLabel8: TppLabel;
    ppDBText5: TppDBText;
    rptQuadroImoveis_LinhaTitulo: TppLine;
    ppDBText6: TppDBText;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppReport1Label1: TppLabel;
    ppReport1Label3: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    qryQuadroImoveisNOMEMESTRE: TStringField;
    rptQuadroImoveisDBText2: TppDBText;
    rptQuadroImoveisLabel3: TppLabel;
    rptQuadroImoveisLabel4: TppLabel;
    rptQuadroImoveisLabel5: TppLabel;
    rptQuadroImoveisLabel6: TppLabel;
    rptQuadroImoveisDBText3: TppDBText;
    rptQuadroImoveisLine2: TppLine;
    rptQuadroImoveisShape1: TppShape;
    rptQuadroImoveisLabel7: TppLabel;
    rptQuadroImoveisDBCalc1: TppDBCalc;
    rptQuadroImoveisDBCalc3: TppDBCalc;
    rptQuadroImoveisDBCalc2: TppDBCalc;
    rptQuadroImoveisDBCalc4: TppDBCalc;
    rptQuadroImoveisLabel8: TppLabel;
    rptQuadroImoveisLabel9: TppLabel;
    rptQuadroImoveisLabel10: TppLabel;
    rptQuadroImoveisLabel11: TppLabel;
    rptQuadroImoveisLabel12: TppLabel;
    rptQuadroImoveisLabel13: TppLabel;
    rptQuadroImoveisDBCalc5: TppDBCalc;
    rptQuadroImoveisDBText4: TppDBText;
    rptQuadroImoveisLabel14: TppLabel;
    qryQuadroImoveisDataReferencia: TDateTimeField;
    qryListagemImovel: TwwQuery;
    StringField15: TStringField;
    StringField18: TStringField;
    DateTimeField5: TDateTimeField;
    dsListagemImovel: TwwDataSource;
    pplListagemImovel: TppBDEPipeline;
    rptListagemImovel: TppReport;
    ppHeaderBand14: TppHeaderBand;
    ppLabel129: TppLabel;
    ppLabel130: TppLabel;
    ppLabel131: TppLabel;
    rptListagemImovel_lblDataContabil: TppLabel;
    rptListagemImovel_bndImovel: TppDetailBand;
    ppDBText48: TppDBText;
    ppDBMemo16: TppDBMemo;
    ppDBText50: TppDBText;
    ppLine40: TppLine;
    ppFooterBand14: TppFooterBand;
    ppLine41: TppLine;
    ppLabel136: TppLabel;
    ppGroup11: TppGroup;
    ppGroupHeaderBand11: TppGroupHeaderBand;
    ppLine42: TppLine;
    ppLabel137: TppLabel;
    ppDBText58: TppDBText;
    ppLine43: TppLine;
    ppDBText59: TppDBText;
    ppLabel138: TppLabel;
    ppLabel142: TppLabel;
    ppLabel143: TppLabel;
    ppGroupFooterBand11: TppGroupFooterBand;
    ppShape3: TppShape;
    ppLine44: TppLine;
    ppLabel150: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    rptListagemImovelLabel1: TppLabel;
    rptListagemImovelDBText1: TppDBText;
    rptListagemImovelLabel2: TppLabel;
    qryListagemImovelIDMESTRE: TFloatField;
    qryListagemImovelNOMEMESTRE: TStringField;
    qryListagemImovelIMONUMERO: TStringField;
    qryListagemImovelIMOBAIRRO: TStringField;
    qryListagemImovelIMOCEP: TStringField;
    qryListagemImovelNOMEIMOVEL: TStringField;
    qryListagemImovelIMOMATRICULA: TStringField;
    qryListagemImovelFLGSTATUSOCUPACAO: TStringField;
    qryListagemImovelIDIMOVEL: TFloatField;
    qryListagemImovelIMOAREA: TFloatField;
    qryListagemImovelTIPO_IMOVEL: TStringField;
    qryListagemImovelOCUPACAO_IMOVEL: TStringField;
    qryContratoXImovel: TwwQuery;
    qryContratoXImovelIDCONTRATOIMOVEL: TFloatField;
    qryContratoXImovelIDIMOVEL: TFloatField;
    qryContratoXImovelFLGRATEIO: TFloatField;
    qryContratoXImovelCIMPERCENTRATEIO: TFloatField;
    qryContratoXImovelCIMDESCRICAO: TStringField;
    rptListagemImovelDBText4: TppDBText;
    rptListagemImovelDBText5: TppDBText;
    rptListagemImovelLabel3: TppLabel;
    rptListagemImovelLabel4: TppLabel;
    rptListagemImovelDBText6: TppDBText;
    rptListagemImovelLabel5: TppLabel;
    rptListagemImovelLabel9: TppLabel;
    rptListagemImovelLine1: TppLine;
    rptListagemImovelDBMemo1: TppDBMemo;
    rptListagemImovelDBMemo2: TppDBMemo;
    rptListagemImovelDBMemo3: TppDBMemo;
    qryListagemImovelIMOVLRCOMPRA: TFloatField;
    qryListagemImovelIMODATACOMPRA: TDateTimeField;
    qryListagemImovelIMOMOEDACOMPRA: TFloatField;
    qryListagemImovelMOEDA_COMPRA: TStringField;
    qryListagemImovelCARTEIRA_INVESTIMENTO: TStringField;
    rptListagemImovelLabel6: TppLabel;
    qryListagemProposta: TwwQuery;
    dsListagemProposta: TwwDataSource;
    pplListagemProposta: TppBDEPipeline;
    rptListagemProposta: TppReport;
    ppHeaderBand27: TppHeaderBand;
    ppLabel268: TppLabel;
    ppLabel272: TppLabel;
    ppDetailBand27: TppDetailBand;
    ppDBText108: TppDBText;
    ppLabel281: TppLabel;
    ppLabel283: TppLabel;
    ppLabel284: TppLabel;
    ppDBText115: TppDBText;
    ppLabel294: TppLabel;
    ppFooterBand27: TppFooterBand;
    ppLine99: TppLine;
    ppLabel299: TppLabel;
    rptListagemPropostaLabel1: TppLabel;
    rptListagemPropostaLabel2: TppLabel;
    rptListagemPropostaDBText1: TppDBText;
    rptListagemPropostaDBText2: TppDBText;
    rptListagemPropostaLabel4: TppLabel;
    rptListagemPropostaLine1: TppLine;
    rptListagemPropostaDBText3: TppDBText;
    rptListagemPropostaDBText4: TppDBText;
    qryListagemPropostaIDPROPOSTA: TFloatField;
    qryListagemPropostaIDEMPRESAPROP: TFloatField;
    qryListagemPropostaPRODATA: TDateTimeField;
    qryListagemPropostaPRONOME: TStringField;
    qryListagemPropostaPRODESCRICAO: TMemoField;
    qryListagemPropostaPROVLROM: TFloatField;
    qryListagemPropostaPROVLR: TFloatField;
    qryListagemPropostaPROTIR: TFloatField;
    qryListagemPropostaPROPAYBACK: TFloatField;
    qryListagemPropostaPROCONDICOES: TMemoField;
    qryListagemPropostaPROAPRESENTADA: TStringField;
    qryListagemPropostaPRONUMERO: TStringField;
    qryListagemPropostaNF_PROPRIETARIO: TStringField;
    qryListagemPropostaRS_PROPRIETARIO: TStringField;
    qryListagemPropostaNF_RESPONSAVEL: TStringField;
    qryListagemPropostaTIPO_IMOVEL: TStringField;
    qryListagemPropostaMOESIGLA: TStringField;
    rptListagemPropostaLabel5: TppLabel;
    rptListagemPropostaLabel6: TppLabel;
    rptListagemPropostaDBText5: TppDBText;
    rptListagemPropostaLabel7: TppLabel;
    rptListagemPropostaDBText6: TppDBText;
    rptListagemPropostaDBText7: TppDBText;
    qryListagemPropostaCOMPLETO_PROPRIETARIO: TStringField;
    rptListagemPropostaLabel3: TppLabel;
    rptListagemPropostaDBText8: TppDBText;
    rptListagemPropostaDBText9: TppDBText;
    rptListagemPropostaLabel8: TppLabel;
    rptListagemPropostaLine2: TppLine;
    rptListagemPropostaShape1: TppShape;
    rptListagemPropostaLabel9: TppLabel;
    rptListagemPropostaLabel10: TppLabel;
    rptListagemPropostalblDataIni: TppLabel;
    rptListagemPropostalblDataFim: TppLabel;
    rptListagemPropostaLabel13: TppLabel;
    rptListagemPropostalblSegmento: TppLabel;
    qryListagemImovelCUSTO_CONTABIL: TFloatField;
    rptQuadroImoveis_FundoBandaDetalhe: TppShape;
    rptQuadroImoveis_lblDataContabil: TppLabel;
    qryQuadroImoveisIMONUMERO: TStringField;
    qryQuadroImoveisIMOBAIRRO: TStringField;
    qryQuadroImoveisIMOCEP: TStringField;
    qryQuadroImoveisNOMEIMOVEL: TStringField;
    qryQuadroImoveisIDMESTRE: TFloatField;
    qryQuadroImoveisFLGSTATUSOCUPACAO: TStringField;
    qryQuadroImoveisIDIMOVEL: TFloatField;
    qryQuadroImoveisIMOAREAGERENCIAL: TFloatField;
    qryQuadroImoveisIDCONTRATOIMOVEL: TFloatField;
    qryQuadroImoveisCONDATAINICIO: TDateTimeField;
    qryQuadroImoveisCONDATAFIM: TDateTimeField;
    qryQuadroImoveisLOCATARIO: TStringField;
    qryQuadroImoveisSUMVALCTB: TFloatField;
    qryQuadroImoveisSUMVALCTBIMOB: TFloatField;
    qryQuadroImoveisC_CONTABIL: TFloatField;
    qryQuadroImoveisALUGUEL: TFloatField;
    qryQuadroImoveisAREA_OCUPADA: TFloatField;
    qryQuadroImoveisALUGUELM2: TFloatField;
    qryListagemImovelIMOLOGRADOURO: TStringField;
    qryQuadroImoveisIMOLOGRADOURO: TStringField;
    rptListagemPropostalblStatus: TppLabel;
    qryListagemImovelIMOVLRREAVAL: TFloatField;
    qryListagemImovelIMODATAREAVAL: TDateTimeField;
    qryListagemImovelIMOMOEDAREAVAL: TFloatField;
    qryListagemImovelIMOVLRMERCADO: TFloatField;
    qryListagemImovelIMODATAMERCADO: TDateTimeField;
    qryListagemImovelIMOMOEDAMERCADO: TFloatField;
    qryListagemImovelIMOCODIGO: TStringField;
    rptListagemImovelLabel7: TppLabel;
    rptListagemImovelDBMemo4: TppDBMemo;
    rptListagemImovelLabel8: TppLabel;
    rptListagemImovelDBCalc1: TppDBCalc;
    ppCalc52: TppSystemVariable;
    ppCalc53: TppSystemVariable;
    ppCalc27: TppSystemVariable;
    ppCalc28: TppSystemVariable;
    qryQuadroImoveisDSC_CIDADE: TStringField;
    qryQuadroImoveisDSC_UF: TStringField;

    // procedimentos definidos

    // outros procedimentos
    procedure qryQuadroImoveisCalcFields(DataSet: TDataSet);
    procedure rptListagemImovel_bndImovelBeforeGenerate(Sender: TObject);
    procedure rptListagemImovel_bndImovelBeforePrint(Sender: TObject);
    procedure rptQuadroImoveis_LinhaTituloPrint(Sender: TObject);


  private { Private declarations }
    function MostraParam(Form: string): boolean; override;

  public { Public declarations }
    bCustoContabil, bVlrCorrigido   : boolean;
    bAluguel                        : boolean;
    bArea, bAquisicao, bContabil    : boolean;

    // variáveis de impressão
    bLinhaFina, bSeparador, bCorLinha  : boolean;
    CorLinha, CorAtual                 : TColor;


    iAnoAlugueisEventos    : integer;
    dDataCustoContabil     : TDateTime;
    dDataIni, dDataFim     : TDateTime;
    iMesCompetencia        : word;
    iAnoCompetencia        : word;
    fFatorAtuarial         : double;
    iIndiceCorrecao        : integer;

  end;



var
  dtmRelInvestImob: TdtmRelInvestImob;



implementation
{$R *.DFM}
uses
   uSistema, uDiasInUteis, uIntegraBack,

   cRelListagemProposta;



function TdtmRelInvestImob.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios
   if (LowerCase(Form) = 'cfglistagemproposta') then begin
      frm := TcfgRelListagemProposta.Create(Application);
   end else begin
      frm := nil;
   end;

   if frm = nil then begin
      Result := False;
      Exit;
   end;

   with frm do begin
      Result := (ShowModal = mrOk);
      Free;
   end;
end;



procedure TdtmRelInvestImob.qryQuadroImoveisCalcFields(DataSet: TDataSet);
begin
   with qryQuadroImoveis do begin

      FieldByName('DataReferencia').asDateTime := dDataCustoContabil;

      FieldByName('ENDERECOEXTENSO').asString :=
      FieldByName('IMOLOGRADOURO').asString + ' ' +
      FieldByName('IMONUMERO').asString + ' - ' +
      FieldByName('IMOBAIRRO').asString + ' - ' +
      FieldByName('DSC_CIDADE').asString + ' - ' +
      FieldByName('DSC_UF').asString + ' - CEP ' +
      FieldByName('IMOCEP').asString;
   end;
end;



procedure TdtmRelInvestImob.rptListagemImovel_bndImovelBeforeGenerate(Sender: TObject);
begin
   inherited;

   // se só forem para ser exibidos os imóveis com área
   if bArea       then rptListagemImovel_bndImovel.Visible := qryListagemImovelIMOAREA.AsFloat > 0;

   // se só forem para ser exibidos os imóveis com valor de aquisição (e já não estiver invisível...)
   if rptListagemImovel_bndImovel.Visible then
   if bAquisicao  then rptListagemImovel_bndImovel.Visible := qryListagemImovelIMOAREA.AsFloat > 0;

   // se só forem para ser exibidos os imóveis com custo contábil (e já não estiver invisível...)
   if rptListagemImovel_bndImovel.Visible then
   if bContabil   then rptListagemImovel_bndImovel.Visible := qryListagemImovelCUSTO_CONTABIL.AsFloat > 0;
end;



procedure TdtmRelInvestImob.rptListagemImovel_bndImovelBeforePrint(Sender: TObject);
begin
   inherited;

   // se só forem para ser exibidos os imóveis com área
   if bArea       then rptListagemImovel_bndImovel.Visible := qryListagemImovelIMOAREA.AsFloat > 0;

   // se só forem para ser exibidos os imóveis com valor de aquisição (e já não estiver invisível...)
   if rptListagemImovel_bndImovel.Visible then
   if bAquisicao  then rptListagemImovel_bndImovel.Visible := qryListagemImovelIMOAREA.AsFloat > 0;

   // se só forem para ser exibidos os imóveis com custo contábil (e já não estiver invisível...)
   if rptListagemImovel_bndImovel.Visible then
   if bContabil   then rptListagemImovel_bndImovel.Visible := qryListagemImovelCUSTO_CONTABIL.AsFloat > 0;
end;



procedure TdtmRelInvestImob.rptQuadroImoveis_LinhaTituloPrint(Sender: TObject);
begin
   inherited;

   if bSeparador then begin
      rptQuadroImoveis_LinhaTitulo.Top := 67;
   end else begin
      rptQuadroImoveis_LinhaTitulo.Top := 66;
   end;
end;



end.
