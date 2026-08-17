//***************************************************************************************
//N. SIG.............: 72274
//Data da Alteração..: 21/01/2019
//Alteração Form.....: FCadContaContabilBaseCalc
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Criação de estrutura para caracterização da base de cálculo para as
//                     contas contábeis nas linhas da EFD-Contribuição.   
//***************************************************************************************
unit FCadContaContabilBaseCalc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, ExtCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, uCmTypes,uMensErro, Mask, wwdbedit, wwdblook;

type
  TfrmCadContaContabilBaseCalc = class(TfrmOkCancelar)
    rgBaseCalculo: TRadioGroup;
    lblCodAjuste: TLabel;
    lblDescrAjuste: TLabel;
    lblNumProcesso: TLabel;
    lblInfo: TLabel;
    mmoInfo: TMemo;
    edtIdentAjuste: TEdit;
    edtNumProcAjuste: TEdit;
    cbbCodAjuste: TComboBox;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function ValidaSelecao : boolean;
  public
    { Public declarations }
    sCodAjuste, sNumProcesso, sInfoAjuste, sIdentAjuste : string;
    iBaseCalc: integer;
  end;

var
  frmCadContaContabilBaseCalc: TfrmCadContaContabilBaseCalc;

implementation

{$R *.DFM}

procedure TfrmCadContaContabilBaseCalc.bbtnConfirmarClick(Sender: TObject);
begin
  if ValidaSelecao() then
  begin
    iBaseCalc := rgBaseCalculo.ItemIndex;
    sCodAjuste := Copy(cbbCodAjuste.Items.Text, 1, 2);
    sNumProcesso := edtNumProcAjuste.Text;
    sIdentAjuste := edtIdentAjuste.Text;
    sInfoAjuste := mmoInfo.Text;
    self.ModalResult := mrOk;
  end;
end;

procedure TfrmCadContaContabilBaseCalc.FormCreate(Sender: TObject);
begin
  inherited;
  iBaseCalc := 0;
end;

function TfrmCadContaContabilBaseCalc.ValidaSelecao: boolean;
begin
  bbtnConfirmar.ModalResult := mrOk;
  
  if rgBaseCalculo.ItemIndex = -1 then
  begin
    MsgDlg(Format('Selecione uma forma de Base de Cálculo', ['Seleção de Base de Cálculo']), 'Erro', mtError, [mbOK], 0);
    Result := False;
  end
  else
  begin
    bbtnConfirmar.ModalResult := mrOk;
    Result := True;
  end;
end;

end.
