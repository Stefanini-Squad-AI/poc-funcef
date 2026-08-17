unit FGeraInformeEmptmoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MontaSelect, Buttons, Mask, StdCtrls, ExtCtrls, ComCtrls,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97,
  uCtrlGeraInformeEmptmo, uSistema, uMensErro;

type
  TFrmGeraInformeEmptmoMT = class(TfrmOkCancelar)
    grbAnoBase: TGroupBox;
    lblAnoBase: TLabel;
    edtData: TEdit;
    UpDown1: TUpDown;
    grbIndivdual: TGroupBox;
    MontaSelect1: TMontaSelect;
    pnlGeraIndiv: TPanel;
    lblCPF: TLabel;
    medCPF: TMaskEdit;
    lblNomeParticip: TLabel;
    edtNomeParticip: TEdit;
    sbtnAddFav: TSpeedButton;
    sbtnRemFav: TSpeedButton;
    svdGravaArqAtivo: TSaveDialog;
    grbCaminhoArquivos: TGroupBox;
    lblAtivoCaixa: TLabel;
    edtGravaArqAtivo: TEdit;
    sbtnGravaArqAtivo: TSpeedButton;
    lblOutrasSit: TLabel;
    edtGravaArqOutrasSit: TEdit;
    sbtnGravaArqOutrasSit: TSpeedButton;
    svdGravaArqOutrasSit: TSaveDialog;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    lblFacultativo: TLabel;
    lblAssistido: TLabel;
    edtGravaArqAssistidos: TEdit;
    edtGravaArqFacultativo: TEdit;
    sbtnGravaArqFacultativo: TSpeedButton;
    sbtnGravaArqAssistido: TSpeedButton;
    edtGravaArqAtivoCaixa: TEdit;
    sbtnGravaArqAtivoCaixa: TSpeedButton;
    svdGravaArqAtivoCaixa: TSaveDialog;
    svdGravaArqFacultativo: TSaveDialog;
    svdGravaArqAssistido: TSaveDialog;
    chkGeraIndiv: TCheckBox;
    rdgGeraArq: TRadioGroup;
    procedure chkGeraIndivClick(Sender: TObject);
    procedure sbtnAddFavClick(Sender: TObject);
    procedure sbtnRemFavClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnGravaArqAtivoClick(Sender: TObject);
    procedure sbtnGravaArqOutrasSitClick(Sender: TObject);
    procedure sbtnGravaArqAtivoCaixaClick(Sender: TObject);
    procedure sbtnGravaArqFacultativoClick(Sender: TObject);
    procedure sbtnGravaArqAssistidoClick(Sender: TObject);
    procedure edtGravaArqAtivoChange(Sender: TObject);
    procedure edtGravaArqAtivoCaixaChange(Sender: TObject);
    procedure edtGravaArqFacultativoChange(Sender: TObject);
    procedure edtGravaArqAssistidosChange(Sender: TObject);
    procedure edtGravaArqOutrasSitChange(Sender: TObject);
    procedure rdgGeraArqClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    GeraInformeEmptmo : TCtrlGeraInformeEmptmo;
  public
    { Public declarations }
  end;

var
  FrmGeraInformeEmptmoMT: TFrmGeraInformeEmptmoMT;

implementation

uses DBaseDados;

{$R *.DFM}

procedure TFrmGeraInformeEmptmoMT.chkGeraIndivClick(Sender: TObject);
begin
  inherited;
end;

procedure TFrmGeraInformeEmptmoMT.sbtnAddFavClick(Sender: TObject);
begin
  inherited;
  MontaSelect1.Executar;
  if (MontaSelect1.ValoresChave.Count > 0) and
     (MontaSelect1.ValoresChave[1]   <> '') then
  begin
    medCPF.Text          := MontaSelect1.ValoresChave[2];
    edtNomeParticip.Text := MontaSelect1.ValoresChave[3] + ' - ' + MontaSelect1.ValoresChave[1];
  end;
end;

procedure TFrmGeraInformeEmptmoMT.sbtnRemFavClick(Sender: TObject);
begin
  inherited;
  medCPF.Clear;
  edtNomeParticip.Clear;
