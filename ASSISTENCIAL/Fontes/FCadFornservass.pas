unit FCadFornservass;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fPessoa, Menus, MontaSelect, DBTables, Db, Wwquery, Wwdatsrc, Pessoa,
  TB97, MAHlpBtn, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, checklst,
  ComCtrls, TabControlDetalhe, wwdblook, DBCtrls, Mask, wwdbedit,  ExtDlgs, TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  CMDBLookupCombo, CmEventosCadastro, ImgList, wwdbdatetimepicker,
  CMDateTimePicker, Wwdbspin, ExtCtrls, TREdit;

type
  TfrmCadFornservass = class(TfrmPessoa)
    procedure qrySubTipoBeforePost(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFornservass: TfrmCadFornservass;

implementation

{$R *.DFM}

procedure TfrmCadFornservass.qrySubTipoBeforePost(DataSet: TDataSet);
begin
  inherited;
  // qrysubtipo.fieldbyname('flgass').AsInteger := 1;
end;

procedure TfrmCadFornservass.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  sbtnFisJur.enabled := false;
end;

procedure TfrmCadFornservass.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  sbtnFisJur.enabled := false;
end;

procedure TfrmCadFornservass.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  sbtnFisJur.enabled := true;
end;

procedure TfrmCadFornservass.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  sbtnFisJur.enabled := false;
end;

end.
