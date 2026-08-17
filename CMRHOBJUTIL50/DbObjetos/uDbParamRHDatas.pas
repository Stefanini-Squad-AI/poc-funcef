{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Eugenio                         }
{ Criado Em: 21/06/2005                                 }
{                                                       }
{*******************************************************}

unit uDbParamRHDatas;

interface

uses uCmDbObject, uCmCustomCdbObject, DB;

type
  TDbParamRHDatas = class(TCmDbObject)
  private
    FIdEmpresa: TCmDbField;
    FNormalIni: TCmDbField;
    FNormalFim: TCmDbField;
    FFeriasIni: TCmDbField;
    FFeriasFim: TCmDbField;
    FPgto13Ini: TCmDbField;
    FPgto13Fim: TCmDbField;
    FPlano: TCmDbField;
    FContaRateioDeb: TCmDbField;
    FContaRateioCred: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdEmpresa: TCmDbField read FIdEmpresa write FIdEmpresa;
    property NormalIni: TCmDbField read FNormalIni write FNormalIni;
    property NormalFim: TCmDbField read FNormalFim write FNormalFim;
    property FeriasIni: TCmDbField read FFeriasIni write FFeriasIni;
    property FeriasFim: TCmDbField read FFeriasFim write FFeriasFim;
    property Pgto13Ini: TCmDbField read FPgto13Ini write FPgto13Ini;
    property Pgto13Fim: TCmDbField read FPgto13Fim write FPgto13Fim;
    property Plano: TCmDbField read FPlano write FPlano;
    property ContaRateioDeb: TCmDbField read FContaRateioDeb write FContaRateioDeb;
    property ContaRateioCred: TCmDbField read FContaRateioCred write FContaRateioCred;
  end;

implementation

{ TDbParamRHDatas }

constructor TDbParamRHDatas.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'PARAMRHDATAS';

  FIdEmpresa := CreateCmDbField('IDEMPRESA',ftFloat,true,true,false,false,'');
  FNormalIni := CreateCmDbField('NORMALINI',ftDateTime,false,false,false,true,'');
  FNormalFim := CreateCmDbField('NORMALFIM',ftDateTime,false,false,false,true,'');
  FFeriasIni := CreateCmDbField('FERIASINI',ftDateTime,false,false,false,true,'');
  FFeriasFim := CreateCmDbField('FERIASFIM',ftDateTime,false,false,false,true,'');
  FPgto13Ini := CreateCmDbField('PGTO13INI',ftDateTime,false,false,false,true,'');
  FPgto13Fim := CreateCmDbField('PGTO13FIM',ftDateTime,false,false,false,true,'');
  FPlano     := CreateCmDbField('PLANO',ftFloat,false,false,false,true,'');
  FContaRateioDeb := CreateCmDbField('CONTARATEIODEB',ftString,false,false,false,true,'');
  FContaRateioCred := CreateCmDbField('CONTARATEIOCRED',ftString,false,false,false,true,'');
end;

end.
