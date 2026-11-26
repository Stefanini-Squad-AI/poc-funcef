// Alterações:
//------------------------------------------------------------------------------
//Pendência   : SOL 253577/17819 PPM 1104948
//Responsável : Helio Lima Custódio
//Data        : 28/12/2015
//Descrição   : Criação da tela
//------------------------------------------------------------------------------

unit dRelProvPerdas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, DBTables, Wwquery, Wwdatsrc, ppProd, ppClass, ppReport,
  ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppVar, ppPrnabl,
  ppBands, ppCache, ppStrtch, ppSubRpt;

type
  TRptProvPerdas = class(TFrmCmReport)
    ppRelProvPerdas: TppBDEPipeline;
    rpRelProvPerdas: TppReport;
    dsRelProvPerdas: TwwDataSource;
    qryRelProvPerdas: TwwQuery;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppImage2: TppImage;
    lbl_Titulo: TppLabel;
    ppLabel16: TppLabel;
    ppLabel28: TppLabel;
    ppLabel37: TppLabel;
    ppLabel41: TppLabel;
    ppLine9: TppLine;
    ppSubTotais: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppDetailBand3: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppDBText2: TppDBText;
    ppDBText1: TppDBText;
    ppDBText3: TppDBText;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppLabel14: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    UpdateRel: TUpdateSQL;
    ppLine1: TppLine;
    ppTxtPagAtual: TppSystemVariable;
    ppTotPag: TppSystemVariable;
    ppLabel15: TppLabel;
    ppDBText14: TppDBText;
    ppLblValorProv: TppLabel;
    ppLabel17: TppLabel;
    ppDBText9: TppDBText;
    qryRelProvPerdasIDPROVPERDASCONTRIB: TStringField;
    qryRelProvPerdasMATRICULA: TStringField;
    qryRelProvPerdasIDPESSOA: TStringField;
    qryRelProvPerdasNOMEPESSOA: TStringField;
    qryRelProvPerdasIDPLANOPREVCONTAB: TStringField;
    qryRelProvPerdasNOMEPLANOPREVCONTAB: TStringField;
    qryRelProvPerdasMESREFERENCIA: TStringField;
    qryRelProvPerdasVALORINADIMPLENCIA: TFloatField;
    qryRelProvPerdasDATAPRIMEIRAINADIMPLENCIA: TDateTimeField;
    qryRelProvPerdasPERCENTUALPROVISAO: TFloatField;
    qryRelProvPerdasVALORPROVISAO: TFloatField;
    qryRelProvPerdasQTDEDIASATRASO: TStringField;
    qryRelProvPerdasIDCONTRIBUICAO: TStringField;
    qryRelProvPerdasNOMECONTRIBUICAO: TStringField;
    qryRelProvPerdasIDSITFUNC: TStringField;
    qryRelProvPerdasDESCSITFUNC: TStringField;
    qryRelProvPerdasPLNCODIGO: TStringField;
    qryRelProvPerdasVALORTOTINAD: TFloatField;
    qryRelProvPerdasVALORTOTPROV: TFloatField;
    qryRelProvPerdasDATAPROVISAO: TStringField;
    procedure ppFooterBand1BeforePrint(Sender: TObject);
    procedure ppLblValorProvPrint(Sender: TObject);
  private
    procedure AbreQryRelProvPerdas(pMatricula,
                                   pIdPessJur,
                                   pIdPlanoPrevContab,
                                   pIdPlanoPrev,
                                   pIdSitFunc,
                                   pMesCobranca : String;
                                   pLstIdContrib : TStringList;
                                   pOrderByPor : String);
  public
    procedure MostraRelatorio(pMatricula,
                              pIdPessJur,
                              pIdPlanoPrevContab,
                              pIdPlanoPrev,
                              pIdSitFunc,
                              pMesCobranca : String;
                              pLstIdContrib : TStringList;
                              pOrderByPor : String);
  end;

var
  RptProvPerdas: TRptProvPerdas;

implementation

{$R *.DFM}

uses FPreviewExpEx;

procedure TRptProvPerdas.AbreQryRelProvPerdas(pMatricula,
                                              pIdPessJur,
                                              pIdPlanoPrevContab,
                                              pIdPlanoPrev,
                                              pIdSitFunc,
                                              pMesCobranca : String;
                                              pLstIdContrib : TStringList;
                                              pOrderByPor : String);
