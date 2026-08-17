{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 11/03/2002                                 }
{                                                       }
{*******************************************************}

unit uDbTerceiro;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB;

type
  TDbTerceiro = class(TCmDbObject)
  private
    FIdPessoa: TCmDbField;
    FTipoTerceiro: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property TipoTerceiro: TCmDbField read FTipoTerceiro write FTipoTerceiro;
  end;

implementation

{ TDbTerceiro }

constructor TDbTerceiro.Create(AOwner: TCmCustomCdbObject); 
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'TERCEIRO';

  FIdPessoa := CreateCmDbField('IDPESSOA',ftFloat,true,true,false,true,'');
  FTipoTerceiro := CreateCmDbField('TIPOTERCEIRO',ftFloat,false,false,false,true,'');
end;

end.
