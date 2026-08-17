unit rCurvaABCCustoMed;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, ppBands,
  ppClass, ppVar, ppCtrls, ppPrnabl, ppCache, ppProd, ppReport, Wwdatsrc,
  ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, uCmRptManager, TXComp,
  CmParamReport;

type
  TRptCurvaABCCustoMed = class(TFrmCmReport)
    bdeCurvaAltCustoMed: TppBDEPipeline;
    bdeCurvaAltCustoMedppField1: TppField;
    bdeCurvaAltCustoMedppField2: TppField;
    bdeCurvaAltCustoMedppField3: TppField;
    bdeCurvaAltCustoMedppField4: TppField;
    bdeCurvaAltCustoMedppField5: TppField;
    bdeCurvaAltCustoMedppField6: TppField;
    bdeCurvaAltCustoMedppField7: TppField;
    bdeCurvaAltCustoMedppField8: TppField;
    bdeCurvaAltCustoMedppField9: TppField;
    bdeCurvaAltCustoMedppField10: TppField;
    bdeCurvaAltCustoMedppField11: TppField;
    bdeCurvaAltCustoMedppField12: TppField;
    dsCurvaAltCustoMed: TwwDataSource;
    RptCurvaAltCustoMed: TppReport;
    ppHeaderBand38: TppHeaderBand;
    ppLabel252: TppLabel;
    ppLine111: TppLine;
    LblEmpresa: TppLabel;
    lbPer19: TppLabel;
    rpABCLabel6: TppLabel;
    lbAlmox16: TppLabel;
    ppLabel258: TppLabel;
    lbGrupo5: TppLabel;
    ppLine113: TppLine;
    ppLabel260: TppLabel;
    ppLabel261: TppLabel;
    ppLabel262: TppLabel;
    ppLabel263: TppLabel;
    ppLabel264: TppLabel;
    ppLabel265: TppLabel;
    ppLabel266: TppLabel;
    ppLabel267: TppLabel;
    ppLabel268: TppLabel;
    ppLabel269: TppLabel;
    ppDetailBand34: TppDetailBand;
    ppDBText119: TppDBText;
    ppDBText120: TppDBText;
    ppDBText121: TppDBText;
    ppDBText122: TppDBText;
    ppDBText123: TppDBText;
    ppDBText124: TppDBText;
    ppDBText125: TppDBText;
    ppDBText126: TppDBText;
    ppDBText127: TppDBText;
    ppDBText128: TppDBText;
    ppDBText143: TppDBText;
    ppFooterBand39: TppFooterBand;
    ppLine112: TppLine;
    LblSistema: TppLabel;
    ppSystemVariable9: TppSystemVariable;
    ppSystemVariable10: TppSystemVariable;
    ppGroup16: TppGroup;
    ppGroupHeaderBand13: TppGroupHeaderBand;
    ppDBText129: TppDBText;
    ppLine114: TppLine;
    ppGroupFooterBand13: TppGroupFooterBand;
    SqlCurvaAltCustoMed: TCMSqlParams;
    CdsCurvaAltCustoMed: TCMClientDataSet;
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
  RptCurvaABCCustoMed: TRptCurvaABCCustoMed;
  sNomeAlmox: String = '';
  sNomeGrupo: String = '';
  
implementation

{$R *.DFM}

