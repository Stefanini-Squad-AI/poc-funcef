unit FOrdenaFluxo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Grids, Wwdbigrd,
  Wwdbgrid, Db, DBTables, Wwquery, Wwdatsrc, TB97Tlbr, IvDictio, IvMulti,
  IvEMulti;

type
  TfrmOrdenaFluxo = class(TfrmSairAjuda)
    dbgTiposSel: TwwDBGrid;
    pnlTituloP: TPanel;
    lblTituloP: TLabel;
    dsLinhasFlu: TwwDataSource;
    qryLinhasFlu: TwwQuery;
    bbtnDescer: TBitBtn;
    bbtnSubir: TBitBtn;
    updLinhasFlu: TUpdateSQL;
    procedure FormActivate(Sender: TObject);
    procedure bbtnSubirClick(Sender: TObject);
    procedure bbtnDescerClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOrdenaFluxo: TfrmOrdenaFluxo;
  idOrdemAtu,idOrdemAtu1:Integer;
  idOrdemInd,idOrdemInd1:Integer;
implementation

{$R *.DFM}

uses uMensErro,uDataBase, DBaseDados,UAutorizacao,uSistema,uFuncaoGeral;

procedure TfrmOrdenaFluxo.FormActivate(Sender: TObject);
begin
  inherited;
  //
  qryLinhasFlu.Close;
  qryLinhasFlu.SQL.Clear;
  qryLinhasFlu.SQL.text := 'SELECT CODLINHAFLUXO,ORDEM,DESCRICAO FROM '+Sistema.PrefixoServidor+'MONTAFLUXO WHERE IDPESSOA = '+INTTOSTR(Sistema.IdEmpresa)+' ORDER BY ORDEM';
  qryLinhasFlu.Open;
  //
end;

procedure TfrmOrdenaFluxo.bbtnSubirClick(Sender: TObject);
begin
  inherited;
  idOrdemAtu:=qryLinhasFlu.FieldByName('ORDEM').AsInteger;
  qryLinhasFlu.Prior;
  if (not qryLinhasFlu.BOF) then
  Begin
     idOrdemAtu1:=qryLinhasFlu.FieldByName('ORDEM').AsInteger;
     //
     //
     qryLinhasFlu.Edit;
     qryLinhasFlu.FieldByName('ORDEM').AsInteger:=idOrdemAtu;
     qryLinhasFlu.Post;
     //
     qryLinhasFlu.Next;
     //
     qryLinhasFlu.Edit;
     qryLinhasFlu.FieldByName('ORDEM').AsInteger:=idOrdemAtu1;
     qryLinhasFlu.Post;
     //
     dtmBaseDados.DbBaseDados.ApplyUpdates([qryLinhasFlu]);
     qryLinhasFlu.Close;
     qryLinhasFlu.Open;
     qryLinhasFlu.Locate('ORDEM',idOrdemAtu1,[loCaseInsensitive]);
  end;
end;

procedure TfrmOrdenaFluxo.bbtnDescerClick(Sender: TObject);
begin
  inherited;
  idOrdemAtu:=qryLinhasFlu.FieldByName('ORDEM').AsInteger;
  qryLinhasFlu.Next;
  if (not qryLinhasFlu.Eof) then
  Begin
     idOrdemAtu1:=qryLinhasFlu.FieldByName('ORDEM').AsInteger;
     //
     qryLinhasFlu.Edit;
     qryLinhasFlu.FieldByName('ORDEM').AsInteger:=idOrdemAtu;
     qryLinhasFlu.Post;
     //
     qryLinhasFlu.Prior;
     //
     qryLinhasFlu.Edit;
     qryLinhasFlu.FieldByName('ORDEM').AsInteger:=idOrdemAtu1;
     qryLinhasFlu.Post;
     //
     //
     dtmBaseDados.DbBaseDados.ApplyUpdates([qryLinhasFlu]);
     qryLinhasFlu.Close;
     qryLinhasFlu.Open;
     qryLinhasFlu.Locate('ORDEM',idOrdemAtu1,[loCaseInsensitive]);
  end;
end;

end.
