{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 06/03/2003                                 }
{                                                       }
{*******************************************************}

unit uCtrlTabGener;

//Autor(a)   : Douglas Siqueira
//Data       : 21/12/2012
//Pendência  : SOL 108804 KTN 494141	
//Descricao  : Retirar visualização na Folha de Pagamento de dados de outros módulos, 
//tais como: layout de arquivos TXT, tabelas genéricas, rubricas, formas de cálculo etc.
// Menus: * Cadastro / Tabelas Auxiliares / Tabela REGRA/Forma de Cálculo - Forma de Cálculo
// e Tabela Genérica * Sistema / Utilitários / Layout de Arquivos TXT * Cadastros / Rubricas
// por Empresa * Cadastros / Rubricas Salariais * Cadastros / Motivos e Ações Impedir o mesmo
//acesso aos dados da folha por outros módulos.



interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet, uCtrlCustomRH,
  uDbTabGener, uDbCampoTabGener, uDbValTabGener;

type
  TCtrlTabGener = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbTabGener: TDbTabGener;
    FDbCampoTabGener: TDbCampoTabGener;
    FDbValTabGener: TDbValTabGener;
    FCdsTabGener: TCMClientDataSet;
    FCdsCampos: TCMClientDataSet;
    FCdsLinhas: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListTabGener(CodTabela: string): OleVariant;
    function ListCampoTabGener(CodTabela: string): OleVariant;
    function ListCodCampoTabGener(CodTabela: string): OleVariant;
    function ListLinhasTabGener(CodTabela: string): OleVariant;

    function GravarTabGener: boolean;
    function GravarTabgenerUsuario(IdUsuario: double; CodTabela: string): boolean;
    function ExcluirTabGener(CodTabela: string): boolean;
    function ExcluirLinhasTabGener(CodTabela: string): boolean;

    property CdsTabGener: TCMClientDataSet read FCdsTabGener write FCdsTabGener;
    property CdsLinhas: TCMClientDataSet read FCdsLinhas write FCdsLinhas;
    property CdsCampos: TCMClientDataSet read FCdsCampos write FCdsCampos;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlTabGener }

constructor TCtrlTabGener.Create;
begin
  inherited;
  FDbTabGener := TDbTabGener.Create(Self);
  FDbCampoTabGener := TDbCampoTabGener.Create(Self);
  FDbValTabGener := TDbValTabGener.Create(Self);
end;

destructor TCtrlTabGener.Destroy;
begin
  FDbCampoTabGener.Free;
  FDbValTabGener.Free;
  FDbTabGener.Free;
  if (IsAppServer) then
  begin
    FCdsTabGener.Free;
    FCdsCampos.Free;
    FCdsLinhas.Free;
  end;
  inherited;
end;

procedure TCtrlTabGener.OnCreateAppServer;
begin
  inherited;
  FCdsTabGener := TCMClientDataSet.Create(nil);
  FCdsCampos := TCMClientDataSet.Create(nil);
  FCdsLinhas := TCMClientDataSet.Create(nil);
end;

procedure TCtrlTabGener.DoChangeDataBase;
begin
  inherited;
  FDbTabGener.DataBaseName := DataBaseName;
  FDbCampoTabGener.DataBaseName := DataBaseName;
  FDbValTabGener.DataBaseName := DataBaseName;
end;

function TCtrlTabGener.ListTabGener(CodTabela: string): OleVariant;
var
  sSQL: string;
