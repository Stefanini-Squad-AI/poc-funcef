unit FCadIntCtbDir;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, cmseldlg, MontaSelect, ImgList, TB97Ctls, StdCtrls,
  wwdbdatetimepicker, CMDateTimePicker, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, UOperacaoInvest, FTelaAut;

type
  TFrmCadIntCtbDir = class(TfrmOkCancelar)
    Label1: TLabel;
    dbdDtaIni: TCMDateTimePicker;
    dbdDtaFim: TCMDateTimePicker;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    sbtnProcurar: TToolbarButton97;
    ImlPadrao: TImageList;
    MontaSelect: TMontaSelect;
    procedure FormShow(Sender: TObject);
    procedure dbdDtaIniExit(Sender: TObject);
    procedure dbdDtaFimExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dbdDtaFimKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbdDtaIniKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbtnSairClick(Sender: TObject);
  private
    { Private declarations }
    function VerStatus: Boolean;
  public
    { Public declarations }
  end;

var
  FrmCadIntCtbDir: TFrmCadIntCtbDir;

implementation

uses DBaseDados, UmensErro, USistema, FCadIntCtbDirProcura;

{$R *.DFM}

procedure TFrmCadIntCtbDir.FormShow(Sender: TObject);
begin
  inherited;
  bbtnConfirmar.Enabled := False;
  bbtnCancelar.Enabled := False;
end;

function TFrmCadIntCtbDir.VerStatus: Boolean;
begin
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled := False;

   if Trim(dbdDtaIni.Text) = '' then
   begin
      result := false;
      Exit;
   end;

   if Trim(dbdDtaFim.Text) = '' then
   begin
      result := false;
      Exit;
   end;

   if dbdDtaIni.Date > dbdDtaFim.Date then
   begin
      MsgDlg('A data Final Deve ser Maior que a Data Inicial.','Mensagem do Sistema',
              mtInformation,[MbOk],0);
      if dbdDtaIni.CanFocus then
         dbdDtaIni.SetFocus;
      result := false;   
      Exit;
   End;

   if dtmBaseDados.dbBaseDados.InTransaction then
   begin
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled := True;
      bbtnSair.Enabled := False;
      bbtnConfirmar.Caption := 'Comita'
   end else begin
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled := False;
      bbtnSair.Enabled := True;
      bbtnConfirmar.Caption := 'OK'
   end;
   result := true;
end;

procedure TFrmCadIntCtbDir.dbdDtaIniExit(Sender: TObject);
begin
   inherited;
   VerStatus;
end;

procedure TFrmCadIntCtbDir.dbdDtaFimExit(Sender: TObject);
begin
   inherited;
   VerStatus;
end;

procedure TFrmCadIntCtbDir.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   if bbtnConfirmar.Caption = 'OK' then
   begin
      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;

      OperacaoInvest.RefazContabDireito(dbdDtaIni.DateTime,dbdDtaFim.DateTime, False);
   end else begin
      if dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.Commit;
   end;
   VerStatus;
end;

procedure TFrmCadIntCtbDir.sbtnProcurarClick(Sender: TObject);
begin
   inherited;
   AbrirFormModal(frmCadIntCtbDirProcura,TfrmCadIntCtbDirProcura);
   VerStatus;
end;

procedure TFrmCadIntCtbDir.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Rollback;
   VerStatus;
end;

procedure TFrmCadIntCtbDir.dbdDtaFimKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   inherited;
   if key = vk_return then
      VerStatus;
end;

procedure TFrmCadIntCtbDir.dbdDtaIniKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   inherited;
   if key = vk_return then
      VerStatus;
end;

procedure TFrmCadIntCtbDir.bbtnSairClick(Sender: TObject);
begin
   inherited;
   if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Rollback;
end;

end.
