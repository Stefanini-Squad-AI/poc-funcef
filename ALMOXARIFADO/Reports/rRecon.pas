unit rRecon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, ppBands, ppClass,
  ppCtrls, ppVar, ppPrnabl, ppCache, ppProd, ppReport, Wwdatsrc, ppDB, ppComm,
  ppRelatv, ppDBPipe, ppDBBDE, uCmRptManager, TXComp, CmParamReport;

type
  TRptRecon = class(TFrmCmReport)
    bdeRecon: TppBDEPipeline;
    bdeReconppField1: TppField;
    bdeReconppField2: TppField;
    bdeReconppField3: TppField;
    bdeReconppField4: TppField;
    bdeReconppField5: TppField;
    bdeReconppField6: TppField;
    bdeReconppField7: TppField;
    bdeReconppField8: TppField;
    bdeReconppField9: TppField;
    bdeReconppField10: TppField;
    bdeReconppField11: TppField;
    bdeReconppField12: TppField;
    bdeReconppField13: TppField;
    bdeReconppField14: TppField;
    bdeReconppField15: TppField;
    bdeReconppField16: TppField;
    bdeReconppField17: TppField;
    bdeReconppField18: TppField;
    bdeReconppField19: TppField;
    bdeReconppField20: TppField;
    bdeReconppField21: TppField;
    bdeReconppField22: TppField;
    bdeReconppField23: TppField;
    bdeReconppField24: TppField;
    bdeReconppField25: TppField;
    dsRecon: TwwDataSource;
    rptRecon: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLabel9: TppLabel;
    LblEmpresa: TppLabel;
    lbTituloAlmox: TppLabel;
    lbAlmox3: TppLabel;
    LbPeriodo: TppLabel;
    rptReconLine1: TppLine;
    rptReconLabel2: TppLabel;
    rptReconLabel3: TppLabel;
    rptReconLabel4: TppLabel;
    rptReconLabel5: TppLabel;
    rptReconLabel6: TppLabel;
    rptReconLabel7: TppLabel;
    rptReconLabel8: TppLabel;
    rptReconLabel9: TppLabel;
    rptReconLabel10: TppLabel;
    rptReconLabel11: TppLabel;
    rptReconLabel12: TppLabel;
    rptReconLabel13: TppLabel;
    rptReconLabel14: TppLabel;
    rptReconLabel15: TppLabel;
    rptReconLabel17: TppLabel;
    rptReconLabel20: TppLabel;
    rptReconLine5: TppLine;
    rptReconLabel23: TppLabel;
    rptReconLabel24: TppLabel;
    rptReconLabel16: TppLabel;
    rptReconLabel21: TppLabel;
    DetRecon: TppDetailBand;
    rptReconDBText2: TppDBText;
    rptReconDBText3: TppDBText;
    rptReconDBText5: TppDBText;
    rptReconDBText6: TppDBText;
    rptReconDBText7: TppDBText;
    rptReconDBText8: TppDBText;
    rptReconDBText9: TppDBText;
    rptReconDBText10: TppDBText;
    rptReconDBText11: TppDBText;
    rptReconDBText12: TppDBText;
    rptReconLabel22: TppLabel;
    rptReconDBText14: TppDBText;
    ppFooterBand4: TppFooterBand;
    ppLine5: TppLine;
    LbSistema: TppLabel;
    ppCalc6: TppSystemVariable;
    ppCalc7: TppSystemVariable;
    rptReconSummaryBand1: TppSummaryBand;
    rptReconDBCalc15: TppDBCalc;
    rptReconDBCalc16: TppDBCalc;
    rptReconDBCalc17: TppDBCalc;
    rptReconDBCalc18: TppDBCalc;
    rptReconDBCalc19: TppDBCalc;
    rptReconDBCalc20: TppDBCalc;
    rptReconDBCalc21: TppDBCalc;
    rptReconLabel19: TppLabel;
    rptReconLine4: TppLine;
    rptReconDBCalc24: TppDBCalc;
    rptReconDBCalc2: TppDBCalc;
    rptReconGroup1: TppGroup;
    GrpRecon: TppGroupHeaderBand;
    rptReconDBText1: TppDBText;
    ppLine4: TppLine;
    rptReconDBText13: TppDBText;
    LblTotSaldoIni: TppDBCalc;
    LblTotRecForn: TppDBCalc;
    LblTotDevForn: TppDBCalc;
    LblTotBaiTrans: TppDBCalc;
    LblTotEntTrans: TppDBCalc;
    LblTotBaiEstrago: TppDBCalc;
    LblTotBaiAcerto: TppDBCalc;
    LblTotBaiCC: TppDBCalc;
    LblTotSaldoAtual: TppDBCalc;
    RodapeRecon: TppGroupFooterBand;
    rptReconLine2: TppLine;
    rptReconLine3: TppLine;
    rptReconLabel18: TppLabel;
    rptReconDBCalc8: TppDBCalc;
    rptReconDBCalc9: TppDBCalc;
    rptReconDBCalc10: TppDBCalc;
    rptReconDBCalc11: TppDBCalc;
    rptReconDBCalc12: TppDBCalc;
    rptReconDBCalc13: TppDBCalc;
    rptReconDBCalc14: TppDBCalc;
    rptReconDBText4: TppDBText;
    rptReconDBCalc22: TppDBCalc;
    rptReconDBCalc1: TppDBCalc;
    SqlParRecon: TCMSqlParams;
    CdsRecon: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure SqlParReconFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    procedure GrpReconBeforePrint(Sender: TObject);
    procedure DetReconBeforePrint(Sender: TObject);
    procedure RodapeReconBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptRecon: TRptRecon;
  sAlmox: String = '';
  sNomeAlmox: String = '';
  sNomeUC: String = '';
  