procedure TRptCurvaABCCustoMed.CmpRptCMBeforeExecute(
  var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamByName( 'Almoxarifado' ).LookupSettings.SQL.Text := 'SELECT CODALMOXARIFADO, DESCALMOX FROM ALMOX WHERE IDPESSOA = ' +
                        FloatToStr( CrmRptCM.IdEmpresa ) + ' ORDER BY 2';
  CmpRptCM.ParamByName( 'DataInicial' ).TextDefault := DateToStr( Date );
  CmpRptCM.ParamByName( 'DataFinal' ).TextDefault   := DateToStr( Date );
end;

procedure TRptCurvaABCCustoMed.CrmRptCMBeforePrint(Sender: TObject);
Var
  cAux: Char;
  sGrupo, sPercDif: String;
begin
  inherited;
  LbAlmox16.Caption := sNomeAlmox;
  cAux := DecimalSeparator;
  DecimalSeparator := '.';

  Try
     sPercDif := ' ( ( ABS( MAX.CUSTOMEDIOMOV - MIN.CUSTOMEDIOMOV ) / DECODE( MIN.CUSTOMEDIOMOV, 0, 1, MIN.CUSTOMEDIOMOV ) ) * 100 ) ';

     sGrupo   := ' ( DECODE( SIGN(' + sPercDif + '-' + FloatToStr( CmpRptCM.ParamValues[ 3 ].AsFloat ) + '), 1, ''A'', ' +
                    'DECODE( SIGN(' + sPercDif + '-' + FloatToStr( CmpRptCM.ParamValues[ 4 ].AsFloat ) + '), 1, ''B'', ' +
                    'DECODE( SIGN(' + sPercDif + '-' + FloatToStr( CmpRptCM.ParamValues[ 5 ].AsFloat ) + '), 1, ''C'', ''D'' ) ) ) ) ';

     With SqlCurvaAltCustoMed Do Begin
          Close;
          Sql.Clear;
          Sql.Add('SELECT ' + sGrupo + ' AS GRUPO, ');
          Sql.Add('       SUB.CODARTIGO, ');
          Sql.Add('       P.DESCPROD,    ');
          Sql.Add('       P.CODMEDCUSTO, ');
          Sql.Add('       MIN.CUSTOMEDIOMOV AS ULTCUSTOMED, ');
          Sql.Add('       MAX.CUSTOMEDIOMOV AS NOVOCUSTOMED, ');
          Sql.Add('       ( MAX.CUSTOMEDIOMOV - MIN.CUSTOMEDIOMOV ) AS DIFCUSTOMED, ');
          Sql.Add('       ' + sPercDif + 'AS PERCCUSTOMED, ');
          Sql.Add('       ( 0 ) AS ULTPRECO,  ');
          Sql.Add('       ( 0 ) AS NOVOPRECO, ');
          Sql.Add('       ( 0 ) AS DIFPRECO,  ');
          Sql.Add('       ( 0 ) AS PERCPRECO  ');
          Sql.Add('  FROM MOVIMENT MIN, ');
          Sql.Add('       MOVIMENT MAX, ');
          Sql.Add('       ( SELECT UN.CODARTIGO, ');
          Sql.Add('                MAX( UN.IDMAX ) AS IDMAX, ');
          Sql.Add('                MAX( UN.IDMIN ) AS IDMIN ');
          Sql.Add('           FROM ( SELECT M.CODARTIGO, ');
          Sql.Add('                         TO_DATE('''') AS DATA, ');
          Sql.Add('                         ( 0 ) AS IDMIN, ');
          Sql.Add('                         MAX( IDMOV ) AS IDMAX ');
          Sql.Add('                    FROM MOVIMENT M ');
          Sql.Add('                   WHERE ( M.CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ');
          Sql.Add('                     AND ( M.DATAMOV >= TO_DATE(' + QuotedStr( CmpRptCM.ParamValues[ 1 ].AsString ) + ', ''dd/mm/yyyy'' ) ) ');
          Sql.Add('                     AND ( M.DATAMOV <= TO_DATE(' + QuotedStr( CmpRptCM.ParamValues[ 2 ].AsString ) + ', ''dd/mm/yyyy'' ) ) ');
          Sql.Add('                     AND ( M.IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ');
          Sql.Add('                   GROUP BY M.CODARTIGO ');
          Sql.Add('                   UNION ');
          Sql.Add('                  SELECT M.CODARTIGO, ');
          Sql.Add('                         MIN( M.DATAMOV ) AS DATA, ');
          Sql.Add('                         MIN( IDMOV ) AS IDMIN, ');
          Sql.Add('                         ( 0 ) AS IDMAX ');
          Sql.Add('                    FROM MOVIMENT M ');
          Sql.Add('                   WHERE ( M.CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ');
          Sql.Add('                     AND ( M.DATAMOV >= TO_DATE(' + QuotedStr( CmpRptCM.ParamValues[ 1 ].AsString ) + ', ''dd/mm/yyyy'' ) ) ');
          Sql.Add('                     AND ( M.DATAMOV <= TO_DATE(' + QuotedStr( CmpRptCM.ParamValues[ 2 ].AsString ) + ', ''dd/mm/yyyy'' ) ) ');
          Sql.Add('                     AND ( M.IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ');
          Sql.Add('                   GROUP BY M.CODARTIGO ');
          Sql.Add('                ) UN ');
          Sql.Add('          GROUP BY UN.CODARTIGO ');
          Sql.Add('       ) SUB, ');
          Sql.Add('       PRODUTO P, ');
          Sql.Add('       ARTIGO A,  ');
          Sql.Add('       GRUPPROD G ');
          Sql.Add(' WHERE ( SUB.CODARTIGO = A.CODARTIGO ) ');

          If Not CmpRptCM.ParamValues[ 7 ].IsNull Then Begin
             Sql.Add('   AND ( RTRIM( P.CODGRUPOPROD ) LIKE ' + QuotedStr( Trim( CmpRptCM.ParamValues[ 7 ].AsString ) + '%' ) + ' ) ');
             LbGrupo5.Caption := sNomeGrupo;
          End Else
             LbGrupo5.Caption := 'Todos';

          Case CmpRptCM.ParamValues[ 6 ].AsInteger Of
               1: Sql.Add('   AND ( GRUPO = ''A'' ) ');
               2: Sql.Add('   AND ( ( GRUPO = ''A'' ) OR ( GRUPO = ''B'' ) ) ');
               3: Sql.Add('   AND ( ( GRUPO = ''A'' ) OR ( GRUPO = ''B'' ) OR ( GRUPO = ''C'' ) ) ');
          End;

          Sql.Add('   AND ( SUB.IDMIN = MIN.IDMOV ) ');
          Sql.Add('   AND ( SUB.IDMAX = MAX.IDMOV ) ');
          Sql.Add('   AND ( A.CODPRODUTO = P.CODPRODUTO ) ');
          Sql.Add('   AND ( G.CODGRUPOPROD = P.CODGRUPOPROD ) ');
          Sql.Add(' ORDER BY GRUPO, PERCCUSTOMED DESC');
          Open;
     End;
  Finally
     DecimalSeparator := cAux;
  End;
end;

procedure TRptCurvaABCCustoMed.CmpRptCMParamControlExit(
  Sender: TPainelControles; Index: Integer);
begin
  inherited;
  Case Index of
       0: sNomeAlmox := Sender.CtrlLookup.Text;
       7: sNomeGrupo := Sender.CtrlLookup.Text;
  End;
end;

end.
