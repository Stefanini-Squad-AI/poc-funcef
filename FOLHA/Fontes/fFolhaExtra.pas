// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//------------------------------------------------------------------------------
//Pendência   : SIG136844
//Data        : 22/06/2023
//Responsável : Andre Imakawa
//Alteração   : Refazer SIG 99651
//------------------------------------------------------------------------------
//Pendência   : SIG135653
//Data        : 10/05/2023
//Responsável : Andre Imakawa
//Alteração   : Desfazer SIG 99651
//------------------------------------------------------------------------------
//Pendência   : SIG99651
//Data        : 27/10/2021
//Responsável : Andre Imakawa
//Alteração   : Apagar BasePagamentoReinf
//------------------------------------------------------------------------------
//Rotina      : BuscaPlanoContabil, MontaPerfil, dblcPlanoContabilChange
//Pendência   : 131432
//Data        : 24/01/2023
//Responsável : Edilaine
//Alteração   : Filtar perfil de Investimento de acordo com Plano Contábil
//------------------------------------------------------------------------------
//Pendência   : SIG101624
//Data        : 14/09/2020
//Responsável : Andre Imakawa
//Alteração   : Selecionar perfil de Investimento na funcionalidade de Folha Extra.
//------------------------------------------------------------------------------
//Pendência   : SIG94637
//Data        : 26/11/2019
//Responsável : Ewerton Beltramini - SIG94637
//Alteração   : Carregando um campo obrigatório.
//------------------------------------------------------------------------------
// Alteração  : bbtnProcessar
// Data       : 25/09/2019
// SIG        : 92076
// Autor      : Rafael Vasconcelos
// Descrição  : Inserir na tabela Base de Pagamento os campos P.IDRESPONSAVEL,P.IDRECEBEPGTO
//***************************************************************************************************
// Alteração  : qryPlanoContabil
// Data       : 15/03/2019
// SIG        : 63033
// Autor      : Osni Cavalcante
// Descrição  : Utilização de filtro na consulta que exibe os Planos Contábeis para inibir a
//              visualizaçãode dos Perfis de Investimetos
//***************************************************************************************************
// Alteração  : bbtnProcessarClick
// Data       : 05/02/2019
// SIG        : 81798
// Autor      : Andre Imakawa
// Descrição  : Correção para comitar antes da msg de ok e delete registro a registro
//              para as tabelas de log.
//***************************************************************************************************
// Alteração  :
// Data       : 28/03/2018
// SIG        : 65767
// Autor      : Andre Imakawa
// Descrição  : Correção para exibir mensagem de erro correto.
//***************************************************************************************************
// Alteração  :
// Data       : 23/04/2018
// SIG        : 67136
// Autor      : Andre Imakawa
// Descrição  : Recuperar o IdplanoPrev corretamente.
//***************************************************************************************************
//Alteração  : bbtnProcessarClick
//Nº SIG.....: 65680
//Data.......: 03/04/2018
//Responsável: Andre Imakawa
//Descrição..: Deletar tabela LOG_ALT_BASEPGTO
//***************************************************************************************************
// Data       : 21/02/2018
// Autor      : Everson Luiz Pereira da Cunha
// SIG        : SIG TIBERO
// Descrição  : Ajustes nos SQL, incluindo os alias nas tabelas/campos.
//              Retirada de INDEX, +rule etc.
//              Melhoria realizada para adaptação ao TIBERO.
//******************************************************************************
// Alteração  : (dfm) qryRubricaGravar
// Data       : 30/01/2018
// SIG        : 56702
// Autor      : Edilaine
// Descrição  : Alterações para tratar perfil de investimento
//******************************************************************************
//Pendência   : SIG50629
//Data        : 18/07/2017
//Responsável : Fernando Xavier
//Alteração   : Erro ao deletar registros da basedepagamento quando o lote foi
//              utilizado em outra matricula.
//------------------------------------------------------------------------------
//Pendência   : SIG49444
//Data        : 29/06/2017
//Responsável : Fábio Sampaio
//Alteração   : Disponibilização do fonte SOL 207789/16579.
//------------------------------------------------------------------------------
//Pendência   : SOL 207789/16579 PPM 543916
//Data        : 05/07/2015
//Responsável : Fernando Xavier
//Alteração   : Criação de Nova Funcionalidade para Batimento de Retorno das
//              Informações da Fita de Crédito
//------------------------------------------------------------------------------
//Pendência   : SOL 152852 Kintana 1144747
//Responsável : Fernando Xavier
//Data        : 14/02/2011
//Descrição   : retornar alteração feita na tela de efetivação das Conta Salário.
//------------------------------------------------------------------------------
// Autor(a)    :  Fernando Xavier
// Pendência   :  SOL 152601 Kintana 1136369
// Descrição   :  Solicitamos alterar a busca das contas bancárias no momento da
//                inserção de um adiantamento extrafolha, pois todos os adiantamentos
//                deverão buscar a conta salário e não conta preferencial.
//------------------------------------------------------------------------------
// Autor(a)    :  Renato Visoni
// Pendência   :  SOL 143380 Kintana 943521
// Descrição   :  Se eu efetivar duas versões de adto Extra folha, e estornar
// uma o sistema não considera a versão que foi considerado o estorno e apagas
// todas as rubricas individuais da tabela RubricaIndiv.
// Ficando assim sem a cobrança devida na próxima folha normal.
//------------------------------------------------------------------------------
//  Autor(a)   : Daniel Begnami
//  Data       : 09.07.2009
//  Pendencia  : 111915
//  Alteração  : Foi alterado a conta de conta PREFERENCIAL para conta SALAÁRIO (TIPOCONTA = 2).
//------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 28/10/2009
// Pendência   : SOL 126263 Kintana 658083
// Descricao   : O botão processar nao estava comitando as informações.
//------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 13/07/2009
// Pendência   : SOL 107642 Kintana 591128
// Descricao   : Bloquear o processo quando o valor Liquido for maior que o valor
// permitido.
//------------------------------------------------------------------------------
// Autor(a)    : Daniel Begnami
// Data        : 26/12/2008
// Pendência   : 104837
// Descricao   : Ajuste na Data Cobrança e Data Referencia gravando separadamente as mesmas
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 06/05/2007
// Rotina      : bbtnProcessarClick
// Pendência   : 28031
// Descricao   : Ajuste no Plano Contabil da folha extra
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 06/05/2007
// Rotina      : bbtnProcessarClick
// Pendência   : 27839
// Descricao   : Correção da geração da folha extra.
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 13/08/2007
// Rotina      : TFolhaPreviaExtra
// Pendência   : 16720
// Descricao   : Gerar uma folha extra a partir de um arquivo txt.
//------------------------------------------------------------------------------
// Autor(a)    : Bruno Bastos
// Data        : 08/06/2007
// Rotina      : BuscaPlanoContabil
// Pendência   : 25883
// Descricao   : Buscar o plano previdenciário desativado para passar para a montaplanocontabil.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 08/06/2007
// Rotina      : BuscaPlanoContabil
// Pendência   : 25501
// Descricao   : Incluir benefícios na situação de retido.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 14/03/2006
// Rotina      : Várias (buscar pela pendencia)
// Pendência   : 24690
// Descricao   : Tratar plano previdenciário e contábil obtendo pela Benefbfciario
//   para casos de saldamento, em que passam a existir mais de um plano e a
//   partprevplan fica com plano ativo diferente do benefício ativo da Benefbfciario.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 25/09/2006
// Rotina      : BuscaPlanoContabil e na Tela
// Pendência   : 23387
// Descricao   : Exibir num lookupcombo os planos contábeis disponíveis e permitir
//               o usuário escolher um para lançamento da rubrica.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 25/09/2006
// Rotina      : BuscaPlanoContabil
// Pendência   : 23371
// Descricao   : Tratar retorno da regra de calculo para evitar gravar plano contabil inválido.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 20/09/2006
// Rotina      : BuscaPlanoContabil
// Pendência   : 23342
// Descricao   : Passar o campo PARTPREVPLAN.IDSITPLANOPREV para a regra.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 20/09/2006
// Rotina      : Diversas
// Pendência   : 23361
// Descricao   : Retirar RULE de consultas.
//------------------------------------------------------------------------------
// Autor(a)    : Bruno Bastos
// Data        : 28/11/2005
// Rotina      : BuscaPlanoContabil
// Pendência   : 19791
// Descricao   : Executar a regra de plano contábil parametrizada no AdmPrev.
//------------------------------------------------------------------------------

unit fFolhaExtra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, Spin, Grids, Wwdbigrd, Wwdbgrid,
  Mask, wwdbedit, Db, DBTables, Wwquery, wwdblook, TREdit,
  Wwdatsrc, wwdbdatetimepicker, CMDateTimePicker,
  dBaseDados, uAdmPrevFB, UMensErro, uFuncoesFolha, UFuncoesUteisFB,
  uDataBase, dContabil, uPrevia, uObjFolha, usistema,
  uCtrlPadroes, uCtrlBancoPortForma, ComCtrls, DBClient, wwclient, DBGrids,
  uFolhaPreviaObj;

