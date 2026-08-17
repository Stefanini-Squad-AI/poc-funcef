{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 08/07/2002                                 }
{                                                       }
{*******************************************************}

unit uDbCmpBD;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB;

type
  TDbCmpBD = class(TCmDbObject)
  private
    FIdCampo: TCmDbField;
    FFlgObrigatorio: TCmDbField;
    FChave: TCmDbField;
    FEntidade: TCmDbField;
    FCampoDoBanco: TCmDbField;
    FApelido: TCmDbField;
    FIdTipoDado: TCmDbField;
    FDescricaoDoCampo: TCmDbField;
    FNomeDoCampo: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdCampo: TCmDbField read FIdCampo write FIdCampo;    
    property NomeDoCampo: TCmDbField read FNomeDoCampo write FNomeDoCampo;
    property IdTipoDado: TCmDbField read FIdTipoDado write FIdTipoDado;
    property FlgObrigatorio: TCmDbField read FFlgObrigatorio write FFlgObrigatorio;
    property Entidade: TCmDbField read FEntidade write FEntidade;
    property DescricaoDoCampo: TCmDbField read FDescricaoDoCampo write FDescricaoDoCampo;
    property Chave: TCmDbField read FChave write FChave;
    property CampoDoBanco: TCmDbField read FCampoDoBanco write FCampoDoBanco;
    property Apelido: TCmDbField read FApelido write FApelido;
  end;

implementation

{ TDbCmpBD }

constructor TDbCmpBD.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'CMPBD';

  FIdCampo := CreateCmDbField('IDCAMPO',ftString,true,true,false,false,'');
  FNomeDoCampo := CreateCmDbField('NOMEDOCAMPO',ftString,false,false,false,false,'');
  FIdTipoDado := CreateCmDbField('IDTIPODADO',ftFloat,false,false,false,false,'');
  FFlgObrigatorio := CreateCmDbField('FLGOBRIGATORIO',ftFloat,false,false,false,false,'');
  FEntidade := CreateCmDbField('ENTIDADE',ftString,false,false,false,false,'');
  FDescricaoDoCampo := CreateCmDbField('DESCRICAODOCAMPO',ftString,false,false,false,false,'');
  FChave := CreateCmDbField('CHAVE',ftFloat,false,false,false,false,'');
  FCampoDoBanco := CreateCmDbField('CAMPODOBANCO',ftFloat,false,false,false,false,'');
  FApelido := CreateCmDbField('APELIDO',ftString,false,false,false,false,'');
end;

end.
