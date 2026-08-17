{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 06/03/2003                                 }
{                                                       }
{*******************************************************}

unit uDbTabGener;


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

uses uCmCustomCdbObject, uCmDbObject, DB;

type
  TDbTabGener = class(TCmDbObject)
  private
    FCodTabela: TCmDbField;
    FDescricao: TCmDbField;
    FIDMODULO: TCmDbField;//douglas.siqueira SOL108804
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property CodTabela: TCmDbField read FCodTabela write FCodTabela;
    property Descricao: TCmDbField read FDescricao write FDescricao;
    property IDMODULO: TCmDbField read FIDMODULO write FIDMODULO;//douglas.siqueira SOL108804
  end;

implementation

{ TDbTabGener }

constructor TDbTabGener.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'TABGENER';

  FCodTabela := CreateCmDbField('CODTABELA',ftString,true,true,false,true,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,false,false,false,true,'');
  FIDMODULO:=   CreateCmDbField('IDMODULO',ftString,false,false,false,true,'');//douglas.siqueira SOL108804
end;

end.
