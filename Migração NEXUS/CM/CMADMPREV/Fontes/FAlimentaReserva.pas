{-------------------------------------------------------------------------------
------------------------ HISTÓRICO DE ALTERAÇÕES -------------------------------
--------------------------------------------------------------------------------
Alteração  : (dfm dDtAlimentacao e edAnoMesRef)
             FormShow, qryReservaXPlanoAfterScroll, bbtnOkClick
Nº WO......: 17419
Data.......: 16/12/2024
Responsável: Edilaine
Descrição..: Habitar o campo Data Alimentação na Alimentação Coletiva
------------------------------------------------------------------------------
Alteração  : SpeedButton1Click
Nº WO......: 9432
Data.......: 22/03/2024
Responsável: Andre Imakawa
Descrição..: Alteração do \\FUNCEF.COM.BR\ARQUIVOS pasta Compartilhada
------------------------------------------------------------------------------
Alteração  : SpeedButton1Click
Nº WO......: 8381
Data.......: 28/02/2024
Responsável: Andre Imakawa
Descrição..: Alteração do ALTARF para \\FUNCEF.COM.BR\ARQUIVOS
------------------------------------------------------------------------------
Autor(a)  : Ewerton Beltramini
Pendência : SIG 84982
Data      : 16/11/2021
Descrição : Inclusão do campo observação na importação do arquivo.
--------------------------------------------------------------------------------
Autor(a)    : Rafael Vasconcelos
Pendência   : SIG 99737
Data        : 08/05/2020
Descrição   : Correção na data de recebimento e melhoria para informar o erro
              em tela.
--------------------------------------------------------------------------------
Autor(a)    : Ewerton Beltramini
Pendência   : SIG 98772
Data        : 09/03/2020
Descrição   : Implementando leiatura de arquivo em excel para realizar a
              importação de dados em lote.
--------------------------------------------------------------------------------
Autor(a)    : Darivaldo Alencar
Pendência   : SIG 19595
Data        : 26/04/2016
Descrição   : Corrigido layout de tela Reservas do participante, ativando:
              edAnoMesRef e dDtAlimentacao.
--------------------------------------------------------------------------------

Autor(a)    : Darivaldo Alencar
Pendência   : SOL 253577/17989  PPM 1198155
Data        : 08/04/2016
Descrição   : Apresentar campos necessários para inserir valores iniciais do
              déficit do Reg/Replan e criar relatório para apresentar o
              histórico de alimentação das reservas coletiva
--------------------------------------------------------------------------------
Autor(a)  : Felipe Azevedo dos Santos
Pendencia : SOL 192897 KTN 1835724
Data      : 17/01/2013
Alteração : INSERÇÃO DOS CAMPOS CONTRIBUICAO E OBSERVACAO
--------------------------------------------------------------------------------
Autor(a)  : Fernando Xavier
Pendencia : SOL 142663 Kintana 915068
Data      : 20/12/2010
Alteração : INSERIR CAMPO DATAALIMENTAÇÃO NA TELA DE ALIMENTAÇÃO DE RESERVA
            MANUAL DO PARTICIPANTE
--------------------------------------------------------------------------------
Autor(a)  : Claudio Faria
Data      : 16/08/2007
Rotina    : Varias
Pendencia : 19962
Alteração : Troca do DateToStr para FormatDateTime.
--------------------------------------------------------------------------------
Autor(a)  : André Pontes
Data      : 17/05/2007
Rotina    : bbtnProcurarClick(...)
Pendencia : 25315
Alteração : Controle de retorno do MontaSelect. Não retornando, nada faz, para
            evitar erro.
--------------------------------------------------------------------------------
Autor(a)  : André Pontes
Data      : 20/10/2006
Rotina    : CriaReservaPatroColetiva
Pendencia : 23563
Alteração : Gravação do campo IDPARTICIPANTE no insert na ReservaPart
--------------------------------------------------------------------------------
Autor(a)  : Claudio Faria
Data      : 25/09/2006
Rotina    : MontaPainelValoresCotas, MontaPainelValoresIndexados
Pendencia : 19644 (Reabertura)
Alteração : Correção da pendencia 19644, Só estava totalizando por cotas.
--------------------------------------------------------------------------------
Autor(a)  : Claudio Faria
Data      : 17/07/2006
Rotina    : MontaPainelValoresCotas, MontaPainelValoresIndexados
Pendencia : 19644
Alteração : Pertitir consulta das contas com o total das patrocinadoras.
--------------------------------------------------------------------------------
Autor(a)  : Gleyber
Data      : 15/05/2006
Rotina    : MontaPainelValoresCotas, MontaPainelValoresIndexados
Pendencia : 22144
Alteração : Alteração do número de casas decimais para oito.
--------------------------------------------------------------------------------
Autor(a)  : Gleyber
Data      : 29/12/2004
Rotina    : MontaPainelValoresCotas, MontaPainelValoresIndexados e
            CriaReservaPatroColetiva
Pendencia : 18284
Alteração : Cria a reserva coletiva para a patro/plano caso não haja.
--------------------------------------------------------------------------------
Autor(a)  : Camille
Data      : 21.10.2004
Rotina    : Diversas
Pendencia : 17859
Alteração : Exibir o indice e valor do indice para as reservas que não são
            guardadas em cotas
--------------------------------------------------------------------------------
Autor(a)  : Gleyber
Data      : 14/10/2004
Rotina    : MontaOperacao
Pendencia : 17916
Alteração : Altera o número de casas decimais de acordo com a moeda escolhida.
--------------------------------------------------------------------------------
Autor(a)  : Camille
Data      : 15.09.2004
Rotina    : ----
Pendencia : 17685
Alteração : Opção de não pedir a data de alimentacao e usar como esta
            a data de recebimento de contribuicoes
--------------------------------------------------------------------------------
Rotina    : ----
Autor(a)  : Camille
Pendência : ----
Data      : 24.06.2004
Descricao : Mudei a tela e sua funcionalidade
--------------------------------------------------------------------------------
Rotina    : MontaSelectPartBeforeOpenCds
Autor(a)  : Gleyber
Pendência : 16921
Data      : 03/06/2004
Descricao : Incluído Alias no Order By
--------------------------------------------------------------------------------
Rotina    : MontaSelectPartBeforeOpenCds
Autor(a)  : Gleyber
Pendência : 16846
Data      : 26/05/2004
Descricao : Incluida funcionalidade para criar uma ordenação forçada em
            montaselect.
--------------------------------------------------------------------------------
Autor(a)  : Ricardo Vigorito
Data      : 26/03/2004
Pendência : 16193
Alteração :  Foi Includio o pedido de data de referencia na tela.
--------------------------------------------------------------------------------
Rotina    : MontaSelectPart
Autor(a)  : Gleyber
Data      : 27/11/2003
Pendência : 16017
Alteração : Alteração no tipo de dado do MontaSelect
--------------------------------------------------------------------------------
Rotina    : MontaSelectPart
Autor(a)  : Gleyber
Data      : 27/11/2003
Pendência : 15062
Alteração : Colocada como primeira coluna o nº de inscrição
--------------------------------------------------------------------------------
Rotina    : AlimentaReserva
Autor(a)  : Leo
Data      : 01/10/2003
Alteração : modificação para colocar o pnlBotao visível ou não conforme a opção
--------------------------------------------------------------------------------
Rotina    : AlimentaReserva
Autor(a)  : Leo
Data      : 01/10/2003
Alteração : modificação para colocar o pnlBotao visível ou não conforme a opção
--------------------------------------------------------------------------------
Autor(a)  : Augusto
Data      : 17/09/2003
Alteração : MontaSelect de participante agora pega os desativados
           (FLGDESATIVADO = 1 ou 0) para que se possa mexer na reserva dos
           cancelados (FUNCEF-Dennys)
--------------------------------------------------------------------------------
Autor(a)  : Carlos Guedes
Data      : 05/08/2003
Alteração : bbtnOkClick: Ao fazer uma retirada do valor integral, o sistema
            estava efetuando um cálculo onde se gerava um lixo. Este lixo era
            usado em cálculos como se fosse uma diferença válida,e tratada como
            tal.
--------------------------------------------------------------------------------
Autor(a)  : Camille
Data      : 23.06.2003
Alteração : Inclusao do Filtro de MULTI-FUNDACAO
--------------------------------------------------------------------------------
Rotina    : cmtvTipoReservaChange
Autor(a)  : Gleyber
Data      : 12/02/2003
Alteração : Atualiza valores após mudança do item na arvore
--------------------------------------------------------------------------------
Rotina    : bbtnProcurarClick
Autor(a)  : Camille
Data      : 06.02.2003
Alteração : Remontar arvore de reservas apos escolha do participante
--------------------------------------------------------------------------------
                                SOFTTEK
--------------------------------------------------------------------------------
Pendência.......: 89724
Data............: 09/07/2008
Responsável.....: Denise Arruda
Descrição.......: Erro na QryPatro ao trazer dados da patrocinadora, não estava
                  associado ao plano e trazia mais de um registro
--------------------------------------------------------------------------------}

unit FAlimentaReserva;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, ComCtrls,
  CMTree, Db, DBTables, Wwquery, Wwdatsrc, DBCtrls, Mask, wwdbedit, TREdit, MontaSelect, TEdNum, TB97Tlbr, IvDictio, IvMulti,
  IvEMulti, wwdbdatetimepicker, CMDateTimePicker, wwdblook, DBClient,
  Provider, Wwdotdot, Wwdbcomb, TB97Ctls, ComObj, uSistema, FProgresso;

