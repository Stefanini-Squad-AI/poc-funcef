unit fListaValores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Grids, Wwdbigrd, Wwdbgrid, Db, Wwdatsrc, DBTables, Wwquery,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, fCadRegra, DBCtrls;

type
  TfrmListaValores = class(TfrmOkCancelar)
    Qry: TwwQuery;
    QryLista: TwwQuery;
    dsLista: TwwDataSource;
    dblkpVariaveis: TDBLookupListBox;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListaValores: TfrmListaValores;

implementation

uses fAguarde;

{$R *.DFM}

procedure TfrmListaValores.FormShow(Sender: TObject);
var
   vSql : String;
begin
  inherited;
  frmAguarde.Mostra('Selecionando dados ...');
  frmAguarde.Refresh;
  with Qry do begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT ENTIDADE, NOMEDOCAMPO FROM CMPBD WHERE (CAMPODOBANCO = 1) AND ');
       Sql.Add('(UPPER(ENTIDADE) <> ''DUAL'') AND (IDCAMPO = '''+vCampoAux+''') ORDER BY ');
       Sql.Add('ENTIDADE, NOMEDOCAMPO');
       Open;
  end;
  vCampoAux := '';
  if not Qry.IsEmpty then begin
     with QryLista do begin
          dblkpVariaveis.KeyField := Qry.FieldbyName('NOMEDOCAMPO').AsString;
          dblkpVariaveis.ListField := Qry.FieldbyName('NOMEDOCAMPO').AsString;
          Close;
          Sql.Clear;
          vSql := 'SELECT DISTINCT '+Qry.FieldbyName('NOMEDOCAMPO').AsString+' FROM '+
                  Qry.FieldbyName('ENTIDADE').AsString+' ORDER BY '+
                  Qry.FieldbyName('NOMEDOCAMPO').AsString;
          Sql.Add(vSql);
          Open;
     end;
  end;
  frmAguarde.Apaga;
end;

procedure TfrmListaValores.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  vCampoAux := dblkpVariaveis.SelectedItem;
end;

procedure TfrmListaValores.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  vCampoAux := '';
end;

end.
