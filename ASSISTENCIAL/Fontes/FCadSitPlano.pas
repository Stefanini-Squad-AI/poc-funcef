unit FCadSitPlano;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGrid, cmseldlg, wwidlg, Db, Wwdatsrc, TB97, MAHlpBtn, DBCtrls,
  StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, DBTables, Wwquery,
  Mask, wwdbedit, TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  CmEventosCadastro, wwDialog, ImgList;
/////////////////////////////////////////
//ATENÇÃO: objeto DBNAV... fora da tela//
/////////////////////////////////////////
type
  TfrmCadSitPlano = class(TfrmCadastroGrid)
    qry: TwwQuery;
    Label3: TLabel;
    dbedDescricao: TwwDBEdit;
    Label1: TLabel;
    cbFlgInterno: TComboBox;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    qryAux: TwwQuery;
    procedure dsStateChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure qryBeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
   
  private
    { Private declarations }
    EstadoAnt : TDataSetState;
  public
    { Public declarations }
  end;

var
  frmCadSitPlano: TfrmCadSitPlano;

implementation

uses
    UDataBase, UMensErro, USistema;

{$R *.DFM}



procedure TfrmCadSitPlano.FormCreate(Sender: TObject);
begin
  inherited;
  qry.close;
  qry.sql.Clear;
  qry.SQL.Add('SELECT IDSITPLANOASS,DESCRICAO,FLGINTERNO '+
                'FROM '+sistema.PrefixoServidor+'SITPLANOASS '+
               'ORDER BY DESCRICAO');
  qry.open;
end;

procedure TfrmCadSitPlano.dsStateChange(Sender: TObject);
begin
  inherited;
  if ds.DataSet.State in [dsEdit, dsInsert] then
    dbedDescricao.SetFocus;
end;

procedure TfrmCadSitPlano.bbtnConfirmarClick(Sender: TObject);
var sFlag : string;
begin
  if Trim(dbedDescricao.Text) = '' then
  begin
    MsgDlg('Descrição não preenchida', 'Erro', mtError, [mbOk,mbHelp], 0);
    dbedDescricao.SetFocus;
    Exit;
  end;

  case cbFlgInterno.ItemIndex of
    0: sFlag := 'NO';
    1: sFlag := 'CA';
    2: sFlag := 'CI';
    3: sFlag := 'IN';
    4: sFlag := 'TR';
  end;
  qry.FieldByName('FLGINTERNO').AsString := sFlag;

  inherited;

  cbFlgInterno.Text := '';
end;

procedure TfrmCadSitPlano.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  cbFlgInterno.Text := '';
end;

procedure TfrmCadSitPlano.sbtnAlterarClick(Sender: TObject);
begin
  inherited;

  if qry.FieldByName('FLGINTERNO').AsString = 'NO' then
     cbFlgInterno.ItemIndex := 0
  else
    if qry.FieldByName('FLGINTERNO').AsString = 'CA' then
       cbFlgInterno.ItemIndex := 1
    else
      if qry.FieldByName('FLGINTERNO').AsString = 'CI' then
         cbFlgInterno.ItemIndex := 2
      else
        if qry.FieldByName('FLGINTERNO').AsString = 'IN' then
           cbFlgInterno.ItemIndex := 3
        else
          if qry.FieldByName('FLGINTERNO').AsString = 'TR' then
             cbFlgInterno.ItemIndex := 4;
end;

procedure TfrmCadSitPlano.qryBeforePost(DataSet: TDataSet);
var idSit : integer;
begin
  inherited;
  EstadoAnt := qry.State;
  if qry.State in [dsinsert] then
  begin
    qryaux.close;
    qryaux.sql.Clear;
    qryaux.SQL.Add('SELECT IDSITPLANOASS FROM SITPLANOASS WHERE IDSITPLANOASS = :IDSIT');
    repeat
      idSit := LeUltRegistro(qryAux, 'SITPLANOASS');
      qryAux.close;
      qryAux.ParamByName('IDSIT').Value := idSit;
      qryAux.open;
    until qryaux.IsEmpty;
    qry.FieldByName('IDSITPLANOASS').AsInteger := idSit;
    qryAux.close;
  end;
end;

procedure TfrmCadSitPlano.FormActivate(Sender: TObject);
begin
  inherited;
  if not qry.Active then
    qry.Open;
end;

procedure TfrmCadSitPlano.sbtnApagarClick(Sender: TObject);
var sFlag : string;
begin
  sFlag := qry.FieldByName('FLGINTERNO').AsString;

  qryAux.close;
  qryAux.sql.clear;
  qryAux.sql.add('SELECT COUNT(*) CONTA FROM SITPLANOASS'+
                ' WHERE (FLGINTERNO = ''' + sFlag + ''')');
  try
    qryAux.open;
    if qryAux.FieldByName('CONTA').AsInteger = 1 then
    begin
      qryAux.close;
      MsgDlg('Não é possível excluir, pois este é o único registro da situação '''
             + qry.FieldByName('DESCRICAO').AsString + ''' !', 'Erro', mtError,
             [mbOk,mbHelp], 0);
      exit;
    end;
  except
     on E: EDBEngineError do begin
        MostrarErro(E);
        Exit;
     end;
  end;
  qryaux.close;

  inherited;

  cbFlgInterno.Text := '';
end;

end.
