unit FCadTipoContrib;

//------------------------------------------------------------------------------
// Autor(a)   : Edilaine Ferraresi
// Data       : 29/12/2016
// SIG        : 36752
// Descricao  : Equacionamento - inclusao do cadastro do tipo de contribuicao
//------------------------------------------------------------------------------


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, StdCtrls, DBCtrls, Mask, wwdbedit, Db, DBTables, Wwquery,
  CmEventosCadastro, ImgList, MontaSelect, Wwdatsrc, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls;

type
  TfrmCadTipoContrib = class(TfrmCadastroCS)
    qryAux: TwwQuery;
    lblCodigo: TLabel;
    dbedtCodigo: TwwDBEdit;
    lblTipoContrib: TLabel;
    dbedtTipoContrib: TwwDBEdit;
    dbchkDeficit: TDBCheckBox;
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure qryAfterInsert(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure qryBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    iIdTipoContrib : integer;
    function  TipoContribuicaoEmUso : boolean;

  public
    { Public declarations }
  end;

var
  frmCadTipoContrib: TfrmCadTipoContrib;

implementation

uses
    UDataBase, UMensErro, USistema;

{$R *.DFM}

procedure TfrmCadTipoContrib.FormShow(Sender: TObject);
begin
  inherited;

  iIdTipoContrib := -1;

  qry.Close;
  qry.ParambyName('pIDTPCONTRIBUICAO').AsInteger := -1;
  qry.Open;

  dbchkDeficit.checked := false;
end;

procedure TfrmCadTipoContrib.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbedtTipoContrib.SetFocus;
end;

procedure TfrmCadTipoContrib.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (not MontaSelect.RetornouValor) or (MontaSelect.ValoresChave[0] = '') then Exit;

  iIdTipoContrib := StrToInt(MontaSelect.ValoresChave[0]);

  qry.Close;
  qry.ParambyName('pIDTPCONTRIBUICAO').AsInteger := iIdTipoContrib;
  qry.Open;
end;

procedure TfrmCadTipoContrib.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dbedtTipoContrib.text := '';
  dbchkDeficit.checked  := false;
  dbedtTipoContrib.SetFocus;
end;

procedure TfrmCadTipoContrib.qryAfterInsert(DataSet: TDataSet);
begin
  inherited;
  if qry.State in [dsinsert] then
  begin
    iIdTipoContrib := LeUltRegistro(qryAux,'TPCONTRIBUICAO');
    qry.FieldByName('IDTPCONTRIBUICAO').AsInteger := iIdTipoContrib;
  end;
end;

procedure TfrmCadTipoContrib.bbtnConfirmarClick(Sender: TObject);
begin
  if Trim(dbedtTipoContrib.text) = '' then
  begin
    MsgDlg('É obrigatório informar o tipo de contribuição.','Aviso',mtInformation,[mbOk,mbHelp],0);
    dbedtTipoContrib.SetFocus;
    Exit;
  end;

  if not dbchkDeficit.checked then
     qry.FieldByName('FLGDEFICIT').AsInteger := 0;

  inherited;
end;

function TfrmCadTipoContrib.TipoContribuicaoEmUso: boolean;
begin
  qryAux.sql.clear;
  qryAux.sql.Add('SELECT COUNT(IDCONTRIBUICAO) FROM CONTRIBUICAO');
  qryAux.sql.Add(' WHERE IDTPCONTRIBUICAO = '+IntToStr(iIdTipoContrib));
  qryAux.open;

  Result := qryAux.Fields[0].AsInteger > 0;
end;

procedure TfrmCadTipoContrib.sbtnApagarClick(Sender: TObject);
begin
  if TipoContribuicaoEmUso() then
  begin
    MsgDlg('Não é possível excluir o registro.','Aviso', mtInformation,[mbOk,mbHelp],0);
    bbtnCancelarClick(Sender);
    Exit;
  end;

  inherited;
end;

procedure TfrmCadTipoContrib.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;

  if qry.isEmpty then
     dbchkDeficit.checked := false;
end;

procedure TfrmCadTipoContrib.qryBeforePost(DataSet: TDataSet);
begin
  inherited;
  qry.FieldByName('NOME').AsString := AnsiUpperCase(dbedtTipoContrib.text);
end;

end.