implementation

{$R *.DFM}

Uses uSistema, uModulo;

procedure TRptRecon.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  With SqlParRecon Do Begin
       If Not CmpRptCM.ParamValues[ 5 ].AsBoolean Then Begin
          Sql.Add( ' HAVING ' );
          Sql.Add( 'SUM( UN.SALDOINI )    <> 0 OR ' );
          Sql.Add( 'SUM( UN.TSALDOINI )   <> 0 OR ' );
          Sql.Add( 'SUM( UN.SALDOFIM )    <> 0 OR ' );
          Sql.Add( 'SUM( UN.TSALDOFIM )   <> 0 OR ' );
          Sql.Add( 'SUM( UN.RECFORN )     <> 0 OR ' );
          Sql.Add( 'SUM( UN.DEVFORN )     <> 0 OR ' );
          Sql.Add( 'SUM( UN.BAITRANS )    <> 0 OR ' );
          Sql.Add( 'SUM( UN.ENTTRANS )    <> 0 OR ' );
          Sql.Add( 'SUM( UN.BAIACERTO )   <> 0 OR ' );
          Sql.Add( 'SUM( UN.BAIESTRAGO )  <> 0 OR ' );
          Sql.Add( 'SUM( UN.BAIXACC )     <> 0 OR ' );
          Sql.Add( 'SUM( UN.TRECFORN )    <> 0 OR ' );
          Sql.Add( 'SUM( UN.TDEVFORN )    <> 0 OR ' );
          Sql.Add( 'SUM( UN.TBAITRANS )   <> 0 OR ' );
          Sql.Add( 'SUM( UN.TENTTRANS )   <> 0 OR ' );
          Sql.Add( 'SUM( UN.TBAIACERTO )  <> 0 OR ' );
          Sql.Add( 'SUM( UN.TBAIESTRAGO ) <> 0 OR ' );
          Sql.Add( 'SUM( UN.TBAIXACC )    <> 0 ' );
       End;

       Sql.Add( ' ORDER BY UN.CODGRUPOPROD, UN.DESCPROD' );
       Prepare;

       If CmpRptCM.ParamValues[ 2 ].IsNull Then
          ParamByName( 'Grupo' ).ClearLine;

       If CmpRptCM.ParamValues[ 6 ].IsNull Then
          ParamByName( 'Estoque' ).ClearLine;

       ParamByName( 'DataIni' ).AsDate    := CmpRptCM.ParamValues[ 3 ].AsDateTime;
       ParamByName( 'DataFim' ).AsDate    := CmpRptCM.ParamValues[ 4 ].AsDateTime;
       ParamByName( 'IdEmpresa' ).AsFloat := CrmRptCM.IdEmpresa;
       ParamByName( 'Tamanho' ).AsInteger := Pos( '.', Modulo.sMascaraGrupoProd ) - 1;

       If Not CmpRptCM.ParamValues[ 1 ].IsNull Then Begin
          salmox := CmpRptCM.ParamValues[ 1 ].AsString;
          lbTituloAlmox.Caption := 'Almoxarifado';
          lbAlmox3.Caption      := sNomeAlmox;
       End Else Begin
          salmox := Modulo.ListAlmox( StrToIntDef( CmpRptCM.ParamValues[ 0 ].AsString, 0 ) );
          lbTituloAlmox.Caption := 'Unidade de Custeio';
          lbAlmox3.Caption      := sNomeUc;
       End;

       If Not CmpRptCM.ParamValues[ 2 ].IsNull Then
          ParamByName( 'Grupo' ).AsString   := CmpRptCM.ParamValues[ 2 ].AsString + '%';

       If Not CmpRptCM.ParamValues[ 6 ].IsNull Then
          ParamByName( 'Estoque' ).AsString := 'S';

       Open;
  End;

  lbPeriodo.Caption := 'De ' + CmpRptCM.ParamValues[ 3 ].AsString + ' a ' + CmpRptCM.ParamValues[ 4 ].AsString;
