{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------

              OBJETO DE CONTROLE DE IMÓVEIS  ( MT )

              Módulo          :  Comuns Imobiliário
              Autor           :  Vinícius Meyer Lana
              Data de Início  :  18/07/2002
              Data de Término :  20/08/2002

--------------------------------------------------------------------------------

FUNÇÕES PUBLICADAS:

   GravaImovel          - Insere, Altera e Exclui Imóveis ( inclusive detalhes )
   ExcluiImovel         - Exclui Imóveis ( inclusive detalhes )
   LookupImovel         - Busca um imóvel pelo id
   LookupDesmembramento - Busca o desmembramento de um imóvel
   LookupPlanoPatroxImo - Busca a segregação dos imóveis por plano/patro
   HistDesmembramento   - Apura o Histórico de desmembramento do imóvel
   AtualizaOcupacao     - Atualiza o Flag de ocupação dos imóveis

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Nº SIG......: 128602
Data........: 06/09/2022
Responsável.: Luis Ferrari
Descrição...: Ajuste de status de ocupação do Imovel de Ocupado para desocupado
--------------------------------------------------------------------------------
Nº SIG......: 113136
Data........: 04/07/2022
Responsável.: Cássio Florencio Rovaroto
Descrição...: Implementação da provisão de custos de imóveis.
--------------------------------------------------------------------------------
Nº SIG......: 26054
Data........: 26/12/2016
Responsável.: Michelle Suellyn Mota
Descrição...: Implementação no lançamento do imóvel, verifica se possui voto.
--------------------------------------------------------------------------------
Nº SOL......: 207703.18299
Data........: 08/07/2016
Responsável.: Darivaldo Alencar
Descrição...: Inclusão de campo Percentual tabela IMOVEL.
--------------------------------------------------------------------------------
Nº SOL......: 212226
Nº KINTANA..: 2037651
Data........: 08/04/2014
Responsável.: Helio Lima Custódio
Descrição...: Apagar os registros de Histórico Vida Util
              quando o imovel for excluido.
--------------------------------------------------------------------------------
N. Sol..........: 131027
N. Kintana......: 745170
Data............: 21/05/2010
Responsável.....: Felipe de Oliveira
Descrição.......: Inclusão de dos campos Imóvel Arrematado e Data de Arrematação
                  Para o módulo Administração imobiliária
--------------------------------------------------------------------------------
N. Sol..........: 132558
N. Kintana......: 766564
Data............: 20/05/2010
Responsável.....: Felipe de Oliveira
Descrição.......: Inclusão de dos campos Imóvel Arrematado e Data de Arrematação
                  Para o módulo Alienação
--------------------------------------------------------------------------------
Rotina..........: GravaImovel, AtualizaPlanoPatroxVigenciaImob, AtualizaPlanoPatroxImovel,
                  LookupPlanoPatroxVigenciaImob, BuscaVigenciaAnteriorImovel
N. Sol..........: 132461
N. Kintana......: 763386
Data............: 23/04/2010
Responsável.....: Cássio Camargo
Descrição.......: Inclusão de gravação de vigência dos imóveis.
--------------------------------------------------------------------------------
Padrão       : 5.10.19
Congelado(s) : 5.10.16 / 5.10.17 / 5.10.18
Pendência    : 27480
Responsável  : Daniel Simões
Data         : 26/02/2008
Descrição    : Troca do filtro 'FLGSTATUSOCUPACAO=V' na função 'AtualizaOcupacao'
               pelos filtros relacionados às datas de vigências do imóvel...
--------------------------------------------------------------------------------
Pendência   : 24085
Responsável : Daniel Simões
Data        : 17/04/2007
Descrição   : Implementação das funções relacionadas ao form Cadastro de
              Unidades ( frmCadUnidadeMT )

              1ª: AtualizaEnderecoUnidade - Função que atualiza o endereço das
                  Unidades quando o mesmo é atualizado no Imóvel relacionado...

              2ª: LookupEndereco - Carrega o endereço da Unidade selecionada...

              3ª: LookupUnidade - Busca uma Unidade pelo ID...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit uCtrlImovel;

interface

uses SysUtils, dbClient, DB, uCMControlObject, uCMDbObject, uCMClientDataSet,
     uCMTypes, uDbImovel, uDbEventoImovel, uDbOutroDadoxImovel, uDbIndicadorxApur,
     uDbPlanoPatroxImovel, uDbImagens, uDbImagensXImoveis, uCtrlBem,
     uCtrlModuloImobiliario, uDbPlanoPatroxVigenciaImob, uDbPlanoPatroxVigenciaBem, uSistema,
     dbtables, classes,

     //Helio - SOL Nº 212226 KINTANA Nº 2037651
     uCtrlHistoricoVidaUtil, uCtrlProvisaoImovel, uDbProvisaoImovel;


type
     // Daniel - 22290
     TBuscaDadosDep = record
       dDataDepreciacao : TDateTime;
       sEvento : string;
     end;
     // Daniel - 22290
     TCtrlImovel = class(TCMControlObject)

     private

       FCdsImovel             : TCMClientDataSet;
       FDbImovel              : TDbImovel;
       FCdsEventoImovel       : TCMClientDataSet;
       FDbEventoImovel        : TDbEventoImovel;
       FCdsOutroDadoxImovel   : TCMClientDataSet;
       FDbOutroDadoxImovel    : TDbOutroDadoxImovel;
       FCdsIndicadorxApur     : TCMClientDataSet;
       FDbIndicadorxApur      : TDbIndicadorxApur;
       FCdsPlanoPatroxImovel  : TCMClientDataSet;
       FDbPlanoPatroxImovel   : TDbPlanoPatroxImovel;
       FCdsImagensXImoveis    : TCMClientDataSet;
       FDbImagens             : TDbImagens;
       FDbImagensXImoveis     : TDbImagensXImoveis;

       CtrlBem : TCtrlBem;
       CtrlModuloImobiliario  : TCtrlModuloImobiliario;
       CtrlProvisaoImovel: TCtrlProvisaoImovel;
       FidEmpresa: Integer;
       FCdsPlanoPatroxVigenciaImob : TCMClientDataSet;
       FDbPlanoPatroxVigenciaImob: TDbPlanoPatroxVigenciaImob;
       FCdsPlanoPatroxVigenciaBem: TCMClientDataSet;
       FDbPlanoPatroxVigenciaBem: TDbPlanoPatroxVigenciaBem;
       FCdsProvisaoImovel: TCMClientDataSet;
       FDbProvisaoImovel: TDbProvisaoImovel;

       //Helio - SOL Nº 212226 KINTANA Nº 2037651
       CtrlHistoricoVidaUtil : TCtrlHistoricoVidaUtil;


       procedure SetCdsImovel           (const Value: TCMClientDataSet);
       procedure SetDbImovel            (const Value: TDbImovel);
       procedure SetCdsEventoImovel     (const Value: TCMClientDataSet);
       procedure SetDbEventoImovel      (const Value: TDbEventoImovel);
       procedure SetCdsOutroDadoxImovel (const Value: TCMClientDataSet);
       procedure SetDbOutroDadoxImovel  (const Value: TDbOutroDadoxImovel);
       procedure SetCdsIndicadorxApur   (const Value: TCMClientDataSet);
       procedure SetDbIndicadorxApur    (const Value: TDbIndicadorxApur);
       procedure SetCdsPlanoPatroxImovel(const Value: TCMClientDataSet);
       procedure SetDbPlanoPatroxImovel (const Value: TDbPlanoPatroxImovel);
       procedure SetCdsImagensXImoveis  (const Value: TCMClientDataSet);
       procedure SetDbImagens           (const Value: TDbImagens);
       procedure SetDbImagensXImoveis   (const Value: TDbImagensXImoveis);
       procedure SetidEmpresa           (const Value: Integer);
       procedure SetCdsProvisaoImovel   (const Value: TCMClientDataSet);
       procedure SetDbProvisaoImovel    (const Value: TDbProvisaoImovel);

       function  AtualizaStatusImovel : Boolean;
       function  SaldoContabilBem      (const iEmpresaProp, iIdBem: Integer; const dData :tDatetime): Extended;

       // Daniel - 24085
       function AtualizaEnderecoUnidade(const iIdImovel:Integer): Boolean;
       procedure SetCdsPlanoPatroxVigenciaImob(const Value: TCMClientDataSet);
       procedure SetDbPlanoPatroxVigenciaImob(const Value: TDbPlanoPatroxVigenciaImob);
       procedure SetCdsPlanoPatroxVigenciaBem(const Value: TCMClientDataSet);
       procedure SetDbPlanoPatroxVigenciaBem(const Value: TDbPlanoPatroxVigenciaBem);
       function  LookupPlanoPatroxVigenciaBem(iIdBem: Integer): OLEVariant; overload;
       function  LookupVigenciaBemAnterior(iIdBem : Integer): OLEVariant;
       function  VerificaUltimaVigenciaImovel(iIdImovel : Integer) : Boolean;


     protected
       procedure AfterInitialize;   override;
       procedure OnCreateAppServer; override;
       procedure OnApplyCdsRecord    (aCds: TClientDataSet; Const sTableName: String; CdsState: TUpdateStatus; Var Accept: Boolean); Override;
       procedure AfterApplyCdsRecord (aCds: TClientDataSet; Const sTableName: String; CdsState: TUpdateStatus; Accept: Boolean); Override;

     public
       aStatus : TStringList;

       constructor Create;  override;
       destructor  Destroy; override;

       property DbImovel             : TDbImovel            read FDbImovel             write SetDbImovel;
       property CdsImovel            : TCMClientDataSet     read FCdsImovel            write SetCdsImovel;
       property DbEventoImovel       : TDbEventoImovel      read FDbEventoImovel       write SetDbEventoImovel;
       property CdsEventoImovel      : TCMClientDataSet     read FCdsEventoImovel      write SetCdsEventoImovel;
       property DbOutroDadoxImovel   : TDbOutroDadoxImovel  read FDbOutroDadoxImovel   write SetDbOutroDadoxImovel;
       property CdsOutroDadoxImovel  : TCMClientDataSet     read FCdsOutroDadoxImovel  write SetCdsOutroDadoxImovel;
       property DbIndicadorxApur     : TDbIndicadorxApur    read FDbIndicadorxApur     write SetDbIndicadorxApur;
       property CdsIndicadorxApur    : TCMClientDataSet     read FCdsIndicadorxApur    write SetCdsIndicadorxApur;
       property DbPlanoPatroxImovel  : TDbPlanoPatroxImovel read FDbPlanoPatroxImovel  write SetDbPlanoPatroxImovel;
       property CdsPlanoPatroxImovel : TCMClientDataSet     read FCdsPlanoPatroxImovel write SetCdsPlanoPatroxImovel;
       property DbImagens            : TDbImagens           read FDbImagens            write SetDbImagens;
       property DbImagensXImoveis    : TDbImagensXImoveis   read FDbImagensXImoveis    write SetDbImagensXImoveis;
       property CdsImagensXImoveis   : TCMClientDataSet     read FCdsImagensXImoveis   write SetCdsImagensXImoveis;

       property idEmpresa : Integer read FidEmpresa write SetidEmpresa;

       //Cássio - SOL 107352 KINTANA 482365 - Início
       property CdsPlanoPatroxVigenciaImob : TCMClientDataSet read FCdsPlanoPatroxVigenciaImob write SetCdsPlanoPatroxVigenciaImob;
       property DbPlanoPatroxVigenciaImob  : TDbPlanoPatroxVigenciaImob read FDbPlanoPatroxVigenciaImob write SetDbPlanoPatroxVigenciaImob;
       property CdsPlanoPatroxVigenciaBem  : TCMClientDataSet read FCdsPlanoPatroxVigenciaBem write SetCdsPlanoPatroxVigenciaBem;
       property DbPlanoPatroxVigenciaBem   : TDbPlanoPatroxVigenciaBem read FDbPlanoPatroxVigenciaBem write SetDbPlanoPatroxVigenciaBem;

       property CdsProvisaoImovel          : TCMClientDataSet read FCdsProvisaoImovel write SetCdsProvisaoImovel;
       property DbProvisaoImovel           : TDbProvisaoImovel read FDbProvisaoImovel write SetDbProvisaoImovel;

       // Pend. 19883/19876
       function  AtualizaBem (const iIdImovel:Integer; const bAlteraVigencia: boolean; bRecuperaVigencia : Boolean = False) : Boolean;
       function  AtualizaPlanoPatroxVigenciaImob(const iIdImovel : Integer; bRecuperaVigencia : Boolean = False): Boolean;
       function  AtualizaPlanoPatroxImovel(const iIdImovel : Integer; bRecuperaVigencia : Boolean = False): Boolean;

       function GravaImovel (const bAlteraVigencia : boolean; bRecuperaVigencia : Boolean = False; pAlteraProvisao: Boolean = False) : Boolean;
       function ExcluiImovel: Boolean;

       // Daniel Simões - 22290
       function VerificaDepreciacao(iIdImovel:Integer): Boolean;
       function BuscaDataAquisicao(iIdImovel:Integer): TDateTime;
       function BuscaDepreciacao(iIdImovel:Integer): TBuscaDadosDep;
       function RegistraDataDepreciacao(iIdImovel:Integer; dDataDep:TDateTime; const bTransacao:Boolean = True): Boolean;
       // Daniel Simões - 22290

       // Daniel - 24085
       function LookupEndereco(const iImovel:Integer=-1): OLEVariant;
       function LookupUnidade(const iIdImovelPai:Integer=-1; const iFlgAtivo:Integer=-1): OLEVariant;
       // Fim.

       function LookupImovel(const iIdImovel:Integer = -1; const iFlgAtivo:Integer = -1): OleVariant;
       function LookupImovelXBem(const iIdImovel:Integer = -1; const iIdImovelMestre:Integer = -1; const iFlgAtivo:Integer = -1): OleVariant;
       function LookupImovelDaiea: OLEVariant;
       function LookupImagens(IDImovel: Double) : OLEVariant;
       function LookupDesmembramento(const iIdImovelIni, iIdImovelFim:Integer; const sTipoDesmembra:String = 'D') : OLEVariant;
       function LookupPlanoPatroxImo(const iIdImovel:Integer = -1) : OLEVariant;
       function HistDesmembramento(const iIdImovel: Integer) : OLEVariant;
       function AtualizaOcupacao(const sOcupacao:String; const iIdImovel:Integer = -1; const iIdContrato:Integer = -1; const bTransacao:Boolean = True) : Boolean;
       function SaldoContabil(const iIdImovel, iIdImovelMestre:Integer; const dDataFim:TDateTime): Extended;

       // substituir quando encontar nas bpls do global
       function LookupPatro(const iIdEmpresa:Integer) : OLEVariant;

       //Cássio - SOL 107352 KINTANA 482365 - Início
       //Função que retorna informações de segregação de um imóvel selecionado
       function LookupPlanoPatroxVigenciaImob(const iIdImovel: Integer = -1): OLEVariant;
       //Verifica se existem bens ligado ao imóvel
       function VerificaBensxImovel(iIDiImovel : Integer) :  Boolean;
       //Retorna informações de segregação de bens ligados ao imóvel
       function LookupPlanoPatroxVigenciaBem: OLEVariant; overload;
       function ValidaPlanoxPatro(iPlanPrev, iPatro: integer ): boolean;
       function VerificaPlano(sPlano: string; iIdImovel: integer) : boolean;
       function VerificaQntPlanos(iIdimovel : integer) : integer;
       function BuscaVigenciaAnteriorImovel(iIdImovel : Integer) : OLEVariant;
       procedure VerificaVigenciaExistenteBem(iIdBem: Integer; sDataVigencia : string);
       procedure VerificaVigenciaExistenteImovel(iIdImovel: Integer; sDataVigencia : string);
       function  ListVotoCadImovel(iIdImovel : string): OLEVariant;  // Michelle Mota - SIG26054
     published

end;

implementation
uses uDataBase;
{ TCtrlImovel }

constructor TCtrlImovel.Create;
begin
  inherited;
  // Cria os CtrlObjects
  CtrlBem := TCtrlBem.Create;
  CtrlModuloImobiliario := TCtrlModuloImobiliario.Create;

  //Helio - SOL Nº 212226 KINTANA Nº 2037651
  CtrlHistoricoVidaUtil := TCtrlHistoricoVidaUtil.Create;

  CtrlProvisaoImovel := TCtrlProvisaoImovel.Create;
  

  // Cria os DbOjbects
  FDbImovel            := TDBImovel.Create( Self );
  FDbEventoImovel      := TDbEventoImovel.Create( Self );
  FDbOutroDadoxImovel  := TDbOutroDadoxImovel.Create( Self );
  FDbIndicadorxApur    := TDbIndicadorxApur.Create( Self );
  FDbPlanoPatroxImovel := TDbPlanoPatroxImovel.Create( Self );
  FDbImagens           := TDbImagens.Create( Self );
  FDbImagensXImoveis   := TDbImagensXImoveis.Create( Self );
  //Cássio - SOL 107352 KINTANA 482365 - Início
  FDbPlanoPatroxVigenciaImob := TDbPlanoPatroxVigenciaImob.Create ( Self );
  FDbPlanoPatroxVigenciaBem := TDbPlanoPatroxVigenciaBem.Create( Self );
  //Cássio - SOL 107352 KINTANA 482365 - Fim

  FDbProvisaoImovel := TDbProvisaoImovel.Create(Self);
  aStatus := TStringList.Create;
end;

destructor TCtrlImovel.Destroy;
begin
  // Destroi os CtrlObjects
  FreeAndNil (CtrlBem);
  FreeAndNil (CtrlModuloImobiliario);

  //Helio - SOL Nº 212226 KINTANA Nº 2037651
  FreeAndNil( CtrlHistoricoVidaUtil );
  
  // Destrói os DbObjects criados
  FreeAndNil (FDbImovel);
  FreeAndNil (FDbEventoImovel);
  FreeAndNil (FDbOutroDadoxImovel);
  FreeAndNil (FDbIndicadorxApur);
  FreeAndNil (FDbPlanoPatroxImovel);
  FreeAndNil (FDbImagens);
  FreeAndNil (FDbImagensXImoveis);
  //Cássio - SOL 107352 KINTANA 482365 - Início
  FreeAndNil (FDbPlanoPatroxVigenciaImob);
  FreeAndNil (FDbPlanoPatroxVigenciaBem);
  //Cássio - SOL 107352 KINTANA 482365 - Fim

  FreeAndNil(CtrlProvisaoImovel);
  FreeAndNil(FDbProvisaoImovel);


  // Destrói os Cds criados somente se os mesmos foram criados pelo CtrlObject
  if isAppServer then begin
    FreeAndNil (FCdsImovel);
    FreeAndNil (FCdsEventoImovel);
    FreeAndNil (FCdsOutroDadoxImovel);
    FreeAndNil (FCdsIndicadorxApur);
    FreeAndNil (FCdsPlanoPatroxImovel);
    FreeAndNil (FCdsImagensXImoveis);
  end;
  FreeAndNil(aStatus);

  inherited;
end;

procedure TCtrlImovel.OnCreateAppServer;
begin
  inherited;
  // Cria os Cds somente no caso de execução pela aplicação servidora, pois na
  // aplicação cliente, os mesmos já foram criados.
  FCdsImovel            := TCMClientDataSet.Create( nil );
  FCdsEventoImovel      := TCMClientDataSet.Create( nil );
  FCdsOutroDadoxImovel  := TCMClientDataSet.Create( nil );
  FCdsIndicadorxApur    := TCMClientDataSet.Create( nil );
  FCdsPlanoPatroxImovel := TCMClientDataSet.Create( nil );
  FCdsImagensXImoveis   := TCMClientDataSet.Create( nil );
end;

procedure TCtrlImovel.AfterInitialize;
begin
  inherited;
  // define o DataBase a ser utilizado
  FDbImovel.DataBaseName            := DataBaseName;
  FDbEventoImovel.DataBaseName      := DataBaseName;
  FDbOutroDadoxImovel.DataBaseName  := DataBaseName;
  FDbIndicadorxApur.DataBaseName    := DataBaseName;
  FDbPlanoPatroxImovel.DataBaseName := DataBaseName;
  FDbImagens.DataBaseName           := DataBaseName;
  FDBImagensXImoveis.DataBaseName   := DataBaseName;
  //Cássio - SOL 107352 KINTANA 482365 - Início
  FDbPlanoPatroxVigenciaImob.DataBaseName := DataBaseName;
  FDbPlanoPatroxVigenciaBem.DataBaseName := DataBaseName;
  //Cássio - SOL 107352 KINTANA 482365 - Fim
  FDbProvisaoImovel.DataBaseName    := DataBaseName;

  CtrlBem.InitializeAs( Self );
  CtrlModuloImobiliario.InitializeAs( Self );

  //Helio - SOL Nº 212226 KINTANA Nº 2037651
  CtrlHistoricoVidaUtil.InitializeAs( Self );

  if FidEmpresa > 0 then
     CtrlModuloImobiliario.InvestImob.GetParam( FidEmpresa );
end;

//function TCtrlImovel.GravaImovel(const StatusVigencia : string =''): Booelan
function TCtrlImovel.GravaImovel(const bAlteraVigencia : boolean; bRecuperaVigencia : Boolean = False; pAlteraProvisao: Boolean = False): Boolean;
var
    sMsgErro: string;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.GravaImovel( CdsImovel.Data, CdsEventoImovel.Data, CdsOutroDadoxImovel.Data,
                                                CdsIndicadorxApur.Data, CdsPlanoPatroxImovel.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      // Atualiza Bem
      Result := AtualizaBem(CdsImovel.FieldByName('IDIMOVEL').AsInteger, bAlteraVigencia, bRecuperaVigencia);
      if not Result then
        raise Exception.Create('Erro ao atualizar a descrição dos bens');

      // Atualiza o Status dos imóveis ( ativo / inativo )
      Result := AtualizaStatusImovel;
      if not Result then
        raise Exception.Create('Erro ao atualizar o status do Imovel');

// Daniel - 24085 - Início -----------------------------------------------------
      // Atualiza o endereço das Unidades relaciondas ao Imóvel...
      Result := AtualizaEnderecoUnidade(CdsImovel.FieldByName('IDIMOVEL').AsInteger);
      if not Result then
        raise Exception.Create('Erro ao atualizar o endereço das Unidades pertencentes a este Imóvel');
// Daniel - 24085 - Fim --------------------------------------------------------

      // Grava Imóvel ( Pai )
      Result := ApplyCds( CdsImovel, DbImovel, [], [] );
      if not Result then
        raise Exception.Create( DbImovel.MessageInfo );

      // Grava EventoImovel ( Filho )
      Result := ApplyCds( CdsEventoImovel, DbEventoImovel, [DbImovel.IdImovel], [DbEventoImovel.IdImovel] );
      if not Result then
       raise Exception.Create( DbEventoImovel.MessageInfo );

      // Grava OutroDadoxImovel ( Filho )
      Result := ApplyCds( CdsOutroDadoxImovel, DbOutroDadoxImovel, [DbImovel.IdImovel], [DbOutroDadoxImovel.IdImovel] );
      if not Result then
        raise Exception.Create( DbOutroDadoxImovel.MessageInfo );

      // Grava IndicadorxApur ( Filho )
      Result := ApplyCds( CdsIndicadorxApur, DbIndicadorxApur, [DbImovel.IdImovel], [DbIndicadorxApur.Idimovel] );
      if not Result then
        raise Exception.Create( DbIndicadorxApur.MessageInfo );

      {[Result := ApplyCds( CdsPlanoPatroxImovel, DbPlanoPatroxImovel, [DbImovel.IdImovel], [DbPlanoPatroxImovel.Idimovel] );
      if not Result then
        raise Exception.Create( DbPlanoPatroxImovel.MessageInfo );}


      if bAlteraVigencia then
      begin
        Result :=  AtualizaPlanoPatroxVigenciaImob(DbImovel.IdImovel.AsInteger, bRecuperaVigencia);
        if not Result then
          raise Exception.Create('Erro ao registrar a vigência de segregação do imóvel.');

        if (VerificaUltimaVigenciaImovel(DbImovel.IdImovel.AsInteger)) or (bRecuperaVigencia) then
        begin
          // Grava PlanoPatroxImovel ( Filho )
          Result := AtualizaPlanoPatroxImovel(DbImovel.IdImovel.AsInteger, bRecuperaVigencia);
          if not Result then
            raise Exception.Create('Erro ao registrar o(s) plano(s) e patrocinadora de segregação do imóvel.');
        end;
      end;

     // Grava Imagem ( Filho )
      Result := ApplyCds( CdsImagensxImoveis, DbImagens, [], [] );
      if not Result then
        raise Exception.Create( DbImagens.MessageInfo );

      // Grava ImagensXImoveis ( Filho )
      Result := ApplyCds( CdsImagensxImoveis, DbImagensXImoveis, [DbImovel.IdImovel ], [DbImagensXImoveis.Idimovel], True );
      if not Result then
        raise Exception.Create( DbImagensXImoveis.MessageInfo );

      //Cássio Rovaroto - SIG nº 113136 - Início
      if pAlteraProvisao then
      begin
        Result := ApplyCds(CdsProvisaoImovel, DbProvisaoImovel, [DbImovel.IdImovel], [DbProvisaoImovel.IdImovel]);
        if not Result then
          raise Exception.Create(sMsgErro);
      end;
      //Cássio Rovaroto - SIG nº 113136

      Commit;
    except
      on E : Exception do begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;


function TCtrlImovel.ExcluiImovel: Boolean;
var
  sSQL: string;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.ExcluiImovel( CdsImovel.Data, CdsEventoImovel.Data, CdsOutroDadoxImovel.Data,
                                                 CdsIndicadorxApur.Data, CdsPlanoPatroxImovel.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      //Helio - SOL Nº 212226 KINTANA Nº 2037651
      CdsImovel.StatusFilter := [usDeleted];
      CtrlHistoricoVidaUtil.ExcluiPorImovel( CdsImovel.FieldByName('IDIMOVEL').AsInteger, False );
      CdsImovel.StatusFilter := [];
      //FIM Helio - SOL Nº 212226 KINTANA Nº 2037651

      // Marca todos os filhos para exclusão
      CdsEventoImovel.First;
      CdsOutroDadoxImovel.First;
      CdsIndicadorxApur.First;
      CdsPlanoPatroxImovel.First;
      CdsImagensXImoveis.First;
      //Cássio - SOL 107352 KINTANA 482365 - Início
      CdsPlanoPatroxVigenciaImob.First;
      //Cássio - SOL 107352 KINTANA 482365 - Fim
      while not CdsEventoImovel.Eof      do CdsEventoImovel.Delete;
      while not CdsOutroDadoxImovel.Eof  do CdsOutroDadoxImovel.Delete;
      while not CdsIndicadorxApur.Eof    do CdsIndicadorxApur.Delete;
      while not CdsPlanoPatroxImovel.Eof do CdsPlanoPatroxImovel.Delete;
      while not CdsImagensXImoveis.Eof   do CdsImagensXImoveis.Delete;
      //Cássio - SOL 107352 KINTANA 482365 - Início
      while not CdsPlanoPatroxVigenciaImob.Eof do CdsPlanoPatroxVigenciaImob.Delete;
      //Cássio - SOL 107352 KINTANA 482365 - Fim
      CtrlProvisaoImovel.CdsProvisaoImovel := CdsProvisaoImovel;
      CtrlProvisaoImovel.ExcluiProvisao;
      while not CdsProvisaoImovel.Eof do CdsProvisaoImovel.Delete;


      //Exlcui ProvisaoImovel (Filho)
      Result := ApplyCds( CdsProvisaoImovel, DbProvisaoImovel, [], [] );
      if not Result then raise Exception.Create( DbProvisaoImovel.MessageInfo );

      // Exclui ImagensXImoveis ( Filho )
      Result := ApplyCds( CdsImagensxImoveis, DbImagensXImoveis, [], [] );
      if not Result then raise Exception.Create( DbImagensXImoveis.MessageInfo );

      // Exclui Imagem ( Filho )
      Result := ApplyCds( CdsImagensxImoveis, DbImagens, [], [] );
      if not Result then raise Exception.Create( DbImagens.MessageInfo );

      //Cássio - SOL 107352 KINTANA 482365 - Início
      //Exclui HstPercSegregaImob ( Filho )
      Result := ApplyCds( CdsPlanoPatroxVigenciaImob, DbPlanoPatroxVigenciaImob, [], [] );
      if not Result then raise Exception.Create( DbPlanoPatroxVigenciaImob.MessageInfo );
      //Cássio - SOL 107352 KINTANA 482365 - Fim

      // Exclui PlanoPatroxImovel ( Filho )
      Result := ApplyCds( CdsPlanoPatroxImovel, DbPlanoPatroxImovel, [], [] );
      if not Result then raise Exception.Create( DbPlanoPatroxImovel.MessageInfo );

      // Exclui IndicadorxApur ( Filho )
      Result := ApplyCds( CdsIndicadorxApur, DbIndicadorxApur, [], [] );
      if not Result then raise Exception.Create( DbIndicadorxApur.MessageInfo );

      // Exclui OutroDadoxImovel ( Filho )
      Result := ApplyCds( CdsOutroDadoxImovel, DbOutroDadoxImovel, [], [] );
      if not Result then raise Exception.Create( DbOutroDadoxImovel.MessageInfo );

      // Exclui EventoImovel ( Filho )
      Result := ApplyCds( CdsEventoImovel, DbEventoImovel, [], [] );
      if not Result then raise Exception.Create( DbEventoImovel.MessageInfo );

      // Exclui Imóvel ( Pai )
      Result := ApplyCds( CdsImovel, DbImovel, [], [] );
      if not Result then raise Exception.Create( DbImovel.MessageInfo );

      Commit;
    except
      on E : Exception do begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

procedure TCtrlImovel.AfterApplyCdsRecord(aCds: TClientDataSet; const sTableName: String; CdsState: TUpdateStatus; Accept: Boolean);
var iIdImovel : Integer;
begin
  inherited;
  // Atualiza a Ocupação do imóvel após a aplicação de cada registro do CDS de IMOVEL
  if AnsiUpperCase(sTableName) = 'IMOVEL' then begin
    if CdsState in [usModified, usInserted, usDeleted] then begin
      iIdImovel := aCds.FieldByName('IDIMOVEL').AsInteger;
      AtualizaOcupacao('O', iIdImovel, -1, False);
      AtualizaOcupacao('D', iIdImovel, -1, False);
    end;
  end;

  // Atualiza O ID da imagem no CdsImagensXImovel
  if AnsiUpperCase(sTableName) = 'IMAGENS' then begin
    if CdsState in [usModified, usInserted] then begin
      aCds.Edit;
      aCds.FieldByName('IDIMAGEM').AsInteger := DbImagens.Idimagem.AsInteger;
      aCds.Post;
    end;
  end;

end;

procedure TCtrlImovel.OnApplyCdsRecord(aCds: TClientDataSet;
  const sTableName: String; CdsState: TUpdateStatus; var Accept: Boolean);
var sSql : String;
begin
  inherited;
  Accept := True;
  // Exclui o registro filho da tabela IMAGENSXIMOVEIS
  if AnsiUpperCase(sTableName) = 'IMAGENS' then begin
    if CdsState in [usDeleted] then begin
      sSql := 'DELETE FROM IMAGENSXIMOVEIS ' +#13+
              ' WHERE IDIMAGEM = ' + aCds.FieldByName('IDIMAGEM').AsString +#13+
              '   AND IDIMOVEL = ' + aCds.FieldByName('IDIMOVEL').AsString;
      Accept := ExecSQL( sSql );
    end;
  end;


  // Marchetti - Pendencia 19871
  if AnsiUpperCase(sTableName) = 'IMOVEL' then begin
    if CdsState in [usDeleted] then begin
      if aCds.FieldByName('IDIMOVEL').AsString <> '' then begin
         Accept := ExecSql('DELETE FROM ATIVOCOTA WHERE IDIMOVEL = ' + aCds.FieldByName('IDIMOVEL').AsString );
      end;
    end;
  end;
  // Fim Marchetti - Pendencia 19871
end;


function TCtrlImovel.LookupImovel(const iIdImovel, iFlgAtivo: Integer): OleVariant;
var sSql, sParam: string;
begin
  // Define Parâmetros
  sParam := '';
  if iIdImovel <> -1 then sParam := sParam + ' AND I.IDIMOVEL = '+IntToStr(iIdImovel);
  if iFlgAtivo <> -1 then sParam := sParam + ' AND I.FLGATIVO = '+IntToStr(iFlgAtivo);

  // Define Sql
  sSql := 'SELECT I.IDIMOVELMESTRE,  I.IDIMOVEL,        I.IDCIDADES,         I.CODSUBCONTA,      '+#13+
          '       I.IDPESSOA,        I.IDMARCA,         I.IMOCEP,            I.IMOBAIRRO,        '+#13+
          '       I.IDADMINIMOVEL,   I.FLGTIPOIMOVEL,   I.IMODATACONSTRUCAO, I.IMOAREA,          '+#13+
          '       I.IMOFRACAOIDEAL,  I.IMODESCRICAO,    I.FLGSTATUSOCUPACAO, I.QTDETOTALCOTAS,   '+#13+
          '       I.IMONOME,         I.IMOLOGRADOURO,   I.IMONUMERO,         I.IMOCOMPLEMENTO,   '+#13+

          // Daniel Simões - P: 19593 - 17/03/2006 - ---------------------------
          '       I.IMONOMEENDERECO, E.CODESTADO, E.IDESTADO,  E.IDPAIS,     I.IMOAREATOTAL,     '+#13+
          // Daniel Simões - P: 19593 - 17/03/2006 - ---------------------------

          '       I.CODTIPIMOVEL,    I.FLGATIVO,        I.IMOPERCENTRATEIO,  I.CODIMOVELSPC,     '+#13+
          '       I.IMOMOEDACOMPRA,  I.IMOVLRCOMPRA,    I.IMODATACOMPRA,     I.IMOMATRICULA,     '+#13+
          '       I.IMOOBSERVACAO,   I.IMODATAHABITESE, I.IDCARTORIO,        I.FLGSTATUS,        '+#13+
          '       I.IMOCODIGO,       I.IMOAREAGERENCIAL,I.FLGCATIMOVEL,      I.IMOVLRREAVAL,     '+#13+
          '       I.IMODATAREAVAL,   I.IMOVLRMERCADO,   I.IMODATAMERCADO,    I.IMOMOEDAREAVAL,   '+#13+
          '       I.IMOMOEDAMERCADO, I.IDRESPONSAVEL,   I.IMOVAGAS,          I.IMOAREACOMUM,     '+#13+
          '       I.IDCARTEIRASPC,   I.TAXACOMPRA,      I.INDICECOMPRA,                          '+#13+
          // Felipe de Oliveira SOL 132558 Kintana 766564
          // acrestandados os campos IMOARREMATADO e IMODATAARREMATADO a query 
          '       I.IMOARREMATADO,   I.IMODATAARREMATADO,                                        '+#13+
          '       IM.IMONOME || '' - '' || I.IMONOME AS IMOVEL_EXTENSO, I.IMOCIDADE, I.CODESTADO,'+#13+
          '       IM.IMONOME        AS DSC_MESTRE,         '                                      +#13+
          '       A.NOME            AS DSC_ADMINISTRADORA, '                                      +#13+
          '       C.NOME            AS DSC_CARTORIO,       '                                      +#13+
          '       TI.DESCTIPOIMOVEL AS DSC_TIPOIMOVEL      '                                      +#13+
          //Darivaldo Alencar SOL 207703.18299
          '       ,I.PERCENTUAL AS PERCENTUAL              '                                      +#13+
          '  FROM IMOVEL I,      '                                                                +#13+
          '       IMOVEL IM,     '                                                                +#13+
          '       TIPOIMOVEL TI, '                                                                +#13+
          '       CIDADES CI,    '                                                                +#13+
          // Daniel Simões - P: 19593 - 17/03/2006
          '       ESTADO  E,     '                                                                +#13+
          //Fim.

          '       ADMINIMOVEL AM, PESSOA A, '                                                     +#13+
          '       CARTORIO    CA, PESSOA C  '                                                     +#13+
          ' WHERE I.IDIMOVELMESTRE = IM.IDIMOVEL(+)      '                                        +#13+
          '   AND I.CODTIPIMOVEL   = TI.CODTIPIMOVEL(+)  '                                        +#13+
          '   AND I.IDCIDADES      = CI.IDCIDADES(+)     '                                        +#13+
          // Daniel Simões - P: 19593 - 17/03/2006
          '   AND CI.IDESTADO     = E.IDESTADO(+)      '                                          +#13+
          // FIm.

          '   AND I.IDADMINIMOVEL  = AM.IDADMINIMOVEL(+) '                                        +#13+
          '   AND AM.IDADMINIMOVEL = A.IDPESSOA(+)       '                                        +#13+
          '   AND I.IDCARTORIO     = CA.IDCARTORIO(+)    '                                        +#13+
          '   AND CA.IDCARTORIO    = C.IDPESSOA(+)       '                                        +#13+ sParam;

  Result := GetDataPacket(sSql);
end;


function TCtrlImovel.LookupImovelXBem(const iIdImovel, iIdImovelMestre, iFlgAtivo: Integer): OleVariant;
var sSql, sParam : String;
begin
  // Define Parâmetros
  sParam := '';
  if iIdImovel       <> -1 then sParam := sParam + ' AND I.IDIMOVEL = '+IntToStr(iIdImovel);
  if iIdImovelMestre <> -1 then sParam := sParam + ' AND I.IDIMOVELMESTRE = '+IntToStr(iIdImovelMestre);
  if iFlgAtivo       <> -1 then sParam := sParam + ' AND I.FLGATIVO = '+IntToStr(iFlgAtivo);

  // Define Sql
  sSql := 'SELECT IXB.IDIMOVEL, IXB.IDBEM, IXB.IDPESSOA, '+#13+
          '       IXB.IXBGRUPO, IXB.IXBPERCENT, '+#13+
          '       IM.IMONOME AS NOME_MESTRE,    '+#13+
          '       I.IMONOME  AS NOME_IMOVEL     '+#13+
          '  FROM IMOVELXBEM IXB, IMOVEL I, IMOVEL IM  '+#13+
          ' WHERE IXB.IDIMOVEL = I.IDIMOVEL '+#13+
          '   AND I.IDIMOVELMESTRE = IM.IDIMOVEL ' + sParam;

  Result := GetDataPacket( sSql );
end;


function TCtrlImovel.LookupImovelDaiea: OLEVariant;
var sSql: string;
begin
  // Define Sql
  sSql := 'SELECT I.IDIMOVELMESTRE,  I.IDIMOVEL,        I.IDCIDADES,         I.CODSUBCONTA,      '+#13+
          '       I.IDPESSOA,        I.IDMARCA,         UF.CODESTADO,        DC.DAIEACODCIDADE,  '+#13+
          '       I.IDADMINIMOVEL,   I.FLGTIPOIMOVEL,   I.IMODATACONSTRUCAO, I.IMOAREA,          '+#13+
          '       I.IMOFRACAOIDEAL,  I.IMODESCRICAO,    I.FLGSTATUSOCUPACAO, I.QTDETOTALCOTAS,   '+#13+
          '       I.IMONOME,         IM.IMOLOGRADOURO,  IM.IMONUMERO,        I.IMOCOMPLEMENTO,   '+#13+
          '       IM.IMOBAIRRO,      IM.IMONOMEENDERECO,IM.IMOCEP,           AV.IDAVALIADOR,     '+#13+
          '       I.CODTIPIMOVEL,    I.FLGATIVO,        I.IMOPERCENTRATEIO,                      '+#13+
          '       I.IMOMOEDACOMPRA,  I.IMOVLRCOMPRA,    I.IMODATACOMPRA,     I.IMOMATRICULA,     '+#13+
          '       I.IMOOBSERVACAO,   I.IMODATAHABITESE, I.IDCARTORIO,        I.FLGSTATUS,        '+#13+
          '       I.IMOCODIGO,       I.IMOAREAGERENCIAL,I.FLGCATIMOVEL,      I.IMOVLRREAVAL,     '+#13+
          '       I.IMODATAREAVAL,   I.IMOVLRMERCADO,   I.IMODATAMERCADO,    I.IMOMOEDAREAVAL,   '+#13+
          '       I.IMOMOEDAMERCADO, I.IDRESPONSAVEL,   I.IMOVAGAS,          I.IMOAREACOMUM,     '+#13+
          '       I.IMOAREATOTAL,    D.CODTIPOCART,                                              '+#13+
          '       IM.IMONOME || '' - '' || I.IMONOME AS IMOVEL_EXTENSO, '+#13+
          '       IM.IMONOME        AS DSC_MESTRE,         '+#13+
          '       TI.DESCTIPOIMOVEL AS DSC_TIPOIMOVEL,     '+#13+
          '       PEA.NUMDOCUMENTO  AS DOC_AVALIADOR,      '+#13+
          '       DECODE(I.CODIMOVELSPC, NULL, TI.CODIMOVELSPC, I.CODIMOVELSPC) AS CODIMOVELSPC,             '+#13+
          '       DECODE(I.IDCARTEIRASPC, NULL, TI.IDCARTEIRASPC, I.IDCARTEIRASPC) AS IDCARTEIRASPC, '+#13+
          '       DECODE(I.CODTIPIMOVEL, PA.TIPOIMOVELPATRO, ''S'', ''N'')      AS LOCADO_PATRO              '+#13+
          '  FROM IMOVEL I,        '+#13+
          '       IMOVEL IM,       '+#13+
          '       DAIEACIDADES DC, '+#13+
          '       CIDADES CI,      '+#13+
          '       ESTADO UF,       '+#13+
          '       TIPOIMOVEL TI,   '+#13+
          '       CARTEIRASPC D, '+#13+
          '       PARAMIMOVEL PA,  '+#13+
          '       PESSOA PEA,      '+#13+
          '       (                '+#13+
          '        SELECT DISTINCT R.IDIMOVEL, R.IDAVALIADOR '+#13+
          '          FROM REAVALIAXREAVALIA R '+#13+
          '         WHERE R.DATAREAVALIACAO IN ( SELECT MAX(DATAREAVALIACAO) AS DATAREAVALIACAO '+#13+
          '                                        FROM REAVALIAXREAVALIA       '+#13+
          '                                       WHERE IDIMOVEL = R.IDIMOVEL ) '+#13+
          '       ) AV '+#13+
          ' WHERE I.IDPESSOA = PA.IDPESSOA                  '+#13+
          '   AND I.IDIMOVELMESTRE IS NOT NULL              '+#13+
          '   AND I.IDIMOVELMESTRE   = IM.IDIMOVEL(+)       '+#13+
          '   AND I.CODTIPIMOVEL     = TI.CODTIPIMOVEL(+)   '+#13+
          '   AND I.IDIMOVEL         = AV.IDIMOVEL(+)       '+#13+
          '   AND TI.IDCARTEIRASPC   = D.IDCARTEIRASPC(+)   '+#13+
          '   AND IM.IDCIDADES       = CI.IDCIDADES(+)      '+#13+
          '   AND CI.IDESTADO        = UF.IDESTADO(+)       '+#13+
          '   AND CI.IDCIDADES       = DC.IDCIDADES(+)      '+#13+
          '   AND AV.IDAVALIADOR     = PEA.IDPESSOA(+)      '+#13+
          '   AND I.FLGATIVO         = 1                    '+#13+
          'ORDER BY I.IDIMOVELMESTRE, IMOVEL_EXTENSO';

  Result := GetDataPacket(sSql);
end;


//========================================================================================
// Função para retornar a segregação do imóvel por plano e patrocinadora
// Data : 13/12/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iIdImovel   : id do imóvel  ( -1 )
//
// Retorno : segregação - OLEVariant
//----------------------------------------------------------------------------------------
function TCtrlImovel.LookupPlanoPatroxImo(const iIdImovel: Integer): OLEVariant;
var sSql, sParam, sParam2, sParam3, sParam4 : string;
    cdsAux : TCMClientDataSet;
begin
  cdsAux := TCMClientDataSet.Create(nil);
  try
    // Define Parametros
    sParam  := '';
    sParam2 := '';
    sParam3 := '';
    sParam4 := '';

    if iIdImovel <> -1 then
    begin
      sParam := sParam + ' AND PI.IDIMOVEL = ' + IntToStr(iIdImovel);
      cdsAux.Data := LookupPlanoPatroxVigenciaImob(iIdImovel);

      //Cássio - SOL 107352 KINTANA 482365 - Início
      if not cdsAux.IsEmpty then
      begin
        sParam2 := ', HST.DATAVIGENCIA AS DATAVIGENCIA  ';


        sParam3 := '   AND HST.IDIMOVEL = PI.IDIMOVEL '+#13+
                   '   AND HST.IDPATRO = PI.IDPATRO  '+#13+
                   '   AND HST.IDPLANOPREV = PI.IDPLANOPREV '+#13+
                   '   AND HST.DATAVIGENCIA = (SELECT DISTINCT DATAVIGENCIA  ' +#13+
                   '                             FROM PLANOPATROXVIGENCIAIMOB ' +#13+
                   '                            WHERE IDIMOVEL = '+ IntToStr(iIdImovel) +#13+
                   '                              AND DATAVIGENCIA = (SELECT MAX(DATAVIGENCIA) ' +#13+
                   '                                                     FROM PLANOPATROXVIGENCIAIMOB ' +#13+
                   '                                                    WHERE IDIMOVEL = ' + IntToStr(iIdImovel)+ '))';

        sParam4 := ', PLANOPATROXVIGENCIAIMOB HST';
      end
      else
        sParam2 := ', TO_DATE(TO_CHAR(SYSDATE, ''DD/MM/YYYY''),''DD/MM/YYYY'') AS DATAVIGENCIA '; //+ #13 +
                   //'  '' '' AS STATUS ' ;
     //Cássio - SOL 107352 KINTANA 482365 - Fim
    end;

    // Define Sql
    sSql := 'SELECT DISTINCT PI.IDIMOVEL, PI.IDPATRO AS IDPATRO, PI.IDPLANOPREV, PI.PPIPERCENTRATEIO,                  '+#13+
            '       PI.FLGTIPO, P.NOME AS NOME_PATRO, PL.NOME AS NOME_PLANO,                       '+#13+
            '       DECODE(PI.FLGTIPO,''P'',''Percentual'',''C'',''Cotas'',Null) AS DESCR_FLGTIPO ' +  sParam2 +#13+
            '  FROM PLANOPATROXIMOVEL PI, PESSOA P, PLANPREVCONTABIL PL' +  sParam4  +#13+
            ' WHERE PI.IDPATRO  = P.IDPESSOA     '+#13+
            //Cássio - SOL 107352 KINTANA 482365 - Início
            '   AND PI.IDPLANOPREV = PL.IDPLANOPREV '+ sParam +#13+ sParam3 + #13 +
            ' ORDER BY DATAVIGENCIA DESC, NOME_PATRO, NOME_PLANO';
            //Cássio - SOL 107352 KINTANA 482365 - Fim

    Result := GetDataPacket( sSql );
  finally
    FreeAndNil(cdsAux);
  end;

  end;


//========================================================================================
// Função para retornar os desmembramentos do imóvel
// Data : 17/08/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iIdImovelIni   : id do imóvel de desmembrado ( -1 )
//       iIdImovelFim   : id do imóvel de resultante  ( -1 )
//       sTipoDesmembra : Tipo de desmembramento ( <O> - Obra, <D> - Desmembramento )
//
// Retorno : Desmembramentos - OLEVariant
//----------------------------------------------------------------------------------------
function TCtrlImovel.LookupDesmembramento(const iIdImovelIni, iIdImovelFim: Integer; const sTipoDesmembra: String): OLEVariant;
var sSql, sParam : String;
begin
  // Define Parâmetros
  sParam := '';
  if iIdImovelIni <> -1   then sParam := sParam + ' AND D.IDIMOVELINI = ' + IntToStr(iIdImovelIni);
  if iIdImovelFim <> -1   then sParam := sParam + ' AND D.IDIMOVELFIM = ' + IntToStr(iIdImovelFim);
  if sTipoDesmembra <> '' then sParam := sParam + ' AND D.FLGTIPODESMEMBRA = ' + QuotedStr(sTipoDesmembra);

  sSql := 'SELECT D.DMRDATA, D.IDIMOVELINI, D.IDIMOVELFIM, D.DMRPERCENT, '+#13+
          '       IM.IMONOME||'' - ''||I.IMONOME AS NOME_IMOVEL          '+#13+
          '  FROM DESMEMBRAIMOVEL D, '+#13+
          '       IMOVEL I,          '+#13+
          '       IMOVEL IM          '+#13+
          ' WHERE I.IDIMOVELMESTRE = IM.IDIMOVEL '+#13+
          '   AND I.IDIMOVEL = D.IDIMOVELINI     '+#13+ sParam;

  Result := GetDataPacket( sSql );
end;


//========================================================================================
// Função que compõem o histórico de desmembramento de um imóvel ( arvore completa )
// Data : 17/08/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iIdImovel   : id do imóvel
//
// Retorno : Histórico  ( OLEVariant )
//----------------------------------------------------------------------------------------
function TCtrlImovel.HistDesmembramento(const iIdImovel: Integer): OLEVariant;
var fPercent: Extended;
    iImovel : Integer;
    cdsTemp, cdsResult : TCMClientDataSet;
    sSql : String;
begin
  cdsTemp   := nil;
  cdsResult := nil;
  fPercent  := 0;
  sSql := 'SELECT D.DMRDATA, D.IDIMOVELINI, D.IDIMOVELFIM, D.DMRPERCENT, '+#13+
          '       0 AS PERC_ACUM, '+#13+
          '       ''                                                            '' AS NOME_IMOVEL '+#13+
          '  FROM DESMEMBRAIMOVEL D '+#13+
          ' WHERE 1=2 ';
  try
    cdsTemp        := TCMClientDataSet.Create( nil );
    cdsResult      := TCMClientDataSet.Create( nil );
    cdsResult.Data := GetDataPacket( sSql );
    cdsTemp.Data   := LookupDesmembramento( -1, iIdImovel );

    while not cdsTemp.IsEmpty do begin
      cdsResult.Append;
      cdsResult.FieldByName('IDIMOVELFIM').AsInteger := cdsTemp.FieldByName('IDIMOVELFIM').AsInteger;
      cdsResult.FieldByName('IDIMOVELINI').AsInteger := cdsTemp.FieldByName('IDIMOVELINI').AsInteger;
      cdsResult.FieldByName('DMRPERCENT').AsFloat    := cdsTemp.FieldByName('DMRPERCENT').AsFloat;
      cdsResult.FieldByName('DMRDATA').AsDateTime    := cdsTemp.FieldByName('DMRDATA').AsDateTime;

      // atribuir o percentual na primeira passagem
      if fPercent = 0 then
           fPercent := (cdsTemp.FieldByName('DMRPERCENT').AsFloat / 100)
      else fPercent := fPercent * (cdsTemp.FieldByName('DMRPERCENT').AsFloat / 100);

      cdsResult.FieldByName('PERC_ACUM').AsFloat     := fPercent;
      cdsResult.FieldByName('NOME_IMOVEL').AsString  := cdsTemp.FieldByName('NOME_IMOVEL').AsString;
      cdsResult.Post;

      iImovel := cdsTemp.FieldByName('IDIMOVELINI').AsInteger;
      cdsTemp.Data := LookupDesmembramento( -1, iImovel );
    end;
  finally
    Result := cdsResult.Data;

    FreeAndNil( cdsTemp );
    FreeAndNil( cdsResult );
  end;
end;

// -------------------------------------------------
// Função Interna - Atualiza o Status do Imovel
//       0 - Em Obras    ( Ativo )
//       N - Em Carteira ( Ativo )
// -------------------------------------------------
function TCtrlImovel.AtualizaStatusImovel : Boolean;
begin
  Result := True;
  with cdsImovel do begin
    First;
    while not eof do begin
      // Daniel - 24085
      if (FieldByName('FLGTIPOIMOVEL').AsInteger=1) then begin
      // Fim.
        Edit;
        if not(FieldByName('FLGSTATUS').AsString = '') then begin
          if FieldByName('FLGSTATUS').AsString[1] in ['N', 'O', 'P'] then
               FieldByName('FLGATIVO').AsInteger := 1
          else FieldByName('FLGATIVO').AsInteger := 0;
        end else begin
          FieldByName('FLGATIVO').AsInteger := 0;
        end;
        Post;
      end; // end 24085
      Next;
    end;
    First;
  end;
end;


//========================================================================================
// Função para atualizar o flag de ocupação dos imóveis ( flgStatusOcupacao )
// Data : 20/08/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       sOcupacao   : Status da Ocupação ( <O> - Ocupado, <D> - Desocupado )
//       iIdImovel   : id do imóvel       ( -1 )
//       iIdContrato : id do Contrato     ( -1 )
//       bTransacao  : Controla Transação ( default - True )
//
// Retorno : True  - Atualização com Sucesso
//           False - Falha na Atualização
//----------------------------------------------------------------------------------------
function TCtrlImovel.AtualizaOcupacao(const sOcupacao:String; const iIdImovel,iIdContrato:Integer; const bTransacao:Boolean): Boolean;
var sSql, sParam1, sParam2 : String;
begin
  Result := True;
  // Define Parametros
  sParam1 := '';
  sParam2 := '';
  if iIdImovel > 0 then begin
     sParam1 := ' AND IDIMOVEL = ' + IntToStr(iIdImovel);
     sParam2 := ' AND X.IDIMOVEL = ' + IntToStr(iIdImovel);
  end;
  if iIdContrato > 0 then begin
     sParam1 := ' AND IDIMOVEL   IN (SELECT IDIMOVEL FROM CONTRATOXIMOVEL ' +
                '                     WHERE IDCONTRATOIMOVEL = '+ IntToStr(iIdContrato) + ')';
     sParam2 := ' AND X.IDIMOVEL IN (SELECT IDIMOVEL FROM CONTRATOXIMOVEL ' +
                '                     WHERE IDCONTRATOIMOVEL = '+ IntToStr(iIdContrato) + ')';
  end;

  // Define o Sql de Update
  if sOcupacao = 'O' then begin
     sSql := 'UPDATE IMOVEL '+#13+
             '   SET FLGSTATUSOCUPACAO = ''O'' '+#13+
             ' WHERE 1=1' + sParam1 +#13+
             '   AND IDIMOVEL IN ( SELECT DISTINCT X.IDIMOVEL '+#13+
             '                     FROM CONTRATOIMOVEL C, CONTRATOXIMOVEL X '+#13+
// Daniel - 27480 - Início -----------------------------------------------------
             '                     WHERE ( (X.CIMDTFIM IS NOT NULL AND '+#13+
             '                              SYSDATE BETWEEN X.CIMDTINI AND X.CIMDTFIM ) OR '+#13+
             '                             (X.CIMDTFIM IS NULL AND SYSDATE >= X.CIMDTINI ) ) '+#13+
//             '                      WHERE ( C.FLGSTATUS = ''V'' ) '+#13+
// Daniel - 27480 - Fim --------------------------------------------------------
             '                        AND ( C.FLGTIPOCONTRATO = ''L'' ) '+#13+
             '                        AND ( X.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL ) '+#13+ sParam2 +#13+
             '                    )';
  end else begin
// Inicio 128602 Ferrari
{     sSql := 'UPDATE IMOVEL '+#13+
             '   SET FLGSTATUSOCUPACAO = ''D'' '+#13+
             ' WHERE 1=1' + sParam1 +#13+
             '   AND IDIMOVEL NOT IN ( SELECT DISTINCT X.IDIMOVEL '+#13+
             '                         FROM CONTRATOIMOVEL C, CONTRATOXIMOVEL X '+#13+
// Daniel - 27480 - Início -----------------------------------------------------
             '                         WHERE ( (X.CIMDTFIM IS NOT NULL AND '+#13+
             '                                  SYSDATE BETWEEN X.CIMDTINI AND X.CIMDTFIM ) OR '+#13+
             '                                 (X.CIMDTFIM IS NULL AND SYSDATE >= X.CIMDTINI ) ) '+#13+
// Daniel - 27480 - Fim --------------------------------------------------------
             '                            AND ( C.FLGTIPOCONTRATO = ''L'' ) '+#13+
             '                            AND ( X.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL ) '+#13+ sParam2 +#13+
             '                       )';
}
      sSql := '  UPDATE IMOVEL '+#13+
              '    SET FLGSTATUSOCUPACAO = ''D'' '+#13+
              '  WHERE 1=1 ' + sParam1 +#13+
              '    AND IDIMOVEL IN ( SELECT DISTINCT X.IDIMOVEL '+#13+
              '                          FROM CONTRATOIMOVEL C, CONTRATOXIMOVEL X '+#13+
              '                          WHERE (X.CIMDTFIM IS NOT NULL AND  '+#13+
              '                                   SYSDATE >= X.CIMDTFIM ) '+#13+
              '                             AND ( C.FLGTIPOCONTRATO = ''L'' ) '+#13+
              '                             AND ( X.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL )'+#13+ sParam2 +#13+
              '                        )';

// Fim 128602
  end;

  // Efetua a atualização da ocupação dos imóveis
  try
    if bTransacao then StartTransaction;
    if not ExecSQL( sSql ) then raise Exception.Create( MessageInfo );
    if bTransacao then Commit;
  except
    on E : Exception do begin
      Result := False;
      if bTransacao then Rollback;
      MessageInfo := E.Message;
    end;
  end;
end;


//========================================================================================
// Função para Totalizar o Saldo Contábil do Imóvel
// Data : 09/06/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iIdImovelMestre : id do ImóvelMestre a ser totalizado ou (-1)
//       iIdImovel       : id do Imóvel a ser totalizado ou (-1)
//       dDataFim        : Data limite para busca do Saldo
//
// Retorno : Saldo Contábil do Imóvel
//----------------------------------------------------------------------------------------
function TCtrlImovel.SaldoContabil(const iIdImovel, iIdImovelMestre: Integer; const dDataFim: TDateTime): Extended;
var sSql : String;
    cdsTemp : TCMClientDataSet;
    fSaldo : Extended;
begin
   Result := 0;
   try
     cdsTemp := TCMClientDataSet.Create( nil );
     cdsTemp.Data := LookupImovelXBem(iIdImovel, iIdImovelMestre);

     // busca o Saldo para cada Bem do imóvel
     while not cdsTemp.Eof do begin
       fSaldo := 0;
       fSaldo := ctrlbem.SaldoContabil(cdsTemp.FieldByName('IDPESSOA').AsInteger,
                                       cdsTemp.FieldByName('IDBEM').AsInteger,
                                       dDataFim,
                                       CtrlModuloImobiliario.InvestImob.iIdMoedaCAF,
                                       CtrlModuloImobiliario.InvestImob.iIdPaisCAF);
       Result := Result + fSaldo;
       cdsTemp.Next;
     end;
   finally
     FreeAndNil( cdsTemp );
   end;
end;

// -------------------------------------------------
// Função Interna - Calcula o Saldo Contábil do Bem
// Parâmetros :
//       iIdEmpresa : id da Empresa Proprietária
//       iIdBem     : id do Bem
//       dDataFim   : Data limite para busca do Saldo
//
// Retorno : Saldo Contábil do Bem
// -------------------------------------------------
function TCtrlImovel.SaldoContabilBem(const iEmpresaProp, iIdBem: Integer; const dData: tDatetime): Extended;
var sSql    : String;
    cdsTemp : TCMClientDataSet;
begin
  sSql := 'SELECT SCB.IDBEM, SCB.IDPESSOA, SCB.DATASLDBEM, '+#13+
          '       SCB.VALORG, SCB.REAVVALORG, SCB.ULTREAVVALORG, '+#13+
          '       SCB.CMBEM, SCB.REAVCMBEM, SCB.ULTREAVCMBEM, '+#13+
          '       SCB.DEPLANC, SCB.REAVDEPLANC, SCB.ULTREAVDEPLANC, '+#13+
          '       SCB.CMDEP, SCB.REAVCMDEP, SCB.ULTREAVCMDEP, '+#13+
          '       (SCB.VALORG + SCB.REAVVALORG + SCB.ULTREAVVALORG + '+#13+
          '        SCB.CMBEM + SCB.REAVCMBEM + SCB.ULTREAVCMBEM - '+#13+
          '        SCB.DEPLANC - SCB.REAVDEPLANC - SCB.ULTREAVDEPLANC - '+#13+
          '        SCB.CMDEP - SCB.REAVCMDEP - SCB.ULTREAVCMDEP) AS SALDOCONTABBEM, '+#13+
          '       (SCB.VALORG + SCB.REAVVALORG + SCB.ULTREAVVALORG + '+#13+
          '        SCB.CMBEM + SCB.REAVCMBEM + SCB.ULTREAVCMBEM) AS SALDOCONTABIMOB '+#13+
          'FROM SALDOCONTABBEM SCB, '+#13+
          '     (SELECT IDBEM, IDPESSOA, MAX(DATASLDBEM) AS DATA '+#13+
          '      FROM SALDOCONTABBEM '+#13+
          '      WHERE (IDBEM = '+ IntToStr(iIdBem) + ') '+#13+
          '        AND (IDPESSOA = ' + IntToStr(iEmpresaProp) + ') '+#13+
          '        AND (DATASLDBEM <= TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYYY', dData))+', ''DD/MM/YYYY'') ) '+#13+
          '      GROUP BY IDBEM, IDPESSOA) DTAMAX '+#13+
          'WHERE (SCB.IDBEM = '+ IntToStr(iIdBem) + ') '+#13+
          '  AND (SCB.IDPESSOA = ' + IntToStr(iEmpresaProp) + ') '+#13+
          '  AND (SCB.IDBEM = DTAMAX.IDBEM) '+#13+
          '  AND (SCB.DATASLDBEM = DTAMAX.DATA) '+#13+
          '  AND (SCB.IDPESSOA = DTAMAX.IDPESSOA) ';

  try
    cdsTemp := TCMClientDataSet.Create( nil );
    cdsTemp.Data := GetDataPacket( sSql );
    if cdsTemp.isEmpty then
         Result := 0
    else Result := cdsTemp.FieldByName('SALDOCONTABBEM').AsFloat;
  finally
    FreeAndNil( cdsTemp );
  end;
end;



procedure TCtrlImovel.SetCdsImovel(const Value: TCMClientDataSet);
begin
  FCdsImovel := Value;
end;

procedure TCtrlImovel.SetDbImovel(const Value: TDbImovel);
begin
  FDbImovel := Value;
end;


procedure TCtrlImovel.SetCdsEventoImovel(const Value: TCMClientDataSet);
begin
  FCdsEventoImovel := Value;
end;

procedure TCtrlImovel.SetDbEventoImovel(const Value: TDbEventoImovel);
begin
  FDbEventoImovel := Value;
end;


procedure TCtrlImovel.SetCdsOutroDadoxImovel(const Value: TCMClientDataSet);
begin
  FCdsOutroDadoxImovel := Value;
end;

procedure TCtrlImovel.SetDbOutroDadoxImovel(const Value: TDbOutroDadoxImovel);
begin
  FDbOutroDadoxImovel := Value;
end;

procedure TCtrlImovel.SetCdsIndicadorxApur(const Value: TCMClientDataSet);
begin
  FCdsIndicadorxApur := Value;
end;

procedure TCtrlImovel.SetDbIndicadorxApur(const Value: TDbIndicadorxApur);
begin
  FDbIndicadorxApur := Value;
end;


procedure TCtrlImovel.SetCdsPlanoPatroxImovel(const Value: TCMClientDataSet);
begin
  FCdsPlanoPatroxImovel := Value;
end;

procedure TCtrlImovel.SetDbPlanoPatroxImovel(const Value: TDbPlanoPatroxImovel);
begin
  FDbPlanoPatroxImovel := Value;
end;


function TCtrlImovel.LookupPatro(const iIdEmpresa: Integer): OLEVariant;
var sSql : String;
begin
   sSql := 'SELECT P.IDPESSOA, P.NOME '+#13+
           '  FROM PESSOA P, PATRO PT '+#13+
           ' WHERE PT.IDPESSOA   = P.IDPESSOA ' +#13+
           '   AND PT.IDFUNDACAO = ' + IntToStr(iIdEmpresa) +#13+
           ' ORDER BY NOME';

   Result := GetDataPacket( sSql );
end;

function TCtrlImovel.LookupImagens(IDImovel: Double) : OLEVariant;
var
  sSql : String;
begin
  // Seleciona todas as imagens cadastradas do Imóvel
  sSql:= 'SELECT II.IDIMAGEM, II.IMAGEM, II.DESCRIMAGEM, IM.IDIMOVEL' +
         '  FROM IMAGENS II, IMAGENSXIMOVEIS IM' +
         ' WHERE (IM.IDIMOVEL = ' + FloatToStr(IDImovel) + ') AND '+
         '       (II.IDIMAGEM = IM.IDIMAGEM) '+
         'ORDER BY II.DESCRIMAGEM ';

  Result:=GetDataPacket(sSql);
end;


procedure TCtrlImovel.SetCdsImagensXImoveis(const Value: TCMClientDataSet);
begin
  FCdsImagensXImoveis := Value;
end;

procedure TCtrlImovel.SetDbImagens(const Value: TDbImagens);
begin
  FDbImagens := Value;
end;

procedure TCtrlImovel.SetDbImagensXImoveis( const Value: TDbImagensXImoveis);
begin
  FDbImagensXImoveis := Value;
end;


procedure TCtrlImovel.SetidEmpresa(const Value: Integer);
begin
  FidEmpresa := Value;
end;

//function TCtrlImovel.AtualizaBem(const iIdImovel: Integer;
//                                 const sStatusVigencia : String = '') : Boolean;
function TCtrlImovel.AtualizaBem(const iIdImovel : Integer;
                                 const bAlteraVigencia: boolean; bRecuperaVigencia : Boolean = False) : Boolean;
var
   cdsTemp  : TCMClientDataSet;
   sTipoBem : String;
   sDesBem  : String;
   sSql     : String;
   sSqlHst  : String;
   cdsAux, cdsAux2   : TCMClientDataSet;
   sSQLAux  : string;
begin
  Result := True;

  // Daniel - 24085
  if (CdsImovel.FieldByName('FLGTIPOIMOVEL').AsInteger<2) then
  begin
    // Fim.
    try
      try
        cdsTemp := TCMClientDataSet.Create(nil);

        if not CdsImovel.FieldByName('IDIMOVELMESTRE').isNull then
          cdsTemp.Data := LookupImovelXBem(iIdImovel, -1)
        else cdsTemp.Data := LookupImovelXBem(-1, iIdImovel);

        cdsTemp.First;
        while not cdsTemp.Eof do
        begin
          case cdsTemp.FieldByName('IXBGRUPO').AsString[1] of
            'A': sTipoBem := 'Ar-Condicionado';
            'E': sTipoBem := 'Edificação';
            'I': sTipoBem := 'Instalações (Gerais)';
            'L': sTipoBem := 'Instalações Elétricas';
            'M': sTipoBem := 'Máquinas e Equip.';
            'O': sTipoBem := 'Móveis e Utensílios';
            'T': sTipoBem := 'Terreno';
            'U': sTipoBem := 'Utilitários';
            'V': sTipoBem := 'Veículos';
          else
            sTipoBem := '';
          end;

          if not CdsImovel.FieldByName('IDIMOVELMESTRE').isNull then
          begin
            sDesBem := CdsTemp.FieldByName('NOME_MESTRE').AsString + ' - ' +
                           CdsImovel.FieldByName('IMONOME').AsString + ' - ' + sTipoBem;
          end
          else
          begin
            sDesBem := CdsImovel.FieldByName('IMONOME').AsString + ' - ' +
                       CdsTemp.FieldByName('NOME_IMOVEL').AsString + ' - ' + sTipoBem;
          end;

        // Realizar a Atualização na Tabela BEM
          sSql := 'UPDATE BEM SET DESBEM = ' + QuotedStr(sDesBem) + #13+
                  ' WHERE IDBEM = ' + cdsTemp.FieldbyName('IDBEM').AsString;
          if not ExecSQL( sSql ) then
            raise exception.Create('');

          cdsTemp.Next;
        end;

        if bAlteraVigencia then
        begin
          //Cássio - SOL 107352 KINTANA 482365 - Início
          if VerificaBensxImovel(iIdImovel) then
          begin
            //cdsAux := TCMClientDataSet.Create(nil);
            cdsAux2 := TCMClientDataSet.Create(nil);

            cdsTemp.First;
            while not cdsTemp.Eof do
            begin
              if bRecuperaVigencia then
              begin
                cdsAux2.Data :=  LookupPlanoPatroxImo(iIdImovel);

                while not cdsAux2.Eof do
                begin
                  sSqlHst := 'DELETE FROM PLANOPATROXVIGENCIABEM ' +#13+
                             ' WHERE IDBEM = ' + cdsTemp.FieldByName('IDBEM').asString +#13+
                             '   AND DATAVIGENCIA = ' + QuotedStr(cdsAux2.FieldByName('DATAVIGENCIA').asString) +#13+
                             '   AND IDPLANOPREV = ' + cdsAux2.FieldByName('IDPLANOPREV').asString + #13+
                             '   AND IDPATRO = ' + cdsAux2.FieldByName('IDPATRO').asString;

                  if not ExecSQL(sSqlHst) then
                    raise Exception.Create('');
                  cdsAux2.Next;
                end;
              end;
              cdsTemp.Next;
            end;
          end;
        end;

        if iIdImovel > 0 then
        begin
          if (VerificaUltimaVigenciaImovel(iIdImovel)) or (bRecuperaVigencia) then
          begin
            cdsTemp.First;
            while not cdsTemp.Eof do
            begin
              sSql := 'DELETE FROM PLANOPATROXBEM ' + #13 +
                      ' WHERE IDBEM = ' + cdsTemp.FieldByName('IDBEM').asString;
              if not ExecSQL(sSql) then
                raise Exception.Create('');

              cdsTemp.Next;
            end;
          end;
        end;

        if (VerificaUltimaVigenciaImovel(iIdImovel)) or (bRecuperaVigencia) then
        begin
          CdsPlanoPatroxImovel.First;
          while not CdsPlanoPatroxImovel.Eof do
          begin
            cdsTemp.First;
            sSql := '';
            while not cdsTemp.Eof do
            begin
              sSql := 'INSERT INTO PLANOPATROXBEM (IDPLANOPREV, IDPATRO, IDBEM, IDPESSOA, PPBPERCRATEIO) ' + #13 +
                      'VALUES('+ CdsPlanoPatroxImovel.FieldByName('IDPLANOPREV').AsString + ',' + #13 +
                                 CdsPlanoPatroxImovel.FieldByName('IDPATRO').asString + ',' + #13 +
                                 cdsTemp.FieldByName('IDBEM').AsString + ',' + #13 +
                                 IntToStr(Sistema.IdEmpresa) + ',' + #13 +
                                 QuotedStr(CdsPlanoPatroxImovel.FieldByName('PPIPERCENTRATEIO').AsString) + ')';
              if not ExecSQL(sSql) then
                raise Exception.Create('');
              cdsTemp.Next;
            end;
            CdsPlanoPatroxImovel.Next;
          end;
        end;

        if not bRecuperaVigencia then
        begin
          CdsPlanoPatroxImovel.First;
          sSqlHst := '';

          while not CdsPlanoPatroxImovel.Eof do
          begin
            cdsTemp.First;
            while not cdsTemp.Eof do
            begin
              VerificaVigenciaExistenteBem(cdsTemp.FieldByName('IDBEM').AsInteger, CdsPlanoPatroxImovel.FieldByName('DATAVIGENCIA').AsString);

              sSqlHst := 'INSERT INTO PLANOPATROXVIGENCIABEM (IDPLANOPATROXVIGENCIABEM, IDBEM, DATAVIGENCIA, IDPLANOPREV, IDPATRO, PERCENTRATEIO, IDPESSOA)  ' + #13 +
                         'VALUES('+ IntToStr(LeUltRegistro(nil, 'PLANOPATROXVIGENCIABEM')) + ',' + #13 +
                                    cdsTemp.FieldByName('IDBEM').AsString + ',' + #13 +
                                    QuotedStr(CdsPlanoPatroxImovel.FieldByName('DATAVIGENCIA').AsString) + ',' + #13 +
                                    CdsPlanoPatroxImovel.FieldByName('IDPLANOPREV').AsString + ',' + #13 +
                                    CdsPlanoPatroxImovel.FieldByName('IDPATRO').asString + ',' + #13 +
                                    QuotedStr(CdsPlanoPatroxImovel.FieldByName('PPIPERCENTRATEIO').AsString) + ','+ #13 +
                                    IntToStr(Sistema.IdEmpresa)+ ')';
              if not ExecSQL(sSqlHst) then
                raise Exception.Create('');

              cdsTemp.Next;
            end;
            CdsPlanoPatroxImovel.Next;
          end;
        end;
      except
        on E : Exception do
          Result := False;
      end;
    finally
      FreeAndNil( cdsTemp );
      //Cássio - SOL 107352 KINTANA 482365 - Início
      FreeAndNil( cdsAux );
      FreeAndNIl( cdsAux2 );
      //Cássio - SOL 107352 KINTANA 482365 - Fim
    end;
  end; // end 24085
end;

// -----------------------------------------------------------------------------
// Daniel Simões - 22290 - Início ----------------------------------------------
function TCtrlImovel.VerificaDepreciacao(iIdImovel: Integer): Boolean;
// Verifica se existe depreciação para algum dos bens do imóvel selecionado...
var sSql, sParam: string;
    cdsTemp     : TCMClientDataSet;
begin
   Result := True;

   sParam := '';
   if ( iIdImovel <> -1 ) then sParam := sParam + '  AND IXB.IDIMOVEL = '+IntToStr(iIdImovel);

   sSql := 'SELECT DISTINCT IXB.IDIMOVEL, HI.IDBEM '         +#13+
           'FROM IMOVELXBEM IXB, HISTORICOMOVIMENTACAO HI '  +#13+
           'WHERE HI.IDBEM = IXB.IDBEM '                     +#13+
           '  AND HI.IDTIPOMOVIMENTACAO IN(14,18,69,33,35) ' +#13+sParam;

   try
     cdsTemp      := TCMClientDataSet.Create(nil);
     cdsTemp.Data := GetDataPacket(sSql);

     if (cdsTemp.IsEmpty) then Result := False;
   finally
      FreeAndNil( cdsTemp );
   end;
end;

function TCtrlImovel.BuscaDataAquisicao(iIdImovel: Integer): TDateTime;
// Busca a data da aquisição do imóvel...
var sSql, sParam: string;
    cdsTemp     : TCMClientDataSet;
begin
  // Define Parâmetros
  sParam := '';
  if iIdImovel <> -1 then sParam := sParam + 'WHERE IDIMOVEL = '+IntToStr(iIdImovel);

  // Define Sql
  sSql := 'SELECT IMODATACOMPRA '        +#13+
          'FROM IMOVEL '                 +#13+sParam;
  try
    cdsTemp      := TCMClientDataSet.Create(nil);
    cdsTemp.Data := GetDataPacket(sSql);

    Result := cdsTemp.FieldByName('IMODATACOMPRA').AsDateTime;
  finally
     FreeAndNil( cdsTemp );
  end;
end;

function TCtrlImovel.RegistraDataDepreciacao(iIdImovel:Integer; dDataDep:TDateTime; const bTransacao:Boolean): Boolean;
// Faz um Update nas tabelas BEM e BEMXDEP no campo Data de Início da Depreciação
var sSql, sParam: string;
begin
  Result := True;

  try
    if bTransacao then StartTransaction;

    // Define Parâmetros
    sParam := '';
    if dDataDep > 0 then
      sParam := sParam + 'SET DATAINICIODEP = TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYY',dDataDep))+',''DD/MM/YYYY'')'
    else
      sParam := sParam + 'SET DATAINICIODEP = NULL ';

    // Grava a data da depreciação na BEM...
    sSql := 'UPDATE BEM '+sParam               +#13+
            'WHERE IDBEM IN( SELECT IDBEM    ' +#13+
            '                FROM IMOVELXBEM ' +#13+
            '                WHERE IDIMOVEL = '+IntToStr(iIdImovel)+' )';

    // Executa o Sql
    if not ExecSQL( sSql ) then raise Exception.Create( MessageInfo );
