{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 12/07/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlProvDesc;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio,  uCMClientDataSet,
  uCtrlFuncoesRH, uCtrlCustomRH, uDbProvDesc, uDbRubXSit, uDbRubXRub;

type
  TCtrlProvDesc = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbProvDesc;
    FDbRubSit: TDbRubXSit;
    FDbRubxRub: TDbRubXRub;
    FCds: TCMClientDataSet;
    FCdsRubSit: TCMClientDataSet;
    FCdsRubxRubEm: TCMClientDataSet;
    FCdsRubxRubDe: TCMClientDataSet;

    function GetDescricaoRubricaCopia(DescricaoProxima: string): integer;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListProvDesc(IdProvento: double): OleVariant;
    function ListRubXSit(IdProvento: double; ComSituacao: boolean = true): OleVariant;
    function ListRubrica(IdProvento, IdEmpresa: double; Campos: string = ''): OleVariant;
    function ListRubricasIncidEm(IdProvento: double): OleVariant;
    function ListRubricasIncidDe(IdProvento: double): OleVariant;
    function ListRubricasRH: OleVariant;
    function ListRubricaEmpresa(ListaIdEmpresa: string; ConstaFolha: integer = -1;
      Campos: string = ''; SelBeneficio: integer = -1; SelRubApoio: boolean = true): OleVariant;
    function ListRubSel(IdEmpresa: double): OleVariant;
    function ListRubNaoSel(IdEmpresa: double): OleVariant;
    function ListProvento(IdRubrica, IdEmpresa: double; ConstaFolha: integer = -1;
      Campos: string = ''): OleVariant;

    function GetDescricaoRubrica(IdRubrica, IdEmpresa: double): string;

    function CopiarRubrica: boolean;
    function GravarProvento: boolean;
    function GravarProventoMaisRubrica(IdEmpresa: integer;
      CodProvDesc, Descricao, CodCLT: string): boolean;
    function GravarProvDesc(ovProvento, ovRubSit, ovRubxRubEm, ovRubxRubDe: OleVariant): boolean;
    function ExcluirProvDesc: boolean;

    function GravarRubricaEmpresa(Operacao: integer; IdProvento, IdEmpresa: double;
      TipoRubrica, CodProvDesc, DescrProvDesc: string): boolean;
    function AlterarTipoRubricaEmpresa(Visivel: boolean; IdEmpresa: double): boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
    property CdsRubSit: TCMClientDataSet read FCdsRubSit write FCdsRubSit;
    property CdsRubxRubEm: TCMClientDataSet read FCdsRubxRubEm write FCdsRubxRubEm;
    property CdsRubxRubDe: TCMClientDataSet read FCdsRubxRubDe write FCdsRubxRubDe;
  end;

implementation

uses uCMTypes;

{ TCtrlProvDesc }

constructor TCtrlProvDesc.Create;
begin
  inherited;
  FDb := TDbProvDesc.Create(Self);
  FDbRubSit := TDbRubXSit.Create(Self);
  FDbRubXRub := TDbRubXRub.Create(Self);
end;

destructor TCtrlProvDesc.Destroy;
begin
  FDbRubXRub.Free;
  FDbRubSit.Free;
  FDb.Free;
  if (IsAppServer) then
  begin
    FCdsRubxRubEm.Free;
    FCdsRubxRubDe.Free;
    FCdsRubSit.Free;
    FCds.Free;
  end;
  inherited;
end;

procedure TCtrlProvDesc.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
  FCdsRubSit := TCMClientDataSet.Create(nil);
  FCdsRubxRubEm := TCMClientDataSet.Create(nil);
  FCdsRubxRubDe := TCMClientDataSet.Create(nil);
end;

procedure TCtrlProvDesc.DoChangeDataBase;
begin
  inherited;
  FDb.DatabaseName := DataBaseName;
  FDbRubSit.DatabaseName := DataBaseName;
  FDbRubXRub.DatabaseName := DataBaseName;
end;

function TCtrlProvDesc.ListProvDesc(IdProvento: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT *'+CR_LF+
    'FROM   PROVDESC'+CR_LF+
    'WHERE (IDPROVENTO      =  '+FloatToStr(IdProvento)+') AND'+CR_LF+
    '      (FLGTPRUBRICA LIKE ''%F%'')');
end;

function TCtrlProvDesc.ListRubrica(IdProvento, IdEmpresa: double; Campos: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    IFF(Campos<>'', Campos,
      '  RP.CODPROVDESC, RP.DESCRPROVDESC, PD.FLGDESCONTO, PD.IDPROVENTO')+CR_LF+
    'FROM'+CR_LF+
    '  RUBRICAXPESS RP, PROVDESC PD'+CR_LF+
    'WHERE'+CR_LF+
    '  (PD.IDPROVENTO = ' +FloatToStr(IdProvento)+ ') AND'+CR_LF+
    '  (RP.IDPESSOA   = ' +FloatToStr(IdEmpresa)+ ') AND'+CR_LF+
    '  (PD.IDPROVENTO = RP.IDRUBRICA)');
end;

function TCtrlProvDesc.ListRubXSit(IdProvento: double; ComSituacao: boolean): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  R.IDPROVENTO, R.IDSITFUNC'+
      IFF(ComSituacao, ', RTRIM(ST.DESCRICAO) AS DESCRICAO', '') +CR_LF+
    'FROM' +CR_LF+
    '  RUBXSIT R'+ IFF(ComSituacao, ', SITFUNC ST', '') +CR_LF+
    'WHERE' +CR_LF+ IFF(ComSituacao, '  (ST.TIPOSIT   = ''F'') AND'+CR_LF, '')+
    '  (R.IDPROVENTO = ' +FloatToStr(IdProvento)+ ')'+
    IFF(ComSituacao, ' AND' +CR_LF+ '  (ST.IDSITFUNC = R.IDSITFUNC)', ''));
