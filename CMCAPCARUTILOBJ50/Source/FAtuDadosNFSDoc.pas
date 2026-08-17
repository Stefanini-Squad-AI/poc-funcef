//***************************************************************************************
//N. SIG.............: 75760 
//Data da Alteração..: 06/06/2019
//Alteração Form.....: FAtuDadosNFSDoc
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Criação da tela de definição de dados de NFS através de alteradores.
//***************************************************************************************
unit FAtuDadosNFSDoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, uCtrlLancDocCapCar, uCtrlPadroes, uCtrlDocumento,
  FPai, StdCtrls, Buttons, wwdbdatetimepicker, CMDateTimePicker, TREdit,
  ExtCtrls, IvDictio, IvMulti, IvEMulti;

type
  TfrmAtuDadosNFSDoc = class(TfrmPai)
    pnlGeral: TPanel;
    mmoNFSOBS: TMemo;
    lblDadosAdicionais: TLabel;
    edtNumSerie: TEdit;
    lblNumSerie: TLabel;
    edtValorBruto: TRealEdit;
    lblValorBruto: TLabel;
    dtpNFSDataEmissao: TCMDateTimePicker;
    lblDataEmissao: TLabel;
    edtNumNotaFiscal: TEdit;
    lblNumNotaFiscal: TLabel;
    btnConfirmar: TBitBtn;
    btnSair: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlLancDocCapCar : TCtrlLancDocCapCar;
    CtrlDocumento: TCtrlDocumento;
    function VerificaCampoObrigatorios(var pMsgErro: string): Boolean;
  public
    { Public declarations }
    fCodDocumento: Integer;
    fValorBruto: Double;
    fStatusAtuDados: Integer;
    fDataEmissao : TDate;
  end;

var
  frmAtuDadosNFSDoc: TfrmAtuDadosNFSDoc;

implementation

{$R *.DFM}

{ TfrmAtuDadosNFSDoc }

function TfrmAtuDadosNFSDoc.VerificaCampoObrigatorios(
  var pMsgErro: string): Boolean;
begin
  Result := True;
  if edtNumNotaFiscal.Text = EmptyStr then
  begin
    pMsgErro := 'Necessário indicar o Número da Nota Fiscal.';
    edtNumNotaFiscal.SetFocus;
    Result := False;
    Exit;
  end;

  if dtpNFSDataEmissao.Text = EmptyStr then
  begin
    pMsgErro := 'Necessário indicar a Data de Emissão.';
    edtNumNotaFiscal.SetFocus;
    Result := False;
    Exit;
  end;
end;

procedure TfrmAtuDadosNFSDoc.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlLancDocCapCar := TCtrlLancDocCapCar.Create();
  CtrlLancDocCapCar.InitializeAs(Padroes);

  CtrlDocumento := TCtrlDocumento.Create;
  CtrlDocumento.InitializeAs(Padroes);
end;

procedure TfrmAtuDadosNFSDoc.FormShow(Sender: TObject);
begin
  inherited;
  edtValorBruto.Value := fValorBruto;
  dtpNFSDataEmissao.Date := fDataEmissao;
end;

procedure TfrmAtuDadosNFSDoc.FormClick(Sender: TObject);
begin
  FreeAndNil(CtrlLancDocCapCar);
  FreeAndNil(CtrlDocumento);

  inherited;
end;

procedure TfrmAtuDadosNFSDoc.btnSairClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja cancelar a atualização dos dados de nota fiscal? ', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    fStatusAtuDados := 0;
    inherited;
  end
  else
    edtNumNotaFiscal.SetFocus;
end;

procedure TfrmAtuDadosNFSDoc.btnConfirmarClick(Sender: TObject);
var
  sMsg: String;
begin
  sMsg:= EmptyStr;

  if not VerificaCampoObrigatorios(sMsg) then
  begin
    MessageDlg('Necessário preenchimento: ' + sMsg, mtConfirmation, [mbOK], 0);
    Exit;
  end
  else
    if not CtrlLancDocCapCar.SetDadosNFS(fCodDocumento,
                                         edtNumNotaFiscal.Text,
                                         edtNumSerie.Text,
                                         mmoNFSOBS.Text,
                                         dtpNFSDataEmissao.Text) then
    begin
      MessageDlg('Erro ao atualizar o documento.', mtConfirmation, [mbOK], 0);
      Exit;
    end
    else
      fStatusAtuDados := 1;
  inherited;

end;

end.
