unit FLancCAP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Mask, wwdbedit,
  Wwdotdot, Wwdbcomb, wwdbdatetimepicker, CMDateTimePicker, TB97Ctls,
  wwdblook, Db, DBTables, Wwquery, Wwdatsrc, usistema, uAdmAss, uDocumento,
  UIntegraBack, ULancContab, ComCtrls, MontaSelect;

type
  TFrmLancCap = class(TfrmOkCancelar)
    qryMeses: TwwQuery;
    qryValores: TwwQuery;
    dsValores: TwwDataSource;
    UPDValores: TUpdateSQL;
    qryGlobal: TwwQuery;
    qryAux: TwwQuery;
    qryValoresIDPESSOA: TFloatField;
    qryValoresPATRO: TStringField;
    qryValoresMES: TStringField;
    qryValoresATIVPROJETO: TStringField;
    qryValoresCENTRESPON: TStringField;
    qryValoresDESEMB: TStringField;
    qryValoresTOTAL_BRUTO: TFloatField;
    qryValoresCDCRESPONASS: TFloatField;
    qryValoresCCUSTOASS: TFloatField;
    qryValoresATIVPROJETOASS: TFloatField;
    qryValoresTIPODESEMBASS: TFloatField;
    qryValoresCCCREDITOASS: TFloatField;
    qryValoresCCDEBITOASS: TFloatField;
    qryValoresCODPROGRAMAASS: TFloatField;
    qryValoresFLGLANCCCAP: TFloatField;
    qryValoresIDFORCLIASS: TFloatField;
    PgcLancamento: TPageControl;
    TabLancamento: TTabSheet;
    TabExclui: TTabSheet;
    Panel1: TPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    cmdtpkDataVencimento: TCMDateTimePicker;
    dblkMesRef: TwwDBLookupCombo;
    bbtnProcurar: TBitBtn;
    drgrValores: TwwDBGrid;
    Panel2: TPanel;
    msLanctos: TMontaSelect;
    btnProcurar: TBitBtn;
    Panel3: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    dbedUsu: TwwDBEdit;
    dbedCodDoc: TwwDBEdit;
    dbedNumLancto: TwwDBEdit;
    dbedCodPln: TwwDBEdit;
    dbedHist: TwwDBEdit;
    dbedData: TwwDBEdit;
    dbedValor: TwwDBEdit;
    dbedDataVencto: TwwDBEdit;
    Label10: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure sBtnProbocurarClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure drgrValoresCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure qryValoresFLGLANCCCAPChange(Sender: TField);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
  private
    { Private declarations }
    sDataVencimento,        (* variável que guarda a Data de Vencimento da Cobrança *)
    sNumRecebimento,        (* variável que guarda o número de recebimento do documento *)
    sCodPortForma: String;  (* variável que guarda o código da Forma de Pagamento *)
    iPlnCodigo : LongInt;       (* variável que guarda o Código da Planilha *)

    liEmpresa,          (* variável que guarda a Empresa Proprietária *)
    liExercicio,        (* variável que guarda o Exercício Contábil *)
    liPeriodo: Longint; (* variável que guarda o Período Contábil *)

    bErro : Boolean; (* variável que sinaliza que houve erro no processamento *)
    dTotalVlCobranca: Double;  (* Guarda o Total de Valor da Cobrança em Banco *)

    vCODTIPRECDES,
    vCODCENTRORESPON,
    vFLGINTERNO,
    vNUMRECEBIMENTO,
    vCODUNIDNEGOC,
    vCONTACFORNECEDOR,
    VCODPROGRAMA,
    vCODCCUSTOFORNECEDOR,
    vPATROCINADORA,
    vFORNECEDOR,
    vNOMEPLANOPREV,
    vCODCENTROCUSTOD,
    vPLACONTADAUTPATR,
    VCODCONTA,
    vCODSUBCONTA  : String;

    vIDPROGRAMA,
    vIDPESSJUR,
    vIDFORNECEDOR,
    vSUBCONTAFORNECEDOR,
    vIDPLANOPREV, iNumLancto, iCodDocumento, iPnlCodigoExcl   : Integer;

    sMesCobranca, sNoDocumento, sPnlEfetivado, sDataLancto : String;

    function  LancaContasAPagarTotal : Boolean;
    function  BuscaRamoForCli(sSituacao: string; cRecPag: char): longint;
    Procedure BuscaParametrosFornecedor;
    procedure BuscaParamGobal;
    function  BuscaProgramaPatro(pCODPROGRAMA :integer) : Integer;
    Procedure FazLancamentoContabil;
    function  InformacoesOk: boolean;
    function  ValidaAnoMes(sSt:String;bNum:Byte): Boolean;
    function  BuscaPlacontaTpDesemb(pcodTpdesemb: string; VAR CONTA, SUBCONTA: STRING): string;
    function  BuscaPlanoNomePrev(pIdPlanoPrev: integer): string;
    function  BuscaNomeFornecedor(pIdpessoa: integer): string;
    procedure AtualizaFooter;
    procedure LimpaLancamentos;
    procedure BuscaLancamentos;
    function  ExcluiLancamento(pPlnCodigo : Integer): Boolean;
    procedure LimpaTelaExclusao;
  public
    { Public declarations }
  end;

var
  FrmLancCap: TFrmLancCap;

implementation

uses DBaseDados;

{$R *.DFM}

procedure TFrmLancCap.FormCreate(Sender: TObject);
begin
  inherited;
  iNumLancto     := 0;
  iCodDocumento  := 0;
  iPnlCodigoExcl := 0;
  sNoDocumento   := '';
  sPnlEfetivado  := '';
  sDataLancto    := '';
  qryMeses.Open;
  cmdtpkDataVencimento.Date := date;
  qryValores.Open;
  drgrValores.ColumnByName('TOTAL_BRUTO').FooterValue := '0,00';
end;

