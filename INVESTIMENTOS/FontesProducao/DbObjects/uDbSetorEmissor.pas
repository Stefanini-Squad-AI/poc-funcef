{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 25/09/2007                             }
{                                                       }
{*******************************************************}

unit uDbSetorEmissor;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbSetorEmissor = class(TCmDbObject)

  private
    FDescSetorEmissor: TCmDbField;
    FSetorAnalit: TCmDbField;
    FCodSetorEmissor: TCmDbField;
    procedure SetCodSetorEmissor(const Value: TCmDbField);
    procedure SetDescSetorEmissor(const Value: TCmDbField);
    procedure SetSetorAnalit(const Value: TCmDbField);

  public

     Property SetorAnalit: TCmDbField read FSetorAnalit write SetSetorAnalit;
     Property DescSetorEmissor: TCmDbField read FDescSetorEmissor write SetDescSetorEmissor;
     Property CodSetorEmissor: TCmDbField read FCodSetorEmissor write SetCodSetorEmissor;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbSetorEmissor }

constructor TDbSetorEmissor.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'SETOREMISSOR';

   //                                                                   |Required |Key    |Readonly |NullIfZero
  //                                            --------------------------------------------------------------

  fSetorAnalit := CreateCmDbField('SETORANALIT',          ftString,       False,    False,  False,    True,'');
  fDescSetorEmissor := CreateCmDbField('DESCSETOREMISSOR',ftString,       True,     False,  False,    True,'Descrição do Setor');
  fCodSetorEmissor := CreateCmDbField('CODSETOREMISSOR',  ftString,       True,     True ,  False,    True,'Código do Setor');
end;

function TDbSetorEmissor.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDbSetorEmissor.SetCodSetorEmissor(const Value: TCmDbField);
begin
  FCodSetorEmissor := Value;
end;

procedure TDbSetorEmissor.SetDescSetorEmissor(const Value: TCmDbField);
begin
  FDescSetorEmissor := Value;
end;

procedure TDbSetorEmissor.SetSetorAnalit(const Value: TCmDbField);
begin
  FSetorAnalit := Value;
end;

end.



