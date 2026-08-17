{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 31/01/2002                                 }
{                                                       }
{*******************************************************}

unit uDbParamETL;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbParamETL = class(TCmDbObject)
  private
    FId       : TCmDbField;
    FCodigo   : TCmDbField;
    FDescricao: TCmDbField;
    FValor    : TCmDbField;
    FDT_Inicio: TCmDbField;
    FDT_Fim   : TCmDbField;

  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property Codigo: TCmDbField read FCodigo write FCodigo;
    property Id: TCmDbField read FId write FId;
    property Descricao: TCmDbField read FDescricao write FDescricao;
    property Valor: TCmDbField read FValor write FValor;
    property DT_Inicio: TCmDbField read FDT_Inicio write FDT_Inicio;
    property DT_Fim: TCmDbField read FDT_Fim write FDT_Fim;

  end;

implementation

{ TDbParamETL }

constructor TDbParamETL.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'PARAMFP';

  FId := CreateCmDbField('Id',ftFloat,true,true,false,false,'');
  FCodigo := CreateCmDbField('Codigo',ftString,true,false,false,false,'');
  FDescricao := CreateCmDbField('Descricao',ftString,true,false,false,false,'');
  FValor := CreateCmDbField('Valor',ftFloat,true,false,false,false,'');
  FDT_Inicio := CreateCmDbField('DT_Inicio',ftDateTime,true,false,false,false,'');
  FDT_Fim := CreateCmDbField('DT_Fim',ftDateTime,true,false,false,false,'');
end;

end.
