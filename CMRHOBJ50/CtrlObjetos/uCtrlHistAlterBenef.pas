{
***************************************************************************************
Nº SIG...........: 27550
Data da Alteração: 28/10/2016
Responsável......: Michelle Suellyn Mota
Descrição........: Ctrl criada para atender a solicitação da aba Beneficios - CadFunc
                   ER180 - Limitar 4 alterações no ano para Rateio Auxílio Alimentação.
                         - Criar Histórico de Alterações com filtro Ano.
                   DFM - Alterações de leiaute e nomenclatura de campos/colunas.
***************************************************************************************
}

unit uCtrlHistAlterBenef;

interface

uses SysUtils, DB, Controls, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbHistAlterBenef;

type
  TCtrlHistAlterBenef = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbHistAlterBenef: TDbHistAlterBenef;
    FCdsHistAlterBenef: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListAnosHistAltera(idPessoa: string): OleVariant;
    function ListHistAlteraBenef(idPessoa, Ano: string): OleVariant;
    function ListGridHistAlteraBenef(idPessoa, Ano: string): OleVariant;

    function Gravar: boolean;
    function GetProxId: integer;

    property CdsHistAlterBenef: TCMClientDataSet read FCdsHistAlterBenef write FCdsHistAlterBenef;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlDiaExtra }

constructor TCtrlHistAlterBenef.Create;
begin
  inherited;
  FDbHistAlterBenef := TDbHistAlterBenef.Create(Self);
end;

destructor TCtrlHistAlterBenef.Destroy;
begin
  FDbHistAlterBenef.Free;
  if (IsAppServer) then
    FCdsHistAlterBenef.Free;
  inherited;
end;

procedure TCtrlHistAlterBenef.OnCreateAppServer;
begin
  inherited;
  FCdsHistAlterBenef := TCMClientDataSet.Create(nil);
end;

procedure TCtrlHistAlterBenef.DoChangeDataBase;
begin
  inherited;
  FDbHistAlterBenef.DataBaseName := DataBaseName;
end;

function TCtrlHistAlterBenef.Gravar: boolean;
begin
  try
    If Assigned(CdsHistAlterBenef) Then
    begin
      Result := ApplyCds(CdsHistAlterBenef, FDbHistAlterBenef, [], []);
      if not(Result) then
        raise Exception.Create(FDbHistAlterBenef.MessageInfo);
    end;
  except
    on E:Exception do
    begin
      Result := false;
    end;
  end;
end;

function TCtrlHistAlterBenef.ListAnosHistAltera(idPessoa: string): OleVariant;
var
   sSQL : string;
begin
  sSQL := 'SELECT ANO   ' +
          '  FROM (   ' +
          'SELECT HA.ANO   ' +
          '  FROM HSTALTRATEIOAUXALIMENT HA   ' +
          ' WHERE HA.IDPESSOA = ' +  (idPessoa) +
          ' UNION   ' +
          'SELECT TO_CHAR(SYSDATE, ''YYYY'') AS ANO   ' +
          '  FROM DUAL)   ' +
          ' ORDER BY ANO DESC   ';

  Result := GetDataPacket(sSQL);
end;

function TCtrlHistAlterBenef.ListHistAlteraBenef(idPessoa, Ano: String): OleVariant;
var
   sSQL : string;
begin
  sSQL := 'SELECT HA.*  ' +
          '  FROM HSTALTRATEIOAUXALIMENT HA  ' +
          ' WHERE HA.IDPESSOA =  ' +  (idPessoa) +
          '   AND HA.ANO =  ' +  (Ano) +
          ' ORDER BY IDHSTALTRATEIOAUXALIMENT';

  Result := GetDataPacket(sSQL);

end;

function TCtrlHistAlterBenef.ListGridHistAlteraBenef(idPessoa, Ano: string): OleVariant;
var
   sSQL : string;
begin
  sSQL := 'SELECT HA.TRGDTINCLUSAO    AS DATAHORA,   ' +
          '       NVL(TRIM(U.NOMEUSUARIO), HA.TRGUSERINCLUSAO) USUARIO,  ' +
          '       HA.*  ' +
          '  FROM HSTALTRATEIOAUXALIMENT HA  ' +
          '  LEFT JOIN USUARIOSISTEMA U ON U.IDUSUARIO = REGEXP_REPLACE(HA.TRGUSERINCLUSAO, ''\D'')  ' +
          ' WHERE HA.IDPESSOA =  ' +  (idPessoa) +
          '   AND HA.ANO =  ' +  (Ano) +
          ' ORDER BY HA.TRGDTINCLUSAO DESC  ';

  Result := GetDataPacket(sSQL);

end;

function TCtrlHistAlterBenef.GetProxId: integer;
var
  _CdsAux: TCMClientDataSet;
begin
  try
    _CdsAux := TCMClientDataSet.Create(nil);

    _CdsAux.Data := GetDataPacket(
      'SELECT'+CR_LF+
      '  MAX(IDHSTALTRATEIOAUXALIMENT)+1 AS PROXIMA'+CR_LF+
      'FROM'+CR_LF+
      '  HSTALTRATEIOAUXALIMENT');

    Result := _CdsAux.FieldByName('PROXIMA').AsInteger;

    _CdsAux.Free;
  except
    Result := 0;
  end;
end;

end.