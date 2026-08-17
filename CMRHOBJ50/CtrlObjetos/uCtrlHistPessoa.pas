{*******************************************************}
//Rotina...........: ListEvolucaoFuncional
//Nº SOL...........: 131315
//Nº KINTANA.......: 746518
//Data da Alteração: 05/08/2010
//Responsável......: Marilza Colpani
//Descrição........: Buscar o nível do cargo na tela Consulta/Histórico de Evolução Funcional
//***************************************************************************************             
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 06/03/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlHistPessoa;

interface

uses SysUtils, Db, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uCtrlCalcRub;

type
  TCtrlHistPessoa = class(TCtrlCustomRH)
  protected
    procedure AfterInitialize; override;
  private
    FCdsAux: TCMClientDataSet;
    FCtrlCalcRub: TCtrlCalcRub;
  public
    constructor Create;  override;
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
    '  (''  '' || P.NOME) AS NOME, P.IDPESSOA, ST.TIPOSIT, F.MATRICULA,'+CR_LF+
    '  DECODE(ST.TIPOSIT,NULL,''Indefinida'','+CR_LF+
    '    DECODE(ST.TIPOSIT,''A'',''(Ativ'', ''F'',''(Afastad'', ''D'',''(Demitid'') ||'+CR_LF+
    '    DECODE(PEFIS.SEXO,''F'',''a)'',''o)'')) AS SITUACAO'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, PESSOAFISICA PEFIS, FUNCIONARIO F, SITFUNC ST'+CR_LF+
    'WHERE'+CR_LF+
    '  (P.IDPESSOA  = '+FloatToStr(IdPessoa)+') AND'+CR_LF+
    '  (P.IDPESSOA  = F.IDPESSOA) AND'+CR_LF+
    '  (F.IDPESSOA  = PEFIS.IDPESSOA) AND'+CR_LF+
    '  (F.IDSITFUNC = ST.IDSITFUNC(+))');
end;

