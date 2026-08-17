{===============================================================================
Analista.....: Fábio Sampaio
SIG..........: 80433
Data.........: 06/11/2019
Rotina.......: btnContinuarClick
Descrição....: Ajuste para excluir os registros da PLANOSALDO quando é feito
               o agrupamento de conta sintética para analítica.
===============================================================================
Analista.....: Darivaldo Alencar
SIG..........: 80433
Data.........: 25/07/2019
Rotina.......: cmContaExit
Descrição....: setar valor atribuido ao selecionar conta,  não estava funcionando
               apenas ligando ao datasource
===============================================================================
Alteração  : btnContinuarClick
Nº SIG.....: 80504
Data.......: 08/01/2018
Responsável: Andre Imakawa
Descrição..: Chamada da rotina getDeparaAgrupamentoMesmoPlano
===============================================================================}

unit FWizDesmembraAgrupa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls,
  Mask, wwdbedit, DBCtrls, CMProcuraMask, wwdblook, Db, Wwdatsrc, DBClient,
  uCMClientDataSet, MontaSelect, uCtrlPlanoContaPer, uCtrlPeriodo, uCtrlContab,
  uCtrlContaContabil, uSistema, dBaseDados,uModulo, uMensErro, dxCntner,
  dxExEdtr, dxEdLib, uCtrlPlanoDePara, uCtrlPlano, wwdbdatetimepicker,
  CMDateTimePicker, uCtrlProcessaContab, uCmSqlParams, uCmTypes, uCtrlPlanoConta,
  Grids, DBGrids, Wwdbigrd, Wwdbgrid;

type
  TFrmWizDesmembraAgrupa = class(TfrmWizardMT)
    Cds: TCMClientDataSet;
    ds: TwwDataSource;
    GroupBox1: TGroupBox;
    lblPeriodo: TLabel;
    lblExercicio: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    dblkPeriodo: TwwDBLookupCombo;
    gbAS: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edNomeContaAnalitica: TEdit;
    GroupBox2: TGroupBox;
    spBtnDesmembra: TSpeedButton;
    spBtnAgrupa: TSpeedButton;
    sBtnExcluir: TSpeedButton;
    MontaSelect: TMontaSelect;
    cdsPeriodo: TCMClientDataSet;
    cdsPlanoConta: TCMClientDataSet;
    cdsExercicio: TCMClientDataSet;
    cdsCustoIni: TCMClientDataSet;
    cdsContas: TCMClientDataSet;
    cdsCustoFim: TCMClientDataSet;
    cdsPlanoFim: TCMClientDataSet;
    cdsPlanoIni: TCMClientDataSet;
    TabSheet2: TTabSheet;
    fcLabel2: TfcLabel;
    Panel5: TPanel;
    Label6: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    lblConta: TLabel;
    Bevel3: TBevel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    NREG: TLabel;
    TOTREG: TLabel;
    TABELA: TLabel;
    Label13: TLabel;
    lparte: TLabel;
    Label14: TLabel;
    dblkexercicioAltPlano: TwwDBLookupCombo;
    dteDataAtualizacao: TCMDateTimePicker;
    pgr: TProgressBar;
    cbMesmosCCSC: TCheckBox;
    cbMesmoPlano: TCheckBox;
    Anim: TAnimate;
    cbGeraLancSaldoAnt: TCheckBox;
    cbConverteSoAnterior: TCheckBox;
    dblkPeriodoAltPlano: TwwDBLookupCombo;
    sqlDesmembraAgrupa: TCMSqlParams;
    edComplContaAnalitica: TMaskEdit;
    cmConta: TCMProcuraMaskContabil;
    MemoLog: TMemo;
    Bevel4: TBevel;
    Label15: TLabel;
    dsperiodo: TwwDataSource;
    lblPlanilha: TLabel;
    Bevel1: TBevel;
    Label7: TLabel;
    CdsDePara: TCMClientDataSet;
    cdsPlanoDepara: TCMClientDataSet;
    dsPlanoDepara: TwwDataSource;
    CMSqlParams1: TCMSqlParams;
    dbgContaDesfazAgrupa: TwwDBGrid;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBText1: TDBText;
    edtmask2: TMaskEdit;
    procedure sBtnExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure spBtnDesmembraClick(Sender: TObject);
    procedure spBtnAgrupaClick(Sender: TObject);
    procedure cmContaExit(Sender: TObject);
    procedure dblkExercicioChange(Sender: TObject);
    procedure dblkExercicioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkPeriodoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkPeriodoChange(Sender: TObject);
    procedure edComplContaAnaliticaChange(Sender: TObject);
    procedure edComplContaAnaliticaExit(Sender: TObject);
    procedure edNomeContaAnaliticaExit(Sender: TObject);
  private
    { Private declarations }
    primeiraVez: boolean;
    scomplemento: string;
    bPassoOK : Boolean;
    CtrlPlanoContaPer : TCtrlPlanoContaPer;
    CtrlPeriodo       : TCtrlPeriodo;
    CtrlContab        : TCtrlContab;
    CtrlContaContabil : TCtrlContaContabil;
    CtrlPlanoDePara   : TCtrlPlanoDePara;
    CtrlPlano         : TCtrlPlano;
    CtrlProcessaContab: TCtrlProcessaContab;

    procedure ProcMens(msg: String);

  public
    { Public declarations }
  end;

var
  FrmWizDesmembraAgrupa: TFrmWizDesmembraAgrupa;

implementation

{$R *.DFM}

