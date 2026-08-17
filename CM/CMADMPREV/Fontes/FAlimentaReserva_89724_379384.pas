unit FAlimentaReserva_89724_379384;

// Alterações:
{---------------------------------------------------------------------------------------------------
Autor(a)  : Claudio Faria
Data      : 16/08/2007
Rotina    : Varias
Pendencia : 19962
Alteração : Troca do DateToStr para FormatDateTime.
----------------------------------------------------------------------------------------------------
Autor(a)  : André Pontes
Data      : 17/05/2007
Rotina    : bbtnProcurarClick(...)
Pendencia : 25315
Alteração : Controle de retorno do MontaSelect. Não retornando, nada faz, para evitar erro.
----------------------------------------------------------------------------------------------------
Autor(a)  : André Pontes
Data      : 20/10/2006
Rotina    : CriaReservaPatroColetiva
Pendencia : 23563
Alteração : Gravação do campo IDPARTICIPANTE no insert na ReservaPart
----------------------------------------------------------------------------------------------------
Autor(a)  : Claudio Faria
Data      : 25/09/2006
Rotina    : MontaPainelValoresCotas, MontaPainelValoresIndexados
Pendencia : 19644 (Reabertura)
Alteração : Correção da pendencia 19644, Só estava totalizando por cotas.
----------------------------------------------------------------------------------------------------
Autor(a)  : Claudio Faria
Data      : 17/07/2006
Rotina    : MontaPainelValoresCotas, MontaPainelValoresIndexados
Pendencia : 19644
Alteração : Pertitir consulta das contas com o total das patrocinadoras.
----------------------------------------------------------------------------------------------------
Autor(a)  : Gleyber
Data      : 15/05/2006
Rotina    : MontaPainelValoresCotas, MontaPainelValoresIndexados
Pendencia : 22144
Alteração : Alteração do número de casas decimais para oito.
----------------------------------------------------------------------------------------------------
Autor(a)  : Gleyber
Data      : 29/12/2004
Rotina    : MontaPainelValoresCotas, MontaPainelValoresIndexados e CriaReservaPatroColetiva
Pendencia : 18284
Alteração : Cria a reserva coletiva para a patro/plano caso não haja.
----------------------------------------------------------------------------------------------------
Autor(a)  : Camille
Data      : 21.10.2004
Rotina    : Diversas
Pendencia : 17859
Alteração : Exibir o indice e valor do indice para as reservas que não são guardadas em cotas
----------------------------------------------------------------------------------------------------
Autor(a)  : Gleyber
Data      : 14/10/2004
Rotina    : MontaOperacao
Pendencia : 17916
Alteração : Altera o número de casas decimais de acordo com a moeda escolhida.
----------------------------------------------------------------------------------------------------
Autor(a)  : Camille
Data      : 15.09.2004
Rotina    : ----
Pendencia : 17685
Alteração : Opção de não pedir a data de alimentacao e usar como esta
            a data de recebimento de contribuicoes
----------------------------------------------------------------------------------------------------
Rotina    : ----
Autor(a)  : Camille
Pendência : ----
Data      : 24.06.2004
Descricao : Mudei a tela e sua funcionalidade
----------------------------------------------------------------------------------------------------
Rotina    : MontaSelectPartBeforeOpenCds
Autor(a)  : Gleyber
Pendência : 16921
Data      : 03/06/2004
Descricao : Incluído Alias no Order By
----------------------------------------------------------------------------------------------------
Rotina    : MontaSelectPartBeforeOpenCds
Autor(a)  : Gleyber
Pendência : 16846
Data      : 26/05/2004
Descricao : Incluida funcionalidade para criar uma ordenação forçada em montaselect.
----------------------------------------------------------------------------------------------------
Autor(a)  : Ricardo Vigorito
Data      : 26/03/2004
Pendência : 16193
Alteração :  Foi Includio o pedido de data de referencia na tela.
----------------------------------------------------------------------------------------------------
Rotina    : MontaSelectPart
Autor(a)  : Gleyber
Data      : 27/11/2003
Pendência : 16017
Alteração : Alteração no tipo de dado do MontaSelect
----------------------------------------------------------------------------------------------------
Rotina    : MontaSelectPart
Autor(a)  : Gleyber
Data      : 27/11/2003
Pendência : 15062
Alteração : Colocada como primeira coluna o nº de inscrição
----------------------------------------------------------------------------------------------------
Rotina    : AlimentaReserva
Autor(a)  : Leo
Data      : 01/10/2003
Alteração : modificação para colocar o pnlBotao visível ou não conforme a opção
----------------------------------------------------------------------------------------------------
Rotina    : AlimentaReserva
Autor(a)  : Leo
Data      : 01/10/2003
Alteração : modificação para colocar o pnlBotao visível ou não conforme a opção
----------------------------------------------------------------------------------------------------
Autor(a)  : Augusto
Data      : 17/09/2003
Alteração : MontaSelect de participante agora pega os desativados (FLGDESATIVADO = 1 ou 0)
            para que se possa mexer na reserva dos cancelados (FUNCEF-Dennys)
----------------------------------------------------------------------------------------------------
Autor(a)  : Carlos Guedes
Data      : 05/08/2003
Alteração : bbtnOkClick: Ao fazer uma retirada do valor integral, o sistema
           estava efetuando um cálculo onde se gerava um lixo. Este lixo era
           usado em cálculos como se fosse uma diferença válida,e tratada como tal.
----------------------------------------------------------------------------------------------------
Autor(a)  : Camille
Data      : 23.06.2003
Alteração : Inclusao do Filtro de MULTI-FUNDACAO
----------------------------------------------------------------------------------------------------
Rotina    : cmtvTipoReservaChange
Autor(a)  : Gleyber
Data      : 12/02/2003
Alteração : Atualiza valores após mudança do item na arvore
----------------------------------------------------------------------------------------------------
Rotina    : bbtnProcurarClick
Autor(a)  : Camille
Data      : 06.02.2003
Alteração : Remontar arvore de reservas apos escolha do participante
---------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, ComCtrls,
  CMTree, Db, DBTables, Wwquery, Wwdatsrc, DBCtrls, Mask, wwdbedit, TREdit, MontaSelect, TEdNum, TB97Tlbr, IvDictio, IvMulti,
  IvEMulti, wwdbdatetimepicker, CMDateTimePicker, wwdblook;

type
  TfrmAlimentaReserva_89724_379384 = class(TfrmSairAjuda)
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
  public
    { Public declarations }
  end;

var
  frmAlimentaReserva_89724_379384: TfrmAlimentaReserva_89724_379384;

  sFlgColetiva, sTipo: string;

  procedure AlimentaReserva(pTipo: string; bConsulta : Boolean);

implementation

uses
    UMensErro, UAdmPrev, fAguarde, DAPrev, UParticipante, UMovReserva,
    Usistema, FCalculaReservaPart;

{$R *.DFM}

procedure AlimentaReserva(pTipo: string; bConsulta : Boolean);
begin
  Application.CreateForm(TfrmAlimentaReserva, frmAlimentaReserva);

  sTipo := pTipo;

  
  If sTipo = 'COLETIVA' Then
    frmAlimentaReserva.HelpContext := 160057
  else
    frmAlimentaReserva.HelpContext := 160056;


  frmAlimentaReserva.pnlOperacao.visible :=  not bConsulta;
  frmAlimentaReserva.pnlConsultaEmOutraData.Visible := bConsulta; 
  frmAlimentaReserva.lbConsulta := bConsulta;

  frmAlimentaReserva.ShowModal;
  frmAlimentaReserva.Free;
end;

procedure TfrmAlimentaReserva_89724_379384.FormShow(Sender: TObject);
begin
  inherited;
  if sTipo = 'PARTICIPANTE' then // Consulta Reservas do Participante
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
  cmbOperacao.Text        := '';
  reValorOperacao.Text    := '';
  cmbTipo.Text            := '';
  edAnoMesRef.Text        := '';

  dtCotacao.Text          := FormatDateTime('dd/mm/yyyy', Date);

  edIndiceOperacao.Text   := '';
  dtConsultaHist.Text     := '';         
  lblConsCotas.Caption       := FormatFloat('#0.00000000',0);
  lblConsIndice.Caption      := FormatFloat('#0.00000000',0);
  lblConsReal.Caption        := FormatFloat('#0.00',0);
  lblConsDataIndice.Caption  := '(00/00/0000)';
  lblMensagem.Caption        := '';

  bbtnProcurar.Click();
end;

procedure TfrmAlimentaReserva_89724_379384.bbtnProcurarClick(Sender: TObject);
var
  sMsgErro : string;
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
  qryReservaXPlano.SQL.Add(' SELECT R.CODHIERARQUIA, R.ANALITICOSINTETI,   R.NOME,                                      '+
                           '        R.FLGCONTROLE,   R.IDTIPORESERVA,      R.INDICEREAJUSTE,                            '+
                           '        R.INDICECORRECAO,                                                                   '+
                           '        R.IDPLANOPREV,   R.FLGCOLETIVA,        R.FLGMODATUALIZACAO,                         '+
                           '        DECODE(R.FLGMODATUALIZACAO, 1, R.INDICECORRECAO, R.INDICEREAJUSTE) AS MOECODIGO,    '+
                           '        DECODE(R.FLGMODATUALIZACAO, 1, MINDICE.MOESIGLA, MCOTAS.MOESIGLA) AS MOESIGLA,      '+
                           '        DECODE(R.FLGMODATUALIZACAO, 1, ''Reserva em Valor Monetário (Índice)'',             '+
                           '                                       ''Reserva em Cotas'') AS MODOATUALIZACAO             '+
                           ' FROM   RESERVAXPLANO R, MOEDA MCOTAS, MOEDA MINDICE                                        '+
                           ' WHERE  R.IDPLANOPREV = ' +sIdPlanoPrev                                                      +
                           ' AND    R.INDICEREAJUSTE = MCOTAS.MOECODIGO(+)                                              '+
                           ' AND    R.INDICECORRECAO = MINDICE.MOECODIGO(+)                                             ');
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



procedure TfrmAlimentaReserva_89724_379384.qryReservaXPlanoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if (Trim(sIdPessoa)  = '') or ( not qryReservaxPlano.Active) then Exit;
  lblSaldoCotas.Caption   := 'Saldo Atual (cotas) : ';
  lblDescOperacao.Caption := 'Valor a Adicionar (cotas) : ';
  lblNovoSaldo.Caption    := 'Novo Saldo (Cotas) : ';
  cmbOperacao.Text        := '';
  reValorOperacao.Text    := '';
  cmbTipo.Text            := '';
  edAnoMesRef.Text        := '';

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

procedure TfrmAlimentaReserva_89724_379384.MostraValores;
begin
  if (not qryReservaxPlano.Active) or (qryReservaXPlano.IsEmpty)
  then Exit;

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

procedure TfrmAlimentaReserva_89724_379384.MontaPainelValoresCotas;
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

procedure TfrmAlimentaReserva_89724_379384.MontaPainelValoresIndexados;
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

procedure TfrmAlimentaReserva_89724_379384.bbtnOkClick(Sender: TObject);
var iFlgEntrada             : word;
    sMsgErro                : string;

    dValorOperacaoEmCotas : double;
    dValorOperacaoEmReais : double;
    dValorIndice          : double;
    dSaldoAtual           : double;
    dNovoSaldo            : double;
    sDataIndice           : string;
begin
    if (reValorOperacao.Text = '0') or (reValorOperacao.Text = '0.00') or
       (reValorOperacao.Text = '0,00') or   (edAnoMesRef.Text = '' )   or
       (Trim(edAnoMesRef.Text) = '/' )   
    then Exit;


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
    end;

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
                                            -1, // idcontribuicao
                                            -1, // ideventogerador
                                            -1, // idregracalculo
                                            0,
                                            dValorOperacaoEmCotas,
                                            dValorOperacaoEmReais,
                                            dNovoSaldo,
                                            dValorIndice,
                                            sDataIndice, 
                                            FormatDateTime('dd/mm/yyyy', Date), 
                                            edAnoMesRef.Text, 
                                            iFlgEntrada,
                                            1 )
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

  MsgDlg('Alimentação da Reserva efetuada com sucesso.','Informação',mtInformation,[mbOk,mbHelp],0);

