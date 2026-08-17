{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 03/06/2002                             }
{                                                       }
{*******************************************************}

unit uDbCmpbd;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbCmpbd = class(TCmDbObject)

  private
    FFlgobrigatorio: TCmDbField;
    FChave: TCmDbField;
    FEntidade: TCmDbField;
    FCampodobanco: TCmDbField;
    FIdcampo: TCmDbField;
    FApelido: TCmDbField;
    FIdtipodado: TCmDbField;
    FDescricaodocampo: TCmDbField;
    FNomedocampo: TCmDbField;
    procedure SetApelido(const Value: TCmDbField);
    procedure SetCampodobanco(const Value: TCmDbField);
    procedure SetChave(const Value: TCmDbField);
    procedure SetDescricaodocampo(const Value: TCmDbField);
    procedure SetEntidade(const Value: TCmDbField);
    procedure SetFlgobrigatorio(const Value: TCmDbField);
    procedure SetIdcampo(const Value: TCmDbField);
    procedure SetIdtipodado(const Value: TCmDbField);
    procedure SetNomedocampo(const Value: TCmDbField);

  public

     Property Nomedocampo: TCmDbField read FNomedocampo write SetNomedocampo;
     Property Idtipodado: TCmDbField read FIdtipodado write SetIdtipodado;
     Property Idcampo: TCmDbField read FIdcampo write SetIdcampo;
     Property Flgobrigatorio: TCmDbField read FFlgobrigatorio write SetFlgobrigatorio;
     Property Entidade: TCmDbField read FEntidade write SetEntidade;
     Property Descricaodocampo: TCmDbField read FDescricaodocampo write SetDescricaodocampo;
     Property Chave: TCmDbField read FChave write SetChave;
     Property Campodobanco: TCmDbField read FCampodobanco write SetCampodobanco;
     Property Apelido: TCmDbField read FApelido write SetApelido;

     Constructor Create(Aowner: TCmCustomCdbObject); Virtual;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbCmpbd }

constructor TDbCmpbd.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CMPBD';

   fNomedocampo := CreateCmDbField('NOMEDOCAMPO',ftString,False,False,False,False,'Nome do Campo');
   fIdtipodado := CreateCmDbField('IDTIPODADO',ftfloat,False,False,False,False,'Tipo de Dado');
   fIdcampo := CreateCmDbField('IDCAMPO',ftString,True,True,False,False,'Identificador');
   fFlgobrigatorio := CreateCmDbField('FLGOBRIGATORIO',ftfloat,False,False,False,False,'Obrigatório?');
   fEntidade := CreateCmDbField('ENTIDADE',ftString,False,False,False,False,'Entidade');
   fDescricaodocampo := CreateCmDbField('DESCRICAODOCAMPO',ftString,False,False,False,False,'Descrição do Campo');
   fChave := CreateCmDbField('CHAVE',ftfloat,False,False,False,False,'Chave?');
   fCampodobanco := CreateCmDbField('CAMPODOBANCO',ftfloat,False,False,False,False,'Campo do Banco?');
   fApelido := CreateCmDbField('APELIDO',ftString,False,False,False,False,'Apelido do Campo');
end;

function TDbCmpbd.Insert: Boolean;
begin

   Result := Inherited Insert;

end;

function TDbCmpbd.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbCmpbd.SetApelido(const Value: TCmDbField);
begin
  FApelido := Value;
end;

procedure TDbCmpbd.SetCampodobanco(const Value: TCmDbField);
begin
  FCampodobanco := Value;
end;

procedure TDbCmpbd.SetChave(const Value: TCmDbField);
begin
  FChave := Value;
end;

procedure TDbCmpbd.SetDescricaodocampo(const Value: TCmDbField);
begin
  FDescricaodocampo := Value;
end;

procedure TDbCmpbd.SetEntidade(const Value: TCmDbField);
begin
  FEntidade := Value;
end;

procedure TDbCmpbd.SetFlgobrigatorio(const Value: TCmDbField);
begin
  FFlgobrigatorio := Value;
end;

procedure TDbCmpbd.SetIdcampo(const Value: TCmDbField);
begin
  FIdcampo := Value;
end;

procedure TDbCmpbd.SetIdtipodado(const Value: TCmDbField);
begin
  FIdtipodado := Value;
end;

procedure TDbCmpbd.SetNomedocampo(const Value: TCmDbField);
begin
  FNomedocampo := Value;
end;

end.