procedure TFrmWizDesmembraAgrupa.sBtnExcluirClick(Sender: TObject);
begin
  inherited;
  cds.cancelUpdates;
  if sBtnExcluir.Down then
  begin
    edComplContaAnalitica.Enabled := false;
    edNomeContaAnalitica.Enabled := false;
    Label1.Enabled := false;
    Label2.Enabled := false;
    gbAS.Enabled := false;
    cmConta.AceitaTipoConta       := Indiferente;
    dblkexercicioAltPlano.Text    := '';
    dblkPeriodoAltPlano.Text      := '';
    dteDataAtualizacao.Text       := '';
    dblkexercicioAltPlano.Enabled := false;
    dblkPeriodoAltPlano.Enabled   := false;
    dteDataAtualizacao.Enabled    := false;
    lblTitulo.caption := 'Desfazer Agrupamento/Desmembramento [ Etapa 1 de 2 ]';
    MontaSelect.Executar;
    if MontaSelect.RetornouValor then
    begin
      //Se houve busca, abre a query principal apenas com o registro buscado
      sqlDesmembraAgrupa.Prepare;
      sqlDesmembraAgrupa.paramByName('IDPLANODEPARA').asInteger := strToIntDef(MontaSelect.ValoresChave[1], -1);
      Cds.Data := sqlDesmembraAgrupa.Data;

      cdsPeriodo.Data := CtrlPeriodo.ListPeriodo(Sistema.IdEmpresa,tbpSoNaoBloq, strToIntDef(trim(dblkPeriodoAltPlano.lookupValue), 0), 0);
      dblkPeriodo.Text := cds.fieldByName('PERNOME').asString;

      edNomeContaAnalitica.Text  := cds.fieldByName('NOMECONTA2').asString;

      edComplContaAnalitica.Text := cds.fieldByName('CONTA2').asString;
      if spBtnDesmembra.Down then
        scomplemento := copy( trim(edComplContaAnalitica.text), length(trim(cmConta.Conta.Numero)) + 1,
                              length(trim(edComplContaAnalitica.text)) - length(trim(cmConta.Conta.Numero)) );

      btnContinuar.Enabled := true;
      GroupBox1.Enabled    := true;
      gbAS.Enabled         := true;
    end;
  end;
end;

procedure TFrmWizDesmembraAgrupa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CtrlPlanoContaPer.free;
  CtrlContab.free;
  CtrlPeriodo.free;
  CtrlContaContabil.free;

  CtrlPlanoDePara.free;
  CtrlPlano.free;
  CtrlProcessaContab.free;

  inherited;
end;

procedure TFrmWizDesmembraAgrupa.FormCreate(Sender: TObject);
var wdia, wmes, wAno : word;
begin
  inherited;

  primeiraVez := true;

  scomplemento := '';
  btnContinuar.Enabled := false;
  GroupBox1.Enabled    := false;
  gbAS.Enabled         := false;


   // *** Instancia a classe geral Ctrlcontab ****
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                    Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
     MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);

  // *** cria a classe principal ***
  CtrlPlanoContaPer := TCtrlPlanoContaPer.Create;
  CtrlPlanoContaPer.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                         Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  CtrlPlanoContaPer.CdsPlanoContaPer := Cds;

  Cds.Data := CtrlPlanoContaPer.ListPlanoContaPer(-1);

  CtrlContaContabil        := TCtrlContaContabil.Create;
  CtrlContaContabil.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                     Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  CtrlPeriodo        := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                     Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  cdsExercicio.Data := CtrlPeriodo.ListExercicios(Sistema.Idempresa, false);

  decodeDate(date, wano, wmes, wdia);
  cdsPeriodo.Data   := CtrlPeriodo.ListPeriodo(Sistema.Idempresa ,tbpSoNaoBloq, wano,0);


  cmConta.Plano       := CtrlContab.PlanoParam;
  cmConta.Mascara     := CtrlContab.MascaraContaParam;

  edComplContaAnalitica.EditMask := CtrlContab.MascaraContaParam + ';0; ';
  edtmask2.EditMask := CtrlContab.MascaraContaParam + ';0; ';

  MontaSelect.Filtro.Add('PLANOCONTAPER.IDPESSOA = '+IntToStr(Sistema.idEmpresa));

  //*** Instancia a classe de contas ***
  CtrlPlanoDePara  := TCtrlPlanoDePara.Create;
  CtrlPlanoDePara.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  CtrlPlanoDePara.CdsPlanoDePara := CdsDePara;
  CdsDePara.Data  := CtrlPlanoDePara.ListPlanoDePara(-1);

  //*** Instancia a classe de contas ***
  CtrlPlano  := TCtrlPlano.Create;
  CtrlPlano.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  CdsPlanoIni.Data     := CtrlPlano.ListPlano(0);
  CdsPlanoFim.Data     := CtrlPlano.ListPlano(0);

  // *** Instancia a classe processa Contabil ***
  CtrlProcessaContab := TCtrlProcessaContab.Create;
  CtrlProcessaContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,True,ProcMens);
  cdsExercicio.Data := CtrlPeriodo.ListExercicios(Sistema.Idempresa, false);

end;

procedure TFrmWizDesmembraAgrupa.btnContinuarClick(Sender: TObject);
var ano, mes, dia: Word;
    i, graucontaorig, graucontadest, iPlanoVigente,iPlano, iExercicio, iPeriodo :Integer;
    bOk: boolean;
    scontaAux: string;
