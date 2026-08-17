{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 18/11/2001                             }
{                                                       }
{*******************************************************}

unit uDbPeriodo;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbPeriodo = class(TCmDbObject)

  private
    FPeroutmoeda: TCmDbField;
    FIdpessoa: TCmDbField;
    FPerbloque: TCmDbField;
    FPeratuali: TCmDbField;
    FPerbloint: TCmDbField;
    FPerespecial: TCmDbField;
    FPernumero: TCmDbField;
    FPernomeoutling: TCmDbField;
    FPerplanil: TCmDbField;
    FPerdatini: TCmDbField;
    FPernome: TCmDbField;
    FIdusuarioinclusao: TCmDbField;
    FPerexercicio: TCmDbField;
    FPerdatfim: TCmDbField;
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdusuarioinclusao(const Value: TCmDbField);
    procedure SetPeratuali(const Value: TCmDbField);
    procedure SetPerbloint(const Value: TCmDbField);
    procedure SetPerespecial(const Value: TCmDbField);
    procedure SetPerbloque(const Value: TCmDbField);
    procedure SetPerdatfim(const Value: TCmDbField);
    procedure SetPerdatini(const Value: TCmDbField);
    procedure SetPerexercicio(const Value: TCmDbField);
    procedure SetPernome(const Value: TCmDbField);
    procedure SetPernomeoutling(const Value: TCmDbField);
    procedure SetPernumero(const Value: TCmDbField);
    procedure SetPeroutmoeda(const Value: TCmDbField);
    procedure SetPerplanil(const Value: TCmDbField);

  public

     Property Perplanil: TCmDbField read FPerplanil write SetPerplanil;
     Property Peroutmoeda: TCmDbField read FPeroutmoeda write SetPeroutmoeda;
     Property Pernumero: TCmDbField read FPernumero write SetPernumero;
     Property Pernomeoutling: TCmDbField read FPernomeoutling write SetPernomeoutling;
     Property Pernome: TCmDbField read FPernome write SetPernome;
     Property Perexercicio: TCmDbField read FPerexercicio write SetPerexercicio;
     Property Perdatini: TCmDbField read FPerdatini write SetPerdatini;
     Property Perdatfim: TCmDbField read FPerdatfim write SetPerdatfim;
     Property Perbloque: TCmDbField read FPerbloque write SetPerbloque;
     Property Perbloint: TCmDbField read FPerbloint write SetPerbloint;
     Property Perespecial: TCmDbField read FPerespecial write SetPerespecial;
     Property Peratuali: TCmDbField read FPeratuali write SetPeratuali;
     Property Idusuarioinclusao: TCmDbField read FIdusuarioinclusao write SetIdusuarioinclusao;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbPeriodo }

constructor TDbPeriodo.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PERIODO';

   fPerplanil := CreateCmDbField('PERPLANIL',ftfloat);
   fPeroutmoeda := CreateCmDbField('PEROUTMOEDA',ftString);
   fPernumero := CreateCmDbField('PERNUMERO',ftfloat,True,True,False,True);
   fPernomeoutling := CreateCmDbField('PERNOMEOUTLING',ftString);
   fPernome := CreateCmDbField('PERNOME',ftString);
   fPerexercicio := CreateCmDbField('PEREXERCICIO',ftfloat,True,True,False,True);
   fPerdatini := CreateCmDbField('PERDATINI',ftDateTime);
   fPerdatfim := CreateCmDbField('PERDATFIM',ftDateTime);
   fPerbloque := CreateCmDbField('PERBLOQUE',ftString);
   fPerbloint := CreateCmDbField('PERBLOINT',ftString);
   fPerespecial := CreateCmDbField('PERESPECIAL',ftString);
   fPeratuali := CreateCmDbField('PERATUALI',ftString);
   fIdusuarioinclusao := CreateCmDbField('IDUSUARIOINCLUSAO',ftfloat);
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True);
end;

function TDbPeriodo.Insert: Boolean;
begin

   Result := Inherited Insert;

end;

function TDbPeriodo.LoadFromDb: Boolean;
begin
   Result := Inherited LoadFromDb;
end;

procedure TDbPeriodo.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbPeriodo.SetIdusuarioinclusao(const Value: TCmDbField);
begin
  FIdusuarioinclusao := Value;
end;

procedure TDbPeriodo.SetPeratuali(const Value: TCmDbField);
begin
  FPeratuali := Value;
end;

procedure TDbPeriodo.SetPerbloint(const Value: TCmDbField);
begin
  FPerbloint := Value;
end;

procedure TDbPeriodo.SetPerbloque(const Value: TCmDbField);
begin
  FPerbloque := Value;
end;

procedure TDbPeriodo.SetPerdatfim(const Value: TCmDbField);
begin
  FPerdatfim := Value;
end;

procedure TDbPeriodo.SetPerdatini(const Value: TCmDbField);
begin
  FPerdatini := Value;
end;

procedure TDbPeriodo.SetPerespecial(const Value: TCmDbField);
begin
   FPerespecial := Value;
end;

procedure TDbPeriodo.SetPerexercicio(const Value: TCmDbField);
begin
  FPerexercicio := Value;
end;

procedure TDbPeriodo.SetPernome(const Value: TCmDbField);
begin
  FPernome := Value;
end;

procedure TDbPeriodo.SetPernomeoutling(const Value: TCmDbField);
begin
  FPernomeoutling := Value;
end;

procedure TDbPeriodo.SetPernumero(const Value: TCmDbField);
begin
  FPernumero := Value;
end;

procedure TDbPeriodo.SetPeroutmoeda(const Value: TCmDbField);
begin
  FPeroutmoeda := Value;
end;

procedure TDbPeriodo.SetPerplanil(const Value: TCmDbField);
begin
  FPerplanil := Value;
end;

end.



