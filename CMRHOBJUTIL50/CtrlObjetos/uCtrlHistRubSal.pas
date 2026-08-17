{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 12/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlHistRubSal;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio,  uCMClientDataSet,
  uCtrlCustomRH, uDbHistRubSal;

type
  TCtrlHistRubSal = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbDet: TDbHistRubSal;
    FCdsDet: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListHistRubSal(IdPessoa: double; IdEmpresa: integer): OleVariant;

    function Gravar: boolean;

    property CdsDet: TCMClientDataSet read FCdsDet write FCdsDet;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlHistRubSal }

constructor TCtrlHistRubSal.Create;
begin
  inherited;
  FDbDet := TDbHistRubSal.Create(Self);
end;

destructor TCtrlHistRubSal.Destroy;
begin
  FDbDet.Free;
  if (IsAppServer) then
    FCdsDet.Free;
  inherited;
end;

procedure TCtrlHistRubSal.OnCreateAppServer;
begin
  inherited;
  FCdsDet := TCMClientDataSet.Create(nil);
end;

procedure TCtrlHistRubSal.DoChangeDataBase;
begin
  inherited;
  FDbDet.DataBaseName := DataBaseName;
end;

function TCtrlHistRubSal.ListHistRubSal(IdPessoa: double; IdEmpresa: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  H.IDPESSOA, H.IDPESSJUR, H.IDPATRO, H.IDMOTIVO, H.IDMODULO, H.MES,' +CR_LF+
    '  H.MESCOBRANCA, H.REFERENCIA, H.IDRUBRICA, H.CODPROVDESC, H.VALORPROVENTO,' +CR_LF+
    '  H.SEQRUBRICA, H.DATAPAGAMENTO, RP.DESCRPROVDESC' +CR_LF+
    'FROM' +CR_LF+
    '  HISTRUBSAL H, RUBRICAXPESS RP' +CR_LF+
    'WHERE' +CR_LF+
    '  (H.IDPESSOA  = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
    '  (H.IDMODULO  = 21) AND' +CR_LF+
    '  (H.IDPESSJUR = ' +IntToStr(IdEmpresa)+ ') AND' +CR_LF+
    '  (H.IDRUBRICA = RP.IDRUBRICA) AND' +CR_LF+
    '  (H.IDPESSJUR = RP.IDPESSOA)');
end;

function TCtrlHistRubSal.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarHistRubSal(FCdsDet.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsDet, FDbDet, [], [], true);
      if not(Result) then
        raise Exception.Create(FDbDet.MessageInfo);

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