procedure TFrmLancCap.sBtnProbocurarClick(Sender: TObject);
begin
  inherited;
  if dblkMesRef.text = '' then
  begin
    showMessage('Informe o Mês de Referência');
    if dblkMesRef.canfocus then
      dblkMesRef.setFocus;
    exit;
  end;
  qryValores.Close;
  qryValores.ParamByName('MESREF').asString := dblkMesRef.text;
  qryValores.ParamByName('IDFUNDACAO').asInteger := sistema.IdEmpresa;
  qryValores.Open;

  vIDFORNECEDOR := qryValores.fieldByname('IDFORCLIASS').asInteger;
  qryValores.Edit;
end;


(* CONTAS A PAGAR COM VALOR TOTAL *)
function TFrmLancCap.LancaContasAPagarTotal : Boolean;
var cRecPag : Char;
    sCodTipDoc,
    sPlaConta, sCodCentroCusto : String;
    iPlano,iIdRamoForCli, iCodSubConta : Integer;
    liICodDocumento, liNumLancto: Longint;
    btemLacamento : Boolean;
begin
  btemLacamento := false;
  Result := False;
  (* PASSIVO *)
  (* Contas a Pagar -> fornecedor *)
  cRecPag := 'P';
  (* Código do Tipo de documento *)
  sCodTipDoc       := IntToStr(prmTpDocPEnvioBanco);
  (* verifica se o Código do tipo de documento está preenchido *)
  if Trim(sCodTipDoc) = '' then sCodTipDoc := '-1';

  (* Função que busca o identificador do Ramo do tipo do cliente *)
  iIdRamoForCli := BuscaRamoForCli(vFLGINTERNO, cRecPag);
  (* Método da unit UDocumento que transforma o pessoa passado como parâmetro
     num fornecedor para a empresa logada *)

  dTotalVlCobranca := 0;
  if qryValores.Active then
  begin
    qryValores.First;
    while not qryValores.Eof do
    begin
