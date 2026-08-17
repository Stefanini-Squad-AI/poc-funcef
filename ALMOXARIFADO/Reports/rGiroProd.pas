unit rGiroProd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, ppBands,
  ppClass, ppVar, ppCtrls, ppPrnabl, ppCache, ppProd, ppReport, Wwdatsrc,
  ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, uCmRptManager, TXComp,
  CmParamReport;

type
  TRptGiroProd = class(TFrmCmReport)
    bdeGiroProd: TppBDEPipeline;
    dsGiroProd: TwwDataSource;
    RptGiroProd: TppReport;
    ppHeaderBand33: TppHeaderBand;
    ppLabel203: TppLabel;
    ppLine85: TppLine;
    LblEmpresa: TppLabel;
    RptGiroProdLine1: TppLine;
    RptGiroProdLabel1: TppLabel;
    RptGiroProdLabel2: TppLabel;
    RptGiroProdLabel3: TppLabel;
    RptGiroProdLabel4: TppLabel;
    RptGiroProdLabel5: TppLabel;
    RptGiroProdLabel6: TppLabel;
    LBPERIODO1: TppLabel;
    LBPERIODO2: TppLabel;
    LBPERIODO3: TppLabel;
    RptGiroProdLabel7: TppLabel;
    lbGrupo8: TppLabel;
    ppDetailBand28: TppDetailBand;
    RptGiroProdDBText1: TppDBText;
    RptGiroProdDBText2: TppDBText;
    RptGiroProdDBText3: TppDBText;
    RptGiroProdDBText4: TppDBText;
    RptGiroProdDBText5: TppDBText;
    RptGiroProdDBText6: TppDBText;
    RptGiroProdDBText7: TppDBText;
    RptGiroProdDBText9: TppDBText;
    ppFooterBand34: TppFooterBand;
    ppLine86: TppLine;
    LblSistema: TppLabel;
    ppCalc67: TppSystemVariable;
    ppCalc68: TppSystemVariable;
    RptGiroProdGroup1: TppGroup;
    RptGiroProdGroupHeaderBand1: TppGroupHeaderBand;
    RptGiroProdLine2: TppLine;
    RptGiroProdDBText8: TppDBText;
    RptGiroProdGroupFooterBand1: TppGroupFooterBand;
    SqlGiroProd: TCMSqlParams;
    CdsGiroProd: TCMClientDataSet;
    SqlAux: TCMSqlParams;
    CdsAux: TCMClientDataSet;
    Function leUnCusteio( CodAlmox: String ): LongInt;
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
  RptGiroProd: TRptGiroProd;
  sNomeAlmox: String = '';
  sNomeGrupo: String = '';

implementation

{$R *.DFM}

Function TRptGiroProd.leUnCusteio( CodAlmox: String ): LongInt;
Begin
  SqlAux.SQL.Text := 'SELECT CODCUSTEIO FROM ALMOX WHERE CODALMOXARIFADO = ' + CodAlmox;
  SqlAux.Open;

  If CdsAux.IsEmpty Then
     Result := -1
  Else
     Result := CdsAux.FieldByName( 'CODCUSTEIO' ).AsInteger;

  CdsAux.Close;
End;

procedure TRptGiroProd.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamByName( 'Almoxarifado' ).LookupSettings.SQL.Text := 'SELECT CODALMOXARIFADO, DESCALMOX FROM ALMOX WHERE IDPESSOA = ' +
                        FloatToStr( CrmRptCM.IdEmpresa ) + ' ORDER BY 2';
  CmpRptCM.ParamByName( 'Per1Inicial' ).TextDefault := DateToStr( Date - 90 );
  CmpRptCM.ParamByName( 'Per1Final' ).TextDefault   := DateToStr( Date - 90 );
  CmpRptCM.ParamByName( 'Per2Inicial' ).TextDefault := DateToStr( Date - 60 );
  CmpRptCM.ParamByName( 'Per2Final' ).TextDefault   := DateToStr( Date - 60 );
  CmpRptCM.ParamByName( 'Per3Inicial' ).TextDefault := DateToStr( Date - 30 );
  CmpRptCM.ParamByName( 'Per3Final' ).TextDefault   := DateToStr( Date - 30 );
end;

procedure TRptGiroProd.CmpRptCMParamControlExit(Sender: TPainelControles;
  Index: Integer);
