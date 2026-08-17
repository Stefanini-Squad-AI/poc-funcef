{
//------------------------------------------------------------------------------
//Alteração  : LimpaListaTipo3
//Nº SIG.....: 85168
//Data.......: 10/04/2019
//Responsável: Andre Imakawa
//Descrição..: Apagar o idusuario das listar do FLGTIPOLISTA = 3
//------------------------------------------------------------------------------
//Pendência   : SIG 78703/78056
//Responsável : Andre Imakawa
//Data        : 28/11/2018
//Descrição   : Correção da Lista para não carregar listas criadas para a rotina
				de Previa com lista fracionada.
//------------------------------------------------------------------------------

//Pendência   : SIG 68729
//Responsável : Darivaldo Alencar
//Data        : 23/05/2018
//Descrição   : Não está incluindo grupo familiar na lista individual quando
                existe duas matrículas e uma não possui dados na Tabela DEPENTIT.
                qryLista(alterado no formulario)
//------------------------------------------------------------------------------
//Pendência   : SOL 262367 PPM 1090694
//Responsável : Andre Imakawa
//Data        : 10/05/2016
//Descrição   : Performance na inclusão dos registros quando se trata de lista.
                Utilizando Insert into - SELECT. Antes inseria linha a linha.
//------------------------------------------------------------------------------
//Pendência   : SOL 185038 KINTANA 1812976
//Responsável : Marcio Sanches Spinosa SOL 185038 KINTANA 1812976
//Data        : 13/06/2013
//Descrição   : Ajuste no filtro da query e validações de campos para montagem do
//              relatorio.
//--------------------------------------------------------------------------------
// Autor(a)    : BRUNO AZEVEDO
// Data        : 11/06/2010
// Rotina      : qryLista
// Descricao   : Adicionado filtro na qryLista.
// Pendência   : SOL 137518 Kintana 831552
//------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 23/04/2010
// Pendência   : SOL 134511 Kintana 793428
// Descricao   : Retiramos o FLGDESATIVADO do monta select MSBenef.
}
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
    procedure LimpaListaTipo3; // Andre Imakawa - SIG 85168
    function VerificaListaUsuario: integer;
    function VerificaListaLote(aidlote: integer): integer;
    procedure IncluiPessoaLista(aidtitular, aidpessoa: integer);
    procedure IncluiPessoaListaporListagem(aidlista: integer); // Andre Imakawa - SOL 262367 - PM 1090694
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
  qryLista.ParamByName('IDLISTA').Asfloat := ListaUsuario;
  qryLista.open;
  lblQuant.caption:='  Quantidade: '+inttostr(qryLista.recordcount)+'  ';
end;

procedure TfrmFrameListaBenef.bbtnIncluiBenefClick(Sender: TObject);
var pQry : TwwQuery;
begin
  MSBenef.Executar;
  if (MSBenef.ValoresChave.Count > 0) and
     (MSBenef.ValoresChave[0] <> '') then
  begin
  //Marcio Sanches Spinosa SOL 185038 KINTANA 1812976 - Inicio
    if Sistema.IdModulo = 18 then
    begin
      pQry := TwwQuery.Create(nil);
      pQry.DatabaseName := 'BaseDados';
      pQry.close;
      pQry.SQL.Clear;
      //Darivaldo Alencar SIG68729 -INICIO
      //pQry.sql.Add('SELECT IDPESSOA, IDTITULAR FROM DEPENTIT WHERE IDTITULAR = (  ' +
      //             'SELECT IDTITULAR FROM DEPENTIT WHERE MATRICULA = ' + QuotedStr(MSBenef.ValoresChave[1]) + ' ) ');
      pQry.sql.Add('SELECT IDPESSOA, IDTITULAR FROM DEPENTIT WHERE IDTITULAR IN (  ' +
                   'SELECT IDTITULAR FROM DEPENTIT WHERE IDTITULAR = ' + QuotedStr(MSBenef.ValoresChave[5]) + ' ) ');
      //Darivaldo Alencar SIG68729 -FIM
      pQry.Open;

      pQry.first;

      while not pQry.Eof do
      begin
        ProcessoLista := False;
        IncluiPessoaLista(pqry.fieldbyname('IDTITULAR').AsInteger,
                          pqry.fieldbyname('IDPESSOA').AsInteger);
        pqry.Next;
      end;

      FreeAndNil(pQry);
    end
    else
    begin
      ProcessoLista:=false;
      IncluiPessoaLista(strtoint(MSBenef.ValoresChave[5]),
        strtoint(MSBenef.ValoresChave[0]));
    end;
	//Marcio Sanches Spinosa SOL 185038 KINTANA 1812976 - Fim
  end;
end;

procedure TfrmFrameListaBenef.DefineLista(aidlista: integer);
begin
  if qrybuscaLista.Active  then
     qrybuscaLista.Close;
  qrybuscaLista.ParamByName('IDUSUARIO').AsFloat := SISTEMA.IdUsuario;
  qrybuscaLista.Open;
   if not qrybuscaLista.eof  then
     ListaUsuario:=qrybuscalista.FieldByName('IDLISTA').AsInteger
   else
     ListaUsuario:=0;
  AbreQryLista;
end;

procedure TfrmFrameListaBenef.ExcluiPessoaLista(aidtitular, aidpessoa: integer);
 var ssql: string;
