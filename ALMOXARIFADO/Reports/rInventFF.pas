unit rInventFF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, DBClient,
  uCMClientDataSet, uCmSqlParams, ppBands, ppClass, ppCtrls, ppVar,
  ppPrnabl, ppCache, ppProd, ppReport, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE;

type
  TRptInventFF = class(TFrmCmReport)
    bdeInventFF: TppBDEPipeline;
    dsInventFF: TwwDataSource;
    rptInventFF: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel4: TppLabel;
    ppLine1: TppLine;
    LblEmpresa: TppLabel;
    LbAlmox2: TppLabel;
    rptInventFFLabel3: TppLabel;
    rptInventFFLabel4: TppLabel;
    rptInventFFLabel5: TppLabel;
    rptInventFFLabel6: TppLabel;
    rptInventFFLabel7: TppLabel;
    rptInventFFLabel8: TppLabel;
    rptInventFFLabel10: TppLabel;
    rptInventFFLine2: TppLine;
    DetInVentFF: TppDetailBand;
    rptInventFFDBText2: TppDBText;
    rptInventFFDBText3: TppDBText;
    rptInventFFDBText4: TppDBText;
    rptInventFFDBText5: TppDBText;
    rptInventFFDBText6: TppDBText;
    rptInventFFDBText7: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLine3: TppLine;
    LblSistema: TppLabel;
    ppCalc3: TppSystemVariable;
    ppCalc4: TppSystemVariable;
    rptInventFFSummaryBand1: TppSummaryBand;
    rptInventFFLabel2: TppLabel;
    rptInventFFDBCalc2: TppDBCalc;
    rptInventFFGroup1: TppGroup;
    GrpInventFF: TppGroupHeaderBand;
    rptInventFFDBText1: TppDBText;
    rptInventFFDBText8: TppDBText;
    rptInventFFDBText9: TppDBText;
    rptInventFFLine1: TppLine;
    Lin1: TppLine;
    RodapeInventFF: TppGroupFooterBand;
    rptInventFFDBCalc1: TppDBCalc;
    rptInventFFLabel11: TppLabel;
    SqlInventFF: TCMSqlParams;
    CdsInventFF: TCMClientDataSet;
    SqlAux: TCMSqlParams;
    CdsAux: TCMClientDataSet;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure GrpInventFFBeforePrint(Sender: TObject);
    procedure DetInVentFFBeforePrint(Sender: TObject);
    procedure RodapeInventFFBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptInventFF: TRptInventFF;
  sNomeAlmox: String = '';
  sNomeGrupo: String = '';

implementation

{$R *.DFM}

procedure TRptInventFF.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamByName( 'Almoxarifado' ).LookupSettings.SQL.Text := 'SELECT CodAlmoxarifado, DescAlmox FROM ALMOX WHERE IDPESSOA = ' +
                        FloatToStr( CrmRptCM.IdEmpresa ) + ' ORDER BY 2';
end;

procedure TRptInventFF.CmpRptCMParamControlExit(Sender: TPainelControles;
  Index: Integer);
begin
  inherited;
  Case Index of
       0: sNomeAlmox := Sender.CtrlLookup.Text;
       1: sNomeGrupo := Sender.CtrlLookup.Text;
  End;
end;

procedure TRptInventFF.CrmRptCMBeforePrint(Sender: TObject);
var
  ipos: Integer;
