{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 06/10/2006                             }
{                                                       }
{*******************************************************}

unit uDbFormacalcimobxitem;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbFormacalcimobxitem = class(TCmDbObject)

  private
    FIdtipocustorecimo: TCmDbField;
    FFlggravazero: TCmDbField;
    FTratasaldodev: TCmDbField;
    FTipoevento: TCmDbField;
    FFlgcentraliza: TCmDbField;
    FSeqcalculo: TCmDbField;
    FIdformaxitem: TCmDbField;
    FTrguserinclusao: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    FIdformacalcimob: TCmDbField;
    FIdregra: TCmDbField;
    procedure SetFlgcentraliza(const Value: TCmDbField);
    procedure SetFlggravazero(const Value: TCmDbField);
    procedure SetIdformacalcimob(const Value: TCmDbField);
    procedure SetIdformaxitem(const Value: TCmDbField);
    procedure SetIdregra(const Value: TCmDbField);
    procedure SetIdtipocustorecimo(const Value: TCmDbField);
    procedure SetSeqcalculo(const Value: TCmDbField);
    procedure SetTipoevento(const Value: TCmDbField);
    procedure SetTratasaldodev(const Value: TCmDbField);
    procedure SetTrgdtinclusao(const Value: TCmDbField);
    procedure SetTrguserinclusao(const Value: TCmDbField);

  public

     Property Trguserinclusao: TCmDbField read FTrguserinclusao write SetTrguserinclusao;
     Property Trgdtinclusao: TCmDbField read FTrgdtinclusao write SetTrgdtinclusao;
     Property Tratasaldodev: TCmDbField read FTratasaldodev write SetTratasaldodev;
     Property Tipoevento: TCmDbField read FTipoevento write SetTipoevento;
     Property Seqcalculo: TCmDbField read FSeqcalculo write SetSeqcalculo;
     Property Idtipocustorecimo: TCmDbField read FIdtipocustorecimo write SetIdtipocustorecimo;
     Property Idregra: TCmDbField read FIdregra write SetIdregra;
     Property Idformaxitem: TCmDbField read FIdformaxitem write SetIdformaxitem;
     Property Idformacalcimob: TCmDbField read FIdformacalcimob write SetIdformacalcimob;
     Property Flggravazero: TCmDbField read FFlggravazero write SetFlggravazero;
     Property Flgcentraliza: TCmDbField read FFlgcentraliza write SetFlgcentraliza;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbFormacalcimobxitem }

constructor TDbFormacalcimobxitem.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'FORMACALCIMOBXITEM';

   fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,True,'');
   fTrgdtinclusao := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,False,False,False,True,'');
   fTratasaldodev := CreateCmDbField('TRATASALDODEV',ftfloat,False,False,False,False,'');
   fTipoevento := CreateCmDbField('TIPOEVENTO',ftfloat,False,False,False,False,'');
   fSeqcalculo := CreateCmDbField('SEQCALCULO',ftfloat,False,False,False,True,'');
   fIdtipocustorecimo := CreateCmDbField('IDTIPOCUSTORECIMO',ftfloat,False,False,False,True,'');
   fIdregra := CreateCmDbField('IDREGRA',ftfloat,False,False,False,True,'');
   fIdformaxitem := CreateCmDbField('IDFORMAXITEM',ftfloat,True,True,False,True,'');
   fIdformacalcimob := CreateCmDbField('IDFORMACALCIMOB',ftfloat,False,False,False,True,'');
   fFlggravazero := CreateCmDbField('FLGGRAVAZERO',ftfloat,False,False,False,False,'');
   fFlgcentraliza := CreateCmDbField('FLGCENTRALIZA',ftfloat,False,False,False,False,'');
end;

function TDbFormacalcimobxitem.Insert: Boolean;
begin

   fIdformaxitem.AsFloat := GetSequence('FORMACALCIMOBXITEM');
   Result := Inherited Insert;

end;


procedure TDbFormacalcimobxitem.SetFlgcentraliza(const Value: TCmDbField);
begin
  FFlgcentraliza := Value;
end;

procedure TDbFormacalcimobxitem.SetFlggravazero(const Value: TCmDbField);
begin
  FFlggravazero := Value;
end;

procedure TDbFormacalcimobxitem.SetIdformacalcimob(
  const Value: TCmDbField);
begin
  FIdformacalcimob := Value;
end;

procedure TDbFormacalcimobxitem.SetIdformaxitem(const Value: TCmDbField);
begin
  FIdformaxitem := Value;
end;

procedure TDbFormacalcimobxitem.SetIdregra(const Value: TCmDbField);
begin
  FIdregra := Value;
end;

procedure TDbFormacalcimobxitem.SetIdtipocustorecimo(
  const Value: TCmDbField);
begin
  FIdtipocustorecimo := Value;
end;

procedure TDbFormacalcimobxitem.SetSeqcalculo(const Value: TCmDbField);
begin
  FSeqcalculo := Value;
end;

procedure TDbFormacalcimobxitem.SetTipoevento(const Value: TCmDbField);
begin
  FTipoevento := Value;
end;

procedure TDbFormacalcimobxitem.SetTratasaldodev(const Value: TCmDbField);
begin
  FTratasaldodev := Value;
end;

procedure TDbFormacalcimobxitem.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

procedure TDbFormacalcimobxitem.SetTrguserinclusao(
  const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;

end.



