{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 15/02/2002                                 }
{                                                       }
{*******************************************************}
//Rotina: Create
//Nº SOL: 126964
//Nº KINTANA: 668955
//Data da Alteração: 29/01/2010
//Responsável: Marilza Colpani
//Descrição: Desvincular a flag FLGESPECIAL do módulo Folha de Pagamento,
//                 substituindo pelo flag FLGESPECIALFP, que receberá todos os
//                 valores da flag desvinculada.
//**************************************************************************************

unit uDbProvDesc;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbProvDesc = class(TCmDbObject)
  private
    FFlgINSS: TCmDbField;
    FFlgsalbenefretro: TCmDbField;
    FFlgfgts: TCmDbField;
    FTipobasedesconto: TCmDbField;
    FNumprioridade: TCmDbField;
    FDescparcial: TCmDbField;
    FIdbenefsalar: TCmDbField;
    FFlgdesconto: TCmDbField;
    FFlgsalpartretro: TCmDbField;
    FFlgconsolida: TCmDbField;
    FFlgincidecontrib: TCmDbField;
    FFlgtprubrica: TCmDbField;
    FFlgrais: TCmDbField;
    FFlgsalfamilia: TCmDbField;
    FFlgdescpensao: TCmDbField;
    FFlgconstafolha: TCmDbField;
    FFlgcompoeremtotal: TCmDbField;
    FFlginterno: TCmDbField;
    FFlgcompoesalpart: TCmDbField;
    FDescrProvDesc: TCmDbField;
    FCodIrrfDarf: TCmDbField;
    FFlgsalpartatuaria: TCmDbField;
    FFlgirrf: TCmDbField;
    FDescricao: TCmDbField;
    FFlgobrigafavorec: TCmDbField;
    FFlgatrasodevol: TCmDbField;
    FCodRubCLT: TCmDbField;
    FFlgrescisao: TCmDbField;
    FIdModulo: TCmDbField;
    FFlgcompoesalbenef: TCmDbField;
    FIdregraferias: TCmDbField;
    FIdregrarescisao: TCmDbField;
    FFlgsalref: TCmDbField;
    FFlgadiantferias: TCmDbField;
    FFlgmargemconsig: TCmDbField;
    FCodProvDesc: TCmDbField;
    FIdProvento: TCmDbField;
    FIdregra: TCmDbField;
    FFlgprorata: TCmDbField;
    FFlguso: TCmDbField;
    //FFlgespecial: TCmDbField;
    FFlgespecialFP: TCmDbField;
    FFlgferias: TCmDbField;
    FFlgincidesalpart: TCmDbField;
    FIdinforme: TCmDbField;
    FFlgdecimoterceiro: TCmDbField;
    FIdregra13: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert: boolean; override;

    property IdProvento: TCmDbField read FIdProvento write FIdProvento;
    property IdModulo: TCmDbField read FIdModulo write FIdModulo;
    property CodProvDesc: TCmDbField read FCodProvDesc write FCodProvDesc;
    property CodRubCLT: TCmDbField read FCodRubCLT write FCodRubCLT;
    property CodIrrfDarf: TCmDbField read FCodIrrfDarf write FCodIrrfDarf;
    property DescrProvDesc: TCmDbField read FDescrProvDesc write FDescrProvDesc;
    property Descricao: TCmDbField read FDescricao write FDescricao;
    property DescParcial: TCmDbField read FDescParcial write FDescParcial;
    property TipoBaseDesconto: TCmDbField read FTipoBaseDesconto write FTipoBaseDesconto;
    property NumPrioridade: TCmDbField read FNumPrioridade write FNumPrioridade;
    property IdRegra13: TCmDbField read FIdRegra13 write FIdRegra13;
    property IdRegraRescisao: TCmDbField read FIdRegraRescisao write FIdRegraRescisao;
    property IdRegraFerias: TCmDbField read FIdRegraFerias write FIdRegraFerias;
    property IdRegra: TCmDbField read FIdRegra write FIdRegra;
    property IdInforme: TCmDbField read FIdInforme write FIdInforme;
    property IdBenefSalar: TCmDbField read FIdBenefSalar write FIdBenefSalar;
    property FlgUso: TCmDbField read FFlgUso write FFlgUso;
    property FlgTpRubrica: TCmDbField read FFlgTpRubrica write FFlgTpRubrica;
    property FlgSalRef: TCmDbField read FFlgSalRef write FFlgSalRef;
    property FlgSalPartRetro: TCmDbField read FFlgSalPartRetro write FFlgSalPartRetro;
    property FlgSalPartAtuaria: TCmDbField read FFlgSalPartAtuaria write FFlgSalPartAtuaria;
    property FlgSalFamilia: TCmDbField read FFlgSalFamilia write FFlgSalFamilia;
    property FlgSalBenefRetro: TCmDbField read FFlgSalBenefRetro write FFlgSalBenefRetro;
    property FlgRescisao: TCmDbField read FFlgRescisao write FFlgRescisao;
    property FlgRAIS: TCmDbField read FFlgRAIS write FFlgRAIS;
    property FlgProrata: TCmDbField read FFlgProrata write FFlgProrata;
    property FlgObrigaFavorec: TCmDbField read FFlgObrigaFavorec write FFlgObrigaFavorec;
    property FlgMargemConsig: TCmDbField read FFlgMargemConsig write FFlgMargemConsig;
    property FlgIRRF: TCmDbField read FFlgIRRF write FFlgIRRF;
    property FlgInterno: TCmDbField read FFlgInterno write FFlgInterno;
    property FlgINSS: TCmDbField read FFlgINSS write FFlgINSS;
    property FlgIncideSalPart: TCmDbField read FFlgIncideSalPart write FFlgIncideSalPart;
    property FlgIncideContrib: TCmDbField read FFlgIncideContrib write FFlgIncideContrib;
    property FlgFGTS: TCmDbField read FFlgFGTS write FFlgFGTS;
    property FlgFerias: TCmDbField read FFlgFerias write FFlgFerias;
    //Marilza Colpani - SOL 126964/KTN 668955
