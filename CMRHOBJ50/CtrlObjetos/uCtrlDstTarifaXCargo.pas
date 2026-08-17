{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Andre Mesquita                  }
{ Criado Em: 22/03/2007                                 }
{                                                       }
{*******************************************************}

unit uCtrlDstTarifaXCargo;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
     uDbDSTTarifaXCargo, uCtrlCustomRH;

type
  TCtrlDSTTarifaXCargo = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbDstTarifaXCargo  : TDbDstTarifaXCargo;
    FCdsDstTarifaXCargo : TCMClientDataSet;
    procedure SetCdsDstTarifaXCargo(const Value: TCMClientDataSet);
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function GravarDstTarifaXCargo: boolean;

    function ListCargosNaoAssociados(const indTipo: Integer; const idTarifa : Integer) : OleVariant;
    function ListCargosAssociados(const idTarifa : Integer = -1) : OleVariant;

    property CdsDstTarifaXCargo: TCMClientDataSet read FCdsDstTarifaXCargo write SetCdsDstTarifaXCargo;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlDSTTarifaXCargo }

constructor TCtrlDSTTarifaXCargo.Create;
begin
  inherited;
  FDbDstTarifaXCargo := TDbDstTarifaXCargo.Create(Self);
end;

destructor TCtrlDSTTarifaXCargo.Destroy;
begin
  FDbDstTarifaXCargo.Free;
  if (IsAppServer) then
    FCdsDstTarifaXCargo.Free;
  inherited;
end;

procedure TCtrlDSTTarifaXCargo.OnCreateAppServer;
begin
  inherited;
  FCdsDstTarifaXCargo := TCMClientDataSet.Create(nil);
end;

procedure TCtrlDSTTarifaXCargo.DoChangeDataBase;
begin
  inherited;
  FDbDstTarifaXCargo.DataBaseName := DataBaseName;
end;

function TCtrlDSTTarifaXCargo.GravarDstTarifaXCargo: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarDstTarifaXCargo(FCdsDstTarifaXCargo.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(FCdsDstTarifaXCargo, FDbDstTarifaXCargo, [], []);
      if (Result) then
        Commit
      else
        raise Exception.Create(FDbDstTarifaXCargo.MessageInfo);
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

procedure TCtrlDSTTarifaXCargo.SetCdsDstTarifaXCargo(const Value: TCMClientDataSet);
begin
  FCdsDstTarifaXCargo := Value;
end;

function TCtrlDSTTarifaXCargo.ListCargosAssociados(const idTarifa : Integer) : OleVariant;
var
  sSql: string;
begin
  sSql := ' select '                                   + CR_LF;
  sSql := sSql + '   cg.idcargo, '                     + CR_LF;
  sSql := sSql + '   cg.titulo, '                      + CR_LF;
  sSql := sSql + '   tc.iddsttarifa, '                 + CR_LF;
  sSql := sSql + '   tf.indtipo '                      + CR_LF;
  sSql := sSql + ' from '                              + CR_LF;
  sSql := sSql + '   dstTarifaXCargo tc, '             + CR_LF;
  sSql := sSql + '   dstTarifa tf, '                   + CR_LF;
  sSql := sSql + '   cargo cg '                        + CR_LF;
  sSql := sSql + ' where '                             + CR_LF;
  sSql := sSql + '   tc.IDDSTTARIFA = tf.IDDSTTARIFA ' + CR_LF;
  sSql := sSql + '   and tc.IDCARGO = cg.IDCARGO ';
  sSql := sSql + '   and tf.IDDSTTARIFA = ' + IntToStr(idTarifa) + CR_LF;
  sSql := sSql + ' order by '                          + CR_LF;
  sSql := sSql + '   cg.titulo '                       + CR_LF;

  Result := GetDataPacket(sSql);
end;

function TCtrlDSTTarifaXCargo.ListCargosNaoAssociados(const indTipo: Integer; const idTarifa : Integer) : OleVariant;
var
  sSql: string;
begin
  sSql := ' select '                                             + CR_LF;
  sSql := sSql + '   cg.idcargo, '                               + CR_LF;
  sSql := sSql + '   cg.titulo '                                 + CR_LF;
  sSql := sSql + ' from '                                        + CR_LF;
  sSql := sSql + '   cargo cg '                                  + CR_LF;
  sSql := sSql + ' where '                                       + CR_LF;
  sSql := sSql + '   cg.idcargo '                                + CR_LF;
  sSql := sSql + '     not in '                                  + CR_LF;
  sSql := sSql + '       ( '                                     + CR_LF;
  sSql := sSql + '         select '                              + CR_LF;
  sSql := sSql + '           tc.idcargo '                        + CR_LF;
  sSql := sSql + '         from '                                + CR_LF;
  sSql := sSql + '           dstTarifaXCargo tc, '               + CR_LF;
  sSql := sSql + '           dstTarifa tf '                      + CR_LF;
  sSql := sSql + '         where '                               + CR_LF;
  sSql := sSql + '           tc.IDDSTTARIFA = tf.IDDSTTARIFA '   + CR_LF;
  sSql := sSql + '           and tf.INDTIPO = ' + IntToStr(indTipo)      + CR_LF;
  sSql := sSql + '           and tf.IDDSTTARIFA = ' + IntToStr(idTarifa) + CR_LF;
  sSql := sSql + '       ) '                                     + CR_LF;
  if (indTipo = -1) or (idTarifa = -1) then
    sSql := sSql + '   and cg.idcargo = -1 ' + CR_LF;
  sSql := sSql + ' order by cg.titulo '                          + CR_LF;

  Result := GetDataPacket(sSql);
end;

end.