//------------------------------------------------------------------------------

    sParam := '';
    if dDataDep  > 0 then
      sParam := sParam+
      'SET DATAULTDEP = TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYY',dDataDep))+',''DD/MM/YYYY''), FLGDEPREC = 0 '
    else
      sParam := sParam + 'SET DATAULTDEP = NULL, FLGDEPREC = 1 ';

    // Grava a data da depreciação na BEMXDEP...
    sSql := 'UPDATE BEMXDEP '+sParam           +#13+
            'WHERE IDBEM IN( SELECT IDBEM    ' +#13+
            '                FROM IMOVELXBEM ' +#13+
            '                WHERE IDIMOVEL = '+IntToStr(iIdImovel)+' )';

    // Executa o Sql
    if not ExecSQL( sSql ) then raise Exception.Create( MessageInfo );
//------------------------------------------------------------------------------

    if bTransacao then Commit;
  except
    on e : Exception do begin
      Result := False;
      if bTransacao then Rollback;
      MessageInfo := e.message;
    end;
  end;
end;

function TCtrlImovel.BuscaDepreciacao(iIdImovel: Integer): TBuscaDadosDep;
// Busca a data da depreciação e a descrição do evento do imóvel selecionado...
var sSql, sParam: string;
    cdsTemp     : TCMClientDataSet;
