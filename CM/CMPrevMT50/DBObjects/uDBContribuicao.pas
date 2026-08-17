{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 17/08/2007                             }
{                                                       }
{*******************************************************}

unit uDBContribuicao;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDBContribuicao = class(TCmDbObject)

  private
    FQtdeparcelas: TCmDbField;
    FIdrgvlrreserva: TCmDbField;
    FIdtpcontribuicao: TCmDbField;
    FFlgobrigatoria: TCmDbField;
    FNome: TCmDbField;
    FFlgrisco: TCmDbField;
    FIdcontribtotal: TCmDbField;
    FIdbeneficio: TCmDbField;
    FIdtpperiodicidade: TCmDbField;
    FIdcontribpai: TCmDbField;
    FNomeresum: TCmDbField;
    FIdcontribuicao: TCmDbField;
    procedure SetFlgobrigatoria(const Value: TCmDbField);
    procedure SetFlgrisco(const Value: TCmDbField);
    procedure SetIdbeneficio(const Value: TCmDbField);
    procedure SetIdcontribpai(const Value: TCmDbField);
    procedure SetIdcontribtotal(const Value: TCmDbField);
    procedure SetIdcontribuicao(const Value: TCmDbField);
    procedure SetIdrgvlrreserva(const Value: TCmDbField);
    procedure SetIdtpcontribuicao(const Value: TCmDbField);
    procedure SetIdtpperiodicidade(const Value: TCmDbField);
    procedure SetNome(const Value: TCmDbField);
    procedure SetNomeresum(const Value: TCmDbField);
    procedure SetQtdeparcelas(const Value: TCmDbField);

  public

     Property Qtdeparcelas: TCmDbField read FQtdeparcelas write SetQtdeparcelas;
     Property Nomeresum: TCmDbField read FNomeresum write SetNomeresum;
     Property Nome: TCmDbField read FNome write SetNome;
     Property Idtpperiodicidade: TCmDbField read FIdtpperiodicidade write SetIdtpperiodicidade;
     Property Idtpcontribuicao: TCmDbField read FIdtpcontribuicao write SetIdtpcontribuicao;
     Property Idrgvlrreserva: TCmDbField read FIdrgvlrreserva write SetIdrgvlrreserva;
     Property Idcontribuicao: TCmDbField read FIdcontribuicao write SetIdcontribuicao;
     Property Idcontribtotal: TCmDbField read FIdcontribtotal write SetIdcontribtotal;
     Property Idcontribpai: TCmDbField read FIdcontribpai write SetIdcontribpai;
     Property Idbeneficio: TCmDbField read FIdbeneficio write SetIdbeneficio;
     Property Flgrisco: TCmDbField read FFlgrisco write SetFlgrisco;
     Property Flgobrigatoria: TCmDbField read FFlgobrigatoria write SetFlgobrigatoria;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDBContribuicao }

constructor TDBContribuicao.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CONTRIBUICAO';

   fQtdeparcelas := CreateCmDbField('QTDEPARCELAS',ftfloat,False,False,False,True,'');
   fNomeresum := CreateCmDbField('NOMERESUM',ftString,False,False,False,True,'');
   fNome := CreateCmDbField('NOME',ftString,False,False,False,True,'');
   fIdtpperiodicidade := CreateCmDbField('IDTPPERIODICIDADE',ftfloat,False,False,False,True,'');
   fIdtpcontribuicao := CreateCmDbField('IDTPCONTRIBUICAO',ftfloat,False,False,False,True,'');
   fIdrgvlrreserva := CreateCmDbField('IDRGVLRRESERVA',ftfloat,False,False,False,True,'');
   fIdcontribuicao := CreateCmDbField('IDCONTRIBUICAO',ftfloat,True,True,False,True,'');
   fIdcontribtotal := CreateCmDbField('IDCONTRIBTOTAL',ftfloat,False,False,False,True,'');
   fIdcontribpai := CreateCmDbField('IDCONTRIBPAI',ftfloat,False,False,False,True,'');
   fIdbeneficio := CreateCmDbField('IDBENEFICIO',ftfloat,False,False,False,True,'');
   fFlgrisco := CreateCmDbField('FLGRISCO',ftfloat,False,False,False,True,'');
   fFlgobrigatoria := CreateCmDbField('FLGOBRIGATORIA',ftString,False,False,False,True,'');
end;

function TDBContribuicao.Insert: Boolean;
begin

   fIdcontribuicao.AsFloat := GetSequence('CONTRIBUICAO');
   Result := Inherited Insert;

end;


procedure TDBContribuicao.SetFlgobrigatoria(const Value: TCmDbField);
begin
  FFlgobrigatoria := Value;
end;

procedure TDBContribuicao.SetFlgrisco(const Value: TCmDbField);
begin
  FFlgrisco := Value;
end;

procedure TDBContribuicao.SetIdbeneficio(const Value: TCmDbField);
begin
  FIdbeneficio := Value;
end;

procedure TDBContribuicao.SetIdcontribpai(const Value: TCmDbField);
begin
  FIdcontribpai := Value;
end;

procedure TDBContribuicao.SetIdcontribtotal(const Value: TCmDbField);
begin
  FIdcontribtotal := Value;
end;

procedure TDBContribuicao.SetIdcontribuicao(const Value: TCmDbField);
begin
  FIdcontribuicao := Value;
end;

procedure TDBContribuicao.SetIdrgvlrreserva(const Value: TCmDbField);
begin
  FIdrgvlrreserva := Value;
end;

procedure TDBContribuicao.SetIdtpcontribuicao(const Value: TCmDbField);
begin
  FIdtpcontribuicao := Value;
end;

procedure TDBContribuicao.SetIdtpperiodicidade(const Value: TCmDbField);
begin
  FIdtpperiodicidade := Value;
end;

procedure TDBContribuicao.SetNome(const Value: TCmDbField);
begin
  FNome := Value;
end;

procedure TDBContribuicao.SetNomeresum(const Value: TCmDbField);
begin
  FNomeresum := Value;
end;

procedure TDBContribuicao.SetQtdeparcelas(const Value: TCmDbField);
begin
  FQtdeparcelas := Value;
end;

end.



