unit FLerTempoServico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TEdNum;

type
  TfrmLerTempoServico = class(TfrmOkCancelar)
    pnlTempoServTotal: TPanel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    edTempoServTotal: TEditNum;
    edTempoServMes: TEditNum;
    edTempoServDia: TEditNum;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLerTempoServico: TfrmLerTempoServico;

implementation

{$R *.DFM} 

procedure TfrmLerTempoServico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 // inherited;
  Action := caHide;
end;

end.
