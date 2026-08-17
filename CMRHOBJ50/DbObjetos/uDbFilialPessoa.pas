{-------------------------------------------------------------------------------
--------------------------------- ALTERAÇÕES -----------------------------------
--------------------------------------------------------------------------------

 N. SIG.............: 38475
 Data da Alteração..: 08/01/2021
 Responsável........: Everson Cunha
 Descrição..........: Melhorias/ajustes eSocial versão simplificada 1.0
--------------------------------------------------------------------------------
 Rotina             : Create
 N. SIG..........   : 38475.59823
 Data da Alteração: : 07/12/2017
 Alteração Form:    : uDbFilialPessoa
 Responsável:       : Cássio Florêncio Rovaroto
 Descrição.......   : Inclusão do campo CODLOTACAOESOCIAL na tabela FILIALPESSOA
--------------------------------------------------------------------------------
 Nº SOL:            256943-17659
 Nº PPM             1205530
 Data da Alteração: 18/01/2016
 Alteração Form:    eSocial, Tipo natureza Juridica e Natureza Juridica
 Responsável:       Andre Imakawa
 Descrição:         Criação dos campos IDNATJURIDICA
--------------------------------------------------------------------------------
 Rotina:            FormCreate, SelSubTipo, OkDetCLick, ConfirmarClick,
                    VerificaPreenchimento, VerificaPreenchimentoProcesso
 Nº SOL:            229881/16647
 Nº PPM             565997
 Data da Alteração: 27/02/2015
 Alteração Form:    eSocial, Criação do campo estabelecimento e da aba processos
 Responsável:       Higor Nayde Ferreira
 Descrição:         Criação dos campos Classificação tributaria e natureza
                    juridica
--------------------------------------------------------------------------------
 Rotina:            -
 Nº SOL:            229871/16137
 Nº PPM             407073
 Data da Alteração: 20/08/2014
 Alteração Form:    inclusão do campo TIPOESTABE
 Responsável:       Felipe A. Santos
 Descrição:         deve ser adequada a folha de pagamento ao eSocial para
                    atendimento ao Ato Declaratório Executivo SUFIS nº 5, de
                    17 de Julho de 2013 que aprova e divulga os leiautes
                    do eSocial.
--------------------------------------------------------------------------------
 Nº SOL:            224461/15703
 Nº KINTANA         2059184
 Data da Alteração: 04/02/2014
 Alteração Form:    inclusão do campo IDSISTEMACONTROLEPONTORAIS
 Responsável:       William Santana
 Descrição:         Solicitados adequação da Folha de Pagamento ao layout da
                    RAIS ano-base 2013.
                    Demanda Legal p atendimento Portaria nº 2072 de 31 de
                    Dezembro de 2013.
--------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 11/03/2002                                 }
{                                                       }
{*******************************************************}

