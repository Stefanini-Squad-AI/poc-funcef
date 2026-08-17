{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 20/06/2002                             }
{                                                       }
{*******************************************************}

unit uDbOperfunc;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbOperfunc = class(TCmDbObject)

  private
    FIdmodulo: TCmDbField;
    FIdfuncao: TCmDbField;
    FIdoperfunc: TCmDbField;
    FIdoperacao: TCmDbField;
    procedure SetIdfuncao(const Value: TCmDbField);
    procedure SetIdmodulo(const Value: TCmDbField);
    procedure SetIdoperacao(const Value: TCmDbField);
    procedure SetIdoperfunc(const Value: TCmDbField);

  public

     Property Idoperfunc: TCmDbField read FIdoperfunc write SetIdoperfunc;
     Property Idoperacao: TCmDbField read FIdoperacao write SetIdoperacao;
     Property Idmodulo: TCmDbField read FIdmodulo write SetIdmodulo;
     Property Idfuncao: TCmDbField read FIdfuncao write SetIdfuncao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbOperfunc }

constructor TDbOperfunc.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'OPERFUNC';

   fIdoperfunc := CreateCmDbField('IDOPERFUNC',ftfloat,True,True,False,True,'');
   fIdoperacao := CreateCmDbField('IDOPERACAO',ftfloat,False,False,False,True,'');
   fIdmodulo := CreateCmDbField('IDMODULO',ftfloat,False,False,False,True,'');
   fIdfuncao := CreateCmDbField('IDFUNCAO',ftfloat,True,False,False,True,'');
end;

function TDbOperfunc.Insert: Boolean;
begin
   fIdoperfunc.AsFloat := GetSequence('OPERFUNC');
   Result := Inherited Insert;
end;


procedure TDbOperfunc.SetIdfuncao(const Value: TCmDbField);
begin
  FIdfuncao := Value;
end;

procedure TDbOperfunc.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;

procedure TDbOperfunc.SetIdoperacao(const Value: TCmDbField);
begin
  FIdoperacao := Value;
end;

procedure TDbOperfunc.SetIdoperfunc(const Value: TCmDbField);
begin
  FIdoperfunc := Value;
end;

end.



