{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 04/04/2006                             }
{                                                       }
{*******************************************************}

unit uDbBoleta;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbBoleta = class(TCmDbObject)

  private
    FObservacao: TCmDbField;
    FIdforcli: TCmDbField;
    FDataboleta: TCmDbField;
    FVlrtotapag: TCmDbField;
    FVlrtotarec: TCmDbField;
    FIdboleta: TCmDbField;
    FCoddocumento: TCmDbField;
    FPlncodigo: TCmDbField;
    FSeqboleta: TCmDbField;
    FPlano: TCmDbField;
    FStatus: TCmDbField;
    FTipmovboleta: TCmDbField;
    FPercdevcorret: TCmDbField;
    procedure SetCoddocumento(const Value: TCmDbField);
    procedure SetDataboleta(const Value: TCmDbField);
    procedure SetIdboleta(const Value: TCmDbField);
    procedure SetIdforcli(const Value: TCmDbField);
    procedure SetObservacao(const Value: TCmDbField);
    procedure SetPercdevcorret(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetPlncodigo(const Value: TCmDbField);
    procedure SetSeqboleta(const Value: TCmDbField);
    procedure SetStatus(const Value: TCmDbField);
    procedure SetTipmovboleta(const Value: TCmDbField);
    procedure SetVlrtotapag(const Value: TCmDbField);
    procedure SetVlrtotarec(const Value: TCmDbField);

  public

     Property Vlrtotarec: TCmDbField read FVlrtotarec write SetVlrtotarec;
     Property Vlrtotapag: TCmDbField read FVlrtotapag write SetVlrtotapag;
     Property Tipmovboleta: TCmDbField read FTipmovboleta write SetTipmovboleta;
     Property Status: TCmDbField read FStatus write SetStatus;
     Property Seqboleta: TCmDbField read FSeqboleta write SetSeqboleta;
     Property Plncodigo: TCmDbField read FPlncodigo write SetPlncodigo;
     Property Plano: TCmDbField read FPlano write SetPlano;
     Property Percdevcorret: TCmDbField read FPercdevcorret write SetPercdevcorret;
     Property Observacao: TCmDbField read FObservacao write SetObservacao;
     Property Idforcli: TCmDbField read FIdforcli write SetIdforcli;
     Property Idboleta: TCmDbField read FIdboleta write SetIdboleta;
     Property Databoleta: TCmDbField read FDataboleta write SetDataboleta;
     Property Coddocumento: TCmDbField read FCoddocumento write SetCoddocumento;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbBoleta }

constructor TDbBoleta.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'BOLETA';

   fVlrtotarec := CreateCmDbField('VLRTOTAREC',ftfloat,False,False,False,True,'Valor Total a Receber');
   fVlrtotapag := CreateCmDbField('VLRTOTAPAG',ftfloat,False,False,False,True,'Valor Total a Pagar');
   fTipmovboleta := CreateCmDbField('TIPMOVBOLETA',ftString,False,False,False,True,'Tipo de Movimentação');
   fStatus := CreateCmDbField('STATUS',ftString,False,False,False,True,'Status');
   fSeqboleta := CreateCmDbField('SEQBOLETA',ftfloat,False,False,False,True,'Sequenciador');
   fPlncodigo := CreateCmDbField('PLNCODIGO',ftfloat,False,False,False,True,'Planilha');
   fPlano := CreateCmDbField('PLANO',ftfloat,False,False,False,True,'Plano');
   fPercdevcorret := CreateCmDbField('PERCDEVCORRET',ftfloat,False,False,False,True,'Percentual de Devolução');
   fObservacao := CreateCmDbField('OBSERVACAO',ftString,False,False,False,True,'Observação');
   fIdforcli := CreateCmDbField('IDFORCLI',ftfloat,False,False,False,True,'Fornecedor/Cliente');
   fIdboleta := CreateCmDbField('IDBOLETA',ftString,True,True,False,True,'Identificador da Boleta');
   fDataboleta := CreateCmDbField('DATABOLETA',ftDateTime,False,False,False,True,'Data da Boleta');
   fCoddocumento := CreateCmDbField('CODDOCUMENTO',ftfloat,False,False,False,True,'Documento Financeiro');
end;

function TDbBoleta.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDbBoleta.SetCoddocumento(const Value: TCmDbField);
begin
  FCoddocumento := Value;
end;

procedure TDbBoleta.SetDataboleta(const Value: TCmDbField);
begin
  FDataboleta := Value;
end;

procedure TDbBoleta.SetIdboleta(const Value: TCmDbField);
begin
  FIdboleta := Value;
end;

procedure TDbBoleta.SetIdforcli(const Value: TCmDbField);
begin
  FIdforcli := Value;
end;

procedure TDbBoleta.SetObservacao(const Value: TCmDbField);
begin
  FObservacao := Value;
end;

procedure TDbBoleta.SetPercdevcorret(const Value: TCmDbField);
begin
  FPercdevcorret := Value;
end;

procedure TDbBoleta.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

procedure TDbBoleta.SetPlncodigo(const Value: TCmDbField);
begin
  FPlncodigo := Value;
end;

procedure TDbBoleta.SetSeqboleta(const Value: TCmDbField);
begin
  FSeqboleta := Value;
end;

procedure TDbBoleta.SetStatus(const Value: TCmDbField);
begin
  FStatus := Value;
end;

procedure TDbBoleta.SetTipmovboleta(const Value: TCmDbField);
begin
  FTipmovboleta := Value;
end;

procedure TDbBoleta.SetVlrtotapag(const Value: TCmDbField);
begin
  FVlrtotapag := Value;
end;

procedure TDbBoleta.SetVlrtotarec(const Value: TCmDbField);
begin
  FVlrtotarec := Value;
end;

end.



