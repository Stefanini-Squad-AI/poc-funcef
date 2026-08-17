{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 26/02/2002                                 }
{                                                       }
{*******************************************************}

unit uDbAjustPesq;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbAjustPesq = class(TCmDbObject)
  private
    FIdPesqSalar: TCmDbField;
    FIdEmpresaPartic: TCmDbField;
    FFator: TCmDbField;    
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdPesqSalar: TCmDbField read FIdPesqSalar write FIdPesqSalar;
    property IdEmpresaPartic: TCmDbField read FIdEmpresaPartic write FIdEmpresaPartic;
    property Fator: TCmDbField read FFator write FFator;
  end;

implementation

{ TDbAjustPesq }

constructor TDbAjustPesq.Create(AOwner: TCmCustomCdbObject); 
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'AjustPesq';

  FIdPesqSalar := CreateCmDbField('IdPesqSalar',ftFloat,true,true,false,true,'');
  FIdEmpresaPartic := CreateCmDbField('IdEmpresaPartic',ftFloat,true,true,false,true,'');
  FFator := CreateCmDbField('Fator',ftFloat,true,false,false,false,'');
end;

end.
