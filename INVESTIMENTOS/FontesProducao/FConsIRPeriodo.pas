//****************************************************************************** 
// Data     : 17/11/2005
// Motivo   : Implementação do data source na grid
//******************************************************************************

unit FConsIRPeriodo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, Db, DBTables, Wwquery,
  Wwdatsrc,FPreview, MontaSelect;

type
  TfrmConsIRPeriodo = class(TfrmOkCancelarInv)
    Panel1: TPanel;
    pnlFiltros: TPanel;
    Label7: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    dblkTipoInvest: TwwDBLookupCombo;
    dtDtaInicio: TCMDateTimePicker;
    dtDtaFim: TCMDateTimePicker;
    Panel2: TPanel;
    dbgIRPeriodo: TwwDBGrid;
    qryTipoInvest: TwwQuery;
    qryTipoInvestDESCTIPOINVEST: TStringField;
    qryTipoInvestIDTIPOINVEST: TFloatField;
    bbtnImprimir: TBitBtn;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    grpValorAtuarial: TGroupBox;
    lblTotalRendto: TfcLabel;
    grpValorCorrigido: TGroupBox;
    lblTotalIR: TfcLabel;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnImprimirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsIRPeriodo: TfrmConsIRPeriodo;

implementation

uses UOperComum, UBibliotecaInvest, UDiasUteisInv, UMensErro,
     FDmRelIRPeriodo;

{$R *.DFM}

procedure TfrmConsIRPeriodo.FormShow(Sender: TObject);
var
   ano, mes, dia : word;
begin
  inherited;
  OperComum.LimpaParametros(qryTipoInvest);
  qryTipoInvest.Open;

  If pRPI.DATAULTRET  = 0 Then
     pRPI.DATAULTRET := Date;

  dtDtaInicio.Date := pRPI.DATAULTRET;

  DecodeDate(pRPI.DATAULTRET, ano, mes, dia);
  if mes <= 3 then
     mes := 3
  else if (mes > 3) and (mes <= 6) then
     mes := 6
  else if (mes > 6) and (mes <= 9) then
     mes := 9
  else if (mes > 9) and (mes <= 12) then
     mes := 12;

  dtDtaFim.Date := DiasUteisInv.UltDiaMes(ano, mes);

  if dtDtaInicio.CanFocus then
     dtDtaInicio.SetFocus;

  bbtnConfirmarClick(Sender);     
end;

procedure TfrmConsIRPeriodo.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  lblTotalRendto.Caption := 'R$ 0,00';
  lblTotalIR.Caption     := 'R$ 0,00';

  OperComum.LimpaParametros(DmRelIRPeriodo.qryIRPeriodo);
  if Trim(dblkTipoInvest.Text) <> '' then
  begin
     if qryTipoInvest.FieldByName('IDTIPOINVEST').AsInteger = 5 then // Fundo RFx
        DmRelIRPeriodo.qryIRPeriodo.ParamByName('IDORIGEMIRLITIGIO').AsInteger := 4
     else if qryTipoInvest.FieldByName('IDTIPOINVEST').AsInteger = 6 then // Fundo Acoes
        DmRelIRPeriodo.qryIRPeriodo.ParamByName('IDORIGEMIRLITIGIO').AsInteger := 5
     else if qryTipoInvest.FieldByName('IDTIPOINVEST').AsInteger = 8 then // bm&f
        DmRelIRPeriodo.qryIRPeriodo.ParamByName('IDORIGEMIRLITIGIO').AsInteger := 3
     else
        DmRelIRPeriodo.qryIRPeriodo.ParamByName('IDORIGEMIRLITIGIO').AsInteger :=
           StrToInt(dblkTipoInvest.LookupValue);
  end;

  DmRelIRPeriodo.qryIRPeriodo.ParamByName('DDATAINI').AsString := dtDtaInicio.Text;
  DmRelIRPeriodo.qryIRPeriodo.ParamByName('DDATAFIM').AsString := dtDtaFim.Text;
  DmRelIRPeriodo.qryIRPeriodo.Open;

  lblTotalRendto.Caption := 'R$ ' + FormatFloat('###,###,###,##0.00', DmRelIRPeriodo.qryIRPeriodoTOTALRENDIMENTO.AsFloat);
  lblTotalIR.Caption     := 'R$ ' + FormatFloat('###,###,###,##0.00', DmRelIRPeriodo.qryIRPeriodoTOTALIRLITIGIO.AsFloat);
end;

procedure TfrmConsIRPeriodo.bbtnImprimirClick(Sender: TObject);
begin
  inherited;
   DmRelIRPeriodo.qryIRPeriodo.DisableControls;
   DmRelIRPeriodo.lblPeriodo.Caption     := 'Período ' + dtDtaInicio.Text+' a '+dtDtaFim.Text;
   DmRelIRPeriodo.lblTotalRendto.Caption := 'Total do Rendimento : R$ ' + lblTotalRendto.Caption;
   DmRelIRPeriodo.lblTotalIR.Caption     := 'Total do I.R.R.F.   : R$ ' + lblTotalIR.Caption;
   TfrmPreview.CreateModalPreview(Application,
                                  DmRelIRPeriodo.ppRIRPeriodo,
                                  DmRelIRPeriodo.ppRIRPeriodo.PrinterSetup.DocumentName);
   DmRelIRPeriodo.qryIRPeriodo.EnableControls;
end;

procedure TfrmConsIRPeriodo.FormActivate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := True;
  WindowState      := wsMaximized;
end;

end.
