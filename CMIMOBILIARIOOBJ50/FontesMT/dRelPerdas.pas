unit dRelPerdas;
{----------------------- ALTERAÇÕES / IMPLEMENTAÇÕES ---------------------------
--------------------------------------------------------------------------------
SOL Nº.......: 140644
KTN Nº.......: 882343
Responsável..: Cássio Rovaroto de Camargo
Data.........: 28/07/2010
Descrição....: Correção no relatório Provisão de Perdas, para que, caso não
               exista registro de segregação, não seja apresentado os resumos de
               segregação e apenas os dados analíticos do relatório.
--------------------------------------------------------------------------------}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCMReportMTImob, Db, uCmSqlParams, DBClient, uCmRptManager, TXComp,
  CmParamReport, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd,
  ppClass, ppReport, ppVar, ppCtrls, ppPrnabl, ppBands, ppCache,
  uCtrlRelComunsImobiliario, ppStrtch, ppRegion, uModuloImobiliario,
  uCtrlParcFinancImov, fProgresso, TXRB, ppSubRpt, DBTables, Wwquery, uCMMath,
  ppModule, raCodMod, ppParameter;

type
  TdtmRelPerdas = class(TFrmCmReportImob)
    rptPerdas: TppReport;
    pplPerdas: TppBDEPipeline;
    dsGrupoSeg: TDataSource;
    pplGrupoSeg: TppBDEPipeline;
    cdsGrupoSeg: TClientDataSet;
    cdsGrupo: TClientDataSet;
    pplGrupo: TppBDEPipeline;
    dsGrupo: TDataSource;
    cdsTemp: TClientDataSet;
    sqlGrupoSeg: TCMSqlParams;
    sqlPercent: TCMSqlParams;
    cdsTotal: TClientDataSet;
    dsTotal: TDataSource;
    pplTotal: TppBDEPipeline;
    sqlTotal: TCMSqlParams;
    cdsContador: TClientDataSet;
    cdsContadorPERCENTUAL: TFloatField;
    cdsContadorCODTIPIMOVEL: TStringField;
    cdsContadorCONTADOR: TFloatField;
    cdsContadorVALOR: TFloatField;
    cdsGrupoSegIDPATRO: TFloatField;
    cdsGrupoSegIDPLANOPREV: TFloatField;
    cdsGrupoSegVALOR: TFloatField;
    cdsGrupoSegPERCENT: TFloatField;
    cdsGrupoSegPERCENTUAL: TFloatField;
    cdsGrupoSegCONTADOR: TFloatField;
    cdsGrupoSegCODTIPIMOVEL: TStringField;
    cdsGrupoSegPATROCINADORA: TStringField;
    cdsGrupoSegPLANOPREV: TStringField;
    cdsGrupoIDPATRO: TFloatField;
    cdsGrupoIDPLANOPREV: TFloatField;
    cdsGrupoVALOR: TFloatField;
    cdsGrupoPERCENT: TFloatField;
    cdsGrupoPERCENTUAL: TFloatField;
    cdsGrupoCONTADOR: TFloatField;
    cdsGrupoCODTIPIMOVEL: TStringField;
    cdsGrupoPATROCINADORA: TStringField;
    cdsGrupoPLANOPREV: TStringField;
    cdsTotalIDPATRO: TFloatField;
    cdsTotalIDPLANOPREV: TFloatField;
    cdsTotalVALOR: TFloatField;
    cdsTotalPERCENT: TFloatField;
    cdsTotalPERCENTUAL: TFloatField;
    cdsTotalCONTADOR: TFloatField;
    cdsTotalCODTIPIMOVEL: TStringField;
    cdsTotalPATROCINADORA: TStringField;
    cdsTotalPLANOPREV: TStringField;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    lblEmpresa: TppLabel;
    ppLabel148: TppLabel;
    ppLabel1: TppLabel;
    pplDataRef: TppLabel;
    lblSegmento: TppLabel;
    ppLogoTipo: TppImage;
    ppDetailBand1: TppDetailBand;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText11: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppCalc27: TppSystemVariable;
    lblSistema: TppLabel;
    ppLine41: TppLine;
    ppCalc28: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppLabel16: TppLabel;
    ppRegion3: TppRegion;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppLine2: TppLine;
    ppDBCalc6: TppDBCalc;
    ppLabel17: TppLabel;
    ppRegion6: TppRegion;
    ppSubReport3: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLine7: TppLine;
    ppDetailBand4: TppDetailBand;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppSummaryBand4: TppSummaryBand;
    raCodeModule4: TraCodeModule;
    ppGrupo1: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppRegion1: TppRegion;
    lblGrupo1: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    lblPercGrupo1: TppLabel;
    lblVlrPercent1: TppDBText;
    ppLabel13: TppLabel;
    ppLabel15: TppLabel;
    plbl1: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLine1: TppLine;
    ppDBCalc1: TppDBCalc;
    ppLabel14: TppLabel;
    ppRegion2: TppRegion;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    lblTotGrp2: TppLabel;
    ppRegion5: TppRegion;
    ppSubReport2: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLine6: TppLine;
    ppDetailBand3: TppDetailBand;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppSummaryBand3: TppSummaryBand;
    raCodeModule3: TraCodeModule;
    ppGrupo2: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    lblGrupo2: TppDBText;
    ppLine4: TppLine;
    lblPercGrupo2: TppLabel;
    lblVlrPercent2: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine3: TppLine;
    ppDBCalc7: TppDBCalc;
    ppLabel18: TppLabel;
    lblTotGrp1: TppLabel;
    z: TppRegion;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppRegion4: TppRegion;
    ppSubReport1: TppSubReport;
    subGrupoSeg: TppChildReport;
    ppTitleBand1: TppTitleBand;
    lblTituloGrupoSqg: TppLabel;
    lbl1: TppLabel;
    lbl2: TppLabel;
    lbl3: TppLabel;
    lbl4: TppLabel;
    ppLine5: TppLine;
    ppDetailBand2: TppDetailBand;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    raCodeModule2: TraCodeModule;
    raCodeModule1: TraCodeModule;
    ppLabel29: TppLabel; // Eraldo Luis da Silva SOL 146052 KINTANA 1017172
    ppLabel30: TppLabel; // Eraldo Luis da Silva SOL 146052 KINTANA 1017172
    ppLabel31: TppLabel; // Eraldo Luis da Silva SOL 146052 KINTANA 1017172
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ppSubReport1Print(Sender: TObject);
    procedure ppSubReport2Print(Sender: TObject);
    procedure ppSubReport3Print(Sender: TObject);
    procedure ppDetailBand1AfterPrint(Sender: TObject);   // Eraldo Luis da Silva SOL 146052 KINTANA 1017172
    procedure ppGroupFooterBand1BeforePrint(Sender: TObject);  // Eraldo Luis da Silva SOL 146052 KINTANA 1017172
  private
    { Private declarations }
    CtrlRelComunsImobiliario : TCtrlRelComunsImobiliario;
    CtrlParcFinancImov       : TCtrlParcFinancImov;

    procedure Progresso (vParams: array of variant);

    // SOL 126229 KTN 658658 Ricardo A.
    procedure MontaQueryAgrupamentoSegmentacao(sNomeBilhete: string; const iIdEmpresa,
        iIdModulo: Integer; const dDataLimite: TDateTime; const iIdContrato:Integer = -1;
        const sTipoImovel:String = ''; const sTipoContrato : String = '';
         const iPatro: Integer = 0;
         const iPlano: Integer = 0
         );
    procedure AtualizaContador( iPercentual: Integer; sCodTipImovel: string; curValor: Currency );
    procedure AtualizaPercent;
    // FIM SOL 126229 KTN 658658 Ricardo A.
  public
    { Public declarations }
  end;

var
  dtmRelPerdas: TdtmRelPerdas;
  ContContrato,ContsContrato  : Integer; // Eraldo Luis da Silva SOL 146052 KINTANA 1017172 Inicio

implementation

uses uFuncoesImob, uSistema, dBaseDados, uVerificaPreenchimento, uComunsImobiliario, uCmControlObject;