end;

function TCtrlProvDesc.ListRubricasIncidEm(IdProvento: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  R.IDRUBPRINC, R.IDRUBSECUND, R.FLGBASECALC,'+CR_LF+
    '  R.FLGTIPOFOLHA, R.INDPERIODO, R.FLGACAOINCIDE,'+CR_LF+
    '  SUBSTR(RTRIM(P.DESCRICAO),1,40) AS DESCRICAO,'+CR_LF+
    '  P.NUMPRIORIDADE'+CR_LF+
    'FROM'+CR_LF+
    '  PROVDESC P, RUBXRUB R'+CR_LF+
    'WHERE'+CR_LF+
    '  (R.IDRUBPRINC  = '+FloatToStr(IdProvento)+') AND'+CR_LF+
    '  (R.IDRUBSECUND = P.IDPROVENTO)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  DESCRICAO');
end;

function TCtrlProvDesc.ListRubricasIncidDe(IdProvento: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  R.IDRUBPRINC, R.IDRUBSECUND, R.FLGBASECALC,'+CR_LF+
    '  R.FLGTIPOFOLHA, R.INDPERIODO, R.FLGACAOINCIDE,'+CR_LF+
    '  SUBSTR(RTRIM(P.DESCRICAO),1,40) AS DESCRICAO,'+CR_LF+
    '  P.NUMPRIORIDADE'+CR_LF+
    'FROM'+CR_LF+
    '  PROVDESC P, RUBXRUB R'+CR_LF+
    'WHERE'+CR_LF+
    '  (R.IDRUBSECUND = '+FloatToStr(IdProvento)+') AND'+CR_LF+
    '  (R.IDRUBPRINC  = P.IDPROVENTO)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  DESCRICAO');
end;

function TCtrlProvDesc.ListRubricasRH: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDPROVENTO, RTRIM(DESCRICAO) AS DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  PROVDESC'+CR_LF+
    'WHERE'+CR_LF+
    '  (FLGTPRUBRICA LIKE ''%F%'')');
end;

function TCtrlProvDesc.ListRubricaEmpresa(ListaIdEmpresa: string; ConstaFolha: integer;
  Campos: string; SelBeneficio: integer; SelRubApoio: boolean): OleVariant;
var
  sSQL: string;
begin
  if (ConstaFolha > -1) then
    sSQL := '  (PD.FLGCONSTAFOLHA = '+IntToStr(ConstaFolha)+') AND'+CR_LF
  else
    sSQL := '';

  case (SelBeneficio) of
    0 : sSQL := sSQL + '  (PD.IDBENEFSALAR  IS NULL) AND'+CR_LF;
    1 : sSQL := sSQL + '  (PD.IDBENEFSALAR  IS NOT NULL) AND'+CR_LF;
  end;

  if not(SelRubApoio) then
    sSQL := sSQL + '  (PD.FLGDESCONTO < 2) AND'+CR_LF;

  Result := GetDataPacket(
    'SELECT'+CR_LF+
    IFF(Campos <> '', Campos, '  RP.*, PD.*')+CR_LF+
    'FROM'+CR_LF+
    '  RUBRICAXPESS RP, PROVDESC PD'+CR_LF+
    'WHERE'+CR_LF+
    sSQL+
    '  (PD.FLGTPRUBRICA LIKE ''%F%'') AND'+CR_LF+
    IFF(Pos(',', ListaIdEmpresa) > 0,
      '  (RP.IDPESSOA  IN (' +ListaIdEmpresa+ ')) AND',
      '  (RP.IDPESSOA   = ' +ListaIdEmpresa+ ') AND')+CR_LF+
    '  (PD.IDPROVENTO = RP.IDRUBRICA)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  UPPER(RP.DESCRPROVDESC)');
