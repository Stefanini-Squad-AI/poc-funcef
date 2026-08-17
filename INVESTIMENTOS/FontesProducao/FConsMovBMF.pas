unit FConsMovBMF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, TREdit, Grids, DBGrids,
  wwdbdatetimepicker, CMDateTimePicker, Wwdbigrd, Wwdbgrid, ComCtrls, Db,
  Wwdatsrc, DBTables, Wwquery, ppDB, ppDBPipe, ppDBBDE, ppBands, ppVar,
  ppCtrls, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport,ppViewr,
  FPreview, fcLabel, FOkCancelarInv;

type
  TfrmConsMovBMF = class(TfrmOkCancelarInv)
    pnlCabecario: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    dtDtaInicio: TCMDateTimePicker;
    dtDtaFim: TCMDateTimePicker;
    PgcSaldos: TPageControl;
    TbsOperacoes: TTabSheet;
    dbgOperacoes: TwwDBGrid;
    TbsAjustes: TTabSheet;
    dbgAjustes: TwwDBGrid;
    QryCorretValores: TwwQuery;
    QryCorretValoresSGLCORRETVALORES: TStringField;
    QryCorretValoresIDCORRETVALORES: TFloatField;
    QryInvestimento: TwwQuery;
    QryInvestimentoDESCINVESTIMENTO: TStringField;
    QryInvestimentoIDINVESTIMENTO: TFloatField;
    QryInvestimentoIDTIPOINVEST: TFloatField;
    QryInvestimentoIDEMISSOR: TFloatField;
    dsBuscaOperacoes: TwwDataSource;
    qryBuscaOperacoes: TwwQuery;
    qryBuscaOperacoesDATAOPERACAO: TDateTimeField;
    qryBuscaOperacoesVLROPERADO: TFloatField;
    qryBuscaOperacoesQTDEOPERADA: TFloatField;
    qryBuscaOperacoesDATAVENCOPER: TDateTimeField;
    qryBuscaOperacoesDESCTIPOOPERACAO: TStringField;
    qryBuscaOperacoesDESCINVESTIMENTO: TStringField;
    qryBuscaOperacoesSGLCORRETVALORES: TStringField;
    QryBuscaSaldoDiaAntTotal: TwwQuery;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    QryBuscaSaldoDiaAntCorret: TwwQuery;
    QryBuscaSaldoDiaAntCorretQTDCOMPRADA: TFloatField;
    QryBuscaSaldoDiaAntCorretQTDVENDIDA: TFloatField;
    qryBuscaAjustes: TwwQuery;
    dsBuscaAjustes: TwwDataSource;
    Panel3: TPanel;
    Label6: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    lblQtdOperadaCV: TLabel;
    Label13: TLabel;
    lblQtdOperadaCorCV: TLabel;
    rQtdOperada: TRealEdit;
    rQtdOperadaCor: TRealEdit;
    Panel2: TPanel;
    Label1: TLabel;
    Label15: TLabel;
    Label4: TLabel;
    QryTotalContratos: TwwQuery;
    QryTotalCorretora: TwwQuery;
    QryTotalContratosQTDCOMPRADA: TFloatField;
    QryTotalContratosQTDVENDIDA: TFloatField;
    QryTotalCorretoraQTDCOMPRADA: TFloatField;
    QryTotalCorretoraQTDVENDIDA: TFloatField;
    dblkSeries: TwwDBLookupCombo;
    lblSerie: TLabel;
    dbTotalAjustes: TDBRealEdit;
    dbTotalAjustesNeg: TDBRealEdit;
    dbTotalAjustesPos: TDBRealEdit;
    lblCorretora: TLabel;
    dblkCorretora: TwwDBLookupCombo;
    QrySglCorretora: TwwQuery;
    QrySglCorretoraSGLCORRETVALORES: TStringField;
    updBuscaAjustes: TUpdateSQL;
    qryBuscaAjustesVLRAJUSTE: TFloatField;
    qryBuscaAjustesVLRIR: TFloatField;
    qryBuscaAjustesVLRCPMFAPU: TFloatField;
    qryBuscaAjustesVLRCPMFPROV: TFloatField;
    qryBuscaAjustesDATAMOVCARTINV: TDateTimeField;
    qryBuscaAjustesIDLOTE: TStringField;
    qryBuscaAjustesTIPOOPERACAO: TStringField;
    qryBuscaAjustesCORRETORA: TStringField;
    btnImprimir: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function  ValidaDatas:boolean;
    procedure dtDtaInicioExit(Sender: TObject);
    procedure MontaDados;
    function  MontaTotalContratos: Double;
    function  MontaTotalCorretora: Double;
    procedure MontaTotalAjustes;
    procedure FormCreate(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsMovBMF: TfrmConsMovBMF;

implementation

{$R *.DFM}

uses UMensErro, FDmRelatorio;

procedure TfrmConsMovBMF.FormShow(Sender: TObject);
begin
  inherited;
  dtDtaInicio.Date := Date;
  dtDtaFim.Date    := Date;
  dtDtaInicio.Text := FormatDateTime('DD/MM/YYYY', dtDtaInicio.Date);
  dtDtaFim.Text    := FormatDateTime('DD/MM/YYYY', dtDtaFim.Date);
  QryCorretValores.Open;
  QryInvestimento.Close;
  QryInvestimento.ParamByName('pDataRef').Clear;
  QryInvestimento.Open;
  PgcSaldos.ActivePage := TbsOperacoes;
end;

procedure TfrmConsMovBMF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  QryCorretValores.Close;
  QryInvestimento.Close;
end;

procedure TfrmConsMovBMF.MontaDados;
begin
   qryBuscaOperacoes.DisableControls;
   qryBuscaAjustes.DisableControls;
   with qryBuscaOperacoes do
   begin
      Close;
      ParamByName('dDataIni').asString := dtDtaInicio.Text;
      ParamByName('dDataFim').AsString := dtDtaFim.Text;
      if Trim(dblkCorretora.Text) = '' then
         ParamByName('IDCORRETVALORES').Clear
      else
         ParamByName('IDCORRETVALORES').AsInteger := QryCorretValores.FieldByName('IDCORRETVALORES').AsInteger;
      if Trim(dblkSeries.Text) = '' then
         ParamByName('IDINVESTIMENTO').Clear
      else
         ParamByName('IDINVESTIMENTO').AsInteger := QryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;
      Open;
   end;
   with qryBuscaAjustes do
   begin
      Close;
      ParamByName('dDataIni').asString := dtDtaInicio.Text;
      ParamByName('dDataFim').AsString := dtDtaFim.Text;
      Open;
      First;
      while not qryBuscaAjustes.EOF do
      begin
         qryBuscaAjustes.Edit;
         with QrySglCorretora do
         begin
            Close;
            ParamByName('IdLote').asString := qryBuscaAjustes.FieldByName('IDLOTE').AsString;
            Open;
         end;
         qryBuscaAjustes.FieldByName('CORRETORA').AsString := QrySglCorretora.FieldByName('SGLCORRETVALORES').AsString;
         qryBuscaAjustes.Post;
         qryBuscaAjustes.Next;
      end;
      qryBuscaAjustes.First;
   end;
   MontaTotalContratos;
   MontaTotalCorretora;
   MontaTotalAjustes;
   qryBuscaOperacoes.EnableControls;
   qryBuscaAjustes.EnableControls;
end;

function TfrmConsMovBMF.ValidaDatas:boolean;
begin
  Result := True;
  if Trim(dtDtaInicio.Text) = '' then
  begin
     MsgDlg('Data de inicial inválida.', 'Erro', mtError, [mbOk], 0);
     Result := False;
     Exit;
  end;
  if Trim(dtDtaFim.Text) = '' then
  begin
     MsgDlg('Data de final inválida.', 'Erro', mtError, [mbOk], 0);
     Result := False;
     Exit;
  end;
end;

procedure TfrmConsMovBMF.dtDtaInicioExit(Sender: TObject);
begin
  inherited;
   QryInvestimento.Close;
   QryInvestimento.ParamByName('pDataRef').AsString := DateToStr(dtDtaInicio.Date);
   QryInvestimento.Open;
end;

function TfrmConsMovBMF.MontaTotalContratos: Double;
begin
   Result := 0;
   rQtdOperada.Value := Result;
   lblQtdOperadaCV.Caption := '';
   with QryTotalContratos do
   begin
      Close;
      ParamByName('dDataIni').asString        := DateToStr(dtDtaInicio.Date);
      ParamByName('dDataFim').asString        := DateToStr(dtDtaFim.Date);
      Open;
      if not IsEmpty then
      begin
         Result := ABS(ABS(QryTotalContratos.FieldByName('QTDCOMPRADA').AsFloat) -
                       ABS(QryTotalContratos.FieldByName('QTDVENDIDA').AsFloat));
         rQtdOperada.Value := Result;

         if Result <> 0 then
         begin
            // Se Posição Comprada
            if ABS(QryTotalContratos.FieldByName('QTDCOMPRADA').AsFloat) >
               ABS(QryTotalContratos.FieldByName('QTDVENDIDA').AsFloat) then
               lblQtdOperadaCV.Caption := 'C'
            else
               lblQtdOperadaCV.Caption := 'V';
         end;
      end;
   end;
end;

function TfrmConsMovBMF.MontaTotalCorretora: Double;
begin
   Result := 0;
   rQtdOperadaCor.Value := Result;
   lblQtdOperadaCorCV.Caption := 'C';
   if Trim(dblkCorretora.Text) <> '' then
   begin
      with QryTotalCorretora do
      begin
         Close;
         ParamByName('dDataIni').asString         := DateToStr(dtDtaInicio.Date);
         ParamByName('dDataFim').asString         := DateToStr(dtDtaFim.Date);
         ParamByName('IDCORRETVALORES').AsInteger := QryCorretValores.FieldByName('IDCORRETVALORES').AsInteger;
         Open;
         if not IsEmpty then
         begin
            Result := ABS(ABS(QryTotalCorretora.FieldByName('QTDCOMPRADA').AsFloat) -
                          ABS(QryTotalCorretora.FieldByName('QTDVENDIDA').AsFloat));
            rQtdOperadaCor.Value := Result;

            if Result <> 0 then
            begin
               // Se Posição Comprada
               if ABS(QryTotalCorretora.FieldByName('QTDCOMPRADA').AsFloat) >
                  ABS(QryTotalCorretora.FieldByName('QTDVENDIDA').AsFloat) then
                  lblQtdOperadaCorCV.Caption := 'C'
               else
                  lblQtdOperadaCorCV.Caption := 'V';
            end;
         end;
      end;
   end;
end;

procedure TfrmConsMovBMF.MontaTotalAjustes;
begin
   dbTotalAjustesNeg.Value := 0;
   dbTotalAjustesPos.Value := 0;
   dbTotalAjustes.Value    := 0;
   with qryBuscaAjustes do
   begin
      First;
      while not EOF do
      begin
         if FieldByName('VLRAJUSTE').AsFloat < 0 then
            dbTotalAjustesNeg.Value := dbTotalAjustesNeg.Value + FieldByName('VLRAJUSTE').AsFloat
         else
            dbTotalAjustesPos.Value := dbTotalAjustesPos.Value + FieldByName('VLRAJUSTE').AsFloat;
         Next;
      end;
      dbTotalAjustes.Value := dbTotalAjustesNeg.Value + dbTotalAjustesPos.Value;
   end;
end;

procedure TfrmConsMovBMF.FormCreate(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
end;

procedure TfrmConsMovBMF.btnImprimirClick(Sender: TObject);
begin
  inherited;
   if PgcSaldos.ActivePage = TbsOperacoes then
   begin
      DtmRelatorio.ppPeriodoConsMovBMF.Caption := 'Período de '+DateToStr(dtDtaInicio.Date)+' até '+DateToStr(dtDtaFim.Date);
      DtmRelatorio.ppTotalOperado.Caption      := FloatToStr(rQtdOperada.Value);
      DtmRelatorio.ppOperadoCV.Caption         := lblQtdOperadaCV.Caption;
      DtmRelatorio.ppTotalCorretora.Caption    := FloatToStr(rQtdOperadaCor.Value);
      DtmRelatorio.ppCorretoraCV.Caption       := lblQtdOperadaCorCV.Caption;
      if rQtdOperadaCor.Value = 0 then
      begin
         DtmRelatorio.ppTotalCorretora.Visible := False;
         DtmRelatorio.ppCorretoraCV.Visible := False;
         DtmRelatorio.pplblTotalCorretora.Visible := False;
         DtmRelatorio.ppLine66.Visible := False;
      end;
      TfrmPreview.CreateModalPreview(Application,
                                     DtmRelatorio.RpConsMovBMF,
                                     DtmRelatorio.RpConsMovBMF.PrinterSetup.DocumentName);

   end
   else if PgcSaldos.ActivePage = TbsAjustes then
   begin
      DtmRelatorio.ppPeriodoAjusteBMF.Caption := 'Período de '+DateToStr(dtDtaInicio.Date)+' até '+DateToStr(dtDtaFim.Date);
      DtmRelatorio.rTotalAjustesPos.Caption   := FormatFloat('###,###,###,###,##0.00',dbTotalAjustesPos.Value);
      DtmRelatorio.rTotalAjustesNeg.Caption   := FormatFloat('###,###,###,###,##0.00',dbTotalAjustesNeg.Value);
      DtmRelatorio.rTotalAjustes.Caption      := FormatFloat('###,###,###,###,##0.00',dbTotalAjustes.Value);
      TfrmPreview.CreateModalPreview(Application,
                                     DtmRelatorio.RpConsAjstBMF,
                                     DtmRelatorio.RpConsAjstBMF.PrinterSetup.DocumentName);

   end;
end;

procedure TfrmConsMovBMF.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   if not ValidaDatas then
      exit
   else
      MontaDados;
   if dbgOperacoes.CanFocus then
      dbgOperacoes.SetFocus
end;

end.
