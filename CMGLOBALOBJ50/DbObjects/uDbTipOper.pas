{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marco Antonio Abreu             }
{ Atualizado Em: 30/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbTipOper;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbTipOper = class(TCmDbObject)

  private
    FTipcodigo: TCmDbField;
    FTipdescricao: TCmDbField;
    procedure SetTipcodigo(const Value: TCmDbField);
    procedure SetTipdescricao(const Value: TCmDbField);

  public
    Property Tipdescricao: TCmDbField read FTipdescricao write SetTipdescricao;
    Property Tipcodigo: TCmDbField read FTipcodigo write SetTipcodigo;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert :Boolean; Override;
    Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbTipOper }

constructor TDbTipOper.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TIPOPER';

  fTipdescricao := CreateCmDbField('TIPDESCRICAO',ftString,True,False,False,True,'Descrição');
  fTipcodigo    := CreateCmDbField('TIPCODIGO',ftString,True,True,False,True,'Código');
end;

function TDbTipOper.Insert: Boolean;
begin
  Result := Inherited Insert;
end;

function TDbTipOper.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDbTipOper.SetTipcodigo(const Value: TCmDbField);
begin
  FTipcodigo := Value;
end;

procedure TDbTipOper.SetTipdescricao(const Value: TCmDbField);
begin
  FTipdescricao := Value;
end;

end.

