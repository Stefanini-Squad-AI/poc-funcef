unit fTransfRelats;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, fcStatusBar, ComCtrls, EditReg, DBTables, CMDataTransf, Db;

type
  TfrmTransfRelats = class(TfrmOkCancelar)
    SbTransf: TfcStatusBar;
    PbTransf: TProgressBar;
    OpDlg: TOpenDialog;
    GroupBox2: TGroupBox;
    SpeedButton1: TSpeedButton;
    edNomeArquivo: TEdit;
    GpbDados: TGroupBox;
    GpbTipoImporta: TGroupBox;
    SbtnGerar: TSpeedButton;
    SbtnImportar: TSpeedButton;
    LblUsuario: TLabel;
    LblSenha: TLabel;
    LblAlias: TLabel;
    EdtUsuario: TEditReg;
    EdtAlias: TEditReg;
    Dbimporta: TDatabase;
    CMDataTransf: TCMDataTransf;
    EdtSenha: TEdit;
    LblParamTrans: TLabel;
    procedure SbtnGerarClick(Sender: TObject);
    procedure SbtnImportarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure EdtSenhaExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CMDataTransfTransfProgress(const Msg: String;
      Operation: TTransfOperation; StepNum, TotalSteps: Integer);
    procedure CMDataTransfRequestLoginDBA(Sender: TObject; var LoginName,
      Password: String; var Continue: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTransfRelats: TfrmTransfRelats;

implementation

{$R *.DFM}

Uses uCripto;

procedure TfrmTransfRelats.SbtnGerarClick(Sender: TObject);
begin
  inherited;
  LblUsuario.Enabled := False;
  LblSenha.Enabled := False;
  LblAlias.Enabled := False;
  LblParamTrans.Enabled := False;
  GpbDados.Enabled := False;
end;

procedure TfrmTransfRelats.SbtnImportarClick(Sender: TObject);
begin
  inherited;
  LblUsuario.Enabled := True;
  LblSenha.Enabled := True;
  LblAlias.Enabled := True;
  LblParamTrans.Enabled := True;
  GpbDados.Enabled := True;
end;

procedure TfrmTransfRelats.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If (edNomeArquivo.Text <> '') Then
  Begin
     CMDataTransf.OnTransfProgress := CMDataTransfTransfProgress;
     CMDataTransf.OrigemCM := 2;
     CMDataTransf.PassWord := CriptografarHash('cmsol',10,10);

     If SbtnGerar.Down Then
     Begin
        CMDataTransf.DatabaseName := 'BaseDados';
        CMDataTransf.CreateFile(edNomeArquivo.Text);
     End
     Else
     Begin
        If Not FileExists(edNomeArquivo.Text) Then
           ShowMessage('Arquivo para importação não Existe')
        Else
        Begin
           If Dbimporta.Connected Then Dbimporta.Close;
           Dbimporta.Params.Values['SERVER NAME'] := EdtAlias.Text;
           Dbimporta.Params.Values['USER NAME'] := EdtUsuario.Text;
           Dbimporta.Params.Values['PASSWORD'] := EdtSenha.Text;
           Dbimporta.Open;

           CMDataTransf.DatabaseName := 'BaseDadosImporta';

           If CMDataTransf.ImportFile(edNomeArquivo.Text) Then
              ShowMessage('Dados Importados Com Sucesso.')
           Else
              ShowMessage('Erro na Importação de Dados.');
        End;
     End;
  End;
end;

procedure TfrmTransfRelats.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  If OpDlg.Execute Then
     edNomeArquivo.Text := OpDlg.FileName;
end;

procedure TfrmTransfRelats.EdtSenhaExit(Sender: TObject);
begin
  inherited;
end;

procedure TfrmTransfRelats.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  If Dbimporta.Connected Then Dbimporta.Close;
end;

procedure TfrmTransfRelats.CMDataTransfTransfProgress(const Msg: String;
  Operation: TTransfOperation; StepNum, TotalSteps: Integer);
begin
  inherited;
  If TotalSteps <> 0 Then
     PbTransf.Max := TotalSteps;

  PbTransf.Position := StepNum;
  SbTransf.Panels[0].Text := Msg;
end;

procedure TfrmTransfRelats.CMDataTransfRequestLoginDBA(Sender: TObject;
  var LoginName, Password: String; var Continue: Boolean);
begin
  inherited;
  LoginName := EdtUsuario.Text;
  Password := EdtSenha.Text;
  Continue := True;
end;

end.

