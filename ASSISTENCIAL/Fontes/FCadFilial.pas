unit FCadFilial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fPessoa, Db, ExtDlgs, Pessoa, Menus, MontaSelect, DBTables, Wwdatsrc,
  Wwquery, TB97, MAHlpBtn, Buttons, Grids, Wwdbigrd, Wwdbgrid, StdCtrls,
  checklst, DBCtrls,ExtCtrls, TabControlDetalhe,
  wwdblook, Mask, wwdbedit, TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  CMDBLookupCombo, CmEventosCadastro, ImgList, ComCtrls,
  wwdbdatetimepicker, CMDateTimePicker, Wwdbspin, TREdit;

type
  TfrmCadFilial = class(TfrmPessoa)
    qrySubTipoIDFILIALPESSOA: TFloatField;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFilial: TfrmCadFilial;

implementation

uses UMensErro, FTelaAut;

{$R *.DFM}

procedure TfrmCadFilial.bbtnConfirmarClick(Sender: TObject);
begin
{if dblkGrupo.text = '' then
begin
   MsgDlg('É preciso selecionar o grupo.','Informação',mtinformation,[mbOk],0);
   Exit;
end;}

  inherited;

end;

end.
