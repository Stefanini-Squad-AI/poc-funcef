{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 19/11/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlParcelasProcTrab;

interface

uses SysUtils, Controls, uCmDbObject, uCmControlObject, IvDictio, 
  uCMClientDataSet, uCtrlCustomRH, uDbParcelasProcTrab;

type
  TCtrlParcelasProcTrab = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbParcelasProcTrab: TDbParcelasProcTrab;
    FCdsParcelasProcTrab: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListParcelasProcTrab(NumProcTrab: double): OleVariant;

    procedure GerarParcelasProcTrab(NumProcTrab: double; NumParcelas: word;
      DataParcela: TDate; DadosObjetos: OleVariant);
    function GravarParcelasProcTrab: boolean;

    property CdsParcelasProcTrab: TCMClientDataSet read FCdsParcelasProcTrab write FCdsParcelasProcTrab;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlParcelasProcTrab }

constructor TCtrlParcelasProcTrab.Create;
begin
  inherited;
  FDbParcelasProcTrab := TDbParcelasProcTrab.Create(Self);
end;

destructor TCtrlParcelasProcTrab.Destroy;
begin
  FDbParcelasProcTrab.Free;
  if (IsAppServer) then
    FCdsParcelasProcTrab.Free;
  inherited;
end;

procedure TCtrlParcelasProcTrab.OnCreateAppServer;
begin
  inherited;
  FCdsParcelasProcTrab := TCMClientDataSet.Create(nil);
end;

procedure TCtrlParcelasProcTrab.DoChangeDataBase;
begin
  inherited;
  FDbParcelasProcTrab.DataBaseName := DataBaseName;
end;

function TCtrlParcelasProcTrab.ListParcelasProcTrab(NumProcTrab: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  NUMPROCTRAB, NUMPARCELA,DATAPARCELA, VALORPARCELA'+CR_LF+
    'FROM'+CR_LF+
    '  PARCELASPROCTRAB'+CR_LF+
    'WHERE'+CR_LF+
    '  (NUMPROCTRAB = ' +FloatToStr(NumProcTrab)+ ')');
end;

procedure TCtrlParcelasProcTrab.GerarParcelasProcTrab(NumProcTrab: double; NumParcelas: word;
  DataParcela: TDate; DadosObjetos: OleVariant);
var
  c: byte;
  dTotal: double;
  _CdsObjetos: TCMClientDataSet;
begin
  if (FCdsParcelasProcTrab.IsEmpty) then
  begin
    _CdsObjetos := TCMClientDataSet.Create(nil);
    try
      _CdsObjetos.Data := DadosObjetos;

      dTotal := 0;
      _CdsObjetos.First;
      while not(_CdsObjetos.EOF) do
      begin
        dTotal := dTotal + _CdsObjetos.FieldByName('VALORSENTENCA').asFloat;
        _CdsObjetos.Next;
      end;

      for c:=1 to NumParcelas do
      begin
        FCdsParcelasProcTrab.Insert;
        FCdsParcelasProcTrab.FieldByName('NUMPROCTRAB').asFloat := NumProcTrab;
        FCdsParcelasProcTrab.FieldByName('NUMPARCELA').asInteger := c;
        FCdsParcelasProcTrab.FieldByName('VALORPARCELA').asFloat := dTotal / NumParcelas;
        FCdsParcelasProcTrab.FieldByName('DATAPARCELA').asDateTime :=
          IncData(DataParcela,0,c,0);
        FCdsParcelasProcTrab.Post;
      end;
      FCdsParcelasProcTrab.First;
    finally
      FreeObject(_CdsObjetos);
    end;
  end;
end;

function TCtrlParcelasProcTrab.GravarParcelasProcTrab: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarParcelasProcTrab(FCdsParcelasProcTrab.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsParcelasProcTrab, FDbParcelasProcTrab, [], []);
      if not(Result) then
        raise Exception.Create(FDbParcelasProcTrab.MessageInfo);

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
