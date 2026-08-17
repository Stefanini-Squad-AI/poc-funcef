{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 05/06/2002                                 }
{                                                       }
{*******************************************************}

unit uDbHstAltCad;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB;

type
  TDbHstAltCad = class(TCmDbObject)
  private
    FIdPessoa: TCmDbField;
    FDataAlt: TCmDbField;
    FCodAlteracao: TCmDbField;
    FAlteracao: TCmDbField;
  public
    {$IFNDEF VERSAO0505}
    constructor Create(AOwner: TCmCustomCdbObject); override;
    {$ELSE}
    constructor Create; override;
    {$ENDIF}

    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property DataAlt: TCmDbField read FDataAlt write FDataAlt;
    property CodAlteracao: TCmDbField read FCodAlteracao write FCodAlteracao;
    property Alteracao: TCmDbField read FAlteracao write FAlteracao;
  end;

implementation

{ TDbHstAltCad }

{$IFNDEF VERSAO0505}
constructor TDbHstAltCad.Create(AOwner: TCmCustomCdbObject);
{$ELSE}
constructor TDbHstAltCad.Create;
{$ENDIF}
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'HSTALTCAD';

  FIdPessoa := CreateCmDbField('IDPESSOA',ftFloat,true,true,false,false,'');
  FDataAlt := CreateCmDbField('DATAALT',ftDateTime,true,true,false,true,'');
  FCodAlteracao := CreateCmDbField('CODALTERACAO',ftString,true,true,false,false,'');
  FAlteracao := CreateCmDbField('ALTERACAO',ftString,false,false,false,false,'');
end;

end.
