{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 09/10/2002                                 }
{                                                       }
{*******************************************************}

unit uDbHstDesemp;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

type
  TDbHstDesemp = class(TCmDbObject)
  private
    FIdFatorAval: TCmDbField;
    FGrau: TCmDbField;
    FCodTipoAval: TCmDbField;
    FIdPessoa: TCmDbField;
    FNumSeq: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property IdFatorAval: TCmDbField read FIdFatorAval write FIdFatorAval;
    property NumSeq: TCmDbField read FNumSeq write FNumSeq;
    property CodTipoAval: TCmDbField read FCodTipoAval write FCodTipoAval;
    property Grau: TCmDbField read FGrau write FGrau;
  end;

implementation

{ TDbHstDesemp }

constructor TDbHstDesemp.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'HSTDESEMP';

  FNumSeq := CreateCmDbField('NUMSEQ',ftFloat,true,true,false,false,'');
  FIdPessoa := CreateCmDbField('IDPESSOA',ftFloat,true,true,false,false,'');
  FIdFatorAval := CreateCmDbField('IDFATORAVAL',ftFloat,true,true,false,false,'');
  FCodTipoAval := CreateCmDbField('CODTIPOAVAL',ftFloat,true,true,false,false,'');
  FGrau := CreateCmDbField('GRAU',ftFloat,false,false,false,true,'');
end;

end.
