{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia                       }
{ Atualizado Em: 21/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbItemSCPrePronta;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbItemSCPrePronta = class(TCmDbObject)

  private
    FQtdePessoa: TCmDbField;
    FIdSCPrePronta: TCmDbField;
    FCodMedida: TCmDbField;
    FCodArtigo: TCmDbField;
    FNdias: TCmDbField;
    procedure SetCodArtigo(const Value: TCmDbField);
    procedure SetCodMedida(const Value: TCmDbField);
    procedure SetIdSCPrePronta(const Value: TCmDbField);
    procedure SetNdias(const Value: TCmDbField);
    procedure SetQtdePessoa(const Value: TCmDbField);

  public

     Property QtdePessoa    : TCmDbField read FQtdePessoa write SetQtdePessoa;
     Property Ndias         : TCmDbField read FNdias write SetNdias;
     Property IdSCPrePronta : TCmDbField read FIdSCPrePronta write SetIdSCPrePronta;
     Property CodMedida     : TCmDbField read FCodMedida write SetCodMedida;
     Property CodArtigo     : TCmDbField read FCodArtigo write SetCodArtigo;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbItemSCPrePronta }

constructor TDbItemSCPrePronta.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  _UpdateKeyFields := True;

  TableName := 'ITEMSCPREPRONTA';


  fQtdepessoa     := CreateCmDbField('QTDEPESSOA'    ,ftfloat,True,False,False,True,'Qtde. de Pessoas');
  fNdias          := CreateCmDbField('NDIAS'         ,ftfloat,True,False,False,True,'Nº de Dias');
  fIdscprepronta  := CreateCmDbField('IDSCPREPRONTA' ,ftfloat,False,True,False,True,'Chave Sequencial');
  fCodmedida      := CreateCmDbField('CODMEDIDA'     ,ftString,True,False,False,True,'Unidade de Medida');
  fCodartigo      := CreateCmDbField('CODARTIGO'     ,ftString,False,True,False,True,'Artigo');

end;

function TDbItemSCPrePronta.Insert: Boolean;
begin

  Result := Inherited Insert;

end;

function TDbItemSCPrePronta.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbItemSCPrePronta.SetCodArtigo(const Value: TCmDbField);
begin
  FCodArtigo := Value;
end;

procedure TDbItemSCPrePronta.SetCodMedida(const Value: TCmDbField);
begin
  FCodMedida := Value;
end;

procedure TDbItemSCPrePronta.SetIdSCPrePronta(const Value: TCmDbField);
begin
  FIdSCPrePronta := Value;
end;

procedure TDbItemSCPrePronta.SetNdias(const Value: TCmDbField);
begin
  FNdias := Value;
end;

procedure TDbItemSCPrePronta.SetQtdePessoa(const Value: TCmDbField);
begin
  FQtdePessoa := Value;
end;

end.



