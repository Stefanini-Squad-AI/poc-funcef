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
//           Esta tabela não possui este campo.
//******************************************************************************

unit uDbFPAS;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbFPAS = class(TCmDbObject)
  private
    FDescricao: TCmDbField;
    FIdFPAS: TCmDbField;
    FPercDecTerc: TCmDbField;
    FPercSalFam: TCmDbField;
    FPercContribEmpres: TCmDbField;
    FPercPrevRural: TCmDbField;
    FPercSalMatern: TCmDbField;
    //FCODTERCESOCIAL: TCmDbField;//Michelle Mota - SOL: 259921.18014 - PPM: 1217940

  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdFPAS: TCmDbField read FIdFPAS write FIdFPAS;
    property Descricao: TCmDbField read FDescricao write FDescricao;
    property PercSalMatern: TCmDbField read FPercSalMatern write FPercSalMatern;
    property PercSalFam: TCmDbField read FPercSalFam write FPercSalFam;
    property PercPrevRural: TCmDbField read FPercPrevRural write FPercPrevRural;
    property PercDecTerc: TCmDbField read FPercDecTerc write FPercDecTerc;
    property PercContribEmpres: TCmDbField read FPercContribEmpres write FPercContribEmpres;
    //property CODTERCESOCIAL: TCmDbField read FCODTERCESOCIAL write FCODTERCESOCIAL; //Michelle Mota - SOL: 259921.18014 - PPM: 1217940


  end;

implementation

{ TDbFPAS }

constructor TDbFPAS.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'FPAS';

  FIdFPAS := CreateCmDbField('IDFPAS',ftfloat,true,true,false,false,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,true,false,false,true,'');
  FPercSalMatern := CreateCmDbField('PERCSALMATERN',ftfloat,false,false,false,false,'');
  FPercSalFam := CreateCmDbField('PERCSALFAM',ftfloat,false,false,false,false,'');
  FPercPrevRural := CreateCmDbField('PERCPREVRURAL',ftfloat,false,false,false,false,'');
  FPercDecTerc := CreateCmDbField('PERCDECTERC',ftfloat,false,false,false,false,'');
  FPercContribEmpres := CreateCmDbField('PERCCONTRIBEMPRES',ftfloat,false,false,false,false,'');
//  FCODTERCESOCIAL := CreateCmDbField('CODTERCESOCIAL',ftfloat,false,false,false,false,'');//Michelle Mota - SOL: 259921.18014 - PPM: 1217940
end;

end.