begin
  // Define Parâmetros
  sParam := '';
  if iIdImovel <> -1 then sParam := sParam + '  AND IDIMOVEL = '+IntToStr(iIdImovel);

  // Define Sql
  sSql := 'SELECT EVIDATA, EVIDESCRICAO ' +#13+
          'FROM EVENTOIMOVEL '            +#13+
          'WHERE FLGTIPOEVENTO = ''DP'' ' +sParam;

  try
    cdsTemp      := TCMClientDataSet.Create(nil);
    cdsTemp.Data := GetDataPacket(sSql);

    Result.sEvento          := cdsTemp.FieldByName('EVIDESCRICAO').AsString;
    Result.dDataDepreciacao := cdsTemp.FieldByName('EVIDATA').AsDateTime;
  finally
     FreeAndNil( cdsTemp );
  end;
end;
// Daniel Simões - 22290 - Fim -------------------------------------------------
// -----------------------------------------------------------------------------

// Daniel - 24085 - Início -----------------------------------------------------
function TCtrlImovel.LookupEndereco(const iImovel:Integer): OLEVariant;
var sSql, sParam: string;
begin
  sSql   := '';
  sParam := '';

  if (iImovel<>-1) then  sParam := sParam+'  AND I.IDIMOVEL = '+IntToStr(iImovel);

  sSql := 'SELECT I.IMONOMEENDERECO, I.IMOLOGRADOURO,  I.IMOBAIRRO, ' +#13+
          '       I.IMONUMERO,       I.IMOCOMPLEMENTO, I.IMOCEP, '    +#13+
          '       I.IDPAIS,          I.IDCIDADES,      I.CODESTADO, ' +#13+
          '       I.IMOCIDADE,       E.IDESTADO,       P.NOMEPAIS, '  +#13+
          '       C.NOME AS CIDADE,  E.CODESTADO AS UF '              +#13+
          'FROM IMOVEL I, IMOVEL IM, CIDADES C, ESTADO  E, PAIS P '   +#13+
          'WHERE I.IDIMOVELMESTRE = IM.IDIMOVEL '                     +#13+
          '  AND I.IDCIDADES      = C.IDCIDADES(+) '                  +#13+
          '  AND C.IDESTADO       = E.IDESTADO(+) '                   +#13+
          '  AND E.IDPAIS         = P.IDPAIS(+) '                     +#13+sParam;

  Result := GetDataPacket(sSql);
