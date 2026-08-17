unit rArtSemMov;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, ppBands,
  ppClass, ppVar, ppCtrls, ppPrnabl, ppCache, ppProd, ppReport, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, Wwdatsrc, uCmRptManager, TXComp,
  CmParamReport;

type
  TRptArtSemMov = class(TFrmCmReport)
    dsArtSemMov: TwwDataSource;
    dbeArtSemMov: TppBDEPipeline;
    RptArtSemMov: TppReport;
    ppHeaderBand18: TppHeaderBand;
    lbTit: TppLabel;
    ppLine37: TppLine;
    LblEmpresa: TppLabel;
    RptArtSemMovLine1: TppLine;
    RptArtSemMovLabel1: TppLabel;
    lbAlmox8: TppLabel;
    RptArtSemMovLabel2: TppLabel;
    RptArtSemMovLabel3: TppLabel;
    RptArtSemMovLabel4: TppLabel;
    RptArtSemMovLabel5: TppLabel;
    RptArtSemMovLabel6: TppLabel;
    RptArtSemMovLabel7: TppLabel;
    ppDetailBand14: TppDetailBand;
    RptArtSemMovDBText3: TppDBText;
    RptArtSemMovDBText4: TppDBText;
    RptArtSemMovDBText5: TppDBText;
    RptArtSemMovDBText6: TppDBText;
    RptArtSemMovDBText7: TppDBText;
    RptArtSemMovDBText8: TppDBText;
    RptArtSemMovDBText9: TppDBText;
    ppFooterBand18: TppFooterBand;
    ppLine39: TppLine;
    LblSistema: TppLabel;
    ppCalc34: TppSystemVariable;
    ppCalc35: TppSystemVariable;
    RptArtSemMovGroup1: TppGroup;
    RptArtSemMovGroupHeaderBand1: TppGroupHeaderBand;
    RptArtSemMovDBText1: TppDBText;
    RptArtSemMovLine2: TppLine;
    RptArtSemMovDBText2: TppDBText;
    RptArtSemMovGroupFooterBand1: TppGroupFooterBand;
    SqlArtSemMov: TCMSqlParams;
    CdsArtSemMov: TCMClientDataSet;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptArtSemMov: TRptArtSemMov;
  sNomeAlmox: String = '';

implementation

{$R *.DFM}

procedure TRptArtSemMov.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamByName( 'Almoxarifado' ).LookupSettings.SQL.Text := 'SELECT CODALMOXARIFADO, DESCALMOX FROM ALMOX WHERE IDPESSOA = ' +
                        FloatToStr( CrmRptCM.IdEmpresa ) + ' ORDER BY 2';
  CdsArtSemMov.Close;
  SqlArtSemMov.Sql.Text := 'SELECT DATAREPRESA FROM PARALMOX WHERE IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa );
  SqlArtSemMov.Open;

  If Not CdsArtSemMov.IsEmpty Then
     CmpRptCM.ParamByName( 'DataLimite' ).TextDefault := DateToStr( CdsArtSemMov.FieldByName( 'DATAREPRESA' ).asDateTime );

  CdsArtSemMov.Close;
end;

procedure TRptArtSemMov.CmpRptCMParamControlExit(Sender: TPainelControles;
  Index: Integer);
begin
  inherited;
  Case Index of
       0: sNomeAlmox := Sender.CtrlLookup.Text;
  End;
end;

procedure TRptArtSemMov.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  With SqlArtSemMov Do Begin
       Close;
       Sql.Clear;
       sql.Add('SELECT P.CODGRUPOPROD, ');
       sql.Add('       G.DESCGRUPOPROD, ');
       sql.Add('       A.CODARTIGO, ');
       sql.Add('       ( P.DESCPROD || '' '' || A.CODCOR || '' '' || A.CODTAMANHO ) AS DESCRICAO, ');
       sql.Add('       S.SALDOQTDE, ');
       sql.Add('       C.CUSTOMEDIO, ');
       sql.Add('       P.CODMEDCUSTO, ');
       sql.Add('       ( S.SALDOQTDE * C.CUSTOMEDIO ) VALOR, ');
       sql.Add('       ULT.ULTDATA ');
       sql.Add('  FROM ARTIGO A, ');
       sql.Add('       PRODUTO P, ');
       sql.Add('       CUSTOMED C, ');
       sql.Add('       SALDO S, ');
       sql.Add('       GRUPPROD G, ');
       sql.Add('       ( SELECT CODARTIGO, MAX( DATAMOV ) AS ULTDATA ');
       sql.Add('           FROM MOVIMENT ');
       sql.Add('          WHERE ( CODTIPOMOV <> ''Z'' ) ');
       sql.Add('            AND ( DATAMOV <= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 1 ].AsString ) + ', ''DD/MM/YYYY'' ) )');
       sql.Add('            AND ( CODALMOXARIFADO = '+ CmpRptCM.ParamValues[ 0 ].AsString + ' ) ');
       sql.Add('          GROUP BY CODARTIGO ) ULT ');
       sql.Add(' WHERE ( S.CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ');
       sql.Add('   AND ( C.CODCUSTEIO = ' + IntToStr( 1 {Modulo.iCodCusteio} ) + ' ) ');
       sql.Add('   AND ( NOT EXISTS ( SELECT MV.CODARTIGO ');
       sql.Add('                        FROM MOVIMENT MV ');
       sql.Add('                       WHERE ( MV.CODTIPOMOV <> ''Z'' ) ');
       sql.Add('                         AND ( MV.DATAMOV > TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 1 ].AsString ) + ', ''DD/MM/YYYY'' ) ) ');
       sql.Add('                         AND ( MV.CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ');
       sql.Add('                         AND ( MV.CODARTIGO = A.CODARTIGO ) ');
       sql.Add('                       GROUP BY MV.CODARTIGO ) ) ');

       If Not CmpRptCM.ParamValues[ 3 ].IsNull Then
          sql.Add('   AND ( RTRIM( G.CODGRUPOPROD ) = ' + QuotedStr( Trim( CmpRptCM.ParamValues[ 3 ].AsString ) ) + ' ) ');

       If CmpRptCM.ParamValues[ 4 ].AsBoolean Then
          sql.Add('   AND ( S.SALDOQTDE > 0 ) ');

       sql.Add('  AND ( A.CODPRODUTO = P.CODPRODUTO ) ');
       sql.Add('  AND ( A.CODARTIGO  = S.CODARTIGO ) ');
       sql.Add('  AND ( A.CODARTIGO  = C.CODARTIGO ) ');
       sql.Add('  AND ( A.CODARTIGO  = ULT.CODARTIGO(+) ) ');
       sql.Add('  AND ( G.CODGRUPOPROD = P.CODGRUPOPROD ) ');

       If CmpRptCM.ParamValues[ 2 ].AsInteger = 0 Then
          sql.Add(' ORDER BY G.CODGRUPOPROD, ( P.DESCPROD || '' '' || A.CODCOR || '' '' || A.CODTAMANHO )')
       Else
          sql.Add(' ORDER BY G.CODGRUPOPROD, A.CODARTIGO');

       Open;
  End;

  lbAlmox8.Caption := sNomeAlmox;
  lbTit.Caption    := 'Artigos sem Movimentação desde ' + CmpRptCM.ParamValues[ 1 ].AsString;
end;

end.
