{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 17/02/2003                             }
{                                                       }
{*******************************************************}

unit uDbCargoxgrupoxcc;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCargoxgrupoxcc = class(TCmDbObject)

  private
    FIdcargo: TCmDbField;
    FIdempresa: TCmDbField;
    FIdfuncao: TCmDbField;
    FIdespacesso: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FfIDCARGOXGRUPOXCC: TCmDbField;
    procedure SetCodcentrocusto(const Value: TCmDbField);
    procedure SetIdcargo(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdespacesso(const Value: TCmDbField);
    procedure SetIdfuncao(const Value: TCmDbField);
    procedure SetfIDCARGOXGRUPOXCC(const Value: TCmDbField);

  public

     Property Idfuncao: TCmDbField read FIdfuncao write SetIdfuncao;
     Property Idespacesso: TCmDbField read FIdespacesso write SetIdespacesso;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Idcargo: TCmDbField read FIdcargo write SetIdcargo;
     Property Codcentrocusto: TCmDbField read FCodcentrocusto write SetCodcentrocusto;
     Property fIDCARGOXGRUPOXCC: TCmDbField read FfIDCARGOXGRUPOXCC write SetfIDCARGOXGRUPOXCC;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbCargoxgrupoxcc }

constructor TDbCargoxgrupoxcc.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CARGOXGRUPOXCC';

   fIdfuncao := CreateCmDbField('IDFUNCAO',ftfloat,False,false,False,True,'');
   fIdespacesso := CreateCmDbField('IDESPACESSO',ftfloat,True,false,False,True,'');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,True,false,False,True,'');
   fIdcargo := CreateCmDbField('IDCARGO',ftfloat,True,false,False,True,'');
   fCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString,True,false,False,True,'');
   FfIDCARGOXGRUPOXCC := CreateCmDbField('IDCARGOXGRUPOXCC',ftString,True,True,False,True,'');
end;

function TDbCargoxgrupoxcc.Insert: Boolean;
begin
   fIDCARGOXGRUPOXCC.AsFloat := GetSequence('CARGOXGRUPOXCC');
   Result := Inherited Insert;

end;


procedure TDbCargoxgrupoxcc.SetCodcentrocusto(const Value: TCmDbField);
begin
  FCodcentrocusto := Value;
end;

procedure TDbCargoxgrupoxcc.SetfIDCARGOXGRUPOXCC(const Value: TCmDbField);
begin
  FfIDCARGOXGRUPOXCC := Value;
end;

procedure TDbCargoxgrupoxcc.SetIdcargo(const Value: TCmDbField);
begin
  FIdcargo := Value;
end;

procedure TDbCargoxgrupoxcc.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbCargoxgrupoxcc.SetIdespacesso(const Value: TCmDbField);
begin
  FIdespacesso := Value;
end;

procedure TDbCargoxgrupoxcc.SetIdfuncao(const Value: TCmDbField);
begin
  FIdfuncao := Value;
end;

end.



