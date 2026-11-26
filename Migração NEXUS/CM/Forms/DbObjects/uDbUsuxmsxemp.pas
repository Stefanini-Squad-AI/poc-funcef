{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 20/06/2002                             }
{                                                       }
{*******************************************************}

unit uDbUsuxmsxemp;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbUsuxmsxemp = class(TCmDbObject)

  private
    FIdempresa: TCmDbField;
    FIdespacesso: TCmDbField;
    FIdmontaselect: TCmDbField;
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdespacesso(const Value: TCmDbField);
    procedure SetIdmontaselect(const Value: TCmDbField);

  public

     Property Idmontaselect: TCmDbField read FIdmontaselect write SetIdmontaselect;
     Property Idespacesso: TCmDbField read FIdespacesso write SetIdespacesso;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;
  End;

implementation

{ TDbUsuxmsxemp }

constructor TDbUsuxmsxemp.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'USUXMSXEMP';

  fIdmontaselect := CreateCmDbField('IDMONTASELECT',ftfloat,True,True,False,True,'');
  fIdespacesso := CreateCmDbField('IDESPACESSO',ftfloat,True,True,False,True,'');
  fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,True,True,False,True,'');

  _UpdateKeyFields := True;
end;

procedure TDbUsuxmsxemp.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbUsuxmsxemp.SetIdespacesso(const Value: TCmDbField);
begin
  FIdespacesso := Value;
end;

procedure TDbUsuxmsxemp.SetIdmontaselect(const Value: TCmDbField);
begin
  FIdmontaselect := Value;
end;

end.



