{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 29/10/2002                             }
{                                                       }
{*******************************************************}

unit uDbInstrutorInterno;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

type
  TDbInstrutorInterno = class(TCmDbObject)
  private
    FIdPessoa: TCmDbField;
    FIdCurso: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property IdCurso: TCmDbField read FIdCurso write FIdCurso;
  end;

implementation

{ TDbInstrutorInterno }

constructor TDbInstrutorInterno.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'INSTRUTORINTERNO';

  FIdPessoa := CreateCmDbField('IDPESSOA',ftFloat,true,true,false,true,'');
  FIdCurso := CreateCmDbField('IDCURSO',ftFloat,true,true,false,true,'');
end;

end.
