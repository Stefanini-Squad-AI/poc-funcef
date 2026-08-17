unit FConfAltCont;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls;

type
  TFrmConfAltCont = class(TfrmOkCancelar)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblContaOri: TLabel;
    lblNomeOri: TLabel;
    lblContaDest: TLabel;
    lblNomeDest: TLabel;
    Label4: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfAltCont: TFrmConfAltCont;

implementation

{$R *.DFM}

end.