type
  TfrmFolhaExtra = class(TfrmOkCancelar)
    MSResponsavel: TMontaSelect;
    Panel1: TPanel;
    qryRubrica: TwwQuery;
    qryPortForma: TwwQuery;
    Label6: TLabel;
    qryVirtual: TwwQuery;
    dsVirtual: TwwDataSource;
    updVirtual: TUpdateSQL;
    qryMatricula: TwwQuery;
    qryInscricao: TwwQuery;
    qryPrevia: TwwQuery;
    updPrevia: TUpdateSQL;
    pnlConfere: TPanel;
    sgConfere: TStringGrid;
    BitBtn2: TBitBtn;
    qryContaBancaria: TwwQuery;
    qryAux: TwwQuery;
    qryRecebedor: TwwQuery;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    cmbMesCob: TComboBox;
    spnedAnoCob: TSpinEdit;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    bbtnProcessar: TBitBtn;
    bbtnOutro: TBitBtn;
    qryLotes: TwwQuery;
    GroupBox5: TGroupBox;
    dblkLote: TwwDBLookupCombo;
    lbDescricao: TLabel;
    lbDataFolha: TLabel;
    BtnExibePrevia: TBitBtn;
    dbgMostraPrevia: TwwDBGrid;
    qryMostraPrevia: TwwQuery;
    dsMostraPrevia: TwwDataSource;
    qryParticipante: TwwQuery;
    qryRubricaGravar: TwwQuery;
    qryRubricasIRRF: TwwQuery;
    dsRubricasIRRF: TwwDataSource;
    updRubricasIRRF: TUpdateSQL;
    qryBuscaRubrica: TwwQuery;
    qryPlanoContabil: TwwQuery;
    pcTipoFolhaExtra: TPageControl;
    tbsIndividual: TTabSheet;
    tbsImportaPrevia: TTabSheet;
    pnlDadosTitular: TPanel;
    pnlDadosRubrica: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    lblPlanoContabil: TLabel;
    edtCodRubrica: TEdit;
    cmbRubrica: TwwDBLookupCombo;
    cmbPortForma: TwwDBLookupCombo;
    edtValor: TEdit;
    grpMesRef: TGroupBox;
    cmbMes: TComboBox;
    spnedAno: TSpinEdit;
    btnConfere: TBitBtn;
    btnAssociar: TBitBtn;
    btnNaoAssociar: TBitBtn;
    edtTotLiq: TEdit;
    dblcPlanoContabil: TwwDBLookupCombo;
    grpImportacao: TGroupBox;
    edtImportacao: TEdit;
    dsPessoa: TDataSource;
    cdsPessoa: TwwClientDataSet;
    btImportacao: TButton;
    dbgPessoa: TDBGrid;
    OpenDialog: TOpenDialog;
    dbgRubrica: TDBGrid;
    cdsRubrica: TwwClientDataSet;
    dsRubrica: TDataSource;
    dbgRubricas: TwwDBGrid;
    Panel3: TPanel;
    memResult: TMemo;
    bbtnSalvar: TBitBtn;
    SaveDlg: TSaveDialog;
    GroupBox4: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label1: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    edtMatricula: TEdit;
    edtInscricao: TEdit;
    edtNome: TEdit;
    bbtnProcurar: TBitBtn;
    cmbRecebedor: TwwDBLookupCombo;
    edDataNasc: TCMDateTimePicker;
    edNumDep: TEdit;
    lblPerfil: TLabel;    // Andre Imakawa - SIG 101624
    qryPerfil: TwwQuery;  // Andre Imakawa - SIG 101624
    dblcPerfil: TwwDBLookupCombo;
    sbtImportaArquivo: TSpeedButton; // Andre Imakawa - SIG 101624
    procedure FormCreate(Sender: TObject);
    procedure edtCodRubricaExit(Sender: TObject);
    procedure btnAssociarClick(Sender: TObject);
    procedure NADAKeyPress(Sender: TObject; var Key: Char);
    procedure cmbRubricaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnNaoAssociarClick(Sender: TObject);
    procedure spnedAnoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure edtMatriculaExit(Sender: TObject);
    procedure edtInscricaoExit(Sender: TObject);
    procedure qryVirtualAfterPost(DataSet: TDataSet);
    procedure btnConfereClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure cmbRecebedorCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure cmbMesChange(Sender: TObject);
    procedure cmbMesCobChange(Sender: TObject);
    procedure bbtnProcessarClick(Sender: TObject);
    procedure dblkLoteCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure spnedAnoCobChange(Sender: TObject);
    procedure dbgRubricasDblClick(Sender: TObject);
    procedure pnlDadosRubricaMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure dbgRubricasMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure bbtnProcessarMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure dbgRubricasCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure bbtnProcessarKeyPress(Sender: TObject; var Key: Char);
    procedure BtnExibePreviaClick(Sender: TObject);
    procedure edtMatriculaChange(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btImportacaoClick(Sender: TObject);
    procedure sbtImportaArquivoClick(Sender: TObject);
    procedure dsPessoaDataChange(Sender: TObject; Field: TField);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure pcTipoFolhaExtraChange(Sender: TObject);
    procedure dblcPlanoContabilChange(Sender: TObject);
  private
    { Private declarations }
    inumrub: integer;
    sMesReferencia,
    sMesCobranca,
    sTipo,
    sDataFolha: String;
    iIdTitular,
    iIdResponsavel,
    iIdPessJur,
    iIdPlanoPrev,
    iIdPlanoPrevPart, 
    iIdPlanoOrigem, 
    iIdPlanoContabil,
    iIdRubrica,
    RubricaIRRF,
    iFlgIsentoIRRF: Integer;
    dDataNasc,
    dDataFolha: TDate;

    iUltIdTitular,
    iUltIdPessoa,
    iUltIdResponsavel,
    iUltIdPlanoPrev,

    iUltIdPlanoOrigem, 
    iUltIdPlanoContabil,
    iUltIdPerfil, // Andre Imakawa - SIG 101624

    iUltIdRubrica,
    iUltFlgDesconto,
    iUltIdPessJur,
    iUltCodPortForma,
    iUltFlgIRRF,
    iUltIsentoIRRF,
    iNumDep	      : Integer;

    sCodDarfLancado,   
    sCodFontePagadora, 
    
    sUltCodProvDesc,
    sUltMesReferencia,
    sUltCodIrrfDarf   : String;
    dUltValor	      : Double;
    dUltDataNasc      : TDate;

    bErro	      : Boolean;
    sMessage          : String;
    sIdLote           : String;
    iCodSubConta: integer;
    sPlaConta,
    sCODCENTROCUSTO : String;
    RubricaInfo,
    IncluiProv      : Boolean;
    Atualizar       : Boolean;

    lldfloatpgto : longint;
    lRefCF: TRegContFinan;
    lstRubricasIRRF : tStringlist;

    Function  ValidaAnoMes(sSt:String;bNum:Byte): Boolean;
    Function  LoteValido: Boolean;
    Function  LocalizaRubrica(sCodRub: String): Boolean;
    Function  VerificaCampos: Boolean;
    Function  VerificaConta: Boolean;
    Procedure AbreQryRubrica;
    Procedure PegaAnoMesCobranca;
    Procedure PegaAnoMesReferencia;
    Procedure MostraInfRubrica;
    Function  LocalizaMatricula: Boolean;
    Function  ExisteRubrica: Boolean;
    Procedure LimpaVariaveis;
    Procedure HabilitaPnl(Mostra:Boolean);
    Procedure HabilitaProcessar;
    Procedure Confere;
    function CalculaLiquido(aidresponsavel: integer): double; 
    Procedure MostraPrevia;
    procedure SelecionaLotes;
    Procedure ApagaRegPrevia;
    Procedure LocalizaRegPrevia(MostraInf:Boolean);
    Procedure VerifCodIrrfDarf;
    Procedure MostraRegPrevia;
    procedure Alimenta;
    procedure IncluiPrevia;
    Function DefineParticipante (iTitular : Integer) : Boolean;
    procedure CarregaLista;
    procedure BuscaPlanoContabil;

    Procedure LimpaPrevia;

    function BuscaPortadorForma(asPortadorForma: string): boolean; 

    procedure MontaPlanoContabil(aslistaplano: string);

    procedure MontaPerfil(aslistaplano: string); // Andre Imakawa - SIG 101624
  public
    { Public declarations }

    ctrlBCP: TCtrlBancoPortForma; 

  end;

var
  frmFolhaExtra: TfrmFolhaExtra;
  objRecebedor : TObjRecebedorSimples;
  FolhaPreviaObj : TFolhaPreviaObj;

implementation

{$R *.DFM}

{Acerto na função InserePrevia para passar o parametro FLGPAGA, que
será '2' para o ExtraFolha. Isto é necessário para a contabilização
na efetivação. }

Function TfrmFolhaExtra.ValidaAnoMes(sSt:String;bNum:Byte): Boolean;
begin
  Result:=False;
  If StrToIntDef(Copy(sSt,1,4),0)>0 then
    If StrToIntDef(Copy(sSt,6,2),0) In [1..12+bNum] then
      Result:=True;
end;

Function TfrmFolhaExtra.LoteValido: Boolean;
begin
  Result:=(Not qryLotes.IsEmpty) And
          (qryLotes.FieldByName('IDLOTE').AsString<>'') And
          (qryLotes.FieldByName('MESREFERENCIA').AsString<>'') And
          (qryLotes.FieldByName('DESCRICAO').AsString<>'') And
          (qryLotes.FieldByName('DATAPAGAMENTO').AsString<>'') And
          (sIdlote<>'') And
          (dbLkLote.Text<>'') And
          (dbLkLote.LookupValue<>'') And
          (StrToIntDef(dbLkLote.Text,0)=StrToIntDef(dbLkLote.LookupValue,0))And
          (StrToIntDef(dbLkLote.Text,0)>0)And
          (StrToIntDef(dbLkLote.LookupValue,0)>0)And
          (ValidaAnoMes(sMesCobranca,0)) And
          (lbDescricao.Caption<>'') And
          (lbDataFolha.Caption<>'');
end;

Function TfrmFolhaExtra.LocalizaRubrica(sCodRub: String): Boolean;
begin
  Result:= qryRubrica.Locate('IDPROVENTO', sCodRub, []);
end;

Procedure TfrmFolhaExtra.AbreQryRubrica;
Var sSql: String;
begin
  sSql:='SELECT ';
  If SistemaFolha.FlgUsaCodRubExt = 0 then
    sSql:=sSql+' IDPROVENTO, DESCRICAO, IDPROVENTO AS CODIGOINT, '
  else
    sSql:=sSql+' CODPROVDESC AS IDPROVENTO, DESCRPROVDESC AS DESCRICAO, IDPROVENTO AS CODIGOINT, ';

  sSql:=sSql+' FLGDESCONTO, FLGIRRF, CODIRRFDARF, '+
             ' DECODE(NVL(CODFONTEPAGADORA, 0), 0, 1, '+
             ' CODFONTEPAGADORA) CODFONTEPAGADORA '+
             ' FROM PROVDESC '+
             ' WHERE FLGESPECIAL = 0 '+
             ' ORDER BY DESCRICAO ';

  qryRubrica.Close;
  qryRubrica.Sql.Clear;
  qryRubrica.Sql.Add(sSql);
  qryRubrica.Open;
end;

Procedure TfrmFolhaExtra.HabilitaPnl(Mostra:Boolean);
begin
  If Not Mostra then
  begin
   (* Manter a ordem *)
    {1}dbgRubricas.Visible:=Mostra;
    {2}pnlDadosRubrica.Visible:=Mostra;
    {3}pnlDadosTitular.Visible:=Mostra;
       grpImportacao.Visible   := Mostra;
  end
  else
    begin
      {1}pnlDadosTitular.Visible:=Mostra;
      {2}pnlDadosRubrica.Visible:=Mostra;
      {3}dbgRubricas.Visible:=Mostra;
         grpImportacao.Visible   := Mostra;
    end;
end;

Procedure TfrmFolhaExtra.HabilitaProcessar;
begin
  If edtImportacao.Text <> '' Then
    bbtnProcessar.Enabled := (LoteValido) And (ValidaAnoMes(sMesReferencia,1)) And
                             (cdsPessoa.RecordCount > 0) And (cdsRubrica.RecordCount > 0) And
                             (memResult.Lines.Text = '')
  Else
  bbtnProcessar.Enabled := (LoteValido) And (ValidaAnoMes(sMesReferencia,1)) And
                           (edtCodRubrica.Text <> '') And (cmbRubrica.Text <> '') And
                           (edtValor.Text <> '') And
                           (cmbMes.Text <> '') Or (qryVirtual.RecordCount > 0);
end;

Function TfrmFolhaExtra.LocalizaMatricula: Boolean;
begin
  qryMatricula.Close;
  qryMatricula.ParamByName('MATRICULA').AsString:=edtMatricula.Text+'%';
  qryMatricula.ParamByName('PIDFUNDACAO').asinteger:=iidfundacao;
  qryMatricula.Open;
  If qryMatricula.IsEmpty then
    MsgDlg('Não foi encontrado participante com esta matrícula.',
           'Erro', mtError, [mbOk,mbHelp], 0);
  Result:=Not qryMatricula.IsEmpty;
end;

Function TfrmFolhaExtra.ExisteRubrica: Boolean;
begin
  (* Não permite duas rubricas iguais para o mesmo participante. *)
  Result := False;
  qryVirtual.First;
  While Not qryVirtual.Eof do
  begin
    If (qryVirtual.FieldByName('IDPESSOA').AsInteger=iIdResponsavel)And
       (qryVirtual.FieldByName('CODPROVDESC').AsString=edtCodRubrica.Text)And
       (qryVirtual.FieldByName('MESREFERENCIA').AsString=sMesReferencia) and
       (qryVirtual.FieldByName('IDPLANOCONTABIL').asinteger=
        qryPlanoContabil.fieldbyname('IDPLANOPREV').asinteger) then //PERMITIR EM PLANOS DIFERENTES 
      Result:=True;
    qryVirtual.Next;
  end; {While}
  If Result then
    MsgDlg(' Já foi cadastrada a Rubrica: '+qryRubrica.FieldByName('DESCRICAO').AsString+
    	   ' para este participante com mesmo Plano Contábil e Mês Referência.','Informação',mtInformation,[mbOk,mbHelp],0);
end;

Function TfrmFolhaExtra.VerificaConta: Boolean;
begin
  Result := True;
  qryContaBancaria.Close;
  qryContaBancaria.ParambyName('IDPESSOA').AsInteger := iIdResponsavel;
  qryContaBancaria.Open;
  if qryContaBancaria.IsEmpty then
  begin  
    MsgDlg(' Este Recebedor não possui Conta Bancária cadastrada. '+
           ' Cadastre pelo menos uma conta para conceder o benefício.',
           'Informação',mtInformation,[mbOk,mbHelp],0);
    Result := False;
    // SOL 152601 Kintana 1136369 alteração de conta bancaria para conta salario na mensagem
    // e alteração na query qryContaBancaria
    //SOL 152852 Kintana 1144747  retornar alteração feita na tela de efetivação das Conta Salário.
  end;
end;

Procedure TfrmFolhaExtra.LimpaVariaveis;
begin
  sIdLote:='';
  sDataFolha:='';
end;

Procedure TfrmFolhaExtra.PegaAnoMesCobranca;
Var sAnoAux,sMesAux: String;
begin
  sMesCobranca:='';
  sMesAux:='';
  sAnoAux := spnedAnoCob.Text;
  If cmbMesCob.Text='' Then
    cmbMesCob.Text := cmbMesCob.Items[cmbMesCob.ItemIndex];

  // SOL:104837 Daniel Begnami

{  if cmbMesCob.ItemIndex <= 8 then
     sMesAux := '0'+IntToStr(cmbMesCob.ItemIndex+1)
  else
  begin
    if cmbMesCob.ItemIndex <> 12 then
      sMesAux := IntToStr(cmbMesCob.ItemIndex+1)
    else
      sMesAux := '12';
  end;
  If (sAnoAux<>'') And (sMesAux<>'') then
    sMesCobranca := sAnoAux + '/' + sMesAux;
  If Not ValidaAnoMes(sMesCobranca,0) then sMesCobranca:=''; }

  if cmbMesCob.ItemIndex+1 <= 9 then
    sMesCobranca := spnedAnoCob.text + '/0' + IntToStr(cmbMesCob.ItemIndex+1)
  else
    sMesCobranca := spnedAnoCob.text + '/' + IntToStr(cmbMesCob.ItemIndex+1);

  // FIM

  SelecionaLotes;
end;

Procedure TfrmFolhaExtra.PegaAnoMesReferencia;
Var sAnoAux,sMesAux: String;
begin

  // SOL:104837 Daniel Begnami

{  sMesAux:='';
  sMesReferencia:='';
  sAnoAux:= spnedAno.Text;
  if cmbMes.ItemIndex <= 8 then
    sMesAux:= '0'+IntToStr(cmbMes.ItemIndex+1)
  else
  begin
    if cmbMes.ItemIndex in [9..12] then
      sMesAux:= IntToStr(cmbMes.ItemIndex+1)
  end;
  If sMesAux<>'' then
    sMesReferencia:= sAnoAux+'/'+sMesAux;
  If Not ValidaAnoMes(sMesReferencia,1) then
    sMesReferencia:=''; }

  // Fim

  if cmbMes.ItemIndex+1 <= 9 then
    sMesReferencia := spnedAno.text + '/0' + IntToStr(cmbMes.ItemIndex+1)
  else
    sMesReferencia := spnedAno.text + '/' + IntToStr(cmbMes.ItemIndex+1);

end;

Procedure TfrmFolhaExtra.MostraInfRubrica;
Var bInt: Byte;
    sSql: String;
begin
  RubricaInfo:=False;
  If Not qryVirtual.IsEmpty then
  begin
    EdtCodRubrica.Clear;
    cmbRubrica.Clear;
    cmbPortForma.Clear;
    If LocalizaRubrica(qryVirtual.FieldByName('CODPROVDESC').AsString) then
    begin
      edtCodRubrica.Text := qryRubrica.FieldByName('IDPROVENTO').AsString;
      cmbRubrica.LookupValue:=qryRubrica.FieldByName('IDPROVENTO').AsString;
      cmbRubrica.Text:=qryRubrica.FieldByName('DESCRICAO').AsString;
    end
    else
      begin
        qryAux.Close;
        qryAux.Sql.Clear;
        sSql:='SELECT ';
        If SistemaFolha.FlgUsaCodRubExt = 0 then
          sSql:=sSql+' IDPROVENTO, DESCRICAO '
        else sSql:=sSql+' CODPROVDESC AS IDPROVENTO, DESCRPROVDESC AS DESCRICAO ';
        sSql:=sSql+' FROM PROVDESC '+
                   ' WHERE IDPROVENTO = '+
                   IntToStr(StrToIntDef(qryVirtual.FieldByName('IDRUBRICA').AsString,0));
        qryAux.Sql.Add(sSql);
        qryAux.Open;
        If Not qryAux.IsEmpty then
        begin
          edtCodRubrica.Text:=qryAux.FieldByName('IDPROVENTO').AsString;
          cmbRubrica.Text:=qryAux.FieldByName('DESCRICAO').AsString;
        end;
        qryAux.Close;
      end;

    RubricaInfo:=BuscaPortadorForma(qryVirtual.FieldByName('CODPORTFORMA').AsString);

    if qryVirtual.FieldByName('CODPORTFORMA').asinteger > 0 then
    begin
      if qryPortForma.locate('codportforma',
           qryVirtual.FieldByName('CODPORTFORMA').AsString, []) then
      begin
        cmbPortForma.LookupValue:=qryPortForma.FieldByName('CODPORTFORMA').AsString;
        cmbPortForma.Text:=qryPortForma.FieldByName('DESCRICAO').AsString;
      end;
    end;

    edtValor.Text:=qryVirtual.FieldByName('VALORREF').AsString;  {ValorProvento da previa}
    bInt:=StrToIntDef(Copy(qryVirtual.FieldByName('MESREFERENCIA').AsString,6,2),0);
    Dec(bInt,1);
    If bInt In [0..11] then
      cmbMes.ItemIndex:=bInt;
    spnedAno.Text:=Copy(qryVirtual.FieldByName('MESREFERENCIA').AsString,1,4);
  end;
end;

Procedure TfrmFolhaExtra.Confere;
var
  dProvento,
  dDesconto,
  dTotliq: Double;
  sUltNome,
  sUltMesRef		: String;
  iUltIdPessoa,
  iCont,
  iAux			: Integer;
begin
  // limpar / posicionar  StringGrid.
  pnlconfere.Top:=72;
  pnlConfere.Left := (Self.Width div 2) - (pnlConfere.Width div 2);
  iCont    := 0;
  dProvento:= 0;
  dDesconto:= 0;
  dTotliq  := 0;
  // limpar o stringgrid
  for iAux := 1 to sgConfere.RowCount do
  begin
    sgConfere.Cells[0,iAux] := '';
    sgConfere.Cells[1,iAux] := '';
    sgConfere.Cells[2,iAux] := '';
    sgConfere.Cells[3,iAux] := '';
    sgConfere.Cells[4,iAux] := '';
  end;

  // Calcular as rubricas
  qryVirtual.First;
  sUltMesRef := qryVirtual.FieldByName('MESREFERENCIA').AsString;
  sUltNome := qryVirtual.FieldByName('NOME').AsString;
  iUltIdPessoa := qryVirtual.FieldByName('IDPESSOA').AsInteger;
  While (Not qryVirtual.Eof) do
  begin
    // acumula valores
    if qryVirtual.FieldByName('FLGDESCONTO').AsInteger = 0 then
      dProvento := dProvento + qryVirtual.FieldByName('VALORREF').AsFloat
    else
      dDesconto := dDesconto + qryVirtual.FieldByName('VALORREF').AsFloat;
    qryVirtual.Next;
    // verifica: se não for a mesma pessoa executa preenchimento da sg.
    if (iUltIdPessoa <> qryVirtual.FieldByName('IDPESSOA').AsInteger) or
       qryVirtual.Eof then
    begin
      Inc(iCont);
      dTotliq := dProvento - dDesconto;
      sgConfere.Cells[0,iCont] := sUltNome;
      sgConfere.Cells[1,iCont] := sUltMesRef;
      sgConfere.Cells[2,iCont] := FormatFloat('###,###,##0.00',ArredondaMoeda(dProvento));
      sgConfere.Cells[3,iCont] := FormatFloat('###,###,##0.00',ArredondaMoeda(dDesconto));
      sgConfere.Cells[4,iCont] := FormatFloat('###,###,##0.00',ArredondaMoeda(dTotLiq));
      dProvento := 0;
      dDesconto := 0;
      dTotliq	:= 0;
    end;
    sUltMesRef := qryVirtual.FieldByName('MESREFERENCIA').AsString;
    sUltNome := qryVirtual.FieldByName('NOME').AsString;
    iUltIdPessoa := qryVirtual.FieldByName('IDPESSOA').AsInteger;
  end;
  pnlConfere.Visible := True;
  btnExibePrevia.Enabled:=True;
  dbgMostraPrevia.Visible:=False;
end;

Procedure TfrmFolhaExtra.MostraPrevia;
Var sSql: String;
begin
  pnlconfere.Top:=72;
  pnlConfere.Left := (Self.Width div 2) - (pnlConfere.Width div 2);
  sSql:='SELECT P.NOME, PR.IDRUBRICA, ';
  If SistemaFolha.FlgUsaCodRubExt = 0 then
    sSql:=sSql+' PV.DESCRICAO, '
  else
    sSql:=sSql+' PV.DESCRPROVDESC AS DESCRICAO, ';

  sSql:=sSql+' PR.VALORPROVENTO, PR.VALORINFO, PR.MES, '+
             ' DECODE(PR.FLGDESCONTO,0,''PROVENTO'',1,''DESCONTO'') AS TIPO '+
             ' FROM PESSOA P, PREVIA PR, PROVDESC PV '+
             ' WHERE P.IDPESSOA=PR.IDRESPONSAVEL AND ';

  If SistemaFolha.FlgUsaCodRubExt = 0 then
    sSql:=sSql+' PR.IDRUBRICA = PV.IDPROVENTO AND '
  else
    sSql:=sSql+' PR.IDRUBRICA = PV.CODPROVDESC AND ';

  sSql:=sSql+' PR.FLGTIPODESC IN (''T'',''I'',''K'') AND '+
             ' PR.IDLOTE = '+sIdLote+' '+
//             ' ORDER BY IDRESPONSAVEL, SEQRUBRICA';     //Everson TIBERO
             ' ORDER BY PR.IDRESPONSAVEL, PR.SEQRUBRICA'; //Everson TIBERO
  qryMostraPrevia.Close;
  qryMostraPrevia.Sql.Clear;
  qryMostraPrevia.Sql.Add(sSql);
  qryMostraPrevia.Open;
  dbgMostraPrevia.Visible:=True;
end;

Function TfrmFolhaExtra.VerificaCampos: Boolean;
begin
  Result:= False;
  If sMesReferencia='' then cmbmes.Text:='';
  // não permitir campos em branco.
  Result:=(LoteValido)And(edtCodRubrica.text<>'')And
          (edtValor.Text<>'')And(cmbRecebedor.Text<>'')And
          (cmbMes.Text<>'')And(spnedAno.Text<>'')And
          (cmbRubrica.Text<>'')And
          (EdtMatricula.Text<>'')And(edtInscricao.Text<>'')And
          (EdtNome.Text<>'')And(EdNumDep.Text<>'')And
          (sMesReferencia<>'')And(iIdResponsavel>0)And
          (iIdTitular>0)And(iIdRubrica>0)And(iIdPessJur>0)And
          (iIdPlanoPrev>0)And(iIdResponsavel>0)And
          (StrToFloat(ClienteNumero(edtValor.Text))>0);

  if not Result then
  begin
    If RubricaInfo then
    begin
      edtCodRubrica.text:='';
      cmbRubrica.Text:='';
      RubricaInfo:=False;
    end;
    MsgDlg(' Alguns campos obrigatório não foram preenchidos. ',
           'Atenção',mtWarning,[mbOk,mbHelp],0);
  end;
End;

procedure TfrmFolhaExtra.FormCreate(Sender: TObject);
begin
  inherited;
  // ALIMENTA QRYS E VARIÁVEIS
  Atualizar:=False;
  sMesCobranca:='';
  LimpaVariaveis;

  HabilitaPnl(False);

  lbDescricao.Caption:='';
  lbDataFolha.Caption:='';

  AbreQryRubrica;
  qryVirtual.Open;
  qryRubricasIRRF.open;
  qryPortForma.Open;
  RubricaIRRF := prmIdRubricaIRRF;

  // definir o tam. das colunas do StringGrid;
  sgConfere.ColWidths[0] := 350; // Nome;
  sgConfere.ColWidths[1] := 70; // Mês Referente;
  sgConfere.ColWidths[2] := 80; // provento;
  sgConfere.ColWidths[3] := 80; // desconto;
  sgConfere.ColWidths[4] := 80; // líquido;
  sgConfere.Cells[0,0] := 'Responsável / Participante';
  sgConfere.Cells[1,0] := 'Mês Ref.';
  sgConfere.Cells[2,0] := 'Provento';
  sgConfere.Cells[3,0] := 'Desconto';
  sgConfere.Cells[4,0] := 'Líquido';
  (* Seleciona Lotes da CTRLINTERFACE *)

  ctrlBCP:=tCtrlBancoPortForma.create;
  ctrlBCP.InitializeAs(Padroes);
  ctrlBCP.Inicializa(iidfundacao);
end;

procedure TfrmFolhaExtra.edtCodRubricaExit(Sender: TObject);
begin
  inherited;
  //ATUALIZAR O MÊS REFERÊNCIA
  PegaAnoMesReferencia;
  if EdtCodRubrica.Text = '' then
    exit;
  If Not LocalizaRubrica(EdtCodRubrica.Text) then
    EdtCodRubrica.Clear
  else
  begin
    cmbRubrica.Text := qryRubrica.fieldbyname('DESCRICAO').AsString;
    iIdRubrica := qryRubrica.fieldbyname('IDPROVENTO').AsInteger;
  end;
  HabilitaProcessar;
end;

procedure TfrmFolhaExtra.btnAssociarClick(Sender: TObject);
Var
  iidfavorec: integer;
  iCodPortForma : Integer;
  lsnumbanco, lsnumagencia, lsnomeagencia,
  lsnumconta, lstipoconta, lsidcbancaria: string;
  lbpagtoelet, lbDuplContaPref: boolean;
  lobjPortador: tObjPortadorForma;
  liseqdoc: integer;
begin
  inherited;
  If ((sCodDarfLancado <> '') And (qryRubrica.FieldByName('CODIRRFDARF').AsString <> sCodDarfLancado) And
     (Not qryRubrica.FieldByName('CODIRRFDARF').IsNUll)) Then
  Begin
    MsgDlg(' A rubrica de provento possui Natureza de rendimento diferente da '+#13+
           ' rubrica de provento anterior. A folha extra não permite natureza '+#13+
           ' de rendimento diferente.', 'Informação', mtInformation, [mbOk], 0);
    Exit;
  End;

  If ((sCodFontePagadora <> '') And (qryRubrica.FieldByName('CODFONTEPAGADORA').AsString <> sCodFontePagadora)) Then
  Begin
    MsgDlg(' A folha extra não permite a inclusão de rubricas de fonte pagadoras '+
           'distintas.', 'Informação', mtInformation, [mbOk], 0);
    Exit;
  End;

  IncluiProv:=True;
  If (qryVirtual.FieldByName('CODPROVDESC').AsString=edtCodRubrica.Text)And
      (qryVirtual.FieldByName('TIPO').AsString='I')Or
       (qryVirtual.FieldByName('TIPO').AsString='K') then Exit;
  if Not VerificaCampos then Exit;

  If (trim(cmbPortForma.LookUpValue) <> '') and
     (trim(cmbPortForma.text) <> '') then
  Begin
    If FazQuery(qryAux,
         'SELECT * '+
         'FROM BANCOPORTFORMA '+
         'WHERE CODPORTFORMA = '+cmbPortForma.LookupValue+' '+
         'AND IDFUNDACAO = '+inttostr(iidfundacao)+' '+
         'AND IDMODULO = 18') Then

    //NÃO OBRIGAR PORTADOR FORMA
    if (Not VerificaConta) then
      Exit;
  End
  Else
    //NÃO OBRIGAR PORTADOR FORMA
    if (Not VerificaConta) then
      Exit;

  if ExisteRubrica then
    Exit;

  if Not ValidaAnoMes(sMesReferencia, 1) then
    Exit;
  // não permite duas rubrica iguais p/ o mesmo participante.

  If Not qryVirtual.Active Then qryVirtual.Open;

  Atualizar:=True;
  qryVirtual.Insert;
  qryVirtual.FieldByName('NOME').AsString := cmbRecebedor.Text;
  qryVirtual.FieldByName('IDPESSOA').AsInteger := iIdResponsavel;
  qryVirtual.FieldByName('IDTITULAR').AsInteger := IIDTitular;
  qryVirtual.FieldByName('CODPROVDESC').AsString := edtCodRubrica.Text;
  qryVirtual.FieldByName('IDRUBRICA').AsInteger := qryRubrica.FieldByName('CODIGOINT').AsInteger;
  qryVirtual.FieldByName('IDPESSJUR').AsInteger := iIdPessJur;
  qryVirtual.FieldByName('IDPLANOPREV').AsInteger := iIdPlanoPrev;
  qryVirtual.FieldByName('IDRESPONSAVEL').AsInteger := iIdResponsavel;
  qryVirtual.FieldByName('FLGDESCONTO').AsInteger := qryRubrica.fieldbyname('FLGDESCONTO').AsInteger;
  qryVirtual.FieldByName('FLGIRRF').AsInteger := qryRubrica.fieldbyname('FLGIRRF').AsInteger;
  qryVirtual.FieldByName('CODIRRFDARF').AsString := qryRubrica.fieldbyname('CODIRRFDARF').AsString;
  qryVirtual.FieldByName('VALORREF').AsFloat   :=StrToFloat(ClienteNumero(edtValor.Text));
  qryVirtual.FieldByName('DATAPAGTO').AsString := lbDataFolha.Caption;
  qryVirtual.FieldByName('MESREFERENCIA').AsString := sMesReferencia;
  qryVirtual.FieldByName('FLGISENTOIRRF').AsInteger := iFlgIsentoIRRF;
  qryVirtual.FieldByName('DATANASC').AsDateTime := dDataNasc;
  qryVirtual.FieldByName('TIPO').AsString := qryRecebedor.FieldByName('TIPO').AsString;
  qryVirtual.FieldByName('NUMDEP').AsInteger := iNumDep;
  (* Se houver erro na conversão retorna 0 *)

  If (trim(cmbPortForma.LookUpValue) <> '') and
     (trim(cmbPortForma.text) <> '') then
    iCodPortForma:=StrToIntDef(cmbPortForma.LookupValue,0)
  else
    iCodPortForma:=0;

  qryVirtual.FieldByName('CODPORTFORMA').AsInteger:=

  ctrlBCP.DefinePortadorForma(
      iidtitular, iidresponsavel, iIdPessJur,
      2, 0, 0, iCodPortForma, 0,
      lsnumbanco, lsnumagencia, lsnomeagencia, lsnumconta,
      lstipoconta, lsidcbancaria,
      lbpagtoelet, lbDuplContaPref, iidfavorec,
      0,
      liseqdoc,
      lobjPortador);

  If lbpagtoelet Then
  begin
    if lbDuplContaPref then
    begin
      MsgDlg('Erro, existe mais de uma Conta Salário Cadastrada.'+#13+    // SOL:111915 - Daniel Begnami
                   'Alterar acessando o Menu Cadastros / Contas Bancárias', 'Informação', mtinformation, [mbOK], 0);
      btnNaoAssociarClick(Self);
      Exit;
    end
    else
      if (trim(lsnumbanco)   = '') or
         (trim(lsnumagencia) = '') or
         (trim(lsnumconta)   = '') then
      begin
        MsgDlg('Erro, Conta Salário não Cadastrada.'+#13+   // SOL:111915 - Daniel Begnami
               'Alterar acessando o Menu Cadastros / Contas Bancárias', 'Informação', mtinformation, [mbOK], 0);
        btnNaoAssociarClick(Self);
        Exit;
      end;
  end;

  BuscaPortadorForma(qryVirtual.FieldByName('CODPORTFORMA').AsString); 

  qryVirtual.fieldbyname('IDFAVDOC').asinteger:=iidfavorec; 
  qryVirtual.fieldbyname('SEQDOCUMENTO').asinteger:=1; 
  qryVirtual.FieldByName('IDPLANOORIGEM').AsInteger := iIdPlanoOrigem;

  qryVirtual.FieldByName('IDPLANOCONTABIL').AsInteger:=
    qryPlanoContabil.fieldbyname('IDPLANOPREV').asinteger;

  qryVirtual.FieldByName('IDPERFILINVEST').AsInteger:=
    qryPerfil.fieldbyname('IDPERFILINVEST').asinteger; // Andre Imakawa - SIG 101624

  If sCodDarfLancado = '' Then 
    sCodDarfLancado:=qryRubrica.fieldbyname('CODIRRFDARF').AsString;      
  sCodFontePagadora:=qryRubrica.fieldbyname('CODFONTEPAGADORA').AsString; 

  qryVirtual.Post;
  edtCodRubrica.SetFocus;
end;

procedure TfrmFolhaExtra.NADAKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (not (key in ['0'..'9',',','.',#8])) and edtValor.Focused then
    key := #0;
end;

procedure TfrmFolhaExtra.cmbRubricaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  PegaAnoMesReferencia; 
  if cmbRubrica.Text <> ''then
  begin
    edtCodRubrica.Text := inttostr(qryRubrica.fieldbyname('IDPROVENTO').AsInteger);
    iIdRubrica := qryRubrica.fieldbyname('IDPROVENTO').AsInteger;
  end;
  cmbMes.Text:='';
end;

procedure TfrmFolhaExtra.btnNaoAssociarClick(Sender: TObject);
Var ExisteValor: Boolean;
begin
  inherited;
  IncluiProv:=False;
  If (qryVirtual.FieldByName('TIPO').AsString='I') Or
     (qryVirtual.FieldByName('TIPO').AsString='K') then
    Exit;
  Atualizar:=True;
  If Not qryVirtual.IsEmpty then
    qryVirtual.Delete;
  qryVirtual.First;
  If Not qryVirtual.IsEmpty then
  begin
    Repeat
      ExisteValor:=qryVirtual.FieldByName('VALORREF').AsFloat>0;
      qryVirtual.Next;
    Until (qryVirtual.Eof) Or (ExisteValor);
    qryVirtual.First;
    If Not ExisteValor then
      Repeat
        qryVirtual.Delete;
        qryVirtual.Next;
      Until(qryVirtual.Eof) Or (qryVirtual.IsEmpty);
  end;
  qryVirtual.First;
  bbtnProcessar.Enabled:=(Not bErro) And (qryVirtual.Eof);

  If qryVirtual.IsEmpty Then
    sCodDarfLancado := '';
end;

procedure TfrmFolhaExtra.spnedAnoChange(Sender: TObject);
begin
  inherited;
  PegaAnoMesReferencia;
end;

procedure TfrmFolhaExtra.FormShow(Sender: TObject);
var AYear, AMonth, ADay: Word;
    sAnoAux, sMesAux : string;
begin
  inherited;
  WindowState := wsMaximized;
  DecodeDate(date, AYear, AMonth, ADay);

  If StrToInt(spnedAno.Text)>AYear Then
    spnedAno.Value:=AYear;

  if (AMonth >= 1) and (AMonth <= 12) then
  begin
    cmbMesCob.ItemIndex := AMonth - 1;
    spnedAno.Text := IntToStr(AYear);
    spnedAnoCob.Text := IntToStr(AYear);
  end;

  bbtnProcessar.Enabled := False;

  cmbMes.ItemIndex:=0;

  pcTipoFolhaExtra.ActivePageIndex := 0;

  PegaAnoMesReferencia; 

  lstRubricasIRRF            := tstringlist.create;
  lstRubricasIRRF.Sorted     := true;
  lstRubricasIRRF.Duplicates := dupIgnore;

  CarregaLista;
end;

Function TfrmFolhaExtra.DefineParticipante (iTitular : Integer) : Boolean;
begin
  result := false;

  qryParticipante.close;
  qryParticipante.parambyname('PESSOA').asInteger := iTitular;
  qryParticipante.parambyname('PIDFUNDACAO').asInteger:=iidfundacao;
  qryParticipante.Open;

  while not qryParticipante.eof do
  begin
    If (qryparticipante.fieldbyname('IDTITULAR').asInteger =
        qryparticipante.fieldbyname('IDPESSOA').asInteger) then
    begin
      result := true;
      break;
    end;
    qryParticipante.Next;
  end;
end;

procedure TfrmFolhaExtra.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  If (Atualizar)And(bbtnProcessar.Enabled)And
      (Not qryVirtual.IsEmpty) then
  begin
    if MsgDlg('Atenção! As informações não foram processadas para o recebedor '+
            #13+qryVirtual.FieldByName('NOME').AsString+'.  Deseja Continuar? ','Confirmacão!',
                mtConfirmation,[mbYes,mbNo],0) = mrNo then   Exit;
  end;

  Atualizar:=False;
  bbtnProcessar.Enabled := False;
  MSResponsavel.Executar;
  if MSResponsavel.RetornouValor then
  begin
    If DefineParticipante(StrToInt(MSResponsavel.ValoresChave[1])) then
    begin
      iIdResponsavel    := qryParticipante.fieldbyname('IDPESSOA').asInteger;
      iIdTitular        := qryParticipante.fieldbyname('IDTITULAR').asInteger;
      edtInscricao.Text := qryParticipante.fieldbyname('INSCRICAONUMERO').asString;
      edtMatricula.Text := qryParticipante.fieldbyname('MATRICULA').asString;
      edtNome.Text      := qryParticipante.fieldbyname('NOME').asString;
      iIdPessJur        := qryParticipante.fieldbyname('IDPESSJUR').asInteger;
      iIdPlanoPrev      := qryParticipante.fieldbyname('IDPLANOPREV').asInteger;
      iIdPlanoPrevPart  := iIdPlanoPrev; 
    end;

    BuscaPlanoContabil; 

    qryAux.Sql.Clear;
    qryAux.SQL.Add('SELECT FLGISENTOIRRF, NUMDEPIRRF, DATANASC FROM PESSOAFISICA '+
            'WHERE IDPESSOA = '+IntTostr(IIDRESPONSAVEL) ); //cálculo deve ser feito com Idresponsavel
    qryAux.Open;
    if not qryAux.IsEmpty then
    begin
      iFlgIsentoIRRF := qryAux.FieldByName('FLGISENTOIRRF').AsInteger;
      dDataNasc := 	qryAux.FieldByName('DATANASC').AsDateTime;
      iNumDep := 	qryAux.FieldByName('NUMDEPIRRF').AsInteger;

      // FILTRA A QRY FAVORECIDO
      qryRecebedor.Close;
      qryRecebedor.Prepare;
      qryRecebedor.ParamByName('IDPESSOA').AsInteger := iIdTitular;
      qryRecebedor.parambyname('PIDFUNDACAO').asInteger:=iidfundacao;
      qryRecebedor.Open;

      if (not qryRecebedor.IsEmpty) then
      begin
        if StrToInt(msResponsavel.ValoresChave[0]) <> iidtitular then
        begin
          qryRecebedor.locate('idfavorecido', StrToInt(msResponsavel.ValoresChave[0]), []);
        end;

        iIdResponsavel  := qryRecebedor.FieldByName('IDFAVORECIDO').AsInteger;
        iFlgIsentoIRRF  := qryRecebedor.FieldByName('FLGISENTOIRRF').AsInteger;
        iNumDep         := qryRecebedor.FieldByName('NUMDEPIRRF').AsInteger;
        dDataNasc       := qryRecebedor.FieldByName('DATANASC').AsDateTime;
        cmbRecebedor.Text := qryRecebedor.FieldByName('NOME').AsString;
        // forçar a combo recebedor.
        cmbRecebedor.OnCloseUp(self,qryRecebedor,qryRecebedor,False);
      end
      else
      begin
        cmbRecebedor.Clear;
        edDataNasc.Clear;
        edNumDep.Clear;
      end;
    end;
    qryAux.Sql.Clear;
    edtCodRubrica.SetFocus;
  end;
end;

procedure TfrmFolhaExtra.edtMatriculaExit(Sender: TObject);
begin
  inherited;
  if edtMatricula.Text = '' then exit;
  (* LOCALIZA MATRICULA *)
  If LocalizaMatricula then
  begin
    If DefineParticipante(qryMatricula.FieldByName('IDPESSOA').AsInteger) then
    begin
      iIdTitular        := qryMatricula.FieldByName('IDPESSOA').AsInteger;
      iIdPessJur        := qryMatricula.FieldByName('IDPESSJUR').AsInteger;
      iIdPlanoPrev      := qryMatricula.FieldByName('IDPLANOPREV').AsInteger;
      iIdPlanoPrevPart  := iIdPlanoPrev;
      edtMatricula.Text := qryMatricula.FieldByName('MATRICULA').AsString;
      edtInscricao.Text := qryMatricula.FieldByName('INSCRICAONUMERO').AsString;
      edtNome.Text      := qryMatricula.FieldByName('NOME').AsString;
      iIdResponsavel    := qryMatricula.FieldByName('IDPESSOA').AsInteger; 
    end;

    BuscaPlanoContabil;

    edtCodRubrica.Clear;
    cmbRecebedor.SetFocus;
    cmbRubrica.Clear;
    cmbPortForma.clear;
    edtValor.Clear;
    edtTotLiq.Clear;
    // FILTRA A QRY FAVORECIDO
    qryRecebedor.Close;
    qryRecebedor.Prepare;
    qryRecebedor.ParamByName('IDPESSOA').AsInteger := qryMatricula.FieldByName('IDPESSOA').AsInteger;
    qryRecebedor.parambyname('PIDFUNDACAO').asInteger:=iidfundacao;

    qryRecebedor.Open;
    if (not qryRecebedor.IsEmpty) then
    begin
      if qryMatricula.FieldByName('IDRECEBEDOR').AsInteger <> iidtitular then
      begin
        qryRecebedor.locate('idfavorecido', qryMatricula.FieldByName('IDRECEBEDOR').AsInteger, []);
      end;

      iIdResponsavel  := qryRecebedor.FieldByName('IDFAVORECIDO').AsInteger;
      iFlgIsentoIRRF  := qryRecebedor.FieldByName('FLGISENTOIRRF').AsInteger;
      iNumDep         := qryRecebedor.FieldByName('NUMDEPIRRF').AsInteger;
      dDataNasc       := qryRecebedor.FieldByName('DATANASC').AsDateTime;
      cmbRecebedor.Text := qryRecebedor.FieldByName('NOME').AsString;
      // forçar a combo recebedor.
      cmbRecebedor.OnCloseUp(self,qryRecebedor,qryRecebedor,False);
    end
    else
    begin // SE ESTIVER VAZIA É O PRÓPRIO.
      iIdResponsavel  := qryMatricula.FieldByName('IDPESSOA').AsInteger;
      iFlgIsentoIRRF  := qryMatricula.FieldByName('FLGISENTOIRRF').AsInteger;
      iNumDep         := qryMatricula.FieldByName('NUMDEPIRRF').AsInteger;
      dDataNasc       := qryMatricula.FieldByName('DATANASC').AsDateTime;
      edDataNasc.Date := dDataNasc;
      edNumDep.Text   := IntToStr(iNumDep);
      cmbRecebedor.Text := qryMatricula.FieldByName('NOME').AsString;
      //OBTÉM AS RUBRICAS
      LocalizaRegPrevia(True);
    end;
  end;
end;

procedure TfrmFolhaExtra.edtInscricaoExit(Sender: TObject);
begin
  inherited;
  if edtInscricao.Text = '' then exit;
  // LOCALIZA INSCRICAO
  qryInscricao.Close;
  qryInscricao.ParamByName('INSCRICAO').AsInteger := StrToInt(edtInscricao.Text);
  qryInscricao.parambyname('PIDFUNDACAO').asInteger:=iidfundacao;
  qryInscricao.Open;
  if qryInscricao.IsEmpty then
  begin
    MsgDlg('Não foi encontrado participante com este número de inscrição.',
           'Erro',mtError,[mbOk,mbHelp],0);
    Exit;
  end;
  iIdTitular      := qryInscricao.FieldByName('IDPESSOA').AsInteger;
  iIdPessJur      := qryInscricao.FieldByName('IDPESSJUR').AsInteger;
  iIdPlanoPrev    := qryInscricao.FieldByName('IDPLANOPREV').AsInteger;
  edtMatricula.Text := qryInscricao.FieldByName('MATRICULA').AsString;
  edtNome.Text    := qryInscricao.FieldByName('NOME').AsString;

  If DefineParticipante(qryInscricao.FieldByName('IDPESSOA').AsInteger) then
  begin
    iIdTitular      := qryInscricao.FieldByName('IDPESSOA').AsInteger;
    iIdPessJur      := qryInscricao.FieldByName('IDPESSJUR').AsInteger;
    iIdPlanoPrev    := qryInscricao.FieldByName('IDPLANOPREV').AsInteger;
    edtMatricula.Text := qryInscricao.FieldByName('MATRICULA').AsString;
    edtNome.Text    := qryInscricao.FieldByName('NOME').AsString;
  end;

  iIdPlanoPrevPart := iIdPlanoPrev;

  BuscaPlanoContabil; 

  edtCodRubrica.Clear;
  cmbRubrica.clear;
  cmbPortForma.clear; 
  edtCodRubrica.SetFocus;
  edtValor.Clear;
  edtTotLiq.Clear;
  // FILTRA A QRY FAVORECIDO
  qryRecebedor.Close;
  qryRecebedor.Prepare;
  qryRecebedor.ParamByName('IDPESSOA').AsInteger:=qryInscricao.FieldByName('IDPESSOA').AsInteger;
  qryRecebedor.parambyname('PIDFUNDACAO').asInteger:=iidfundacao;

  qryRecebedor.Open;
  if (not qryRecebedor.IsEmpty) then
  begin
    if qryInscricao.FieldByName('IDPESSOA').AsInteger <> iidtitular then
    begin
      qryRecebedor.locate('idfavorecido', qryInscricao.FieldByName('IDPESSOA').AsInteger, []);
    end;

    // o recebedor é o próprio
    iIdResponsavel  := qryRecebedor.FieldByName('IDFAVORECIDO').AsInteger;
    iFlgIsentoIRRF  := qryRecebedor.FieldByName('FLGISENTOIRRF').AsInteger;
    iNumDep         := qryRecebedor.FieldByName('NUMDEPIRRF').AsInteger;
    dDataNasc       := qryRecebedor.FieldByName('DATANASC').AsDateTime;
    cmbRecebedor.Text := qryRecebedor.FieldByName('NOME').AsString;
    // forçar a combo recebedor.
    cmbRecebedor.OnCloseUp(self,qryRecebedor,qryRecebedor,False);
  end
  else
  begin // SE ESTIVER VAZIA É O PRÓPRIO.
    iIdResponsavel  := qryInscricao.FieldByName('IDPESSOA').AsInteger;
    iFlgIsentoIRRF  := qryInscricao.FieldByName('FLGISENTOIRRF').AsInteger;
    iNumDep         := qryInscricao.FieldByName('NUMDEPIRRF').AsInteger;
    dDataNasc       := qryInscricao.FieldByName('DATANASC').AsDateTime;
    edDataNasc.Date := dDataNasc;
    edNumDep.Text   := IntToStr(iNumDep);
    cmbRecebedor.Text := qryInscricao.FieldByName('NOME').AsString;
  end;
end;

function TfrmFolhaExtra.CalculaLiquido(aidresponsavel: integer): double;
var dTotalLiq: Double;
    bmGuarda: TBookmark;
begin
  dTotalLiq:=0;
  bmGuarda:=qryVirtual.GetBookmark;
  qryVirtual.disablecontrols;
  qryVirtual.First;
  While Not qryVirtual.Eof Do
  begin
    if qryVirtual.FieldByName('IDPESSOA').AsInteger = iIdResponsavel then
    begin
      if qryVirtual.FieldByName('FLGDESCONTO').AsInteger = 0 then
        dTotalLiq:=dTotalLiq+qryVirtual.FieldByName('VALORREF').AsFloat
      else
        dTotalLiq:=dTotalLiq-qryVirtual.FieldByName('VALORREF').AsFloat;
    end;
    qryVirtual.Next;
  end;
 	qryVirtual.GotoBookmark(bmGuarda);
  qryVirtual.enablecontrols;
end;

procedure TfrmFolhaExtra.qryVirtualAfterPost(DataSet: TDataSet);
Var dProvento,
    dDesconto,
    dTotalLiq : Double;
    bmGuarda  : TBookmark;
begin
  inherited;

  dProvento := 0;
  dDesconto := 0;
  (* Efetua o cálculo de rubricas do participante setado.*)
  bmGuarda := qryVirtual.GetBookmark;
  qryVirtual.First;
  While Not qryVirtual.Eof Do
  begin
    (* processa o cálculo enquanto for a mesma pessoa. *)
    if qryVirtual.FieldByName('IDPESSOA').AsInteger = iIdResponsavel then
    begin
      (* Cálculos "Normais" / IRRF *)
      if qryVirtual.FieldByName('FLGDESCONTO').AsInteger = 0 then
        dProvento := dProvento + qryVirtual.FieldByName('VALORREF').AsFloat
      else
        dDesconto := dDesconto + qryVirtual.FieldByName('VALORREF').AsFloat;
    end;
    qryVirtual.Next;
  end;
  (* Processa o líquido.*)
  dTotalLiq := dProvento - dDesconto;
  edtTotLiq.Text := FloatToStr(dTotalLiq);
  (* Verifica se o valor ficou negativo *)
  if dTotalLiq < 0 then
  begin
    edtTotLiq.Font.Color := clRed;
    If IncluiProv then
      ShowMessage('Não é permitido valor negativo!');
    qryVirtual.Delete;
  end
  else
  begin
    edtTotLiq.Font.Color := clBlack;
    (* Volta a posição da query *)
   	qryVirtual.GotoBookmark(bmGuarda);
  end;
  (* Mostra Informação da Rubrica na tela *)
  MostraInfRubrica;
end;

procedure TfrmFolhaExtra.btnConfereClick(Sender: TObject);
begin
  inherited;
  If Not pnlConfere.Visible then
    Confere;
end;

procedure TfrmFolhaExtra.BitBtn2Click(Sender: TObject);
begin
  inherited;
  dbgMostraPrevia.Visible:=False;
  pnlConfere.Visible := False;
end;

procedure TfrmFolhaExtra.cmbRecebedorCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If qryRecebedor.IsEmpty then
    Exit;
  // Alimenta variáveis
  iIdResponsavel  := qryRecebedor.FieldByName('IDFAVORECIDO').AsInteger;
  iFlgIsentoIRRF  := qryRecebedor.FieldByName('FLGISENTOIRRF').AsInteger;
  iNumDep         := qryRecebedor.FieldByName('NUMDEPIRRF').AsInteger;
  dDataNasc       := qryRecebedor.FieldByName('DATANASC').AsDateTime;
  edDataNasc.Date := dDataNasc;
  edNumDep.Text   := IntToStr(iNumDep);

  BuscaPlanoContabil;

  (* Localiza registro do recebedor na prévia *)
  LocalizaRegPrevia(True);
end;

procedure TfrmFolhaExtra.cmbMesChange(Sender: TObject);
begin
  inherited;
  PegaAnoMesReferencia;
end;

procedure TfrmFolhaExtra.cmbMesCobChange(Sender: TObject);
begin
  inherited;

  LimpaPrevia;
  PegaAnoMesCobranca;
end;

procedure TfrmFolhaExtra.SelecionaLotes;
Var sSql: String;
begin
  inherited;
  LimpaVariaveis;
  lbDescricao.Caption:='';
  lbDataFolha.Caption:='';
  dblkLote.Font.Color:=clBlack;
  dblkLote.Text:='';
  HabilitaPnl(False);
  sSql:='SELECT IDLOTE, MESREFERENCIA, DESCRICAO, DATAPAGAMENTO,'+
        ' '' - '' AS HIFEN '+
        'FROM CTRLINTERFACE '+
        'WHERE IDPESSOA = '+inttostr(iidfundacao)+' ';

  If sMesCobranca <> '' then
    sSql:=sSql+'AND (MESREFERENCIA = '+QuotedStr(sMesCobranca)+') ';

  sSql:=sSql+
    'AND (TIPO = ''B'') '+
    'AND (FLGIDATMP = 1) '+
    'AND (FLGVOLTATMP = 0) '+
    'AND (FLGTIPOFOLHA = 2) '+
    'ORDER BY MESREFERENCIA, IDLOTE';

  qryLotes.Close;
  qryLotes.Sql.Clear;
  qryLotes.Sql.Add(sSql);
  qryLotes.Open;

  If Not qryLotes.IsEmpty then
    sMesCobranca:=qryLotes.FieldByName('MESREFERENCIA').AsString
  else
  begin
    sMesCobranca:='';
    dblkLote.Font.Color:=clRed;
    dblkLote.Text:='Inexistente';
  end;
end;

Procedure TfrmFolhaExtra.ApagaRegPrevia;
begin
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add('DELETE FROM PREVIA'+
                 ' WHERE '+
                 ' (MESCOBRANCA = '+QuotedStr(sMesCobranca)+') AND'+
                 ' (IDLOTE = '+sIdLote+') AND'+
                 ' (IDPESSOA = '+IntToStr(iIdResponsavel)+') AND'+
                 ' (FLGTIPODESC IN (''T'',''I'',''K''))');
  qryAux.Close;
  try
    qryAux.ExecSql;
  except
    bErro:=True;
  end;
end;

Procedure TfrmFolhaExtra.MostraRegPrevia;
begin
  (* Apaga o conteúdo da qryVirtual *)
  qryVirtual.Close;
  qryVirtual.Open;
  (* Lança os dados na qryVirtual *)
  qryPrevia.First;
  While Not qryPrevia.Eof do
  begin
    qryVirtual.Insert;
    qryVirtual.FieldByName('NOME').AsString             := cmbRecebedor.Text;
    qryVirtual.FieldByName('IDPESSOA').AsInteger        := qryPrevia.FieldByName('IDPESSOA').AsInteger;
    qryVirtual.FieldByName('IDTITULAR').AsInteger       := qryPrevia.FieldByName('IDTITULAR').AsInteger;
    qryVirtual.FieldByName('CODPROVDESC').AsString      := qryPrevia.FieldByName('IDRUBRICA').AsString;
    qryVirtual.FieldByName('IDRUBRICA').AsInteger       := qryPrevia.FieldByName('IDRUBRICA').AsInteger;
    qryVirtual.FieldByName('IDPESSJUR').AsInteger       := qryPrevia.FieldByName('IDPESSJUR').AsInteger;
    qryVirtual.FieldByName('IDPLANOPREV').AsInteger     := qryPrevia.FieldByName('IDPLANOPREV').AsInteger;
    qryVirtual.FieldByName('IDRESPONSAVEL').AsInteger   := qryPrevia.FieldByName('IDPESSOA').AsInteger;
    qryVirtual.FieldByName('FLGDESCONTO').AsInteger     := qryPrevia.Fieldbyname('FLGDESCONTO').AsInteger;
    qryVirtual.FieldByName('FLGIRRF').AsInteger         := qryPrevia.Fieldbyname('FLGIRRF').AsInteger;
    qryVirtual.FieldByName('CODIRRFDARF').AsString      := qryPrevia.Fieldbyname('CODIRRFDARF').AsString;
    qryVirtual.FieldByName('VALORREF').AsFloat          := qryPrevia.Fieldbyname('VALORPROVENTO').AsFloat;
    qryVirtual.FieldByName('VALORINFO').AsFloat         := qryPrevia.Fieldbyname('VALORINFO').AsFloat;
    qryVirtual.FieldByName('DATAPAGTO').AsString        := sDataFolha;
    qryVirtual.FieldByName('MESREFERENCIA').AsString    := qryPrevia.Fieldbyname('MES').AsString;
    qryVirtual.FieldByName('FLGISENTOIRRF').AsInteger   := iFlgIsentoIRRF;
    qryVirtual.FieldByName('DATANASC').AsDateTime       := dDataNasc;
    qryVirtual.FieldByName('TIPO').AsString             := qryPrevia.FieldByName('FLGTIPODESC').AsString;
    qryVirtual.FieldByName('NUMDEP').AsInteger          := iNumDep;
    qryVirtual.FieldByName('CODPORTFORMA').AsInteger    := qryPrevia.FieLdByName('CODPORTFORMA').AsInteger;
    qryVirtual.FieldByName('INCLUIDO').AsInteger        := qryPrevia.FieLdByName('INCLUIDO').AsInteger;
    qryVirtual.FieldByName('IDPLANOORIGEM').AsInteger   := qryPrevia.FieldByName('IDPLANOORIGEM').AsInteger;
    qryVirtual.FieldByName('IDPLANOCONTABIL').AsInteger := qryPrevia.FieldByName('IDPLANOCONTABIL').AsInteger;
    qryVirtual.FieldByName('IDPERFILINVEST').AsInteger  := qryPrevia.FieldByName('IDPERFILINVEST').AsInteger; // Andre Imakawa - SIG 101624

    If sCodDarfLancado = '' Then 
      sCodDarfLancado   := qryRubrica.fieldbyname('CODIRRFDARF').AsString;      
    sCodFontePagadora := qryRubrica.fieldbyname('CODFONTEPAGADORA').AsString; 

    qryVirtual.Post;
    qryPrevia.Next;
  end; {While}
  qryVirtual.First;

  dbgRubricas.DataSource := Nil;
  dbgRubricas.DataSource := dsVirtual;
end;

Procedure TfrmFolhaExtra.LocalizaRegPrevia(MostraInf:Boolean);
begin
  qryVirtual.Close;
  qryVirtual.Open;
  qryPrevia.Close;
  qryPrevia.Sql.Clear;

  qryPrevia.Sql.Add('SELECT '+
                    ' IDPESSOA, IDRESPONSAVEL, IDTITULAR, IDRUBRICA,'+
                    ' MES, MESCOBRANCA, IDPESSJUR, IDPLANOPREV,'+
                    ' IDLOTE, FLGTIPODESC, VALORPROVENTO, FLGDESCONTO,'+
                    ' CODPORTFORMA, VALORINFO, VALORRECEBIDO, FLGIRRF,'+
                    ' CODIRRFDARF, SEQRUBRICA, ''1'' AS INCLUIDO, '+
                    ' IDPLANOORIGEM, IDPLANOCONTABIL, IDPERFILINVEST '+ // Andre Imakawa - SIG 101624
                    ' FROM PREVIA '+
                    ' WHERE '+
                    ' (IDLOTE = '+sIdLote+') AND '+
                    ' (MESCOBRANCA  = '+QuotedStr(sMesCobranca)+') AND '+
                    ' (IDRESPONSAVEL = '+IntToStr(iIdResponsavel)+') AND '+
                    ' (FLGTIPODESC IN (''T'',''I'',''K'')) '+
                    ' ORDER BY SEQRUBRICA ');
  qryPrevia.Open;
  If Not qryPrevia.IsEmpty then
  begin
    (* Lança os dados da qryPrevia na qryVirtual *)
    MostraRegPrevia;
    (* Mostra Informação da Rubrica na tela *)
    If MostraInf then
      MostraInfRubrica;
  end;
end;

Procedure TfrmFolhaExtra.VerifCodIrrfDarf;
begin
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add('SELECT CODNATUREZA '+
                 ' FROM NATURENDIMENTO '+
                 ' WHERE CODNATUREZA = '+QuotedStr(sUltCodIrrfDarf));
  qryAux.Open;
  If qryAux.IsEmpty then
    sUltCodIrrfDarf:='';
  qryAux.Close;
end;

Procedure TfrmFolhaExtra.Alimenta;
Var sdata: string;
begin
  //Alimenta variáveis de controle.
  iUltIdTitular     := qryVirtual.FieldByName('IDTITULAR').AsInteger;
  iUltIdPessoa      := qryVirtual.FieldByName('IDPESSOA').AsInteger;
  iUltIdPlanoPrev   := qryVirtual.FieldByName('IDPLANOPREV').AsInteger;
  iUltIdRubrica     := qryVirtual.FieldByName('IDRUBRICA').AsInteger;
  iUltFlgDesconto   := qryVirtual.FieldByName('FLGDESCONTO').AsInteger;
  iUltIdPessJur     := qryVirtual.FieldByName('IDPESSJUR').AsInteger;
  iUltIdResponsavel := qryVirtual.FieldByName('IDRESPONSAVEL').AsInteger;
  iUltCodPortForma  := qryVirtual.FieldByName('CODPORTFORMA').AsInteger;
  sUltCodProvDesc   := qryVirtual.FieldByName('CODPROVDESC').AsString;
  sUltMesReferencia := qryVirtual.FieldByName('MESREFERENCIA').AsString;
  dUltValor	        := qryVirtual.FieldByName('VALORREF').AsFloat;
  iUltFlgIRRF       := qryVirtual.FieldByName('FLGIRRF').AsInteger;
  sUltCodIrrfDarf   := qryVirtual.FieldByName('CODIRRFDARF').AsString;
  If sUltCodIrrfDarf <> '' then
    VerifCodIrrfDarf;
  iUltIsentoIRRF    := qryVirtual.FieldByName('FLGISENTOIRRF').AsInteger;
  iNumDep           := qryVirtual.FieldByName('NUMDEP').AsInteger;
  iUltIdPlanoOrigem   := qryVirtual.FieldByName('IDPLANOORIGEM').AsInteger;
  iUltIdPlanoContabil := qryVirtual.FieldByName('IDPLANOCONTABIL').AsInteger;
  iUltIdPerfil        := qryVirtual.FieldByName('IDPERFILINVEST').AsInteger; // Andre Imakawa - SIG 101624

  try
    dUltDataNasc:=strTodate(qryVirtual.FieldByName('DATANASC').AsString);
  except
    bErro:=True;
  end;
  sMesReferencia:=sUltMesReferencia;
end; {Alimenta}

procedure TfrmFolhaExtra.IncluiPrevia;
Var
  iIdRubLancaIRRF: Integer;
  lrValorLiquido: real;
  lobjPortador: tObjPortadorForma;
  liseqdoc: integer;
  liidfavorec: integer;
  lsnumbanco, lsnumagencia, lsnomeagencia,
  lsnumconta, lstipoconta, lsidcbancaria: string;
  lbpagtoelet, lbDuplContaPref: boolean;
begin
  inherited;

  lldfloatpgto:=0;

  Try
    dDataFolha:=StrToDate(lbDataFolha.Caption);
  Except
    bErro:=True;
    Exit;
  end;

  qryVirtual.First;
  (* Alimenta Variaveis de Controle *)
  Alimenta;

  If CriaRecebedor(0, iIdFundacao, iIdPessJur,
     iIdPlanoPrev, iIdTitular, iIdResponsavel, StrToInt(sIdLote),
     iNumDep, iUltIsentoIRRF, 1, 0, iUltCodPortForma, lldfloatpgto,
     iIdPlanoOrigem, qryPlanoContabil.fieldbyname('IDPLANOPREV').asinteger,
     dUltDataNasc, objRecebedor) then
  begin
    If Assigned(objrecebedor) then
    begin
      lrValorLiquido := CalculaLiquido( qryVirtual.FieldByName('IDRESPONSAVEL').AsInteger);

      qryVirtual.First;
      ctrlBCP.DefinePortadorForma(iidtitular, iidresponsavel, iIdPessJur,
                                  2, 0, 0, iUltCodPortForma, 0,
                                  lsnumbanco, lsnumagencia, lsnomeagencia, lsnumconta,
                                  lstipoconta, lsidcbancaria,
                                  lbpagtoelet, lbDuplContaPref, liidfavorec,
                                  lrValorLiquido,
                                  liseqdoc,
                                  lobjPortador);

      objrecebedor.ifavdoc:=liidfavorec;
      objrecebedor.iseqdocumento:=liseqdoc;

      While (Not qryVirtual.Eof) And (Not bErro) do
      begin
        If Not IsRubricaIRRF(iUltIdRubrica) then
        begin
          If dtmContabil.PegaParamCF(iIdpessJur,
                                     iIdPlanoPrev,
                                     iUltIdRubrica,
                                     iIdTitular,
                                     iIdResponsavel,
                                     sMesCobranca, lRefCF) then
          begin
            If iUltFlgDesconto = 0 then
            begin
              sPLACONTA:=lRefCF.PlaContaD;
              iCODSUBCONTA:=lRefCF.SubConta;
              sCODCENTROCUSTO:=lRefCF.CentroCustoD;
            end
            else
            begin
              sPLACONTA:=lRefCF.PlaContaC;
              iCODSUBCONTA:=lRefCF.SubConta;
              sCODCENTROCUSTO:=lRefCF.CentroCustoC;
            end;
          end;

          If Not objRecebedor.IdentificaInsereRubrica(iIdResponsavel,
                                                      iIdResponsavel, {Favorecido}
                                                      0, {llidbeneficio}
                                                      iUltIdRubrica,
                                                      prmidmotivofolhaben, {IdMotivo}
                                                      0, 0, 0,
                                                      1, {Fonte Pagadora}
                                                      1, 0, 0, iidFundacao,
                                                      'T',  { T ou I }
                                                      dUltValor, {verificar}
                                                      dUltValor,
                                                      0,
                                                      sIdLote, {Ver se  o numero da versao é o idlote da ctrlinterface}
                                                      sMesReferencia,
                                                      sUltCodIrrfDarf,
                                                      'P', lRefCF.CodTipRecDes, sCODCENTROCUSTO,
                                                      lRefCF.CentroRespon, inttostr(lRefCF.UnidNegoc),
                                                      sPlaConta, '', '', 0, 0,
                                                      StrToInt(sIdLote),0,
                                                      qryVirtual.fieldbyname('IDPLANOCONTABIL').asinteger,
                                                      qryVirtual.fieldbyname('IDPERFILINVEST').asinteger // Andre Imakawa - SIG 101624
                                                      ) then
            bErro:=True;
        end;

        qryVirtual.Next;
        (* Alimenta Variaveis de Controle *)
        If Not bErro then
          Alimenta;
      end; {While}

      If (Not bErro)And(qryVirtual.Eof) then
      begin
        If sCodDarfLancado = '3223' Then
          iIdRubLancaIRRF := prmIdRubIRRFResg;

        If sCodDarfLancado = '0561' Then
          If sCodFontePagadora = '1' Then
          Begin
            If cmbMes.ItemIndex = 12 Then
              iIdRubLancaIRRF := prmIDRUBIRRFABONO
            Else
              iIdRubLancaIRRF := prmIdRubricaIRRF;
          End
          Else
          Begin
            If cmbMes.ItemIndex = 12 Then
              iIdRubLancaIRRF := SistemaFolha.IdRubIRRFINSSAbono
            Else
              iIdRubLancaIRRF := prmIDRUBIRRFINSS;
          End;

        objrecebedor.DeterminaBasesIRRF;
        objrecebedor.CalculoIRRF(sMesCobranca, dDataFolha, 0,
                                 iIdRubLancaIRRF, sCodDarfLancado); 
        objrecebedor.VerificaMargemDesconto;
        objrecebedor.EfetivaRubricas(qryRubricaGravar,
                                     sMesCobranca, dDataFolha);
      end
      else
        bErro:=True;

      If Assigned(objRecebedor) then
      begin
        objRecebedor.free;
        objRecebedor:=nil;
      end;
    end 
    else 
      bErro:=True; {Assigned}
  end 
  else 
    bErro:=True; {CriaRecebedor}
end; {IncluiPrevia}

procedure TfrmFolhaExtra.CarregaLista;
var K: Integer;
    ssql: String;
begin
  lstRubricasIRRF.Clear;
  // IRRF FUNDACAO
  If prmIDrubricaIRRF > 0 then
    lstRubricasIRRF.add(inttostr(prmIDrubricaIRRF));
  // IRRF ABONO FUNDACAO
  If prmIDrubirrfabono > 0 then
    lstRubricasIRRF.add(inttostr(prmIDrubirrfabono));
  // IRRF INSS
  If prmIDrubirrfinss > 0 then
    lstRubricasIRRF.add(inttostr(prmIDrubirrfinss));
  // IRRF RESGATE DE RESERVA
  If prmIDrubirrfresg > 0 then
    lstRubricasIRRF.add(inttostr(prmIDrubirrfresg));
  // IRRF ABONO INSS
  If SistemaFolha.IDRUBIRRFINSSABONO > 0 then
    lstRubricasIRRF.add(inttostr(SistemaFolha.IDRUBIRRFINSSABONO));
  For K := 0 to lstRubricasIRRF.count-1 do
  begin
    qryBuscarubrica.close;
    qryBuscaRubrica.sql.clear;
    sSql:='SELECT ';
    If SistemaFolha.FlgUsaCodRubExt = 0 then
      sSql:=sSql+' IDPROVENTO, DESCRICAO, IDPROVENTO AS CODIGOINT, '
    else
      sSql:=sSql+' CODPROVDESC AS IDPROVENTO, DESCRPROVDESC AS DESCRICAO, IDPROVENTO AS CODIGOINT, ';
    sSql:=sSql+' CODIRRFDARF FROM PROVDESC ';
    ssql:=ssql+'WHERE IDPROVENTO = ' +lstrubricasirrf[K]+' ';
    qryBuscarubrica.sql.add(ssql);
    qryBuscaRubrica.Open;
    If not qryBuscaRubrica.eof then
    begin
      qryRubricasIRrf.Insert;
      qryRubricasIRRF.fieldbyname('IDPROVENTO').asString := qryBuscarubrica.fieldbyname('IDPROVENTO').asString;
      qryRubricasIRRF.fieldbyname('DESCRICAO').asString  := qryBuscarubrica.fieldbyname('DESCRICAO').asString;
      qryRubricasIRRF.fieldbyname('CODIRRFDARF').asString  := qryBuscarubrica.fieldbyname('CODIRRFDARF').asString;
      qryRubricasIRRF.fieldbyname('CODIGOINT').asInteger  := qryBuscarubrica.fieldbyname('CODIGOINT').asInteger;
      qryRubricasIRRF.Post;
    end;
  end;
end;

procedure TfrmFolhaExtra.bbtnProcessarClick(Sender: TObject);
Var sMes, ssSql : String;
fValorLiq : Double; //Renato Visoni SOL 107642 Kintana 591128
iIdTitular : integer;
qryConsulta: TwwQuery;
begin
  Try


    //Renato Visoni SOL 126263 Kintana 658083
    if not dtmbasedados.dbBaseDados.InTransaction
     then dtmBaseDados.dbBaseDados.StartTransaction;
    //Renato Visoni SOL 126263 Kintana 658083


    //Renato Visoni SOL 107642 Kintana 591128
    try
      fValorLiq := 0;

      if edtTotLiq.Text <> '' then fValorLiq := strToFloat(edtTotLiq.Text);

      If SistemaFolha.VlrMaxLimiteFolhaExtra < fValorLiq Then Begin
        MessageDlg('O valor líquido das rubricas lançadas excedeu o limite de pagamento estipulado.'+#13+'O limite de pagamento estipulado é de R$ '+ FormatFloat('##,###0.00',(SistemaFolha.VlrMaxLimiteFolhaExtra)), mtWarning, [mbOK], 0);
        Atualizar := False;
        edtMatricula.OnExit(Sender);
        Exit;
      End;
    except
    end;
    //Renato Visoni SOL 107642 Kintana 591128

    If edtImportacao.Text = '' Then
    Begin
      If (FolhaPreviaObj = Nil) Then
        FolhaPreviaObj := TFolhaPreviaObj.Create('');

      sMes := IntToStr(cmbMesCob.ItemIndex + 1);    //CPrev - 27839
      If length(sMes) = 1 Then sMes := '0' + sMes;  //CPrev - 27839

      FolhaPreviaObj.IDFundacao             := iIdFundacao;
      FolhaPreviaObj.IDLote                 := qryLotes.FieldByName('IDLOTE').AsInteger;
      FolhaPreviaObj.VlrMaxLimiteFolhaExtra := SistemaFolha.VlrMaxLimiteFolhaExtra;
      FolhaPreviaObj.MesCobranca            := sMesCobranca;     // SOL:104837 Daniel Begnami  //spnedAno.Text + '/' + sMes;
      FolhaPreviaObj.DataPagamento          := qryLotes.FieldByName('DATAPAGAMENTO').AsDateTime;
      FolhaPreviaObj.CodFontePagadora       := '1';

      If edtImportacao.Text = '' Then
      Begin
      //  qryVirtual.DisableControls;  //CPrev - 28031

        qryVirtual.First;
        While Not qryVirtual.Eof do
        Begin
          iIdTitular                         := qryVirtual.FieldByName('IDTITULAR').AsInteger;
          FolhaPreviaObj.IDTitular           := qryVirtual.FieldByName('IDTITULAR').AsInteger;
          FolhaPreviaObj.MesReferencia       := qryVirtual.FieldByName('MESREFERENCIA').AsString;
          FolhaPreviaObj.IDRecebedor         := qryVirtual.FieldByName('IDRESPONSAVEL').AsInteger;
          FolhaPreviaObj.IDRubrica           := qryVirtual.FieldByName('IDRUBRICA').AsInteger;
          FolhaPreviaObj.CodPortForma        := qryVirtual.FieldByName('CODPORTFORMA').AsInteger;
          FolhaPreviaObj.IDPlanoPrevContabil := qryVirtual.FieldByName('IDPLANOCONTABIL').AsInteger;
          FolhaPreviaObj.IDPlanoPrevPrev     := iIdPlanoPrev; // Andre Imakawa - SIG 67136 // Andre Imakawa - SIG 65767
          FolhaPreviaObj.Valor               := qryVirtual.FieldByName('VALORREF').AsFloat;
          FolhaPreviaObj.IDPerfil            := qryVirtual.FieldByName('IDPERFILINVEST').AsInteger; // Andre Imakawa - SIG 101624
          FolhaPreviaObj.GravaLinha;

          qryVirtual.Next;
        End;

        If qryVirtual.Eof Then
        Begin
          FolhaPreviaObj.ApagaRegPrevia(iIdResponsavel);
        End;

      //  qryVirtual.EnableConstraints; //CPrev - 28031
      End;
    End;

    FolhaPreviaObj.IncluirPrevia;


    // Andre Imakawa - SIG 81798 - Inicio

    qryConsulta := TwwQuery.Create(Application);
    qryConsulta.DataBaseName := 'BaseDados';
    qryConsulta.Close;
    qryConsulta.Sql.Clear;
    ssSql := ' SELECT IDLOGEXPREVIA FROM CM.LOG_EXCLUSAO_PREVIA B  WHERE B.IDLOTE  = ' + qryLotes.FieldByName('IDLOTE').AsString + ' AND IDTITULAR IN(SELECT D.IDPESSOA FROM DEPENTIT D WHERE D.MATRICULA = '+QuotedStr(edtMatricula.text) + ' )';
    qryConsulta.Sql.Add(ssSql);
    qryConsulta.Open;

    if not(qryConsulta.Eof) then
    begin

      while not(qryConsulta.eof) do
      begin
        try
          qryAux.Close;
          qryAux.Sql.Clear;
          ssSql := ' DELETE FROM CM.LOG_EXCLUSAO_PREVIA B  WHERE B.IDLOGEXPREVIA  = ' + qryConsulta.FieldByName('IDLOGEXPREVIA').AsString ;
          qryAux.Sql.Add(ssSql);
          qryAux.ExecSQL;
        except
          MsgDlg('Erro ao apagar a estrutura LOG_EXCLUSAO_PREVIA', 'ERRO', mtError, mbOKCancel, 0);
          Atualizar := False;
          if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.RollBack;
          FreeAndNil(qryConsulta);
          exit;
        end;
        qryConsulta.Next;
      end;

    end;



    qryConsulta.Close;
    qryConsulta.Sql.Clear;
    ssSql := ' SELECT IDLOGALTPREVIA  FROM CM.LOG_ALT_PREVIA B  WHERE B.IDLOTE  = ' + qryLotes.FieldByName('IDLOTE').AsString + ' AND IDTITULAR IN(SELECT D.IDPESSOA FROM DEPENTIT D WHERE D.MATRICULA = '+QuotedStr(edtMatricula.text) + ' )';
    qryConsulta.Sql.Add(ssSql);
    qryConsulta.Open;

    if not(qryConsulta.Eof) then
    begin
      
      while not(qryConsulta.eof) do
      begin
        try
          qryAux.Close;
          qryAux.Sql.Clear;
          ssSql := ' DELETE FROM CM.LOG_ALT_PREVIA B  WHERE B.IDLOGALTPREVIA  = ' + qryConsulta.FieldByName('IDLOGALTPREVIA').AsString;
          qryAux.Sql.Add(ssSql);
          qryAux.ExecSQL;
        except
          MsgDlg('Erro ao apagar a estrutura LOG_ALT_PREVIA', 'ERRO', mtError, mbOKCancel, 0);
          Atualizar := False;
          if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.RollBack;
          FreeAndNil(qryConsulta);
          exit;
        end;
        qryConsulta.Next;
      end;

    end;


    qryConsulta.Close;
    qryConsulta.Sql.Clear;
    ssSql := ' SELECT IDOBS FROM CM.OBS_PREVIA_BASEPGTO OBA '+ #13#10 +
             ' WHERE EXISTS (SELECT 1 FROM CM.LOG_ALT_BASEPGTO BA '+ #13#10 +
             ' WHERE BA.IDOBS = OBA.IDOBS                         '+ #13#10 +
             ' AND EXISTS (SELECT 1  FROM BASEDEPAGAMENTO B WHERE B.IDBASEPGTO = BA.IDBASEPGTO '+ #13#10 +
             ' AND B.IDLOTE  = '+ qryLotes.FieldByName('IDLOTE').AsString + ' AND B.MATRICULA = '+QuotedStr(edtMatricula.text)+'  ))';
    qryConsulta.Sql.Add(ssSql);
    qryConsulta.Open;

    if not(qryConsulta.Eof) then
    begin
      
      while not(qryConsulta.eof) do
      begin
        try
          qryAux.Close;
          qryAux.Sql.Clear;
          ssSql := ' DELETE FROM CM.OBS_PREVIA_BASEPGTO B  WHERE B.IDOBS  = ' + qryConsulta.FieldByName('IDOBS').AsString;
          qryAux.Sql.Add(ssSql);
          qryAux.ExecSQL;
        except
          MsgDlg('Erro ao apagar a estrutura OBS_PREVIA_BASEPGTO', 'ERRO', mtError, mbOKCancel, 0);
          Atualizar := False;
          if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.RollBack;
          FreeAndNil(qryConsulta);
          exit;
        end;
        qryConsulta.Next;
      end;

    end;


    qryConsulta.Close;
    qryConsulta.Sql.Clear;
    ssSql := ' SELECT IDLOALTBASEPGTO FROM CM.LOG_ALT_BASEPGTO BA '+ #13#10 +
             ' WHERE EXISTS (SELECT 1  FROM BASEDEPAGAMENTO B WHERE B.IDBASEPGTO = BA.IDBASEPGTO '+ #13#10 +
             ' AND B.IDLOTE  = '+ qryLotes.FieldByName('IDLOTE').AsString + ' AND B.MATRICULA = '+QuotedStr(edtMatricula.text)+'   )';
    qryConsulta.Sql.Add(ssSql);
    qryConsulta.Open;

    if not(qryConsulta.Eof) then
    begin
      
      while not(qryConsulta.eof) do
      begin
        try
          qryAux.Close;
          qryAux.Sql.Clear;
          ssSql := ' DELETE FROM CM.LOG_ALT_BASEPGTO B  WHERE B.IDLOALTBASEPGTO  = ' + qryConsulta.FieldByName('IDLOALTBASEPGTO').AsString;
          qryAux.Sql.Add(ssSql);
          qryAux.ExecSQL;
        except
          MsgDlg('Erro ao apagar a estrutura LOG_ALT_BASEPGTO', 'ERRO', mtError, mbOKCancel, 0);
          Atualizar := False;
          if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.RollBack;
          FreeAndNil(qryConsulta);
          exit;
        end;
        qryConsulta.Next;
      end;

    end;


    qryConsulta.Close;
    qryConsulta.Sql.Clear;
    ssSql := ' SELECT IDBASEPGTOAPOIO FROM CM.BASEDEPAGAMENTOAPOIO BA '+ #13#10 +
             ' WHERE EXISTS (SELECT 1  FROM BASEDEPAGAMENTO B WHERE B.IDBASEPGTO = BA.IDBASEPGTO '+ #13#10 +
             ' AND B.IDLOTE  = '+ qryLotes.FieldByName('IDLOTE').AsString + ' AND B.MATRICULA = '+QuotedStr(edtMatricula.text)+'   )';
    qryConsulta.Sql.Add(ssSql);
    qryConsulta.Open;

    if not(qryConsulta.Eof) then
    begin
      
      while not(qryConsulta.eof) do
      begin
        try
          qryAux.Close;
          qryAux.Sql.Clear;
          ssSql := ' DELETE FROM CM.BASEDEPAGAMENTOAPOIO B  WHERE B.IDBASEPGTOAPOIO  = ' + qryConsulta.FieldByName('IDBASEPGTOAPOIO').AsString;
          qryAux.Sql.Add(ssSql);
          qryAux.ExecSQL;
        except
          MsgDlg('Erro ao apagar a estrutura BASEDEPAGAMENTOAPOIO', 'ERRO', mtError, mbOKCancel, 0);
          Atualizar := False;
          if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.RollBack;
          FreeAndNil(qryConsulta);
          exit;
        end;
        qryConsulta.Next;
      end;

    end;

    // Andre Imakawa - SIG 99651 - Inicio
    qryConsulta.Close;
    qryConsulta.Sql.Clear;
    ssSql := ' SELECT IDBASEPGTOREINF FROM CM.BASEDEPAGAMENTOREINF BA '+ #13#10 +
             ' WHERE EXISTS (SELECT 1  FROM BASEDEPAGAMENTO B WHERE B.IDBASEPGTO = BA.IDBASEPGTO '+ #13#10 +
             ' AND B.IDLOTE  = '+ qryLotes.FieldByName('IDLOTE').AsString + ' AND B.MATRICULA = '+QuotedStr(edtMatricula.text)+'   )';
    qryConsulta.Sql.Add(ssSql);
    qryConsulta.Open;

    if not(qryConsulta.Eof) then
    begin
      
      while not(qryConsulta.eof) do
      begin
        try
          qryAux.Close;
          qryAux.Sql.Clear;
          ssSql := ' DELETE FROM CM.BASEDEPAGAMENTOREINF B  WHERE B.IDBASEPGTOREINF  = ' + qryConsulta.FieldByName('IDBASEPGTOREINF').AsString;
          qryAux.Sql.Add(ssSql);
          qryAux.ExecSQL;
        except
          MsgDlg('Erro ao apagar a estrutura BASEDEPAGAMENTOREINF', 'ERRO', mtError, mbOKCancel, 0);
          Atualizar := False;
          if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.RollBack;
          FreeAndNil(qryConsulta);
          exit;
        end;
        qryConsulta.Next;
      end;

    end;
    // Andre Imakawa - SIG 99651 - Fim

    qryConsulta.Close;
    qryConsulta.Sql.Clear;
    ssSql := 'SELECT IDBASEPGTO FROM CM.BASEDEPAGAMENTO B  WHERE B.IDLOTE  = ' + qryLotes.FieldByName('IDLOTE').AsString + ' AND B.MATRICULA = '+QuotedStr(edtMatricula.text);
    qryConsulta.Sql.Add(ssSql);
    qryConsulta.Open;

    if not(qryConsulta.Eof) then
    begin
      
      while not(qryConsulta.eof) do
      begin
        try
          qryAux.Close;
          qryAux.Sql.Clear;
          ssSql := ' DELETE FROM CM.BASEDEPAGAMENTO B  WHERE B.IDBASEPGTO  = ' + qryConsulta.FieldByName('IDBASEPGTO').AsString;
          qryAux.Sql.Add(ssSql);
          qryAux.ExecSQL;
        except
          MsgDlg('Erro ao apagar a estrutura BASEDEPAGAMENTO', 'ERRO', mtError, mbOKCancel, 0);
          Atualizar := False;
          if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.RollBack;
          FreeAndNil(qryConsulta);
          exit;
        end;
        qryConsulta.Next;
      end;

    end;

    // Andre Imakawa - SIG 81798 - Fim

    //SOL 207789/16579 PPM 543916 Inicio
    qryAux.Close;
    qryAux.Sql.Clear;
    ssSql:=' INSERT INTO BASEDEPAGAMENTO (IDBASEPGTO,IDTITULAR,IDPESSOA,IDRESPONSAVEL,IDRECEBEPGTO,MATRICULA,DATAPAGAMENTO,' + #13#10 + //Rafael SIG 92076
          '                             MES,MESCOBRANCA,BASECALCIRREGRESSIVO,VLRIRREGRESSIVO,' + #13#10 +
          '                             VLRBRUTO,' + #13#10 +
          '                             VLRDESCONTO,' + #13#10 +
          '                             VLRLIQUIDO,' + #13#10 +
          '                             TIPOFOLHA,FLGRISCO,FLGEFETIVADO,IDHSTFOLHABENEF,FLGISENTOIRRF,' + #13#10 +
          '                             FLGMOLESTIAGRAVE,DATAINICIOMOLESTIA,DATAFIMMOLESTIA,FLGSOMAIRSUPINSS,NUMDEPIRRF,' + #13#10 +
          '                             NUMBANCO,NUMAGENCIA,CONTACORRENTE,' + #13#10 +
          '                             DATANASC,CODPORTFORMA,NUMDOCUMENTO,IDLOTE)' + #13#10 +
          'SELECT CM.SEQIDBASEPGTOPREVIA.NEXTVAL,' + #13#10 +
          '       P.*' + #13#10 +
          'FROM (select P.IDTITULAR,P.IDPESSOA,P.IDRESPONSAVEL,P.IDRECEBEPGTO,'+QuotedStr(edtMatricula.text)+',P.DATAPAGAMENTO,' + #13#10 +        //Rafael SIG 92076
          '             P.MESCOBRANCA AS MES,P.MESCOBRANCA,0 BASECALCIRREGRESSIVO,0 VLRIRREGRESSIVO,' + #13#10 +
          '             SUM(DECODE(P.FLGDESCONTO,0,P.VALORPROVENTO,-P.VALORPROVENTO)) VLRBRUTO,' + #13#10 +
          '             0 VLRDESCONTO,' + #13#10 +
          '             SUM(DECODE(P.FLGDESCONTO,0,P.VALORPROVENTO,-P.VALORPROVENTO)) VLRLIQUIDO,' + #13#10 +
          '             C.FLGRESGATE TIPOFOLHA,0 FLGRISCO,0 FLGEFETIVADO,NULL IDHSTFOLHABENEF,PF.FLGISENTOIRRF,' + #13#10 +
          '             PF.FLGMOLESTIAGRAVE,PF.DATAMOLESTIAGRAVE DATAINICIOMOLESTIA,PF.DATAFIMMOLESTIA,PF.FLGSOMAIRSUPINSS,PF.NUMDEPIRRF,' + #13#10 +
          '             P.NUMBANCO,P.NUMAGENCIA,P.CONTACORRENTE,' + #13#10 +
          '             PF.DATANASC,P.CODPORTFORMA,NULL NUMDOCUMENTO,P.IDLOTE' + #13#10 +
          '      from previa p' + #13#10 +
          '           join pessoafisica pf on p.idpessoa = pf.idpessoa' + #13#10 +
          '           join ctrlinterface c on p.idlote = c.idlote' + #13#10 +
          '      where p.idlote = '+ qryLotes.FieldByName('IDLOTE').AsString + #13#10 +
          '      AND   P.IDTITULAR = '+ Inttostr(iIdTitular) + #13#10 +
          '      GROUP BY P.IDTITULAR,P.IDPESSOA, P.IDRESPONSAVEL,P.IDRECEBEPGTO, P.MATRICULA, P.DATAPAGAMENTO, P.MESCOBRANCA,' + #13#10 +  //Rafael SIG 92076
          '               P.NUMBANCO,P.NUMAGENCIA,P.CONTACORRENTE,' + #13#10 +
          '               C.FLGRESGATE,PF.FLGISENTOIRRF,' + #13#10 +
          '               PF.DATAFIMMOLESTIA,PF.FLGSOMAIRSUPINSS,PF.NUMDEPIRRF,' + #13#10 +
          '               PF.FLGMOLESTIAGRAVE,PF.DATAMOLESTIAGRAVE,' + #13#10 +
          '               PF.DATANASC, P.IDLOTE, P.CODPORTFORMA) P';

    qryAux.Sql.Add(ssSql);
    try
       qryAux.ExecSQL;
    except  //SIG50629
       MsgDlg('Erro ao inserir na estrutura BASEDEPAGAMENTOAPOIO', 'ERRO', mtError, mbOKCancel, 0);
       Atualizar := False;
       if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.RollBack;
       exit;
    end;    //SIG50629

    qryAux.Close;
    qryAux.Sql.Clear;
    ssSql:= ' INSERT INTO BASEDEPAGAMENTOAPOIO (IDBASEPGTOAPOIO,' + #13#10 +
            '                                  IDBASEPGTO,' + #13#10 +
            '                                  TIPOOPCAOIR,' + #13#10 +
            '                                  IDBENEFICIO,' + #13#10 +
            '                                  IDPLANOPREV)' + #13#10 +
            'SELECT SEQBASEPAGAMENTOAPOIO.NEXTVAL,' + #13#10 +
            '       tmp.*' + #13#10 +
            'FROM (select distinct b.idbasepgto,' + #13#10 +
            '             nvl(ppp.tipoopcaoir,1) as tipoopcaoir,' + #13#10 +
            '             p.idbeneficio,' + #13#10 +
            '             p.idplanoprev' + #13#10 +
            '      from basedepagamento b' + #13#10 +
            '           inner join Previa p on (p.mes         = b.mes and' + #13#10 +
            '                             p.mescobranca = b.mescobranca and' + #13#10 +
            '                             p.idpessoa    = b.idpessoa  and' + #13#10 +
            '                             p.idTitular   = b.idTitular  and' + #13#10 +
            '                             p.idLote   = b.idLote' + #13#10 +
            '                            )' + #13#10 +
            '           inner join partprevplan ppp on (ppp.idpessoa = p.idpessoa and ppp.idplanoprev = p.idplanoprev)' + #13#10 +
            '       where p.idlote = '+ qryLotes.FieldByName('IDLOTE').AsString +' AND   P.IDTITULAR = '+ Inttostr(iIdTitular) + #13#10 +'  )   tmp';

    qryAux.Sql.Add(ssSql);
    try     //SIG50629
       qryAux.ExecSQL;
    except
       MsgDlg('Erro ao inserir na estrutura BASEDEPAGAMENTOAPOIO', 'ERRO', mtError, mbOKCancel, 0);
       Atualizar := False;
       if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.RollBack;
       exit;
    end;   //SIG50629
    // SOL 207789/16579 PPM 543916 final
    Atualizar := True;
    if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao; // Andre Imakawa - SIG 81798
    MsgDlg('Concluído com sucesso','Informação!',mtInformation,[mbOk,mbHelp],0);
    LimpaPrevia;

    memResult.Lines.Text := FolhaPreviaObj.MessageInfo;
  Except
    MsgDlg(FolhaPreviaObj.MessageInfo, 'ERRO', mtError, mbOKCancel, 0);
    Atualizar := False;

    if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.RollBack; //Renato Visoni SOL 126263 Kintana 658083

  End;

  FreeAndNil(FolhaPreviaObj);
  FreeAndNil(qryConsulta);
  //if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;//Renato Visoni SOL 126263 Kintana 658083  // Andre Imakawa - SIG 81798


end;

procedure TfrmFolhaExtra.dblkLoteCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
Var bInt: Byte;
    lsmsg: string;
begin
  inherited;
  if not VerificaRubricasIR(qryAux, lsmsg) then
  begin
    MsgDlg(
      'Foram identificados problemas de cadastro em algumas rubricas de IR.'+#13#10+
      'Favor verificar o LOG abaixo e efetuar o acerto no Cadastro de Rubricas.'+#13#10+
      '---------------------------------------------------------------'+#13#10+
      'ANÁLISE DO CADASTRO DE RUBRICAS PARA IR.'+#13#10+
      '---------------------------------------------------------------'+#13#10+
      lsmsg+#13#10+
      '---------------------------------------------------------------'+#13#10,
      'Erro', mtError, [mbOk, mbHelp], 0);
    exit;
  end;

  LimpaPrevia;
  LimpaVariaveis;
  lbDescricao.Caption:='';
  lbDataFolha.Caption:='';
  If (Not qryLotes.IsEmpty)And(sMesCobranca<>'') then
  begin
    sDataFolha:=qryLotes.FieldByName('DATAPAGAMENTO').AsString;
    try
      dDataFolha:=StrToDate(sDataFolha);
    except
      bErro:=True;
    end;
    sIdLote:=qryLotes.FieldByName('IDLOTE').AsString;
    lbDescricao.Caption:=qryLotes.FieldByName('DESCRICAO').AsString;
    lbDataFolha.Caption:=qryLotes.FieldByName('DATAPAGAMENTO').AsString;

    bInt:=StrToIntDef(Copy(qryLotes.FieldByName('MESREFERENCIA').AsString,6,2),0);
    Dec(bInt,1);
    If bInt In [0..11] then
      cmbMesCob.ItemIndex:=bInt;
    spnedAnoCob.Text:=Copy(qryLotes.FieldByName('MESREFERENCIA').AsString,1,4);

    HabilitaPnl(LoteValido);
    bbtnProcessar.Enabled:=False;
  end;

  // SOL104837 Daniel Begnami
  cmbMes.ItemIndex := cmbMesCob.ItemIndex;
  spnedAno.text    := spnedAnoCob.text;
  // FIM

end;

procedure TfrmFolhaExtra.spnedAnoCobChange(Sender: TObject);
begin
  inherited;
  LimpaPrevia;
  PegaAnoMesCobranca;
end;

procedure TfrmFolhaExtra.dbgRubricasDblClick(Sender: TObject);
begin
  inherited;

  (* Mostra Informação da Rubrica na tela *)
  MostraInfRubrica;
end;

procedure TfrmFolhaExtra.pnlDadosRubricaMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  HabilitaProcessar;
end;

procedure TfrmFolhaExtra.dbgRubricasMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;

  HabilitaProcessar;
end;

procedure TfrmFolhaExtra.bbtnProcessarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  HabilitaProcessar;
end;

procedure TfrmFolhaExtra.dbgRubricasCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;

  ABrush.Color := clWhite;
  AFont.Color  := clWindowText;
  If (qryVirtual.FieldByName('TIPO').AsString='I') Or
     (qryVirtual.FieldByName('TIPO').AsString='K') then
  begin
    ABrush.Color := $00CAFFFF;
    AFont.Color  := clWindowText;
  end;
end;

procedure TfrmFolhaExtra.bbtnProcessarKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  HabilitaProcessar;
end;

procedure TfrmFolhaExtra.BtnExibePreviaClick(Sender: TObject);
begin
  inherited;
  MostraPrevia;
  BtnExibePrevia.Enabled:=False;
end;

procedure TfrmFolhaExtra.edtMatriculaChange(Sender: TObject);
begin
  inherited;
  If (Atualizar)And(bbtnProcessar.Enabled) And (qryVirtual.IsEmpty) AND (pcTipoFolhaExtra.ActivePageIndex = 0) then
  begin
    Atualizar:=False;
    MsgDlg('Atenção! As informações não foram processadas para o recebedor: '+
           #13+qryVirtual.FieldByName('NOME').AsString,'Informação!',
           mtInformation,[mbOk,mbHelp],0);
  end;
  sCodDarfLancado := ''; 
end;

procedure TfrmFolhaExtra.bbtnSairClick(Sender: TObject);
begin
  If (Atualizar) And (bbtnProcessar.Enabled) And
     (Not qryVirtual.IsEmpty) then
  Begin
    if MsgDlg('Atenção! As informações não foram processadas para o recebedor '+
            #13+qryVirtual.FieldByName('NOME').AsString+'.  Deseja Continuar? ','Confirmacão!',
                mtConfirmation,[mbYes,mbNo],0) = mrNo then   Exit;
  end;
  inherited;
  lstRubricasIRRF.free;
  qryRubricasIRRF.close;
end;

procedure TfrmFolhaExtra.BuscaPlanoContabil;
Var
  sSql, sFlgMigrado : String;
  bErro             : Boolean;
  iIdCalculo        : LongInt;
  sIdSitPlanoPrev : string; 
  slistaplano: string;
  liplanopadrao: integer; 
begin
  slistaplano:=inttostr(iIdPlanoPrev)+',';
  slistaplano:=slistaplano+inttostr(iIdPlanoPrevPart)+','; 
  liplanopadrao:=iIdPlanoPrev; 

  If FazQuery(qryAux, 'SELECT DISTINCT '+
                      ' NVL(B.IDPLANOORIGEM, B.IDPLANOPREV) AS IDPLANOORIGEM, '+
                      ' B.IDPLANOPREV, '+ 
                      ' NVL(B.IDPLANPREVCONTAB, B.IDPLANOPREV) AS IDPLANPREVCONTAB '+ 
                      ' FROM TPPAGTOBENEFICIO T, BENEFBFCIARIO B '+
                      ' WHERE B.IDPESSOA = '+IntToStr(iIdResponsavel)+' AND '+
                      ' B.IDTITULAR = '+IntToStr(iIdTitular)+' AND '+ 
                      ' T.IDTPPAGTOBENEFIC = B.IDTPPAGTOBENEFIC AND '+
                      ' T.FLGFREQUENCIA <> ''U'' AND '+
                      ' B.IDSITBENEFICIO IN (1,2,4) AND '+
                      ' ((B.DATAFINAL IS NULL) OR (B.DATAFINAL > SYSDATE))') Then
  Begin
    iIdPlanoPrev     := qryAux.FieldByName('IDPLANOPREV').AsInteger; 
    iIdPlanoOrigem   := qryAux.FieldByName('IDPLANOORIGEM').AsInteger;
    iIdPlanoContabil := qryAux.FieldByName('IDPLANPREVCONTAB').AsInteger;
    liplanopadrao:=iIdPlanoContabil; 
  End
  Else
  begin
    iIdPlanoOrigem   := iIdPlanoPrev;
    iIdPlanoContabil := iIdPlanoPrev; 
  end;

  while not qryaux.eof do
  begin
    slistaplano:=slistaplano+qryAux.FieldByName('IDPLANPREVCONTAB').asstring+',';
    qryaux.next;
  end;

  if prmIdRgPlanPrevCont > 0 then
  begin
    if FazQuery(qryAux, ' SELECT IDSITPLANOPREV '+
                        ' FROM PARTPREVPLAN '+
                        ' WHERE IDPESSOA = '+IntToStr(iIdTitular)+
                        ' AND IDPLANOPREV = '+IntToStr(iIdPlanoPrev)) Then
      sIdSitPlanoPrev:=qryAux.fieldbyname('IDSITPLANOPREV').asstring
    else
      sIdSitPlanoPrev:='0';

    If FazQuery(qryAux, ' SELECT IDPLANOPREV FROM PARTPREVPLAN '+
                        ' WHERE IDPESSOA = '+IntToStr(iIdTitular)+
                        ' AND IDPLANOPREV <> '+IntToStr(iIdPlanoPrev)) Then
    begin
      sFlgMigrado := '1';
      slistaplano := slistaplano + qryAux.FieldByName('IDPLANOPREV').AsString + ',';
    end
    Else
      sFlgMigrado := '0';

    sSql := 'SELECT '+
            IntToStr(iIdResponsavel)  +  ' AS IDPESSOA, '+
            IntToStr(iIdTitular)      +  ' AS IDTITULAR, '+
            IntToStr(iIdPlanoPrev)    +  ' AS IDPLANOPREV, '+
            '0'                       +  ' AS IDBENEFICIO, '+
            '0'                       +  ' AS FLGFITESPECIAL, '+
            sIdSitPlanoPrev           +  ' AS IDSITPLANOPREV, '+
            sFlgMigrado               +  ' AS FLGMIGRADO ';

    try 
      //IDPLANPREVCONTAB
      iIdPlanoContabil := StrToInt(RegraNumerica( inttostr(prmIdRgPlanPrevCont),
                             sSQL+', ''IDPLANPREVCONTAB'' AS CAMPO FROM DUAL',
                             bErro, iIdCalculo ));
      slistaplano:=slistaplano+inttostr(iIdPlanoContabil)+',';
      liplanopadrao:=iIdPlanoContabil; 
    except
      MsgDlg('Regra retornou plano contábil inválido.'+#13#10+
        'Favor verificar com o TI',
        'Erro', mtError, [mbOk,mbHelp], 0);
      iIdPlanoContabil := iIdPlanoPrev; 
    end;
  End
  Else
    iIdPlanoContabil := iIdPlanoPrev;

  delete(slistaplano,length(slistaplano),1);
  MontaPlanoContabil(slistaplano);
  qryPlanoContabil.locate('IDPLANOPREV',liplanopadrao,[]);
  dblcPlanoContabil.text:=qryPlanoContabil.fieldbyname('NOME').asstring;
  // Andre Imakawa - SIG 101624 - Inicio
  MontaPerfil(slistaplano);

  //edilaine SIG131432 : inicio
  {Se Plano contabil =  2 (REPLAN NÃO SALDADO), perfil sempre deverá ser = 1 (PERFIL REG/REPLAN)
   Se Plano Contabil = 28 (REPLAN SALDADO),     perfil sempre deverá ser = 2 (PERFIL REPLAN SALDADO)
   Se Plano Contaibl = 66 (REB),                perfil sempre deverá ser = 5 (PERFIL REB ASSISTIDO)
   Se Plano Contabil = 74 (NOVO PLANO),         perfil sempre deverá ser = 7 (PERFIL NOVO PLANO ASSISTIDO)}
  qryPerfil.locate('IDPLANOPREV',liplanopadrao,[]);
  //edilaine SIG131432 : inicio

  dblcPerfil.text:=qryPerfil.fieldbyname('NOME').asstring;
  // Andre Imakawa - SIG 101624 - Fim
  btnAssociar.enabled:=not qryPlanoContabil.isempty;
end;

procedure TfrmFolhaExtra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ctrlBCP.free; 
end;

function TfrmFolhaExtra.BuscaPortadorForma(
  asPortadorForma: string): boolean;
begin
  result:=false;
  qryPortForma.first;
  While (not qryPortForma.Eof) and (cmbPortForma.Text = '') do
  begin
    If (qryPortForma.FieldByName('CODPORTFORMA').AsString = asPortadorForma) then
    begin
      cmbPortForma.LookupValue:=qryPortForma.FieldByName('CODPORTFORMA').AsString;
      cmbPortForma.Text:=qryPortForma.FieldByName('DESCRICAO').AsString;
      result:=true;
      exit;
    end;
    qryPortForma.Next;
  end; {While}
end;

procedure TfrmFolhaExtra.MontaPlanoContabil(aslistaplano: string);
var lssql: string;
begin
  lssql:= 'SELECT IDPLANOPREV, NOME '+
          'FROM PLANPREVCONTABIL ' +
          'WHERE FLGPROCESSAMENTOFB = ''S'' '; // SIG 63033 - Osni Cavalcante
  if aslistaplano <> '' then
    lssql := lssql + '  AND IDPLANOPREVPREV IN ('+ aslistaplano +') ';

  lssql := lssql+ 'ORDER BY NOME';

  FazQuery(qryPlanoContabil, lssql);
  dblcPlanoContabil.enabled:=true;
end;

procedure TfrmFolhaExtra.btImportacaoClick(Sender: TObject);
Var sLeArquivo    : String;
    sLinha        : String;
    FArquivo      : TextFile;
    I: integer;
begin
  inherited;

  If qryLotes.FieldByName('IDLOTE').AsInteger < 1 Then Exit;

  Try
    FolhaPreviaObj := TFolhaPreviaObj.Create(edtImportacao.Text);

    sMesReferencia := sMesCobranca;

    FolhaPreviaObj.IDFundacao             := iIdFundacao;
    FolhaPreviaObj.IDLote                 := qryLotes.FieldByName('IDLOTE').AsInteger;
    FolhaPreviaObj.VlrMaxLimiteFolhaExtra := SistemaFolha.VlrMaxLimiteFolhaExtra;
    FolhaPreviaObj.MesCobranca            := sMesCobranca;
    FolhaPreviaObj.DataPagamento          := qryLotes.FieldByName('DATAPAGAMENTO').AsDateTime;
    FolhaPreviaObj.CodFontePagadora       := '1';

    FolhaPreviaObj.FazImportacao;

    cdsPessoa.Data  := FolhaPreviaObj.CDSPessoa.Data;
    cdsRubrica.Data := FolhaPreviaObj.CDSRubrica.Data;

    memResult.Lines.Text := FolhaPreviaObj.MessageInfo;

    HabilitaProcessar;

    FolhaPreviaObj.AjustaDBGrid(dbgPessoa, dbgRubrica);
  Except
     MsgDlg(FolhaPreviaObj.MessageInfo, 'ERRO', mtError, mbOKCancel, 0);
  End;
end;

procedure TfrmFolhaExtra.dsPessoaDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;

  cdsRubrica.Filter := 'IDFUNDACAO  = ' + cdsPessoa.FieldByName('IDFUNDACAO').AsString + ' AND ' +
                       'IDPESSJUR   = ' + cdsPessoa.FieldByName('IDPESSJUR').AsString  + ' AND ' +
                       'IDTITULAR   = ' + cdsPessoa.FieldByName('IDTITULAR').AsString  + ' AND ' +
                       'IDRECEBEDOR = ' + cdsPessoa.FieldByName('IDRECEBEDOR').AsString;
  cdsRubrica.Filtered := True;   
end;

procedure TfrmFolhaExtra.sbtImportaArquivoClick(Sender: TObject);
begin
  inherited;

  If OpenDialog.Execute Then
  Begin
    edtImportacao.Text := OpenDialog.FileName;
  End;
end;

procedure TfrmFolhaExtra.bbtnSalvarClick(Sender: TObject);
begin
  inherited;

  If SaveDlg.Execute then
    memResult.Lines.SaveToFile(SaveDlg.FileName);
end;

procedure TfrmFolhaExtra.LimpaPrevia;
begin
  edtMatricula.Clear;
  edtInscricao.Clear;
  edtNome.Clear;

  cmbRecebedor.Clear;
  edDataNasc.Clear;
  edNumDep.Clear;

  edtCodRubrica.Clear;
  cmbRubrica.Clear;
  edtValor.Clear;
  cmbPortForma.Clear;

  cmbMes.ItemIndex := cmbMesCob.ItemIndex;
  //cmbMes.Text := '';
  //spnedAno.Clear;

  dblcPlanoContabil.Clear;
  dblcPerfil.Clear; // Andre Imakawa - SIG 101624
  edtTotLiq.Clear;

  edtImportacao.Clear;

  memResult.Lines.Clear;

  cdsPessoa.Close;
  cdsRubrica.Close;

  qryVirtual.Close;
  qryVirtual.Open;

  bbtnProcessar.Enabled := False;
end;

procedure TfrmFolhaExtra.pcTipoFolhaExtraChange(Sender: TObject);
begin
  inherited;
  LimpaPrevia;
end;
// Andre Imakawa - SIG 101624 - Inicio
procedure TfrmFolhaExtra.MontaPerfil(aslistaplano: string);
var lssql: string;
begin
  //lssql:= 'SELECT IDPERFILINVEST, IDPLANOPREV, NOME,  '+  //EDILAINE SIG131432
  lssql:= 'SELECT IDPERFILINVEST, NOME, DECODE(IDPLANPREVCONTAB, 28, IDPLANPREVCONTAB, IDPLANOPREV) AS IDPLANOPREV  '+  //edilaine SIG131432
          'FROM PERFILINVEST ' +
          'WHERE IDPLANOPREV IN ('+ aslistaplano +') '+
          '  AND FLGPADRAOINSS = 1';        //EDILAINE SIG131432

  lssql := lssql+ 'ORDER BY NOME';

  FazQuery(qryPerfil, lssql);
  dblcPerfil.enabled:=true;
end;
// Andre Imakawa - SIG 101624 - Fim

//edilaine SIG131432 : inicio
procedure TfrmFolhaExtra.dblcPlanoContabilChange(Sender: TObject);
begin
  inherited;
  if (qryPlanoContabil.active) and (qryPerfil.active) then
  begin
    qryPerfil.locate('IDPLANOPREV',qryPlanoContabil.fieldbyname('IDPLANOPREV').AsInteger,[]);
    dblcPerfil.text:=qryPerfil.fieldbyname('NOME').asstring;
  end;
end;
//edilaine SIG131432 : fim


///////////////////////////////////////////////////////////////////////////////////
//  Layout do arquivo de importação da folha extra
///////////////////////////////////////////////////////////////////////////////////
//
// Inicio - Fim - Tamanho - Formato                        - Descricao
// --------------------------------------------------------------------------------
//    1      10      10     Alfanumérico seguido de branco   Matricula do Titular
//   11      20      10     Numérico com zero a Esquerda     IDPessoa do Recebedor
//   21      30      10     Numérico com zero a Esquerda     IdRubrica
//   31      40      10     Numérico com zero a Esquerda     Valor
//   41      46       6     Alfanumérico 'mmyyyy'            MesReferencia
//
///////////////////////////////////////////////////////////////////////////////////



end.

{------------------------------------------------------------------------------|
| UNIT:                                                                        |
| DESCRIÇÃO FUNCIONAL:                                                         |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 17/01/2002 A 29/01/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12                                               |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: SIDNEI B. MARINS                                              |                                          |
| PERÍODO DE IMPLEMENTAÇÃO: DE 11/06/2002 A 25/06/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: ()                                                                  |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Modificação da Tela, Permitir Modificar os dados |
|   incluídos na prévia, Mudanças na rotina de inclusão na prévia, Mudanças    |
|   no uso da CtrlInterface, permitir o uso de código e nome externo de        |
|   rubricas conforme parametro já definido, permitir consulta dos dados       |
|   digitados no lote.                                                         |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: SIDNEI B. MARINS                                              |
| PERÍODO DE IMPLEMENTAÇÃO: DE 08/07/2002 A 08/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Acerto na inserção do CODIRRFDARF na Previa      |
|                             Criada procedure VerifCodIrrfDarf                |
|                             (constraint CM_R_6606)                           |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei B Marins                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE 30/07/2002 A 30/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (REFER)                                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Acerto na exibição das rubricas lançadas.        |
|  - Modificação para mostrar mensagem para alertar o usuário caso esqueça de  |
|     Processar as informações lançadas para o recebedor.                      |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 06/09/2002 A 06/09/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.14a                                              |
| CLIENTE: (REFER)                                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - NÃO OBRIGAR PORTADOR FORMA                                                 |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 14/11/2002 A 14/11/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (REFER)                                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    - Tirar a obrigatoriedade de colocar portadorforma, de ter que cadastrar  |
|    conta caso seja pagamento em cheque, por exemplo.                         |
|                                                                              |
|------------------------------------------------------------------------------|                                                                                   |
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 06/06/2003 A 06/06/2003                         |
| PENDÊNCIA: 14189                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.05e                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| COLOCAR FILTRO DO CAMPO IDMODULO DA FOLHA NAS CONSULTAS DA BANCOPORTORMA.    |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 11/07/2003 A 11/07/2003                         |
| PENDÊNCIA: 14512                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.07H                                              |
| CLIENTE: FCRT                                                                |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - NÃO APARECE NA COMBO DE RECEBEDORES PARTICIPANTES QUE NÃO POSSUEM REGISTROS|
| NA BFCIARIOTITPLAN. ACRESCENTADO UNION COM A PARTPREVPLAN NA QRYRECEBEDOR.   |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 18/07/2003 A 18/07/2003                         |
| PENDÊNCIA: 14602                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.04                                               |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ADAPTAÇÃO PARA MULTIFUNDACAO.                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 12/08/2003 A 12/08/2003                         |
| PENDÊNCIA: 13995                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.01b                                              |
| CLIENTE: REFER                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ADAPTAR PARA USAR OBJETO DE IRRF CUSTOMIZADO PARA TABELA DE IR HISTÓRICA.  |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 04/08/2004 A 04/08/2004                         |
| PENDÊNCIA: 17301                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - GRAVAR IDFAVDOC NA PREVIA. QUERY ALTERADAS QRYVIRTUAL E QRYRUBRICAGRAVAR.  |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 27/09/2004 A 27/09/2004                         |
| PENDÊNCIA: 17786                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.13j                                              |
| CLIENTE: REFER                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Não está aparecendo os consignatários de pensão alimentícia na lista de    |
| recebedores. A qryRecebedor do lookupcombo ficou com o parâmetro idpessoa    |
| indevido de foi retirado, vide campo PIDFAVOREC, na query abaixo.            |
| A clausula where com este campo foi alterada retirando o campo.              |
|                                                                              |

SELECT PP.IDPESSOA AS IDFAVORECIDO, P.NOME, PP.IDPESSOA, PF.DATANASC,
	      PF.FLGISENTOIRRF, PF.NUMDEPIRRF, 'B' AS TIPO
FROM PARTPREVPLAN PP, PESSOA P, PESSOAFISICA PF, PATRO PAT
WHERE PP.IDPESSOA    = :IDPESSOA
AND P.IDPESSOA       = PP.IDPESSOA
AND PF.IDPESSOA      = P.IDPESSOA
AND PAT.IDPESSOA     = PP.IDPESSJUR
AND PAT.IDFUNDACAO   = :PIDFUNDACAO
AND PP.IDPESSOA      = :PIDFAVOREC
UNION
SELECT BF.IDRESPONSAVEL AS IDFAVORECIDO, P.NOME, BF.IDTITULAR, PF.DATANASC,
	      PF.FLGISENTOIRRF, PF.NUMDEPIRRF, 'B' AS TIPO
FROM BFCIARIOTITPLAN BF, PESSOA P, PESSOAFISICA PF, PATRO PAT
WHERE BF.IDTITULAR   = :IDPESSOA
AND P.IDPESSOA       = BF.IDRESPONSAVEL
AND PF.IDPESSOA      = P.IDPESSOA
AND PAT.IDPESSOA     = BF.IDPESSJUR
AND PAT.IDFUNDACAO   = :PIDFUNDACAO
AND BF.IDRESPONSAVEL = :PIDFAVOREC
UNION
SELECT RI.IDFAVORECIDO AS IDFAVORECIDO, P.NOME, RI.IDPESSOA AS IDTITULAR,
	      PF.DATANASC, PF.FLGISENTOIRRF, PF.NUMDEPIRRF, 'P' AS TIPO
FROM RUBRICAINDIV RI, PESSOA P, PESSOAFISICA PF
WHERE RI.IDPESSOA    = :IDPESSOA
AND P.IDPESSOA       = RI.IDFAVORECIDO
AND PF.IDPESSOA      = P.IDPESSOA
AND RI.FLGPENSAOALIM = 1
AND RI.FLGTPRUBMANUT = 1
AND RI.IDEMPRESA     = :PIDFUNDACAO
AND RI.IDFAVORECIDO  = :PIDFAVOREC

|                                                                              |
| Este campo deve ter sido colocado em virtude de pendencia para seleção pela  |
| matricula de dependente. Entretanto, esta query não deveria ter sido altera- |
| da. O correto era fazer uma busca nesta pela matricula digitada, selecionan- |
| do a pessoa equivalente a matricula, com locate. Isto foi feito em outra te- |
| la, de emissão de segunda via do contracheque.                               |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 25/11/2004 A 25/11/2004                         |
| PENDÊNCIA: 18099                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.13v                                              |
| CLIENTE: REFER                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Não está aparecendo os consignatários de pensão alimentícia vinculados a   |
| pensionistas. A qryRecebedor do lookupcombo foi alterada para usar idtitular |
| no parâmetro.                                                                |
|                                                                              |
|------------------------------------------------------------------------------}


