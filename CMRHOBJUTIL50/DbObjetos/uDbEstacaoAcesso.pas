{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 20/02/2003                                 }
{ Alterado Em: 23/09/2003  (ECF)                        }
{*******************************************************}

unit uDbEstacaoAcesso;

interface

uses uCmCustomCdbObject, uCmDbObject, DB;

type
  TDbEstacaoAcesso = class(TCmDbObject)
  private
    FEstacao: TCmDbField;
    FDescricao: TCmDbField;
    FIdEstacaoAcesso: TCmDbField;
    FIndFuncao: TCmDbField;
    FIdPessoa: TCmDbField;
    FIdLocalizacao: TCmDbField;
    FIndIdentificacao: TCmDbField;
    FIndLiberacao: TCmDbField;
    FMarcaCatraca: TCmDbField;
    FModeloCatraca: TCmDbField;
    FPortaCatraca: TCmDbField;
    FIndEntraSai: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert: boolean; override;

    property IdEstacaoAcesso: TCmDbField read FIdEstacaoAcesso write FIdEstacaoAcesso;
    property Estacao: TCmDbField read FEstacao write FEstacao;
    property Descricao: TCmDbField read FDescricao write FDescricao;
    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property IdLocalizacao: TCmDbField read FIdLocalizacao write FIdLocalizacao;
    property IndFuncao: TCmDbField read FIndFuncao write FIndFuncao;
    property IndIdentificacao: TCmDbField read FIndIdentificacao write FIndIdentificacao;
    property IndLiberacao: TCmDbField read FIndLiberacao write FIndLiberacao;
    property MarcaCatraca: TCmDbField read FMarcaCatraca write FMarcaCatraca;
    property ModeloCatraca: TCmDbField read FModeloCatraca write FModeloCatraca;
    property PortaCatraca: TCmDbField read FPortaCatraca write FPortaCatraca;
    property IndEntraSai: TCmDbField read FIndEntraSai write FIndEntraSai;
  end;

implementation

{ TDbEstacaoAcesso }

constructor TDbEstacaoAcesso.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'ESTACAOACESSO';

  FIdEstacaoAcesso := CreateCmDbField('IDESTACAOACESSO',ftFloat,true,true,false,true,'');
  FEstacao := CreateCmDbField('ESTACAO',ftString,false,false,false,true,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,false,false,false,true,'');
  FIdPessoa := CreateCmDbField('IDPESSOA',ftFloat,false,false,false,true,'');
  FIdLocalizacao := CreateCmDbField('IDLOCALIZACAO',ftFloat,false,false,false,true,'');
  FIndFuncao := CreateCmDbField('INDFUNCAO',ftString,false,false,false,true,'');
  FIndIdentificacao := CreateCmDbField('INDIDENTIFICACAO',ftFloat,false,false,false,false,'');
  FIndLiberacao := CreateCmDbField('INDLIBERACAO',ftFloat,false,false,false,false,'');
  FMarcaCatraca := CreateCmDbField('MARCACATRACA',ftString,false,false,false,true,'');
  FModeloCatraca := CreateCmDbField('MODELOCATRACA',ftString,false,false,false,true,'');
  FPortaCatraca := CreateCmDbField('PORTACATRACA',ftString,false,false,false,true,'');
  FIndEntraSai := CreateCmDbField('INDENTRASAI',ftFloat,false,false,false,false,'');
end;

function TDbEstacaoAcesso.Insert: boolean;
begin
  FIdEstacaoAcesso.asFloat := GetSequence('ESTACAOACESSO');
  Result := inherited Insert;
end;

end.
