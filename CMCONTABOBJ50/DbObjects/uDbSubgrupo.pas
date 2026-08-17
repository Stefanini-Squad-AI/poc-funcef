{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Veronica Almeida                }
{ Atualizado Em: 04/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbSubgrupo;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbSubgrupo = class(TCmDbObject)

  private
     FIdusuarioinclusao: TCmDbField;
     FDescsubgrp       : TCmDbField;
     FCodsubgrp        : TCmDbField;
     procedure SetIdusuarioinclusao(const Value: TCmDbField);
     procedure SetDescsubgrp       (const Value: TCmDbField);
     procedure SetCodsubgrp        (const Value: TCmDbField);
  public
     Property IdUsuarioInclusao :TCmDbField  Read FIdUsuarioInclusao Write SetIdUsuarioInclusao;
     Property Descsubgrp        :TCmDbField  Read FDescsubgrp        Write SetDescsubgrp;
     Property Codsubgrp         :TCmDbField  Read FCodsubgrp         Write SetCodsubgrp;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbSubgrupo }

constructor TDbSubgrupo.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'SUBGRUPO';

   FIdusuarioinclusao := CreateCmDbField('IDUSUARIOINCLUSAO',ftfloat,True,False,False,False);
   FDescsubgrp        := CreateCmDbField('DESCSUBGRP',ftString);
   FCodsubgrp         := CreateCmDbField('CODSUBGRP',ftfloat,True,True,False,False);
end;

function TDbSubgrupo.Insert: Boolean;
begin

   fCodsubgrp.AsFloat := GetSequence('SUBGRUPO');
   Result := Inherited Insert;

end;

function TDbSubgrupo.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;


procedure TDbSubgrupo.SetDescsubgrp(const Value: TCmDbField);
begin
    FDescsubgrp := Value;
end;

procedure TDbSubgrupo.SetCodsubgrp(const Value: TCmDbField);
begin
    FCodsubgrp := Value;
end;


procedure TDbSubgrupo.SetIdUsuarioInclusao(const Value: TCmDbField);
begin
   FIdUsuarioInclusao := Value;
end;

end.



