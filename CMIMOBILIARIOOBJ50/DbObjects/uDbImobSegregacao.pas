{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Alex Pereira                    }
{ Atualizado Em: 05/02/2004                             }
{                                                       }
{*******************************************************}

unit uDbImobSegregacao;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbImobSegregacao = class(TCmDbObject)

  private
    FPerexercicio: TCmDbField;
    FPernumero: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdsegregacao: TCmDbField;
    FIdsegregacriter: TCmDbField;
    FPlncodigo: TCmDbField;
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdsegregacao(const Value: TCmDbField);
    procedure SetIdsegregacriter(const Value: TCmDbField);
    procedure SetPerexercicio(const Value: TCmDbField);
    procedure SetPernumero(const Value: TCmDbField);
    procedure SetPlncodigo(const Value: TCmDbField);

  public

     Property Plncodigo: TCmDbField read FPlncodigo write SetPlncodigo;
     Property Pernumero: TCmDbField read FPernumero write SetPernumero;
     Property Perexercicio: TCmDbField read FPerexercicio write SetPerexercicio;
     Property Idsegregacriter: TCmDbField read FIdsegregacriter write SetIdsegregacriter;
     Property Idsegregacao: TCmDbField read FIdsegregacao write SetIdsegregacao;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbImobSegregacao }

constructor TDbImobSegregacao.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'SEGREGACAO';

   fPlncodigo := CreateCmDbField('PLNCODIGO',ftfloat,False,False,False,True,'');
   fPernumero := CreateCmDbField('PERNUMERO',ftfloat,False,False,False,True,'');
   fPerexercicio := CreateCmDbField('PEREXERCICIO',ftfloat,False,False,False,True,'');
   fIdsegregacriter := CreateCmDbField('IDSEGREGACRITER',ftfloat,False,False,False,True,'');
   fIdsegregacao := CreateCmDbField('IDSEGREGACAO',ftfloat,True,True,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
end;

function TDbImobSegregacao.Insert: Boolean;
begin

   FIdsegregacao.AsFloat := GetSequence('IDSEGREGACAO');
   Result := Inherited Insert;

end;


procedure TDbImobSegregacao.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbImobSegregacao.SetIdsegregacao(const Value: TCmDbField);
begin
  FIdsegregacao := Value;
end;

procedure TDbImobSegregacao.SetIdsegregacriter(const Value: TCmDbField);
begin
  FIdsegregacriter := Value;
end;

procedure TDbImobSegregacao.SetPerexercicio(const Value: TCmDbField);
begin
  FPerexercicio := Value;
end;

procedure TDbImobSegregacao.SetPernumero(const Value: TCmDbField);
begin
  FPernumero := Value;
end;

procedure TDbImobSegregacao.SetPlncodigo(const Value: TCmDbField);
begin
  FPlncodigo := Value;
end;

end.



