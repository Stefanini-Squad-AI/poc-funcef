{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 23/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbIndicadorXApur;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbIndicadorXApur = class(TCmDbObject)

  private
    FDataapurado: TCmDbField;
    FIdimovel: TCmDbField;
    FIdindicadorxapur: TCmDbField;
    FFlgprevreal: TCmDbField;
    FMescompetencia: TCmDbField;
    FIdindicadorimovel: TCmDbField;
    FAnocompetencia: TCmDbField;
    FVlrapurado: TCmDbField;
    FIdunidaut: TCmDbField;
    FFlgtipoapuracao: TCmDbField;

    // Daniel - 24872
    FIdDocumento: TCmDbField;
    FsObservacao: TCmDbField;
    // Fim.

    FIdSeguroImovel: TCmDbField; // Daniel - 26236

    procedure SetAnocompetencia(const Value: TCmDbField);
    procedure SetDataapurado(const Value: TCmDbField);
    procedure SetFlgprevreal(const Value: TCmDbField);
    procedure SetIdimovel(const Value: TCmDbField);
    procedure SetIdindicadorimovel(const Value: TCmDbField);
    procedure SetIdindicadorxapur(const Value: TCmDbField);
    procedure SetIdunidaut(const Value: TCmDbField);
    procedure SetMescompetencia(const Value: TCmDbField);
    procedure SetVlrapurado(const Value: TCmDbField);
    procedure SetFlgtipoapuracao(const Value: TCmDbField);
    procedure SetIdDocumento(const Value: TcmDbField);
    procedure SetsObservacao(const Value: TCmDbField);
    procedure SetIdSeguroImovel(const Value: TCmDbField);

  public

     Property Vlrapurado: TCmDbField read FVlrapurado write SetVlrapurado;
     Property Mescompetencia: TCmDbField read FMescompetencia write SetMescompetencia;
     Property Idunidaut: TCmDbField read FIdunidaut write SetIdunidaut;
     Property Idindicadorxapur: TCmDbField read FIdindicadorxapur write SetIdindicadorxapur;
     Property Idindicadorimovel: TCmDbField read FIdindicadorimovel write SetIdindicadorimovel;
     Property Idimovel: TCmDbField read FIdimovel write SetIdimovel;
     Property Flgprevreal: TCmDbField read FFlgprevreal write SetFlgprevreal;
     Property Dataapurado: TCmDbField read FDataapurado write SetDataapurado;
     Property Anocompetencia: TCmDbField read FAnocompetencia write SetAnocompetencia;
     Property Flgtipoapuracao: TCmDbField read FFlgtipoapuracao write SetFlgtipoapuracao;

     // Daniel - 24872
     property IdDocumento: TCmDbField read FIdDocumento write SetIdDocumento;
     property sObservacao: TCmDbField read FsObservacao write SetsObservacao;
     // Fim.

     property IdSeguroImovel: TCmDbField read FIdSeguroImovel write SetIdSeguroImovel; // Daniel - 26236

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbIndicadorXApur }

constructor TDbIndicadorXApur.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'INDICADORXAPUR';

   fVlrapurado        := CreateCmDbField('VLRAPURADO',ftfloat,True,False,False,False,'Valor Indicador');
   fMescompetencia    := CreateCmDbField('MESCOMPETENCIA',ftfloat,True,False,False,True,'Mês de Competência');
   fIdunidaut         := CreateCmDbField('IDUNIDAUT',ftfloat,False,False,False,True,'');
   fIdindicadorxapur  := CreateCmDbField('IDINDICADORXAPUR',ftfloat,True,True,False,True,'');
   fIdindicadorimovel := CreateCmDbField('IDINDICADORIMOVEL',ftfloat,True,False,False,True,'Indicador');
   fIdimovel          := CreateCmDbField('IDIMOVEL',ftfloat,False,False,False,True,'');
   fFlgprevreal       := CreateCmDbField('FLGPREVREAL',ftString,True,False,False,True,'Previsto / Realizado');
   fDataapurado       := CreateCmDbField('DATAAPURADO',ftDateTime,True,False,False,True,'Data da Apuração');
   fAnocompetencia    := CreateCmDbField('ANOCOMPETENCIA',ftfloat,True,False,False,True,'Ano de Competência');
   fFlgtipoapuracao   := CreateCmDbField('FLGTIPOAPURACAO',ftString,False,False,False,True,'Tipo da Apuração');

   // Daniel - 24872
   FIdDocumento       := CreateCmDbField('IDDOCUMENTO',ftfloat,False,False,False,True,'Identificador do Documento Gerado');
   FsObservacao       := CreateCmDbField('OBSERVACAO',ftString,False,False,False,True,'Observação');
   // Fim.

   // Daniel - 26236
   FIdSeguroImovel    := CreateCmDbField('IDSEGUROIMOVEL',ftfloat,False,False,False,True,'Identificador do Seguro');
end;

function TDbIndicadorXApur.Insert: Boolean;
begin

   fIdindicadorxapur.AsFloat := GetSequence('INDICADORXAPUR');
   Result := Inherited Insert;

end;

function TDbIndicadorXApur.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbIndicadorXApur.SetAnocompetencia(const Value: TCmDbField);
begin
  FAnocompetencia := Value;
end;

procedure TDbIndicadorXApur.SetDataapurado(const Value: TCmDbField);
begin
  FDataapurado := Value;
end;

procedure TDbIndicadorXApur.SetFlgprevreal(const Value: TCmDbField);
begin
  FFlgprevreal := Value;
end;

procedure TDbIndicadorXApur.SetFlgtipoapuracao(const Value: TCmDbField);
begin
  FFlgtipoapuracao := Value;
end;

// Daniel - 24872 - Início -----------------------------------------------------
procedure TDbIndicadorXApur.SetIdDocumento(const Value: TcmDbField);
begin
  FIdDocumento := Value;
end;
// Daniel - 24872 - Fim --------------------------------------------------------

procedure TDbIndicadorXApur.SetIdimovel(const Value: TCmDbField);
begin
  FIdimovel := Value;
end;

procedure TDbIndicadorXApur.SetIdindicadorimovel(const Value: TCmDbField);
begin
  FIdindicadorimovel := Value;
end;

procedure TDbIndicadorXApur.SetIdindicadorxapur(const Value: TCmDbField);
begin
  FIdindicadorxapur := Value;
end;

procedure TDbIndicadorXApur.SetIdSeguroImovel(const Value: TCmDbField);
begin
  FIdSeguroImovel := Value;
end;

procedure TDbIndicadorXApur.SetIdunidaut(const Value: TCmDbField);
begin
  FIdunidaut := Value;
end;

procedure TDbIndicadorXApur.SetMescompetencia(const Value: TCmDbField);
begin
  FMescompetencia := Value;
end;

procedure TDbIndicadorXApur.SetsObservacao(const Value: TCmDbField);
begin
  FsObservacao := Value;
end;

procedure TDbIndicadorXApur.SetVlrapurado(const Value: TCmDbField);
begin
  FVlrapurado := Value;
end;

end.