var
      i : Integer;
      sqlWhereOuAnd : String;
begin
        qryRelProvPerdas.Close;

        qryRelProvPerdas.SQL.Clear;

        qryRelProvPerdas.SQL.Text := 'SELECT TO_CHAR(PROV.IDPROVPERDASCONTRIB) AS IDPROVPERDASCONTRIB,' + #13#10 +
                                     '       EL.MATRICULA,' + #13#10 +
                                     '       TO_CHAR(IDPESSOA) AS IDPESSOA,'  + #13#10 +
                                     '       P.NOME AS NOMEPESSOA,' + #13#10 +
                                     '       TO_CHAR(PROV.IDPLANOPREVCONTAB) AS IDPLANOPREVCONTAB,' + #13#10 +
                                     '       PLPREVC.NOME AS NOMEPLANOPREVCONTAB,' + #13#10 +
                                     '       PROV.MESREFERENCIA,' + #13#10 +
                                     '       CASE WHEN PROV.FLGREVERSAO = 1 THEN (PROV.VALORINADIMPLENCIA * -1) ELSE PROV.VALORINADIMPLENCIA END AS VALORINADIMPLENCIA,' + #13#10 +
                                     '       PROV.DATAPRIMEIRAINADIMPLENCIA,' + #13#10 +
                                     '       PROV.PERCENTUALPROVISAO,' + #13#10 +
                                     '       CASE WHEN PROV.FLGREVERSAO = 1 THEN (PROV.VALORPROVISAO * -1) ELSE PROV.VALORPROVISAO END AS VALORPROVISAO,' + #13#10 +
                                     '       TO_CHAR(PROV.QTDEDIASATRASO) AS QTDEDIASATRASO,' + #13#10 +
                                     '       TO_CHAR(PROV.IDCONTRIBUICAO) AS IDCONTRIBUICAO,' + #13#10 +
                                     '       CONTRIB.NOME AS NOMECONTRIBUICAO,' + #13#10 +
                                     '       TO_CHAR(EL.IDSITFUNC) AS IDSITFUNC,' + #13#10 +
                                     '       SITF.DESCRICAO AS DESCSITFUNC,' + #13#10 +
                                     '       TO_CHAR(PROV.PLNCODIGO) AS PLNCODIGO,' + #13#10 +
                                     '       SUM( CASE WHEN FLGREVERSAO = 1 THEN 0 ELSE  PROV.VALORINADIMPLENCIA END) OVER()' + #13#10 +
                                     '       - SUM( CASE WHEN FLGREVERSAO = 0 THEN 0 ELSE  PROV.VALORINADIMPLENCIA END) OVER()' + #13#10 +
                                     '       AS VALORTOTINAD,' + #13#10 +
                                     '       SUM( CASE WHEN FLGREVERSAO = 1 THEN 0 ELSE  PROV.VALORPROVISAO END) OVER()' + #13#10 +
                                     '       - SUM( CASE WHEN FLGREVERSAO = 0 THEN 0 ELSE  PROV.VALORPROVISAO END) OVER()' + #13#10 +
                                     '       AS VALORTOTPROV,' + #13#10 +
                                     '       TO_CHAR(PROV.TRGDTINCLUSAO, ''DD/MM/YYYY'') AS DATAPROVISAO' + #13#10 +
                                     '' + #13#10 +
                                     '  FROM PROVISAOPERDASCONTRIBUICAO PROV' + #13#10 +
                                     '' + #13#10 +
                                     '  LEFT JOIN ELEGPATRO EL' + #13#10 +
                                     '    ON EL.IDPESSOA = PROV.IDPESSOA' + #13#10 +
                                     '   AND EL.IDPESSJUR = PROV.IDPESSJUR' + #13#10 +
                                     '' + #13#10 +
                                     ' INNER JOIN PESSOA P' + #13#10 +
                                     '    ON P.IDPESSOA = PROV.IDPESSOA' + #13#10 +
                                     '' + #13#10 +
                                     ' INNER JOIN PLANPREVCONTABIL PLPREVC' + #13#10 +
                                     '    ON PLPREVC.IDPLANOPREV = PROV.IDPLANOPREVCONTAB' + #13#10 +
                                     '' + #13#10 +
                                     ' INNER JOIN CONTRIBUICAO CONTRIB' + #13#10 +
                                     '    ON CONTRIB.IDCONTRIBUICAO = PROV.IDCONTRIBUICAO' + #13#10 +
                                     '' + #13#10 +
                                     '  LEFT JOIN SITFUNC SITF' + #13#10 +
                                     '    ON SITF.IDSITFUNC = EL.IDSITFUNC';

    sqlWhereOuAnd := 'WHERE';

     if pMatricula <> '' then
     begin
          qryRelProvPerdas.SQL.Add(sqlWhereOuAnd + ' EL.MATRICULA = ' + QuotedStr(pMatricula));
          sqlWhereOuAnd := 'AND';
     end;

     if pIdPessJur <> '' then
     begin
          qryRelProvPerdas.SQL.Add(sqlWhereOuAnd + ' PROV.IDPESSJUR = ' + pIdPessJur);
          sqlWhereOuAnd := 'AND';
     end;

     if pIdPlanoPrevContab <> '' then
     begin
          qryRelProvPerdas.SQL.Add(sqlWhereOuAnd + ' PROV.IDPLANOPREVCONTAB = ' + pIdPlanoPrevContab);
          sqlWhereOuAnd := 'AND';
     end;

     if pIdPlanoPrev <> '' then
     begin
          qryRelProvPerdas.SQL.Add(sqlWhereOuAnd + ' PROV.IDPLANOPREV = ' + pIdPlanoPrev);
          sqlWhereOuAnd := 'AND';
     end;

     if pIdSitFunc <> '' then
     begin
          qryRelProvPerdas.SQL.Add(sqlWhereOuAnd + ' EL.IDSITFUNC = ' + pIdSitFunc);
          sqlWhereOuAnd := 'AND';
     end;



     if (assigned(pLstIdContrib)) and
        (pLstIdContrib.Count > 0) then
     begin
          qryRelProvPerdas.SQL.Add(sqlWhereOuAnd + ' PROV.IDCONTRIBUICAO IN (');
          qryRelProvPerdas.SQL.Add('                       ' + pLstIdContrib[0]);
     end;

     if (assigned(pLstIdContrib)) then
     for i := 1 to pLstIdContrib.Count -1 do
     begin
            qryRelProvPerdas.SQL.Add('                       ,' + pLstIdContrib[i]);
     end;

     if (assigned(pLstIdContrib)) and
        (pLstIdContrib.Count > 0) then
            qryRelProvPerdas.SQL.Add('                      )'); //FECHA PROV.IDCONTRIBUICAO IN (



     if pOrderByPor <> '' then
          qryRelProvPerdas.SQL.Add(' ORDER BY ' + pOrderByPor);

     qryRelProvPerdas.Open;
