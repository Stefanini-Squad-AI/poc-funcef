{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 17/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbWebPagina;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbWebPagina = class(TCmDbObject)

  private
    FDescpagina: TCmDbField;
    FIdpagina: TCmDbField;
    FFlgsemprehab: TCmDbField;
    FIdpaginapai: TCmDbField;
    procedure SetDescpagina(const Value: TCmDbField);
    procedure SetIdpagina(const Value: TCmDbField);
    procedure SetFlgsemprehab(const Value: TCmDbField);
    procedure SetIdpaginapai(const Value: TCmDbField);

  public


     Property Idpagina: TCmDbField read FIdpagina write SetIdpagina;
     Property Descpagina: TCmDbField read FDescpagina write SetDescpagina;
     Property Idpaginapai: TCmDbField read FIdpaginapai write SetIdpaginapai;
     Property Flgsemprehab: TCmDbField read FFlgsemprehab write SetFlgsemprehab;

     Constructor Create( AOwner : TCmCustomCdbObject ); Override;
  End;

implementation

{ TDbWebPagina }

constructor TDbWebPagina.Create( AOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'WEBPAGINA';

   fIdpagina     := CreateCmDbField('IDPAGINA',ftfloat,True,True,False,False,'Código da Página');
   fIdpaginapai  := CreateCmDbField('IDPAGINAPAI',ftString,False,False,False,True,'Código da Página Pai');
   fDescpagina   := CreateCmDbField('DESCPAGINA',ftString,True,False,False,False,'Descrição da Página');
   fFlgsemprehab := CreateCmDbField('FLGSEMPREHAB',ftString,True,False,False,False,'Sempre habilitado?');
end;

procedure TDbWebPagina.SetDescpagina(const Value: TCmDbField);
begin
  FDescpagina := Value;
end;

procedure TDbWebPagina.SetFlgsemprehab(const Value: TCmDbField);
begin
  FFlgsemprehab := Value;
end;

procedure TDbWebPagina.SetIdpagina(const Value: TCmDbField);
begin
  FIdpagina := Value;
end;

procedure TDbWebPagina.SetIdpaginapai(const Value: TCmDbField);
begin
  FIdpaginapai := Value;
end;

end.




