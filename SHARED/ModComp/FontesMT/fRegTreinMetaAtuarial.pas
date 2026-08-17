{--------------------------------------------------------------------------------------------------
Nº SOL......: 245977
Nº KINTANA..: 635853
Data........: 29/04/2015
Responsável.: Higor Nayde Ferreira
Descrição...: Ajuste na rotina de treinamento
--------------------------------------------------------------------------------------------------{--------------------------------------------------------------------------------------------------
Rotina......: Criação do Form
Nº SOL......: 177768
Nº KINTANA..: 1635450
Data........: 19/11/2012
Responsável.: Thiago Melo
Descrição...: Alteração na forma de Registro Individual de Treinamento.
--------------------------------------------------------------------------------------------------}

unit fRegTreinMetaAtuarial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FPai, StdCtrls, Buttons, IvDictio, IvMulti, IvEMulti, MAHlpBtn, uMensErro;

type
  TfrmRegTreinMetaAtuarial = class(TfrmPai)
    lbInfMetaAtuarial: TLabel;
    edtMetaAtuarial: TEdit;
    btnOK: TBitBtn;
    bbtnCancelar: TmaHelpBitBtn;
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    FResult: TModalResult;
    FMAtuarial: Double;
    { Private declarations }
  public
    { Public declarations }
    property Result : TModalResult read FResult;
    property MAtuarial : Double read FMAtuarial;                                    
  end;

var
  frmRegTreinMetaAtuarial: TfrmRegTreinMetaAtuarial;

implementation

{$R *.DFM}

procedure TfrmRegTreinMetaAtuarial.btnOKClick(Sender: TObject);
begin
  inherited;

  if Trim(edtMetaAtuarial.Text) <> '' then begin
    if Pos('.', edtMetaAtuarial.Text) > 0 then begin
      edtMetaAtuarial.Text := StringReplace(edtMetaAtuarial.Text, '.', ',', [rfReplaceAll]);
    end;
    if (StrToFloat(edtMetaAtuarial.Text) < 1) then begin
      MsgDlg('Favor preencher Meta Atuarial', 'Informação', mtError, [mbok], 0);
      Exit;
    end;
  end
  else begin
    MsgDlg('Favor preencher Meta Atuarial', 'Informação', mtError, [mbok], 0);
    Exit;
  end;

  FMAtuarial := StrToFloat(edtMetaAtuarial.Text);
  FResult    := MB_OK;
  Close;
end;

procedure TfrmRegTreinMetaAtuarial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if not FResult = MB_OK then begin
    FResult := mrCancel;
  end;
end;

procedure TfrmRegTreinMetaAtuarial.FormCreate(Sender: TObject);
begin
  inherited;
  FResult := -1;
end;

procedure TfrmRegTreinMetaAtuarial.bbtnCancelarClick(Sender: TObject);
begin
  inherited;//Higor Nayde Ferreira SOL 245977 PPM 635853
   FResult := mrCancel;
   Close;
   //Higor Nayde Ferreira SOL 245977 PPM 635853

end;

end.