begin
  bOk := true;
  btnVoltar.Enabled := false;
  lblPlanilha.Enabled := true;
  Label7.Enabled := true;
  if (PagControle.ActivePageIndex  = PagControle.PageCount - 1) then
  begin
    btnContinuar.Enabled := false;
    btnConfirmar.Enabled := true;
  end
  else
  begin
    btnContinuar.Enabled := true;
    btnConfirmar.Enabled := false;
  end;

  bPassoOK := true;
  if trim(cmConta.Conta.Numero) = '' then
  begin
    MsgDlg('Não há conta contábil a ser processada', 'Erro', mtError, [mbOk], 0);
    cmConta.SetFocus;
    btnContinuar.Enabled := true;
    exit;
  end;

  if trim(dblkExercicio.Text) = '' then
  begin
    MsgDlg('Não há exercício a ser processado', 'Erro', mtError, [mbOk], 0);
    dblkExercicio.SetFocus;
    btnContinuar.Enabled := true;
    exit;
  end;

  if trim(dblkPeriodo.text) = '' then
  begin
    MsgDlg('Não há período a ser processado', 'Erro', mtError, [mbOk], 0);
    dblkPeriodo.SetFocus;
    btnContinuar.Enabled := true;
    exit;
  end;

  if (not sBtnExcluir.Down) and (not spBtnDesmembra.Down) and (not spBtnAgrupa.Down) then //desfazer
  begin
    MsgDlg('Escolha uma operção para prosseguir', 'Erro', mtError, [mbOk], 0);
    btnContinuar.Enabled := true;
    exit;
  end

  else if sBtnExcluir.Down then //exclusão de registro
  begin
    lblPlanilha.Enabled := false;
    Label7.Enabled := false;

    //reverte o processo de alteração de plano de conta
    If CtrlContab.SelecionaPlanoData(Sistema.idEmpresa, DateToStr(date)) Then
       iPlanoVigente := CtrlContab.PlanoData;


    if PagControle.ActivePageIndex = 0 then
    begin
      fcLabel2.caption := 'Desfazer Agrupamento/Desmembramento [ Etapa 1 de 2 ]';

      if MsgDlg('Este procedimento irá excluir o registro de Desmembramento/Agrupamento, poderá ser demorado causando rentenção na base de dados.'+
                ' Deseja realmente excluí-lo?','Aviso',mtConfirmation,[mbYes, mbNo],0)= mrYes Then
      begin
        dblkPeriodoAltPlano.Enabled := true;
        dblkPeriodoAltPlano.text := dblkPeriodo.text;
        dblkPeriodoAltPlano.LookupValue := dblkPeriodo.LookupValue;
        dblkPeriodoAltPlano.Enabled := false;

        if (cds.fieldByName('FLGDESMAGRUP').asString = 'D') or (cds.fieldByName('PLATIPO').Value = 'A') then //só vai para última tela se for um desmembramento
          PagControle.ActivePageIndex := 2
        else
        begin
          PagControle.ActivePageIndex := 1;
          fcLabel2.caption := 'Desfazer Agrupamento [ Etapa 2 de 2 ]';

          // Andre Imakawa - SIG 80504 - Inicio
          //cdsPlanoDepara.Data := CtrlPlanoDePara.getDeparaAgrupamento(cds.fieldByName('IDPLANOCONTAPER').asInteger);
          cdsPlanoDepara.Data := CtrlPlanoDePara.getDeparaAgrupamentoMesmoPlano(cds.fieldByName('IDPLANOCONTAPER').asInteger);
          // Andre Imakawa - SIG 80504 - Fim

          cdsPlanoDepara.FieldByName('CONTADE').EditMask   := cmConta.Mascara + ';0;_';
          cdsPlanoDepara.FieldByName('CONTAPARA').EditMask := cmConta.Mascara + ';0;_';
          //preenche a estrutura do dataset que será passado comp parâmero para desfazer o agrupamento
        end;
      end;
    end
    else if PagControle.ActivePageIndex = 1 then //tela de processamento
    begin
      if MsgDlg('Tem certez que deseja desfazer o agrupamento da conta '+ cdsPlanoDepara.fieldByName('CONTAPARA').asString +
                ' para a conta ' + cds.fieldByName('PLACONTA').asString +'?'
                ,'Aviso',mtConfirmation,[mbYes, mbNo],0)= mrYes Then
        PagControle.ActivePageIndex := 2
      else
        exit;
    end
    else if PagControle.ActivePageIndex = 2 then //tela de processamento
    begin
      btnContinuar.Enabled := false;
      if (cds.fieldByName('FLGDESMAGRUP').asString = 'A') or (cds.fieldByName('PLATIPO').Value = 'S') then //só vai para última tela se for um desmembramento
      begin
        cds.emptyDataSet;
        cds.Insert;
        // somente copia os dados o registro corrente do dataset cdsPlanoDepara (selecionado na tela)
        cds.fieldByName('PLANO').asInteger            := cdsPlanoDepara.fieldByName('PLANO1').asInteger;
        cds.fieldByName('PEREXERCICIO').asInteger     := cdsPlanoDepara.fieldByName('PEREXERCICIO').asInteger;
        cds.fieldByName('PERNUMERO').asInteger        := cdsPlanoDepara.fieldByName('PERNUMERO').asInteger;
        cds.fieldByName('IDPLANOCONTAPER').asInteger  := cdsPlanoDepara.fieldByName('IDPLANOCONTAPER').asInteger;
        cds.fieldByName('IDPLANODEPARA').asInteger    := cdsPlanoDepara.fieldByName('IDPLANODEPARA').asInteger;
        cds.fieldByName('CONTA2').asString            := cdsPlanoDepara.fieldByName('CONTADE').asString;
        cds.fieldByName('PLACONTA').asString          := cdsPlanoDepara.fieldByName('CONTAPARA').asString;
        cds.fieldByName('FLGDESMAGRUP').asString      := 'A';
        cds.Post;
      end
      else
      begin
        cds.Edit;
        cds.fieldByName('FLGDESMAGRUP').asString      := 'D';
        cds.Post;
      end;

      bok := CtrlProcessaContab.DesfazDesmembraAgrupa(cds.Data, sistema.idusuario,
                                                      Sistema.idEmpresa, iPlanoVigente,
                                                      cbMesmosCCSC.Checked,
                                                      cds.fieldByName('FLGDESMAGRUP').asString);
      if bok Then
      begin
         if pgr.Max = pgr.position then
         begin
           MemoLog.Lines.append('');
           MemoLog.Lines.append('--------------------- Fim do processamento '+ dateTimeTostr(now) +' ---------------------');
         end;
        MsgDlg('Desmembramento/Agrupamento desfeito com sucesso', 'Aviso', mtInformation, [mbOk], 0)
      end
      else
        MsgDlg('Ocorreu um erro ao desfazer o Desmembramento/Agrupamento: '+ CtrlProcessaContab.MessageInfo, 'Erro', mtError, [mbOk], 0);
    end


  end

  else if spBtnDesmembra.Down then //desmembramento
  begin
    if (PagControle.ActivePageIndex = 0) then
    begin
      if cds.state in [dsEdit, dsInsert] then
      begin
        cds.fieldByName('PLATIPO').Value := 'S';
        cds.fieldByName('PLANOME').asString := edNomeContaAnalitica.Text;
      end;

      scontaAux := edComplContaAnalitica.editText;
      graucontaorig := 0;
      graucontadest := 0;
      edtmask2.text := cmConta.Conta.Numero;
      edtmask2.editText := copy( edtmask2.editText, 1, pos(' ', edtmask2.editText) - 1 );
      for i := 1 to length(edtmask2.editText) do
      begin
        if edtmask2.editText[i] = '.' then
          inc(graucontaorig);
      end;

      while (pos('. .', scontaAux) > 0) do
        delete(scontaAux, pos('. .', scontaAux) + 1, length(scontaAux));
      while (pos('.  .', scontaAux) > 0) do
        delete(scontaAux, pos('.  .', scontaAux) + 1, length(scontaAux));
      while (pos('.  ', scontaAux) > 0) do
        delete(scontaAux, pos('.  ', scontaAux) + 1, length(scontaAux));
      while (pos('. ', scontaAux) > 0) do
        delete(scontaAux, pos('. ', scontaAux) + 1, length(scontaAux));



      if scontaAux[length(scontaAux)] <> '.' then
        scontaAux := scontaAux + '.';

      for i := 1 to length(scontaAux) do
      begin
        if scontaAux[i] = '.' then
          inc(graucontadest);
      end;

     if (graucontadest <> graucontaorig + 1) then
     begin
       edtmask2.EditText := '';
       edtmask2.EditMask              := CtrlContab.MascaraContaParam + ';0; ';
       edtmask2.text                  := cmConta.Conta.Numero;
       MsgDlg('A conta destino deve ter 1 (um) grau a mais que a conta de origem.', 'Erro', mtError, [mbOk], 0);
       edComplContaAnalitica.setFocus;
       btnContinuar.Enabled := true;
       exit;
     end;

     if (pos(' .', scontaAux) > 0) or (pos('. ', trim(scontaAux)) > 0) then
     begin
       MsgDlg('A conta destino não está de acordo com a máscara da conta de origem. Falta(m) dígito(s)', 'Erro', mtError, [mbOk], 0);
       exit;
     end;


     if trim(edComplContaAnalitica.text) = (cmConta.Conta.Numero) then
     begin
       MsgDlg('É necessário o preenchimento do complemento da conta contábil a ser criada, o mesmo deve ser de acordo com a máscara da conta pai.', 'Erro', mtError, [mbOk], 0);
       edComplContaAnalitica.setFocus;
       btnContinuar.Enabled := true;
       exit;
     end;

     if trim(edNomeContaAnalitica.Text) = '' then
     begin
       MsgDlg('É necessário o preenchimento do nome da conta contábil a ser criada, o mesmo deve ser de acordo com a máscara da conta pai.', 'Erro', mtError, [mbOk], 0);
       edNomeContaAnalitica.setFocus;
       btnContinuar.Enabled := true;
       exit;
     end;

     if (not cds.IsEmpty) and (not (cds.State in [dsEdit, dsInsert])) then
       cds.Edit;

     if cds.State in [dsInsert, dsEdit] then
       cds.fieldByName('PLANOME').asString := edNomeContaAnalitica.Text;

     if MsgDlg('Este procedimento irá fazer os lançamentos contábeis para a transferência de saldos para a nova conta analítica e transformar a conta de origem em conta sintética.'+
               ' Deseja realmente fazê-lo?','Aviso',mtConfirmation,[mbYes, mbNo],0)= mrNo Then
        exit
     else if not CtrlPlanoContaPer.Gravar(Sistema.idEmpresa,Sistema.idModulo,Sistema.idUsuario,
                                 CtrlContab.PlanoParam,StrToIntDef(dblkPeriodo.LooKupValue,0),
                                 edNomeContaAnalitica.Text, scomplemento, cmConta.Conta.Numero,
                                 CtrlContab.MascaraContaParam, cdsPeriodo.FieldByName('PERDATINI').asString,
                                 Sistema.UsaPlanoPatro) then
     begin
       bPassoOK := false;
       MsgDlg(CtrlPlanoContaPer.MessageInfo, 'Aviso', mtWarning, [mbOk], 0);
     end

     else // De/Para de contas
     begin
       if (PagControle.ActivePageIndex = 0) and (bPassoOK) then
       begin

         PagControle.ActivePageIndex := 2; //vai para página do De/Para
         lblPlanilha.caption := 'Gerada planilha para transferência de saldo de código interno:  '+
                                 floatToStr(CtrlPlanoContaPer.plncodigo) +' em '+ formatDateTime('DD/MM/YYYY', CtrlPlanoContaPer.dataPlanil);


         if (trim(edComplContaAnalitica.text) = '') or (trim(cmConta.Conta.Numero) = '') then
         begin
           MsgDlg('É necessário o preenchimento de ambas as contas contábeis para inserir um De/Para.', 'Erro', mtError, [mbOk], 0);
           exit;
           btnContinuar.Enabled := true;
           PagControle.ActivePageIndex := 2;
         end;
         CtrlPlanoDePara.DeparaDesmembra(cmConta.Conta.Numero, CtrlContab.PlanoParam,
                                         cmConta.Conta.Numero + trim(scomplemento), CtrlContab.PlanoParam);


        end;
      end;
    end

    else if (PagControle.ActivePageIndex = 1) and (bPassoOK) then //se clicou no botão "continuar" e está na página do De/Para então grava o De/Para
    begin

      if not CtrlPlanoDePara.Gravar then
      begin
        btnContinuar.Enabled := true;
        bPassoOK := false;
        MsgDlg('Ocorreu o seguinte erro ao inserir o De/Para: '+ CtrlPlanoDePara.MessageInfo, 'Erro', mtError, [mbOk], 0);
        btnContinuar.Enabled := true;
        exit;
      end
      else //se gravou o De/Para com sucesso, então vai para a página de alteração de plano contábil se estiver marcado no checkbox "altera plano de contas"
      begin
        if (bPassoOK) then
        begin
          btnContinuar.Enabled := true;
          PagControle.ActivePageIndex       := 2;
          fcLabel2.caption := 'Alteração de Plano Contábil [ Etapa 3 de 3 ]';
          dblkExercicioAltPlano.Text        := dblkExercicio.Text;
          dblkPeriodoAltPlano.Text          := dblkPeriodo.Text;
          dblkExercicioAltPlano.LookupValue := dblkExercicio.LookupValue;
          dblkPeriodoAltPlano.LookupValue   := dblkPeriodo.LookupValue;
        end;
      end;
    end


    else if (PagControle.ActivePageIndex = 2) then //alteração de plano de contas
    begin
      btnContinuar.Enabled := true;
      fcLabel2.caption := 'Alteração de Plano Contábil [ Etapa 3 de 3 ]';
      if dblkExercicioAltPlano.text = '' then begin
         MsgDlg('Exercicio não preenchido.','Aviso',mtWarning,[mbOk],0);
         dblkExercicioAltPlano.SetFocus;
         btnContinuar.Enabled := true;
         Exit;
      end else iExercicio := StrToInt(dblkExercicioAltPlano.LookupValue);

      if dblkPeriodoAltPlano.text = '' then begin
         MsgDlg('Período não preenchido.','Aviso',mtWarning,[mbOk],0);
         dblkPeriodoAltPlano.SetFocus;
         btnContinuar.Enabled := true;
         Exit;
      end else iPeriodo := StrToInt(dblkPeriodoAltPlano.LookupValue);

      // verificar se é um de-para para meses posteriores a janeiro
      if iPeriodo > 1 then begin
        if cbConverteSoAnterior.Checked then begin
          MsgDlg('Para De-Para com período diferente de janeiro, a opção "Converter Somente Saldo Anterior", não pode ser seleceionada.','Aviso',mtWarning,[mbOk],0);
          cbConverteSoAnterior.SetFocus;
          btnContinuar.Enabled := true;
          Exit;
        end;

        if cbGeraLancSaldoAnt.Checked then
        begin
          DecodeDate(dteDataAtualizacao.Date, ano, mes, dia);
          if (ano <> iExercicio) or (mes <> iPeriodo) then begin
            MsgDlg('A data deve ser dento do período selecionado!','Aviso',mtWarning,[mbOk],0);
            dteDataAtualizacao.SetFocus;
            btnContinuar.Enabled := true;
            Exit;
          end;
        end;
      end;

      iPlanoVigente := 0;
      If CtrlContab.SelecionaPlanoData(Sistema.idEmpresa, DateToStr(date)) Then
         iPlanoVigente := CtrlContab.PlanoData;

      iPLano := CtrlContab.PlanoParam;

      if MsgDlg('Este processo irá fazer a transferência de saldos das contas contábeis envolvidas. Deseja REALMENTE alterar o Plano Contábil?','Aviso',mtConfirmation,[mbYes, mbNo],0) = mrNo then
      begin
        btnContinuar.Enabled := true;
        Exit;
      end;

      Anim.Visible := True;
      Anim.Active  := True;
      Label5.Visible := False;
      lblConta.Visible  := False;

      btnContinuar.Enabled := false;
      If CtrlProcessaContab.AlteraPlanoConta( Sistema.idEmpresa,Sistema.idUsuario, modulo.sMascaraContas, '',
                                              iPlano,iPlanoVigente, iExercicio, iPeriodo,
                                              cbMesmoPlano.Checked,cbMesmosCCSC.Checked,
                                              cbGeraLancSaldoAnt.Checked,
                                              cbConverteSoAnterior.Checked,
                                              cmConta.Conta.Numero,
                                              cmConta.Conta.Numero + trim(scomplemento) ) Then

      Begin
         if pgr.Max = pgr.position then
         begin
           MemoLog.Lines.append('');
           MemoLog.Lines.append('--------------------- Fim do processamento '+ dateTimeTostr(now) +' ---------------------');
         end;
         MsgDlg(CtrlProcessaContab.MessageInfo,'Aviso',mtWarning,[mbOk], 0);
      End Else
      Begin
         btnContinuar.Enabled := true;
         MsgDlg(CtrlProcessaContab.MessageInfo,'Erro',mtError,[mbOk],0);
      End;

      If Anim.Active Then Anim.Active := False;

    end;
  end

  else if spBtnAgrupa.Down then //agrupamento
  begin
    if (PagControle.ActivePageIndex = 0) then
    begin
      if cds.state in [dsEdit, dsInsert] then
      begin
        cds.fieldByName('PLATIPO').Value := 'A';
        cds.fieldByName('PLANOME').asString := cmConta.Conta.Nome;
      end;

      btnContinuar.Enabled := false;

      if not CtrlPlanoContaPer.Gravar(Sistema.idEmpresa,Sistema.idModulo,Sistema.idUsuario,
                                      CtrlContab.PlanoParam,StrToIntDef(dblkPeriodo.LooKupValue,0),
                                      edNomeContaAnalitica.Text, scomplemento, cmConta.Conta.Numero,
                                      CtrlContab.MascaraContaParam,cdsPeriodo.FieldByName('PERDATINI').asString,
                                      Sistema.UsaPlanoPatro) then
      begin
        bPassoOK := false;
        MsgDlg(CtrlPlanoContaPer.MessageInfo, 'Aviso', mtWarning, [mbOk], 0);
        btnContinuar.Enabled := true;
        exit;
      end
      else
      begin
      if (PagControle.ActivePageIndex = 0) and (bPassoOK) then
        begin
          PagControle.ActivePageIndex := 2; //vai para página do De/Para
          btnVoltar.Enabled := false;
          lblPlanilha.caption := 'Gerada planilha para transferência de saldo de código interno:  '+
                                floatToStr(CtrlPlanoContaPer.plncodigo) +' em '+ formatDateTime('DD/MM/YYYY', CtrlPlanoContaPer.dataPlanil);
          btnContinuar.Enabled := true;
          CtrlPlanoDePara.DeparaAgrupa(cmConta.Conta.Numero, CtrlContab.PlanoParam);
        end
      end
    end
    else if (PagControle.ActivePageIndex = 1) and (bPassoOK) then //se clicou no botão "continuar" e está na página do De/Para então grava o De/Para
    begin
      btnContinuar.Enabled := false;
      if not CtrlPlanoDePara.Gravar then
      begin
        bPassoOK := false;
        MsgDlg('Ocorreu o seguinte erro ao inserir o De/Para: '+ CtrlPlanoDePara.MessageInfo, 'Erro', mtError, [mbOk], 0);
        btnContinuar.Enabled := true;
        exit;
      end
      else //se gravou o De/Para com sucesso, então vai para a página de alteração de plano contábil se estiver marcado no checkbox "altera plano de contas"
      begin
        if (bPassoOK) then
        begin
          btnContinuar.Enabled := true;
          PagControle.ActivePageIndex       := 2;
          dblkExercicioAltPlano.Text        := dblkExercicio.Text;
          dblkPeriodoAltPlano.Text          := dblkPeriodo.Text;
          dblkExercicioAltPlano.LookupValue := dblkExercicio.LookupValue;
          dblkPeriodoAltPlano.LookupValue   := dblkPeriodo.LookupValue;

          if (trim(cdsDePara.fieldByName('CONTA1').asString) = '') or (trim(cdsDePara.fieldByName('CONTA2').asString) = '') then
          begin
            MsgDlg('É necessário o preenchimento de ambas as contas contábeis para inserir um De/Para.', 'Erro', mtError, [mbOk], 0);
            exit;
            btnContinuar.Enabled := true;
          end;

        end;
      end;
    end //do else if (PagControle.ActivePageIndex = 1) and (bPassoOK)
    else if (PagControle.ActivePageIndex = 2) {and (chkAlteraPlano.checked)} then //alteração de plano de contas
    begin
      fcLabel2.caption := 'Alteração de Plano Contábil [ Etapa 3 de 3 ]';
      if dblkExercicioAltPlano.text = '' then begin
         MsgDlg('Exercicio não preenchido.','Aviso',mtWarning,[mbOk],0);
         dblkExercicioAltPlano.SetFocus;
         btnContinuar.Enabled := true;
         Exit;
      end else iExercicio := StrToInt(dblkExercicioAltPlano.LookupValue);

      if dblkPeriodoAltPlano.text = '' then begin
         MsgDlg('Período não preenchido.','Aviso',mtWarning,[mbOk],0);
         dblkPeriodoAltPlano.SetFocus;
         btnContinuar.Enabled := true;
         Exit;
      end else iPeriodo := StrToInt(dblkPeriodoAltPlano.LookupValue);

      if cbGeraLancSaldoAnt.checked then
      begin
        if dteDataAtualizacao.text = '' then begin
           MsgDlg('Data da atualização não preenchida.','Aviso',mtWarning,[mbOk],0);
           dteDataAtualizacao.SetFocus;
           btnContinuar.Enabled := true;
           Exit;
        end;
      end;

      if iPeriodo > 1 then begin
        if cbConverteSoAnterior.Checked then begin
          MsgDlg('Para De-Para com período diferente de janeiro, a opção "Converter Somente Saldo Anterior", não pode ser seleceionada.','Aviso',mtWarning,[mbOk],0);
          cbConverteSoAnterior.SetFocus;
          btnContinuar.Enabled := true;
          Exit;
        end;

        if cbGeraLancSaldoAnt.checked then
        begin
          DecodeDate(dteDataAtualizacao.Date, ano, mes, dia);
          if (ano <> iExercicio) or (mes <> iPeriodo) then
          begin
            MsgDlg('A data deve ser dento do período selecionado!','Aviso',mtWarning,[mbOk],0);
            dteDataAtualizacao.SetFocus;
            btnContinuar.Enabled := true;
            Exit;
          end;
        end;

      end;

      iPlanoVigente := 0;
      If CtrlContab.SelecionaPlanoData(Sistema.idEmpresa, DateToStr(date)) Then
         iPlanoVigente := CtrlContab.PlanoData;

      iPLano := CtrlContab.PlanoParam;

      if MsgDlg('Este processo irá fazer a transferência de saldos das contas contábeis envolvidas. Deseja REALMENTE alterar o Plano Contábil?','Aviso',mtConfirmation,[mbYes, mbNo],0) = mrNo then
      begin
        btnContinuar.Enabled := true;
        Exit;
      end;

      Anim.Visible := True;
      Anim.Active  := True;
      lblConta.Visible  := true;

      btnContinuar.Enabled := false;
      cdsDePara.first;
      while not cdsDePara.Eof do
      begin
        bOk := CtrlProcessaContab.AlteraPlanoConta( Sistema.idEmpresa,Sistema.idUsuario, modulo.sMascaraContas, '',
                                                iPlano,iPlanoVigente, iExercicio, iPeriodo,
                                                cbMesmoPlano.Checked,cbMesmosCCSC.Checked,
                                                cbGeraLancSaldoAnt.Checked,
                                                cbConverteSoAnterior.Checked,
                                                cdsDePara.fieldByName('CONTA1').asString,
                                                cdsDePara.fieldByName('CONTA2').asString,
                                                True // Alterado por FHBS - 06/11/2019 - SIG80433
                                                );
        cdsDePara.next;
      end;

      If bOk Then
      Begin
        if pgr.Max = pgr.position then
        begin
          MemoLog.Lines.append('');
          MemoLog.Lines.append('--------------------- Fim do processamento '+ dateTimeTostr(now) +' ---------------------');
        end;
      End
      Else
      Begin
        btnContinuar.Enabled := true;
        MsgDlg(CtrlProcessaContab.MessageInfo,'Erro',mtError,[mbOk],0);
      End;

      MsgDlg(CtrlProcessaContab.MessageInfo,'Aviso',mtWarning,[mbOk], 0);

      If Anim.Active Then Anim.Active := False;
    end;
