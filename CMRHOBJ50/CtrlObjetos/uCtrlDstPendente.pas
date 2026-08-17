{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Andre Mesquita                  }
{ Criado Em: 07/04/2007                                 }
{                                                       }
{*******************************************************}

unit uCtrlDstPendente;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
     uCtrlCustomRH, uCMTypes, uCtrlFuncoesRH;

type
  TCtrlDSTPendente = class(TCtrlCustomRH)
  protected
    procedure OnCreateAppServer; override;
  private
    FCdsPendente: TCMClientDataSet;
    procedure SetCdsPendente(const Value: TCMClientDataSet);
  public
    constructor Create;  override;
    destructor  Destroy; override;

    property CdsPendente : TCMClientDataSet read FCdsPendente write SetCdsPendente;

    function ListarDestacamentoPendente: OleVariant;
    function ListarDestacamento(IdDestacamento: double): OleVariant;
    function ListarTrechos(IdDestacamento: double): OleVariant;
  end;

implementation

uses
  uCtrlPadroes;

{ TCtrlDSTPendente }

constructor TCtrlDSTPendente.Create;
begin
  inherited;
  FCdsPendente := TCMClientDataSet.Create(nil);  
end;

destructor TCtrlDSTPendente.Destroy;
begin
  if (IsAppServer) then
    FCdsPendente.Free;
  inherited;
end;

procedure TCtrlDSTPendente.OnCreateAppServer;
begin
  inherited;
  FCdsPendente := TCMClientDataSet.Create(nil);
end;

function TCtrlDSTPendente.ListarDestacamentoPendente: OleVariant;
var
  sSql : String;
begin
  sSql := ' SELECT '                                                    + CR_LF;
  sSql := sSql + '    0 AS FLGENVIA, '                                  + CR_LF;
  sSql := sSql + '    ''DESTACAMENTO'' AS Cx, '                         + CR_LF;
  sSql := sSql + '    P.NOME    AS C0, '                                + CR_LF;
  sSql := sSql + '    D.DATAINI AS C1, '                                + CR_LF;
  sSql := sSql + '    D.DATAFIM AS C2, '                                + CR_LF;
  sSql := sSql + '    DECODE(R1.FLGOK,''E'',''EXCLUÍDO'',''N'',''PENDENTE'',''R'',''RECUSADO'',''S'',''APROVADO'',NULL) AS StatusRAD ' + CR_LF;
  sSql := sSql + ' FROM '                                               + CR_LF;
  sSql := sSql + '    PESSOA P, '                                       + CR_LF;
  sSql := sSql + '    DESTACAMENTO D, '                                 + CR_LF;
  sSql := sSql + '    RADINSTPROCESSO R1 '                              + CR_LF;
  sSql := sSql + ' WHERE '                                              + CR_LF;
  sSql := sSql + '    ( D.CODDOCDESTAC IS NULL ) AND '                  + CR_LF;
  sSql := sSql + '    ( D.IDPESSOA = P.IDPESSOA ) AND '                 + CR_LF;
  sSql := sSql + '    ( D.IDPROCESSO = R1.IDPROCESSO (+) ) AND '        + CR_LF;
  sSql := sSql + '    ( R1.FLGOK IN(''N'',''S'') ) '                    + CR_LF;
  sSql := sSql + ' '                                                    + CR_LF;
  sSql := sSql + ' UNION ALL '                                          + CR_LF;
  sSql := sSql + ' '                                                    + CR_LF;
  sSql := sSql + ' SELECT '                                             + CR_LF;
  sSql := sSql + '    0 AS FLGENVIA, '                                  + CR_LF;
  sSql := sSql + '    ''ACERTO'' AS Cx, '                               + CR_LF;
  sSql := sSql + '    P.NOME     AS C0, '                               + CR_LF;
  sSql := sSql + '    D.DATAINI  AS C1, '                               + CR_LF;
  sSql := sSql + '    D.DATAFIM  AS C2, '                               + CR_LF;
  sSql := sSql + '    DECODE(R1.FLGOK,''E'',''EXCLUÍDO'',''N'',''PENDENTE'',''R'',''RECUSADO'',''S'',''APROVADO'',NULL) AS StatusRAD ' + CR_LF;
  sSql := sSql + ' FROM '                                               + CR_LF;
  sSql := sSql + '    PESSOA P, '                                       + CR_LF;
  sSql := sSql + '    DESTACAMENTO D, '                                 + CR_LF;
  sSql := sSql + '    RADINSTPROCESSO R1 '                              + CR_LF;
  sSql := sSql + ' WHERE '                                              + CR_LF;
  sSql := sSql + '    ( D.CODDOCDESTAC IS NOT NULL ) AND '              + CR_LF;
  sSql := sSql + '    ( D.CODDOCACERTO IS NULL ) AND '                  + CR_LF;
  sSql := sSql + '    ( D.IDPESSOA = P.IDPESSOA ) AND '                 + CR_LF;
  sSql := sSql + '    ( D.IDPROCESSOACERTO = R1.IDPROCESSO (+) ) AND '  + CR_LF;
  sSql := sSql + '    ( R1.FLGOK IN(''N'',''S'') ) '                    + CR_LF;
  Result := GetDataPacket(sSql);
end;


procedure TCtrlDSTPendente.SetCdsPendente(const Value: TCMClientDataSet);
begin
  FCdsPendente := Value;
end;

function TCtrlDSTPendente.ListarDestacamento(IdDestacamento: double): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT';

  sSQL := sSQL +CR_LF+
    '  D.*, C.TITULO, CC.CODCENTROCUSTO, CC.NOME'+CR_LF+
    'FROM'+CR_LF+
    '  DESTACAMENTO D, CARGO C, CENTCUST CC, FUNCIONARIO F'+CR_LF;

  if (IdDestacamento = -1) then
    sSQL := sSQL +
      'WHERE'+CR_LF+
      '  (1 = 2)'
  else
  begin
    sSQL := sSQL + 'WHERE'+CR_LF;

    if (IdDestacamento > 0) then
      sSQL := sSQL + '  (IDDESTACAMENTO = ' +FloatToStr(IdDestacamento)+ ')'+CR_LF+
        'AND    (F.IDPESSOA = D.IDPESSOA)'+CR_LF+
        'AND    (DECODE(F.IDFUNCAO,NULL,F.IDCARGO,F.IDFUNCAO)  = C.IDCARGO)'+CR_LF+
        'AND    (F.CODCENTROCUSTO = CC.CODCENTROCUSTO)'+CR_LF+
        'AND    (F.IDEMPRESA = CC.IDEMPRESA)';
  end;

  sSQL := sSQL +CR_LF+
    'ORDER BY'+CR_LF+
    '  DATAINI, DATAFIM';

  Result := GetDataPacket(sSQL);
end;

function TCtrlDSTPendente.ListarTrechos(IdDestacamento: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  D.*, C.NOME'+CR_LF+
    'FROM'+CR_LF+
    '  DSTTRECHO D, CIDADES C'+CR_LF+
    'WHERE'+CR_LF+
    '  (D.IDDESTACAMENTO = ' +FloatToStr(IdDestacamento)+ ') AND'+CR_LF+
    '  (D.IDCIDADES = C.IDCIDADES)'+CR_LF+
    'ORDER BY D.DATAINI');
end;


end.