begin
  if (CodTabela <> '') then
  begin
    sSQL := 'WHERE'+CR_LF;

    if (CodTabela = '-1') then
      sSQL := sSQL + '  (1 = 2)'+CR_LF
    else
      sSQL := sSQL + '  (CODTABELA = ' +QuotedStr(CodTabela)+ ')'+CR_LF;
  end
  else
    sSQL := '';
  //douglas.siqueira SOL108804
  if MODFOL = 21 then
     begin
     Result := GetDataPacket(
     'SELECT'+ IFF(CodTabela='-1', ' /*+ OPTIMIZER_MODE RULE */', '')+CR_LF+
     '  CODTABELA, DESCRICAO,IDMODULO '+CR_LF+
     'FROM'+CR_LF+
     '  TABGENER'+CR_LF+
  //  'WHERE '+CR_LF+
     sSQL+
     ' AND (IDMODULO = ' +IntToStr(MODFOL)+ ')'+CR_LF+///DOUGLAS.SIQUEIRA SOL 108804
     'ORDER BY'+CR_LF+
     '  UPPER(CODTABELA)')
     end
  else
     begin
     Result := GetDataPacket(
     'SELECT'+ IFF(CodTabela='-1', ' /*+ OPTIMIZER_MODE RULE */', '')+CR_LF+
     '  CODTABELA, DESCRICAO,IDMODULO '+CR_LF+
     'FROM'+CR_LF+
     '  TABGENER'+CR_LF+
  //  'WHERE '+CR_LF+
     sSQL+
//     ' AND (IDMODULO = ' +IntToStr(MODFOL)+ ')'+CR_LF+///DOUGLAS.SIQUEIRA SOL 108804
     'ORDER BY'+CR_LF+
     '  UPPER(CODTABELA)')
     end;
//douglas.siqueira SOL108804
end;

function TCtrlTabGener.ListCampoTabGener(CodTabela: string): OleVariant;
var
  sSQL: string;
begin
  if (CodTabela <> '') then
  begin
    if (CodTabela = '-1') then
      sSQL := sSQL + '  (1 = 2) AND'+CR_LF
    else
      sSQL := sSQL + '  (CT.CODTABELA = ' +QuotedStr(CodTabela)+ ') AND'+CR_LF;
  end
  else
    sSQL := '';

  Result := GetDataPacket(
    'SELECT'+ IFF(CodTabela='-1', ' /*+ OPTIMIZER_MODE RULE */', '')+CR_LF+
    '  CT.CODTABELA, CT.CODCAMPO, CT.DESCRICAO, CT.IDTIPODADO,'+CR_LF+
    '  RTRIM(NOMETIPODADO) AS TIPODADO'+CR_LF+
    'FROM'+CR_LF+
    '  CAMPOTABGENER CT, TIPODADO TD'+CR_LF+
    'WHERE'+CR_LF+
    sSQL+
    '  (CT.IDTIPODADO = TD.IDTIPODADO(+))'+CR_LF+
    'ORDER BY'+CR_LF+
    '  CT.CODCAMPO');
end;

function TCtrlTabGener.ListCodCampoTabGener(CodTabela: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  CODCAMPO'+CR_LF+
    'FROM'+CR_LF+
    '  CAMPOTABGENER'+CR_LF+
    'WHERE'+CR_LF+
    '  (CODTABELA = ' +QuotedStr(CodTabela)+ ')'+CR_LF+
    'ORDER BY'+CR_LF+
    '  CODCAMPO');
end;

function TCtrlTabGener.ListLinhasTabGener(CodTabela: string): OleVariant;
var
  sSQL: string;
begin
  if (CodTabela <> '') then
  begin
    if (CodTabela = '-1') then
      sSQL := sSQL + '  (1 = 2) AND'+CR_LF
    else
      sSQL := sSQL + '  (COL.CODTABELA = ' +QuotedStr(CodTabela)+ ') AND'+CR_LF;
  end
  else
    sSQL := '';

  Result := GetDataPacket(
    'SELECT'+ IFF(CodTabela='-1', ' /*+ OPTIMIZER_MODE RULE */', '')+CR_LF+
    '  LIN.*, COL.DESCRICAO, COL.CODCAMPO'+CR_LF+
    'FROM'+CR_LF+
    '  VALTABGENER LIN, CAMPOTABGENER COL'+CR_LF+
    'WHERE'+CR_LF+
    sSQL+
    '  (COL.CODTABELA = LIN.CODTABELA) AND'+CR_LF+
    '  (COL.CODCAMPO  = LIN.CODCAMPO)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  LIN.NUMLINHA, LIN.CODCAMPO');
