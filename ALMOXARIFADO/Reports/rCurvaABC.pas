unit rCurvaABC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, ppBands,
  ppClass, ppCtrls, ppVar, ppPrnabl, ppCache, ppProd, ppReport, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, Wwdatsrc, uCmRptManager, TXComp,
  CmParamReport;

type
  TRptCurvaABC = class(TFrmCmReport)
    dsABC: TwwDataSource;
    pplABC: TppBDEPipeline;
    rpABC: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppReport1Shape1: TppShape;
    ppLabel32: TppLabel;
    LblEmpresa: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppReport1Label7: TppLabel;
    ppReport1Label9: TppLabel;
    ppReport1DBText7: TppDBText;
    ppReport1Label5: TppLabel;
    rpABCLabel5: TppLabel;
    rpABCLabel6: TppLabel;
    rpABCLabel7: TppLabel;
    lblAlmox: TppLabel;
    LblGrupo: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppDBText15: TppDBText;
    ppReport1DBText9: TppDBText;
    ppReport1DBText10: TppDBText;
    ppDBText16: TppDBText;
    rpABCDBText1: TppDBText;
    rpABCDBText4: TppDBText;
    ppFooterBand5: TppFooterBand;
    ppLine6: TppLine;
    LblSistema: TppLabel;
    ppCalc8: TppSystemVariable;
    ppCalc9: TppSystemVariable;
    ppCalc10: TppSystemVariable;
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
    SqlABC: TCMSqlParams;
    CdsABC: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptCurvaABC: TRptCurvaABC;
  sNomeAlmox: String = '';
  sNomeGrupo: String = '';

implementation

{$R *.DFM}

procedure TRptCurvaABC.CrmRptCMBeforePrint(Sender: TObject);
var
  rPercAcu: Double;