end;

end;

procedure TFrmWizDesmembraAgrupa.spBtnAgrupaClick(Sender: TObject);
begin
  inherited;
  cds.cancelUpdates;
  fcLabel2.caption := 'Desmembramento/Agrupamento de contas [ Etapa 1 de 3 ]';
  gbAs.Caption := ' Desmembramento - Criação da conta sintética ';
  Label2.Caption := 'Conta Sintética com Compl. do Cód.';
  edComplContaAnalitica.Clear;
  edNomeContaAnalitica.Clear;
  edComplContaAnalitica.Enabled := false;
  edNomeContaAnalitica.Enabled := false;
  Label1.Enabled := false;
  Label2.Enabled := false;
  gbAS.Enabled := false;
  cmConta.AceitaTipoConta := SoSintetica;
  if not (cds.state in [dsEdit, dsInsert]) then
    cds.Insert;
  Cds.FieldbyName('PLANO').AsInteger        := CtrlContab.PlanoParam;
  cds.FieldByName('PLAINATIVA').AsString    := 'A';
  cds.FieldByName('FLGDESMAGRUP').AsString  := 'A';
  cds.FieldByName('IDPESSOA').AsInteger     := Sistema.IdEmpresa;
  btnContinuar.Enabled := true;
  GroupBox1.Enabled    := true;
  gbAS.Enabled         := true;
  edComplContaAnalitica.Enabled := true;
  edNomeContaAnalitica.Enabled := true;
  Label1.Enabled := true;
  Label2.Enabled := true;
  btnContinuar.Enabled := true;
  GroupBox1.Enabled    := true;
  dblkexercicioAltPlano.Enabled := true;
  dblkPeriodoAltPlano.Enabled   := true;
  dteDataAtualizacao.Enabled    := true;