end;

function TCtrlTabGener.GravarTabGener: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarTabGener(FCdsTabGener.Data, FCdsCampos.Data,
      FCdsLinhas.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ExecSQL('DELETE VALTABGENER WHERE CODTABELA = ' +
        QuotedStr(FCdsTabGener.FieldByName('CODTABELA').asString));
      if not(Result) then
        raise Exception.Create(MessageInfo);

      FCdsCampos.First;
      while not(FCdsCampos.EOF) do
      begin
        FCdsCampos.Edit;
        FCdsCampos.FieldByName('CODTABELA').asString := FCdsTabGener.FieldByName('CODTABELA').asString;
        FCdsCampos.Post;
        FCdsCampos.Next;
      end;

      Result := ApplyCds(FCdsTabGener, FDbTabGener, [], []);
      if (Result) then
      begin
        Result := ApplyCds(FCdsCampos, FDbCampoTabGener, [], []);
        if (Result) then
        begin
          Result := ApplyCds(FCdsLinhas, FDbValTabGener, [], []);
          if (Result) then
            Commit
          else
            raise Exception.Create(FDbValTabGener.MessageInfo);
        end
        else
          raise Exception.Create(FDbCampoTabGener.MessageInfo);
      end
      else
        raise Exception.Create(FDbTabGener.MessageInfo);
    except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlTabGener.GravarTabgenerUsuario(IdUsuario: double; CodTabela: string): boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarTabGener(IdUsuario, CodTabela);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ExecSQL('INSERT INTO TABGENERUSUARIO (CODTABELA, IDUSUARIO,' +
                        ' FLGALTERAR, FLGEXCLUIR, FLGPROCURAR) VALUES ('    +
                        QuotedStr(CodTabela)+ ', '+ FloatToStr(IdUsuario)   +
                        ', 1, 1, 1)');
      Commit;
      if not(Result) then
        raise Exception.Create(MessageInfo);
    except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlTabGener.ExcluirTabGener(CodTabela: string): boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.ExcluirTabGener(CodTabela, FCdsTabGener.Data,
      FCdsCampos.Data, FCdsLinhas.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ExecSQL('DELETE VALTABGENER WHERE CODTABELA = ' +QuotedStr(CodTabela));
      if not(Result) then
        raise Exception.Create(MessageInfo)
      else
        FCdsLinhas.EmptyDataSet;

      DoProgresso([0]);

      Result := ExecSQL('DELETE CAMPOTABGENER WHERE CODTABELA = ' +QuotedStr(CodTabela));
      if not(Result) then
        raise Exception.Create(MessageInfo)
      else
        FCdsCampos.EmptyDataSet;

      DoProgresso([0]);

      Result := ExecSQL('DELETE TABGENERUSUARIO WHERE CODTABELA = ' +QuotedStr(CodTabela));
      if not(Result) then
        raise Exception.Create(MessageInfo);

      DoProgresso([0]);

      FCdsTabGener.Delete;
      Result := ApplyCds(FCdsTabGener, FDbTabGener, [], []);
      if (Result) then
        Commit
      else
        raise Exception.Create(FDbTabGener.MessageInfo);

      DoProgresso([0]);
    except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlTabGener.ExcluirLinhasTabGener(CodTabela: string): boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.ExcluirLinhasTabGener(CodTabela, FCdsLinhas.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ExecSQL('DELETE VALTABGENER WHERE CODTABELA = ' +QuotedStr(CodTabela));
      if not(Result) then
        raise Exception.Create(MessageInfo)
      else
        FCdsLinhas.EmptyDataSet;

      Commit;
    except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

end.
