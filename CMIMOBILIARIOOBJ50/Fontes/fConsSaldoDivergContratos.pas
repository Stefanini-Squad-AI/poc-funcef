{ --------------------------------------------------------------------------------------------------
Nº SOL......: 107772/5704
Nº KINTANA..: 1360314
Data........: 25/05/2012
Responsável.: André Oliveira
Descrição...: Trazer apenas alteradores de desconto concedido, passar para 4 casas decimais
os campos de divergencias
---------------------------------------------------------------------------------------------------}

unit fConsSaldoDivergContratos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjudaImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Spin, mContratoNumero, mImovel,
  mImovelMestre, uCmSqlParams, Db, Wwdatsrc, DBClient, uCMClientDataSet,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, QExport3Dialog, uCtrlConsSaldoDiverg,
  uCtrlPadroes, Mask, wwdbedit, Wwdotdot, Wwdbcomb, DBCtrls,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmConsSaldoDivergContratos = class(TfrmSairAjudaImob)
    bbtnExportar: TBitBtn;
    Panel1: TPanel;
    molImovelMestre: TmolImovelMestre;
    molImovel: TmolImovel;
    molContratoNumero: TmolContratoNumero;
    pnlCompetencia: TPanel;
    lblDataIni: TLabel;
    lblDataFim: TLabel;
    chkDiverg: TCheckBox;
    pnlSegmento: TPanel;
    Label3: TLabel;
    dbLkpSegmento: TwwDBLookupCombo;
    btnBusca: TBitBtn;
    Panel2: TPanel;
    pgPrincipal: TPageControl;
    tbContratos: TTabSheet;
    tbSaldos: TTabSheet;
    tbDocumentos: TTabSheet;
    tbAlteradores: TTabSheet;
    tbDivergencias: TTabSheet;
    dbGrdContratos: TwwDBGrid;
    dbGrdSaldos: TwwDBGrid;
    dbGrdDocumentos: TwwDBGrid;
    dbGrdAlteradores: TwwDBGrid;
    dbGrdDivergencia: TwwDBGrid;
    cdsContratosImovel: TCMClientDataSet;
    dsContratoImovel: TwwDataSource;
    cdsSaldos: TCMClientDataSet;
    dsSaldos: TwwDataSource;
    dsDocumento: TwwDataSource;
    cdsDocumento: TCMClientDataSet;
    cdsAlterador: TCMClientDataSet;
    dsAlterador: TwwDataSource;
    cdsDivergencia: TCMClientDataSet;
    dsDivergencia: TwwDataSource;
    cdsTipoImovel: TCMClientDataSet;
    CMSqlParams: TCMSqlParams;
    QExport3Dialog: TQExport3Dialog;
    edtDataIni: TCMDateTimePicker;
    edtDataFim: TCMDateTimePicker;
    procedure bbtnExportarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure chkDivergClick(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
    procedure molImovelMestrebtnBuscaImovelClick(Sender: TObject);
    procedure molImovelbtnBuscaImovelClick(Sender: TObject);
    procedure molContratoNumerobtnBuscaContratoClick(Sender: TObject);
    procedure dbLkpSegmentoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure pgPrincipalChange(Sender: TObject);
    procedure cdsAlteradorAfterOpen(DataSet: TDataSet);
    procedure cdsDivergenciaAfterOpen(DataSet: TDataSet);
    procedure cdsContratosImovelAfterScroll(DataSet: TDataSet);
    procedure dbGrdDivergenciaCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
    procedure cdsSaldosAfterOpen(DataSet: TDataSet);
    procedure cdsDocumentoAfterOpen(DataSet: TDataSet);
    procedure dbGrdSaldosCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbGrdDocumentosCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbGrdAlteradoresCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
    procedure dbGrdSaldosDrawTitleCell(Sender: TObject; Canvas: TCanvas;
      Field: TField; Rect: TRect; var DefaultDrawing: Boolean);
    procedure dbGrdDivergenciaDrawTitleCell(Sender: TObject;
      Canvas: TCanvas; Field: TField; Rect: TRect;
      var DefaultDrawing: Boolean);
    procedure dbGrdContratosCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure molContratoNumerobtnLimpaContratoClick(Sender: TObject);
    procedure molImovelbtnLimpaImovelClick(Sender: TObject);
    procedure molImovelMestrebtnLimpaImovelClick(Sender: TObject);
  private
    { Private declarations }
    CtrlConsSaldoDiverg: TCtrlConsSaldoDiverg;

    function VerificaCamposObirgatorio : boolean;
    procedure FechaDataSets;
  public
    { Public declarations }
  end;

var
  frmConsSaldoDivergContratos: TfrmConsSaldoDivergContratos;

implementation
uses uSistema, uMensErro, uModuloImobiliario, dLookImobiliario,
     uFuncoesImob, uData, uVerificaPreenchimento;

{$R *.DFM}

procedure TfrmConsSaldoDivergContratos.bbtnExportarClick(Sender: TObject);
var
  i : integer;
begin
  inherited;
  case pgPrincipal.ActivePageIndex of
    0: QExport3Dialog.DataSet := cdsContratosImovel;
    1: QExport3Dialog.DataSet := cdsSaldos;
    2: QExport3Dialog.DataSet := cdsDocumento;
    3: QExport3Dialog.DataSet := cdsAlterador;
    4: QExport3Dialog.DataSet := cdsDivergencia;
  end;

  QExport3Dialog.ExportedFields.Clear;
  for i := 0 to QExport3Dialog.DataSet.Fields.Count-1 do
    QExport3Dialog.ExportedFields.Add(QExport3Dialog.DataSet.Fields[i].FieldName);

  QExport3Dialog.Execute;      
end;

procedure TfrmConsSaldoDivergContratos.FormCreate(Sender: TObject);
begin
  inherited;
  QExport3Dialog.FileName := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\';

  pgPrincipal.ActivePageIndex := 0;

  CtrlConsSaldoDiverg := TCtrlConsSaldoDiverg.Create;
  CtrlConsSaldoDiverg.InitializeAs(Padroes);

  CtrlConsSaldoDiverg.RegDiverg := ChkDiverg.Checked;

  molImovelMestre.btnLimpaImovel.Click;
  molImovel.btnLimpaImovel.Click;
  molContratoNumero.btnLimpaContrato.Click;
end;

procedure TfrmConsSaldoDivergContratos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlConsSaldoDiverg);
end;

