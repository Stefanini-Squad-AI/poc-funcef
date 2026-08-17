{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 15/10/2002                                 }
{                                                       }
{*******************************************************}

unit uDbHstExper;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB;

type
  TDbHstExper = class(TCmDbObject)
  private
    FDat_Ini: TCmDbField;
    FIdPessoa: TCmDbField;
    FDat_Fim: TCmDbField;
    FIdExper: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property IdExper: TCmDbField read FIdExper write FIdExper;
    property Dat_Ini: TCmDbField read FDat_Ini write FDat_Ini;
    property Dat_Fim: TCmDbField read FDat_Fim write FDat_Fim;
  end;

implementation

{ TDbHstExper }

constructor TDbHstExper.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'HSTEXPER';

  FIdPessoa := CreateCmDbField('IDPESSOA',ftFloat,true,true,false,true,'');
  FIdExper := CreateCmDbField('IDEXPER',ftFloat,true,true,false,true,'');
  FDat_Ini := CreateCmDbField('DAT_INI',ftDateTime,true,true,false,true,'');
  FDat_Fim := CreateCmDbField('DAT_FIM',ftDateTime,false,false,false,true,'');
end;

end.