//      Acumula o valor Total
    if qryValores.fieldByName('FLGLANCCCAP').asInteger = 1 then
    begin
      btemLacamento := true;
      dTotalVlCobranca := dTotalVlCobranca + qryValores.FieldByName('TOTAL_BRUTO').asFloat;
      drgrValores.ColumnByName('TOTAL_BRUTO').FooterValue := formatFloat('#,##0.00', dTotalVlCobranca);
    end;
      qryValores.Next;
    end;
  end
  else
  begin
    showMessage('Nada a Lançar');
    exit;
  end;

  if btemLacamento then
  begin
    sDataVencimento := cmdtpkDataVencimento.text;
    if sDataVencimento = '' then
    begin
      showMessage('Data de Vencimento Inválida!');
      if cmdtpkDataVencimento.canfocus then
        cmdtpkDataVencimento.SetFocus;
      exit;
    end;

    try
  (* =========================================================
     |               Documento.ForCli.Inserir                 |
     ========================================================= *)
    (* Método da unit UDocumento que transforma o pessoa passado como parâmetro
       num cliente para a empresa logada *)
      Documento.ForCli.Inserir(
           vIDFORNECEDOR,     (* Identificador do Titular na tabela pessoa *)
           Sistema.IdEmpresa, (* Identificador da Empresa Logada No Sistema *)
           -1,                (* Subconta do fornecedor *)
           IntegraBack.Plano, (* Plano de contas vigente*)
           iIdRamoForCli,     (* Ramo do fornecedor *)
           Sistema.IdEmpresa, (* Identificador da Empresa Logada No Sistema *)
           vCODCCUSTOFORNECEDOR,  (* Centro de custo associado a Conta contábil do fornecedor *)
           '',                (* Conta contábil de adiantamento do fornecedor *)
           vCONTACFORNECEDOR, (* Conta contábil do fornecedor *)
           '',                (* Conta contábil de despesa do fornecedor *)
           'F',               (* deve ser passado como 'F' para criar um fornecedor *)
           false);            (* Habilita as mensagens de erro na execução do método *)
    except
      bErro  := True;
      Result := True;
      Exit;
    end;(* try..except *)

  (* =========================================================
     |                 Documento.GetCodigo                    |
     ========================================================= *)
    (* Método da unit UDocumento que retorna o número no qual o documento
      a ser lançado no CAP/CAR deve ser inserido *)
    Documento.Coddocumento := Documento.GetCodigo(nil);

    vNUMRECEBIMENTO := intToStr(Documento.Coddocumento);
    (* variável que guarda o número de recebimento do documento *)
    sNumRecebimento := vNUMRECEBIMENTO;

  (* =========================================================
     |                Documento.ValidaNumDoc                  |
     ========================================================= *)
    (* Método da unit UDocumento que verifica se determinado número de documento
      já existe no CAP/CAR. Se a função retornar que existe documento com este
      número, o lançamento NÃO poderá ser efetuado. *)
    if Documento.ValidaNumDoc(
           qryAux,          (* Qry Auxiliar *)
           cRecPag,         (* Indica se o documento e um documento a(P)agar ou a (R)eceber *)
           vIDFORNECEDOR,    (* Identificador da tabela PESSOA. Indica o Fornecedor ( Subtipo na tabela EMPRESAFORN ) no caso do Contas a Pagar *)
           StrFloat(vNUMRECEBIMENTO,0), (* Nº do Documento *)
           '',              (* Complemento do Documento *)
           liICodDocumento, (* parâmetro passado por referência: Retorna o código do documento caso o Número/Complemento passados na função já tenham sido lançados para o Fornecedor Indicado *)
           iCodSubConta,    (* parâmetro passado por referência: Retorna a Sub conta associada a Conta Contábil de baixa do documento caso o Número/Complemento passados na função já tenham sido lançados para o Fornecedor Indicado *)
           iPlano,          (* parâmetro passado por referência: Retorna o Plano contábil da conta de baixa do documento caso o Número/Complemento passados na função já tenham sido lançados para o Fornecedor Indicado *)
           sPlaconta,       (* parâmetro passado por referência: Retorna a Conta Contábil de baixa do documento caso o Número/Complemento passados na função já tenham sido lançados para o Fornecedor Indicado *)
           sCodCentroCusto) (* parâmetro passado por referência: Retorna o Centro de Custo da Conta Contábil de baixa do documento caso o Número/Complemento passados na função já tenham sido lançados para o Fornecedor Indicado *)
    then
    begin
      ShowMessage('Documento já existente no Contas a Pagar : documento nº ' + sNumRecebimento);
      bErro  := True;
      Result := True;
      Exit;
    end;


    try
  (* =========================================================
     |                  Documento.Inserir                     |
     ========================================================= *)
    (* Método da unit UDocumento que insere o Documento na tabela Documento *)
      Documento.Inserir(
          qryAux,                      (* Qry Auxiliar *)
          Documento.Coddocumento,      (* Identificador da tabela DOCUMENTO. Inicializado com o Método Documento.GetCodigo *)
          IntToStr(Sistema.IdModulo),  (* Identificador da tabela MODULO. Representa o Módulo - Assistencial - que originou o lançamento do documento *)
          IntToStr(IntegraBack.Plano), (* Plano contábil da conta de baixa do documento *)
          vCONTACFORNECEDOR,           (* Conta Contábil de baixa do documento *)
          vCODCCUSTOFORNECEDOR,        (* Centro de Custo da Conta Contábil de baixa do documento *)
          -1,                          (* Código da Moeda ultilizada para o lançamento. Passar -1 em caso de moeda corrente *)
          -1,                          (* Unidade de Negócio *)
          Sistema.IdEmpresa,           (* Identificador da tabela EMPRESPROP. Indica a empresa prprietária daquele documento lançado *)
          vIDFORNECEDOR,               (* Identificador da tabela PESSOA. Indica o Fornecedor ( Subtipo na tabela EMPRESAFORN ) no caso do Contas a Pagar *)
          StrToIntDef(sCodTipDoc,0),   (* Identificador da tabela TIPODOCRECPAG. Corresponde ao tipo do documento que está sendo lançado *)
          StrToIntDef(sCodPortForma,0),(* Identificador da tabela PORTADORFORMA. Código do portador forma ultilizado na baixa do documento. Obrigatório no caso da operação do documento ser '10' - Lança e baixa simultânea *)
          cRecPag,                     (* Indica se o documento e um documento a(P)agar ou a (R)eceber *)
          StrFloat(vNUMRECEBIMENTO,0),   (* Número do documento a ser lançado. Deve ser validado juntamento com o complemento do documento pelo método Documento.ValidaNumDoc *)
          '',                          (* Complemento do documento que está sendo lançado. Deve ser validado juntamento com o Número do documento pelo método Documento.ValidaNumDoc *)
          DateToStr(date),             (* Data de emissão do documento *)
          sDataVencimento,             (* Data de vencimento do documento *)
          sDataVencimento,             (* Data programada para baixa do documento *)
          '0',                         (* Status do documento: 0 - Documento Em Aberto, 1 - Adiantamento, Previsão em Aberto, 2 - Documento Baixado *)
          0,                           (* Número ultilizado para associar o documento com suas respectivas parcelas ou agrupamento. Deve ser inicializado pelo método Documento.GetNumFatura *){iNumFatura}
          '2',                         (* Operação de lançamento do documento - 2 - Lançamento efetivo que não será parcelado *)
          Sistema.IdUsuario,           (* Úsuario que incluiu o documento *)
          vSUBCONTAFORNECEDOR,         (* Sub conta associada a Conta Contábil de baixa do documento *)
          -1,                          (* Código da forma de pagamento a ser ultilziada na baixa do documento - Opcional *)
          '',                          (* Código de barras do documento a lançado. Opcional. É utilizado para documentos do tipo Ficha de Compensação do Contas a Pagar *)
          '',                          (* Linha Digitável que representa o Código de barras do documento a lançado. Opcional. É utilizado para documentos do tipo Ficha de Compensação do Contas a Pagar *)
          True,                        (* Indica se o documento está associado a um contas caixas X forma de cobrança no Contas a Receber ou se o mesmo já foi emitido *)
          0,                           (* Valor do juros a ser cobrado em caso de atraso sobre o valor do documento *)
          0,                           (* Valor da multa a ser cobrada em caso de atraso sobre o valor do documento *)
          0);                          (* Índice ultilizado para correção do valor do documento em caso de atraso *)
    except
      showMessage('Erro na inclusão do Documento no Contas a Pagar : documento nº '+ sNumRecebimento);
      bErro  := True;
      Result := True;
      Exit;
    end;(* try..except *)

    try
  (* =========================================================
     |                Documento.GetNumLancto                  |
     ========================================================= *)
      (* Método da unit UDocumento que Gera o número do lançamento a ser feito
         na tabela LANCTODOCUM do CAP/CAR *)
      liNumLancto := Documento.GerarNumLancto(nil, Documento.Coddocumento);(* Identificador da tabela DOCUMENTO. Inicializado com o Método Documento.GetCodigo *)
    except
      showMessage('Erro na Geração do Lançamento no Contas a Pagar : documento nº ' + sNumRecebimento);
      bErro  := True;
      Result := True;
      Exit;
    end;(* try..except *)

    if liNumLancto <= 0 then
    begin
      showMessage('Erro na Geração do Lançamento no Contas a Pagar : documento nº ' + sNumRecebimento);
      bErro  := True;
      Result := True;
      Exit;
    end;(* if liNumLancto *)

    try
  (* =========================================================
     |                Documento.CriaLanctoDoc                 |
     ========================================================= *)
      (* Método da unit UDocumento que Insere um lançamento de documento na
         tabela LANCTODOCUM com a mesma operação lançada no documento *)
      Documento.CriarLanctoDoc(
          qryAux,            (* Qry Auxiliar *)
          Documento.Coddocumento,(* Códio do documento lançado através do método Documento.Inserir *)
          liNumLancto,       (* Número do Lançamento. Deve ser Inicializado através do método Documento.GetNumLancto *)
          -1,                (* Código do alterador. Deve ser Informado no caso do laçamento ser referente a um alterador - Operação '4'. Identificador da tabela TIPOALTERADOR *)
          iPlnCodigo,        (* parâmetro passado por referência: Códido da planilha que contém a contabilização deste lançamento. Deve ser informado no caso de integração com a contabilidade. Para lançamento de alteradores ( Operação '4' ) e baixas ( Operação '5' ) o valor resultante neste parâmetro corresponde a planilha contábil já que a contabilização destes tipos de lançamento pode ser feita pela própria função *)
          DateToStr(Date),   (* Data do lançamento *)
          dTotalVlCobranca,  (* Valor - Total da cobranca *)
          0,                 (* ValorOutraMoeda *)
          -1,                (* Indica se o lançamento é referente e um estorno. É um auto relacionamento contendo o NumLancto do lançamento referente ao estornp *)
          'C',               (* Indica se o lançamento é uma a (C)rédito ou a (D)ébito, de acordo como o tipo do documento *)
          '2',               (* Operação de lançamento do documento - 2 - Lançamento efetivo que não será parcelado *)
          'Despesa Assistencial',(* Histórico do lançamento *)
          Sistema.IdUsuario, (* Usuário responsável pelo lançamento *)
          False,             (* Indica de a própria função efetuará a contabilização do lançamento. Ultilizado em caso de alteradores - Operação '4' ou baixas - Operação '5' *)
          -1,                (* Código do portadorforma ultilizado na baixa do documento - Operação '5' *)
          '');               (* Número do cheque/borderô ultilizado na baixa do documento - Operação '5' *)
    except
      showMessage('Erro na Geração do Lançamento do Documento no Contas a Pagar : documento nº '+ sNumRecebimento);
      bErro  := True;
      Result := True;
      Exit;
    end;(* try..except *)
    try
  (* =========================================================
     |                Documento.Rateio.Inserir                |
     ========================================================= *)
     qryValores.First;
     while not qryValores.eof do
     begin
      if qryValores.fieldByName('FLGLANCCCAP').asInteger = 1 then
      begin
         vCODTIPRECDES    := qryValores.FieldByName('TIPODESEMBASS').asString;
         vCODCENTRORESPON := qryValores.FieldByName('CDCRESPONASS').asString;
         vCODUNIDNEGOC    := qryValores.FieldByName('ATIVPROJETOASS').asString;
         vIDPESSJUR       := qryValores.FieldByName('IDPESSOA').asInteger;
         dTotalVlCobranca := qryValores.FieldByName('TOTAL_BRUTO').asInteger;
         vCODPROGRAMA     := qryValores.FieldByName('CODPROGRAMAASS').asString;
         vIdPrograma      := BuscaProgramaPatro(strToIntDef(vCODPROGRAMA, -1));

         Documento.Rateio.Inserir(
              Documento.Coddocumento, (* Identificador da tabela DOCUMENTO. Inicializado com o Método Documento.GetCodigo *)
              vCODTIPRECDES,          (*  *)
              cRecPag,                (* Indica se o documento e um documento a(P)agar ou a (R)eceber *)
              vCODCENTRORESPON,       (*  *)
              Sistema.IdEmpresa,      (* Identificador da tabela EMPRESPROP. Indica a empresa prprietária daquele documento lançado *)
              dTotalVlCobranca,       (* Com o Valor Total da Patro nesse caso *)
              0,                      (*  *)
              Sistema.IdUsuario,      (* Úsuario que incluiu o documento *)
              StrToIntDef(vCODUNIDNEGOC,0),(*  *)
              0,                      (*  *)
              prmCodCentroCusto,      (* Código de Custo Financeiro *)
              vIDPESSJUR,             (* Id Patro *)
              vIdPrograma,            {prmCodPrograma,}    (* Código do Programa *)
              vIDPLANOPREV);          (*  *)
       end; //if
       qryValores.Next;
     end;
    except
      showMessage('Erro no Rateio do Documento no Contas a Pagar para o Fornecedor.');
      bErro  := True;
      Result := True;
      Exit;
    end;(* try..except *)

  end
  else
  begin
    ShowMessage('Marque os valores a serem lançados.');
    bErro  := True;
    Result := True;
    exit;
  end;


