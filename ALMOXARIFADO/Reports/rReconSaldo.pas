unit rReconSaldo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, ppBands,
  ppClass, ppCtrls, ppVar, ppPrnabl, ppCache, ppProd, ppReport, ppDB,
  ppComm, ppRelatv, ppDBPipe, ppDBBDE, Wwdatsrc, uCmRptManager, TXComp,
  CmParamReport;

type
  TRptReconSaldo = class(TFrmCmReport)
    dsReconSaldo: TwwDataSource;
    bdeReconSaldo: TppBDEPipeline;
    bdeReconSaldoppField1: TppField;
    bdeReconSaldoppField2: TppField;
    bdeReconSaldoppField3: TppField;
    bdeReconSaldoppField4: TppField;
    bdeReconSaldoppField5: TppField;
    bdeReconSaldoppField6: TppField;
    bdeReconSaldoppField7: TppField;
    bdeReconSaldoppField8: TppField;
    bdeReconSaldoppField9: TppField;
    bdeReconSaldoppField10: TppField;
    bdeReconSaldoppField11: TppField;
    bdeReconSaldoppField12: TppField;
    bdeReconSaldoppField13: TppField;
    bdeReconSaldoppField14: TppField;
    bdeReconSaldoppField15: TppField;
    RptReconSaldo: TppReport;
    ppHeaderBand16: TppHeaderBand;
    ppLabel74: TppLabel;
    LblEmpresa: TppLabel;
    ppLabel76: TppLabel;
    lblAlmox: TppLabel;
    LblPeriodo: TppLabel;
    ppLine30: TppLine;
    ppLabel79: TppLabel;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
    ppLabel88: TppLabel;
    ppLabel89: TppLabel;
    ppLabel90: TppLabel;
    ppLabel91: TppLabel;
    ppLabel92: TppLabel;
    ppLabel93: TppLabel;
    ppLabel94: TppLabel;
    ppLine31: TppLine;
    ppLabel95: TppLabel;
    ppLabel96: TppLabel;
    ppLabel97: TppLabel;
    ppLabel98: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppLabel99: TppLabel;
    ppDBText31: TppDBText;
    ppFooterBand16: TppFooterBand;
    ppLine32: TppLine;
    LblSistema: TppLabel;
    ppCalc30: TppSystemVariable;
    ppCalc31: TppSystemVariable;
    ppSummaryBand3: TppSummaryBand;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppLabel101: TppLabel;
    ppLine33: TppLine;
    ppDBCalc12: TppDBCalc;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppDBText32: TppDBText;
    ppLine34: TppLine;
    ppDBText33: TppDBText;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppLine35: TppLine;
    ppLine36: TppLine;
    ppLabel102: TppLabel;
    ppDBCalc22: TppDBCalc;
    ppDBCalc23: TppDBCalc;
    ppDBCalc24: TppDBCalc;
    ppDBCalc25: TppDBCalc;
    ppDBCalc26: TppDBCalc;
    ppDBCalc27: TppDBCalc;
    ppDBCalc28: TppDBCalc;
    ppDBText34: TppDBText;
    ppDBCalc29: TppDBCalc;
    ppDBCalc30: TppDBCalc;
    SqlParReconSaldo: TCMSqlParams;
    CdsReconSaldo: TCMClientDataSet;
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
  RptReconSaldo: TRptReconSaldo;
  sNomeAlmox: String = '';
  sNomeGrupo: String = '';

implementation

{$R *.DFM}

Uses uSistema, uModulo;

procedure TRptReconSaldo.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamByName( 'Almoxarifado' ).LookupSettings.SQL.Text := 'SELECT CODALMOXARIFADO, DESCALMOX FROM ALMOX WHERE IDPESSOA = ' + FloatToStr( CrmRptCM.idEmpresa ) + ' ORDER BY 2';
  CmpRptCM.ParamByName( 'Grupo de Produtos' ).LookupSettings.SQL.Text := 'SELECT CODGRUPOPROD, DESCGRUPOPROD FROM GRUPPROD WHERE IDPESSOA = ' + FloatToStr( CrmRptCM.idEmpresa ) + ' ORDER BY 2';
  CmpRptCM.ParamByName( 'DataInicial' ).TextDefault := DateToStr( Date );
  CmpRptCM.ParamByName( 'DataFinal' ).TextDefault   := DateToStr( Date );
end;

procedure TRptReconSaldo.CmpRptCMParamControlExit(Sender: TPainelControles;
  Index: Integer);
begin
  inherited;
  Case Index of
       0: sNomeAlmox := Sender.CtrlLookup.Text;
       1: sNomeGrupo := Sender.CtrlLookup.Text;
  End;
end;

procedure TRptReconSaldo.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  With SqlParReconSaldo Do Begin
       If Not CmpRptCM.ParamValues[ 4 ].AsBoolean Then Begin
          Sql.Add( ' HAVING ' );
          Sql.Add( 'SUM( UN.SALDOINI )   <> 0 OR ' );
          Sql.Add( 'SUM( UN.SALDOFIM )   <> 0 OR ' );
          Sql.Add( 'SUM( UN.RECFORN )    <> 0 OR ' );
          Sql.Add( 'SUM( UN.DEVFORN )    <> 0 OR ' );
          Sql.Add( 'SUM( UN.BAITRANS )   <> 0 OR ' );
          Sql.Add( 'SUM( UN.ENTTRANS )   <> 0 OR ' );
          Sql.Add( 'SUM( UN.BAIACERTO )  <> 0 OR ' );
          Sql.Add( 'SUM( UN.BAIESTRAGO ) <> 0 OR ' );
          Sql.Add( 'SUM( UN.BAIXACC )    <> 0 ' );
       End;

       Sql.Add( ' ORDER BY UN.CODGRUPOPROD, UN.DESCPROD' );
       Prepare;

       If CmpRptCM.ParamValues[ 1 ].IsNull Then
          ParamByName( 'Grupo' ).ClearLine;

       If Not CmpRptCM.ParamValues[ 5 ].AsBoolean Then
          ParamByName( 'Estoque' ).ClearLine;

       ParamByName( 'IdEmpresa' ).AsFloat := CrmRptCM.IdEmpresa;
       ParamByName( 'Almox' ).AsInteger   := CmpRptCM.ParamValues[ 0 ].AsInteger;
       ParamByName( 'DataIni' ).AsDate    := CmpRptCM.ParamValues[ 2 ].AsDateTime;
       ParamByName( 'DataFim' ).AsDate    := CmpRptCM.ParamValues[ 3 ].AsDateTime;

       If Not CmpRptCM.ParamValues[ 1 ].IsNull Then Begin
//          lblFiltro.Caption := CmpRptCM.ParamValues[ 1 ].AsString + ' - ' + sNomeGrupo;
          ParamByName( 'Grupo' ).AsString := CmpRptCM.ParamValues[ 1 ].AsString + '%';
       End;

       If CmpRptCM.ParamValues[ 5 ].AsBoolean Then
          ParamByName( 'Estoque' ).AsString := 'S';

       Open;
  End;

  lblAlmox.Caption   := sNomeAlmox;
  lblPeriodo.Caption := 'De ' + CmpRptCM.ParamValues[ 2 ].AsString + ' a ' + CmpRptCM.ParamValues[ 3 ].AsString;
end;

end.
