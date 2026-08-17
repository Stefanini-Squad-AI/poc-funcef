unit FBloqueioIR;
{
------------------------------------------------------------------------------
Autor(a)    : Higor Nayde Ferreira
Data        : 09/06/2014
Pendência   : SOL 201318 KINTANA 1958253
Descricao   : Criação da tela para atendimento do SOL 201318.
------------------------------------------------------------------------------
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, DBClient, wwclient, Grids, Wwdbigrd, Wwdbgrid, Buttons,
  StdCtrls, Db, DBTables, Wwquery, CmEventosCadastro, ImgList, MontaSelect,
  Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97Ctls,
  TB97, ExtCtrls, ComCtrls, CMDbListView;

const
   CR = #13;

type
  TfrmBloqueioIR = class(TfrmCadastroCS)
    Panel1: TPanel;
    Label1: TLabel;
    sbtnAdicionar: TSpeedButton;
    sbtnRemover: TSpeedButton;
    sbtnAdicionarTudo: TSpeedButton;
    sbtnRemoverTudo: TSpeedButton;
    Panel2: TPanel;
    Panel3: TPanel;
    cdsBloqueado: TwwClientDataSet;
    dsLiberado: TwwDataSource;
    cdsLibeado: TwwClientDataSet;
    qryLiberado: TwwQuery;
    dsBloqueado: TwwDataSource;
    dbgdEstabNaoHab: TCMDbListView;
    dbgdEstabHab: TCMDbListView;
    procedure FormCreate(Sender: TObject);
    procedure sbtnAdicionarClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnRemoverClick(Sender: TObject);
    procedure sbtnAdicionarTudoClick(Sender: TObject);
    procedure sbtnRemoverTudoClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizaUsuario(valor: Integer; nome: TStringList);
  public
    function QuebrarListaFiltro(NumEspacos: byte; Filtro, ListaID: string;
      TamLinha: word): string;
    function IFF(Condicao: boolean; Primeiro, Segundo: string): string; overload;
    function ContaCaracter(Texto: string; Ch: string): Integer;
    procedure ExtraiString(var Str, StrAtual: string; Separador: string);
    function Replicate(Texto: string; NumVezes: integer): string;
    { Public declarations }
  end;

var
  frmBloqueioIR: TfrmBloqueioIR;

implementation
uses
    uCtrlPadroes,DBaseDados,UMensErro,UDataBase;

{$R *.DFM}

procedure TfrmBloqueioIR.FormCreate(Sender: TObject);
begin
  inherited;

  //Padroes := TCtrlPadroes.Create;
  //Padroes.Initialize(Session.FindDatabase(sDataBaseName),false);
  sbtnAlterar.Enabled := True;
  bbtnCancelar.Enabled := False;
  cdsBloqueado.Data := Padroes.GetDataPacket(qry.SQL.Text);
  cdsLibeado.Data := Padroes.GetDataPacket(qryLiberado.SQL.Text);
  if (cdsBloqueado.State <> dsedit) then
    bbtnConfirmar.Enabled := False;
end;

procedure TfrmBloqueioIR.sbtnAdicionarClick(Sender: TObject);
begin
  //inherited;
//  MsgDlg((dbgdEstabNaoHab.Items[dbgdEstabNaoHab.Selected.Index].Caption), 'Informação', mtInformation, [mbOk], 0);

  if (cdsBloqueado.RecordCount > 0) and (dbgdEstabNaoHab.Selected <> nil) then begin
      cdsBloqueado.Locate('NOMEUSUARIO',dbgdEstabNaoHab.Items[dbgdEstabNaoHab.Selected.Index].Caption,[]);

      cdsLibeado.Insert;
      cdsLibeado.FieldByName('NOME').asString := cdsBloqueado.FieldByName('NOME').asString;
      cdsLibeado.FieldByName('NOMEUSUARIO').asString := cdsBloqueado.FieldByName('NOMEUSUARIO').asString;
      cdsLibeado.FieldByName('IDUSUARIO').asString := cdsBloqueado.FieldByName('IDUSUARIO').asString;
      cdsLibeado.Post;
      cdsBloqueado.Delete;
      dsBloqueado.DataSet := cdsBloqueado;
      dbgdEstabNaoHab.DataSource:= dsBloqueado;

      dsLiberado.DataSet := cdsLibeado;
      dbgdEstabHab.DataSource:= dsLiberado;
  end;
end;

procedure TfrmBloqueioIR.CmeCadastroConfirma(Sender: TObject);
begin
  //inherited;

end;

procedure TfrmBloqueioIR.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  //inherited;
  sbtnAlterar.Enabled := True;
end;

procedure TfrmBloqueioIR.sbtnAlterarClick(Sender: TObject);
begin
  //inherited;
  bbtnCancelar.Enabled := True;
  dbgdEstabNaoHab.Enabled := True;
  dbgdEstabHab.Enabled := True;
  pnlFundo.Enabled := true;
  bbtnConfirmar.Enabled:= pnlFundo.Enabled;
end;

procedure TfrmBloqueioIR.sbtnRemoverClick(Sender: TObject);
begin
  if (cdsLibeado.RecordCount > 0) and (dbgdEstabHab.Selected <> nil) then begin
   cdsLibeado.Locate('NOMEUSUARIO',dbgdEstabHab.Items[dbgdEstabHab.Selected.Index].Caption,[]);


      cdsBloqueado.Insert;
      cdsBloqueado.FieldByName('NOME').asString := cdsLibeado.FieldByName('NOME').asString;
      cdsBloqueado.FieldByName('NOMEUSUARIO').asString := cdsLibeado.FieldByName('NOMEUSUARIO').asString;
      cdsBloqueado.FieldByName('IDUSUARIO').asString := cdsLibeado.FieldByName('IDUSUARIO').asString;
      cdsBloqueado.Post;
      cdsLibeado.Delete;
      dsLiberado.DataSet := cdsLibeado;
      dbgdEstabHab.DataSource:= dsLiberado;
      dsBloqueado.DataSet := cdsBloqueado;
      dbgdEstabNaoHab.DataSource:= dsBloqueado;
  end;
end;

procedure TfrmBloqueioIR.sbtnAdicionarTudoClick(Sender: TObject);
begin
  //inherited;
  cdsBloqueado.DisableControls;
  cdsBloqueado.First;
  while not(cdsBloqueado.EOF) do begin
    cdsLibeado.Insert;
    cdsLibeado.FieldByName('NOME').asString := cdsBloqueado.FieldByName('NOME').asString;
    cdsLibeado.FieldByName('NOMEUSUARIO').asString := cdsBloqueado.FieldByName('NOMEUSUARIO').asString;
    cdsLibeado.FieldByName('IDUSUARIO').asString := cdsBloqueado.FieldByName('IDUSUARIO').asString;
    cdsLibeado.Post;
    cdsBloqueado.Delete;
  end;
  dsBloqueado.DataSet := cdsBloqueado;
  dbgdEstabNaoHab.DataSource:= dsBloqueado;
  dsLiberado.DataSet := cdsLibeado;
  dbgdEstabHab.DataSource:= dsLiberado;
  cdsBloqueado.EnableControls;
end;

procedure TfrmBloqueioIR.sbtnRemoverTudoClick(Sender: TObject);
begin
  //inherited;
  cdsLibeado.DisableControls;
  cdsLibeado.First;
  while not(cdsLibeado.EOF) do begin
      cdsBloqueado.Insert;
      cdsBloqueado.FieldByName('NOME').asString := cdsLibeado.FieldByName('NOME').asString;
      cdsBloqueado.FieldByName('NOMEUSUARIO').asString := cdsLibeado.FieldByName('NOMEUSUARIO').asString;
      cdsBloqueado.FieldByName('IDUSUARIO').asString := cdsLibeado.FieldByName('IDUSUARIO').asString;
      cdsBloqueado.Post;
      cdsLibeado.Delete;
  end;

  dsLiberado.DataSet := cdsLibeado;
  dbgdEstabHab.DataSource:= dsLiberado;
  dsBloqueado.DataSet := cdsBloqueado;
  dbgdEstabNaoHab.DataSource:= dsBloqueado;
  cdsLibeado.EnableControls;
end;

procedure TfrmBloqueioIR.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  sbtnAlterar.OnClick(self);
  pnlFundo.Enabled:= False;
  bbtnConfirmar.Enabled := False;
  sbtnAlterar.Down := False;
  bbtnCancelar.Enabled := False;
  cdsBloqueado.Data := Padroes.GetDataPacket(qry.SQL.Text);
  cdsLibeado.Data := Padroes.GetDataPacket(qryLiberado.SQL.Text);
end;

procedure TfrmBloqueioIR.bbtnConfirmarClick(Sender: TObject);
var
   IdUsuario: TStringList;
begin
  inherited;
  cdsLibeado.First;
  IdUsuario := TStringList.Create;

  while not(cdsLibeado.EOF) and not(cdsLibeado.IsEmpty)do begin
    IdUsuario.Add(cdsLibeado.FieldByName('IDUSUARIO').asString);
    cdsLibeado.Next;
  end;
  if not (cdsLibeado.IsEmpty)then
    AtualizaUsuario(0,IdUsuario);
  cdsBloqueado.First;
  IdUsuario.Clear;

  while not(cdsBloqueado.EOF) and not(cdsBloqueado.IsEmpty) do begin
    IdUsuario.Add(cdsBloqueado.FieldByName('IDUSUARIO').asString);
    cdsBloqueado.Next;
  end;
  if not(cdsBloqueado.IsEmpty) then
    AtualizaUsuario(1,IdUsuario);


  cdsBloqueado.Data := Padroes.GetDataPacket(qry.SQL.Text);
  cdsLibeado.Data := Padroes.GetDataPacket(qryLiberado.SQL.Text);
  bbtnConfirmar.Enabled:= False;
  bbtnCancelar.Enabled := False;
  sbtnAlterar.Down := False;
  pnlFundo.Enabled:= False;
end;

procedure TfrmBloqueioIR.AtualizaUsuario(valor: Integer; nome: TStringList);
var
   qryUpdate: TQuery;
   sParam : string;
begin

  qryUpdate := TQuery.Create(Application);
  qryUpdate.DataBaseName := 'Basedados';
  StartTransacao;
  try
    sParam := QuebrarListaFiltro(2,'(IDUSUARIO ',nome.commaText,100);
    qryUpdate.SQL.Text:= 'UPDATE USUARIOSISTEMA SET FLGBLOQUEIOALTIR = '+ IntToStr(valor) +' WHERE '+sParam;
    qryUpdate.ExecSQL;

    CommitTransacao;
  except
       RollBackTransacao;
       MsgDlg('Ocorreu erro na atualização de dados, entre em contato com o Analista responsável!', 'Informação', mtInformation, [mbOk], 0);
       Exit;
  end;
  qryUpdate.Destroy;
end;

function TfrmBloqueioIR.QuebrarListaFiltro(NumEspacos: byte; Filtro,
  ListaID: string; TamLinha: word): string;
var
  iNumItem, iNumItensLista: integer;
  c, iNumLinhas: byte;
  sLinhaAtual, sIDAtual: string;
begin
  // Calcular o número de linhas necessárias
  iNumItensLista := ContaCaracter(ListaID,',');
  if (iNumItensLista > 0) then
    Inc(iNumItensLista);

  if (iNumItensLista <= TamLinha) then
  begin
    Result := Replicate(' ', NumEspacos) + Filtro +
      IFF(iNumItensLista>1,' IN (',' = ') + ListaID + IFF(iNumItensLista>1,')','')+ ')';
    exit;
  end
  else
  begin
    if ((iNumItensLista mod TamLinha) = 0) then
      iNumLinhas := iNumItensLista div TamLinha
    else
      iNumLinhas := (iNumItensLista div TamLinha) + 1;
  end;
  
  // Gerar as linhas necessárias
  Result := '';
  for c:=1 to iNumLinhas do
  begin
    // Adicionar o número máximo de elementos à linha atual
    iNumItem := 0;
    sLinhaAtual := '';
    repeat
      ExtraiString(ListaID, sIDAtual, ',');
      Inc(iNumItem);
      if (sLinhaAtual = '') then
        sLinhaAtual := sIDAtual
      else
        sLinhaAtual := sLinhaAtual +','+ sIDAtual;
    until (ListaID = '') or (iNumItem = TamLinha);

    // Montar a linha atual
    Result := Result +
      Replicate(' ', NumEspacos+2) +
      Filtro +                                               
      IFF(iNumItensLista>1,' IN (',' = ') +
      sLinhaAtual + '))'+
      IFF(c < iNumLinhas, ' OR' + CR, '');
  end;

  if (Result <> '') and (Pos(CR,Result) > 0) then
    Result := Replicate(' ',NumEspacos) +'('+ CR +Result+ CR +Replicate(' ',NumEspacos)+ ')';
end;

function TfrmBloqueioIR.IFF(Condicao: boolean; Primeiro,
  Segundo: string): string;
begin
  if (Condicao) then
    Result := Primeiro
  else
    Result := Segundo;
end;

function TfrmBloqueioIR.ContaCaracter(Texto: string; Ch: String): Integer;
var
  c: integer;
begin
  Result := 0;
  for c:=1 to Length(Texto) do
    if (Texto[c] = Ch) then
      Inc(Result);
end;

procedure TfrmBloqueioIR.ExtraiString(var Str, StrAtual: string;
  Separador: string);
var
  iPos: integer;
begin
  iPos := Pos(Separador, Str);
  if (iPos > 0) then
  begin
    StrAtual := Copy(Str, 1, iPos-1);
    Delete(Str, 1, iPos + Length(Separador)-1);
  end
  else
  begin
    StrAtual := Str;
    Str := '';           
  end;
end;

function TfrmBloqueioIR.Replicate(Texto: string;
  NumVezes: integer): string;
var
  c: word;
  Temp: string;
begin
  Temp := '';
  for c:=1 to NumVezes do
    Temp := Temp + Texto;
  Result := Temp;
end;

end.
