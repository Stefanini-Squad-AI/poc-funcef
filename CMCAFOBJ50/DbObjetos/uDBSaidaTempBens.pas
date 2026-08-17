{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 21/08/2003                             }
{                                                       }
{*******************************************************}

unit uDBSaidaTempBens;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDBSaidaTempBens = class(TCmDbObject)

  private
    FStbdataretorno: TCmDbField;
    FIdpessoa: TCmDbField;
    FStbcusto: TCmDbField;
    FIdsaidatemporaria: TCmDbField;
    FIdbem: TCmDbField;
    procedure SetIdbem(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdsaidatemporaria(const Value: TCmDbField);
    procedure SetStbcusto(const Value: TCmDbField);
    procedure SetStbdataretorno(const Value: TCmDbField);

  public

     Property Stbdataretorno: TCmDbField read FStbdataretorno write SetStbdataretorno;
     Property Stbcusto: TCmDbField read FStbcusto write SetStbcusto;
     Property Idsaidatemporaria: TCmDbField read FIdsaidatemporaria write SetIdsaidatemporaria;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idbem: TCmDbField read FIdbem write SetIdbem;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDBSaidaTempBens }

constructor TDBSaidaTempBens.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'SAIDATEMPBENS';

   fStbdataretorno := CreateCmDbField('STBDATARETORNO',ftDateTime,False,False,False,True,'');
   fStbcusto := CreateCmDbField('STBCUSTO',ftfloat,False,False,False,False,'');
   fIdsaidatemporaria := CreateCmDbField('IDSAIDATEMPORARIA',ftfloat,True,True,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fIdbem := CreateCmDbField('IDBEM',ftfloat,True,True,False,True,'');
end;

function TDBSaidaTempBens.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

procedure TDBSaidaTempBens.SetIdbem(const Value: TCmDbField);
begin
  FIdbem := Value;
end;

procedure TDBSaidaTempBens.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDBSaidaTempBens.SetIdsaidatemporaria(const Value: TCmDbField);
begin
  FIdsaidatemporaria := Value;
end;

procedure TDBSaidaTempBens.SetStbcusto(const Value: TCmDbField);
begin
  FStbcusto := Value;
end;

procedure TDBSaidaTempBens.SetStbdataretorno(const Value: TCmDbField);
begin
  FStbdataretorno := Value;
end;

end.