begin
  inherited;
  Case Index of
       0: sNomeAlmox := Sender.CtrlLookup.Text;
       1: sNomeGrupo := Sender.CtrlLookup.Text;
  End;
end;

procedure TRptGiroProd.CrmRptCMBeforePrint(Sender: TObject);
Var
  nDias1, nDias2, nDias3: Double;
begin
  inherited;
  nDias1 := CmpRptCM.ParamValues[ 3 ].AsDateTime - CmpRptCM.ParamValues[ 2 ].AsDateTime + 1;
  nDias2 := CmpRptCM.ParamValues[ 5 ].AsDateTime - CmpRptCM.ParamValues[ 4 ].AsDateTime + 1;
  nDias3 := CmpRptCM.ParamValues[ 7 ].AsDateTime - CmpRptCM.ParamValues[ 6 ].AsDateTime + 1;
  lbPeriodo1.Caption := 'Período 1º: De ' + CmpRptCM.ParamValues[ 2 ].AsString + ' a ' + CmpRptCM.ParamValues[ 3 ].AsString;
  lbPeriodo2.Caption := 'Período 2º: De ' + CmpRptCM.ParamValues[ 4 ].AsString + ' a ' + CmpRptCM.ParamValues[ 5 ].AsString;
  lbPeriodo3.Caption := 'Período 3º: De ' + CmpRptCM.ParamValues[ 6 ].AsString + ' a ' + CmpRptCM.ParamValues[ 7 ].AsString;
  lbGrupo8.Caption   := 'Todos';

  With SqlGiroProd Do Begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT G.CODGRUPOPROD, ');
       Sql.Add('       G.DESCGRUPOPROD, ');
       Sql.Add('       A.CODARTIGO, ');
       Sql.Add('       P.CODMEDCUSTO, ');
       Sql.Add('       C.CUSTOMEDIO, ');
       Sql.Add('       ( P.DESCPROD || '' '' || A.CODCOR || '' '' || A.CODTAMANHO ) AS DESCRICAO, ');
       Sql.Add('       DECODE( CM1.CONSMED1, NULL, 0, CM1.CONSMED1 ) AS CONSMED1, ');
       Sql.Add('       DECODE( CM2.CONSMED2, NULL, 0, CM2.CONSMED2 ) AS CONSMED2, ');
       Sql.Add('       DECODE( CM3.CONSMED3, NULL, 0, CM3.CONSMED3 ) AS CONSMED3, ');
       Sql.Add('       ( DECODE( CM1.CONSMED1, NULL, 0, CM1.CONSMED1 ) + ');
       Sql.Add('         DECODE( CM2.CONSMED2, NULL, 0, CM2.CONSMED2 ) + ');
       Sql.Add('         DECODE( CM3.CONSMED3, NULL, 0, CM3.CONSMED3 ) ) / 3 AS MEDIA ');
       Sql.Add('  FROM ( SELECT M.CODARTIGO, ');
       Sql.Add('                ( ( SUM( M.QTDEMOV ) * -1 ) / ' + FloatToStr( nDias1 ) + ' ) AS CONSMED1, ');
       Sql.Add('                ( SUM( QTDEMOV ) * -1 ) AS CONSTOT ');
       Sql.Add('           FROM MOVIMENT M ');
       Sql.Add('          WHERE ( M.CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ');
       Sql.Add('            AND ( M.CODTIPOMOV <> ''A'' ) ');
       Sql.Add('            AND ( M.CODTIPOMOV <> ''K'' ) ');
       Sql.Add('            AND ( M.CODTIPOMOV <> ''Z'' ) ');
       Sql.Add('            AND ( M.CODTIPOMOV <> ''S'' ) ');
       Sql.Add('            AND ( M.CODTIPOMOV <> ''B'' ) ');
       Sql.Add('            AND ( M.DATAMOV >= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 2 ].AsString ) + ', ''dd/mm/yyyy'' ) ) ');
       Sql.Add('            AND ( M.DATAMOV <= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 3 ].AsString ) + ', ''dd/mm/yyyy'' ) ) ');
       Sql.Add('          GROUP BY M.CODARTIGO ');
       Sql.Add('       ) CM1, ');
       Sql.Add('       ( SELECT M.CODARTIGO,');
       Sql.Add('                ( ( SUM( M.QTDEMOV ) * -1 ) / ' + FloatToStr( nDias2 )+' ) AS CONSMED2, ');
       Sql.Add('                ( SUM( QTDEMOV ) * -1 ) AS CONSTOT ');
       Sql.Add('           FROM MOVIMENT M ');
       Sql.Add('          WHERE ( M.CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ');
       Sql.Add('            AND ( M.CODTIPOMOV <> ''A'' ) ');
       Sql.Add('            AND ( M.CODTIPOMOV <> ''K'' ) ');
       Sql.Add('            AND ( M.CODTIPOMOV <> ''Z'' ) ');
       Sql.Add('            AND ( M.CODTIPOMOV <> ''S'' ) ');
       Sql.Add('            AND ( M.CODTIPOMOV <> ''B'' ) ');
       Sql.Add('            AND ( M.DATAMOV >= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 4 ].AsString ) + ', ''dd/mm/yyyy'' ) ) ');
       Sql.Add('            AND ( M.DATAMOV <= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 5 ].AsString ) + ', ''dd/mm/yyyy'' ) ) ');
       Sql.Add('          GROUP BY M.CODARTIGO ');
       Sql.Add('       ) CM2, ');
       Sql.Add('       ( SELECT M.CODARTIGO,');
       Sql.Add('                ( ( SUM( M.QTDEMOV ) * -1 ) / ' + FloatToStr( nDias3 ) + ' ) AS CONSMED3, ');
       Sql.Add('                ( SUM( QTDEMOV ) * -1 ) AS CONSTOT ');
       Sql.Add('           FROM MOVIMENT M ');
       Sql.Add('          WHERE ( M.CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ');
       Sql.Add('            AND ( M.CODTIPOMOV <> ''A'' ) ');
       Sql.Add('            AND ( M.CODTIPOMOV <> ''K'' ) ');
       Sql.Add('            AND ( M.CODTIPOMOV <> ''Z'' ) ');
       Sql.Add('            AND ( M.CODTIPOMOV <> ''S'' ) ');
       Sql.Add('            AND ( M.CODTIPOMOV <> ''B'' ) ');
       Sql.Add('            AND ( M.DATAMOV >= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 6 ].AsString ) + ', ''dd/mm/yyyy'' ) ) ');
       Sql.Add('            AND ( M.DATAMOV <= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 7 ].AsString ) + ', ''dd/mm/yyyy'' ) ) ');
       Sql.Add('          GROUP BY M.CODARTIGO ');
       Sql.Add('       ) CM3, ');
       Sql.Add('       ARTIGO A, ');
       Sql.Add('       PRODUTO P, ');
       Sql.Add('       GRUPPROD G, ');
       Sql.Add('       SALDO S, ');
       Sql.Add('       CUSTOMED C ');
       Sql.Add(' WHERE ( S.CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ');
       Sql.Add('   AND ( C.CODCUSTEIO = ' + IntToStr( LeUnCusteio( CmpRptCM.ParamValues[ 0 ].AsString ) ) + ' ) ');

       If Not CmpRptCM.ParamValues[ 1 ].IsNull Then Begin
          sql.Add('   AND ( RTRIM( G.CODGRUPOPROD ) LIKE ' + QuotedStr( Trim( CmpRptCM.ParamValues[ 1 ].AsString ) + '%' ) + ' ) ');
          lbGrupo8.Caption := sNomeGrupo;
       End;

       Sql.Add('   AND ( A.CODPRODUTO = P.CODPRODUTO ) ');
       Sql.Add('   AND ( P.CODGRUPOPROD = G.CODGRUPOPROD ) ');
       Sql.Add('   AND ( A.CODARTIGO = C.CODARTIGO ) ');
       Sql.Add('   AND ( A.CODARTIGO = S.CODARTIGO ) ');
       Sql.Add('   AND ( A.CODARTIGO = CM1.CODARTIGO(+) ) ');
       Sql.Add('   AND ( A.CODARTIGO = CM2.CODARTIGO(+) ) ');
       Sql.Add('   AND ( A.CODARTIGO = CM3.CODARTIGO(+) ) ');

       Case CmpRptCM.ParamValues[ 8 ].AsInteger Of
            0: Sql.Add(' ORDER BY G.CODGRUPOPROD, ( P.DESCPROD || '' '' || A.CODCOR || '' '' || A.CODTAMANHO )');
            1: Sql.Add(' ORDER BY G.CODGRUPOPROD, A.CODARTIGO');
            2: Sql.Add(' ORDER BY G.CODGRUPOPROD, MEDIA');
       End;

       Open;
  End;
end;

end.
