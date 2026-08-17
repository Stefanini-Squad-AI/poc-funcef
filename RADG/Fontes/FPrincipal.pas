unit FPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMPrincipal, Menus, Wwintl, ExtCtrls, Buttons, ComCtrls,
  fTelaAut, uAutorizacao, uSistema, TB97, Db, Wwdatsrc, DBTables, Wwquery,
  wwdblook, StdCtrls, Mask, wwdbedit, DBCtrls, uModulo, TB97Tlwn, TB97Tlbr,
  TB97Ctls, CorreioCM, IvDictio, IvAMulti, IvBinDic, IvMulti, IvEMulti,
  fcLabel, AppEvnts, CMApplicationEvents, StdActns, ActnList, ImgList,
  fcStatusBar, uCmRptManager, SConnect, MConnect, DBClient, uCtrlRptRADG,
  uResource, CMNetUsers, fCadProcessoRAD, uCtrlParamIntegra, fGeraProcesso,
  fProcessosRAD, fRADParam, fConsultaRAD, FParamRPTProcessoRad,
  fParamRadAtrasos, rRadAtrasos;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    GrupodeResponsabilidade1: TMenuItem;
    N3: TMenuItem;
    Referncias1: TMenuItem;
    TipodeProcesso1: TMenuItem;
    GrupodeAutorizao1: TMenuItem;
    TipodeEtapa1: TMenuItem;
    N4: TMenuItem;
    Andamentos1: TMenuItem;
    FluxodeProcessos1: TMenuItem;
    EtapaxProe1: TMenuItem;
    Processo1: TMenuItem;
    ProcessosPendentes1: TMenuItem;
    N5: TMenuItem;
    ConsultaProcessos1: TMenuItem;
    TipoProcessoTipoEtapaxObjetosRAD1: TMenuItem;
    GernciamentodeExecuodeEtapa1: TMenuItem;
    GernciamentodeProcesso1: TMenuItem;
    ToolbarButton971: TToolbarButton97;
    GrupodeProcesso1: TMenuItem;
    ProcessosPendentesxUsurio1: TMenuItem;
    procedure GrupodeResponsabilidade1Click(Sender: TObject);
    procedure Referncias1Click(Sender: TObject);
    procedure TipodeProcesso1Click(Sender: TObject);
    procedure GrupodeAutorizao1Click(Sender: TObject);
    procedure Andamentos1Click(Sender: TObject);
    procedure FluxodeProcessos1Click(Sender: TObject);
    procedure EtapaxProe1Click(Sender: TObject);
    procedure TipodeEtapa1Click(Sender: TObject);
    procedure ProcessosPendentes1Click(Sender: TObject);
    procedure ConsultaProcessos1Click(Sender: TObject);
    procedure TipoProcessoTipoEtapaxObjetosRAD1Click(Sender: TObject);
    procedure GernciamentodeExecuodeEtapa1Click(Sender: TObject);
    procedure GrupodeProcesso1Click(Sender: TObject);
    procedure GernciamentodeProcesso1Click(Sender: TObject);
    procedure AppPadraoPrintReportPadrao(sender: TObject;
      IdReports: Integer; sFileName: String; var Printed: Boolean);
    procedure AppPadraoConfigReportPadrao(liIdReports, liOrigemCm: Integer;
      DesReport: TObject; var Config: Boolean);
    procedure ProcessosPendentesxUsurio1Click(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure nmuConfigParametrosClick(Sender: TObject);
    procedure AppPadraoShowParamReportPadrao(sender: TObject;
      IdReports: Integer; var sParams: String; var PrintReport: Boolean);
  private
    { Private declarations }
  public
    function ReportInvisible(iIdReport: integer): boolean; override;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses FCadGrupoResponMT, FCadReferencia,  FCadGrupoAutMT,
     FCadAndamentosMT,  FFluxoMT,        FCadAutxEtapaMT,
     FCadProcessoMT,    FCadEtapaMT,     FProcxEtapaxObjMT,
     FGerExecEtapaMT,   FCadGrpProcessoMT, FGerProcMT,
     FMTProcPend,       FMTAcompProc, FConsProcMT;

{$R *.DFM}

procedure TfrmPrincipal.GrupodeResponsabilidade1Click(Sender: TObject);
begin
  inherited;
  AbrirForm( FrmCadGrupoResponMT, TFrmCadGrupoResponMT, False );
end;

procedure TfrmPrincipal.Referncias1Click(Sender: TObject);
begin
  inherited;
    AbrirForm(FrmCadReferencia,TFrmCadReferencia,False);
end;

procedure TfrmPrincipal.TipodeProcesso1Click(Sender: TObject);
begin
  inherited;
  with Sistema do
  begin
    if VersaoRad <> '+' then
      AbrirForm( FrmCadProcessoMT, TFrmCadProcessoMT, False )
    else
      AbrirForm( frmCadProcessoRAD, TfrmCadProcessoRAD, False );
  end;
end;

procedure TfrmPrincipal.GrupodeAutorizao1Click(Sender: TObject);
begin
  inherited;
    AbrirForm(FrmCadGrupoAutMT,TFrmCadGrupoAutMT,False);
end;

procedure TfrmPrincipal.Andamentos1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadAndamentosMT,TfrmCadAndamentosMT,False);
end;

procedure TfrmPrincipal.FluxodeProcessos1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmFluxoMT,TFrmFluxoMT,False);
end;

procedure TfrmPrincipal.EtapaxProe1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadAutxEtapaMT,TFrmCadAutxEtapaMT,False);
end;

