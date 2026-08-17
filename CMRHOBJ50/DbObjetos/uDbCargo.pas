{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Atualizado Em: 04/01/2002                             }
{                                                       }
{*******************************************************}
//******************************************************************************
//Nº SOL: WO7643
//Data da Alteração: 05/02/2024
//Alteração Form: Alteração do tipo de campo de blob para string
//Responsável: Luis Ferrari
//Descrição: Alterado o campo descrição de blob para string.
//******************************************************************************
//Nº SOL: 259921/18014 - ER134
//Nº PPM: 1217940
//Data da Alteração: 08/03/2016
//Alteração Form: Inclusão dos campos Tipo e Ativo.
//Responsável: Michelle Suellyn Mota
//Descrição: Inclusão do campo Tipo e campo Ativo para atender as alterações
//           do eSocial.
//******************************************************************************
//Nº SOL: 229871/16137
//Nº PPM: 407073
//Data da Alteração: 02/10/2014
//Alteração Form: inclusão do campo RegimeJornadaTrab.
//Responsável: Felipe A. Santos
//Descrição: inclusão do campo RegimeJornadaTrab.
//******************************************************************************

unit uDbCargo;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbCargo = class(TCmDbObject)
  private
    FIdCargo: TCmDbField;
    FTitulo: TCmDbField;
    FDescricao: TCmDbField;
    FCbo: TCmDbField;
    FCbo2002: TCmDbField;
    FIdFaixaSalarial: TCmDbField;
    FCodGrpTrein: TCmDbField;
    FCodGrpFunc: TCmDbField;
    FCodNivel: TCmDbField;
    FPontosHay: TCmDbField;
    FRegimeJornadaTrab: TCmDbField; // Felipe A. Santos SOL 229871.16137 PPM 407073
    FFlgAtivo :TCmDbField; //Michelle Mota - SOL: 259921.18014 - PPM: 1217940
    FFlgTipo :TCmDbField; //Michelle Mota - SOL: 259921.18014 - PPM: 1217940
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdCargo: TCmDbField read FIdCargo write FIdCargo;
    property Titulo: TCmDbField read FTitulo write FTitulo;
    property Descricao: TCmDbField read FDescricao write FDescricao;
    property Cbo: TCmDbField read FCbo write FCbo;
    property Cbo2002: TCmDbField read FCbo2002 write FCbo2002;
    property IdFaixaSalarial: TCmDbField read FIdFaixaSalarial write FIdFaixaSalarial;
    property CodGrpTrein: TCmDbField read FCodGrpTrein write FCodGrpTrein;
    property CodGrpFunc: TCmDbField read FCodGrpFunc write FCodGrpFunc;
    property CodNivel: TCmDbField read FCodNivel write FCodNivel;
    property PontosHay: TCmDbField read FPontosHay write FPontosHay;
    property RegimeJornadaTrab: TCmDbField read FRegimeJornadaTrab write FRegimeJornadaTrab; // Felipe A. Santos SOL 229871.16137 PPM 407073
    property FlgAtivo: TCmDbField read FFlgAtivo write FFlgAtivo; //Michelle Mota - SOL: 259921.18014 - PPM: 1217940
    property FlgTipo: TCmDbField read FFlgTipo write FFlgTipo;  //Michelle Mota - SOL: 259921.18014 - PPM: 1217940

  end;

implementation

{ TDbCargo }

constructor TDbCargo.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'CARGO';

  FIdCargo := CreateCmDbField('IDCARGO',ftFloat,true,true,false,true,'');
  FTitulo := CreateCmDbField('TITULO',ftString,true,false,false,true,'');
//  FDescricao := CreateCmDbField('DESCRICAO',ftBlob,false,false,false,true,'');   // WO7643 Ferrari
  FDescricao := CreateCmDbField('DESCRICAO',ftString,false,false,false,true,'');   // WO7643 Ferrari
  FCbo := CreateCmDbField('CBO',ftFloat,false,false,false,true,'');
  FCbo2002 := CreateCmDbField('CBO2002',ftFloat,false,false,false,true,'');
  FIdFaixaSalarial := CreateCmDbField('IDFAIXASALARIAL',ftFloat,false,false,false,true,'');
  FCodGrpTrein := CreateCmDbField('CODGRPTREIN',ftString,false,false,false,true,'');
  FCodGrpFunc := CreateCmDbField('CODGRPFUNC',ftString,false,false,false,true,'');
  FCodNivel := CreateCmDbField('CODNIVEL',ftFloat,false,false,false,true,'');
  FPontosHay := CreateCmDbField('PONTOSHAY',ftFloat,false,false,false,false,'');
  FRegimeJornadaTrab := CreateCmDbField('REGIMEJORNADATRAB', ftFloat, False, False, False, true, ''); // Felipe A. Santos SOL 229871.16137 PPM 407073
  FFlgAtivo := CreateCmDbField('FLGATIVO', ftString, False, False, False, true, ''); //Michelle Mota - SOL: 259921.18014 - PPM: 1217940
  FFlgTipo := CreateCmDbField('FLGTIPO', ftString, False, False, False, true, ''); //Michelle Mota - SOL: 259921.18014 - PPM: 1217940
end;

end.
