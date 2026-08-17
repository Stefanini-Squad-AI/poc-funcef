{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 26/02/2002                                 }
{                                                       }
{*******************************************************}

unit uDbPesoFatGrp;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB;

type
  TDbPesoFatGrp = class(TCmDbObject)
  private
    FIdFatorAval: TCmDbField;
    FCodGrpFunc: TCmDbField;
    FPeso: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdFatorAval: TCmDbField read FIdFatorAval write FIdFatorAval;
    property CodGrpFunc: TCmDbField read FCodGrpFunc write FCodGrpFunc;
    property Peso: TCmDbField read FPeso write FPeso;
  end;

implementation

{ TDbPesoFatGrp }

constructor TDbPesoFatGrp.Create(AOwner: TCmCustomCdbObject); 
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'PESOFATGRP';

  FIdFatorAval := CreateCmDbField('IDFATORAVAL',ftFloat,true,true,false,true,'');
  FCodGrpFunc := CreateCmDbField('CODGRPFUNC',ftString,true,true,false,false,'');
  FPeso := CreateCmDbField('PESO',ftFloat,false,false,false,false,'');
end;

end.
