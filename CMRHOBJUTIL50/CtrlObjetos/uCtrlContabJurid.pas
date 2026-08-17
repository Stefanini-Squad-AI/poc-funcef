{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 29/10/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlContabJurid;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio,  uCMClientDataSet,
  uCtrlCustomRH, uDbContabJurid;

type
  TCtrlContabJurid = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbContabJurid: TDbContabJurid;
    FCdsContabJurid: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListContabJurid(CodTipoObjeto: double): OleVariant;

    function GravarContabJurid: boolean;

    property CdsContabJurid: TCMClientDataSet read FCdsContabJurid write FCdsContabJurid;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlContabJurid }

constructor TCtrlContabJurid.Create;
begin
  inherited;
  FDbContabJurid := TDbContabJurid.Create(Self);
end;

destructor TCtrlContabJurid.Destroy;
begin
  FDbContabJurid.Free;
  if (IsAppServer) then
    FCdsContabJurid.Free;
  inherited;
end;

procedure TCtrlContabJurid.OnCreateAppServer;
begin
  inherited;
  FCdsContabJurid := TCMClientDataSet.Create(nil);
end;

procedure TCtrlContabJurid.DoChangeDataBase;
begin
  inherited;
  FDbContabJurid.DataBaseName := DataBaseName;
end;

function TCtrlContabJurid.ListContabJurid(CodTipoObjeto: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  CJ.*,'+CR_LF+
    '  DECODE(CJ.INDMATERIA,'+CR_LF+
    '    0,' +QuotedStr(('Qualquer'))+ ','+CR_LF+
    '    1,' +QuotedStr(('Trabalhista'))+ ','+CR_LF+
    '    2,' +QuotedStr(('Previdenciária'))+ ','+CR_LF+
    '    3,' +QuotedStr(('Prev./Trabalhista'))+ ','+CR_LF+
    '    4,' +QuotedStr(('Civil'))+ ','+CR_LF+
    '    5,' +QuotedStr(('Comercial'))+ ','+CR_LF+
    '    6,' +QuotedStr(('Tributária'))+ ','+CR_LF+
    '    ' +QuotedStr(('Penal'))+CR_LF+
    '  ) AS MATERIA'+CR_LF+
    'FROM'+CR_LF+
    '  CONTABJURID CJ'+CR_LF+
    'WHERE'+CR_LF+
    '  (CJ.CODTIPOOBJETO = ' +FloatToStr(CodTipoObjeto)+ ')'+CR_LF+
    'ORDER BY'+CR_LF+
    '  INDMATERIA, IDCONTABJURID');
end;

function TCtrlContabJurid.GravarContabJurid: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarContabJurid(FCdsContabJurid.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      
      Result := ApplyCds(FCdsContabJurid, FDbContabJurid, [], []);
      if not(Result) then
        raise Exception.Create(FDbContabJurid.MessageInfo);

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
