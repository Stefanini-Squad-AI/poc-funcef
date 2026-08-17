{
------------------------------------------------------------------------------
Nº WO.......: 7876
Data........: 14/02/2024
Responsável.: Helen V Bianchi
Descrição...: Adicionado o Motivo como Key, evitando exclusões incorretas
------------------------------------------------------------------------------
Nº SIG......: 43010
Nº KINTANA..:
Data........: 01/09/2022
Responsável.: Luis Ferrari
Descrição...: Incluir novo na tabela Evolfunc
--------------------------------------------------------------------------------
Nº SOL......: 188194
Nº KINTANA..: 1779198
Data........: 08/04/2013
Responsável.: Higor Nayde Ferreira
Descrição...: Incluir novos campos das telas de Registro de Alteração Funcional e Cadastro de Pessoal
--------------------------------------------------------------------------------
{ --------------------------------------------------------------------------------------------------
N. Sol..........: 205930
N. Kintana......: 1991130
Data............: 02/05/2013
Responsável.....: Thiago Melo
Descrição.......: Não esta sendo persistido o tipo de envento no cadastro de Registro de Alteração
                  Funcional 
----------------------------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 05/09/2002                                 }
{                                                       }
{*******************************************************}

unit uDbEvolFunc;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB;

type
  TDbEvolFunc = class(TCmDbObject)
  private
    FCodCentroCusto: TCmDbField;
    FIdMotivo: TCmDbField;
    FIdCargo: TCmDbField;
    FIdEmpresa: TCmDbField;
    FPerc_Reaj: TCmDbField;
    FIdFuncao: TCmDbField;
    FIdPessoa: TCmDbField;
    FSalario: TCmDbField;
    FIdProcesso: TCmDbField;
    FTipoPagamento: TCmDbField;
    FDataAlterFunc: TCmDbField;
    FIdEstab: TCmDbField;
    FIdfaixacargo: TCmDbField;
    FIdfaixafuncao: TCmDbField;
    FNivelindiv1: TCmDbField;
    FNivelindiv2: TCmDbField;
    FTrgDtInclusao: TCmDbField;
	//Higor Nayde Ferreira Sol 188194 - Kintana 1779198
    FVLRFuncao:   TCmDbField;
    FPerc_Reaj_Funcao: TCmDbField;
    FVLRSalTotal: TCmDbField;
    FFLGATUDADOSPREV: TCmDbField;
	//Higor Nayde Ferreira Sol 188194 - Kintana 1779198

  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property IdEmpresa: TCmDbField read FIdEmpresa write FIdEmpresa;
    property DataAlterFunc: TCmDbField read FDataAlterFunc write FDataAlterFunc;
    property IdEstab: TCmDbField read FIdEstab write FIdEstab;
    property IdMotivo: TCmDbField read FIdMotivo write FIdMotivo;
    property IdCargo: TCmDbField read FIdCargo write FIdCargo;
    property IdFuncao: TCmDbField read FIdFuncao write FIdFuncao;
    property CodCentroCusto: TCmDbField read FCodCentroCusto write FCodCentroCusto;
    property TipoPagamento: TCmDbField read FTipoPagamento write FTipoPagamento;
    property Perc_Reaj: TCmDbField read FPerc_Reaj write FPerc_Reaj;
    property Salario: TCmDbField read FSalario write FSalario;
    property IdProcesso: TCmDbField read FIdProcesso write FIdProcesso;
    property Idfaixacargo: TCmDbField read FIdfaixacargo write FIdfaixacargo;
    property Idfaixafuncao: TCmDbField read FIdfaixafuncao write FIdfaixafuncao;
    property Nivelindiv1: TCmDbField read FNivelindiv1 write FNivelindiv1;
    property Nivelindiv2: TCmDbField read FNivelindiv2 write FNivelindiv2;
    property TrgDtInclusao: TCmDbField read FTrgDtInclusao write FTrgDtInclusao;    //Higor Nayde Ferreira Sol 188194 - Kintana 1779198
    property VLRFUNCAO: TCmDbField read FVLRFuncao write FVLRFuncao;
    property PERC_REAJFUNCAO: TCmDbField read FPerc_Reaj_Funcao write FPerc_Reaj_Funcao;
    property VLRSALARIOFUNCAO: TCmDbField read FVLRSalTotal write FVLRSalTotal;		//Higor Nayde Ferreira Sol 188194 - Kintana 1779198
    property FLGATUDADOSPREV:  TCmDbField read FFLGATUDADOSPREV write FFLGATUDADOSPREV;   // SIG 43010 Ferrari
  end;

implementation

{ TDbEvolFunc }

constructor TDbEvolFunc.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'EVOLFUNC';

  FIdPessoa := CreateCmDbField('IDPESSOA',ftFloat,true,true,false,true,'');
  FDataAlterFunc := CreateCmDbField('DATAALTERFUNC',ftDateTime,true,true,false,true,'');
  // Thiago Melo SOL 205930 Kintana 1991130
  //FIdMotivo := CreateCmDbField('IDMOTIVO',ftFloat,true,true,false,true,'');
  //FIdMotivo := CreateCmDbField('IDMOTIVO',ftFloat,true,False,false,true,'');  WO7876 -  Helen
  // Thiago Melo SOL 205930 Kintana 1991130

  FIdMotivo := CreateCmDbField('IDMOTIVO',ftFloat,true,true,false,true,'');  // WO7876 -  Helen

  FIdEmpresa := CreateCmDbField('IDEMPRESA',ftFloat,false,false,false,true,'');
  FIdEstab := CreateCmDbField('IDESTAB',ftFloat,false,false,false,true,'');
  FIdCargo := CreateCmDbField('IDCARGO',ftFloat,false,false,false,true,'');
  FIdFuncao := CreateCmDbField('IDFUNCAO',ftFloat,false,false,false,true,'');
  FCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString,false,false,false,true,'');
  FTipoPagamento := CreateCmDbField('TIPOPAGAMENTO',ftString,true,false,false,true,'');
  FPerc_Reaj := CreateCmDbField('PERC_REAJ',ftFloat,false,false,false,true,'');
  FSalario := CreateCmDbField('SALARIO',ftFloat,false,false,false,true,'');
  FIdProcesso := CreateCmDbField('IDPROCESSO',ftFloat,false,false,false,true,'');
  FIdfaixacargo := CreateCmDbField('IDFAIXACARGO',ftFloat,false,false,false,true,'');
  FIdfaixafuncao := CreateCmDbField('IDFAIXAFUNCAO',ftFloat,false,false,false,true,'');
  FNivelindiv1 := CreateCmDbField('NIVELINDIV1',ftFloat,false,false,false,false,'');
  FNivelindiv2 := CreateCmDbField('NIVELINDIV2',ftFloat,false,false,false,false,'');
  FTrgDtInclusao := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,true,false,false,false,'', -1, true);
  FVLRFuncao := CreateCmDbField('VLRFUNCAO',ftFloat,false,false,false,true,'');//Higor Nayde Ferreira Sol 188194 - Kintana 1779198
  FPerc_Reaj_Funcao := CreateCmDbField('PERC_REAJFUNCAO',ftFloat,false,false,false,true,'');
  FVLRSalTotal := CreateCmDbField('VLRSALARIOFUNCAO',ftFloat,false,false,false,true,'');//Higor Nayde Ferreira Sol 188194 - Kintana 1779198
  FFLGATUDADOSPREV := CreateCmDbField('FLGATUDADOSPREV',ftFloat,false,false,false,false,'');    // SIG 43010 Ferrari

end;

end.
