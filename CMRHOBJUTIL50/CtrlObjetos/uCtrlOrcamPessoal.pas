{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Eugênio C. Frioli               }
{ Criado Em: 11/05/2004                                 }
{                                                       }
{*******************************************************}

unit uCtrlOrcamPessoal;

interface

uses SysUtils, Forms, uCmDbObject, uCmControlObject, IvDictio, uCMTranslate, uCMClientDataSet,
 uCtrlCustomRH, uDbOrcamPessoal;

type
  TCtrlOrcamPessoal = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbOrcamPessoal: TDbOrcamPessoal;
    FCdsOrcamPessoal: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListOrcamPessoal(IdOrcamPessoal, Ano, Mes: double): OleVariant;
    function ContaOrcamPessoal(ListaIdEstab, ListaCodCCusto, ListaIdCargo: string;
      IdEmpresa, Ano: integer; ListaSitFunc: string = '';
      ListaTipoContrato: string = ''): OleVariant;

    function GravarOrcamPessoal: boolean;

    property CdsOrcamPessoal: TCMClientDataSet read FCdsOrcamPessoal write FCdsOrcamPessoal;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH, uCmCustomCdbObject;

{ TCtrlOrcamPessoal }

constructor TCtrlOrcamPessoal.Create;
begin
  inherited;
  FDbOrcamPessoal := TDbOrcamPessoal.Create(Self);
end;

destructor TCtrlOrcamPessoal.Destroy;
begin
  FDbOrcamPessoal.Free;
  if (IsAppServer) then
    FCdsOrcamPessoal.Free;
  inherited;
end;

procedure TCtrlOrcamPessoal.OnCreateAppServer;
begin
  inherited;
  FCdsOrcamPessoal := TCMClientDataSet.Create(nil);
end;

procedure TCtrlOrcamPessoal.DoChangeDataBase;
begin
  inherited;
  FDbOrcamPessoal.DataBaseName := DataBaseName;
end;

function TCtrlOrcamPessoal.ListOrcamPessoal(IdOrcamPessoal, Ano, Mes: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  OP.IDORCAMPESSOAL, OP.IDEMPRESA, OP.CODCENTROCUSTO, OP.IDCARGO, OP.ANO,'+CR_LF+
    '  OP.MES, OP.QTDEPESSOAL, CC.NOME AS CENTRO_CUSTO, C.TITULO AS CARGO,'+CR_LF+
    '  OP.IDESTAB, P.NOME AS ESTABELECIMENTO'+CR_LF+
    'FROM'+CR_LF+
    '  ORCAMPESSOAL OP, PESSOA P, CENTCUST CC, CARGO C'+CR_LF+
    'WHERE'+CR_LF+
    '  (OP.IDORCAMPESSOAL '+IFF(IdOrcamPessoal=0,'>','')+'= '+FloatToStr(IdOrcamPessoal)+') AND'+CR_LF+
    '  (OP.ANO            '+IFF(Ano=0,'>','')+'= '+FloatToStr(Ano)+') AND'+CR_LF+
    '  (OP.MES            '+IFF(Mes=0,'>','')+'= '+FloatToStr(Mes)+') AND'+CR_LF+
    '  (OP.IDEMPRESA      = CC.IDEMPRESA(+)) AND'+CR_LF+
    '  (OP.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND'+CR_LF+
    '  (OP.IDESTAB        = P.IDPESSOA(+)) AND'+CR_LF+
    '  (OP.IDCARGO        = C.IDCARGO(+))');
end;

function TCtrlOrcamPessoal.ContaOrcamPessoal(ListaIdEstab, ListaCodCCusto,
  ListaIdCargo: string; IdEmpresa, Ano: integer; ListaSitFunc: string;
  ListaTipoContrato: string): OleVariant;
var
  sSQL: string;
