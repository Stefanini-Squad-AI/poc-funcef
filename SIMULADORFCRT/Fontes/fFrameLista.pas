unit fFrameLista;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, ExtCtrls, Db, Wwdatsrc,
  DBTables, Wwquery, TB97, TB97Tlbr, udatabase, UMensErro,
  MontaSelect, usistema;

type
  TfrmFrameListaBenef = class(TFrame)
    Panel3: TPanel;
    dbgrdPessoas: TwwDBGrid;
    Dock971: TDock97;
    TB97oKCancelar: TToolbar97;
    bbtnIncluiBenef: TBitBtn;
    bbtnIncluiLista: TBitBtn;
    bbtnExcluiTudo: TBitBtn;
    bbtnExcluiCorrente: TBitBtn;
    qryLista: TwwQuery;
    dsLista: TwwDataSource;
    qryAux: TwwQuery;
    MSLista: TMontaSelect;
    qryIListlista: TwwQuery;
    qryIListlistaIDLISTA: TFloatField;
    qryIListlistaIDTITULAR: TFloatField;
    qryIListlistaIDPESSOA: TFloatField;
    qryIListlistaIDREFERENCIA: TFloatField;
    qrybuscaLista: TwwQuery;
    lblQuant: TLabel;
    MSBenef: TMontaSelect;

    procedure bbtnIncluiBenefClick(Sender: TObject);
    procedure bbtnExcluiCorrenteClick(Sender: TObject);
    procedure bbtnIncluiListaClick(Sender: TObject);
    procedure bbtnExcluiTudoClick(Sender: TObject);
  private
//    IdLista : integer;
    FIdListaErro: integer;
    FIdListaProc: integer;
    FNomeProcesso: string;
    FProcessoLista: boolean;
    FListaUsuario: integer;
    procedure SetIdListaErro(const Value: integer);
    procedure SetIdListaProc(const Value: integer);
    procedure SetNomeProcesso(const Value: string);
    procedure SetProcessoLista(const Value: boolean);
    procedure SetListaUsuario(const Value: integer);
    { Private declarations }
  public
    { Public declarations }
    procedure MontaQueryLista;
    procedure IncluirNovaLista;
    procedure DefineLista(aidlista: integer);
    procedure AbreQryLista;
    function VerificaListaUsuario: integer;
    function VerificaListaLote(aidlote: integer): integer;
    procedure IncluiPessoaLista(aidtitular, aidpessoa: integer);
    procedure ExcluiPessoaLista(aidtitular, aidpessoa: integer);
    property IdListaErro: integer read FIdListaErro write SetIdListaErro;
    property IdListaProc: integer read FIdListaProc write SetIdListaProc;
    property NomeProcesso: string read FNomeProcesso write SetNomeProcesso;
    property ProcessoLista: boolean read FProcessoLista write SetProcessoLista;
    property ListaUsuario: integer read FListaUsuario write SetListaUsuario;
  end;

implementation

{$R *.DFM}

procedure TfrmFrameListaBenef.AbreQryLista;
begin
  qryLista.close;
  qryLista.ParamByName('IDLISTA').Asfloat := ListaUsuario{IdLista};
  qryLista.open;
  lblQuant.caption:='  Quantidade: '+inttostr(qryLista.recordcount)+'  ';
end;

procedure TfrmFrameListaBenef.bbtnIncluiBenefClick(Sender: TObject);
begin
  MSBenef.Executar;
  if (MSBenef.ValoresChave.Count > 0) and
     (MSBenef.ValoresChave[0] <> '') then
  begin
    ProcessoLista:=false;
    IncluiPessoaLista(strtoint(MSBenef.ValoresChave[5]),
      strtoint(MSBenef.ValoresChave[0]));
  end;
end;

procedure TfrmFrameListaBenef.DefineLista(aidlista: integer);
begin
  if qrybuscaLista.Active  then
     qrybuscaLista.Close;
  qrybuscaLista.ParamByName('IDUSUARIO').AsFloat := SISTEMA.IdUsuario;
  qrybuscaLista.Open;
   if not qrybuscaLista.eof  then
     {IdLista}ListaUsuario:=qrybuscalista.FieldByName('IDLISTA').AsInteger
   else
     {IdLista}ListaUsuario:=0;
  AbreQryLista;
 // MSLista.Filtro.clear;