procedure TfrmConsSaldoDivergContratos.FormShow(Sender: TObject);
begin
  inherited;
  LimpaParametros(dtmLookImobiliario.qryLookTipoImovel);
  dtmLookImobiliario.qryLookTipoImovel.Open;
end;

function TfrmConsSaldoDivergContratos.VerificaCamposObirgatorio: boolean;
begin
  Result := True;
  try
    if edtDataIni.Date = 0 then
      raise EValidacao.CreateVal('Data inicial não foi informada.', edtDataIni);
    if edtDataFim.Date = 0 then
      raise EValidacao.CreateVal('Data final não foi informada.', edtDataFim);
  except
    on ev : EValidacao do
    begin
      if ev.Show then
        MessageDlg(ev.message, mtWarning, [mbOk], 0);
      Repaint;
      if ev.Control.CanFocus then
        ev.Control.SetFocus;
      Result := False;
    end;
  end;
end;

procedure TfrmConsSaldoDivergContratos.FechaDataSets;
begin
  if cdsSaldos.Active then cdsSaldos.Close;
  if cdsDocumento.Active then cdsDocumento.Close;
  if cdsAlterador.Active then cdsAlterador.Close;
  if cdsDivergencia.Active then cdsDivergencia.Close;

  CtrlConsSaldoDiverg.MovIdImovel := -1;
  CtrlConsSaldoDiverg.MovIdBem := -1;
  CtrlConsSaldoDiverg.MovDtIni := -1;
  CtrlConsSaldoDiverg.MovDtFim := -1;
  CtrlConsSaldoDiverg.IdContratoImovel := -1;
