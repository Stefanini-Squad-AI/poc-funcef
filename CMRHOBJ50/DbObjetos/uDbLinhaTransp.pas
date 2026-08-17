{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 18/02/2002                                 }
{                                                       }
{*******************************************************}

unit uDbLinhaTransp;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbLinhaTransp = class(TCmDbObject)
  private
    FIdLinhaTransp: TCmDbField;
    FDescricao: TCmDbField;
    FTipoLinhaTransp: TCmDbField;
    FNumLinhaTransp: TCmDbField;
    FVlrLinhaTransp: TCmDbField;
    FIdPessoa: TCmDbField;    
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdLinhaTransp: TCmDbField read FIdLinhaTransp write FIdLinhaTransp;
    property Descricao: TCmDbField read FDescricao write FDescricao;
    property TipoLinhaTransp: TCmDbField read FTipoLinhaTransp write FTipoLinhaTransp;
    property NumLinhaTransp: TCmDbField read FNumLinhaTransp write FNumLinhaTransp;
    property VlrLinhaTransp: TCmDbField read FVlrLinhaTransp write FVlrLinhaTransp;
    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
  end;

implementation

{ TDbLinhaTransp }

constructor TDbLinhaTransp.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'LINHATRANSP';

  FIdLinhaTransp := CreateCmDbField('IDLINHATRANSP',ftFloat,true,true,false,true,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,true,false,false,true,'');
  FTipoLinhaTransp := CreateCmDbField('TIPOLINHATRANSP',ftString,false,false,false,true,'');
  FNumLinhaTransp := CreateCmDbField('NUMLINHATRANSP',ftString,false,false,false,true,'');
  FVlrLinhaTransp := CreateCmDbField('VLRLINHATRANSP',ftFloat,false,false,false,true,'');
  FIdPessoa := CreateCmDbField('IDPESSOA',ftFloat,false,false,false,true,'');
end;

end.
