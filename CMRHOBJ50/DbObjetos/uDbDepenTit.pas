{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 10/07/2002                                 }
{                                                       }
{*******************************************************}
{-------------------------------------------------------------------------------------------------
Nº SIG...........: 20673
Data da Alteração: 08/06/2016
Responsável......: Michelle Mota
Descrição........: ER180 e ER141 - Inclusão da flag "Ativo" - exclusão lógica.
--------------------------------------------------------------------------------------------------
Nº SOL: 229874/16589
Nº PPM: 1235881
Data da Alteração: 19/02/2016
Alteração Form: ER141 - Alteração na aba de dados pessoais e dados titular
Responsável: Michelle Suellyn Mota
Descrição: Inclusão de novos campos, alteração de leiaute e consultas.
**************************************************************************************
Nº SOL......: 188203
Nº KINTANA..: 1786979
Data........: 17/12/2012
Responsavel.: André Oliveira
Descrição...: Inclusão no cadastro de dependentes a informação de participação no Plano Medicamento
              e no cadastro de pessoal um campo indicando a quantidade de dependentes no Plano Medicamento.
              A quantidade de dependentes cadastrados no Plano Medicamento será a soma dos dependentes de
              determinado funcionário que estejam com a flag marcada em seus cadastros.
-------------------------------------------------------------------------------------------------- }

unit uDbDepenTit;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

type
  TDbDepenTit = class(TCmDbObject)
  private
    FFlgContaImpostoR: TCmDbField;
    FIdPessoa: TCmDbField;
    FInicioSalarioF: TCmDbField;
    FInicioImpostoR: TCmDbField;
    FValorBase1: TCmDbField;
    FFimSalarioF: TCmDbField;
    FFlgIgnoraValIR: TCmDbField;
    FFimImpostoR: TCmDbField;
    FMatricula: TCmDbField;
    FFlgDesignado: TCmDbField;
    FValorBase2: TCmDbField;
    FFlgBeneficiario: TCmDbField;
    FNumSequencia: TCmDbField;
    FFlgDepLegal: TCmDbField;
    FIdTitular: TCmDbField;
    FFlgContaSalarioF: TCmDbField;
    FValorBase3: TCmDbField;
    FIdDependencia: TCmDbField;
    FDataCadastro: TCmDbField;
    FFlgPlSaude: TCmDbField;
    FFlgPlOdonto: TCmDbField;
    FFlgPlMedic: TCmDbField;  //SOL 182203  KINTANA 1786979
    // Início - Michelle Mota - SOL: 229874.16589 PPM: 1235881
    FIdDependenteLegalESocial: TCmDbField;
    FFlgPensaoAliment: TCmDbField;
    FPercAlimentic: TCmDbField;
    // Término - Michelle Mota - SOL: 229874.16589 PPM: 1235881
    FFlgAtivo: TCmDbField; // Michelle Mota - SIG 20673

  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdTitular: TCmDbField read FIdTitular write FIdTitular;
    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property ValorBase1: TCmDbField read FValorBase1 write FValorBase1;
    property ValorBase2: TCmDbField read FValorBase2 write FValorBase2;
    property ValorBase3: TCmDbField read FValorBase3 write FValorBase3;
    property NumSequencia: TCmDbField read FNumSequencia write FNumSequencia;
    property Matricula: TCmDbField read FMatricula write FMatricula;
    property InicioSalarioF: TCmDbField read FInicioSalarioF write FInicioSalarioF;
    property InicioImpostoR: TCmDbField read FInicioImpostoR write FInicioImpostoR;
    property IdDependencia: TCmDbField read FIdDependencia write FIdDependencia;
    property FlgIgnoraValIR: TCmDbField read FFlgIgnoraValIR write FFlgIgnoraValIR;
    property FlgDesignado: TCmDbField read FFlgDesignado write FFlgDesignado;
    property FlgDepLegal: TCmDbField read FFlgDepLegal write FFlgDepLegal;
    property FlgContaSalarioF: TCmDbField read FFlgContaSalarioF write FFlgContaSalarioF;
    property FlgContaImpostoR: TCmDbField read FFlgContaImpostoR write FFlgContaImpostoR;
    property FlgBeneficiario: TCmDbField read FFlgBeneficiario write FFlgBeneficiario;
    property FimSalarioF: TCmDbField read FFimSalarioF write FFimSalarioF;
    property FimImpostoR: TCmDbField read FFimImpostoR write FFimImpostoR;
    property DataCadastro: TCmDbField read FDataCadastro write FDataCadastro;
    property FlgPlSaude: TCmDbField read FFlgPlSaude write FFlgPlSaude;
    property FlgPlOdonto: TCmDbField read FFlgPlOdonto write FFlgPlOdonto;
    property FlgPlMedic: TCmDbField read FFlgPlMedic write FFlgPlMedic;  //SOL 182203  KINTANA 1786979
    // Início - Michelle Mota - SOL: 229874.16589 PPM: 1235881
    property IdDependenteLegalESocial: TCmDbField read FIdDependenteLegalESocial write FIdDependenteLegalESocial;
    property FlgPensaoAliment: TCmDbField read FFlgPensaoAliment write FFlgPensaoAliment;
    property PercAlimentic: TCmDbField read FPercAlimentic write FPercAlimentic;
    // Término - Michelle Mota - SOL: 229874.16589 PPM: 1235881
    property FlgAtivo: TCmDbField read FFlgAtivo write FFlgAtivo; // Michelle Mota - SIG 20673
  end;

