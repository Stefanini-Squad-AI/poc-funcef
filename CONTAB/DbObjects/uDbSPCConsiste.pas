{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 04/05/2004                             }
{                                                       }
{*******************************************************}

unit uDbSPCConsiste;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbSPCConsiste = class(TCmDbObject)

  private
    FIdspcconsiste: TCmDbField;
    FDescricao: TCmDbField;
    FTipoConsiste: TCmDbField;
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdspcconsiste(const Value: TCmDbField);
    procedure SetTipoConsiste(const Value: TCmDbField);
  public

     Property Idspcconsiste: TCmDbField read FIdspcconsiste write SetIdspcconsiste;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property TipoConsiste: TCmDbField read FTipoConsiste write SetTipoConsiste;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbSPCConsiste }

constructor TDbSPCConsiste.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'SPCCONSISTE';

  fDescricao     := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'Descrição');
  fIdspcconsiste := CreateCmDbField('IDSPCCONSISTE',ftfloat,True,True,False,True,'Identificador');
  
  // Rodolpho da Silva - P: 19812 - 25/07/2005
  // FTipoConsiste  := CreateCmDbField('TIPOCONSISTE',ftString,True,True,False,True,'Tipo'); //Bruno Bastos - Pend. 4928 - 14/12/2004
     FTipoConsiste  := CreateCmDbField('TIPOCONSISTE',ftString,False,True,False,True,'Tipo'); //Bruno Bastos - Pend. 4928 - 14/12/2004
end;

function TDbSPCConsiste.Insert: Boolean;
begin
  fIdspcconsiste.AsFloat := GetSequence('SPCCONSISTE');
  Result := Inherited Insert;
end;


procedure TDbSPCConsiste.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbSPCConsiste.SetIdspcconsiste(const Value: TCmDbField);
begin
  FIdspcconsiste := Value;
end;

procedure TDbSPCConsiste.SetTipoConsiste(const Value: TCmDbField);
begin
  FTipoConsiste := Value;
end;

end.



