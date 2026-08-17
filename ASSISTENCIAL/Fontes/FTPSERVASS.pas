unit FTpServAss;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGrid, StdCtrls, Mask, DBCtrls, cmseldlg, wwidlg, Db, Wwdatsrc,
  MAHlpBtn, Buttons, ComCtrls, ToolWin, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, DBTables, Wwquery, TB97, TB97Ctls, TB97Tlbr,
  IvDictio, IvMulti, IvEMulti, CmEventosCadastro, wwDialog, ImgList;
/////////////////////////////////////////
//ATENÇÃO: objeto DBNAV... fora da tela//
/////////////////////////////////////////
type
  TfrmTipoServAss = class(TfrmCadastroGrid)
    DBEdit2: TDBEdit;
    Label1: TLabel;
    qry: TwwQuery;
    qryAux: TwwQuery;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    procedure qryAfterInsert(DataSet: TDataSet);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTipoServAss: TfrmTipoServAss;

implementation

uses UDataBase, UMensErro,UModulo, USistema;

{$R *.DFM}

procedure TfrmTipoServAss.qryAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qry.FieldByName('IdServass').AsInteger := LeUltRegistro(qryAux,'TPSERVASS');
end;

procedure TfrmTipoServAss.sbtnApagarClick(Sender: TObject);
begin
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT IDPLANASS FROM  SERVPLANASS'+
                 ' WHERE (IDSERVASS ='+qry.FieldByName('IDSERVASS').AsString+')');
  try
    qryAux.open;
  except
    on E: EDBEngineError do
    begin
      MostrarErro(E);
      exit;
    end;
  end;
  if not qryAux.isempty then
  begin
    showmessage('O serviço não pode ser apagado por ter planos ligados a ele !!');
    sbtnApagar.down := false;
    exit;
  end;
  inherited;
end;

procedure TfrmTipoServAss.bbtnSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmTipoServAss.bbtnConfirmarClick(Sender: TObject);
begin
  if ds.dataset.state <> dsbrowse then
  begin
    if DBEdit2.text = '' then
    begin
      showmessage('É preciso digitar o nome do serviço !');
      exit;
    end;
  end;
  inherited;
end;

procedure TfrmTipoServAss.FormShow(Sender: TObject);
begin
  inherited;
  sbtnAlterar.enabled := ((ds.dataset.active) and (not ds.dataset.isempty));
  sbtnApagar.enabled := ((ds.dataset.active) and (not ds.dataset.isempty));
end;

procedure TfrmTipoServAss.FormCreate(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add('SELECT IDSERVASS, NOME'+
               ' FROM '+Sistema.PrefixoServidor+'TPSERVASS'+
              ' ORDER BY NOME');
  qry.Open;
end;

procedure TfrmTipoServAss.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qry.Close;
end;


end.
