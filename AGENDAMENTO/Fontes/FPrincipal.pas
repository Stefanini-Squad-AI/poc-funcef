unit FPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMPrincipal, Menus, Wwintl, ExtCtrls, Buttons, ComCtrls,
  fTelaAut, uAutorizacao, uSistema, TB97, Db, Wwdatsrc, DBTables, Wwquery,
  wwdblook, StdCtrls, Mask, wwdbedit, DBCtrls, TB97Tlwn, TB97Tlbr,
  TB97Ctls, ImgList, CorreioCM, IvDictio, IvAMulti, IvBinDic, IvMulti,
  IvEMulti, fcLabel, uResource, SConnect, MConnect, DBClient, AppEvnts,
  CMApplicationEvents, StdActns, ActnList, fcStatusBar,
  fCadAssuntoAgenda, fCadAtendeAgenda, fCadGrupoAtende, fCadPeriodoAgenda,
  fCadAusenciaAtende, fCadAgendamento, fCalendarioAgenda, uCmCtrlRptAgendamento,
  dRptAgendamento, fRptAgendamento, uModuloAgendamento, CMNetUsers;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    mnuAssuntoAgendamento: TMenuItem;
    mnuAtendente: TMenuItem;
    mnuGrupoAtendentes: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    mnuPeriodoAgendamento: TMenuItem;
    mnuAusenciaAtendente: TMenuItem;
    mnuAgenda: TMenuItem;
    mnuAgendamento: TMenuItem;
    mnuCalendario: TMenuItem;
    procedure mnuAssuntoAgendamentoClick(Sender: TObject);
    procedure fcLabel2Click(Sender: TObject);
    procedure mnuAtendenteClick(Sender: TObject);
    procedure mnuGrupoAtendentesClick(Sender: TObject);
    procedure mnuPeriodoAgendamentoClick(Sender: TObject);
    procedure mnuAusenciaAtendenteClick(Sender: TObject);
    procedure mnuAgendamentoClick(Sender: TObject);
    procedure mnuCalendarioClick(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure AppPadraoCreateFormReports(Sender: TObject);
    procedure AppPadraoPrintReportPadrao(sender: TObject;
      IdReports: Integer; sFileName: String; var Printed: Boolean);
    procedure AppPadraoShowParamReportPadrao(sender: TObject;
      IdReports: Integer; var sParams: String; var PrintReport: Boolean);
  private
  public
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.DFM}

procedure TfrmPrincipal.fcLabel2Click(Sender: TObject);
var
  i : integer;
begin
  inherited;
  for i := 0 to ( ComponentCount - 1 ) do
    if ( Components[i] is TMenuItem ) then ( Components[i] as TMenuItem ).Enabled := True;
end;

procedure TfrmPrincipal.mnuAssuntoAgendamentoClick(Sender: TObject);
begin
  inherited;
  AbrirForm( frmCadAssuntoAgenda, TfrmCadAssuntoAgenda, False );
end;

procedure TfrmPrincipal.mnuAtendenteClick(Sender: TObject);
begin
  inherited;
  AbrirForm( frmCadAtendeAgenda, TfrmCadAtendeAgenda, False );
end;

procedure TfrmPrincipal.mnuGrupoAtendentesClick(Sender: TObject);
begin
  inherited;
  AbrirForm( frmCadGrupoAtende, TfrmCadGrupoAtende, False );
end;

procedure TfrmPrincipal.mnuPeriodoAgendamentoClick(Sender: TObject);
begin
  inherited;
  AbrirForm( frmCadPeriodoAgenda, TfrmCadPeriodoAgenda, False );
end;

procedure TfrmPrincipal.mnuAusenciaAtendenteClick(Sender: TObject);
begin
  inherited;
  AbrirForm( frmCadAusenciaAtende, TfrmCadAusenciaAtende, False );
end;

procedure TfrmPrincipal.mnuAgendamentoClick(Sender: TObject);
begin
  inherited;
  AbrirForm( frmCadAgendamento, TfrmCadAgendamento, False );
end;

procedure TfrmPrincipal.mnuCalendarioClick(Sender: TObject);
begin
  inherited;
  AbrirForm( frmCalendarioAgenda, TfrmCalendarioAgenda, False );
end;

procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
begin
  inherited;
  if UsuarioEAtendente then
    AbrirForm( frmCalendarioAgenda, TfrmCalendarioAgenda, False );
end;

procedure TfrmPrincipal.AppPadraoCreateFormReports(Sender: TObject);
begin
  inherited;
  Application.CreateForm( TdtmRptAgendamento, dtmRptAgendamento );
end;

procedure TfrmPrincipal.AppPadraoPrintReportPadrao(sender: TObject;
  IdReports: Integer; sFileName: String; var Printed: Boolean);
Var
  CmCtrlRptAgendamento : TCmCtrlRptAgendamento;
begin
  inherited;
    CmCtrlRptAgendamento := TCmCtrlRptAgendamento.Create;
    Try
       Printed := ShowReport( IdReports, CmCtrlRptAgendamento );
       CmCtrlRptAgendamento.Free;
    Except
         CmCtrlRptAgendamento.Free;
         Raise;
    End;
end;

procedure TfrmPrincipal.AppPadraoShowParamReportPadrao(sender: TObject;
  IdReports: Integer; var sParams: String; var PrintReport: Boolean);
begin
  case IdReports of
    20173: begin
             iReportAgendamento := 1;
             FrmPreviewReports := TfrmRptAgendamento.Create( Self );
           end;
    20174: begin
             iReportAgendamento := 2;
             FrmPreviewReports := TfrmRptAgendamento.Create( Self );
           end;
    20175: begin
             iReportAgendamento := 3;
             FrmPreviewReports := TfrmRptAgendamento.Create( Self );
           end;
  else
    FrmPreviewReports := nil;
  end;
  inherited;
end;

initialization
   Sistema.NomeModulo := 'Agendamento'; // Nome do Módulo
   Sistema.IdModulo := 730;             // IdModulo cadastrado no SAD
   Sistema.Versao := '3.01.18';
   Sistema.NomeAplicativo := 'Agendamento de Atendimentos';

end.
