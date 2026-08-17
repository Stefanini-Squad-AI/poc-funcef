unit FCadFilial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fPessoa, Db, ExtDlgs, Pessoa, Menus, MontaSelect, DBTables, Wwdatsrc,
  Wwquery, TB97, MAHlpBtn, Buttons, Grids, Wwdbigrd, Wwdbgrid, StdCtrls,
  checklst, DBCtrls, ExtCtrls, TabControlDetalhe,
  wwdblook, Mask, wwdbedit, TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  CMDBLookupCombo, Wwdbspin, CmEventosCadastro, ImgList, ComCtrls,
  wwdbdatetimepicker, CMDateTimePicker, TREdit;

type
  TfrmCadFilial = class(TfrmPessoa)
    tbshSegmento: TTabSheet;
    dblcRamo: TwwDBLookupCombo;
    qryRamo: TwwQuery;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFilial: TfrmCadFilial;

implementation

uses uMensErro, fTelaAut, UsoGeralRH;

{$R *.DFM}

procedure TfrmCadFilial.FormCreate(Sender: TObject);
begin
  inherited;
  if (sUsuXfilial <> '') then
    MontaSelect.Filtro.Add('FILIALPESSOA.IDFILIALPESSOA IN ' + sUsuXfilial);

  qryRamo.Open;
end;

procedure TfrmCadFilial.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryRamo.Close;
  inherited;
end;

procedure TfrmCadFilial.bbtnConfirmarClick(Sender: TObject);
begin
  if (Trim(edDBGrupo.Text) = '') then
  begin
    MsgDlg('Indicar a que Empresa/Grupo/Estab. Pertence !','Informação',mtinformation,[mbOk],0);
    exit;
  end;
  inherited;
end;

end.
