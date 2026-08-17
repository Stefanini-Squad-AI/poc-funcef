{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 13/02/2003                                 }
{                                                       }
{*******************************************************}

unit uDbEstrangeiro;

interface

uses uCmCustomCdbObject, uCmDbObject, DB;

type
  TDbEstrangeiro = class(TCmDbObject)
  private
    FDecretoNaturalizacao: TCmDbField;
    FMod19Numero: TCmDbField;
    FIdPessoa: TCmDbField;
    FFlgCasadoBrasileiro: TCmDbField;
    FIdNacionMae: TCmDbField;
    FFlgFilhosBrasileiros: TCmDbField;
    FMod19Registro: TCmDbField;
    FFlgNaturalizado: TCmDbField;
    FIdNacionPai: TCmDbField;
    FAnoChegada: TCmDbField;
  public
    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property AnoChegada: TCmDbField read FAnoChegada write FAnoChegada;
    property IdNacionPai: TCmDbField read FIdNacionPai write FIdNacionPai;
    property IdNacionMae: TCmDbField read FIdNacionMae write FIdNacionMae;
    property FlgNaturalizado: TCmDbField read FFlgNaturalizado write FFlgNaturalizado;
    property FlgFilhosBrasileiros: TCmDbField read FFlgFilhosBrasileiros write FFlgFilhosBrasileiros;
    property FlgCasadoBrasileiro: TCmDbField read FFlgCasadoBrasileiro write FFlgCasadoBrasileiro;
    property DecretoNaturalizacao: TCmDbField read FDecretoNaturalizacao write FDecretoNaturalizacao;
    property Mod19Registro: TCmDbField read FMod19Registro write FMod19Registro;
    property Mod19Numero: TCmDbField read FMod19Numero write FMod19Numero;

    constructor Create(AOwner: TCmCustomCdbObject); override;
  end;

implementation

{ TDbEstrangeiro }

constructor TDbEstrangeiro.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'ESTRANGEIRO';

  FIdPessoa := CreateCmDbField('IDPESSOA',ftFloat,true,true,false,true,'');
  FAnoChegada := CreateCmDbField('ANOCHEGADA',ftDateTime,false,false,false,true,'');
  FIdNacionPai := CreateCmDbField('IDNACIONPAI',ftFloat,false,false,false,true,'');
  FIdNacionMae := CreateCmDbField('IDNACIONMAE',ftFloat,false,false,false,true,'');
  FFlgNaturalizado := CreateCmDbField('FLGNATURALIZADO',ftFloat,false,false,false,false,'');
  FFlgFilhosBrasileiros := CreateCmDbField('FLGFILHOSBRASILEIROS',ftFloat,false,false,false,false,'');
  FFlgCasadoBrasileiro := CreateCmDbField('FLGCASADOBRASILEIRO',ftFloat,false,false,false,false,'');
  FDecretoNaturalizacao := CreateCmDbField('DECRETONATURALIZACAO',ftFloat,false,false,false,true,'');
  FMod19Registro := CreateCmDbField('MOD19REGISTRO',ftFloat,false,false,false,true,'');
  FMod19Numero := CreateCmDbField('MOD19NUMERO',ftFloat,false,false,false,true,'');
end;

end.
