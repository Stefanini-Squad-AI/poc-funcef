{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marcio Motta                    }
{ Atualizado Em: 05/04/2004                             }
{                                                       }
{*******************************************************}

unit uDbIndlote;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbIndlote = class(TCmDbObject)

  private
    FDescricao: TCmDbField;
    FIdlayoutimp: TCmDbField;
    FIdIndLote: TCmDbField;
    FIdimovel: TCmDbField;
    FTipolanca: TCmDbField;
    FArquivoimp: TCmDbField;
    FDataapuracao: TCmDbField;
    procedure SetArquivoimp(const Value: TCmDbField);
    procedure SetDataapuracao(const Value: TCmDbField);
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdimovel(const Value: TCmDbField);
    procedure SetIdlayoutimp(const Value: TCmDbField);
    procedure SetIdIndLote(const Value: TCmDbField);
    procedure SetTipolanca(const Value: TCmDbField);

  public

     Property Tipolanca: TCmDbField read FTipolanca write SetTipolanca;
     Property IdIndLote: TCmDbField read FIdIndLote write SetIdIndLote;
     Property Idlayoutimp: TCmDbField read FIdlayoutimp write SetIdlayoutimp;
     Property Idimovel: TCmDbField read FIdimovel write SetIdimovel;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property Dataapuracao: TCmDbField read FDataapuracao write SetDataapuracao;
     Property Arquivoimp: TCmDbField read FArquivoimp write SetArquivoimp;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbIndlote }

constructor TDbIndlote.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'INDLOTE';

  fTipolanca    := CreateCmDbField('TIPOLANCA',ftString,False,False,False,True,'Tipo de Lançamento');
  fIdIndLote    := CreateCmDbField('IDINDLOTE',ftfloat,True,True,False,True,'ID Lote');
  fIdlayoutimp  := CreateCmDbField('IDLAYOUTIMP',ftfloat,False,False,False,True,'ID Layout Importação');
  fIdimovel     := CreateCmDbField('IDIMOVEL',ftfloat,False,False,False,True,'ID Imóve');
  fDescricao    := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'Descrição Lote');
  fDataapuracao := CreateCmDbField('DATAAPURACAO',ftDateTime,False,False,False,True,'Data de Apuração');
  fArquivoimp   := CreateCmDbField('ARQUIVOIMP',ftString,False,False,False,True,'Arquivo de Importação');
end;

function TDbIndlote.Insert: Boolean;
begin
  fIdIndLote.AsFloat := GetSequence('INDLOTE');
  Result := Inherited Insert;
end;


procedure TDbIndlote.SetArquivoimp(const Value: TCmDbField);
begin
  FArquivoimp := Value;
end;

procedure TDbIndlote.SetDataapuracao(const Value: TCmDbField);
begin
  FDataapuracao := Value;
end;

procedure TDbIndlote.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbIndlote.SetIdimovel(const Value: TCmDbField);
begin
  FIdimovel := Value;
end;

procedure TDbIndlote.SetIdlayoutimp(const Value: TCmDbField);
begin
  FIdlayoutimp := Value;
end;

procedure TDbIndlote.SetIdIndLote(const Value: TCmDbField);
begin
  FIdIndLote := Value;
end;

procedure TDbIndlote.SetTipolanca(const Value: TCmDbField);
begin
  FTipolanca := Value;
end;


end.



