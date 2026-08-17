{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 19/11/2002                                 }
{                                                       }
{*******************************************************}

unit uDbParcelasProcTrab;

interface

uses uCmCustomCdbObject, uCmDbObject, DB;

type
  TDbParcelasProcTrab = class(TCmDbObject)
  private
    FNumProcTrab: TCmDbField;
    FNumParcela: TCmDbField;
    FValorParcela: TCmDbField;
    FDataParcela: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property NumProcTrab: TCmDbField read FNumProcTrab write FNumProcTrab;
    property NumParcela: TCmDbField read FNumParcela write FNumParcela;
    property DataParcela: TCmDbField read FDataParcela write FDataParcela;
    property ValorParcela: TCmDbField read FValorParcela write FValorParcela;
  end;

implementation

{ TDbParcelasProcTrab }

constructor TDbParcelasProcTrab.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'PARCELASPROCTRAB';

  FNumProcTrab := CreateCmDbField('NUMPROCTRAB',ftFloat,true,true,false,true,'');
  FNumParcela := CreateCmDbField('NUMPARCELA',ftFloat,true,true,false,true,'');
  FDataParcela := CreateCmDbField('DATAPARCELA',ftDateTime,false,false,false,true,'');
  FValorParcela := CreateCmDbField('VALORPARCELA',ftFloat,false,false,false,true,'');
end;

end.
