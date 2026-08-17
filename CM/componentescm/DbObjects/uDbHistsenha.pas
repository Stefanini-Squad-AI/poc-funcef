{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 15/04/2002                             }
{                                                       }
{*******************************************************}

unit uDbHistsenha;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbHistsenha = class(TCmDbObject)

  private
    FIdusuario: TCmDbField;
    FDatatroca: TCmDbField;
    FSenhaantiga: TCmDbField;
    FSenhanova: TCmDbField;
    FIdhistsenha: TCmDbField;
    procedure SetDatatroca(const Value: TCmDbField);
    procedure SetIdhistsenha(const Value: TCmDbField);
    procedure SetIdusuario(const Value: TCmDbField);
    procedure SetSenhaantiga(const Value: TCmDbField);
    procedure SetSenhanova(const Value: TCmDbField);

  public

     Property Senhanova: TCmDbField read FSenhanova write SetSenhanova;
     Property Senhaantiga: TCmDbField read FSenhaantiga write SetSenhaantiga;
     Property Idusuario: TCmDbField read FIdusuario write SetIdusuario;
     Property Idhistsenha: TCmDbField read FIdhistsenha write SetIdhistsenha;
     Property Datatroca: TCmDbField read FDatatroca write SetDatatroca;

     Constructor Create(Aowner: TCmCustomCdbObject);  Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbHistsenha }

constructor TDbHistsenha.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;
                         
  TableName := 'HISTSENHA';

  fSenhanova := CreateCmDbField('SENHANOVA',ftString,False,False,False,True,'');
  fSenhaantiga := CreateCmDbField('SENHAANTIGA',ftString,False,False,False,True,'');
  fIdusuario := CreateCmDbField('IDUSUARIO',ftfloat,False,False,False,True,'');
  fIdhistsenha := CreateCmDbField('IDHISTSENHA',ftfloat,True,True,False,True,'');
  fDatatroca := CreateCmDbField('DATATROCA',ftDateTime,False,False,False,True,'');
end;

function TDbHistsenha.Insert: Boolean;
begin
   fIdhistsenha.AsFloat := GetSequence('HISTSENHA');
   Result := Inherited Insert;
end;

procedure TDbHistsenha.SetDatatroca(const Value: TCmDbField);
begin
  FDatatroca := Value;
end;

procedure TDbHistsenha.SetIdhistsenha(const Value: TCmDbField);
begin
  FIdhistsenha := Value;
end;

procedure TDbHistsenha.SetIdusuario(const Value: TCmDbField);
begin
  FIdusuario := Value;
end;

procedure TDbHistsenha.SetSenhaantiga(const Value: TCmDbField);
begin
  FSenhaantiga := Value;
end;

procedure TDbHistsenha.SetSenhanova(const Value: TCmDbField);
begin
  FSenhanova := Value;
end;

end.