end;

procedure TFrmWizDesmembraAgrupa.spBtnDesmembraClick(Sender: TObject);
begin
  inherited;
  cds.cancelUpdates;
  fcLabel2.caption := 'Desmembramento/Agrupamento de contas [ Etapa 1 de 3 ]';
  edComplContaAnalitica.Enabled := true;
  edNomeContaAnalitica.Enabled := true;
  gbAs.Caption := ' Desmembramento - Criação da conta analítica ';
  Label2.Caption := 'Conta Analítica com Compl. do Cód.';

  Label1.Enabled := true;
  Label2.Enabled := true;
  gbAs.Enabled := false;

  cmConta.AceitaTipoConta := SoAnalitica;

  if not (cds.State in [dsEdit, dsInsert]) then
    cds.Insert;

  Cds.FieldbyName('PLANO').AsInteger        := CtrlContab.PlanoParam;
  cds.FieldByName('PLAINATIVA').AsString    := 'I';
  cds.FieldByName('FLGDESMAGRUP').AsString  := 'D';
  cds.FieldByName('IDPESSOA').AsInteger     := Sistema.IdEmpresa;
  gbAs.Enabled := true;
  Label1.Enabled := true;
  Label2.Enabled := true;
  edComplContaAnalitica.Enabled := true;
  edNomeContaAnalitica.Enabled := true;

  btnContinuar.Enabled := true;
  GroupBox1.Enabled    := true;
  dblkexercicioAltPlano.Enabled := true;
  dblkPeriodoAltPlano.Enabled   := true;
  dteDataAtualizacao.Enabled    := true;
