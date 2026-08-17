//******************************************************************************
// Data      : 24/01/2006
// Alteração : AL_2
// Pendencia : 21263
// SOL       : 39850
// Motivo    : Melhora na performance e ajuste para evitar erro Type Mismatch
//******************************************************************************
// Data     : 02/03/2005
// Linha(s) : AL_1
// Motivo   : Inclusão da Data, período e opção para permitir todos os tipos
//             de operação.
//*****************************************************************************

unit FConsLancContabFundos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, wwdblook, wwdbdatetimepicker, FPreview,
  CMDateTimePicker, Grids, Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery;

type
  TfrmConsLancContabFundos = class(TfrmOkCancelarInv)
    pnlDados: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    dtDataRef: TCMDateTimePicker;
    dblOperacao: TwwDBLookupCombo;
    ToolbarSep972: TToolbarSep97;
    bbtnImprimir: TBitBtn;
    CbxPlano: TCheckBox;
    Label2: TLabel;
    dblFundos: TwwDBLookupCombo;
    QryFundos: TwwQuery;
    QryOperacao: TwwQuery;
    Label4: TLabel;
    dtDataFim: TCMDateTimePicker;
    dbgLanContFdo: TwwDBGrid;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtDataRefExit(Sender: TObject);
    procedure bbtnImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure CbxPlanoClick(Sender: TObject);
    procedure dtDataFimExit(Sender: TObject);
  private
    { Private declarations }
    procedure AbreQuery;
  public
    { Public declarations }
  end;

var
  frmConsLancContabFundos: TfrmConsLancContabFundos;

implementation

uses FDmLancContabFundos, UOperComum, UBibliotecaInvest;

{$R *.DFM}

procedure TfrmConsLancContabFundos.bbtnConfirmarClick(Sender: TObject);
begin
   if dtDataRef.Date > dtDataFim.Date then
      exit;

  inherited;

   AbreQuery;
end;

procedure TfrmConsLancContabFundos.AbreQuery;
begin
   With DmLancContabFundos Do
   begin
      OperComum.LimpaParametros(QryLancContabFundos);
      QryLancContabFundos.ParamByName('DATAINI').AsString       := dtDataRef.Text;
      QryLancContabFundos.ParamByName('DATAFIM').AsString       := dtDataFim.Text;
      QryLancContabFundos.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
      If CbxPlano.Checked Then
         QryLancContabFundos.ParamByName('IDPLANPREVCTBPATR').Clear
      else
         QryLancContabFundos.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;

      If Trim(dblFundos.Text) = '' Then
         QryLancContabFundos.ParamByName('IDFUNDOINVEST').Clear
      else
         QryLancContabFundos.ParamByName('IDFUNDOINVEST').AsInteger  := StrToInt(dblFundos.lookupvalue);

      If Trim(dblOperacao.Text) = '' Then
         QryLancContabFundos.ParamByName('IDTIPOOPERACAO').Clear
      else
         QryLancContabFundos.ParamByName('IDTIPOOPERACAO').AsInteger := StrToInt(dblOperacao.LookupValue);

      QryLancContabFundos.Open;

      if not QryLancContabFundos.Eof then
         bbtnImprimir.Enabled := True
      else
         bbtnImprimir.Enabled := False;

   end;
end;

procedure TfrmConsLancContabFundos.FormShow(Sender: TObject);
begin
  inherited;
   dtDataRef.Date := Date;
   dtDataFim.Date := Date;
   OperComum.LimpaParametros(QryFundos);
   QryFundos.ParamByName('DATA_INI').AsString      := DateToStr(Date);
   QryFundos.ParamByName('DATA_FIM').AsString      := DateToStr(Date);
   QryFundos.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
   QryFundos.Open;

   OperComum.LimpaParametros(QryOperacao);
   QryOperacao.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
   QryOperacao.Open;

   with DmLancContabFundos do
   begin
      OperComum.LimpaParametros(QryLancContabFundos);
      QryLancContabFundos.Open;
   end;

end;

procedure TfrmConsLancContabFundos.dtDataRefExit(Sender: TObject);
begin
   inherited;

   if ((Trim(dtDataRef.Text) <> '') and (Trim(dtDataFim.Text) <> '')) then
   begin
      OperComum.LimpaParametros(QryFundos);
      QryFundos.ParamByName('DATA_INI').AsString      := dtDataRef.Text;
      QryFundos.ParamByName('DATA_FIM').AsString      := dtDataFim.Text;
      QryFundos.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
      QryFundos.Open;
   end;
end;

procedure TfrmConsLancContabFundos.bbtnImprimirClick(Sender: TObject);
begin
  inherited;
  with DmLancContabFundos do
  begin
     QryLancContabFundos.DisableControls;
     TfrmPreview.CreateModalPreview(Application,
                                    rpLancContabFundos,
                                    rpLancContabFundos.PrinterSetup.DocumentName);

     QryLancContabFundos.EnableControls;
  end;
end;

procedure TfrmConsLancContabFundos.FormCreate(Sender: TObject);
begin
  inherited;
   WindowState := wsMaximized;
end;

procedure TfrmConsLancContabFundos.bbtnSairClick(Sender: TObject);
begin
  inherited;
  bbtnImprimir.Enabled := False;
end;

procedure TfrmConsLancContabFundos.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  with DmLancContabFundos do
  begin
     OperComum.LimpaParametros(QryLancContabFundos);
     QryLancContabFundos.Open;
  end;
  bbtnImprimir.Enabled := False;
end;

procedure TfrmConsLancContabFundos.CbxPlanoClick(Sender: TObject);
begin
  inherited;
   AbreQuery;
end;

procedure TfrmConsLancContabFundos.dtDataFimExit(Sender: TObject);
begin
   inherited;

   if ((Trim(dtDataRef.Text) <> '') and (Trim(dtDataFim.Text) <> '')) then
   begin
      OperComum.LimpaParametros(QryFundos);
      QryFundos.ParamByName('DATA_INI').AsString      := dtDataRef.Text;
      QryFundos.ParamByName('DATA_FIM').AsString      := dtDataFim.Text;
      QryFundos.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
      QryFundos.Open;
   end;
end;

end.
