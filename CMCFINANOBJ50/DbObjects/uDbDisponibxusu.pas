{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 07/01/2003                             }
{                                                       }
{*******************************************************}

unit uDbDisponibxusu;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbDisponibxusu = class(TCmDbObject)

  private
    FIdusuario    : TCmDbField;
    FFlgDispFinanc: TCmDbField;
    procedure SetIdusuario(const Value: TCmDbField);
    procedure SetFlgDispFinanc(const Value: TCmDbField);

  public

     Property Idusuario    : TCmDbField read FIdusuario     write SetIdusuario;
     Property FlgDispFinanc: TCmDbField read FFlgDispFinanc write SetFlgDispFinanc;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;

  End;

implementation

{ TDbDisponibxusu }

constructor TDbDisponibxusu.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'USUARIOSISTEMA';

   FIdusuario      := CreateCmDbField('IDUSUARIO',ftfloat,True,True,False,True,'');
   FFlgDispFinanc := CreateCmDbField('FLGDISPFINANC',ftString,False,False,False,True,'Liberado para Disp.Financeira');
end;

function TDbDisponibxusu.Insert: Boolean;
begin
   fIdusuario.AsInteger := GetSequence('USUARIOSISTEMA');
   Result := Inherited Insert;
end;

procedure TDbDisponibxusu.SetIdusuario(const Value: TCmDbField);
begin
  FIdusuario := Value;
end;

procedure TDbDisponibxusu.SetFlgDispFinanc(const Value: TCmDbField);
begin
  FFlgDispFinanc := Value;
end;

end.