Begin
  inherited;
  CdsAux.Close;
  SqlAux.SQL.text := 'SELECT MASCGRUPOPROD FROM PARALMOX WHERE IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa );
  SqlAux.Open;
  ipos := Pos( '.', CdsAux.FieldByName( 'MASCGRUPOPROD' ).AsString ) - 1;
  CdsAux.Close;
  SqlAux.SQL.text := 'SELECT CODCUSTEIO FROM ALMOX WHERE CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString;
  SqlAux.Open;

  With SqlInventFF Do Begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT CAT.CodGrupoProd,  ');
       Sql.Add('       CAT.StatusGrupo,   ');
       Sql.Add('       CAT.CODARTIGO,     ');
       Sql.Add('       CAT.SALDOQTDE,     ');
       Sql.Add('       CAT.DESCPROD,      ');
       Sql.Add('       CAT.CodMedCusto,   ');
       Sql.Add('       CAT.CustoMedio,    ');
       Sql.Add('       CAT.DescGrupoProd, ');
       Sql.Add('       CAT.Valor, ');
       Sql.Add('       CAT.TOTAL ');
       Sql.Add('  FROM ( SELECT S.CODARTIGO,     ');
       Sql.Add('                S.SALDOQTDE,     ');
       Sql.Add('                P.DESCPROD,      ');
       Sql.Add('                P.CodGrupoProd,  ');
       Sql.Add('                P.CodMedCusto,   ');
       Sql.Add('                C.CustoMedio,    ');
       Sql.Add('                G.DescGrupoProd, ');
       Sql.Add('                G.StatusGrupo,   ');
       Sql.Add('                ( S.SaldoQtde * C.CustoMedio ) As Valor, ');
       Sql.Add('                ( 0 ) as TOTAL ');
       Sql.Add('           FROM Saldo S,    ');
       Sql.Add('                CustoMed C, ');
       Sql.Add('                Produto P,  ');
       Sql.Add('                GrupProd G  ');
       Sql.Add('          WHERE ( S.CodAlmoxarifado = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ');

       If CmpRptCM.ParamValues[ 3 ].AsBoolean Then
          Sql.Add('            AND ( P.ITEMESTOCAVEL = ''S'' ) ');

       Sql.Add('            And ( C.CodCusteio = '+ IntToStr( CdsAux.fieldbyName( 'CODCUSTEIO' ).AsInteger ) + ' ) ');
       Sql.Add('            And ( S.idPessoa = '+ FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ');
       Sql.Add('            And ( Substr(S.CodArtigo, 1, 6 ) = P.CodProduto ) ');
       Sql.Add('            And ( C.CodArtigo = S.CodArtigo ) ');
       Sql.Add('            And ( G.CodGrupoProd(+) = P.CodGrupoProd ) ');
       Sql.Add('          UNION ');
       Sql.Add('         SELECT ( '''' ) AS C1, ');
       Sql.Add('                ( 0 )    AS C2, ');
       Sql.Add('                ( '''' ) AS C3, ');
       Sql.Add('                G.CodGrupoProd AS C4, ');
       Sql.Add('                ( '''' ) AS C5, ');
       Sql.Add('                ( 0 )    AS C6, ');
       Sql.Add('                G.DescGrupoProd  AS C7, ');
       Sql.Add('                G.StatusGrupo    AS C8, ');
       Sql.Add('                ( 0 )            AS C9, ');
       Sql.Add('                SUM( AUX.TOTAL ) AS C10 ');
       Sql.Add('           FROM GRUPPROD G, ');
       Sql.Add('                ( SELECT P.CODGRUPOPROD, ');
       Sql.Add('                         SUM( S.SaldoQtde * C.CustoMedio ) As TOTAL ');
       Sql.Add('                    FROM SALDO S, ');
       Sql.Add('                         PRODUTO P, ');
       Sql.Add('                         CUSTOMED C ');
       Sql.Add('                   WHERE ( S.CodAlmoxarifado = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ');

       If CmpRptCM.ParamValues[ 3 ].AsBoolean Then
          Sql.Add('                     AND ( P.ITEMESTOCAVEL = ''S'' ) ');

       Sql.Add('                     And ( C.CodCusteio = ' + IntToStr( CdsAux.fieldbyName( 'CODCUSTEIO' ).AsInteger ) + ' ) ');
       Sql.Add('                     And ( S.idPessoa = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ');
       Sql.Add('                     And ( Substr( S.CodArtigo, 1, 6 ) = P.CodProduto ) ');
       Sql.Add('                     And ( C.CodArtigo = S.CodArtigo ) ');
       Sql.Add('                   GROUP BY P.CODGRUPOPROD ');
       Sql.Add('                ) AUX ');
       Sql.Add('          WHERE ( G.STATUSGRUPO = ''S'' ) ');
       Sql.Add('            AND ( G.CODGRUPOPROD LIKE SUBSTR( RTRIM( AUX.CODGRUPOPROD ), 1, ' + IntToStr( ipos ) + ') || ''%'' ) ');
       Sql.Add('            AND ( LENGTH( RTRIM( G.CODGRUPOPROD ) ) <= ' + IntToStr( ipos ) + ' ) ');
       Sql.Add('          GROUP BY G.CODGRUPOPROD, G.DescGrupoProd, G.StatusGrupo ');
       Sql.Add('       ) CAT ');

       If ( Not CmpRptCM.ParamValues[ 1 ].IsNull ) And ( CmpRptCM.ParamValues[ 2 ].AsBoolean ) Then
          sql.Add(' WHERE ( RTRIM( CAT.CodGrupoProd ) LIKE ' + QuotedStr( CmpRptCM.ParamValues[ 1 ].AsString + '%' ) + ' ) ')
       Else
          If ( Not CmpRptCM.ParamValues[ 1 ].IsNull ) And ( Not CmpRptCM.ParamValues[ 2 ].AsBoolean )  Then
              sql.Add(' WHERE ( RTRIM( CAT.CodGrupoProd ) LIKE ' + QuotedStr( CmpRptCM.ParamValues[ 1 ].AsString + '%' ) +  ' ) ' +
                      ' AND ( CAT.VALOR <> 0 ) AND ( CAT.SaldoQtde <> 0 ) ')
          Else
             If ( CmpRptCM.ParamValues[ 1 ].IsNull ) And ( Not CmpRptCM.ParamValues[ 2 ].AsBoolean )  Then
                sql.Add(' WHERE ( CAT.VALOR <> 0 ) AND ( CAT.SaldoQtde <> 0 ) ');

       Case CmpRptCM.ParamValues[ 4 ].AsInteger Of
            0: sql.Add(' Order By CAT.CodGrupoProd, CAT.DescProd');
            1: sql.Add(' Order By CAT.CodGrupoProd, CAT.CODARTIGO');
       End;

       CdsAux.Close;
       Open;
  End;

  lbAlmox2.Caption := sNomeAlmox;
end;

procedure TRptInventFF.GrpInventFFBeforePrint(Sender: TObject);
begin
  inherited;
  If CdsInventFF.FieldByName('StatusGrupo').asString = 'A' Then Begin
     GrpInventFF.Visible := Not CdsInventFF.FieldByName( 'CodArtigo' ).isNull;
     Lin1.Visible        := False;
  End Else
     Lin1.Visible := True;
end;

procedure TRptInventFF.DetInVentFFBeforePrint(Sender: TObject);
begin
  inherited;
  DetInVentFF.Visible := Not CdsInventFF.FieldByName( 'CodArtigo' ).isNull;
end;

procedure TRptInventFF.RodapeInventFFBeforePrint(Sender: TObject);
begin
  inherited;
  RodapeInventFF.Visible := Not CdsInventFF.FieldByName( 'CodArtigo' ).isNull;
end;

end.
