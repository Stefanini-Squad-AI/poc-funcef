{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 03/07/2002                             }
{                                                       }
{*******************************************************}

{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 24083
Responsável : Daniel Simões
Data        : 21/05/2007
Descrição   : Inclusão do campo NUMPROCESSO no DbObject.
--------------------------------------------------------------------------------
Pendência   : 17959 e 17958
Responsável : Vinicius Meyer Lana
Data        : 22/11/2004
Descrição   : 17959 - Inclusão de campos para aviso programado do evento
              17958 - Registro de evento por documento a receber
                      Registro do Id da carta de cobrança para documentos
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}


unit uDbEventoImovel;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbEventoImovel = class(TCmDbObject)

  private
    FIdusuario: TCmDbField;
    FIdcontratoimovel: TCmDbField;
    FEvivlrajustado: TCmDbField;
    FEvivlranterior: TCmDbField;
    FEvipercent: TCmDbField;
    FIdimovel: TCmDbField;
    FEvidata: TCmDbField;
    FEvidataprox: TCmDbField;
    FIdcontratoloja: TCmDbField;
    FEvicabecalho: TCmDbField;
    FFlgtipoevento: TCmDbField;
    FEviindicereajuste: TCmDbField;
    FEvidescricao: TCmDbField;
    FIdeventoimovel: TCmDbField;
    FFlgAviso: TCmDbField;
    FDiasAviso: TCmDbField;
    FCodDocumento: TCmDbField;
    FIdCartaCobranca: TCmDbField;

    FNumeroProcesso: TCmDbField;
    FIdTipoEventoImovel: TCmDbField; // Daniel - 24083

    procedure SetEvicabecalho(const Value: TCmDbField);
    procedure SetEvidata(const Value: TCmDbField);
    procedure SetEvidataprox(const Value: TCmDbField);
    procedure SetEvidescricao(const Value: TCmDbField);
    procedure SetEviindicereajuste(const Value: TCmDbField);
    procedure SetEvipercent(const Value: TCmDbField);
    procedure SetEvivlrajustado(const Value: TCmDbField);
    procedure SetEvivlranterior(const Value: TCmDbField);
    procedure SetFlgtipoevento(const Value: TCmDbField);
    procedure SetIdcontratoimovel(const Value: TCmDbField);
    procedure SetIdcontratoloja(const Value: TCmDbField);
    procedure SetIdeventoimovel(const Value: TCmDbField);
    procedure SetIdimovel(const Value: TCmDbField);
    procedure SetIdusuario(const Value: TCmDbField);
    procedure SetDiasAviso(const Value: TCmDbField);
    procedure SetFlgAviso(const Value: TCmDbField);
    procedure SetCodDocumento(const Value: TCmDbField);
    procedure SetIdCartaCobranca(const Value: TCmDbField);
    procedure SetNumeroProcesso(const Value: TCmDbField);
    procedure SetIdTipoEventoImovel(const Value: TCmDbField);

  public

     Property Idusuario: TCmDbField read FIdusuario write SetIdusuario;
     Property Idimovel: TCmDbField read FIdimovel write SetIdimovel;
     Property Idcontratoloja: TCmDbField read FIdcontratoloja write SetIdcontratoloja;
     Property Idcontratoimovel: TCmDbField read FIdcontratoimovel write SetIdcontratoimovel;
     Property IdEventoImovel: TCmDbField read FIdEventoImovel write SetIdEventoImovel;
     Property IdTipoEventoImovel: TCmDbField read FIdTipoEventoImovel write SetIdTipoEventoImovel;
     Property Flgtipoevento: TCmDbField read FFlgtipoevento write SetFlgtipoevento;
     Property Evivlranterior: TCmDbField read FEvivlranterior write SetEvivlranterior;
     Property Evivlrajustado: TCmDbField read FEvivlrajustado write SetEvivlrajustado;
     Property Evipercent: TCmDbField read FEvipercent write SetEvipercent;
     Property Eviindicereajuste: TCmDbField read FEviindicereajuste write SetEviindicereajuste;
     Property Evidescricao: TCmDbField read FEvidescricao write SetEvidescricao;
     Property Evidataprox: TCmDbField read FEvidataprox write SetEvidataprox;
     Property Evidata: TCmDbField read FEvidata write SetEvidata;
     Property Evicabecalho: TCmDbField read FEvicabecalho write SetEvicabecalho;

     // Pend 17959 / 17958 - Vinicius
     Property FlgAviso: TCmDbField read FFlgAviso write SetFlgAviso;
     Property DiasAviso: TCmDbField read FDiasAviso write SetDiasAviso;
     Property CodDocumento: TCmDbField read FCodDocumento write SetCodDocumento;
     Property IdCartaCobranca: TCmDbField read FIdCartaCobranca write SetIdCartaCobranca;

     // Daniel - 24083
     property NumeroProcesso: TCmDbField read FNumeroProcesso write SetNumeroProcesso;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbEventoImovel }

constructor TDbEventoImovel.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'EVENTOIMOVEL';

   fIdusuario := CreateCmDbField('IDUSUARIO',ftfloat,False,False,False,True,'');
   fIdimovel := CreateCmDbField('IDIMOVEL',ftfloat,False,False,False,True,'ID do Imovel');
   fIdeventoimovel := CreateCmDbField('IDEVENTOIMOVEL',ftfloat,True,True,False,True,'');
   fIdcontratoloja := CreateCmDbField('IDCONTRATOLOJA',ftfloat,False,False,False,True,'ID do Contrato da Loja');
   fIdcontratoimovel := CreateCmDbField('IDCONTRATOIMOVEL',ftfloat,False,False,False,True,'ID do Contrato do Imovel');
   fFlgtipoevento := CreateCmDbField('FLGTIPOEVENTO',ftString,False,False,False,True,'');
   fEvivlranterior := CreateCmDbField('EVIVLRANTERIOR',ftfloat,False,False,False,True,'Valor do Aluguel Anterior');
   fEvivlrajustado := CreateCmDbField('EVIVLRAJUSTADO',ftfloat,False,False,False,True,'Valor do Aluguel Reajustado');
   fEvipercent := CreateCmDbField('EVIPERCENT',ftfloat,False,False,False,True,'Perc. de Reajuste do Aluguel');
   fEviindicereajuste := CreateCmDbField('EVIINDICEREAJUSTE',ftfloat,False,False,False,True,'Indice de Reajuste do Aluguel');
   fEvidescricao := CreateCmDbField('EVIDESCRICAO',ftString,False,False,False,True,'Descrição do Evento');
   fEvidataprox := CreateCmDbField('EVIDATAPROX',ftDateTime,False,False,False,True,'');
   fEvidata := CreateCmDbField('EVIDATA',ftDateTime,True,False,False,True,'Data do Evento');
   fEvicabecalho := CreateCmDbField('EVICABECALHO',ftString,True,False,False,True,'Cabeçalho do Evento');

   // Pend 17959 / 17958 - Vinicius
   fFlgAviso        := CreateCmDbField('FLGAVISO',ftString,False,False,False,True,'Indicador de Aviso do Evento');
   fDiasAviso       := CreateCmDbField('DIASAVISO',ftfloat,False,False,False,True,'Dias de antecedência para o aviso');
   fCodDocumento    := CreateCmDbField('CODDOCUMENTO',ftfloat,False,False,False,True,'ID do Documento de Cobrança');
   fIdCartaCobranca := CreateCmDbField('IDCARTACOBRANCA',ftfloat,False,False,False,True,'ID da Carta de Cobrança');

   // Daniel - 24083
   fNumeroProcesso  := CreateCmDbField('NUMPROCESSO',ftString,False,False,False,True,'Número do Processo do Evento');

   FIdTipoEventoImovel := CreateCmDbField('IDTIPOEVENTOIMOB',ftfloat,False,False,False,True,'ID do Tipo de Evento de Imovél');
end;

function TDbEventoImovel.Insert: Boolean;
begin

   fIdeventoimovel.AsFloat := GetSequence('EVENTOIMOVEL');
   Result := Inherited Insert;

end;


procedure TDbEventoImovel.SetCodDocumento(const Value: TCmDbField);
begin
  FCodDocumento := Value;
end;

procedure TDbEventoImovel.SetDiasAviso(const Value: TCmDbField);
begin
  FDiasAviso := Value;
end;

procedure TDbEventoImovel.SetEvicabecalho(const Value: TCmDbField);
begin
  FEvicabecalho := Value;
end;

procedure TDbEventoImovel.SetEvidata(const Value: TCmDbField);
begin
  FEvidata := Value;
end;

procedure TDbEventoImovel.SetEvidataprox(const Value: TCmDbField);
begin
  FEvidataprox := Value;
end;

procedure TDbEventoImovel.SetEvidescricao(const Value: TCmDbField);
begin
  FEvidescricao := Value;
end;

procedure TDbEventoImovel.SetEviindicereajuste(const Value: TCmDbField);
begin
  FEviindicereajuste := Value;
end;

procedure TDbEventoImovel.SetEvipercent(const Value: TCmDbField);
begin
  FEvipercent := Value;
end;

procedure TDbEventoImovel.SetEvivlrajustado(const Value: TCmDbField);
begin
  FEvivlrajustado := Value;
end;

procedure TDbEventoImovel.SetEvivlranterior(const Value: TCmDbField);
begin
  FEvivlranterior := Value;
end;

procedure TDbEventoImovel.SetFlgAviso(const Value: TCmDbField);
begin
  FFlgAviso := Value;
end;

procedure TDbEventoImovel.SetFlgtipoevento(const Value: TCmDbField);
begin
  FFlgtipoevento := Value;
end;

procedure TDbEventoImovel.SetIdCartaCobranca(const Value: TCmDbField);
begin
  FIdCartaCobranca := Value;
end;

procedure TDbEventoImovel.SetIdcontratoimovel(const Value: TCmDbField);
begin
  FIdcontratoimovel := Value;
end;

procedure TDbEventoImovel.SetIdcontratoloja(const Value: TCmDbField);
begin
  FIdcontratoloja := Value;
end;

procedure TDbEventoImovel.SetIdeventoimovel(const Value: TCmDbField);
begin
  FIdeventoimovel := Value;
end;

procedure TDbEventoImovel.SetIdimovel(const Value: TCmDbField);
begin
  FIdimovel := Value;
end;

procedure TDbEventoImovel.SetIdTipoEventoImovel(const Value: TCmDbField);
begin
  FIdTipoEventoImovel := Value;
end;

procedure TDbEventoImovel.SetIdusuario(const Value: TCmDbField);
begin
  FIdusuario := Value;
end;

procedure TDbEventoImovel.SetNumeroProcesso(const Value: TCmDbField);
begin
  FNumeroProcesso := Value;
end;

end.



