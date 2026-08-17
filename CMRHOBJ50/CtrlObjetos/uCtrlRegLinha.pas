{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 27/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlRegLinha;

interface

uses SysUtils, Forms, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet, uCtrlRad,
  uCtrlCustomRH, uDbLinhaXPess;

type
  TCtrlRegLinha = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
    procedure AfterInitialize; override;
  private
    FDbDet: TDbLinhaXPess;
    FCdsRadInst: TCMClientDataSet;
    FCdsDet: TCMClientDataSet;
    FCtrlRad: TCtrlRad;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListLinhaTransporte(IdPessoa: double): OleVariant;

    function Gravar: boolean;

    function AtualizarProcRAD(IdPessoa: double; OBS: string; IdTipoProcesso,
      IdEmpresa: integer): boolean;

    property CdsDet: TCMClientDataSet read FCdsDet write FCdsDet;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlRegLinha }

constructor TCtrlRegLinha.Create;
begin
  inherited;
  FDbDet := TDbLinhaXPess.Create(Self);
  FCdsRadInst := TCMClientDataSet.Create(nil);
  FCtrlRad := TCtrlRad.Create;
end;

destructor TCtrlRegLinha.Destroy;
begin
  FDbDet.Free;
  FCdsRadInst.Free;
  FCtrlRad.Free;
  if (IsAppServer) then
    FCdsDet.Free;
  inherited;
end;

procedure TCtrlRegLinha.OnCreateAppServer;
begin
  inherited;
  FCdsDet := TCMClientDataSet.Create(nil);
end;

procedure TCtrlRegLinha.AfterInitialize;
begin
  inherited;
  FCtrlRad.InitializeAs(Self);
end;

procedure TCtrlRegLinha.DoChangeDataBase;
begin
  inherited;
  FDbDet.DataBaseName := DataBaseName;
end;

function TCtrlRegLinha.ListLinhaTransporte(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  LP.IDPESSOA, LP.IDLINHATRANSP, LP.QTDDIARIA,'+CR_LF+
    '  LT.TIPOLINHATRANSP, LT.DESCRICAO, LT.NUMLINHATRANSP, LT.VLRLINHATRANSP'+CR_LF+
    'FROM'+CR_LF+
    '  LINHAXPESS LP, LINHATRANSP LT'+CR_LF+
    'WHERE'+CR_LF+
    '  (LP.IDPESSOA      = '+FloatToStr(IdPessoa)+') AND'+CR_LF+
    '  (LP.IDLINHATRANSP = LT.IDLINHATRANSP)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  DESCRICAO');
end;

function TCtrlRegLinha.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.Gravar(FCdsDet.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(FCdsDet, FDbDet, [], []);
      if (Result) then
        Commit
      else
        raise Exception.Create(FDbDet.MessageInfo);
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

function TCtrlRegLinha.AtualizarProcRAD(IdPessoa: double; OBS: string; IdTipoProcesso,
  IdEmpresa: integer): boolean;
var
  iIdProcesso: integer;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.AtualizarProcRAD(IdPessoa, OBS, IdTipoProcesso, IdEmpresa);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      FCdsRadInst.Data := GetDataPacket(
        'SELECT'+CR_LF+
        '  RI.IDPROCESSO, RI.IDPESSRESP'+CR_LF+
        'FROM'+CR_LF+
        '  RADINSTPROCESSO RI, RADTIPOPROCESSO RT'+CR_LF+
        'WHERE'+CR_LF+
        '  (RI.IDPESSRESP     = '+FloatToStr(IdPessoa)+') AND'+CR_LF+
        '  (RT.IDREFERENCIA   = 23) AND'+CR_LF+
        '  (RI.FLGOK         <> ''S'') AND'+CR_LF+
        '  (RI.IDTIPOPROCESSO = RT.IDTIPOPROCESSO)');

      if not(FCdsRadInst.IsEmpty) then
      begin
        StartTransaction;
        Result := ExecSQL('UPDATE RADINSTPROCESSO SET FLGOK = ''S''' +
                          'WHERE  IDPROCESSO = ' +FCdsRadInst.FieldByName('IDPROCESSO').asString);
        if not(Result) then
        begin
          Rollback;
          raise Exception.Create('Ocorreu um erro ao tentar atualizar o processo no RAD.'+
            CR_LF+ 'Erro:' +CR_LF +CR_LF+ MessageInfo);
        end
        else
          Commit
      end;

      FCtrlRad.TipoProcesso := IdTipoProcesso;
      FCtrlRad.IdEmpresa := IdEmpresa;
      FCtrlRad.IdEmpresa := trunc(IdPessoa);
      FCtrlRad.OBS := 'Vale Transporte: ' + OBS;

      iIdProcesso := FCtrlRad.IniciarProcesso;
      if (iIdProcesso < 0) then
        raise Exception.Create('Erro ao tentar instanciar o processo no RAD.'+CR_LF+
          'Erro:' +CR_LF +CR_LF+ MessageInfo)
      else
      begin
        MessageInfo := 'Processo RAD Nº '+ IntToStr(iIdProcesso)+' foi criado.';
        Result := true;
      end;
    except
      on E: Exception do
      begin
        MessageInfo := E.Message;
        Result := false;
      end;
    end;
  end;
end;

end.
