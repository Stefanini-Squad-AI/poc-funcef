{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 19/08/2002                             }
{                                                       
--------------------------------------------------------------------------------
Nº SOL......: 207703.18299
Data........: 08/07/2016
Responsável.: Darivaldo Alencar
Descrição...: Inclusão de campo Percentual tabela IMOVEL.
--------------------------------------------------------------------------------------------------
N. Sol..........: 131027
N. Kintana......: 745170
Data............: 21/05/2010
Responsável.....: Felipe de Oliveira
Descrição.......: Inclusão de dos campos Imóvel Arrematado e Data de Arrematação
                  Para o módulo Administração Imobiliária
--------------------------------------------------------------------------------
N. Sol..........: 132558
N. Kintana......: 766564
Data............: 20/05/2010
Responsável.....: Felipe de Oliveira
Descrição.......: Inclusão de dos campos Imóvel Arrematado e Data de Arrematação
                  Para o módulo Alienação
--------------------------------------------------------------------------------
*******************************************************}

unit uDbImovel;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbImovel = class(TCmDbObject)

  private
    FImoarea: TCmDbField;
    FImodescricao: TCmDbField;
    FImodatacompra: TCmDbField;
    FImomoedareaval: TCmDbField;
    FIdcartorio: TCmDbField;
    FFlgcatimovel: TCmDbField;
    FImonomeendereco: TCmDbField;
    FImodataconstrucao: TCmDbField;
    FImofracaoideal: TCmDbField;
    FImodatamercado: TCmDbField;
    FIdimovelmestre: TCmDbField;
    FFlgstatusocupacao: TCmDbField;
    FImocodigo: TCmDbField;
    FImoobservacao: TCmDbField;
    FFlgtipoimovel: TCmDbField;
    FImonome: TCmDbField;
    FCodsubconta: TCmDbField;
    FImovlrmercado: TCmDbField;
    FIdimovel: TCmDbField;
    FIdmarca: TCmDbField;
    FImoareatotal: TCmDbField;
    FImodatahabitese: TCmDbField;
    FIdpessoa: TCmDbField;
    FImomatricula: TCmDbField;
    FImobairro: TCmDbField;
    FImopercentrateio: TCmDbField;
    FImomoedacompra: TCmDbField;
    FIdadminimovel: TCmDbField;
    FFlgstatus: TCmDbField;
    FImovlrcompra: TCmDbField;
    FImologradouro: TCmDbField;
    FIdcidades: TCmDbField;
    FImonumero: TCmDbField;
    FImovlrreaval: TCmDbField;
    FImomoedamercado: TCmDbField;
    FCodtipimovel: TCmDbField;
    FImoareagerencial: TCmDbField;
    FQtdetotalcotas: TCmDbField;
    FImovagas: TCmDbField;
    FImocomplemento: TCmDbField;
    FImodatareaval: TCmDbField;
    FFlgativo: TCmDbField;
    FIdresponsavel: TCmDbField;
    FImoareacomum: TCmDbField;
    FImocep: TCmDbField;
    FCodImovelSPC: TCmDbField;
    FIdCarteirasPC: TCmDbField;
    FIndiceCompra: TCmDbField;
    FTaxaCompra: TCmDbField;
    FIdImovelPai: TCmDbField;
    FImoArrematado: TCmDbField;
    FImoDataArrematado: TCmDbField;
    FImoPercentual: TCmDbField;

    procedure SetCodsubconta(const Value: TCmDbField);
    procedure SetCodtipimovel(const Value: TCmDbField);
    procedure SetFlgativo(const Value: TCmDbField);
    procedure SetFlgcatimovel(const Value: TCmDbField);
    procedure SetFlgstatus(const Value: TCmDbField);
    procedure SetFlgstatusocupacao(const Value: TCmDbField);
    procedure SetFlgtipoimovel(const Value: TCmDbField);
    procedure SetIdadminimovel(const Value: TCmDbField);
    procedure SetIdcartorio(const Value: TCmDbField);
    procedure SetIdcidades(const Value: TCmDbField);
    procedure SetIdimovel(const Value: TCmDbField);
    procedure SetIdimovelmestre(const Value: TCmDbField);
    procedure SetIdmarca(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdresponsavel(const Value: TCmDbField);
    procedure SetImoarea(const Value: TCmDbField);
    procedure SetImoareacomum(const Value: TCmDbField);
    procedure SetImoareagerencial(const Value: TCmDbField);
    procedure SetImoareatotal(const Value: TCmDbField);
    procedure SetImobairro(const Value: TCmDbField);
    procedure SetImocep(const Value: TCmDbField);
    procedure SetImocodigo(const Value: TCmDbField);
    procedure SetImocomplemento(const Value: TCmDbField);
    procedure SetImodatacompra(const Value: TCmDbField);
    procedure SetImodataconstrucao(const Value: TCmDbField);
    procedure SetImodatahabitese(const Value: TCmDbField);
    procedure SetImodatamercado(const Value: TCmDbField);
    procedure SetImodatareaval(const Value: TCmDbField);
    procedure SetImodescricao(const Value: TCmDbField);
    procedure SetImofracaoideal(const Value: TCmDbField);
    procedure SetImologradouro(const Value: TCmDbField);
    procedure SetImomatricula(const Value: TCmDbField);
    procedure SetImomoedacompra(const Value: TCmDbField);
    procedure SetImomoedamercado(const Value: TCmDbField);
    procedure SetImomoedareaval(const Value: TCmDbField);
    procedure SetImonome(const Value: TCmDbField);
    procedure SetImonomeendereco(const Value: TCmDbField);
    procedure SetImonumero(const Value: TCmDbField);
    procedure SetImoobservacao(const Value: TCmDbField);
    procedure SetImopercentrateio(const Value: TCmDbField);
    procedure SetImovagas(const Value: TCmDbField);
    procedure SetImovlrcompra(const Value: TCmDbField);
    procedure SetImovlrmercado(const Value: TCmDbField);
    procedure SetImovlrreaval(const Value: TCmDbField);
    procedure SetQtdetotalcotas(const Value: TCmDbField);
    procedure SetCodImovelSPC(const Value: TCmDbField);
    procedure SetIdCarteiraSpc(const Value: TCmDbField);
    procedure SetIndiceCompra(const Value: TCmDbField);
    procedure SetTaxaCompra(const Value: TCmDbField);
    procedure SetIdImovelPai(const Value: TCmDbField);
    // Felipe de Oliveira SOL 132558 Kintana 766564
    procedure SetImoArrematado(const Value: TCmDbField);
    procedure SetImoDataArrematado(const Value: TCmDbField);
    //Darivaldo Alencar SOL 207703.18299
    procedure SetImoPercentual(const Value: TCmDbField);

  public

     Property Qtdetotalcotas: TCmDbField read FQtdetotalcotas write SetQtdetotalcotas;
     Property Imovlrreaval: TCmDbField read FImovlrreaval write SetImovlrreaval;
     Property Imovlrmercado: TCmDbField read FImovlrmercado write SetImovlrmercado;
     Property Imovlrcompra: TCmDbField read FImovlrcompra write SetImovlrcompra;
     Property Imovagas: TCmDbField read FImovagas write SetImovagas;
     Property Imopercentrateio: TCmDbField read FImopercentrateio write SetImopercentrateio;
     Property Imoobservacao: TCmDbField read FImoobservacao write SetImoobservacao;
     Property Imonumero: TCmDbField read FImonumero write SetImonumero;
     Property Imonomeendereco: TCmDbField read FImonomeendereco write SetImonomeendereco;
     Property Imonome: TCmDbField read FImonome write SetImonome;
     Property Imomoedareaval: TCmDbField read FImomoedareaval write SetImomoedareaval;
     Property Imomoedamercado: TCmDbField read FImomoedamercado write SetImomoedamercado;
     Property Imomoedacompra: TCmDbField read FImomoedacompra write SetImomoedacompra;
     Property Imomatricula: TCmDbField read FImomatricula write SetImomatricula;
     Property Imologradouro: TCmDbField read FImologradouro write SetImologradouro;
     Property Imofracaoideal: TCmDbField read FImofracaoideal write SetImofracaoideal;
     Property Imodescricao: TCmDbField read FImodescricao write SetImodescricao;
     Property Imodatareaval: TCmDbField read FImodatareaval write SetImodatareaval;
     Property Imodatamercado: TCmDbField read FImodatamercado write SetImodatamercado;
     Property Imodatahabitese: TCmDbField read FImodatahabitese write SetImodatahabitese;
     Property Imodataconstrucao: TCmDbField read FImodataconstrucao write SetImodataconstrucao;
     Property Imodatacompra: TCmDbField read FImodatacompra write SetImodatacompra;
     Property Imocomplemento: TCmDbField read FImocomplemento write SetImocomplemento;
     Property Imocodigo: TCmDbField read FImocodigo write SetImocodigo;
     Property Imocep: TCmDbField read FImocep write SetImocep;
     Property Imobairro: TCmDbField read FImobairro write SetImobairro;
     Property Imoareatotal: TCmDbField read FImoareatotal write SetImoareatotal;
     Property Imoareagerencial: TCmDbField read FImoareagerencial write SetImoareagerencial;
     Property Imoareacomum: TCmDbField read FImoareacomum write SetImoareacomum;
     Property Imoarea: TCmDbField read FImoarea write SetImoarea;
     Property Idresponsavel: TCmDbField read FIdresponsavel write SetIdresponsavel;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idmarca: TCmDbField read FIdmarca write SetIdmarca;
     Property Idimovelmestre: TCmDbField read FIdimovelmestre write SetIdimovelmestre;
     Property Idimovel: TCmDbField read FIdimovel write SetIdimovel;
     Property Idcidades: TCmDbField read FIdcidades write SetIdcidades;
     Property Idcartorio: TCmDbField read FIdcartorio write SetIdcartorio;
     Property Idadminimovel: TCmDbField read FIdadminimovel write SetIdadminimovel;
     Property Flgtipoimovel: TCmDbField read FFlgtipoimovel write SetFlgtipoimovel;
     Property Flgstatusocupacao: TCmDbField read FFlgstatusocupacao write SetFlgstatusocupacao;
     Property Flgstatus: TCmDbField read FFlgstatus write SetFlgstatus;
     Property Flgcatimovel: TCmDbField read FFlgcatimovel write SetFlgcatimovel;
     Property Flgativo: TCmDbField read FFlgativo write SetFlgativo;
     Property Codtipimovel: TCmDbField read FCodtipimovel write SetCodtipimovel;
     Property Codsubconta: TCmDbField read FCodsubconta write SetCodsubconta;
     Property CodImovelSPC : TCmDbField read FCodImovelSPC write SetCodImovelSPC;
     Property IdCarteiraSpc : TCmDbField read FIdCarteiraSpc write SetIdCarteiraSpc;
     Property TaxaCompra : TCmDbField read FTaxaCompra write SetTaxaCompra;
     Property IndiceCompra : TCmDbField read FIndiceCompra write SetIndiceCompra;
     property IdImovelPai : TCmDbField read FIdImovelPai write SetIdImovelPai;
     // Felipe de Oliveira SOL 132558 Kintana 766564
     property ImoArrematado : TCmDbField read  FImoArrematado write SetImoArrematado;
     property ImoDataArrematado : TCmDbField read  FImoDataArrematado write SetImoDataArrematado;
     //Darivaldo Alencar SOL 207703.18299
     property ImoPercentual: TCmDbField read FImoPercentual write SetImoPercentual;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbImovel }

constructor TDbImovel.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'IMOVEL';

   fQtdetotalcotas := CreateCmDbField('QTDETOTALCOTAS',ftfloat,False,False,False,True,'Qtde. de cotas');
   fImovlrreaval := CreateCmDbField('IMOVLRREAVAL',ftfloat,False,False,False,True,'Valor da Reaval. Oficial');
   fImovlrmercado := CreateCmDbField('IMOVLRMERCADO',ftfloat,False,False,False,True,'Valor da Reaval. de mercado');
   fImovlrcompra := CreateCmDbField('IMOVLRCOMPRA',ftfloat,False,False,False,True,'Valor de Compra do imóvel');
   fImovagas := CreateCmDbField('IMOVAGAS',ftfloat,False,False,False,True,'Qtde de Vagas');
   fImopercentrateio := CreateCmDbField('IMOPERCENTRATEIO',ftfloat,False,False,False,True,'Percentual de Rateio');
   fImoobservacao := CreateCmDbField('IMOOBSERVACAO',ftString,False,False,False,True,'Observações gerais');
   fImonumero := CreateCmDbField('IMONUMERO',ftString,False,False,False,True,'Número do endereço');
   fImonomeendereco := CreateCmDbField('IMONOMEENDERECO',ftString,False,False,False,True,'Endereço de localização ');
   fImonome := CreateCmDbField('IMONOME',ftString,False,False,False,True,'Nome do Imóvel');
   fImomoedareaval := CreateCmDbField('IMOMOEDAREAVAL',ftfloat,False,False,False,True,'ID da moeda do vlr de reaval.');
   fImomoedamercado := CreateCmDbField('IMOMOEDAMERCADO',ftfloat,False,False,False,True,'ID da moeda do vlr de mercado');
   fImomoedacompra := CreateCmDbField('IMOMOEDACOMPRA',ftfloat,False,False,False,True,'ID da moeda de compra');
   fImomatricula := CreateCmDbField('IMOMATRICULA',ftString,False,False,False,True,'Matrícula de reg do cartório');
   fImologradouro := CreateCmDbField('IMOLOGRADOURO',ftString,False,False,False,True,'Logradouro do Imóvel');
   fImofracaoideal := CreateCmDbField('IMOFRACAOIDEAL',ftfloat,False,False,False,True,'Fração Ideal do imóvel');
   fImodescricao := CreateCmDbField('IMODESCRICAO',ftString,False,False,False,True,'Descrição do imóvel');
   fImodatareaval := CreateCmDbField('IMODATAREAVAL',ftDateTime,False,False,False,True,'Data da Reavaliação Oficial');
   fImodatamercado := CreateCmDbField('IMODATAMERCADO',ftDateTime,False,False,False,True,'Data da Reavaliação de Mercado');
   fImodatahabitese := CreateCmDbField('IMODATAHABITESE',ftDateTime,False,False,False,True,'Data do Habite-se do imóvel');
   fImodataconstrucao := CreateCmDbField('IMODATACONSTRUCAO',ftDateTime,False,False,False,True,'Data de Construção do imóvel');
   fImodatacompra := CreateCmDbField('IMODATACOMPRA',ftDateTime,False,False,False,True,'Data da Compra do imóvel');
   fImocomplemento := CreateCmDbField('IMOCOMPLEMENTO',ftString,False,False,False,True,'Complemento do endereço');
   fImocodigo := CreateCmDbField('IMOCODIGO',ftString,False,False,False,True,'Código do Imóvel');
   fImocep := CreateCmDbField('IMOCEP',ftString,False,False,False,True,'CEP do imóvel');
   fImobairro := CreateCmDbField('IMOBAIRRO',ftString,False,False,False,True,'Bairro de Localização');
   fImoareatotal := CreateCmDbField('IMOAREATOTAL',ftfloat,False,False,False,True,'Area total do imóvel');
   fImoareagerencial := CreateCmDbField('IMOAREAGERENCIAL',ftfloat,False,False,False,True,'Area gerencial do imóvel');
   fImoareacomum := CreateCmDbField('IMOAREACOMUM',ftfloat,False,False,False,True,'Area comum do imóvel');
   fImoarea := CreateCmDbField('IMOAREA',ftfloat,False,False,False,True,'Area útil do imóvel');
   fIdresponsavel := CreateCmDbField('IDRESPONSAVEL',ftfloat,False,False,False,True,'ID do Responsável pelo Imóvel');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'ID da Empresa proprietária');
   fIdmarca := CreateCmDbField('IDMARCA',ftfloat,False,False,False,True,'ID da Marca ou Atividade');
   fIdimovelmestre := CreateCmDbField('IDIMOVELMESTRE',ftfloat,False,False,False,True,'ID do Imóvel Mestre');
   fIdimovel := CreateCmDbField('IDIMOVEL',ftfloat,True,True,False,True,'ID do Imóvel');
   fIdcidades := CreateCmDbField('IDCIDADES',ftfloat,False,False,False,True,'ID da Cidade de localização');
   fIdcartorio := CreateCmDbField('IDCARTORIO',ftfloat,False,False,False,True,'ID do Cartório de Registro');
   fIdadminimovel := CreateCmDbField('IDADMINIMOVEL',ftfloat,False,False,False,True,'ID da Administradora do Imóvel');
   fFlgtipoimovel := CreateCmDbField('FLGTIPOIMOVEL',ftfloat,False,False,False,False,'Flag Imóvel / Imóvel Mestre');
   fFlgstatusocupacao := CreateCmDbField('FLGSTATUSOCUPACAO',ftString,False,False,False,True,'Flag de Ocupação do imóvel');
   fFlgstatus := CreateCmDbField('FLGSTATUS',ftString,False,False,False,True,'');
   fFlgcatimovel := CreateCmDbField('FLGCATIMOVEL',ftString,False,False,False,True,'');
   fFlgativo := CreateCmDbField('FLGATIVO',ftfloat,False,False,False,False,'Flag Ativo / Inativo');
   fCodtipimovel := CreateCmDbField('CODTIPIMOVEL',ftString,False,False,False,True,'Tipo de Imóvel');
   fCodImovelSPC := CreateCmDbField('CODIMOVELSPC',ftString,False,False,False,True,'Tipo de Imóvel no SPC');
   fCodsubconta := CreateCmDbField('CODSUBCONTA',ftfloat,False,False,False,True,'SubConta contábil relacionada');
   fIdCarteiraSpc := CreateCmDbField('IDCARTEIRASPC',ftfloat,False,False,False,True,'ID Tipo de Imóvel no Daiea Carteira');
   fTaxaCompra := CreateCmDbField('TAXACOMPRA',ftfloat,False,False,False,True,'Taxa de Compra');
   fIndiceCompra := CreateCmDbField('INDICECOMPRA',ftfloat,False,False,False,True,'Índice de Compra');

   fIdImovelPai := CreateCmDbField('IDIMOVELPAI',ftfloat,False,False,False,True,'ID da Unidade');

   // Felipe de Oliveira SOL 132558 Kintana 766564
   FImoArrematado := CreateCmDbField('IMOARREMATADO',ftString,False,False,False,False,'Imóvel Arrematado');
   FImoDataArrematado := CreateCmDbField('IMODATAARREMATADO',ftDateTime,False,False,False,True,'Data de Arrematação do Imóvel');

   //Darivaldo Alencar SOL 207703.18299
   FImoPercentual:= CreateCmDbField('PERCENTUAL',ftfloat,False,False,False,True,'Percentual da FUNCEF no Imóvel');