end;

procedure TFrmGeraInformeEmptmoMT.bbtnConfirmarClick(Sender: TObject);
Var
  sNomeArquivo, sAno, sNumDoc : String;

Begin
  inherited;

  sAno         := edtData.text;
  Case rdgGeraArq.ItemIndex of
    0: sNumDoc := MontaSelect1.ValoresChave[2];
    1: sNumDoc := '-1';
    2: sNumDoc := '0';
  End;  
  GeraInformeEmptmo.GeraArquivo(False, sNumDoc, sAno, edtGravaArqAtivo.Text, edtGravaArqAtivoCaixa.Text, edtGravaArqFacultativo.Text, edtGravaArqAssistidos.Text, edtGravaArqOutrasSit.Text, ProgressBar1);
  MsgDlg('Processo terminado', 'Informação', mtInformation, [mbOk], 0);
  bbtnConfirmar.Enabled := False;
  bbtnCancelar.Enabled  := False;
end;

procedure TFrmGeraInformeEmptmoMT.FormCreate(Sender: TObject);
begin
  inherited;
  GeraInformeEmptmo := TCtrlGeraInformeEmptmo.Create;
  GeraInformeEmptmo.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer,True,nil,nil,False);
end;

procedure TFrmGeraInformeEmptmoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  GeraInformeEmptmo.Free;
end;

procedure TFrmGeraInformeEmptmoMT.sbtnGravaArqAtivoClick(Sender: TObject);
begin
  inherited;
  If svdGravaArqAtivo.Execute Then
    edtGravaArqAtivo.Text := svdGravaArqAtivo.filename;
end;

procedure TFrmGeraInformeEmptmoMT.sbtnGravaArqOutrasSitClick(
  Sender: TObject);
begin
  inherited;
  If svdGravaArqOutrasSit.Execute Then
    edtGravaArqOutrasSit.Text := svdGravaArqOutrasSit.filename;
end;

procedure TFrmGeraInformeEmptmoMT.sbtnGravaArqAtivoCaixaClick(
  Sender: TObject);
begin
  inherited;
  If svdGravaArqAtivoCaixa.Execute Then
    edtGravaArqAtivoCaixa.Text := svdGravaArqAtivoCaixa.filename;
end;

procedure TFrmGeraInformeEmptmoMT.sbtnGravaArqFacultativoClick(
  Sender: TObject);
begin
  inherited;
  If svdGravaArqFacultativo.Execute Then
    edtGravaArqFacultativo.Text := svdGravaArqFacultativo.filename;
end;

procedure TFrmGeraInformeEmptmoMT.sbtnGravaArqAssistidoClick(
  Sender: TObject);
begin
  inherited;
  If svdGravaArqAssistido.Execute Then
    edtGravaArqAssistidos.Text := svdGravaArqAssistido.filename;
end;

procedure TFrmGeraInformeEmptmoMT.edtGravaArqAtivoChange(Sender: TObject);
begin
  inherited;
end;

procedure TFrmGeraInformeEmptmoMT.edtGravaArqAtivoCaixaChange(
  Sender: TObject);
begin
  inherited;
end;

procedure TFrmGeraInformeEmptmoMT.edtGravaArqFacultativoChange(
  Sender: TObject);
begin
  inherited;
end;

procedure TFrmGeraInformeEmptmoMT.edtGravaArqAssistidosChange(
  Sender: TObject);
begin
  inherited;
end;

procedure TFrmGeraInformeEmptmoMT.edtGravaArqOutrasSitChange(
  Sender: TObject);
begin
  inherited;
end;

procedure TFrmGeraInformeEmptmoMT.rdgGeraArqClick(Sender: TObject);
begin
  inherited;
  if rdgGeraArq.ItemIndex = 0 Then
    pnlGeraIndiv.Enabled := True
  Else
  Begin
    pnlGeraIndiv.Enabled := False;
    medCPF.Clear;
    edtNomeParticip.Clear;
  End;
end;

procedure TFrmGeraInformeEmptmoMT.FormShow(Sender: TObject);
begin
  inherited;
  rdgGeraArqClick(Self);
end;

end.
