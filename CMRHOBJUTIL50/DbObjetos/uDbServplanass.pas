{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Eugenio Frioli                  }
{ Atualizado Em: 29/03/2004                             }
{                                                       }
{*******************************************************}

unit uDbServplanass;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDbServplanass = class(TCmDbObject)

  private
    FIdregrapagamento: TCmDbField;
    FIdplanass: TCmDbField;
    FIdregrareembolso: TCmDbField;
    FCodigo: TCmDbField;
    FIdregracomissao: TCmDbField;
    FIdservass: TCmDbField;
    FPreco: TCmDbField;
    procedure SetCodigo(const Value: TCmDbField);
    procedure SetIdplanass(const Value: TCmDbField);
    procedure SetIdregracomissao(const Value: TCmDbField);
    procedure SetIdregrapagamento(const Value: TCmDbField);
    procedure SetIdregrareembolso(const Value: TCmDbField);
    procedure SetIdservass(const Value: TCmDbField);
    procedure SetPreco(const Value: TCmDbField);

  public

     Property Preco: TCmDbField read FPreco write SetPreco;
     Property Idservass: TCmDbField read FIdservass write SetIdservass;
     Property Idregrareembolso: TCmDbField read FIdregrareembolso write SetIdregrareembolso;
     Property Idregrapagamento: TCmDbField read FIdregrapagamento write SetIdregrapagamento;
     Property Idregracomissao: TCmDbField read FIdregracomissao write SetIdregracomissao;
     Property Idplanass: TCmDbField read FIdplanass write SetIdplanass;
     Property Codigo: TCmDbField read FCodigo write SetCodigo;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

  End;

implementation

{ TDbServplanass }

constructor TDbServplanass.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'SERVPLANASS';

   fPreco := CreateCmDbField('PRECO',ftfloat,False,False,False,False,'');
   fIdservass := CreateCmDbField('IDSERVASS',ftfloat,True,True,False,True,'');
   fIdregrareembolso := CreateCmDbField('IDREGRAREEMBOLSO',ftfloat,False,False,False,True,'');
   fIdregrapagamento := CreateCmDbField('IDREGRAPAGAMENTO',ftfloat,False,False,False,True,'');
   fIdregracomissao := CreateCmDbField('IDREGRACOMISSAO',ftfloat,False,False,False,True,'');
   fIdplanass := CreateCmDbField('IDPLANASS',ftfloat,True,True,False,True,'');
   fCodigo := CreateCmDbField('CODIGO',ftString,False,False,False,True,'');
end;

procedure TDbServplanass.SetCodigo(const Value: TCmDbField);
begin
  FCodigo := Value;
end;

procedure TDbServplanass.SetIdplanass(const Value: TCmDbField);
begin
  FIdplanass := Value;
end;

procedure TDbServplanass.SetIdregracomissao(const Value: TCmDbField);
begin
  FIdregracomissao := Value;
end;

procedure TDbServplanass.SetIdregrapagamento(const Value: TCmDbField);
begin
  FIdregrapagamento := Value;
end;

procedure TDbServplanass.SetIdregrareembolso(const Value: TCmDbField);
begin
  FIdregrareembolso := Value;
end;

procedure TDbServplanass.SetIdservass(const Value: TCmDbField);
begin
  FIdservass := Value;
end;

procedure TDbServplanass.SetPreco(const Value: TCmDbField);
begin
  FPreco := Value;
end;

end.