end; (* CONTAS A PAGAR COM VALOR TOTAL *)


function TFrmLancCap.BuscaRamoForCli(sSituacao: string; cRecPag: char): longint;
begin
  Result := -1;
  if cRecPag = 'R' then
  begin
  (* Cobrança - Contas a Receber - Buscar cliente *)
    if sSituacao = 'AT' then Result := prmIdRamoTipoCliAtivo       else
    if sSituacao = 'PT' then Result := prmIdRamoTipoCliPatro       else
    if sSituacao = 'MA' then Result := prmIdRamoTipoCliMantido     else
    if sSituacao = 'MP' then Result := prmIdRamoTipoCliMantidoParc else
    if sSituacao = 'CA' then Result := prmIdRamoTipoCliAssistido   else
    if sSituacao = 'AS' then Result := prmIdRamoTipoCliAssistido;
  end
  else
  begin
  (* Devolução - Contas a Pagar - Buscar fornecedor *)
    if sSituacao = 'AT' then Result := prmIdRamoTipoForAtivo       else
    if sSituacao = 'PT' then Result := prmIdRamoTipoForPatro       else
    if sSituacao = 'MA' then Result := prmIdRamoTipoForMantido     else
    if sSituacao = 'MP' then Result := prmIdRamoTipoForMantidoParc else
    if sSituacao = 'CA' then Result := prmIdRamoTipoCliAssistido   else
    if sSituacao = 'AS' then Result := prmIdRamoTipoForAssistido;
  end;(* if cRecPag *)
end;