type
  TfrmAlimentaReserva = class(TfrmSairAjuda)
    pnlParticipante: TPanel;
    pnlArvore: TPanel;
    ds: TwwDataSource;
    qryReservaXPlano: TwwQuery;
    cmtvTipoReserva: TCMTreeView;
    qryReservaPart: TwwQuery;
    qryReservaXPlanoIDTIPORESERVA: TFloatField;
    qryReservaXPlanoINDICEREAJUSTE: TFloatField;
    qryReservaXPlanoNOME: TStringField;
    qryReservaXPlanoANALITICOSINTETI: TStringField;
    qryReservaXPlanoCODHIERARQUIA: TStringField;
    qryCotacao: TwwQuery;
    pnlOperacao: TPanel;
    lblTitDtCotacao: TLabel;
    lblCotacao: TLabel;
    dtCotacao: TCMDateTimePicker;
    pnlValores: TPanel;
    lblValores: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    pnlComum: TPanel;
    Label1: TLabel;
    meCodHierarquia: TMaskEdit;
    Label5: TLabel;
    dbedReserva: TDBEdit;
    lblMoeSigla: TLabel;
    dbedMoeda: TwwDBEdit;
    Panel2: TPanel;
    lblParticip: TLabel;
    edNome: TEdit;
    lblPatro: TLabel;
    edPatro: TEdit;
    Label3: TLabel;
    edPlano: TEdit;
    qryAux: TwwQuery;
    MontaSelectPart: TMontaSelect;
    lblDescricao: TLabel;
    qryReservaXPlanoFLGCONTROLE: TFloatField;
    bbtnProcurar: TBitBtn;
    MontaSelectPatro: TMontaSelect;
    lblMatricula: TLabel;
    edMatricula: TEdit;
    qryReservaXPlanoFLGCOLETIVA: TFloatField;
    Label4: TLabel;
    lblValorIndice: TLabel;
    lblValMoeda: TLabel;
    lblOperacao: TLabel;
    lblValReal: TLabel;
    reValorOperacao: TEditNum;
    Label2: TLabel;
    bbtnCancelar: TBitBtn;
    bbtnOk: TBitBtn;
    cmbOperacao: TComboBox;
    Label7: TLabel;
    Label6: TLabel;
    cmbTipo: TComboBox;
    edAnoMesRef: TMaskEdit;
    Panel3: TPanel;
    lblSaldoCotas: TLabel;
    lblDescOperacao: TLabel;
    lblNovoSaldo: TLabel;
    lblTitIndiceOperacao: TLabel;
    edIndiceOperacao: TEditNum;
    qryReservaXPlanoIDPLANOPREV: TFloatField;
    lblModoAtualiza: TLabel;
    dbedModoAtualiza: TDBText;
    qryReservaXPlanoMODOATUALIZACAO: TStringField;
    qryReservaXPlanoFLGMODATUALIZACAO: TFloatField;
    qryReservaXPlanoINDICECORRECAO: TFloatField;
    qryReservaXPlanoMOECODIGO: TFloatField;
    pnlValoresIndexados: TPanel;
    Label8: TLabel;
    lblTitUltDataAtualiza: TLabel;
    lblUltDataAtualiza: TLabel;
    lblValMoedaInd: TLabel;
    Label9: TLabel;
    lblValMoedaIndHoje: TLabel;
    Label16: TLabel;
    pnlConsultaEmOutraData: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    dtConsultaHist: TCMDateTimePicker;
    Label13: TLabel;
    lblConsReal: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    lblConsIndice: TLabel;
    lblConsCotas: TLabel;
    lblConsDataIndice: TLabel;
    lblMensagem: TLabel;
    wwdbcbPatrocinadora: TwwDBLookupCombo;
    qryPatro: TwwQuery;
    qryPatroCHAVE: TFloatField;
    qryPatroIDPESSJUR: TFloatField;
    qryPatroNOME: TStringField;
    qryPatroFLGATIVO: TFloatField;
    qryPatroDS_FLGATIVO: TStringField;
    dDtAlimentacao: TCMDateTimePicker;
    lblDtAlimenta: TLabel;
    lblContrib: TLabel;
    lblObservacao: TLabel;
    cmbContrib: TComboBox;
    mmoObs: TMemo;
    //Darivaldo Alencar SOL 253577/17989  PPM 1198155 -inicio
    qryReservaXPlanoFLGDEFICIT: TFloatField;
    lblNovoSaldoReal: TLabel;
    QryExcluirArquivo: TwwQuery;
    QryExcluirArquivoid: TFloatField;
    QryExcluirArquivoidusuario: TFloatField;
    QryExcluirArquivonomeusuario: TStringField;
    QryExcluirArquivodescricao: TMemoField;
    QryExcluirArquivodata: TDateTimeField;
    DscExcluirArquivo: TwwDataSource;
    GroupBox2: TGroupBox;
    LblImporta: TLabel;
    btnImporta: TToolbarButton97;
    Label22: TLabel;
    edtImporta: TEdit;
    EdtDescricaoImportacao: TEdit;
    GBExcluirImportacao: TGroupBox;
    btnExcluirArquivo: TSpeedButton;
    btnPesquisarExcluirArq: TSpeedButton;
    DBNavigator1: TDBNavigator;
    EdtUsuario: TEdit;
    EdtData: TEdit;
    MemoDescricao: TMemo;
    BBtnImporta: TSpeedButton;
    OpenDialog1: TOpenDialog;
    QryImportacaoArquivo: TwwQuery;
    QryImpAux: TwwQuery;
    Bevel1: TBevel;
    SpeedButton1: TSpeedButton;
    //Darivaldo Alencar SOL 253577/17989  PPM 1198155 -fim
    procedure FormShow(Sender: TObject);
    procedure qryReservaXPlanoAfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure reValorOperacaoExit(Sender: TObject);
    procedure cmtvTipoReservaChange(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure reValorOperacaoEnter(Sender: TObject);
    procedure MontaSelectPartBeforeOpenCds(var sqlText: String;
      strListParams: TStringList);
    procedure cmbOperacaoChange(Sender: TObject);
    procedure cmbTipoChange(Sender: TObject);
    procedure edAnoMesRefExit(Sender: TObject);
    procedure dtCotacaoChange(Sender: TObject);
    procedure dtConsultaHistChange(Sender: TObject);
    function CriaReservaPatroColetiva(psIdpessjur, psIdPlanoPrev : String) : Boolean;
    procedure wwdbcbPatrocinadoraChange(Sender: TObject);
    Function  ValidaCampo(objInput: TObject): Boolean;  //Darivaldo Alencar SOL 253577/17989  PPM 1198155
    //Ewerton Beltramini - SIG98772 - 11/03/2020 - Inicio...    
    procedure btnImportaClick(Sender: TObject);
    procedure btnPesquisarExcluirArqClick(Sender: TObject);
    procedure MemoDescricaoChange(Sender: TObject);
    procedure btnExcluirArquivoClick(Sender: TObject);
    procedure BBtnImportaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure SpeedButton1Click(Sender: TObject);   
    //Ewerton Beltramini - SIG98772 - 11/03/2020 - Fim.
        
  private
    { Private declarations }
    sIdPessoa        : string;
    sIdPessJur       : string;
    sIdPlanoPrev     : string;
    sSeqProposta     : string;
    sIndice          : string;
    sDataUtilizada   : string;
    sFlagAtivo       : string;
    lbConsulta       : boolean;
    dValorIndiceHoje : double;

    procedure MostraValores;
    procedure MontaOperacao;
    procedure MontaPainelValoresCotas;
    procedure MontaPainelValoresIndexados;
    // FELIPE SANTOS SOL 192897 KTN 1835724
    function PegaIDContribuicao : integer;
    procedure CarregaValoresNoCombo;
    // FELIPE SANTOS SOL 192897 KTN 1835724 FIM
  public
    { Public declarations }
    bnavegador : Boolean; //Ewerton Beltramini - SIG98772 - 11/03/2020
    function ProcessaArquivo():boolean; //Ewerton Beltramini - SIG98772 - 11/03/2020

  end;

var
  frmAlimentaReserva: TfrmAlimentaReserva;

  sFlgColetiva, sTipo: string;

  procedure AlimentaReserva(pTipo: string; bConsulta : Boolean);

implementation

uses
    UMensErro, UAdmPrev, fAguarde, DAPrev, UParticipante, UMovReserva,
    FCalculaReservaPart, UDataBase, DBaseDados, FTelaAut;


{$R *.DFM}

procedure AlimentaReserva(pTipo: string; bConsulta : Boolean);
begin

  Application.CreateForm(TfrmAlimentaReserva, frmAlimentaReserva);

  sTipo := pTipo;

  
  If (sTipo = 'COLETIVA') Then
      frmAlimentaReserva.HelpContext := 160057
  else
    begin
        frmAlimentaReserva.HelpContext := 160056;
        //Darivaldo Alencar SIG 19595 - inicio
        frmAlimentaReserva.dDtAlimentacao.visible := true;
        frmAlimentaReserva.edAnoMesRef.visible    := true;
        frmAlimentaReserva.lblNovoSaldoReal.visible:= false;
        //Darivaldo Alencar SIG 19595 - fim
    end;


  frmAlimentaReserva.pnlOperacao.visible :=  not bConsulta;
  frmAlimentaReserva.pnlConsultaEmOutraData.Visible := bConsulta;
  frmAlimentaReserva.lbConsulta := bConsulta;

  frmAlimentaReserva.ShowModal;
  frmAlimentaReserva.Free;
end;

procedure TfrmAlimentaReserva.FormShow(Sender: TObject);
begin
  inherited;
  if (sTipo = 'PARTICIPANTE') then // Consulta Reservas do Participante
     Caption := ' Alimentação de Reservas do Participante'
  else
     Caption := ' Alimentação de Reservas Coletivas';

  lblPatro.Caption := 'Patrocinadora';

 {Iniciar variáveis}
  sIdPessoa    := 'NULL';
  sIdPessJur   := 'NULL';
  sIdPlanoPrev := 'NULL';
  sSeqProposta := 'NULL';

  lblSaldoCotas.Caption   := 'Saldo Atual (cotas) : ';
  lblDescOperacao.Caption := 'Valor a Adicionar (cotas) : ';
  lblNovoSaldo.Caption    := 'Novo Saldo (Cotas) : ';
  lblNovoSaldoReal.Caption:= 'Novo Saldo (Real): ';//Darivaldo Alencar SOL 253577/17989  PPM 1198155

//  cmbOperacao.Text        := ''  //Darivaldo Alencar SOL 253577/17989  PPM 1198155
  reValorOperacao.Text    := '';
  cmbTipo.Text            := '';

  //Darivaldo Alencar SIG 19595 - inicio
  //if (sTipo <> 'COLETIVA') then              //edilaine WO17419
  edAnoMesRef.Text        := '';
  //Darivaldo Alencar SIG 19595 - fim

  dtCotacao.Text          := FormatDateTime('dd/mm/yyyy', Date);

  edIndiceOperacao.Text   := '';
  dtConsultaHist.Text     := '';
  lblConsCotas.Caption       := FormatFloat('#0.00000000',0);
  lblConsIndice.Caption      := FormatFloat('#0.00000000',0);
  lblConsReal.Caption        := FormatFloat('#0.00',0);
  lblConsDataIndice.Caption  := '(00/00/0000)';
  lblMensagem.Caption        := '';

  bbtnProcurar.Click();

  // FELIPE SANTOS SOL 192897 KTN 1835724

  // Carrega os dados no combobox cmbcontrib

  CarregaValoresNoCombo;

  // FELIPE SANTOS SOL 192897 KTN 1835724 FIM

end;

procedure TfrmAlimentaReserva.bbtnProcurarClick(Sender: TObject);
var
  sMsgErro : string;
  sDeficit: string;  //Darivaldo Alencar SIG 19595
begin
  inherited;
  if sTipo = 'PARTICIPANTE' then // Alimenta Reservas do Participante
  begin
    sFlgColetiva := '0';
    lblDescricao.Caption := 'Esta Reserva não pertence a este Participante.';
    MontaSelectPart.Executar;

    // Volta do teste do MontaSelect
    if MontaSelectPart.RetornouValor then
    begin
      sIdPlanoPrev     := MontaSelectPart.ValoresChave[0];
      sIdPessoa        := MontaSelectPart.ValoresChave[1];
      sSeqProposta     := MontaSelectPart.ValoresChave[2];
      edMatricula.Text := MontaSelectPart.ValoresChave[3];
      edNome.Text      := MontaSelectPart.ValoresChave[4];
      edPlano.Text     := MontaSelectPart.ValoresChave[5];

      qryPatro.Close;
      qryPatro.ParamByName('IDPESSOA').AsInteger := StrToInt(sIdPessoa);
      // Denise Arruda 09/07/2008 Sol nº 89724
      qryPatro.ParamByName('IDPLANOPREV').AsInteger := StrToInt(sIdPlanoPrev);
      qryPatro.Open;

      if lbConsulta then
      begin
         wwdbcbPatrocinadora.LookupValue := '-1';
      end
      else
      begin
        wwdbcbPatrocinadora.Visible := False;
        qryPatro.Locate('DS_FLGATIVO', 'ATIVO', []);
        edPatro.Text := qryPatro.FieldByName('NOME').AsString;
        sIdPessJur := qryPatro.FieldByName('IDPESSJUR').AsString;
        sFlagAtivo := qryPatro.FieldByName('FLGATIVO').AsString;
      end;

      // Verificar se o participante tem contribuicoes que ainda nao alimentaram reserva
      // e alimentá-las, em caso positivo.

      frmAguarde.Mostra('Atualizando Reserva ... ');
      if not AtualizaReservaParticipante ( qryAux, dtmAPrev.qryAux,
                                           -1, 
                                           StrToInt(sIdPlanoPrev),
                                           StrToInt(sIdPessoa),
                                           StrToInt(sSeqProposta),
                                           -1, // nao passar evento gerador para mostrar no extrato o nome da contribuicao
                                           FormatDateTime('dd/mm/yyyy',Date), 
                                           sMsgErro )

      then begin
         frmAguarde.Apaga;
         MsgDlg(sMsgErro,'Erro',mtError,[mbOk, mbHelp], 0);
         Exit;
      end;

      frmAguarde.Apaga;
    end;
  end
  else // Alimenta Reservas Coletivas
  begin
    sFlgColetiva := '1';
    lblDescricao.Caption := 'Esta Reserva não pertence a esta Patrocinadora.';

    {Monta o Filtro com o Plano Escolhido}
    if sIdPlanoPrev <> 'NULL' then
      MontaSelectPatro.Filtro[2] := 'PL.IDPLANOPREV = ' + sIdPlanoPrev
    else
      MontaSelectPatro.Filtro[2] := 'PL.IDPLANOPREV <> ' + '-1';


    MontaSelectPatro.Executar;

    if MontaSelectPatro.RetornouValor then
    begin
      sIdPessoa        := MontaSelectPatro.ValoresChave[1];
      sIdPessJur       := MontaSelectPatro.ValoresChave[1];
      sIdPlanoPrev     := MontaSelectPatro.ValoresChave[3];
      sSeqProposta     := '1';
      lblParticip.Caption := 'Patrocinadora';
      edNome.Text := MontaSelectPatro.ValoresChave[0];
      lblMatricula.Visible := False;
      edMatricula.Visible  := False;
      lblPatro.Visible     := False;
      edPatro.Visible      := False;
      edPlano.Text := MontaSelectPatro.ValoresChave[2];

      wwdbcbPatrocinadora.Visible := False;
    end;
  end;

  if not(MontaSelectPart.RetornouValor or MontaSelectPatro.RetornouValor) then Exit;

  // Remontar arvore porque se o plano mudou a mesma deve ser remontada
  meCodHierarquia.EditMask := sMascTpReserva + ';0;_';
  cmtvTipoReserva.Mascara  := sMascTpReserva;

  qryReservaXPlano.Close;
  qryReservaXPlano.SQL.Clear;

  //Darivaldo Alencar SIG 19595 - inicio
  if (sTipo = 'COLETIVA') then
    sDeficit:=  ('AND ( (R.FLGDEFICIT = 1) OR ( R.ANALITICOSINTETI = ' + QuotedStr('S')+')) ')
  else
    sDeficit:= ' ';
  //Darivaldo Alencar SIG 19595 - fim

  qryReservaXPlano.SQL.Add(' SELECT R.CODHIERARQUIA, R.ANALITICOSINTETI,   R.NOME,                                      '+
                           '        R.FLGCONTROLE,   R.IDTIPORESERVA,      R.INDICEREAJUSTE,                            '+
                           '        R.INDICECORRECAO,                                                                   '+
                           '        R.IDPLANOPREV,   R.FLGCOLETIVA,        R.FLGMODATUALIZACAO,                         '+
                           '        DECODE(R.FLGMODATUALIZACAO, 1, R.INDICECORRECAO, R.INDICEREAJUSTE) AS MOECODIGO,    '+
                           '        DECODE(R.FLGMODATUALIZACAO, 1, MINDICE.MOESIGLA, MCOTAS.MOESIGLA) AS MOESIGLA,      '+
                           '        DECODE(R.FLGMODATUALIZACAO, 1, ''Reserva em Valor Monetário (Índice)'',             '+
                           '                                       ''Reserva em Cotas'') AS MODOATUALIZACAO,            '+
                           '        R.FLGDEFICIT                                                                        '+
                           ' FROM   RESERVAXPLANO R, MOEDA MCOTAS, MOEDA MINDICE                                        '+
                           ' WHERE  R.IDPLANOPREV = ' +sIdPlanoPrev                                                      +
                           //Darivaldo Alencar SIG 19595 - inicio
                           //' AND ( (R.FLGDEFICIT = 1) OR ( R.ANALITICOSINTETI = ' + QuotedStr('S')+'))                '+ // Darivaldo Alencar SOL 253577/17989
                           sDeficit                                                                                      +
                           //Darivaldo Alencar SIG 19595 - fim
                           ' AND    R.INDICEREAJUSTE = MCOTAS.MOECODIGO(+)                                              '+
                           ' AND    R.INDICECORRECAO = MINDICE.MOECODIGO(+)');
  qryReservaXPlano.Open;

  ds.DataSet := qryReservaxPlano;
  cmtvTipoReserva.DataSource := ds;

  cmtvTipoReserva.MontaArvore;

  pnlOperacao.Visible := not lbConsulta;

  if (qryReservaxPlano.FieldByName('FLGMODATUALIZACAO').AsInteger = 0) and (lbConsulta)
  then pnlConsultaEmOutraData.Visible := True
  else pnlConsultaEmOutraData.Visible := False;

  if qryReservaXPlano.IsEmpty
  then begin
     cmtvTipoReserva.Enabled := False;
     pnlOperacao.Enabled     := False;
  end
  else begin
     cmtvTipoReserva.Enabled := True;
     pnlOperacao.Enabled     := True;
  end;

  if qryReservaxPlano.Active
  then qryReservaXPlano.First;
end;



procedure TfrmAlimentaReserva.qryReservaXPlanoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if (Trim(sIdPessoa)  = '') or ( not qryReservaxPlano.Active) then Exit;
  lblSaldoCotas.Caption   := 'Saldo Atual (cotas) : ';
  lblDescOperacao.Caption := 'Valor a Adicionar (cotas) : ';
  lblNovoSaldo.Caption    := 'Novo Saldo (Cotas) : ';
  lblNovoSaldoReal.Caption    := 'Novo Saldo (Real) : '; //Darivaldo Alencar SOL 253577/17989  PPM 1198155
  cmbOperacao.Text        := '';
  reValorOperacao.Text    := '';
  cmbTipo.Text            := '';

  //Darivaldo Alencar SIG 19595 -inicio
  //if (sTipo <> 'COLETIVA') then
    edAnoMesRef.Text        := '';         //edilaine WO17419
  //edAnoMesRef.Text        := ''; //Darivaldo Alencar SOL 253577/17989  PPM 1198155
  //Darivaldo Alencar SIG 19595 -fim

  dtCotacao.Text          := FormatDateTime('dd/mm/yyyy', Date);

  edIndiceOperacao.Text   := '';

  lblConsCotas.Caption       := FormatFloat('#0.00000000',0);
  lblConsIndice.Caption      := FormatFloat('#0.00000000',0);
  lblConsReal.Caption        := FormatFloat('#0.00',0);
  lblConsDataIndice.Caption  := '(00/00/0000)';
  dtConsultaHistChange(Application);

  MostraValores;
  if (qryReservaxPlano.FieldByName('FLGMODATUALIZACAO').AsInteger = 0) and (lbConsulta)
  then pnlConsultaEmOutraData.Visible := True
  else pnlConsultaEmOutraData.Visible := False;
end;

procedure TfrmAlimentaReserva.MostraValores;
begin
  if (not qryReservaxPlano.Active) or (qryReservaXPlano.IsEmpty)
  then Exit;

  qryAux.Close;
  qryAux.SQL.clear;
  qryAux.SQL.add(' SELECT DISTINCT TRUNC(DATAALIMENTACAO) AS DATAALIMENTACAO '+
                 ' FROM HISTMOVRESERVA '+
                 ' WHERE IDPESSJUR     = '+sIdPessjur+' '+
                 ' AND   IDPLANOPREV   = '+qryreservaxplano.fieldbyname('IDPLANOPREV').AsString+' ' +
                 ' AND   IDPESSOA      = '+sIdPessoa+' '+
                 ' AND   SEQPROPOSTA   = '+sSeqProposta+' '+
                 ' AND   IDTIPORESERVA = '+qryreservaxplano.fieldbyname('IDTIPORESERVA').AsString+' ');
  qryAux.open;

 //Darivaldo Alencar SIG 19595 -inicio
 //if (sTipo <> 'COLETIVA') then         //edilaine WO17419
  //dDtAlimentacao.datetime := qryAux.fieldbyname('DATAALIMENTACAO').AsDateTime; //Darivaldo Alencar SOL 253577/17989  PPM 1198155
  dDtAlimentacao.datetime := qryAux.fieldbyname('DATAALIMENTACAO').AsDateTime;
  //Darivaldo Alencar SIG 19595 -fim

  if Trim(sIdPlanoPrev) = '' then sIdPlanoPrev := '-1';
  if Trim(sIdPessoa) = ''    then sIdPessoa    := '-1';
  if Trim(sIdPessjur) = ''   then sIdPessjur   := '-1';
  if Trim(sSeqProposta) = '' then sSeqProposta := '-1';

  // ***************************************************************************
  // Preencher 1o painel -> pnlComum
  // ***************************************************************************
  meCodHierarquia.Text := qryReservaXPlano.FieldByName('CODHIERARQUIA').AsString;
  if qryReservaxPlano.FieldByName('FLGMODATUALIZACAO').AsInteger = 0
  then lblMoeSigla.Caption := 'Índice de Valorização da Reserva : '+qryreservaxplano.fieldbyname('MOESIGLA').AsString
  else lblMoeSigla.Caption := 'Índice de Correção da Reserva    : '+qryreservaxplano.fieldbyname('MOESIGLA').AsString;

  sDataUtilizada := FormatDateTime('dd/mm/yyyy', Date);

  dValorIndiceHoje := VoltaValorCotacaoComData( qryaux,
                                                qryreservaxplano.fieldbyname('MOECODIGO').AsString,
                                                qryreservaxplano.fieldbyname('IDPLANOPREV').AsString,
                                                qryreservaxplano.fieldbyname('IDTIPORESERVA').AsString,
                                                sDataUtilizada );
  lblValorIndice.Caption := 'Valor Atual do Índice : '+FormatFloat('#0.00000000',dValorIndiceHoje)+' ('+sDataUtilizada+')';



  if qryReservaXPlano.FieldByName('ANALITICOSINTETI').AsString = 'S'
  then begin
     lblOperacao.Visible       := False;
     lblMoeSigla.Visible       := False;
     lblValorIndice.Visible    := False;
     lblModoAtualiza.Visible   := False;
     dbedModoAtualiza.Visible  := False;
     if not lbConsulta then pnlOperacao.Visible := False;
  end
  else begin
     lblOperacao.Visible       := True;
     lblMoeSigla.Visible       := True;
     lblValorIndice.Visible    := True;
     lblModoAtualiza.Visible   := True;
     dbedModoAtualiza.Visible  := True;
     if not lbConsulta then pnlOperacao.Visible := True; 
  end;

  if (qryReservaxPlano.FieldByName('FLGMODATUALIZACAO').AsInteger = 0) and (lbConsulta)
  then pnlConsultaEmOutraData.Visible := True
  else pnlConsultaEmOutraData.Visible := False;

  // ***************************************************************************
  // Preencher 2o painel -> pnlComum
  // ***************************************************************************
  if qryReservaxPlano.FieldByName('FLGMODATUALIZACAO').AsInteger = 0
  then begin
     pnlValores.Visible          := True;
     pnlValoresIndexados.Visible := False;
     MontaPainelValoresCotas;
  end
  else begin
     pnlValores.Visible          := False;
     pnlValoresIndexados.Visible := True;
     MontaPainelValoresIndexados;
  end;

  MontaOperacao;

end;

procedure TfrmAlimentaReserva.MontaPainelValoresCotas;
var rValCota,rValTotalMoeda, rValTotalReal, rValMoeda, rValReal: extended;
    sSQL:String;
begin
  lblOperacao.Caption  := '( * '+FormatFloat('#0.000000000',dValorIndiceHoje)+') = ';
  cmbTipo.Enabled      := True;

    lblOperacao.Visible := False;
    pnlOperacao.Enabled := False;

    if qryReservaXPlano.FieldByName('FLGCONTROLE').AsString = '0'
    then lblValores.Caption := 'Saldo Atual da Reserva (Conta Ativa) '
    else lblValores.Caption := 'Saldo Atual da Reserva (Conta de Controle) ';


    sSql := ' SELECT RP.IDTIPORESERVA, RP.FLGMODATUALIZACAO,                          '+
            '        DECODE(RP.FLGMODATUALIZACAO, 1,                                  '+
            '                                     RP.INDICECORRECAO,                  '+
            '                                     RP.INDICEREAJUSTE) AS MOECODIGO,    '+
            '        R.VALORRESERVA                                                   '+
            ' FROM   RESERVAPART R, RESERVAXPLANO RP                                  '+
            ' WHERE  R.IDPLANOPREV = ' + sIdPlanoPrev                                  +
            ' AND    R.IDPESSOA    = ' + sIdPessoa;

    If sFlagAtivo <> '-1' Then
    Begin
       sSQL := sSQL + ' AND    R.IDPESSJUR   = ' + sIdPessjur;

       If sTipo = 'PARTICIPANTE' Then
          sSQL := sSQL + ' AND    R.FLGATIVO   =  ' + sFlagAtivo;
    End;

    sSQL := sSQL + ' AND    R.SEQPROPOSTA = ' + sSeqProposta                           +
                   ' AND    R.IDTIPORESERVA = RP.IDTIPORESERVA                        '+
                   ' AND    R.IDPLANOPREV  = RP.IDPLANOPREV                           '+
                   ' AND    RP.CODHIERARQUIA LIKE ''' + qryReservaxPlano.FieldByName('CODHIERARQUIA').AsString +'%'' ' +
                   ' ORDER BY RP.CODHIERARQUIA ';

    qryReservaPart.Close;
    qryReservaPart.SQL.Clear;
    qryReservaPart.SQL.Text := sSQL;
    qryReservaPart.Open;

    // Se as reservas não pertencerem ao participante ou Patrocinadora
    // Mostra lblDescricao(mensagem)
    if (qryReservaPart.IsEmpty)
       And (Not CriaReservaPatroColetiva(sIdPessJur,sIdPlanoPrev)) 
    then pnlValores.Visible          := False
    else pnlValores.Visible          := True;

    rValTotalMoeda := 0;
    rValTotalReal := 0;
    qryReservaPart.First;

    while not qryReservaPart.Eof do
    begin
       rValMoeda      := StrToFloat(FormatFloat('#0.00000000',qryReservaPart.FieldByName('VALORRESERVA').AsFloat));  
       sIndice        := IntToStr(qryReservaPart.FieldByName('MOECODIGO').AsInteger);

       sDataUtilizada := FormatDateTime('dd/mm/yyyy', Date);

       rValCota  := VoltaValorCotacaoComData( qryaux,
                                                   sIndice,
                                                   sIdPlanoPrev,
                                                   qryReservaPart.Fieldbyname('IDTIPORESERVA').AsString,
                                                   sDataUtilizada );
       rValReal       := rValCota * rValMoeda;
       rValReal       := StrToFloat(FormatFloat('#0.00',rValReal));
       rValTotalReal  := rValTotalReal + rValReal;
       rValTotalMoeda := rValTotalMoeda + rValMoeda;
       qryReservaPart.Next;
    end;//while

    if qryReservaXPlano.FieldByName('ANALITICOSINTETI').AsString = 'A' Then
    Begin
       lblOperacao.Visible := True;
       pnlOperacao.Enabled := True;

       // Verifica se a reserva é ativa ou de Controle
       if qryReservaXPlano.FieldByName('FLGCONTROLE').AsString = '0'
       then lblValores.Caption := 'Saldo Atual da Reserva (Conta Ativa) '
       else lblValores.Caption := 'Saldo Atual da Reserva (Conta de Controle) ';

       // Se a reserva não pertencer ao participante ou Patrocinadora
       if (qryReservaPart.IsEmpty)
       And (Not CriaReservaPatroColetiva(sIdPessJur,sIdPlanoPrev))
       then begin
          pnlValores.Visible := False;  // Mostra lblDescricao(mensagem)
          pnlOperacao.Enabled   := False;
       end
       else begin
          pnlValores.Visible := True;
          pnlOperacao.Enabled   := True;
       end;
    End;

    lblValReal.Caption := FormatFloat('#0.00',rValTotalReal);
    lblValMoeda.Caption := FormatFloat('#0.00000000',rValTotalMoeda);

 
end; // MontaPainelValoresCotas

procedure TfrmAlimentaReserva.MontaPainelValoresIndexados;
var rValTotalMoeda     : extended;
    rValMoeda          : extended;
    rValTotalMoedaHOJE : extended;
    dUltimaData        : TDateTime;
    sMaiorDataIndice   : string;
    sMsgErro           : string;
begin
  lblOperacao.Visible := False;
  pnlOperacao.Enabled := False;

  cmbTipo.ItemIndex   := 0;
  cmbTipo.Text        := 'Reais';
  cmbTipo.Enabled     := False;
  dUltimaData         := 0;
  rValTotalMoeda      := 0;
  rValTotalMoedaHOJE  := 0;

  if qryReservaXPlano.FieldByName('FLGCONTROLE').AsString = '0'
  then lblValores.Caption := 'Saldo Atual da Reserva (Conta Ativa) '
  else lblValores.Caption := 'Saldo Atual da Reserva (Conta de Controle) ';

    lblOperacao.Visible := False;
    pnlOperacao.Enabled := False;

    qryReservaPart.Close;
    qryReservaPart.SQL.Clear;
    qryReservaPart.SQL.Add(' SELECT RP.IDTIPORESERVA, RP.FLGMODATUALIZACAO,                          '+
                           '        DECODE(RP.FLGMODATUALIZACAO, 1,                                  '+
                           '                                     RP.INDICECORRECAO,                  '+
                           '                                     RP.INDICEREAJUSTE) AS MOECODIGO,    '+
                           '        R.VALORRESERVA, R.DATAULTATUALIZA                                '+
                           ' FROM   RESERVAPART R, RESERVAXPLANO RP                                  '+
                           ' WHERE  R.IDPLANOPREV = ' + sIdPlanoPrev                                  +
                           ' AND    R.IDPESSOA    = ' + sIdPessoa                                     +
                           ' AND    R.SEQPROPOSTA = ' + sSeqProposta                                  +
                           ' AND    R.IDTIPORESERVA = RP.IDTIPORESERVA                               '+
                           ' AND    R.IDPLANOPREV  = RP.IDPLANOPREV                                  '+
                           ' AND    RP.CODHIERARQUIA LIKE ' + QuotedStr(qryReservaxPlano.FieldByName('CODHIERARQUIA').AsString + '%'));


    If sFlagAtivo <> '-1' Then
    Begin
       qryReservaPart.SQL.Add(' AND    R.IDPESSJUR   = ' + sIdPessjur);

       If sTipo = 'PARTICIPANTE' Then
          qryReservaPart.SQL.Add(' AND    R.FLGATIVO   =  ' + sFlagAtivo);
    End;

    qryReservaPart.SQL.Add(' ORDER BY RP.CODHIERARQUIA ');
    qryReservaPart.Open;

    // Se as reservas não pertencerem ao participante ou Patrocinadora
    // Mostra lblDescricao(mensagem)
    if qryReservaPart.IsEmpty
    then pnlValoresIndexados.Visible          := False
    else pnlValoresIndexados.Visible          := True;

    rValTotalMoeda := 0;
    qryReservaPart.First;
    dUltimaData := qryReservaPart.FieldByName('DATAULTATUALIZA').AsDateTime;
    while not qryReservaPart.Eof do
    begin
       rValMoeda      := StrToFloat(FormatFloat('#0.00000000',qryReservaPart.FieldByName('VALORRESERVA').AsFloat));
       rValTotalMoeda := rValTotalMoeda + rValMoeda;
       if dUltimaData < qryReservaPart.FieldByName('DATAULTATUALIZA').AsDateTime
       then dUltimaData := qryReservaPart.FieldByName('DATAULTATUALIZA').AsDateTime;
       qryReservaPart.Next;
    end;//while

  rValTotalMoedaHOJE := rValTotalMoeda;

  if not AtualizaReservaIndexada ( qryAux,                                              // qryIndices
                                   qryReservaxPlano.FieldByName('MOECODIGO').AsInteger, // piCodIndice
                                   FormatDateTime('dd/mm/yyyy',dUltimaData+1),          // psDataInicio
                                   FormatDateTime('dd/mm/yyyy',date),                   // psDataFinal
                                   rValTotalMoedaHOJE,                                  // pdValorAAtualizar
                                   sMaiorDataIndice,                                    // psMaiorDataIndice
                                   sMsgErro                                             // sMsgErro
                                 )
  then rValTotalMoedaHOJE := rValTotalMoeda;

  lblValMoedaInd.Caption     := FormatFloat('#0.00',rValTotalMoeda);

  lblUltDataAtualiza.Caption := FormatDateTime('dd/mm/yyyy', dUltimaData);

  lblValMoedaIndHoje.Caption := FormatFloat('#0.00',rValTotalMoedaHOJE);
end; // MontaPainelValoresIndexados

procedure TfrmAlimentaReserva.bbtnOkClick(Sender: TObject);
var iFlgEntrada             : word;
    sMsgErro                : string;
    dValorOperacaoEmCotas : double;
    dValorOperacaoEmReais : double;
    dValorIndice          : double;
    dSaldoAtual           : double;
    dNovoSaldo            : double;
    sDataIndice           : string;
    bValidou              : Boolean;//Darivaldo Alencar SOL 253577/17989  PPM 1198155
    //Darivaldo Alencar SIG 19595 -inicio
    bValida               : boolean;
    dtAlimenta            : String;
    //Darivaldo Alencar SIG 19595 -fim
    sMesReferencia        : string;                       //edilaine WO17419
begin
    // SOL 142663 Kintana 915068

     //Darivaldo Alencar SIG 19595 -inicio
     bValida:= true;
     //if (sTipo <> 'COLETIVA') then     //edilaine WO17419
        bValida:= (ValidaCampo(edAnoMesRef))  and (ValidaCampo(dDtAlimentacao));


    //Darivaldo Alencar SOL 253577/17989  PPM 1198155 -inicio
    bValidou := (ValidaCampo(cmbOperacao))    and (ValidaCampo(reValorOperacao))  and
                (ValidaCampo(cmbTipo))        and
                (ValidaCampo(dtCotacao))      and (ValidaCampo(edIndiceOperacao)) and
                (ValidaCampo(cmbContrib))     and (ValidaCampo(mmoObs))           and
                (bValida);
    //Darivaldo Alencar SIG 19595 -fim
   if not bValidou then
      Exit;
    //Darivaldo Alencar SOL 253577/17989  PPM 1198155 -fim

    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('select databloqueio,idusuario '+
                   'from CM.bloqhistmovreserva '+
                   'where idusuario = ' + inttostr(Sistema.IdUsuario)
                   );
    qryAux.Open;
    if not(qryAux.isEmpty) then
    //Darivaldo Alencar SIG 19595 -inicio
    //Darivaldo Alencar SOL 253577/17989  PPM 1198155 --inicio
    if (sTipo <> 'COLETIVA') then
     begin
      //dtAlimenta:= edAnoMesRef.Text;    //edilaine WO17419
      if  trunc(qryAux.FieldByName('databloqueio').AsDateTime) < trunc(dDtAlimentacao.Datetime) then
        begin
          showMessage('A data de Alimentação da Reserva '+FormatDateTime('dd/mm/yyyy', dDtAlimentacao.date)+#13+
                      ' não pode ser maior que a Data de Bloqueio do Usuario '+ qryAux.FieldByName('databloqueio').AsString);
          exit;
        end;
     end
    else
     begin
      //dtAlimenta:= FormatDateTime('yyyy/mm', dtCotacao.date);     //edilaine WO17419
      if  trunc(qryAux.FieldByName('databloqueio').AsDateTime) < trunc(dtCotacao.Datetime) then
       begin
            //showMessage('A data de Alimentação da Reserva '+FormatDateTime('dd/mm/yyyy', dDtAlimentacao.date)+#13+
            showMessage('A data de Alimentação da Reserva '+FormatDateTime('dd/mm/yyyy', dtCotacao.date)+#13+
            //Darivaldo Alencar SOL 253577/17989  PPM 1198155 --fim
                   ' não pode ser maior que a Data de Bloqueio do Usuario '+ qryAux.FieldByName('databloqueio').AsString);
            exit;
        end;
     end;
    //Darivaldo Alencar SIG 19595 -fim
// SOL 142663 Kintana 915068
//Darivaldo Alencar SOL 253577/17989  PPM 1198155 -inicio
//    if (reValorOperacao.Text = '0') or (reValorOperacao.Text = '0.00') or
//       (reValorOperacao.Text = '0,00') or   (edAnoMesRef.Text = '' )   or
//       (Trim(edAnoMesRef.Text) = '/' )
//    then Exit;
//Darivaldo Alencar SOL 253577/17989  PPM 1198155  -fim

    //edilaine WO17419 : inicio
    dtAlimenta     := FormatDateTime('dd/mm/yyyy', dDtAlimentacao.DateTime);
    sMesReferencia := edAnoMesRef.Text;
    //edilaine WO17419 : fim

    if qryReservaxPlano.FieldByName('FLGMODATUALIZACAO').AsInteger = 0
    then begin
       dSaldoAtual    := StrToFloat(ClienteNumero(lblValMoeda.Caption));
       sDataIndice    := dtCotacao.Text;
       dValorIndice   := VoltaValorCotacaoComData( qryaux,
                                                   qryreservaxplano.fieldbyname('MOECODIGO').AsString,
                                                   qryreservaxplano.fieldbyname('IDPLANOPREV').AsString,
                                                   qryreservaxplano.fieldbyname('IDTIPORESERVA').AsString,
                                                   sDataIndice );
    end
    else begin
       dSaldoAtual    := StrToFloat(ClienteNumero(lblValMoedaInd.Caption));

       sDataIndice    := FormatDateTime('dd/mm/yyyy', Date);

       dValorIndice   := 1;
    end;

    if dValorIndice <= 0 then dValorIndice := 1;

    if cmbTipo.ItemIndex = 0 // Reais
    then begin
       dValorOperacaoEmReais := StrToFloat(ClienteNumero(reValorOperacao.Text));
       dValorOperacaoEmCotas := StrToFloat(ClienteNumero(reValorOperacao.Text))  / dValorIndice;
    end
    else begin // Cotas
       dValorOperacaoEmCotas := StrToFloat(ClienteNumero(reValorOperacao.Text));
       dValorOperacaoEmReais := StrToFloat(ClienteNumero(reValorOperacao.Text)) * dValorIndice;
    end;

    if cmbOperacao.ItemIndex = 0 // Adicionar
    then dNovoSaldo := dSaldoAtual + dValorOperacaoEmCotas
    else dNovoSaldo := dSaldoAtual - dValorOperacaoEmCotas;


    (**** Darivaldo Alencar - SOL 253577/17989  PPM 1198155
     **** Já está sendo atualizado na procedure spAtlzS_PART - UMovReserva
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(' UPDATE RESERVAPART SET VALORRESERVA     = '+OraNumero(FloatToStr(dNovoSaldo))+', '+
                   '                        DATAREFERENCIASA = SYSDATE '+
                   ' WHERE  IDPESSJUR         = '+sIdPessJur+
                   ' AND    IDPLANOPREV       = '+sIdPlanoPrev+
                   ' AND    IDPESSOA          = '+sIdPessoa+
                   ' AND    SEQPROPOSTA       = '+sSeqProposta+
                   ' AND    IDTIPORESERVA     = '+qryReservaXPlano.FieldByName('IDTIPORESERVA').AsString);
    try
      qryAux.ExecSQL;
    except
      sMsgErro := 'Erro ao atualizar reserva do participante. ';
      Exit;
    end;*****)

    if (cmbOperacao.ItemIndex = 0)
    then iFlgEntrada := 1
    else iFlgEntrada := 0;


    // Gerar Movimentacao de Reserva na HISTMOVRESERVA
    if not GeraHistMovReservaContribuicao ( qryAux,
                                            StrToInt(sIdPessJur),
                                            StrToInt(sIdPlanoPrev),
                                            StrToInt(sIdPessoa),
                                            StrToInt(sSeqProposta),
                                            qryReservaXPlano.FieldByName('IdTipoReserva').AsInteger,
                                            PegaIDContribuicao, // FELIPE SANTOS
                                            -1, // ideventogerador
                                            -1, // idregracalculo
                                            0,
                                            dValorOperacaoEmCotas,
                                            dValorOperacaoEmReais,
                                            dNovoSaldo,
                                            dValorIndice,
                                            //Robson Andrade-- SOL 253577/17964 -inicio
//                                            sDataIndice,
                                            FormatDateTime('dd/mm/yyyy', StrToDateTime(sDataIndice)), //Robson Andrade SOL 253577/17964 -fim
                                            FormatDateTime('dd/mm/yyyy', Date),
                                            //Darivaldo Alencar SIG 19595 -inicio
                                            //Darivaldo Alencar SOL 253577/17989  PPM 1198155 -inicio
                                            //edAnoMesRef.Text,
                                            //FormatDateTime('yyyy/mm', dtCotacao.date),
                                            sMesReferencia,   //dtAlimenta,                      //edilaine WO17419
                                            //Darivaldo Alencar SIG 19595 -fim
                                            iFlgEntrada,
                                            1,
                                            //Darivaldo Alencar SIG 19595 -inicio
                                            //FormatDateTime('dd/mm/yyyy', dtCotacao.date), // xavier
                                            //FormatDateTime('dd/mm/yyyy', dtCotacao.date),
                                            dtAlimenta,
                                            //Darivaldo Alencar SOL 253577/17989  PPM 1198155 -fim
                                            //Darivaldo Alencar SIG 19595 -fim
                                            '',
                                            '',
                                            mmoObs.Text // FELIPE SANTOS
                                            ,StrToFloat(reValorOperacao.Text) //Darivaldo Alencar - SOL 253577/17989  PPM 1198155
                                           )
    then begin
       sMsgErro := 'Erro ao gerar movimento de reserva. ';
       Exit;
    end;


  if not (1=1)
  then begin
     sMsgErro := 'Erro na Gravação do Log. ';
     Exit;
  end;


  // Refresh p/aparecer na tela o valor atualizado
  qryReservaPart.Close;
  qryReservaPart.Open;

  reValorOperacao.Text := '0';

  // Adicionando Log Padrao
  Try
     If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
  Except
  End;

  // FELIPE SANTOS SOL 192897 KTN 1835724

  mmoObs.Clear;

  // FELIPE SANTOS SOL 192897 KTN 1835724 - Fim

  MsgDlg('Alimentação de Reserva efetuada com sucesso.','Informação',mtInformation,[mbOk,mbHelp],0);

  MostraValores;//Darivaldo Alencar - SOL 253577/17989  PPM 1198155
end;

procedure TfrmAlimentaReserva.reValorOperacaoExit(Sender: TObject);
begin
  inherited;
  if (reValorOperacao.Text = '0') or (reValorOperacao.Text = '0.00') or
     (reValorOperacao.Text = '0,00')
  then reValorOperacao.Text := '0';
  MontaOperacao;
end;

procedure TfrmAlimentaReserva.cmtvTipoReservaChange(Sender: TObject);
begin
  inherited;
  MostraValores;
end;

procedure TfrmAlimentaReserva.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  reValorOperacao.Text := '0';
end;

procedure TfrmAlimentaReserva.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryReservaPart.Close;
  qryCotacao.Close;
  qryReservaxPlano.Close;
  inherited;
end;

procedure TfrmAlimentaReserva.reValorOperacaoEnter(Sender: TObject);
begin
  if (sTipo = 'COLETIVA') and  (qryReservaxPlano.FieldByName('FlgColetiva').AsInteger = 0 )
  then begin
     MsgDlg('A reserva do selecionada não é coletiva. ','Erro',mtError,[mbOk,mbHelp],0);
     bbtnOk.Enabled := False;
     Exit;
  end;
  if (sTipo = 'PARTICIPANTE') and  (qryReservaxPlano.FieldByName('FlgColetiva').AsInteger = 1 )
  then begin
     MsgDlg('A reserva do selecionada não é do participante. ','Erro',mtError,[mbOk,mbHelp],0);
     bbtnOk.Enabled := False;
     Exit;
  end;
  bbtnOk.Enabled := True;

  inherited;
end;


procedure TfrmAlimentaReserva.MontaSelectPartBeforeOpenCds(
  var sqlText: String; strListParams: TStringList);
begin
  inherited;
  sqlText := Copy(sqlText, 1, Pos('ORDER BY', sqlText)-1);
  sqlText := sqlText + ' ORDER BY C5'; 
end;

procedure TfrmAlimentaReserva.MontaOperacao;
var dValorOperacaoEmCotas : double;
    dValorOperacaoEmReais : double;
    dValorIndice          : double;
    dSaldoAtual           : double;
    dNovoSaldo            : double;
    sDataIndice           : string;
begin

    If cmbTipo.ItemIndex = 1
    Then reValorOperacao.DecDigits := 8
    Else reValorOperacao.DecDigits := 2;

    if qryReservaxPlano.FieldByName('FLGMODATUALIZACAO').AsInteger = 0
    then begin
       dSaldoAtual    := StrToFloat(ClienteNumero(lblValMoeda.Caption));
       lblTitDtCotacao.Visible      := True;
       dtCotacao.Visible            := True;
       lblTitIndiceOperacao.Visible := True;
       edIndiceOperacao.Visible     := True;
       sDataIndice                  := dtCotacao.Text;
       dValorIndice                 := VoltaValorCotacaoComData( qryaux,
                                                                 qryreservaxplano.fieldbyname('MOECODIGO').AsString,
                                                                 qryreservaxplano.fieldbyname('IDPLANOPREV').AsString,
                                                                 qryreservaxplano.fieldbyname('IDTIPORESERVA').AsString,
                                                                 sDataIndice );

    end
    else begin
       dSaldoAtual    := StrToFloat(ClienteNumero(lblValMoedaInd.Caption));
       lblTitDtCotacao.Visible      := False;
       dtCotacao.Visible            := False;
       lblTitIndiceOperacao.Visible := False;
       edIndiceOperacao.Visible     := False;

       sDataIndice                  := FormatDateTime('dd/mm/yyyy', Date);

       dValorIndice                 := 1;
    end;

    if dValorIndice <= 0 then dValorIndice := 1;

    if cmbTipo.ItemIndex = 0 // Reais
    then begin
       dValorOperacaoEmReais := StrToFloat(ClienteNumero(reValorOperacao.Text));
       dValorOperacaoEmCotas := StrToFloat(ClienteNumero(reValorOperacao.Text))  / dValorIndice;
    end
    else begin // Cotas
       dValorOperacaoEmCotas := StrToFloat(ClienteNumero(reValorOperacao.Text));
       dValorOperacaoEmReais := StrToFloat(ClienteNumero(reValorOperacao.Text)) * dValorIndice;
    end;
    edIndiceOperacao.Text := FormatFloat('#0.00000000',dValorIndice);

    if qryReservaxPlano.FieldByName('FLGMODATUALIZACAO').AsInteger = 0
    then begin
       lblSaldoCotas.Caption := 'Saldo Atual (cotas) : '+FormatFloat('#0.00000000',dSaldoAtual);

       if cmbOperacao.ItemIndex = 0
       then begin // Adicionar
          lblDescOperacao.Caption := 'Valor a Adicionar (cotas) : '+FormatFloat('#0.00000000',dValorOperacaoEmCotas);
          dNovoSaldo := dSaldoAtual + dValorOperacaoEmCotas;
       end
       else begin
          lblDescOperacao.Caption := 'Valor a Retirar(cotas) : '+FormatFloat('#0.00000000',dValorOperacaoEmCotas);
          dNovoSaldo := dSaldoAtual - dValorOperacaoEmCotas;
       end;
       lblNovoSaldo.Caption := 'Novo Saldo (Cotas) : '+FormatFloat('#0.00000000',dNovoSaldo);
       lblNovoSaldoReal.Caption := 'Novo Saldo (Real) : '+FormatFloat('#0.00000000',dNovoSaldo * dValorIndice); //Darivaldo Alencar SOL 253577/17989  PPM 1198155
    end
    else begin
       lblSaldoCotas.Caption := 'Saldo Atual : '+FormatFloat('#0.00',dSaldoAtual);

       if cmbOperacao.ItemIndex = 0
       then begin // Adicionar
          lblDescOperacao.Caption := 'Valor a Adicionar : '+FormatFloat('#0.00',dValorOperacaoEmCotas);
          dNovoSaldo := dSaldoAtual + dValorOperacaoEmCotas;
       end
       else begin
          lblDescOperacao.Caption := 'Valor a Retirar : '+FormatFloat('#0.00',dValorOperacaoEmCotas);
          dNovoSaldo := dSaldoAtual - dValorOperacaoEmCotas;
       end;
       lblNovoSaldo.Caption := 'Novo Saldo : '+FormatFloat('#0.00',dNovoSaldo);
       lblNovoSaldoReal.Caption := 'Novo Saldo (Real) : '+FormatFloat('#0.00',dNovoSaldo * dValorIndice);//Darivaldo Alencar SOL 253577/17989  PPM 1198155
    end;

 //Darivaldo Alencar SIG 19595 --inicio
  if (dNovoSaldo < 0) and (cmbOperacao.Text <> '') and (cmbTipo.Text <> '') and (dValorOperacaoEmCotas > 0)
     and (sTipo <> 'COLETIVA')
    then begin
       MsgDlg('Operação Não Permitida pois gera Saldo Negativo.','Erro',mtError,[mbOk],0);
       reValorOperacao.Text := '0';
       MontaOperacao;
    end; 
//Darivaldo Alencar SIG 19595 --fim
end;

procedure TfrmAlimentaReserva.cmbOperacaoChange(Sender: TObject);
begin
  inherited;
  MontaOperacao;
end;

procedure TfrmAlimentaReserva.cmbTipoChange(Sender: TObject);
begin
  inherited;
  MontaOperacao;
end;

procedure TfrmAlimentaReserva.edAnoMesRefExit(Sender: TObject);
begin
  inherited;
  MontaOperacao;
end;

procedure TfrmAlimentaReserva.dtCotacaoChange(Sender: TObject);
begin
  inherited;
  MontaOperacao;
end;

procedure TfrmAlimentaReserva.dtConsultaHistChange(Sender: TObject);
var sDataBusca : string;
    sIdReserva : string;
begin
  inherited;
  if Trim(dtConsultaHist.Text) = ''  then Exit;
  if Length(Trim(dtConsultaHist.Text)) < 10  then Exit;

  sDataBusca := dtConsultaHist.Text;
  sIdReserva := qryReservaxPlano.FieldByName('IDTIPORESERVA').AsString;
  qryAux.Close;
  qryAux.SQl.Clear;
  qryAux.SQl.Add(' SELECT H.SALDOCOTAS, H.VALORINDICE, H.DATAINDICE, H.DATAALIMENTACAO '+
                 ' FROM   HISTMOVRESERVA H                                             '+
                 ' WHERE  H.IDPLANOPREV   = ' + sIdPlanoPrev                            +
                 ' AND    H.IDPESSOA      = ' + sIdPessoa                               +
                 ' AND    H.IDPESSJUR     = ' + sIdPessJur                              +
                 ' AND    H.SEQPROPOSTA   = ' + sSeqProposta                            +
                 ' AND    H.IDTIPORESERVA = ' + sIdReserva                              +
                 ' AND    H.IDHISTRESERVA = ( SELECT MAX(IDHISTRESERVA)                '+
                 '                            FROM   HISTMOVRESERVA                    '+
                 '                            WHERE  IDPLANOPREV   = ' + sIdPlanoPrev   +
                 '                            AND    IDPESSOA      = ' + sIdPessoa      +
                 '                            AND    IDPESSJUR     = ' + sIdPessJur     +
                 '                            AND    SEQPROPOSTA   = ' + sSeqProposta   +
                 '                            AND    IDTIPORESERVA = ' + sIdReserva     +
                 '                            AND    DATAMOV       <= TO_DATE('''+sDataBusca+''',''DD/MM/YYYY'') ) ');
  qryAux.Open;
  if not qryAux.IsEmpty
  then begin
     lblConsCotas.Caption       := FormatFloat('#0.00000000',qryAux.FieldByName('SALDOCOTAS').AsFloat);
     lblConsIndice.Caption      := FormatFloat('#0.00000000',qryAux.FieldByName('VALORINDICE').AsFloat);
     lblConsReal.Caption        := FormatFloat('#0.00',qryAux.FieldByName('SALDOCOTAS').AsFloat*qryAux.FieldByName('VALORINDICE').AsFloat);
     lblConsDataIndice.Caption  := '('+qryAux.FieldByName('DATAINDICE').AsString+')';
     lblMensagem.Caption        := '';
  end
  else begin
     lblConsCotas.Caption       := FormatFloat('#0.00000000',0);
     lblConsIndice.Caption      := FormatFloat('#0.00000000',0);
     lblConsReal.Caption        := FormatFloat('#0.00',0);
     lblConsDataIndice.Caption  := '(00/00/0000)';
     lblMensagem.Caption        := '(Histórico de Movimentação Não Encontrado na Data Indicada)';
  end;
  qryAux.Close;
end;


function TfrmAlimentaReserva.CriaReservaPatroColetiva(psIdpessjur, psIdPlanoPrev: String): Boolean;
Var
 sSql : String;
begin
 Result := False;

 If sTipo = 'PARTICIPANTE'
  Then Exit;

 If sTipo = 'COLETIVA'
  Then Begin
       sSql := ' SELECT FLGTITULARCOLET'+
               '        ,FLGDEFICIT '+ //Darivaldo Alencar SOL 253577/17989  PPM 1198155
               ' FROM RESERVAXPLANO '+
               ' WHERE IDTIPORESERVA = '+qryreservaxplano.fieldbyname('IDTIPORESERVA').AsString+
               '   AND IDPLANOPREV   = '+psIdPlanoPrev;
       qryAux.Close;
       qryAux.SQL.Clear;
       qryAux.SQL.Add(sSql);
       qryAux.open;

       If (qryAux.FieldByName('FLGTITULARCOLET').AsString <> 'P')
       and (qryAux.FieldByName('FLGDEFICIT').AsInteger <> 1) //Darivaldo Alencar SOL 253577/17989  PPM 1198155
        Then Exit;

       If MsgDlg('Não existe reserva criada para esta patrocinadora.'+#13+
                 'Deseja criar uma com valores zerados?','Confirmação',
                 mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrYes
        Then Begin
             sSql := ' INSERT INTO RESERVAPART '+
                     ' (IDTIPORESERVA, IDPLANOPREV, IDPESSOA, '+
                     '  IDPESSJUR, SEQPROPOSTA, VALORRESERVA, '+
                     '  IDPARTICIPANTE) '+
                     ' VALUES ( '+
                     qryreservaxplano.fieldbyname('IDTIPORESERVA').AsString+', '+ // IDTIPORESERVA
                     psIdPlanoPrev+', '+                                // IDPLANOPREV
                     psIdpessjur +', '+                                 // IDPESSOA
                     psIdpessjur +', '+                                 // IDPESSJUR
                     '1, '+                                             // SEQPROPOSTA
                     '0, '+                                             // VALORRESERVA
                     psIdpessjur + ') ';

             qryAux.Close;
             qryAux.SQL.Clear;
             qryAux.SQL.Add(sSql);
             Try
               qryAux.ExecSQL;
               Result := True;
               qryReservaPart.Close;
               qryReservaPart.Open;
             Except
             End;
        End;
  End;
end;


procedure TfrmAlimentaReserva.wwdbcbPatrocinadoraChange(Sender: TObject);
begin
   inherited;
   sIdPessJur := qryPatro.FieldByName('IDPESSJUR').AsString;
   sFlagAtivo := qryPatro.FieldByName('FLGATIVO').AsString;

   cmtvTipoReservaChange(Sender);
end;



function TfrmAlimentaReserva.PegaIDContribuicao : integer;
begin
  if (cmbContrib.Text<>'') then//Darivaldo Alencar SOL 253577/17989  PPM 1198155
     begin
        qryAux.SQL.Clear;
        qryAux.SQL.Add('SELECT IDCONTRIBUICAO FROM CONTRIBUICAO ' +
                         'WHERE NOME = :NOME');
        qryAux.ParamByName('NOME').AsString := cmbContrib.Text;
        qryAux.Open;

        result := qryAux.Fields[0].AsInteger;
      end
      else
       result := -1;

    qryAux.Close;
end;



procedure TfrmAlimentaReserva.CarregaValoresNoCombo;
begin

  mmoObs.Clear;

  // Carrega os dados no combobox cmbcontrib
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT DISTINCT(C.NOME) FROM CONTRIBUICAO C, CONTPREV CP, PLANPREV P ' +
                 'WHERE C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO ' +
                 'AND CP.IDPLANOPREV = :IDPLANOPREV');
  if (sIdPlanoPrev <> 'NULL') then
  begin
       qryAux.ParamByName('IDPLANOPREV').AsInteger := StrToInt(sIdPlanoPrev);
  end
  else
  begin
       qryAux.ParamByName('IDPLANOPREV').AsInteger := 0;
  end;
  qryAux.Open;
  qryAux.First;

  while not(qryAux.Eof) do
  begin
       cmbContrib.Items.Add(qryAux.FieldByName('NOME').AsString);
       qryAux.Next;
  end;
    qryAux.Close;
    cmbContrib.ItemIndex := 0;
    application.ProcessMessages;
end;
 //Darivaldo Alencar SOL 253577/17989  PPM 1198155-inicio
function TfrmAlimentaReserva.ValidaCampo(objInput: TObject): Boolean;
var
   iTexto    : Integer;
   sMensagem : string;
   sName     : string;
   intCount  : Integer;
   Function FiltraTexto(oTexto:string):string;
   var
     sNewText: string;
     iCount  : Integer;
   begin
     sNewText := '';
     iTexto   := Length(oTexto);
     For iCount := 1 to iTexto do
     begin
       if oTexto[iCount] in ['_','/',' '] then
         Continue
       else
         sNewText := sNewText + oTexto[iCount];
     end;
     Result := sNewText;
   end;
   Function EmiteAviso(sAviso: string): Boolean;
   begin
     if Length(Trim(sAviso)) > 0 then
       begin
         MsgDlg(sAviso, 'Atenção', mtWarning, [mbOk], 0);
         Result := False;
       end else
       Result := True;
   end;
begin
   sMensagem := '';
   iTexto    := 0;
       //darivaldo
       //**Darivaldo Alencar SOL 253577/17989  PPM 1198155 -inicio
        if(objInput is TMaskEdit)
          and (sTipo <> 'COLETIVA') then //Darivaldo Alencar SIG 19595
          { Validação "Mês Referencia" }
           begin
             iTexto    := Length(FiltraTexto(TMaskEdit(objInput).Text));
             if iTexto < 6 then
             begin
               if iTexto = 0 then
                 sMensagem := 'É necessário preencher o campo Mês Ref.'
               else
                 sMensagem := 'O campo Mês Ref. está incompleto!';
             end;
           end
        else
       //Darivaldo Alencar SOL 253577/17989  PPM 1198155 -fim
   if (objInput is TCMDateTimePicker) then { Validação de Datas - "Utilizar índice em" e "Data Alimentação" }
            begin
              iTexto := Length(TCMDateTimePicker(objInput).Text);
              if iTexto = 0 then
                begin
                   if (TCMDateTimePicker(objInput).Name = 'dtCotacao') then
                      sMensagem := 'É necessário preencher o campo Utilizar índice em '
                   //Darivaldo Alencar SIG 19595 -incio
                   //else  sMensagem := 'É necessário preencher o campo Data de Alimentação';//Darivaldo Alencar SOL 253577/17989  PPM 1198155
                   else
                     if(sTipo <> 'COLETIVA')then
                         sMensagem := 'É necessário preencher o campo Data de Alimentação';
                   //Darivaldo Alencar SIG 19595 -fim
                 end;
            end
   else if (objInput is TEditNum) then { Validação de Valores - "Valor" e "Valor índice" }
           begin
             iTexto := Length(TEditNum(objInput).Text);
             if iTexto = 0 then
               begin
                 if TEditNum(objInput).Name = 'reValorOperacao' then
                   sMensagem := 'É necessário preencher o campo Valor !'
                 else
                   sMensagem := 'É necessário preencher o campo Valor do índice';
               end;
           end
   else if (objInput is TMemo) then
           begin
             For intCount := 0 to TMemo(objInput).Lines.Count -1 do
               begin
                 TMemo(objInput).Text := StringReplace(TMemo(objInput).Text, #$D#$A, '', [rfReplaceAll]); { Retira as quebras de linha }
                 iTexto := Length(TMemo(objInput).Text);
                 if iTexto > 0 then
                   Break;
               end;
             if iTexto = 0 then
               sMensagem := 'É necessário preencher o campo Observação';
           end
     else
     begin { Validação de "Operação", "tipo" e "Contribuição" }
           if (objInput is TComboBox) then
             begin
                iTexto := Length(Trim(TComboBox(objInput).Text));
                if iTexto = 0 then
                  begin
                     sName := TComboBox(objInput).Name;
                     if sName = 'cmbOperacao' then
                        sMensagem := 'É necessário preencher o campo Operação'
                     else
                     if sName = 'cmbTipo' then
                             sMensagem := 'É necessário preencher o campo Tipo'
                        else sMensagem := 'É necessário preencher o campo Contribuição!'
                  end;
             end;
     end;
   Result := EmiteAviso(sMensagem);
end;
//Darivaldo Alencar SOL 253577/17989  PPM 1198155 -fim
//Ewerton Beltramini - SIG98772 - 11/03/2020 - Inicio...
procedure TfrmAlimentaReserva.btnImportaClick(Sender: TObject);
begin
  inherited;
   OpenDialog1.Execute;

   if OpenDialog1.FileName <> '' then
   begin
      edtImporta.ReadOnly := false;
      edtImporta.text := OpenDialog1.FileName;
      edtImporta.ReadOnly := true;
      BBtnImporta.Enabled := true;
   end;
end;

procedure TfrmAlimentaReserva.btnPesquisarExcluirArqClick(Sender: TObject);
var
   sTexto: String;
begin
  inherited;

  sTexto := trim(MemoDescricao.Text);

  if (bnavegador = false) then
  begin
        EdtUsuario.Text    := '';
        EdtData.Text       := '';

        if ( length(sTexto) >= 1 ) then
        begin
              QryExcluirArquivo.Close;
              QryExcluirArquivo.SQL[3] := 'and upper(ih.descricao) like upper(' + QuotedStr('%' + sTexto + '%') + ')' ;
              QryExcluirArquivo.Open;

              if trim(QryExcluirArquivo.FieldByName('descricao').AsString) = '' then
              begin
                   MsgDlg('Nenhum registro encontrado com a descrição informada!' + #13 + '--> (' + sTexto + ')','Confirmação' ,mtConfirmation,[mbok],0);
                   QryExcluirArquivo.Close;
                   QryExcluirArquivo.SQL[3] := '';
                   QryExcluirArquivo.Open;
              end;

              MemoDescricao.Text := QryExcluirArquivo.FieldByName('descricao').AsString;
              EdtUsuario.Text    := QryExcluirArquivo.FieldByName('nomeusuario').AsString;
              EdtData.Text       := QryExcluirArquivo.FieldByName('data').AsString;
        end;
  end;
  bnavegador := false; 
end;

procedure TfrmAlimentaReserva.MemoDescricaoChange(Sender: TObject);
begin
  inherited;
  if (bnavegador = false) then
  begin
        EdtUsuario.Text    := '';
        EdtData.Text       := '';
  end;
  bnavegador := false;
end;

procedure TfrmAlimentaReserva.btnExcluirArquivoClick(Sender: TObject);
var sTotal : string;
begin
  inherited;

     if Trim(MemoDescricao.text) = '' then
     begin
          MsgDlg( 'Para realizar a exclusão é necessário primeiramente selecionar uma importação!','Confirmação' ,mtConfirmation,[mbOk],0);
          abort;
     end;

     //Verificando os registros e contando...
     QryImpAux.Close;
     QryImpAux.sql.clear;
     QryImpAux.sql.add('select count(*) as total from CM.Histmovreserva' );
     QryImpAux.sql.add('where IDIMPORTACAOHISTMOVERSERVA = ' + QryExcluirArquivo.FieldByName('id').AsString );
     //QryImpAux.sql.add('and flgcalcreserva = 0');
     QryImpAux.open;
     sTotal :=  QryImpAux.FieldByName('total').AsString;

     (*
     if sTotal = '0' then
     begin
          MsgDlg( 'Não é possivél excluir a importação selecionada!' + #13 +
                  'Todas as contribuições desta importação já foram alimentadas.','Confirmação' ,mtConfirmation,[mbYes],0);
          abort;
     end;
     *)

     if MsgDlg('Atenção! Deseja realmente excluir a importação selecionada: ' + #13
             + 'Usuário: ' + QryExcluirArquivo.FieldByName('NomeUsuario').AsString + #13
             + 'Data: ' + QryExcluirArquivo.FieldByName('data').AsString + #13
             + 'Descição: ' + QryExcluirArquivo.FieldByName('descricao').AsString + #13
             + 'Total de Registros: ' + sTotal
             ,'Confirmação' ,mtConfirmation,[mbYes,mbNo],0) = mrNo then
        abort;

     try
               //Apagando os registros importados...
               QryImpAux.Close;
               QryImpAux.sql.clear;
               QryImpAux.sql.add('delete CM.histmovreserva' );
               QryImpAux.sql.add('where IDIMPORTACAOHISTMOVERSERVA = ' + QryExcluirArquivo.FieldByName('id').AsString );
               //QryImpAux.sql.add('and flgcalcreserva = 0');
               QryImpAux.execSql;

               //Apagando o registro de importação...
               QryImpAux.Close;
               QryImpAux.sql.clear;
               QryImpAux.sql.add('delete cm.importacaohistmovreserva ');
               QryImpAux.sql.add('where id = ' + QryExcluirArquivo.FieldByName('id').AsString );
               QryImpAux.sql.add('and idusuario = ' + QryExcluirArquivo.FieldByName('idusuario').AsString );
               QryImpAux.sql.add('and data = ' + QuotedStr(QryExcluirArquivo.FieldByName('data').AsString));
               QryImpAux.sql.add('and descricao = ' + QuotedStr(QryExcluirArquivo.FieldByName('descricao').AsString) );
               QryImpAux.execSql;

               MsgDlg('Registro(s) apagado(s) com exito!','Confirmação' ,mtConfirmation,[mbok],0);

              dtmBaseDados.dbBaseDados.Commit;
      except;
              dtmBaseDados.dbBaseDados.Rollback;
      end;

     QryExcluirArquivo.Close;
     QryExcluirArquivo.Open;

     EdtUsuario.Text    := '';
     EdtData.Text       := '';
     MemoDescricao.Text := '';

end;
//Ewerton Beltramini - SIG98772 - 11/03/2020 - Fim

//Ewerton Beltramini - SIG98772 - 11/03/2020 - Inicio...
procedure TfrmAlimentaReserva.BBtnImportaClick(Sender: TObject);
begin
  inherited;

   if Trim(EdtDescricaoImportacao.text) = '' then
   begin
         MsgDlg('O campo Descrição é obrigatório!','Erro',mtError,[mbOK],0);
         EdtDescricaoImportacao.setFocus;
         Abort;
   end;

   if (ProcessaArquivo) then
       MsgDlg('Processo realizado com sucesso!','Informação',mtInformation,[mbOk],0);

   edtImporta.text := '';
   EdtDescricaoImportacao.text := '';
   OpenDialog1.filename := '';
   QryExcluirArquivo.Close;
   QryExcluirArquivo.Open;

end;
//Ewerton Beltramini - SIG98772 - 11/03/2020 - Fim.

//Ewerton Beltramini - SIG98772 - 11/03/2020 - Inicio...
function TfrmAlimentaReserva.ProcessaArquivo():boolean;
var
    Excel : Variant;
    linha, numRegs, cont : integer;
    sSeq, sSeqApagar, sObs : String;
    bApagarRegistro,bIsErro : Boolean;  // SIG 99737 - Campo bIsErro

    sIdpessjur, sIdpessoa, sMesreferencia, sIdcontribuicao, sIdplanoprev, sNumrecebimento, sFlgentrada, sDataalimentacao,
    sDatamov, sVlrreal, sIdtiporeserva, sValorindice, sIdbeneficio, sVlrcotas, sDatarecebimento, sIdeventogerador, sObservacao : String;   //Ewerton Beltramini - 16/11/2021 - SIG84982

begin

     try

          sObs := EdtDescricaoImportacao.Text;

          //Verificando se a descrição informada já existe...
          QryImpAux.Close;
          QryImpAux.SQL.Clear;
          QryImpAux.SQL.Add('select * from cm.importacaohistmovreserva where descricao = ' + QuotedStr(sObs));
          QryImpAux.Open;

          if not QryImpAux.IsEmpty then
          begin
                   if MsgDlg('Já existe uma importação com esta descrição!' + #13 + 'Não é possível continuar com a importação!' , Caption, mtInformation , [mbOk], 0) = mrOk then
                   Exit;
          end;

          //Carregando o excel...
          Excel := CreateOleObject('Excel.application');
          Excel.Visible := False;
          Excel.WorkBooks.Open(ExpandUNCFileName(OpenDialog1.FileName),1);

          //pega numero total de regitros no aquivo excel
          numRegs := 0;
          while (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[numRegs+2, 1].Value)) <> '') do
                inc(numRegs);

          if numRegs = 0 then
          begin
               MsgDlg('Não foram localizados contratos no arquivo selecionado!' , Caption, mtInformation , [mbOk], 0);
               Exit;
          end;

          //Carrega a sequencia a ser utilizada...
          QryImpAux.Close;
          QryImpAux.SQL.Clear;
          QryImpAux.SQL.Add('select cm.seq_importacaohistmovreserva.nextval as seq from dual');
          QryImpAux.Open;
          sSeq :=  QryImpAux.FieldByName('seq').AsString;

          frmProgresso.MostraFormProgresso('Carregando/Processando Arquivo...', True, True, True, 0, numRegs );
          frmProgresso.btnCancelar.Visible := true;
          frmProgresso.Refresh;

          if not dtmBaseDados.dbBaseDados.InTransaction then
                 dtmBaseDados.dbBaseDados.StartTransaction;

          //Salva o registro pai na tabela...
          QryImpAux.Close;
          QryImpAux.SQL.Clear;
          QryImpAux.SQL.Add('insert into cm.importacaohistmovreserva (ID,IDUSUARIO,DATA,DESCRICAO) values(');
          QryImpAux.sql.add(sSeq + ', ' + IntToStr(Sistema.IdUsuario) + ', ' + quotedStr(Formatdatetime('dd/mm/yyyy',date)) + ', ' + QuotedStr(sObs));
          QryImpAux.sql.add(')');          
          QryImpAux.ExecSql;

          //processa arquivo...
          try

              bApagarRegistro := False;
              linha := 2;
              bIsErro := False; // SIG 99737
              while (linha <= numRegs+1 ) do
              begin

                   if frmProgresso.Cancelou then Exit;

                   //Inicializando as variaveis e tratando os dados...
                   sIdpessjur := '';
                   sIdpessoa := '';
                   sMesreferencia := '';
                   sIdcontribuicao := '';
                   sIdplanoprev := '';
                   sNumrecebimento := '';
                   sFlgentrada := '';
                   sDataalimentacao := '';
                   sDatamov := '';
                   sVlrreal := '';
                   sIdtiporeserva := '';
                   sValorindice := '';
                   sIdbeneficio := '';
                   sVlrcotas := '';
                   sDatarecebimento := '';
                   sIdeventogerador := '';
                   sObservacao := '';  //Ewerton Beltramini - 16/11/2021 - SIG84982

                   //Lendo o Excel e capturando os dados...
                   sIdpessjur       :=  Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha,  1].Value));
                   sIdpessoa        :=  Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha,  2].Value));
                   sMesreferencia   :=  Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha,  3].Value));
                   sIdcontribuicao  :=  Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha,  4].Value));
                   sIdplanoprev     :=  Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha,  5].Value));
                   sNumrecebimento  :=  Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha,  6].Value));
                   sFlgentrada      :=  Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha,  7].Value));
                   sDataalimentacao :=  Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha,  8].Value));
                   sDatamov         :=  Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha,  9].Value));
                   sVlrreal         :=  Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 10].Value));
                   sIdtiporeserva   :=  Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 11].Value));
                   sValorindice     :=  Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 12].Value));
                   sIdbeneficio     :=  Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 13].Value));
                   sVlrcotas        :=  Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 14].Value));
                   sDatarecebimento :=  Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 15].Value));
                   sIdeventogerador :=  Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 16].Value));
                   sObservacao      :=  Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 17].Value));  //Ewerton Beltramini - 16/11/2021 - SIG84982


                   if sIdpessoa        = '' then sIdpessoa := 'NULL';
                   if sMesreferencia   = '' then sMesreferencia := 'NULL';
                   if sIdcontribuicao  = '' then sIdcontribuicao := 'NULL';
                   if sIdplanoprev     = '' then sIdplanoprev := 'NULL';
                   if sNumrecebimento  = '' then sNumrecebimento := 'NULL';
                   if sFlgentrada      = '' then sFlgentrada := 'NULL';
                   if sDataalimentacao = '' then sDataalimentacao := 'NULL';
                   if sDatamov         = '' then sDatamov := 'NULL';
                   if sVlrreal         = '' then sVlrreal := 'NULL';
                   if sIdtiporeserva   = '' then sIdtiporeserva := 'NULL';
                   if sValorindice     = '' then sValorindice := 'NULL';
                   if sIdbeneficio     = '' then sIdbeneficio := 'NULL';
                   if sVlrcotas        = '' then sVlrcotas := 'NULL';
                   if sDatarecebimento = '' then sDatarecebimento := 'NULL';
                   if sIdeventogerador = '' then sIdeventogerador := 'NULL';
                   if sObservacao      = '' then sObservacao := 'NULL';   //Ewerton Beltramini - 16/11/2021 - SIG84982


                   //Salvando nas tabelas...
                   QryImportacaoArquivo.Close;
                   QryImportacaoArquivo.SQL.Clear;
                   QryImportacaoArquivo.SQL.Add(' Insert into histmovreserva ');
                   QryImportacaoArquivo.SQL.Add(' (IDHISTRESERVA, IDPESSJUR, IDPESSOA, MESREFERENCIA, IDCONTRIBUICAO, IDPLANOPREV, NUMRECEBIMENTO, FLGENTRADA, DATAALIMENTACAO, ');
                   QryImportacaoArquivo.SQL.Add('  DATAMOV, VLRREAL, IDTIPORESERVA, VALORINDICE, IDBENEFICIO, VLRCOTAS, DATARECEBIMENTO, IDEVENTOGERADOR, idimportacaohistmoverserva, OBSERVACAO)');   //Ewerton Beltramini - 16/11/2021 - SIG84982
                   QryImportacaoArquivo.SQL.Add(' values ( ');
                   QryImportacaoArquivo.SQL.Add(' CM.SEQHISTMOVRESERVA.NEXTVAL,');
                   QryImportacaoArquivo.SQL.Add(sIdpessjur + ',');
                   QryImportacaoArquivo.SQL.Add(sIdpessoa + ',');
                   QryImportacaoArquivo.SQL.Add(QuotedStr(sMesreferencia) + ',');
                   QryImportacaoArquivo.SQL.Add(sIdcontribuicao + ',');
                   QryImportacaoArquivo.SQL.Add(sIdplanoprev + ',');
                   QryImportacaoArquivo.SQL.Add(sNumrecebimento + ',');
                   QryImportacaoArquivo.SQL.Add(sFlgentrada + ',');
                   QryImportacaoArquivo.SQL.Add(QuotedStr(sDataalimentacao) + ',');
                   QryImportacaoArquivo.SQL.Add(QuotedStr(sDatamov) + ',');
                   QryImportacaoArquivo.SQL.Add(StringReplace(StringReplace(sVlrreal,'.','',[rfReplaceAll, rfIgnoreCase]),',','.',[rfReplaceAll, rfIgnoreCase]) + ',');
                   QryImportacaoArquivo.SQL.Add(sIdtiporeserva + ',');
                   QryImportacaoArquivo.SQL.Add(StringReplace(sValorindice,',','.',[rfReplaceAll, rfIgnoreCase]) + ',');
                   QryImportacaoArquivo.SQL.Add(sIdbeneficio + ',');
                   QryImportacaoArquivo.SQL.Add(StringReplace(sVlrcotas,',','.',[rfReplaceAll, rfIgnoreCase]) + ',');
                  if sDatarecebimento = 'NULL' then // SIG99737
                       QryImportacaoArquivo.SQL.Add(sDatarecebimento + ',') // SIG99737
                  else // SIG99737
                        QryImportacaoArquivo.SQL.Add(Quotedstr(sDatarecebimento) + ',');
                   QryImportacaoArquivo.SQL.Add(sIdeventogerador + ',');
                   QryImportacaoArquivo.SQL.Add(sSeq);
                   //Ewerton Beltramini - 16/11/2021 - SIG84982 - inicio...
                   if sObservacao = 'NULL' then
                      QryImportacaoArquivo.SQL.Add(',' + sObservacao)
                   else
                      QryImportacaoArquivo.SQL.Add(',' + QuotedStr(sObservacao));
                   //Ewerton Beltramini - 16/11/2021 - SIG84982 - Fim
                   QryImportacaoArquivo.SQL.Add(')');
                   try // SIG99737
                        QryImportacaoArquivo.ExecSql;
                   Except  // SIG99737 - Inicio
                     on E: Exception do
                      begin
                       MsgDlg('Erro: '+ E.Message,'Informação',mtInformation,[mbOk],0);
                       bIsErro:= True;
                        if dtmBaseDados.dbBaseDados.InTransaction then
                         dtmBaseDados.dbBaseDados.Rollback;
                         result := false;


                      end;
                   end; // SIG99737 - Fim

                   inc(linha);
                   frmProgresso.AndaFormProgresso(linha);
                   frmProgresso.Refresh;

              end;
			//if dtmBaseDados.dbBaseDados.InTransaction SIG99737
              if dtmBaseDados.dbBaseDados.InTransaction and not bIsErro then
              begin
                 dtmBaseDados.dbBaseDados.Commit;
                 result := true;
              end
              else // SIG99737 - Inicio
                begin
                 if dtmBaseDados.dbBaseDados.InTransaction then
                 begin
                  dtmBaseDados.dbBaseDados.Rollback;
                  result := false;
                 end;
                end; // SIG99737 - Fim


            except

              if dtmBaseDados.dbBaseDados.InTransaction then
                 dtmBaseDados.dbBaseDados.Rollback;
                 result := false;

            end;

     finally
      Excel.ActiveWorkBook.Saved:= 1;
      Excel.DisplayAlerts:= 0;
      Excel.ActiveWorkBook.Close(SaveChanges:= 0);
      Excel.Workbooks.Close;
      Excel.Quit;
      Excel := Unassigned;

      frmProgresso.EscondeFormProgresso;

     end;
end;
//Ewerton Beltramini - SIG98772 - 11/03/2020 - fim.

procedure TfrmAlimentaReserva.FormActivate(Sender: TObject);
begin
  inherited;
  QryExcluirArquivo.Close;             //Ewerton Beltramini - SIG98772 - 11/03/2020
  QryExcluirArquivo.Open;              //Ewerton Beltramini - SIG98772 - 11/03/2020
end;

//Ewerton Beltramini - SIG98772 - 11/03/2020 - Inicio...
procedure TfrmAlimentaReserva.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  inherited;
  bnavegador:= True;
  MemoDescricao.Text := QryExcluirArquivo.FieldByName('descricao').AsString;
  EdtUsuario.Text    := QryExcluirArquivo.FieldByName('nomeusuario').AsString;
  EdtData.Text       := QryExcluirArquivo.FieldByName('data').AsString;
end;
//Ewerton Beltramini - SIG98772 - 11/03/2020 - Fim.

//Ewerton Beltramini - SIG98772 - 11/03/2020 - Inicio...
procedure TfrmAlimentaReserva.SpeedButton1Click(Sender: TObject);
var    Excel : Variant;
begin
  inherited;
    //Carregando o excel...
    Excel := CreateOleObject('Excel.application');
    Excel.Visible := True;
    //Excel.WorkBooks.Open(ExpandUNCFileName('\\altarf\#altarf\GETIF_PUBLICO\COARI\Modelos\INSERT HISTMOVRESERVA.xlsb'),1);                // Andre Imakawa - WO8381
    //Excel.WorkBooks.Open(ExpandUNCFileName('\\Funcef.com.br\arquivos\Planus\Documentos\COARI\Modelos\INSERT HISTMOVRESERVA.xlsb'),1);   // Andre Imakawa - WO8381
    Excel.WorkBooks.Open(ExpandUNCFileName('\\Funcef.com.br\arquivos\PLANUS_COARI\Modelos\INSERT HISTMOVRESERVA.xlsb'),1);   // Andre Imakawa - WO9432
//  Excel.WorkBooks[1].SaveAs('c:\INSERT HISTMOVRESERVA.xlsb');
//  Excel.DisplayAlerts:= 0;
//  Excel.ActiveWorkBook.Close(SaveChanges:= 0);
//  Excel.Workbooks.Close;
//  Excel.Quit;
//  Excel := Unassigned;

end;
//Ewerton Beltramini - SIG98772 - 11/03/2020 - Fim.

end.

