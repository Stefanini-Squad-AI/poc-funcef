{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 11/07/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlCtFolha;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio, uCMClientDataSet,
  uCtrlCustomRH, uDbProvDesc, uDbContabFolha;

type
  TCtrlCtFolha = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbContabFolha: TDbContabFolha;
    FDbProvDesc: TDbProvDesc;

    FCdsProvDesc: TCMClientDataSet;
    FCdsContab: TCMClientDataSet;
    FCdsCAP: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListContabFolha: OleVariant;
    function ListParametrosContab(const IdEmpresa: integer; const Plano: integer;
      const IdProvento: double): OleVariant;
    function ListParametroCAP(const IdEmpresa: integer; const IdProvento: double): OleVariant;
    function ListContabFolhaXEmpresa(const IdProvento: double; const IdEmpresa: integer;
      const CodCentroCusto: string): OleVariant;

    function GravarContabFolha: boolean;

    property CdsProvDesc: TCMClientDataSet read FCdsProvDesc write FCdsProvDesc;
    property CdsContab: TCMClientDataSet read FCdsContab write FCdsContab;
    property CdsCAP: TCMClientDataSet read FCdsCAP write FCdsCAP;
  end;

implementation

uses  uCMTypes, uCtrlFuncoesRH;
 //*Variants,
{ TCtrlCtFolha }

constructor TCtrlCtFolha.Create;
begin
  inherited;
  FDbContabFolha := TDbContabFolha.Create(Self);
  FDbProvDesc := TDbProvDesc.Create(Self);
end;

destructor TCtrlCtFolha.Destroy;
begin
  FDbContabFolha.Free;
  FDbProvDesc.Free;
  if (IsAppServer) then
  begin
    FCdsProvDesc.Free;
    FCdsContab.Free;
    FCdsCAP.Free;
  end;
  inherited;
end;

procedure TCtrlCtFolha.OnCreateAppServer;
begin
  inherited;
  FCdsProvDesc := TCMClientDataSet.Create(nil);
  FCdsContab := TCMClientDataSet.Create(nil);
  FCdsCAP := TCMClientDataSet.Create(nil);
end;

procedure TCtrlCtFolha.DoChangeDataBase;
begin
  inherited;
  FDbContabFolha.DataBaseName := DataBaseName;
  FDbProvDesc.DataBaseName := DataBaseName;
end;

function TCtrlCtFolha.ListContabFolha: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  IDCONTABFOLHA, IDPROVENTO, UNIDNEGOC, RECPAG, IDPLANO1, IDPLANO2,' +CR_LF+
    '  IDPESSDEBITO, IDPESSCREDITO, IDFAVORECIDO, IDEMPRESAPROP,' +CR_LF+
    '  IDEMPRESA, CONTADEBITO, CONTACREDITO, CODTIPRECDES, CODSUBDEBITO,' +CR_LF+
    '  CODSUBCREDITO, CODCENTRORESPON, CODCENTROCUSTO, HITCODHISTDEBITO,' +CR_LF+
    '  HITCODHISTCREDITO, FLGSUBEMPREGDEB, FLGSUBEMPREGCRED' +CR_LF+
    'FROM' +CR_LF+
    '  CONTABFOLHA' +CR_LF+
    'ORDER BY' +CR_LF+
    '  IDPROVENTO, IDCONTABFOLHA');
end;

function TCtrlCtFolha.ListParametrosContab(const IdEmpresa: integer; const Plano: integer;
  const IdProvento: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  IDCONTABFOLHA, IDPROVENTO,' +CR_LF+
    '  CONTADEBITO, IDPLANO1, HITCODHISTDEBITO, IDPESSDEBITO, CODSUBDEBITO,' +CR_LF+
    '  CONTACREDITO, IDPLANO2, HITCODHISTCREDITO, IDPESSCREDITO, CODSUBCREDITO,' +CR_LF+
    '  IDEMPRESA, CODCENTROCUSTO, FLGSUBEMPREGDEB, FLGSUBEMPREGCRED' +CR_LF+
    'FROM' +CR_LF+
    '  CONTABFOLHA' +CR_LF+
    'WHERE' +CR_LF+
    '  (IDPROVENTO        = ' +FloatToStr(IdProvento)+ ') AND' +CR_LF+
    '  (IDPLANO1          = ' +IntToStr(Plano)+ ') AND' +CR_LF+
    '  ((CODCENTROCUSTO  IS NULL) OR' +CR_LF+
    '   ((CODCENTROCUSTO IS NOT NULL) AND' +CR_LF+
    '    (IDEMPRESA       = ' +IntToStr(IdEmpresa)+ '))) AND' +CR_LF+
    '  ((CODSUBDEBITO    IS NULL) OR' +CR_LF+
    '   ((CODSUBDEBITO   IS NOT NULL) AND' +CR_LF+
    '    (IDPESSDEBITO    = ' +IntToStr(IdEmpresa)+ '))) AND' +CR_LF+
    '  ((CODSUBCREDITO   IS NULL) OR' +CR_LF+
    '   ((CODSUBCREDITO  IS NOT NULL) AND' +CR_LF+
    '    (IDPESSCREDITO   = ' +IntToStr(IdEmpresa)+ '))) AND' +CR_LF+
    '  (CODTIPRECDES IS NULL)');
