{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 02/08/2002                                 }
{                                                       }
{*******************************************************}

unit uDbFuncionario;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB;

type
  TDbFuncionario = class(TCmDbObject)
  private
    FNivelindiv1: TCmDbField;
    FIdagenciafgts: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FDatacargo: TCmDbField;
    FTipoMaoDeObra: TCmDbField;
    FIdestab: TCmDbField;
    FIdcargo: TCmDbField;
    FIdpessoa: TCmDbField;
    FHomologacaonumero: TCmDbField;
    FSalarioatual: TCmDbField;
    FIdformaresc: TCmDbField;
    FIdempresa: TCmDbField;
    FIdvincempreg: TCmDbField;
    FNumcontafgts: TCmDbField;
    FIdfaixacargo: TCmDbField;
    FIdmotivodesligrais: TCmDbField;
    FFlgtipofgts: TCmDbField;
    FIdsitrisco: TCmDbField;
    FDatalotacao: TCmDbField;
    FNivelindiv2: TCmDbField;
    FHomologacaoorgao: TCmDbField;
    FIdagenciasalario: TCmDbField;
    FMatricula: TCmDbField;
    FDatadesligamento: TCmDbField;
    FIdfaixafuncao: TCmDbField;
    FIdsitfunc: TCmDbField;
    FIdmotivodesliggerencial: TCmDbField;
    FDataadmissao: TCmDbField;
    FDatafimcontrato: TCmDbField;
    FDatarefhorario: TCmDbField;
    FIdchefe: TCmDbField;
    FIdfuncao: TCmDbField;
    FDatacargo2: TCmDbField;
    FDataretorno: TCmDbField;
    FIdafastrais: TCmDbField;
    FDuracaocontrato: TCmDbField;
    FIddeposgre: TCmDbField;
    FProrrogcontrato: TCmDbField;
    FIdmovcontrcaged: TCmDbField;
    FDataaviso: TCmDbField;
    FIdprocessodem: TCmDbField;
    FIdtipotrab: TCmDbField;
    FDatasalario: TCmDbField;
    FNumcontasalario: TCmDbField;
    FValorFGTS: TCmDbField;
    FQuantidadefgts: TCmDbField;
    FSalariotipo: TCmDbField;
    FIdcatemprgre: TCmDbField;
    FIdhorario: TCmDbField;
    FTipocontrato: TCmDbField;
    FCodarrumadeira: TCmDbField;
    FDataopcaofgts: TCmDbField;
    FTipoPagamento: TCmDbField;
    FDatBancoHoras: TCmDbField;
    FFlgMarcaPonto: TCmDbField;
    FFlgMarcaIntervalo: TCmDbField;
    FFIR: TCmDbField;
    FUnidNegoc: TCmDbField;
    FCodSubConta: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject; UsaMarcaIntervalo: boolean = false); reintroduce;

    property ValorFGTS: TCmDbField read FValorFGTS write FValorFGTS;
    property TipoPagamento: TCmDbField read FTipoPagamento write FTipoPagamento;
    property TipoMaoDeObra: TCmDbField read FTipoMaoDeObra write FTipoMaoDeObra;
    property Tipocontrato: TCmDbField read FTipocontrato write FTipocontrato;
    property Salariotipo: TCmDbField read FSalariotipo write FSalariotipo;
    property Salarioatual: TCmDbField read FSalarioatual write FSalarioatual;
    property Quantidadefgts: TCmDbField read FQuantidadefgts write FQuantidadefgts;
    property Prorrogcontrato: TCmDbField read FProrrogcontrato write FProrrogcontrato;
    property Numcontasalario: TCmDbField read FNumcontasalario write FNumcontasalario;
    property Numcontafgts: TCmDbField read FNumcontafgts write FNumcontafgts;
    property Nivelindiv2: TCmDbField read FNivelindiv2 write FNivelindiv2;
    property Nivelindiv1: TCmDbField read FNivelindiv1 write FNivelindiv1;
    property Matricula: TCmDbField read FMatricula write FMatricula;
    property Idvincempreg: TCmDbField read FIdvincempreg write FIdvincempreg;
    property Idtipotrab: TCmDbField read FIdtipotrab write FIdtipotrab;
    property Idsitrisco: TCmDbField read FIdsitrisco write FIdsitrisco;
    property Idsitfunc: TCmDbField read FIdsitfunc write FIdsitfunc;
    property Idprocessodem: TCmDbField read FIdprocessodem write FIdprocessodem;
    property Idpessoa: TCmDbField read FIdpessoa write FIdpessoa;
    property Idmovcontrcaged: TCmDbField read FIdmovcontrcaged write FIdmovcontrcaged;
    property Idmotivodesligrais: TCmDbField read FIdmotivodesligrais write FIdmotivodesligrais;
    property Idmotivodesliggerencial: TCmDbField read FIdmotivodesliggerencial write FIdmotivodesliggerencial;
    property Idhorario: TCmDbField read FIdhorario write FIdhorario;
    property Idfuncao: TCmDbField read FIdfuncao write FIdfuncao;
    property Idformaresc: TCmDbField read FIdformaresc write FIdformaresc;
    property Idfaixafuncao: TCmDbField read FIdfaixafuncao write FIdfaixafuncao;
    property Idfaixacargo: TCmDbField read FIdfaixacargo write FIdfaixacargo;
    property Idestab: TCmDbField read FIdestab write FIdestab;
    property Idempresa: TCmDbField read FIdempresa write FIdempresa;
    property Iddeposgre: TCmDbField read FIddeposgre write FIddeposgre;
    property Idchefe: TCmDbField read FIdchefe write FIdchefe;
    property Idcatemprgre: TCmDbField read FIdcatemprgre write FIdcatemprgre;
    property Idcargo: TCmDbField read FIdcargo write FIdcargo;
    property Idagenciasalario: TCmDbField read FIdagenciasalario write FIdagenciasalario;
    property Idagenciafgts: TCmDbField read FIdagenciafgts write FIdagenciafgts;
    property Idafastrais: TCmDbField read FIdafastrais write FIdafastrais;
    property Homologacaoorgao: TCmDbField read FHomologacaoorgao write FHomologacaoorgao;
    property Homologacaonumero: TCmDbField read FHomologacaonumero write FHomologacaonumero;
    property Flgtipofgts: TCmDbField read FFlgtipofgts write FFlgtipofgts;
    property Duracaocontrato: TCmDbField read FDuracaocontrato write FDuracaocontrato;
    property Datasalario: TCmDbField read FDatasalario write FDatasalario;
    property Dataretorno: TCmDbField read FDataretorno write FDataretorno;
    property Datarefhorario: TCmDbField read FDatarefhorario write FDatarefhorario;
    property Dataopcaofgts: TCmDbField read FDataopcaofgts write FDataopcaofgts;
    property Datalotacao: TCmDbField read FDatalotacao write FDatalotacao;
    property Datafimcontrato: TCmDbField read FDatafimcontrato write FDatafimcontrato;
    property Datadesligamento: TCmDbField read FDatadesligamento write FDatadesligamento;
    property Datacargo2: TCmDbField read FDatacargo2 write FDatacargo2;
    property Datacargo: TCmDbField read FDatacargo write FDatacargo;
    property Dataaviso: TCmDbField read FDataaviso write FDataaviso;
    property Dataadmissao: TCmDbField read FDataadmissao write FDataadmissao;
    property Codcentrocusto: TCmDbField read FCodcentrocusto write FCodcentrocusto;
    property Codarrumadeira: TCmDbField read FCodarrumadeira write FCodarrumadeira;
    property DatBancoHoras: TCmDbField read FDatBancoHoras write FDatBancoHoras;
    property FlgMarcaPonto: TCmDbField read FFlgMarcaPonto write FFlgMarcaPonto;
    property FlgMarcaIntervalo: TCmDbField read FFlgMarcaIntervalo write FFlgMarcaIntervalo;
    property FIR: TCmDbField read FFIR write FFIR;
    property UnidNegoc: TCmDbField read FUnidNegoc write FUnidNegoc;
    property CodSubConta: TCmDbField read FCodSubConta write FCodSubConta;
  end;

