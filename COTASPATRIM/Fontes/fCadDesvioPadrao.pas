unit fCadDesvioPadrao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, ExtCtrls;

type
  TfrmDesvioPadrao = class(TfrmOkCancelar)
    ComboBox1: TComboBox;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    ComboBox2: TComboBox;
    Label3: TLabel;
    ComboBox4: TComboBox;
    Edit3: TEdit;
    Label4: TLabel;
    CheckBox3: TCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDesvioPadrao: TfrmDesvioPadrao;

implementation

{$R *.DFM}

end.