procedure TFrmLancCap.BitBtn3Click(Sender: TObject);
begin
  inherited;
  BuscaParamGobal;
  BuscaParametrosFornecedor;
  bbtnCancelar.Enabled := false;
  If not dtmBaseDados.dbBaseDados.Intransaction then
   dtmBaseDados.dbBaseDados.StartTransaction;
  if pgcLancamento.ActivePage = TabLancamento then
  begin
    if not InformacoesOk then
    begin
      showMessage('Não foi possível fazer o Lançamento Financeiro/Contábil');
      exit;
    end;
    try
      try
        FazLancamentoContabil;
        if LancaContasAPagarTotal then
          exit;
      finally
        dtmBaseDados.dbBaseDados.Commit
      end
    except
      dtmBaseDados.dbBaseDados.Rollback;
      showMessage('Lançamento não efetuado!');
      exit;
    end;
    showMessage('Lançamento efetuado com sucesso!')
  end
  else
  begin
    try
      if (sNoDocumento = '') then
      begin
        ShowMessage('Selecione um Documento a Excluir.');
        exit;
      end;
      if Application.MessageBox('Exclui o Lançamento?','',Mb_YesNo + Mb_IConQuestion) = Id_Yes then
      begin
        if not ExcluiLancamento(iPnlCodigoExcl) then
          showMessage('Não foi Possível Excluir/Estrornar o Lançamento.')
        else
        begin
          dtmBaseDados.dbBaseDados.Commit;
          LimpaTelaExclusao;
          showMessage('Exclusão/Estrorno efetuado com sucesso!');
        end;
      end
      else
        exit;
    except
      dtmBaseDados.dbBaseDados.Rollback;
      showMessage('Exclusão/Estrorno não efetuado!');
      exit;
    end;
  end;
  bbtnCancelar.Enabled := true;
end;

Procedure TFrmLancCap.BuscaParametrosFornecedor;
Var qryTmp: TQuery;
begin
  vCONTACFORNECEDOR:='';
  vCODCCUSTOFORNECEDOR:='';
  vSUBCONTAFORNECEDOR:=-1;
  qryTmp:=Tquery.Create(nil);
  try
    qryTmp.DatabaseName:='BaseDados';
    qryTmp.Sql.Clear;
    qryTmp.Sql.Add('SELECT EF.CONTACFORN, EF.CODSUBCONTA, EF.CODCENTROCUSTO '+
               ' FROM  FORNSERV F, EMPRESAFORN EF '+
               ' WHERE F.IDPESSOA = '+IntToStr(vIDFORNECEDOR)+' AND '+
               ' F.IDPESSOA = EF.IDFORCLI ');
    qryTmp.Open;
    vCONTACFORNECEDOR    := qryTmp.FieldByName('CONTACFORN').AsString;
    vSUBCONTAFORNECEDOR  := StrToIntDef(qryTmp.FieldByName('CODSUBCONTA').AsString,-1);
    vCODCCUSTOFORNECEDOR := qryTmp.FieldByName('CODCENTROCUSTO').AsString;
    qryTmp.Close;

    If Trim(vCONTACFORNECEDOR)='' then bErro:=True;
  finally
    qryTmp.Free;
  end;
end; {BuscaParametrosFornecedor}


procedure TFrmLancCap.BuscaParamGobal;
begin
  qryGlobal.close;
  qryGlobal.Open;
  vIDPLANOPREV := qryGlobal.fieldbyname('IDPLANOPREV').asInteger;
end;

function TFrmLancCap.BuscaProgramaPatro(pCODPROGRAMA :integer) : Integer;
Var qryTmp: TQuery;
begin
  result := -1;
  qryTmp := Tquery.Create(nil);
  try
    qryTmp.DatabaseName:='BaseDados';
    qryTmp.Sql.Clear;
    qryTmp.Sql.Add(' SELECT * FROM PROGRAMA WHERE CODPROGRAMA = '+ intToStr(pCodPrograma));
    qryTmp.Open;
    result := qryTmp.FieldByName('IDPROGRAMA').asInteger;
    qryTmp.Close;
  finally
    qryTmp.free;
  end;
end;



