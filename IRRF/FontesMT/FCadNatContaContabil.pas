unit FCadNatContaContabil;

//*******************************************************************************************************
//Responsável.....: Edilaine Ferraresi
//Data............: 26/08/2013
//N. Kintana......: 2051763
//N. Sol..........: 155850-15363
//Descrição.......: Inclusão da Funcionalidade SPED
//**********************************************************************************************************}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, ExtCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, uCmTypes,uMensErro;

type
  TfrmCadNatContaContabil = class(TfrmOkCancelar)
    rgNatureza: TRadioGroup;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function ValidaSelecao : boolean;
  public
    { Public declarations }
    sNatureza, sTipo : string;
  end;

var
  frmCadNatContaContabil: TfrmCadNatContaContabil;

implementation

{$R *.DFM}

procedure TfrmCadNatContaContabil.bbtnConfirmarClick(Sender: TObject);
begin
  if ValidaSelecao() then
  begin
    sNatureza := rgNatureza.Items.Strings[rgNatureza.ItemIndex];
    sTipo     := copy(rgNatureza.Items.Strings[rgNatureza.ItemIndex], 1,1);
    self.ModalResult := mrOk;
  end;
end;

procedure TfrmCadNatContaContabil.FormCreate(Sender: TObject);
begin
  inherited;

  sNatureza := '';
  sTipo     := '';
end;

function TfrmCadNatContaContabil.ValidaSelecao: boolean;
begin                        bbtnConfirmar.ModalResult := mrOk;

  if rgNatureza.ItemIndex = -1 then
  begin
    MsgDlg(Format('Selecione uma Natureza', ['Seleção da Natureza']), 'Erro', mtError, [mbOK], 0);
    result := false;
  end
  else
  begin
    bbtnConfirmar.ModalResult := mrOk;
    result := true;
  end;
end;

end.
