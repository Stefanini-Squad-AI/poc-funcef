unit FAtualizaSequences;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, faMensagem, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, ComCtrls;

type
  TfrmAtualizaSequences = class(TfrmOkCancelarInv)
    fraMensAtuSeq: TfraMensagem;
    pnlProgTab: TPanel;
    prgProgTab: TProgressBar;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAtualizaSequences: TfrmAtualizaSequences;

implementation

uses UOperComum;

{$R *.DFM}

procedure TfrmAtualizaSequences.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  OperComum.AtualizaSequences(fraMensAtuSeq, prgProgTab);
end;

end.
