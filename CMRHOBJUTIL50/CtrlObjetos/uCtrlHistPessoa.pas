{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 06/03/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlHistPessoa;

interface

uses SysUtils, Db, uCmDbObject, uCmControlObject, IvDictio,  uCMClientDataSet,
  uCtrlCustomRH, uCtrlCalcRub;

type
  TCtrlHistPessoa = class(TCtrlCustomRH)
  protected
    procedure AfterInitialize; override;
  private
    FCdsAux: TCMClientDataSet;
    FCtrlCalcRub: TCtrlCalcRub;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListEmpregado(IdPessoa: double): OleVariant;
    function ListCandidato(IdPessoa: double): OleVariant;

    function ListOcorrenciasMedicas(IdPessoa: double): OleVariant;
    function ListAvaliacoes(IdPessoa: double): OleVariant;
    function ListBeneficios(IdPessoa: double): OleVariant;
    function ListEvolucaoFuncional(IdPessoa: double): OleVariant;
    function ListProventos(IdPessoa: double; UsaPrevia, SelRubApoio: boolean;
      MesPagto: string; IdMotivo, IdEmpresa: integer; var Total: double): OleVariant;
    function ListDescontos(IdPessoa: double; UsaPrevia: boolean;
      MesPagto: string; IdMotivo, IdEmpresa: integer; var Total: double): OleVariant;
    function ListTestesEntrevistas(IdPessoa: double): OleVariant;
    function ListHistoricoTreinamento(IdPessoa: double): OleVariant;
    function ListEntidadeTreinamento: OleVariant;
  end;

implementation

uses uCtrlFuncoesRH;

{ TCtrlHistPessoa }

constructor TCtrlHistPessoa.Create;
begin
  inherited;
  FCdsAux := TCMClientDataSet.Create(nil);
  FCtrlCalcRub := TCtrlCalcRub.Create;
end;

destructor TCtrlHistPessoa.Destroy;
begin
  FCdsAux.Free;
  FCtrlCalcRub.Free;
  inherited;
end;

procedure TCtrlHistPessoa.AfterInitialize;
begin
  inherited;
  FCtrlCalcRub.InitializeAs(Self);
end;

function TCtrlHistPessoa.ListEmpregado(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  ''  '' || P.NOME AS NOME, P.IDPESSOA, ST.TIPOSIT, F.MATRICULA,'+CR_LF+
    '  TO_CHAR(DECODE(ST.TIPOSIT,NULL,'+CR_LF+
    '    ' +QuotedStr(('Indefinida'))+ ','+CR_LF+
    '    TO_CHAR(DECODE(ST.TIPOSIT,'+CR_LF+
    '      ''A'',' +QuotedStr(('(Ativo)'))+ ','+CR_LF+
    '      ''F'',' +QuotedStr(('(Afastado)'))+ ','+CR_LF+
    '      ''D'',' +QuotedStr(('(Demitido)'))+ CR_LF+
    '    ))'+CR_LF+
    '  )) AS SITUACAO'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, FUNCIONARIO F, SITFUNC ST'+CR_LF+
    'WHERE'+CR_LF+
    '  (P.IDPESSOA  = '+FloatToStr(IdPessoa)+') AND'+CR_LF+
    '  (P.IDPESSOA  = F.IDPESSOA) AND'+CR_LF+
    '  (F.IDSITFUNC = ST.IDSITFUNC(+))');
end;

function TCtrlHistPessoa.ListCandidato(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  ''  '' || NOME AS NOME, IDPESSOA, IDPESSOA AS MATRICULA,'+CR_LF+
    '  ' +QuotedStr(('Candidato'))+ ' AS SITUACAO'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDPESSOA  = ' +FloatToStr(IdPessoa)+ ')');
end;

function TCtrlHistPessoa.ListOcorrenciasMedicas(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  TP.DESCRTIPOOCMED, HS.DATAPLAN,'+CR_LF+
    '  HS.DATAREAL, HS.EXAMINADOR, HS.AVALIACAO'+CR_LF+
    'FROM'+CR_LF+
    '  TIPOCMED TP, HSTASMED HS'+CR_LF+
    'WHERE'+CR_LF+
    '  (HS.IDPESSOA     = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (HS.CODTIPOOCMED = TP.CODTIPOOCMED)');
end;

function TCtrlHistPessoa.ListAvaliacoes(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  TP.DESCRTIPOAVAL, HS.DATAPLAN,'+CR_LF+
    '  HS.DATAREAL, HS.AVALIACAO, HS.AVALIADOR'+CR_LF+
    'FROM'+CR_LF+
    '  TIPOAVAL TP, HSTAVAL HS'+CR_LF+
    'WHERE'+CR_LF+
    '  (HS.IDPESSOA    = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (HS.CODTIPOAVAL = TP.CODTIPOAVAL)');
end;

function TCtrlHistPessoa.ListBeneficios(IdPessoa: double): OleVariant;
var
  dValCalc: double;
begin
  FCdsAux.Data := GetDataPacket(
    '(SELECT'+CR_LF+
    '   PD.DESCRICAO, RI.ANOMESINICIO, RI.PARCELAS, RI.NUMOCORRENCIAS,'+CR_LF+
    '   RI.FLGPERMANENTE, RI.IDREGRACALCULO, RI.VALORRUBRICA'+CR_LF+
    ' FROM'+CR_LF+
    '   RUBRICAINDIV RI, PROVDESC PD'+CR_LF+
    ' WHERE'+CR_LF+
    '   (RI.IDPESSOA          = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '   (PD.FLGCONSTAFOLHA    = 0) AND'+CR_LF+
    '   (PD.IDBENEFSALAR IS NOT NULL) AND'+CR_LF+
    '   (RI.IDRUBRICA         = PD.IDPROVENTO))'+CR_LF+
    'UNION'+CR_LF+
    '(SELECT'+CR_LF+
    '   PD.DESCRICAO, H.MES AS ANOMESINICIO, 0 AS PARCELAS,'+CR_LF+
    '   0 AS NUMOCORRENCIAS, 1 AS FLGPERMANENTE, -99 AS IDREGRACALCULO,'+CR_LF+
    '   H.VALORPROVENTO AS VALORRUBRICA'+CR_LF+
    ' FROM'+CR_LF+
    '   HISTRUBSAL H, PROVDESC PD'+CR_LF+
    ' WHERE'+CR_LF+
    '   (H.IDPESSOA           = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '   (PD.FLGCONSTAFOLHA    = 1) AND'+CR_LF+
    '   (PD.IDBENEFSALAR IS NOT NULL) AND'+CR_LF+
    '   (H.IDRUBRICA          = PD.IDPROVENTO))'+CR_LF+
    'ORDER BY'+CR_LF+
    '  2 DESC, 1');

  // Atualiza o valor conforme a Regra selecionada
  if not(FCdsAux.IsEmpty) then
  begin
    repeat
      FCdsAux.Edit;
      if not(FCdsAux.FieldByName('IDREGRACALCULO').IsNull) and
            (FCdsAux.FieldByName('IDREGRACALCULO').asInteger <> -99) then
      begin
        dValCalc := FCdsAux.FieldByName('VALORRUBRICA').asFloat;
        FCtrlCalcRub.CalcBeneficioRegra(FCdsAux.FieldByName('IDREGRACALCULO').asString,
          FloatToStr(IdPessoa), dValCalc);
        FCdsAux.FieldByName('VALORRUBRICA').asFloat := dValCalc;
      end;
      FCdsAux.Post;

      FCdsAux.Next;
    until (FCdsAux.EOF);

    FCdsAux.First;
  end;
  Result := FCdsAux.Data;
end;

function TCtrlHistPessoa.ListEvolucaoFuncional(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  EF.DATAALTERFUNC, MO.DESCRICAO, EF.SALARIO, EF.TIPOPAGAMENTO,' +CR_LF+
    '  NVL(EF.PERC_REAJ,0) AS PERC_REAJ, C1.TITULO, C2.TITULO AS FUNCAO,' +CR_LF+
    '  CC.NOME AS CCUSTO' +CR_LF+
    'FROM' +CR_LF+
    '  EVOLFUNC EF, MOTIVO MO, CARGO C1, CARGO C2, CENTCUST CC' +CR_LF+
    'WHERE' +CR_LF+
    '  (EF.IDPESSOA       = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
    '  (EF.IDMOTIVO       = MO.IDMOTIVO(+)) AND' +CR_LF+
    '  (EF.IDCARGO        = C1.IDCARGO(+)) AND' +CR_LF+
    '  (EF.IDFUNCAO       = C2.IDCARGO(+)) AND' +CR_LF+
    '  (EF.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND' +CR_LF+
    '  (EF.IDEMPRESA      = CC.IDEMPRESA(+))' +CR_LF+
    'ORDER BY' +CR_LF+
    '  EF.DATAALTERFUNC DESC, EF.TRGDTINCLUSAO DESC');
end;

function TCtrlHistPessoa.ListProventos(IdPessoa: double; UsaPrevia, SelRubApoio: boolean;
  MesPagto: string; IdMotivo, IdEmpresa: integer; var Total: double): OleVariant;
begin
  FCdsAux.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  H.CODPROVDESC, H.DATAPAGAMENTO, H.REFERENCIA, H.VALORPROVENTO,'+CR_LF+
    '  RP.DESCRPROVDESC AS DESCRICAO, PV.FLGDESCONTO'+CR_LF+
    'FROM'+CR_LF+
    '  ' +IFF(UsaPrevia, 'PREVIAFOLPAG', 'HISTRUBSAL')+ ' H, RUBRICAXPESS RP, PROVDESC PV'+CR_LF+
    'WHERE'+CR_LF+
    '  (H.IDPESSOA         = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (H.MES              = ' +QuotedStr(MesPagto)+ ') AND'+CR_LF+
    '  (H.IDMOTIVO         = ' +IntToStr(IdMotivo)+ ') AND'+CR_LF+
    '  (((PV.FLGDESCONTO   = 2)  AND ('+IFF(SelRubApoio, '0', '1')+ ' = 0)) OR'+CR_LF+
    '    (PV.FLGDESCONTO   = 0)) AND'+CR_LF+
    '  (PV.FLGTPRUBRICA LIKE ''%F%'') AND'+CR_LF+
    '  (H.IDRUBRICA        = PV.IDPROVENTO) AND'+CR_LF+
    '  (RP.IDPESSOA        = ' +IntToStr(IdEmpresa)+ ') AND'+CR_LF+
    '  (H.IDRUBRICA        = RP.IDRUBRICA)');

  Total := 0;
  while not(FCdsAux.EOF) do
  begin
    if (FCdsAux.FieldByName('FLGDESCONTO').asInteger = 0) then
      Total := Total + FCdsAux.FieldByName('VALORPROVENTO').asFloat;
    FCdsAux.Next;
  end;
  Result := FCdsAux.Data;
