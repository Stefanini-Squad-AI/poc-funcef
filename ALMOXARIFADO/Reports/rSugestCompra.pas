unit rSugestCompra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, ppVar, ppBands,
  ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, Wwdatsrc, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, uCmRptManager, TXComp, CmParamReport,
  MontaSelect;

type
  TRptSugestCompra = class(TFrmCmReport)
    bdeSugestCompra: TppBDEPipeline;
    dsSugestCompra: TwwDataSource;
    RptSugestCompra: TppReport;
    ppHeaderBand9: TppHeaderBand;
    ppLabel44: TppLabel;
    ppLine13: TppLine;
    LblEmpresa: TppLabel;
    RptSugestCompLabel1: TppLabel;
    RptSugestCompLabel2: TppLabel;
    RptSugestCompLabel3: TppLabel;
    RptSugestCompLabel4: TppLabel;
    RptSugestCompLabel5: TppLabel;
    RptSugestCompLabel6: TppLabel;
    RptSugestCompLabel7: TppLabel;
    RptSugestCompLabel8: TppLabel;
    RptSugestCompLabel9: TppLabel;
    RptSugestCompLabel10: TppLabel;
    RptSugestCompLabel11: TppLabel;
    RptSugestCompLabel12: TppLabel;
    RptSugestCompLabel13: TppLabel;
    RptSugestCompLabel14: TppLabel;
    RptSugestCompLabel15: TppLabel;
    RptSugestCompLine1: TppLine;
    RptSugestCompDBText9: TppDBText;
    RptSugestCompLabel16: TppLabel;
    RptSugestCompLabel17: TppLabel;
    RptSugestCompLabel18: TppLabel;
    ppDetailBand9: TppDetailBand;
    RptSugestCompDBText1: TppDBText;
    RptSugestCompDBText2: TppDBText;
    RptSugestCompDBText3: TppDBText;
    RptSugestCompDBText4: TppDBText;
    RptSugestCompDBText5: TppDBText;
    RptSugestCompDBText7: TppDBText;
    RptSugestCompDBText8: TppDBText;
    RptSugestCompDBText10: TppDBText;
    RptSugestCompDBText6: TppDBText;
    RptSugestCompDBText11: TppDBText;
    ppFooterBand9: TppFooterBand;
    ppLine18: TppLine;
    LblSistema: TppLabel;
    ppCalc16: TppSystemVariable;
    ppCalc17: TppSystemVariable;
    SqlSugestCompra: TCMSqlParams;
    CdsSugestCompra: TCMClientDataSet;
    MsSugestCompra: TMontaSelect;
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
  RptSugestCompra: TRptSugestCompra;

implementation

{$R *.DFM}

procedure TRptSugestCompra.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamByName( 'Almoxarifado' ).LookupSettings.SQL.Text := 'SELECT CODALMOXARIFADO, DESCALMOX FROM ALMOX WHERE IDPESSOA = ' +
                        FloatToStr( CrmRptCM.IdEmpresa ) + ' ORDER BY 2';
                        
  With CmpRptCM.ParamByName( 'Analise' ).MontaSelect.Filtro Do Begin
       Clear;
       Add( 'IDPESSOA = ' + FloatToStr( CrmRptCM.IdEmpresa ) );
       Add( 'CODALMOXARIFADO = 0' );
       Add( '( FLGACEITA <> ''S'' ) OR ( FLGACEITA IS NULL )' );
  End;
end;

procedure TRptSugestCompra.CmpRptCMParamControlExit(
  Sender: TPainelControles; Index: Integer);
begin
  inherited;
  Case Index Of
       0: CmpRptCM.ParamByName( 'Analise' ).MontaSelect.Filtro[ 1 ] := '( CODALMOXARIFADO = ' + Sender.CtrlLookup.LookupValue + ' ) ';
  End;
end;

procedure TRptSugestCompra.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  With SqlSugestCompra Do Begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT I.IDANALISEESTOQUE, ');
       Sql.Add('       A.CODARTIGO, ');
       Sql.Add('       P.DESCPROD || '' '' || RTRIM( A.CODCOR ) ||'' ''|| RTRIM( A.CODTAMANHO ) AS PRODUTO, ');
       Sql.Add('       DECODE( FLGTEMPMEDCALC,  ''S'', TRMEDCALCULADO,    TRMEDINFORMADO ) AS TEMPOMED, ');
       Sql.Add('       DECODE( FLGCONSMEDCALC,  ''S'', CONSMEDCALCULADO,  CONSMEDINFORMADO ) AS CONSMED, ');
       Sql.Add('       DECODE( FLGPONTOREPCALC, ''S'', PONTOREPCALCULADO, PONTOREPINFORMADO ) AS PONTOREP, ');
       Sql.Add('       DECODE( FLGQTDEMINCALC,  ''S'', QTDEMINCALCULADA,  QTDEMININFORMADA ) AS QTDEMIN, ');
       Sql.Add('       I.QTDESUGAUTO,      ');
       Sql.Add('       I.QTDESUGCALCULADA, ');
       Sql.Add('       I.QTDECOMPRAR,      ');
       Sql.Add('       I.SALDOESTOQUE,     ');
       Sql.Add('       P.CODMEDCUSTO       ');
       Sql.Add('  FROM ITEMANALISEESTOQ I, ');
       Sql.Add('       ARTIGO A, ');
       Sql.Add('       PRODUTO P ');
       Sql.Add(' WHERE ( I.IDANALISEESTOQUE = ' + CmpRptCM.ParamValues[ 1 ].AsString + ' ) ');

       If CmpRptCM.ParamValues[ 2 ].AsBoolean Then
          Sql.Add('   AND ( ( I.QTDESUGCALCULADA <> 0 ) OR ( I.QTDECOMPRAR <> 0 ) ) ');

       Sql.Add('   AND ( I.CODARTIGO = A.CODARTIGO ) ');
       Sql.Add('   AND ( A.CODPRODUTO = P.CODPRODUTO ) ');
       Sql.Add(' ORDER BY PRODUTO');
       Open;
  End;
end;

end.