end;

function TDbImovel.Insert: Boolean;
begin

   fIdimovel.AsFloat := GetSequence('IMOVEL');
   Result := Inherited Insert;

end;


procedure TDbImovel.SetCodImovelSPC(const Value: TCmDbField);
begin
  FCodImovelSPC := Value;
end;

procedure TDbImovel.SetCodsubconta(const Value: TCmDbField);
begin
  FCodsubconta := Value;
end;

procedure TDbImovel.SetCodtipimovel(const Value: TCmDbField);
begin
  FCodtipimovel := Value;
end;

procedure TDbImovel.SetFlgativo(const Value: TCmDbField);
begin
  FFlgativo := Value;
end;

procedure TDbImovel.SetFlgcatimovel(const Value: TCmDbField);
begin
  FFlgcatimovel := Value;
end;

procedure TDbImovel.SetFlgstatus(const Value: TCmDbField);
begin
  FFlgstatus := Value;
end;

procedure TDbImovel.SetFlgstatusocupacao(const Value: TCmDbField);
begin
  FFlgstatusocupacao := Value;
end;

procedure TDbImovel.SetFlgtipoimovel(const Value: TCmDbField);
begin
  FFlgtipoimovel := Value;
end;

procedure TDbImovel.SetIdadminimovel(const Value: TCmDbField);
begin
  FIdadminimovel := Value;
