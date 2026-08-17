{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 07/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbCodigoscnab;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, SysUtils, uCmCustomCdbObject;

Type
  TDbCodigoscnab = class(TCmDbObject)

  private

   fTipo: TCmDbField;
   fRecpag: TCmDbField;
   fIdmodeloscnab: TCmDbField;
   fIdcodigoscnab: TCmDbField;
   fFlgindicabaixa: TCmDbField;
   fDescricao: TCmDbField;
   fCodigo: TCmDbField;
   FCodAlterador: TCmDbField;
   FFlgContabAlterador: TCmDbField;
   procedure setTipo(const Value: TCmDbField);
   procedure setRecpag(const Value: TCmDbField);
   procedure setIdmodeloscnab(const Value: TCmDbField);
   procedure setIdcodigoscnab(const Value: TCmDbField);
   procedure setFlgindicabaixa(const Value: TCmDbField);
   procedure setDescricao(const Value: TCmDbField);
   procedure setCodigo(const Value: TCmDbField);
   procedure SetCodAlterador(const Value: TCmDbField);
   procedure SetFlgContabAlterador(const Value: TCmDbField);

  public

     Property Tipo: TCmDbField read FTipo write SetTipo;
     Property Recpag: TCmDbField read FRecpag write SetRecpag;
     Property Idmodeloscnab: TCmDbField read fIdmodeloscnab write SetIdmodeloscnab;
     Property Idcodigoscnab: TCmDbField read fIdcodigoscnab write SetIdcodigoscnab;
     Property Flgindicabaixa: TCmDbField read fFlgindicabaixa write SetFlgindicabaixa;
     Property Descricao: TCmDbField read fDescricao write SetDescricao;
     Property Codigo: TCmDbField read fCodigo write SetCodigo;
     Property CodAlterador: TCmDbField read FCodAlterador write SetCodAlterador;

     // Rodolpho da Silva - P: 20932 - 21/12/2005
     property FlgContabAlterador: TCmDbField read FFlgContabAlterador write SetFlgContabAlterador;

     Constructor Create(owner : TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbCodigoscnab }

constructor TDbCodigoscnab.Create(owner : TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CODIGOSCNAB';

   fTipo               := CreateCmDbField('TIPO',ftString,False,False,False);
   fRecpag             := CreateCmDbField('RECPAG',ftString,True,False,False);
   fIdmodeloscnab      := CreateCmDbField('IDMODELOSCNAB',ftfloat,False,False,False,True);
   fIdcodigoscnab      := CreateCmDbField('IDCODIGOSCNAB',ftfloat,False,True,False,True);
   fFlgindicabaixa     := CreateCmDbField('FLGINDICABAIXA',ftString,False,False,False,True);
   fDescricao          := CreateCmDbField('DESCRICAO',ftString,False,False,False);
   fCodigo             := CreateCmDbField('CODIGO',ftString,False,False,False);
   fCodAlterador       := CreateCmDbField('CODALTERADOR',ftFloat);

   // Rodolpho da Silva - P: 20932 - 21/12/2005
   FFlgContabAlterador := CreateCmDbField('FLGCONTABALTERADOR',ftString);
end;

function TDbCodigoscnab.Insert: Boolean;
begin
   fIdcodigoscnab.AsFloat := GetSequence('CODIGOSCNAB');
   Result := Inherited Insert;

end;

function TDbCodigoscnab.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDbCodigoscnab.SetCodAlterador(const Value: TCmDbField);
begin
  FCodAlterador := Value;
end;

procedure TDbCodigoscnab.setCodigo(const Value: TCmDbField);
begin
   fCodigo := value;
end;

procedure TDbCodigoscnab.setDescricao(const Value: TCmDbField);
begin
   fDescricao := value;
end;

procedure TDbCodigoscnab.SetFlgContabAlterador(const Value: TCmDbField);
begin
  FFlgContabAlterador := Value;
end;



procedure TDbCodigoscnab.setFlgindicabaixa(const Value: TCmDbField);
begin
   fFlgindicabaixa := value;
end;

procedure TDbCodigoscnab.setIdcodigoscnab(const Value: TCmDbField);
begin
   fIdcodigoscnab := value;
end;

procedure TDbCodigoscnab.setIdmodeloscnab(const Value: TCmDbField);
begin
   fIdmodeloscnab := value;
end;

procedure TDbCodigoscnab.setRecpag(const Value: TCmDbField);
begin
   fRecpag := value;
end;

procedure TDbCodigoscnab.setTipo(const Value: TCmDbField);
begin
   fTipo := value;
end;

end.