end;

procedure TFrmWizDesmembraAgrupa.cmContaExit(Sender: TObject);
var cdsLocal: TclientDataset;
    ctrlContaContabil: TCtrlContaContabil;
begin
  if spBtnDesmembra.Down then
    cmConta.AceitaTipoConta := SoAnalitica
  else if spBtnAgrupa.Down then
    cmConta.AceitaTipoConta := SoSintetica
  else
    cmConta.AceitaTipoConta := Indiferente;

  gbAS.Enabled := true;
  Label2.Enabled := true;
  edComplContaAnalitica.Enabled := true;
  Label1.Enabled := true;
  edNomeContaAnalitica.Enabled := true;

  if spBtnDesmembra.Down then
  begin
    edComplContaAnalitica.text := cmConta.conta.Numero;
  end;

  if spBtnAgrupa.Down then
  begin
    gbAS.Enabled  := false;
    Label2.Enabled := false;
    edComplContaAnalitica.Enabled := false;
    Label1.Enabled := false;
    edNomeContaAnalitica.Enabled := false;
  end;

  edComplContaAnaliticaChange(sender);

  if cds.State in [dsEdit, dsInsert] then
  begin
    try
      cds.FieldByname('PLACONTA').AsString:=  Trim(cmConta.Conta.Numero); //SIG80433

      ctrlContaContabil := TCtrlContaContabil.Create;
      ctrlContaContabil.initializeas(CtrlContab);
      cdsLocal := TClientDataset.Create(self);
      cdsLocal.data := ctrlContaContabil.ListContas(CtrlContab.PlanoParam, tcAmbasC, false, cmConta.Conta.Numero);
      cds.FieldByName('PLATIPO').asString := cdsLocal.FieldByName('PLATIPO').asString;
      if (trim(cmConta.Conta.Numero) <> '') then
      begin
        if ((cds.fieldByName('PLATIPO').Value = 'S') and (cmConta.AceitaTipoConta = SoAnalitica)) then
        begin
          MsgDlg('Conta de Origem não pode ser sintética' ,'Erro',MtError,[mbOk],0);
          cmConta.Clear;
          edComplContaAnalitica.Clear;
          cmConta.SetFocus;
          exit;
        end
        else if ((cds.fieldByName('PLATIPO').Value = 'A') and (cmConta.AceitaTipoConta = SoSintetica)) then
        begin
          MsgDlg('Conta de Origem não pode ser analítica' ,'Erro',MtError,[mbOk],0);
          cmConta.Clear;
          edComplContaAnalitica.Clear;
          cmConta.SetFocus;
          exit;
        end;
      end;

      cdsLocal.Close;
    finally
      ctrlContaContabil.Free;
      cdsLocal.Free;
    end;
  end;
  inherited;
