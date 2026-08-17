{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Eugenio Frioli                  }
{ Atualizado Em: 29/03/2004                             }
{                                                       }
{*******************************************************}

unit uDbPartass;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDbPartass = class(TCmDbObject)

  private
    FObscancel: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdplanass: TCmDbField;
    FFlgpartbenef: TCmDbField;
    FInscricaonumero: TCmDbField;
    FDatacancelamento: TCmDbField;
    FIdnucleo: TCmDbField;
    FFlginscricaocanc: TCmDbField;
    FSeqproposta: TCmDbField;
    FInscricaotipo: TCmDbField;
    FDataentrada: TCmDbField;
    FIdpessjur: TCmDbField;
    FOpcaob: TCmDbField;
    FIdsitpart: TCmDbField;
    FIdplanoprev: TCmDbField;
    FOpcaoa: TCmDbField;
    procedure SetDatacancelamento(const Value: TCmDbField);
    procedure SetDataentrada(const Value: TCmDbField);
    procedure SetFlginscricaocanc(const Value: TCmDbField);
    procedure SetFlgpartbenef(const Value: TCmDbField);
    procedure SetIdnucleo(const Value: TCmDbField);
    procedure SetIdpessjur(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdplanass(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetIdsitpart(const Value: TCmDbField);
    procedure SetInscricaonumero(const Value: TCmDbField);
    procedure SetInscricaotipo(const Value: TCmDbField);
    procedure SetObscancel(const Value: TCmDbField);
    procedure SetOpcaoa(const Value: TCmDbField);
    procedure SetOpcaob(const Value: TCmDbField);
    procedure SetSeqproposta(const Value: TCmDbField);

  public

     Property Seqproposta: TCmDbField read FSeqproposta write SetSeqproposta;
     Property Opcaob: TCmDbField read FOpcaob write SetOpcaob;
     Property Opcaoa: TCmDbField read FOpcaoa write SetOpcaoa;
     Property Obscancel: TCmDbField read FObscancel write SetObscancel;
     Property Inscricaotipo: TCmDbField read FInscricaotipo write SetInscricaotipo;
     Property Inscricaonumero: TCmDbField read FInscricaonumero write SetInscricaonumero;
     Property Idsitpart: TCmDbField read FIdsitpart write SetIdsitpart;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idplanass: TCmDbField read FIdplanass write SetIdplanass;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idpessjur: TCmDbField read FIdpessjur write SetIdpessjur;
     Property Idnucleo: TCmDbField read FIdnucleo write SetIdnucleo;
     Property Flgpartbenef: TCmDbField read FFlgpartbenef write SetFlgpartbenef;
     Property Flginscricaocanc: TCmDbField read FFlginscricaocanc write SetFlginscricaocanc;
     Property Dataentrada: TCmDbField read FDataentrada write SetDataentrada;
     Property Datacancelamento: TCmDbField read FDatacancelamento write SetDatacancelamento;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

  End;

implementation

{ TDbPartass }

constructor TDbPartass.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PARTASS';

   fSeqproposta := CreateCmDbField('SEQPROPOSTA',ftfloat,True,True,False,False,'');
   fOpcaob := CreateCmDbField('OPCAOB',ftString,False,False,False,True,'');
   fOpcaoa := CreateCmDbField('OPCAOA',ftString,False,False,False,True,'');
   fObscancel := CreateCmDbField('OBSCANCEL',ftString,False,False,False,True,'');
   fInscricaotipo := CreateCmDbField('INSCRICAOTIPO',ftString,False,False,False,True,'');
   fInscricaonumero := CreateCmDbField('INSCRICAONUMERO',ftString,False,False,False,True,'');
   fIdsitpart := CreateCmDbField('IDSITPART',ftfloat,False,False,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,True,True,False,True,'');
   fIdplanass := CreateCmDbField('IDPLANASS',ftfloat,True,True,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fIdpessjur := CreateCmDbField('IDPESSJUR',ftfloat,True,True,False,True,'');
   fIdnucleo := CreateCmDbField('IDNUCLEO',ftfloat,False,False,False,True,'');
   fFlgpartbenef := CreateCmDbField('FLGPARTBENEF',ftString,False,False,False,True,'');
   fFlginscricaocanc := CreateCmDbField('FLGINSCRICAOCANC',ftfloat,False,False,False,False,'');
   fDataentrada := CreateCmDbField('DATAENTRADA',ftDateTime,False,False,False,True,'');
   fDatacancelamento := CreateCmDbField('DATACANCELAMENTO',ftDateTime,False,False,False,True,'');
end;

procedure TDbPartass.SetDatacancelamento(const Value: TCmDbField);
begin
  FDatacancelamento := Value;
end;

procedure TDbPartass.SetDataentrada(const Value: TCmDbField);
begin
  FDataentrada := Value;
end;

procedure TDbPartass.SetFlginscricaocanc(const Value: TCmDbField);
begin
  FFlginscricaocanc := Value;
end;

procedure TDbPartass.SetFlgpartbenef(const Value: TCmDbField);
begin
  FFlgpartbenef := Value;
end;

procedure TDbPartass.SetIdnucleo(const Value: TCmDbField);
begin
  FIdnucleo := Value;
end;

procedure TDbPartass.SetIdpessjur(const Value: TCmDbField);
begin
  FIdpessjur := Value;
end;

procedure TDbPartass.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbPartass.SetIdplanass(const Value: TCmDbField);
begin
  FIdplanass := Value;
end;

procedure TDbPartass.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbPartass.SetIdsitpart(const Value: TCmDbField);
begin
  FIdsitpart := Value;
end;

procedure TDbPartass.SetInscricaonumero(const Value: TCmDbField);
begin
  FInscricaonumero := Value;
end;

procedure TDbPartass.SetInscricaotipo(const Value: TCmDbField);
begin
  FInscricaotipo := Value;
end;

procedure TDbPartass.SetObscancel(const Value: TCmDbField);
begin
  FObscancel := Value;
end;

procedure TDbPartass.SetOpcaoa(const Value: TCmDbField);
begin
  FOpcaoa := Value;
end;

procedure TDbPartass.SetOpcaob(const Value: TCmDbField);
begin
  FOpcaob := Value;
end;

procedure TDbPartass.SetSeqproposta(const Value: TCmDbField);
begin
  FSeqproposta := Value;
end;

end.