end;

function TCtrlHistPessoa.ListDescontos(IdPessoa: double; UsaPrevia: boolean;
  MesPagto: string; IdMotivo, IdEmpresa: integer; var Total: double): OleVariant;
begin
  FCdsAux.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  H.CODPROVDESC, H.DATAPAGAMENTO, H.REFERENCIA, H.VALORPROVENTO, RP.DESCRPROVDESC AS DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  ' +IFF(UsaPrevia, 'PREVIAFOLPAG', 'HISTRUBSAL')+ ' H, RUBRICAXPESS RP, PROVDESC PV'+CR_LF+
    'WHERE'+CR_LF+
    '  (H.IDPESSOA         = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (H.MES              = ' +QuotedStr(MesPagto)+ ') AND'+CR_LF+
    '  (H.IDMOTIVO         = ' +IntToStr(IdMotivo)+ ') AND'+CR_LF+
    '  (PV.FLGDESCONTO     = 1) AND'+CR_LF+
    '  (PV.FLGTPRUBRICA LIKE ''%F%'') AND'+CR_LF+
    '  (H.IDRUBRICA        = PV.IDPROVENTO) AND'+CR_LF+
    '  (RP.IDPESSOA        = ' +IntToStr(IdEmpresa)+ ') AND'+CR_LF+
    '  (H.IDRUBRICA        = RP.IDRUBRICA)');

  Total := 0;
  while not(FCdsAux.EOF) do
  begin
    Total := Total + FCdsAux.FieldByName('VALORPROVENTO').asFloat;
    FCdsAux.Next;
  end;
  Result := FCdsAux.Data;