end;


procedure TFrmWizDesmembraAgrupa.dblkExercicioChange(Sender: TObject);
begin
  inherited;
  if cds.state in [dsEdit, dsInsert] then
  begin
    cds.FieldByName('PEREXERCICIO').AsInteger := strToIntDef(dblkExercicio.LookupValue, -1);
    cds.FieldByName('PERNUMERO').AsInteger    := strToIntDef(dblkPeriodo.LookupValue, -1);
  end;
  dblkexercicioAltPlano.text := dblkExercicio.text;
  dblkexercicioAltPlano.LookupValue := dblkExercicio.LookupValue;
end;


procedure TFrmWizDesmembraAgrupa.ProcMens(msg: String);
begin
    If msg <> '*' then
    begin
       if primeiraVez then
       begin
         primeiraVez := false;
         MemoLog.Clear;
         MemoLog.Lines.append('--------------------- Início do processamento '+ dateTimeTostr(now) +' ---------------------');
         MemoLog.Lines.append('');
       end;
       MemoLog.Lines.append(CtrlProcessaContab.ParteProc + ' - Tabela ' + CtrlProcessaContab.NomeTabela +' atualizada.'+
                            ' - Conta ' + CtrlProcessaContab.NomeConta +' Registro '+ FloatToStr(CtrlProcessaContab.NReg) +' de '
                            + FloatToStr(CtrlProcessaContab.TotReg));
       lblConta.Caption  := CtrlProcessaContab.NomeConta;
       tabela.Caption    := CtrlProcessaContab.NomeTabela;
       Totreg.Caption    := FloatToStr(CtrlProcessaContab.TotReg);
       Nreg.Caption      := FloatToStr(CtrlProcessaContab.NReg);
       LParte.Caption    := CtrlProcessaContab.ParteProc;
    end;
    pgr.Position := CtrlProcessaContab._Progresso;
    pgr.Max      := CtrlProcessaContab.MaxProgresso;

    Application.ProcessMessages;
