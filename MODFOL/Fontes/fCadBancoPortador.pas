unit fCadBancoPortador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, DBTables,
  Wwquery, Wwdatsrc, Mask, wwdbedit, Wwdotdot, Wwdbcomb,
  UMensErro, UDataBase, wwdblook;

type
  TfrmCadBancoPortador = class(TfrmOkCancelar)
    qryBanco: TwwQuery;
    dsBanco: TwwDataSource;
    updAux: TUpdateSQL;
    qryConsultaPortForma: TwwQuery;
    qryInsPortForma: TwwQuery;
    qryAux: TwwQuery;
    Bevel2: TBevel;
    Label1: TLabel;
    dblkPortadorPadrao: TwwDBLookupCombo;
    wwDBGrid1: TwwDBGrid;
    wwDBGrid2: TwwDBGrid;
    sbAssociaAg: TSpeedButton;
    sbDesassociaAg: TSpeedButton;
    Bevel1: TBevel;
    dbgdPortForma: TwwDBGrid;
    dsPortForma: TwwDataSource;
    qryPortForma: TwwQuery;
    updBancoPortForma: TUpdateSQL;
    dsPortBanco: TwwDataSource;
    qryPortBanco: TwwQuery;
    qryPortFormaPadrao: TwwQuery;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sbDesassociaAgClick(Sender: TObject);
    procedure sbAssociaAgClick(Sender: TObject);
  private
    procedure CarregaPortBanco;
  public
  end;

var
  frmCadBancoPortador: TfrmCadBancoPortador;

implementation

{$R *.DFM}

procedure TfrmCadBancoPortador.FormCreate(Sender: TObject);
begin
  inherited;
  qryBanco.Open;
  qryPortForma.Open;
  qryPortFormaPadrao.Open;
  CarregaPortBanco;
end;

procedure TfrmCadBancoPortador.FormDestroy(Sender: TObject);
begin
  qryBanco.CancelUpdates;
  qryPortBanco.CancelUpdates;
  qryBanco.Close;
  qryPortBanco.Close;
  qryPortForma.Close;
  qryPortFormaPadrao.Close;
  inherited;
end;

procedure TfrmCadBancoPortador.sbDesassociaAgClick(Sender: TObject);
begin
  inherited;
  with (qryBanco) do
  begin
    UpdateObject := updAux;
    Insert;
    FieldByName('IDPESSOA').asInteger := qryPortBanco.FieldByName('IDBANCO').asInteger;
    FieldByName('NOME').asString      := qryPortBanco.FieldByName('NOMEBANCO').asString;
    Post;
  end;
  qryPortBanco.Delete;
end;

procedure TfrmCadBancoPortador.sbAssociaAgClick(Sender: TObject);
begin
  inherited;
  with (qryPortBanco) do
  begin
    Insert;
    FieldByName('IDBANCOPORTFORMA').asFloat := LeUltRegistro(nil,'BANCOPORTFORMA');
    FieldByName('IDBANCO').asFloat          := qryBanco.FieldByName('IDPESSOA').asFloat;
    FieldByName('NOMEBANCO').asString       := qryBanco.FieldByName('NOME').asString;
    FieldByName('CODPORTFORMA').asInteger   := qryPortForma.FieldByName('CODPORTFORMA').asInteger;
    FieldByName('DESCRICAO').asString       := qryPortForma.FieldByName('DESCRICAO').asString;
    Post;
  end;
  qryBanco.UpdateObject := updAux;
  qryBanco.Delete;
end;

procedure TfrmCadBancoPortador.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  qryBanco.Open;
  qryPortForma.Open;
  qryPortFormaPadrao.Open;
  CarregaPortBanco;
end;

procedure TfrmCadBancoPortador.bbtnConfirmarClick(Sender: TObject);
var
  IdBancoPortForma, CodPortFormaPadrao: integer;
begin
  inherited;
  // Insere primeiro o Portador Forma Default
  with (qryAux) do
  begin
    CodPortFormaPadrao := qryPortFormaPadrao.FieldByName('CodPortForma').asInteger;
    Close;
    SQL.Clear;
    SQL.Add('SELECT IDBANCOPORTFORMA');
    SQL.Add('FROM   BANCOPORTFORMA');
    SQL.Add('WHERE  (IDBANCO IS NULL)');
    Open;
    if (EOF) then
    begin
      IdBancoPortForma := LeUltRegistro(nil,'BANCOPORTFORMA');
      qryInsPortForma.ParamByName('idbancoportforma').asInteger := IdBancoPortForma;
      qryInsPortForma.ParamByName('idbanco').Clear;
      qryInsPortForma.ParamByName('codportforma').asInteger := CodPortFormaPadrao;
      qryInsPortForma.ExecSql;
    end
    else
    begin
      IdBancoPortForma := FieldByName('IdBancoPortForma').asInteger;
      Close;
      SQL.Clear;
      SQL.Add('update BANCOPORTFORMA idbancoportforma');
      SQL.Add('set    codportforma     = '+IntToStr(CodPortFormaPadrao));
      SQL.Add('where  idbancoportforma = '+IntToStr(IdBancoPortForma));
      ExecSql;
    end;
  end;
  qryPortBanco.ApplyUpdates;
end;

procedure TfrmCadBancoPortador.CarregaPortBanco;
var
  CodPortFormaPadrao: integer;
begin
  qryBanco.CancelUpdates;
  with (qryPortBanco) do
  begin
    Close;
    Open;
  end;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT CODPORTFORMA FROM BANCOPORTFORMA');
  qryAux.SQL.Add('WHERE (IDBANCO IS NULL)');
  qryAux.Open;

  if not(QryAux.IsEmpty) then
  begin
    CodPortFormaPadrao := qryAux.FieldByName('CODPORTFORMA').asInteger;
    QryPortFormaPadrao.Locate('CODPORTFORMA', CodPortFormaPadrao, []);
    dblkPortadorPadrao.Text        := QryPortFormaPadrao.FieldByName('DESCRICAO').asString;
    dblkPortadorPadrao.LookupValue := InttoStr(qryAux.FieldByName('CODPORTFORMA').asInteger);
  end;
end;

end.
