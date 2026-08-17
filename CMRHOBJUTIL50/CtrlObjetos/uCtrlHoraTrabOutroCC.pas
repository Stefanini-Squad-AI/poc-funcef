{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 07/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlHoraTrabOutroCC;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio,  uCMClientDataSet,
  uCtrlCustomRH, uDbHoraTrabOutroCC;

type
  TCtrlHoraTrabOutroCC = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;    
  private
    FDbHoraTrabOutroCC: TDbHoraTrabOutroCC;
    FCdsHoraTrabOutroCC: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function GravarHoraTrabOutroCC: boolean;
    function ListHoraTrabOutroCC(IdPessoa: double = 0; NumSeq: double = 0): OleVariant;

    property CdsHoraTrabOutroCC: TCMClientDataSet read FCdsHoraTrabOutroCC write FCdsHoraTrabOutroCC;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlHoraTrabOutroCC }

constructor TCtrlHoraTrabOutroCC.Create;
begin
  inherited;
  FDbHoraTrabOutroCC := TDbHoraTrabOutroCC.Create(Self);
end;

destructor TCtrlHoraTrabOutroCC.Destroy;
begin
  FDbHoraTrabOutroCC.Free;
  if (IsAppServer) then
    FCdsHoraTrabOutroCC.Free;
  inherited;
end;

procedure TCtrlHoraTrabOutroCC.OnCreateAppServer;
begin
  inherited;
  FCdsHoraTrabOutroCC := TCMClientDataSet.Create(nil);
end;

procedure TCtrlHoraTrabOutroCC.DoChangeDataBase;
begin
  inherited;
  FDbHoraTrabOutroCC.DatabaseName := DataBaseName;
end;

function TCtrlHoraTrabOutroCC.ListHoraTrabOutroCC(IdPessoa, NumSeq: double): OleVariant;
var
  sSQL: string;
begin
  if (IdPessoa = -1) then
    sSQL := '  (1 = 2)'
  else
  begin
    if (IdPessoa > 0) then
      sSQL := '  (H.IDPESSOA  = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF
    else
      sSQL := '';

    if (NumSeq > 0) then
      sSQL := sSQL + '  (H.NUMSEQ    = ' +FloatToStr(NumSeq)+ ') AND' +CR_LF;

    sSQL := sSQL +
      '  (H.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND' +CR_LF+
      '  (H.IDEMPRESA      = CC.IDEMPRESA) AND' +CR_LF;
  end;

  Result := GetDataPacket(
    'SELECT'+IFF(IdPessoa=-1,' /*+ OPTIMIZER_MODE RULE */','') +CR_LF+
    '  H.*, CC.NOME AS CENTROCUSTO,' +CR_LF+
    '  PE.NOME AS NOMEEMPRESA' +CR_LF+
    'FROM' +CR_LF+
    '  PESSOA PE, HORATRABOUTROCC H, CENTCUST CC' +CR_LF+
    'WHERE' +CR_LF+
    sSQL+
    '  (H.IDEMPRESA = PE.IDPESSOA)' +CR_LF+
    'ORDER BY' +CR_LF+
    '  H.IDPESSOA, H.DATATRAB');
end;

function TCtrlHoraTrabOutroCC.GravarHoraTrabOutroCC: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarHoraTrabOutroCC(FCdsHoraTrabOutroCC.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsHoraTrabOutroCC, FDbHoraTrabOutroCC, [], []);
      if not(Result) then
        raise Exception.Create(FDbHoraTrabOutroCC.MessageInfo);

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
