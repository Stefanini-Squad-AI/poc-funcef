{-------------------------------------------------------------------------------
--------------------------------- ALTERAÇÕES -----------------------------------
--------------------------------------------------------------------------------

 N. SIG.............: 136024
 Data da Alteração..: 13/06/2023
 Responsável........: Everson Cunha
 Descrição..........: Inclusão dos campos Tempo Residência e Condição Ingresso
                      Trabalhador - Estrangeiro
--------------------------------------------------------------------------------
 N. SIG.............: 38475
 Data da Alteração..: 08/01/2021
 Responsável........: Everson Cunha
 Descrição..........: Melhorias/ajustes eSocial versão simplificada 1.0
--------------------------------------------------------------------------------
Rotina             : Create
N. SIG..........   : 38475.59780
Data da Alteração: : 08/12/2017
Alteração Form:    : uDbEstrangeiro
Responsável:       : Cássio Florêncio Rovaroto
Descrição.......   : Alteração dos tipos de valor para os campos MOD19NUMERO e
										 MOD19REGISTRO
--------------------------------------------------------------------------------
Nº SOL: 250384.17324
Nº PPM 1070235
Data da Alteração: 12/02/2016
Alteração Form: Leiaute e campos novos   
Responsável: Michelle Suellyn Mota
Descrição: Mudança no leiaute e campos novos para adequar ao eSocial
--------------------------------------------------------------------------------
Nº SOL: 229871/16137
Nº PPM: 407073
Data da Alteração: 02/10/2014
Alteração Form: criação dos campos Data Naturalizado, Orgão e Data Emissão.
Responsável: Felipe A. Santos
Descrição: criação dos campos Data Naturalizado, Orgão e Data Emissão.
--------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 13/02/2003                                 }
{                                                       }
{*******************************************************}

unit uDbEstrangeiro;

interface

uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

type
  TDbEstrangeiro = class(TCmDbObject)
  private
    FDecretoNaturalizacao: TCmDbField;
    FMod19Numero: TCmDbField;
    FIdPessoa: TCmDbField;
    FFlgCasadoBrasileiro: TCmDbField;
    FIdNacionMae: TCmDbField;
    FFlgFilhosBrasileiros: TCmDbField;
    FMod19Registro: TCmDbField;
    FFlgNaturalizado: TCmDbField;
    FIdNacionPai: TCmDbField;
    FAnoChegada: TCmDbField;
    FTempoResidencia: TCmDbField;
    FCondicaoIngresso: TCmDbField;

    // Felipe A. Santos SOL 229871.16137 - início
    //FDataNaturalizado: TCmDbField; //Everson Cunha - SIG38475
    //FOrgao: TCmDbField;            //Everson Cunha - SIG38475
    //FDataEmissao: TCmDbField;      //Everson Cunha - SIG38475
    // Felipe A. Santos SOL 229871.16137 - fim
    //FIDCONDICAOTRABEST: TCmDbField;//Michelle Mota - SOL: 250384.17324 - PPM: 1070235 //Everson Cunha - SIG38475
  public
    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property AnoChegada: TCmDbField read FAnoChegada write FAnoChegada;
    property IdNacionPai: TCmDbField read FIdNacionPai write FIdNacionPai;
    property IdNacionMae: TCmDbField read FIdNacionMae write FIdNacionMae;
    property FlgNaturalizado: TCmDbField read FFlgNaturalizado write FFlgNaturalizado;
    property FlgFilhosBrasileiros: TCmDbField read FFlgFilhosBrasileiros write FFlgFilhosBrasileiros;
    property FlgCasadoBrasileiro: TCmDbField read FFlgCasadoBrasileiro write FFlgCasadoBrasileiro;
    property DecretoNaturalizacao: TCmDbField read FDecretoNaturalizacao write FDecretoNaturalizacao;
    property Mod19Registro: TCmDbField read FMod19Registro write FMod19Registro;
    property Mod19Numero: TCmDbField read FMod19Numero write FMod19Numero;
    property TempoResidencia: TCmDbField read FTempoResidencia write FTempoResidencia;
    property CondicaoIngresso: TCmDbField read FCondicaoIngresso write FCondicaoIngresso;

    // Felipe A. Santos SOL 229871.16137
    //property DataNaturalizado : TCmDbField read FDataNaturalizado write FDataNaturalizado; //Everson Cunha - SIG38475
    //property DataEmissao : TCmDbField read FDataEmissao write FDataEmissao;                //Everson Cunha - SIG38475
    //property Orgao : TCmDbField read FOrgao write FOrgao;                                  //Everson Cunha - SIG38475
    // Felipe A. Santos SOL 229871.16137

    //property IDCONDICAOTRABEST : TCmDbField read FIDCONDICAOTRABEST write FIDCONDICAOTRABEST; //Michelle Mota - SOL: 250384.17324 - PPM: 1070235  //Everson Cunha - SIG38475

    constructor Create(AOwner: TCmCustomCdbObject); override;
  end;