//  MSLista.Filtro.add('L.NOME NOT LIKE ''%#_#_@_@_#_#%''');
end;

procedure TfrmFrameListaBenef.ExcluiPessoaLista(aidtitular, aidpessoa: integer);
 var ssql: string;
begin
  ssql:='DELETE FROM LISTAFOLHABENEFDET '+
        'WHERE IDLISTA = '+inttostr(ListaUsuario{IdLista})+' '+
        'AND IDTITULAR = '+inttostr(aidtitular)+' '+
        'AND IDPESSOA = '+inttostr(aidpessoa);
  ExecutarQuery(qryAux, ssql);
  if not ProcessoLista then
    AbreQryLista;
end;

procedure TfrmFrameListaBenef.IncluiPessoaLista(aidtitular, aidpessoa: integer);
 var ssql: string;
begin
  if ListaUsuario{IdLista} = 0 then //P.RAMOS - FUNCEF - 05.11.2003
    IncluirNovaLista;
  qryaux.sql.Clear;
  qryaux.SQL.add('INSERT INTO LISTAFOLHABENEFDET (IDLISTA, IDTITULAR,IDPESSOA,IDREFERENCIA) VALUES ('+
        ' :IDLISTA, :IDTITULAR,:IDPESSOA,:IDREFERENCIA )');
  qryAux.ParamByName('IDLISTA').AsFloat := ListaUsuario{idLista};
  qryAux.ParamByName('IDTITULAR').AsFloat := AidTitular;
  qryAux.ParamByName('IDPESSOA').AsFloat := AidPessoa;
  qryaux.ParamByName('IDREFERENCIA').AsFloat := 0;

  try
    qryaux.ExecSQL;
  except
  end;
  if not ProcessoLista then //P.RAMOS - FUNCEF - 05.11.2003
    AbreQryLista;
end;

procedure TfrmFrameListaBenef.MontaQueryLista;
 var ssql: string;
begin
  ssql:='SELECT V.IDTITULAR, V.IDPESSOA, V.MATRICULA, V.MATRICULADEP, '+
               'V.NOME, V.INSCRICAONUMERO '+
               'FROM LISTAFOLHABENEFDET L, VWPARTICIPDEPEN V '+
               'WHERE L.IDLISTA = '+inttostr(ListaUsuario{IdLista})+' '+
               'AND L.IDTITULAR = V.IDTITULAR '+
               'AND L.IDPESSOA = V.IDPESSOA '+
               'ORDER BY V.MATRICULADEP ';
  qryLista.close;
  qryLista.sql.clear;
  qryLista.sql.add(ssql);
end;

procedure TfrmFrameListaBenef.SetIdListaErro(const Value: integer);
begin
  FIdListaErro := Value;
end;

procedure TfrmFrameListaBenef.SetIdListaProc(const Value: integer);
begin
  FIdListaProc := Value;
end;

procedure TfrmFrameListaBenef.SetNomeProcesso(const Value: string);
begin
  FNomeProcesso := Value;
end;

procedure TfrmFrameListaBenef.bbtnExcluiCorrenteClick(Sender: TObject);
begin
  ProcessoLista:=false;
  ExcluiPessoaLista(qryLista.fieldbyname('IDTITULAR').asinteger,
                    qryLista.fieldbyname('IDPESSOA').asinteger);
end;

procedure TfrmFrameListaBenef.bbtnIncluiListaClick(Sender: TObject);
 var idlistaincluir: integer;
begin
  if (MSLista.Executar = mrOk) then
  begin
    ProcessoLista:=true;
    idlistaincluir:=strtoint(MSLista.ValoresChave[0]);
    if qryIListlista.Active  then
      qryIListlista.Close;
    qryIListlista.ParamByName('IDLISTA').AsFloat := idlistaincluir;
    qryIListlista.Open;
    qryLista.disablecontrols;
    while not qryIListlista.Eof do
    begin
      IncluiPessoaLista(qryIListlistaIDTITULAR.AsInteger,
        qryIListlistaIDPESSOA.AsInteger);
      qryIListlista.Next;
    end;
    qryLista.enablecontrols;
    AbreQryLista;
  end;
