{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 20/08/2002                                 }
{                                                       }
{*******************************************************}

unit uDbGuiaGRPS;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

type
  TDbGuiaGRPS = class(TCmDbObject)
  private
    FMes: TCmDbField;
    FTotal: TCmDbField;
    FSegAcidTrabalho: TCmDbField;
    FDataVencGRPS: TCmDbField;
    FSalarioFamilia: TCmDbField;
    FAuxilioDoenca: TCmDbField;
    FCodigoPag: TCmDbField;
    FIdFilialPessoa: TCmDbField;
    FSalarMaternidade: TCmDbField;
    FAuxilioNatalidade: TCmDbField;
    FDataFimGRPS: TCmDbField;
    FMoeCodigo: TCmDbField;
    FAdicGPSA: TCmDbField;
    FAdicGPSB: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdFilialPessoa: TCmDbField read FIdFilialPessoa write FIdFilialPessoa;
    property Mes: TCmDbField read FMes write FMes;
    property DataVencGRPS: TCmDbField read FDataVencGRPS write FDataVencGRPS;
    property DataFimGRPS: TCmDbField read FDataFimGRPS write FDataFimGRPS;
    property CodigoPag: TCmDbField read FCodigoPag write FCodigoPag;
    property MoeCodigo: TCmDbField read FMoeCodigo write FMoeCodigo;
    property SegAcidTrabalho: TCmDbField read FSegAcidTrabalho write FSegAcidTrabalho;
    property SalarMaternidade: TCmDbField read FSalarMaternidade write FSalarMaternidade;
    property SalarioFamilia: TCmDbField read FSalarioFamilia write FSalarioFamilia;
    property AuxilioNatalidade: TCmDbField read FAuxilioNatalidade write FAuxilioNatalidade;
    property AuxilioDoenca: TCmDbField read FAuxilioDoenca write FAuxilioDoenca;
    property AdicGPSA: TCmDbField read FAdicGPSA write FAdicGPSA;
    property AdicGPSB: TCmDbField read FAdicGPSB write FAdicGPSB;
    property Total: TCmDbField read FTotal write FTotal;
  end;

implementation

{ TDbGuiaGRPS }

constructor TDbGuiaGRPS.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'GUIAGRPS';

  FIdFilialPessoa := CreateCmDbField('IDFILIALPESSOA',ftFloat,true,true,false,true,'');
  FMes := CreateCmDbField('MES',ftString,true,true,false,true,'');
  FDataVencGRPS := CreateCmDbField('DATAVENCGRPS',ftDateTime,false,false,false,true,'');
  FDataFimGRPS := CreateCmDbField('DATAFIMGRPS',ftDateTime,true,false,false,true,'');
  FCodigoPag := CreateCmDbField('CODIGOPAG',ftString,false,false,false,true,'');
  FMoeCodigo := CreateCmDbField('MOECODIGO',ftFloat,false,false,false,true,'');
  FSegAcidTrabalho := CreateCmDbField('SEGACIDTRABALHO',ftFloat,false,false,false,true,'');
  FSalarMaternidade := CreateCmDbField('SALARMATERNIDADE',ftFloat,false,false,false,true,'');
  FSalarioFamilia := CreateCmDbField('SALARIOFAMILIA',ftFloat,false,false,false,true,'');
  FAuxilioNatalidade := CreateCmDbField('AUXILIONATALIDADE',ftFloat,false,false,false,true,'');
  FAuxilioDoenca := CreateCmDbField('AUXILIODOENCA',ftFloat,false,false,false,true,'');
  FAdicGPSA := CreateCmDbField('ADICGPSA',ftFloat,false,false,false,true,'');
  FAdicGPSB := CreateCmDbField('ADICGPSB',ftFloat,false,false,false,true,'');
  FTotal := CreateCmDbField('TOTAL',ftFloat,false,false,false,true,'');
end;

end.
