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

uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

type
  TDbHonorarios = class(TCmDbObject)
  private
    FIdFornServ: TCmDbField;
    FNumProcTrab: TCmDbField;
    FDataPagtoHonor: TCmDbField;
    FValorHonor: TCmDbField;
    FIndHonor: TCmDbField;
    FFlgProvisao: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property NumProcTrab: TCmDbField read FNumProcTrab write FNumProcTrab;
    property IdFornServ: TCmDbField read FIdFornServ write FIdFornServ;
    property DataPagtoHonor: TCmDbField read FDataPagtoHonor write FDataPagtoHonor;
    property ValorHonor: TCmDbField read FValorHonor write FValorHonor;
    property IndHonor: TCmDbField read FIndHonor write FIndHonor;
    property FlgProvisao: TCmDbField read FFlgProvisao write FFlgProvisao;
  end;

implementation

{ TDbHonorarios }

constructor TDbHonorarios.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;
  _UpdateKeyFields := true;

  TableName := 'HONORARIOS';

  FNumProcTrab := CreateCmDbField('NUMPROCTRAB',ftFloat,true,true,false,true,'');
  FIdFornServ := CreateCmDbField('IDFORNSERV',ftFloat,true,true,false,true,'');
  FDataPagtoHonor := CreateCmDbField('DATAPAGTOHONOR',ftDateTime,true,true,false,true,'');
  FValorHonor := CreateCmDbField('VALORHONOR',ftFloat,false,false,false,false,'');
  FIndHonor := CreateCmDbField('INDHONOR',ftFloat,false,false,false,false,'');
  FFlgProvisao := CreateCmDbField('FLGPROVISAO',ftFloat,false,false,false,false,'');
end;

end.