end;

function TCtrlProvDesc.ListProvento(IdRubrica, IdEmpresa: double; ConstaFolha: integer;
  Campos: string): OleVariant;
var
  sSQL: string;
begin
  if (ConstaFolha > -1) then
    sSQL := '  (PD.FLGCONSTAFOLHA = '+IntToStr(ConstaFolha)+') AND'+CR_LF
  else
    sSQL := '';

  Result := GetDataPacket(
    'SELECT'+CR_LF+
    IFF(Campos <> '', Campos,
      '  RP.IDRUBRICA, (''  '' || RTRIM(LTRIM(RP.DESCRPROVDESC))) AS DESCRPROVDESC')+CR_LF+
    'FROM'+CR_LF+
    '  RUBRICAXPESS RP, PROVDESC PD'+CR_LF+
    'WHERE'+CR_LF+
    '  (RP.IDRUBRICA = ' +FloatToStr(IdRubrica)+ ') AND'+CR_LF+
    '  (RP.IDPESSOA  = ' +FloatToStr(IdEmpresa)+ ') AND'+CR_LF+
    sSQL+
    '  (RP.IDRUBRICA = PD.IDPROVENTO) AND'+CR_LF+
    '  (PD.FLGTPRUBRICA LIKE ''%F%'')');
end;

function TCtrlProvDesc.GetDescricaoRubrica(IdRubrica, IdEmpresa: double): string;
var
  _Cds: TCMClientDataSet;
begin
  _Cds := TCMClientDataSet.Create(nil);

  _Cds.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  ''  '' || RTRIM(LTRIM(RP.DESCRPROVDESC)) AS DESCRPROVDESC'+CR_LF+
    'FROM'+CR_LF+
    '  RUBRICAXPESS RP, PROVDESC PD'+CR_LF+
    'WHERE'+CR_LF+
    '  (RP.IDRUBRICA = ' +FloatToStr(IdRubrica)+ ') AND'+CR_LF+
    '  (RP.IDPESSOA  = ' +FloatToStr(IdEmpresa)+ ') AND'+CR_LF+
    '  (RP.IDRUBRICA = PD.IDPROVENTO) AND'+CR_LF+
    '  (PD.FLGTPRUBRICA LIKE ''%F%'')');

  Result := _Cds.FieldByName('DESCRPROVDESC').asString;

  FreeAndNil(_Cds);
end;

function TCtrlProvDesc.GetDescricaoRubricaCopia(DescricaoProxima: string): integer;
var
  _Cds: TCMClientDataSet;