end;


procedure TFrmWizDesmembraAgrupa.dblkExercicioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  cdsPeriodo.Data := CtrlPeriodo.ListPeriodo(Sistema.IdEmpresa,tbpSoNaoBloq, strToIntDef(trim(dblkPeriodoAltPlano.lookupValue), 0), 0);

end;

procedure TFrmWizDesmembraAgrupa.dblkPeriodoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if ((trim(dblkexercicioAltPlano.text) <> '') and (trim(dblkPeriodoAltPlano.lookupValue) <> '')) and
     (not cdsperiodo.Locate('PEREXERCICIO;PERNUMERO', VarArrayOf([trim(dblkexercicioAltPlano.text), trim(dblkPeriodoAltPlano.lookupValue)]), [loPartialKey])) then
    MsgDlg('Período não localizado.' ,'Erro',MtError,[mbOk],0);
end;

procedure TFrmWizDesmembraAgrupa.dblkPeriodoChange(Sender: TObject);
begin
  inherited;
  dblkPeriodoAltPlano.text := dblkPeriodo.text;
  dblkPeriodoAltPlano.LookupValue := dblkPeriodo.LookupValue;
end;


procedure TFrmWizDesmembraAgrupa.edComplContaAnaliticaChange(Sender: TObject);
var cdsLocal: TclientDataset;
    ctrlPlanoConta : TCtrlPlanoConta;
begin
  inherited;
  if spBtnDesmembra.Down then
    scomplemento := copy( trim(edComplContaAnalitica.text), length(trim(cmConta.Conta.Numero)) + 1,
                          length(trim(edComplContaAnalitica.text)) - length(trim(cmConta.Conta.Numero)) );

  if (trim(edComplContaAnalitica.text) <> '') and (length(edComplContaAnalitica.text) >= length(trim(cmConta.Conta.Numero))) then
  begin
    if trim(cmConta.Conta.Numero) <> copy(edComplContaAnalitica.text, 1, length(trim(cmConta.Conta.Numero))) then
    begin
      edComplContaAnalitica.SetFocus;
      MsgDlg('A conta a ser criada  é de grupo diferente do grupo da conta pai.','Erro',MtError,[mbOk],0);
      exit;
    end;
  end;

  cdsLocal := TClientDataset.Create(nil);
  try
    ctrlPlanoConta  := TCtrlPlanoConta.Create;
    ctrlPlanoConta.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                              Sistema.ConnectionSide,Sistema.AppRemoteServer,False);
    cdsLocal.data := ctrlPlanoConta.ListCdsPlanoContas(CtrlContab.PlanoParam, trim(edComplContaAnalitica.Text));

    if trim(edComplContaAnalitica.text) = '' then
    begin
      edNomeContaAnalitica.Text := '';
      edNomeContaAnalitica.Enabled := true;
    end
    else
    begin
      if trim(cdsLocal.fieldByName('PLANOME').asString) <> '' then
        edNomeContaAnalitica.Text := cdsLocal.fieldByName('PLANOME').asString;
      edNomeContaAnalitica.Enabled := cdsLocal.IsEmpty;
    end;
  finally
    ctrlPlanoConta.free;
    cdsLocal.Free;
  end;

end;

procedure TFrmWizDesmembraAgrupa.edComplContaAnaliticaExit(Sender: TObject);
begin
  inherited;

  if (trim(edComplContaAnalitica.text) <> '') and (length(edComplContaAnalitica.text) >= length(trim(cmConta.Conta.Numero))) then
  begin
    if trim(cmConta.Conta.Numero) <> copy(edComplContaAnalitica.text, 1, length(trim(cmConta.Conta.Numero))) then
    begin
      edComplContaAnalitica.SetFocus;
      MsgDlg('A conta a ser criada  é de grupo diferente do grupo da conta pai.','Erro',MtError,[mbOk],0);
      exit;
    end;
  end;
end;

procedure TFrmWizDesmembraAgrupa.edNomeContaAnaliticaExit(Sender: TObject);
begin
  inherited;
  if cds.State in [dsInsert, dsEdit] then
    cds.fieldByName('PLANOME').asString := edNomeContaAnalitica.Text;
end;

end.
