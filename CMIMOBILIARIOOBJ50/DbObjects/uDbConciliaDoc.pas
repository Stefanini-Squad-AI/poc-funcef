{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 10/01/2004                             }
{                                                       }
{*******************************************************}

unit uDbConciliaDoc;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbConciliaDoc = class(TCmDbObject)

  private
    FNumlanctodiverge: TCmDbField;
    FData: TCmDbField;
    FDifdias: TCmDbField;
    FIddocumento: TCmDbField;
    FDifvlr: TCmDbField;
    FFlgtipo: TCmDbField;
    FIdconciliadoc: TCmDbField;
    FIddocdiverge: TCmDbField;
    FIdparcfinancimov: TCmDbField;
    FMotivo: TCmDbField;
    FIdusuario: TCmDbField;
    procedure SetData(const Value: TCmDbField);
    procedure SetDifdias(const Value: TCmDbField);
    procedure SetDifvlr(const Value: TCmDbField);
    procedure SetFlgtipo(const Value: TCmDbField);
    procedure SetIdconciliadoc(const Value: TCmDbField);
    procedure SetIddocdiverge(const Value: TCmDbField);
    procedure SetIddocumento(const Value: TCmDbField);
    procedure SetIdparcfinancimov(const Value: TCmDbField);
    procedure SetIdusuario(const Value: TCmDbField);
    procedure SetMotivo(const Value: TCmDbField);
    procedure SetNumlanctodiverge(const Value: TCmDbField);

  public

     Property Numlanctodiverge: TCmDbField read FNumlanctodiverge write SetNumlanctodiverge;
     Property Motivo: TCmDbField read FMotivo write SetMotivo;
     Property Idusuario: TCmDbField read FIdusuario write SetIdusuario;
     Property Idparcfinancimov: TCmDbField read FIdparcfinancimov write SetIdparcfinancimov;
     Property Iddocumento: TCmDbField read FIddocumento write SetIddocumento;
     Property Iddocdiverge: TCmDbField read FIddocdiverge write SetIddocdiverge;
     Property Idconciliadoc: TCmDbField read FIdconciliadoc write SetIdconciliadoc;
     Property Flgtipo: TCmDbField read FFlgtipo write SetFlgtipo;
     Property Difvlr: TCmDbField read FDifvlr write SetDifvlr;
     Property Difdias: TCmDbField read FDifdias write SetDifdias;
     Property Data: TCmDbField read FData write SetData;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbConciliaDoc }

constructor TDbConciliaDoc.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CONCILIADOC';

   fNumlanctodiverge := CreateCmDbField('NUMLANCTODIVERGE',ftfloat,False,False,False,True,'');
   fMotivo := CreateCmDbField('MOTIVO',ftString,False,False,False,True,'');
   fIdusuario := CreateCmDbField('IDUSUARIO',ftfloat,False,False,False,True,'');
   fIdparcfinancimov := CreateCmDbField('IDPARCFINANCIMOV',ftfloat,False,False,False,True,'');
   fIddocumento := CreateCmDbField('IDDOCUMENTO',ftfloat,False,False,False,True,'');
   fIddocdiverge := CreateCmDbField('IDDOCDIVERGE',ftfloat,False,False,False,True,'');
   fIdconciliadoc := CreateCmDbField('IDCONCILIADOC',ftfloat,True,True,False,True,'');
   fFlgtipo := CreateCmDbField('FLGTIPO',ftString,False,False,False,True,'');
   fDifvlr := CreateCmDbField('DIFVLR',ftfloat,False,False,False,True,'');
   fDifdias := CreateCmDbField('DIFDIAS',ftfloat,False,False,False,True,'');
   fData := CreateCmDbField('DATA',ftDateTime,False,False,False,True,'');
end;

function TDbConciliaDoc.Insert: Boolean;
begin
   fIdconciliadoc.AsFloat := GetSequence('CONCILIADOC');
   Result := Inherited Insert;
end;


procedure TDbConciliaDoc.SetData(const Value: TCmDbField);
begin
  FData := Value;
end;

procedure TDbConciliaDoc.SetDifdias(const Value: TCmDbField);
begin
  FDifdias := Value;
end;

procedure TDbConciliaDoc.SetDifvlr(const Value: TCmDbField);
begin
  FDifvlr := Value;
end;

procedure TDbConciliaDoc.SetFlgtipo(const Value: TCmDbField);
begin
  FFlgtipo := Value;
end;

procedure TDbConciliaDoc.SetIdconciliadoc(const Value: TCmDbField);
begin
  FIdconciliadoc := Value;
end;

procedure TDbConciliaDoc.SetIddocdiverge(const Value: TCmDbField);
begin
  FIddocdiverge := Value;
end;

procedure TDbConciliaDoc.SetIddocumento(const Value: TCmDbField);
begin
  FIddocumento := Value;
end;

procedure TDbConciliaDoc.SetIdparcfinancimov(const Value: TCmDbField);
begin
  FIdparcfinancimov := Value;
end;

procedure TDbConciliaDoc.SetIdusuario(const Value: TCmDbField);
begin
  FIdusuario := Value;
end;

procedure TDbConciliaDoc.SetMotivo(const Value: TCmDbField);
begin
  FMotivo := Value;
end;

procedure TDbConciliaDoc.SetNumlanctodiverge(const Value: TCmDbField);
begin
  FNumlanctodiverge := Value;
end;

end.