begin
  ssql:='DELETE FROM LISTAFOLHABENEFDET '+
        'WHERE IDLISTA = '+inttostr(ListaUsuario)+' '+
        'AND IDTITULAR = '+inttostr(aidtitular)+' '+
        'AND IDPESSOA = '+inttostr(aidpessoa);
  ExecutarQuery(qryAux, ssql);
  if not ProcessoLista then
    AbreQryLista;
end;

procedure TfrmFrameListaBenef.IncluiPessoaLista(aidtitular, aidpessoa: integer);
 var ssql: string;
begin
  if ListaUsuario = 0 then
    IncluirNovaLista;
  qryaux.sql.Clear;
  qryaux.SQL.add('INSERT INTO LISTAFOLHABENEFDET (IDLISTA, IDTITULAR,IDPESSOA,IDREFERENCIA) VALUES ('+
        ' :IDLISTA, :IDTITULAR,:IDPESSOA,:IDREFERENCIA )');
  qryAux.ParamByName('IDLISTA').AsFloat := ListaUsuario;
  qryAux.ParamByName('IDTITULAR').AsFloat := AidTitular;
  qryAux.ParamByName('IDPESSOA').AsFloat := AidPessoa;
  qryaux.ParamByName('IDREFERENCIA').AsFloat := 0;

  try
    qryaux.ExecSQL;
  except
  end;
  if not ProcessoLista then
    AbreQryLista;
end;

// Andre Imakawa - SOL 262367 - PM 1090694 - Inicio
procedure TfrmFrameListaBenef.IncluiPessoaListaporListagem(aidlista: integer);
 var ssql: string;
begin

  if ListaUsuario = 0 then
    IncluirNovaLista;
  qryaux.sql.Clear;
  qryaux.SQL.add('INSERT INTO LISTAFOLHABENEFDET (IDLISTA, IDTITULAR,IDPESSOA,IDREFERENCIA) '+
        ' SELECT  :IDLISTA, IDTITULAR, IDPESSOA, 0 FROM LISTAFOLHABENEFDET WHERE IDLISTA =  :IDLISTAREF');
  qryAux.ParamByName('IDLISTA').AsFloat := ListaUsuario;
  qryaux.ParamByName('IDLISTAREF').AsFloat := aidlista;

  try
    qryaux.ExecSQL;
  except
  end;
  if not ProcessoLista then
    AbreQryLista;   
end;
// Andre Imakawa - SOL 262367 - PM 1090694 - Fim

procedure TfrmFrameListaBenef.MontaQueryLista;
 var ssql: string;
begin
  ssql:='SELECT V.IDTITULAR, V.IDPESSOA, V.MATRICULA, V.MATRICULADEP, '+
               'V.NOME, V.INSCRICAONUMERO '+
               'FROM LISTAFOLHABENEFDET L, VWPARTICIPDEPEN V '+
               'WHERE L.IDLISTA = '+inttostr(ListaUsuario)+' '+
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
    // Andre Imakawa - SOL 262367 - PM 1090694 - Inicio
    if not qryIListlista.IsEmpty then
    begin
      IncluiPessoaListaporListagem(idlistaincluir);
    end;
    // Andre Imakawa - SOL 262367 - PM 1090694 - Fim
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


  ExecutarQuery(qryAux, 'DELETE FROM LISTAFOLHABENEFDET WHERE IDLISTA = '+inttostr(ListaUsuario));
  AbreQryLista;
end;

function TfrmFrameListaBenef.VerificaListaLote(aidlote: integer): integer;
 var ssql: string;
begin
  ssql:='SELECT IDLISTA '+
        'FROM LISTAFOLHABENEF '+
        'WHERE IDLOTE = '+inttostr(aidlote)+' '+
        'AND FLGTIPOLISTA < 3'+               // Andre Imakawa - SIG 78703 - TIBERO PREVIA FRACIONADA
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
        'AND FLGTIPOLISTA < 3 '+     // Andre Imakawa - SIG 78703 - TIBERO PREVIA FRACIONADA
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
        'WHERE IDUSUARIO = '+inttostr(Sistema.IdUsuario) +
        ' AND FLGTIPOLISTA < 3 ';   // Andre Imakawa - SIG 78703 - TIBERO PREVIA FRACIONADA
  qryAux.close;
  qryAux.sql.clear;
  qryAux.sql.add(ssql);
  qryAux.open;
  if qryAux.Eof  then
  begin
    ListaUsuario := LeUltRegistro(Nil,'LISTAFOLHABENEF');
    qryaux.sql.Clear;
    qryaux.SQL.add('INSERT INTO LISTAFOLHABENEF(IDLISTA,FLGTIPOLISTA,NOME,IDUSUARIO) VALUES ('+
                   ' :IDLISTA,:FLGTIPOLISTA,:NOME,:IDUSUARIO)');
    qryAux.ParamByName('IDLISTA').AsFloat := ListaUsuario;
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
     ListaUsuario := QryAux.FieldByName('IDLISTA').AsInteger;
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

// Andre Imakawa - SIG 85168 - Inicio
procedure TfrmFrameListaBenef.LimpaListaTipo3;
 var ssql: string;
begin
  ssql:='UPDATE LISTAFOLHABENEF '+
        'SET IDUSUARIO = NULL '+
        'WHERE IDUSUARIO = ' +inttostr(Sistema.IdUsuario)+ ' ' +
        'AND FLGTIPOLISTA = 3';
  try
    ExecutarQuery(qryAux, ssql);
  except
  end;

end;
// Andre Imakawa - SIG 85168 - Fim
end.
