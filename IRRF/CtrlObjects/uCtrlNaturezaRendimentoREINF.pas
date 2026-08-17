unit uCtrlNaturezaRendimentoREINF;

interface
uses sysutils, uCmControlObject, uCmDbObject, uDbNaturezaRendimentoREINF, uSistema, DB, uDataBase, DbClient,
     uCMTypes, DBaseDados;

type
    TCtrlNaturezaRendimentoREINF = Class(TCmControlObject)
    private
      FCdsNaturendimentoREINF: TClientDataSet;
      FDbNaturezaRendimentoREINF: TDbNaturezaRendimentoREINF;
      procedure SetCdsNaturendimentoREINF(const Value: TClientDataSet);
      procedure SetDbNaturezaRendimentoREINF(const Value: TDbNaturezaRendimentoREINF);
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      function GravaRendimentoREINF: Boolean;
      function ListRendimentosREINF(pCodNaturezaREINF: integer) : OleVariant;
      function ListGrupoRendimentosREINF(pCodGrupoRendimento: integer) : OleVariant;
      function DescricaoGruporendimentoREINF(pCodGrupoRendimento: integer; var pCodGrupo: Integer): string;
      function VerificaExistenciaNatureza(pCodNaturezaREINF: integer): Boolean;
      property CdsNaturendimentoREINF: TClientDataSet read FCdsNaturendimentoREINF write SetCdsNaturendimentoREINF;
      property DbNaturezaRendimentoREINF: TDbNaturezaRendimentoREINF read FDbNaturezaRendimentoREINF write SetDbNaturezaRendimentoREINF;

    private

end;

implementation

{ TCtrlNaturezaRendimentoREINF }

constructor TCtrlNaturezaRendimentoREINF.Create;
begin
  inherited;
  FDbNaturezaRendimentoREINF := TDbNaturezaRendimentoREINF.Create(Self);
end;

function TCtrlNaturezaRendimentoREINF.DescricaoGruporendimentoREINF(
  pCodGrupoRendimento: integer; var pCodGrupo: Integer): string;
var
  cds: TClientDataSet;
begin
  cds := TClientDataSet.Create(nil);
  Result := EmptyStr;
  try
    cds.Data := ListGrupoRendimentosREINF(pCodGrupoRendimento);

    if not cds.IsEmpty then
    begin
      Result := cds.FieldByName('DESCRICAO').AsString;
      pCodGrupo := cds.FieldByName('CODGRUPONATUREZA').AsInteger;
    end
    else
    begin
      Result := 'Não existe um grupo para este rendimento.';
      pCodGrupo := 0;
    end;
  finally
    FreeAndNil(cds);
  end;
end;

destructor TCtrlNaturezaRendimentoREINF.Destroy;
begin
  inherited;
  FreeAndNil(FDbNaturezaRendimentoREINF);
end;

procedure TCtrlNaturezaRendimentoREINF.DoChangeDataBase;
begin
  inherited;
  DbNaturezaRendimentoREINF.DataBaseName   := DataBaseName;
end;

function TCtrlNaturezaRendimentoREINF.GravaRendimentoREINF: Boolean;
var
   sMsg: string;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravaNaturendimento(FCdsNaturendimentoREINF.data);
    if not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(FCdsNaturendimentoREINF,FDbNaturezaRendimentoREINF,[],[] );
      sMsg    := FDbNaturezaRendimentoREINF.MessageInfo;
      if Not Result then
        raise Exception.Create(sMsg);
           Commit;
    except
      on e:Exception do
      begin
        Rollback;
        Result := False;
        MessageInfo := e.Message;
      end;
    end;
  end;
end;

function TCtrlNaturezaRendimentoREINF.ListGrupoRendimentosREINF(
  pCodGrupoRendimento: integer): OleVariant;
var
    sSQL: string;
begin
  sSQL := 'SELECT CODGRUPONATUREZA,      '+#13#10+
          ' 			DESCRICAO              '+#13#10+
          '  FROM GRUPO_RENDIMENTO_REINF '+#13#10+
          ' WHERE CODGRUPONATUREZA = ' + IntToStr(pCodGrupoRendimento) + #13#10;
          
  Result := GetDataPacket(sSQL);
end;

function TCtrlNaturezaRendimentoREINF.ListRendimentosREINF(
                                pCodNaturezaREINF: integer): OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT CODNATUREZAREINF,         '+#13#10+
          '       TITULO,                   '+#13#10+
          '       DESCRICAO,                '+#13#10+
          '       CODGRUPONATUREZA,         '+#13#10+
          '       TRIBUTACAOEXTERIOR,       '+#13#10+
          '       INDNATUREZA13,            '+#13#10+
          '       INDNATUREZARRA,           '+#13#10+
          '       TIPODECLARANTE,           '+#13#10+
          '       CODDIRF                   '+#13#10+
          '  FROM NATUREZA_RENDIMENTO_REINF '+#13#10+
          ' WHERE CODNATUREZAREINF = ' + IntToStr(pCodNaturezaREINF) +#13#10;

  Result := GetDataPacket(sSQL);
end;

procedure TCtrlNaturezaRendimentoREINF.OnCreateAppServer;
begin
  inherited;
  FcdsNaturendimentoREINF := TClientDataSet.Create(nil);
end;

procedure TCtrlNaturezaRendimentoREINF.SetCdsNaturendimentoREINF(
  const Value: TClientDataSet);
begin
  FCdsNaturendimentoREINF := Value;
end;

procedure TCtrlNaturezaRendimentoREINF.SetDbNaturezaRendimentoREINF(
  const Value: TDbNaturezaRendimentoREINF);
begin
  FDbNaturezaRendimentoREINF := Value;
end;

function TCtrlNaturezaRendimentoREINF.VerificaExistenciaNatureza(
  pCodNaturezaREINF: integer): Boolean;
var
  cds: TClientDataSet;
begin
  cds := TClientDataSet.Create(nil);
  Result := False;
  try
    cds.Data := ListRendimentosREINF(pCodNaturezaREINF);

    if not cds.IsEmpty then
      Result := True;
  finally
    FreeAndNil(cds);
  end;
end;

end.
 