function TCtrlHistPessoa.ListCandidato(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  (''  '' || NOME) AS NOME, IDPESSOA, IDPESSOA AS MATRICULA,'+CR_LF+
    '  (''Candidato'') AS SITUACAO'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDPESSOA  = '+FloatToStr(IdPessoa)+')');
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
    'SELECT'+CR_LF+
    '  PD.DESCRICAO, RI.ANOMESINICIO, RI.PARCELAS, RI.NUMOCORRENCIAS,'+CR_LF+
    '  RI.FLGPERMANENTE, RI.IDREGRACALCULO, RI.VALORRUBRICA'+CR_LF+
    'FROM'+CR_LF+
    '  RUBRICAINDIV RI, PROVDESC PD'+CR_LF+
    'WHERE'+CR_LF+
    '  (RI.IDPESSOA          = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (PD.FLGCONSTAFOLHA    = 0) AND'+CR_LF+
    '  (PD.IDBENEFSALAR IS NOT NULL) AND'+CR_LF+
    '  (RI.IDRUBRICA         = PD.IDPROVENTO)'+CR_LF+
    'UNION'+CR_LF+
    'SELECT'+CR_LF+
    '  PD.DESCRICAO, H.MES AS ANOMESINICIO, 0 AS PARCELAS,'+CR_LF+
    '  0 AS NUMOCORRENCIAS, 1 AS FLGPERMANENTE, -99 AS IDREGRACALCULO,'+CR_LF+
    '  H.VALORPROVENTO AS VALORRUBRICA'+CR_LF+
    'FROM'+CR_LF+
    '  HISTRUBSAL H, PROVDESC PD'+CR_LF+
    'WHERE'+CR_LF+
    '  (H.IDPESSOA           = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (PD.FLGCONSTAFOLHA    = 1) AND'+CR_LF+
    '  (PD.IDBENEFSALAR IS NOT NULL) AND'+CR_LF+
    '  (H.IDRUBRICA          = PD.IDPROVENTO)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  2 DESC, 1');

  // Atualiza o valor conforme a Regra selecionada
  if not(FCdsAux.IsEmpty) then
  begin
    repeat
      FCdsAux.Edit;
      if not(FCdsAux.FieldByName('IdRegraCalculo').IsNull) and
            (FCdsAux.FieldByName('IdRegraCalculo').asInteger <> -99) then
      begin
        dValCalc := FCdsAux.FieldByName('VALORRUBRICA').asFloat;
        FCtrlCalcRub.CalcBeneficioRegra(FCdsAux.FieldByName('IdRegraCalculo').asString,
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
var sSql : String;
begin
  sSql := 'SELECT'+CR_LF+
          '  EF.DATAALTERFUNC, MO.DESCRICAO, EF.SALARIO, EF.TIPOPAGAMENTO, '+CR_LF+
          '  DECODE(EF.NIVELINDIV1,0,F.NIVELINDIV1, EF.NIVELINDIV1) AS NIVELINDIV1,'+CR_LF+  //Marilza Colpani - SOL 131315/KTN 746518
          '  EF.PERC_REAJ, C1.TITULO, C2.TITULO AS FUNCAO, CC.NOME AS CCUSTO'+CR_LF+
          'FROM'+CR_LF+
          '  EVOLFUNC EF, MOTIVO MO, CARGO C1, CARGO C2, CENTCUST CC, FUNCIONARIO F'+CR_LF+  //Marilza Colpani - SOL 131315/KTN 746518
          'WHERE'+CR_LF+
          '  (EF.IDPESSOA       = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
          '  (EF.IDMOTIVO       = MO.IDMOTIVO(+)) AND'+CR_LF+
          '  (EF.IDCARGO        = C1.IDCARGO(+)) AND'+CR_LF+
          '  (EF.IDFUNCAO       = C2.IDCARGO(+)) AND'+CR_LF+
          '  (EF.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND'+CR_LF+
          '  (EF.IDPESSOA = F.IDPESSOA)'+CR_LF+
          ' ORDER BY EF.DATAALTERFUNC DESC, EF.TRGDTINCLUSAO DESC'; // Arnaldo V. Scarin - 14/11
  Result := GetDataPacket(sSql);  //Marilza Colpani - SOL 131315/KTN 746518
end;

function TCtrlHistPessoa.ListProventos(IdPessoa: double; UsaPrevia, SelRubApoio: boolean;
  MesPagto: string; IdMotivo, IdEmpresa: integer; var Total: double): OleVariant;
begin
  FCdsAux.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  H.CODPROVDESC, H.MES, H.REFERENCIA, H.VALORPROVENTO,'+CR_LF+
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
    '  H.CODPROVDESC, H.MES, H.REFERENCIA, H.VALORPROVENTO, RP.DESCRPROVDESC AS DESCRICAO'+CR_LF+
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
  CdsAux := TCMClientDataSet.Create(Nil);
  CdsAux.Data := GetDataPacket('SELECT FLGAVALALUNO FROM PARAMRH');

  if CdsAux.FieldByName('FLGAVALALUNO').asInteger = 0 then
    Result := GetDataPacket(
      'SELECT'+CR_LF+
      '  CU.DESCRICAO, HS.DATPLINI, HS.DATPLFIM,'+CR_LF+
      '  HS.DATREINI, HS.DATREFIM, HS.AVALTEOR, HS.AVALPRAT'+CR_LF+
      'FROM'+CR_LF+
      '  CURSO CU, HSTTRN HS'+CR_LF+
      'WHERE'+CR_LF+
      '  (HS.IDPESSOA = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
      '  (HS.IDCURSO  = CU.IDCURSO)'+CR_LF+
      'ORDER BY HS.DATREFIM DESC, CU.DESCRICAO')
  else
    Result := GetDataPacket(
      'SELECT'+CR_LF+
      '  CU.DESCRICAO, HS.DATPLINI, HS.DATPLFIM,'+CR_LF+
      '  HS.DATREINI, HS.DATREFIM, ROUND(SUM(A.AVALCURSO * 100 / '+CR_LF+
      '    DECODE(NVL(F.FLGAVALCURSO,0),0,NVL(P.VALMAXAVALTRN,100),'+CR_LF+
      '    E.QTDECONCEITOS)) / COUNT(*)) AS AVALTEOR, 0 AS AVALPRAT'+CR_LF+
      'FROM'+CR_LF+
      '  HSTTRN HS, CURSO CU, AVALCURSO A, FATORAVALCURSO F, ESCALACONCEITOS E, PARAMRH P'+CR_LF+
      'WHERE'+CR_LF+
      '  (HS.IDPESSOA = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
      '  (HS.IDCURSO  = CU.IDCURSO) AND'+CR_LF+
      '  (HS.IDPESSOA = A.IDPESSOA(+)) AND'+CR_LF+
      '  (HS.IDCURSO  = A.IDCURSO(+)) AND'+CR_LF+
      '  (HS.NUMSEQ   = A.NUMSEQ(+)) AND'+CR_LF+
      '  (A.IDFATORAVAL = F.IDFATORAVAL(+)) AND'+CR_LF+
      '  (F.IDESCALACONCEITOS = E.IDESCALACONCEITOS(+))'+CR_LF+
      'GROUP BY CU.DESCRICAO, HS.DATPLINI, HS.DATPLFIM,'+CR_LF+
      '  HS.DATREINI, HS.DATREFIM'+CR_LF+
      'ORDER BY HS.DATREFIM DESC, CU.DESCRICAO');

  CdsAux.Free;
end;

function TCtrlHistPessoa.ListEntidadeTreinamento: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  DISTINCT P.NOME, P.IDPESSOA'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, HSTTRN H'+CR_LF+
    'WHERE'+CR_LF+
    '  H.IDENTIDINSTR = P.IDPESSOA'+CR_LF+
    '  ORDER BY UPPER(P.NOME)');
end;

end.