end;

procedure TRptProvPerdas.MostraRelatorio(pMatricula,
                                         pIdPessJur,
                                         pIdPlanoPrevContab,
                                         pIdPlanoPrev,
                                         pIdSitFunc,
                                         pMesCobranca : String;
                                         pLstIdContrib : TStringList;
                                         pOrderByPor : String);
begin
       try
           AbreQryRelProvPerdas(pMatricula,
                                pIdPessJur,
                                pIdPlanoPrevContab,
                                pIdPlanoPrev,
                                pIdSitFunc,
                                pMesCobranca,
                                pLstIdContrib,
                                pOrderByPor);

           TFrmPreviewExpEx.CreateModalPreview(Application,
                                               rpRelProvPerdas,
                                               'Relatório de Provisão para Perdas',
                                               dsRelProvPerdas);

       finally
           qryRelProvPerdas.Close;
       end;
end;

procedure TRptProvPerdas.ppFooterBand1BeforePrint(Sender: TObject);
begin
  inherited;
  if ppTxtPagAtual.GetText = ppTotPag.GetText then
       ppSubTotais.Visible := True
  else
       ppSubTotais.Visible := False;
end;

procedure TRptProvPerdas.ppLblValorProvPrint(Sender: TObject);
var
    valorProvisao : String;
begin
  inherited;
  valorProvisao := qryRelProvPerdas.FieldByName('VALORPROVISAO').AsString;
  ppLblValorProv.Caption := 'R$ ' + valorProvisao;//FormatFloat('#,##0.00',  valorProvisao);
end;

end.