end;

procedure TfrmConsSaldoDivergContratos.chkDivergClick(Sender: TObject);
begin
  inherited;
  CtrlConsSaldoDiverg.RegDiverg := chkDiverg.Checked;
  //btnBusca.Enabled := True;
  //FechaDataSets;
  //pgPrincipalChange(pgPrincipal);
end;

procedure TfrmConsSaldoDivergContratos.btnBuscaClick(Sender: TObject);
begin
  inherited;
  //btnBusca.Enabled := False;
  FechaDataSets;

  if not VerificaCamposObirgatorio then
    Exit;

  if CtrlConsSaldoDiverg.InTransaction then CtrlConsSaldoDiverg.Commit;

  CtrlConsSaldoDiverg.StartTransaction;

  cdsContratosImovel.Data := CtrlConsSaldoDiverg.ListaContratos(molImovel.iImovel,
                                                                molImovelMestre.iMestre,
                                                                edtDataIni.Date,
                                                                edtDataFim.Date,
                                                                molContratoNumero.iContrato,
                                                                dbLkpSegmento.LookupValue);

  pgPrincipal.ActivePageIndex := 0;
  dbGrdContratos.SetFocus;
end;

procedure TfrmConsSaldoDivergContratos.molImovelMestrebtnBuscaImovelClick(
  Sender: TObject);
begin
  inherited;
  molImovelMestre.btnBuscaImovelClick(Sender);

  if molImovel.iImovel <> -1 then
    molImovel.btnLimpaImovel.Click;

  if molContratoNumero.iContrato <> -1 then
    molContratoNumero.btnLimpaContrato.Click;

  if Length(Trim(dbLkpSegmento.Text)) <> 0 then
    dbLkpSegmento.Clear;

  //btnBusca.Enabled := molImovelMestre.iMestre <> -1;

end;

procedure TfrmConsSaldoDivergContratos.molImovelbtnBuscaImovelClick(
  Sender: TObject);
begin
  inherited;
  molImovel.btnBuscaImovelClick(Sender);

  if molImovelMestre.iMestre <> -1 then
    molImovelMestre.btnLimpaImovel.Click;

  if molContratoNumero.iContrato <> -1 then
    molContratoNumero.btnLimpaContrato.Click;

  //btnBusca.Enabled := molImovel.iImovel <> -1;

end;

procedure TfrmConsSaldoDivergContratos.molContratoNumerobtnBuscaContratoClick(
  Sender: TObject);
begin
  inherited;
  molContratoNumero.btnBuscaContratoClick(Sender);

  if molImovelMestre.iMestre <> -1 then
    molImovelMestre.btnLimpaImovel.Click;

  if molImovel.iImovel <> -1 then
    molImovel.btnLimpaImovel.Click;

  //btnBusca.Enabled := molContratoNumero.iContrato <> -1;
end;

procedure TfrmConsSaldoDivergContratos.dbLkpSegmentoCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if molImovelMestre.iMestre <> -1 then
    molImovelMestre.btnLimpaImovel.Click;

  if molImovel.iImovel <> -1 then
    molImovel.btnLimpaImovel.Click;

  if molContratoNumero.iContrato <> -1 then
    molContratoNumero.btnLimpaContrato.Click;

  //btnBusca.Enabled := length(Trim(dbLkpSegmento.Text)) > 0;
end;