//    property FlgEspecial: TCmDbField read FFlgEspecial write FFlgEspecial;
    property FlgEspecialFP: TCmDbField read FFlgEspecialFP write FFlgEspecialFP;
    property FlgDescPensao: TCmDbField read FFlgDescPensao write FFlgDescPensao;
    property FlgDesconto: TCmDbField read FFlgDesconto write FFlgDesconto;
    property FlgDecimoTerceiro: TCmDbField read FFlgDecimoTerceiro write FFlgDecimoTerceiro;
    property FlgConstaFolha: TCmDbField read FFlgConstaFolha write FFlgConstaFolha;
    property FlgConsolida: TCmDbField read FFlgConsolida write FFlgConsolida;
    property FlgCompoeSalPart: TCmDbField read FFlgCompoeSalPart write FFlgCompoeSalPart;
    property FlgCompoeSalBenef: TCmDbField read FFlgCompoeSalBenef write FFlgCompoeSalBenef;
    property FlgCompoeRemTotal: TCmDbField read FFlgCompoeRemTotal write FFlgCompoeRemTotal;
    property FlgAtrasoDevol: TCmDbField read FFlgAtrasoDevol write FFlgAtrasoDevol;
    property FlgAdiantFerias: TCmDbField read FFlgAdiantFerias write FFlgAdiantFerias;
  end;

implementation

{ TDbProvDesc }