unit uDbFilialPessoa;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbFilialPessoa = class(TCmDbObject)
  private
    FDiavencgre: TCmDbField;
    FIndorigemcgc: TCmDbField;
    FFicharegfim: TCmDbField;
    FIdnatempre: TCmDbField;
    FIdfpas: TCmDbField;
    FSigla: TCmDbField;
    FFlgativo: TCmDbField;
    FDatainicioativ: TCmDbField;
    FIdfilialpessoa: TCmDbField;
    FCustopatroc: TCmDbField;
    FExtranoturini: TCmDbField;
    FAdicnoturfim: TCmDbField;
    FExtraordinfim: TCmDbField;
    FIndtipoempresa: TCmDbField;
    FUnidtrabalho: TCmDbField;
    FVlrbasereceita: TCmDbField;
    FFlgespfgts: TCmDbField;
    FIdsegacidtrab: TCmDbField;
    FExtranoturfim: TCmDbField;
    FIdmoedagrps: TCmDbField;
    FExtraordinini: TCmDbField;
    FDiavencgrcs: TCmDbField;
    FIditemcnae: TCmDbField;
    FPlaconta: TCmDbField;
    FExtradiurnoini: TCmDbField;
    FNumfilial: TCmDbField;
    FDiavencdarf: TCmDbField;
    FIdcatemprgre: TCmDbField;
    FIdconvprevid: TCmDbField;
    FFicharegini: TCmDbField;
    FIdmoedadarf: TCmDbField;
    FIdcatcnae: TCmDbField;
    FIdsindicato: TCmDbField;
    FPlano: TCmDbField;
    FIdramofornecedor: TCmDbField;
    FIdgerente: TCmDbField;
    FExtradiurnofim: TCmDbField;
    FIdgrupo: TCmDbField;
    FIdcbancaria: TCmDbField;
    FAdicnoturini: TCmDbField;
    FFlgtipo: TCmDbField;
    FCustorural: TCmDbField;
    Fidsistemacontrolepontorais : TCmDbField; //William Santana - SOL 224461/15703 - KIN 2059184
    FTipoEstabe : TCmDbField; // Felipe A. Santos SOL 229871.16137 PPM 407073
    FIDCLASSTRIBUT: TCmDbField; // higor nayde SOL 229881/16647 PPM 565997
    //FIDNATJURIDICA: TCmDbField; // André Imakawa SOL 256943-17659 PPM 1205530 //Everson Cunha - SIG38475
    FCodLotacaoESocial: TCmDbField;
   
  public
    {$IFNDEF VERSAO0505}
    constructor Create(AOwner: TCmCustomCdbObject); override;
    {$ELSE}
    constructor Create; override;
    {$ENDIF}

    property Vlrbasereceita: TCmDbField read FVlrbasereceita write FVlrbasereceita;
    property Unidtrabalho: TCmDbField read FUnidtrabalho write FUnidtrabalho;
    property Sigla: TCmDbField read FSigla write FSigla;
    property Plano: TCmDbField read FPlano write FPlano;
    property Placonta: TCmDbField read FPlaconta write FPlaconta;
    property Numfilial: TCmDbField read FNumfilial write FNumfilial;
    property Indtipoempresa: TCmDbField read FIndtipoempresa write FIndtipoempresa;
    property Indorigemcgc: TCmDbField read FIndorigemcgc write FIndorigemcgc;
    property Idsindicato: TCmDbField read FIdsindicato write FIdsindicato;
    property Idsegacidtrab: TCmDbField read FIdsegacidtrab write FIdsegacidtrab;
    property Idramofornecedor: TCmDbField read FIdramofornecedor write FIdramofornecedor;
    property Idnatempre: TCmDbField read FIdnatempre write FIdnatempre;
    property Idmoedagrps: TCmDbField read FIdmoedagrps write FIdmoedagrps;
    property Idmoedadarf: TCmDbField read FIdmoedadarf write FIdmoedadarf;
    property Iditemcnae: TCmDbField read FIditemcnae write FIditemcnae;
    property Idgrupo: TCmDbField read FIdgrupo write FIdgrupo;
    property Idgerente: TCmDbField read FIdgerente write FIdgerente;
    property Idfpas: TCmDbField read FIdfpas write FIdfpas;
    property Idfilialpessoa: TCmDbField read FIdfilialpessoa write FIdfilialpessoa;
    property Idconvprevid: TCmDbField read FIdconvprevid write FIdconvprevid;
    property Idcbancaria: TCmDbField read FIdcbancaria write FIdcbancaria;
    property Idcatemprgre: TCmDbField read FIdcatemprgre write FIdcatemprgre;
    property Idcatcnae: TCmDbField read FIdcatcnae write FIdcatcnae;
    property Flgtipo: TCmDbField read FFlgtipo write FFlgtipo;
    property Flgespfgts: TCmDbField read FFlgespfgts write FFlgespfgts;
    property Flgativo: TCmDbField read FFlgativo write FFlgativo;
    property Ficharegini: TCmDbField read FFicharegini write FFicharegini;
    property Ficharegfim: TCmDbField read FFicharegfim write FFicharegfim;
    property Extraordinini: TCmDbField read FExtraordinini write FExtraordinini;
    property Extraordinfim: TCmDbField read FExtraordinfim write FExtraordinfim;
    property Extranoturini: TCmDbField read FExtranoturini write FExtranoturini;
    property Extranoturfim: TCmDbField read FExtranoturfim write FExtranoturfim;
    property Extradiurnoini: TCmDbField read FExtradiurnoini write FExtradiurnoini;
    property Extradiurnofim: TCmDbField read FExtradiurnofim write FExtradiurnofim;
    property Diavencgre: TCmDbField read FDiavencgre write FDiavencgre;
    property Diavencgrcs: TCmDbField read FDiavencgrcs write FDiavencgrcs;
    property Diavencdarf: TCmDbField read FDiavencdarf write FDiavencdarf;
    property Datainicioativ: TCmDbField read FDatainicioativ write FDatainicioativ;
    property Custorural: TCmDbField read FCustorural write FCustorural;
    property Custopatroc: TCmDbField read FCustopatroc write FCustopatroc;
    property Adicnoturini: TCmDbField read FAdicnoturini write FAdicnoturini;
    property Adicnoturfim: TCmDbField read FAdicnoturfim write FAdicnoturfim;
    property idsistemacontrolepontorais: TCmDbField read Fidsistemacontrolepontorais write Fidsistemacontrolepontorais; //William Santana - SOL 224461/15703 - KIN 2059184
    property TipoEstabe : TCmDbField read FTipoEstabe write FTipoEstabe; // Felipe A. Santos SOL 229871.16137 PPM 407073

    property IDCLASSTRIBUT : TCmDbField read FIDCLASSTRIBUT write FIDCLASSTRIBUT; // Higor Nayde SOL 229881/16647 PPM 565997
    //property IdNatJuridica  : TCmDbField read FIdNatJuridica  write FIdNatJuridica;// André Imakawa SOL 256943-17659 PPM 1205530 //Everson Cunha - SIG38475

    //Cássio Rovaroto - SIG nº 38475.59823
    property CodLotacaoESocial: TCmDbField read FCodLotacaoESocial write FCodLotacaoESocial;

  end;

