unit FSelEstDistr2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSelProcesso, DBTables, Wwquery, Db, Wwtable, Wwdatsrc, MAHlpBtn,
  StdCtrls, TEdNum, Spin, wwdblook, ExtCtrls, TB97,
  IvDictio, IvMulti, IvEMulti, TB97Tlbr, ComCtrls, Buttons, CheckLst,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmSelEstDistr2 = class(TfrmSelProcesso)
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelEstDistr2: TfrmSelEstDistr2;

implementation

uses FEstDistr, FTelaAut, uMensErro;

{$R *.DFM}

procedure TfrmSelEstDistr2.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if (qryProcesso.IsEmpty) then
  begin
    MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
    exit;
  end;

  ModalResult := mrNone;
  AbrirForm{Modal}(frmEstDistr, TfrmEstDistr, False);
  //frmEstObjeto.Free;
end;

end.
