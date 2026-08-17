unit FExecRecomposicaoLancCart;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, ExtCtrls, ComCtrls;

type
  TfrmRecomposicaoLancCart = class(TFrmOkCancelarImob)
    Panel2: TPanel;
    lblProgress: TLabel;
    lblContador: TLabel;
    ProgressBar: TProgressBar;
    Label13: TLabel;
    Label14: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;

  private { Private declarations }

  public { Public declarations }

  end;



var
  frmRecomposicaoLancCart: TfrmRecomposicaoLancCart;



implementation
{$R *.DFM}



end.
