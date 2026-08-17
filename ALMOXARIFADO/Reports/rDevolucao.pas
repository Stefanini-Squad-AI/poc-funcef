unit rDevolucao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, Wwdatsrc, ppDB,
  ppDBPipe, ppDBBDE, ppCtrls, ppBands, ppClass, ppVar, ppPrnabl, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, uCmRptManager, TXComp, CmParamReport;

type
  TRptDevolucao = class(TFrmCmReport)
    rpDevolucao: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel7: TppLabel;
    LblEmpresa: TppLabel;
    lbDataDevolucao: TppLabel;
    ppLabel10: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppLine1: TppLine;
    LblSistema: TppLabel;
    ppCalc5: TppSystemVariable;
    ppCalc6: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText8: TppDBText;
    ppLabel12: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel13: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppShape1: TppShape;
    ppLabel14: TppLabel;
    ppDBText9: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppDBText10: TppDBText;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppDBText11: TppDBText;
    ppLabel24: TppLabel;
    rpDevolucaoLabel1: TppLabel;
    rpDevolucaoDBText1: TppDBText;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLabel25: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    pplDevolucao: TppBDEPipeline;
    dsDevolucao: TwwDataSource;
    SqlDevolucao: TCMSqlParams;
    CdsDevolucao: TCMClientDataSet;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptDevolucao: TRptDevolucao;
  sNomeAlmox: String = '';

implementation

{$R *.DFM}

procedure TRptDevolucao.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamByName( 'Almoxarifado' ).LookupSettings.SQL.Text := 'SELECT CODALMOXARIFADO, DESCALMOX FROM ALMOX WHERE IDPESSOA = ' +
                        FloatToStr( CrmRptCM.IdEmpresa ) + ' ORDER BY 2';
  CmpRptCM.ParamByName( 'DataInicial' ).TextDefault := DateToStr( Date );
  CmpRptCM.ParamByName( 'DataFinal' ).TextDefault   := DateToStr( Date );
end;

procedure TRptDevolucao.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  CdsDevolucao.Close;

  With SqlDevolucao Do Begin
       Close;
       Sql.Text := 'SELECT AL.DESCALMOX AS ALMOXARIFADO, ' +
                          'P.NOME AS FORNECEDOR, ' +
                          'NF.DATAENTDEVOL AS DATAEMISNF, ' +
                          'DECODE( NF.COMPLNF, '''', TO_CHAR( NF.NUMNF ), RTRIM( TO_CHAR( NF.NUMNF ), '' '' ) || ''/'' || NF.COMPLNF ) AS NNF, ' +
                          'AR.CODARTIGO, ' +
                          'SUBSTR( DECODE( IT.IDPRODVARI, NULL, PR.DESCPROD || '' '' || RTRIM( AR.CODCOR, '' '' ) || '' '' || RTRIM( AR.CODTAMANHO ), PV.DESCPRODVARI ), 1, 60 ) AS PRODUTO, ' +
                          'IT.QTDERECEBDEVOL, ' +
                          'NF.VLRNOTAFISCAL, ' +
                          'IT.VLRUNITARIO, ' +
                          '( IT.QTDERECEBDEVOL * IT.VLRUNITARIO ) AS VALORTOTAL, ' +
                          '( ( IT.QTDERECEBDEVOL * IT.VLRUNITARIO ) - IT.VLRESTOQUE ) AS ACDES, ' +
                          'IT.VLRESTOQUE ' +
                     'FROM ALMOX AL, ARTIGO AR, PRODUTO PR, ITENSRECEBDEVOL IT, NFRECEBDEVOL NF, PESSOA P, PRODVARI PV ' +
                    'WHERE ( NF.IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ' +
                      'AND ( NF.DATAENTDEVOL >= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 0 ].AsString ) + ', ''DD/MM/YYYY'' ) ) ' +
                      'AND ( NF.DATAENTDEVOL <= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 1 ].AsString ) + ', ''DD/MM/YYYY'' ) ) ';

       If Not CmpRptCM.ParamValues[ 2 ].IsNull then
          Sql.add( 'AND ( AL.CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 2 ].AsString + ' ) ' );

       Sql.Add(   'AND ( FLGTIPONOTA = ''D'' ) ' +
                  'AND ( NF.IDFORCLI = P.IDPESSOA ) ' +
                  'AND ( IT.IDNFRECEBDEVOL = NF.IDNFRECEBDEVOL ) ' +
                  'AND ( IT.CODALMOXARIFADO = AL.CODALMOXARIFADO ) ' +
                  'AND ( IT.CODARTIGO = AR.CODARTIGO ) ' +
                  'AND ( AR.CODPRODUTO = PR.CODPRODUTO ) ' +
                  'AND ( IT.IDPRODVARI = PV.IDPRODVARI(+) ) ' +
                'ORDER BY ALMOXARIFADO, DATAEMISNF, FORNECEDOR, NNF');
       Open;
  End;
  
  lbDataDevolucao.caption := CmpRptCM.ParamValues[ 0 ].AsString + ' à ' + CmpRptCM.ParamValues[ 1 ].AsString;
end;

procedure TRptDevolucao.CmpRptCMParamControlExit(Sender: TPainelControles;
  Index: Integer);
begin
  inherited;
  Case Index of
       2: sNomeAlmox := Sender.CtrlLookup.Text;
  End;
end;

end.