end;

procedure TRptRecon.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamByName( 'Almoxarifado' ).LookupSettings.SQL.Text := 'SELECT CODALMOXARIFADO, DESCALMOX FROM ALMOX WHERE IDPESSOA = ' + FloatToStr( CrmRptCM.idEmpresa ) + ' ORDER BY 2';
  CmpRptCM.ParamByName( 'Grupo de Produtos' ).LookupSettings.SQL.Text := 'SELECT CODGRUPOPROD, DESCGRUPOPROD FROM GRUPPROD WHERE IDPESSOA = ' + FloatToStr( CrmRptCM.idEmpresa ) + ' ORDER BY 2';
  CmpRptCM.ParamByName( 'DataInicial' ).TextDefault := DateToStr( Date );
  CmpRptCM.ParamByName( 'DataFinal' ).TextDefault   := DateToStr( Date );
end;

procedure TRptRecon.SqlParReconFormartParam(sParamName, sOldValue: String;
  var sNewValue: String);
begin
  inherited;
  If UpperCase( sParamName ) = 'ALMOX' Then
     sNewValue := sAlmox;
end;

procedure TRptRecon.CmpRptCMParamControlExit(Sender: TPainelControles;
  Index: Integer);
begin
  inherited;
  Case Index of
       0: sNomeUC    := Sender.CtrlLookup.Text;
       1: sNomeAlmox := Sender.CtrlLookup.Text;
  End;
end;

procedure TRptRecon.GrpReconBeforePrint(Sender: TObject);
begin
  inherited;
  If CdsRecon.FieldByName( 'StatusGrupo' ).asString = 'S' Then Begin
     LblTotSaldoIni.Visible   := True;
     LblTotRecForn.Visible    := True;
     LblTotDevForn.Visible    := True;
     LblTotBaiTrans.Visible   := True;
     LblTotEntTrans.Visible   := True;
     LblTotBaiEstrago.Visible := True;
     LblTotBaiAcerto.Visible  := True;
     LblTotBaiCC.Visible      := True;
     LblTotSaldoAtual.Visible := True;
  End Else Begin
     LblTotSaldoIni.Visible   := False;
     LblTotRecForn.Visible    := False;
     LblTotDevForn.Visible    := False;
     LblTotBaiTrans.Visible   := False;
     LblTotEntTrans.Visible   := False;
     LblTotBaiEstrago.Visible := False;
     LblTotBaiAcerto.Visible  := False;
     LblTotBaiCC.Visible      := False;
     LblTotSaldoAtual.Visible := False;
  End;
end;

procedure TRptRecon.DetReconBeforePrint(Sender: TObject);
begin
  inherited;
  If CdsRecon.FieldByName( 'StatusGrupo' ).asString = 'S' Then
     DetRecon.Visible := Not CdsRecon.FieldByName( 'CodArtigo' ).IsNull
  Else
     DetRecon.Visible := True;
end;

procedure TRptRecon.RodapeReconBeforePrint(Sender: TObject);
begin
  inherited;
  If CdsRecon.FieldByName( 'StatusGrupo' ).asString = 'S' Then
     RodapeRecon.Visible := Not CdsRecon.FieldByName( 'CodArtigo' ).IsNull
  Else
     RodapeRecon.Visible := True;
end;

end.