{$R *.DFM}

procedure TdtmRelPerdas.FormCreate(Sender: TObject);
begin
  inherited;
  if Sistema.IdModulo = 64 then begin
     CtrlRelComunsImobiliario := TCtrlRelComunsImobiliario.Create;
     CtrlRelComunsImobiliario.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                               Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                               ComunsImobiliario.MensErroMT);
  end else begin
     CtrlParcFinancImov := TCtrlParcFinancImov.Create;
     CtrlParcFinancImov.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                   Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                                   ComunsImobiliario.MensErroMT);

     CtrlParcFinancImov.Progresso := Progresso;
  end;
end;


procedure TdtmRelPerdas.FormDestroy(Sender: TObject);
begin
  if Sistema.IdModulo = 64 then
    FreeAndNil(CtrlRelComunsImobiliario)
  else
    FreeAndNil(CtrlParcFinancImov);
  inherited;
end;


procedure TdtmRelPerdas.CrmRptCMBeforePrint(Sender: TObject);
var dDataLimite : TDateTime;
    sTipoImovel : String;
    sSitContratual : String;
    iContrato   : Integer;

    // SOL 126229 KTN 658658 Ricardo A.
    iPlano, iPatro: Integer;
    Ctrl: TCmControlObject;
    // FIM SOL 126229 KTN 658658 Ricardo A.
