{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 27/02/2002                                 }
{                                                       }
{*******************************************************}

unit uDbLinhaXPess;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB;

type
  TDbLinhaXPess = class(TCmDbObject)
  private
    FIdPessoa: TCmDbField;
    FIdLinhaTransp: TCmDbField;
    FQtdDiaria: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property IdLinhaTransp: TCmDbField read FIdLinhaTransp write FIdLinhaTransp;
    property QtdDiaria: TCmDbField read FQtdDiaria write FQtdDiaria;
  end;

implementation

{ TDbLinhaXPess }

constructor TDbLinhaXPess.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;
  _UpdateKeyFields := true;

  TableName := 'LinhaXPess';

  FIdPessoa := CreateCmDbField('IdPessoa',ftFloat,true,true,false,true,'');
  FIdLinhaTransp := CreateCmDbField('IdLinhaTransp',ftFloat,true,true,false,true,'');
  FQtdDiaria := CreateCmDbField('QtdDiaria',ftFloat,false,false,false,false,'');
end;

end.
