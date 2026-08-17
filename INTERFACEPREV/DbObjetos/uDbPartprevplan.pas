{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 17/07/2002                             }
{                                                       }
{*******************************************************}

unit uDbPartprevplan;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbPartprevplan = class(TCmDbObject)

  private
    FIdsitpart: TCmDbField;
    FIdpessjur: TCmDbField;
    FSalinscricao: TCmDbField;
    FIdplanoprev: TCmDbField;
    FSeqproposta: TCmDbField;
    FIdpessoa: TCmDbField;
    FSalmantido: TCmDbField;
    FInscricaonumero: TCmDbField;
    FSalpartic13: TCmDbField;
    FSalparticipacao: TCmDbField;
    procedure SetIdpessjur(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetIdsitpart(const Value: TCmDbField);
    procedure SetInscricaonumero(const Value: TCmDbField);
    procedure SetSalinscricao(const Value: TCmDbField);
    procedure SetSalmantido(const Value: TCmDbField);
    procedure SetSalpartic13(const Value: TCmDbField);
    procedure SetSalparticipacao(const Value: TCmDbField);
    procedure SetSeqproposta(const Value: TCmDbField);

  public

     Property Seqproposta: TCmDbField read FSeqproposta write SetSeqproposta;
     Property Salpartic13: TCmDbField read FSalpartic13 write SetSalpartic13;
     Property Salparticipacao: TCmDbField read FSalparticipacao write SetSalparticipacao;
     Property Salmantido: TCmDbField read FSalmantido write SetSalmantido;
     Property Salinscricao: TCmDbField read FSalinscricao write SetSalinscricao;
     Property Inscricaonumero: TCmDbField read FInscricaonumero write SetInscricaonumero;
     Property Idsitpart: TCmDbField read FIdsitpart write SetIdsitpart;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idpessjur: TCmDbField read FIdpessjur write SetIdpessjur;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbPartprevplan }

constructor TDbPartprevplan.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PARTPREVPLAN';

   fSeqproposta := CreateCmDbField('SEQPROPOSTA',ftfloat,True,True,False,True,'');
   fSalpartic13 := CreateCmDbField('SALPARTIC13',ftfloat,False,False,False,True,'');
   fSalparticipacao := CreateCmDbField('SALPARTICIPACAO',ftfloat,False,False,False,True,'');
   fSalmantido := CreateCmDbField('SALMANTIDO',ftfloat,False,False,False,True,'');
   fSalinscricao := CreateCmDbField('SALINSCRICAO',ftfloat,False,False,False,True,'');
   fInscricaonumero := CreateCmDbField('INSCRICAONUMERO',ftfloat,False,False,False,True,'');
   fIdsitpart := CreateCmDbField('IDSITPART',ftfloat,True,False,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,True,True,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fIdpessjur := CreateCmDbField('IDPESSJUR',ftfloat,True,True,False,True,'');
end;

function TDbPartprevplan.Insert: Boolean;
begin


   Result := Inherited Insert;

end;


procedure TDbPartprevplan.SetIdpessjur(const Value: TCmDbField);
begin
  FIdpessjur := Value;
end;

procedure TDbPartprevplan.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbPartprevplan.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbPartprevplan.SetIdsitpart(const Value: TCmDbField);
begin
  FIdsitpart := Value;
end;

procedure TDbPartprevplan.SetInscricaonumero(const Value: TCmDbField);
begin
  FInscricaonumero := Value;
end;

procedure TDbPartprevplan.SetSalinscricao(const Value: TCmDbField);
begin
  FSalinscricao := Value;
end;

procedure TDbPartprevplan.SetSalmantido(const Value: TCmDbField);
begin
  FSalmantido := Value;
end;

procedure TDbPartprevplan.SetSalpartic13(const Value: TCmDbField);
begin
  FSalpartic13 := Value;
end;

procedure TDbPartprevplan.SetSalparticipacao(const Value: TCmDbField);
begin
  FSalparticipacao := Value;
end;

procedure TDbPartprevplan.SetSeqproposta(const Value: TCmDbField);
begin
  FSeqproposta := Value;
end;

end.