end;

procedure TfrmFrameListaBenef.bbtnExcluiTudoClick(Sender: TObject);
begin
  if qryLista.isempty then
    exit;

  if MsgDlg('Confirma a exclusão de todos os beneficiários da Lista de Processamento ? (S/N)',
            'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrNo then
    exit;

//  qryLista.DisableControls;
//  qryLista.first;
//  ProcessoLista:=true;
//  while not qryLista.eof do
//  begin
//    ExcluiPessoaLista(qryLista.fieldbyname('IDTITULAR').asinteger,
//      qryLista.fieldbyname('IDPESSOA').asinteger);
//    qryLista.next;
//  end;
//  qryLista.EnableControls;
  ExecutarQuery(qryAux, 'DELETE FROM LISTAFOLHABENEFDET WHERE IDLISTA = '+inttostr(ListaUsuario{IdLista}));
  AbreQryLista;
end;

function TfrmFrameListaBenef.VerificaListaLote(aidlote: integer): integer;
 var ssql: string;
begin
  ssql:='SELECT IDLISTA '+
        'FROM LISTAFOLHABENEF '+
        'WHERE IDLOTE = '+inttostr(aidlote)+' '+
        'AND NOME LIKE ''%'+NomeProcesso+'%''';
  qryAux.close;
  qryAux.sql.clear;
  qryAux.sql.add(ssql);
  qryAux.open;
  if not qryAux.isempty then
    result:=qryAux.fieldbyname('IDLISTA').asinteger
  else
    result:=-1;
end;

function TfrmFrameListaBenef.VerificaListaUsuario: integer;
 var ssql: string;
begin
  ssql:='SELECT IDLISTA '+
        'FROM LISTAFOLHABENEF '+
        'WHERE IDUSUARIO = '+inttostr(Sistema.IdUsuario)+' '+
        'AND NOME LIKE ''%PREVIA%''';
  qryAux.close;
  qryAux.sql.clear;
  qryAux.sql.add(ssql);
  qryAux.open;
  if not qryAux.isempty then
    result:=qryAux.fieldbyname('IDLISTA').asinteger
  else
    result:=-1;
end;

procedure TfrmFrameListaBenef.IncluirNovaLista;
var ssql: string;
begin
  ssql:='SELECT IDLISTA '+
        'FROM LISTAFOLHABENEF '+
        'WHERE IDUSUARIO = '+inttostr(Sistema.IdUsuario) ;
  qryAux.close;
  qryAux.sql.clear;
  qryAux.sql.add(ssql);
  qryAux.open;
  if qryAux.Eof  then
  begin
    ListaUsuario{IDLISTA} := LeUltRegistro(Nil,'LISTAFOLHABENEF');
    qryaux.sql.Clear;
    qryaux.SQL.add('INSERT INTO LISTAFOLHABENEF(IDLISTA,FLGTIPOLISTA,NOME,IDUSUARIO) VALUES ('+
                   ' :IDLISTA,:FLGTIPOLISTA,:NOME,:IDUSUARIO)');
    qryAux.ParamByName('IDLISTA').AsFloat := ListaUsuario{IDLISTA};
    qryAux.ParamByName('FLGTIPOLISTA').AsFloat := 2;
    qryaux.ParamByName('NOME').AsString := Sistema.NomeUsuario;
    qryAux.ParamByName('IDUSUARIO').AsFloat := Sistema.IdUsuario;
    try
      qryaux.ExecSQL;
    except
    end;
   end
   else
   begin
     ListaUsuario{IDLISTA} := QryAux.FieldByName('IDLISTA').AsInteger;
   end;
end;

procedure TfrmFrameListaBenef.SetProcessoLista(const Value: boolean);
begin
  FProcessoLista := Value;
end;

procedure TfrmFrameListaBenef.SetListaUsuario(const Value: integer);
begin
  FListaUsuario := Value;
end;

end.