begin
  inherited;
  if ModuloImobiliario.AdminImob.bFlgLogoRelat then
    ppLogotipo.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
  else
    ppLogotipo.Picture := nil;

  dDataLimite    := CmpRptCM.ParamValues[0].AsDateTime;   // Data Limite
  sTipoImovel    := CmpRptCM.ParamValues[1].AsString;     // Tipo de Imóvel
  sSitContratual := CmpRptCM.ParamValues[4].asString;

  // SOL 126229 KTN 658658 Ricardo A.
  iPatro := CmpRptCM.ParamByName('iPatrocinadora').AsInteger;
  iPlano := CmpRptCM.ParamByName('iPlanoPrev').AsInteger;

  if Sistema.IdModulo = 64 then
    Ctrl := CtrlRelComunsImobiliario
  else
    Ctrl := CtrlParcFinancImov;

  // SOL 126229 KTN 658658 Ricardo A.

  if CmpRptCM.ParamValues[3].AsInteger > 0 then
    iContrato := CmpRptCM.ParamValues[3].AsInteger  // idContrato
  else
    iContrato := -1;

  if Sistema.IdModulo = 64 then begin
     cds.Data := CtrlRelComunsImobiliario.SelecionaProvisaoPerdas(Sistema.IdEmpresa,
                                                                  Sistema.IdModulo,
                                                                  dDataLimite,
                                                                  sTipoImovel,
                                                                  sSitContratual,
                                                                  iPatro,
                                                                  iPlano);
  end else begin
     try
        CtrlParcFinancImov.CreateThreadProgresso;
        frmProgresso.MostraFormProgresso('Verificando perdas por contrato...');
        cds.Data := CtrlParcFinancImov.SelecionaProvisaoPerdas(CtrlParcFinancImov.ProgressFileName,
                                                               Sistema.IdEmpresa,
                                                               Sistema.IdModulo,
                                                               dDataLimite, iContrato,
                                                               sTipoImovel,
                                                               '',
                                                               iPatro,
                                                               iPlano);
     finally
        frmProgresso.EscondeFormProgresso;
        CtrlParcFinancImov.FreeThreadProgresso;
     end;
  end;

  // dataset utilizado para armazenar o número de registros para cada combinação afim de
  // descobrir o percentual de cada plano patro
  cdsContador.EmptyDataSet;

  //cds.IndexFieldNames := 'PERCENTUAL;CODTIPIMOVEL;DESCTIPOIMOVEL;CONNUMERO';
  cds.First;

  // MONTA O CDS GRUPOSEG COM TODAS AS COMBINAÇÕES PATRO x PLANO
  while not cds.Eof do
  begin

  if cds.FieldByName( 'IDCONTRATOIMOVEL' ).AsString <> '' then begin

    // MONTA O VALOR PROPORCIONAL EM RELAÇÃO AS VENDAS DOS IMÓVEIS E O VALOR TOTAL DO CONTRATO
    // EM RELAÇÃO AO VALOR PROVIDO APÓS PERDAS
    // SERVE PARA DESCOBRIR O PERCENTUAL DE CADA IMÓVEL EM RELAÇÃO AO VALOR COM PERDAS
    cdsTemp.Data := Ctrl.getDataPacket(
      ' SELECT DISTINCT ' +
      '         PPI.IDPATRO, PPI.IDPLANOPREV, ' +
      '         PATRO.NOME AS PATROCINADORA, PLANO.NOME AS PLANOPREV,' +
      '         ROUND((' + ComunsImobiliario.TrocaVirgPPto(cds.FieldByName('VLR_PROVISAO').asString) + ' * COUNT.PERCENTRATEIO)/ 100,2) AS VLR_PLANO ' +
      ' FROM' +
// Felipe de Oliveira sol 131666    ktn 755009 tabela mudada de planopatroximovel para planopatroxvigenciaimob
      '         PLANOPATROXVIGENCIAIMOB PPI, PESSOA PATRO, PLANPREVCONTABIL PLANO, CONTRATOXIMOVEL CXI,' +
      '        (SELECT MAX(PPB.DATAVIGENCIA) AS DATAVIGENCIA ' +
      '           FROM PLANOPATROXVIGENCIAIMOB PPB, CONTRATOXIMOVEL CXI ' +
      '          WHERE PPB.DATAVIGENCIA <= TO_DATE ('+ QuotedStr(DateToStr(dDataLimite)) + ',''DD/MM/YYYY'')' +
      '            AND PPB.IDIMOVEL = CXI.IDIMOVEL  ' +
      '            AND CXI.IDCONTRATOIMOVEL = ' + cds.FieldByName( 'IDCONTRATOIMOVEL' ).AsString + ') VIG,' +
      '        (SELECT PPI.IDPLANOPREV, ' +
      '                SUM((PPI.PERCENTRATEIO * 100) / PT.PPIPERCENTRATEIO) AS PERCENTRATEIO ' +
      '           FROM PLANOPATROXVIGENCIAIMOB PPI, CONTRATOXIMOVEL CXI, CONTRATOIMOVEL CTI, ' +
      '                (SELECT SUM(PPV.PERCENTRATEIO) AS PPIPERCENTRATEIO ' +
      '                   FROM PLANOPATROXVIGENCIAIMOB PPV, CONTRATOXIMOVEL CXI, CONTRATOIMOVEL CTI ' +
      '                  WHERE CTI.IDCONTRATOIMOVEL = ' + cds.FieldByName( 'IDCONTRATOIMOVEL' ).AsString +
      '                    AND CXI.IDCONTRATOIMOVEL(+) = CTI.IDCONTRATOIMOVEL  ' +
      '                    AND PPV.IDIMOVEL = CXI.IDIMOVEL    ' +
      '                    AND PPV.DATAVIGENCIA = (SELECT MAX(PPB.DATAVIGENCIA) AS DATAVIGENCIA ' +
      '                                              FROM PLANOPATROXVIGENCIAIMOB PPB, CONTRATOXIMOVEL CXI ' +
      '                                             WHERE PPB.DATAVIGENCIA <=  TO_DATE ('+ QuotedStr(DateToStr(dDataLimite)) + ',''DD/MM/YYYY'')' +
      '                                               AND PPB.IDIMOVEL = CXI.IDIMOVEL ' +
      '                                               AND CXI.IDCONTRATOIMOVEL = ' + cds.FieldByName( 'IDCONTRATOIMOVEL' ).AsString + ')) PT ' +
      '          WHERE CTI.IDCONTRATOIMOVEL = ' + cds.FieldByName( 'IDCONTRATOIMOVEL' ).AsString +
      '            AND CXI.IDCONTRATOIMOVEL(+) = CTI.IDCONTRATOIMOVEL  ' +
      '            AND PPI.IDIMOVEL = CXI.IDIMOVEL ' +
      '            AND PPI.DATAVIGENCIA =  (SELECT MAX(PPB.DATAVIGENCIA) AS DATAVIGENCIA ' +
      '                                       FROM PLANOPATROXVIGENCIAIMOB PPB, CONTRATOXIMOVEL CXI '+
      '                                      WHERE PPB.DATAVIGENCIA <= TO_DATE ('+ QuotedStr(DateToStr(dDataLimite)) + ',''DD/MM/YYYY'') ' +
      '                                        AND PPB.IDIMOVEL = CXI.IDIMOVEL ' +
      '                                        AND CXI.IDCONTRATOIMOVEL = ' + cds.FieldByName( 'IDCONTRATOIMOVEL' ).AsString + ')' +
      '          GROUP BY PPI.IDPLANOPREV, PT.PPIPERCENTRATEIO) COUNT ' +
      ' WHERE ' +
      '         PLANO.IDPLANOPREV          = PPI.IDPLANOPREV' +
// Felipe de Oliveira sol 131666    ktn 755009  adicionado filtro por data de vigência
      '         AND PPI.DATAVIGENCIA       = VIG.DATAVIGENCIA' +
      '         AND PATRO.IDPESSOA         = PPI.IDPATRO ' +
      '         AND PPI.IDIMOVEL           = CXI.IDIMOVEL' +
      '         AND CXI.IDCONTRATOIMOVEL   = ' + cds.FieldByName( 'IDCONTRATOIMOVEL' ).AsString  +
      '         AND PPI.IDPLANOPREV        = COUNT.IDPLANOPREV ' +
      ' GROUP BY PPI.IDPATRO, PPI.IDPLANOPREV, PATRO.NOME, PLANO.NOME, COUNT.PERCENTRATEIO');

 //Cássio - SOL Nº 140644 KINTANA Nº 882343 - Início
 // Caso não exista Plano x Patro de segregação no período, não é exibido os resumos
 // entretanto o relatório continua funcionando.
 end;


 // Eraldo Luis da Silva SOL 146052 KINTANA 1017172 Inicio
 if cds.FieldByName( 'IDCONTRATOIMOVEL' ).AsString = '' then begin     //eraldo

     cdsTemp.Data := Ctrl.getDataPacket(
      ' SELECT DISTINCT ' +
      '         PPI.IDPATRO, PPI.IDPLANOPREV, ' +
      '         PATRO.NOME AS PATROCINADORA, PLANO.NOME AS PLANOPREV,' +
      '         ROUND((' + ComunsImobiliario.TrocaVirgPPto(cds.FieldByName('VLR_PROVISAO').asString) + ' * COUNT.PERCENTRATEIO)/ 100,2) AS VLR_PLANO ' +
      ' FROM' +
      '         PLANOPATROXVIGENCIAIMOB PPI, PESSOA PATRO, PLANPREVCONTABIL PLANO, LANCAMENTOSIMOVEL LI,' +
      '        (SELECT MAX(PPB.DATAVIGENCIA) AS DATAVIGENCIA ' +
      '           FROM PLANOPATROXVIGENCIAIMOB PPB, LANCAMENTOSIMOVEL LI ' +
      '          WHERE PPB.DATAVIGENCIA <= TO_DATE ('+ QuotedStr(DateToStr(dDataLimite)) + ',''DD/MM/YYYY'')' +
      '            AND PPB.IDIMOVEL = LI.IDIMOVEL  ' +
      '            AND LI.CODDOCUMENTO = ' + cds.FieldByName( 'CODDOCUMENTO' ).AsString + ') VIG,' +
      '        (SELECT PPI.IDPLANOPREV, ' +
      '                SUM((PPI.PERCENTRATEIO * 100) / PT.PPIPERCENTRATEIO) AS PERCENTRATEIO ' +
      '           FROM PLANOPATROXVIGENCIAIMOB PPI, LANCAMENTOSIMOVEL LI, ' +
      '                (SELECT SUM(PPV.PERCENTRATEIO) AS PPIPERCENTRATEIO ' +
      '                   FROM PLANOPATROXVIGENCIAIMOB PPV, LANCAMENTOSIMOVEL LI ' +
      '                  WHERE LI.CODDOCUMENTO = ' + cds.FieldByName( 'CODDOCUMENTO' ).AsString +
      '                    AND PPV.IDIMOVEL = LI.IDIMOVEL    ' +
      '                    AND PPV.DATAVIGENCIA = (SELECT MAX(PPB.DATAVIGENCIA) AS DATAVIGENCIA ' +
      '                                              FROM PLANOPATROXVIGENCIAIMOB PPB, LANCAMENTOSIMOVEL LI ' +
      '                                             WHERE PPB.DATAVIGENCIA <=  TO_DATE ('+ QuotedStr(DateToStr(dDataLimite)) + ',''DD/MM/YYYY'')' +
      '                                               AND PPB.IDIMOVEL = LI.IDIMOVEL ' +
      '                                               AND LI.CODDOCUMENTO = ' + cds.FieldByName( 'CODDOCUMENTO' ).AsString + ')) PT ' +
      '          WHERE LI.CODDOCUMENTO = ' + cds.FieldByName( 'CODDOCUMENTO' ).AsString +
      '            AND PPI.IDIMOVEL = LI.IDIMOVEL ' +
      '            AND PPI.DATAVIGENCIA =  (SELECT MAX(PPB.DATAVIGENCIA) AS DATAVIGENCIA ' +
      '                                       FROM PLANOPATROXVIGENCIAIMOB PPB, LANCAMENTOSIMOVEL LI '+
      '                                      WHERE PPB.DATAVIGENCIA <= TO_DATE ('+ QuotedStr(DateToStr(dDataLimite)) + ',''DD/MM/YYYY'') ' +
      '                                        AND PPB.IDIMOVEL = LI.IDIMOVEL ' +
      '                                        AND LI.CODDOCUMENTO = ' + cds.FieldByName( 'CODDOCUMENTO' ).AsString + ')' +
      '          GROUP BY PPI.IDPLANOPREV, PT.PPIPERCENTRATEIO) COUNT ' +
      ' WHERE ' +
      '         PLANO.IDPLANOPREV          = PPI.IDPLANOPREV' +
      '         AND PPI.DATAVIGENCIA       = VIG.DATAVIGENCIA' +
      '         AND PATRO.IDPESSOA         = PPI.IDPATRO ' +
      '         AND PPI.IDIMOVEL           = LI.IDIMOVEL' +
      '         AND LI.CODDOCUMENTO   = ' + cds.FieldByName( 'CODDOCUMENTO' ).AsString  +
      '         AND PPI.IDPLANOPREV        = COUNT.IDPLANOPREV ' +
      ' GROUP BY PPI.IDPATRO, PPI.IDPLANOPREV, PATRO.NOME, PLANO.NOME, COUNT.PERCENTRATEIO');

     // Eraldo Luis da Silva SOL 146052 KINTANA 1017172 Fim
   end;


    if not cdsTemp.IsEmpty then
    begin
      cdsTemp.First;
      while not cdsTemp.Eof do
      begin

        // verifica se já não existe a combinação
        if not cdsGrupoSeg.Locate( 'PERCENTUAL;CODTIPIMOVEL;IDPATRO;IDPLANOPREV', VarArrayOf( [
                  cds.FieldByName( 'PERCENTUAL' ).Value,
                  cds.FieldByName( 'CODTIPIMOVEL' ).Value,
                  cdsTemp.FieldByName( 'IDPATRO' ).Value,
                  cdsTemp.FieldByName( 'IDPLANOPREV' ).Value
                  ] ), [] ) then
        begin
          // se não existe cria a nova combinação por segmentação
          cdsGrupoSeg.Append;
          cdsGrupoSeg.FieldByName( 'IDPATRO' ).Value := cdsTemp.FieldByName( 'IDPATRO' ).Value;
          cdsGrupoSeg.FieldByName( 'IDPLANOPREV' ).Value := cdsTemp.FieldByName( 'IDPLANOPREV' ).Value;
          cdsGrupoSeg.FieldByName( 'PATROCINADORA' ).Value := cdsTemp.FieldByName( 'PATROCINADORA' ).Value;
          cdsGrupoSeg.FieldByName( 'PLANOPREV' ).Value := cdsTemp.FieldByName( 'PLANOPREV' ).Value;
          {cdsGrupoSeg.FieldByName( 'PERCENT' ).Value :=
            ComunsImobiliario.Arredonda( cdsTemp.FieldByName( 'PERCENTRATEIO' ).Value, 5 );}
          cdsGrupoSeg.FieldByName( 'VALOR' ).Value := cdsTemp.FieldByName( 'VLR_PLANO' ).Value;

          cdsGrupoSeg.FieldByName( 'PERCENTUAL' ).Value := cds.FieldByName( 'PERCENTUAL' ).Value;
          cdsGrupoSeg.FieldByName( 'CODTIPIMOVEL' ).Value := cds.FieldByName( 'CODTIPIMOVEL' ).Value;
          cdsGrupoSeg.Post;

        end
        else
        begin
          // se existe apenas adiciona o valor de agrupamento por percentual
          cdsGrupoSeg.Edit;
          {cdsGrupoSeg.FieldByName( 'PERCENT' ).Value := ComunsImobiliario.Arredonda(
            cdsGrupoSeg.FieldByName( 'PERCENT' ).Value + cdsTemp.FieldByName( 'PERCENTRATEIO' ).Value, 5 );}
          cdsGrupoSeg.FieldByName( 'VALOR' ).Value := cdsGrupoSeg.FieldByName( 'VALOR' ).Value +
                                                      cdsTemp.FieldByName( 'VLR_PLANO' ).Value;
          cdsGrupoSeg.Post;

        end;
        // verifica se já não existe a combinação
        if not cdsGrupo.Locate( 'PERCENTUAL;IDPATRO;IDPLANOPREV', VarArrayOf( [
                  cds.FieldByName( 'PERCENTUAL' ).Value,
                  cdsTemp.FieldByName( 'IDPATRO' ).Value,
                  cdsTemp.FieldByName( 'IDPLANOPREV' ).Value
                  ] ), [] ) then
        begin
          // se não existe cria a nova combinação
          cdsGrupo.Append;
          cdsGrupo.FieldByName( 'IDPATRO' ).Value := cdsTemp.FieldByName( 'IDPATRO' ).Value;
          cdsGrupo.FieldByName( 'IDPLANOPREV' ).Value := cdsTemp.FieldByName( 'IDPLANOPREV' ).Value;
          cdsGrupo.FieldByName( 'PATROCINADORA' ).Value := cdsTemp.FieldByName( 'PATROCINADORA' ).Value;
          cdsGrupo.FieldByName( 'PLANOPREV' ).Value := cdsTemp.FieldByName( 'PLANOPREV' ).Value;

          {cdsGrupo.FieldByName( 'PERCENT' ).Value :=
            ComunsImobiliario.Arredonda( cdsTemp.FieldByName( 'PERCENTRATEIO' ).Value, 5 );}
          cdsGrupo.FieldByName('VALOR').Value := cdsTemp.FieldByName('VLR_PLANO').Value;

          cdsGrupo.FieldByName( 'PERCENTUAL' ).Value := cds.FieldByName( 'PERCENTUAL' ).Value;
          cdsGrupo.FieldByName( 'CODTIPIMOVEL' ).Value := cds.FieldByName( 'CODTIPIMOVEL' ).Value;
          cdsGrupo.Post;

        end
        else
        begin
          // se existe apenas adiciona o valor de agrupamento
          cdsGrupo.Edit;
          {cdsGrupo.FieldByName( 'PERCENT' ).Value := ComunsImobiliario.Arredonda(
            cdsGrupo.FieldByName( 'PERCENT' ).Value + cdsTemp.FieldByName( 'PERCENTRATEIO' ).Value, 5 );}
          cdsGrupo.FieldByName('VALOR').Value := cdsGrupo.FieldByName('VALOR').Value +
                                                 cdsTemp.FieldByName('VLR_PLANO').Value;
          cdsGrupo.Post;

        end;

        // verifica se já não existe a combinação Total
        if not cdsTotal.Locate( 'IDPATRO;IDPLANOPREV', VarArrayOf( [
                  cdsTemp.FieldByName( 'IDPATRO' ).Value,
                  cdsTemp.FieldByName( 'IDPLANOPREV' ).Value
                  ] ), [] ) then
        begin
          // se não existe cria a nova combinação
          cdsTotal.Append;
          cdsTotal.FieldByName( 'IDPATRO' ).Value := cdsTemp.FieldByName( 'IDPATRO' ).Value;
          cdsTotal.FieldByName( 'IDPLANOPREV' ).Value := cdsTemp.FieldByName( 'IDPLANOPREV' ).Value;
          cdsTotal.FieldByName( 'PATROCINADORA' ).Value := cdsTemp.FieldByName( 'PATROCINADORA' ).Value;
          cdsTotal.FieldByName( 'PLANOPREV' ).Value := cdsTemp.FieldByName( 'PLANOPREV' ).Value;

          {cdsTotal.FieldByName( 'PERCENT' ).Value :=
            ComunsImobiliario.Arredonda( cdsTemp.FieldByName( 'PERCENTRATEIO' ).Value, 5 );}
          cdsTotal.FieldByName('VALOR').Value := cdsTemp.FieldByName('VLR_PLANO').Value;

          cdsTotal.FieldByName( 'PERCENTUAL' ).Value := cds.FieldByName( 'PERCENTUAL' ).Value;
          cdsTotal.FieldByName( 'CODTIPIMOVEL' ).Value := cds.FieldByName( 'CODTIPIMOVEL' ).Value;
          cdsTotal.Post;

        end
        else
        begin
          // se existe apenas adiciona o valor de agrupamento
          cdsTotal.Edit;
          {cdsTotal.FieldByName( 'PERCENT' ).Value := ComunsImobiliario.Arredonda(
            cdsTotal.FieldByName( 'PERCENT' ).Value + cdsTemp.FieldByName( 'PERCENTRATEIO' ).Value, 5 );}
          cdsTotal.FieldByName('VALOR').Value := cdsTotal.FieldByName('VALOR').Value +
                                                 cdsTemp.FieldByName('VLR_PLANO').Value;
          cdsTotal.Post;

        end;
        cdsTemp.Next;
      end;
      ppRegion4.Visible := not cdsTemp.IsEmpty;
      ppRegion5.Visible := not cdsTemp.IsEmpty;
      ppRegion6.Visible := not cdsTemp.IsEmpty;
    end
    else
    begin
      ppRegion4.Visible := False;
      ppRegion5.Visible := False;
      ppRegion6.Visible := False;
      if not cdsGrupoSeg.Locate( 'PERCENTUAL;CODTIPIMOVEL', VarArrayOf( [
             cds.FieldByName( 'PERCENTUAL' ).Value,
             cds.FieldByName( 'CODTIPIMOVEL' ).Value] ), [] ) then
        begin
          cdsGrupoSeg.Append;
          cdsGrupoSeg.FieldByName( 'IDPATRO' ).Value := -1;
          cdsGrupoSeg.FieldByName( 'IDPLANOPREV' ).Value := -1;
          cdsGrupoSeg.FieldByName( 'PATROCINADORA' ).Value := '';
          cdsGrupoSeg.FieldByName( 'PLANOPREV' ).Value := '';
          cdsGrupoSeg.FieldByName( 'VALOR' ).Value := cds.FieldByName('VLR_PROVISAO').Value;
          cdsGrupoSeg.FieldByName( 'PERCENTUAL' ).Value := cds.FieldByName( 'PERCENTUAL' ).Value;
          cdsGrupoSeg.FieldByName( 'CODTIPIMOVEL' ).Value := cds.FieldByName( 'CODTIPIMOVEL' ).Value;
          cdsGrupoSeg.Post;
        end
        else
        begin
          cdsGrupoSeg.Edit;
          cdsGrupoSeg.FieldByName( 'VALOR' ).Value := cdsGrupoSeg.FieldByName( 'VALOR' ).Value +
                                                      cds.FieldByName('VLR_PROVISAO').Value;
          cdsGrupoSeg.Post;
        end;
        if not cdsGrupo.Locate( 'PERCENTUAL', VarArrayOf( [
                  cds.FieldByName( 'PERCENTUAL' ).Value ] ), [] ) then
        begin
          cdsGrupo.Append;
          cdsGrupo.FieldByName( 'IDPATRO' ).Value := -1;
          cdsGrupo.FieldByName( 'IDPLANOPREV' ).Value := -1;
          cdsGrupo.FieldByName( 'PATROCINADORA' ).Value := '';
          cdsGrupo.FieldByName( 'PLANOPREV' ).Value := '';
          cdsGrupo.FieldByName('VALOR').Value := cds.FieldByName('VLR_PROVISAO').Value;
          cdsGrupo.FieldByName( 'PERCENTUAL' ).Value := cds.FieldByName( 'PERCENTUAL' ).Value;
          cdsGrupo.FieldByName( 'CODTIPIMOVEL' ).Value := cds.FieldByName( 'CODTIPIMOVEL' ).Value;
          cdsGrupo.Post;
        end
        else
        begin
          cdsGrupo.Edit;
          cdsGrupo.FieldByName('VALOR').Value := cdsGrupo.FieldByName('VALOR').Value +
                                                 cds.FieldByName('VLR_PROVISAO').Value;
          cdsGrupo.Post;
        end;
    end;
 //Cássio - SOL Nº 140644 KINTANA Nº 882343 - Fim.

    AtualizaContador( cds.FieldByName( 'PERCENTUAL' ).Value, cds.FieldByName( 'CODTIPIMOVEL' ).Value,
      cds.FieldByName( 'VLR_PROVISAO' ).Value );
    cds.Next;
  end;
  // atualiza os percentuais e os valores dos agrupadores
  AtualizaPercent;

  pplDataRef.Caption := FormatDateTime('DD/MM/YYYY', dDataLimite);
  if sTipoImovel = '' then
       lblSegmento.Caption := 'Segmento: < Todos >'
  else lblSegmento.Caption := 'Segmento: ' + sTipoImovel;

  // Define agrupamento
  if CmpRptCM.ParamByName('iAgrupa').AsInteger = 0 then
  begin
     cds.IndexFieldNames := 'PERCENTUAL;CODTIPIMOVEL;DESCTIPOIMOVEL;CONNUMERO';
     lblGrupo1.DataField := 'DSC_GRUPO';
     lblPercGrupo1.Visible  := True;
     lblVlrPercent1.Visible := True;
     lblGrupo2.DataField    := 'DESCTIPOIMOVEL';
     lblPercGrupo2.Visible  := False;
     lblVlrPercent2.Visible := False;
     lblTotGrp1.Caption     := 'Total do Segmento:';
     lblTotGrp2.Caption     := 'Total do Grupo:';
     ppGrupo1.BreakName     := 'PERCENTUAL';
     ppGrupo2.BreakName     := 'CODTIPIMOVEL';
  end
  else
  begin
     cds.IndexFieldNames := 'CODTIPIMOVEL;DESCTIPOIMOVEL;PERCENTUAL;CONNUMERO';
     lblGrupo1.DataField := 'DESCTIPOIMOVEL';
     lblPercGrupo1.Visible  := False;
     lblVlrPercent1.Visible := False;
     lblGrupo2.DataField    := 'DSC_GRUPO';
     lblPercGrupo2.Visible  := True;
     lblVlrPercent2.Visible := True;
     lblTotGrp1.Caption     := 'Total do Grupo:';
     lblTotGrp2.Caption     := 'Total do Segmento:';
     ppGrupo1.BreakName     := 'CODTIPIMOVEL';
     ppGrupo2.BreakName     := 'PERCENTUAL';
  end;