begin
  sSQL := '';

  if (ListaSitFunc <> '') then
    if (Pos(',', ListaSitFunc) > 0) then
      sSQL := sSQL + '   AND (TIPOSIT      IN (' +QuotedListaString(ListaSitFunc,',')+ '))'+CR_LF
    else
      sSQL := sSQL + '   AND (TIPOSIT       = ' +QuotedListaString(ListaSitFunc,',')+ ')'+CR_LF;

  if (Trim(ListaTipoContrato) <> '') then
    if (Pos(',',ListaTipoContrato) > 0) then
      sSQL := sSQL + '   AND (TIPOCONTRATO IN (' +QuotedListaString(ListaTipoContrato,',')+ '))'+CR_LF
    else
      sSQL := sSQL + '   AND (TIPOCONTRATO  = ' +QuotedListaString(ListaTipoContrato,',')+ ')'+CR_LF;

  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  1 AS MES, ORC.CONTA AS ORCADO, REA.CONTA AS REALIZADO'+CR_LF+
    'FROM'+CR_LF+
    '  (SELECT SUM(QTDEPESSOAL) AS CONTA'+CR_LF+
    '   FROM ORCAMPESSOAL'+CR_LF+
    '   WHERE (ANO = '+IntToStr(Ano)+')'+CR_LF+
    '   AND   (MES = 1)'+CR_LF+
    '   AND   (IDEMPRESA = '+IntToStr(IdEmpresa)+')'+CR_LF+
    IFF(ListaIdCargo='','','   AND   (IDCARGO  IN ('+ListaIdCargo+'))'+CR_LF)+
    IFF(ListaIdEstab='','','   AND   (IDESTAB  IN ('+ListaIdEstab+'))'+CR_LF)+
    IFF(ListaCodCCusto='','','   AND   (RTRIM(CODCENTROCUSTO) IN ('+ListaCodCCusto+'))'+CR_LF)+
    ') ORC,'+CR_LF+
    '  (SELECT COUNT(DISTINCT F.IDPESSOA) AS CONTA'+CR_LF+
    '   FROM FUNCIONARIO F, SITFUNC S,'+CR_LF+
    '   (SELECT EVOL.IDCARGO, EVOL.IDPESSOA, EVOL.IDEMPRESA,'+CR_LF+
    '           EVOL.CODCENTROCUSTO, EVOL.IDESTAB'+CR_LF+
    '    FROM   EVOLFUNC EVOL,'+CR_LF+
    '           (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA'+CR_LF+
    '            FROM   EVOLFUNC'+CR_LF+
    '            WHERE'+CR_LF+
    '            (TO_CHAR(DATAALTERFUNC,''YYYYMM'') <= '+QuotedStr(IntToStr(Ano)+'01')+')'+CR_LF+
    '           GROUP BY IDPESSOA) HST2'+CR_LF+
    '    WHERE  (EVOL.DATAALTERFUNC = HST2.DATAALTERFUNC) AND'+CR_LF+
    '            (EVOL.IDPESSOA      = HST2.IDPESSOA)) HST'+CR_LF+
    '   WHERE (TO_CHAR(DATAADMISSAO,''YYYYMM'') <= '+QuotedStr(IntToStr(Ano)+'01')+')'+CR_LF+
    sSQL+
    '   AND   (TIPOSIT   <> ''D'' OR TO_CHAR(DATADESLIGAMENTO,''YYYYMM'') > '+QuotedStr(IntToStr(Ano)+'01')+')'+CR_LF+
    '   AND   (F.IDSITFUNC = S.IDSITFUNC)'+CR_LF+
    '   AND   (DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) ='+IntToStr(IdEmpresa)+')'+CR_LF+
    IFF(ListaIdCargo='','','   AND   (DECODE(HST.IDCARGO,NULL,F.IDCARGO,HST.IDCARGO) IN ('+ListaIdCargo+'))'+CR_LF)+
    IFF(ListaIdEstab='','','   AND   (DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) IN ('+ListaIdEstab+'))'+CR_LF)+
    IFF(ListaCodCCusto='','','   AND   (DECODE(RTRIM(HST.CODCENTROCUSTO),NULL,RTRIM(F.CODCENTROCUSTO),RTRIM(HST.CODCENTROCUSTO)) IN ('+ListaCodCCusto+'))'+CR_LF)+
    '   AND   (F.IDPESSOA        = HST.IDPESSOA(+))) REA'+CR_LF+

    'UNION'+CR_LF+

    'SELECT'+CR_LF+
    '  2 AS MES, ORC.CONTA AS ORCADO, REA.CONTA AS REALIZADO'+CR_LF+
    'FROM'+CR_LF+
    '  (SELECT SUM(QTDEPESSOAL) AS CONTA'+CR_LF+
    '   FROM ORCAMPESSOAL'+CR_LF+
    '   WHERE (ANO = '+IntToStr(Ano)+')'+CR_LF+
    '   AND   (MES = 2)'+CR_LF+
    '   AND   (IDEMPRESA = '+IntToStr(IdEmpresa)+')'+CR_LF+
    IFF(ListaIdCargo='','','   AND   (IDCARGO  IN ('+ListaIdCargo+'))'+CR_LF)+
    IFF(ListaIdEstab='','','   AND   (IDESTAB  IN ('+ListaIdEstab+'))'+CR_LF)+
    IFF(ListaCodCCusto='','','   AND   (RTRIM(CODCENTROCUSTO) IN ('+ListaCodCCusto+'))'+CR_LF)+
    ') ORC,'+CR_LF+
    '  (SELECT COUNT(DISTINCT F.IDPESSOA) AS CONTA'+CR_LF+
    '   FROM FUNCIONARIO F, SITFUNC S,'+CR_LF+
    '   (SELECT EVOL.IDCARGO, EVOL.IDPESSOA, EVOL.IDEMPRESA,'+CR_LF+
    '           EVOL.CODCENTROCUSTO, EVOL.IDESTAB'+CR_LF+
    '    FROM   EVOLFUNC EVOL,'+CR_LF+
    '           (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA'+CR_LF+
    '            FROM   EVOLFUNC'+CR_LF+
    '            WHERE'+CR_LF+
    '            (TO_CHAR(DATAALTERFUNC,''YYYYMM'') <= '+QuotedStr(IntToStr(Ano)+'02')+')'+CR_LF+
    '           GROUP BY IDPESSOA) HST2'+CR_LF+
    '    WHERE  (EVOL.DATAALTERFUNC = HST2.DATAALTERFUNC) AND'+CR_LF+
    '            (EVOL.IDPESSOA      = HST2.IDPESSOA)) HST'+CR_LF+
    '   WHERE (TO_CHAR(DATAADMISSAO,''YYYYMM'') <= '+QuotedStr(IntToStr(Ano)+'02')+')'+CR_LF+
    sSQL+
    '   AND   (TIPOSIT   <> ''D'' OR TO_CHAR(DATADESLIGAMENTO,''YYYYMM'') > '+QuotedStr(IntToStr(Ano)+'02')+')'+CR_LF+
    '   AND   (F.IDSITFUNC = S.IDSITFUNC)'+CR_LF+
    '   AND   (DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) ='+IntToStr(IdEmpresa)+')'+CR_LF+
    IFF(ListaIdCargo='','','   AND   (DECODE(HST.IDCARGO,NULL,F.IDCARGO,HST.IDCARGO) IN ('+ListaIdCargo+'))'+CR_LF)+
    IFF(ListaIdEstab='','','   AND   (DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) IN ('+ListaIdEstab+'))'+CR_LF)+
    IFF(ListaCodCCusto='','','   AND   (DECODE(RTRIM(HST.CODCENTROCUSTO),NULL,RTRIM(F.CODCENTROCUSTO),RTRIM(HST.CODCENTROCUSTO)) IN ('+ListaCodCCusto+'))'+CR_LF)+
    '   AND   (F.IDPESSOA        = HST.IDPESSOA(+))) REA'+CR_LF+

    'UNION'+CR_LF+

    'SELECT'+CR_LF+
    '  3 AS MES, ORC.CONTA AS ORCADO, REA.CONTA AS REALIZADO'+CR_LF+
    'FROM'+CR_LF+
    '  (SELECT SUM(QTDEPESSOAL) AS CONTA'+CR_LF+
    '   FROM ORCAMPESSOAL'+CR_LF+
    '   WHERE (ANO = '+IntToStr(Ano)+')'+CR_LF+
    '   AND   (MES = 3)'+CR_LF+
    '   AND   (IDEMPRESA = '+IntToStr(IdEmpresa)+')'+CR_LF+
    IFF(ListaIdCargo='','','   AND   (IDCARGO  IN ('+ListaIdCargo+'))'+CR_LF)+
    IFF(ListaIdEstab='','','   AND   (IDESTAB  IN ('+ListaIdEstab+'))'+CR_LF)+
    IFF(ListaCodCCusto='','','   AND   (RTRIM(CODCENTROCUSTO) IN ('+ListaCodCCusto+'))'+CR_LF)+
    ') ORC,'+CR_LF+
    '  (SELECT COUNT(DISTINCT F.IDPESSOA) AS CONTA'+CR_LF+
    '   FROM FUNCIONARIO F, SITFUNC S,'+CR_LF+
    '   (SELECT EVOL.IDCARGO, EVOL.IDPESSOA, EVOL.IDEMPRESA,'+CR_LF+
    '           EVOL.CODCENTROCUSTO, EVOL.IDESTAB'+CR_LF+
    '    FROM   EVOLFUNC EVOL,'+CR_LF+
    '           (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA'+CR_LF+
    '            FROM   EVOLFUNC'+CR_LF+
    '            WHERE'+CR_LF+
    '            (TO_CHAR(DATAALTERFUNC,''YYYYMM'') <= '+QuotedStr(IntToStr(Ano)+'03')+')'+CR_LF+
    '           GROUP BY IDPESSOA) HST2'+CR_LF+
    '    WHERE  (EVOL.DATAALTERFUNC = HST2.DATAALTERFUNC) AND'+CR_LF+
    '            (EVOL.IDPESSOA      = HST2.IDPESSOA)) HST'+CR_LF+
    '   WHERE (TO_CHAR(DATAADMISSAO,''YYYYMM'') <= '+QuotedStr(IntToStr(Ano)+'03')+')'+CR_LF+
    sSQL+
    '   AND   (TIPOSIT   <> ''D'' OR TO_CHAR(DATADESLIGAMENTO,''YYYYMM'') > '+QuotedStr(IntToStr(Ano)+'03')+')'+CR_LF+
    '   AND   (F.IDSITFUNC = S.IDSITFUNC)'+CR_LF+
    '   AND   (DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) ='+IntToStr(IdEmpresa)+')'+CR_LF+
    IFF(ListaIdCargo='','','   AND   (DECODE(HST.IDCARGO,NULL,F.IDCARGO,HST.IDCARGO) IN ('+ListaIdCargo+'))'+CR_LF)+
    IFF(ListaIdEstab='','','   AND   (DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) IN ('+ListaIdEstab+'))'+CR_LF)+
    IFF(ListaCodCCusto='','','   AND   (DECODE(RTRIM(HST.CODCENTROCUSTO),NULL,RTRIM(F.CODCENTROCUSTO),RTRIM(HST.CODCENTROCUSTO)) IN ('+ListaCodCCusto+'))'+CR_LF)+
    '   AND   (F.IDPESSOA        = HST.IDPESSOA(+))) REA'+CR_LF+

    'UNION'+CR_LF+

    'SELECT'+CR_LF+
    '  4 AS MES, ORC.CONTA AS ORCADO, REA.CONTA AS REALIZADO'+CR_LF+
    'FROM'+CR_LF+
    '  (SELECT SUM(QTDEPESSOAL) AS CONTA'+CR_LF+
    '   FROM ORCAMPESSOAL'+CR_LF+
    '   WHERE (ANO = '+IntToStr(Ano)+')'+CR_LF+
    '   AND   (MES = 4)'+CR_LF+
    '   AND   (IDEMPRESA = '+IntToStr(IdEmpresa)+')'+CR_LF+
    IFF(ListaIdCargo='','','   AND   (IDCARGO  IN ('+ListaIdCargo+'))'+CR_LF)+
    IFF(ListaIdEstab='','','   AND   (IDESTAB  IN ('+ListaIdEstab+'))'+CR_LF)+
    IFF(ListaCodCCusto='','','   AND   (RTRIM(CODCENTROCUSTO) IN ('+ListaCodCCusto+'))'+CR_LF)+
    ') ORC,'+CR_LF+
    '  (SELECT COUNT(DISTINCT F.IDPESSOA) AS CONTA'+CR_LF+
    '   FROM FUNCIONARIO F, SITFUNC S,'+CR_LF+
    '   (SELECT EVOL.IDCARGO, EVOL.IDPESSOA, EVOL.IDEMPRESA,'+CR_LF+
    '           EVOL.CODCENTROCUSTO, EVOL.IDESTAB'+CR_LF+
    '    FROM   EVOLFUNC EVOL,'+CR_LF+
    '           (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA'+CR_LF+
    '            FROM   EVOLFUNC'+CR_LF+
    '            WHERE'+CR_LF+
    '            (TO_CHAR(DATAALTERFUNC,''YYYYMM'') <= '+QuotedStr(IntToStr(Ano)+'04')+')'+CR_LF+
    '           GROUP BY IDPESSOA) HST2'+CR_LF+
    '    WHERE  (EVOL.DATAALTERFUNC = HST2.DATAALTERFUNC) AND'+CR_LF+
    '            (EVOL.IDPESSOA      = HST2.IDPESSOA)) HST'+CR_LF+
    '   WHERE (TO_CHAR(DATAADMISSAO,''YYYYMM'') <= '+QuotedStr(IntToStr(Ano)+'04')+')'+CR_LF+
    sSQL+
    '   AND   (TIPOSIT   <> ''D'' OR TO_CHAR(DATADESLIGAMENTO,''YYYYMM'') > '+QuotedStr(IntToStr(Ano)+'04')+')'+CR_LF+
    '   AND   (F.IDSITFUNC = S.IDSITFUNC)'+CR_LF+
    '   AND   (DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) ='+IntToStr(IdEmpresa)+')'+CR_LF+
    IFF(ListaIdCargo='','','   AND   (DECODE(HST.IDCARGO,NULL,F.IDCARGO,HST.IDCARGO) IN ('+ListaIdCargo+'))'+CR_LF)+
    IFF(ListaIdEstab='','','   AND   (DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) IN ('+ListaIdEstab+'))'+CR_LF)+
    IFF(ListaCodCCusto='','','   AND   (DECODE(RTRIM(HST.CODCENTROCUSTO),NULL,RTRIM(F.CODCENTROCUSTO),RTRIM(HST.CODCENTROCUSTO)) IN ('+ListaCodCCusto+'))'+CR_LF)+
    '   AND   (F.IDPESSOA        = HST.IDPESSOA(+))) REA'+CR_LF+

    'UNION'+CR_LF+

    'SELECT'+CR_LF+
    '  5 AS MES, ORC.CONTA AS ORCADO, REA.CONTA AS REALIZADO'+CR_LF+
    'FROM'+CR_LF+
    '  (SELECT SUM(QTDEPESSOAL) AS CONTA'+CR_LF+
    '   FROM ORCAMPESSOAL'+CR_LF+
    '   WHERE (ANO = '+IntToStr(Ano)+')'+CR_LF+
    '   AND   (MES = 5)'+CR_LF+
    '   AND   (IDEMPRESA = '+IntToStr(IdEmpresa)+')'+CR_LF+
    IFF(ListaIdCargo='','','   AND   (IDCARGO  IN ('+ListaIdCargo+'))'+CR_LF)+
    IFF(ListaIdEstab='','','   AND   (IDESTAB  IN ('+ListaIdEstab+'))'+CR_LF)+
    IFF(ListaCodCCusto='','','   AND   (RTRIM(CODCENTROCUSTO) IN ('+ListaCodCCusto+'))'+CR_LF)+
    ') ORC,'+CR_LF+
    '  (SELECT COUNT(DISTINCT F.IDPESSOA) AS CONTA'+CR_LF+
    '   FROM FUNCIONARIO F, SITFUNC S,'+CR_LF+
    '   (SELECT EVOL.IDCARGO, EVOL.IDPESSOA, EVOL.IDEMPRESA,'+CR_LF+
    '           EVOL.CODCENTROCUSTO, EVOL.IDESTAB'+CR_LF+
    '    FROM   EVOLFUNC EVOL,'+CR_LF+
    '           (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA'+CR_LF+
    '            FROM   EVOLFUNC'+CR_LF+
    '            WHERE'+CR_LF+
    '            (TO_CHAR(DATAALTERFUNC,''YYYYMM'') <= '+QuotedStr(IntToStr(Ano)+'05')+')'+CR_LF+
    '           GROUP BY IDPESSOA) HST2'+CR_LF+
    '    WHERE  (EVOL.DATAALTERFUNC = HST2.DATAALTERFUNC) AND'+CR_LF+
    '            (EVOL.IDPESSOA      = HST2.IDPESSOA)) HST'+CR_LF+
    '   WHERE (TO_CHAR(DATAADMISSAO,''YYYYMM'') <= '+QuotedStr(IntToStr(Ano)+'05')+')'+CR_LF+
    sSQL+
    '   AND   (TIPOSIT   <> ''D'' OR TO_CHAR(DATADESLIGAMENTO,''YYYYMM'') > '+QuotedStr(IntToStr(Ano)+'05')+')'+CR_LF+
    '   AND   (F.IDSITFUNC = S.IDSITFUNC)'+CR_LF+
    '   AND   (DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) ='+IntToStr(IdEmpresa)+')'+CR_LF+
    IFF(ListaIdCargo='','','   AND   (DECODE(HST.IDCARGO,NULL,F.IDCARGO,HST.IDCARGO) IN ('+ListaIdCargo+'))'+CR_LF)+
    IFF(ListaIdEstab='','','   AND   (DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) IN ('+ListaIdEstab+'))'+CR_LF)+
    IFF(ListaCodCCusto='','','   AND   (DECODE(RTRIM(HST.CODCENTROCUSTO),NULL,RTRIM(F.CODCENTROCUSTO),RTRIM(HST.CODCENTROCUSTO)) IN ('+ListaCodCCusto+'))'+CR_LF)+
    '   AND   (F.IDPESSOA        = HST.IDPESSOA(+))) REA'+CR_LF+

    'UNION'+CR_LF+

    'SELECT'+CR_LF+
    '  6 AS MES, ORC.CONTA AS ORCADO, REA.CONTA AS REALIZADO'+CR_LF+
    'FROM'+CR_LF+
    '  (SELECT SUM(QTDEPESSOAL) AS CONTA'+CR_LF+
    '   FROM ORCAMPESSOAL'+CR_LF+
    '   WHERE (ANO = '+IntToStr(Ano)+')'+CR_LF+
    '   AND   (MES = 6)'+CR_LF+
    '   AND   (IDEMPRESA = '+IntToStr(IdEmpresa)+')'+CR_LF+
    IFF(ListaIdCargo='','','   AND   (IDCARGO  IN ('+ListaIdCargo+'))'+CR_LF)+
    IFF(ListaIdEstab='','','   AND   (IDESTAB  IN ('+ListaIdEstab+'))'+CR_LF)+
    IFF(ListaCodCCusto='','','   AND   (RTRIM(CODCENTROCUSTO) IN ('+ListaCodCCusto+'))'+CR_LF)+
    ') ORC,'+CR_LF+
    '  (SELECT COUNT(DISTINCT F.IDPESSOA) AS CONTA'+CR_LF+
    '   FROM FUNCIONARIO F, SITFUNC S,'+CR_LF+
    '   (SELECT EVOL.IDCARGO, EVOL.IDPESSOA, EVOL.IDEMPRESA,'+CR_LF+
    '           EVOL.CODCENTROCUSTO, EVOL.IDESTAB'+CR_LF+
    '    FROM   EVOLFUNC EVOL,'+CR_LF+
    '           (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA'+CR_LF+
    '            FROM   EVOLFUNC'+CR_LF+
    '            WHERE'+CR_LF+
    '            (TO_CHAR(DATAALTERFUNC,''YYYYMM'') <= '+QuotedStr(IntToStr(Ano)+'06')+')'+CR_LF+
    '           GROUP BY IDPESSOA) HST2'+CR_LF+
    '    WHERE  (EVOL.DATAALTERFUNC = HST2.DATAALTERFUNC) AND'+CR_LF+
    '            (EVOL.IDPESSOA      = HST2.IDPESSOA)) HST'+CR_LF+
    '   WHERE (TO_CHAR(DATAADMISSAO,''YYYYMM'') <= '+QuotedStr(IntToStr(Ano)+'06')+')'+CR_LF+
    sSQL+
    '   AND   (TIPOSIT   <> ''D'' OR TO_CHAR(DATADESLIGAMENTO,''YYYYMM'') > '+QuotedStr(IntToStr(Ano)+'06')+')'+CR_LF+
    '   AND   (F.IDSITFUNC = S.IDSITFUNC)'+CR_LF+
    '   AND   (DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) ='+IntToStr(IdEmpresa)+')'+CR_LF+
    IFF(ListaIdCargo='','','   AND   (DECODE(HST.IDCARGO,NULL,F.IDCARGO,HST.IDCARGO) IN ('+ListaIdCargo+'))'+CR_LF)+
    IFF(ListaIdEstab='','','   AND   (DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) IN ('+ListaIdEstab+'))'+CR_LF)+
    IFF(ListaCodCCusto='','','   AND   (DECODE(RTRIM(HST.CODCENTROCUSTO),NULL,RTRIM(F.CODCENTROCUSTO),RTRIM(HST.CODCENTROCUSTO)) IN ('+ListaCodCCusto+'))'+CR_LF)+
    '   AND   (F.IDPESSOA        = HST.IDPESSOA(+))) REA'+CR_LF+

    'UNION'+CR_LF+

    'SELECT'+CR_LF+
    '  7 AS MES, ORC.CONTA AS ORCADO, REA.CONTA AS REALIZADO'+CR_LF+
    'FROM'+CR_LF+
    '  (SELECT SUM(QTDEPESSOAL) AS CONTA'+CR_LF+
    '   FROM ORCAMPESSOAL'+CR_LF+
    '   WHERE (ANO = '+IntToStr(Ano)+')'+CR_LF+
    '   AND   (MES = 7)'+CR_LF+
    '   AND   (IDEMPRESA = '+IntToStr(IdEmpresa)+')'+CR_LF+
    IFF(ListaIdCargo='','','   AND   (IDCARGO  IN ('+ListaIdCargo+'))'+CR_LF)+
    IFF(ListaIdEstab='','','   AND   (IDESTAB  IN ('+ListaIdEstab+'))'+CR_LF)+
    IFF(ListaCodCCusto='','','   AND   (RTRIM(CODCENTROCUSTO) IN ('+ListaCodCCusto+'))'+CR_LF)+
    ') ORC,'+CR_LF+
    '  (SELECT COUNT(DISTINCT F.IDPESSOA) AS CONTA'+CR_LF+
    '   FROM FUNCIONARIO F, SITFUNC S,'+CR_LF+
    '   (SELECT EVOL.IDCARGO, EVOL.IDPESSOA, EVOL.IDEMPRESA,'+CR_LF+
    '           EVOL.CODCENTROCUSTO, EVOL.IDESTAB'+CR_LF+
    '    FROM   EVOLFUNC EVOL,'+CR_LF+
    '           (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA'+CR_LF+
    '            FROM   EVOLFUNC'+CR_LF+
    '            WHERE'+CR_LF+
    '            (TO_CHAR(DATAALTERFUNC,''YYYYMM'') <= '+QuotedStr(IntToStr(Ano)+'07')+')'+CR_LF+
    '           GROUP BY IDPESSOA) HST2'+CR_LF+
    '    WHERE  (EVOL.DATAALTERFUNC = HST2.DATAALTERFUNC) AND'+CR_LF+
    '            (EVOL.IDPESSOA      = HST2.IDPESSOA)) HST'+CR_LF+
    '   WHERE (TO_CHAR(DATAADMISSAO,''YYYYMM'') <= '+QuotedStr(IntToStr(Ano)+'07')+')'+CR_LF+
    sSQL+
    '   AND   (TIPOSIT   <> ''D'' OR TO_CHAR(DATADESLIGAMENTO,''YYYYMM'') > '+QuotedStr(IntToStr(Ano)+'07')+')'+CR_LF+
    '   AND   (F.IDSITFUNC = S.IDSITFUNC)'+CR_LF+
    '   AND   (DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) ='+IntToStr(IdEmpresa)+')'+CR_LF+
    IFF(ListaIdCargo='','','   AND   (DECODE(HST.IDCARGO,NULL,F.IDCARGO,HST.IDCARGO) IN ('+ListaIdCargo+'))'+CR_LF)+
    IFF(ListaIdEstab='','','   AND   (DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) IN ('+ListaIdEstab+'))'+CR_LF)+
    IFF(ListaCodCCusto='','','   AND   (DECODE(RTRIM(HST.CODCENTROCUSTO),NULL,RTRIM(F.CODCENTROCUSTO),RTRIM(HST.CODCENTROCUSTO)) IN ('+ListaCodCCusto+'))'+CR_LF)+
    '   AND   (F.IDPESSOA        = HST.IDPESSOA(+))) REA'+CR_LF+

    'UNION'+CR_LF+

    'SELECT'+CR_LF+
    '  8 AS MES, ORC.CONTA AS ORCADO, REA.CONTA AS REALIZADO'+CR_LF+
    'FROM'+CR_LF+
    '  (SELECT SUM(QTDEPESSOAL) AS CONTA'+CR_LF+
    '   FROM ORCAMPESSOAL'+CR_LF+
    '   WHERE (ANO = '+IntToStr(Ano)+')'+CR_LF+
    '   AND   (MES = 8)'+CR_LF+
    '   AND   (IDEMPRESA = '+IntToStr(IdEmpresa)+')'+CR_LF+
    IFF(ListaIdCargo='','','   AND   (IDCARGO  IN ('+ListaIdCargo+'))'+CR_LF)+
    IFF(ListaIdEstab='','','   AND   (IDESTAB  IN ('+ListaIdEstab+'))'+CR_LF)+
    IFF(ListaCodCCusto='','','   AND   (RTRIM(CODCENTROCUSTO) IN ('+ListaCodCCusto+'))'+CR_LF)+
    ') ORC,'+CR_LF+
    '  (SELECT COUNT(DISTINCT F.IDPESSOA) AS CONTA'+CR_LF+
    '   FROM FUNCIONARIO F, SITFUNC S,'+CR_LF+
    '   (SELECT EVOL.IDCARGO, EVOL.IDPESSOA, EVOL.IDEMPRESA,'+CR_LF+
    '           EVOL.CODCENTROCUSTO, EVOL.IDESTAB'+CR_LF+
    '    FROM   EVOLFUNC EVOL,'+CR_LF+
    '           (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA'+CR_LF+
    '            FROM   EVOLFUNC'+CR_LF+
    '            WHERE'+CR_LF+
    '            (TO_CHAR(DATAALTERFUNC,''YYYYMM'') <= '+QuotedStr(IntToStr(Ano)+'08')+')'+CR_LF+
    '           GROUP BY IDPESSOA) HST2'+CR_LF+
    '    WHERE  (EVOL.DATAALTERFUNC = HST2.DATAALTERFUNC) AND'+CR_LF+
    '            (EVOL.IDPESSOA      = HST2.IDPESSOA)) HST'+CR_LF+
    '   WHERE (TO_CHAR(DATAADMISSAO,''YYYYMM'') <= '+QuotedStr(IntToStr(Ano)+'08')+')'+CR_LF+
    sSQL+
    '   AND   (TIPOSIT   <> ''D'' OR TO_CHAR(DATADESLIGAMENTO,''YYYYMM'') > '+QuotedStr(IntToStr(Ano)+'08')+')'+CR_LF+
    '   AND   (F.IDSITFUNC = S.IDSITFUNC)'+CR_LF+
    '   AND   (DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) ='+IntToStr(IdEmpresa)+')'+CR_LF+
    IFF(ListaIdCargo='','','   AND   (DECODE(HST.IDCARGO,NULL,F.IDCARGO,HST.IDCARGO) IN ('+ListaIdCargo+'))'+CR_LF)+
    IFF(ListaIdEstab='','','   AND   (DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) IN ('+ListaIdEstab+'))'+CR_LF)+
    IFF(ListaCodCCusto='','','   AND   (DECODE(RTRIM(HST.CODCENTROCUSTO),NULL,RTRIM(F.CODCENTROCUSTO),RTRIM(HST.CODCENTROCUSTO)) IN ('+ListaCodCCusto+'))'+CR_LF)+
    '   AND   (F.IDPESSOA        = HST.IDPESSOA(+))) REA'+CR_LF+

    'UNION'+CR_LF+

    'SELECT'+CR_LF+
    '  9 AS MES, ORC.CONTA AS ORCADO, REA.CONTA AS REALIZADO'+CR_LF+
    'FROM'+CR_LF+
    '  (SELECT SUM(QTDEPESSOAL) AS CONTA'+CR_LF+
    '   FROM ORCAMPESSOAL'+CR_LF+
    '   WHERE (ANO = '+IntToStr(Ano)+')'+CR_LF+
    '   AND   (MES = 9)'+CR_LF+
    '   AND   (IDEMPRESA = '+IntToStr(IdEmpresa)+')'+CR_LF+
    IFF(ListaIdCargo='','','   AND   (IDCARGO  IN ('+ListaIdCargo+'))'+CR_LF)+
    IFF(ListaIdEstab='','','   AND   (IDESTAB  IN ('+ListaIdEstab+'))'+CR_LF)+
    IFF(ListaCodCCusto='','','   AND   (RTRIM(CODCENTROCUSTO) IN ('+ListaCodCCusto+'))'+CR_LF)+
    ') ORC,'+CR_LF+
    '  (SELECT COUNT(DISTINCT F.IDPESSOA) AS CONTA'+CR_LF+
    '   FROM FUNCIONARIO F, SITFUNC S,'+CR_LF+
    '   (SELECT EVOL.IDCARGO, EVOL.IDPESSOA, EVOL.IDEMPRESA,'+CR_LF+
    '           EVOL.CODCENTROCUSTO, EVOL.IDESTAB'+CR_LF+
    '    FROM   EVOLFUNC EVOL,'+CR_LF+
    '           (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA'+CR_LF+
    '            FROM   EVOLFUNC'+CR_LF+
    '            WHERE'+CR_LF+
    '            (TO_CHAR(DATAALTERFUNC,''YYYYMM'') <= '+QuotedStr(IntToStr(Ano)+'09')+')'+CR_LF+
    '           GROUP BY IDPESSOA) HST2'+CR_LF+
    '    WHERE  (EVOL.DATAALTERFUNC = HST2.DATAALTERFUNC) AND'+CR_LF+
    '            (EVOL.IDPESSOA      = HST2.IDPESSOA)) HST'+CR_LF+
    '   WHERE (TO_CHAR(DATAADMISSAO,''YYYYMM'') <= '+QuotedStr(IntToStr(Ano)+'09')+')'+CR_LF+
    sSQL+
    '   AND   (TIPOSIT   <> ''D'' OR TO_CHAR(DATADESLIGAMENTO,''YYYYMM'') > '+QuotedStr(IntToStr(Ano)+'09')+')'+CR_LF+
    '   AND   (F.IDSITFUNC = S.IDSITFUNC)'+CR_LF+
    '   AND   (DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) ='+IntToStr(IdEmpresa)+')'+CR_LF+
    IFF(ListaIdCargo='','','   AND   (DECODE(HST.IDCARGO,NULL,F.IDCARGO,HST.IDCARGO) IN ('+ListaIdCargo+'))'+CR_LF)+
    IFF(ListaIdEstab='','','   AND   (DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) IN ('+ListaIdEstab+'))'+CR_LF)+
    IFF(ListaCodCCusto='','','   AND   (DECODE(RTRIM(HST.CODCENTROCUSTO),NULL,RTRIM(F.CODCENTROCUSTO),RTRIM(HST.CODCENTROCUSTO)) IN ('+ListaCodCCusto+'))'+CR_LF)+
    '   AND   (F.IDPESSOA        = HST.IDPESSOA(+))) REA'+CR_LF+

    'UNION'+CR_LF+

    'SELECT'+CR_LF+
    '  10 AS MES, ORC.CONTA AS ORCADO, REA.CONTA AS REALIZADO'+CR_LF+
    'FROM'+CR_LF+
    '  (SELECT SUM(QTDEPESSOAL) AS CONTA'+CR_LF+
    '   FROM ORCAMPESSOAL'+CR_LF+
    '   WHERE (ANO = '+IntToStr(Ano)+')'+CR_LF+
    '   AND   (MES = 10)'+CR_LF+
    '   AND   (IDEMPRESA = '+IntToStr(IdEmpresa)+')'+CR_LF+
    IFF(ListaIdCargo='','','   AND   (IDCARGO  IN ('+ListaIdCargo+'))'+CR_LF)+
    IFF(ListaIdEstab='','','   AND   (IDESTAB  IN ('+ListaIdEstab+'))'+CR_LF)+
    IFF(ListaCodCCusto='','','   AND   (RTRIM(CODCENTROCUSTO) IN ('+ListaCodCCusto+'))'+CR_LF)+
    ') ORC,'+CR_LF+
    '  (SELECT COUNT(DISTINCT F.IDPESSOA) AS CONTA'+CR_LF+
    '   FROM FUNCIONARIO F, SITFUNC S,'+CR_LF+
    '   (SELECT EVOL.IDCARGO, EVOL.IDPESSOA, EVOL.IDEMPRESA,'+CR_LF+
    '           EVOL.CODCENTROCUSTO, EVOL.IDESTAB'+CR_LF+
    '    FROM   EVOLFUNC EVOL,'+CR_LF+
    '           (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA'+CR_LF+
    '            FROM   EVOLFUNC'+CR_LF+
    '            WHERE'+CR_LF+
    '            (TO_CHAR(DATAALTERFUNC,''YYYYMM'') <= '+QuotedStr(IntToStr(Ano)+'10')+')'+CR_LF+
    '           GROUP BY IDPESSOA) HST2'+CR_LF+
    '    WHERE  (EVOL.DATAALTERFUNC = HST2.DATAALTERFUNC) AND'+CR_LF+
    '            (EVOL.IDPESSOA      = HST2.IDPESSOA)) HST'+CR_LF+
    '   WHERE (TO_CHAR(DATAADMISSAO,''YYYYMM'') <= '+QuotedStr(IntToStr(Ano)+'10')+')'+CR_LF+
    sSQL+
    '   AND   (TIPOSIT   <> ''D'' OR TO_CHAR(DATADESLIGAMENTO,''YYYYMM'') > '+QuotedStr(IntToStr(Ano)+'10')+')'+CR_LF+
    '   AND   (F.IDSITFUNC = S.IDSITFUNC)'+CR_LF+
    '   AND   (DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) ='+IntToStr(IdEmpresa)+')'+CR_LF+
    IFF(ListaIdCargo='','','   AND   (DECODE(HST.IDCARGO,NULL,F.IDCARGO,HST.IDCARGO) IN ('+ListaIdCargo+'))'+CR_LF)+
    IFF(ListaIdEstab='','','   AND   (DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) IN ('+ListaIdEstab+'))'+CR_LF)+
    IFF(ListaCodCCusto='','','   AND   (DECODE(RTRIM(HST.CODCENTROCUSTO),NULL,RTRIM(F.CODCENTROCUSTO),RTRIM(HST.CODCENTROCUSTO)) IN ('+ListaCodCCusto+'))'+CR_LF)+
    '   AND   (F.IDPESSOA        = HST.IDPESSOA(+))) REA'+CR_LF+

    'UNION'+CR_LF+

    'SELECT'+CR_LF+
    '  11 AS MES, ORC.CONTA AS ORCADO, REA.CONTA AS REALIZADO'+CR_LF+
    'FROM'+CR_LF+
    '  (SELECT SUM(QTDEPESSOAL) AS CONTA'+CR_LF+
    '   FROM ORCAMPESSOAL'+CR_LF+
    '   WHERE (ANO = '+IntToStr(Ano)+')'+CR_LF+
    '   AND   (MES = 11)'+CR_LF+
    '   AND   (IDEMPRESA = '+IntToStr(IdEmpresa)+')'+CR_LF+
    IFF(ListaIdCargo='','','   AND   (IDCARGO  IN ('+ListaIdCargo+'))'+CR_LF)+
    IFF(ListaIdEstab='','','   AND   (IDESTAB  IN ('+ListaIdEstab+'))'+CR_LF)+
    IFF(ListaCodCCusto='','','   AND   (RTRIM(CODCENTROCUSTO) IN ('+ListaCodCCusto+'))'+CR_LF)+
    ') ORC,'+CR_LF+
    '  (SELECT COUNT(DISTINCT F.IDPESSOA) AS CONTA'+CR_LF+
    '   FROM FUNCIONARIO F, SITFUNC S,'+CR_LF+
    '   (SELECT EVOL.IDCARGO, EVOL.IDPESSOA, EVOL.IDEMPRESA,'+CR_LF+
    '           EVOL.CODCENTROCUSTO, EVOL.IDESTAB'+CR_LF+
    '    FROM   EVOLFUNC EVOL,'+CR_LF+
    '           (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA'+CR_LF+
    '            FROM   EVOLFUNC'+CR_LF+
    '            WHERE'+CR_LF+
    '            (TO_CHAR(DATAALTERFUNC,''YYYYMM'') <= '+QuotedStr(IntToStr(Ano)+'11')+')'+CR_LF+
    '           GROUP BY IDPESSOA) HST2'+CR_LF+
    '    WHERE  (EVOL.DATAALTERFUNC = HST2.DATAALTERFUNC) AND'+CR_LF+
    '            (EVOL.IDPESSOA      = HST2.IDPESSOA)) HST'+CR_LF+
    '   WHERE (TO_CHAR(DATAADMISSAO,''YYYYMM'') <= '+QuotedStr(IntToStr(Ano)+'11')+')'+CR_LF+
    sSQL+
    '   AND   (TIPOSIT   <> ''D'' OR TO_CHAR(DATADESLIGAMENTO,''YYYYMM'') > '+QuotedStr(IntToStr(Ano)+'11')+')'+CR_LF+
    '   AND   (F.IDSITFUNC = S.IDSITFUNC)'+CR_LF+
    '   AND   (DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) ='+IntToStr(IdEmpresa)+')'+CR_LF+
    IFF(ListaIdCargo='','','   AND   (DECODE(HST.IDCARGO,NULL,F.IDCARGO,HST.IDCARGO) IN ('+ListaIdCargo+'))'+CR_LF)+
    IFF(ListaIdEstab='','','   AND   (DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) IN ('+ListaIdEstab+'))'+CR_LF)+
    IFF(ListaCodCCusto='','','   AND   (DECODE(RTRIM(HST.CODCENTROCUSTO),NULL,RTRIM(F.CODCENTROCUSTO),RTRIM(HST.CODCENTROCUSTO)) IN ('+ListaCodCCusto+'))'+CR_LF)+
    '   AND   (F.IDPESSOA        = HST.IDPESSOA(+))) REA'+CR_LF+

    'UNION'+CR_LF+

    'SELECT'+CR_LF+
    '  12 AS MES, ORC.CONTA AS ORCADO, REA.CONTA AS REALIZADO'+CR_LF+
    'FROM'+CR_LF+
    '  (SELECT SUM(QTDEPESSOAL) AS CONTA'+CR_LF+
    '   FROM ORCAMPESSOAL'+CR_LF+
    '   WHERE (ANO = '+IntToStr(Ano)+')'+CR_LF+
    '   AND   (MES = 12)'+CR_LF+
    '   AND   (IDEMPRESA = '+IntToStr(IdEmpresa)+')'+CR_LF+
    IFF(ListaIdCargo='','','   AND   (IDCARGO  IN ('+ListaIdCargo+'))'+CR_LF)+
    IFF(ListaIdEstab='','','   AND   (IDESTAB  IN ('+ListaIdEstab+'))'+CR_LF)+
    IFF(ListaCodCCusto='','','   AND   (RTRIM(CODCENTROCUSTO) IN ('+ListaCodCCusto+'))'+CR_LF)+
    ') ORC,'+CR_LF+
    '  (SELECT COUNT(DISTINCT F.IDPESSOA) AS CONTA'+CR_LF+
    '   FROM FUNCIONARIO F, SITFUNC S,'+CR_LF+
    '   (SELECT EVOL.IDCARGO, EVOL.IDPESSOA, EVOL.IDEMPRESA,'+CR_LF+
    '           EVOL.CODCENTROCUSTO, EVOL.IDESTAB'+CR_LF+
    '    FROM   EVOLFUNC EVOL,'+CR_LF+
    '           (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA'+CR_LF+
    '            FROM   EVOLFUNC'+CR_LF+
    '            WHERE'+CR_LF+
    '            (TO_CHAR(DATAALTERFUNC,''YYYYMM'') <= '+QuotedStr(IntToStr(Ano)+'12')+')'+CR_LF+
    '           GROUP BY IDPESSOA) HST2'+CR_LF+
    '    WHERE  (EVOL.DATAALTERFUNC = HST2.DATAALTERFUNC) AND'+CR_LF+
    '            (EVOL.IDPESSOA      = HST2.IDPESSOA)) HST'+CR_LF+
    '   WHERE (TO_CHAR(DATAADMISSAO,''YYYYMM'') <= '+QuotedStr(IntToStr(Ano)+'12')+')'+CR_LF+
    sSQL+
    '   AND   (TIPOSIT   <> ''D'' OR TO_CHAR(DATADESLIGAMENTO,''YYYYMM'') > '+QuotedStr(IntToStr(Ano)+'12')+')'+CR_LF+
    '   AND   (F.IDSITFUNC = S.IDSITFUNC)'+CR_LF+
    '   AND   (DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) ='+IntToStr(IdEmpresa)+')'+CR_LF+
    IFF(ListaIdCargo='','','   AND   (DECODE(HST.IDCARGO,NULL,F.IDCARGO,HST.IDCARGO) IN ('+ListaIdCargo+'))'+CR_LF)+
    IFF(ListaIdEstab='','','   AND   (DECODE(HST.IDESTAB,NULL,F.IDESTAB,HST.IDESTAB) IN ('+ListaIdEstab+'))'+CR_LF)+
    IFF(ListaCodCCusto='','','   AND   (DECODE(RTRIM(HST.CODCENTROCUSTO),NULL,RTRIM(F.CODCENTROCUSTO),RTRIM(HST.CODCENTROCUSTO)) IN ('+ListaCodCCusto+'))'+CR_LF)+
    '   AND   (F.IDPESSOA        = HST.IDPESSOA(+))) REA');
end;

function TCtrlOrcamPessoal.GravarOrcamPessoal: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarOrcamPessoal(FCdsOrcamPessoal.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsOrcamPessoal, FDbOrcamPessoal, [], []);
      if not(Result) then
        raise Exception.Create(FDbOrcamPessoal.MessageInfo);

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
