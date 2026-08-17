{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 19/09/2006                             }
{                                                       }
{*******************************************************}

unit uDbEventoxdocum;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbEventoxdocum = class(TCmDbObject)

  private
    FDataevento        : TCmDbField;
    FCoddocumento      : TCmDbField;
    FIdtipoeventodocum : TCmDbField;
    FDescricao         : TCmDbField;
    FIdusuario         : TCmDbField;
    FIdeventoxdocum    : TCmDbField;
    procedure SetCoddocumento(const Value: TCmDbField);
    procedure SetDataevento(const Value: TCmDbField);
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdeventoxdocum(const Value: TCmDbField);
    procedure SetIdtipoeventodocum(const Value: TCmDbField);
    procedure SetIdusuario(const Value: TCmDbField);

  public

     Property Idusuario         : TCmDbField read FIdusuario         write SetIdusuario;
     Property Idtipoeventodocum : TCmDbField read FIdtipoeventodocum write SetIdtipoeventodocum;
     Property Ideventoxdocum    : TCmDbField read FIdeventoxdocum    write SetIdeventoxdocum;
     Property Descricao         : TCmDbField read FDescricao         write SetDescricao;
     Property Dataevento        : TCmDbField read FDataevento        write SetDataevento;
     Property Coddocumento      : TCmDbField read FCoddocumento      write SetCoddocumento;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbEventoxdocum }

constructor TDbEventoxdocum.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'EVENTOXDOCUM';

  fIdusuario         := CreateCmDbField('IDUSUARIO',         ftfloat,    False, False, False, True,'');
  fIdtipoeventodocum := CreateCmDbField('IDTIPOEVENTODOCUM', ftfloat,    False, False, False, True,'');
  fIdeventoxdocum    := CreateCmDbField('IDEVENTOXDOCUM',    ftfloat,    True,  True,  False, True,'');
  fDescricao         := CreateCmDbField('DESCRICAO',         ftString,   False, False, False, True,'');
  fDataevento        := CreateCmDbField('DATAEVENTO',        ftDateTime, False, False, False, True,'');
  fCoddocumento      := CreateCmDbField('CODDOCUMENTO',      ftfloat,    False, False, False, True,'');
end;

function TDbEventoxdocum.Insert: Boolean;
begin

   fIdeventoxdocum.AsFloat := GetSequence('EVENTOXDOCUM');
   Result := Inherited Insert;

end;


procedure TDbEventoxdocum.SetCoddocumento(const Value: TCmDbField);
begin
  FCoddocumento := Value;
end;

procedure TDbEventoxdocum.SetDataevento(const Value: TCmDbField);
begin
  FDataevento := Value;
end;

procedure TDbEventoxdocum.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbEventoxdocum.SetIdeventoxdocum(const Value: TCmDbField);
begin
  FIdeventoxdocum := Value;
end;

procedure TDbEventoxdocum.SetIdtipoeventodocum(const Value: TCmDbField);
begin
  FIdtipoeventodocum := Value;
end;

procedure TDbEventoxdocum.SetIdusuario(const Value: TCmDbField);
begin
  FIdusuario := Value;
end;

end.