Procedure TFrmLancCap.FazLancamentoContabil;
Var sMsgErro : String;
begin

  (* =========================================================
   |                      LancaContab                       |
   ========================================================= *)
   (* Método da unit ULancaContab é a função principal da contabilidade,
      encarregada de gerar os lançamentos contábeis *)
  If (iPlnCodigo>-1)And(IntegraBack.Contabilidade = 'S') then
  begin

    qryvalores.first;
    while not qryValores.eof do
    begin
      if qryValores.fieldByName('FLGLANCCCAP').asInteger = 1 then
      begin
        BuscaPlacontaTpDesemb(qryValores.fieldByName('TIPODESEMBASS').asString, vPLACONTADAUTPATR, vCODSUBCONTA);
        (* Guarda o Total Valor da Cobrança para testar depois *)
        dTotalVlCobranca := qryValores.fieldByName('TOTAL_BRUTO').AsFloat;
        sMesCobranca     := qryValores.fieldByName('MES').AsString;
        vPATROCINADORA   := qryValores.fieldByName('PATRO').AsString;
        vFORNECEDOR      := BuscaNomeFornecedor(qryValores.fieldByName('IDFORCLIASS').asInteger);
        vNOMEPLANOPREV   := BuscaPlanoNomePrev(vIDPLANOPREV);
        vIDPESSJUR       := qryValores.fieldByName('IDPESSOA').AsInteger;
        vCODCENTROCUSTOD := qryValores.fieldByName('CCUSTOASS').AsString;
        vCODUNIDNEGOC    := qryValores.FieldByName('ATIVPROJETOASS').asString;

        (* ============================================ *)

        (* Busca descricao da Patrocinadora e PlanoPrev *)

        iPlnCodigo := LancaContab(
          True,              (* Exibe ou não as mensagens de erro da função em caixas de diálogo *)
          'BASEDADOS',       (* Nome do Banco de Dados *)
          DateToStr(Date),   (* sDataLanc (string) - data do Lançamento *)
          IntToStr(Sistema.IdModulo), (* Código do Sistema de Origem *)
          '2',               (* '0' = débito   '1' = crédito   '2' = partida dobrada *)
          'D',               (* 'D' = débito   'C' = crédito *)
          '',                (* Tipo de conversão utilizado para a moedas oficial. Se este lançamento não tiver nenhum tipo de conversão específica, este campo pode ser passado como NULL *)
          '',                (* Tipo de conversão utilizado para a moeda gerencial. Se este lançamento não tiver nenhum tipo de conversão específica, este campo pode ser passado como NULL *)
          '',                (* Tipo de conversão utilizado para a moeda gerencial 1. Se este lançamento não tiver nenhum tipo de conversão específica, este campo pode ser passado como NULL *)
          '',                (* Tipo de conversão utilizado para a moeda gerencial 2 a Débito (somente se cTipoLanc="0" ou cTipoLanc="2"). Se este lançamento não tiver nenhum tipo de conversão específica, este campo pode ser passado como NULL *)
          '',                (* Indica se a conta a débito afeta origem e aplicação *)
          '',                (* Tipo de conversão utilizado para a moedas oficial. Se este lançamento não tiver nenhum tipo de conversão específica, este campo pode ser passado como NULL *)
          '',                (* Tipo de conversão utilizado para a moeda gerencial. Se este lançamento não tiver nenhum tipo de conversão específica, este campo pode ser passado como NULL *)
          '',                (* Tipo de conversão utilizado para a moeda gerencial 1. Se este lançamento não tiver nenhum tipo de conversão específica, este campo pode ser passado como NULL *)
          '',                (* Tipo de conversão utilizado para a moeda gerencial 2 a Débito (somente se cTipoLanc="0" ou cTipoLanc="2"). Se este lançamento não tiver nenhum tipo de conversão específica, este campo pode ser passado como NULL *)
          '',                (* Indica se a conta a crédito afeta origem e aplicação *)
          '',                (* Indica o número do documento de referência deste lançamento. Caso este lançamento não tenha nenhum número de lançamento este poderá ser NULL. *)
          copy(' Mes Refêrencia: ' + sMesCobranca + vPATROCINADORA, 1, 40), (* linha do histórico padrão 1. A primeira linha é obrigatória *)
          copy(' Fornecedor: ' + vFORNECEDOR, 1, 40),                       (* linha do histórico padrão 2 *)
          '',  (* linha do histórico padrão 3 *)
          vNOMEPLANOPREV,    (* linha do histórico padrão 4 *)
          '',    (* linha do histórico padrão 5 *)
          prmTpOperCobranca, (* código do Tipo de Operação do Lançamento. É opcional e serve para agrupar lançamentos de uma forma alternativa. Refere-se à tabela TIPOPER *)

          vCODCENTROCUSTOD,  (* Centro de Custo do Lançamento a débito. *)
          vPLACONTADAUTPATR, (* Conta Contábil do Lançamento a débito. *)

          vCODCCUSTOFORNECEDOR,  (* Centro de Custo do Lançamento a crédito. *)
          vCONTACFORNECEDOR,     (* Conta Contábil do Lançamento a crédito. *)

          liExercicio,       (* Exercício Contábil do Lançamento *)
          liPeriodo,         (* Período Contábil do Lançamento *)
          sistema.IdEmpresa, (* Empresa Proprietária selecionada no login *)
          Sistema.IdUsuario, (* iUsuario (integer) - Usuário corrente *)
          IntegraBack.Plano, (* código do Plano Contábil corrente *)
          dTotalVlCobranca,  (* Valor do Lançamento (deve sempre ser passado um valor positivo e diferente de zero) *)
          0,                 (* Valor do Lançamento a débito na moeda Oficial *)
          0,                 (* Valor do Lançamento a débito na moeda Gerencial *)
          0,                 (* Valor do Lançamento a débito na moeda Gerencial 1 *)
          0,                 (* Valor do Lançamento a débito na moeda Gerencial 2 *)
          0,                 (* Valor do Lançamento a débito na moeda Oficial *)
          0,                 (* Valor do Lançamento a débito na moeda Gerencial *)
          0,                 (* Valor do Lançamento a débito na moeda Gerencial 1 *)
          0,                 (* Valor do Lançamento a débito na moeda Gerencial 2 *)
          vCODUNIDNEGOC,     (* Atividade/Projeto do Lançamento. Se for passada vazia, será utilizada a Atividade/Projeto padrão *)
          False,             (* O default deste campo será False. Caso seja passado True (e o cTipoLanc for diferente de "2" - ou seja, não é uma partida dobrada), a função procurará se existe nesta planilha outro lançamento com cTipoLanc diferente de "2" com a mesma conta, mesmo centro de custo, mesma Atividade/Projeto e mesmo cTipoLanc. A função somará então os valores no mesmo lançamento contábil. *)
          0,                 (* Valor do Lançamento a Débito na moeda Histórica *)
          0,                 (* Valor do Lançamento a Crédito na moeda Histórica *)
          vCODSUBCONTA,      (* Código da Sub-Conta do Lançamento a Débito *)
          '',                (* Código da Sub-Conta do Lançamento a Crédito *)
          '',                (* Código do Histórico Padrão. Não é obrigatório. *)
          '',                (* sem uso, passar NULL *)
          iPlnCodigo,        (* Passar 0 (zero) para criar uma planilha nova. O sistema retornará o então o número da planilha gerada. Para continuar fazendo lançamentos nesta mesma planilha, passar este último número neste parâmetro (é um parâmetro passado por referência). *)
          sMsgErro,          (* Mensagem de erro retornada pela função. É um parâmetro passado por referência. *)
          IntegraBack.MascaraPlano,(* Máscara do Plano de Contas *)
          True,              (* Deve sempre ser passado como True. Apenas a Contabilidade pode passar esse parâmetro como False *)
          0,                 (* Número do Lançamento a ser criado. Na maioria dos casos este parâmetro deve ser passado como 0, mas no caso de um estorno ou exclusão, pode-se querer criar um lançamento numa planilha com um número específico. *)
          vIDPLANOPREV,      (* IdPlanoPrev *)
          vIDPESSJUR,    (* IdPessJur *)
          Sistema.UsaPlanoPatro)(*  *);

        If iPlnCodigo <= 0 then
        begin
          showMessage(' Erro na inclusão do lançamento na contabilidade: '+sMsgErro);
          bErro := True;
          Exit;
        end;
      end; //if
      qryValores.Next;
    end; // while
  end; {iPlnCodigo}
end; {FazLancamentoContabil}


Function TFrmLancCap.ValidaAnoMes(sSt:String;bNum:Byte): Boolean;
begin
  Result:=False;
  If StrToIntDef(Copy(sSt,1,4),0)>0 then
   If StrToIntDef(Copy(sSt,6,2),0) In [1..12+bNum] then
     Result:=True;
