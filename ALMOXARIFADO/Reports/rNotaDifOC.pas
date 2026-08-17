unit rNotaDifOC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, DBClient,
  uCMClientDataSet, uCmSqlParams, ppBands, ppClass, ppVar, ppCtrls,
  ppPrnabl, ppCache, ppProd, ppReport, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE;

type
  TRptNotaDifOC = class(TFrmCmReport)
    bdeNotaDifOC: TppBDEPipeline;
    dsNotaDifOC: TwwDataSource;
    RptNotaDifOC: TppReport;
    ppHeaderBand39: TppHeaderBand;
    ppLabel271: TppLabel;
    ppLine118: TppLine;
    LblEmpresa: TppLabel;
    LbPer20: TppLabel;
    ppLine120: TppLine;
    ppLabel276: TppLabel;
    ppLabel277: TppLabel;
    ppLabel278: TppLabel;
    ppLine121: TppLine;
    ppLine122: TppLine;
    ppLabel279: TppLabel;
    ppLabel280: TppLabel;
    ppLabel281: TppLabel;
    ppLabel282: TppLabel;
    ppLabel283: TppLabel;
    ppLabel284: TppLabel;
    ppDetailBand35: TppDetailBand;
    ppDBText130: TppDBText;
    ppDBText132: TppDBText;
    ppDBText133: TppDBText;
    ppDBText134: TppDBText;
    ppDBText135: TppDBText;
    ppDBText136: TppDBText;
    ppDBText137: TppDBText;
    ppDBText138: TppDBText;
    ppFooterBand40: TppFooterBand;
    ppLine119: TppLine;
    LblSistema: TppLabel;
    ppSystemVariable11: TppSystemVariable;
    ppSystemVariable12: TppSystemVariable;
    ppGroup12: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppDBText131: TppDBText;
    ppLabel275: TppLabel;
    ppLine123: TppLine;
    ppLabel285: TppLabel;
    ppDBText139: TppDBText;
    ppGroupFooterBand7: TppGroupFooterBand;
    SqlNotaDifOC: TCMSqlParams;
    CdsNotaDifOC: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptNotaDifOC: TRptNotaDifOC;

implementation

{$R *.DFM}

procedure TRptNotaDifOC.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  lbPer20.Caption := 'De ' + CmpRptCM.ParamValues[ 0 ].AsString + ' a ' + CmpRptCM.ParamValues[ 1 ].AsString;

  With SqlNotaDifOC Do Begin
       Close;
       Sql.Clear;
       Sql.Append('SELECT INF.IDITEMOC, ');
       Sql.Append('       INF.CODARTIGO, ');
       Sql.Append('       O.NUMOC, ');
       Sql.Append('       IO.CODMEDIDA, ');
       Sql.Append('       ( TO_CHAR( NF.NUMNF ) || ''/'' || NF.COMPLNF ) AS NUMNOTA, ');
       Sql.Append('       ROUND( IO.VALORUN, 2 ) AS VALOROC, ');
       Sql.Append('       ROUND( ( INF.VLRUNITARIO / CR.FATOR * CM.FATOR ), 2 ) AS VALORNF, ');
       Sql.Append('       ROUND( IO.QTDEPEDIDA, 2 ) AS QTDEOC, ');
       Sql.Append('       ROUND( ( INF.QTDERECEBDEVOL * CR.FATOR / CM.FATOR ), 2 ) AS QTDENF,');
       Sql.Append('       P.DESCPROD, ');
       Sql.Append('       PE.RAZAOSOCIAL, ');
       Sql.Append('       NF.DATAENTDEVOL ');
       Sql.Append('  FROM NFRECEBDEVOL NF, ');
       Sql.Append('       ITENSRECEBDEVOL INF, ');
       Sql.Append('       PESSOA PE, ');
       Sql.Append('       ITEMOC IO, ');
       Sql.Append('       OC O, ');
       Sql.Append('       ARTIGO A, ');
       Sql.Append('       PRODUTO P, ');
       Sql.Append('       CONVER CR, ');
       Sql.Append('       CONVER CM ');
       Sql.Append(' WHERE ( NF.FLGTIPONOTA = ''R'' ) ');
       Sql.Append('   AND ( NF.DATAENTDEVOL >= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 0 ].AsString ) + ', ''dd/mm/yyyy'' ) ) ');
       Sql.Append('   AND ( NF.DATAENTDEVOL <= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 1 ].AsString ) + ', ''dd/mm/yyyy'' ) ) ');
       Sql.Append('   AND ( NF.IDFORCLI = PE.IDPESSOA ) ');
       Sql.Append('   AND ( NF.IDNFRECEBDEVOL = INF.IDNFRECEBDEVOL ) ');
       Sql.Append('   AND ( INF.IDITEMOC = IO.IDITEMOC ) ');
       Sql.Append('   AND ( INF.CODARTIGO = A.CODARTIGO ) ');
       Sql.Append('   AND ( INF.CODMEDIDA = CR.CODMEDIDA ) ');
       Sql.Append('   AND ( IO.NUMOC = O.NUMOC ) ');
       Sql.Append('   AND ( IO.CODMEDIDA = CM.CODMEDIDA ) ');
       Sql.Append('   AND ( A.CODPRODUTO = P.CODPRODUTO ) ');
       Sql.Append('   AND ( CR.CODPRODUTO = P.CODPRODUTO ) ');
       Sql.Append('   AND ( CM.CODPRODUTO = P.CODPRODUTO ) ');

       Case CmpRptCM.ParamValues[ 2 ].AsInteger Of
            0: Sql.Append('   AND ( ROUND( IO.QTDEPEDIDA, 2 ) <> ROUND( ( INF.QTDERECEBDEVOL * CR.FATOR / CM.FATOR ), 2 ) ) ');
            1: Sql.Append('   AND ( ROUND( IO.VALORUN, 2 ) <> ROUND( ( INF.VLRUNITARIO / CR.FATOR * CM.FATOR ), 2 ) ) ');
            2: Sql.Append('   AND ( ( ROUND( IO.VALORUN, 2 ) <> ROUND( ( INF.VLRUNITARIO / CR.FATOR * CM.FATOR ), 2 ) ) OR ( ROUND( IO.QTDEPEDIDA, 2 ) <> ROUND( ( INF.QTDERECEBDEVOL * CR.FATOR / CM.FATOR ), 2 ) ) ) ');
       End;

       Sql.Append(' ORDER BY O.NUMOC, P.DESCPROD');
       Open;
  End;
end;

procedure TRptNotaDifOC.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamByName( 'DataInicial' ).TextDefault := DateToStr( Date );
  CmpRptCM.ParamByName( 'DataFinal' ).TextDefault   := DateToStr( Date );
end;

end.
