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

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

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
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

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
  end;

implementation

{ TDbFuncionario }

constructor TDbFuncionario.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'FUNCIONARIO';

  FValorfgts := CreateCmDbField('VALORFGTS',ftFloat,false,false,false,true,'');
  FTipopagamento := CreateCmDbField('TIPOPAGAMENTO',ftString,false,false,false,false,'');
  FTipomaodeobra := CreateCmDbField('TIPOMAODEOBRA',ftString,false,false,false,false,'');
  FTipocontrato := CreateCmDbField('TIPOCONTRATO',ftString,false,false,false,false,'');
  FSalariotipo := CreateCmDbField('SALARIOTIPO',ftString,false,false,false,false,'');
  FSalarioatual := CreateCmDbField('SALARIOATUAL',ftFloat,false,false,false,true,'');
  FQuantidadefgts := CreateCmDbField('QUANTIDADEFGTS',ftFloat,false,false,false,false,'');
  FProrrogcontrato := CreateCmDbField('PRORROGCONTRATO',ftFloat,false,false,false,false,'');
  FNumcontasalario := CreateCmDbField('NUMCONTASALARIO',ftString,false,false,false,true,'');
  FNumcontafgts := CreateCmDbField('NUMCONTAFGTS',ftString,false,false,false,true,'');
  FNivelindiv2 := CreateCmDbField('NIVELINDIV2',ftFloat,false,false,false,true,'');
  FNivelindiv1 := CreateCmDbField('NIVELINDIV1',ftFloat,false,false,false,true,'');
  FMatricula := CreateCmDbField('MATRICULA',ftString,false,false,false,false,'');
  FIdvincempreg := CreateCmDbField('IDVINCEMPREG',ftFloat,false,false,false,true,'');
  FIdtipotrab := CreateCmDbField('IDTIPOTRAB',ftFloat,false,false,false,true,'');
  FIdsitrisco := CreateCmDbField('IDSITRISCO',ftFloat,false,false,false,true,'');
  FIdsitfunc := CreateCmDbField('IDSITFUNC',ftFloat,false,false,false,true,'');
  FIdprocessodem := CreateCmDbField('IDPROCESSODEM',ftFloat,false,false,false,true,'');
  FIdpessoa := CreateCmDbField('IDPESSOA',ftFloat,true,true,false,false,'');
  FIdmovcontrcaged := CreateCmDbField('IDMOVCONTRCAGED',ftFloat,false,false,false,true,'');
  FIdmotivodesligrais := CreateCmDbField('IDMOTIVODESLIGRAIS',ftFloat,false,false,false,true,'');
  FIdmotivodesliggerencial := CreateCmDbField('IDMOTIVODESLIGGERENCIAL',ftFloat,false,false,false,true,'');
  FIdhorario := CreateCmDbField('IDHORARIO',ftFloat,false,false,false,true,'');
  FIdfuncao := CreateCmDbField('IDFUNCAO',ftFloat,false,false,false,true,'');
  FIdformaresc := CreateCmDbField('IDFORMARESC',ftFloat,false,false,false,true,'');
  FIdfaixafuncao := CreateCmDbField('IDFAIXAFUNCAO',ftFloat,false,false,false,true,'');
  FIdfaixacargo := CreateCmDbField('IDFAIXACARGO',ftFloat,false,false,false,true,'');
  FIdestab := CreateCmDbField('IDESTAB',ftFloat,false,false,false,true,'');
  FIdempresa := CreateCmDbField('IDEMPRESA',ftFloat,false,false,false,true,'');
  FIddeposgre := CreateCmDbField('IDDEPOSGRE',ftFloat,false,false,false,true,'');
  FIdchefe := CreateCmDbField('IDCHEFE',ftFloat,false,false,false,true,'');
  FIdcatemprgre := CreateCmDbField('IDCATEMPRGRE',ftFloat,false,false,false,true,'');
  FIdcargo := CreateCmDbField('IDCARGO',ftFloat,false,false,false,true,'');
  FIdagenciasalario := CreateCmDbField('IDAGENCIASALARIO',ftFloat,false,false,false,true,'');
  FIdagenciafgts := CreateCmDbField('IDAGENCIAFGTS',ftFloat,false,false,false,true,'');
  FIdafastrais := CreateCmDbField('IDAFASTRAIS',ftFloat,false,false,false,true,'');
  FHomologacaoorgao := CreateCmDbField('HOMOLOGACAOORGAO',ftString,false,false,false,true,'');
  FHomologacaonumero := CreateCmDbField('HOMOLOGACAONUMERO',ftString,false,false,false,true,'');
  FFlgtipofgts := CreateCmDbField('FLGTIPOFGTS',ftFloat,false,false,false,false,'');
  FDuracaocontrato := CreateCmDbField('DURACAOCONTRATO',ftFloat,false,false,false,false,'');
  FDatasalario := CreateCmDbField('DATASALARIO',ftDateTime,false,false,false,true,'');
  FDataretorno := CreateCmDbField('DATARETORNO',ftDateTime,false,false,false,true,'');
  FDatarefhorario := CreateCmDbField('DATAREFHORARIO',ftDateTime,false,false,false,true,'');
  FDataopcaofgts := CreateCmDbField('DATAOPCAOFGTS',ftDateTime,false,false,false,true,'');
  FDatalotacao := CreateCmDbField('DATALOTACAO',ftDateTime,false,false,false,true,'');
  FDatafimcontrato := CreateCmDbField('DATAFIMCONTRATO',ftDateTime,false,false,false,true,'');
  FDatadesligamento := CreateCmDbField('DATADESLIGAMENTO',ftDateTime,false,false,false,true,'');
  FDatacargo2 := CreateCmDbField('DATACARGO2',ftDateTime,false,false,false,true,'');
  FDatacargo := CreateCmDbField('DATACARGO',ftDateTime,false,false,false,true,'');
  FDataaviso := CreateCmDbField('DATAAVISO',ftDateTime,false,false,false,true,'');
  FDataadmissao := CreateCmDbField('DATAADMISSAO',ftDateTime,false,false,false,true,'');
  FCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString,false,false,false,false,'');
  FCodarrumadeira := CreateCmDbField('CODARRUMADEIRA',ftString,false,false,false,false,'');
end;

end.