end;


function TFrmLancCap.InformacoesOk: boolean;
var sMsgErro : string;
begin
  Result := false;
  sMesCobranca := dblkMesRef.Text;

  if cmdtpkDataVencimento.Text = '' then
  begin
    showMessage('Data de Vencimento não Preenchida');
    if cmdtpkDataVencimento.canfocus then cmdtpkDataVencimento.setFocus;
    exit;
  end;


  (* verifica se o usuário preencheu o Mês de Cobrança *)
  If Not ValidaAnoMes(sMesCobranca,0) then
  begin
    ShowMessage('Ano/Mês da Cobrança não preenchido. ');
    if dblkMesRef.canfocus then dblkMesRef.SetFocus;
    Exit;
  end;(* if sMesCobranca *)
  (* Verifica se está integrado com Contabilidade *)
  if (IntegraBack.Contabilidade = 'N') then
  begin
    showMessage('O sistema não está integrado com a Contabilidade.' +
           ' As cobranças de contribuição não serão contabilizadas.');
    Exit;
  end;(* if Contabilidade = N *)
  (* Verifica se está integrado com CAP/CAR *)
  if (IntegraBack.Financeiro = 'N') then
  begin
    showMessage('O sistema não está integrado com o Contas a Receber.' +
           ' As cobranças de contribuição não podem ser enviadas.');
    Exit;
  end;(* if Financeiro = N *)

//  Zera as variáveis para poder receber da função TestaPeriodo o Exercício e o Período Contábil *)
  liExercicio := 0;
  liPeriodo   := 0;
  liEmpresa   := Sistema.IdEmpresa;
  (* Esta função é encarregada de testar uma data fornecida,
     verificando se ela pertence a um período/exercício contábil. Retornando:
     0 - data testada com sucesso. Período e Exercícios retornados.
     1 - a data não pertence a nenhum período
     2 - a data pertence a mais de um período
     3 - período bloqueado na Contabilidade
     4 - período já integrado. Lançamentos bloqueados
     Se pertence, isto é, a função retornou Zero, retorna também para uso em
     forma de variáveis(iPeriodo e iExercicio) passadas por referência.
     Caso contrário, isto é a função retornou diferente de Zero, retorna também
     uma mensagem de erro para uso em forma de variável(sMensagem) passada por referência.
     Esta função SEMPRE deve ser chamada antes de se realizar um lançamento (LancaContabR),
     para que a Contabilidade possa retornar os valores corretos de período e
     exercício para a data desejada. *)

  if TestaPeriodo( False,                     (* Exibe ou não as mensagens de erro retornadas pela função*)
                   'BaseDados',               (* Nome do Banco de Dados *)
                   DateToStr(Date),           (* Data a ser testada *)
                   IntToStr(Sistema.IdModulo),(* Código do Sistema de Origem *)
                   liExercicio,               (* Exercício Contábil retornada a partir da data *)
                   liPeriodo,                 (* Período Contábil retornada a partir da data *)
                   liEmpresa,                 (* Empresa proprietária *)
                   sMsgErro) <> 0             (* Mensagem de Erro retornada pela função *)
  then
  begin
    showMessage('Erro no período contábil - '+ sMsgErro);
    Exit;
  end;(* if TestaPeriodo *)
  Result := True;
end;




function TFrmLancCap.BuscaPlacontaTpDesemb(pcodTpdesemb: string; VAR CONTA, SUBCONTA: STRING): string;
var qryTmp : twwQuery;
begin
  result := '';
  qryTmp := Twwquery.Create(nil);
  try
    qryTmp.DatabaseName:='BaseDados';
    qryTmp.Sql.Clear;
    qryTmp.Sql.Add(   ' SELECT            '+
                      '   PLACONTA,       '+
                      '   CODSUBCONTA     '+
                      ' FROM              '+
                      '   TIPORECEBDESEMB '+
                      ' WHERE IDPESSOA = ' + intToStr(sistema.idempresa) +
                      ' AND (RECPAG   = ''P'') '+
                      ' AND (ATIVO = ''S'')    '+
                      ' AND  RTRIM(CODTIPRECDES) = '+ quotedStr(pcodTpdesemb));
    qryTmp.Open;
    CONTA    := qryTmp.FieldByName('PLACONTA').asString;
    SUBCONTA := qryTmp.FieldByName('CODSUBCONTA').asString;
    result   := qryTmp.FieldByName('PLACONTA').asString;
    qryTmp.Close;
  finally
    qryTmp.free;
  end;
end;

function TFrmLancCap.BuscaPlanoNomePrev(pIdPlanoPrev: integer): string;
var qryTmp : twwQuery;
begin
  result := '';
  qryTmp := Twwquery.Create(nil);
  try
    qryTmp.DatabaseName:='BaseDados';
    qryTmp.Sql.Clear;
    qryTmp.Sql.Add('SELECT NOME FROM PLANPREV '+
                 ' WHERE IDPLANOPREV = '+ intToStr(pIdPlanoPrev));
    qryTmp.Open;
    result := qryTmp.FieldByName('NOME').asString;
    qryTmp.Close;
  finally
    qryTmp.free;
  end;
end;


function TFrmLancCap.BuscaNomeFornecedor(pIdpessoa: integer): string;
var qryTmp : twwQuery;
begin
  result := '';
  qryTmp := Twwquery.Create(nil);
  try
    qryTmp.DatabaseName:='BaseDados';
    qryTmp.Sql.Clear;
    qryTmp.Sql.Add(' SELECT NOME FROM PESSOA '+
                   ' WHERE IDPESSOA = '+ intToStr(pIdPessoa));
    qryTmp.Open;
    result := qryTmp.FieldByName('NOME').asString;
    qryTmp.Close;
  finally
    qryTmp.free;
  end;
end;

procedure TFrmLancCap.drgrValoresCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  if (Field.FieldName = 'FLGLANCCCAP') then
  begin
	if (not Highlight) then
    ABrush.Color := clYellow;
  end
  else if (Field.FieldName = 'TOTAL_BRUTO') then
  begin
		AFont.Color := clRed;
  end;
