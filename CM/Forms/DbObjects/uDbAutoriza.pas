{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 20/06/2002                             }
{                                                       }
{*******************************************************}

unit uDbAutoriza;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbAutoriza = class(TCmDbObject)

  private
    FIdoperfunc: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdespacesso: TCmDbField;
    procedure SetIdespacesso(const Value: TCmDbField);
    procedure SetIdoperfunc(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);

  public

     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idoperfunc: TCmDbField read FIdoperfunc write SetIdoperfunc;
     Property Idespacesso: TCmDbField read FIdespacesso write SetIdespacesso;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;
  End;

implementation

{ TDbAutoriza }

constructor TDbAutoriza.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'AUTORIZA';

  fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
  fIdoperfunc := CreateCmDbField('IDOPERFUNC',ftfloat,True,True,False,True,'');
  fIdespacesso := CreateCmDbField('IDESPACESSO',ftfloat,True,True,False,True,'');

  _UpdateKeyFields := True;
end;

procedure TDbAutoriza.SetIdespacesso(const Value: TCmDbField);
begin
  FIdespacesso := Value;
end;

procedure TDbAutoriza.SetIdoperfunc(const Value: TCmDbField);
begin
  FIdoperfunc := Value;
end;

procedure TDbAutoriza.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

end.