procedure TfrmConsSaldoDivergContratos.pgPrincipalChange(Sender: TObject);
begin
  inherited;

  if not cdsContratosImovel.IsEmpty then
  begin  
    if (pgPrincipal.ActivePage = tbSaldos) and not(cdsSaldos.Active) then
    begin
      cdsSaldos.Data := CtrlConsSaldoDiverg.ListaSaldos(-1,
                                                        -1,
                                                        edtDataIni.Date,
                                                        edtDataFim.Date,
                                                        cdsContratosImovel.FieldByName('IDCONTRATOIMOVEL').asInteger);
    end;

    if (pgPrincipal.ActivePage = tbDocumentos) and not(cdsDocumento.Active) then
    begin
      cdsDocumento.Data := CtrlConsSaldoDiverg.ListaDocumento(-1,
                                                              -1,
                                                              edtDataIni.Date,
                                                              edtDataFim.Date,
                                                              cdsContratosImovel.FieldByName('IDCONTRATOIMOVEL').asInteger);
    end;

    if (pgPrincipal.ActivePage = tbAlteradores) then
    begin
      if cdsDocumento.Active then
        cdsAlterador.Data := CtrlConsSaldoDiverg.ListaAlteradoresDoc(cdsDocumento.FieldByName('CODDOCUMENTO').AsInteger,
                                                                     cdsContratosImovel.FieldByName('IDCONTRATOIMOVEL').asInteger)
      else
        cdsAlterador.Data := CtrlConsSaldoDiverg.ListaAlteradoresDoc(-1);
    end;

    if (pgPrincipal.ActivePage = tbDivergencias) and not(cdsDivergencia.Active) then
    begin
      cdsDivergencia.Data := CtrlConsSaldoDiverg.ListaDivergencia(-1,
                                                                  -1,
                                                                  edtDataIni.Date,
                                                                  edtDataFim.Date,
                                                                  cdsContratosImovel.FieldByName('IDCONTRATOIMOVEL').asInteger);
    end;
  end;
end;

procedure TfrmConsSaldoDivergContratos.cdsAlteradorAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  TNumericField(DataSet.FieldByName('VALOR')).DisplayFormat := ',0.00';
end;

procedure TfrmConsSaldoDivergContratos.cdsDivergenciaAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  //INICIO - André Oliveira  SOL107772/5704 KIN 1360314
  TNumericField(DataSet.FieldByName('VLR_LANC_OPER')).DisplayFormat := ',0.0000';
  TNumericField(DataSet.FieldByName('VLR_LANC_CONT')).DisplayFormat := ',0.0000';
  TNumericField(DataSet.FieldByName('VLR_ALT_OPER')).DisplayFormat := ',0.0000';
  TNumericField(DataSet.FieldByName('VLR_ALT_CONT')).DisplayFormat := ',0.0000';
  TNumericField(DataSet.FieldByName('VLR_BAIXA_OPER')).DisplayFormat := ',0.0000';
  TNumericField(DataSet.FieldByName('VLR_BAIXA_CONT')).DisplayFormat := ',0.0000';
  // FIM - André Oliveira  SOL107772/5704 KIN 1360314
end;

procedure TfrmConsSaldoDivergContratos.cdsContratosImovelAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  FechaDataSets;
end;

procedure TfrmConsSaldoDivergContratos.dbGrdDivergenciaCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
  if (((UpperCase(Field.FieldName) = 'VLR_LANC_OPER') or (UpperCase(Field.FieldName) = 'VLR_LANC_CONT')) and
      (CdsDivergencia.FieldByName('VLR_LANC_OPER').AsFloat <> CdsDivergencia.FieldByName('VLR_LANC_CONT').AsFloat)) or

     (((UpperCase(Field.FieldName) = 'VLR_ALT_OPER') or (UpperCase(Field.FieldName) = 'VLR_ALT_CONT')) and
      (CdsDivergencia.FieldByName('VLR_ALT_OPER').AsFloat <> CdsDivergencia.FieldByName('VLR_ALT_CONT').AsFloat)) or

     (((UpperCase(Field.FieldName) = 'VLR_BAIXA_OPER') or (UpperCase(Field.FieldName) = 'VLR_BAIXA_CONT')) and
      (CdsDivergencia.FieldByName('VLR_BAIXA_OPER').AsFloat <> CdsDivergencia.FieldByName('VLR_BAIXA_CONT').AsFloat)) then
  begin
    AFont.Color := clRed;
  end;