end;

procedure TFrmLancCap.qryValoresFLGLANCCCAPChange(Sender: TField);
begin
  inherited;
  AtualizaFooter;
end;

procedure TFrmLancCap.AtualizaFooter;
begin
  dTotalVlCobranca := 0;
  qryValores.DisableControls;
  qryValores.First;
  while not qryValores.Eof do
  begin
    if qryValores.fieldByName('FLGLANCCCAP').asInteger = 1 then
    begin
      dTotalVlCobranca := dTotalVlCobranca + qryValores.FieldByName('TOTAL_BRUTO').asFloat;
      drgrValores.ColumnByName('TOTAL_BRUTO').FooterValue := formatFloat('#,##0.00', dTotalVlCobranca);
    end;
    qryValores.Next;
  end;
  qryValores.EnableControls;
  drgrValores.ColumnByName('TOTAL_BRUTO').FooterValue := formatFloat('#,##0.00', dTotalVlCobranca);
end;

procedure TFrmLancCap.LimpaLancamentos;
begin
  qryValores.Close;
  qryValores.ParamByName('MESREF').asString := '';
  qryValores.ParamByName('IDFUNDACAO').asInteger := -1;
  qryValores.Open;
  dblkMesRef.text := '';
  cmdtpkDataVencimento.Date := Date;
end;

procedure TFrmLancCap.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  LimpaLancamentos;
  LimpaTelaExclusao;
end;

procedure TFrmLancCap.BuscaLancamentos;
begin
  iPlnCodigo := 0;
  sNoDocumento := '';
  sPnlEfetivado := '';
  msLanctos.executar;
  sDataLancto := '';
  if msLanctos.RetornouValor then
  begin
    dbedCodDoc.Text     := msLanctos.ValoresChave[0];
    dbedCodPln.Text     := msLanctos.ValoresChave[1];
    dbedData.Text       := msLanctos.ValoresChave[2];
    dbedUsu.Text        := msLanctos.ValoresChave[3];
    dbedNumLancto.Text  := msLanctos.ValoresChave[4];
    dbedValor.Text      := msLanctos.ValoresChave[5];
    dbedHist.Text       := msLanctos.ValoresChave[6];
    dbedDataVencto.Text := msLanctos.ValoresChave[7];
    iPnlCodigoExcl      := strToIntDef(msLanctos.ValoresChave[1], -1);
    sNoDocumento        := msLanctos.ValoresChave[8];
    iNumLancto          := strToIntDef(msLanctos.ValoresChave[8], -1);
    sPnlEfetivado       := trim(msLanctos.ValoresChave[9]);
    sDataLancto         := msLanctos.ValoresChave[2];
    iCodDocumento       := strToInt(msLanctos.ValoresChave[0]);
  end;
end;

procedure TFrmLancCap.btnProcurarClick(Sender: TObject);
begin
  inherited;
  BuscaLancamentos;
end;

function TFrmLancCap.ExcluiLancamento(pPlnCodigo: Integer): Boolean;
var qryParContab : twwQuery;
    bEstorna : boolean;
    liResult : LongInt;
    sMsgErro : string;
begin
  result := true;
  bEstorna := false;
  liResult := -1;
  sMsgErro := '';
  qryParContab := twwQuery.Create(nil);
  qryParContab.DatabaseName := 'BaseDados';
  try
    try
     qryParContab.Close;
     qryParContab.sql.text := ' SELECT PACESTORNA FROM PARAMCONTAB WHERE IDPESSOA = '+ intToStr(sistema.IdEmpresa);
     qryParContab.Open;
     if not qryParContab.IsEmpty then
       bEstorna := (qryParContab.fieldByName('PACESTORNA').asString = 'S');

     liEmpresa   := sistema.IdEmpresa;
     liPeriodo   := 0;
     liExercicio := 0;
     liResult := TestaPeriodo( False,                     (* Exibe ou não as mensagens de erro retornadas pela função*)
                               'BaseDados',               (* Nome do Banco de Dados *)
                               DateToStr(Date),           (* Data a ser testada *)
                               IntToStr(Sistema.IdModulo),(* Código do Sistema de Origem *)
                               liExercicio,               (* Exercício Contábil retornada a partir da data *)
                               liPeriodo,                 (* Período Contábil retornada a partir da data *)
                               liEmpresa,                 (* Empresa proprietária *)
                               sMsgErro);                 (* Mensagem de Erro retornada pela função *)

     qryParContab.Close;
     qryParContab.sql.text := ' UPDATE LANCTODOCUM SET PLNCODIGO  = NULL WHERE PLNCODIGO = '+ intToStr(pPlnCodigo);
     qryParContab.ExecSql;

     if liResult = 0 then
     begin
       if (bEstorna = False) and ((sPnlEfetivado = 'N') or (integraBack.Contabilidade = 'N')) then
       begin
         ExcluiLanc(False, pPlnCodigo, 'BaseDados', '17', IntegraBack.Plano,
                    liEmpresa, sistema.Idusuario, true, 0, IntegraBack.MascaraPlano);
       end
       else
       begin
         EstornaLanc(False, pPlnCodigo, 'BaseDados', sDataLancto, liExercicio,
                     liPeriodo, liEmpresa, integraback.MascaraPlano);
       end;
     end;
     Documento.Excluir(qryAux, iCodDocumento, 0);
    finally
      qryParContab.Free;
    end;
  except
    result := false;
  end;
end;

procedure TFrmLancCap.LimpaTelaExclusao;
begin
  dbedCodDoc.Text     := '';
  dbedCodPln.Text     := '';
  dbedData.Text       := '';
  dbedUsu.Text        := '';
  dbedNumLancto.Text  := '';
  dbedValor.Text      := '';
  dbedHist.Text       := '';
  dbedDataVencto.Text := '';
  iPnlCodigoExcl      := 0;
  sNoDocumento        := '';
  iNumLancto          := 0;
  sPnlEfetivado       := '';
  sDataLancto         := '';
  iCodDocumento       := 0;
end;

end.



