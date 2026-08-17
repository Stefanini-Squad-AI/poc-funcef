{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 12/03/2002                                 }
{                                                       }
{*******************************************************}
//******************************************************************************
//Nº SOL: 259921/18014 - ER145
//Nº PPM: 1217940
//Data da Alteração: 09/03/2016
//Alteração Form: Alteração do campo Código Terceiros para Código Terceiros
//               (eSocial).
//Responsável: Michelle Suellyn Mota
//Descrição: Alteração do campo Código Terceiros para Código Terceiros
//           (eSocial). Campo da tabela modificado de number(3) para char(4).
//******************************************************************************
unit uDbConvPrevid;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbConvPrevid = class(TCmDbObject)
  private
    FDescricao: TCmDbField;
    FPercConvPrevid: TCmDbField;
    FIdFPAS: TCmDbField;
    FIdConvPrevid: TCmDbField;
    FCodTerceSocial: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdFPAS: TCmDbField read FIdFPAS write FIdFPAS;
    property IdConvPrevid: TCmDbField read FIdConvPrevid write FIdConvPrevid;
    property Descricao: TCmDbField read FDescricao write FDescricao;
    property PercConvPrevid: TCmDbField read FPercConvPrevid write FPercConvPrevid;
    property CodTerceSocial: TCmDbField read FCodTerceSocial write FCodTerceSocial;
  end;

implementation

{ TDbConvPrevid }

constructor TDbConvPrevid.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'CONVPREVID';

  FIdFPAS := CreateCmDbField('IDFPAS',ftFloat,true,true,false,false,'');
  FIdConvPrevid := CreateCmDbField('IDCONVPREVID',ftFloat,true,true,false,false,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,true,false,false,false,'');
  FPercConvPrevid := CreateCmDbField('PERCCONVPREVID',ftFloat,true,false,false,false,'');
  //FCodTerceSocial := CreateCmDbField('CodTerceSocial',ftFloat,true,false,false,false,'');
  FCodTerceSocial := CreateCmDbField('CodTerceSocial',ftString,true,false,false,false,'');//Michelle Mota - SOL: 259921.18014 - PPM: 1217940
end;

end.
