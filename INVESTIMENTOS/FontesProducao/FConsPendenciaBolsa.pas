//******************************************************************************
// Data      : 31/08/2007
// Código    : AL_1
// Pendencia :
// SOL       :
// Motivo    : Implementação do tratamento de maximizar a tela
//******************************************************************************

unit FConsPendenciaBolsa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, Wwdatsrc,
  DBTables, Wwquery;

type
  TfrmConsPendenciaBolsa = class(TfrmOkCancelar)
    QryConsulta: TwwQuery;
    i: TStringField;
    p: TStringField;
    QryConsultaCODTIPOACAO: TStringField;
    t: TStringField;
    QryConsultaDATAVENCOPER: TDateTimeField;
    QryConsultaQTDEOPERACAO: TFloatField;
    QryConsultaPRECOUNITOPERACAO: TFloatField;
    QryConsultaVLROPERACAO: TFloatField;
    QryConsultaDESCMERCADO: TStringField;
    QryConsultaDATAOPERACAO: TDateTimeField;
    QryConsultaIDOPERACAOINVEST: TFloatField;
    QryConsultaNOME: TStringField;
    QryConsultaNUMDOCUMENTO: TStringField;
    QryConsultaNATUREZAOPERACAO: TStringField;
    QryConsultaIDTIPOOPERACAO: TFloatField;
    QryConsultaIDTIPOINVEST: TFloatField;
    s: TFloatField;
    QryConsultaIDFORCLI: TFloatField;
    QryConsultaIDCARTEIRAINVEST: TFloatField;
    QryConsultaMOECODIGO: TFloatField;
    QryConsultaIDINVESTIMENTO: TFloatField;
    QryConsultaIDLOTE: TStringField;
    QryConsultaIDCORRETVALORES: TFloatField;
    QryConsultaQTDELOTE: TFloatField;
    QryConsultaEMPRESAPROP: TFloatField;
    QryConsultaIDOPERACAOORIGEM: TFloatField;
    DsConsulta: TwwDataSource;
    DBGrid1: TwwDBGrid;
    QryConsultaSGLCORRETVALORES: TStringField;
    Panel11: TPanel;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsPendenciaBolsa: TfrmConsPendenciaBolsa;

implementation

uses FCadPendenciaBolsa, FTelaAut, FPrincipal;

{$R *.DFM}

procedure TfrmConsPendenciaBolsa.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmPendenciaBolsa,frmPendenciaBolsa);
  frmPendenciaBolsa.dbDtaOperacao.Date := QryConsulta.FieldByName('DATAOPERACAO').AsDateTime;
  frmPendenciaBolsa.dblCorretora.Text  := QryConsulta.FieldByName('SGLCORRETVALORES').AsString;
  QryConsulta.Close;
  Close;
end;

procedure TfrmConsPendenciaBolsa.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmPendenciaBolsa,TfrmPendenciaBolsa,False);
  frmPendenciaBolsa.dbDtaOperacao.date := QryConsulta.FieldByName('DATAOPERACAO').AsDateTime;
  frmPendenciaBolsa.dblCorretora.Text  := QryConsulta.FieldByName('SGLCORRETVALORES').AsString;
  QryConsulta.Close;
  Close;
end;

procedure TfrmConsPendenciaBolsa.FormShow(Sender: TObject);
begin
  inherited;
   QryConsulta.Open;
   If QryConsulta.EOF Then
      bbtnConfirmar.Enabled := False;
end;

procedure TfrmConsPendenciaBolsa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   QryConsulta.Close;
end;

procedure TfrmConsPendenciaBolsa.FormCreate(Sender: TObject);
begin
  inherited;

   PnlFundo.Enabled := True;
   //AL_1
   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;
end;

end.
