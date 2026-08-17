unit FAlteraSalario;

// Alterações:
{
-------------------------------------------------------------------------------
Nº SIG.....: 41789
Data.......: 20/03/2018
Responsável: Taffarel Sevaybriker
Descrição..: Criação do fonte para reajuste de salário de manutenção.
-------------------------------------------------------------------------------
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FTelaAut, IvDictio, IvMulti, IvEMulti, TREdit, Buttons;

type
  TFrmAlteraSalario = class(TfrmTelaAutorizacao)
    GroupBox1: TGroupBox;
    lblMatricula: TLabel;
    lblSalario: TLabel;
    edtSalario: TRealEdit;
    btnAlteraSalario: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAlteraSalario: TFrmAlteraSalario;

implementation

{$R *.DFM}

end.
