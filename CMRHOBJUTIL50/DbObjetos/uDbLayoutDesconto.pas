{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 25/06/2002                                 }
{                                                       }
{*******************************************************}

unit uDbLayoutDesconto;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB;

type
  TDbLayoutDesconto = class(TCmDbObject)
  private
    FIdLayout: TCmDbField;
    FColCodigo: TCmDbField;
    FLinhasTrailler: TCmDbField;
    FFlgTrataResiduo: TCmDbField;
    FFlgPossuiDep: TCmDbField;
    FDiaPagamento: TCmDbField;
    FFlgEntSai: TCmDbField;
    FTamCodigoDep: TCmDbField;
    FColCodigoDep: TCmDbField;
    FLinhasHeader: TCmDbField;
    FFlgMesPagto: TCmDbField;
    FFlgTipoConvenio: TCmDbField;
    FTamCodigo: TCmDbField;
    FLimiteMinimo: TCmDbField;
    FTamCodFavorecido: TCmDbField;
    FUltImport: TCmDbField;
    FFlgmatricula: TCmDbField;
    FDescricao: TCmDbField;
    FFlgUsaHeadTrai: TCmDbField;
    FLimiteMaximo: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert: boolean; override;

    property IdLayout: TCmDbField read FIdLayout write FIdLayout;
    property UltImport: TCmDbField read FUltImport write FUltImport;
    property TamCodigoDep: TCmDbField read FTamCodigoDep write FTamCodigoDep;
    property TamCodigo: TCmDbField read FTamCodigo write FTamCodigo;
    property TamCodFavorecido: TCmDbField read FTamCodFavorecido write FTamCodFavorecido;
    property LinhasTrailler: TCmDbField read FLinhasTrailler write FLinhasTrailler;
    property LinhasHeader: TCmDbField read FLinhasHeader write FLinhasHeader;
    property LimiteMinimo: TCmDbField read FLimiteMinimo write FLimiteMinimo;
    property LimiteMaximo: TCmDbField read FLimiteMaximo write FLimiteMaximo;
    property FlgUsaHeadTrai: TCmDbField read FFlgUsaHeadTrai write FFlgUsaHeadTrai;
    property FlgTrataResiduo: TCmDbField read FFlgTrataResiduo write FFlgTrataResiduo;
    property FlgTipoConvenio: TCmDbField read FFlgTipoConvenio write FFlgTipoConvenio;
    property FlgPossuiDep: TCmDbField read FFlgPossuiDep write FFlgPossuiDep;
    property FlgMesPagto: TCmDbField read FFlgMesPagto write FFlgMesPagto;
    property FlgMatricula: TCmDbField read FFlgmatricula write FFlgmatricula;
    property FlgEntSai: TCmDbField read FFlgEntSai write FFlgEntSai;
    property DiaPagamento: TCmDbField read FDiaPagamento write FDiaPagamento;
    property Descricao: TCmDbField read FDescricao write FDescricao;
    property ColCodigoDep: TCmDbField read FColCodigoDep write FColCodigoDep;
    property ColCodigo: TCmDbField read FColCodigo write FColCodigo;
    property ColCodFavorecido: TCmDbField read FColCodigo write FColCodigo;
  end;

implementation

{ TDbLayoutDesconto }

constructor TDbLayoutDesconto.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'LAYOUTDESCONTO';

  FIdLayout := CreateCmDbField('IDLAYOUT',ftFloat,true,true,false,false,'');
  FUltImport := CreateCmDbField('ULTIMPORT',ftString,false,false,false,false,'');
  FTamCodigoDep := CreateCmDbField('TAMCODIGODEP',ftFloat,false,false,false,false,'');
  FTamCodigo := CreateCmDbField('TAMCODIGO',ftFloat,false,false,false,false,'');
  FColCodigo := CreateCmDbField('COLCODFAVORECIDO',ftFloat,false,false,false,false,'');
  FTamCodFavorecido := CreateCmDbField('TAMCODFAVORECIDO',ftFloat,false,false,false,false,'');
  FLinhasTrailler := CreateCmDbField('LINHASTRAILLER',ftFloat,false,false,false,false,'');
  FLinhasHeader := CreateCmDbField('LINHASHEADER',ftFloat,false,false,false,false,'');
  FLimiteMinimo := CreateCmDbField('LIMITEMINIMO',ftFloat,false,false,false,false,'');
  FLimiteMaximo := CreateCmDbField('LIMITEMAXIMO',ftFloat,false,false,false,false,'');
  FFlgUsaHeadTrai := CreateCmDbField('FLGUSAHEADTRAI',ftFloat,false,false,false,false,'');
  FFlgTrataResiduo := CreateCmDbField('FLGTRATARESIDUO',ftFloat,false,false,false,false,'');
  FFlgTipoConvenio := CreateCmDbField('FLGTIPOCONVENIO',ftFloat,false,false,false,false,'');
  FFlgPossuiDep := CreateCmDbField('FLGPOSSUIDEP',ftFloat,false,false,false,false,'');
  FFlgMesPagto := CreateCmDbField('FLGMESPAGTO',ftFloat,false,false,false,false,'');
  FFlgmatricula := CreateCmDbField('FLGMATRICULA',ftFloat,false,false,false,false,'');
  FFlgEntSai := CreateCmDbField('FLGENTSAI',ftFloat,false,false,false,false,'');
  FDiaPagamento := CreateCmDbField('DIAPAGAMENTO',ftFloat,false,false,false,false,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,false,false,false,false,'');
  FColCodigoDep := CreateCmDbField('COLCODIGODEP',ftFloat,false,false,false,false,'');
  FColCodigo := CreateCmDbField('COLCODIGO',ftFloat,false,false,false,false,'');
end;

function TDbLayoutDesconto.Insert: boolean;
begin
  FIdLayout.asFloat := GetSequence('LAYOUTDESCONTO');
  Result := inherited Insert;
end;

end.
