{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 20/06/2002                             }
{                                                       }
{*******************************************************}

unit uDbGrupoacesso;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase, uDbEspacess;

Type
  TDbGrupoacesso = class(TCmDbObject)

  private
    _DbEspacess: TDbEspacess;
    
    FIdgrupo: TCmDbField;
    FDescricao: TCmDbField;
    FNomegrupo: TCmDbField;
    FIdespacesso: TCmDbField;
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdespacesso(const Value: TCmDbField);
    procedure SetIdgrupo(const Value: TCmDbField);
    procedure SetNomegrupo(const Value: TCmDbField);

  public

     Property Nomegrupo: TCmDbField read FNomegrupo write SetNomegrupo;
     Property Idgrupo: TCmDbField read FIdgrupo write SetIdgrupo;
     Property Idespacesso: TCmDbField read FIdespacesso write SetIdespacesso;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;
     Destructor Destroy; Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbGrupoacesso }

constructor TDbGrupoacesso.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'GRUPOACESSO';

  fNomegrupo := CreateCmDbField('NOMEGRUPO',ftString,True,False,False,True,'');
  fIdgrupo := CreateCmDbField('IDGRUPO',ftfloat,True,True,False,True,'');
  fIdespacesso := CreateCmDbField('IDESPACESSO',ftfloat,False,False,False,True,'');
  fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');

  _DbEspacess := TDbEspacess.Create(Aowner);
end;

destructor TDbGrupoacesso.Destroy;
begin
  _DbEspacess.Free;
  inherited;
end;

function TDbGrupoacesso.Insert: Boolean;
begin
   _DbEspacess.DataBaseName := DataBaseName;

   If Not _DbEspacess.Insert Then
   Begin
     MessageInfo := _DbEspacess.MessageInfo;
     Result := False;
   End
   Else
   Begin
     fIdgrupo.AsFloat := GetSequence('GRUPOACESSO');
     fIdespacesso.AsFloat := _DbEspacess.Idespacesso.AsFloat;
     Result := Inherited Insert;
   End;
end;


procedure TDbGrupoacesso.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbGrupoacesso.SetIdespacesso(const Value: TCmDbField);
begin
  FIdespacesso := Value;
end;

procedure TDbGrupoacesso.SetIdgrupo(const Value: TCmDbField);
begin
  FIdgrupo := Value;
end;

procedure TDbGrupoacesso.SetNomegrupo(const Value: TCmDbField);
begin
  FNomegrupo := Value;
end;

end.