end;

function TCtrlImovel.LookupUnidade(const iIdImovelPai,iFlgAtivo:Integer): OLEVariant;
var sSql, sParam: string;
begin
  // Define Parâmetros
  sParam := '';
  if iIdImovelPai <> -1 then sParam := sParam + '  AND U.IDIMOVEL = '+IntToStr(iIdImovelPai);
  if iFlgAtivo    <> -1 then sParam := sParam + '  AND U.FLGATIVO = '+IntToStr(iFlgAtivo);

  // Define Sql
  sSql := 'SELECT U.IDIMOVELMESTRE,  U.IDIMOVEL,        U.IDCIDADES,         U.CODSUBCONTA, '        +#13+
          '       U.IDPESSOA,        U.IDMARCA,         U.IMOCEP,            U.IMOBAIRRO, '          +#13+
          '       U.IDADMINIMOVEL,   U.FLGTIPOIMOVEL,   U.IMODATACONSTRUCAO, U.IMOAREA, '            +#13+
          '       U.IMOFRACAOIDEAL,  U.IMODESCRICAO,    U.FLGSTATUSOCUPACAO, U.QTDETOTALCOTAS, '     +#13+
          '       U.IMONOME,         U.IMOLOGRADOURO,   U.IMONUMERO,         U.IMOCOMPLEMENTO, '     +#13+
          '       U.IMONOMEENDERECO, E.CODESTADO,       E.IDESTADO,          E.IDPAIS, '             +#13+
          '       U.IMOAREATOTAL,    U.CODTIPIMOVEL,    U.FLGATIVO,          U.IMOPERCENTRATEIO, '   +#13+
          '       U.CODIMOVELSPC,    U.IMOMOEDACOMPRA,  U.IMOVLRCOMPRA,      U.IMODATACOMPRA, '      +#13+
          '       U.IMOMATRICULA,    U.IMOOBSERVACAO,   U.IMODATAHABITESE,   U.IDCARTORIO, '         +#13+
          '       U.FLGSTATUS,       U.IMOCODIGO,       U.IMOAREAGERENCIAL,  U.FLGCATIMOVEL, '       +#13+
          '       U.IMOVLRREAVAL,    U.IMODATAREAVAL,   U.IMOVLRMERCADO,     U.IMODATAMERCADO, '     +#13+
          '       U.IMOMOEDAREAVAL,  U.IMOMOEDAMERCADO, U.IDRESPONSAVEL,     U.IMOVAGAS, '           +#13+
          '       U.IMOAREACOMUM,    U.IDCARTEIRASPC,   U.TAXACOMPRA,        U.INDICECOMPRA, '       +#13+
          '       U.IDIMOVELPAI,     U.FLGTIPOIMOVEL,   U.IMOCIDADE,         U.CODESTADO, '          +#13+
          '       IM.IMONOME||'' - ''||I.IMONOME AS IMOVEL_EXTENSO, '                                +#13+
          '       IM.IMONOME||'' - ''||I.IMONOME||'' - ''||U.IMONOME AS UNIDADE_EXTENSO, '           +#13+
          '       IM.IMONOME AS DSC_MESTRE, I.IMONOME AS DSC_IMOVEL, A.NOME AS DSC_ADMINISTRADORA, ' +#13+
          '       C.NOME AS DSC_CARTORIO, TI.DESCTIPOIMOVEL AS DSC_TIPOIMOVEL '                      +#13+
          'FROM IMOVEL I, IMOVEL IM, IMOVEL U, TIPOIMOVEL TI, CIDADES CI, ESTADO E, '                +#13+
          '     ADMINIMOVEL AM, PESSOA A, CARTORIO CA, PESSOA C '                                    +#13+
          'WHERE U.IDIMOVELMESTRE = IM.IDIMOVEL(+) '                                                 +#13+
          '  AND U.IDIMOVELPAI    = I.IDIMOVEL '                                                     +#13+
          '  AND U.CODTIPIMOVEL   = TI.CODTIPIMOVEL(+) '                                             +#13+
          '  AND U.IDCIDADES      = CI.IDCIDADES(+) '                                                +#13+
          '  AND CI.IDESTADO      = E.IDESTADO(+) '                                                  +#13+
          '  AND U.IDADMINIMOVEL  = AM.IDADMINIMOVEL(+) '                                            +#13+
          '  AND AM.IDADMINIMOVEL = A.IDPESSOA(+) '                                                  +#13+
          '  AND U.IDCARTORIO     = CA.IDCARTORIO(+) '                                               +#13+
          '  AND CA.IDCARTORIO    = C.IDPESSOA(+) '                                                  +#13+sParam;

  Result := GetDataPacket(sSql);
