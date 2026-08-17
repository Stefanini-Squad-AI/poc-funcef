unit FPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMPrincipal, Menus, Wwintl, ExtCtrls, Buttons, ComCtrls,
  fTelaAut, uAutorizacao, uSistema, TB97, Db, Wwdatsrc, DBTables, Wwquery,
  wwdblook, StdCtrls, Mask, wwdbedit, DBCtrls, uModulo, TB97Tlwn, TB97Tlbr,
  TB97Ctls, CorreioCM, IvDictio, IvAMulti, IvBinDic, IvMulti, IvEMulti,
  fcLabel, uIntegraBack, AppEvnts, CMApplicationEvents, StdActns, ActnList,
  ImgList, fcStatusBar;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    Tmr: TTimer;
    MnuOperacoes: TMenuItem;
    MnuImporta: TMenuItem;
    MnuHistSaf: TMenuItem;
    MnuHistXTipoAlterador: TMenuItem;
    MnuBloqueiHist: TMenuItem;
    procedure nmuConfigParametrosClick(Sender: TObject);
    procedure TmrTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure MnuImportaClick(Sender: TObject);
    procedure MnuHistSafClick(Sender: TObject);
    procedure MnuHistXTipoAlteradorClick(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure AppPadraoCreateFormReports(Sender: TObject);
    procedure MnuBloqueiHistClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses fCadParam, fLog, FCadHistoricos, FCadHistXTipoAlter, DtmRptSaf,
  DIntegraSaf, fBolqueiaHist;
{$R *.DFM}


procedure TfrmPrincipal.nmuConfigParametrosClick(Sender: TObject);
begin
  inherited;
  Tmr.Enabled := False;
  Modulo.FechaLog := True;
  If FrmLog <> nil Then FrmLog.Close;
  AbrirForm(FrmCadParam,TFrmCadParam,False);
end;

procedure TfrmPrincipal.TmrTimer(Sender: TObject);
begin
  inherited;
  Try
   Tmr.Enabled := False;
   
   Modulo.GravaLog('Inciando Operações');

   DtmIntegraSaf.ImportaRegistros;

   Modulo.GravaLog('Término das Operações');   

  Except
    On E:EdBEngineError Do
    Begin
      Modulo.GravaLog('Erro: ' + E.Errors[0].Message);
      If E.ErrorCount > 1 Then
        Modulo.GravaLog('Erro: ' + E.Errors[1].Message);
    End;

    On E:Exception Do
       Modulo.GravaLog('Erro: ' + E.Message);
  End;

  Tmr.Enabled := True;
End;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
  mnuRAD.Visible := False;
  btnExecEtapa.Visible := False;
end;

procedure TfrmPrincipal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  Modulo.FechaLog := True;
  inherited;
end;

procedure TfrmPrincipal.MnuImportaClick(Sender: TObject);
begin
  inherited;
   Modulo.GravaLog('Inciando Operações');

   DtmIntegraSaf.ImportaRegistros;

   Modulo.GravaLog('Término das Operações');
end;

procedure TfrmPrincipal.MnuHistSafClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadHistoricos,TFrmCadHistoricos,False);
end;

procedure TfrmPrincipal.MnuHistXTipoAlteradorClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadHistXTipoAlter,TFrmCadHistXTipoAlter,False);
end;

procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
begin
  inherited;
   If Sistema.FezLogin Then Modulo.BuscaParam;
end;

procedure TfrmPrincipal.AppPadraoCreateFormReports(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TDRptSaf, DRptSaf);
end;

procedure TfrmPrincipal.MnuBloqueiHistClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmBolqueiaHist,TFrmBolqueiaHist,False);
end;

initialization

   Sistema.NomeModulo := 'IntegraSAF';    // Nome do Módulo
   Sistema.IdModulo := 137 ;              // IdModulo cadastrado no SAD
   Sistema.Versao := '3.01.01';
   Sistema.NomeAplicativo := 'IntegraSAF';

   Modulo := TModulo.Create  ;
   IntegraBack := TIntegraBack.Create(True,True,True);
finalization
   Modulo.free;
   IntegraBack.Free;
end.

