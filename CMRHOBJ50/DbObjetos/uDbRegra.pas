{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 17/07/2002                             }
{                                                       }
{*******************************************************}

unit uDbRegra;


// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//------------------------------------------------------------------------------
//Autor(a)   : Douglas Siqueira
//Data       : 21/12/2012
//Pendência  : SOL 108804 KTN 494141	
//Descricao  : Retirar visualização na Folha de Pagamento de dados de outros módulos, 
//tais como: layout de arquivos TXT, tabelas genéricas, rubricas, formas de cálculo etc.
// Menus: * Cadastro / Tabelas Auxiliares / Tabela REGRA/Forma de Cálculo - Forma de Cálculo
// e Tabela Genérica * Sistema / Utilitários / Layout de Arquivos TXT * Cadastros / Rubricas
// por Empresa * Cadastros / Rubricas Salariais * Cadastros / Motivos e Ações Impedir o mesmo
//acesso aos dados da folha por outros módulos.


interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

type
  TDbRegra = class(TCmDbObject)
  private
    FDescricaoregra: TCmDbField;
    FIdtiporegra: TCmDbField;
    FIdregra: TCmDbField;
    FPublicada: TCmDbField;
    FNomeregra: TCmDbField;
    FIDMODULO: TCmDbField;//douglas.siqueira SOL108804
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert: boolean; override;

    property Publicada: TCmDbField read FPublicada write FPublicada;
    property NomeRegra: TCmDbField read FNomeregra write FNomeregra;
    property IdTipoRegra: TCmDbField read FIdtiporegra write FIdtiporegra;
    property IdRegra: TCmDbField read FIdregra write FIdregra;
    property DescricaoRegra: TCmDbField read FDescricaoregra write FDescricaoregra;
    property IDMODULO: TCmDbField read FIdMODULO write FIdMODULO;//douglas.siqueira SOL108804
  end;

implementation

{ TDbRegra }

constructor TDbRegra.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'REGRA';

  FPublicada := CreateCmDbField('PUBLICADA',ftFloat,false,false,false,true,'');
  FNomeregra := CreateCmDbField('NOMEREGRA',ftString,false,false,false,true,'');
  FIdtiporegra := CreateCmDbField('IDTIPOREGRA',ftFloat,true,false,false,true,'');
  FIdregra := CreateCmDbField('IDREGRA',ftFloat,true,true,false,true,'');
  FDescricaoregra := CreateCmDbField('DESCRICAOREGRA',ftBlob,false,false,false,true,'');
  FIdMODULO := CreateCmDbField('IDMODULO',ftFloat,true,true,false,true,'');//douglas.siqueira SOL108804
end;

function TDbRegra.Insert: boolean;
begin
  FIdregra.asFloat := GetSequence('REGRA');
  Result := inherited Insert;
end;

end.
