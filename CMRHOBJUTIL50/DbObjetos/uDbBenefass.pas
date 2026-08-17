{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Eugenio Frioli                  }
{ Atualizado Em: 29/03/2004                             }
{                                                       }
{*******************************************************}

unit uDbBenefass;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDbBenefass = class(TCmDbObject)

  private
    FIdpessjur: TCmDbField;
    FPercpagmto: TCmDbField;
    FDtcancelamento: TCmDbField;
    FTipo: TCmDbField;
    FIdtitular: TCmDbField;
    FResponsavelpag: TCmDbField;
    FIdplanass: TCmDbField;
    FObscancel: TCmDbField;
    FSeqproposta: TCmDbField;
    FIdplanoprev: TCmDbField;
    FFlgativo: TCmDbField;
    FDataentrada: TCmDbField;
    FIddependente: TCmDbField;
    procedure SetDataentrada(const Value: TCmDbField);
    procedure SetDtcancelamento(const Value: TCmDbField);
    procedure SetFlgativo(const Value: TCmDbField);
    procedure SetIddependente(const Value: TCmDbField);
    procedure SetIdpessjur(const Value: TCmDbField);
    procedure SetIdplanass(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetIdtitular(const Value: TCmDbField);
    procedure SetObscancel(const Value: TCmDbField);
    procedure SetPercpagmto(const Value: TCmDbField);
    procedure SetResponsavelpag(const Value: TCmDbField);
    procedure SetSeqproposta(const Value: TCmDbField);
    procedure SetTipo(const Value: TCmDbField);

  public

     Property Tipo: TCmDbField read FTipo write SetTipo;
     Property Seqproposta: TCmDbField read FSeqproposta write SetSeqproposta;
     Property Responsavelpag: TCmDbField read FResponsavelpag write SetResponsavelpag;
     Property Percpagmto: TCmDbField read FPercpagmto write SetPercpagmto;
     Property Obscancel: TCmDbField read FObscancel write SetObscancel;
     Property Idtitular: TCmDbField read FIdtitular write SetIdtitular;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idplanass: TCmDbField read FIdplanass write SetIdplanass;
     Property Idpessjur: TCmDbField read FIdpessjur write SetIdpessjur;
     Property Iddependente: TCmDbField read FIddependente write SetIddependente;
     Property Flgativo: TCmDbField read FFlgativo write SetFlgativo;
     Property Dtcancelamento: TCmDbField read FDtcancelamento write SetDtcancelamento;
     Property Dataentrada: TCmDbField read FDataentrada write SetDataentrada;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

  End;

implementation

{ TDbBenefass }

constructor TDbBenefass.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'BENEFASS';

   fTipo := CreateCmDbField('TIPO',ftString,False,False,False,True,'');
   fSeqproposta := CreateCmDbField('SEQPROPOSTA',ftfloat,True,True,False,False,'');
   fResponsavelpag := CreateCmDbField('RESPONSAVELPAG',ftfloat,True,False,False,False,'');
   fPercpagmto := CreateCmDbField('PERCPAGMTO',ftfloat,False,False,False,False,'');
   fObscancel := CreateCmDbField('OBSCANCEL',ftString,False,False,False,True,'');
   fIdtitular := CreateCmDbField('IDTITULAR',ftfloat,True,True,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,True,True,False,True,'');
   fIdplanass := CreateCmDbField('IDPLANASS',ftfloat,True,True,False,True,'');
   fIdpessjur := CreateCmDbField('IDPESSJUR',ftfloat,True,True,False,True,'');
   fIddependente := CreateCmDbField('IDDEPENDENTE',ftfloat,True,True,False,True,'');
   fFlgativo := CreateCmDbField('FLGATIVO',ftfloat,False,False,False,False,'');
   fDtcancelamento := CreateCmDbField('DTCANCELAMENTO',ftDateTime,False,False,False,True,'');
   fDataentrada := CreateCmDbField('DATAENTRADA',ftDateTime,True,False,False,True,'');
end;

procedure TDbBenefass.SetDataentrada(const Value: TCmDbField);
begin
  FDataentrada := Value;
end;

procedure TDbBenefass.SetDtcancelamento(const Value: TCmDbField);
begin
  FDtcancelamento := Value;
end;

procedure TDbBenefass.SetFlgativo(const Value: TCmDbField);
begin
  FFlgativo := Value;
end;

procedure TDbBenefass.SetIddependente(const Value: TCmDbField);
begin
  FIddependente := Value;
end;

procedure TDbBenefass.SetIdpessjur(const Value: TCmDbField);
begin
  FIdpessjur := Value;
end;

procedure TDbBenefass.SetIdplanass(const Value: TCmDbField);
begin
  FIdplanass := Value;
end;

procedure TDbBenefass.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbBenefass.SetIdtitular(const Value: TCmDbField);
begin
  FIdtitular := Value;
end;

procedure TDbBenefass.SetObscancel(const Value: TCmDbField);
begin
  FObscancel := Value;
end;

procedure TDbBenefass.SetPercpagmto(const Value: TCmDbField);
begin
  FPercpagmto := Value;
end;

procedure TDbBenefass.SetResponsavelpag(const Value: TCmDbField);
begin
  FResponsavelpag := Value;
end;

procedure TDbBenefass.SetSeqproposta(const Value: TCmDbField);
begin
  FSeqproposta := Value;
end;

procedure TDbBenefass.SetTipo(const Value: TCmDbField);
begin
  FTipo := Value;
end;

end.



