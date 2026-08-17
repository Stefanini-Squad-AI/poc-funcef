{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 22/04/2008                             }
{                                                       }
{*******************************************************}

unit uDbModeloscnab;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbModeloscnab = class(TCmDbObject)

  private
    FIdmodeloscnab: TCmDbField;
    FControleremessa: TCmDbField;
    FRecpag: TCmDbField;
    FSeqarquivo: TCmDbField;
    FDescricao: TCmDbField;
    procedure SetControleremessa(const Value: TCmDbField);
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdmodeloscnab(const Value: TCmDbField);
    procedure SetRecpag(const Value: TCmDbField);
    procedure SetSeqarquivo(const Value: TCmDbField);

  public

     Property Seqarquivo: TCmDbField read FSeqarquivo write SetSeqarquivo;
     Property Recpag: TCmDbField read FRecpag write SetRecpag;
     Property Idmodeloscnab: TCmDbField read FIdmodeloscnab write SetIdmodeloscnab;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property Controleremessa: TCmDbField read FControleremessa write SetControleremessa;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbModeloscnab }

constructor TDbModeloscnab.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'MODELOSCNAB';

   fSeqarquivo := CreateCmDbField('SEQARQUIVO',ftfloat,False,False,False,True,'');
   fRecpag := CreateCmDbField('RECPAG',ftString,True,True,False,True,'');
   fIdmodeloscnab := CreateCmDbField('IDMODELOSCNAB',ftfloat,True,True,False,True,'');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,True,False,False,True,'');
   fControleremessa := CreateCmDbField('CONTROLEREMESSA',ftfloat,False,False,False,True,'');
end;

function TDbModeloscnab.Insert: Boolean;
begin

   fIdmodeloscnab.AsFloat := GetSequence('MODELOSCNAB');
   Result := Inherited Insert;

end;


procedure TDbModeloscnab.SetControleremessa(const Value: TCmDbField);
begin
  FControleremessa := Value;
end;

procedure TDbModeloscnab.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbModeloscnab.SetIdmodeloscnab(const Value: TCmDbField);
begin
  FIdmodeloscnab := Value;
end;

procedure TDbModeloscnab.SetRecpag(const Value: TCmDbField);
begin
  FRecpag := Value;
end;

procedure TDbModeloscnab.SetSeqarquivo(const Value: TCmDbField);
begin
  FSeqarquivo := Value;
end;

end.



