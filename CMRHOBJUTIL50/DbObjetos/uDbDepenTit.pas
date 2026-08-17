{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 10/07/2002                                 }
{                                                       }
{*******************************************************}

unit uDbDepenTit;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB;

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
end;

end.
