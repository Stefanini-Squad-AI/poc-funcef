unit rUltMovArt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, Wwdatsrc, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE,
  uCmRptManager, TXComp, CmParamReport, DBClient, uCMClientDataSet,
  uCmSqlParams;

type
  TRptUltMovArt = class(TFrmCmReport)
    bdeUltMovArt: TppBDEPipeline;
    bdeUltMovArtppField1: TppField;
    bdeUltMovArtppField2: TppField;
    bdeUltMovArtppField3: TppField;
    bdeUltMovArtppField4: TppField;
    bdeUltMovArtppField5: TppField;
    bdeUltMovArtppField6: TppField;
    bdeUltMovArtppField7: TppField;
    bdeUltMovArtppField8: TppField;
    bdeUltMovArtppField9: TppField;
    dsUltMovArt: TwwDataSource;
    RptUltMovArt: TppReport;
    ppHeaderBand36: TppHeaderBand;
    ppLabel231: TppLabel;
    ppLine102: TppLine;
    LblEmpresa: TppLabel;
    ppLine104: TppLine;
    ppLabel234: TppLabel;
    ppLabel235: TppLabel;
    ppLabel236: TppLabel;
    ppLabel237: TppLabel;
    ppLabel238: TppLabel;
    ppLabel239: TppLabel;
    ppLabel240: TppLabel;
    ppLabel241: TppLabel;
    lbGrupo4: TppLabel;
    lbAlmox15: TppLabel;
    lbData2: TppLabel;
    ppDetailBand32: TppDetailBand;
    ppDBText102: TppDBText;
    ppDBText103: TppDBText;
    ppDBText104: TppDBText;
    ppDBText106: TppDBText;
    ppDBText107: TppDBText;
    ppDBText108: TppDBText;
    ppDBText109: TppDBText;
    ppDBText105: TppDBText;
    ppFooterBand37: TppFooterBand;
    ppLine103: TppLine;
    LblSistema: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    SqlUltMovArt: TCMSqlParams;
    CdsUltMovArt: TCMClientDataSet;
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
  RptUltMovArt: TRptUltMovArt;
  sNomeAlmox: String = '';
  sNomeGrupo: String = '';

implementation

{$R *.DFM}

procedure TRptUltMovArt.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamByName( 'Almoxarifado' ).LookupSettings.SQL.Text := 'SELECT CODALMOXARIFADO, DESCALMOX FROM ALMOX WHERE IDPESSOA = ' +
                        FloatToStr( CrmRptCM.IdEmpresa ) + ' ORDER BY 2';
  CmpRptCM.ParamByName( 'Data' ).TextDefault := DateToStr( Date );
end;

procedure TRptUltMovArt.CmpRptCMParamControlExit(Sender: TPainelControles;
  Index: Integer);
begin
  inherited;
  Case Index of
       0: sNomeAlmox := Sender.CtrlLookup.Text;
       1: sNomeGrupo := Sender.CtrlLookup.Text;
  End;
end;

procedure TRptUltMovArt.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  lbAlmox15.Caption := sNomeAlmox;
  lbData2.Caption   := 'Até ' + CmpRptCM.ParamValues[ 2 ].AsString;

  With SqlUltMovArt Do Begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT M.IDMOV, ');
       Sql.Add('       M.CODARTIGO, ');
       Sql.Add('       P.DESCPROD, ');
       Sql.Add('       M.DATAMOV, ');
       Sql.Add('       M.SALDOQTDEMOV, ');
       Sql.Add('       M.QTDEMOV, ');
       Sql.Add('       P.CODMEDCUSTO, ');
       Sql.Add('       M.CUSTOMEDIOMOV, ');
       Sql.Add('       M.CODTIPOMOV, ');
       Sql.Add('       T.DESCRESUMIDA ');
       Sql.Add('  FROM MOVIMENT M, ');
       Sql.Add('       ( SELECT M.CODARTIGO, ');
       Sql.Add('                MAX( M.IDMOV ) AS IDMOV ');
       Sql.Add('           FROM MOVIMENT M, ');
       Sql.Add('                ( SELECT CODARTIGO, ');
       Sql.Add('                         MAX( DATAMOV ) AS MAXDATAMOV ');
       Sql.Add('                    FROM MOVIMENT ');
       Sql.Add('                   WHERE ( DATAMOV <= TO_DATE( ' + QuotedStr( CmpRptCM.ParamValues[ 2 ].AsString ) + ', ''DD/MM/YYYY'' ) )');
       Sql.Add('                     AND ( CODALMOXARIFADO = '+ CmpRptCM.ParamValues[ 0 ].AsString + ' ) ');
       Sql.Add('                   GROUP BY CODARTIGO ');
       Sql.Add('                ) SUB ');
       Sql.Add('          WHERE ( M.CODARTIGO = SUB.CODARTIGO ) ');
       Sql.Add('            AND ( M.DATAMOV =SUB.MAXDATAMOV ) ');
       Sql.Add('            AND ( M.CODALMOXARIFADO = '+ CmpRptCM.ParamValues[ 0 ].AsString + ' ) ');
       Sql.Add('          GROUP BY M.CODARTIGO ');
       Sql.Add('       ) AUX, ');
       Sql.Add('       PRODUTO P, ');
       Sql.Add('       ARTIGO A, ');
       Sql.Add('       TIPOMOV T ');
       Sql.Add(' WHERE ( M.CODALMOXARIFADO = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ');
       Sql.Add('   AND ( M.CODARTIGO = AUX.CODARTIGO ) ');
       Sql.Add('   AND ( M.IDMOV = AUX.IDMOV ) ');

       If Not CmpRptCM.ParamValues[ 1 ].IsNull Then Begin
          Sql.Add(' AND ( RTRIM( P.CODGRUPOPROD ) LIKE ' + QuotedStr( Trim( CmpRptCM.ParamValues[ 1 ].AsString ) + '%' ) + ' ) ');
          lbGrupo4.Caption  := CmpRptCM.ParamValues[ 1 ].AsString + ' - '+ sNomeGrupo;
       End;

       Sql.Add('  AND ( M.CODARTIGO = A.CODARTIGO ) ');
       Sql.Add('  AND ( A.CODPRODUTO = P.CODPRODUTO ) ');
       Sql.Add('  AND ( A.CODPRODUTO = P.CODPRODUTO ) ');
       Sql.Add('  AND ( M.CODTIPOMOV = T.CODTIPOMOV ) ');

       Case CmpRptCM.ParamValues[ 3 ].AsInteger Of
            0: Sql.Add(' ORDER BY P.DESCPROD');
            1: Sql.Add(' ORDER BY M.CODARTIGO');
       End;

       Open;
  End;
end;

end.
