{ Alterações
**********************************************************************
*******************************************************************************
Analista.: William Moreira da Silva         
SOL......: 27632
Data.....: 23/08/2015
Rotina...: Todas
Descrição: Alterar nome do menu, e desabilitar combo "Folha de Beneficios" (.DFM)
*******************************************************************************
Analista.: Wylliam Leite da Silva - SOL:246488 PPM:1026389
SOL......: 246488
PPM......: 1026389
Data.....: 20/08/2015
Rotina...: Rotina de Busca IRRF
Descrição: Correção do Valor Idoso.
********************************************************************************
Analista...: edilaine Ferraresi
N. Sol.....: 208308-15657
N. Kintana.: 2058286
Data.......: 28/04/2014
Rotina.....: .dfm, varias funcionalidades (rgSistema.itemindex)
Descrição..: restringir acesso do usuário a funcionalidade
********************************************************************************
Analista.: Thiago Melo
SOL......: 219647
Kintana..: 2052740
Data.....: 13/11/2013
Rotina...: Ajuse no DFM
Descrição: Impossibilidade de inserir o CPF 09264611762 na lista de pessoas
********************************************************************************
Analista.: higor Nayde Ferreira
SOL......: 197522
Kintana..: 197522
Data.....: 03/01/2013
Rotina...: VerificarInforme
Descrição: Validação para evitar a criação de duas linhas com IdInforme 91
********************************************************************************
Analista.: Marcos Luiz de Jesus
Data.....: 30/06/2010
Kintana..: 850158
Sol......: 138907
Descrição: Correção da mensagem ao confirmação geração quando não estiver
           marcado a opção "Geração Lista de Pessoas"
**********************************************************************
Analista.: Arnaldo V. Scarin
Data.....: 08/02/2009
Kintana..: 128371
Sol......: 686870
Descrição: Criação de Flag para calcular exclusivamente os beneficiários
           que tenham 13o.Salario Encerrado.
**********************************************************************
Analista.: Ricardo Alves
Data.....: 05/08/2009
Kintana..: 122481
Sol......: 601965
Rotina...: bbtnConfirmaGeracaoClick
Descrição: Utilização de natureza específica.
**********************************************************************
Analista.: Bruno Bastos
Kintana..: 592548
Sol......: 121932
Rotina...: bbtnConfirmaGeracaoClick
Descrição: Permitir executar mais de uma versão para um tipo de natureza.
**********************************************************************
Analista.: Claudio Faria
Pendencia: 24663
Rotina...: Varias
Descrição: Passar uma lista de matriculas na busca.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 19152
Rotina...: bbtnConfirmaGeracaoClick
Descrição: Passar o idpessoa mesmo quando for folha de pagamento, ou seja, fazer
           a busca individualmente.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 21724
Rotina...: FormCreate
Descrição: Passei a chamar as rotinas CalcProxDiaSemana, CalcDataIni, CalcDataFim
           da uCtrlModuloIRRF, para calcular a data inicial e final a ser mostrada
           inicialmente ao usuário.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 21254
Rotina...: Várias
Descrição: Alteração na tela para permitir fazer a busca por rubricas também.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 19064
Rotina...: bbtnConfirmaGeracaoClick
Descrição: Está sendo passado mais um parâmetro para as funções gerafolha, que
           indica se os campos CodIrrfDarf e IdInforme, serão buscados na ProvDesc
           ou somente na HistRubSal. Caso busque as informações da ProvDesc,
           será feita uma atualização destes campos na HistRubSal e depois será
           feito a busca normalmente nesta tabela.
*********************************************************************
Analista.: Marchetti
Pendencia: 18111
Rotina...: bbtnConfirmaGeracaoClick
Descrição: Retirada a obrigatoriedade de indicação da versão da folha de benefícios
**********************************************************************
}

Unit FGeraFolhaMT;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, wwdblook, ExtCtrls, wwdbdatetimepicker,
  CMDateTimePicker, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, uCtrlNatuRendimento, Db, DBClient, uCMClientDataSet,
  uCtrlGeraFolha, uCtrlGeraFolhaFUNCEF, ComCtrls, MontaSelect, DBTables,
  DBCtrls, uCtrlModuloIRRF, fFrameLista, uCtrlDirf2008, FileCtrl, TEdNum;