begin
  inherited;
  lblAlmox.Caption := sNomeAlmox;

  With SqlABC Do Begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT ''A'' AS GRUPO, ');
       Sql.Add('       ( 0 ) AS PERCACU, ');
       Sql.Add('       P.DESCPROD || '' '' || RTRIM(A.CODCOR, '' '') ||'' ''|| RTRIM(A.CODTAMANHO,'' '') AS PRODUTO, ');
       Sql.Add('       S.SALDOQTDE, ');
       Sql.Add('       ( S.SALDOQTDE * C.CUSTOMEDIO ) AS VALORPRODUTO, ');
       Sql.Add('       ( ( ( S.SALDOQTDE * C.CUSTOMEDIO ) / TOT.VALORTOTAL ) * 100 ) AS PERC, ');
       Sql.Add('       TOT.VALORTOTAL, ');
       Sql.Add('       P.CODMEDCUSTO ');
       Sql.Add('  FROM SALDO S, ');
       Sql.Add('       CUSTOMED C, ');
       Sql.Add('       PRODUTO P,  ');
       Sql.Add('       ALMOX AL,   ');
       Sql.Add('       ARTIGO A,   ');
       Sql.Add('       ( SELECT SUM( S.SALDOQTDE * C.CUSTOMEDIO ) AS VALORTOTAL ');
       Sql.Add('           FROM SALDO S, ');
       Sql.Add('                CUSTOMED C, ');
       Sql.Add('                ALMOX AL,   ');
       Sql.Add('                PRODUTO P,  ');
       Sql.Add('                ARTIGO A    ');
       Sql.Add('          WHERE ( S.CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ' );
       Sql.Add('            AND ( S.IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ' );

       If Not CmpRptCM.ParamValues[ 5 ].IsNull Then
          Sql.Add('            AND ( RTRIM( P.CODGRUPOPROD ) LIKE ' + QuotedStr( Trim( CmpRptCM.ParamValues[ 5 ].AsString ) + '%' ) + ' ) ' );

       Sql.Add('            AND ( S.CODALMOXARIFADO = AL.CODALMOXARIFADO ) ');
       Sql.Add('            AND ( C.CODARTIGO =  S.CODARTIGO )  ');
       Sql.Add('            AND ( S.CODARTIGO = A.CODARTIGO )   ');
       Sql.Add('            AND ( A.CODPRODUTO = P.CODPRODUTO ) ');
       Sql.Add('            AND ( C.CODCUSTEIO = AL.CODCUSTEIO ) ) TOT ');
       Sql.Add(' WHERE ( S.CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ' );
       Sql.Add('   AND ( S.IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ' );

       If Not CmpRptCM.ParamValues[ 5 ].IsNull Then Begin
          Sql.Add('   AND ( RTRIM( P.CODGRUPOPROD ) LIKE ' + QuotedStr( Trim( CmpRptCM.ParamValues[ 5 ].AsString ) + '%' ) + ' ) ');
          LblGrupo.Caption := sNomeGrupo;
       End Else
          LblGrupo.Caption := 'Todos';

       Sql.Add('   AND ( S.CODARTIGO = C.CODARTIGO ) ');
       Sql.Add('   AND ( S.CODARTIGO = A.CODARTIGO ) ');
       Sql.Add('   AND ( A.CODPRODUTO = P.CODPRODUTO ) ');
       Sql.Add('   AND ( S.CODALMOXARIFADO = AL.CODALMOXARIFADO ) ');
       Sql.Add('   AND ( C.CODCUSTEIO = AL.CODCUSTEIO ) ');
       Sql.Add(' ORDER BY VALORPRODUTO DESC');
       Open;
  End;

  With CdsAbc Do Begin
       rPercAcu := 0;
       First;

       While Not Eof Do Begin
             rPercAcu := rPercAcu + FieldByName( 'PERC' ).AsFloat;
             Edit;
             FieldByName( 'PERCACU' ).AsFloat := rPercAcu;

             If rPercAcu <= CmpRptCM.ParamValues[ 1 ].AsFloat Then Begin
                FieldByName( 'GRUPO' ).AsString := 'A';
             End Else Begin
                If ( rPercAcu > CmpRptCM.ParamValues[ 1 ].AsFloat ) And ( rPercAcu <= CmpRptCM.ParamValues[ 2 ].AsFloat ) Then Begin
                   FieldByName('GRUPO').AsString := 'B';
                End Else Begin
                   If ( rPercAcu > CmpRptCM.ParamValues[ 2 ].AsFloat ) And ( rPercAcu <= CmpRptCM.ParamValues[ 3 ].AsFloat ) Then Begin
                      FieldByName( 'GRUPO' ).AsString := 'C';
                   End Else Begin
                      FieldByName( 'GRUPO' ).AsString := 'D';
                   End;
                End;
             End;

             Post;
             Next;
       End;

       If Not CmpRptCM.ParamValues[ 4 ].IsNull Then Begin
          First;

          While Not Eof Do Begin
                If ( CmpRptCM.ParamValues[ 4 ].AsInteger = 1 ) And ( FieldByName( 'GRUPO' ).AsString <> 'A' ) Then Begin
                   Delete;
                End Else Begin
                   If ( CmpRptCM.ParamValues[ 4 ].AsInteger = 2 ) And ( FieldByName( 'GRUPO' ).AsString <> 'A' ) And
                          ( FieldByName( 'GRUPO' ).AsString <> 'B' ) Then Begin
                      Delete;
                   End Else Begin
                      If ( CmpRptCM.ParamValues[ 4 ].AsInteger = 3 ) And ( FieldByName( 'GRUPO' ).AsString = 'D' ) Then Begin
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

procedure TRptCurvaABC.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamByName( 'Almoxarifado' ).LookupSettings.SQL.Text := 'SELECT CODALMOXARIFADO, DESCALMOX FROM ALMOX WHERE IDPESSOA = ' +
                        FloatToStr( CrmRptCM.IdEmpresa ) + ' ORDER BY 2';
end;

procedure TRptCurvaABC.CmpRptCMParamControlExit(Sender: TPainelControles;
  Index: Integer);
begin
  inherited;
  Case Index of
       0: sNomeAlmox := Sender.CtrlLookup.Text;
       5: sNomeGrupo := Sender.CtrlLookup.Text;
  End;
end;

end.