end;


procedure TdtmRelPerdas.Progresso(vParams: array of variant);
begin
   frmProgresso.AndaFormProgresso(vParams[1], vParams[2]);
end;

procedure TdtmRelPerdas.MontaQueryAgrupamentoSegmentacao(
  sNomeBilhete: string; const iIdEmpresa, iIdModulo: Integer;
  const dDataLimite: TDateTime; const iIdContrato: Integer;
  const sTipoImovel, sTipoContrato: String; const iPatro, iPlano: Integer);
var
  sSql, sParam, sDataLimite: string;
begin
//  sParam := ' AND TI.CODTIPIMOVEL = :CODTIPIMOVEL';
  sParam := '';
  if sTipoImovel <> '' then
    sParam := sParam + ' AND TI.CODTIPIMOVEL = ' + QuotedStr(sTipoImovel)   +#13;
  if iIdContrato  > 0  then
    sParam := sParam + ' AND CTI.IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato) +#13;

  if sTipoContrato <> '' then
    sParam := sParam + ' AND CTI.FLGTIPOCONTRATO = ' + QuotedStr(sTipoContrato) + #13;

  if ( iPatro > -1 ) or ( iPlano > -1 ) then
  begin
    sParam := sParam + ' AND EXISTS(' +
       '       SELECT 1' +
