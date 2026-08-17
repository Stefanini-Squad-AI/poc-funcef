{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 21/10/2002                             }
{                                                       }
{*******************************************************}

unit uDbSeguroImovel;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbSeguroImovel = class(TCmDbObject)

  private
    FSgivlrseguro: TCmDbField;
    FIdimovel: TCmDbField;
    FSgidatafim: TCmDbField;
    FSgirespseguro: TCmDbField;
    FSgivlrpremio: TCmDbField;
    FIdseguroimovel: TCmDbField;
    FSgidataini: TCmDbField;
    FSgirespoutros: TCmDbField;
    FTrguserinclusao: TCmDbField;
    FSgiregistro: TCmDbField;
    FSgiapolice: TCmDbField;
    FIdseguradora: TCmDbField;
    FObservacao: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    FIdResponsavel: TCmDbField;
    FFlgStatus: TCmDbField;

    FCodDocumento: TCmDbField; // Daniel - 26236

    procedure SetIdimovel(const Value: TCmDbField);
    procedure SetIdseguradora(const Value: TCmDbField);
    procedure SetIdseguroimovel(const Value: TCmDbField);
    procedure SetObservacao(const Value: TCmDbField);
    procedure SetSgiapolice(const Value: TCmDbField);
    procedure SetSgidatafim(const Value: TCmDbField);
    procedure SetSgidataini(const Value: TCmDbField);
    procedure SetSgiregistro(const Value: TCmDbField);
    procedure SetSgirespoutros(const Value: TCmDbField);
    procedure SetSgirespseguro(const Value: TCmDbField);
    procedure SetSgivlrpremio(const Value: TCmDbField);
    procedure SetSgivlrseguro(const Value: TCmDbField);
    procedure SetTrgdtinclusao(const Value: TCmDbField);
    procedure SetTrguserinclusao(const Value: TCmDbField);
    procedure SetIdResponsavel(const Value: TCmDbField);
    procedure SetFlgStatus(const Value: TCmDbField);
    procedure SetCodDocumento(const Value: TCmDbField);

  public

     Property Trguserinclusao: TCmDbField read FTrguserinclusao write SetTrguserinclusao;
     Property Trgdtinclusao: TCmDbField read FTrgdtinclusao write SetTrgdtinclusao;
     Property Sgivlrseguro: TCmDbField read FSgivlrseguro write SetSgivlrseguro;
     Property Sgivlrpremio: TCmDbField read FSgivlrpremio write SetSgivlrpremio;
     Property Sgirespseguro: TCmDbField read FSgirespseguro write SetSgirespseguro;
     Property Sgirespoutros: TCmDbField read FSgirespoutros write SetSgirespoutros;
     Property Sgiregistro: TCmDbField read FSgiregistro write SetSgiregistro;
     Property Sgidataini: TCmDbField read FSgidataini write SetSgidataini;
     Property Sgidatafim: TCmDbField read FSgidatafim write SetSgidatafim;
     Property Sgiapolice: TCmDbField read FSgiapolice write SetSgiapolice;
     Property Observacao: TCmDbField read FObservacao write SetObservacao;
     Property Idseguroimovel: TCmDbField read FIdseguroimovel write SetIdseguroimovel;
     Property Idseguradora: TCmDbField read FIdseguradora write SetIdseguradora;
     Property Idimovel: TCmDbField read FIdimovel write SetIdimovel;
     Property IdResponsavel: TCmDbField read FIdResponsavel write SetIdResponsavel;
     Property FlgStatus: TCmDbField read FFlgStatus write SetFlgStatus;

     property CodDocumento: TCmDbField read FCodDocumento write SetCodDocumento; // Daniel - 26236

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbSeguroImovel }

constructor TDbSeguroImovel.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'SEGUROIMOVEL';

   fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,True,'');
   fTrgdtinclusao   := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,False,False,False,True,'');
   fSgivlrseguro    := CreateCmDbField('SGIVLRSEGURO',ftfloat,False,False,False,True,'Valor do Seguro');
   fSgivlrpremio    := CreateCmDbField('SGIVLRPREMIO',ftfloat,False,False,False,True,'Valor do Prêmio');
   fSgirespseguro   := CreateCmDbField('SGIRESPSEGURO',ftString,False,False,False,True,'Responsável pelo Seguro');
   fSgirespoutros   := CreateCmDbField('SGIRESPOUTROS',ftString,False,False,False,True,'Outros Responsáveis');
   fSgiregistro     := CreateCmDbField('SGIREGISTRO',ftString,False,False,False,True,'Registro');
   fSgidataini      := CreateCmDbField('SGIDATAINI',ftDateTime,False,False,False,True,'Data de Término da Vigência');
   fSgidatafim      := CreateCmDbField('SGIDATAFIM',ftDateTime,False,False,False,True,'Data de Início da Vigência');
   fSgiapolice      := CreateCmDbField('SGIAPOLICE',ftString,False,False,False,True,'Nr. da Apólice');
   fObservacao      := CreateCmDbField('OBSERVACAO',ftString,False,False,False,True,'Observações');
   fIdseguroimovel  := CreateCmDbField('IDSEGUROIMOVEL',ftfloat,True,True,False,True,'ID do Seguro');
   fIdseguradora    := CreateCmDbField('IDSEGURADORA',ftfloat,False,False,False,True,'ID da Seguradora');
   fIdimovel        := CreateCmDbField('IDIMOVEL',ftfloat,False,False,False,True,'ID do Imóvel Segurado');
   fIdResponsavel   := CreateCmDbField('IDRESPONSAVEL',ftfloat,False,False,False,True,'ID do Responsável');
   fFlgStatus       := CreateCmDbField('FLGSTATUS',ftString,False,False,False,True,'Status da Apólice');

   // Daniel - 26236
   FCodDocumento    := CreateCmDbField('CODDOCUMENTO',ftFloat,False,False,False,True,'Número do Documento');
end;

function TDbSeguroImovel.Insert: Boolean;
begin
   fIdseguroimovel.AsFloat := GetSequence('SEGUROIMOVEL');
   Result := Inherited Insert;
end;


procedure TDbSeguroImovel.SetCodDocumento(const Value: TCmDbField);
begin
  FCodDocumento := Value;
end;

procedure TDbSeguroImovel.SetFlgStatus(const Value: TCmDbField);
begin
  FFlgStatus := Value;
end;

procedure TDbSeguroImovel.SetIdimovel(const Value: TCmDbField);
begin
  FIdimovel := Value;
end;

procedure TDbSeguroImovel.SetIdResponsavel(const Value: TCmDbField);
begin
  FIdResponsavel := Value;
end;

procedure TDbSeguroImovel.SetIdseguradora(const Value: TCmDbField);
begin
  FIdseguradora := Value;
end;

procedure TDbSeguroImovel.SetIdseguroimovel(const Value: TCmDbField);
begin
  FIdseguroimovel := Value;
end;

procedure TDbSeguroImovel.SetObservacao(const Value: TCmDbField);
begin
  FObservacao := Value;
end;

procedure TDbSeguroImovel.SetSgiapolice(const Value: TCmDbField);
begin
  FSgiapolice := Value;
end;

procedure TDbSeguroImovel.SetSgidatafim(const Value: TCmDbField);
begin
  FSgidatafim := Value;
end;

procedure TDbSeguroImovel.SetSgidataini(const Value: TCmDbField);
begin
  FSgidataini := Value;
end;

procedure TDbSeguroImovel.SetSgiregistro(const Value: TCmDbField);
begin
  FSgiregistro := Value;
end;

procedure TDbSeguroImovel.SetSgirespoutros(const Value: TCmDbField);
begin
  FSgirespoutros := Value;
end;

procedure TDbSeguroImovel.SetSgirespseguro(const Value: TCmDbField);
begin
  FSgirespseguro := Value;
end;

procedure TDbSeguroImovel.SetSgivlrpremio(const Value: TCmDbField);
begin
  FSgivlrpremio := Value;
end;

procedure TDbSeguroImovel.SetSgivlrseguro(const Value: TCmDbField);
begin
  FSgivlrseguro := Value;
end;

procedure TDbSeguroImovel.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

procedure TDbSeguroImovel.SetTrguserinclusao(const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;

end.



