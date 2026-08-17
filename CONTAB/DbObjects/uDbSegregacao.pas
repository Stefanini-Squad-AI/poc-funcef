{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Alex Pereira                    }
{ Atualizado Em: 05/02/2004                             }
{                                                       }
{*******************************************************}
(*==============================================================================
Analista : Alex Pereira
Rotina   : Divs
Data     : 05/11/2004
Pendência: 17193
Solução  : Ajustando o Objeto para segregação dos planos: "Comum" e "Administrativo"
           Nova estrutura: IDPLANOPREV
==============================================================================*)

unit uDbSegregacao;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbSegregacao = class(TCmDbObject)

  private
    FPerexercicio: TCmDbField;
    FPernumero: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdsegregacao: TCmDbField;
    FIdsegregacriter: TCmDbField;
    FPlncodigo: TCmDbField;
    FIdplanoprev: TCmDbField;
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdsegregacao(const Value: TCmDbField);
    procedure SetIdsegregacriter(const Value: TCmDbField);
    procedure SetPerexercicio(const Value: TCmDbField);
    procedure SetPernumero(const Value: TCmDbField);
    procedure SetPlncodigo(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);

  public

     Property Plncodigo: TCmDbField read FPlncodigo write SetPlncodigo;
     Property Pernumero: TCmDbField read FPernumero write SetPernumero;
     Property Perexercicio: TCmDbField read FPerexercicio write SetPerexercicio;
     Property Idsegregacriter: TCmDbField read FIdsegregacriter write SetIdsegregacriter;
     Property Idsegregacao: TCmDbField read FIdsegregacao write SetIdsegregacao;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     // Alex 05/11/04 17193
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbSegregacao }

constructor TDbSegregacao.Create(Aowner: TCmCustomCdbObject);
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
   // Alex 05/11/04 17193
   FIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,False,False,True,'');
end;

function TDbSegregacao.Insert: Boolean;
begin

   FIdsegregacao.AsFloat := GetSequence('IDSEGREGACAO');
   Result := Inherited Insert;

end;


procedure TDbSegregacao.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbSegregacao.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbSegregacao.SetIdsegregacao(const Value: TCmDbField);
begin
  FIdsegregacao := Value;
end;

procedure TDbSegregacao.SetIdsegregacriter(const Value: TCmDbField);
begin
  FIdsegregacriter := Value;
end;

procedure TDbSegregacao.SetPerexercicio(const Value: TCmDbField);
begin
  FPerexercicio := Value;
end;

procedure TDbSegregacao.SetPernumero(const Value: TCmDbField);
begin
  FPernumero := Value;
end;

procedure TDbSegregacao.SetPlncodigo(const Value: TCmDbField);
begin
  FPlncodigo := Value;
end;

end.



