{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 15/05/2003                             }
{                                                       }
{*******************************************************}

unit uDbLogAditamento;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbLogAditamento = class(TCmDbObject)

  private
    FIdaditamento: TCmDbField;
    FIdddfield: TCmDbField;
    FVlratual: TCmDbField;
    FIdlogaditamento: TCmDbField;
    FVlranterior: TCmDbField;
    FIdcontrato: TCmDbField;
    FIdItem: TCmDbField;
    FIdObjeto: TCmDbField;
    FIdAnterior: TCmDbField;

    procedure SetIdaditamento(const Value: TCmDbField);
    procedure SetIdcontrato(const Value: TCmDbField);
    procedure SetIdddfield(const Value: TCmDbField);
    procedure SetIdlogaditamento(const Value: TCmDbField);
    procedure SetVlranterior(const Value: TCmDbField);
    procedure SetVlratual(const Value: TCmDbField);
    procedure SetIdItem(const Value: TCmDbField);
    procedure SetIdObjeto(const Value: TCmDbField);

  public

     Property Vlratual: TCmDbField read FVlratual write SetVlratual;
     Property Vlranterior: TCmDbField read FVlranterior write SetVlranterior;
     Property Idlogaditamento: TCmDbField read FIdlogaditamento write SetIdlogaditamento;
     Property Idddfield: TCmDbField read FIdddfield write SetIdddfield;
     Property Idcontrato: TCmDbField read FIdcontrato write SetIdcontrato;
     Property Idaditamento: TCmDbField read FIdaditamento write SetIdaditamento;
     Property IdItem: TCmDbField read FIdItem write SetIdItem;
     Property IdObjeto: TCmDbField read FIdObjeto write SetIdObjeto;

     property IDAnterior: TCmDbField read FIdAnterior write FIdAnterior;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbLogAditamento }

constructor TDbLogAditamento.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'LOGADITAMENTO';

   fVlratual := CreateCmDbField('VLRATUAL',ftString,False,False,False,True,'');
   fVlranterior := CreateCmDbField('VLRANTERIOR',ftString,False,False,False,True,'');
   fIdlogaditamento := CreateCmDbField('IDLOGADITAMENTO',ftfloat,True,True,False,True,'');
   fIdddfield := CreateCmDbField('IDDDFIELD',ftfloat,False,False,False,True,'');
   fIdaditamento := CreateCmDbField('IDADITAMENTO',ftfloat,True,False,False,True,'');
   fIdcontrato := CreateCmDbField('IDCONTRATO',ftfloat,True,False,False,True,'');   
   fIdItem := CreateCmDbField('IDITEM',ftfloat,False,False,False,True,'');
   fIdObjeto := CreateCmDbField('IDOBJETO',ftfloat,False,False,False,True,'');
   FIdAnterior := CreateCmDbField('IDANTERIOR',ftfloat,False,False,False,True,'');
end;

function TDbLogAditamento.Insert: Boolean;
begin
   fIdlogaditamento.AsFloat := GetSequence('LOGADITAMENTO');
   Result := Inherited Insert;
end;


procedure TDbLogAditamento.SetIdaditamento(const Value: TCmDbField);
begin
  FIdaditamento := Value;
end;

procedure TDbLogAditamento.SetIdcontrato(const Value: TCmDbField);
begin
  FIdcontrato := Value;
end;

procedure TDbLogAditamento.SetIdddfield(const Value: TCmDbField);
begin
  FIdddfield := Value;
end;

procedure TDbLogAditamento.SetIdItem(const Value: TCmDbField);
begin
  FIdItem := Value;
end;

procedure TDbLogAditamento.SetIdlogaditamento(const Value: TCmDbField);
begin
  FIdlogaditamento := Value;
end;

procedure TDbLogAditamento.SetIdObjeto(const Value: TCmDbField);
begin
  FIdObjeto := Value;
end;

procedure TDbLogAditamento.SetVlranterior(const Value: TCmDbField);
begin
  FVlranterior := Value;
end;

procedure TDbLogAditamento.SetVlratual(const Value: TCmDbField);
begin
  FVlratual := Value;
end;

end.