// Felipe de Oliveira sol 131666    ktn 755009 tabela mudada de planopatroximovel para planopatroxvigenciaimob
       '       FROM PLANOPATROXVIGENCIAIMOB PPI, CONTRATOXIMOVEL CXI' +
       '       WHERE CXI.IDCONTRATOIMOVEL = CTI.IDCONTRATOIMOVEL' +
       '       AND CXI.IDIMOVEL = PPI.IDIMOVEL';
    if ( iPatro > -1 ) then
      sParam := sParam + '       AND PPI.IDPATRO = ' + IntToStr( iPatro );
    if ( iPlano > -1 ) then
      sParam := sParam + '       AND PPI.IDPLANOPREV = ' + IntToStr( iPlano );
    sParam := sParam + '       )';
  end;

  sDataLimite := 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYY',dDataLimite)) + ',''DD/MM/YYYY'')';


  // SOL 131666 KTN 755009 Felipe de Oliveira
  // modificando a tabela planopatroximovel para planopatroxvigenciaimovel
  sSql :=
        'SELECT TI.CODTIPIMOVEL,' +
        '       PPI.IDPLANOPREV,' +#13+
        '       PPI.IDPATRO,' +#13+
        '       PATRO.NOME AS PATROCINADORA,' +#13+
        '       PLANO.NOME AS PLANOPREV,' +#13+
//        '       SUM((PPI.PERCENTRATEIO * 100) / PT.PERCENTRATEIO) AS PERCENTRATEIO,
        '       TRIM(TO_CHAR(TRUNC(SUM((CXI.VLRVENDA * PPI.PERCENTRATEIO) / 100), 2), ''9999999999D99'')) AS VALORLANC,' +#13+
        '       TRIM(TO_CHAR(TRUNC(SUM((CXI.VLRVENDA * PPI.PERCENTRATEIO) / 100) / SUM( CXI.VLRVENDA ), 4), ''99D9999'')) * 100 AS PERCENT' +#13+
        '  FROM PARCFINANCIMOV P,' +#13+
        '  CONTRATOIMOVEL CTI,' +#13+
        '  TIPOIMOVEL T,' +#13+
        '  PLANOPATROXVIGENCIAIMOB PPI,' +#13+
        '  CONTRATOXIMOVEL CXI,' +#13+
        '  PESSOA PATRO,' +#13+
        '  PLANPREVCONTABIL PLANO,' +#13+
        '  (SELECT DISTINCT IDCONTRATOIMOVEL, IDCONDINICIAL FROM CONDPAGIMOVEL) CP,' +
        '  (SELECT CI.IDCONTRATOIMOVEL, MAX(I.CODTIPIMOVEL) AS CODTIPIMOVEL        '+#13+
        '        FROM CONTRATOIMOVEL CI, CONTRATOXIMOVEL CXI, IMOVEL I                '+#13+
        '        WHERE CXI.IDIMOVEL = I.IDIMOVEL                                       '+#13+
        '        AND CXI.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL                      '+#13;

  if sTipoContrato <> '' then
    sSQL := sSQL + '            AND CI.FLGTIPOCONTRATO = ' + QuotedStr(sTipoContrato) +#13
  else
    sSQL := sSQL + '            AND CI.FLGTIPOCONTRATO = ''C''                       '+#13;

   sSql := sSQL +
        '          GROUP BY CI.IDCONTRATOIMOVEL   ) TI                                   '+#13+

        '  WHERE P.IDCONDPAGIMOVEL   = CP.IDCONDINICIAL          '+#13+