end;

function TCtrlImovel.AtualizaEnderecoUnidade(const iIdImovel:Integer): Boolean;
var sSql    : String;
begin
  sSql    := '';
  Result  := True;

  if (CdsImovel.FieldByName('FLGTIPOIMOVEL').AsInteger<2) then begin
    try
      sSql := 'UPDATE IMOVEL '                                                                                 +#13+
              '   SET IDCIDADES     = '+QuotedStr(IntToStr(CdsImovel.FieldByName('IDCIDADES').AsInteger))+',' +#13+
              '       IMOLOGRADOURO = '+QuotedStr(CdsImovel.FieldByName('IMOLOGRADOURO').AsString)+','        +#13+
              '       IMONUMERO     = '+QuotedStr(CdsImovel.FieldByName('IMONUMERO').AsString)+','            +#13+
              '       IMOBAIRRO     = '+QuotedStr(CdsImovel.FieldByName('IMOBAIRRO').AsString)+','            +#13+
              '       IMOCEP        = '+QuotedStr(CdsImovel.FieldByName('IMOCEP').AsString)                   +#13+
              ' WHERE IDIMOVELPAI   = '+QuotedStr(IntToStr(iIdImovel));

      if not ExecSQL(sSql) then
        raise Exception.Create('');
    except
      on E : Exception do begin
        Result := False;
      end;
    end;
  end;