end;

procedure TDbImovel.SetIdcartorio(const Value: TCmDbField);
begin
  FIdcartorio := Value;
end;

procedure TDbImovel.SetIdcidades(const Value: TCmDbField);
begin
  FIdcidades := Value;
end;

procedure TDbImovel.SetIdCarteiraSpc(const Value: TCmDbField);
begin
  FIdCarteiraSpc := Value;
end;

procedure TDbImovel.SetIdimovel(const Value: TCmDbField);
begin
  FIdimovel := Value;
end;

procedure TDbImovel.SetIdimovelmestre(const Value: TCmDbField);
begin
  FIdimovelmestre := Value;
end;

procedure TDbImovel.SetIdmarca(const Value: TCmDbField);
begin
  FIdmarca := Value;
end;

procedure TDbImovel.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbImovel.SetIdresponsavel(const Value: TCmDbField);
begin
  FIdresponsavel := Value;
end;

procedure TDbImovel.SetImoarea(const Value: TCmDbField);
begin
  FImoarea := Value;
end;

procedure TDbImovel.SetImoareacomum(const Value: TCmDbField);
begin
  FImoareacomum := Value;
end;

procedure TDbImovel.SetImoareagerencial(const Value: TCmDbField);
begin
  FImoareagerencial := Value;
