{******************************************************************************
Analista.: Marcio Sanches Spinosa SOL 217767 KINTANA 2049332
Data.....: 14/10/2013
Sol......: 217767
Kintana..: 2049332
Rotina...: bbtnConfirmarClick
Descrição: Ajuste na rotina de desfazer acerto
*******************************************************************************}

unit FDesfazAcertaValorMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, ComCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, fFrameLista, uCtrlDesfazAcerto, uMensErro,
  dBaseDados, uSistema;

type
  TFrmDesfazAcertaValorMT = class(TfrmOkCancelar)
    pnlAnoAcertto: TPanel;
    Label1: TLabel;
    edtAnoAcerto: TEdit;
    udAcerto: TUpDown;
    chkUsaLista: TCheckBox;
    pnlFrameLista: TPanel;
    FrameBenef: TfrmFrameListaBenef;
    procedure chkUsaListaClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlDesfazAcerto : TCtrlDesfazAcerto;
  public
    { Public declarations }
  end;

var
  FrmDesfazAcertaValorMT: TFrmDesfazAcertaValorMT;

implementation

{$R *.DFM}

procedure TFrmDesfazAcertaValorMT.chkUsaListaClick(Sender: TObject);
begin
  inherited;
  if chkUsaLista.Checked then
  begin
    pnlFrameLista.Visible := True;
    height                := 310;
  end
  else
  begin
    pnlFrameLista.Visible := False;
    height                := 115;
  end;
  position := poMainFormCenter;
end;

procedure TFrmDesfazAcertaValorMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;


  If FrameBenef.qryLista.Eof Then
    FrameBenef.ListaUsuario := 0;

  bbtnConfirmar.enabled := False;
  bbtnCancelar.Enabled  := False;
 //Marcio Sanches Spinosa SOL 217767 KINTANA 2049332 - Inicio
//  if not dtmBaseDados.dbBaseDados.InTransaction then
//    dtmBaseDados.dbBaseDados.StartTransaction;
//Marcio Sanches Spinosa SOL 217767 KINTANA 2049332 - Fim

  If not CtrlDesfazAcerto.DesfazAcerto(FrameBenef.ListaUsuario, chkUsaLista.checked, edtAnoAcerto.Text) Then
  begin
    MsgDlg(CtrlDesfazAcerto.MessageInfo, 'Erro', mtError, [mbOk], 0)
  end
  else
  Begin
    if CtrlDesfazAcerto.MessageInfo = EmptyStr then
       CtrlDesfazAcerto.MessageInfo := 'Processo encerrado com sucesso';

    MsgDlg(CtrlDesfazAcerto.MessageInfo, 'Informação', mtInformation, [mbOk], 0)
  end;
//Marcio Sanches Spinosa SOL 217767 KINTANA 2049332 - Inicio
//  if dtmBaseDados.dbBaseDados.InTransaction then
//   dtmBaseDados.dbBaseDados.Commit;
//Marcio Sanches Spinosa SOL 217767 KINTANA 2049332 - Fim

  bbtnConfirmar.enabled := True;
  bbtnCancelar.Enabled  := True;
end;

procedure TFrmDesfazAcertaValorMT.FormCreate(Sender: TObject);
begin
  udAcerto.Position  := StrToInt(FormatDateTime('YYYY', Date));
  inherited;
  CtrlDesfazAcerto := TCtrlDesfazAcerto.Create;
  CtrlDesfazAcerto.Initialize(DtmBaseDados.dbBaseDados,
                              True,
                              Sistema.ConnectionType,
                              Sistema.ConnectionSide,
                              Sistema.AppRemoteServer,
                              False,
                              nil);

  frameBenef.DefineLista(0);
end;

procedure TFrmDesfazAcertaValorMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlDesfazAcerto.Free;
end;

end.