Type
  TfrmGeraFolhaMT = Class(TfrmSairAjuda)
    cdsNaturRendimento: TCMClientDataSet;
    cdsParamIRRF: TCMClientDataSet;
    bbtnConfirmaGeracao: TBitBtn;
    cdsParamFolha: TCMClientDataSet;
    MontaSelectBenef: TMontaSelect;
    qryVersoes: TQuery;
    dsVersoes: TDataSource;
    memResult: TMemo;
    pgcProcessaBusca: TPageControl;
    tbsFolha: TTabSheet;
    tbsNatuzaRendimento: TTabSheet;
    gbxNaturezaGlobal: TGroupBox;
    dblcNatRendimento: TwwDBLookupCombo;
    rdgFiltro: TRadioGroup;
    tbsBuscaIndividual: TTabSheet;
    lblCPFPA: TLabel;
    Label4: TLabel;
    edCPFFavPA: TEdit;
    edNomeFavPA: TEdit;
    sbtnAddFav: TSpeedButton;
    sbtnRemFav: TSpeedButton;
    tbsDataProc: TTabSheet;
    tbsGeraRubrica: TTabSheet;
    grpDataProc: TGroupBox;
    lblDataInicial: TLabel;
    Label1: TLabel;
    dedDataFim: TCMDateTimePicker;
    dedDataIni: TCMDateTimePicker;
    grbOutrasInformacoes: TGroupBox;
    cbxIndividual: TCheckBox;
    chkGeraPorRubrica: TCheckBox;
    grbOpcoesFolhaBenef: TGroupBox;
    Label5: TLabel;
    dblcNatureza: TwwDBLookupCombo;
    GroupBox1: TGroupBox;
    chkBuscaProvDesc: TCheckBox;
    grbListaRubricas: TGroupBox;
    edtCodRub: TEdit;
    Label2: TLabel;
    edtListaPessoa: TEdit;
    Label3: TLabel;
    tbsRevisao: TTabSheet;
    Label6: TLabel;
    lstRevisao: TListBox;
    BtnImportar: TBitBtn;
    OpenDialog1: TOpenDialog;
    tbsListaPessoa: TTabSheet;
    frmFrameListaBenef1: TfrmFrameListaBenef;
    Splitter1: TSplitter;
    pnl_tempo: TPanel;
    lbl_inicio: TLabel;
    lbl_final: TLabel;
    lbl_decorrido: TLabel;
    lblContagem: TLabel;
    tsDecimoTerceiro: TTabSheet;
    grpDecimoTerceiro: TGroupBox;
    lblInicio: TLabel;
    lblTermino: TLabel;
    pnlDecimoterceiro: TPanel;
    chkQuebrarPorCPF: TCheckBox;
    udInicio: TUpDown;
    edtInicio: TEditNum;
    edtTermino: TEditNum;
    udTermino: TUpDown;
    chkUsarAnoTodo: TCheckBox;
    grpTipoDirf: TGroupBox;
    chkDirfNormal: TCheckBox;
    chkDirfMolestia: TCheckBox;
    chkDirf13Salario: TCheckBox;
    chkDirf13SalBenEnc: TCheckBox;
    ckbCPF: TCheckBox;
    tbsCPFS: TTabSheet;
    gbCpfs: TGroupBox;
    lbCpfs: TListBox;
    BitBtn1: TBitBtn;
    pnlSistemas: TPanel;
    rbBuscaFlPagto: TRadioButton;
    rbBuscaFlBenef: TRadioButton;
    Procedure edCodigoFolhaValKeyPress(Sender: TObject; Var Key: Char);
    Procedure rgSistemaClick(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure bbtnConfirmaGeracaoClick(Sender: TObject);
    Procedure edCodigoFolhaInvKeyPress(Sender: TObject; Var Key: Char);
    Procedure LimpaCampos;
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure rdgFiltroClick(Sender: TObject);
    Procedure FormShow(Sender: TObject);
    Procedure sbtnAddFavClick(Sender: TObject);
    Procedure cbxIndividualClick(Sender: TObject);
    Procedure chkGeraPorRubricaClick(Sender: TObject);
    Procedure edtListaPessoaChange(Sender: TObject);
    Procedure BtnImportarClick(Sender: TObject);
    Procedure sbtnRemFavClick(Sender: TObject);
    Procedure chkQuebrarPorCPFClick(Sender: TObject);
    Procedure ckbCPFClick(Sender: TObject);
    Procedure BitBtn1Click(Sender: TObject);
    Procedure frmFrameListaBenef1bbtnIncluiBenefClick(Sender: TObject);
    Procedure rbBuscaFlPagtoClick(Sender: TObject);
  Private
    NatuRendimento: TctrlNaturendimento;
    Folha: TCtrlGeraFolha;
    FolhaFUNCEF: TCtrlGeraFolhaFUNCEF;
    ModuloIRRF: TCtrlModuloIRRF;
    lstpart: TStringList;
    iListaUsuario: Integer;
    Procedure SalvarArquivoLog(Const iVersao: Integer);
    Procedure AjustaCampos(Const bMostraFolhaPagto: Boolean);
  Public
    { Public declarations }
    dInicio, dFim: TDateTime;
    iQtdDecVlrIdosoFixo: Integer; //Wylliam Leite da Silva - SOL:246488 PPM:1026389
    sIDPESSOA: String; //Wylliam Leite da Silva - SOL:246488 PPM:1026389
  End;

Var frmGeraFolhaMT: TfrmGeraFolhaMT;

Implementation

Uses USistema, UMensErro, UDatabase, DBaseDados;

{$R *.DFM}

Procedure TfrmGeraFolhaMT.edCodigoFolhaValKeyPress(Sender: TObject;
  Var Key: Char);
Begin
  Inherited;
  If Not ((key In ['0'..'9']) Or (key In [#9, #16, #27, #8, #44, #32])) Then
    Begin
      key := #0;
    End;
End;

Procedure TFrmGeraFolhaMT.AjustaCampos(Const bMostraFolhaPagto: Boolean);
Begin
  //William Moreira da Silva - SIG 27632
  //grbOpcoesFolhaBenef.Visible := Not bMostraFolhaPagto;
  //grpTipoDirf.Visible         := Not bMostraFolhaPagto;
  //chkBuscaProvDesc.Checked    := bMostraFolhaPagto;
  //chkBuscaProvDesc.Enabled    := Not bMostraFolhaPagto;
  //tsDecimoTerceiro.TabVisible := Not bMostraFolhaPagto;
  //William Moreira da Silva - SIG 27632
  LimpaCampos;
End;

Procedure TfrmGeraFolhaMT.rgSistemaClick(Sender: TObject);
Begin
  // edilaine - SOL 208308-15657 / KTN 2058286 - comentado
  //  inherited;
  //  AjustaCampos( rgSistema.ItemIndex = 0);
End;

Procedure TfrmGeraFolhaMT.FormCreate(Sender: TObject);
Var
  dDataVenc: TDateTime;

Begin
  Inherited;
  NatuRendimento := TCtrlNatuRendimento.create;
  NatuRendimento.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType, Sistema.ConnectionSide,
    Sistema.AppRemoteServer, True, Nil, Nil, False);

  Folha := TCtrlGeraFolha.create;
  Folha.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType, Sistema.ConnectionSide,
    Sistema.AppRemoteServer, True, Nil, Nil, False);
  FolhaFUNCEF := TCtrlGeraFolhaFUNCEF.create;
  FolhaFUNCEF.InitializeAs(Folha);

  ModuloIRRF := TCtrlModuloIRRF.Create;
  ModuloIRRF.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType, Sistema.ConnectionSide,
    Sistema.AppRemoteServer, True, Nil, Nil, False);

  dDataVenc := ModuloIRRF.CalcProxDiaSemana(sistema.IdEmpresa, Date, 3, True);
  dedDataIni.Date := ModuloIRRF.CalcDataIni(dDataVenc);
  dedDataFim.Date := ModuloIRRF.CalcDataFim(dDataVenc);
  dedDataIni.Text := DateToStr(dedDataIni.Date);
  dedDataFim.Text := DateToStr(dedDataFim.Date);

  cdsNaturRendimento.data := NatuRendimento.ListNaturendimento;

  lblcontagem.caption := '';
  bbtnConfirmaGeracao.enabled := true;

  If Sistema.TipoCliente <> 19991 Then
    Begin
      Label3.Visible := False;
      edtListaPessoa.Visible := False;
      tbsRevisao.TabVisible := False;
    End;
  lstpart := tStringList.create;
  grpDecimoTerceiro.Enabled := False;
  // Alterado por Arnaldo V. Scarin em 03/02/2010
  // Sol: 128371 KTN: 686870
  AjustaCampos(False);
End;

Procedure TfrmGeraFolhaMT.SalvarArquivoLog(Const iVersao: Integer);
Var sFile: String;
Begin
  sFile := 'C:\CMSOLUCOES\Executaveis\Logbusca';
  If Not DirectoryExists(sFile) Then
    ForceDirectories(sFile);
  sFile := sFile + '\Fol_' + IntToStr(iVersao) + '_' + FormatDateTime('hhMMss', Time()) + '.LOG';
  memResult.Lines.SaveToFile(sFile);
End;

Procedure TfrmGeraFolhaMT.bbtnConfirmaGeracaoClick(Sender: TObject);

Const aViews: Array[0..3] Of String = ('VW_DIRFGERAL', 'VW_DIRFMOLESTIAGRAVE',
    'VW_DIRFDECIMOTERCEIROSALARIO', 'VW_DIRFDECIMOTERCEIROSALARIO');
Const aTexto: Array[0..3] Of String = ('Dirf - Geral', 'Dirf - Moléstia Grave',
    'Dirf - 13º Salário', 'Dirf - 13º Salário Benef.Encerrado');
Const aTipoDirf: Array[0..3] Of tTipoDirf = (tdNormal, tdNormalMolestia,
    td13Salario, td13SalBeneficioEncerrado);

Var Ano, Mes, Dia: word;
  iVersao: Integer;
  //  iPessoa : Integer;
  bExecuta: Boolean;
  bProcessa: Boolean;
  oProcessaDirf: tProcessaDirf;
  i: integer;
  iOpSistema: integer; // edilaine - SOL 208308-15657 / KTN 2058286
Begin
  Inherited;
  bProcessa := False;
  iVersao := -1;

  DecodeDate(dedDataIni.DateTime, Ano, Mes, Dia);
  If dedDataIni.Text = '' Then
    Begin
      MsgDlg('Obrigatório Preencher a Data Inicial', 'Erro', mtError, [mbOK], 0);
      pgcProcessaBusca.ActivePage := tbsDataProc;
      dedDataIni.SetFocus;
      exit;
    End;

  If dedDataFim.Text = '' Then
    Begin
      MsgDlg('Obrigatório Preencher a Data Final', 'Erro', mtError, [mbOK], 0);
      pgcProcessaBusca.ActivePage := tbsDataProc;
      dedDataFim.SetFocus;
      exit;
    End;

  If dedDataIni.Date > dedDataFim.Date Then
    Begin
      MsgDlg('Data Inicial não pode ser superior a Data Final', 'Erro', mtError, [mbOK], 0);
      pgcProcessaBusca.ActivePage := tbsDataProc;
      dedDataIni.SetFocus;
      exit;
    End;

  If FormatDateTime('yyyymm', dedDataIni.Date) <> FormatDateTime('yyyymm', dedDataFim.Date) Then
    Begin
      MsgDlg('Deve ser selecionadas datas dentro do mesmo Mes para o Processamento!', 'Erro', mtError, [mbOK], 0);
      pgcProcessaBusca.ActivePage := tbsDataProc;
      dedDataIni.SetFocus;
      exit;
    End;

  If chkQuebrarPorCPF.checked And (edtInicio.Text > edtTermino.Text) Then
    Begin
      MsgDlg('O Digito de Inicio do CPF deve ser Menor ou Igual ao Digito de Término!', 'Erro', mtError, [mbOK], 0);
      pgcProcessaBusca.ActivePage := tsDecimoTerceiro;
      edtInicio.SetFocus;
      exit;
    End;

  If rdgfiltro.itemindex = 1 Then
    Begin
      If dblcNatRendimento.Text = '' Then
        Begin
          MsgDlg('Obrigatório Selecionar a Natureza de Rendimento ', 'Erro', mtError, [mbOK], 0);
          pgcProcessaBusca.ActivePage := tbsFolha;
          dblcNatRendimento.SetFocus;
          exit;
        End;
    End;

  // edilaine - SOL 208308-15657 / KTN 2058286 - inicio
  If rbBuscaFlPagto.Checked Then
    iOpSistema := 0
  Else If rbBuscaFlBenef.Checked Then
    iOpSistema := 1;
  // edilaine - SOL 208308-15657 / KTN 2058286 - fim

  // Folha de Benefícios
  If rbBuscaFlBenef.Checked {rgSistema.ItemIndex = 1} Then // edilaine - SOL 208308-15657 / KTN 2058286
    Begin
      //    If not cbxIndividual.checked then
      //    begin
      //      iPessoa := 0;
      //    end
      //    else
      Begin
        // Marcos Kintana..: 850158 Sol......: 138907
        If (cbxIndividual.checked) And (frmFrameListaBenef1.qryLista.IsEmpty) Then
          Begin
            MsgDlg('Obrigatório Selecionar o participante', 'Erro', mtError, [mbOK], 0);
            pgcProcessaBusca.ActivePage := tbsFolha;
            exit;
          End;
      End;
      If (dblcNatureza.Lookupvalue = '') Then
        Begin
          {Comentei esse código para o kintana 592548 e Sol 121932
          MsgDlg('Obrigatório selecionar a Versão da Folha de Benefícios.','Erro',mtError,[mbOK],0);
          pgcProcessaBusca.ActivePage := tbsFolha;
          exit;
          }
          //Tirei o comentário deste código para atender o kintana 592548 e Sol 121932
          //Bruno Bastos - kintana 592548 e Sol 121932 - Início
          If MsgDlg('Deseja gerar para todas as Versões da Folha de Benefícios?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
            Begin
              pgcProcessaBusca.ActivePage := tbsFolha;
              dblcNatureza.SetFocus;
              exit;
            End
          Else
            iVersao := -1;
          //Bruno Bastos - kintana 592548 e Sol 121932 - Fim
        End
      Else
        iVersao := qryVersoes.fieldbyname('IDHSTFOLHABENEF').asInteger;
    End;

  //  If MontaSelectBenef.Valoreschave.Count > 0 Then
  //    iPessoa := StrtoInt(MontaselectBenef.Valoreschave[0]);

  bExecuta := (MsgDlg('Deseja realmente efetuar a Geração do IRRF para os parâmetros selecionados ?',
    'Confirmação',
    mtConfirmation,
    [mbYes, mbNo], 0) = mrYes);

  If bExecuta Then
    Begin
      InicializaFormulario();
      // Se ano for 2008 e for processamento da folha de benefícios
      If (dedDataIni.Date >= StrToDate('01/01/2007')) And
        (rbBuscaFlBenef.Checked {rgSistema.ItemIndex = 1}) Then // edilaine - SOL 208308-15657 / KTN 2058286
        Begin
          oProcessaDirf := tProcessaDirf.Create;
          With oProcessaDirf Do
            Begin
              Initialize(DtmBaseDados.dbBaseDados,
                True,
                Sistema.ConnectionType,
                Sistema.ConnectionSide,
                Sistema.AppRemoteServer,
                True,
                Nil,
                Nil,
                False);
              Versao := iVersao;
              If chkQuebrarPorCPF.checked Then
                Begin
                  CPFInicial := StrToInt(edtInicio.Text);
                  CPFFinal := StrToInt(edtTermino.Text);
                End;
              UsarAnoTodo13Sal := chkUsarAnoTodo.checked;
              Empresa := Sistema.IdEmpresa;
              DataInicial := dedDataIni.Date;
              Cpf := frmFrameListaBenef1.qryLista.FieldByName('numdocumento').asString; //higor Nayde Ferreira SOL 197522 KTN 197522
              DataFinal := dedDataFim.Date;
              CodigoRubricas := edtCodRub.Text;
              UsaPlanoPatro := Sistema.UsaPlanoPatro;
              BuscaProvDesc := chkBuscaProvDesc.Checked;

              // Ricardo A. SOL 122481 KTN 601965
              UtilizaNaturezaEspecifica := (rdgfiltro.itemindex = 1);
              If UtilizaNaturezaEspecifica Then
                IDNaturezaEspecifica := dblcNatRendimento.LookupValue;

              If Not cbxIndividual.Checked Then
                Begin
                  If iListaUsuario <> 0 Then
                    Pessoas.Add(IntToStr(iListaUsuario))
                End
              Else
                Begin
                  frmFrameListaBenef1.qryLista.DisableControls;
                  With frmFrameListaBenef1.qryLista Do
                    Begin
                      First;
                      While Not Eof Do
                        Begin
                          Pessoas.Add(FieldByName('IDPESSOA').asString);
                          Next;
                        End;
                      First;
                    End;
                  frmFrameListaBenef1.qryLista.EnableControls;
                End;
              If ckbCPF.Checked Then
                Begin
                  Pessoas.Text := lbCpfs.Items.Text;
                  IsCPF := True;
                End;

              For i := 0 To 3 Do
                Begin
                  Case I Of
                    0: bProcessa := chkDirfNormal.Checked;
                    1: bProcessa := chkDirfMolestia.Checked;
                    2: bProcessa := chkDirf13Salario.Checked;
                    3: bProcessa := chkDirf13SalBenEnc.Checked;
                  End;
                  If Not bProcessa Then
                    Continue;
                  dInicio := Now;
                  Linha();

                  // Alterado por Arnaldo V. Scarin
                  // Sol 128371 Ktn: 686870
                  // Inclusão do processamento de 13o. Salario Beneficio Encerrado
                  If bProcessa And (i = 3) Then
                    UsarAnoTodo13Sal := True;

                  lblContagem.Caption := '';
                  MostraMensagem('Processo iniciado para a busca ' + aTexto[i]);
                  lbl_inicio.caption := 'Início: ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', dInicio);
                  application.ProcessMessages;
                  TipoDirf := aTipoDirf[i];
                  View := aViews[i];
                  ExecutarDirf(iQtdDecVlrIdosoFixo, sIDPESSOA);
                  dFim := Now;
                  MostraMensagem('Processo terminado para a busca ' + aTexto[i]);
                  lbl_final.Caption := 'Término: ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', dFim);
                  lbl_decorrido.caption := 'Tempo Decorrido: ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', dFim - dInicio);
                  MostraMensagem('Início: ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', dInicio) + '  ' +
                    'Término: ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', dFim) + '  ' +
                    'Tempo Decorrido: ' + FormatDateTime('hh:mm:ss', dFim - dInicio));
                  lbl_inicio.caption := 'Início:';
                  lbl_final.caption := 'Término:';
                  lbl_decorrido.Caption := 'Tempo Decorrido:';
                  application.ProcessMessages;
                End;
            End;
          SalvarArquivoLog(iVersao);
          FreeAndNil(oProcessaDirf);
          MostraMensagem('Processo encerrado!');
          MsgDlg('Operação efetuada com sucesso!', 'Aviso', mtWarning, [mbOK], 0);
          LimpaBarraStatus();
          LimpaCampos();
        End
          // Se não é 2008 ou se é 2008 e é o processamento da folha de pagamento
      Else
        Begin
          If (rbBuscaFlBenef.Checked {rgSistema.ItemIndex = 1}) And (FolhaFUNCEF.RetornaExcepcional) Then // edilaine - SOL 208308-15657 / KTN 2058286
            Begin
              If Not FolhaFUNCEF.GeraFolha(Sistema.IdEmpresa,
                iOpSistema {rgSistema.ItemIndex}, // edilaine - SOL 208308-15657 / KTN 2058286
                dedDataIni.text,
                dedDataFim.text,
                dblcNatRendimento.LookupValue,
                sistema.UsaPlanoPatro,
                rdgfiltro.itemindex,
                iversao,
                chkBuscaProvDesc.Checked,
                edtCodRub.Text,
                iListaUsuario, //CPrev - 24663
                lstPart) Then
                MsgDlg('A Operação não foi efetuada !', 'Atenção', mtWarning, [mbOK], 0)
              Else
                Begin
                  MsgDlg('Operação efetuada com sucesso!', 'Aviso', mtWarning, [mbOK], 0);
                  LimpaCampos;
                End;
            End
          Else
            Begin
              If Not Folha.GeraFolha(Sistema.IdEmpresa,
                iOpSistema {rgSistema.ItemIndex}, // edilaine - SOL 208308-15657 / KTN 2058286
                dedDataIni.text,
                dedDataFim.text,
                dblcNatRendimento.LookupValue,
                sistema.UsaPlanoPatro,
                rdgfiltro.itemindex,
                iversao,
                chkBuscaProvDesc.Checked,
                iListaUsuario, //CPrev - 24663
                edtCodRub.Text) Then
                MsgDlg('A Operação não foi efetuada !', 'Atenção', mtWarning, [mbOK], 0)
              Else
                Begin
                  MsgDlg('Operação efetuada com sucesso!', 'Aviso', mtWarning, [mbOK], 0);
                  LimpaCampos;
                End;
            End;
        End;
    End;