end;

procedure TDbImovel.SetImoareatotal(const Value: TCmDbField);
begin
  FImoareatotal := Value;
end;

procedure TDbImovel.SetImobairro(const Value: TCmDbField);
begin
  FImobairro := Value;
end;

procedure TDbImovel.SetImocep(const Value: TCmDbField);
begin
  FImocep := Value;
end;

procedure TDbImovel.SetImocodigo(const Value: TCmDbField);
begin
  FImocodigo := Value;
end;

procedure TDbImovel.SetImocomplemento(const Value: TCmDbField);
begin
  FImocomplemento := Value;
end;

procedure TDbImovel.SetImodatacompra(const Value: TCmDbField);
begin
  FImodatacompra := Value;
end;

procedure TDbImovel.SetImodataconstrucao(const Value: TCmDbField);
begin
  FImodataconstrucao := Value;
end;

procedure TDbImovel.SetImodatahabitese(const Value: TCmDbField);
begin
  FImodatahabitese := Value;
end;

procedure TDbImovel.SetImodatamercado(const Value: TCmDbField);
begin
  FImodatamercado := Value;
end;

procedure TDbImovel.SetImodatareaval(const Value: TCmDbField);
begin
  FImodatareaval := Value;
end;

procedure TDbImovel.SetImodescricao(const Value: TCmDbField);
begin
  FImodescricao := Value;