end;
// Daniel - 24085 - Fim --------------------------------------------------------

procedure TCtrlImovel.SetCdsPlanoPatroxVigenciaImob(
  const Value: TCMClientDataSet);
begin
  FCdsPlanoPatroxVigenciaImob := Value;
end;
//Cássio - SOL 107352 KINTANA 482365 - Início
function TCtrlImovel.LookupPlanoPatroxVigenciaImob(
  const iIdImovel: Integer): OLEVariant;
var
  sSQL, sUserInclusao : String;
  _cdsAux : TCMClientDataSet;
  iUserInclusao: Integer;
  _qryAux : TQuery;
begin
  _cdsAux := TCMClientDataSet.Create(nil);
  _qryAux := TQuery.Create(nil);
  _qryAux.Databasename := 'BaseDados';
  try
    sSQL:= 'SELECT PPV.IDPLANOPATROXVIGENCIAIMOB,                    ' + #13 +
           '       PPV.IDIMOVEL,                                     ' + #13 +
           '       PPV.DATAVIGENCIA,                                 ' + #13 +
           '       PPV.IDPLANOPREV,                                  ' + #13 +
           '       PPC.NOME AS NOMEPLANO,                            ' + #13 +
           '       PPV.IDPATRO,                                      ' + #13 +
           '       PES.NOME AS NOMEPATRO,                            ' + #13 +
           '       PPV.PERCENTRATEIO,                                ' + #13 +
           '       PPV.TRGUSERINCLUSAO,                              ' + #13 +
           '       PPV.TRGDTINCLUSAO,                                ' + #13 +
           '       RPAD('' '', 30) AS NOMEUSUARIO                    ' + #13 +
           '  FROM PLANOPATROXVIGENCIAIMOB PPV,                      ' + #13 +
           '       PESSOA PES,                                       ' + #13 +
           '       PLANPREVCONTABIL PPC                              ' + #13 +
           ' WHERE PPV.IDPATRO  = PES.IDPESSOA                       ' + #13 +
           '   AND PPV.IDPLANOPREV = PPC.IDPLANOPREV                 ' + #13 +
           '   AND PPV.IDIMOVEL = ' + IntToStr(iIdImovel)              + #13 +
           ' ORDER BY PPV.DATAVIGENCIA DESC, PES.NOME, PPC.NOME';
    _cdsAux.Data:=  GetDataPacket(sSQL);

    while not _cdsAux.Eof do
    begin
      sUserInclusao := Copy(_cdsAux.FieldByName('TRGUSERINCLUSAO').AsString, 3,
                            Length(_cdsAux.FieldByName('TRGUSERINCLUSAO').AsString));
      iUserInclusao := StrToIntDef(sUserInclusao, 0);
      if iUserInclusao = 0 then
      begin
        _cdsAux.Edit;
        _cdsAux.FieldByName('NOMEUSUARIO').AsString := _cdsAux.FieldByName('TRGUSERINCLUSAO').AsString;
        _cdsAux.Post;
      end
      else
      begin
        _qryAux.Close;
        _qryAux.Sql.Clear;
        _qryAux.Sql.Add('SELECT NOME FROM PESSOA WHERE IDPESSOA = ' + IntToStr(iUserInclusao));
        _qryAux.Open;
        _cdsAux.Edit;
        _cdsAux.FieldByName('NOMEUSUARIO').AsString := _qryAux.FieldByName('NOME').AsString;
        _cdsAux.Post;
      end;
      _cdsAux.Next;
    end;
    Result := _cdsAux.Data;
  finally
   FreeAndNil(_cdsAux);
   FreeAndNil(_qryAux);
  end;