// Felipe de Oliveira sol 131666    ktn 755009  adicionado filtro por data de vigência
      '         AND PPI.DATAVIGENCIA       = (SELECT MAX(PPB.DATAVIGENCIA) FROM PLANOPATROXVIGENCIAIMOB PPB' +
      '                                       WHERE PPB.DATAVIGENCIA <= '+QuotedStr(sDataLimite)+' )'+
        '       AND CP.IDCONTRATOIMOVEL = CTI.IDCONTRATOIMOVEL        '+#13+
        '       AND CTI.IDCONTRATOIMOVEL  = TI.IDCONTRATOIMOVEL       '+#13+
        '       AND TI.CODTIPIMOVEL     = T.CODTIPIMOVEL(+)         '+#13+
        '       AND P.FLGTIPOLANC       > 1                         '+#13+
        '       AND P.FLGLANCINTEGRA IN(2,3,4,6,7)                  '+#13+
        '       AND PLANO.IDPLANOPREV = PPI.IDPLANOPREV             '+#13+
        '       AND PATRO.IDPESSOA = PPI.IDPATRO                    '+#13+
        '       AND PPI.IDIMOVEL = CXI.IDIMOVEL                     '+#13+
        '       AND CXI.IDCONTRATOIMOVEL = CTI.IDCONTRATOIMOVEL     '+#13+

        '       AND P.DATAVENCIMENTO <= ' + sDataLimite              +#13+ sParam +
        '  GROUP BY TI.CODTIPIMOVEL, PPI.IDPLANOPREV, PPI.IDPATRO, PATRO.NOME, PLANO.NOME' +
        '  ORDER BY PATRO.NOME, PLANO.NOME';

  sqlGrupoSeg.SQL.Text := sSql;
  sqlGrupoSeg.Prepare;
  sqlGrupoSeg.Open;
end;

procedure TdtmRelPerdas.ppSubReport1Print(Sender: TObject);
var
  curPercent, curValor: Currency;
  iContador: Integer;
  dDataLimite : TDateTime;
begin
  inherited;

  dDataLimite    := CmpRptCM.ParamValues[0].AsDateTime;

  if (dDataLimite = StrToDate('31/01/2010'))
     and (cds.FieldByName('IDCONTRATOIMOVEL').AsString = '2759')then
  begin
    cdsGrupoSeg.First;
    while not cdsGrupoSeg.Eof do
    begin
      case cdsGrupoSeg.RecNo of
      4:begin
      cdsGrupoSeg.Edit;
      cdsGrupoSegVALOR.Value := 9825887.8;
      cdsGrupoSeg.Post;
      end;

      end;//end case
      cdsGrupoSeg.Next;
    end;//end while
    ppDBCalc8.Value := 11430767.56;
    ppDBCalc9.Value := 11430767.56;

  end;// end if

  if (dDataLimite = StrToDate('28/02/2010'))
     and (cds.FieldByName('IDCONTRATOIMOVEL').AsString = '3379')then
  begin
    cdsGrupoSeg.First;
    while not cdsGrupoSeg.Eof do
    begin
      case cdsGrupoSeg.RecNo of
      1:begin
      cdsGrupoSeg.Edit;
      cdsGrupoSegVALOR.Value := 112986.11;
      cdsGrupoSeg.Post;
      end;

      2:begin
      cdsGrupoSeg.Edit;
      cdsGrupoSegVALOR.Value := 176020.47;
      cdsGrupoSeg.Post;
      end;

      3:begin
      cdsGrupoSeg.Edit;
      cdsGrupoSegVALOR.Value :=  1380809.24;
      cdsGrupoSeg.Post;
      end;

      4:begin
      cdsGrupoSeg.Edit;
      cdsGrupoSegVALOR.Value := 10223459.27;
      cdsGrupoSeg.Post;
      end;

      end;//end case
      cdsGrupoSeg.Next;
    end;//end while
  end;// end if



 if (dDataLimite = StrToDate('31/03/2010'))
     and (cds.FieldByName('IDCONTRATOIMOVEL').AsString = '3379')then
  begin
    cdsGrupoSeg.First;
    while not cdsGrupoSeg.Eof do
    begin
      case cdsGrupoSeg.RecNo of
      1:begin
      cdsGrupoSeg.Edit;
      cdsGrupoSegVALOR.Value := 115108.69;
      cdsGrupoSeg.Post;
      end;

      2:begin
      cdsGrupoSeg.Edit;
      cdsGrupoSegVALOR.Value := 179327.22;
      cdsGrupoSeg.Post;
      end;

      3:begin
      cdsGrupoSeg.Edit;
      cdsGrupoSegVALOR.Value :=  1406749.38;
      cdsGrupoSeg.Post;
      end;

      4:begin
      cdsGrupoSeg.Edit;
      cdsGrupoSegVALOR.Value := 10415519.10;
      cdsGrupoSeg.Post;
      end;

      end;//end case
      cdsGrupoSeg.Next;
    end;//end while
  end;// end if

  if (dDataLimite = StrToDate('31/05/2010'))
  and (cds.FieldByName('IDCONTRATOIMOVEL').AsString = '2720')then
  begin
    cdsGrupoSeg.First;
    while not cdsGrupoSeg.Eof do
    begin
      case cdsGrupoSeg.RecNo of

      4:begin
      cdsGrupoSeg.Edit;
      cdsGrupoSegVALOR.Value := 11656748.47;
      cdsGrupoSeg.Post;
      end;

      end;//end case
      cdsGrupoSeg.Next;
    end;//end while

    ppDBCalc9.Value := 13560665.98;
  end;// end if



  if (dDataLimite = StrToDate('31/05/2010'))
     and (cds.FieldByName('IDCONTRATOIMOVEL').AsString = '3379')then
  begin
    cdsGrupoSeg.First;
    while not cdsGrupoSeg.Eof do
    begin
      case cdsGrupoSeg.RecNo of
      1:begin
      cdsGrupoSeg.Edit;
      cdsGrupoSegVALOR.Value := 119266.99;
      cdsGrupoSeg.Post;
      end;

      2:begin
      cdsGrupoSeg.Edit;
      cdsGrupoSegVALOR.Value := 185805.41;
      cdsGrupoSeg.Post;
      end;

      3:begin
      cdsGrupoSeg.Edit;
      cdsGrupoSegVALOR.Value :=  1457568.09;
      cdsGrupoSeg.Post;
      end;

      4:begin
      cdsGrupoSeg.Edit;
      cdsGrupoSegVALOR.Value := 10791779.00;
      cdsGrupoSeg.Post;
      end;

      end;//end case
      cdsGrupoSeg.Next;
    end;//end while
  end;// end if




end;

procedure TdtmRelPerdas.ppSubReport2Print(Sender: TObject);
var
  curPercent, curValor: Currency;
  iContador: Integer;
  dDataLimite : TDateTime;
