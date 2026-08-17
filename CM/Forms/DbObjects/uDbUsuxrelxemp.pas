{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 20/06/2002                             }
{                                                       }
{*******************************************************}

unit uDbUsuxrelxemp;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbUsuxrelxemp = class(TCmDbObject)

  private
    FOrigemcm: TCmDbField;
    FIdempresa: TCmDbField;
    FIdreports: TCmDbField;
    FIdespacesso: TCmDbField;
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdespacesso(const Value: TCmDbField);
    procedure SetIdreports(const Value: TCmDbField);
    procedure SetOrigemcm(const Value: TCmDbField);

  public

     Property Origemcm: TCmDbField read FOrigemcm write SetOrigemcm;
     Property Idreports: TCmDbField read FIdreports write SetIdreports;
     Property Idespacesso: TCmDbField read FIdespacesso write SetIdespacesso;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;
  End;

implementation

{ TDbUsuxrelxemp }

constructor TDbUsuxrelxemp.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'USUXRELXEMP';

  fOrigemcm := CreateCmDbField('ORIGEMCM', ftfloat, True, True, False, false, '');
  fIdreports := CreateCmDbField('IDREPORTS', ftfloat,True, True, False, True,'');
  fIdespacesso := CreateCmDbField('IDESPACESSO', ftfloat, True, True, False, True,'');
  fIdempresa := CreateCmDbField('IDEMPRESA', ftfloat, True, True, False, True,'');

  _UpdateKeyFields := True;
end;

procedure TDbUsuxrelxemp.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbUsuxrelxemp.SetIdespacesso(const Value: TCmDbField);
begin
  FIdespacesso := Value;
end;

procedure TDbUsuxrelxemp.SetIdreports(const Value: TCmDbField);
begin
  FIdreports := Value;
end;

procedure TDbUsuxrelxemp.SetOrigemcm(const Value: TCmDbField);
begin
  FOrigemcm := Value;
end;

end.



