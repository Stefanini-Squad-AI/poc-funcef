unit rCurvaABCCompras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, DBClient,
  uCMClientDataSet, uCmSqlParams, ppBands, ppClass, ppCtrls, ppVar,
  ppPrnabl, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe,
  ppDBBDE, Wwdatsrc;

type
  TRptCurvaABCCompras = class(TFrmCmReport)
    dsABCComp: TwwDataSource;
    BdeABCComp: TppBDEPipeline;
    RptABCComp: TppReport;
    ppHeaderBand31: TppHeaderBand;
    ppReport1Shape1: TppShape;
    ppLabel196: TppLabel;
    LblEmpresa: TppLabel;
    ppLabel198: TppLabel;
    ppLabel199: TppLabel;
    ppLabel200: TppLabel;
    ppReport1Label7: TppLabel;
    ppReport1Label9: TppLabel;
    ppReport1DBText7: TppDBText;
    ppReport1Label5: TppLabel;
    rpABCLabel5: TppLabel;
    rpABCLabel7: TppLabel;
    LbGrupo3: TppLabel;
    LbPer17: TppLabel;
    ppDetailBand26: TppDetailBand;
    ppDBText81: TppDBText;
    ppReport1DBText9: TppDBText;
    ppReport1DBText10: TppDBText;
    ppDBText82: TppDBText;
    rpABCDBText1: TppDBText;
    rpABCDBText4: TppDBText;
    RptABCCompDBText1: TppDBText;
    ppFooterBand32: TppFooterBand;
    ppLine82: TppLine;
    LblSistema: TppLabel;
    ppCalc62: TppSystemVariable;
    ppCalc63: TppSystemVariable;
    ppCalc64: TppSystemVariable;
    rpABCSummaryBand1: TppSummaryBand;
    rpABCDBCalc4: TppDBCalc;
    rpABCDBCalc5: TppDBCalc;
    rpABCDBCalc6: TppDBCalc;
    rpABCLabel4: TppLabel;
    rpABCGroup2: TppGroup;
    rpABCGroupHeaderBand2: TppGroupHeaderBand;
    rpABCLine3: TppLine;
    rpABCLabel3: TppLabel;
    rpABCDBText3: TppDBText;
    rpABCGroupFooterBand2: TppGroupFooterBand;
    rpABCDBCalc1: TppDBCalc;
    rpABCLine1: TppLine;
    rpABCDBCalc2: TppDBCalc;
    rpABCDBCalc3: TppDBCalc;
    rpABCLabel1: TppLabel;
    rpABCDBText2: TppDBText;
    rpABCLabel2: TppLabel;
    rpABCLine2: TppLine;
    SqlABCCompras: TCMSqlParams;
    CdsABCCompras: TCMClientDataSet;
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptCurvaABCCompras: TRptCurvaABCCompras;
  sNomeGrupo: String = '';

implementation

{$R *.DFM}

procedure TRptCurvaABCCompras.CmpRptCMParamControlExit(
  Sender: TPainelControles; Index: Integer);
begin
  inherited;
  Case Index of
       6: sNomeGrupo := Sender.CtrlLookup.Text;
  End;
end;

procedure TRptCurvaABCCompras.CrmRptCMBeforePrint(Sender: TObject);
var
  rPercAcu: Double;
