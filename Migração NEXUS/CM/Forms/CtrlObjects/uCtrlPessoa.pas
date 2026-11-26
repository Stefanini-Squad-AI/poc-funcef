
{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"               }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 23/02/2002                             }
{                                                       }
{*******************************************************}
{
---------------------------------------------------------------------------------
 N. Chamado....: WO33342
 Dt Alteração..: 25/02/2026
 Responsável...: Paulo Nobre
 Descrição.....: PROJETO CNPJ ALFANUMÉRICO
                 .Incluindo na função: MaskField para considerar o caracter "A".
---------------------------------------------------------------------------------
//N. SIG..........   : 38475
//Data da Alteração: : 08/01/2021
//Responsável:       : Everson Cunha
//Descrição.......   : Melhorias/ajustes eSocial versão simplificada 1.0
//***************************************************************************************
//Rotina             : ListTipoLogradouro
//N. SIG..........   : 62614
//Data da Alteração: : 06/02/2018
//Alteração Form:    : uCtrlPessoa
//Responsável:       : Luiz Carlos
//Descrição.......   : Alteração para trazer lista de logradouros
//***************************************************************************************
//Rotina             : SelListMunicipios
//N. SIG..........   : 23656.57136
//Data da Alteração: : 20/12/2017
//Alteração Form:    : uCtrlPessoa
//Responsável:       : Cássio Florêncio Rovaroto
//Descrição.......   : Inlcusão de função que retorna a lista de municípios;
//***************************************************************************************
--------------------------------------------------------------------------------------------------
Nº SIG......: 22093
Data........: 22/08/2016
Responsável.: Michelle Suellyn Mota
Descrição...: Criar campo para NIF no Consulta geral de pessoas e na tela elegível participante
Alterações..: Criado CdsPais e funções para manipular os registros.
------------------------------------------------------------------------------
Nº SOL............: 244468
Nº PPM............: 601155
Data da Alteração.: 05/12/2014
Alteração Form....: Inserir validação no Applycds no FcdsImagemOutro
Responsável.......: William Santana
Descrição.........: Erro DATASET
-------------------------------------------------------------------------------------------------
Nº SOL......: 211502.16259
Nº PPM......: 442499
Data........: 15/10/2014
Responsável.: William Santana 
Descrição...: Desenvolvimento do produto referente ao SOL 211502.
--------------------------------------------------------------------------------------------------
Nº SOL: 229871/16137
Nº PPM: 407073
Data da Alteração: 02/10/2014
Alteração Form: Incluido o tipo de logradouro e alteração na listagem de endereço.
Responsável: Felipe A. Santos
Descrição: foi criado o metodo que lista os tipos de logradouro, e na lista de endereço, foi incluído
           o campo CODMUNICIPIO.
--------------------------------------------------------------------------------------------------
Nº SOL......: 215475
Nº KINTANA..: 2044512
Data........: 03/09/2013
Responsável.: Fernando Xavier
Descrição...: Erro no cadastro de favorecido Campo Cidade e Estado não inseridos na ENDPESS
--------------------------------------------------------------------------------------------------
Rotina......: selMascara
Nº SOL......: 138283
Nº KINTANA..: 840489
Data........: 30/06/2011
Responsável.: Vinicius Eduardo Nascimento Maciel
Descrição...: Foi acrescido o campo FLGMULTIPLAMASCARA, oCdsTipoDocumento, e as
              rotinas selMascara e CarregaTipoDocumento.
-------------------------------------------------------------------------------------------------- }

{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 1059049
Nº KINTANA..: 149075
Data........: 14/12/2010
Responsável.: Thaise Amaral Martins
Descrição...: Na função PossuiVinculo, colocar o tipo de situação em 'A' ou 'F'
-------------------------------------------------------------------------------------------------- }

{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 24591
Nº KINTANA..: 524457
Data........: 28/10/2010
Responsável.: Thaise Amaral Martins
Descrição...: Desabilitando campos que só podem ser alterados no módulo Folha de Pagamento caso
              o funcionário possua vínculo empregatício com a Funcef.
-------------------------------------------------------------------------------------------------- }


// andre tavares - pendência 18016 - 15/02/2004 - cração do método SetaNumCGCCPF.

unit uCtrlPessoa;

interface

Uses SysUtils, Classes, DbClient, uCmControlObject, uDbContatopess, uDbDocpessoa, uDbEndpess,
     uDbImagens, uDbPessoa, uDbPessoafisica, uDbTelcontato, uDbTelendpess, uDbContabancaria,
     uDbBanco, uDbAgenciabancaria, Db, uCMTypes;

Type
  TCtrlPessoa = Class(TCmControlObject)
  private
    FCdsTelendpess: TClientDataSet;
    FCdsPessoa: TClientDataSet;
    FCdsContatopess: TClientDataSet;
    FCdsPessoafisica: TClientDataSet;
    FCdsEndpess: TClientDataSet;
    FCdsImagensPessoa: TClientDataSet;
    FCdsDocpessoa: TClientDataSet;
    FCdsTelcontato: TClientDataSet;
    FCdsContaBancaria: TClientDataSet;
    FCdsSubTipo: TClientDataSet;
    FTipoPessoa: TTipoPessoa;
    FIdEmpresa: LongInt;
    FIdDocChave: LongInt;
    fIdRegra: Integer;
    fMascaraDocum: String;
    fNomeDocumento: String;
    FUsaPessoaFisica: Boolean;
    FSubTipo: TSubTipo;
    FSaveModuloRespon: Boolean;
    FMostraFoto: Boolean;
    FNomeCampoId: string;
    FNomeTabela: string;
    FSQLFiltro: Tstrings;
    FMudaCaption: Boolean;
    fCaption: String;
    FFormCaption: String;
    FCdsImagensDOC: TClientDataSet;
    FEJuridica: Boolean;
    FExibeDadosBancarios: Boolean;
    FCdsEstado: TClientDataSet;
//Vinicius Maciel SOL138283 Kintana 840489
    FCdsTipoDocumento: TClientDataSet;
//Vinicius Maciel SOL138283 Kintana 840489 - Fim
    FCdsNaturalidade: TClientDataSet;
    FCdsBanco: TClientDataSet;
    FCdsDocumento: TClientDataSet;
    FCdsTipoDoc: TClientDataSet;
    FObrigaDocumento: Boolean;
    FCdsImagemOutro: TClientDataSet; //William Santana - SOL 211502.16259 PPM 442499
    FCdsPais : TClientDataSet; // Michelle Mota - SIG 22093
    procedure SetCdsContatopess(const Value: TClientDataSet);
    procedure SetCdsDocpessoa(const Value: TClientDataSet);
    procedure SetCdsEndpess(const Value: TClientDataSet);
    procedure SetCdsImagensPessoa(const Value: TClientDataSet);
    procedure SetCdsPessoa(const Value: TClientDataSet);
    procedure SetCdsPessoafisica(const Value: TClientDataSet);
    procedure SetCdsTelcontato(const Value: TClientDataSet);
    procedure SetCdsTelendpess(const Value: TClientDataSet);
    procedure SetCdsContaBancaria(const Value: TClientDataSet);
    procedure SetCdsSubTipo(const Value: TClientDataSet);
    procedure SetTipoPessoa(const Value: TTipoPessoa);
    procedure SetIdEmpresa(const Value: LongInt);


    procedure SetUsaPessoaFisica(const Value: Boolean);
    procedure SetSubTipo(const Value: TSubTipo);
    procedure SetSaveModuloRespon(const Value: Boolean);
    procedure SetMostraFoto(const Value: Boolean);
    procedure SetFormCaption(const Value: String);
    procedure SetMudaCaption(const Value: Boolean);
    procedure SetCdsImagensDOC(const Value: TClientDataSet);
    procedure SetEJuridica(const Value: Boolean);
    procedure SetExibeDadosBancarios(const Value: Boolean);
    procedure SetCdsBanco(const Value: TClientDataSet);
    procedure SetCdsDocumento(const Value: TClientDataSet);
    procedure SetCdsEstado(const Value: TClientDataSet);
//Vinicius Maciel SOL138283 Kintana 840489
    procedure SetCdsTipoDocumento(const Value: TClientDataSet);
//Vinicius Maciel SOL138283 Kintana 840489 - Fim
    procedure SetCdsNaturalidade(const Value: TClientDataSet);
    procedure SetCdsTipoDoc(const Value: TClientDataSet);
    procedure SetObrigaDocumento(const Value: Boolean);

    procedure SetCdsImagemoutro(const Value: TClientDataSet); //William Santana - SOL 211502.16259 PPM 442499
    procedure SetCdsPais(const Value: TClientDataSet); // Michelle Mota - SIG 22093
  protected
    _DbContatopess: TDbContatopess;
    _DbDocpessoa: TDbDocpessoa;
    _DbEndpess: TDbEndpess;
    _DbImagens: TDbImagens;
    _DbPessoa: TDbPessoa;
    _DbPessoaAgencia: TDbPessoa;
    _DbPessoafisica: TDbPessoafisica;
    _DbTelcontato: TDbTelcontato;
    _DbTelendpess: TDbTelendpess;
    _DbContaBancaria: TDbContaBancaria;
    _DbBanco: TDbBanco;
    _DbAgenciabancaria :TDbAgenciabancaria;

    {**
      Metodo a ser sobrescrito para atribuição do DataBaseName as classes de controle
      adicionais criadas na classe herdada para o subtipo
    **}
    procedure DoChangeDataBase; Override;
    {**
      Método a ser sobrescrito para diferenciar a chamada da função da aplicação servidora
      pois os parâmetros seram diferentes para cada subtipo envolvido no cadastro.
      Se o pessoa possui apenas a tabela do subtipo sem adicionais não é nescessãrio
      sobrescrever esse método.
    **}
    function ExecAppServer(Operacao: TOperacao): Boolean; Virtual;
    {**
      Método a ser sobrescrito para processamento dos CLientDataSets adicionais ao
      pessoa e do subtipo.
      O parâmetro operação indica a operação de opInserir, opAlterar, opApagar
    **}
    function ProcessaOutros(Operacao: TOperacao; Var Mensagem: String): Boolean; Virtual;
    {**
      O Método OnApplyCdsRecord deve ser sobrescito caso seja nescessário algum processamento
      especial no momento do Apply dos ClientDataSets associados a classe.
    **}
    procedure OnApplyCdsRecord(aCds: TClientDataSet; Const sTableName: String; CdsState: TUpdateStatus; Var Accept: Boolean); Override;
    procedure AfterApplyCdsRecord(aCds: TClientDataSet; Const sTableName: String; CdsState: TUpdateStatus; Accept: Boolean); Override;

    procedure OnCreateAppServer; Override;
  public
    Constructor Create; Override;
    Destructor Destroy; Override;

    function  SetaNumCGCCPF(iddocumento: integer; numDocumento: string): boolean;
    function GetDadosPessoa(rIdPessoa: Double; TipoGetPessoa: TTipoGetPessoa; TipoPessoa: TTipoPessoa): Boolean;
    procedure CdsDadosToOleVariant(var ovPessoa, ovPessoaFisica, ovDocPessoa, ovEndPess,
              ovTelEndPess, ovContatoPess, ovTelContato, ovContaBancaria, ovImagensPessoa,
              ovImagensDoc,  ovEstado,
//Vinicius Maciel SOL138283 Kintana 840489
              ovTipoDocumento,
//Vinicius Maciel SOL138283 Kintana 840489 - Fim
              ovNaturalidade, ovBanco, ovDocumento,  ovTipoDoc{Início Michelle Mota SIG 22093}, ovPais{Término Michelle Mota SIG 22093}: OleVariant);

    function SelContatoPess(rIdPessoa: Double): OleVariant;
    function SelDocPessoa(rIdPessoa: Double; pTipoPessoa: TTipoPessoa): OleVariant;
    function SelTipoDocPessoa(pTipoPessoa: TTipoPessoa): OleVariant;
    function SelEndPess(rIdPessoa: Double): OleVariant;
    function SelImagemPessoa(rIdPessoa: Double): OleVariant;
    function SelPessoa(rIdPessoa: Double): OleVariant;
    function SelPessoaFisica(rIdPessoa: Double): OleVariant;
    function SelTelContato(rIdPessoa: Double): OleVariant;
    function SelTelEndPess(rIdPessoa: Double): OleVariant;
    function SelImagensDocPessoa(rIdPessoa: Double): OleVariant;
    function SelContaBancaria(rIdPessoa: Double): OleVariant;
    function SelPessoaByName(rIdPessoa: Double; sNomePessoa: String): OleVariant;
    function SelPessoaByDocument(rIdPessoa: Double; sDocumento: String): OleVariant;
    function SelCidade(rIdCidades: Double): OleVariant;
    function SelNaturalidade: OleVariant;
    function SelEstado: OleVariant;
    function SelPais: OleVariant;// Michelle Mota - SIG 22093
    //Início - William Santana - SOL 211502.16259 PPM 442499
    function SelImagemOutro(rIdImagem: Double): OleVariant;
    //Término - William Santana - SOL 211502.16259 PPM 442499
//Vinicius Maciel SOL138283 Kintana 840489
    function SelTipoDocumento (sIdDocumento: String; sIdTipoDocPessoaxMasc: String) : OleVariant;
    function SelMascara (sIdDocumento: String; sIdTipoDocPessoaxMasc: String) : String;
    function CarregaTipoDocumento (sIdDocumento: String): String;
//Vinicius Maciel SOL138283 Kintana 840489 - Fim
    function SelBanco: OleVariant;

    function ListTipoLogradouro : OleVariant; // Felipe A. Santos SOL 229871.16137 PPM 407073

    function GetIdAgencia(rIdBanco: Double; sNumAgencia: String): Double;
    function PossuiVinculo(sIDPessoa:Integer): Boolean; //Thaise - Verificar se a pessoa possui vinculo empregaticio com a FUNCEF
    function TravaAlteracao(idPessoa: Integer):boolean; //Thaise - Verificar se o modulo é folha de pagamento e chamar a Função PossuiVinculoEmpregaticio,
                                                        //pra retornar se a alteração pode ou não ser alterada.
    {**
      Método para processamento dos ClientDataSets associados da tela pela classe
      de controle
    **}
    function ProcessaPessoa(Operacao: TOperacao): Boolean;
    {**
      Inicializa parâmetros de validação de documento, tipo de documento e máscara
      para digitação do mesmo
    **}
    procedure HabilitaPessoa;
    {**
      Formata a mascara passada para o formato do FieldMask
    **}
    function MaskField(sMascara: string): string;
    {**
      Verifica se o documento associado é um documento válido de acordo com o
      tipo de pessoa.
    **}
    function DocumentoValido(sDocumento: string): Boolean;
    {**
      Subtipo de pessoa manipulada pela classe.
      Esta propriedade deve ser atribuida antes do Inherited do Create do
      form de pessoa.
    **}
    property SubTipo: TSubTipo read FSubTipo write SetSubTipo;
    {**
      Indica se o registro que esta sendo manipulado refere-se a uma pessoa
      física ou jurídica;
    **}
    property EJuridica: Boolean read FEJuridica write SetEJuridica;
    {**
      Classifica o tipo de registro que o pessoa ira manipular: tpFisica, tpJuridica, tpOpcional
    **}
    property TipoPessoa: TTipoPessoa read FTipoPessoa write SetTipoPessoa;
    {**
      Identificador da empresa proprietária logada no sistema.
    **}
    property IdEmpresa: LongInt read FIdEmpresa write SetIdEmpresa;
    {**
      Controla a exibição do painel para manipulação dos dados referentes a pessoa física
    **}
    property UsaPessoaFisica: Boolean read FUsaPessoaFisica write SetUsaPessoaFisica;
    {**
      Indica se o IDMODULORESPON será gravado no pessoa.
      Se tal informação for registrada o registro só poderá ser excluído/alterado pelo
      módulo que o cadastrou.
      Tal procedimento depende também da parametrização Global do sistema.
    **}
    property SaveModuloRespon: Boolean read FSaveModuloRespon write SetSaveModuloRespon;
    {**
      Controla a exibição do painel para associação de imagem ao pessoa cadastrado
    **}
    property MostraFoto: Boolean read FMostraFoto write SetMostraFoto;

    property ExibeDadosBancarios: Boolean read FExibeDadosBancarios write SetExibeDadosBancarios;
    {**
      Indica se caption do form será atribuído de acordo com o subtipo da pessoa
      ou de acordo com a propriedade FormCaption.
    **}
    property MudaCaption: Boolean read FMudaCaption write SetMudaCaption;
    {**
      String a ser atribuída ao Caption do FORM de pesso quando a propriedade
      MudaCaption = True.
    **}
    property FormCaption: String read FFormCaption write SetFormCaption;
    {**
      Identificador do tipo de documento principal a ser associado ao pessoa
    **}
    property IdDocChave: LongInt read FIdDocChave;
    {**
      Nome do documento principal a se associado ao pessoa
    **}
    property NomeDocumento: String read fNomeDocumento;
    {**
      Máscara do documento principal a se associado ao pessoa
    **}
    property MascaraDocum: String read fMascaraDocum;
    {**
      Identificado da regra de validação do documento principal a se associado ao pessoa
    **}
    property IdRegra: Integer read fIdRegra;
    {**
      Nome da tabela do Subtipo a ser manipulado pela classe de controle.
      É iniciallizada no momento da atribuição do subtipo
    **}
    property NomeTabela : string read FNomeTabela;
    {**
      Nome do campo identificador do Subtipo a ser manipulado pela classe de controle.
      É iniciallizada no momento da atribuição do subtipo
    **}
    property NomeCampoId : string read FNomeCampoId;
    {**
      Caption a ser atribuído ao form de pessoa.
      É iniciallizada no momento da atribuição do subtipo.
      Ver propriedade MudaCaption.
    **}
    property Caption: String read fCaption;
    {**
      Filtro do subtipo a ser adicionado ao MONTASELECT
      É iniciallizada no momento da atribuição do subtipo
    **}
    property SQLFiltro : Tstrings read FSQLFiltro;
    property ObrigaDocumento: Boolean read FObrigaDocumento write SetObrigaDocumento;

    property CdsContatopess: TClientDataSet read FCdsContatopess write SetCdsContatopess;
    property CdsDocpessoa: TClientDataSet read FCdsDocpessoa write SetCdsDocpessoa;
    property CdsEndpess: TClientDataSet read FCdsEndpess write SetCdsEndpess;
    property CdsImagensPessoa: TClientDataSet read FCdsImagensPessoa write SetCdsImagensPessoa;
    property CdsImagensDOC: TClientDataSet read FCdsImagensDOC write SetCdsImagensDOC;
    property CdsPessoa: TClientDataSet read FCdsPessoa write SetCdsPessoa;
    property CdsPessoafisica: TClientDataSet read FCdsPessoafisica write SetCdsPessoafisica;
    property CdsTelcontato: TClientDataSet read FCdsTelcontato write SetCdsTelcontato;
    property CdsTelendpess: TClientDataSet read FCdsTelendpess write SetCdsTelendpess;
    property CdsContaBancaria: TClientDataSet read FCdsContaBancaria write SetCdsContaBancaria;
    property CdsSubTipo: TClientDataSet read FCdsSubTipo write SetCdsSubTipo;

    property CdsNaturalidade: TClientDataSet read FCdsNaturalidade write SetCdsNaturalidade;
    property CdsEstado: TClientDataSet read FCdsEstado write SetCdsEstado;
//Vinicius Maciel SOL138283 Kintana 840489
    property CdsTipoDocumento: TClientDataSet read FCdsTipoDocumento write SetCdsTipoDocumento;
//Vinicius Maciel SOL138283 Kintana 840489 - Fim
    property CdsBanco: TClientDataSet read FCdsBanco write SetCdsBanco;
    property CdsTipoDoc: TClientDataSet read FCdsTipoDoc write SetCdsTipoDoc;
    property CdsDocumento: TClientDataSet read FCdsDocumento write SetCdsDocumento;

    //Início - William Santana - SOL 211502.16259 PPM 442499
    property CdsImagemOutro: TClientDataSet read FCdsImagemOutro write SetCdsImagemOutro;
    //Término - William Santana - SOL 211502.16259 PPM 442499
    property CdsPais: TClientDataSet read FCdsPais write SetCdsPais; // Michelle Mota - SIG 22093
    
  end;

implementation

Uses uMidasUtil, uValidaDoc, uCMFileUtils, uSistema;

{ TCtrlPessoa }

constructor TCtrlPessoa.Create;
begin
  inherited;

  _DbContatopess := TDbContatopess.Create(self);
  _DbDocpessoa := TDbDocpessoa.Create(self);
  _DbEndpess := TDbEndpess.Create(self);
  _DbImagens := TDbImagens.Create(self);
  _DbPessoa := TDbPessoa.Create(self);
  _DbPessoafisica := TDbPessoafisica.Create(self);
  _DbTelcontato := TDbTelcontato.Create(self);
  _DbTelendpess := TDbTelendpess.Create(self);
  _DbContaBancaria := TDbContaBancaria.Create(self);
  _DbBanco := TDbBanco.Create(self);
  _DbAgenciabancaria := TDbAgenciabancaria.Create(self);
  _DbPessoaAgencia := TDbPessoa.Create(self);

  FTipoPessoa := tpJuridica;
  FIdDocChave := 0;
  FUsaPessoaFisica := False;
  FSaveModuloRespon := false;

  FSubTipo := stFilial;
  FTipoPessoa := tpJuridica;
  FIdEmpresa := 0;
  FUsaPessoaFisica := False;
  FIdDocChave := 0;
  fNomeDocumento := '';
  fMascaraDocum := '';
  FSaveModuloRespon := False;
  fIdRegra := 0;
  FMostraFoto := True;
  FNomeTabela := '';
  FNomeCampoId := '';
  FSQLFiltro := TSTringList.Create;
  FMudaCaption := True;
  fCaption := '';
  FFormCaption := '';
  FEJuridica := True;
  FExibeDadosBancarios := False;
  FObrigaDocumento := True;
end;

destructor TCtrlPessoa.Destroy;
begin
  _DbContatopess.Free;
  _DbDocpessoa.Free;
  _DbEndpess.Free;
  _DbImagens.Free;
  _DbPessoa.Free;
  _DbPessoafisica.Free;
  _DbTelcontato.Free;
  _DbTelendpess.Free;
  _DbContaBancaria.Free;
  _DbBanco.Free;
  _DbPessoaAgencia.Free;
  _DbAgenciabancaria.Free;

  If IsAppServer Then
     FreeCds([FCdsTelendpess, FCdsPessoa, FCdsContatopess, FCdsPessoafisica, FCdsEndpess,
              FCdsImagensPessoa, FCdsDocpessoa, FCdsTelcontato, FCdsContaBancaria, FCdsSubTipo, FCdsImagensDOC,
              FCdsEstado, FCdsTipoDocumento,  //Vinicius Maciel SOL138283 Kintana 840489
              FCdsNaturalidade, FCdsBanco, FCdsDocumento, FCdsTipoDoc,
              {Início - William Santana SOL 211502.16259 PPM 442499 } FCdsImagemOutro {Término - William Santana }{Início - Michelle Mota SIG 22093}, FCdsPais{Término - Michelle Mota SIG 22093}]);

  FSQLFiltro.Free;
  inherited;
end;

procedure TCtrlPessoa.DoChangeDataBase;
begin
  inherited;
  _DbContatopess.DataBaseName := DataBaseName;
  _DbDocpessoa.DataBaseName := DataBaseName;
  _DbEndpess.DataBaseName := DataBaseName;
  _DbImagens.DataBaseName := DataBaseName;
  _DbPessoa.DataBaseName := DataBaseName;
  _DbPessoafisica.DataBaseName := DataBaseName;
  _DbTelcontato.DataBaseName := DataBaseName;
  _DbTelendpess.DataBaseName := DataBaseName;
  _DbContaBancaria.DataBaseName := DataBaseName;
  _DbAgenciabancaria.DataBaseName := DataBaseName;
  _DbBanco.DataBaseName := DataBaseName;
  _DbPessoaAgencia.DataBaseName := DataBaseName;
end;

function TCtrlPessoa.ExecAppServer(Operacao: TOperacao): Boolean;
begin
  Result := Connection.AppServer.ProcessaPessoa(Operacao, CdsPessoa.Data, CdsPessoafisica.Data,
            CdsDocpessoa.Data, CdsSubTipo.Data, CdsEndpess.Data, CdsTelendpess.Data,
            CdsContatopess.Data, CdsTelcontato.Data, CdsContaBancaria.Data,
            CdsImagensPessoa.Data, CdsImagensDOC.Data);
end;

procedure TCtrlPessoa.HabilitaPessoa;
begin
  With _Cds Do
  Begin
    Data := GetDataPacket('SELECT DOCPFISICA, DOCPJURIDICA FROM PARAMGLOBAL WHERE PARAMGLOBAL.IDPESSOA = ' + IntToStr(FIdEmpresa));

    If FEJuridica Then
       FIdDocChave := FieldByName('DOCPJURIDICA').AsInteger
    Else
       FIdDocChave := FieldByName('DOCPFISICA').AsInteger;

    Data := GetDataPacket('SELECT NOMEDOCUMENTO, MASCARA, IDREGRA FROM TIPODOCPESSOA WHERE IDDOCUMENTO = '+IntToStr(FIdDocChave));

    fNomeDocumento := FieldByName('NOMEDOCUMENTO').AsString;
    fMascaraDocum := MaskField(FieldByName('MASCARA').AsString);
    fIdRegra := FieldByName('IDREGRA').AsInteger;

    Close;
  end;
end;

procedure TCtrlPessoa.OnApplyCdsRecord(aCds: TClientDataSet;
  const sTableName: String; CdsState: TUpdateStatus; var Accept: Boolean);
begin
  If sTableName = _DbEndpess.TableName Then
  Begin
    Case CdsState of
      usDeleted:
        Begin
            {**
              È feito um tratamento na tabela endpess no momento da exclusão para exclusão
              automática dos registros das tabelas TELENDPESS, CONTATOPESS e TELCONTATO viculadas
              a este endereço caso existam.
            **}

            If Not _DbTelcontato.DeleteForEndPess(aCds.fieldbyname('IDENDERECO').AsFloat) Then
              Raise Exception.Create(_DbTelcontato.MessageInfo);

            If Not _DbContatopess.DeleteForEndPess(aCds.fieldbyname('IDENDERECO').AsFloat) Then
              Raise Exception.Create(_DbContatopess.MessageInfo);

            If Not _DbTelendpess.DeleteForEndPess(aCds.fieldbyname('IDENDERECO').AsFloat) Then
              Raise Exception.Create(_DbTelendpess.MessageInfo);
        End;
    End;
  End
  Else
    If sTableName = _DbContaBancaria.TableName Then
    Begin
      If CdsState in [usInserted, usModified] Then
      Begin
         {**
           Caso o número da agencia não exista no banco, a interface atribui um ID negativo
           ao id agência e esta deve ser inserida no momento do processamento do tela.
         **}
         If (aCds.FieldByName('IDAGENCIA').AsFloat < 0) Then
         Begin

            _DbPessoaAgencia.Nome.AsString  := Copy('Agencia Nº ' + aCds.FieldByName('NUMAGENCIA').AsString + ' - ' + aCds.FieldByName('NOMEBANCO').AsString ,1,60);
            _DbPessoaAgencia.Razaosocial.AsString := Copy('Agencia Nº ' + aCds.FieldByName('NUMAGENCIA').AsString + ' - ' + aCds.FieldByName('NOMEBANCO').AsString ,1,60);
            _DbPessoaAgencia.Tipo.AsString := 'F';

            If Not _DbPessoaAgencia.Insert Then
               Raise Exception.Create(_DbPessoaAgencia.MessageInfo)
            Else
            Begin
               _DbAgenciabancaria.Idpessoa.AsFloat     := _DbPessoaAgencia.Idpessoa.AsFloat;
               _DbAgenciabancaria.Idbanco.AsFloat      := aCds.FieldByName('IDBANCO').AsFloat;
               _DbAgenciabancaria.Numagencia.AsString  := aCds.FieldByName('NUMAGENCIA').AsString;

               If Not _DbAgenciabancaria.Insert Then
                  Raise Exception.Create(_DbPessoaAgencia.MessageInfo)
               Else
               Begin
                  aCds.Edit;
                  aCds.FieldByName('IDAGENCIA').AsFloat := _DbAgenciabancaria.Idpessoa.AsFloat;
                  aCds.Post;
               End;
            End;
         End;
      End;
    End;
end;

function TCtrlPessoa.ProcessaOutros(Operacao: TOperacao;
  var Mensagem: String): Boolean;
begin
  Result := True;
end;

function TCtrlPessoa.ProcessaPessoa(Operacao: TOperacao): Boolean;
Var
  sMensagemOutros: String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := ExecAppServer(Operacao);

     If Not Result Then
       MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
     Result := False;

     Try
        StartTransaction;

        Case Operacao of
        opInserir, opAlterar:
           Begin
              //Imagem Pessoa
              Result := ApplyCds(fCdsImagensPessoa, _DbImagens ,[],[] );
              If Not Result Then Raise Exception.Create(_DbImagens.MessageInfo);

              //Imagem DocPessoa
              Result := ApplyCds(FCdsImagensDOC, _DbImagens ,[],[] );
              If Not Result Then Raise Exception.Create(_DbImagens.MessageInfo);

              //Início - William Santana - SOL 211502.16259 PPM 442499
              //Imagem Outro
              //Início - William Santana - SOL 244468 PPM 601155
              if (FCdsImagemOutro.state in [DsInsert, DsEdit, DsBrowse]) then
              begin
                Result := ApplyCds(FCdsImagemOutro, _DbImagens ,[],[] );
                If Not Result Then Raise Exception.Create(_DbImagens.MessageInfo);
              end;
              //Término - William Santana - SOL 244468 PPM 601155
              //Término - William Santana - SOL 211502.16259 PPM 442499

              //Pessoa
              //Verificar a associação da Imagem com o respectivo Documento ou com o Pessoa
              Result := ApplyCds(fCdsPessoa, _DbPessoa ,[],[] );
              If Not Result Then Raise Exception.Create(_DbPessoa.MessageInfo);

              //Processa o subtipo e outros cds associados ao pessoa a ser definido pelo usuário
              sMensagemOutros := '';
              Result := ProcessaOutros(Operacao,sMensagemOutros);
              If Not Result Then Raise Exception.Create(sMensagemOutros);

              //DocPessoa
              Result := ApplyCds(fCdsDocpessoa, _DbDocpessoa ,[_DbPessoa.Idpessoa], [_DbDocpessoa.Idpessoa]);
              If Not Result Then Raise Exception.Create(_DbDocpessoa.MessageInfo);

              //PessoaFisica
              Result := ApplyCds(fCdsPessoafisica, _DbPessoafisica ,[_DbPessoa.Idpessoa],[_DbPessoafisica.Idpessoa] );
              If Not Result Then Raise Exception.Create(_DbPessoafisica.MessageInfo);

              //ContaBancaria
              Result := ApplyCds(fCdsContaBancaria, _DbContaBancaria ,[_DbPessoa.Idpessoa],[_DbContaBancaria.Idpessoa] );
              If Not Result Then Raise Exception.Create(_DbContaBancaria.MessageInfo);

              //EndPess
              Result := ApplyCds(fCdsEndpess, _DbEndpess ,[_DbPessoa.Idpessoa],[_DbEndpess.Idpessoa] );
              If Not Result Then Raise Exception.Create(_DbEndpess.MessageInfo);

              //TelEndPess
              //Verficar a associação do telefone com o respecito endereço
              Result := ApplyCds(fCdsTelendpess, _DbTelendpess ,[ ],[] );
              If Not Result Then Raise Exception.Create(_DbTelendpess.MessageInfo);

              //ContatoPess
              //Verficar a associação do contato com o respectivo endereço
              Result := ApplyCds(fCdsContatopess, _DbContatopess ,[],[] );
              If Not Result Then Raise Exception.Create(_DbContatopess.MessageInfo);

              //TelContato > Vulgo "RAMAL"
              //Verficar a associação do ramal com o contato e o telefone
              Result := ApplyCds(CdsTelcontato, _DbTelcontato ,[],[] );
              If Not Result Then Raise Exception.Create(_DbTelcontato.MessageInfo);
           End;
        opApagar:
           Begin
              //Processa o subtipo e outros cds associados ao pessoa a ser definido pelo usuário
              sMensagemOutros := '';
              Result := ProcessaOutros(Operacao,sMensagemOutros);
              If Not Result Then Raise Exception.Create(sMensagemOutros);

              //Deleta ContaBancaria
              Result := _DbContaBancaria.DeleteForPessoa(fCdsPessoa.FieldByName('IdPessoa').AsFloat);
              If Not Result Then Raise Exception.Create(_DbContaBancaria.MessageInfo);

              //Deleta EndPess, TelEndPess, ContatoPess, TelContato
              Result := _DbEndpess.DeleteForPessoa(fCdsPessoa.FieldByName('IdPessoa').AsFloat);
              If Not Result Then Raise Exception.Create(_DbEndpess.MessageInfo);
           End;
        End;

        Commit;
     except
        On E:Exception Do
         Begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
         End;
     End;
  End;
end;

function TCtrlPessoa.SelContaBancaria(rIdPessoa: Double): OleVariant;
begin
   Result := GetDataPacket(_DbContaBancaria.GetSelectForPessoa(rIdPessoa));
end;

function TCtrlPessoa.SelContatoPess(rIdPessoa: Double): OleVariant;
begin
   Result := GetDataPacket(_DbContatopess.GetSelectForPessoa(rIdPessoa));
end;

function TCtrlPessoa.SelDocPessoa(rIdPessoa: Double; pTipoPessoa: TTipoPessoa): OleVariant;
Var
  sTipoPessoa: String;
begin
   Case pTipoPessoa Of
     tpFisica: sTipoPessoa := 'F';
     tpJuridica: sTipoPessoa := 'J';
   Else
     sTipoPessoa := 'A';
   End;

   Result := GetDataPacket(_DbDocpessoa.GetSelectForPessoa(rIdPessoa, sTipoPessoa));
end;

function TCtrlPessoa.SelEndPess(rIdPessoa: Double): OleVariant;
begin
   _DbEndpess.Idpessoa.AsFloat := rIdPessoa;
   Result := GetDataPacket(_DbEndpess.GetSelectForPessoa);
end;

function TCtrlPessoa.SelImagemPessoa(rIdPessoa: Double): OleVariant;
begin
   Result := GetDataPacket(_DbImagens.GetSelectForPessoa(rIdPessoa));
end;

function TCtrlPessoa.SelImagensDocPessoa(rIdPessoa: Double): OleVariant;
begin
   Result := GetDataPacket(_DbImagens.GetSelectForDocPessoa(rIdPessoa));
end;

//Início - William Santana - SOL 211502.16259 PPM 442499
function TCtrlPessoa.SelImagemOutro(rIdImagem: Double): OleVariant;
begin
   Result := GetDataPacket(_DbImagens.GetSelectForImagem(rIdImagem));
end;
//Término - William Santana - SOL 211502.16259 PPM 442499

function TCtrlPessoa.SelPessoa(rIdPessoa: Double): OleVariant;
begin
   _DbPessoa.Idpessoa.AsFloat := rIdPessoa;

   Result := GetDataPacket(' SELECT ' +
                           '  PESSOA.IDPESSOA, ' +
                           '  PESSOA.IDIMAGEM, ' +
                           '  PESSOA.NOME , ' +
                           '  PESSOA.TIPO , ' +
                           '  PESSOA.RAZAOSOCIAL , ' +
                           '  PESSOA.NUMDOCUMENTO , ' +
                           '  PESSOA.IDDOCUMENTO , ' +
                           '  PESSOA.EMAIL , ' +
                           '  PESSOA.IDGRUPO, ' +
                           '  PESSOA.IDENDCOMERCIAL, ' +
                           '  PESSOA.IDENDRESIDENCIAL, ' +
                           '  PESSOA.IDENDENTREGA, ' +
                           '  PESSOA.IDENDCOBRANCA, ' +
                           '  PESSOA.IDENDCORRESP, ' +
                           '  PESSOA.HOMEPAGE, ' +
                           '  PESSOA.IDMODULORESPON, ' +
                           '  PESSOA.FLGAVALIAFORNEC ' + //Thaise - SOL136120
                           ' FROM ' +
                           '  PESSOA ' +
                           ' WHERE ' +
                           '  ( PESSOA.IDPESSOA = ' + _DbPessoa.Idpessoa.AsString + ' ) ');
end;

function TCtrlPessoa.SelPessoaFisica(rIdPessoa: Double): OleVariant;
begin
   _DbPessoaFisica.Idpessoa.AsFloat := rIdPessoa;
   Result := GetDataPacket(_DbPessoaFisica.SSqlSelect);
end;

function TCtrlPessoa.SelTelContato(rIdPessoa: Double): OleVariant;
begin
   Result := GetDataPacket(_DbTelContato.GetSelectForPessoa(rIdPessoa));
end;

function TCtrlPessoa.SelTelEndPess(rIdPessoa: Double): OleVariant;
begin
   Result := GetDataPacket(_DbTelendpess.GetSelectForPessoa(rIdPessoa));
end;

procedure TCtrlPessoa.SetCdsContaBancaria(const Value: TClientDataSet);
begin
  FCdsContaBancaria := Value;
end;

procedure TCtrlPessoa.SetCdsContatopess(const Value: TClientDataSet);
begin
  FCdsContatopess := Value;
end;

procedure TCtrlPessoa.SetCdsDocpessoa(const Value: TClientDataSet);
begin
  FCdsDocpessoa := Value;
end;

procedure TCtrlPessoa.SetCdsEndpess(const Value: TClientDataSet);
begin
  FCdsEndpess := Value;
end;

procedure TCtrlPessoa.SetCdsImagensPessoa(const Value: TClientDataSet);
begin
  FCdsImagensPessoa := Value;
end;

procedure TCtrlPessoa.SetCdsPessoa(const Value: TClientDataSet);
begin
  FCdsPessoa := Value;
end;

procedure TCtrlPessoa.SetCdsPessoafisica(const Value: TClientDataSet);
begin
  FCdsPessoafisica := Value;
end;

procedure TCtrlPessoa.SetCdsSubTipo(const Value: TClientDataSet);
begin
  FCdsSubTipo := Value;
end;

procedure TCtrlPessoa.SetCdsTelcontato(const Value: TClientDataSet);
begin
  FCdsTelcontato := Value;
end;

procedure TCtrlPessoa.SetCdsTelendpess(const Value: TClientDataSet);
begin
  FCdsTelendpess := Value;
end;

procedure TCtrlPessoa.SetIdEmpresa(const Value: LongInt);
begin
  FIdEmpresa := Value;
end;

procedure TCtrlPessoa.SetTipoPessoa(const Value: TTipoPessoa);
begin
  FTipoPessoa := Value;
end;

function TCtrlPessoa.MaskField(sMascara:string) : string;
var i : integer;
    tempString : string;
begin
     Result := '';
     for i := 1 to length(sMascara) do
     begin
          tempString := Copy(sMascara,i,1);
          if (tempString = '9') or (tempString ='#') or (tempString ='A') then    // Paulo Nobre - WO33342
             Result := Result+tempString
          else
              Result := Result+'\'+tempString;
     end;
     if Result <> '' then
        Result := Result+';0; ';
end;


function TCtrlPessoa.SelTipoDocPessoa(
  pTipoPessoa: TTipoPessoa): OleVariant;
Var
  sTipoPessoa: String;
begin
   Case pTipoPessoa Of
     tpFisica: sTipoPessoa := 'F';
     tpJuridica: sTipoPessoa := 'J';
   Else
     sTipoPessoa := 'A';
   End;

   Result := GetDataPacket(_DbDocpessoa.GetSelectTipoDoc(sTipoPessoa));
end;

procedure TCtrlPessoa.SetUsaPessoaFisica(const Value: Boolean);
begin
  FUsaPessoaFisica := Value;
end;

procedure TCtrlPessoa.SetSubTipo(const Value: TSubTipo);
begin
  FSubTipo := Value;

  if FMudaCaption then
     fCaption := ListaSubTipo[FSubTipo].Caption
  else
     fCaption := FFormCaption;

  FNomeTabela  := ListaSubTipo[FSubTipo].Tabela;
  FNomeCampoId := ListaSubTipo[FSubTipo].CampoId;

  FsqlFiltro.Clear;
  FsqlFiltro.Add(FNomeTabela+'.'+FNomeCampoId+' = PESSOA.IDPESSOA');
end;

function TCtrlPessoa.SelPessoaByName(rIdPessoa: Double;
  sNomePessoa: String): OleVariant;
begin
  Result := GetDataPacket(' SELECT ' +
                          '    PESSOA.IDPESSOA , PESSOA.NOME, PESSOA.RAZAOSOCIAL , PESSOA.NUMDOCUMENTO ' +
                          ' FROM ' +
                          '    PESSOA ' +
                          ' WHERE ' +
                          '   (PESSOA.IDPESSOA <> ' + FloatToStr(rIdPessoa) + ' ) AND '+
                          '   ( PESSOA.NOME = ' + QuotedStr(sNomePessoa) + ')');
end;

function TCtrlPessoa.SelPessoaByDocument(rIdPessoa: Double;
  sDocumento: String): OleVariant;
begin
  Result := GetDataPacket(' SELECT ' +
                          '   PESSOA.IDPESSOA , PESSOA.NOME, PESSOA.RAZAOSOCIAL , PESSOA.NUMDOCUMENTO ' +
                          ' FROM ' +
                          '   PESSOA ' +
                          ' WHERE ' +
                          '   (PESSOA.IDPESSOA <> '+ FloatToStr(rIdPessoa) +') AND ' +
                          '   (PESSOA.NUMDOCUMENTO = ' + QuotedStr(sDocumento) + ') ');

end;

function TCtrlPessoa.DocumentoValido(sDocumento: string): Boolean;  
Var
   ValidaDoc :TCMValidaDoc;
begin
   Result := false;

   ValidaDoc := TCMValidaDoc.Create(nil);
   Try
     ValidaDoc.NumDocumento := sDocumento;

     Case IdRegra Of
      -1: ValidaDoc.TipoDocumento := tdCGC;
      -2: ValidaDoc.TipoDocumento := tdCPF;
      -3: ValidaDoc.TipoDocumento := tdCUIT;
      Else
        Result := True;
     End;

     If Not Result Then
        Result := ValidaDoc.DocumentoValido;
   finally
     ValidaDoc.Free;
   End;
end;

procedure TCtrlPessoa.SetSaveModuloRespon(const Value: Boolean);
begin
  FSaveModuloRespon := Value;
end;

procedure TCtrlPessoa.SetMostraFoto(const Value: Boolean);
begin
  FMostraFoto := Value;
end;

procedure TCtrlPessoa.SetFormCaption(const Value: String);
begin
  FFormCaption := Value;
end;

procedure TCtrlPessoa.SetMudaCaption(const Value: Boolean);
begin
  FMudaCaption := Value;
end;

function TCtrlPessoa.SelCidade(rIdCidades: Double): OleVariant;
begin
  Result := GetDataPacket(' SELECT ' +
                          '  C.NOME, ' +
                          '  C.CODMUNICIPIO, ' + // Felipe A. Santos SOL 229871.16137
                          '  E.NOMEESTADO , ' +
                          '  E.CODESTADO , ' + // SOL 215475 KTN 2044512
                          '  P.NOMEPAIS, ' +
                          '  P.MASCARACPOSTAL ' +
                          ' FROM ' +
                          '  CIDADES C, ' +
                          '  ESTADO E, ' +
                          '  PAIS P ' +
                          ' WHERE ' +
                          '  ( C.IDCIDADES = ' + FloatToStr(rIdCidades) + ') AND ' +
                          '  ( C.IDESTADO = E.IDESTADO) AND ' +
                          '  ( E.IDPAIS = P.IDPAIS ) ' +
                          ' ORDER BY C.NOME ');
end;

function TCtrlPessoa.SelNaturalidade: OleVariant;
begin
  Result := GetDataPacket(' SELECT ' +
                          '   ESTADO.CODESTADO, ESTADO.NOMEESTADO, ESTADO.IDPAIS, PAIS.NOMEPAIS, PAIS.NOMENACIONALIDADE ' +
                          ' FROM ' +
                          '   ESTADO, PAIS ' +
                          ' WHERE ' +
                          '   ( ESTADO.IDPAIS = PAIS.IDPAIS ) ' +
                          ' ORDER BY ' +
                          '   ESTADO.NOMEESTADO ');
end;
//Vinicius Maciel SOL138283 Kintana 840489
function TCtrlPessoa.SelTipoDocumento (sIdDocumento: String; sIdTipoDocPessoaxMasc: String): OleVariant;
var sSql : string;
begin
  sSqL :='SELECT TX.IDTIPODOCPESSOAXMASC, TX.IDDOCUMENTO, ' +
                         ' TX.NOME, TX.MASCARA ' +
                         ' FROM TIPODOCPESSOAXMASC TX ';
  if sIdDocumento <> '' then
  begin
    sSQL := sSQL + 'where TX.IDDOCUMENTO = ' + QuotedStr(sIdDocumento);
    if sIdTipoDocPessoaxMasc <> '' then
    sSQL := sSQL + 'and TX.IDTIPODOCPESSOAXMASC = ' + QuotedStr(sIdTipoDocPessoaxMasc);
  end;
  sSQL := sSQL + ' ORDER BY TX.IDTIPODOCPESSOAXMASC';
  Result := GetDataPacket(ssql);
end;
//Vinicius Maciel SOL138283 Kintana 840489 - Fim


function TCtrlPessoa.SelEstado: OleVariant;
begin
  Result := GetDataPacket(' SELECT ' +
                          '   E.IDESTADO, ' +
                          '   E.CODESTADO , ' +
                          '   E.NOMEESTADO , ' +
                          '   P.IDPAIS , ' +
                          '   P.NOMEPAIS, ' +
                          '   P.MASCARACPOSTAL ' +
                          ' FROM ' +
                          '   ESTADO E, ' +
                          '   PAIS P ' +
                          ' WHERE ' +
                          '   ( E.IDPAIS = P.IDPAIS ) ' +
                          '   ORDER BY E.NOMEESTADO ');
end;
//Vinicius Maciel SOL138283 Kintana 840489

// Início - Michelle Mota - SIG 22093
function TCtrlPessoa.SelPais: OleVariant;
begin
  Result := GetDataPacket(' SELECT ' +
                          '   P.IDPAIS, ' +  
                          '   P.NOMEPAIS, ' +
                          '   P.CODINTERNACIONAL ' +
                          ' FROM ' +
                          '   PAIS P ' +
                          ' WHERE P.CODINTERNACIONAL IS NOT NULL ' +
                          '   ORDER BY P.NOMEPAIS ');
end;
// Término - Michelle Mota - SIG 22093
function  TCtrlPessoa.SelMascara (sIdDocumento: String; sIdTipoDocPessoaxMasc: String): String;
begin
   fCdsTipoDocumento.Data := SelTipoDocumento(sIdDocumento, sIdTipoDocPessoaxMasc);

   Result := fCdsTipoDocumento.FieldByName('Mascara').AsString;
end;

function  TCtrlPessoa.CarregaTipoDocumento (sIdDocumento: String): String;
begin
   fCdsTipoDocumento.Data := SelTipoDocumento(sIdDocumento, '');
end;
//Vinicius Maciel SOL138283 Kintana 840489 - FIM
procedure TCtrlPessoa.SetCdsImagensDOC(const Value: TClientDataSet);
begin
  FCdsImagensDOC := Value;
end;
//Início - William Santana - SOL 211502.16259 PPM 442499
procedure TCtrlPessoa.SetCdsImagemOutro(const Value: TClientDataSet);
begin
  FCdsImagemOutro := Value;
end;
//Término - William Santana - SOL 211502.16259 PPM 442499
procedure TCtrlPessoa.SetEJuridica(const Value: Boolean);
begin
  FEJuridica := Value;
end;

procedure TCtrlPessoa.SetExibeDadosBancarios(const Value: Boolean);
begin
  FExibeDadosBancarios := Value;
end;

function TCtrlPessoa.GetIdAgencia(rIdBanco: Double;
  sNumAgencia: String): Double;
begin
  _Cds.Data := GetDataPacket(' SELECT ' +
                             '   A.IDPESSOA ' +
                             ' FROM ' +
                             '   AGENCIABANCARIA A ' +
                             ' WHERE ' +
                             '   ( A.IDBANCO = ' + FloatToStr(rIdBanco) + ' ) AND ' +
                             '   ( RTRIM(A.NUMAGENCIA) = ' + QuotedStr(Trim(sNumAgencia)) + ') ');
                             
  If _Cds.IsEmpty Then
    Result := GetNextID
  Else
    Result := _Cds.Fields[0].AsFloat;

  _Cds.Close;
end;

function TCtrlPessoa.SelBanco: OleVariant;
begin
  Result := GetDataPacket(_DbBanco.SqlListBanco);
end;

procedure TCtrlPessoa.AfterApplyCdsRecord(aCds: TClientDataSet;
  const sTableName: String; CdsState: TUpdateStatus; Accept: Boolean);
begin
  inherited;

  If Accept Then
  Begin
     If sTableName = _DbEndpess.TableName Then
     Begin
        IF (_DbPessoa.IdEndComercial.AsFloat < 0) And
           (_DbPessoa.IdEndComercial.AsFloat = CdsEndpess.FieldByName('Idendereco').AsFloat) then begin
           Accept := ExecSql('UPDATE PESSOA SET IdEndComercial = '+_DbEndpess.Idendereco.AsString+' WHERE IDPESSOA = '+_DbEndpess.IdPESSOA.AsString);
        end;
        IF (_DbPessoa.IdEndResidencial.AsFloat < 0) And
           (_DbPessoa.IdEndResidencial.AsFloat = CdsEndpess.FieldByName('Idendereco').AsFloat) then begin
           Accept := ExecSql('UPDATE PESSOA SET IdEndResidencial = '+_DbEndpess.Idendereco.AsString+' WHERE IDPESSOA = '+_DbEndpess.IdPESSOA.AsString);
        end;
        IF (_DbPessoa.IdEndEntrega.AsFloat < 0) And
           (_DbPessoa.IdEndEntrega.AsFloat = CdsEndpess.FieldByName('Idendereco').AsFloat) then begin
           Accept := ExecSql('UPDATE PESSOA SET IdEndEntrega = '+_DbEndpess.Idendereco.AsString+' WHERE IDPESSOA = '+_DbEndpess.IdPESSOA.AsString);
        end;
        IF (_DbPessoa.IdEndCobranca.AsFloat < 0) And
           (_DbPessoa.IdEndCobranca.AsFloat = CdsEndpess.FieldByName('Idendereco').AsFloat) then begin
           Accept := ExecSql('UPDATE PESSOA SET IdEndCobranca = '+_DbEndpess.Idendereco.AsString+' WHERE IDPESSOA = '+_DbEndpess.IdPESSOA.AsString);
        end;
        IF (_DbPessoa.IdEndCorresp.AsFloat < 0) And
           (_DbPessoa.IdEndCorresp.AsFloat = CdsEndpess.FieldByName('Idendereco').AsFloat) then begin
           Accept := ExecSql('UPDATE PESSOA SET IdEndCorresp = '+_DbEndpess.Idendereco.AsString+' WHERE IDPESSOA = '+_DbEndpess.IdPESSOA.AsString);
        end;

       Case CdsState of
         usInserted:
         Begin
           {**
             Verifica se os registros da tabela telendpess, contatopess e telcontato
             foram inseridos ( possuem a foreignkey do relacionamento com ID < 0 )
             e atribui o novo ID do endereço agora relacionado para as respectivas
             foreign keys
           **}
           CdsTelendpess.First;
           While Not CdsTelendpess.Eof Do
           Begin
              If (CdsTelendpess.FieldByName('IDENDERECO').AsFloat < 0) And
                 (CdsEndpess.FieldByName('IDENDERECO').AsFloat = CdsTelendpess.FieldByName('IDENDERECO').AsFloat) Then
              Begin
                 CdsTelendpess.Edit;
                 CdsTelendpess.FieldByName('IDENDERECO').AsFloat := _DbEndpess.Idendereco.AsFloat;
                 CdsTelendpess.Post;
              End; {If (CdsTelendpess.FieldByName}

              CdsTelendpess.Next;
           End; {While Not CdsTelendpess.Eof Do}
           CdsTelendpess.First;
           //
           CdsContatopess.First;
           While Not CdsContatopess.Eof Do
           Begin
              If (CdsContatopess.FieldByName('IDENDERECO').AsFloat < 0) And
                 (CdsEndpess.FieldByName('IDENDERECO').AsFloat = CdsContatopess.FieldByName('IDENDERECO').AsFloat) Then
              Begin
                 CdsContatopess.Edit;
                 CdsContatopess.FieldByName('IDENDERECO').AsFloat := _DbEndpess.Idendereco.AsFloat;
                 CdsContatopess.Post;
              End; {If (CdsContatopess.FieldByName}

              CdsContatopess.Next;
           End; {While Not CdsContatopess.Eof Do}
           CdsContatopess.First;
         End; {usInserted:}
       End; {Case CdsState of}
     End {If sTableName = _DbEndpess.TableName Then}
     Else
     Begin
       If sTableName = _DbTelendpess.TableName Then
       Begin
         Case CdsState of
           usInserted:
           Begin
             {**
               Verifica se os registros da tabela telendpess, contatopess e telcontato
               foram inseridos ( possuem a foreignkey do relacionamento com ID < 0 )
               e atribui o novo ID do endereço agora relacionado para as respectivas
               foreign keys
             **}
             CdsTelContato.First;
             While Not CdsTelContato.Eof Do
             Begin
                If (CdsTelContato.FieldByName('IDTELEFONE').AsFloat < 0) And
                   (CdsTelEndpess.FieldByName('IDTELEFONE').AsFloat = CdsTelContato.FieldByName('IDTELEFONE').AsFloat) Then
                Begin
                   CdsTelContato.Edit;
                   CdsTelContato.FieldByName('IDTELEFONE').AsFloat := _DbTelendpess.Idtelefone.AsFloat;
                   CdsTelContato.Post;
                End; {If (CdsTelContato.FieldByName}

                CdsTelContato.Next;
             End; {While Not CdsTelContato.Eof Do}
             CdsTelContato.First;
           End; {usInserted:}
         End; {Case CdsState of}
       end {If sTableName = _DbTelendpess.TableName Then}
       Else
       Begin
         If sTableName = _DbContatoPess.TableName Then
         Begin
           Case CdsState of
             usInserted:
             Begin
               {**
                 Verifica se os registros da tabela telendpess, contatopess e telcontato
                 foram inseridos ( possuem a foreignkey do relacionamento com ID < 0 )
                 e atribui o novo ID do endereço agora relacionado para as respectivas
                 foreign keys
               **}
               CdsTelContato.First;
               While Not CdsTelContato.Eof Do
               Begin
                  If (CdsTelContato.FieldByName('IDCONTATO').AsFloat < 0) And
                     (CdsCONTATOPESS.FieldByName('IDCONTATO').AsFloat = CdsTelContato.FieldByName('IDCONTATO').AsFloat) Then
                  Begin
                     CdsTelContato.Edit;
                     CdsTelContato.FieldByName('IDCONTATO').AsFloat := _DbContatoPess.Idcontato.AsFloat;
                     CdsTelContato.Post;
                  End; {If (CdsTelContato.FieldByName...}

                  CdsTelContato.Next;
               End; {While Not CdsTelContato.Eof Do}
               CdsTelContato.First;
             End; {usInserted:}
           End; {Case CdsState of}
         End {If sTableName = _DbContatoPess.TableName Then}
         Else
         Begin
           If aCds = CdsImagensPessoa Then
           Begin
              If (CdsPessoa.FieldByName('IDIMAGEM').AsFloat > 0) And
                 (CdsPessoa.FieldByName('IDIMAGEM').AsFloat = CdsImagensPessoa.FieldByName('IDIMAGEM').AsFloat) Then
              Begin
                 CdsPessoa.Edit;
                 CdsPessoa.FieldByName('IDIMAGEM').AsFloat := _DbImagens.Idimagem.AsFloat;
                 CdsPessoa.Post;
              End; {If (CdsPessoa.FieldByName}
           End {If aCds = CdsImagensPessoa Then}
           Else
           Begin
             If aCds = CdsImagensDOC Then
             Begin
               CdsDocPessoa.First;
               While Not CdsDocPessoa.Eof Do
               Begin
                 If (CdsDocPessoa.FieldByName('IDIMAGEM').AsFloat > 0) And
                    (CdsDocPessoa.FieldByName('IDIMAGEM').AsFloat = CdsImagensDOC.FieldByName('IDIMAGEM').AsFloat) Then
                 Begin
                    CdsDocPessoa.Edit;
                    CdsDocPessoa.FieldByName('IDIMAGEM').AsFloat := _DbImagens.Idimagem.AsFloat;
                    CdsDocPessoa.Post;
                 End;

                 CdsDocPessoa.Next;
               End; {While Not CdsDocPessoa.Eof Do}
             End; {If aCds = CdsImagensDocPessoa Then}
           End; {If aCds = CdsImagensPessoa Then}

           //Início - William Santana - SOL 211502.16259 PPM 442499
           If aCds = CdsImagemOutro Then
           Begin
              If (CdsImagemOutro.FieldByName('IDIMAGEM').AsFloat > 0) Then
              Begin
                 CdsImagemOutro.Edit;
                 CdsImagemOutro.FieldByName('IDIMAGEM').AsFloat := _DbImagens.Idimagem.AsFloat;
                 CdsImagemOutro.Post;
              End; {If (CdsImagemOutro.FieldByName}
           End
           //Término - William Santana - SOL 211502.16259 PPM 442499
         End; {If Then}
       End; {If sTableName = _DbTelendpess.TableName Then}
     end; {If sTableName = _DbEndpess.TableName Then}
  End; {if accept}
end;

procedure TCtrlPessoa.OnCreateAppServer;
begin
  inherited;
  FCdsContaBancaria := TClientDataSet.Create(nil);
  FCdsTelendpess := TClientDataSet.Create(nil);
  FCdsPessoa := TClientDataSet.Create(nil);
  FCdsContatopess := TClientDataSet.Create(nil);
  FCdsPessoafisica := TClientDataSet.Create(nil);
  FCdsEndpess := TClientDataSet.Create(nil);
  FCdsImagensPessoa := TClientDataSet.Create(nil);
  FCdsDocpessoa := TClientDataSet.Create(nil);
  FCdsTelcontato := TClientDataSet.Create(nil);
  FCdsContaBancaria := TClientDataSet.Create(nil);
  FCdsSubTipo := TClientDataSet.Create(nil);
  FCdsImagensDOC := TClientDataSet.Create(nil);
  FCdsEstado := TClientDataSet.Create(nil);
//Vinicius Maciel SOL138283 Kintana 840489
  FCdsTipoDocumento := TClientDataSet.Create(nil);
//Vinicius Maciel SOL138283 Kintana 840489 - Fim
  FCdsNaturalidade := TClientDataSet.Create(nil);
  FCdsBanco := TClientDataSet.Create(nil);
  FCdsDocumento := TClientDataSet.Create(nil);
  FCdsTipoDoc := TClientDataSet.Create(nil);
  //Início - William Santana - SOL 211502.16259 PPM 442499
  FCdsImagemOutro := TClientDataSet.Create(nil);
  //Término - William Santana - SOL 211502.16259 PPM 442499
  FCdsPais := TClientDataSet.Create(nil); // Michelle Mota - SIG 22093
end;

function TCtrlPessoa.GetDadosPessoa(rIdPessoa: Double; TipoGetPessoa: TTipoGetPessoa; TipoPessoa: TTipoPessoa): Boolean;
Var
    ovPessoaData, ovPessoafisicaData,
    ovDocpessoaData, ovEndpessData, ovTelendpessData,
    ovContatopessData, ovTelcontatoData, ovContaBancariaData,
    ovImagensPessoaData, ovImagensDOCData,
//Vinicius Maciel SOL138283 Kintana 840489
    ovCdsTipoDocumento,
//Vinicius Maciel SOL138283 Kintana 840489 - Fim
    ovCdsEstado, ovCdsNaturalidade, ovCdsBanco, ovCdsDocumento, ovCdsTipoDoc{Início - Michelle Mota SIG 22093}, ovCdsPais{Término - Michelle Mota SIG 22093}: OleVariant;
begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Sistema.AppRemoteServer.AppServer.GetDadosPessoa(rIdPessoa, Integer(TipoGetPessoa), Integer(TipoPessoa),
              ovPessoaData, ovPessoafisicaData, ovDocpessoaData, ovEndpessData, ovTelendpessData,
              ovContatopessData, ovTelcontatoData, ovContaBancariaData,  ovImagensPessoaData, ovImagensDOCData,
              ovCdsEstado,
//Vinicius Maciel SOL138283 Kintana 840489
              ovCdsTipoDocumento,
//Vinicius Maciel SOL138283 Kintana 840489 - Fim
              ovCdsNaturalidade, ovCdsBanco, ovCdsDocumento, ovCdsTipoDoc{Início Michelle Mota SIG 22093}, ovCdsPais{Término Michelle Mota SIG 22093});


    If Not Result Then
       MessageInfo := Connection.AppServer.MessageInfo
    Else
    Begin
      If (TipoGetPessoa In  [gpFull, gpDados]) Then
      Begin
        CdsPessoa.Data := ovPessoaData;
        CdsPessoafisica.Data := ovPessoafisicaData;
        CdsDocpessoa.Data := ovDocpessoaData;
        CdsEndpess.Data := ovEndpessData;
        CdsTelendpess.Data := ovTelendpessData;
        CdsContatopess.Data := ovContatopessData;
        CdsTelcontato.Data := ovTelcontatoData;
        CdsContaBancaria.Data := ovContaBancariaData;
        CdsImagensPessoa.Data := ovImagensPessoaData;
        CdsImagensDOC.Data := ovImagensDOCData;
      End;

      If (TipoGetPessoa = gpFull) Then
      Begin
        CdsNaturalidade.Data := ovCdsNaturalidade;
        CdsEstado.Data := ovCdsEstado;
//Vinicius Maciel SOL138283 Kintana 840489
        CdsTipoDocumento.Data := ovCdsTipoDocumento;
//Vinicius Maciel SOL138283 Kintana 840489 - Fim
        CdsBanco.Data := ovCdsBanco;
        CdsPais.Data := ovCdsPais;// Michelle Mota - SIG 22093
      End;

      If (TipoGetPessoa In  [gpFull, gpDocumentos]) Then
      Begin
        CdsTipoDoc.Data := ovCdsTipoDoc;
        CdsDocumento.Data := ovCdsDocumento;
      End;
    End;
  End
  Else
  Begin
    Result := True;

    Try
      If (TipoGetPessoa In  [gpFull, gpDados]) Then
      Begin
        fCdsPessoa.Data := SelPessoa(rIdPessoa);
        fCdsEndpess.Data := SelEndPess(rIdPessoa);
        fCdsTelendpess.Data := SelTelEndPess(rIdPessoa);
        fCdsContatopess.Data := SelContatoPess(rIdPessoa);
        fCdsPessoafisica.Data := SelPessoaFisica(rIdPessoa);
        fCdsTelcontato.Data := SelTelContato(rIdPessoa);
        fCdsImagensPessoa.Data := SelImagemPessoa(rIdPessoa);
        fCdsImagensDOC.Data := SelImagensDocPessoa(rIdPessoa);
        fCdsContaBancaria.Data := SelContaBancaria(rIdPessoa);
      End;

      If (TipoGetPessoa = gpFull) Then
      Begin
        fCdsNaturalidade.Data := SelNaturalidade;
//Vinicius Maciel SOL138283 Kintana 840489
        if Assigned(fCdsTipoDocumento) then
          fCdsTipoDocumento.Data := SelTipoDocumento ('','');
//Vinicius Maciel SOL138283 Kintana 840489 - Fim
        fCdsEstado.Data := SelEstado;
        fCdsBanco.Data := SelBanco;
        FCdsPais.Data := SelPais; // Michelle Mota - SIG 22093
      End;

      If (TipoGetPessoa In  [gpFull, gpDocumentos]) Then
      Begin
        fCdsTipoDoc.Data := SelTipoDocPessoa(TipoPessoa);
        fCdsDocumento.Data := SelDocPessoa(rIdPessoa, TipoPessoa);
      End;

    Except
      On E:Exception Do
      Begin
         Result := False;
         MessageInfo := E.Message;
      End;
    End;
  End;
end;

procedure TCtrlPessoa.SetCdsBanco(const Value: TClientDataSet);
begin
  FCdsBanco := Value;
end;

procedure TCtrlPessoa.SetCdsDocumento(const Value: TClientDataSet);
begin
  FCdsDocumento := Value;
end;

procedure TCtrlPessoa.SetCdsEstado(const Value: TClientDataSet);
begin
  FCdsEstado := Value;
end;

// Início - Michelle Mota - SIG 22093
procedure TCtrlPessoa.SetCdsPais(const Value: TClientDataSet);
begin
  FCdsPais := Value;
end;
// Término - Michelle Mota - SIG 22093

//Vinicius Maciel SOL138283 Kintana 840489
procedure TCtrlPessoa.SetCdsTipoDocumento(const Value: TClientDataSet);
begin
  FCdsTipoDocumento := Value;
end;
//Vinicius Maciel SOL138283 Kintana 840489 - Fim

procedure TCtrlPessoa.SetCdsNaturalidade(const Value: TClientDataSet);
begin
  FCdsNaturalidade := Value;
end;

procedure TCtrlPessoa.SetCdsTipoDoc(const Value: TClientDataSet);
begin
  FCdsTipoDoc := Value;
end;

procedure TCtrlPessoa.CdsDadosToOleVariant(var ovPessoa, ovPessoaFisica,
  ovDocPessoa, ovEndPess, ovTelEndPess, ovContatoPess,
  ovTelContato, ovContaBancaria, ovImagensPessoa, ovImagensDoc, ovEstado,
//Vinicius Maciel SOL138283 Kintana 840489
  ovTipoDocumento, 
//Vinicius Maciel SOL138283 Kintana 840489 - Fim
  ovNaturalidade, ovBanco, ovDocumento, ovTipoDoc{Início Michelle Mota SIG 22093}, ovPais{Término Michelle Mota SIG 22093}: OleVariant);
begin
   ovPessoa := CdsPessoa.Data;
   ovPessoaFisica := CdsPessoafisica.Data;
   ovDocPessoa := CdsDocpessoa.Data;
   ovEndPess := CdsEndPess.Data;
   ovTelEndPess := CdsTelendpess.Data;
   ovContatoPess := CdsContatopess.Data;
   ovTelContato := CdsTelcontato.Data;
   ovContaBancaria := CdsContaBancaria.Data;
   ovImagensPessoa := CdsImagensPessoa.Data;
   ovImagensDoc := CdsImagensDOC.Data;
   ovEstado := CdsEstado.Data;
//Vinicius Maciel SOL138283 Kintana 840489
   ovTipoDocumento := CdsTipoDocumento.Data;
//Vinicius Maciel SOL138283 Kintana 840489 - Fim
   ovNaturalidade := CdsNaturalidade.Data;
   ovBanco := CdsBanco.Data;
   ovDocumento := CdsDocumento.Data;
   ovTipoDoc := CdsTipoDoc.Data;
   ovPais := CdsPais.Data; // Michelle Mota - SIG 22093
end;

procedure TCtrlPessoa.SetObrigaDocumento(const Value: Boolean);
begin
  FObrigaDocumento := Value;
end;

function TCtrlPessoa.SetaNumCGCCPF(iddocumento: integer; numDocumento: string): boolean;
var  cdsAux: TClientDataSet;
begin
  result := false;
  cdsAux := TClientDataSet.create(nil);
  try
    cdsAux.data := getdataPacket(' SELECT CODDOCUMENTO, IDDOCUMENTO, SIGLADOCUMENTO '+
                                 ' FROM TIPODOCOFICIAL WHERE IDDOCUMENTO = '+ intToStr(iddocumento));
    if (trim(cdsAux.fieldByName('SIGLADOCUMENTO').asString) = 'CNPJ:') or
       (trim(cdsAux.fieldByName('SIGLADOCUMENTO').asString) = 'CGC:') or
       (trim(cdsAux.fieldByName('SIGLADOCUMENTO').asString) = 'CPF:') then
    begin
      FCdsPessoa.fieldByName('NUMDOCUMENTO').asString := numDocumento;
      result := true;
    end;
  finally
    cdsAux.Free;
  end;
end;

function TCtrlPessoa.PossuiVinculo(sIDPessoa: Integer): Boolean;
var  cdsAux: TClientDataSet;
begin
  result := false;
  cdsAux := TClientDataSet.create(nil);
  try
    cdsAux.data := getdataPacket('SELECT F.*, S.IDSITFUNC, S.DESCRICAO '  +
                                 '  FROM FUNCIONARIO F, SITFUNC S '       +
                                 ' WHERE S.IDSITFUNC = F.IDSITFUNC '      +
                                 '   AND S.TIPOSIT IN (''A'', ''F'') '    +
                                 '   AND F.IDPESSOA = ' + InttoStr(sIDPessoa));

    cdsAux.Open;
    if cdsAux.RecordCount > 0 then
      result := true;
  finally
    cdsAux.Free;
  end;
end;

function TCtrlPessoa.TravaAlteracao(idPessoa: Integer): boolean;
begin
  Result:= False;
  if Sistema.IdModulo <> 21 then
    if PossuiVinculo(idPessoa) then
      Result:= True;
end;

// Felipe A. Santos SOL 229871.16137 - início
function TCtrlPessoa.ListTipoLogradouro: OleVariant;
var
   sSQL : String;
begin
   // Luiz Carlos - SIG62614 - Inicio
   sSQL := 'SELECT * FROM TIPO_LOGRADOURO ORDER BY NOME ';

//           ' WHERE NOME IN (''AEROPORTO'',''ALAMEDA'',''AREA'',''AVENIDA'',''CAMPO'',''CHACARA'',''COLONIA'',''CONDOMINIO'', ' +
//           '                ''CONJUNTO'',''DISTRITO'', ''ESPLANADA'', ''ESTACAO'',''ESTRADA'',''FAVELA'', ''FAZENDA'',''FEIRA'', ' +
//           '                ''JARDIM'',''LADEIRA'',''LAGO'',''LAGOA'',''LARGO'',''LOTEAMENTO'',''MORRO'',''NUCLEO'',''PARQUE'', ' +
//           '                ''PASSARELA'',''PATIO'',''PRACA'',''QUADRA'', ''RECANTO'', ''RESIDENCIAL'',''RODOVIA'', ''RUA'', ' +
//           '                ''SETOR'',''SITIO'',''TRAVESSA'',''TREVO'',''VALE'',''VEREDA'',''VIA'',''VIADUTO'',''VIELA'',''VILA'',''OUTROS'') ' +
//           ' ORDER BY NOME';
  // Luiz Carlos - SIG62614 - Fim

   Result := GetDataPacket(sSQL);
end;
// Felipe A. Santos SOL 229871.16137 - fim

end.

