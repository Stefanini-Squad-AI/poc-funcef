{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Eugênio                         }
{ Criado Em: 24/12/2003                                 }
{                                                       }
{*******************************************************}

unit uDbHonorAdvog;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB;

type
  TDbHonorAdvog = class(TCmDbObject)
  private
    FIdHonorAdvog: TCmDbField;
    FLimiteQtde: TCmDbField;
    FDataVigencia: TCmDbField;
    FValor: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert: boolean; override;

    property IdHonorAdvog: TCmDbField read FIdHonorAdvog write FIdHonorAdvog;
    property LimiteQtde: TCmDbField read FLimiteQtde write FLimiteQtde;
    property DataVigencia: TCmDbField read FDataVigencia write FDataVigencia;
    property Valor: TCmDbField read FValor write FValor;
  end;

implementation

uses uCtrlFuncoesRH;

constructor TDbHonorAdvog.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'HONORADVOG';

  FIdHonorAdvog := CreateCmDbField('IDHONORADVOG',ftFloat,true,true,false,false,'');
  FLimiteQtde := CreateCmDbField('LIMITEQTDE',ftFloat,false,false,false,false,'');
  FDataVigencia := CreateCmDbField('DATAVIGENCIA',ftDate,false,false,false,false,'');
  FValor := CreateCmDbField('VALOR',ftFloat,false,false,false,false,'');
end;

function TDbHonorAdvog.Insert: boolean;
begin
  FIdHonorAdvog.asFloat := GetSequence('HONORADVOG');
  Result := inherited Insert;
end;

end.
