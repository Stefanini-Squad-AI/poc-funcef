unit RRubSalariaisDadosPrinc;

{***************************************************************************************
Nº SOL....: 191668
Nº KINTANA: 1820235
Data da Alteração: 25/11/2014
Alteração  : qryRubSal.sql, CrmRptCMBeforePrint (inclusão da View VW_RUBXEVENTO)
Responsável: Edilaine
Descrição:  Trocar o tipo de cadastro de radio group para grid na aba "Incidência de
            Eventos" do cadastro de rubricas salariais
****************************************************************************************}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, TXRB, CmParamReport, ppCtrls, ppVar,
  ppPrnabl, ppClass, ppBands, ppCache, Db, DBTables, Wwquery, Wwdatsrc,
  ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd, ppReport,
  uSistema;

type
  TRptRubSalariaisDadosPrinc = class(TFrmCmReport)
    rpRubSalDadosPrinc: TppReport;
    ppRubSalDadosPrinc: TppBDEPipeline;
    dsRubSal: TwwDataSource;
    qryRubSal: TwwQuery;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel69: TppLabel;
    rpRelPensAlimDBText1: TppDBText;
    rpRelPensAlimDBImage1: TppDBImage;
    rpBenConcedDBText3: TppDBText;
    rpBenConcedDBText4: TppDBText;
    ppDBText1: TppDBText;
    ppCalc18: TppSystemVariable;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLine4: TppLine;
    ppShape1: TppShape;
    ppCalc17: TppSystemVariable;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    dbCodProvDesc: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppFundacao: TppBDEPipeline;
    ppFundacaoppField1: TppField;
    ppFundacaoppField2: TppField;
    ppFundacaoppField3: TppField;
    ppFundacaoppField4: TppField;
    ppFundacaoppField5: TppField;
    ppFundacaoppField6: TppField;
    ppFundacaoppField7: TppField;
    ppFundacaoppField8: TppField;
    ppFundacaoppField9: TppField;
    ppFundacaoppField10: TppField;
    ppFundacaoppField11: TppField;
    ppFundacaoppField12: TppField;
    dsFundacao: TwwDataSource;
    qryFundacao: TwwQuery;
    qryFundacaoBLOCO1: TStringField;
    qryFundacaoBLOCO2: TMemoField;
    qryFundacaoCNPJ: TStringField;
    qryFundacaoIMAGEM: TBlobField;
    qryFundacaoRAZAOSOCIAL: TStringField;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptRubSalariaisDadosPrinc: TRptRubSalariaisDadosPrinc;

implementation

{$R *.DFM}

