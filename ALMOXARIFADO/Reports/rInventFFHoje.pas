unit rInventFFHoje;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, DBClient,
  uCMClientDataSet, uCmSqlParams, ppBands, ppClass, ppCtrls, ppVar,
  ppPrnabl, ppCache, ppProd, ppReport, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE;

type
  TRptInventFFHoje = class(TFrmCmReport)
    dsInventFFHoje: TwwDataSource;
    SqlInventFFHoje: TCMSqlParams;
    CdsInventFFHoje: TCMClientDataSet;
    SqlAux: TCMSqlParams;
    CdsAux: TCMClientDataSet;
    bdeInventFFHoje: TppBDEPipeline;
    RptInventFFHoje: TppReport;
    ppHeaderBand23: TppHeaderBand;
    ppLabel124: TppLabel;
    ppLine51: TppLine;
    LblEmpresa: TppLabel;
    LbAlmox11: TppLabel;
    ppLine52: TppLine;
    ppLabel130: TppLabel;
    ppLabel132: TppLabel;
    ppLabel140: TppLabel;
    ppLabel141: TppLabel;
    ppLabel144: TppLabel;
    ppLabel146: TppLabel;
    lbFiltro4: TppLabel;
    LbPer10: TppLabel;
    DetInventF: TppDetailBand;
    ppDBText43: TppDBText;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppFooterBand23: TppFooterBand;
    ppLine58: TppLine;
    LblSistema: TppLabel;
    ppCalc44: TppSystemVariable;
    ppCalc45: TppSystemVariable;
    ppSummaryBand4: TppSummaryBand;
    ppGroup9: TppGroup;
    CabecInventF: TppGroupHeaderBand;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    ppLine59: TppLine;
    RodapeInventF: TppGroupFooterBand;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure DetInventFBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptInventFFHoje: TRptInventFFHoje;
  sNomeAlmox: String = '';
  sNomeGrupo: String = '';

implementation

{$R *.DFM}

procedure TRptInventFFHoje.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamByName( 'Almoxarifado' ).LookupSettings.SQL.Text := 'SELECT CODALMOXARIFADO, DESCALMOX FROM ALMOX WHERE IDPESSOA = ' +
                        FloatToStr( CrmRptCM.IdEmpresa ) + ' ORDER BY 2';

  SqlAux.Sql.Text := 'SELECT DATAREPRESA FROM PARALMOX WHERE IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa );
  SqlAux.Open;
  CmpRptCM.ParamByName( 'DataLimite' ).TextDefault := DateToStr( CdsAux.FieldByName( 'DATAREPRESA' ).AsDateTime );
  CdsAux.Close;
end;

procedure TRptInventFFHoje.CmpRptCMParamControlExit(Sender: TPainelControles;
  Index: Integer);
begin
  inherited;
  Case Index of
       0: sNomeAlmox := Sender.CtrlLookup.Text;
       1: sNomeGrupo := Sender.CtrlLookup.Text;
  End;
end;

procedure TRptInventFFHoje.CrmRptCMBeforePrint(Sender: TObject);
var
  ipos: Integer;
