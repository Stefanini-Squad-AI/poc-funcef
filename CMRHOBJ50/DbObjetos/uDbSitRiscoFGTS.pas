{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 04/02/2002                                 }
{                                                       }
{*******************************************************}
{*******************************************************************************
Nº SOL: 250384.17324
Nº PPM 1070235
Data da Alteração: 12/02/2016            
Alteração Form: Leiaute e campos novos
Responsável: Michelle Suellyn Mota
Descrição: Mudança no leiaute e campos novos para adequar ao eSocial
*******************************************************************************}
unit uDbSitRiscoFGTS;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbSitRiscoFGTS = class(TCmDbObject)
  private
    FIdSitRisco: TCmDbField;
    FDescricao: TCmDbField;
    FFlgMultVinculos: TCmDbField; //Michelle Mota - SOL: 250384.17324 - PPM: 1070235
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdSitRisco: TCmDbField read FIdSitRisco write FIdSitRisco;
    property Descricao: TCmDbField read FDescricao write FDescricao;
    property FlgMultVinculos: TCmDbField read FFlgMultVinculos write FFlgMultVinculos; //Michelle Mota - SOL: 250384.17324 - PPM: 1070235
  end;

implementation

{ TDbSitRiscoFGTS }

constructor TDbSitRiscoFGTS.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'SITRISCOFGTS';

  FIdSitRisco := CreateCmDbField('IDSITRISCO',ftFloat,true,true,false,false,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,true,false,false,false,'');
  FFlgMultVinculos := CreateCmDbField('FLGMULTVINCULOS',ftFloat,true,false,false,false,''); //Michelle Mota - SOL: 250384.17324 - PPM: 1070235
end;

end.