end;

procedure TfrmAlimentaReserva_89724_379384.reValorOperacaoExit(Sender: TObject);
begin
  inherited;
  if (reValorOperacao.Text = '0') or (reValorOperacao.Text = '0.00') or
     (reValorOperacao.Text = '0,00')
  then reValorOperacao.Text := '0';
  MontaOperacao;
end;

procedure TfrmAlimentaReserva_89724_379384.cmtvTipoReservaChange(Sender: TObject);
begin
  inherited;
  MostraValores;  
end;

procedure TfrmAlimentaReserva_89724_379384.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  reValorOperacao.Text := '0';
end;

procedure TfrmAlimentaReserva_89724_379384.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryReservaPart.Close;
  qryCotacao.Close;
  qryReservaxPlano.Close;
  inherited;
end;

procedure TfrmAlimentaReserva_89724_379384.reValorOperacaoEnter(Sender: TObject);
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


procedure TfrmAlimentaReserva_89724_379384.MontaSelectPartBeforeOpenCds(
  var sqlText: String; strListParams: TStringList);
begin
  inherited;
  sqlText := Copy(sqlText, 1, Pos('ORDER BY', sqlText)-1);
  sqlText := sqlText + ' ORDER BY C5'; 
end;

procedure TfrmAlimentaReserva_89724_379384.MontaOperacao;
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
    end;

    if (dNovoSaldo < 0) and (cmbOperacao.Text <> '') and (cmbTipo.Text <> '') and (dValorOperacaoEmCotas > 0)
    then begin
       MsgDlg('Operação Não Permitida pois gera Saldo Negativo.','Erro',mtError,[mbOk],0);
       reValorOperacao.Text := '0';
       MontaOperacao;
    end;