end;

function TCtrlCtFolha.ListParametroCAP(const IdEmpresa: integer;
  const IdProvento: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  CF.IDCONTABFOLHA, CF.IDPROVENTO, CF.IDEMPRESAPROP,' +CR_LF+
    '  CF.UNIDNEGOC, CF.CODCENTRORESPON, CF.CODTIPRECDES,' +CR_LF+
    '  CF.IDFAVORECIDO, CF.IDEMPRESA' +CR_LF+
    'FROM' +CR_LF+
    '  CONTABFOLHA CF, TIPORECEBDESEMB TRD' +CR_LF+
    'WHERE' +CR_LF+
    '  (CF.IDEMPRESA    = ' +IntToStr(IdEmpresa)+ ') AND' +CR_LF+
    '  (CF.IDPROVENTO   = ' +FloatToStr(IdProvento)+ ') AND' +CR_LF+
    '  (CF.CODTIPRECDES = TRD.CODTIPRECDES) AND' +CR_LF+
    '  (TRD.IDPESSOA    = ' +IntToStr(IdEmpresa)+ ') AND' +CR_LF+
    '  (TRD.RECPAG      = ''P'') AND' +CR_LF+
    '  (CF.CONTACREDITO IS NULL) AND' +CR_LF+
    '  (CF.CONTADEBITO  IS NULL)');
end;

function TCtrlCtFolha.ListContabFolhaXEmpresa(const IdProvento: double;
  const IdEmpresa: integer; const CodCentroCusto: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  C.IDPLANO1, C.IDPLANO2, C.CONTADEBITO, C.IDPESSDEBITO,' +CR_LF+
    '  C.CONTACREDITO, C.IDPESSCREDITO, C.CODSUBDEBITO, C.RECPAG,' +CR_LF+
    '  C.CODSUBCREDITO, C.CODTIPRECDES, C.CODCENTRORESPON, C.UNIDNEGOC,' +CR_LF+
    '  C.FLGSUBEMPREGDEB, C.FLGSUBEMPREGCRED,'+CR_LF+
    '  C.IDFAVORECIDO, PD.DESCRICAO, PD.FLGDESCONTO, PD.CODRUBCLT' +CR_LF+
    'FROM' +CR_LF+
    '  CONTABFOLHA C, PROVDESC PD' +CR_LF+
    'WHERE' +CR_LF+
    '  (C.IDPROVENTO        = ' +FloatToStr(IdProvento)+ ') AND' +CR_LF+
    '  ((C.IDPESSDEBITO    IS NULL) OR' +CR_LF+
    '   (C.IDPESSDEBITO     = ' +IntToStr(IdEmpresa)+ ')) AND' +CR_LF+
    '  ((C.IDPESSCREDITO   IS NULL) OR' +CR_LF+
    '   (C.IDPESSCREDITO    = ' +IntToStr(IdEmpresa)+ ')) AND' +CR_LF+
    IFF(CodCentroCusto<>'',
      '  (C.CODCENTROCUSTO    = ' +QuotedStr(CodCentroCusto)+ ') AND' +CR_LF+
      '  (C.IDEMPRESA         = ' +IntToStr(IdEmpresa)+ ') AND',
      '  (C.CODCENTROCUSTO   IS NULL) AND') +CR_LF+
    '  (C.IDPROVENTO        = PD.IDPROVENTO)');
end;

function TCtrlCtFolha.GravarContabFolha: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarContabFolha(
      FCdsProvDesc.Data, FCdsContab.Data, FCdsCAP.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsProvDesc, FDbProvDesc, [], []);
      if (Result) then
      begin
        Result := ApplyCds(FCdsContab, FDbContabFolha, [], []);
        if (Result) then
        begin
          FDbContabFolha.Clear;
          Result := ApplyCds(FCdsCAP, FDbContabFolha, [], []);
          if not(Result) then
            raise Exception.Create(FDbContabFolha.MessageInfo);
        end
        else
          raise Exception.Create(FDbContabFolha.MessageInfo);
      end
      else
        raise Exception.Create(FDbProvDesc.MessageInfo);

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
