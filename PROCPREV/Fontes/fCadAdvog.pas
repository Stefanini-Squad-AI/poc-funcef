unit FCadAdvog;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fPessoa, Db, Pessoa, Menus, MontaSelect, DBTables, Wwquery, Wwdatsrc,
  TB97, MAHlpBtn, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, checklst,
  DBCtrls, TabControlDetalhe, wwdblook, Mask, wwdbedit,
  ExtCtrls, ExtDlgs, TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  CMDBLookupCombo, Wwdbspin, CmEventosCadastro, ImgList, ComCtrls,
  wwdbdatetimepicker, CMDateTimePicker, TREdit;

type
  TfrmCadAdvog = class(TfrmPessoa)
    procedure FormShow(Sender: TObject);
    procedure qrySubTipoAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadAdvog: TfrmCadAdvog;

implementation

{$R *.DFM}

procedure TfrmCadAdvog.FormShow(Sender: TObject);
begin
  inherited;
  //Self.WindowState := wsNormal;
  //Self.Width := 710;
  //Self.Height := 480;
end;

procedure TfrmCadAdvog.qrySubTipoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qrySubTipo.FieldByName('FLGASS').Value := 0;
end;

end.
