{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 11/03/2002                                 }
{                                                       }
{*******************************************************}

unit uDbSindicato;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB;

type
  TDbSindicato = class(TCmDbObject)
  private
    FIdPessoa: TCmDbField;
    FRegistroMt: TCmDbField;
    FMesContribuicao: TCmDbField;
    FMesBase: TCmDbField;
    FPisoSalarial: TCmDbField;
    FMoeCodigo: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property RegistroMt: TCmDbField read FRegistroMt write FRegistroMt;
    property MesBase: TCmDbField read FMesBase write FMesBase;
    property MesContribuicao: TCmDbField read FMesContribuicao write FMesContribuicao;
    property PisoSalarial: TCmDbField read FPisoSalarial write FPisoSalarial;
    property MoeCodigo: TCmDbField read FMoeCodigo write FMoeCodigo;
  end;

implementation

{ TDbSindicato }

constructor TDbSindicato.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'SINDICATO';

  FIdPessoa := CreateCmDbField('IDPESSOA',ftFloat,true,true,false,false,'');
  FRegistroMt := CreateCmDbField('REGISTROMT',ftString,false,false,false,true,'');
  FMesBase := CreateCmDbField('MESBASE',ftFloat,false,false,false,true,'');
  FMesContribuicao := CreateCmDbField('MESCONTRIBUICAO',ftFloat,false,false,false,true,'');
  FPisoSalarial := CreateCmDbField('PISOSALARIAL',ftFloat,false,false,false,true,'');
  FMoeCodigo := CreateCmDbField('MOECODIGO',ftFloat,false,false,false,true,'');
end;

end.