implementation

{ TDbFilialPessoa }

{$IFNDEF VERSAO0505}
constructor TDbFilialPessoa.Create(AOwner: TCmCustomCdbObject);
{$ELSE}
constructor TDbFilialPessoa.Create;
{$ENDIF}
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'FILIALPESSOA';

  FVlrbasereceita := CreateCmDbField('VLRBASERECEITA',ftFloat,false,false,false,false,'');
  FUnidtrabalho := CreateCmDbField('UNIDTRABALHO',ftString,false,false,false,false,'');
  FSigla := CreateCmDbField('SIGLA',ftString,false,false,false,false,'');
  FPlano := CreateCmDbField('PLANO',ftFloat,false,false,false,false,'');
  FPlaconta := CreateCmDbField('PLACONTA',ftString,false,false,false,false,'');
  FNumfilial := CreateCmDbField('NUMFILIAL',ftString,false,false,false,false,'');
  FIndtipoempresa := CreateCmDbField('INDTIPOEMPRESA',ftFloat,false,false,false,false,'');
  FIndorigemcgc := CreateCmDbField('INDORIGEMCGC',ftFloat,false,false,false,false,'');
  FIdsindicato := CreateCmDbField('IDSINDICATO',ftFloat,false,false,false,true,'');
  FIdsegacidtrab := CreateCmDbField('IDSEGACIDTRAB',ftFloat,false,false,false,true,'');
  FIdramofornecedor := CreateCmDbField('IDRAMOFORNECEDOR',ftFloat,false,false,false,true,'');
  FIdnatempre := CreateCmDbField('IDNATEMPRE',ftFloat,false,false,false,true,'');
  FIdmoedagrps := CreateCmDbField('IDMOEDAGRPS',ftFloat,false,false,false,true,'');
  FIdmoedadarf := CreateCmDbField('IDMOEDADARF',ftFloat,false,false,false,true,'');
  FIditemcnae := CreateCmDbField('IDITEMCNAE',ftFloat,false,false,false,true,'');
  FIdgrupo := CreateCmDbField('IDGRUPO',ftFloat,false,false,false,true,'');
  FIdgerente := CreateCmDbField('IDGERENTE',ftFloat,false,false,false,true,'');
  FIdfpas := CreateCmDbField('IDFPAS',ftFloat,false,false,false,true,'');
  FIdfilialpessoa := CreateCmDbField('IDFILIALPESSOA',ftFloat,true,true,false,false,'');
  FIdconvprevid := CreateCmDbField('IDCONVPREVID',ftFloat,false,false,false,true,'');
  FIdcbancaria := CreateCmDbField('IDCBANCARIA',ftFloat,false,false,false,true,'');
  FIdcatemprgre := CreateCmDbField('IDCATEMPRGRE',ftFloat,false,false,false,true,'');
  FIdcatcnae := CreateCmDbField('IDCATCNAE',ftFloat,false,false,false,true,'');
  FFlgtipo := CreateCmDbField('FLGTIPO',ftString,false,false,false,false,'');
  FFlgespfgts := CreateCmDbField('FLGESPFGTS',ftFloat,false,false,false,false,'');
  FFlgativo := CreateCmDbField('FLGATIVO',ftString,false,false,false,false,'');
  FFicharegini := CreateCmDbField('FICHAREGINI',ftFloat,false,false,false,false,'');
  FFicharegfim := CreateCmDbField('FICHAREGFIM',ftFloat,false,false,false,false,'');
  FExtraordinini := CreateCmDbField('EXTRAORDININI',ftString,false,false,false,false,'');
  FExtraordinfim := CreateCmDbField('EXTRAORDINFIM',ftString,false,false,false,false,'');
  FExtranoturini := CreateCmDbField('EXTRANOTURINI',ftString,false,false,false,false,'');
  FExtranoturfim := CreateCmDbField('EXTRANOTURFIM',ftString,false,false,false,false,'');
  FExtradiurnoini := CreateCmDbField('EXTRADIURNOINI',ftString,false,false,false,false,'');
  FExtradiurnofim := CreateCmDbField('EXTRADIURNOFIM',ftString,false,false,false,false,'');
  FDiavencgre := CreateCmDbField('DIAVENCGRE',ftFloat,false,false,false,false,'');
  FDiavencgrcs := CreateCmDbField('DIAVENCGRCS',ftFloat,false,false,false,false,'');
  FDiavencdarf := CreateCmDbField('DIAVENCDARF',ftFloat,false,false,false,false,'');
  FDatainicioativ := CreateCmDbField('DATAINICIOATIV',ftDateTime,false,false,false,true,'');
  FCustorural := CreateCmDbField('CUSTORURAL',ftFloat,false,false,false,false,'');
  FCustopatroc := CreateCmDbField('CUSTOPATROC',ftFloat,false,false,false,false,'');
  FAdicnoturini := CreateCmDbField('ADICNOTURINI',ftString,false,false,false,false,'');
  FAdicnoturfim := CreateCmDbField('ADICNOTURFIM',ftString,false,false,false,false,'');
  Fidsistemacontrolepontorais := CreateCmDbField('IDSISTEMACONTROLEPONTORAIS',ftFloat,false,false,false,false,''); //William Santana - SOL 224461/15703 - KIN 2059184
  FTipoEstabe := CreateCmDbField('TIPOESTABE', ftString, false, false, false, false, ''); // Felipe A. Santos SOL 229871.16137 PPM 407073

  FIDCLASSTRIBUT := CreateCmDbField('IDCLASSTRIBUT',ftFloat,false,false,false,false,''); // higor SOL 229881/16647
  //FIdNatJuridica := CreateCmDbField('IDNATJURIDICA',ftFloat,false,false,false,true,''); // André Imakawa SOL 256943-17659 PPM 1205530 //Everson Cunha - SIG38475

  //Cássio Rovaroto - SIG nº 38475.59823
  FCodLotacaoESocial := CreateCmDbField('CODLOTACAOESOCIAL', ftString, false, false, false, false, '');
end;

end.                                                      
