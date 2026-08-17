// Alterações:

//--------------------------------------------------------------------------------
//Nº SOL.............: 258351/18139
//Nº PPM.............: 1315865
//Data da Alteração..: 21/03/2016
//Alteração Form.....: .
//Responsável........: Felipe A. Santos
//Descrição..........: Criação da Janela.
//--------------------------------------------------------------------------------

unit FJustificativaNup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls;

type
  TfrmJustificativa = class(TfrmOkCancelar)
    mmoJustificativa: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    function GetMemoText: string;
    { Private declarations }
  public
    property MemoText : string read GetMemoText;
    { Public declarations }
  end;

var
  frmJustificativa: TfrmJustificativa;

implementation

uses UMensErro;

{$R *.DFM}

{ TfrmJustificativa }

function TfrmJustificativa.GetMemoText: string;
begin
   Result := mmoJustificativa.Text;
end;

procedure TfrmJustificativa.FormCreate(Sender: TObject);
begin
  inherited;
  mmoJustificativa.Clear;
  
end;

procedure TfrmJustificativa.FormShow(Sender: TObject);
begin
  inherited;
  if (mmoJustificativa.CanFocus) then mmoJustificativa.SetFocus;
end;

procedure TfrmJustificativa.bbtnConfirmarClick(Sender: TObject);
begin
  if (Trim(mmoJustificativa.Text) = '') then
  begin
    MsgDlg('Preencha a Justificativa', 'Aviso', mtWarning, [mbOk], 0);
    ModalResult := mrNone;
    Exit;
  end;

  inherited;

end;

end.
