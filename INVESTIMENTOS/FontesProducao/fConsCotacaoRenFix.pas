unit fConsCotacaoRenFix;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, wwdblook, Db, DBTables, Wwquery,
  wwdbdatetimepicker, CMDateTimePicker, Grids, Wwdbigrd, Wwdbgrid, FPreview;

type
  TfrmConsCotacaoRenFix = class(TfrmOkCancelarInv)
    Panel1: TPanel;
    Bevel1: TBevel;
    qryInvestimento: TwwQuery;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    qryInvestimentoVENCOPERACAO: TDateTimeField;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    qryInvestimentoCHAVE: TStringField;
    dblInvestimento: TwwDBLookupCombo;
    Label11: TLabel;
    dbdDataVencimento: TCMDateTimePicker;
    Label5: TLabel;
    dbgCotacoesRenFix: TwwDBGrid;
    bbtnImprimir: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    GpbPeriodo: TGroupBox;
    dtDataInicio: TCMDateTimePicker;
    Label2: TLabel;
    dtDataFim: TCMDateTimePicker;
    procedure dblInvestimentoChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dblInvestimentoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    sPeriodo: String;
  public
    { Public declarations }
  end;

var
  frmConsCotacaoRenFix: TfrmConsCotacaoRenFix;

implementation

uses FdmRelRenFixCotacoes, UOperComum, UBibliotecaInvest;

{$R *.DFM}

procedure TfrmConsCotacaoRenFix.dblInvestimentoChange(Sender: TObject);
begin
   inherited;
   dbdDataVencimento.Date := qryInvestimentoVENCOPERACAO.AsDateTime;
   dbdDataVencimento.Text := qryInvestimentoVENCOPERACAO.AsString;
end;

procedure TfrmConsCotacaoRenFix.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   sPeriodo := 'Período: ';
   with dmRelRenFixCotacoes, dmRelRenFixCotacoes.qryCotacoes do
   begin
      OperComum.LimpaParametros(qryCotacoes);
      if Trim(dblInvestimento.Text) <> '' then
      begin
         ParamByName('IDINVESTIMENTO').AsInteger := qryInvestimentoIDINVESTIMENTO.AsInteger;
         ParamByName('DATAVENCTO').AsString := qryInvestimentoVENCOPERACAO.AsString;
      end;
      if Trim(dtDataInicio.Text) <> '' then
         ParamByName('DATAINICIO').AsString := dtDataInicio.Text;
      if Trim(dtDataFim.Text) <> '' then
         ParamByName('DATAFIM').AsString := dtDataFim.Text;
      Open;

      if not IsEmpty then
         bbtnImprimir.Enabled := True
      else
         bbtnImprimir.Enabled := False;


      if (Trim(dtDataInicio.Text) = '') and (Trim(dtDataFim.Text) = '') then
         sPeriodo := sPeriodo + 'Todas as Cotações'
      else if (dtDataInicio.Text = dtDataFim.Text) then
         sPeriodo := sPeriodo + dtDataFim.Text
      else if Trim(dtDataInicio.Text) = '' then
         sPeriodo := sPeriodo + ' Até o dia ' + dtDataFim.Text
      else if Trim(dtDataFim.Text) = '' then
         sPeriodo := sPeriodo + ' A partir de ' + dtDataInicio.Text
      else
         sPeriodo := sPeriodo + ' De ' + dtDataInicio.Text + ' até ' + dtDataFim.Text;

   end;
end;

procedure TfrmConsCotacaoRenFix.bbtnImprimirClick(Sender: TObject);
begin
   inherited;
   with dmRelRenFixCotacoes, dmRelRenFixCotacoes.qryCotacoes do
   begin
      DisableControls;
      lblPeriodo.Caption := sPeriodo;
      TfrmPreview.CreateModalPreview(Application,
                                     rptCotacoesRenFix,
                                     rptCotacoesRenFix.PrinterSetup.DocumentName);

      EnableControls;
   end;
end;

procedure TfrmConsCotacaoRenFix.FormShow(Sender: TObject);
begin
  inherited;
  dmRelRenFixCotacoes.qryCotacoes.Close;
  OperComum.LimpaParametros(qryInvestimento);
  qryInvestimento.ParamByName('DATAULTFECHRF').AsString := DateToStr(pRPI.DATAULTFECHRF);
  qryInvestimento.Open;
end;

procedure TfrmConsCotacaoRenFix.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryInvestimento.Close;
  inherited;
end;

procedure TfrmConsCotacaoRenFix.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  dmRelRenFixCotacoes.qryCotacoes.Close;
  bbtnImprimir.Enabled := False;
  if dtDataInicio.CanFocus then
     dtDataInicio.SetFocus;
end;

procedure TfrmConsCotacaoRenFix.dblInvestimentoExit(Sender: TObject);
begin
  inherited;
  if Trim(dblInvestimento.Text) = '' then
     dbdDataVencimento.ClearDateTime;
end;

procedure TfrmConsCotacaoRenFix.FormCreate(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
end;

end.