implementation

{ TDbDepenTit }

constructor TDbDepenTit.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'DEPENTIT';

  FIdTitular := CreateCmDbField('IDTITULAR',ftFloat,true,true,false,false,'');
  FIdPessoa := CreateCmDbField('IDPESSOA',ftFloat,true,true,false,false,'');
  FValorBase1 := CreateCmDbField('VALORBASE1',ftFloat,false,false,false,false,'');
  FValorBase2 := CreateCmDbField('VALORBASE2',ftFloat,false,false,false,false,'');
  FValorBase3 := CreateCmDbField('VALORBASE3',ftFloat,false,false,false,false,'');
  FNumSequencia := CreateCmDbField('NUMSEQUENCIA',ftFloat,false,false,false,false,'');
  FMatricula := CreateCmDbField('MATRICULA',ftString,false,false,false,false,'');
  FInicioSalarioF := CreateCmDbField('INICIOSALARIOF',ftDateTime,false,false,false,true,'');
  FInicioImpostoR := CreateCmDbField('INICIOIMPOSTOR',ftDateTime,false,false,false,true,'');
  FIdDependencia := CreateCmDbField('IDDEPENDENCIA',ftString,true,false,false,false,'');
  FFlgIgnoraValIR := CreateCmDbField('FLGIGNORAVALIR',ftFloat,false,false,false,false,'');
  FFlgDesignado := CreateCmDbField('FLGDESIGNADO',ftFloat,false,false,false,false,'');
  FFlgDepLegal := CreateCmDbField('FLGDEPLEGAL',ftFloat,false,false,false,false,'');
  FFlgContaSalarioF := CreateCmDbField('FLGCONTASALARIOF',ftFloat,false,false,false,false,'');
  FFlgContaImpostoR := CreateCmDbField('FLGCONTAIMPOSTOR',ftFloat,false,false,false,false,'');
  FFlgBeneficiario := CreateCmDbField('FLGBENEFICIARIO',ftFloat,false,false,false,false,'');
  FFimSalarioF := CreateCmDbField('FIMSALARIOF',ftDateTime,false,false,false,true,'');
  FFimImpostoR := CreateCmDbField('FIMIMPOSTOR',ftDateTime,false,false,false,true,'');
  FDataCadastro := CreateCmDbField('DATACADASTRO',ftDateTime,false,false,false,true,'');

  FFlgPlSaude := CreateCmDbField('FLGPLSAUDE',ftFloat,false,false,false,false,'');

  FFlgPlOdonto := CreateCmDbField('FLGPLODONTO',ftFloat,false,false,false,false,'');
  FlgPlMedic := CreateCmDbField('FLGPLMEDIC',ftFloat,false,false,false,false,'');     //SOL 182203  KINTANA 1786979

  // Início - Michelle Mota - SOL: 229874.16589 PPM: 1235881
  FIdDependenteLegalESocial := CreateCmDbField('IDDEPENDENTELEGALESOCIAL',ftInteger,true,false,false,false,'');
  FFlgPensaoAliment := CreateCmDbField('FLGPENSAOALIMENT',ftFloat,false,false,false,false,'');
  FPercAlimentic := CreateCmDbField('PERCALIMENTIC',ftFloat,false,false,false,false,'');
  // Término - Michelle Mota - SOL: 229874.16589 PPM: 1235881
  FFlgAtivo := CreateCmDbField('FLGATIVO',ftString,false,false,false,false,''); // Michelle Mota - SIG 20673
end;

end.