end;

procedure TfrmConsSaldoDivergContratos.cdsSaldosAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  TNumericField(DataSet.FieldByName('SaldoAntOpe')).DisplayFormat := ',0.00';
  TNumericField(DataSet.FieldByName('SaldoAntCont')).DisplayFormat := ',0.00';
  TNumericField(DataSet.FieldByName('SaldoOpe')).DisplayFormat := ',0.00';
  TNumericField(DataSet.FieldByName('SaldoCont')).DisplayFormat := ',0.00';
end;

procedure TfrmConsSaldoDivergContratos.cdsDocumentoAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  TNumericField(DataSet.FieldByName('VALORLANC')).DisplayFormat := ',0.00';
  TNumericField(DataSet.FieldByName('VALORBAIXA')).DisplayFormat := ',0.00';
end;

procedure TfrmConsSaldoDivergContratos.dbGrdSaldosCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
  if ((Field = cdsSaldos.FieldByName('SaldoOpe')) or
     (Field = cdsSaldos.FieldByName('SaldoCont'))   or
     (Field = cdsSaldos.FieldByName('SaldoAntOpe'))   or
     (Field = cdsSaldos.FieldByName('SaldoAntCont'))) and
     ((cdsSaldos.FieldByName('SaldoOpe').Value <>  cdsSaldos.FieldByName('SaldoCont').Value) or
     (cdsSaldos.FieldByName('SaldoAntOpe').Value <> cdsSaldos.FieldByName('SaldoAntCont').Value)) then
    AFont.Color := clRed;
end;

procedure TfrmConsSaldoDivergContratos.dbGrdDocumentosCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
//  if ((cdsDocumento.FieldByName('VLR_RECEBER').Value <> cdsDocumento.FieldByName('VLR_RECEBIDO').Value) or
//     (cdsDocumento.FieldByName('VLR_PAGAR').Value <> cdsDocumento.FieldByName('VLR_PAGO').Value)) then
//    AFont.Color := clRed;
end;

procedure TfrmConsSaldoDivergContratos.dbGrdAlteradoresCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
//  if (cdsAlterador.FieldByName('VALOR_PAGA').Value <> cdsAlterador.FieldByName('VALOR_RECEBE').Value) then
//    AFont.Color := clRed;
end;

procedure TfrmConsSaldoDivergContratos.dbGrdSaldosDrawTitleCell(
  Sender: TObject; Canvas: TCanvas; Field: TField; Rect: TRect;
  var DefaultDrawing: Boolean);
var
  iCol: Integer;
  sLin1, sLin2: String;
begin
  inherited;

  iCol := 0;

  if (UpperCase(Field.FieldName) = UpperCase('SaldoAntOpe'))  then iCol := 1;
  if (UpperCase(Field.FieldName) = UpperCase('SaldoAntCont')) then iCol := 2;
  if (UpperCase(Field.FieldName) = UpperCase('SaldoOpe'))     then iCol := 3;
  if (UpperCase(Field.FieldName) = UpperCase('SaldoCont'))    then iCol := 4;

  if (iCol > 0) then begin

    case iCol of
      1,3: sLin1 := 'Operacional';
      2,4: sLin1 := 'Contábil';
    end;

    sLin2 := Trim(StringReplace(TwwDBGrid(Sender).ColumnByName(Field.FieldName).DisplayLabel, sLin1, '', [rfReplaceAll, rfIgnoreCase]));

    Canvas.FillRect(Rect);

    Canvas.TextOut(Rect.Left + (((Rect.Right - Rect.Left) - Canvas.TextWidth(sLin2)) div 2),
                   Rect.Top + (((Rect.Bottom div 2) - Rect.Top - Canvas.TextHeight(sLin2)) div 2),
                   sLin2);

    Canvas.TextOut(Rect.Left + (((Rect.Right - Rect.Left) - Canvas.TextWidth(sLin1)) div 2),
                   (Rect.Bottom div 2) + ((Rect.Bottom - (Rect.Bottom div 2) - Canvas.TextHeight(sLin1)) div 2),
                   sLin1);

    DefaultDrawing := False;
  end;

