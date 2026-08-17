{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 15/02/2002                                 }
{                                                       }
{*******************************************************}

unit uDbProvDesc;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB;

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
    FFlgespecial: TCmDbField;
    FFlgferias: TCmDbField;
    FFlgincidesalpart: TCmDbField;
    FIdinforme: TCmDbField;
    FFlgdecimoterceiro: TCmDbField;
    FIdregra13: TCmDbField;
    FCodFontePagadora: TCmDbField;
    FFlgRateioDeb: TCmDbField;
    FFlgRateioCred: TCmDbField;
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
    property FlgEspecial: TCmDbField read FFlgEspecial write FFlgEspecial;
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
    property CodFontePagadora: TCmDbField read FCodFontePagadora write FCodFontePagadora;
    property FlgRateioDeb: TCmDbField read FFlgRateioDeb write FFlgRateioDeb;
    property FlgRateioCred: TCmDbField read FFlgRateioCred write FFlgRateioCred;
  end;

implementation

{ TDbProvDesc }

constructor TDbProvDesc.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'PROVDESC';

  FIdProvento := CreateCmDbField('IDPROVENTO',ftFloat,true,true,false,true,'');
  FIdModulo := CreateCmDbField('IDMODULO',ftFloat,false,false,false,true,'');
  FCodProvDesc := CreateCmDbField('CODPROVDESC',ftString,false,false,false,true,'');
  FCodRubCLT := CreateCmDbField('CODRUBCLT',ftString,false,false,false,true,'');
  FCodIrrfDarf := CreateCmDbField('CODIRRFDARF',ftString,false,false,false,true,'');
  FDescrProvDesc := CreateCmDbField('DESCRPROVDESC',ftString,false,false,false,false,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,false,false,false,true,'');
  FDescParcial := CreateCmDbField('DESCPARCIAL',ftFloat,false,false,false,true,'');
  FTipoBaseDesconto := CreateCmDbField('TIPOBASEDESCONTO',ftFloat,false,false,false,true,'');
  FNumPrioridade := CreateCmDbField('NUMPRIORIDADE',ftFloat,false,false,false,true,'');
  FIdRegra13 := CreateCmDbField('IDREGRA13',ftFloat,false,false,false,true,'');
  FIdRegraRescisao := CreateCmDbField('IDREGRARESCISAO',ftFloat,false,false,false,true,'');
  FIdRegraFerias := CreateCmDbField('IDREGRAFERIAS',ftFloat,false,false,false,true,'');
  FIdRegra := CreateCmDbField('IDREGRA',ftFloat,false,false,false,true,'');
  FIdInforme := CreateCmDbField('IDINFORME',ftFloat,false,false,false,true,'');
  FIdBenefSalar := CreateCmDbField('IDBENEFSALAR',ftFloat,false,false,false,true,'');
  FFlgUso := CreateCmDbField('FLGUSO',ftString,false,false,false,false,'');
  FFlgTpRubrica := CreateCmDbField('FLGTPRUBRICA',ftString,false,false,false,false,'');
  FFlgSalRef := CreateCmDbField('FLGSALREF',ftFloat,false,false,false,false,'');
  FFlgSalPartRetro := CreateCmDbField('FLGSALPARTRETRO',ftFloat,false,false,false,false,'');
  FFlgSalPartAtuaria := CreateCmDbField('FLGSALPARTATUARIA',ftFloat,false,false,false,false,'');
  FFlgSalFamilia := CreateCmDbField('FLGSALFAMILIA',ftFloat,false,false,false,false,'');
  FFlgSalBenefRetro := CreateCmDbField('FLGSALBENEFRETRO',ftFloat,false,false,false,false,'');
  FFlgRescisao := CreateCmDbField('FLGRESCISAO',ftFloat,false,false,false,false,'');
  FFlgRAIS := CreateCmDbField('FLGRAIS',ftFloat,false,false,false,false,'');
  FFlgProrata := CreateCmDbField('FLGPRORATA',ftFloat,false,false,false,false,'');
  FFlgObrigaFavorec := CreateCmDbField('FLGOBRIGAFAVOREC',ftFloat,false,false,false,false,'');
  FFlgMargemConsig := CreateCmDbField('FLGMARGEMCONSIG',ftFloat,false,false,false,false,'');
  FFlgIRRF := CreateCmDbField('FLGIRRF',ftFloat,false,false,false,false,'');
  FFlgInterno := CreateCmDbField('FLGINTERNO',ftFloat,false,false,false,false,'');
  FFlgINSS := CreateCmDbField('FLGINSS',ftFloat,false,false,false,false,'');
  FFlgIncideSalPart := CreateCmDbField('FLGINCIDESALPART',ftFloat,false,false,false,false,'');
  FFlgIncideContrib := CreateCmDbField('FLGINCIDECONTRIB',ftFloat,false,false,false,false,'');
  FFlgFGTS := CreateCmDbField('FLGFGTS',ftFloat,false,false,false,false,'');
  FFlgFerias := CreateCmDbField('FLGFERIAS',ftFloat,false,false,false,false,'');
  FFlgEspecial := CreateCmDbField('FLGESPECIAL',ftFloat,false,false,false,false,'');
  FFlgDescPensao := CreateCmDbField('FLGDESCPENSAO',ftFloat,false,false,false,false,'');
  FFlgDesconto := CreateCmDbField('FLGDESCONTO',ftFloat,false,false,false,false,'');
  FFlgDecimoTerceiro := CreateCmDbField('FLGDECIMOTERCEIRO',ftFloat,false,false,false,false,'');
  FFlgConstaFolha := CreateCmDbField('FLGCONSTAFOLHA',ftFloat,false,false,false,false,'');
  FFlgConsolida := CreateCmDbField('FLGCONSOLIDA',ftFloat,false,false,false,false,'');
  FFlgCompoeSalPart := CreateCmDbField('FLGCOMPOESALPART',ftFloat,false,false,false,false,'');
  FFlgCompoeSalBenef := CreateCmDbField('FLGCOMPOESALBENEF',ftFloat,false,false,false,false,'');
  FFlgCompoeRemTotal := CreateCmDbField('FLGCOMPOEREMTOTAL',ftFloat,false,false,false,false,'');
  FFlgAtrasoDevol := CreateCmDbField('FLGATRASODEVOL',ftString,false,false,false,false,'');
  FFlgAdiantFerias := CreateCmDbField('FLGADIANTFERIAS',ftString,false,false,false,false,'');
  FCodFontePagadora := CreateCmDbField('CODFONTEPAGADORA',ftFloat,false,false,false,false,'');
  FFlgRateioDeb := CreateCmDbField('FLGRATEIODEB',ftFloat,false,false,false,false,'');
  FFlgRateioCred := CreateCmDbField('FLGRATEIOCRED',ftFloat,false,false,false,false,'');
end;

function TDbProvDesc.Insert: boolean;
begin
  FIdProvento.asFloat := GetSequence('PROVDESC');
  Result := inherited Insert;
end;

end.