procedure TfrmPrincipal.TipodeEtapa1Click(Sender: TObject);
begin
  inherited;
  AbrirForm( FrmCadEtapaMT, TFrmCadEtapaMT, False );
end;

procedure TfrmPrincipal.ProcessosPendentes1Click(Sender: TObject);
begin
  inherited;
   AbrirForm( FrmMTProcPend, TFrmMTProcPend, False );
end;

procedure TfrmPrincipal.ConsultaProcessos1Click(Sender: TObject);
begin
  inherited;
  AbrirForm( FrmMTAcompProc, TFrmMTAcompProc, False );
end;

procedure TfrmPrincipal.TipoProcessoTipoEtapaxObjetosRAD1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm( FrmProcxEtapaxObjMT, TFrmProcxEtapaxObjMT, False );
end;

procedure TfrmPrincipal.GernciamentodeExecuodeEtapa1Click(Sender: TObject);
begin
  inherited;
  AbrirForm( FrmGerExecEtapaMT, TFrmGerExecEtapaMT, False );
end;

procedure TfrmPrincipal.GrupodeProcesso1Click(Sender: TObject);
begin
  inherited;
   AbrirForm( FrmCadGrpProcessoMT, TFrmCadGrpProcessoMT, False );
end;

procedure TfrmPrincipal.GernciamentodeProcesso1Click(Sender: TObject);
begin
  inherited;
  AbrirForm( FrmGerProcMT, TFrmGerProcMT, False );
end;

procedure TfrmPrincipal.AppPadraoPrintReportPadrao(sender: TObject;
  IdReports: Integer; sFileName: String; var Printed: Boolean);
Var  RptRADG :TCtrlRptRADG;
begin
   inherited;
   RptRADG := TCtrlRptRADG.Create;
   Try
      Printed := ShowReport(IdReports, RptRADG);
      RptRADG.Free;
   Except
      RptRADG.Free;
      Raise;
   End;
end;

procedure TfrmPrincipal.AppPadraoConfigReportPadrao(liIdReports,
  liOrigemCm: Integer; DesReport: TObject; var Config: Boolean);
Var  RptRADG :TCtrlRptRADG;
begin
   inherited;
   RptRADG := TCtrlRptRADG.Create;
   Try
      Config := ConfigReport(liIdReports, liOrigemCm, RptRADG, DesReport);
      RptRADG.Free;
   Except
      RptRADG.Free;
      Raise;
   End;
end;

procedure TfrmPrincipal.ProcessosPendentesxUsurio1Click(Sender: TObject);
begin
  inherited;
  AbrirForm( FrmConsProcMT, TFrmConsProcMT, False );
end;

procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
begin
  inherited;
  ParamIntegra.GetParams( Sistema.IdEmpresa, 0, 'INTEGRACONTAB', 'PARAMCAP', tiCAP );

  with Sistema do
  begin
    if VersaoRad = '+' then
    begin
      Processo1.Visible:= False;
      GrupodeAutorizao1.Visible:= False;
      n4.Visible := False;
      Referncias1.Visible := False;
      Andamentos1.Visible:= False;
      TipodeEtapa1.Visible:= False;
      FluxodeProcessos1.Visible:= False;
      EtapaxProe1.Visible:= False;
      TipoProcessoTipoEtapaxObjetosRAD1.Visible:= False;
      GernciamentodeExecuodeEtapa1.Visible:= False;
      GernciamentodeProcesso1.Visible:= False;                  
      ProcessosPendentesxUsurio1.Visible:= False;
      ConsultaProcessos1.Caption := '&Consulta processos criados na versão antiga do RAD'
    end;
  end;
end;

procedure TfrmPrincipal.nmuConfigParametrosClick(Sender: TObject);
begin
  inherited;
  with Sistema do
    if VersaoRad = '+' then
      AbrirForm( frmRADParam, TfrmRADParam, False );
end;


function TfrmPrincipal.ReportInvisible(iIdReport: integer): boolean;
begin
  with Sistema do
  begin
    case iIdReport of
      2132, 2140, 2142, 2144, 2146, 2148, 3425 : Result := ( VersaoRad = '+' );
    else
      Result := False;
    end;
  end;
end;


procedure TfrmPrincipal.AppPadraoShowParamReportPadrao(sender: TObject;
  IdReports: Integer; var sParams: String; var PrintReport: Boolean);
begin

  Case IdReports Of

     20207 : begin  //Relatorio sintético
               FrmPreviewReports := TfrmConsultaRAD.Create( Self );
               FrmPreviewReports.tag := 20207;
               (FrmPreviewReports as TfrmConsultaRAD).pnlOrdenacao.Visible := True;
             end;

     20208 : begin //Relatorio
               FrmPreviewReports := TfrmParamRPTProcessoRAD.Create( Self );
               FrmPreviewReports.tag := 20208;
             end;

     20211 : begin
               FrmPreviewReports := TfrmConsultaRAD.Create( Self );
               (FrmPreviewReports as TfrmConsultaRAD).pnlOrdenacao.Visible := True;
             end;

     20212 : FrmPreviewReports := TfrmParamRadAtrasos.Create( Self );

  Else
      FrmPreviewReports := Nil;
  End;

  inherited;


end;

initialization

   Sistema.NomeModulo := 'RAD-Gerencial'; // Nome do Módulo
   Sistema.IdModulo   := 84;              // IdModulo cadastrado no SAD
   Sistema.Versao := '3.01.12';
   Sistema.NomeAplicativo  := 'RAD+  Registro de Alçadas e Decisões';
   Sistema.UsaLogOperacoes := True;
   Sistema.LoadOldReport   := False;

   Modulo := TModulo.Create;

finalization
   Modulo.free;


end.


