{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Veronica L. M. Almeida          }
{ Atualizado Em: 11/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbEventoSRH;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbEventosRh = class(TCmDbObject)

  private
    FCodevento   : TCmDbField;
    FHitcodhist  : TCmDbField;
    FIdpessoa    : TCmDbField;
    FUnidnegoc   : TCmDbField;
    FSubcontaDeb : TCmDbField;
    FContacre    : TCmDbField;
    FPlano       : TCmDbField;
    FContaDeb    : TCmDbField;
    FDescricao   : TCmDbField;
    FSubcontacre : TCmDbField;
    procedure SetCodevento(const Value: TCmDbField);
    procedure SetHitcodhist(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);
    procedure SetSubcontaDeb(const Value: TCmDbField);
    procedure SetContacre(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetContaDeb(const Value: TCmDbField);
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetSubcontacre(const Value: TCmDbField);

  public

     Property Codevento  : TCmDbField read FCodevento   write SetCodevento;
     Property Hitcodhist : TCmDbField read FHitcodhist  write SetHitcodhist;
     Property Idpessoa   : TCmDbField read FIdpessoa    write SetIdpessoa;
     Property Unidnegoc  : TCmDbField read FUnidnegoc   write SetUnidnegoc;
     Property SubcontaDeb: TCmDbField read FSubcontaDeb write SetSubcontaDeb;
     Property Contacre   : TCmDbField read FContacre    write SetContacre;
     Property Plano      : TCmDbField read FPlano       write SetPlano;
     Property ContaDeb   : TCmDbField read FContaDeb    write SetContaDeb;
     Property Descricao  : TCmDbField read FDescricao   write SetDescricao;
     Property Subcontacre: TCmDbField read FSubcontacre write SetSubcontacre;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert     :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbPeriodo }

constructor TDbEventosRh.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;

  ErrorIfNoRowsAffected := False;

  TableName := 'CADEVENTOSRH';

  fCodevento   := CreateCmDbField('CODEVENTO',ftString,True,True,False);
  fHitcodhist  := CreateCmDbField('HITCODHIST',ftString);
  fIdpessoa    := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True);
  fUnidnegoc   := CreateCmDbField('UNIDNEGOC',ftFloat,False,False,True);
  fSubcontaDeb := CreateCmDbField('SUBCONTADEB',ftFloat,False,False,True);
  fContacre    := CreateCmDbField('CONTACRE',ftString);
  fPlano       := CreateCmDbField('PLANO',ftFloat,False,False,True);
  fContaDeb    := CreateCmDbField('CONTADEB',ftString);
  fDescricao   := CreateCmDbField('DESCRICAO',ftString);
  fSubcontacre := CreateCmDbField('SUBCONTACRE',ftFloat,False,False,True);

end;

function TDbEventosRh.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDbEventosRh.LoadFromDb: Boolean;
begin
   Result := Inherited LoadFromDb;
end;

procedure TDbEventosRh.SetCodevento(const Value: TCmDbField);
begin
  FCodevento := Value;
end;

procedure TDbEventosRh.SetHitcodhist(const Value: TCmDbField);
begin
  FHitcodhist  := Value;
end;

procedure TDbEventosRh.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa  := Value;
end;

procedure TDbEventosRh.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc  := Value;
end;

procedure TDbEventosRh.SetSubcontaDeb(const Value: TCmDbField);
begin
  FSubcontaDeb  := Value;
end;

procedure TDbEventosRh.SetContacre(const Value: TCmDbField);
begin
  FContacre  := Value;
end;

procedure TDbEventosRh.SetPlano(const Value: TCmDbField);
begin
  FPlano  := Value;
end;

procedure TDbEventosRh.SetContaDeb(const Value: TCmDbField);
begin
  FContaDeb  := Value;
end;

procedure TDbEventosRh.SetDescricao(const Value: TCmDbField);
begin
  FDescricao  := Value;
end;

procedure TDbEventosRh.SetSubcontacre(const Value: TCmDbField);
begin
  FSubcontacre  := Value;
end;


end.