Begin
  inherited;
  LbPer17.Caption  := 'De ' + CmpRptCM.ParamValues[ 0 ].AsString + ' a ' + CmpRptCM.ParamValues[ 1 ].AsString;

  With SqlABCCompras Do Begin
       Close;
       Sql.Clear;
       Sql.add('SELECT ''A'' AS GRUPO,   ');
       Sql.add('       ( 0 ) AS PERCACU, ');
       Sql.add('       M.CODARTIGO, ');
       Sql.add('       ( P.DESCPROD || '' '' || A.CODCOR || '' '' || A.CODTAMANHO ) AS DESCICAO, ');
       Sql.add('       P.CODMEDCUSTO, ');
       Sql.add('       SUM( M.QTDEMOV ) AS SALDO, ');
       Sql.add('       SUM( M.VALORMOV ) AS VALOR, ');
       Sql.add('       ( ( SUM( M.VALORMOV ) / SUB.VALORTOT ) * 100 ) AS PERC, ');
       Sql.add('       SUB.VALORTOT ');
       Sql.add('  FROM MOVIMENT M, ');
       Sql.add('       ARTIGO A, ');
       Sql.add('       PRODUTO P, ');
       Sql.add('       ( SELECT SUM( VALORMOV ) AS VALORTOT ');
       Sql.add('           FROM MOVIMENT ');
       Sql.add('          WHERE ( CODTIPOMOV = ''A'' ) ');
       Sql.add('            AND ( DATAMOV >= TO_DATE(' + QuotedStr( CmpRptCM.ParamValues[ 0 ].AsString ) + ',''DD/MM/YYYY'' ) ) ' );
       Sql.add('            AND ( DATAMOV <= TO_DATE(' + QuotedStr( CmpRptCM.ParamValues[ 1 ].AsString ) + ',''DD/MM/YYYY'' ) ) ' );
       Sql.Add('            AND ( IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ');
       Sql.add('       ) SUB ');
       Sql.add(' WHERE ( M.CODTIPOMOV = ''A'' ) ');
       Sql.add('   AND ( M.DATAMOV >= TO_DATE(' + QuotedStr( CmpRptCM.ParamValues[ 0 ].AsString ) + ',''DD/MM/YYYY'' ) ) ');
       Sql.add('   AND ( M.DATAMOV <= TO_DATE(' + QuotedStr( CmpRptCM.ParamValues[ 1 ].AsString ) + ',''DD/MM/YYYY'' ) ) ');
       Sql.Add('   AND ( M.IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ');

       If Not CmpRptCM.ParamValues[ 6 ].IsNull Then Begin
          Sql.Add('   AND ( RTRIM( P.CODGRUPOPROD ) LIKE ' + QuotedStr( Trim( CmpRptCM.ParamValues[ 6 ].AsString ) + '%' ) + ' ) ' );
          LbGrupo3.Caption := sNomeGrupo;
       End Else
          LbGrupo3.Caption := 'Todos';

       Sql.add('   AND ( M.CODARTIGO  = A.CODARTIGO ) ');
       Sql.add('   AND ( A.CODPRODUTO = P.CODPRODUTO ) ');
       Sql.add(' GROUP BY M.CODARTIGO, ');
       Sql.add('          ( P.DESCPROD || '' '' || A.CODCOR || '' '' || A.CODTAMANHO ), ');
       Sql.add('          P.CODMEDCUSTO, ');
       Sql.add('          SUB.VALORTOT ');
       Sql.add(' ORDER BY VALOR DESC');
       Open;
  End;

  With CdsABCCompras Do Begin
       rPercAcu := 0;
       First;

       While Not Eof Do Begin
             rPercAcu := rPercAcu + FieldByName( 'PERC' ).AsFloat;
             Edit;
             FieldByName( 'PERCACU' ).AsFloat := rPercAcu;

             If rPercAcu <= CmpRptCM.ParamValues[ 2 ].AsFloat Then
                FieldByName( 'GRUPO' ).AsString := 'A'
             Else
                If ( rPercAcu > CmpRptCM.ParamValues[ 2 ].AsFloat ) And ( rPercAcu <= CmpRptCM.ParamValues[ 3 ].AsFloat ) Then
                   FieldByName( 'GRUPO' ).AsString := 'B'
                Else
                   If ( rPercAcu > CmpRptCM.ParamValues[ 3 ].AsFloat ) And ( rPercAcu <= CmpRptCM.ParamValues[ 4 ].AsFloat ) Then
                      FieldByName( 'GRUPO' ).AsString := 'C'
                   Else
                      FieldByName( 'GRUPO' ).AsString := 'D';

             Post;
             Next;
       End;

       If CmpRptCM.ParamValues[ 5 ].AsInteger <> 0 Then Begin
          First;

          While Not Eof Do Begin
                If ( CmpRptCM.ParamValues[ 5 ].AsInteger = 1 ) And ( FieldByName( 'GRUPO' ).AsString <> 'A' ) Then Begin
                   Delete;
                End Else Begin
                   If ( CmpRptCM.ParamValues[ 5 ].AsInteger = 2 ) And ( FieldByName( 'GRUPO' ).AsString <> 'A' ) And
                          ( FieldByName( 'GRUPO' ).AsString <> 'B' ) Then Begin
                      Delete;
                   End Else Begin
                      If ( CmpRptCM.ParamValues[ 5 ].AsInteger = 3 ) And ( FieldByName( 'GRUPO' ).AsString = 'D' ) Then Begin
                         Delete;
                      End Else Begin
                         Next;
                      End;
                   End;
                End;
          End;
       End;

       First;
  End;
end;

procedure TRptCurvaABCCompras.CmpRptCMBeforeExecute(
  var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamByName( 'DataInicial' ).TextDefault := DateToStr( Date );
  CmpRptCM.ParamByName( 'DataFinal' ).TextDefault   := DateToStr( Date );
end;

end.
