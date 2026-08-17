unit FCadEmprAdq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fPessoa, ExtDlgs, Pessoa, Db, IvDictio, IvMulti, IvEMulti, MontaSelect,
  DBTables, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, Buttons, TB97,
  StdCtrls, DBCtrls, checklst, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  ExtCtrls, TabControlDetalhe, Mask, wwdbedit,
  CMDBLookupCombo, CmEventosCadastro, ImgList, wwdbdatetimepicker,
  CMDateTimePicker, Wwdbspin, wwdblook, TREdit;

type
  TfrmCadEmprAdq = class(TfrmPessoa)
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadEmprAdq: TfrmCadEmprAdq;

implementation

{$R *.DFM}

procedure TfrmCadEmprAdq.FormShow(Sender: TObject);
begin
  inherited;
  //Self.WindowState := wsNormal;
  //Self.Width := 710;
  //Self.Height := 480;
end;

end.
