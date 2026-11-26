{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 20/06/2002                             }
{                                                       }
{*******************************************************}

unit uDbDataviewacesso;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbDataviewacesso = class(TCmDbObject)

  private
    FIddataview: TCmDbField;
    FOrigemcmdv: TCmDbField;
    FIdespacesso: TCmDbField;
    procedure SetIddataview(const Value: TCmDbField);
    procedure SetIdespacesso(const Value: TCmDbField);
    procedure SetOrigemcmdv(const Value: TCmDbField);

  public

     Property Origemcmdv: TCmDbField read FOrigemcmdv write SetOrigemcmdv;
     Property Idespacesso: TCmDbField read FIdespacesso write SetIdespacesso;
     Property Iddataview: TCmDbField read FIddataview write SetIddataview;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;
  End;

implementation

{ TDbDataviewacesso }

constructor TDbDataviewacesso.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'DATAVIEWACESSO';

   fOrigemcmdv := CreateCmDbField('ORIGEMCMDV',ftfloat,True,True,False, False,'');
   fIdespacesso := CreateCmDbField('IDESPACESSO',ftfloat,True,True,False, False,'');
   fIddataview := CreateCmDbField('IDDATAVIEW',ftfloat,True,True,False, False,'');
end;

procedure TDbDataviewacesso.SetIddataview(const Value: TCmDbField);
begin
  FIddataview := Value;
end;

procedure TDbDataviewacesso.SetIdespacesso(const Value: TCmDbField);
begin
  FIdespacesso := Value;
end;

procedure TDbDataviewacesso.SetOrigemcmdv(const Value: TCmDbField);
begin
  FOrigemcmdv := Value;
end;

end.