end;

procedure TfrmConsSaldoDivergContratos.dbGrdDivergenciaDrawTitleCell(
  Sender: TObject; Canvas: TCanvas; Field: TField; Rect: TRect;
  var DefaultDrawing: Boolean);
var
  iCol: Integer;
  sLin1, sLin2: String;
begin
  inherited;

  iCol := 0;

  if (UpperCase(Field.FieldName) = 'DATALANC')       then iCol := 1;
  if (UpperCase(Field.FieldName) = 'DATABAIXA')      then iCol := 2;
  if (UpperCase(Field.FieldName) = 'CODDOCUMENTO')   then iCol := 3;
  if (UpperCase(Field.FieldName) = 'RECPAG')         then iCol := 4;
  if (UpperCase(Field.FieldName) = 'VLR_LANC_OPER')  then iCol := 5;
  if (UpperCase(Field.FieldName) = 'VLR_LANC_CONT')  then iCol := 6;
  if (UpperCase(Field.FieldName) = 'VLR_ALT_OPER')   then iCol := 7;
  if (UpperCase(Field.FieldName) = 'VLR_ALT_CONT')   then iCol := 8;
  if (UpperCase(Field.FieldName) = 'VLR_BAIXA_OPER') then iCol := 9;
  if (UpperCase(Field.FieldName) = 'VLR_BAIXA_CONT') then iCol := 10;

  if (iCol > 0) then begin
    case iCol of
      5,7,9 : sLin1 := 'Operacional';
      6,8,10: sLin1 := 'Contábil';
    end;

    sLin2 := Trim(StringReplace(TwwDBGrid(Sender).ColumnByName(Field.FieldName).DisplayLabel, sLin1, '', [rfReplaceAll, rfIgnoreCase]));

    Canvas.FillRect(Rect);

    Canvas.TextOut(Rect.Left + (((Rect.Right - Rect.Left) - Canvas.TextWidth(sLin2)) div 2),
                   Rect.Top + (((Rect.Bottom div 2) - Rect.Top - Canvas.TextHeight(sLin2)) div 2),
                   sLin2);

    Canvas.TextOut(Rect.Left + (((Rect.Right - Rect.Left) - Canvas.TextWidth(sLin1)) div 2),
                   (Rect.Bottom div 2) + ((Rect.Bottom - (Rect.Bottom div 2) - Canvas.TextHeight(sLin1)) div 2),
                   sLin1);

    DefaultDrawing := False;
  end;

end;

procedure TfrmConsSaldoDivergContratos.dbGrdContratosCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
  if cdsContratosImovel.FieldByName('DIVERGENCIA').AsString = 'S' then
    AFont.Color := clRed;
end;

procedure TfrmConsSaldoDivergContratos.molImovelMestrebtnLimpaImovelClick(
  Sender: TObject);
begin
  inherited;
  molImovelMestre.btnLimpaImovelClick(Sender);

  //btnBusca.Enabled := True;
end;

procedure TfrmConsSaldoDivergContratos.molImovelbtnLimpaImovelClick(
  Sender: TObject);
begin
  inherited;
  molImovel.btnLimpaImovelClick(Sender);

  //btnBusca.Enabled := True;
end;

procedure TfrmConsSaldoDivergContratos.molContratoNumerobtnLimpaContratoClick(
  Sender: TObject);
begin
  inherited;
  molContratoNumero.btnLimpaContratoClick(Sender);

  //btnBusca.Enabled := True;
end;

end.
