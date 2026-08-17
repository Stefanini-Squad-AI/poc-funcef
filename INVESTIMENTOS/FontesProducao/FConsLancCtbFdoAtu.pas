unit FConsLancCtbFdoAtu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, wwdblook, wwdbdatetimepicker, FPreview,
  CMDateTimePicker, Grids, Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery;

type
  TfrmConsLancCtbFdoAtu = class(TfrmOkCancelarInv)
    pnlDados: TPanel;
    ToolbarSep972: TToolbarSep97;
    bbtnImprimir: TBitBtn;
    dbgLanContFdo: TwwDBGrid;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    dtDtaInicio: TCMDateTimePicker;
    dtDtaFim: TCMDateTimePicker;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure AbreQuery;
  public
    { Public declarations }
  end;

var
  frmConsLancCtbFdoAtu: TfrmConsLancCtbFdoAtu;

implementation

uses FDmLancContabFundos, UOperComum, UBibliotecaInvest;

{$R *.DFM}

procedure TfrmConsLancCtbFdoAtu.bbtnConfirmarClick(Sender: TObject);
begin
   if dtDtaInicio.Date > dtDtaFim.Date then
      exit;

  inherited;

   AbreQuery;
end;

procedure TfrmConsLancCtbFdoAtu.AbreQuery;
begin
   With DmLancContabFundos Do
   begin
      OperComum.LimpaParametros(QryLancCtbFdoAtu);
      QryLancCtbFdoAtu.ParamByName('DATA_INI').AsString       := dtDtaInicio.Text;
      QryLancCtbFdoAtu.ParamByName('DATA_FIM').AsString       := dtDtaFim.Text;
      QryLancCtbFdoAtu.ParamByName('IDTIPOINVEST').AsInteger  := iTipoInvestUsu;
      QryLancCtbFdoAtu.Open;

      if not QryLancCtbFdoAtu.Eof then
         bbtnImprimir.Enabled := True
      else
         bbtnImprimir.Enabled := False;
   end;
end;

procedure TfrmConsLancCtbFdoAtu.FormShow(Sender: TObject);
begin
  inherited;
   dtDtaInicio.Date := Date;
   dtDtaFim.Date    := Date;

  with DmLancContabFundos do
  begin
     OperComum.LimpaParametros(QryLancContabFundos);
     QryLancContabFundos.Open;
  end;

end;

procedure TfrmConsLancCtbFdoAtu.bbtnImprimirClick(Sender: TObject);
begin
  inherited;
  with DmLancContabFundos do
  begin
     QryLancCtbFdoAtu.DisableControls;

     pplDataPer.Caption := 'Período : '+dtDtaInicio.Text+' a '+dtDtaFim.Text;

     TfrmPreview.CreateModalPreview(Application,
                                    rpLancCtbFdoAtu,
                                    rpLancCtbFdoAtu.PrinterSetup.DocumentName);

     QryLancCtbFdoAtu.EnableControls;
  end;
end;

procedure TfrmConsLancCtbFdoAtu.FormCreate(Sender: TObject);
begin
  inherited;
   WindowState := wsMaximized;
end;

procedure TfrmConsLancCtbFdoAtu.bbtnSairClick(Sender: TObject);
begin
  inherited;
   bbtnImprimir.Enabled := False;
end;

procedure TfrmConsLancCtbFdoAtu.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  with DmLancContabFundos do
  begin
     OperComum.LimpaParametros(QryLancContabFundos);
     QryLancContabFundos.Open;
  end;
  bbtnImprimir.Enabled := False;
end;

procedure TfrmConsLancCtbFdoAtu.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   OperComum.LimpaParametros(DmLancContabFundos.QryLancCtbFdoAtu);
end;

end.