end;

function TCtrlHistPessoa.ListTestesEntrevistas(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  TA.DESCRTIPOAVAL, HA.DATAPLAN, HA.DATAREAL, HA.AVALIACAO, HA.AVALIADOR'+CR_LF+
    'FROM'+CR_LF+
    '  TIPOAVAL TA, HSTAVAL HA'+CR_LF+
    'WHERE'+CR_LF+
    '  (HA.IDPESSOA    = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (HA.CODTIPOAVAL = TA.CODTIPOAVAL)');
end;

function TCtrlHistPessoa.ListHistoricoTreinamento(IdPessoa: double): OleVariant;
var
  CdsAux: TCMClientDataSet;
begin
  CdsAux := TCMClientDataSet.Create(nil);
  try
    CdsAux.Data := GetDataPacket('SELECT FLGAVALALUNO FROM PARAMRH');

    if (CdsAux.FieldByName('FLGAVALALUNO').asInteger = 0) then
      Result := GetDataPacket(
        'SELECT'+CR_LF+
        '  CU.DESCRICAO, HS.DATPLINI, HS.DATPLFIM,'+CR_LF+
        '  HS.DATREINI, HS.DATREFIM, HS.AVALTEOR, HS.AVALPRAT'+CR_LF+
        'FROM'+CR_LF+
        '  CURSO CU, HSTTRN HS'+CR_LF+
        'WHERE'+CR_LF+
        '  (HS.IDPESSOA = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
        '  (HS.IDCURSO  = CU.IDCURSO)'+CR_LF+
        'ORDER BY'+CR_LF+
        '  HS.DATREFIM DESC, CU.DESCRICAO')
    else
      Result := GetDataPacket(
        'SELECT'+CR_LF+
        '  CU.DESCRICAO,'+CR_LF+
        '  HS.DATPLINI,'+CR_LF+
        '  HS.DATPLFIM,'+CR_LF+
        '  HS.DATREINI,'+CR_LF+
        '  HS.DATREFIM,'+CR_LF+
        '  ROUND(SUM(AVAL_CURSO.AVALCURSO * 100 /'+CR_LF+
        '    TO_NUMBER(DECODE(NVL(ESCALA_FATOR.FLGAVALCURSO,0),0,NVL(P.VALMAXAVALTRN,100),'+CR_LF+
        '      ESCALA_FATOR.QTDECONCEITOS))) / COUNT(*),0) AS AVALTEOR,'+CR_LF+
        '  0 AS AVALPRAT'+CR_LF+
        'FROM'+CR_LF+
        '  HSTTRN HS, CURSO CU, PARAMRH P,'+CR_LF+
        '  (SELECT IDPESSOA, IDCURSO, IDFATORAVAL, NUMSEQ, AVALCURSO'+CR_LF+
        '   FROM   AVALCURSO'+CR_LF+
        '   WHERE  (IDPESSOA      = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
        '          (FLGCURSOALUNO = 1)) AVAL_CURSO,'+CR_LF+
        // Escala de Conceitos x Fator de Avaliação
        '  (SELECT F.IDFATORAVAL, F.FLGAVALCURSO, E.QTDECONCEITOS'+CR_LF+
        '   FROM   FATORAVALCURSO F, ESCALACONCEITOS E'+CR_LF+
        '   WHERE  (F.INDAPLICACAO      = 1) AND'+CR_LF+
        '          (F.IDESCALACONCEITOS = E.IDESCALACONCEITOS(+))) ESCALA_FATOR'+CR_LF+
        'WHERE'+CR_LF+
        '  (HS.IDPESSOA            = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
        '  (HS.IDCURSO             = CU.IDCURSO) AND'+CR_LF+
        '  (HS.IDPESSOA            = AVAL_CURSO.IDPESSOA(+)) AND'+CR_LF+
        '  (HS.IDCURSO             = AVAL_CURSO.IDCURSO(+)) AND'+CR_LF+
        '  (HS.NUMSEQ              = AVAL_CURSO.NUMSEQ(+)) AND'+CR_LF+
        '  (AVAL_CURSO.IDFATORAVAL = ESCALA_FATOR.IDFATORAVAL(+))'+CR_LF+
        'GROUP BY'+CR_LF+
        '  CU.DESCRICAO, HS.DATPLINI, HS.DATPLFIM, HS.DATREINI, HS.DATREFIM'+CR_LF+
        'ORDER BY'+CR_LF+
        '  HS.DATREFIM DESC, CU.DESCRICAO');
  finally
    CdsAux.Free;
  end;
end;

function TCtrlHistPessoa.ListEntidadeTreinamento: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT DISTINCT'+CR_LF+
    '  P.NOME, P.IDPESSOA'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, HSTTRN H'+CR_LF+
    'WHERE'+CR_LF+
    '  (H.IDENTIDINSTR = P.IDPESSOA)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  P.NOME');
end;

end.