procedure TRptRubSalariaisDadosPrinc.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  qryFundacao.Open;

  qryRubSal.Sql.Clear;
  qryRubSal.Sql.Add('SELECT DISTINCT');
  qryRubSal.Sql.Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ')  AS EMPRESA,');
  qryRubSal.Sql.Add('  PD.IDPROVENTO,');
  qryRubSal.Sql.Add('  RP.CODPROVDESC AS COD_RUBRICA,');
  qryRubSal.Sql.Add('  PD.DESCRICAO AS NOME_RUBRICA,');
  qryRubSal.Sql.Add('  DECODE(PD.FLGDESCONTO,0,''Provento'',1,''Desconto'',''Outro'') AS TIPO,');
  qryRubSal.Sql.Add('  R1.NOMEREGRA AS REGRA,');
  qryRubSal.Sql.Add('  PD.NUMPRIORIDADE,');

  // INICIO - edilaine - SOL 191668 / KTN 1820235 (substituição do alias PD. por  RXE.)
  qryRubSal.Sql.Add('  DECODE(RXE.FLGDECIMOTERCEIRO,1,R3.NOMEREGRA,'''') AS REGRADECIMOTERCEIRO,');
  qryRubSal.Sql.Add('  DECODE(RXE.FLGRESCISAO,1,R4.NOMEREGRA,'''') AS REGRARESCISAO');
  // FIM - edilaine - SOL 191668 / KTN 1820235 (substituição do alias PD. por  RXE.)

  qryRubSal.Sql.Add('FROM');
  qryRubSal.Sql.Add('  PROVDESC PD, RUBRICAXPESS RP, REGRA R1, REGRA R3, REGRA R4, ');
  qryRubSal.Sql.Add('  VW_RUBXEVENTO RXE ');   // edilaine - SOL 191668 / KTN 1820235
  qryRubSal.Sql.Add('WHERE');

  // Rubrica(s) selecionada(s)
  if (Trim(CmpRptCM.ParamByName('ListaIdRubrica').asString) <> '') then
    if (Pos(',', CmpRptCM.ParamByName('ListaIdRubrica').asString) > 0) then
      qryRubSal.Sql.Add('  (RP.CODPROVDESC    IN (' +CmpRptCM.ParamByName('ListaIdRubrica').asString+ ')) AND')
    else
      qryRubSal.Sql.Add('  (RP.CODPROVDESC     = ' +CmpRptCM.ParamByName('ListaIdRubrica').asString+ ') AND');

  qryRubSal.Sql.Add('  (RP.IDPESSOA        = '+IntToStr(Sistema.IdEmpresa)+') AND');

  if CmpRptCM.ParamByName('TipoRubrica').AsInteger > -1 then
    qryRubSal.Sql.Add('  (PD.FLGDESCONTO = '+IntToStr(CmpRptCM.ParamByName('TipoRubrica').AsInteger)+') AND');

  if CmpRptCM.ParamByName('SeqCalculo').AsInteger > 0 then
    qryRubSal.Sql.Add('  (PD.NUMPRIORIDADE = '+IntToStr(CmpRptCM.ParamByName('SeqCalculo').AsInteger)+') AND');

  if CmpRptCM.ParamByName('IdRegraCalculo').AsInteger > 0 then
    qryRubSal.Sql.Add('  (PD.IDREGRA = '+IntToStr(CmpRptCM.ParamByName('IdRegraCalculo').AsInteger)+') AND');

  // inciio - edilaine - SOL 191668 / KTN 1820235
  if CmpRptCM.ParamByName('IdRegraCalculo13').AsInteger > 0 then
    //qryRubSal.Sql.Add('  (PD.IDREGRA13 = '+IntToStr(CmpRptCM.ParamByName('IdRegraCalculo13').AsInteger)+') AND');
    qryRubSal.Sql.Add('  (RXE.IDREGRA13 = '+IntToStr(CmpRptCM.ParamByName('IdRegraCalculo13').AsInteger)+') AND');

  if CmpRptCM.ParamByName('IdRegraCalculoRescisao').AsInteger > 0 then
    //qryRubSal.Sql.Add('  (PD.IDREGRARESCISAO = '+IntToStr(CmpRptCM.ParamByName('IdRegraCalculoRescisao').AsInteger)+') AND');
    qryRubSal.Sql.Add('  (RXE.IDREGRARESCISAO = '+IntToStr(CmpRptCM.ParamByName('IdRegraCalculoRescisao').AsInteger)+') AND');
  // fim - edilaine - SOL 191668 / KTN 1820235

  qryRubSal.Sql.Add('  (PD.FLGTPRUBRICA LIKE ''%F%'') AND');
  qryRubSal.Sql.Add('  (RP.IDRUBRICA       = PD.IDPROVENTO) AND');
  qryRubSal.Sql.Add('  (PD.IDREGRA         = R1.IDREGRA(+)) AND');
  // inciio - edilaine - SOL 191668 / KTN 1820235
  qryRubSal.Sql.Add('  (PD.IDPROVENTO      = RXE.IDPROVENTO(+)) AND ');
  qryRubSal.Sql.Add('  (RXE.IDREGRA13       = R3.IDREGRA(+)) AND');
  qryRubSal.Sql.Add('  (RXE.IDREGRARESCISAO = R4.IDREGRA(+)) ');
  {qryRubSal.Sql.Add('  (PD.IDREGRA13       = R3.IDREGRA(+)) AND');
   qryRubSal.Sql.Add('  (PD.IDREGRARESCISAO = R4.IDREGRA(+)) ');
  }// fim - edilaine - SOL 191668 / KTN 1820235
  qryRubSal.Sql.Add('ORDER BY PD.DESCRICAO ');
  qryRubSal.Open;

  qryRubSal.Sql.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');

end;

end.



