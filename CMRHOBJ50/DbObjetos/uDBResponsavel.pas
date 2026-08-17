{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 11/03/2002                             }
{                                                       }
{*******************************************************}

unit uDBResponsavel;

interface

uses uCmDbObject, uSistema, DB, uCmCustomCdbObject;

type
  TDBResponsavel = class(TCmDbObject)
  private
    FFlgprojeto: TCmDbField;
    FFlgcontrato: TCmDbField;
    FIdresponsavel: TCmDbField;
    FFlgadmprev: TCmDbField;
    FFlgimobiliario: TCmDbField;
    FFlgtpresponsavel: TCmDbField;
    FFlgativofixo: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdResponsavel: TCmDbField read FIdresponsavel write FIdresponsavel;
    property FlgTpResponsavel: TCmDbField read FFlgtpresponsavel write FFlgtpresponsavel;
    property FlgProjeto: TCmDbField read FFlgprojeto write FFlgprojeto;
    property FlgImobiliario: TCmDbField read FFlgimobiliario write FFlgimobiliario;
    property FlgContrato: TCmDbField read FFlgcontrato write FFlgcontrato;
    property FlgAtivoFixo: TCmDbField read FFlgativofixo write FFlgativofixo;
    property FlgAdmPrev: TCmDbField read FFlgadmprev write FFlgadmprev;
  end;

implementation

{ TDBResponsavel }

constructor TDBResponsavel.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'RESPONSAVEL';

  FIdresponsavel := CreateCmDbField('IDRESPONSAVEL',ftFloat,true,true,false,true,'');
  FFlgtpresponsavel := CreateCmDbField('FLGTPRESPONSAVEL',ftFloat,false,false,false,false,'');
  FFlgprojeto := CreateCmDbField('FLGPROJETO',ftFloat,false,false,false,false,'');
  FFlgimobiliario := CreateCmDbField('FLGIMOBILIARIO',ftFloat,false,false,false,false,'');
  FFlgcontrato := CreateCmDbField('FLGCONTRATO',ftFloat,false,false,false,false,'');
  FFlgativofixo := CreateCmDbField('FLGATIVOFIXO',ftFloat,false,false,false,false,'');
  FFlgadmprev := CreateCmDbField('FLGADMPREV',ftFloat,false,false,false,false,'');
end;

end.
