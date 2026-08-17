unit rTermoInvent;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, ppBands, ppVar,
  ppCtrls, ppStrtch, ppRichTx, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Wwdatsrc, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE,
  uCmRptManager, TXComp, CmParamReport;

type
  TRptTermoInvent = class(TFrmCmReport)
    bdeTermoInvent: TppBDEPipeline;
    dsTermoInvent: TwwDataSource;
    RptTermoInvent: TppReport;
    RptTermoInventTitleBand1: TppTitleBand;
    RptTermoInventChildReport1Label1: TppLabel;
    LbDataAbre: TppLabel;
    MemAbre: TppRichText;
    CabecTermoInvent: TppHeaderBand;
    ppLabel193: TppLabel;
    ppLine80: TppLine;
    LblEmpresa: TppLabel;
    RptTermoInvetLabel1: TppLabel;
    RptTermoInvetLabel2: TppLabel;
    RptTermoInvetLabel3: TppLabel;
    RptTermoInvetLabel4: TppLabel;
    RptTermoInvetLabel5: TppLabel;
    ppDetailBand25: TppDetailBand;
    RptTermoInvetDBText1: TppDBText;
    RptTermoInvetDBText2: TppDBText;
    RptTermoInvetDBText3: TppDBText;
    RptTermoInvetDBText4: TppDBText;
    RptTermoInvetDBText5: TppDBText;
    ppFooterBand31: TppFooterBand;
    ppLine81: TppLine;
    LblSistema: TppLabel;
    ppCalc60: TppSystemVariable;
    ppCalc61: TppSystemVariable;
    RptTermoInvetSummaryBand1: TppSummaryBand;
    RptTermoInvetLabel6: TppLabel;
    MemFecha: TppRichText;
    SqlTermoInvent: TCMSqlParams;
    CdsTermoInvent: TCMClientDataSet;
    SqlTermo: TCMSqlParams;
    CdsTermo: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CabecTermoInventBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptTermoInvent: TRptTermoInvent;

implementation

{$R *.DFM}

procedure TRptTermoInvent.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  LbDataAbre.Caption := DateToStr( Date );
  SqlTermo.Prepare;
  SqlTermo.ParamByName( 'pIDPESSOA' ).AsFloat := CrmRptCM.IdEmpresa;
  SqlTermo.Open;

  While Not CdsTermo.Eof Do Begin
        If CdsTermo.FieldByName( 'FLGABREFECHA' ).AsString = 'A' Then
           memAbre.RichText  := CdsTermo.FieldByName( 'TEXTO' ).AsString
        Else
           memFecha.RichText := CdsTermo.FieldByName( 'TEXTO' ).AsString;

        CdsTermo.Next;
  End;

  CdsTermo.Close;

  With SqlTermoInvent Do Begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT A.CODARTIGO, ');
       Sql.Add('       P.CODMEDCUSTO, ');
       Sql.Add('       ( P.DESCPROD || '' '' || A.CODTAMANHO || '' '' || A.CODCOR ) AS DESCRICAO, ');
       Sql.Add('       DECODE( CM.SALDO, NULL, 0, CM.SALDO ) AS SALDO, ');
       Sql.Add('       DECODE( CM.VALOR, NULL, 0, CM.VALOR ) AS VALOR ');
       Sql.Add('  FROM ARTIGO A, ');
       Sql.Add('       PRODUTO P, ');
       Sql.Add('       ( SELECT CODARTIGO, ');
       Sql.Add('                SUM( SALDOQTDEUC ) AS SALDO, ');
       Sql.Add('                SUM( CUSTOMEDIO * SALDOQTDEUC ) AS VALOR ');
       Sql.Add('           FROM CUSTOMED ');
       Sql.Add('          GROUP BY CODARTIGO ');
       Sql.Add('       ) CM ');
       Sql.Add(' WHERE ( A.CODPRODUTO = P.CODPRODUTO ) ');

       Case CmpRptCM.ParamValues[ 0 ].AsInteger Of
            0: Sql.Add('   AND ( A.CODARTIGO = CM.CODARTIGO(+) ) ');
            1: Sql.Add('   AND ( A.CODARTIGO = CM.CODARTIGO ) ');
       End;

       Case CmpRptCM.ParamValues[ 1 ].AsInteger Of
            0: Sql.Add('ORDER BY ( P.DESCPROD || '' '' || A.CODTAMANHO || '' '' || A.CODCOR )');
            1: Sql.Add('ORDER BY A.CODARTIGO');
       End;

       Open;
  End;
end;

procedure TRptTermoInvent.CabecTermoInventBeforePrint(Sender: TObject);
begin
  inherited;
  CabecTermoInvent.Visible := ( RptTermoInvent.PageNo <> RptTermoInvent.PageCount );
end;

end.