end;

procedure TDbImovel.SetImofracaoideal(const Value: TCmDbField);
begin
  FImofracaoideal := Value;
end;

procedure TDbImovel.SetImologradouro(const Value: TCmDbField);
begin
  FImologradouro := Value;
end;

procedure TDbImovel.SetImomatricula(const Value: TCmDbField);
begin
  FImomatricula := Value;
end;

procedure TDbImovel.SetImomoedacompra(const Value: TCmDbField);
begin
  FImomoedacompra := Value;
end;

procedure TDbImovel.SetImomoedamercado(const Value: TCmDbField);
begin
  FImomoedamercado := Value;
end;

procedure TDbImovel.SetImomoedareaval(const Value: TCmDbField);
begin
  FImomoedareaval := Value;
end;

procedure TDbImovel.SetImonome(const Value: TCmDbField);
begin
  FImonome := Value;
end;

procedure TDbImovel.SetImonomeendereco(const Value: TCmDbField);
begin
  FImonomeendereco := Value;
end;

procedure TDbImovel.SetImonumero(const Value: TCmDbField);
begin
  FImonumero := Value;
end;

procedure TDbImovel.SetImoobservacao(const Value: TCmDbField);
begin
  FImoobservacao := Value;
end;

procedure TDbImovel.SetImopercentrateio(const Value: TCmDbField);
begin
  FImopercentrateio := Value;
end;

procedure TDbImovel.SetImovagas(const Value: TCmDbField);
begin
  FImovagas := Value;
end;

procedure TDbImovel.SetImovlrcompra(const Value: TCmDbField);
begin
  FImovlrcompra := Value;
end;

procedure TDbImovel.SetImovlrmercado(const Value: TCmDbField);
begin
  FImovlrmercado := Value;
end;

procedure TDbImovel.SetImovlrreaval(const Value: TCmDbField);
begin
  FImovlrreaval := Value;
end;

procedure TDbImovel.SetQtdetotalcotas(const Value: TCmDbField);
begin
  FQtdetotalcotas := Value;
end;

procedure TDbImovel.SetIndiceCompra(const Value: TCmDbField);
begin
  FIndiceCompra := Value;
end;

procedure TDbImovel.SetTaxaCompra(const Value: TCmDbField);
begin
  FTaxaCompra := Value;
end;

procedure TDbImovel.SetIdImovelPai(const Value: TCmDbField);
begin
  FIdImovelPai := Value;
end;
// Felipe de Oliveira SOL 132558 Kintana 766564 - INICIO
procedure TDbImovel.SetImoArrematado(const Value: TCmDbField);
begin
  FImoArrematado := Value;
end;

procedure TDbImovel.SetImoDataArrematado(const Value: TCmDbField);
begin
  FImoDataArrematado := Value;
end;
// Felipe de Oliveira SOL 132558 Kintana 766564 - FIM

//Darivaldo Alencar SOL 207703.18299 -inicio
procedure TDbImovel.SetImoPercentual(const Value: TCmDbField);
begin
 FImoPercentual:= Value;
end;
//Darivaldo Alencar SOL 207703.18299 -fim

end.



