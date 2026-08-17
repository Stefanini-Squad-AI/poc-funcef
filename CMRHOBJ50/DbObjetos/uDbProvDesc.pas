{-------------------------------------------------------------------------------
--------------------------------- ALTERAÇÕES -----------------------------------
--------------------------------------------------------------------------------
N. WO..............: 9895
Data da Alteração..: 16/04/2024
Responsável........: Helen V Bianchi
Descrição..........: Adidionado os campos: flgAtivo e flggravarubrica
--------------------------------------------------------------------------------
 N. SIG.............: 38475
 Data da Alteração..: 08/01/2021
 Responsável........: Everson Cunha
 Descrição..........: Melhorias/ajustes eSocial versão simplificada 1.0
--------------------------------------------------------------------------------
N. SIG..........   : 61905
Data da Alteração: : 24/04/2019
Alteração Form:    : fCadProvDesc
Responsável:       : Everson Cunha
Descrição.......   : Alteração do tipo NullIfZero de False para True
--------------------------------------------------------------------------------
Rotina             : Create
N. SIG..........   : 38475.59579
Data da Alteração: : 04/12/2017
Alteração Form:    : uDbProvDesc
Responsável:       : Cássio Florêncio Rovaroto
Descrição.......   : Remoção dos tratamento aos campos INCIDEDESCSEMANREMUN,
                     INICDE13SAL, INCIDEFERIAS, INCIDEAVISOPREVIO e FATOROUPERC.
--------------------------------------------------------------------------------
Rotina...........:
Nº SIG...........: 34125
Data da Alteração: 22/05/2017
Responsável......: Andre Imakawa
Descrição........: Criação do campo FLGRATEARPORDEPENDENTE
--------------------------------------------------------------------------------
Nº SOL: 229874.16590
Nº PPM: 1203875
Data da Alteração: 08/12/2015
Alteração Form: ajustes de campos novos e alteração de outros campos
Responsável: Michelle Suellyn Mota
Descrição: Adequação do cadastro de rubricas ao manual 2.1 do eSocial
--------------------------------------------------------------------------------
Rotina......: Create
Nº SOL......: 229874/16590
Nº KINTANA..: 544597
Data........: 14/11/2014
Responsável.: Felipe A. Santos / William Santana
Descrição...: criação dos campos para aba eSocial, no cadastro de rubricas
              salariais.
--------------------------------------------------------------------------------
Rotina......: IDRUBRICAXESOCIAL
N. Sol......: 229353-16212
N. Kintana..: 434575
Data........: 18-09-2014
Responsável.: Higor Nayde
Descrição...: ajuste referente ao e-social
--------------------------------------------------------------------------------
Nº SOL....: 191668
Nº KINTANA: 1820235
Data da Alteração: 25/11/2014
Alteração: remover os campos referentes a parametrização de incidência de ventos
           e regras de cálculo (FLGSALFAMILIA,FLGDECIMOTERCEIRO,FLGBENEFICIOS,
           FLGRESCISAO, FLGFERIAS, FLGCEDIDOS, IDREGRA13,IDREGRABENEFICIOS,
           IDREGRARESCISAO, IDREGRAFERIAS, IDREGRACEDIDOS
Responsável: Edilaine
Descrição:  Trocar o tipo de cadastro de radio group para grid na aba
            "Incidência de Eventos" do cadastro de rubricas salariais
--------------------------------------------------------------------------------
Rotina......: Create
Nº SOL......: 141270
Nº KINTANA..: 890829
Data........: 11/08/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação dos campos Excesso de Débito, Rubrica Excesso de
              Débito e Débito em Conta
--------------------------------------------------------------------------------
Rotina: Create
Nº SOL: 126964
Nº KINTANA: 668955
Data da Alteração: 29/01/2010
Responsável: Marilza Colpani
Descrição: Desvincular a flag FLGESPECIAL do módulo Folha de Pagamento,
                 substituindo pelo flag FLGESPECIALFP, que receberá todos os
                 valores da flag desvinculada.
--------------------------------------------------------------------------------}

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

    // inicio - edilaine - SOL 191668 / KTN 1820235 - comentado
    {FFlgsalfamilia: TCmDbField;
    FFlgrescisao: TCmDbField;
    FFlgferias: TCmDbField;
    FFlgdecimoterceiro: TCmDbField;
    FFLGCEDIDOS: TCmDbField;
    FFLGBENEFICIOS: TCmDbField;
    FIDREGRACEDIDOS: TCmDbField;
    FIDREGRABENEFICIOS: TCmDbField;
    FIdregra13: TCmDbField;
    FIdregraferias: TCmDbField;
    FIdregrarescisao: TCmDbField;
    }// fim - edilaine - SOL 191668 / KTN 1820235 - comentado

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
    FIdModulo: TCmDbField;
    FFlgcompoesalbenef: TCmDbField;
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
    FFlgincidesalpart: TCmDbField;
    FIdinforme: TCmDbField;
    FNumPrioriDesc: TCmDbField;
    FFlgDebConta: TCmDbField;
    FFlgExcessoDeb: TCmDbField;
    FIdProventoExcessoDeb: TCmDbField;
    //Ricardo Cristiano - 13/09/2010 - N. Sol 142201 -  N. Kintana 905537
    FFlgContribuicao: TCmDbField;
    //Arnaldo V. Scarin - 09/12/2011
    FFlgAssistencial: TCmDbField;
    FIDRUBRICAXESOCIAL : TCmDbField;
    FFLGEMPRESTIMOFINAN: TCmDbField;
    // Felipe A. Santos - William Santana - SOL 229874.16590 PPM 544597 - Início
    FIdinctributps: TCmDbField;
    FIdinctributir: TCmDbField;
    FIdinctributfgts: TCmDbField;
    //FIdinctributcs: TCmDbField; //Everson Cunha - SIG38475
    // Início - Michelle Mota - SOL 229874.16590 - PPM 1203875
    //Cássio Rovaroto - SIG nº 38475.59579 - Início
    //FINCIDEDESCSEMANREMUN: TCmDbField;
    //FINCIDE13SAL: TCmDbField;
    //FINCIDEFERIAS: TCmDbField;
    //FINCIDEAVISOPREVIO: TCmDbField;
    //FFATOROUPERC: TCmDbField;
    //Cássio Rovaroto - SIG nº 38475.59579 - Fim
    FQTDREFAPUR: TCmDbField;
    // Término - Michelle Mota - SOL 229874.16590 - PPM 1203875
    FIdprocessocp: TCmDbField;
    FIdprocessoir: TCmDbField;
    FIdprocessofgts: TCmDbField;
    //FIdprocessocs: TCmDbField; //Everson Cunha - SIG38475
    // Felipe A. Santos - William Santana - SOL 229874.16590 PPM 544597 - fim

    FFLGRATEARPORDEPENDENTE: TCmDbField; // Andre Imakawa - SIG 34125
    FflgAtivo        : TCmDbField; //Helen V Bianchi - WO9895
    Fflggravarubrica : TCmDbField; //Helen V Bianchi - WO9895


    procedure SetFLGEMPRESTIMOFINAN(const Value: TCmDbField);
    // inicio - edilaine - SOL 191668 / KTN 1820235 - comentado
    {procedure SetFLGCEDIDOS(const Value: TCmDbField);
    procedure SetFLGBENEFICIOS(const Value: TCmDbField);
    procedure SetIDREGRACEDIDOS(const Value: TCmDbField);
    procedure SetIDREGRABENEFICIOS(const Value: TCmDbField);
    }// fim - edilaine - SOL 191668 / KTN 1820235 - comentado
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
    // inicio - edilaine - SOL 191668 / KTN 1820235 - comentado
    {property IdRegra13: TCmDbField read FIdRegra13 write FIdRegra13;
    property IdRegraRescisao: TCmDbField read FIdRegraRescisao write FIdRegraRescisao;
    property IdRegraFerias: TCmDbField read FIdRegraFerias write FIdRegraFerias;
    }// fim - edilaine - SOL 191668 / KTN 1820235 - comentado
    property IdRegra: TCmDbField read FIdRegra write FIdRegra;
    property IdInforme: TCmDbField read FIdInforme write FIdInforme;
    property IdBenefSalar: TCmDbField read FIdBenefSalar write FIdBenefSalar;
    property FlgUso: TCmDbField read FFlgUso write FFlgUso;
    property FlgTpRubrica: TCmDbField read FFlgTpRubrica write FFlgTpRubrica;
    property FlgSalRef: TCmDbField read FFlgSalRef write FFlgSalRef;
    property FlgSalPartRetro: TCmDbField read FFlgSalPartRetro write FFlgSalPartRetro;
    property FlgSalPartAtuaria: TCmDbField read FFlgSalPartAtuaria write FFlgSalPartAtuaria;
    property FlgSalBenefRetro: TCmDbField read FFlgSalBenefRetro write FFlgSalBenefRetro;
    // inicio - edilaine - SOL 191668 / KTN 1820235 - comentado
    {property FlgSalFamilia: TCmDbField read FFlgSalFamilia write FFlgSalFamilia;
    property FlgRescisao: TCmDbField read FFlgRescisao write FFlgRescisao;
    property FlgFerias: TCmDbField read FFlgFerias write FFlgFerias;
    property FlgDecimoTerceiro: TCmDbField read FFlgDecimoTerceiro write FFlgDecimoTerceiro;
    }// fim - edilaine - SOL 191668 / KTN 1820235 - comentado
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
    //Marilza Colpani - SOL 126964/KTN 668955
//    property FlgEspecial: TCmDbField read FFlgEspecial write FFlgEspecial;
    property FlgEspecialFP: TCmDbField read FFlgEspecialFP write FFlgEspecialFP;
    property FlgDescPensao: TCmDbField read FFlgDescPensao write FFlgDescPensao;
    property FlgDesconto: TCmDbField read FFlgDesconto write FFlgDesconto;
    property FlgConstaFolha: TCmDbField read FFlgConstaFolha write FFlgConstaFolha;
    property FlgConsolida: TCmDbField read FFlgConsolida write FFlgConsolida;
    property FlgCompoeSalPart: TCmDbField read FFlgCompoeSalPart write FFlgCompoeSalPart;
    property FlgCompoeSalBenef: TCmDbField read FFlgCompoeSalBenef write FFlgCompoeSalBenef;
    property FlgCompoeRemTotal: TCmDbField read FFlgCompoeRemTotal write FFlgCompoeRemTotal;
    property FlgAtrasoDevol: TCmDbField read FFlgAtrasoDevol write FFlgAtrasoDevol;
    property FlgAdiantFerias: TCmDbField read FFlgAdiantFerias write FFlgAdiantFerias;
    property NumPrioriDesc: TCmDbField read FNumPrioriDesc write FNumPrioriDesc;
    // Alterado por FHBS - SOL: 141270 KTN: 890829
    property FlgDebConta: TCmDbField read FFlgDebConta write FFlgDebConta;
    property FlgExcessoDeb: TCmDbField read FFlgExcessoDeb write FFlgExcessoDeb;
    property IdProventoExcessoDeb: TCmDbField read FIdProventoExcessoDeb write FIdProventoExcessoDeb;
    //Ricardo Cristiano - 13/09/2010 - N. Sol 142201 -  N. Kintana 905537
    property FlgContribuicao: TCmDbField  read FFlgContribuicao write FFlgContribuicao;
    //Arnaldo V. Scarin - 09/12/2011
    property FlgAssistencial: TCmDbField read FFlgAssistencial write FFlgAssistencial;
    // Fim - Alterado por FHBS

    // inicio - edilaine - SOL 191668 / KTN 1820235 - comentado
    {//MONICA GONZAGA SOL154980 INICIO
    property FLGCEDIDOS: TCmDbField  read FFLGCEDIDOS write SetFLGCEDIDOS;
    property FLGBENEFICIOS: TCmDbField read FFLGBENEFICIOS write SetFLGBENEFICIOS;
    property IDREGRACEDIDOS :TCmDbField read FIDREGRACEDIDOS write SetIDREGRACEDIDOS;
    property IDREGRABENEFICIOS :TCmDbField read FIDREGRABENEFICIOS write SetIDREGRABENEFICIOS;
    } // fim - edilaine - SOL 191668 / KTN 1820235 - comentado

    // FELIPE SANTOS SOL 177438  KTN 1635220
    property FLGEMPRESTIMOFINAN: TCmDbField read FFLGEMPRESTIMOFINAN write SetFLGEMPRESTIMOFINAN;

    // edilaine SOL 229353/16212 / PPM 434575
    property IDRUBRICAXESOCIAL : TCmDbField read FIDRUBRICAXESOCIAL write FIDRUBRICAXESOCIAL;

    // Felipe A. Santos - William Santana - SOL 229874.16590 PPM 544597 - Início
    property Idinctributps : TCmDbField read FIdinctributps write FIdinctributps;
    property Idinctributir : TCmDbField read FIdinctributir write FIdinctributir;
    property Idinctributfgts : TCmDbField read FIdinctributfgts write FIdinctributfgts;
    //property Idinctributcs : TCmDbField read FIdinctributcs write FIdinctributcs;     //Everson Cunha - SIG38475
    // Início - Michelle Mota - SOL 229874.16590 - PPM 1203875
    //Cássio Rovaroto - SIG nº 38475.59579 - Início
    //property INCIDEDESCSEMANREMUN : TCmDbField read FINCIDEDESCSEMANREMUN write FINCIDEDESCSEMANREMUN;
    //property INCIDE13SAL : TCmDbField read FINCIDE13SAL write FINCIDE13SAL;
    //property INCIDEFERIAS : TCmDbField read FINCIDEFERIAS write FINCIDEFERIAS;
    //property INCIDEAVISOPREVIO : TCmDbField read FINCIDEAVISOPREVIO write FINCIDEAVISOPREVIO;
    //property FATOROUPERC : TCmDbField read FFATOROUPERC write FFATOROUPERC;
    //Cássio Rovaroto - SIG nº 38475.59579 - Fim
    property QTDREFAPUR : TCmDbField read FQTDREFAPUR write FQTDREFAPUR;
    // Término - Michelle Mota - SOL 229874.16590 - PPM 1203875
    property Idprocessocp : TCmDbField read FIdprocessocp write FIdprocessocp;
    property Idprocessoir : TCmDbField read FIdprocessoir write FIdprocessoir;
    property Idprocessofgts : TCmDbField read FIdprocessofgts write FIdprocessofgts;
    //property Idprocessocs : TCmDbField read FIdprocessocs write FIdprocessocs;//Everson Cunha - SIG38475
    // Felipe A. Santos - William Santana - SOL 229874.16590 PPM 544597 - fim

    // Andre Imakawa - SIG 34125
    property FLGRATEARPORDEPENDENTE: TCmDbField read FFLGRATEARPORDEPENDENTE write FFLGRATEARPORDEPENDENTE;
    //Helen V Bianchi - WO9895 - Inicio
    property flgAtivo: TCmDbField read FflgAtivo write FflgAtivo;
    property flggravarubrica: TCmDbField read Fflggravarubrica write Fflggravarubrica;
    //Helen V Bianchi - WO9895 - Fim

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

  // inicio - edilaine - SOL 191668 / KTN 1820235 - comentado
  {FIdRegra13 := CreateCmDbField('IdRegra13',ftFloat,false,false,false,true,'');
  FIdRegraRescisao := CreateCmDbField('IdRegraRescisao',ftFloat,false,false,false,true,'');
  FIdRegraFerias := CreateCmDbField('IdRegraFerias',ftFloat,false,false,false,true,'');
  }// fim - edilaine - SOL 191668 / KTN 1820235 - comentado

  FIdRegra := CreateCmDbField('IdRegra',ftFloat,false,false,false,true,'');
  FIdInforme := CreateCmDbField('IdInforme',ftFloat,false,false,false,true,'');
  FIdBenefSalar := CreateCmDbField('IdBenefSalar',ftFloat,false,false,false,true,'');
  FFlgUso := CreateCmDbField('FlgUso',ftString,false,false,false,false,'');
  FFlgTpRubrica := CreateCmDbField('FlgTpRubrica',ftString,false,false,false,false,'');
  FFlgSalRef := CreateCmDbField('FlgSalRef',ftFloat,false,false,false,false,'');
  FFlgSalPartRetro := CreateCmDbField('FlgSalPartRetro',ftFloat,false,false,false,false,'');
  FFlgSalPartAtuaria := CreateCmDbField('FlgSalPartAtuaria',ftFloat,false,false,false,false,'');

  // inicio - edilaine - SOL 191668 / KTN 1820235 - comentado
  {FFlgSalFamilia := CreateCmDbField('FlgSalFamilia',ftFloat,false,false,false,false,'');
  FFlgRescisao := CreateCmDbField('FlgRescisao',ftFloat,false,false,false,false,'');
  FFlgFerias := CreateCmDbField('FlgFerias',ftFloat,false,false,false,false,'');
  FFlgDecimoTerceiro := CreateCmDbField('FlgDecimoTerceiro',ftFloat,false,false,false,false,'');
  }// fim - edilaine - SOL 191668 / KTN 1820235 - comentado

  FFlgSalBenefRetro := CreateCmDbField('FlgSalBenefRetro',ftFloat,false,false,false,false,'');
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
  //Marilza Colpani - SOL 126964/KTN 668955
  //FFlgEspecial := CreateCmDbField('FlgEspecial',ftFloat,false,false,false,false,'');
  FFlgDescPensao := CreateCmDbField('FlgDescPensao',ftFloat,false,false,false,false,'');
  FFlgDesconto := CreateCmDbField('FlgDesconto',ftFloat,false,false,false,false,'');
  FFlgConstaFolha := CreateCmDbField('FlgConstaFolha',ftFloat,false,false,false,false,'');
  FFlgConsolida := CreateCmDbField('FlgConsolida',ftFloat,false,false,false,false,'');
  FFlgCompoeSalPart := CreateCmDbField('FlgCompoeSalPart',ftFloat,false,false,false,false,'');
  FFlgCompoeSalBenef := CreateCmDbField('FlgCompoeSalBenef',ftFloat,false,false,false,false,'');
  FFlgCompoeRemTotal := CreateCmDbField('FlgCompoeRemTotal',ftFloat,false,false,false,false,'');
  FFlgAtrasoDevol := CreateCmDbField('FlgAtrasoDevol',ftString,false,false,false,false,'');
  FFlgAdiantFerias := CreateCmDbField('FlgAdiantFerias',ftString,false,false,false,false,'');
  //Marilza Colpani - SOL 126964/KTN 668955
  FFlgEspecialFP := CreateCmDbField('FlgEspecialFP',ftFloat,false,false,false,false,'');
  FNumPrioriDesc := CreateCmDbField('NumPrioriDesc',ftFloat,false,false,false,false,'');
  // Alterado por FHBS - SOL: 141270 KTN: 890829
  FFlgDebConta := CreateCmDbField('FlgDebConta',ftFloat,false,false,false,false,'');
  FFlgExcessoDeb := CreateCmDbField('FlgExcessoDeb',ftFloat,false,false,false,false,'');
  FIdProventoExcessoDeb := CreateCmDbField('IdProventoExcessoDeb',ftFloat,false,false,false,false,'');
  // Fim - Alterado por FHBS
  //Ricardo Cristiano - 13/09/2010 - N. Sol 142201 -  N. Kintana 905537
  FFlgContribuicao := CreateCmDbField('FlgContribuicao',ftString,false,false,false,false,'');
  //Arnaldo V. Scarin - 09/12/2011
  FFlgAssistencial := CreateCmDbField('FlgAssistencial',ftString,false,false,false,false,'');

  // inicio - edilaine - SOL 191668 / KTN 1820235 - comentado
  {FFLGCEDIDOS:=  CreateCmDbField('FLGCEDIDOS',ftFloat,false,false,false,false,'');
  FFLGBENEFICIOS:=  CreateCmDbField('FLGBENEFICIOS',ftFloat,false,false,false,false,'');
  FIDREGRACEDIDOS:= CreateCmDbField('IdRegraCedidos',ftFloat,false,false,false,true,'');
  FIDREGRABENEFICIOS:= CreateCmDbField('IdRegraBeneficios',ftFloat,false,false,false,true,'');
  }// fim - edilaine - SOL 191668 / KTN 1820235 - comentado

  // FELIPE SANTOS SOL 177438  KTN 1635220
  FFLGEMPRESTIMOFINAN := CreateCmDbField('FLGEMPRESTIMOFINAN',ftFloat,false,false,false,false,'');
  // edilaine SOL 229353/16212 / PPM 434575
  //FIDRUBRICAXESOCIAL := CreateCmDbField('IDRUBRICAXESOCIAL',ftFloat,false,false,false,false,''); //Everson Cunha - SIG61905
  FIDRUBRICAXESOCIAL := CreateCmDbField('IDRUBRICAXESOCIAL',ftFloat,false,false,false,True,'');    //Everson Cunha - SIG61905
  // Felipe A. Santos - William Santana - SOL 229874.16590 PPM 544597 - Início
  FIdinctributps := CreateCmDbField('IDINCTRIBUTPS',FtFloat,false,false,false,true,'');
  FIdinctributir := CreateCmDbField('IDINCTRIBUTIR',FtFloat,false,false,false,true,'');
  FIdinctributfgts := CreateCmDbField('IDINCTRIBUTFGTS',FtFloat,false,false,false,true,'');
  //FIdinctributcs := CreateCmDbField('IDINCTRIBUTCS',FtFloat,false,false,false,true,'');   //Everson Cunha - SIG38475
  // Início - Michelle Mota - SOL 229874.16590 - PPM 1203875
  //Cássio Rovaroto - SIG nº 38475.59579 - Início
  //FINCIDEDESCSEMANREMUN := CreateCmDbField('INCIDEDESCSEMANREMUN',ftString,false,false,false,true,'');
  //FINCIDE13SAL := CreateCmDbField('INCIDE13SAL',ftString,false,false,false,true,'');
  //FINCIDEFERIAS := CreateCmDbField('INCIDEFERIAS',ftString,false,false,false,true,'');
  //FINCIDEAVISOPREVIO := CreateCmDbField('INCIDEAVISOPREVIO',ftString,false,false,false,true,'');
  //FFATOROUPERC := CreateCmDbField('FATOROUPERC',FtFloat,false,false,false,true,'');
  //Cássio Rovaroto - SIG nº 38475.59579 - Fim
  FQTDREFAPUR := CreateCmDbField('QTDREFAPUR',ftString,false,false,false,true,'');
  // Término - Michelle Mota - SOL 229874.16590 - PPM 1203875
  FIdprocessocp := CreateCmDbField('IDPROCESSOCP',FtFloat,false,false,false,true,'');
  FIdprocessoir := CreateCmDbField('IDPROCESSOIR',FtFloat,false,false,false,true,'');
  FIdprocessofgts := CreateCmDbField('IDPROCESSOFGTS',FtFloat,false,false,false,true,'');
  //FIdprocessocs := CreateCmDbField('IDPROCESSOCS',FtFloat,false,false,false,true,'');  //Everson Cunha - SIG38475
  // Felipe A. Santos - William Santana - SOL 229874.16590 PPM 544597 - fim

  // Andre Imakawa - SIG 34125
  FFLGRATEARPORDEPENDENTE := CreateCmDbField('FLGRATEARPORDEPENDENTE',ftString,false,false,false,false,'');
  // Helen V Bianchi - WO9895 - Inicio
  FflgAtivo        := CreateCmDbField('flgAtivo',ftString,false,false,false,false,'');
  Fflggravarubrica := CreateCmDbField('flggravarubrica',ftString,false,false,false,false,'');
  // Helen V Bianchi - WO9895 - Fim
end;

function TDbProvDesc.Insert: boolean;
begin
  FIdProvento.asFloat := GetSequence('PROVDESC');
  Result := inherited Insert;
end;

// inicio - edilaine - SOL 191668 / KTN 1820235 - comentado
{
procedure TDbProvDesc.SetFLGBENEFICIOS(const Value: TCmDbField);
begin
  FFLGBENEFICIOS := Value;
end;

procedure TDbProvDesc.SetFLGCEDIDOS(const Value: TCmDbField);
begin
  FFLGCEDIDOS := Value;
end;

procedure TDbProvDesc.SetIDREGRABENEFICIOS(const Value: TCmDbField);
begin
  FIDREGRABENEFICIOS := Value;
end;

procedure TDbProvDesc.SetIDREGRACEDIDOS(const Value: TCmDbField);
begin
  FIDREGRACEDIDOS := Value;
end;
}// fim - edilaine - SOL 191668 / KTN 1820235 - comentado

procedure TDbProvDesc.SetFLGEMPRESTIMOFINAN(const Value: TCmDbField);
begin
  FFLGEMPRESTIMOFINAN := Value;
end;

end.
