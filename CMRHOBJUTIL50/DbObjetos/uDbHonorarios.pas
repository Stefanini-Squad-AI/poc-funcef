{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 12/11/2002                                 }
{                                                       }
{*******************************************************}

unit uDbHonorarios;

interface

uses uCmCustomCdbObject, uCmDbObject, DB;

type
  TDbHonorarios = class(TCmDbObject)
  private
    FIdFornServ: TCmDbField;
    FNumProcTrab: TCmDbField;
    FDataPagtoHonor: TCmDbField;
    FValorHonor: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property NumProcTrab: TCmDbField read FNumProcTrab write FNumProcTrab;
    property IdFornServ: TCmDbField read FIdFornServ write FIdFornServ;
    property DataPagtoHonor: TCmDbField read FDataPagtoHonor write FDataPagtoHonor;
    property ValorHonor: TCmDbField read FValorHonor write FValorHonor;
  end;

implementation

{ TDbHonorarios }

constructor TDbHonorarios.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'HONORARIOS';

  FNumProcTrab := CreateCmDbField('NUMPROCTRAB',ftFloat,true,true,false,true,'');
  FIdFornServ := CreateCmDbField('IDFORNSERV',ftFloat,true,true,false,true,'');
  FDataPagtoHonor := CreateCmDbField('DATAPAGTOHONOR',ftDateTime,true,true,false,true,'');
  FValorHonor := CreateCmDbField('VALORHONOR',ftFloat,true,false,false,true,'');
end;

end.
