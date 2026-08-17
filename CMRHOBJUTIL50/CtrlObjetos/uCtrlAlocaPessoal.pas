unit uCtrlAlocaPessoal;

interface

uses SysUtils, Controls, uCmControlObject, uCmDbObject, IvDictio, uCMTranslate,
  uCMClientDataSet, uCtrlCustomRH;

type
  TCtrlAlocaPessoal = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FCdsPessoal: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function GravarAlocacoes: boolean;

    function ListTomador(const IdPessoa: double): OleVariant;
    function ListPessoal(const IdEmpresa: integer; const IdTomador: double;
      const Alocado: boolean): OleVariant;

    property CdsPessoal: TCMClientDataSet read FCdsPessoal write FCdsPessoal;
  end;

implementation

uses Db, uCMTypes, uCtrlFuncoesRH;

{ TCtrlAlocaPessoal }

constructor TCtrlAlocaPessoal.Create;
begin
  inherited;
end;

destructor TCtrlAlocaPessoal.Destroy;
begin
  if (IsAppServer) then
    FCdsPessoal.Free;
  inherited;
end;

procedure TCtrlAlocaPessoal.OnCreateAppServer;
begin
  inherited;
  FCdsPessoal := TCMClientDataSet.Create(nil);
end;

procedure TCtrlAlocaPessoal.DoChangeDataBase;
begin
  inherited;
end;

function TCtrlAlocaPessoal.ListTomador(const IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  P.IDPESSOA, P.RAZAOSOCIAL, P.NOME' +CR_LF+
    'FROM' +CR_LF+
    '  PESSOA P, CLIENTEPESS C' +CR_LF+
    'WHERE' +CR_LF+
    '  (C.IDPESSOA = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
    '  (C.IDPESSOA = P.IDPESSOA)' +CR_LF+
    'ORDER BY' +CR_LF+
    '  P.NOME');
end;

function TCtrlAlocaPessoal.ListPessoal(const IdEmpresa: integer; const IdTomador: double;
  const Alocado: boolean): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  F.IDPESSOA, F.MATRICULA, P.NOME, P.IDGRUPO' +CR_LF+
    'FROM' +CR_LF+
    '  PESSOA P, FUNCIONARIO F' +CR_LF+
    'WHERE' +CR_LF+
    '  (F.IDEMPRESA = ' +IntToStr(IdEmpresa)+ ') AND' +CR_LF+
    '  (F.IDPESSOA  = P.IDPESSOA) AND' +CR_LF+
    IFF(Alocado,
      '  (P.IDGRUPO   = ' +FloatToStr(IdTomador)+ ')',
      '  (P.IDGRUPO  IS NULL)') +CR_LF+
    'ORDER BY' +CR_LF+
    '  P.NOME');
end;

function TCtrlAlocaPessoal.GravarAlocacoes: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarAlocacoes(FCdsPessoal.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    if (FCdsPessoal.ChangeCount = 0) then
    begin
      Result := false;
      exit;
    end;

    FCdsPessoal.DisableControls;
    try
      StartTransaction;

      // DESASSOCIAR o Tomador de Serviço as Pessoas (Excluir o valor do campo IDGRUPO)
      FCdsPessoal.StatusFilter := [usDeleted];
      FCdsPessoal.First;
      while not(FCdsPessoal.EOF) do
      begin
        if (FCdsPessoal.UpdateStatus = usDeleted) then
        begin
          Result := ExecSQL(
            'UPDATE PESSOA SET' +CR_LF+
            '  IDGRUPO   = NULL' +CR_LF+
            'WHERE' +CR_LF+
            '  (IDPESSOA = ' +FCdsPessoal.FieldByName('IDPESSOA').asString+ ')');

          if not(Result) then
            raise Exception.Create(MessageInfo);
        end;
        FCdsPessoal.Next;
      end;

      // ASSOCIAR o Tomador de Serviço as Pessoas (Incluir o valor do campo IDGRUPO)
      FCdsPessoal.StatusFilter := [];
      FCdsPessoal.First;
      while not(FCdsPessoal.EOF) do
      begin
        if (FCdsPessoal.UpdateStatus = usInserted) then
        begin
          Result := ExecSQL(
            'UPDATE PESSOA SET' +CR_LF+
            '  IDGRUPO   = ' +FCdsPessoal.FieldByName('IDGRUPO').asString +CR_LF+
            'WHERE' +CR_LF+
            '  (IDPESSOA = ' +FCdsPessoal.FieldByName('IDPESSOA').asString+ ')');

          if not(Result) then
            raise Exception.Create(MessageInfo);
        end;
        FCdsPessoal.Next;
      end;

      Commit;
    except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
    FCdsPessoal.EnableControls;
    FCdsPessoal.StatusFilter := [];
  end;
end;

end.
