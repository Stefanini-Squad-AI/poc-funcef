{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 25/10/2005                             }
{                                                       }
{*******************************************************}

unit uDbEvolfuncprev;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbEvolfuncprev = class(TCmDbObject)

  private
    FPercats: TCmDbField;
    FModofuncao: TCmDbField;
    FPercinsalub: TCmDbField;
    FIdpessjurfg: TCmDbField;
    FQtdeminutos: TCmDbField;
    FTrguserinclusao: TCmDbField;
    FPercadicionalnot: TCmDbField;
    FIdcargoext: TCmDbField;
    FPercpericul: TCmDbField;
    FIdpessjurgr: TCmDbField;
    FIdpessjurcg: TCmDbField;
    FSeqhistfunc: TCmDbField;
    FDatafinal: TCmDbField;
    FFlgsitpart: TCmDbField;
    FPercfuncao: TCmDbField;
    FIdfuncao: TCmDbField;
    FIdpessjur: TCmDbField;
    FPerc2ac: TCmDbField;
    FDatainicio: TCmDbField;
    FIdpessoa: TCmDbField;
    FPerc1ac: TCmDbField;
    FOrigem: TCmDbField;
    FPercadnot: TCmDbField;
    FIdgrupofunc: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    procedure SetDatafinal(const Value: TCmDbField);
    procedure SetDatainicio(const Value: TCmDbField);
    procedure SetFlgsitpart(const Value: TCmDbField);
    procedure SetIdcargoext(const Value: TCmDbField);
    procedure SetIdfuncao(const Value: TCmDbField);
    procedure SetIdgrupofunc(const Value: TCmDbField);
    procedure SetIdpessjur(const Value: TCmDbField);
    procedure SetIdpessjurcg(const Value: TCmDbField);
    procedure SetIdpessjurfg(const Value: TCmDbField);
    procedure SetIdpessjurgr(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetModofuncao(const Value: TCmDbField);
    procedure SetOrigem(const Value: TCmDbField);
    procedure SetPerc1ac(const Value: TCmDbField);
    procedure SetPerc2ac(const Value: TCmDbField);
    procedure SetPercadicionalnot(const Value: TCmDbField);
    procedure SetPercadnot(const Value: TCmDbField);
    procedure SetPercats(const Value: TCmDbField);
    procedure SetPercfuncao(const Value: TCmDbField);
    procedure SetPercinsalub(const Value: TCmDbField);
    procedure SetPercpericul(const Value: TCmDbField);
    procedure SetQtdeminutos(const Value: TCmDbField);
    procedure SetSeqhistfunc(const Value: TCmDbField);
    procedure SetTrgdtinclusao(const Value: TCmDbField);
    procedure SetTrguserinclusao(const Value: TCmDbField);

  public

     Property Trguserinclusao: TCmDbField read FTrguserinclusao write SetTrguserinclusao;
     Property Trgdtinclusao: TCmDbField read FTrgdtinclusao write SetTrgdtinclusao;
     Property Seqhistfunc: TCmDbField read FSeqhistfunc write SetSeqhistfunc;
     Property Qtdeminutos: TCmDbField read FQtdeminutos write SetQtdeminutos;
     Property Perc2ac: TCmDbField read FPerc2ac write SetPerc2ac;
     Property Perc1ac: TCmDbField read FPerc1ac write SetPerc1ac;
     Property Percpericul: TCmDbField read FPercpericul write SetPercpericul;
     Property Percinsalub: TCmDbField read FPercinsalub write SetPercinsalub;
     Property Percfuncao: TCmDbField read FPercfuncao write SetPercfuncao;
     Property Percats: TCmDbField read FPercats write SetPercats;
     Property Percadnot: TCmDbField read FPercadnot write SetPercadnot;
     Property Percadicionalnot: TCmDbField read FPercadicionalnot write SetPercadicionalnot;
     Property Origem: TCmDbField read FOrigem write SetOrigem;
     Property Modofuncao: TCmDbField read FModofuncao write SetModofuncao;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idpessjurgr: TCmDbField read FIdpessjurgr write SetIdpessjurgr;
     Property Idpessjurfg: TCmDbField read FIdpessjurfg write SetIdpessjurfg;
     Property Idpessjurcg: TCmDbField read FIdpessjurcg write SetIdpessjurcg;
     Property Idpessjur: TCmDbField read FIdpessjur write SetIdpessjur;
     Property Idgrupofunc: TCmDbField read FIdgrupofunc write SetIdgrupofunc;
     Property Idfuncao: TCmDbField read FIdfuncao write SetIdfuncao;
     Property Idcargoext: TCmDbField read FIdcargoext write SetIdcargoext;
     Property Flgsitpart: TCmDbField read FFlgsitpart write SetFlgsitpart;
     Property Datainicio: TCmDbField read FDatainicio write SetDatainicio;
     Property Datafinal: TCmDbField read FDatafinal write SetDatafinal;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbEvolfuncprev }

