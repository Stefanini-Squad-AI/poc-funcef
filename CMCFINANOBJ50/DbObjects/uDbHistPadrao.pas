{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Cláudio Beraldo                 }
{ Atualizado Em: 08/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbHistPadrao;

interface
uses uCmDbObject, DB, uDataBase, uCmCustomCdbObject;

type
  TDbHistPadrao = class(TCmDbObject)

  private

     FHistpadfinan : TCmDbField;
     FDescricao : TCmDbField;


  public

     property Histpadfinan: TCmDbField read FHistpadfinan write FHistpadfinan;
     property Descricao: TCmDbField    read FDescricao    write FDescricao;

     constructor Create(Aowner: TCmCustomCdbObject); override;

     function Insert :Boolean; override;
     function LoadFromDb :Boolean; override;


  end;



implementation

{ TDbHistoricoFinan }



constructor TDbHistPadrao.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'HISTORICOFINAN';

   FHistpadfinan := CreateCmDbField('HISTPADFINAN',ftfloat,True,True,False,True,'');
   FDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
end;



function TDbHistPadrao.Insert: Boolean;
begin
   FHistpadfinan.AsFloat := GetSequence('HISTORICOFINAN');
   Result := inherited Insert;
end;



function TDbHistPadrao.LoadFromDB: Boolean;
begin
   Result := inherited LoadFromDB;
end;



end.
