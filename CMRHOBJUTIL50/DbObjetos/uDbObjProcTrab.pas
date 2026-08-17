{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 11/11/2002                                 }
{                                                       }
{*******************************************************}

unit uDbObjProcTrab;

interface

uses uCmCustomCdbObject, uCmDbObject, DB;

type
  TDbObjProcTrab = class(TCmDbObject)
  private
    FDatainicio: TCmDbField;
    FDatafinal: TCmDbField;
    FDataaval: TCmDbField;
    FObservacao: TCmDbField;
    FPercorig: TCmDbField;
    FCodtipoobjeto: TCmDbField;
    FValorsentenca: TCmDbField;
    FNumproctrab: TCmDbField;
    FIndvalor: TCmDbField;
    FPercprob: TCmDbField;
    FValorrecl: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property NumProcTrab: TCmDbField read FNumproctrab write FNumproctrab;
    property IndValor: TCmDbField read FIndvalor write FIndvalor;
    property DataInicio: TCmDbField read FDatainicio write FDatainicio;
    property DataFinal: TCmDbField read FDatafinal write FDatafinal;
    property DataAval: TCmDbField read FDataaval write FDataaval;
    property CodTipoObjeto: TCmDbField read FCodtipoobjeto write FCodtipoobjeto;
    property ValorSentenca: TCmDbField read FValorsentenca write FValorsentenca;
    property ValorRecl: TCmDbField read FValorrecl write FValorrecl;
    property PercProb: TCmDbField read FPercprob write FPercprob;
    property PercOrig: TCmDbField read FPercorig write FPercorig;
    property Observacao: TCmDbField read FObservacao write FObservacao;
  end;

implementation

{ TDbObjProcTrab }

constructor TDbObjProcTrab.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'OBJPROCTRAB';

  FNumProcTrab := CreateCmDbField('NUMPROCTRAB',ftFloat,true,true,false,true,'');
  FIndValor := CreateCmDbField('INDVALOR',ftFloat,false,false,false,false,'');
  FDataInicio := CreateCmDbField('DATAINICIO',ftDateTime,false,false,false,true,'');
  FDataFinal := CreateCmDbField('DATAFINAL',ftDateTime,false,false,false,true,'');
  FDataAval := CreateCmDbField('DATAAVAL',ftDateTime,false,false,false,true,'');
  FCodTipoObjeto := CreateCmDbField('CODTIPOOBJETO',ftFloat,true,true,false,true,'');
  FValorSentenca := CreateCmDbField('VALORSENTENCA',ftFloat,false,false,false,false,'');
  FValorRecl := CreateCmDbField('VALORRECL',ftFloat,true,false,false,false,'');
  FPercProb := CreateCmDbField('PERCPROB',ftFloat,true,false,false,false,'');
  FPercOrig := CreateCmDbField('PERCORIG',ftFloat,false,false,false,false,'');
  FObservacao := CreateCmDbField('OBSERVACAO',ftString,false,false,false,false,'');
end;

end.