end;

procedure TfrmAlimentaReserva_89724_379384.cmbOperacaoChange(Sender: TObject);
begin
  inherited;
  MontaOperacao;
end;

procedure TfrmAlimentaReserva_89724_379384.cmbTipoChange(Sender: TObject);
begin
  inherited;
  MontaOperacao;
end;

procedure TfrmAlimentaReserva_89724_379384.edAnoMesRefExit(Sender: TObject);
begin
  inherited;
  MontaOperacao;
end;

procedure TfrmAlimentaReserva_89724_379384.dtCotacaoChange(Sender: TObject);
begin
  inherited;
  MontaOperacao;
end;

procedure TfrmAlimentaReserva_89724_379384.dtConsultaHistChange(Sender: TObject);
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


function TfrmAlimentaReserva_89724_379384.CriaReservaPatroColetiva(psIdpessjur, psIdPlanoPrev: String): Boolean;
Var
 sSql : String;
begin
 Result := False;

 If sTipo = 'PARTICIPANTE'
  Then Exit;

 If sTipo = 'COLETIVA'
  Then Begin
       sSql := ' SELECT FLGTITULARCOLET '+
               ' FROM RESERVAXPLANO '+
               ' WHERE IDTIPORESERVA = '+qryreservaxplano.fieldbyname('IDTIPORESERVA').AsString+
               '   AND IDPLANOPREV   = '+psIdPlanoPrev;
       qryAux.Close;
       qryAux.SQL.Clear;
       qryAux.SQL.Add(sSql);
       qryAux.open;

       If qryAux.FieldByName('FLGTITULARCOLET').AsString <> 'P'
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
                     '1, '+                                                       // SEQPROPOSTA
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


procedure TfrmAlimentaReserva_89724_379384.wwdbcbPatrocinadoraChange(Sender: TObject);
begin
   inherited;
   sIdPessJur := qryPatro.FieldByName('IDPESSJUR').AsString;
   sFlagAtivo := qryPatro.FieldByName('FLGATIVO').AsString;

   cmtvTipoReservaChange(Sender);
end;



end.