begin
  _Cds := TCMClientDataSet.Create(nil);

  _Cds.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  MAX(NVL(TO_NUMBER(SUBSTR(DESCRICAO,'+IntToStr(Length(DescricaoProxima)+1)+
      ',2)),0)) AS NUM'+CR_LF+
    'FROM'+CR_LF+
    '  PROVDESC'+CR_LF+
    'WHERE'+CR_LF+
    '  (DESCRICAO LIKE ' +QuotedStr(DescricaoProxima +'%')+ ')');

  if (_Cds.IsEmpty) then
    Result := 0
  else
    Result := _Cds.FieldByName('NUM').asInteger;

  FreeAndNil(_Cds);
end;

function TCtrlProvDesc.CopiarRubrica: boolean;
var
  _Cds, _CdsRubSit, _CdsRubxRubEm, _CdsRubxRubDe: TCMClientDataSet;

{-->}procedure GerarProxDescricaoRubricaCopia;
     var
       iNumCopiaRub: integer;
       sDecricaoRubAtual: string;
     begin
       sDecricaoRubAtual := ('Cópia - ') +
         Trim(FCds.FieldByName('DESCRICAO').asString) +' - ';
       iNumCopiaRub := GetDescricaoRubricaCopia(sDecricaoRubAtual) + 1;
       _Cds.Edit;
       _Cds.FieldByName('DESCRICAO').asString := sDecricaoRubAtual + IntToStr(iNumCopiaRub);
       _Cds.Post;
{-->}end;
begin
  Result := true;
  try
    _Cds := TCMClientDataSet.Create(nil);
    _CdsRubSit := TCMClientDataSet.Create(nil);
    _CdsRubxRubEm := TCMClientDataSet.Create(nil);
    _CdsRubxRubDe := TCMClientDataSet.Create(nil);
    try
      FCds.DisableControls;
      FCdsRubSit.DisableControls;
      FCdsRubxRubEm.DisableControls;
      FCdsRubxRubDe.DisableControls;

      _Cds.Data := FCds.Data;
      _CdsRubSit.Data := FCdsRubSit.Data;
      _CdsRubxRubEm.Data := FCdsRubxRubEm.Data;
      _CdsRubxRubDe.Data := FCdsRubxRubDe.Data;

      if not(AssociarDadosCds(FCds, _Cds)) then
        raise Exception.Create(('Erro ao tentar inserir dados na tabela: ')+
          FDb.TableName);
      GerarProxDescricaoRubricaCopia;
      if not(AssociarDadosCds(FCdsRubSit, _CdsRubSit)) then
        raise Exception.Create(('Erro ao tentar inserir dados na tabela: ')+
          FDbRubSit.TableName);
      if not(AssociarDadosCds(FCdsRubxRubEm, _CdsRubxRubEm)) or
         not(AssociarDadosCds(FCdsRubxRubDe, _CdsRubxRubDe)) then
        raise Exception.Create(('Erro ao tentar inserir dados na tabela: ')+
          FDbRubxRub.TableName);

      if (GravarProvDesc(_Cds.Data, _CdsRubSit.Data, _CdsRubxRubEm.Data, _CdsRubxRubDe.Data)) then
        MessageInfo := ('Replicação concluída com sucesso.')
      else
        raise Exception.Create(MessageInfo);

      FCds.EnableControls;
      FCdsRubSit.EnableControls;
      FCdsRubxRubEm.EnableControls;
      FCdsRubxRubDe.EnableControls;

      Result := true;
    except
      on E: Exception do
      begin
        MessageInfo := E.Message;
        Result := false;
      end;
    end;
  finally
    FreeAndNil(_Cds);
    FreeAndNil(_CdsRubSit);
    FreeAndNil(_CdsRubxRubEm);
    FreeAndNil(_CdsRubxRubDe);
  end;
end;

function TCtrlProvDesc.GravarProvento: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarProvento(FCds.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCds, FDb, [], []);
      if not(Result) then
        raise Exception.Create(FDb.MessageInfo);

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

function TCtrlProvDesc.GravarProventoMaisRubrica(IdEmpresa: integer;
  CodProvDesc, Descricao, CodCLT: string): boolean;
var
  _CdsAux: TCMClientDataSet;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarProventoMaisRubrica(IdEmpresa, CodProvDesc,
      Descricao, CodCLT);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    _CdsAux := TCMClientDataSet.Create(nil);
    _CdsAux.Data := ListProvDesc(-1);
    _CdsAux.EmptyDataSet;
    _CdsAux.Insert;
    _CdsAux.FieldByName('DESCRICAO').asString := Descricao;
    _CdsAux.FieldByName('FLGTPRUBRICA').asString := 'F';
    _CdsAux.FieldByName('FLGDESCONTO').asInteger := 2;
    _CdsAux.FieldByName('FLGCONSTAFOLHA').asInteger := 1;
    _CdsAux.FieldByName('CODRUBCLT').asString := CodCLT;
    _CdsAux.Post;
    try
      StartTransaction;

      Result := ApplyCds(_CdsAux, FDb, [], []);
      if (Result) then
      begin
        if (Result) then
          if not(ExecSQL(
                 'INSERT INTO RUBRICAXPESS (IDRUBRICA,IDPESSOA,CODPROVDESC,DESCRPROVDESC) '+
                 'VALUES ('+FDb.IdProvento.asString+','+FloatToStr(IdEmpresa)+','+
                 QuotedStr(CodProvDesc)+','+QuotedStr(Descricao)+')')) then
            raise Exception.Create(MessageInfo);
      end
      else
        raise Exception.Create(FDb.MessageInfo);

      Commit;  
    except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
    _CdsAux.Free;
  end;
end;

function TCtrlProvDesc.GravarProvDesc(ovProvento, ovRubSit, ovRubxRubEm,
  ovRubxRubDe: OleVariant): boolean;
var
  _Cds, _CdsRubSit, _CdsRubxRubEm, _CdsRubxRubDe: TCMClientDataSet;
begin
  try
    _Cds := TCMClientDataSet.Create(nil);
    _CdsRubSit := TCMClientDataSet.Create(nil);
    _CdsRubxRubEm := TCMClientDataSet.Create(nil);
    _CdsRubxRubDe := TCMClientDataSet.Create(nil);

    _Cds.Data := ovProvento;
    _CdsRubSit.Data := ovRubSit;
    _CdsRubxRubEm.Data := ovRubxRubEm;
    _CdsRubxRubDe.Data := ovRubxRubDe;

    if (ConnectionSide = cnsClient) then
    begin
      Result := Connection.AppServer.GravarProvDesc(_Cds.Data, _CdsRubSit.Data,
        _CdsRubxRubEm.Data, _CdsRubxRubDe.Data);
      if not(Result) then
        MessageInfo := Connection.AppServer.MessageInfo;
    end
    else
    begin
      try
        StartTransaction;

        Result := ApplyCds(_Cds, FDb, [], []);
        if (Result) then
        begin
          Result := ApplyCds(_CdsRubSit, FDbRubSit, [FDb.IdProvento], [FDbRubSit.IdProvento]);
          if (Result) then
          begin
            Result := ApplyCds(_CdsRubxRubEm, FDbRubxRub, [FDb.IdProvento], [FDbRubxRub.IdRubPrinc]);
            if (Result) then
            begin
              Result := ApplyCds(_CdsRubxRubDe, FDbRubxRub, [FDb.IdProvento], [FDbRubxRub.IdRubSecund]);
              if not(Result) then
                raise Exception.Create(FDbRubxRub.MessageInfo);
            end
            else
              raise Exception.Create(FDbRubxRub.MessageInfo);
          end
          else
            raise Exception.Create(FDbRubSit.MessageInfo);
        end
        else
          raise Exception.Create(FDb.MessageInfo);

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
  finally
    FreeAndNil(_Cds);
    FreeAndNil(_CdsRubSit);
    FreeAndNil(_CdsRubxRubEm);
    FreeAndNil(_CdsRubxRubDe);
  end;
end;

function TCtrlProvDesc.ExcluirProvDesc: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.ExcluirProvDesc(FCds.Data, FCdsRubSit.Data,
      FCdsRubxRubEm.Data, FCdsRubxRubDe.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      FCdsRubxRubDe.First;
      while not(FCdsRubxRubDe.EOF) do
        FCdsRubxRubDe.Delete;

      Result := ApplyCds(FCdsRubxRubDe, FDbRubxRub, [], []);
      if (Result) then
      begin
        FCdsRubxRubEm.First;
        while not(FCdsRubxRubEm.EOF) do
          FCdsRubxRubEm.Delete;

        Result := ApplyCds(FCdsRubxRubEm, FDbRubxRub, [], []);
        if (Result) then
        begin
          FCdsRubSit.First;
          while not(FCdsRubSit.EOF) do
            FCdsRubSit.Delete;

          Result := ApplyCds(FCdsRubSit, FDbRubSit, [], []);
          if (Result) then
          begin
            Result := ApplyCds(FCds, FDb, [], []);
            if not(Result) then
              raise Exception.Create(FDb.MessageInfo);
          end
          else
            raise Exception.Create(FDbRubSit.MessageInfo);
        end
        else
          raise Exception.Create(FDbRubxRub.MessageInfo);
      end
      else
        raise Exception.Create(FDbRubxRub.MessageInfo);

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

function TCtrlProvDesc.GravarRubricaEmpresa(Operacao: integer; IdProvento,
  IdEmpresa: double; TipoRubrica, CodProvDesc, DescrProvDesc: string): boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarRubricaEmpresa(Operacao, IdProvento, IdEmpresa,
      TipoRubrica, CodProvDesc, DescrProvDesc);

    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      // Atualizar a visibilidade
      if (TipoRubrica <> '') then
        Result := ExecSQL('UPDATE PROVDESC SET FLGTPRUBRICA = '+QuotedStr(Trim(TipoRubrica))+
          ' WHERE (IDPROVENTO = '+FloatToStr(IdProvento)+')')
      else
        Result := true;

      // Atualizar a RubricaXPess
      if (Result) then
        case (Operacao) of
          INSERIR : Result :=
            ExecSQL('INSERT INTO RUBRICAXPESS (IDRUBRICA,IDPESSOA,CODPROVDESC,DESCRPROVDESC) '+
              'VALUES ('+FloatToStr(IdProvento)+','+FloatToStr(IdEmpresa)+','+
              QuotedStr(CodProvDesc)+','+QuotedStr(DescrProvDesc)+')');
          ALTERAR : Result :=
            ExecSQL('UPDATE RUBRICAXPESS SET CODPROVDESC='+QuotedStr(CodProvDesc)+
              ',DESCRPROVDESC='+QuotedStr(DescrProvDesc)+' WHERE (IDRUBRICA = '+
              FloatToStr(IdProvento)+') AND '+'(IDPESSOA = '+FloatToStr(IdEmpresa)+')');
          EXCLUIR : Result :=
            ExecSQL('DELETE RUBRICAXPESS WHERE (IDRUBRICA = '+
              FloatToStr(IdProvento)+') AND '+'(IDPESSOA = '+FloatToStr(IdEmpresa)+')');
        end;

      if not(Result) then
        raise Exception.Create(MessageInfo);

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

function TCtrlProvDesc.AlterarTipoRubricaEmpresa(Visivel: boolean;
  IdEmpresa: double): boolean;
var
  sSQL: string;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.AlterarTipoRubricaEmpresa(Visivel, IdEmpresa);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      if (Visivel) then
      begin // Para Tornar todas VISÍVEIS
        sSQL :=
          'FLGTPRUBRICA = DECODE(RTRIM(LTRIM(FLGTPRUBRICA)), '''', ''F'','+CR_LF+
          '  DECODE(INSTR(RTRIM(LTRIM(FLGTPRUBRICA)),''F''), 0,'+CR_LF+
          '  RTRIM(LTRIM(FLGTPRUBRICA)) || ''F'', RTRIM(LTRIM(FLGTPRUBRICA))))'+CR_LF;
      end
      else
      begin // Para Tornar todas INVISÍVEIS
        sSQL :=
          'FLGTPRUBRICA = DECODE(RTRIM(LTRIM(FLGTPRUBRICA)), '''', '''','+CR_LF+
          '  DECODE(INSTR(RTRIM(LTRIM(FLGTPRUBRICA)),''F''), 0,'+CR_LF+
          '  RTRIM(LTRIM(FLGTPRUBRICA)), RTRIM(LTRIM(REPLACE(FLGTPRUBRICA,''F'','''')))))'+CR_LF;
      end;

      Result := ExecSQL('UPDATE PROVDESC SET' +CR_LF+ sSQL + 'WHERE'+CR_LF+
        '  (IDPROVENTO IN (SELECT IDRUBRICA FROM RUBRICAXPESS WHERE IDPESSOA = ' +
        FloatToStr(IdEmpresa)+'))');

      if not(Result) then
        raise Exception.Create(MessageInfo);

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

function TCtrlProvDesc.ListRubSel(IdEmpresa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  RP.IDRUBRICA, RP.IDPESSOA, RP.CODPROVDESC,'+CR_LF+
    '  RTRIM(RP.DESCRPROVDESC) AS DESCRPROVDESC,'+CR_LF+
    '  RTRIM(LTRIM(PD.FLGTPRUBRICA)) AS FLGTPRUBRICA,'+CR_LF+
    '  RTRIM(PD.DESCRICAO) AS DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  RUBRICAXPESS RP, PROVDESC PD'+CR_LF+
    'WHERE'+CR_LF+
    '  (RP.IDPESSOA  = '+FloatToStr(IdEmpresa)+') AND'+CR_LF+
    '  (RP.IDRUBRICA = PD.IDPROVENTO)');
end;

function TCtrlProvDesc.ListRubNaoSel(IdEmpresa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  P.IDPROVENTO, P.FLGTPRUBRICA, RTRIM(P.DESCRICAO) AS DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  PROVDESC P'+CR_LF+
    'WHERE'+CR_LF+
    '  (NOT EXISTS(SELECT RP.IDRUBRICA'+CR_LF+
    '              FROM   RUBRICAXPESS RP'+CR_LF+
    '              WHERE  (RP.IDPESSOA  = '+FloatToStr(IdEmpresa)+') AND'+CR_LF+
    '                     (RP.IDRUBRICA = P.IDPROVENTO))) AND'+CR_LF+
    '  (RTRIM(P.DESCRICAO) IS NOT NULL)');
end;

end.
