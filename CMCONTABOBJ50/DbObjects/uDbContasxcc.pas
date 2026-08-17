{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 24/09/2002                             }
{                                                       }
{*******************************************************}

unit uDbContasxcc;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbContasxcc = class(TCmDbObject)

  private
    FIdempresa: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    FPlaconta: TCmDbField;
    FIdusuarioinclusao: TCmDbField;
    FTrguserinclusao: TCmDbField;
    FPlano: TCmDbField;
    procedure SetCodcentrocusto(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdusuarioinclusao(const Value: TCmDbField);
    procedure SetPlaconta(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetTrgdtinclusao(const Value: TCmDbField);
    procedure SetTrguserinclusao(const Value: TCmDbField);

  public

     Property Plano: TCmDbField read FPlano write SetPlano;
     Property Placonta: TCmDbField read FPlaconta write SetPlaconta;
     Property Idusuarioinclusao: TCmDbField read FIdusuarioinclusao write SetIdusuarioinclusao;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Codcentrocusto: TCmDbField read FCodcentrocusto write SetCodcentrocusto;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbContasxcc }

constructor TDbContasxcc.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CONTASXCC';

   fPlano := CreateCmDbField('PLANO',ftfloat,True,True,False,True,'');
   fPlaconta := CreateCmDbField('PLACONTA',ftString,False,True,False,True,'');
   fIdusuarioinclusao := CreateCmDbField('IDUSUARIOINCLUSAO',ftfloat,True,False,False,True,'');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,True,True,False,True,'');
   fCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString,True,True,False,True,'');
end;

function TDbContasxcc.Insert: Boolean;
begin
   Result := Inherited Insert;
end;


procedure TDbContasxcc.SetCodcentrocusto(const Value: TCmDbField);
begin
  FCodcentrocusto := Value;
end;

procedure TDbContasxcc.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbContasxcc.SetIdusuarioinclusao(const Value: TCmDbField);
begin
  FIdusuarioinclusao := Value;
end;

procedure TDbContasxcc.SetPlaconta(const Value: TCmDbField);
begin
  FPlaconta := Value;
end;

procedure TDbContasxcc.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

procedure TDbContasxcc.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

procedure TDbContasxcc.SetTrguserinclusao(const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;

end.