end;
//Cássio - SOL 107352 KINTANA 482365 - Fim

//Cássio - SOL 107352 KINTANA 482365 - Início
//Verifica se existem bens pertencentes ao imóvel
function TCtrlImovel.VerificaBensxImovel(iIDiImovel: Integer): Boolean;
var
  sSQL: string;
  cdsBemxImovel: TClientDataSet;
begin
  cdsBemxImovel := TClientDataSet.Create(nil);
  try
    sSQL:= 'SELECT IDBEM FROM IMOVELXBEM WHERE IDIMOVEL = ' + IntToStr(iIDiImovel);
    cdsBemxImovel.Data := GetDataPacket(sSQL);

    if cdsBemxImovel.RecordCount >= 1 then
      Result := True;
      
  finally
    FreeAndNil(cdsBemxImovel);
  end;
end;
//Cássio - SOL 107352 KINTANA 482365 - Início
function TCtrlImovel.LookupPlanoPatroxVigenciaBem : OLEVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT IDPLANOPATROXVIGENCIABEM, ' + #13 +
          '       IDBEM,                    ' + #13 +
          '       DATAVIGENCIA,             ' + #13 +
          '       IDPLANOPREV,              ' + #13 +
          '       IDPATRO,                  ' + #13 +
          '       PERCENTRATEIO,            ' + #13 +
          '       IDPESSOA                  ' + #13 +
          '  FROM PLANOPATROXVIGENCIABEM    ' + #13 +
          ' WHERE 1=2                       ';

  Result := GetDataPacket(sSQL);
end;
//Cássio - SOL 107352 KINTANA 482365 - Fim

procedure TCtrlImovel.SetDbPlanoPatroxVigenciaImob(
  const Value: TDbPlanoPatroxVigenciaImob);
begin
  FDbPlanoPatroxVigenciaImob := Value;
end;

procedure TCtrlImovel.SetCdsPlanoPatroxVigenciaBem(
  const Value: TCMClientDataSet);
begin
  FCdsPlanoPatroxVigenciaBem := Value;
end;

procedure TCtrlImovel.SetDbPlanoPatroxVigenciaBem(
  const Value: TDbPlanoPatroxVigenciaBem);
begin
  FDbPlanoPatroxVigenciaBem := Value;
end;
//Cássio - SOL 107352 KINTANA 482365 - Início
function TCtrlImovel.LookupPlanoPatroxVigenciaBem(iIdBem: Integer): OLEVariant;
var
  sSQL : string;
begin
  sSQL:= 'SELECT IDPLANOPATROXVIGENCIABEM , ' +#13+
         '       IDBEM,                     ' +#13+
         '       DATAVIGENCIA,              ' +#13+
         '       IDPLANOPREV,               ' +#13+
         '       IDPATRO,                   ' +#13+
         '       PERCENTRATEIO,             ' +#13+
         '       IDPESSOA                   ' +#13+
         '  FROM PLANOPATROXVIGENCIABEM     ' +#13+
         ' WHERE IDBEM = ' + IntToStr(iIdBem);
  Result := GetDataPacket(sSQL);
end;
//Cássio - SOL 107352 KINTANA 482365 - Fim

function TCtrlImovel.ValidaPlanoxPatro(iPlanPrev,
  iPatro: integer): boolean;
var
  sSQL : string;
  cdsPlanoPatroxImovel : TCmClientDataSet;
begin
  Result := False;
  cdsPlanoPatroxImovel := TCmClientDataSet.Create(nil);
  try
    sSQL := 'SELECT PES.NOME AS NOMEPATRO, ' + #13 +
            '       PLP.NOME AS NOMEPLANO, ' + #13 +
            '       PCP.IDPLANPREVCTBPATR, ' + #13 +
            '       PCP.IDPATRO,           ' + #13 +
            '       PCP.IDPLANOPREV        ' + #13 +
            'FROM PESSOA PES, PLANPREVCONTABIL PLP, PLANPREVCONTABPATRO PCP ' + #13 +
            'WHERE PLP.IDPLANOPREV = PCP.IDPLANOPREV ' + #13 +
            'AND PES.IDPESSOA = PCP.IDPATRO ' + #13 +
            'AND PLP.ATIVO = ''S''          ' + #13 +
            'AND PCP.IDPLANOPREV       =  ' + IntToStr(iPlanPrev) + #13 +
            'AND PCP.IDPATRO           =  ' + IntToStr(iPatro);
    cdsPlanoPatroxImovel.Data := GetDataPacket(sSQL);
    Result := not cdsPlanoPatroxImovel.IsEmpty;
  finally
    FreeAndNil(cdsPlanoPatroxImovel);
  end;
end;

function TCtrlImovel.VerificaPlano(sPlano: string;
  iIdImovel: integer): boolean;
var
  sSQL : string;
  cdsAux : TClientDataSet;
begin
  Result := False;
  cdsAux := TClientDataSet.Create(nil);
  try
    sSQL := 'SELECT IDPLANOPREV FROM PLANOPATROXIMOVEL WHERE IDIMOVEL = ' + IntToStr(iIdImovel) + ' AND IDPLANOPREV = ' + sPlano;
    cdsAux.Data := GetDataPacket(sSQL);
    Result := cdsAux.RecordCount > 0;
  finally
    FreeAndNil(cdsAux);
  end;

end;

function TCtrlImovel.VerificaQntPlanos(iIdimovel: integer): integer;
var
  sSQL : string;
  cdsAux : TClientDataSet;
begin
  cdsAux := TClientDataSet.Create(nil);
  try
    sSQL := 'SELECT COUNT(IDPLANOPREV) AS QNTPLANOS FROM PLANOPATROXIMOVEL WHERE IDIMOVEL = ' + IntToStr(iIdImovel);
    cdsAux.Data := GetDataPacket(sSQL);
    Result := cdsAux.FieldByName('QNTPLANOS').asInteger;
  finally
    FreeAndNil(cdsAux);
  end;
end;

