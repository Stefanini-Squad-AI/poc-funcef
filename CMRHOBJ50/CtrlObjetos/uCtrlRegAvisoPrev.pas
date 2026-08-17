{*******************************************************************************
Nº SIG...........: 38475/84907
Data da Alteração: 16/04/2019
Responsável......: Everson Cunha
Descrição........: Atualizações para adequação ao leaite s-2250.
                   Versão atual 2.5.01
                   Esta funcionalidade será descontinuada e suas informações
                   serão repassadas para a func. de Rescisão Contratual
********************************************************************************
Nº SOL...........: 229881/16649
Nº PPM...........: 566000
Data da Alteração: 26/02/2015
Responsável......: Felipe A. Santos
Descrição........: Criação da Control.
********************************************************************************}

unit uCtrlRegAvisoPrev;

interface

uses
  SysUtils, Forms, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbAvisoPrev, uDbFuncionario;


type
  TCtrlRegAvisoPrev = class(TCtrlCustomRH)
  private
    FDbAvisoPrev : TDbAvisoPrev;
    FDbFuncionario : TDbFuncionario;
    FCdsAvisoPrev : TCMClientDataSet;
    FCdsFuncionario : TCMClientDataSet;
  protected
    procedure DoChangeDataBase; override;
  public
    function ListFuncionarios(IdPessoa : string) : OleVariant;
    function ListAvisoPrev(IdPessoa : string) : OleVariant;

    function Gravar : Boolean;

    constructor Create; override;
    destructor Destroy; override;

    property CdsAvisoPrev : TCMClientDataSet read FCdsAvisoPrev write FCdsAvisoPrev;
    property CdsFuncionario : TCMClientDataSet read FCdsFuncionario write FCdsFuncionario;
  end;

implementation

{ TCtrlRegAvisoPrev }

constructor TCtrlRegAvisoPrev.Create;
begin
  inherited;
  FDbAvisoPrev := TDbAvisoPrev.Create(Self);
  FDbFuncionario := TDbFuncionario.Create(Self);
end;

destructor TCtrlRegAvisoPrev.Destroy;
begin
  FreeAndNil(FDbAvisoPrev);
  FreeAndNil(FDbFuncionario);

  inherited;

end;

procedure TCtrlRegAvisoPrev.DoChangeDataBase;
begin
  inherited;
  FDbAvisoPrev.DataBaseName := DataBaseName;
  FDbFuncionario.DataBaseName := DataBaseName;
end;

function TCtrlRegAvisoPrev.Gravar: Boolean;
begin

  try
    StartTransaction;

    Result := ApplyCds(FCdsFuncionario, FDbFuncionario, [], []);
    if not(Result) then
       raise Exception.Create(FDbFuncionario.MessageInfo);

    Result := ApplyCds(FCdsAvisoPrev, FDbAvisoPrev, [FDbFuncionario.IdPessoa], [FDbAvisoPrev.IdPessoa]);

    if not(Result) then
       raise Exception.Create(FDbAvisoPrev.MessageInfo);

    Commit;
  except
    on E : Exception do
    begin
       MessageInfo := E.Message;
       Result := False;
       Rollback;

    end;
  end;
end;

function TCtrlRegAvisoPrev.ListAvisoPrev(IdPessoa: string): OleVariant;
var
  sSQL : string;
begin
  sSQL := ' SELECT AP.*, ' +
          '        F.DATAAVISO, ' +
          '        F.DATADESLIGAMENTO, ' +
          '        DECODE(AP.TIPOAVISO, 1, ''Aviso prévio trabalhado dado pelo empregador ao empregado, que optou pela redução de duas horas diárias [caput do art. 488 da CLT]'', ' +
          '                             2, ''Aviso prévio trabalhado dado pelo empregador ao empregado, que optou pela redução de dias corridos [parágrafo único do art. 488 da CLT]'', ' +
//          '                             3, ''Aviso prévio dado pelo empregado (pedido de demissão), dispensado de seu cumprimento'', ' + //Everson Cunha - SIG38475-84907
          '                             4, ''Aviso prévio dado pelo empregado (pedido de demissão), não dispensado de seu cumprimento, sob pena de desconto, pelo empregador, dos salários correspondentes ao prazo respectivo (§2º do art. 487 da CLT)'', ' + //Everson Cunha - SIG38475-84907
          '                             5, ''Aviso prévio trabalhado dado pelo empregador rural ao empregado, com redução de um dia por semana ( art. 15 da Lei nº 5889/73)'', ' + //Everson Cunha - SIG38475-84907
          '                             6, ''Aviso prévio trabalhado decorrente de acordo entre empregado e empregador (art. 484-A, "caput", da CLT)'' ' + //Everson Cunha - SIG38475-84907
//          '                             9, ''Aviso prévio dado pelo empregado, não dispensado de seu cumprimento pelo empregador dos salários correspondentes ao prazo respectivo'' ' + //Everson Cunha - SIG38475-84907
          '                             ) AS TIPOAVISO2, ' +
          '        DECODE(AP.MOTIVOCANCEL, 1, ''Reconsideração prevista no artigo 489 da CLT'', ' +
          '                                2, ''Determinação Judicial'', ' +
          '                                3, ''Cumprimento de norma legal'', ' +
          '                                9, ''Outros'') AS MOTIVOCANCEL2, ' +
          '        DECODE(AP.FLGSITUACAO, 1, ''Aberto'', ' +
          '                               2, ''Cancelado'', '''') AS SITUACAO ' +
          '   FROM AVISOPREV AP, ' +
          '        FUNCIONARIO F ' +
          '  WHERE AP.IDPESSOA = ' + IdPessoa + 
          '    AND AP.IDPESSOA = F.IDPESSOA';

  Result := GetDataPacket(sSQL);
end;

function TCtrlRegAvisoPrev.ListFuncionarios(IdPessoa: string): OleVariant;
var
  sSQL : string;
begin
  sSQL := ' SELECT ' +
          '        F.*, ' +
          '        P.NOME ' +
          '  FROM ' +
          '       FUNCIONARIO F, ' +
          '       PESSOA P ' +
          ' WHERE F.IDPESSOA = ' + IdPessoa +
          '   AND F.IDPESSOA = P.IDPESSOA';

  Result := GetDataPacket(sSQL);
end;

end.
