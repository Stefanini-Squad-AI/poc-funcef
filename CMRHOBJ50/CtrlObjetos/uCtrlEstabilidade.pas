{--------------------------------------------------------------------------------------------------
Nº SOL............: 229881.16650
Nº PPM............: 566001
Data da Alteração.: 03/03/2015
Responsável.......: William Santana
Descrição.........: Desenvolvimento do produto referente ao SOL 229881 -
                    Registro de Estabilidade Funcional.
--------------------------------------------------------------------------------------------------
}

unit uCtrlEstabilidade;

interface

uses SysUtils, Forms, Db, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbEstabilidade;

type
  TCtrlEstabilidade = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbDet: TDbEstabilidade;
    FCdsDet: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function Gravar: boolean;
    function ListGeral(IdPessoa: double): OleVariant;

    property CdsDet: TCMClientDataSet read FCdsDet write FCdsDet;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlRegSitFunc }

constructor TCtrlEstabilidade.Create;
begin
  inherited;
  FDbDet := TDbEstabilidade.Create(Self);
end;

destructor TCtrlEstabilidade.Destroy;
begin
  FDbDet.Free;
  if (IsAppServer) then
    FCdsDet.Free;
  inherited;
end;

procedure TCtrlEstabilidade.OnCreateAppServer;
begin
  inherited;
  FCdsDet := TCMClientDataSet.Create(nil);
end;

procedure TCtrlEstabilidade.DoChangeDataBase;
begin
  inherited;
  FDbDet.DataBaseName := DataBaseName;
end;

function TCtrlEstabilidade.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.Gravar(FCdsDet.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(FCdsDet, FDbDet, [], []);
      if (Result) then
        Commit
      else
        raise Exception.Create(FDbDet.MessageInfo);
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

function TCtrlEstabilidade.ListGeral(IdPessoa: double): OleVariant;
var
  sWhere: string;
begin

  Result := GetDataPacket(
  'SELECT E.IDESTABILIDADE,' +CR_LF+
  '       E.IDPESSOA,' +CR_LF+
  '       E.MOTIVOESTAB,' +CR_LF+
  '       DECODE(E.MOTIVOESTAB, 1,''01 - Acidente de Trabalho'',' +CR_LF+
  '                             2,''02 - Mandato Sindical'',' +CR_LF+
  '                             3,''03 - Mandato Eleitoral'',' +CR_LF+
  '                             4,''04 - Gravidez'',' +CR_LF+
  '                             5,''05 - Prestação de Serviço Militar'',' +CR_LF+
  '                             6,''06 - Convenção Coletiva de Trabalho'',' +CR_LF+
  '                             7,''07 - Candidato da CIPA'',' +CR_LF+
  '                             8,''08 - Eleito Titular CIPA'',' +CR_LF+
  '                             9,''09 - Eleito Suplente CIPA'',' +CR_LF+
  '                             10,''10 - Membro do Conselho Nacional da Previdência Social (CNPS)'',' +CR_LF+
  '                             11,''11 - Membro de Comissão de Conciliação Prévia'',' +CR_LF+
  '                             12,''12 - Empregados eleitos diretores de sociedades cooperativas'',' +CR_LF+
  '                             13,''13 - Membros do Conselho Curador do FGTS'',' +CR_LF+
  '                             99,''99 - Outros'') AS MOTIVO,' +CR_LF+
  '       E.DATAINICIO,' +CR_LF+
  '       E.DATAFIM,' +CR_LF+
  '       E.OBSERVACAO' +CR_LF+
  '  FROM ESTABILIDADE E' +CR_LF+
  '  WHERE E.IDPESSOA = '+FloatToStr(IdPessoa) +CR_LF+
  '  ORDER BY E.IDESTABILIDADE');
end;

end.
