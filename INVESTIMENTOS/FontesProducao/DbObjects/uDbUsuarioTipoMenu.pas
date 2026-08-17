{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Atualizado Em: 18/01/2007                             }
{                                                       }
{*******************************************************}

unit uDbUsuarioTipoMenu;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbUsuarioTipoMenu = class(TCmDbObject)

  private
    FTipomenu: TCmDbField;
    FIdtipoinvest: TCmDbField;
    FIdusuario: TCmDbField;
    FIdplanprevctbpatr: TCmDbField;
    procedure SetIdplanprevctbpatr(const Value: TCmDbField);
    procedure SetIdtipoinvest(const Value: TCmDbField);
    procedure SetIdusuario(const Value: TCmDbField);
    procedure SetTipomenu(const Value: TCmDbField);

  public

     Property Tipomenu: TCmDbField read FTipomenu write SetTipomenu;
     Property Idusuario: TCmDbField read FIdusuario write SetIdusuario;
     Property Idtipoinvest: TCmDbField read FIdtipoinvest write SetIdtipoinvest;
     Property Idplanprevctbpatr: TCmDbField read FIdplanprevctbpatr write SetIdplanprevctbpatr;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbUsuarioTipoMenu }

constructor TDbUsuarioTipoMenu.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'USUARIOTIPOMENU';

   fTipomenu := CreateCmDbField('TIPOMENU',ftString,True,False,False,True,'Tipo Menu escolhido');
   fIdusuario := CreateCmDbField('IDUSUARIO',ftfloat,True,True,False,True,'Id Usuário');
   fIdtipoinvest := CreateCmDbField('IDTIPOINVEST',ftfloat,False,False,False,True,'Id Tipo de Investimento');
   fIdplanprevctbpatr := CreateCmDbField('IDPLANPREVCTBPATR',ftfloat,False,False,False,True,'Id Plano Patrocinadora');
end;

function TDbUsuarioTipoMenu.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDbUsuarioTipoMenu.SetIdplanprevctbpatr(const Value: TCmDbField);
begin
  FIdplanprevctbpatr := Value;
end;

procedure TDbUsuarioTipoMenu.SetIdtipoinvest(const Value: TCmDbField);
begin
  FIdtipoinvest := Value;
end;

procedure TDbUsuarioTipoMenu.SetIdusuario(const Value: TCmDbField);
begin
  FIdusuario := Value;
end;

procedure TDbUsuarioTipoMenu.SetTipomenu(const Value: TCmDbField);
begin
  FTipomenu := Value;
end;

end.