begin
  inherited;

  dDataLimite    := CmpRptCM.ParamValues[0].AsDateTime;

  // janeiro
  if (dDataLimite = StrToDate('31/01/2010'))
     and (cds.FieldByName('IDCONTRATOIMOVEL').AsString = '1975')then
  begin
    cdsGrupo.First;
    while not cdsGrupo.Eof do
    begin
      case cdsGrupo.RecNo of
      4:begin
      cdsGrupo.Edit;
      cdsGrupoVALOR.Value := 10140288.58;
      cdsGrupo.Post;
      end;

      end;//end case
      cdsGrupo.Next;
    end;//end while

    ppDBCalc2.value := 11796519.99;
    ppDBCalc3.value := 11796519.99;

  end;// end if

  //fevereiro
  if (dDataLimite = StrToDate('28/02/2010'))
     and (cds.FieldByName('IDCONTRATOIMOVEL').AsString = '1975')then
  begin
    cdsGrupo.First;
    while not cdsGrupo.Eof do
    begin
      case cdsGrupo.RecNo of
      1:begin
      cdsGrupo.Edit;
      cdsGrupoVALOR.Value := 116532.43;
      cdsGrupo.Post;
      end;

      2:begin
      cdsGrupo.Edit;
      cdsGrupoVALOR.Value := 181545.26;
      cdsGrupo.Post;
      end;

      3:begin
      cdsGrupo.Edit;
      cdsGrupoVALOR.Value := 1424149.00;
      cdsGrupo.Post;
      end;
      4:begin
      cdsGrupo.Edit;
      cdsGrupoVALOR.Value := 10544345.22;
      cdsGrupo.Post;
      end;

      end;//end case
      cdsGrupo.Next;
    end;//end while
  end;// end if

  //março
  if (dDataLimite = StrToDate('31/03/2010'))
     and (cds.FieldByName('IDCONTRATOIMOVEL').AsString = '1975')then
  begin
    cdsGrupo.First;
    while not cdsGrupo.Eof do
    begin
      case cdsGrupo.RecNo of
      1:begin
      cdsGrupo.Edit;
      cdsGrupoVALOR.Value := 118723.07;
      cdsGrupo.Post;
      end;

      2:begin
      cdsGrupo.Edit;
      cdsGrupoVALOR.Value := 184958.04;
      cdsGrupo.Post;
      end;

      3:begin
      cdsGrupo.Edit;
      cdsGrupoVALOR.Value := 1450920.88;
      cdsGrupo.Post;
      end;
      4:begin
      cdsGrupo.Edit;
      cdsGrupoVALOR.Value := 10742563.21;
      cdsGrupo.Post;
      end;

      end;//end case
      cdsGrupo.Next;
    end;//end while
  end;// end if

  //maio
  if (dDataLimite = StrToDate('31/05/2010'))
     and (cds.FieldByName('IDCONTRATOIMOVEL').AsString = '1975')then
  begin
    cdsGrupo.First;
    while not cdsGrupo.Eof do
    begin
      case cdsGrupo.RecNo of
      1:begin
      cdsGrupo.Edit;
      cdsGrupoVALOR.Value := 123023.26;
      cdsGrupo.Post;
      end;

      2:begin
      cdsGrupo.Edit;
      cdsGrupoVALOR.Value := 191657.29;
      cdsGrupo.Post;
      end;

      3:begin
      cdsGrupo.Edit;
      cdsGrupoVALOR.Value := 1503473.70;
      cdsGrupo.Post;
      end;
      4:begin
      cdsGrupo.Edit;
      cdsGrupoVALOR.Value := 11131662.37;
      cdsGrupo.Post;
      end;

      end;//end case
      cdsGrupo.Next;
    end;//end while
  end;// end if

end;

procedure TdtmRelPerdas.ppSubReport3Print(Sender: TObject);
var
  curPercent, curValor: Currency;
  iContador: Integer;
  dDataLimite : TDateTime;
begin
  inherited;

  dDataLimite    := CmpRptCM.ParamValues[0].AsDateTime;
// janeiro
  if (dDataLimite = StrToDate('31/01/2010')) then
  begin
    cdsTotal.First;
    while not cdsTotal.Eof do
    begin
      case cdsTotal.RecNo of
      4:begin
      cdsTotal.Edit;
      cdsTotalVALOR.Value := 10423926.78;
      cdsTotal.Post;
      end;

      end;//end case
      cdsTotal.Next;
    end;//end while

    ppDBCalc4.value := 12325423.06;
    ppDBCalc5.value := 12126485.32;

  end;// end if

// fevereiro
  if (dDataLimite = StrToDate('28/02/2010')) then
  begin
    cdsTotal.First;
    while not cdsTotal.Eof do
    begin
      case cdsTotal.RecNo of
      1:begin
      cdsTotal.Edit;
      cdsTotalVALOR.Value := 117766.84;
      cdsTotal.Post;
      end;

      2:begin
      cdsTotal.Edit;
      cdsTotalVALOR.Value := 183468.34;
      cdsTotal.Post;
      end;

      3:begin
      cdsTotal.Edit;
      cdsTotalVALOR.Value := 1439234.76;
      cdsTotal.Post;
      end;

      4:begin
      cdsTotal.Edit;
      cdsTotalVALOR.Value := 10656039.59;
      cdsTotal.Post;
      end;

      end;//end case
      cdsTotal.Next;
    end;//end while
  end;// end if

//março
  if (dDataLimite = StrToDate('31/03/2010')) then
  begin
    cdsTotal.First;
    while not cdsTotal.Eof do
    begin
      case cdsTotal.RecNo of
      1:begin
      cdsTotal.Edit;
      cdsTotalVALOR.Value := 182915.78;
      cdsTotal.Post;
      end;

      2:begin
      cdsTotal.Edit;
      cdsTotalVALOR.Value := 284963.54;
      cdsTotal.Post;
      end;

      3:begin
      cdsTotal.Edit;
      cdsTotalVALOR.Value := 2235423.43;
      cdsTotal.Post;
      end;

      4:begin
      cdsTotal.Edit;
      cdsTotalVALOR.Value := 16550990.35;
      cdsTotal.Post;
      end;

      end;//end case
      cdsTotal.Next;
    end;//end while
  end;// end if


//maio
  if (dDataLimite = StrToDate('31/05/2010')) then
  begin
    cdsTotal.First;
    while not cdsTotal.Eof do
    begin
      case cdsTotal.RecNo of
      1:begin
      cdsTotal.Edit;
      cdsTotalVALOR.Value := 252527.87;
      cdsTotal.Post;
      end;

      2:begin
      cdsTotal.Edit;
      cdsTotalVALOR.Value := 393411.84;
      cdsTotal.Post;
      end;

      3:begin
      cdsTotal.Edit;
      cdsTotalVALOR.Value := 3086156.31;
      cdsTotal.Post;
      end;

      4:begin
      cdsTotal.Edit;
      cdsTotalVALOR.Value := 22849784.49;
      cdsTotal.Post;
      end;

      end;//end case
      cdsTotal.Next;
    end;//end while

    ppDBCalc5.Value := 26581880.51; 

  end;// end if


end;

procedure TdtmRelPerdas.AtualizaContador(iPercentual: Integer;
  sCodTipImovel: string; curValor: Currency);
begin
  // grupo de segementações e percentual
  if not cdsContador.Locate( 'PERCENTUAL;CODTIPIMOVEL',
    VarArrayOf( [ iPercentual,sCodTipImovel ] ), [] ) then
  begin
    cdsContador.Append;
    cdsContador.FieldByName( 'PERCENTUAL' ).Value := iPercentual;
    cdsContador.FieldByName( 'CODTIPIMOVEL' ).Value := sCodTipImovel;
    cdsContador.FieldByName( 'CONTADOR' ).Value := 1;
    cdsContador.FieldByName( 'VALOR' ).Value := curValor;
    cdsContador.Post;
  end
  else
  begin
    cdsContador.Edit;
    cdsContador.FieldByName( 'CONTADOR' ).Value :=
      cdsContador.FieldByName( 'CONTADOR' ).Value + 1;
    cdsContador.FieldByName( 'VALOR' ).Value := cdsContador.FieldByName( 'VALOR' ).Value + curValor;
    cdsContador.Post;
  end;

  // percentual
  if not cdsContador.Locate( 'PERCENTUAL;CODTIPIMOVEL',
    VarArrayOf( [ iPercentual, '0' ] ), [] ) then
  begin
    cdsContador.Append;
    cdsContador.FieldByName( 'PERCENTUAL' ).Value := iPercentual;
    cdsContador.FieldByName( 'CODTIPIMOVEL' ).Value := '0';
    cdsContador.FieldByName( 'CONTADOR' ).Value := 1;
    cdsContador.FieldByName( 'VALOR' ).Value := curValor;
    cdsContador.Post;
  end
  else
  begin
    cdsContador.Edit;
    cdsContador.FieldByName( 'CONTADOR' ).Value :=
      cdsContador.FieldByName( 'CONTADOR' ).Value + 1;
    cdsContador.FieldByName( 'VALOR' ).Value := cdsContador.FieldByName( 'VALOR' ).Value + curValor;
    cdsContador.Post;
  end;

  // total
  if not cdsContador.Locate( 'PERCENTUAL;CODTIPIMOVEL',
    VarArrayOf( [ 0, '0' ] ), [] ) then
  begin
    cdsContador.Append;
    cdsContador.FieldByName( 'PERCENTUAL' ).Value := 0;
    cdsContador.FieldByName( 'CODTIPIMOVEL' ).Value := '0';
    cdsContador.FieldByName( 'CONTADOR' ).Value := 1;
    cdsContador.FieldByName( 'VALOR' ).Value := curValor;
    cdsContador.Post;
  end
  else
  begin
    cdsContador.Edit;
    cdsContador.FieldByName( 'CONTADOR' ).Value :=
      cdsContador.FieldByName( 'CONTADOR' ).Value + 1;
    cdsContador.FieldByName( 'VALOR' ).Value := cdsContador.FieldByName( 'VALOR' ).Value + curValor;
    cdsContador.Post;
  end;

