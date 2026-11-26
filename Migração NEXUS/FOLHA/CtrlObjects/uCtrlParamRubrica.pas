unit uCtrlParamRubrica;

interface

Uses ucmControlObject, ucmDBObject, uDbParamRubrica, DbClient, ucmTypes, SysUtils;

Type
  TCtrlParamRubrica = Class(TCmControlObject)
  private
    DBParamRubrica   : TDbParamRubrica;
    FCdsParamRubrica : TClientDataSet;
    FCdsRubricas     : TClientDataSet;
    FCdsConsulta     : TClientDataSet;

    procedure SetCdsParamRubrica(const Value: TClientDataSet);

    procedure DoChangeDataBase; Override;
  protected
  public
    Constructor Create; Override;
    Destructor Destroy; Override;

    property CdsParamRubrica: TClientDataSet  read FCdsParamRubrica write SetCdsParamRubrica;
    property CdsRubricas:     TClientDataSet  read FCdsRubricas;
    property CdsConsulta:     TClientDataSet  read FCdsConsulta;

    function Gravar: Boolean;
    function ListaParamRubricas(piIDAgrupamento, piIDParamRubrica:Integer):OleVariant;
    function ListaRubricas(piIDFundacao, piTipoRubrica:Integer): OleVariant;
    function ListaConsulta(piIDAgrupamento, piIDParamRubrica:Integer):OleVariant;
    function ListaDePara(piIDAgrupamento, piIDRubricaDe :Integer):OleVariant;
    function ListaRegras:OleVariant;
  end;

implementation

Uses uSistema;

{ TCtrlParamRubrica }

constructor TCtrlParamRubrica.Create;
begin
  inherited;

  DBParamRubrica   := TDBParamRubrica.Create(Self);

  FCdsParamRubrica := TClientDataSet.Create(Nil);
  FCdsRubricas     := TClientDataSet.Create(Nil);
  FCdsConsulta     := TClientDataSet.Create(Nil);
end;

destructor TCtrlParamRubrica.Destroy;
begin
  inherited;

  DBParamRubrica.Free;
  FCdsParamRubrica.Free;
  FCdsRubricas.Free;
  FCdsConsulta.Free;
end;

function TCtrlParamRubrica.Gravar: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient then
  Begin
    Result := Connection.AppServer.Gravar(CdsParamRubrica.Data);
    If not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Try
      StartTransaction;
      Result := ApplyCds(CdsParamRubrica, DBParamRubrica, [], []);

      Msg := DBParamRubrica.MessageInfo;

      If not Result then
        raise Exception.Create(DBParamRubrica.MessageInfo);

      Commit;
    Except
      On E: Exception do
      Begin
        Result := False;
        RollBack;
        MessageInfo := E.Message;
      End;
    End;
  End;
end;

procedure TCtrlParamRubrica.DoChangeDataBase;
begin
  inherited;
  DBParamRubrica.DataBaseName := DataBaseName;
end;

procedure TCtrlParamRubrica.SetCdsParamRubrica(const Value: TClientDataSet);
begin
  FCdsParamRubrica := Value;
end;

function TCtrlParamRubrica.ListaParamRubricas(piIDAgrupamento, piIDParamRubrica:Integer):OleVariant;
var sSql:String;
begin
  sSql := ' SELECT  ' + #13 +
          '   IDPARAMRUBRICA, IDAGRUPAMENTO, IDRUBRICADE, IDRUBRICAPARA, IDREGRA ' + #13 +
          ' FROM PARAMRUBRICA ' + #13 +
          ' WHERE ( IDAGRUPAMENTO  = ' + IntToStr(piIDAgrupamento)  + ') ' + #13 +
          '   AND ( IDPARAMRUBRICA = ' + IntToStr(piIDParamRubrica) + ') ';

  Result := GetDataPacket(sSql);
end;

function TCtrlParamRubrica.ListaRubricas(piIDFundacao, piTipoRubrica:Integer): OleVariant;
var sSql:String;
begin
   sSql := ' SELECT P.IDPROVENTO AS CODIGOINT, ' + #13 +
           ' NVL(P.CODPROVDESC,P.IDPROVENTO) AS CODIGOEXT, ' + #13 +
           ' P.DESCRICAO AS DESCRICAO,  ' + #13 +
           ' P.FLGDESCONTO  ' + #13 +
           ' FROM PROVDESC P ' + #13 +
           ' WHERE (P.FLGESPECIAL = 0 ) ' + #13;

   If piTipoRubrica >= 0 Then
     sSql := sSql +  '   AND (P.FLGDESCONTO = ' + IntToStr(piTipoRubrica)  + ') ' + #13;

   sSql := sSql + '   AND (P.FLGTPRUBRICA LIKE ''%B%'') ' + #13 +
                  ' ORDER BY P.DESCRICAO';

  Result := GetDataPacket(sSql);
end;

function TCtrlParamRubrica.ListaConsulta(piIDAgrupamento, piIDParamRubrica: Integer): OleVariant;
var sSql:String;
begin
   sSql := ' SELECT PD1.DESCRICAO DE, PD2.DESCRICAO PARA, ' + #13 +
           '        PR.IDAGRUPAMENTO , PR.IDPARAMRUBRICA, ' + #13 +
           '        PR.IDRUBRICADE, PR.IDRUBRICAPARA, ' + #13 +
           '        PR.IDREGRA ' + #13 +
           ' FROM PARAMRUBRICA PR, ' + #13 +
           '      PROVDESC PD1, ' + #13 +
           '      PROVDESC PD2 ' + #13 +
           ' WHERE (PR.IDRUBRICADE    = PD1.IDPROVENTO) ' + #13 +
           '   AND (PR.IDRUBRICAPARA  = PD2.IDPROVENTO) ';

   If (piIDAgrupamento >= 0) And (piIDParamRubrica >=0) Then
     sSql := sSQl + '   AND (PR.IDAGRUPAMENTO  = ' + IntToStr(piIDAgrupamento)  + ') ' + #13 +
                    '   AND (PR.IDPARAMRUBRICA = ' + IntToStr(piIDParamRubrica) + ') ';

   sSql := sSQl + ' ORDER BY PR.IDAGRUPAMENTO , PR.IDPARAMRUBRICA';

  Result := GetDataPacket(sSql);
end;

function TCtrlParamRubrica.ListaDePara(piIDAgrupamento,
  piIDRubricaDe: Integer): OleVariant;
var sSql:String;
begin
  sSql := ' SELECT  ' + #13 +
          '   IDPARAMRUBRICA, IDAGRUPAMENTO, IDRUBRICADE, IDRUBRICAPARA, ' + #13 +
          '   NVL(IDREGRA, 0) AS IDREGRA ' + #13 +
          ' FROM PARAMRUBRICA ' + #13 +
          ' WHERE ( IDAGRUPAMENTO  = ' + IntToStr(piIDAgrupamento)  + ') ' + #13 +
          '   AND ( IDRUBRICADE = ' + IntToStr(piIDRubricaDe) + ') ';

  Result := GetDataPacket(sSql);
end;

function TCtrlParamRubrica.ListaRegras: OleVariant;
var sSql:String;
begin
  sSql := ' SELECT IDREGRA, NOMEREGRA FROM REGRA ';

  Result := GetDataPacket(sSql);
end;

end.