function TCtrlImovel.BuscaVigenciaAnteriorImovel(iIdImovel : Integer): OLEVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT IDPLANOPATROXVIGENCIAIMOB, ' +#13+
          '       IDIMOVEL,   ' + #13 +
          '       IDPATRO,    ' + #13 +
          '       IDPLANOPREV, ' + #13 +
          '       PERCENTRATEIO, ' + #13 +
          '       ''P'' AS FLGTIPO, ' + #13 +
          '       '' '' AS NOME_PLANO,' + #13 +
          '       '' '' AS NOME_PATRO,' + #13 +
          '       '' '' AS DESCR_FLGTIPO, ' + #13 +
          '       DATAVIGENCIA   ' + #13 +
          '  FROM PLANOPATROXVIGENCIAIMOB ' + #13 +
          ' WHERE IDIMOVEL = ' + IntToStr(iIdImovel) + #13 +
          '   AND DATAVIGENCIA = (SELECT MAX(DATAVIGENCIA) ' + #13 +
          '                         FROM PLANOPATROXVIGENCIAIMOB ' + #13 +
          '                        WHERE IDIMOVEL = ' + IntToStr(iIdImovel) + #13 +
          '                           AND DATAVIGENCIA < (SELECT MAX(DATAVIGENCIA) ' + #13 +
          '                                                 FROM PLANOPATROXVIGENCIAIMOB  ' + #13 +
          '                                                 WHERE IDIMOVEL = ' + IntToStr(iIdImovel) +'))';

 Result := GetDataPacket(sSQL);
end;

function TCtrlImovel.LookupVigenciaBemAnterior(
  iIdBem: Integer): OLEVariant;
var
  sSQL : string;
begin
  sSQL:= 'SELECT IDPLANOPATROXVIGENCIABEM,  ' +#13+
         '       IDBEM,                     ' +#13+
         '       DATAVIGENCIA,              ' +#13+
         '       IDPLANOPREV,               ' +#13+
         '       IDPATRO,                   ' +#13+
         '       PERCENTRATEIO,             ' +#13+
         '       IDPESSOA                   ' +#13+
         '  FROM PLANOPATROXVIGENCIABEM     ' +#13+
         ' WHERE IDBEM = ' + IntToStr(iIdBem) + #13+
         '   AND DATAVIGENCIA < (SELECT MAX(DATAVIGENCIA) ' +#13+
         '                         FROM PLANOPATROXVIGENCIABEM '  +#13+
         '                         WHERE IDBEM = ' + IntToStr(iIdBem) +')';

  Result := GetDataPacket(sSQL);    
end;

{Início - Michelle Mota - SIG26054}
function TCtrlImovel.ListVotoCadImovel(iIdImovel: string): OLEVariant;
var
  sSQL : string;
begin
  sSQL:= 'SELECT VT.VOTO, '  +#13+
         '       VT.RESOLUCAO,'  +#13+
         '       VT.TIPO, '  +#13+
         '       VT.VLRAPROVADO, '  +#13+
         '       VT.DESCRICAO,  '  +#13+
         '       P.IDPESSOA, '  +#13+
         '       P.NOME as FORN,  ' +#13+
         '       VT.IDVOTOGESTAOIMOVEL ' +#13+
         '  FROM VOTOGESTAOIMOVEL VT, PESSOA P, IMOVEISXVOTO IM '  +#13+
         ' WHERE VT.IDPESSOA = P.IDPESSOA '  +#13+
         '   AND IM.IDVOTOGESTAOIMOVEL = VT.IDVOTOGESTAOIMOVEL ';

         if (iIdImovel = null) then
           sSQL := sSQL + '   AND IM.IDIMOVEL = 0 '
         else
           sSQL := sSQL + '   AND IM.IDIMOVEL = ' + iIdImovel;

  Result := GetDataPacket(sSQL);
end;
{Término - Michelle Mota - SIG26054}

function TCtrlImovel.AtualizaPlanoPatroxVigenciaImob(
  const iIdImovel: Integer; bRecuperaVigencia : Boolean = False): Boolean;
var
   sSqlHst  : String;
   cdsAux, cdsAux2   : TCMClientDataSet;
   sSQLAux  : string;
begin
  cdsAux := TCMClientDataSet.Create(nil);
  cdsAux2 := TCMClientDataSet.Create(nil);
  try
    try
      sSQLAux := 'SELECT IDPLANOPATROXVIGENCIAIMOB, ' +#13+
                 '       IDIMOVEL,                  ' +#13+
                 '       DATAVIGENCIA,              ' +#13+
                 '       IDPLANOPREV,               ' +#13+
                 '       IDPATRO,                   ' +#13+
                 '       PERCENTRATEIO              ' +#13+
                 '  FROM PLANOPATROXVIGENCIAIMOB    ' +#13+
                 ' WHERE 1 = 2 ';
      cdsAux.Data := GetDataPacket(sSQLAux);

      if bRecuperaVigencia then
      begin
        cdsAux2.Data := LookupPlanoPatroxImo(CdsImovel.FieldByName('IDIMOVEL').asInteger);

        while not cdsAux2.Eof do
        begin
          sSqlHst := 'DELETE FROM PLANOPATROXVIGENCIAIMOB ' +#13+
                     ' WHERE IDIMOVEL = ' + IntToStr(iIdImovel) + #13+
                     '   AND DATAVIGENCIA = ' + QuotedStr(cdsAux2.FieldByName('DATAVIGENCIA').AsString) +#13+
                     '   AND IDPLANOPREV = ' + cdsAux2.FieldByName('IDPLANOPREV').AsString +#13+
                     '   AND IDPATRO = ' + cdsAux2.FieldByName('IDPATRO').AsString;

          if not ExecSQL(sSqlHst) then
            raise Exception.Create('');

          cdsAux2.Next;
        end;
      end
      else
      begin
        CdsPlanoPatroxImovel.First;
        VerificaVigenciaExistenteImovel(iIdImovel, CdsPlanoPatroxImovel.FieldByName('DATAVIGENCIA').AsString);
                  
        while not CdsPlanoPatroxImovel.Eof do
        begin

          sSqlHst := 'INSERT INTO PLANOPATROXVIGENCIAIMOB (IDPLANOPATROXVIGENCIAIMOB, IDIMOVEL, DATAVIGENCIA, IDPLANOPREV, IDPATRO, PERCENTRATEIO)  ' + #13 +
                     'VALUES('+ IntToStr(LeUltRegistro(nil, 'PLANOPATROXVIGENCIAIMOB')) + ',' + #13 +
                                IntToStr(iIdImovel) + ',' + #13 +
                                QuotedStr(CdsPlanoPatroxImovel.FieldByName('DATAVIGENCIA').AsString) + ',' + #13 +
                                CdsPlanoPatroxImovel.FieldByName('IDPLANOPREV').AsString + ',' + #13 +
                                CdsPlanoPatroxImovel.FieldByName('IDPATRO').asString + ',' + #13 +
                                QuotedStr(CdsPlanoPatroxImovel.FieldByName('PPIPERCENTRATEIO').AsString) + ')';
          if not ExecSQL(sSqlHst) then
            raise Exception.Create('');
          CdsPlanoPatroxImovel.Next;
        end;
      end;
    except
      on E : Exception do
        Result := False;
    end;

  finally
    Result := True;
    FreeAndNil(cdsAux);
    FreeAndNil(cdsAux2);
  end;
end;
function TCtrlImovel.AtualizaPlanoPatroxImovel(const iIdImovel: Integer;
  bRecuperaVigencia: Boolean): Boolean;
var
  sSql     : String;
  sSqlHst  : String;
  cdsAux, cdsAux2   : TCMClientDataSet;
  i : Integer;
begin
  cdsAux := TCMClientDataSet.Create(nil);
  cdsAux2 := TCMClientDataSet.Create(nil);
  try
    try
      sSql := 'SELECT IDPLANOPREV FROM PLANOPATROXIMOVEL WHERE IDIMOVEL = ' + IntToStr(iIdImovel);
      cdsAux.Data :=  GetDataPacket(sSql);

      while not cdsAux.Eof do
      begin
        sSQL := 'DELETE FROM PLANOPATROXIMOVEL ' + #13 +
                ' WHERE IDIMOVEL = ' + IntToStr(iIdImovel) +#13+
                '   AND IDPLANOPREV = ' + cdsAux.FieldByName('IDPLANOPREV').asString;

        if not ExecSQL(sSQL) then
            raise Exception.Create('');
        cdsAux.Next;
      end;

      if not CdsPlanoPatroxImovel.IsEmpty then
      begin
        CdsPlanoPatroxImovel.First;
        while not cdsPlanoPatroxImovel.Eof do
        begin
          sSQL := 'INSERT INTO PLANOPATROXIMOVEL (IDIMOVEL, IDPATRO, IDPLANOPREV, PPIPERCENTRATEIO, FLGTIPO )' +#13+
                  'VALUES (' + IntToStr(iIdImovel) + ','
                             + CdsPlanoPatroxImovel.FieldByName('IDPATRO').asString + ','
                             + CdsPlanoPatroxImovel.FieldByName('IDPLANOPREV').asString + ','
                             + QuotedStr(CdsPlanoPatroxImovel.FieldByName('PPIPERCENTRATEIO').asString) + ','
                             + QuotedStr(CdsPlanoPatroxImovel.FieldByName('FLGTIPO').asString) + ')' ;
          if not ExecSQL(sSQL) then
            raise Exception.Create('');

          cdsPlanoPatroxImovel.Next;
        end;
      end
      else
      begin
        cdsAux2.Data :=  BuscaVigenciaAnteriorImovel(iIdImovel);
        while not cdsAux2.Eof do
        begin
          sSQL := 'INSERT INTO PLANOPATROXIMOVEL (IDIMOVEL, IDPATRO, IDPLANOPREV, PPIPERCENTRATEIO, FLGTIPO )' +#13+
                  'VALUES (' + cdsAux2.FieldByName('IDIMOVEL').asString + ','
                             + cdsAux2.FieldByName('IDPATRO').asString + ','
                             + cdsAux2.FieldByName('IDPLANOPREV').asString + ','
                             + QuotedStr(cdsAux2.FieldByName('PERCENTRATEIO').asString) + ','
                             + 'P' + ')' ;
          if not ExecSQL(sSQL) then
            raise Exception.Create('');
          cdsAux2.Next;
        end;
      end;
    except
      on E: Exception do
        Result := False;
    end;
  finally
    FreeAndNil(cdsAux);
    Result:= True;
  end;
end;

function TCtrlImovel.VerificaUltimaVigenciaImovel(
  iIdImovel: Integer): Boolean;
var
  sSQL : string;
  _cds : TCMClientDataSet;
begin
  Result := True;
  _cds := TCMClientDataSet.Create(nil);
  try
    sSQL := 'SELECT MAX(DATAVIGENCIA) AS DATAVIGENCIA FROM PLANOPATROXVIGENCIAIMOB WHERE IDIMOVEL = ' + IntToStr(iIdImovel);

    _cds.Data := GetDataPacket(sSQL);
    cdsPlanoPatroxImovel.First;
    while not cdsPlanoPatroxImovel.Eof do
    begin
      //_cds.First;
      //while not _cds.Eof do
      //begin
        if (cdsPlanoPatroxImovel.FieldByName('DATAVIGENCIA').asDateTime <> 0) and
          (cdsPlanoPatroxImovel.FieldByName('DATAVIGENCIA').asDateTime < _cds.FieldByName('DATAVIGENCIA').asDateTime) then
          Result := False
        else
          Result := True;
      //  _cds.Next;
      //end;        
      cdsPlanoPatroxImovel.Next;
    end;
  finally
    FreeAndNil(_cds);
  end;
end;

procedure TCtrlImovel.VerificaVigenciaExistenteBem(iIdBem: Integer; sDataVigencia: string);
var
  sSQL : string;
  cds : TCMClientDataSet;
begin
  cds := TCMClientDataSet.Create(nil);
  try
    sSQL := 'SELECT IDPLANOPREV FROM PLANOPATROXVIGENCIABEM ' +
            ' WHERE IDBEM = '+ IntToStr(iIdBem) +
            '   AND DATAVIGENCIA = ' + QuotedStr(sDataVigencia);
    cds.Data := GetDataPacket(sSQL);

    if cds.RecordCount > 1 then
    begin
      while not cds.Eof do
      begin
        sSQL := 'DELETE FROM PLANOPATROXVIGENCIABEM ' +
                ' WHERE IDBEM = ' + IntToStr(iIdBem) +
                '   AND IDPLANOPREV = ' + cds.FieldByName('IDPLANOPREV').asString +
                '   AND DATAVIGENCIA = ' + QuotedStr(sDataVigencia);

        if not ExecSql(sSQL) then
          Exception.Create('');

        cds.Next;
      end;
    end;
  finally
    FreeAndNil(cds);
  end;
end;

procedure TCtrlImovel.VerificaVigenciaExistenteImovel(iIdImovel: Integer;
  sDataVigencia: string);
var
  sSQL : string;
  cds : TCMClientDataSet;
begin
  cds := TCMClientDataSet.Create(nil);
  try
    sSQL := 'SELECT IDPLANOPREV FROM PLANOPATROXVIGENCIAIMOB ' +
            ' WHERE IDIMOVEL = '+ IntToStr(iIdImovel) +
            '   AND DATAVIGENCIA = ' + QuotedStr(sDataVigencia);
    cds.Data := GetDataPacket(sSQL);

    if cds.RecordCount > 1 then
    begin
      while not cds.Eof do
      begin
        sSQL := 'DELETE FROM PLANOPATROXVIGENCIAIMOB ' +
                ' WHERE IDIMOVEL = ' + IntToStr(iIdImovel) +
                '   AND IDPLANOPREV = ' + cds.FieldByName('IDPLANOPREV').asString +
                '   AND DATAVIGENCIA = ' + QuotedStr(sDataVigencia);

        if not ExecSql(sSQL) then
          Exception.Create('');

        cds.Next;
      end;
    end;
  finally
    FreeAndNil(cds);
  end;

end;

procedure TCtrlImovel.SetCdsProvisaoImovel(const Value: TCMClientDataSet);
begin
  FCdsProvisaoImovel := Value;
end;

procedure TCtrlImovel.SetDbProvisaoImovel(const Value: TDbProvisaoImovel);
begin
  FDbProvisaoImovel := Value;
end;

end.
