{*******************************************************}
{                                                       }
{ Padrões de Desenvolvimento                            }
{ Copyright © 1998,2002 - CM Soluções Informática       }
{                                                       }
{ - Atualização para o padrão MT (3 Camadas)            }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 10/04/2002                             }
{                                                       }
{*******************************************************}
unit uDbLogopcao;

interface

Uses uCmDbObject, DB, uCmCustomCdbObject;

Type
  TDbLogopcao = class(TCmDbObject)

  private
    FIdmodulo: TCmDbField;
    FDatalog: TCmDbField;
    FNomeopcao: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdusuario: TCmDbField;
    FIdlogopcao: TCmDbField;
    procedure SetDatalog(const Value: TCmDbField);
    procedure SetIdlogopcao(const Value: TCmDbField);
    procedure SetIdmodulo(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdusuario(const Value: TCmDbField);
    procedure SetNomeopcao(const Value: TCmDbField);

  public

     Property Nomeopcao: TCmDbField read FNomeopcao write SetNomeopcao;
     Property Idusuario: TCmDbField read FIdusuario write SetIdusuario;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idmodulo: TCmDbField read FIdmodulo write SetIdmodulo;
     Property Idlogopcao: TCmDbField read FIdlogopcao write SetIdlogopcao;
     Property Datalog: TCmDbField read FDatalog write SetDatalog;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbLogopcao }

constructor TDbLogopcao.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'LOGOPCAO';

   fNomeopcao := CreateCmDbField('NOMEOPCAO',ftString,True,False,False,True,'');
   fIdusuario := CreateCmDbField('IDUSUARIO',ftfloat,True,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False,False,True,'');
   fIdmodulo := CreateCmDbField('IDMODULO',ftfloat,True,False,False,True,'');
   fIdlogopcao := CreateCmDbField('IDLOGOPCAO',ftfloat,True,True,False,True,'');
   fDatalog := CreateCmDbField('DATALOG',ftDateTime,True,False,False,True,'');
end;

function TDbLogopcao.Insert: Boolean;
begin
   fIdlogopcao.AsFloat := GetSequence(TableName);
   Result := Inherited Insert;

end;

function TDbLogopcao.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbLogopcao.SetDatalog(const Value: TCmDbField);
begin
  FDatalog := Value;
end;

procedure TDbLogopcao.SetIdlogopcao(const Value: TCmDbField);
begin
  FIdlogopcao := Value;
end;

procedure TDbLogopcao.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;

procedure TDbLogopcao.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbLogopcao.SetIdusuario(const Value: TCmDbField);
begin
  FIdusuario := Value;
end;

procedure TDbLogopcao.SetNomeopcao(const Value: TCmDbField);
begin
  FNomeopcao := Value;
end;

end.



