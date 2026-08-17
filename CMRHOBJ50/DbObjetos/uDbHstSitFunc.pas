{-------------------------------------------------------------------------------
--------------------------------- ALTERAÇÕES -----------------------------------
--------------------------------------------------------------------------------

 N. SIG.............: 38475
 Data da Alteração..: 08/01/2021
 Responsável........: Everson Cunha
 Descrição..........: Melhorias/ajustes eSocial versão simplificada 1.0
--------------------------------------------------------------------------------
                    VerificaPreenchimentoProcesso
 Nº SOL:            250386/17325
 Nº PPM             832403
 Data da Alteração: 15/06/2015
 Alteração Form:    Criação do campo "Indicativo de Pagamento em Juizo"
 Responsável:       Higor Nayde Ferreira
 Descrição:         Criação do campo "Indicativo de Pagamento em Juizo".
--------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 26/06/2002                                 }
{                                                       }
{*******************************************************}

unit uDbHstSitFunc;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

type
  TDbHstSitFunc = class(TCmDbObject)
  private
    FIdPessoa: TCmDbField;
    FDataSitFunc: TCmDbField;
    FIdMovContrCAGED: TCmDbField;
    FIdMotivoOfic: TCmDbField;
    FIdSitFunc: TCmDbField;
    FIdMotivoGer: TCmDbField;
    FNumProcesso :TCmDbField;
    FDataReint :TCmDbField;
    FDataRetorno :TCmDbField;
    //FPagtoJuizo  :TCmDbField; //Everson Cunha - SIG38475

  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property DataSitFunc: TCmDbField read FDataSitFunc write FDataSitFunc;
    property IdSitFunc: TCmDbField read FIdSitFunc write FIdSitFunc;
    property IdMovContrCAGED: TCmDbField read FIdMovContrCAGED write FIdMovContrCAGED;
    property IdMotivoOfic: TCmDbField read FIdMotivoOfic write FIdMotivoOfic;
    property IdMotivoGer: TCmDbField read FIdMotivoGer write FIdMotivoGer;

    property NumProcesso: TCmDbField read FNumProcesso write FNumProcesso;
    property DataReint:   TCmDbField read FDataReint  write FDataReint;
    property DataRetorno: TCmDbField read FDataRetorno write FDataRetorno;
    //property PagtoJuizo: TCmDbField read FPagtoJuizo write FPagtoJuizo;    //Higor Nayde Ferreira Nº SOL:            250386/17325 //Everson Cunha - SIG38475

  end;

implementation

{ TDbHstSitFunc }

constructor TDbHstSitFunc.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'HSTSITFUNC';

  FIdPessoa := CreateCmDbField('IDPESSOA',ftFloat,true,true,false,false,'');
  FDataSitFunc := CreateCmDbField('DATASITFUNC',ftDateTime,true,true,false,true,'');
  FIdSitFunc := CreateCmDbField('IDSITFUNC',ftFloat,false,false,false,true,'');
  FIdMovContrCAGED := CreateCmDbField('IDMOVCONTRCAGED',ftFloat,false,false,false,true,'');
  FIdMotivoOfic := CreateCmDbField('IDMOTIVOOFIC',ftFloat,false,false,false,true,'');
  FIdMotivoGer := CreateCmDbField('IDMOTIVOGER',ftFloat,false,false,false,true,'');

  FNumProcesso := CreateCmDbField('NUMPROCESSO',ftString,false,false,false,true,'');
  FDataReint := CreateCmDbField('DATAREINT',ftDateTime,false,false,false,true,'');
  FDataRetorno := CreateCmDbField('DATARETORNO',ftDateTime,false,false,false,true,'');

  //FPagtoJuizo := CreateCmDbField('PAGTOJUIZO',ftString,false,false,false,true,'');  //Higor Nayde Ferreira Nº SOL:            250386/17325 //Everson Cunha - SIG38475


end;

end.
