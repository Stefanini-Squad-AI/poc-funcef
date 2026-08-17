{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 04/12/2001                                 }
{                                                       }
{*******************************************************}

unit uDbMotivo;


//**************************************************************************************
//Rotina...........: property, create
//Nº SOL...........: 229353/16212
//Nº KINTANA/PPM...: 434575
//Data da Alteração: 21/09/2014
//Responsável......: Edilaine Ferraresi
//Descrição........: Inclusão campos para esocial
//***************************************************************************************
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

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbMotivo = class(TCmDbObject)
  private
    FIdMotivo: TCmDbField;
    FDescricao: TCmDbField;
    FGrupoMotivo: TCmDbField;
    FIdMovContrCAGED: TCmDbField;
    FFlgTipo: TCmDbField;
    FMotivoFGTS: TCmDbField;
    FMotivoRAIS: TCmDbField;
    FObservacao: TCmDbField;
    FFlgAbateAvos: TCmDbField;
    FIDMODULO: TCmDbField;///DOUGLAS.SIQUEIRA SOL 108804
    FCODIGOESOCIAL : TCmDbField;
    FTABELAESOCIAL : TCmDbField;
  public
    {$IFNDEF VERSAO0505}
    constructor Create(AOwner: TCmCustomCdbObject); override;
    {$ELSE}
    constructor Create; override;
    {$ENDIF}

    property IdMotivo: TCmDbField read FIdMotivo write FIdMotivo;
    property Descricao: TCmDbField read FDescricao write FDescricao;
    property GrupoMotivo: TCmDbField read FGrupoMotivo write FGrupoMotivo;
    property IdMovContrCAGED: TCmDbField read FIdMovContrCAGED write FIdMovContrCAGED;
    property FlgTipo: TCmDbField read FFlgTipo write FFlgTipo;
    property MotivoRAIS: TCmDbField read FMotivoRAIS write FMotivoRAIS;
    property MotivoFGTS: TCmDbField read FMotivoFGTS write FMotivoFGTS;
    property Observacao: TCmDbField read FObservacao write FObservacao;
    property FlgAbateAvos: TCmDbField read FFlgAbateAvos write FFlgAbateAvos;
    property IDMODULO: TCmDbField read FIDMODULO write FIDMODULO;///DOUGLAS.SIQUEIRA SOL 108804
    property CODIGOESOCIAL : TCmDbField read FCODIGOESOCIAL write FCODIGOESOCIAL;   // edilaine SOL 229353/16212 / PPM 434575
    property TABELAESOCIAL : TCmDbField read FTABELAESOCIAL write FTABELAESOCIAL;   // edilaine SOL 229353/16212 / PPM 434575
  end;

implementation

{ TDbMotivo }

{$IFNDEF VERSAO0505}
constructor TDbMotivo.Create(AOwner: TCmCustomCdbObject);
{$ELSE}
constructor TDbMotivo.Create;
{$ENDIF}
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'MOTIVO';

  FIdMotivo := CreateCmDbField('IDMOTIVO',ftFloat,true,true,false,true,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,true,false,false,false,'');
  FGrupoMotivo := CreateCmDbField('GRUPOMOTIVO',ftString,false,false,false,true,'');
  FIdMovContrCAGED := CreateCmDbField('IDMOVCONTRCAGED',ftFloat,false,false,false,true,'');
  FFlgTipo := CreateCmDbField('FLGTIPO',ftString,false,false,false,true,'');
  FMotivoRAIS := CreateCmDbField('MOTIVORAIS',ftString,false,false,false,true,'');
  FMotivoFGTS := CreateCmDbField('MOTIVOFGTS',ftString,false,false,false,true,'');
  FObservacao := CreateCmDbField('OBSERVACAO',ftString,false,false,false,true,'');
  FFlgAbateAvos := CreateCmDbField('FLGABATEAVOS',ftFloat,false,false,false,false,'');
  FIDMODULO := CreateCmDbField('IDMODULO',ftFloat,false,false,false,false,'');///DOUGLAS.SIQUEIRA SOL 108804
  FCODIGOESOCIAL := CreateCmDbField('CODIGOESOCIAL',ftString,false,false,false,false,'');   // edilaine SOL 229353/16212 / PPM 434575
  FTABELAESOCIAL := CreateCmDbField('TABELAESOCIAL',ftString,false,false,false,false,'');   // edilaine SOL 229353/16212 / PPM 434575
end;

end.
