{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia                       }
{ Atualizado Em: 11/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbContratoProd;

interface

Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbContratoProd = class(TCmDbObject)

  private
    FDataTermino: TCmDbField;
    FDataInicio: TCmDbField;
    FIdForCli: TCmDbField;
    FVlrUnitario: TCmDbField;
    FCodArtigo: TCmDbField;
    FIdContratoProd: TCmDbField;
    FCodMedida: TCmDbField;
    FQtdeEsperada: TCmDbField;
    FPrazoPag: TCmDbField;
    FIdComprador: TCmDbField;
    FIdPessoa: TCmDbField;
    procedure SetCodArtigo(const Value: TCmDbField);
    procedure SetCodMedida(const Value: TCmDbField);
    procedure SetDataInicio(const Value: TCmDbField);
    procedure SetDataTermino(const Value: TCmDbField);
    procedure SetIdComprador(const Value: TCmDbField);
    procedure SetIdContratoProd(const Value: TCmDbField);
    procedure SetIdForCli(const Value: TCmDbField);
    procedure SetIdPessoa(const Value: TCmDbField);
    procedure SetPrazoPag(const Value: TCmDbField);
    procedure SetQtdeEsperada(const Value: TCmDbField);
    procedure SetVlrUnitario(const Value: TCmDbField);

  public

     Property VlrUnitario   : TCmDbField read FVlrUnitario write SetVlrUnitario;
     Property QtdeEsperada  : TCmDbField read FQtdeEsperada write SetQtdeEsperada;
     Property PrazoPag      : TCmDbField read FPrazoPag write SetPrazoPag;
     Property IdPessoa      : TCmDbField read FIdPessoa write SetIdPessoa;
     Property IdForCli      : TCmDbField read FIdForCli write SetIdForCli;
     Property IdContratoProd: TCmDbField read FIdContratoProd write SetIdContratoProd;
     Property IdComprador   : TCmDbField read FIdComprador write SetIdComprador;
     Property DataTermino   : TCmDbField read FDataTermino write SetDataTermino;
     Property DataInicio    : TCmDbField read FDataInicio write SetDataInicio;
     Property CodMedida     : TCmDbField read FCodMedida write SetCodMedida;
     Property CodArtigo     : TCmDbField read FCodArtigo write SetCodArtigo;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbContratoProd }

constructor TDbContratoProd.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CONTRATOPROD';

   fVlrunitario    := CreateCmDbField('VLRUNITARIO'   ,ftfloat    ,True,False,False,True  ,'Valor Unitário');
   fQtdeesperada   := CreateCmDbField('QTDEESPERADA'  ,ftfloat    ,False,False,False,True ,'Qtde. Esperada');
   fPrazopag       := CreateCmDbField('PRAZOPAG'      ,ftfloat    ,False,False,False,True ,'Prazo de Pagamento');
   fIdpessoa       := CreateCmDbField('IDPESSOA'      ,ftfloat    ,True,False,False,True  ,'Empresa');
   fIdforcli       := CreateCmDbField('IDFORCLI'      ,ftfloat    ,True,False,False,True  ,'Fornecedor');
   fIdcontratoprod := CreateCmDbField('IDCONTRATOPROD',ftfloat    ,True,True,False,True   ,'Chave sequencial');
   fIdcomprador    := CreateCmDbField('IDCOMPRADOR'   ,ftfloat    ,True,False,False,True  ,'Comprador');
   fDatatermino    := CreateCmDbField('DATATERMINO'   ,ftDateTime ,True,False,False,True  ,'Data de Término');
   fDatainicio     := CreateCmDbField('DATAINICIO'    ,ftDateTime ,False,False,False,True ,'Data de Início');
   fCodmedida      := CreateCmDbField('CODMEDIDA'     ,ftString   ,True,False,False,True  ,'Unidade de Medida');
   fCodartigo      := CreateCmDbField('CODARTIGO'     ,ftString   ,True,False,False,True  ,'Artigo');
end;

function TDbContratoProd.Insert: Boolean;
begin

   fIdcontratoprod.AsFloat := GetSequence('CONTRATOPROD');
   Result := Inherited Insert;

end;

function TDbContratoProd.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbContratoProd.SetCodArtigo(const Value: TCmDbField);
begin
  FCodArtigo := Value;
end;

procedure TDbContratoProd.SetCodMedida(const Value: TCmDbField);
begin
  FCodMedida := Value;
end;

procedure TDbContratoProd.SetDataInicio(const Value: TCmDbField);
begin
  FDataInicio := Value;
end;

procedure TDbContratoProd.SetDataTermino(const Value: TCmDbField);
begin
  FDataTermino := Value;
end;

procedure TDbContratoProd.SetIdComprador(const Value: TCmDbField);
begin
  FIdComprador := Value;
end;

procedure TDbContratoProd.SetIdContratoProd(const Value: TCmDbField);
begin
  FIdContratoProd := Value;
end;

procedure TDbContratoProd.SetIdForCli(const Value: TCmDbField);
begin
  FIdForCli := Value;
end;

procedure TDbContratoProd.SetIdPessoa(const Value: TCmDbField);
begin
  FIdPessoa := Value;
end;

procedure TDbContratoProd.SetPrazoPag(const Value: TCmDbField);
begin
  FPrazoPag := Value;
end;

procedure TDbContratoProd.SetQtdeEsperada(const Value: TCmDbField);
begin
  FQtdeEsperada := Value;
end;

procedure TDbContratoProd.SetVlrUnitario(const Value: TCmDbField);
begin
  FVlrUnitario := Value;
end;

end.



