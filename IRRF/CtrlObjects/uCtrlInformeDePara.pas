unit uCtrlInformeDePara;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbInformeDePara, DB, uDataBase, uSistema, DbClient,
     {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

  Type
    TCtrlInformeDePara = Class(TCmControlObject)

    private
    DbInformeDePara: TDbInformeDePara;
    FCdsInformeDePara: TClientDataSet;

    procedure SetCdsInformeDePara(const Value: TClientDataSet);

    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property CdsInformeDePara: TClientDataSet    read FCdsInformeDePara  write SetCdsInformeDePara;

      Function GravarInformeDePara : Boolean;
      Function ListSituacao(const piIdSituacao : Integer): OleVariant;
      function ListInformeDePara(const piIdSituacao    : Integer;
                                 const piIdInformeOrig : Integer;
                                 const piIdInformeDest : Integer;
                                 const pbInicializa    : Boolean): OleVariant;

    protected

    End;

implementation

{ TCtrlInformeDePara }

constructor TCtrlInformeDePara.Create;
begin
  inherited;
  DbInformeDePara := TDbInformeDePara.Create(Self);
end;

destructor TCtrlInformeDePara.Destroy;
begin
  DbInformeDePara.Free;
  if isAppServer then
    FCdsInformeDePara.Free;

  inherited;
end;

procedure TCtrlInformeDePara.DoChangeDataBase;
begin
  inherited;
  DbInformeDePara.DataBaseName   := DataBaseName;
end;

function TCtrlInformeDePara.GravarInformeDePara: Boolean;
Var
   Msg  : String;

begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravaInformeDePara(FCdsInformeDePara.data);

    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      // Pai
      Result := ApplyCds(FCdsInformeDePara, DbInformeDePara,[],[] );
      Msg    := DbInformeDePara.MessageInfo;

      if not Result then
        raise Exception.Create(Msg);

      Commit;
    except
      on E:Exception Do
      begin
        Rollback;
        Result      := False;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlInformeDePara.ListInformeDePara(const piIdSituacao    : Integer;
                                              const piIdInformeOrig : Integer;
                                              const piIdInformeDest : Integer;
                                              const pbInicializa    : Boolean): OleVariant;
Var
  sSql : String;

begin

  sSql := ' SELECT '                                            + #13 +
          '   STI.IDSITUACAO, '                                 + #13 +
          '   STI.NOMESITUACAO, '                               + #13 +
          '   INF.IDINFORME   AS IDINFORMEORIGEM, '             + #13 +
          '   INF.NOMEINFORME AS INFORMEORIGEM, '               + #13 +
          '   INF2.IDINFORME   AS IDINFORMEDESTINO, '           + #13 +
          '   INF2.NOMEINFORME AS INFORMEDESTINO '              + #13 +

          ' FROM '                                              + #13 +
          '   INFORMEDEPARA   IDP, '                            + #13 +
          '   INFORME         INF, '                            + #13 +
          '   INFORME         INF2, '                           + #13 +
          '   CM.SITUACAOINFORME STI '                          + #13 +

          ' WHERE INF.IDINFORME        = IDP.IDINFORMEORIGEM '  + #13 +
          '   AND INF2.IDINFORME       = IDP.IDINFORMEDESTINO ' + #13 +
          '   AND IDP.IDSITUACAO       = STI.IDSITUACAO ';

  if piIdSituacao > 0 then
    sSql := sSql + '   AND IDP.IDSITUACAO       = '+IntToStr(piIdSituacao);

  if piIdInformeOrig > 0 then
    sSql := sSql + '   AND IDP.IDINFORMEORIGEM  = '+IntToStr(piIdInformeOrig);

  if piIdInformeDest > 0 then
    sSql := sSql + '   AND IDP.IDINFORMEDESTINO = '+IntToStr(piIdInformeDest);

  if pbInicializa then
    sSql := sSql + '   AND IDP.IDSITUACAO       = -1 ';

  Result := GetDataPacket(sSql);
end;

function TCtrlInformeDePara.ListSituacao(const piIdSituacao: Integer): OleVariant;
Var
  sSql : String;

begin
  sSql := ' SELECT * FROM CM.SITUACAOINFORME ';

  if piIdSituacao > 0 then
    sSql := sSql + ' WHERE IDP.IDSITUACAO       = '+IntToStr(piIdSituacao);

  sSql := sSql + ' ORDER BY NOMESITUACAO ';

  Result := GetDataPacket(sSql);
end;

procedure TCtrlInformeDePara.OnCreateAppServer;
begin
  inherited;
  FCdsInformeDePara := TClientDataSet.Create(nil);
end;

procedure TCtrlInformeDePara.SetCdsInformeDePara(
  const Value: TClientDataSet);
begin
  FCdsInformeDePara := Value;
end;

end.

