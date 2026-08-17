{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 24872
Responsável : Daniel Simões
Data        : 16/08/2007
Descrição   : Mudança na Origem do Lançamento de 'Lançamento Individual' para
              'Lançamentos em Lote' ( L ) ...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit mOrigemLanc;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, wwdbedit, Wwdotdot, Wwdbcomb;

type
  TmolOrigemLanc = class(TFrame)
    cboOrigemLanc: TwwDBComboBox;
    Label1: TLabel;


  private { Private declarations }

  public { Public declarations }

  end;



implementation
{$R *.DFM}



end.
