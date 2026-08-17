unit cRelatorio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, fcCombo, fcColorCombo;

type
  TcfgRelatorio = class(TfrmOkCancelar)
    pnlVisaoRel: TPanel;
    cboCorLinha: TfcColorCombo;
    ckbImpLinhas: TCheckBox;
    Label1: TLabel;


  private { Private declarations }


  public  { Public declarations }


  end;




var
  cfgRelatorio: TcfgRelatorio;




implementation
{$R *.DFM}



end.