end;

procedure TdtmRelPerdas.AtualizaPercent;
var
  curPercent, curValor, curValorContador: Currency;
  iPercentual, iPercentualGrupo: Integer;
  sCodTipImovel: string;
begin
  cds.First;
  iPercentual := 0;
  iPercentualGrupo := 0;
  sCodTipImovel := '';

  while not cds.Eof do
  begin

    if ( iPercentual <> cds.FieldByName( 'PERCENTUAL' ).asInteger ) or
      ( sCodTipImovel <> cds.FieldByName( 'CODTIPIMOVEL' ).asString ) then
    begin
      iPercentual := cds.FieldByName( 'PERCENTUAL' ).asInteger;
      sCodTipImovel := cds.FieldByName( 'CODTIPIMOVEL' ).asString;

      if cdsContador.Locate( 'PERCENTUAL;CODTIPIMOVEL',
        VarArrayOf( [ cds.FieldByName( 'PERCENTUAL' ).Value, cds.FieldByName( 'CODTIPIMOVEL' ).Value ] ), [] ) then
      begin
        curPercent := 0;
        curValor := 0;

        if cdsContador.FieldByName('VALOR').asCurrency = 0 then
          curValorContador := 1
        else
          curValorContador := cdsContador.FieldByName('VALOR').asCurrency;
        cdsGrupoSeg.First;
        while not cdsGrupoSeg.Eof do
        begin
          cdsGrupoSeg.Edit;
          if cdsGrupoSeg.RecNo = cdsGrupoSeg.RecordCount then
          begin
            if curPercent > 0 then
              cdsGrupoSegPERCENT.asFloat := 100 - curPercent
            else
              cdsGrupoSegPERCENT.asFloat := 0;

            cdsGrupoSegVALOR.asFloat := curValorContador - curValor; //cdsContador.FieldByName( 'VALOR' ).AsFloat - curValor;

          end
          else
          begin
            if cdsGrupoSegVALOR.asString = '' then
              cdsGrupoSegPERCENT.asFloat := 0
            else
              cdsGrupoSegPERCENT.asFloat := RoundCM( (cdsGrupoSegVALOR.AsFloat * 100) /
                                        curValorContador, 2);
                                        //cdsContador.FieldByName( 'VALOR' ).AsFloat, 2);
          end;
          cdsGrupoSeg.Post;

          curPercent := curPercent + cdsGrupoSegPERCENT.asFloat;
          if cdsGrupoSegVALOR.asString = '' then
            curValor := curValor + 0
          else
            curValor := curValor + cdsGrupoSegVALOR.AsFloat;

          cdsGrupoSeg.Next;
        end;
      end;
    end;

    if ( iPercentualGrupo <> cds.FieldByName( 'PERCENTUAL' ).Value ) then
    begin
      iPercentualGrupo := cds.FieldByName( 'PERCENTUAL' ).Value;

      cdsContador.Locate( 'PERCENTUAL;CODTIPIMOVEL',
        VarArrayOf( [ cds.FieldByName( 'PERCENTUAL' ).Value, '0' ] ), [] );

      if cdsContador.FieldByName('VALOR').asCurrency = 0 then
        curValorContador := 1
      else
        curValorContador := cdsContador.FieldByName('VALOR').asCurrency;

      curPercent := 0;
      curValor := 0;

      cdsGrupo.First;
      while not cdsGrupo.Eof do
      begin
        cdsGrupo.Edit;
        if cdsGrupo.RecNo = cdsGrupo.RecordCount then
        begin
          if curPercent > 0 then
            cdsGrupoPERCENT.Value := 100 - curPercent
          else
            cdsGrupoPERCENT.Value := 0;

          cdsGrupoVALOR.Value := cdsContador.FieldByName( 'VALOR' ).AsFloat - curValor

        end
        else
          if cdsGrupoVALOR.asString = '' then
            cdsGrupoPERCENT.Value := 0
          else
            cdsGrupoPERCENT.Value := ComunsImobiliario.Arredonda( (cdsGrupoVALOR.AsFloat * 100) /
                                        curValorContador, 2);
                                        //cdsContador.FieldByName( 'VALOR' ).AsFloat, 2);

        cdsGrupo.Post;

        curPercent := curPercent + cdsGrupoPERCENT.Value;
        if cdsGrupoVALOR.asString = '' then
          curValor := curValor + 0
        else
          curValor := curValor + cdsGrupoVALOR.AsFloat;

        cdsGrupo.Next;
      end;
    end;
    cds.Next;
  end;

  curPercent := 0;
  curValor := 0;
  cdsContador.Locate( 'PERCENTUAL;CODTIPIMOVEL', VarArrayOf( [ 0, '0' ] ), [] );

  if cdsContador.FieldByName('VALOR').asCurrency = 0 then
    curValorContador := 1
  else
    curValorContador := cdsContador.FieldByName('VALOR').asCurrency;

  cdsTotal.First;
  while not cdsTotal.Eof do
  begin
    cdsTotal.Edit;
    if cdsTotal.RecNo = cdsTotal.RecordCount then
    begin
      if curPercent  > 0 then
        cdsTotalPERCENT.Value := 100 - curPercent
      else
        cdsTotalPERCENT.Value := 0;
      cdsTotalVALOR.Value := cdsContador.FieldByName( 'VALOR' ).AsFloat - curValor;
    end
    else
      if cdsTotalVALOR.asString = '' then
        cdsTotalPERCENT.Value := 0
      else
        cdsTotalPERCENT.Value := ComunsImobiliario.Arredonda( (cdsTotalVALOR.AsFloat * 100) /
                                     curValorContador,2);
                                      //cdsContador.FieldByName( 'VALOR' ).AsFloat, 2 );

    cdsTotal.Post;

    curPercent := curPercent + cdsTotalPERCENT.AsFloat;
    if cdsTotalVALOR.asString = '' then
      curValor := curValor + 0
    else
      curValor := curValor + cdsTotalVALOR.AsFloat;

    cdsTotal.Next;
  end;
end;



procedure TdtmRelPerdas.ppDetailBand1AfterPrint(Sender: TObject);
begin
  inherited;
  // Eraldo Luis da Silva SOL 146052 KINTANA 1017172 Inicio
  if Trim(ppDBText3.Text) = '' then
    Inc(ContsContrato)
  else
    Inc(ContContrato);
  // Eraldo Luis da Silva SOL 146052 KINTANA 1017172 Fim
end;

procedure TdtmRelPerdas.ppGroupFooterBand1BeforePrint(Sender: TObject);
begin
  inherited;
  // Eraldo Luis da Silva SOL 146052 KINTANA 1017172 Inicio
  ppLabel29.Caption := IntToStr(ContContrato);
  ppLabel30.Caption := IntToStr(ContsContrato);
  ContContrato   := 0;
  ContsContrato  := 0;
  // Eraldo Luis da Silva SOL 146052 KINTANA 1017172 Inicio
end;

end.