implementation

{ TDbEstrangeiro }

constructor TDbEstrangeiro.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'ESTRANGEIRO';

  FIdPessoa := CreateCmDbField('IDPESSOA',ftFloat,true,true,false,true,'');
  FAnoChegada := CreateCmDbField('ANOCHEGADA',ftDateTime,false,false,false,true,'');
  FIdNacionPai := CreateCmDbField('IDNACIONPAI',ftFloat,false,false,false,true,'');
  FIdNacionMae := CreateCmDbField('IDNACIONMAE',ftFloat,false,false,false,true,'');
  FFlgNaturalizado := CreateCmDbField('FLGNATURALIZADO',ftFloat,false,false,false,false,'');
  FFlgFilhosBrasileiros := CreateCmDbField('FLGFILHOSBRASILEIROS',ftFloat,false,false,false,false,'');
  FFlgCasadoBrasileiro := CreateCmDbField('FLGCASADOBRASILEIRO',ftFloat,false,false,false,false,'');
  FDecretoNaturalizacao := CreateCmDbField('DECRETONATURALIZACAO',ftFloat,false,false,false,true,'');
  //Cássio Rovaroto - SIG nº38475.59780 - Início
  //FMod19Registro := CreateCmDbField('MOD19REGISTRO',ftFloat,false,false,false,true,'');
  FMod19Registro := CreateCmDbField('MOD19REGISTRO',ftString,false,false,false,true,'');
  //FMod19Numero := CreateCmDbField('MOD19NUMERO',ftFloat,false,false,false,true,'');
  FMod19Numero := CreateCmDbField('MOD19NUMERO',ftString,false,false,false,true,'');
  //Cássio Rovaroto - SIG nº38475.59780 - Fim

  FTempoResidencia := CreateCmDbField('TEMPO_RESIDENCIA',ftFloat,false,false,false,true,'');
  FCondicaoIngresso := CreateCmDbField('CONDICAO_INGRESSO',ftFloat,false,false,false,true,'');

  // Felipe A. Santos SOL 229871.16137 - início
  //FDataNaturalizado := CreateCmDbField('DATANATURALIZADO',ftDateTime,false,false,false,true,'');//Michelle Mota - SOL: 250384.17324 - PPM: 1070235  //Everson Cunha - SIG38475
  //FOrgao := CreateCmDbField('ORGAO',ftString,false,false,false,true,'');                                                                            //Everson Cunha - SIG38475
  //FDataEmissao := CreateCmDbField('DATAEMISSAO',ftDateTime,false,false,false,true,'');; //Michelle Mota - SOL: 250384.17324 - PPM: 1070235          //Everson Cunha - SIG38475
  // Felipe A. Santos SOL 229871.16137 - fim
  //FIDCONDICAOTRABEST := CreateCmDbField('IDCONDICAOTRABEST',ftFloat,false,false,false,true,'');//Michelle Mota - SOL: 250384.17324 - PPM: 1070235   //Everson Cunha - SIG38475
end;

end.