End;

Procedure TfrmGeraFolhaMT.edCodigoFolhaInvKeyPress(Sender: TObject;
  Var Key: Char);
Begin
  Inherited;
  If Not ((key In ['0'..'9']) Or (key In [#9, #16, #27, #8, #44, #32])) Then
    Begin
      key := #0;
    End;
End;

Procedure TfrmGeraFolhaMT.LimpaCampos;
Begin
  dblcNatRendimento.LookupValue := '';
  edNomeFavPA.text := '';
  edCPFFavPA.text := '';
  dblcNatureza.Lookupvalue := '';
End;

Procedure TfrmGeraFolhaMT.FormClose(Sender: TObject;
  Var Action: TCloseAction);
Begin
  Inherited;
  qryVersoes.Close;
  NatuRendimento.free;
  Folha.free;
  FolhaFUNCEF.Free;
  lstpart.free;
End;

Procedure TfrmGeraFolhaMT.rdgFiltroClick(Sender: TObject);
Begin
  Inherited;

  If rdgfiltro.itemindex = 0 Then
    gbxnaturezaglobal.Visible := False
  Else
    gbxnaturezaglobal.Visible := true;

End;

Procedure TfrmGeraFolhaMT.FormShow(Sender: TObject);
Begin
  Inherited;
  rbBuscaFlBenef.Checked := false; //SIG21776
  // edilaine - SOL 208308-15657 / KTN 2058286 - inicio
  If (rbBuscaFlPagto.Enabled) And (Not rbBuscaFlBenef.Enabled) Then
    rbBuscaFlPagto.Checked := true
  Else If ((rbBuscaFlBenef.Enabled) And (Not rbBuscaFlPagto.Enabled)) Or ((rbBuscaFlPagto.Enabled) And (rbBuscaFlBenef.Enabled)) Then
    rbBuscaFlBenef.Checked := false; //SIG21776

  bbtnConfirmaGeracao.Enabled := (rbBuscaFlPagto.Enabled) Or (rbBuscaFlBenef.Enabled);
  // edilaine - SOL 208308-15657 / KTN 2058286 - fim

  pgcProcessaBusca.ActivePage := tbsDataProc;

  rdgfiltro.itemindex := 0;
  qryVersoes.open;
  edCPFFavPA.enabled := cbxIndividual.checked;
  edNomeFavPA.enabled := cbxIndividual.checked;
  sbtnAddFav.enabled := cbxIndividual.checked;
  sbtnRemFav.enabled := cbxIndividual.checked;
  dblcNatureza.lookupvalue := '';
  edCPFFavPA.text := '';
  edNomeFavPA.text := '';

  frmFrameListaBenef1.DefineLista(0);

  //William Moreira da Silva - SIG 27632  
  rbBuscaFlPagto.Checked := true;

End;

Procedure TfrmGeraFolhaMT.sbtnAddFavClick(Sender: TObject);
Begin
  Inherited;

  If (rbBuscaFlBenef.Checked {rgSistema.ItemIndex = 1}) And (dblcNatureza.Text = '') Then // edilaine - SOL 208308-15657 / KTN 2058286
    Begin
      MsgDlg('Primeiro selecionar uma versão !!', 'Aviso', mtWarning, [mbOK], 0);
    End
  Else
    Begin
      MontaselectBenef.Filtro.clear;
      If (rbBuscaFlBenef.Checked {rgSistema.ItemIndex = 1}) Then // edilaine - SOL 208308-15657 / KTN 2058286
        Begin
          MontaselectBenef.Filtro.add(' ( HISTRUBSAL.IDMODULO = 18 ) ');
          MontaselectBenef.Filtro.add(' ( HISTRUBSAL.IDHSTFOLHABENEF = ' + qryVersoes.fieldbyname('IDHSTFOLHABENEF').asstring + ' ) ');
          MontaselectBenef.Filtro.add(' ( HISTRUBSAL.IDTITULAR = DEPENTIT.IDTITULAR ) ');
        End
      Else
        MontaselectBenef.Filtro.add(' ( HISTRUBSAL.IDMODULO = 21 ) ');

      MontaselectBenef.Filtro.add(' ( HISTRUBSAL.IDLANCIRRF IS NULL) ');
      MontaselectBenef.Filtro.add(' ( HISTRUBSAL.IDPESSOA = DEPENTIT.IDPESSOA ) ');
      MontaselectBenef.Filtro.add(' ( DEPENTIT.IDPESSOA = PESSOA.IDPESSOA ) ');

      MontaSelectBenef.Executar;
      If (MontaSelectBenef.ValoresChave.Count > 0) And
        (MontaSelectBenef.ValoresChave[1] <> '') Then
        Begin
          edCPFFavPA.Text := Copy(MontaSelectBenef.ValoresChave[2], 1, 3) + '.' +
            Copy(MontaSelectBenef.ValoresChave[2], 4, 3) + '.' +
            Copy(MontaSelectBenef.ValoresChave[2], 7, 3) + '-' +
            Copy(MontaSelectBenef.ValoresChave[2], 10, 2);
          edNomeFavPA.text := MontaSelectBenef.ValoresChave[3] + ' - ' + MontaSelectBenef.ValoresChave[1];
        End;
    End;
End;

Procedure TfrmGeraFolhaMT.cbxIndividualClick(Sender: TObject);
Begin
  Inherited;

  //CPrev - 24663 - Inicio
  If cbxIndividual.Checked Then
    Begin
      iListaUsuario := frmFrameListaBenef1.ListaUsuario;
      tbsListaPessoa.TabVisible := True;
    End
  Else
    Begin
      iListaUsuario := 0;
      tbsListaPessoa.TabVisible := False;
    End;
  //CPrev - 24663 - Fim

  edCPFFavPA.enabled := cbxIndividual.checked;
  edNomeFavPA.enabled := cbxIndividual.checked;
  sbtnAddFav.enabled := cbxIndividual.checked;
  sbtnRemFav.enabled := cbxIndividual.checked;
  edCPFFavPA.text := '';
  edNomeFavPA.text := '';
End;

Procedure TfrmGeraFolhaMT.chkGeraPorRubricaClick(Sender: TObject);
Begin
  Inherited;
  If chkGeraPorRubrica.Checked Then
    tbsGeraRubrica.TabVisible := True
  Else
    tbsGeraRubrica.TabVisible := False;
End;

Procedure TfrmGeraFolhaMT.edtListaPessoaChange(Sender: TObject);
Begin
  Inherited;
  edCPFFavPA.Clear;
  edNomeFavPA.Clear;
End;

Procedure TfrmGeraFolhaMT.BtnImportarClick(Sender: TObject);
Var
  lii: Integer;
Begin
  Inherited;
  If OpenDialog1.Execute Then
    Begin
      Try
        lstrevisao.Clear;
        lstpart.loadfromfile(OpenDialog1.FileName);

        For lii := 0 To lstpart.count - 1 Do
          Begin
            If trim(lstpart[lii]) <> '' Then
              Begin
                lstRevisao.Items.Add(trim(lstpart[lii]));
              End; { If trim(lstpart[lii]) <> '' Then }
          End;
      Except
        Raise;
      End;
    End;
End;

Procedure TfrmGeraFolhaMT.sbtnRemFavClick(Sender: TObject);
Begin
  Inherited;
  edNomeFavPA.Clear;
  edCPFFavPA.Clear;
End;

Procedure TfrmGeraFolhaMT.chkQuebrarPorCPFClick(Sender: TObject);
Begin
  Inherited;
  grpDecimoTerceiro.Enabled := chkQuebrarPorCPF.Checked;
  lblInicio.Enabled := chkQuebrarPorCPF.Checked;
  lblTermino.Enabled := chkQuebrarPorCPF.Checked;
  edtInicio.Enabled := chkQuebrarPorCPF.Checked;
  edtTermino.Enabled := chkQuebrarPorCPF.Checked;
  udInicio.Enabled := chkQuebrarPorCPF.Checked;
  udTermino.Enabled := chkQuebrarPorCPF.Checked;
End;

Procedure TfrmGeraFolhaMT.ckbCPFClick(Sender: TObject);
Begin
  Inherited;
  Inherited;

  tbsCPFs.TabVisible := True;
  If cbxIndividual.Checked Then
    Begin
      cbxIndividual.Checked := False;
      cbxIndividualClick(Self);
    End;

End;

Procedure TfrmGeraFolhaMT.BitBtn1Click(Sender: TObject);
Begin
  Inherited;
  If OpenDialog1.Execute Then
    Begin
      If FileExists(OpenDialog1.FileName) Then
        Begin
          With TStringList.Create Do
            Begin
              LoadFromFile(OpenDialog1.FileName);
              lbCpfs.Items.Text := Text;
              Clear;
              Free;
            End;
        End;
    End;
End;

Procedure TfrmGeraFolhaMT.frmFrameListaBenef1bbtnIncluiBenefClick(
  Sender: TObject);
Begin
  Inherited;
  frmFrameListaBenef1.bbtnIncluiBenefClick(Sender);

End;

Procedure TfrmGeraFolhaMT.rbBuscaFlPagtoClick(Sender: TObject);
Begin
  Inherited;
  AjustaCampos(rbBuscaFlPagto.Checked {rgSistema.ItemIndex = 0}); // edilaine - SOL 208308-15657 / KTN 2058286
End;

End.

