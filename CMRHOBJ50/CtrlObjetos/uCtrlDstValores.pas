{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Andre Mesquita                  }
{ Criado Em: 23/03/2007                                 }
{                                                       }
{*******************************************************}

unit uCtrlDstValores;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
     uDbDSTValores, uCtrlCustomRH;

type
  TCtrlDSTValores = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbDstValores  : TDbDstValores;
    FCdsDstValores : TCMClientDataSet;
    procedure SetCdsDstValores(const Value: TCMClientDataSet);
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function GravarDstValores: boolean;

    function ListValores(const idTarifa: Integer = -1; const dtData : TDateTime = 0): OleVariant;

    property CdsDstValores: TCMClientDataSet read FCdsDstValores write SetCdsDstValores;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlDSTValores }

constructor TCtrlDSTValores.Create;
begin
  inherited;
  FDbDstValores := TDbDstValores.Create(Self);
end;

destructor TCtrlDSTValores.Destroy;
begin
  FDbDstValores.Free;
  if (IsAppServer) then
    FCdsDstValores.Free;
  inherited;
end;

procedure TCtrlDSTValores.OnCreateAppServer;
begin
  inherited;
  FCdsDstValores := TCMClientDataSet.Create(nil);
end;

procedure TCtrlDSTValores.DoChangeDataBase;
begin
  inherited;
  FDbDstValores.DataBaseName := DataBaseName;
end;

function TCtrlDSTValores.GravarDstValores: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarDstValores(FCdsDstValores.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(FCdsDstValores, FDbDstValores, [], []);
      if (Result) then
        Commit
      else
        raise Exception.Create(FDbDstValores.MessageInfo);
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

procedure TCtrlDSTValores.SetCdsDstValores(const Value: TCMClientDataSet);
begin
  FCdsDstValores := Value;
end;

function TCtrlDSTValores.ListValores(const idTarifa: Integer = -1; const dtData : TDateTime = 0): OleVariant;
var
  sSQL: string;
begin
  sSQL := ' SELECT ' + CR_LF +
          '   IDDSTTARIFA, DATADSTVALORES, VLRDST ' + CR_LF +
          ' FROM ' + CR_LF +
          '   DSTVALORES ' + CR_LF;

  if (idTarifa = -2) then
    begin
      sSQL := sSql + ' WHERE ' + CR_LF;
      sSql := sSql + '   IDDSTTARIFA = ' + IntToStr(idTarifa) + CR_LF;
    end
  else
    if (idTarifa > -1) or (dtData > 0) then
      begin
        sSQL := sSql + ' WHERE ' + CR_LF;
        if (idTarifa > -1) then
          sSql := sSql + '   IDDSTTARIFA = ' + IntToStr(idTarifa);
        if (idTarifa > -1) and (dtData > 0) then
          sSql := sSql + '   AND DATADSTVALORES = TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',dtData)) + ',' + QuotedStr('dd/mm/yyyy') + ') '
        else
          if (dtData > 0) then
            sSql := sSql + '   DATADSTVALORES = TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',dtData)) + ',' + QuotedStr('dd/mm/yyyy') + ') ';
          // end if
        // end if
      end;
    // end if
  // end if

  Result := GetDataPacket(sSQL);
end;

end.
