// André Tavares - pendência 17624 - 09/11/2004 - criada a coluna CODTIPDOC para o relacinamento das tabelas RADGRAUTXGRRESPON x TIPODOCRECPAG
{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 23/12/2002                             }
{                                                       }
{*******************************************************}

unit uDbRadgrautxgrrespon;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbRadgrautxgrrespon = class(TCmDbObject)

  private
    FIdgrupoautoriza: TCmDbField;
    FUnidnegoc: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FMoecodigo: TCmDbField;
    FCodcentrorespon: TCmDbField;
    FIdgrprespon: TCmDbField;
    FVlrinicial: TCmDbField;
    FCodgrupoprod: TCmDbField;
    FNumautorizacao: TCmDbField;
    FSeqautorizacao: TCmDbField;
    FIdpessoa: TCmDbField;
    FVlrfinal: TCmDbField;
    FIdempresa: TCmDbField;
    FValorautoriza: TCmDbField;
    FCodTipDoc: TCmDbField;
    procedure SetCodcentrocusto(const Value: TCmDbField);
    procedure SetCodcentrorespon(const Value: TCmDbField);
    procedure SetCodgrupoprod(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdgrprespon(const Value: TCmDbField);
    procedure SetIdgrupoautoriza(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetMoecodigo(const Value: TCmDbField);
    procedure SetNumautorizacao(const Value: TCmDbField);
    procedure SetSeqautorizacao(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);
    procedure SetValorautoriza(const Value: TCmDbField);
    procedure SetVlrfinal(const Value: TCmDbField);
    procedure SetVlrinicial(const Value: TCmDbField);
    procedure SetCodTipDoc(const Value: TCmDbField);

  public

     Property Vlrinicial: TCmDbField read FVlrinicial write SetVlrinicial;
     Property Vlrfinal: TCmDbField read FVlrfinal write SetVlrfinal;
     Property Valorautoriza: TCmDbField read FValorautoriza write SetValorautoriza;
     Property Unidnegoc: TCmDbField read FUnidnegoc write SetUnidnegoc;
     Property Seqautorizacao: TCmDbField read FSeqautorizacao write SetSeqautorizacao;
     Property Numautorizacao: TCmDbField read FNumautorizacao write SetNumautorizacao;
     Property Moecodigo: TCmDbField read FMoecodigo write SetMoecodigo;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idgrupoautoriza: TCmDbField read FIdgrupoautoriza write SetIdgrupoautoriza;
     Property Idgrprespon: TCmDbField read FIdgrprespon write SetIdgrprespon;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Codgrupoprod: TCmDbField read FCodgrupoprod write SetCodgrupoprod;
     Property Codcentrorespon: TCmDbField read FCodcentrorespon write SetCodcentrorespon;
     Property Codcentrocusto: TCmDbField read FCodcentrocusto write SetCodcentrocusto;
     Property CodTipDoc: TCmDbField read FCodTipDoc write SetCodTipDoc; // André Tavares - pendência 17624 - 09/11/2004
     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbRadgrautxgrrespon }

constructor TDbRadgrautxgrrespon.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RADGRAUTXGRRESPON';

   fVlrinicial     := CreateCmDbField('VLRINICIAL',ftfloat,False,False,False,False,'');
   fVlrfinal       := CreateCmDbField('VLRFINAL',ftfloat,False,False,False,False,'');
   fValorautoriza  := CreateCmDbField('VALORAUTORIZA',ftfloat,False,False,False,False,'');
   fUnidnegoc      := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'');
   fSeqautorizacao := CreateCmDbField('SEQAUTORIZACAO',ftfloat,False,False,False,False,'');
   fNumautorizacao := CreateCmDbField('NUMAUTORIZACAO',ftfloat,False,False,False,False,'');
   fMoecodigo      := CreateCmDbField('MOECODIGO',ftfloat,False,False,False,True,'');
   fIdpessoa       := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdgrupoautoriza:= CreateCmDbField('IDGRUPOAUTORIZA',ftfloat,True,True,False,True,'');
   fIdgrprespon    := CreateCmDbField('IDGRPRESPON',ftfloat,True,True,False,True,'');
   fIdempresa      := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,True,'');
   fCodgrupoprod   := CreateCmDbField('CODGRUPOPROD',ftString,False,False,False,True,'');
   fCodcentrorespon:= CreateCmDbField('CODCENTRORESPON',ftString,False,False,False,True,'');
   fCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString,False,False,False,True,'');
   fCodTipDoc      := CreateCmDbField('CODTIPDOC',ftfloat,False,False,False,True,''); // André Tavares - pendência 17624 - 09/11/2004
end;

function TDbRadgrautxgrrespon.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDbRadgrautxgrrespon.SetCodcentrocusto(const Value: TCmDbField);
begin
  FCodcentrocusto := Value;
end;

procedure TDbRadgrautxgrrespon.SetCodcentrorespon(const Value: TCmDbField);
begin
  FCodcentrorespon := Value;
end;

procedure TDbRadgrautxgrrespon.SetCodgrupoprod(const Value: TCmDbField);
begin
  FCodgrupoprod := Value;
end;

procedure TDbRadgrautxgrrespon.SetCodTipDoc(const Value: TCmDbField);
begin
  FCodTipDoc := Value;
end;

procedure TDbRadgrautxgrrespon.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbRadgrautxgrrespon.SetIdgrprespon(const Value: TCmDbField);
begin
  FIdgrprespon := Value;
end;

procedure TDbRadgrautxgrrespon.SetIdgrupoautoriza(const Value: TCmDbField);
begin
  FIdgrupoautoriza := Value;
end;

procedure TDbRadgrautxgrrespon.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbRadgrautxgrrespon.SetMoecodigo(const Value: TCmDbField);
begin
  FMoecodigo := Value;
end;

procedure TDbRadgrautxgrrespon.SetNumautorizacao(const Value: TCmDbField);
begin
  FNumautorizacao := Value;
end;

procedure TDbRadgrautxgrrespon.SetSeqautorizacao(const Value: TCmDbField);
begin
  FSeqautorizacao := Value;
end;

procedure TDbRadgrautxgrrespon.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

procedure TDbRadgrautxgrrespon.SetValorautoriza(const Value: TCmDbField);
begin
  FValorautoriza := Value;
end;

procedure TDbRadgrautxgrrespon.SetVlrfinal(const Value: TCmDbField);
begin
  FVlrfinal := Value;
end;

procedure TDbRadgrautxgrrespon.SetVlrinicial(const Value: TCmDbField);
begin
  FVlrinicial := Value;
end;

end.



