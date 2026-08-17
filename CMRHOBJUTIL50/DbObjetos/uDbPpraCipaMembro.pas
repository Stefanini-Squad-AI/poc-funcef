{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 20/03/2003                             }
{                                                       }
{*******************************************************}

unit uDbPpraCipaMembro;

interface

uses uCmCustomCdbObject, uCmDbObject, DB;

type
  TDbPpraCipaMembro = class(TCmDbObject)
  private
    FIdPessoa: TCmDbField;
    FIdPpraCipa: TCmDbField;
    FDataFim: TCmDbField;
    FDataIni: TCmDbField;
    FIdCipaFuncao: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdPpraCipa: TCmDbField read FIdPpraCipa write FIdPpraCipa;
    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property IdCipaFuncao: TCmDbField read FIdCipaFuncao write FIdCipaFuncao;
    property DataIni: TCmDbField read FDataIni write FDataIni;
    property DataFim: TCmDbField read FDataFim write FDataFim;
  end;

implementation

{ TDbPpraCipaMembro }

constructor TDbPpraCipaMembro.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'PPRACIPAMEMBRO';

  FIdPpraCipa := CreateCmDbField('IDPPRACIPA',ftfloat,true,true,false,true,'');
  FIdPessoa := CreateCmDbField('IDPESSOA',ftfloat,true,true,false,true,'');
  FIdCipaFuncao := CreateCmDbField('IDCIPAFUNCAO',ftfloat,false,false,false,true,'');
  FDataIni := CreateCmDbField('DATAINI',ftDateTime,true,true,false,true,'');
  FDataFim := CreateCmDbField('DATAFIM',ftDateTime,false,false,false,true,'');
end;

end.
