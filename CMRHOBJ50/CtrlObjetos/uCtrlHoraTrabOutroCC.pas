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

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet, uCtrlCustomRH,
  uDbHoraTrabOutroCC;

type
  TCtrlHoraTrabOutroCC = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;    
  private
    FDbHoraTrabOutroCC: TDbHoraTrabOutroCC;
    FCdsHoraTrabOutroCC: TCMClientDataSet;
  public
    constructor Create;  override;
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
  sSQL := '';
  if (IdPessoa = -1) then
    sSQL := 'WHERE (1 = 2)'
  else
  begin
    if (IdPessoa > 0) then
      sSQL := 'WHERE' +CR_LF+ '  (IDPESSOA = ' +FloatToStr(IdPessoa)+ ')';

    if (NumSeq > 0) then
    begin
      if (IdPessoa > 0) then
        sSQL := sSQL +' AND'
      else
        sSQL := sSQL +'WHERE';

      sSQL := sSQL +CR_LF+ '  (NUMSEQ = ' +FloatToStr(NumSeq)+ ')';
    end;
    sSQL := sSQL + ' AND H.CODCENTROCUSTO = CC.CODCENTROCUSTO ';
    sSQL := sSQL + ' AND H.IDEMPRESA      = CC.IDEMPRESA ';
  end;

  if (IdPessoa = 0) then
  begin
    sSQL := 'WHERE H.CODCENTROCUSTO = CC.CODCENTROCUSTO ';
    sSQL := sSQL + ' AND H.IDEMPRESA      = CC.IDEMPRESA ';
  end;

  sSQL := sSQL + 'ORDER BY  H.IDPESSOA, H.DATATRAB';

  Result := GetDataPacket(
    'SELECT'+IFF(IdPessoa=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  H.*, CC.NOME AS CENTROCUSTO '+CR_LF+
    'FROM'+CR_LF+
    '  HoraTrabOutroCC H, CentCust CC'+CR_LF+
    sSQL);
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
      if (Result) then
        Commit
      else
        raise Exception.Create(FDbHoraTrabOutroCC.MessageInfo);
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
