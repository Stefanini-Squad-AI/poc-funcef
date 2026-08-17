unit FConsSaldoOpcInd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, Db, DBTables, Wwquery, ExtCtrls, Grids, Wwdbigrd,
  Wwdbgrid, StdCtrls, wwdblook, wwdbdatetimepicker, CMDateTimePicker,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, fcLabel, FPreview;

type
  TfrmConsSaldoOpcInd = class(TfrmOkCancelarInv)
    pnlFiltros: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    dtDataRef: TCMDateTimePicker;
    dblInvestimento: TwwDBLookupCombo;
    chkExpandido: TCheckBox;
    dblPlanPrevCtbPatr: TwwDBLookupCombo;
    Panel2: TPanel;
    Panel11: TPanel;
    Splitter1: TSplitter;
    Panel3: TPanel;
    Panel4: TPanel;
    dbgItens: TwwDBGrid;
    qryPlanPrevCtbPatr: TwwQuery;
    qryPlanPrevCtbPatrPLANPRVCONTABPATRO: TStringField;
    qryPlanPrevCtbPatrIDPLANPREVCTBPATR: TFloatField;
    qryInvestimento: TwwQuery;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    qryInvestimentoTIPO: TStringField;
    ToolbarSep972: TToolbarSep97;
    bbtnImprimir: TBitBtn;
    dbgHistorico: TwwDBGrid;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnImprimirClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dtDataRefChange(Sender: TObject);
    procedure dblInvestimentoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblPlanPrevCtbPatrChange(Sender: TObject);
  private
    { Private declarations }
    procedure FechaConsulta;
  public
    { Public declarations }
  end;

var
  frmConsSaldoOpcInd: TfrmConsSaldoOpcInd;

implementation

uses UMensErro, UBibliotecaInvest, FDmRelOpcIndSaldo, uOperComum;

{$R *.DFM}

procedure TfrmConsSaldoOpcInd.FormShow(Sender: TObject);
begin
   inherited;
   qryInvestimento.Open;
   qryPlanPrevCtbPatr.Open;
   FechaConsulta;
   inherited;
   dtDataRef.Date := pRPI.DATAULTFECH;
end;

procedure TfrmConsSaldoOpcInd.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   if Trim(dtDataRef.Text) = '' then
   begin
      MsgDlg('Falta Data Referência para o Relatório.','Mensagem do Sistema ',mtWarning,[mbOK],0);
      if dtDataRef.CanFocus then
         dtDataRef.SetFocus;
      exit;
   end;

   with DmRelOpcIndSaldo do
   begin
      OperComum.LimpaParametros(DmRelOpcIndSaldo.qryHistOpcInd);
      OperComum.LimpaParametros(DmRelOpcIndSaldo.qryItensOpcInd);

      if Trim(dblPlanPrevCtbPatr.Text) <> '' then
      begin
         DmRelOpcIndSaldo.qryHistOpcInd.ParamByName('IDPLANPREVCTBPATR').AsInteger  :=  qryPlanPrevCtbPatrIDPLANPREVCTBPATR.AsInteger;
         DmRelOpcIndSaldo.qryItensOpcInd.ParamByName('IDPLANPREVCTBPATR').AsInteger :=  qryPlanPrevCtbPatrIDPLANPREVCTBPATR.AsInteger;
      end;

      if Trim(dtDataRef.Text) <> '' then
      begin
         DmRelOpcIndSaldo.qryHistOpcInd.ParamByName('DATAHISTOPCIND').AsString  := DateToStr(dtDataRef.Date);
         DmRelOpcIndSaldo.qryItensOpcInd.ParamByName('DATAHISTOPCIND').AsString := DateToStr(dtDataRef.Date);
      end;

      if Trim(dblInvestimento.Text) <> '' then
      begin
         DmRelOpcIndSaldo.qryHistOpcInd.ParamByName('IDINVESTIMENTO').AsInteger  := StrToInt(dblInvestimento.LookupValue);
         DmRelOpcIndSaldo.qryItensOpcInd.ParamByName('IDINVESTIMENTO').AsInteger := StrToInt(dblInvestimento.LookupValue);
      end;

      DmRelOpcIndSaldo.qryHistOpcInd.DisableControls;
      DmRelOpcIndSaldo.qryHistOpcInd.Open;
      DmRelOpcIndSaldo.qryHistOpcInd.EnableControls;

      DmRelOpcIndSaldo.qryItensOpcInd.DisableControls;
      DmRelOpcIndSaldo.qryItensOpcInd.Open;
      DmRelOpcIndSaldo.qryItensOpcInd.EnableControls;

      if not DmRelOpcIndSaldo.qryHistOpcInd.IsEmpty then
      begin
         bbtnImprimir.Enabled := True;
      end
      else
      begin
         DmRelOpcIndSaldo.qryItensOpcInd.Filter := 'IDHISTOPCIND = 0';
         bbtnImprimir.Enabled := False
      end;
      dbgHistorico.Repaint;
      dbgItens.Repaint
   end
end;

procedure TfrmConsSaldoOpcInd.bbtnImprimirClick(Sender: TObject);
begin
   inherited;
   with DmRelOpcIndSaldo do
   begin
      qryHistOpcInd.DisableControls;
      qryItensOpcInd.DisableControls;

      srptOpcIndSaldo.ExpandAll := chkExpandido.Checked;
      TfrmPreview.CreateModalPreview(Application,
                                     rptOpcIndSaldo,
                                     rptOpcIndSaldo.PrinterSetup.DocumentName);

      qryHistOpcInd.EnableControls;
      qryItensOpcInd.EnableControls;
   end;
end;

procedure TfrmConsSaldoOpcInd.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   FechaConsulta;
   if dtDataRef.CanFocus then
      dtDataRef.SetFocus;
end;

procedure TfrmConsSaldoOpcInd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qryInvestimento.Close;
   qryPlanPrevCtbPatr.Close;
   DmRelOpcIndSaldo.qryHistOpcInd.Close;
   DmRelOpcIndSaldo.qryItensOpcInd.Close;
   inherited;
end;

procedure TfrmConsSaldoOpcInd.FormCreate(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
end;

procedure TfrmConsSaldoOpcInd.dtDataRefChange(Sender: TObject);
begin
   inherited;
   FechaConsulta;
end;

procedure TfrmConsSaldoOpcInd.dblInvestimentoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if (modified) then
     FechaConsulta;

end;

procedure TfrmConsSaldoOpcInd.dblPlanPrevCtbPatrChange(Sender: TObject);
begin
   inherited;
   FechaConsulta;
end;

procedure TfrmConsSaldoOpcInd.FechaConsulta;
begin
   OperComum.LimpaParametros(DmRelOpcIndSaldo.qryHistOpcInd);
   OperComum.LimpaParametros(DmRelOpcIndSaldo.qryItensOpcInd);
   bbtnImprimir.Enabled := False;
end;

end.