constructor TDbEvolfuncprev.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'EVOLFUNCPREV';

   fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,True,'');
   fTrgdtinclusao := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,False,False,False,True,'');
   fSeqhistfunc := CreateCmDbField('SEQHISTFUNC',ftfloat,True,True,False,True,'');
   fQtdeminutos := CreateCmDbField('QTDEMINUTOS',ftfloat,False,False,False,True,'');
   fPerc2ac := CreateCmDbField('PERC2AC',ftfloat,False,False,False,True,'');
   fPerc1ac := CreateCmDbField('PERC1AC',ftfloat,False,False,False,True,'');
   fPercpericul := CreateCmDbField('PERCPERICUL',ftfloat,False,False,False,True,'');
   fPercinsalub := CreateCmDbField('PERCINSALUB',ftfloat,False,False,False,True,'');
   fPercfuncao := CreateCmDbField('PERCFUNCAO',ftfloat,False,False,False,True,'');
   fPercats := CreateCmDbField('PERCATS',ftfloat,False,False,False,True,'');
   fPercadnot := CreateCmDbField('PERCADNOT',ftfloat,False,False,False,True,'');
   fPercadicionalnot := CreateCmDbField('PERCADICIONALNOT',ftfloat,False,False,False,True,'');
   fOrigem := CreateCmDbField('ORIGEM',ftString,False,False,False,True,'');
   fModofuncao := CreateCmDbField('MODOFUNCAO',ftString,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fIdpessjurgr := CreateCmDbField('IDPESSJURGR',ftfloat,False,False,False,True,'');
   fIdpessjurfg := CreateCmDbField('IDPESSJURFG',ftfloat,False,False,False,True,'');
   fIdpessjurcg := CreateCmDbField('IDPESSJURCG',ftfloat,False,False,False,True,'');
   fIdpessjur := CreateCmDbField('IDPESSJUR',ftfloat,True,True,False,True,'');
   fIdgrupofunc := CreateCmDbField('IDGRUPOFUNC',ftfloat,False,False,False,True,'');
   fIdfuncao := CreateCmDbField('IDFUNCAO',ftfloat,False,False,False,True,'');
   fIdcargoext := CreateCmDbField('IDCARGOEXT',ftfloat,False,False,False,True,'');
   fFlgsitpart := CreateCmDbField('FLGSITPART',ftString,False,False,False,True,'');
   fDatainicio := CreateCmDbField('DATAINICIO',ftDateTime,False,False,False,True,'');
   fDatafinal := CreateCmDbField('DATAFINAL',ftDateTime,False,False,False,True,'');
end;

function TDbEvolfuncprev.Insert: Boolean;
begin

   fSeqhistfunc.AsFloat := GetSequence('EVOLFUNCPREV');
   Result := Inherited Insert;

end;


procedure TDbEvolfuncprev.SetDatafinal(const Value: TCmDbField);
begin
  FDatafinal := Value;
end;

procedure TDbEvolfuncprev.SetDatainicio(const Value: TCmDbField);
begin
  FDatainicio := Value;
end;

procedure TDbEvolfuncprev.SetFlgsitpart(const Value: TCmDbField);
begin
  FFlgsitpart := Value;
end;

procedure TDbEvolfuncprev.SetIdcargoext(const Value: TCmDbField);
begin
  FIdcargoext := Value;
end;

procedure TDbEvolfuncprev.SetIdfuncao(const Value: TCmDbField);
begin
  FIdfuncao := Value;
end;

procedure TDbEvolfuncprev.SetIdgrupofunc(const Value: TCmDbField);
begin
  FIdgrupofunc := Value;
end;

procedure TDbEvolfuncprev.SetIdpessjur(const Value: TCmDbField);
begin
  FIdpessjur := Value;
end;

procedure TDbEvolfuncprev.SetIdpessjurcg(const Value: TCmDbField);
begin
  FIdpessjurcg := Value;
end;

procedure TDbEvolfuncprev.SetIdpessjurfg(const Value: TCmDbField);
begin
  FIdpessjurfg := Value;
end;

procedure TDbEvolfuncprev.SetIdpessjurgr(const Value: TCmDbField);
begin
  FIdpessjurgr := Value;
end;

procedure TDbEvolfuncprev.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbEvolfuncprev.SetModofuncao(const Value: TCmDbField);
begin
  FModofuncao := Value;
end;

procedure TDbEvolfuncprev.SetOrigem(const Value: TCmDbField);
begin
  FOrigem := Value;
end;

procedure TDbEvolfuncprev.SetPerc1ac(const Value: TCmDbField);
begin
  FPerc1ac := Value;
end;

procedure TDbEvolfuncprev.SetPerc2ac(const Value: TCmDbField);
begin
  FPerc2ac := Value;
end;

procedure TDbEvolfuncprev.SetPercadicionalnot(const Value: TCmDbField);
begin
  FPercadicionalnot := Value;
end;

procedure TDbEvolfuncprev.SetPercadnot(const Value: TCmDbField);
begin
  FPercadnot := Value;
end;

procedure TDbEvolfuncprev.SetPercats(const Value: TCmDbField);
begin
  FPercats := Value;
end;

procedure TDbEvolfuncprev.SetPercfuncao(const Value: TCmDbField);
begin
  FPercfuncao := Value;
end;

procedure TDbEvolfuncprev.SetPercinsalub(const Value: TCmDbField);
begin
  FPercinsalub := Value;
end;

procedure TDbEvolfuncprev.SetPercpericul(const Value: TCmDbField);
begin
  FPercpericul := Value;
end;

procedure TDbEvolfuncprev.SetQtdeminutos(const Value: TCmDbField);
begin
  FQtdeminutos := Value;
end;

procedure TDbEvolfuncprev.SetSeqhistfunc(const Value: TCmDbField);
begin
  FSeqhistfunc := Value;
end;

procedure TDbEvolfuncprev.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

procedure TDbEvolfuncprev.SetTrguserinclusao(const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;

end.



