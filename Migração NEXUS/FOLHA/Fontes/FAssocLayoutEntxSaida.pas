unit FAssocLayoutEntxSaida;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Mask, DBCtrls, wwdblook, dBaseDados, uSistema;

type
  TfrmAssocLayoutEntxsaida = class(TfrmCadastroCS)
    updEntradaxSaida: TUpdateSQL;
    lblDescricaoLayout: TLabel;
    lblLayoutSaida: TLabel;
    edtNomeArq: TEdit;
    lblNomeArq: TLabel;
    Bevel1: TBevel;
    qryLayoutSaida: TwwQuery;
    dblkLayoutSaida: TwwDBLookupCombo;
    qryLayout: TQuery;
    edtdescLayoutEntrada: TEdit;
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure qryAfterPost(DataSet: TDataSet);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure qryAfterDelete(DataSet: TDataSet);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
   private
    { Private declarations }
    iIdLayoutEnt : Integer;
    ChOp : Char;
  public
    { Public declarations }
  end;

var
  frmAssocLayoutEntxsaida: TfrmAssocLayoutEntxsaida;

implementation

Uses uMensErro;

{$R *.DFM}

procedure TfrmAssocLayoutEntxsaida.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
  Begin
    iIdLayoutEnt := StrToInt(MontaSelect.ValoresChave[0]);
    qry.Close;
    qry.ParamByName('IDLAYOUTENT').AsInteger := iIdLayoutEnt;
    qry.Open;
    qryLayout.Close;
    qryLayout.ParamByName('IDLAYOUT').AsInteger := iIdLayoutEnt;
    qryLayout.Open;
    edtdescLayoutEntrada.text := qrylayout.fieldbyname('DESCRICAO').asstring;
    edtNomearq.text := qry.FieldByName('NOMEARQ').AsString;
  End;
end;

procedure TfrmAssocLayoutEntxsaida.FormShow(Sender: TObject);
begin
  inherited;
  qry.Open;
  qryLayoutSaida.Open;
  sbtnInserir.Enabled := False;
end;

procedure TfrmAssocLayoutEntxsaida.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryLayoutSaida.Close;
end;

procedure TfrmAssocLayoutEntxsaida.CmeCadastroConfirma(Sender: TObject);
begin
    Case ChOp Of
    'I' : qry.Insert;
    'A' : qry.Edit;
  End;
  If qry.State In [dsInsert, dsEdit] Then
  Begin
    If dblkLayoutSaida.Text = '' Then
    Begin
      MsgDlg('Por Favor, escolha o layout de saída.', 'Informação', mtInformation,
             [mbOK], 0);
      Exit;
    End;
    If Trim(edtNomeArq.Text) = '' Then
    Begin
      MsgDlg('Por Favor digite o nome do arquivo. Atenção, basta '+#13+
             'digitar o nome do arquivo e não o caminho inteiro. ', 'Informação',
             mtInformation, [mbOK], 0);
      Exit;
    End;
    qry.FieldByName('IDLAYOUTENT').AsInteger   := iIdLayoutEnt;
    qry.FieldByName('IDLAYOUTSAIDA').AsInteger := StrToInt(dblkLayoutSaida.LookupValue);
    qry.FieldByName('NOMEARQ').AsString        := edtNomeArq.Text;
  End;
  inherited;
//  bbtnCancelarDetClick(Self);
end;

procedure TfrmAssocLayoutEntxsaida.sbtnInserirClick(Sender: TObject);
begin
  dblkLayoutSaida.Clear;
  edtNomeArq.Clear;
  inherited;
  ChOp := 'I';
  dblkLayoutSaida.DataSource := Nil;
  dblkLayoutSaida.DataField  := '';
end;

procedure TfrmAssocLayoutEntxsaida.bbtnConfirmarClick(Sender: TObject);
begin
  If chop = 'I' then Cmecadastro.RepetirInsert := False;
  inherited;
  if not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;

  if not Sistema.GravaLogOperacoes('Associação de Layout de Entrada por Layout de Saida.') then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;
  If chop = 'I' then
  begin
       qry.Close;
       qry.ParamByName('IDLAYOUTENT').AsInteger := iIdLayoutEnt;
       qry.Open;
  end;
end;

procedure TfrmAssocLayoutEntxsaida.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.ParamByName('IDLAYOUTENT').AsInteger := iIdLayoutEnt;
  qry.Open;
end;

procedure TfrmAssocLayoutEntxsaida.qryAfterPost(DataSet: TDataSet);
begin
  inherited;
  qry.ApplyUpdates;
  qry.CommitUpdates;
end;

procedure TfrmAssocLayoutEntxsaida.CmeCadastroDelete(Sender: TObject);
begin
  ChOp := 'E';
  inherited;
  qry.ApplyUpdates;
  qry.CommitUpdates;
end;

procedure TfrmAssocLayoutEntxsaida.qryAfterDelete(DataSet: TDataSet);
begin
  inherited;
  qry.ApplyUpdates;
  qry.CommitUpdates;
end;

procedure TfrmAssocLayoutEntxsaida.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  ChOp := 'A';
  dblkLayoutSaida.DataSource := ds;
  dblkLayoutSaida.DataField  := 'IDLAYOUTSAIDA';
  edtNomeArq.Text            := qry.FieldByName('NOMEARQ').AsString;
end;

procedure TfrmAssocLayoutEntxsaida.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  edtNomeArq.Text            := qry.FieldByName('NOMEARQ').AsString;
end;

procedure TfrmAssocLayoutEntxsaida.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  edtNomeArq.Text := ''
end;

end.
