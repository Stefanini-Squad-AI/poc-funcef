{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 17/07/2002                             }
{                                                       }
{*******************************************************}

unit uDbContribprevpartp;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbContribprevpartp = class(TCmDbObject)

  private
    FIdpessjur: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdcontribuicao: TCmDbField;
    FSeqproposta: TCmDbField;
    FAssoc2op2: TCmDbField;
    FValorbase3: TCmDbField;
    FAssoc2op1: TCmDbField;
    FAssoc3op2: TCmDbField;
    FValorbase2: TCmDbField;
    FAssoc3op3: TCmDbField;
    FAssoc1op2: TCmDbField;
    FAssoc2op3: TCmDbField;
    FValorassociado2: TCmDbField;
    FAssoc1op3: TCmDbField;
    FAssoc3op1: TCmDbField;
    FValorassociado3: TCmDbField;
    FIdplanoprev: TCmDbField;
    FValorassociado: TCmDbField;
    FAssoc1op1: TCmDbField;
    FValorbase1: TCmDbField;
    procedure SetAssoc1op1(const Value: TCmDbField);
    procedure SetAssoc1op2(const Value: TCmDbField);
    procedure SetAssoc1op3(const Value: TCmDbField);
    procedure SetAssoc2op1(const Value: TCmDbField);
    procedure SetAssoc2op2(const Value: TCmDbField);
    procedure SetAssoc2op3(const Value: TCmDbField);
    procedure SetAssoc3op1(const Value: TCmDbField);
    procedure SetAssoc3op2(const Value: TCmDbField);
    procedure SetAssoc3op3(const Value: TCmDbField);
    procedure SetIdcontribuicao(const Value: TCmDbField);
    procedure SetIdpessjur(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetSeqproposta(const Value: TCmDbField);
    procedure SetValorassociado(const Value: TCmDbField);
    procedure SetValorassociado2(const Value: TCmDbField);
    procedure SetValorassociado3(const Value: TCmDbField);
    procedure SetValorbase1(const Value: TCmDbField);
    procedure SetValorbase2(const Value: TCmDbField);
    procedure SetValorbase3(const Value: TCmDbField);

  public

     Property Valorbase3: TCmDbField read FValorbase3 write SetValorbase3;
     Property Valorbase2: TCmDbField read FValorbase2 write SetValorbase2;
     Property Valorbase1: TCmDbField read FValorbase1 write SetValorbase1;
     Property Valorassociado3: TCmDbField read FValorassociado3 write SetValorassociado3;
     Property Valorassociado2: TCmDbField read FValorassociado2 write SetValorassociado2;
     Property Valorassociado: TCmDbField read FValorassociado write SetValorassociado;
     Property Seqproposta: TCmDbField read FSeqproposta write SetSeqproposta;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idpessjur: TCmDbField read FIdpessjur write SetIdpessjur;
     Property Idcontribuicao: TCmDbField read FIdcontribuicao write SetIdcontribuicao;
     Property Assoc3op3: TCmDbField read FAssoc3op3 write SetAssoc3op3;
     Property Assoc3op2: TCmDbField read FAssoc3op2 write SetAssoc3op2;
     Property Assoc3op1: TCmDbField read FAssoc3op1 write SetAssoc3op1;
     Property Assoc2op3: TCmDbField read FAssoc2op3 write SetAssoc2op3;
     Property Assoc2op2: TCmDbField read FAssoc2op2 write SetAssoc2op2;
     Property Assoc2op1: TCmDbField read FAssoc2op1 write SetAssoc2op1;
     Property Assoc1op3: TCmDbField read FAssoc1op3 write SetAssoc1op3;
     Property Assoc1op2: TCmDbField read FAssoc1op2 write SetAssoc1op2;
     Property Assoc1op1: TCmDbField read FAssoc1op1 write SetAssoc1op1;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbContribprevpartp }

constructor TDbContribprevpartp.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CONTRIBPREVPARTP';

   fValorbase3 := CreateCmDbField('VALORBASE3',ftfloat,False,False,False,True,'');
   fValorbase2 := CreateCmDbField('VALORBASE2',ftfloat,False,False,False,True,'');
   fValorbase1 := CreateCmDbField('VALORBASE1',ftfloat,False,False,False,True,'');
   fValorassociado3 := CreateCmDbField('VALORASSOCIADO3',ftfloat,False,False,False,True,'');
   fValorassociado2 := CreateCmDbField('VALORASSOCIADO2',ftfloat,False,False,False,True,'');
   fValorassociado := CreateCmDbField('VALORASSOCIADO',ftfloat,False,False,False,True,'');
   fSeqproposta := CreateCmDbField('SEQPROPOSTA',ftfloat,True,True,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,True,True,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fIdpessjur := CreateCmDbField('IDPESSJUR',ftfloat,True,True,False,True,'');
   fIdcontribuicao := CreateCmDbField('IDCONTRIBUICAO',ftfloat,True,True,False,True,'');
   fAssoc3op3 := CreateCmDbField('ASSOC3OP3',ftfloat,False,False,False,True,'');
   fAssoc3op2 := CreateCmDbField('ASSOC3OP2',ftfloat,False,False,False,True,'');
   fAssoc3op1 := CreateCmDbField('ASSOC3OP1',ftfloat,False,False,False,True,'');
   fAssoc2op3 := CreateCmDbField('ASSOC2OP3',ftfloat,False,False,False,True,'');
   fAssoc2op2 := CreateCmDbField('ASSOC2OP2',ftfloat,False,False,False,True,'');
   fAssoc2op1 := CreateCmDbField('ASSOC2OP1',ftfloat,False,False,False,True,'');
   fAssoc1op3 := CreateCmDbField('ASSOC1OP3',ftfloat,False,False,False,True,'');
   fAssoc1op2 := CreateCmDbField('ASSOC1OP2',ftfloat,False,False,False,True,'');
   fAssoc1op1 := CreateCmDbField('ASSOC1OP1',ftfloat,False,False,False,True,'');
end;

function TDbContribprevpartp.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDbContribprevpartp.SetAssoc1op1(const Value: TCmDbField);
begin
  FAssoc1op1 := Value;
end;

procedure TDbContribprevpartp.SetAssoc1op2(const Value: TCmDbField);
begin
  FAssoc1op2 := Value;
end;

procedure TDbContribprevpartp.SetAssoc1op3(const Value: TCmDbField);
begin
  FAssoc1op3 := Value;
end;

procedure TDbContribprevpartp.SetAssoc2op1(const Value: TCmDbField);
begin
  FAssoc2op1 := Value;
end;

procedure TDbContribprevpartp.SetAssoc2op2(const Value: TCmDbField);
begin
  FAssoc2op2 := Value;
end;

procedure TDbContribprevpartp.SetAssoc2op3(const Value: TCmDbField);
begin
  FAssoc2op3 := Value;
end;

procedure TDbContribprevpartp.SetAssoc3op1(const Value: TCmDbField);
begin
  FAssoc3op1 := Value;
end;

procedure TDbContribprevpartp.SetAssoc3op2(const Value: TCmDbField);
begin
  FAssoc3op2 := Value;
end;

procedure TDbContribprevpartp.SetAssoc3op3(const Value: TCmDbField);
begin
  FAssoc3op3 := Value;
end;

procedure TDbContribprevpartp.SetIdcontribuicao(const Value: TCmDbField);
begin
  FIdcontribuicao := Value;
end;

procedure TDbContribprevpartp.SetIdpessjur(const Value: TCmDbField);
begin
  FIdpessjur := Value;
end;

procedure TDbContribprevpartp.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbContribprevpartp.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbContribprevpartp.SetSeqproposta(const Value: TCmDbField);
begin
  FSeqproposta := Value;
end;

procedure TDbContribprevpartp.SetValorassociado(const Value: TCmDbField);
begin
  FValorassociado := Value;
end;

procedure TDbContribprevpartp.SetValorassociado2(const Value: TCmDbField);
begin
  FValorassociado2 := Value;
end;

procedure TDbContribprevpartp.SetValorassociado3(const Value: TCmDbField);
begin
  FValorassociado3 := Value;
end;

procedure TDbContribprevpartp.SetValorbase1(const Value: TCmDbField);
begin
  FValorbase1 := Value;
end;

procedure TDbContribprevpartp.SetValorbase2(const Value: TCmDbField);
begin
  FValorbase2 := Value;
end;

procedure TDbContribprevpartp.SetValorbase3(const Value: TCmDbField);
begin
  FValorbase3 := Value;
end;

end.



