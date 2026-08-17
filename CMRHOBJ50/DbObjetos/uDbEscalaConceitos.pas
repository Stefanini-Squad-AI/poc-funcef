{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Eugênio                         }
{ Criado Em: 14/08/2003                                 }
{                                                       }
{*******************************************************}

unit uDbEscalaConceitos;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbEscalaConceitos = class(TCmDbObject)
  private
    FIdEscalaConceitos: TCmDbField;
    FConceito1: TCmDbField;
    FConceito2: TCmDbField;
    FConceito3: TCmDbField;
    FConceito4: TCmDbField;
    FConceito5: TCmDbField;
    FConceito6: TCmDbField;
    FQtdeConceitos: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert: boolean; override;

    property IdEscalaConceitos: TCmDbField read FIdEscalaConceitos write FIdEscalaConceitos;
    property QtdeConceitos: TCmDbField read FQtdeConceitos write FQtdeConceitos;
    property Conceito1: TCmDbField read FConceito1 write FConceito1;
    property Conceito2: TCmDbField read FConceito2 write FConceito2;
    property Conceito3: TCmDbField read FConceito3 write FConceito3;
    property Conceito4: TCmDbField read FConceito4 write FConceito4;
    property Conceito5: TCmDbField read FConceito5 write FConceito5;
    property Conceito6: TCmDbField read FConceito6 write FConceito6;
  end;

implementation

uses uCtrlFuncoesRH;

{ TDbEscalaConceitos }

constructor TDbEscalaConceitos.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'ESCALACONCEITOS';

  FIdEscalaConceitos := CreateCmDbField('IDESCALACONCEITOS',ftFloat,true,true,false,false,'');
  FQtdeConceitos := CreateCmDbField('QTDECONCEITOS',ftFloat,false,false,false,false,'');
  FConceito1 := CreateCmDbField('CONCEITO1',ftString,false,false,false,false,'');
  FConceito2 := CreateCmDbField('CONCEITO2',ftString,false,false,false,false,'');
  FConceito3 := CreateCmDbField('CONCEITO3',ftString,false,false,false,false,'');
  FConceito4 := CreateCmDbField('CONCEITO4',ftString,false,false,false,false,'');
  FConceito5 := CreateCmDbField('CONCEITO5',ftString,false,false,false,false,'');
  FConceito6 := CreateCmDbField('CONCEITO6',ftString,false,false,false,false,'');
end;

function TDbEscalaConceitos.Insert: boolean;
begin
  FIdEscalaConceitos.asFloat := GetSequence('ESCALACONCEITOS');
  Result := inherited Insert;
end;

end.