Begin
  inherited;
  CdsAux.Close;  
  SqlAux.SQL.text := 'SELECT MASCGRUPOPROD FROM PARALMOX WHERE IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa );
  SqlAux.Open;
  ipos := Pos( '.', CdsAux.FieldByName( 'MASCGRUPOPROD' ).AsString ) - 1;
  CdsAux.Close;

  With SqlInventFFHoje Do Begin
       Close;
       Sql.Text := 'SELECT UN.CODGRUPOPROD, ' +
                          'UN.DESCGRUPOPROD, ' +
                          'UN.STATUSGRUPO, ' +
                          'UN.CODARTIGO, ' +
                          'UN.DESCPROD, ' +
                          'UN.CODMEDCUSTO, ' +
                          'UN.QTDE ' +
                     'FROM ( SELECT P.CODGRUPOPROD, '  +
                                   'G.DESCGRUPOPROD, ' +
                                   'G.STATUSGRUPO, ' +
                                   'MOV.CODARTIGO, ' +
                                   'P.DESCPROD, ' +
                                   'P.CODMEDCUSTO, ' +
                                   'MOV.SALDOQTDEMOV AS QTDE ' +
                              'FROM PRODUTO P, ' +
                                   'GRUPPROD G, ' +
                                   '( SELECT M.IDMOV, ' +
                                            'M.CODARTIGO, ' +
                                            'M.SALDOQTDEMOV, ' +
                                            'M.CODALMOXARIFADO, ' +
                                            'M.IDPESSOA ' +
                                       'FROM MOVIMENT M, ' +
                                            '( SELECT M.CODARTIGO, ' +
                                                     'MAX(M.IDMOV) AS IDMOV ' +
                                                'FROM MOVIMENT M, ' +
                                                     '( SELECT CODARTIGO, ' +
                                                              'MAX( DATAMOV ) AS MAXDATAMOV ' +
                                                         'FROM MOVIMENT ' +
                                                        'WHERE ( DATAMOV <= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 4 ].AsString ) + ', ''DD/MM/YYYY'' ) ) ' +
                                                          'AND ( CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ' +
                                                        'GROUP BY CODARTIGO ' +
                                                     ') SUB ' +
                                               'WHERE ( M.CODARTIGO = SUB.CODARTIGO ) ' +
                                                 'AND ( M.DATAMOV = SUB.MAXDATAMOV ) ' +
                                                 'AND ( M.CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ' +
                                               'GROUP BY M.CODARTIGO ' +
                                            ') AUX ' +
                                      'WHERE ( M.CODARTIGO = AUX.CODARTIGO ) ' +
                                        'AND ( M.CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ' +
                                        'AND ( M.IDMOV = AUX.IDMOV ) ' +
                                   ') MOV ' +
                             'WHERE ( MOV.CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ' +
                               'AND ( MOV.IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ';

       If Not CmpRptCM.ParamValues[ 2 ].AsBoolean Then
          Sql.Add('                AND ( MOV.SALDOQTDEMOV <> 0 ) ');

       If CmpRptCM.ParamValues[ 3 ].AsBoolean Then
          Sql.Add('                AND ( P.ITEMESTOCAVEL = ''S'' ) ');

       Sql.add('                AND ( SUBSTR( MOV.CODARTIGO, 1, 6 ) = P.CODPRODUTO ) ' +
                               'AND ( G.CODGRUPOPROD = P.CODGRUPOPROD ) ' +
                            'UNION ' +
                            'SELECT G.CODGRUPOPROD, ' +
                                   'G.DESCGRUPOPROD, ' +
                                   'G.STATUSGRUPO, ' +
                                   '('''') AS CODARTIGO, ' +
                                   '('''') AS DESCPROD, ' +
                                   '('''') AS CODMEDCUSTO, ' +
                                   '( 0 ) AS QTDE ' +
                              'FROM PRODUTO P, ' +
                                   'GRUPPROD G, ' +
                                   '( SELECT M.IDMOV, ' +
                                            'M.CODARTIGO, ' +
                                            'M.CODALMOXARIFADO, ' +
                                            'M.IDPESSOA ' +
                                       'FROM MOVIMENT M, ' +
                                            '( SELECT M.CODARTIGO, ' +
                                                     'MAX( M.IDMOV ) AS IDMOV ' +
                                                'FROM MOVIMENT M, ' +
                                                     '( SELECT CODARTIGO, ' +
                                                              'MAX( DATAMOV ) AS MAXDATAMOV ' +
                                                         'FROM MOVIMENT ' +
                                                        'WHERE ( DATAMOV <= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 4 ].AsString ) + ', ''DD/MM/YYYY'' ) ) ' +
                                                          'AND ( CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ' +
                                                        'GROUP BY CODARTIGO ' +
                                                     ') SUB ' +
                                               'WHERE ( M.CODARTIGO = SUB.CODARTIGO ) ' +
                                                 'AND ( M.DATAMOV = SUB.MAXDATAMOV ) ' +
                                                 'AND ( M.CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ' +
                                               'GROUP BY M.CODARTIGO ' +
                                            ') AUX '+
                                      'WHERE ( M.CODARTIGO = AUX.CODARTIGO ) ' +
                                        'AND ( M.CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ' +
                                        'AND ( M.IDMOV = AUX.IDMOV ) ' +
                                   ') MOV ' +
                             'WHERE ( MOV.CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ' +
                               'AND ( MOV.IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) + ' ) ');

       If CmpRptCM.ParamValues[ 3 ].AsBoolean Then
          Sql.Add('               AND ( P.ITEMESTOCAVEL = ''S'' ) ');

       Sql.Add('                AND ( SUBSTR( MOV.CODARTIGO, 1, 6 ) = P.CODPRODUTO ) ' +
                               'AND ( G.CODGRUPOPROD LIKE SUBSTR( RTRIM( P.CODGRUPOPROD ), 1, ' + IntToStr( ipos )+ ' ) || ''%'' ) ' +
                               'AND ( LENGTH( RTRIM( G.CODGRUPOPROD ) ) <= ' + IntToStr( ipos ) + ' ) ' +
                               'AND ( G.STATUSGRUPO = ''S'' ) ' +
                             'GROUP BY G.CODGRUPOPROD, ' +
                                      'G.DESCGRUPOPROD, ' +
                                      'G.STATUSGRUPO ' +
                          ') UN ');

       If Not CmpRptCM.ParamValues[ 1 ].IsNull Then Begin
          Sql.Add(' WHERE ( RTRIM( UN.CODGRUPOPROD ) LIKE ' + QuotedStr( CmpRptCM.ParamValues[ 1 ].AsString + '%' ) + ' ) ');
          lbFiltro4.Caption := CmpRptCM.ParamValues[ 1 ].AsString + ' - ' + sNomeGrupo;
       End;

       Case CmpRptCM.ParamValues[ 5 ].AsInteger Of
            0: Sql.Add(' ORDER BY UN.CODGRUPOPROD, UN.DESCPROD');
            1: Sql.Add(' ORDER BY UN.CODGRUPOPROD, UN.CODARTIGO');
       End;

       Open;
  End;

  lbAlmox11.Caption := sNomeAlmox;
  LbPer10.Caption   := 'em ' + CmpRptCM.ParamValues[ 4 ].AsString;
end;

procedure TRptInventFFHoje.DetInventFBeforePrint(Sender: TObject);
begin
  inherited;
  If CdsInventFFHoje.FieldByName( 'StatusGrupo' ).asString = 'S' Then
     DetInventF.Visible := Not CdsInventFFHoje.FieldByName('CodArtigo').isNull
  Else
     DetInventF.Visible := True;
end;

end.