constructor TDbProvDesc.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'ProvDesc';

  FIdProvento := CreateCmDbField('IdProvento',ftFloat,true,true,false,true,'');
  FIdModulo := CreateCmDbField('IdModulo',ftFloat,false,false,false,true,'');  
  FCodProvDesc := CreateCmDbField('CodProvDesc',ftString,false,false,false,true,'');
  FCodRubCLT := CreateCmDbField('CodRubCLT',ftString,false,false,false,true,'');
  FCodIrrfDarf := CreateCmDbField('CodIrrfDarf',ftString,false,false,false,true,'');
  FDescrProvDesc := CreateCmDbField('DescrProvDesc',ftString,false,false,false,false,'');
  FDescricao := CreateCmDbField('Descricao',ftString,false,false,false,true,'');
  FDescParcial := CreateCmDbField('DescParcial',ftFloat,false,false,false,true,'');
  FTipoBaseDesconto := CreateCmDbField('TipoBaseDesconto',ftFloat,false,false,false,true,'');
  FNumPrioridade := CreateCmDbField('NumPrioridade',ftFloat,false,false,false,true,'');
  FIdRegra13 := CreateCmDbField('IdRegra13',ftFloat,false,false,false,true,'');
  FIdRegraRescisao := CreateCmDbField('IdRegraRescisao',ftFloat,false,false,false,true,'');
  FIdRegraFerias := CreateCmDbField('IdRegraFerias',ftFloat,false,false,false,true,'');
  FIdRegra := CreateCmDbField('IdRegra',ftFloat,false,false,false,true,'');
  FIdInforme := CreateCmDbField('IdInforme',ftFloat,false,false,false,true,'');
  FIdBenefSalar := CreateCmDbField('IdBenefSalar',ftFloat,false,false,false,true,'');
  FFlgUso := CreateCmDbField('FlgUso',ftString,false,false,false,false,'');
  FFlgTpRubrica := CreateCmDbField('FlgTpRubrica',ftString,false,false,false,false,'');
  FFlgSalRef := CreateCmDbField('FlgSalRef',ftFloat,false,false,false,false,'');
  FFlgSalPartRetro := CreateCmDbField('FlgSalPartRetro',ftFloat,false,false,false,false,'');
  FFlgSalPartAtuaria := CreateCmDbField('FlgSalPartAtuaria',ftFloat,false,false,false,false,'');
  FFlgSalFamilia := CreateCmDbField('FlgSalFamilia',ftFloat,false,false,false,false,'');
  FFlgSalBenefRetro := CreateCmDbField('FlgSalBenefRetro',ftFloat,false,false,false,false,'');
  FFlgRescisao := CreateCmDbField('FlgRescisao',ftFloat,false,false,false,false,'');
  FFlgRAIS := CreateCmDbField('FlgRAIS',ftFloat,false,false,false,false,'');
  FFlgProrata := CreateCmDbField('FlgProrata',ftFloat,false,false,false,false,'');
  FFlgObrigaFavorec := CreateCmDbField('FlgObrigaFavorec',ftFloat,false,false,false,false,'');
  FFlgMargemConsig := CreateCmDbField('FlgMargemConsig',ftFloat,false,false,false,false,'');
  FFlgIRRF := CreateCmDbField('FlgIRRF',ftFloat,false,false,false,false,'');
  FFlgInterno := CreateCmDbField('FlgInterno',ftFloat,false,false,false,false,'');
  FFlgINSS := CreateCmDbField('FlgINSS',ftFloat,false,false,false,false,'');
  FFlgIncideSalPart := CreateCmDbField('FlgIncideSalPart',ftFloat,false,false,false,false,'');
  FFlgIncideContrib := CreateCmDbField('FlgIncideContrib',ftFloat,false,false,false,false,'');
  FFlgFGTS := CreateCmDbField('FlgFGTS',ftFloat,false,false,false,false,'');
  FFlgFerias := CreateCmDbField('FlgFerias',ftFloat,false,false,false,false,'');
  //Marilza Colpani - SOL 126964/KTN 668955
  //FFlgEspecial := CreateCmDbField('FlgEspecial',ftFloat,false,false,false,false,'');
  FFlgDescPensao := CreateCmDbField('FlgDescPensao',ftFloat,false,false,false,false,'');
  FFlgDesconto := CreateCmDbField('FlgDesconto',ftFloat,false,false,false,false,'');
  FFlgDecimoTerceiro := CreateCmDbField('FlgDecimoTerceiro',ftFloat,false,false,false,false,'');
  FFlgConstaFolha := CreateCmDbField('FlgConstaFolha',ftFloat,false,false,false,false,'');
  FFlgConsolida := CreateCmDbField('FlgConsolida',ftFloat,false,false,false,false,'');
  FFlgCompoeSalPart := CreateCmDbField('FlgCompoeSalPart',ftFloat,false,false,false,false,'');
  FFlgCompoeSalBenef := CreateCmDbField('FlgCompoeSalBenef',ftFloat,false,false,false,false,'');
  FFlgCompoeRemTotal := CreateCmDbField('FlgCompoeRemTotal',ftFloat,false,false,false,false,'');
  FFlgAtrasoDevol := CreateCmDbField('FlgAtrasoDevol',ftString,false,false,false,false,'');
  FFlgAdiantFerias := CreateCmDbField('FlgAdiantFerias',ftString,false,false,false,false,'');
  //Marilza Colpani - SOL 126964/KTN 668955
  FFlgEspecialFP := CreateCmDbField('FlgEspecialFP',ftFloat,false,false,false,false,'');
end;

function TDbProvDesc.Insert: boolean;
begin
  FIdProvento.asFloat := GetSequence('PROVDESC');
  Result := inherited Insert;
end;

end.
