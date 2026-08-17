{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 06/12/2002                             }
{                                                       }
{*******************************************************}

unit uDbRadresponxgrp;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbRadresponxgrp = class(TCmDbObject)

  private
    FIdusuario: TCmDbField;
    FIdgrprespon: TCmDbField;
    FFlgsubstituto : TCmDbField;
    FFlgAvisoRad   : TCmDbField;
    procedure SetIdgrprespon(const Value: TCmDbField);
    procedure SetIdusuario(const Value: TCmDbField);
    procedure SetFlgsubstituto(const Value: TCmDbField);
    procedure SetFlgAvisoRad(const Value: TCmDbField);

  public

     Property Idusuario: TCmDbField read FIdusuario write SetIdusuario;
     Property Idgrprespon: TCmDbField read FIdgrprespon write SetIdgrprespon;
     Property Flgsubstituto: TCmDbField read FFlgsubstituto write SetFlgsubstituto;
     Property FlgAvisoRad: TCmDbField read FFlgAvisoRad write SetFlgAvisoRad;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbRadresponxgrp }

constructor TDbRadresponxgrp.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RADRESPONXGRP';

   fIdusuario := CreateCmDbField('IDUSUARIO',ftfloat,True,True,False,True,'');
   fIdgrprespon := CreateCmDbField('IDGRPRESPON',ftfloat,True,True,False,True,'');
   flgsubstituto := CreateCmDbField('FLGSUBSTITUTO',ftfloat,False,False,False,True,'');
   flgavisorad := CreateCmDbField('FLGAVISORAD',ftfloat,False,False,False,True,'');
end;

function TDbRadresponxgrp.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDbRadresponxgrp.SetIdgrprespon(const Value: TCmDbField);
begin
  FIdgrprespon := Value;
end;

procedure TDbRadresponxgrp.SetIdusuario(const Value: TCmDbField);
begin
  FIdusuario := Value;
end;
procedure TDbRadresponxgrp.SetFlgSubstituto(const Value: TCmDbField);
begin
  FFlgSubstituto := Value;
end;
procedure TDbRadresponxgrp.SetFlgAvisorad(const Value: TCmDbField);
begin
  FFlgAvisorad := Value;
end;

end.