implementation

{ TDbFuncionario }

constructor TDbFuncionario.Create(AOwner: TCmCustomCdbObject; UsaMarcaIntervalo: boolean);
begin
  inherited Create(AOwner);
  ErrorIfNoRowsAffected := false;

  TableName := 'FUNCIONARIO';

  FIdPessoa := CreateCmDbField('IDPESSOA',ftFloat,true,true,false,false,'');
  FValorFGTS := CreateCmDbField('VALORFGTS',ftFloat,false,false,false,false,'');
  FTipoPagamento := CreateCmDbField('TIPOPAGAMENTO',ftString,false,false,false,false,'');
  FTipoMaoDeObra := CreateCmDbField('TIPOMAODEOBRA',ftString,false,false,false,false,'');
  FTipoContrato := CreateCmDbField('TIPOCONTRATO',ftString,false,false,false,false,'');
  FSalarioTipo := CreateCmDbField('SALARIOTIPO',ftString,false,false,false,false,'');
  FSalarioAtual := CreateCmDbField('SALARIOATUAL',ftFloat,false,false,false,false,'');
  FQuantidadeFGTS := CreateCmDbField('QUANTIDADEFGTS',ftFloat,false,false,false,false,'');
  FProrrogContrato := CreateCmDbField('PRORROGCONTRATO',ftFloat,false,false,false,false,'');
  FNumContaSalario := CreateCmDbField('NUMCONTASALARIO',ftString,false,false,false,false,'');
  FNumcontaFGTS := CreateCmDbField('NUMCONTAFGTS',ftString,false,false,false,false,'');
  FNivelIndiv2 := CreateCmDbField('NIVELINDIV2',ftFloat,false,false,false,false,'');
  FNivelIndiv1 := CreateCmDbField('NIVELINDIV1',ftFloat,false,false,false,false,'');
  FMatricula := CreateCmDbField('MATRICULA',ftString,false,false,false,false,'');
  FIdVincEmpreg := CreateCmDbField('IDVINCEMPREG',ftFloat,false,false,false,true,'');
  FIdTipoTrab := CreateCmDbField('IDTIPOTRAB',ftFloat,false,false,false,true,'');
  FIdSitRisco := CreateCmDbField('IDSITRISCO',ftFloat,false,false,false,false,'');
  FIdSitFunc := CreateCmDbField('IDSITFUNC',ftFloat,false,false,false,true,'');
  FIdProcessoDem := CreateCmDbField('IDPROCESSODEM',ftFloat,false,false,false,true,'');
  FIdMovContrCAGED := CreateCmDbField('IDMOVCONTRCAGED',ftFloat,false,false,false,true,'');
  FIdMotivoDesligRAIS := CreateCmDbField('IDMOTIVODESLIGRAIS',ftFloat,false,false,false,true,'');
  FIdMotivoDesligGerencial := CreateCmDbField('IDMOTIVODESLIGGERENCIAL',ftFloat,false,false,false,true,'');
  FIdHorario := CreateCmDbField('IDHORARIO',ftFloat,false,false,false,true,'');
  FIdFuncao := CreateCmDbField('IDFUNCAO',ftFloat,false,false,false,true,'');
  FIdFormaResc := CreateCmDbField('IDFORMARESC',ftFloat,false,false,false,false,'');
  FIdFaixaFuncao := CreateCmDbField('IDFAIXAFUNCAO',ftFloat,false,false,false,true,'');
  FIdFaixaCargo := CreateCmDbField('IDFAIXACARGO',ftFloat,false,false,false,true,'');
  FIdEstab := CreateCmDbField('IDESTAB',ftFloat,false,false,false,true,'');
  FIdEmpresa := CreateCmDbField('IDEMPRESA',ftFloat,false,false,false,true,'');
  FIdDeposGRE := CreateCmDbField('IDDEPOSGRE',ftFloat,false,false,false,true,'');
  FIdChefe := CreateCmDbField('IDCHEFE',ftFloat,false,false,false,true,'');
  FIdCatEmprGRE := CreateCmDbField('IDCATEMPRGRE',ftFloat,false,false,false,true,'');
  FIdCargo := CreateCmDbField('IDCARGO',ftFloat,false,false,false,true,'');
  FIdAgenciaSalario := CreateCmDbField('IDAGENCIASALARIO',ftFloat,false,false,false,true,'');
  FIdAgenciaFGTS := CreateCmDbField('IDAGENCIAFGTS',ftFloat,false,false,false,true,'');
  FIdAfastRAIS := CreateCmDbField('IDAFASTRAIS',ftFloat,false,false,false,true,'');
  FHomologacaoOrgao := CreateCmDbField('HOMOLOGACAOORGAO',ftString,false,false,false,true,'');
  FHomologacaoNumero := CreateCmDbField('HOMOLOGACAONUMERO',ftString,false,false,false,true,'');
  FFlgTipoFGTS := CreateCmDbField('FLGTIPOFGTS',ftFloat,false,false,false,false,'');
  FDuracaoContrato := CreateCmDbField('DURACAOCONTRATO',ftFloat,false,false,false,false,'');
  FDataSalario := CreateCmDbField('DATASALARIO',ftDateTime,false,false,false,true,'');
  FDataRetorno := CreateCmDbField('DATARETORNO',ftDateTime,false,false,false,true,'');
  FDataRefHorario := CreateCmDbField('DATAREFHORARIO',ftDateTime,false,false,false,true,'');
  FDataOpcaoFGTS := CreateCmDbField('DATAOPCAOFGTS',ftDateTime,false,false,false,true,'');
  FDataLotacao := CreateCmDbField('DATALOTACAO',ftDateTime,false,false,false,true,'');
  FDataFimContrato := CreateCmDbField('DATAFIMCONTRATO',ftDateTime,false,false,false,true,'');
  FDataDesligamento := CreateCmDbField('DATADESLIGAMENTO',ftDateTime,false,false,false,true,'');
  FDataCargo2 := CreateCmDbField('DATACARGO2',ftDateTime,false,false,false,true,'');
  FDataCargo := CreateCmDbField('DATACARGO',ftDateTime,false,false,false,true,'');
  FDataAviso := CreateCmDbField('DATAAVISO',ftDateTime,false,false,false,true,'');
  FDataAdmissao := CreateCmDbField('DATAADMISSAO',ftDateTime,false,false,false,true,'');
  FCodCentroCusto := CreateCmDbField('CODCENTROCUSTO',ftString,false,false,false,false,'');
  FCodArrumadeira := CreateCmDbField('CODARRUMADEIRA',ftString,false,false,false,false,'');
  FDatBancoHoras := CreateCmDbField('DATBANCOHORAS',ftDateTime,false,false,false,true,'');
  FFlgMarcaPonto := CreateCmDbField('FLGMARCAPONTO',ftFloat,false,false,false,false,'');

  if (UsaMarcaIntervalo) then
    FFlgMarcaIntervalo := CreateCmDbField('FLGMARCAINTERVALO',ftFloat,false,false,false,false,'');

  FFIR := CreateCmDbField('FIR',ftString,false,false,false,false,'');
  FUnidNegoc := CreateCmDbField('UNIDNEGOC',ftFloat,false,false,false,true,'');
  FCodSubConta := CreateCmDbField('CODSUBCONTA',ftFloat,false,false,false,true,'');
end;

end.
