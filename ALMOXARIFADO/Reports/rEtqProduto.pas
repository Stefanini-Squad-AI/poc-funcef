unit rEtqProduto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, ppBands,
  ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, Wwdatsrc, ppDB,
  ppComm, ppRelatv, ppDBPipe, ppDBBDE, uCmRptManager, TXComp, CmParamReport;

type
  TRptEtqProduto = class(TFrmCmReport)
    bdeEtqProduto: TppBDEPipeline;
    bdeEtqProdutoppField1: TppField;
    bdeEtqProdutoppField2: TppField;
    bdeEtqProdutoppField3: TppField;
    bdeEtqProdutoppField4: TppField;
    bdeEtqProdutoppField5: TppField;
    bdeEtqProdutoppField6: TppField;
    bdeEtqProdutoppField7: TppField;
    dsEtqProduto: TwwDataSource;
    RptEtqProduto: TppReport;
    ppColumnHeaderBand1: TppColumnHeaderBand;
    ppDetailBand31: TppDetailBand;
    ppDBText97: TppDBText;
    ppLabel227: TppLabel;
    ppLabel228: TppLabel;
    ppDBText98: TppDBText;
    ppLabel229: TppLabel;
    ppDBText99: TppDBText;
    ppDBText100: TppDBText;
    ppDBText101: TppDBText;
    ppLabel230: TppLabel;
    ppLabel286: TppLabel;
    ppLabel287: TppLabel;
    ppDBText141: TppDBText;
    ppDBText142: TppDBText;
    ppColumnFooterBand1: TppColumnFooterBand;
    SqlEtqProduto: TCMSqlParams;
    CdsEtqProduto: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptEtqProduto: TRptEtqProduto;

implementation

Uses uString;

{$R *.DFM}

procedure TRptEtqProduto.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  With SqlEtqProduto Do Begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT A.CODARTIGO, ');
       Sql.Add('       P.CODGRUPOPROD, ');
       Sql.Add('       P.CODMEDCUSTO, ');
       Sql.Add('       G.DESCGRUPOPROD, ');
       Sql.Add('       S.ESTMAXIMO, ');
       Sql.Add('       S.ESTMINUSADO, ');
       Sql.Add('       ( P.DESCPROD || '' '' || A.CODTAMANHO || '' '' || A.CODCOR ) AS DESCRICAO ');
       Sql.Add('  FROM SALDO S, ');
       Sql.Add('       PRODUTO P, ');
       Sql.Add('       ARTIGO A, ');
       Sql.Add('       GRUPPROD G ');
       Sql.Add(' WHERE ( S.CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ');

       If Not CmpRptCM.ParamValues[ 1 ].IsNull Then
          Sql.Add('   AND ( A.CODARTIGO = ' + QuotedStr( Espaco( Trim( CmpRptCM.ParamValues[ 1 ].AsString ), 14 ) ) + ' ) ')
       Else
          If not CmpRptCM.ParamValues[ 2 ].IsNull Then
             Sql.Add('   AND ( P.CODGRUPOPROD = ' + QuotedStr( Espaco( Trim( CmpRptCM.ParamValues[ 2 ].AsString ), 10 ) ) + ' ) ');

       Sql.Add('   AND ( A.CODARTIGO = S.CODARTIGO ) ');
       Sql.Add('   AND ( P.CODPRODUTO = A.CODPRODUTO ) ');
       Sql.Add('   AND ( P.CODGRUPOPROD = G.CODGRUPOPROD ) ');

       Case CmpRptCM.ParamValues[ 3 ].AsInteger of
            0: Sql.Add(' ORDER BY DESCRICAO');
            1: Sql.Add(' ORDER BY A.CODARTIGO');
       End;

       Open;
  End;
end;

end.
