{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 18/10/2002                             }
{                                                       }
{*******************************************************}

unit uDbLinhaMsgBoleto;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbLinhaMsgBoleto = class(TCmDbObject)

  private
    FIdmsgboleto: TCmDbField;
    FLmbtextolinha: TCmDbField;
    FLmbnumlinha: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    FTrguserinclusao: TCmDbField;
    procedure SetIdmsgboleto(const Value: TCmDbField);
    procedure SetLmbnumlinha(const Value: TCmDbField);
    procedure SetLmbtextolinha(const Value: TCmDbField);
    procedure SetTrgdtinclusao(const Value: TCmDbField);
    procedure SetTrguserinclusao(const Value: TCmDbField);

  public

     Property Trguserinclusao: TCmDbField read FTrguserinclusao write SetTrguserinclusao;
     Property Trgdtinclusao: TCmDbField read FTrgdtinclusao write SetTrgdtinclusao;
     Property Lmbtextolinha: TCmDbField read FLmbtextolinha write SetLmbtextolinha;
     Property Lmbnumlinha: TCmDbField read FLmbnumlinha write SetLmbnumlinha;
     Property Idmsgboleto: TCmDbField read FIdmsgboleto write SetIdmsgboleto;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbLinhaMsgBoleto }

constructor TDbLinhaMsgBoleto.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'LINHAMSGBOLETO';

   fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,True,'');
   fTrgdtinclusao := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,False,False,False,True,'');
   fLmbtextolinha := CreateCmDbField('LMBTEXTOLINHA',ftString,False,False,False,True,'Conteúdo da Linha do Boleto');
   fLmbnumlinha := CreateCmDbField('LMBNUMLINHA',ftfloat,True,True,False,True,'Nr. da Linha');
   fIdmsgboleto := CreateCmDbField('IDMSGBOLETO',ftfloat,True,True,False,True,'ID do Boleto');
end;

function TDbLinhaMsgBoleto.Insert: Boolean;
begin
   Result := Inherited Insert;
end;


procedure TDbLinhaMsgBoleto.SetIdmsgboleto(const Value: TCmDbField);
begin
  FIdmsgboleto := Value;
end;

procedure TDbLinhaMsgBoleto.SetLmbnumlinha(const Value: TCmDbField);
begin
  FLmbnumlinha := Value;
end;

procedure TDbLinhaMsgBoleto.SetLmbtextolinha(const Value: TCmDbField);
begin
  FLmbtextolinha := Value;
end;

procedure TDbLinhaMsgBoleto.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

procedure TDbLinhaMsgBoleto.SetTrguserinclusao(const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;

end.



