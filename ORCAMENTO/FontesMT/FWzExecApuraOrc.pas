unit FWzExecApuraOrc;
{-----------------------------------------------------------------------------------------
Data      : 10.01.2006
Autor     : Antonio Marcos Fernandes de Souza (amf)
Pendencia : 20645 - Ordenação do relatório pela conta orçamentária e pelo período.
Descrição : Relatório ordenado conforme solicitação do usuário(Conta e Período). Adicionei
            ao popup critérios de ordenação. O default é a ordenação do Grid, ou seja, or-
            denado através do evento TitleButtonClick.
-----------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls,
  Wwdotdot, Wwdbcomb, Mask, wwdbedit, Wwdbspin, wwdblook, Db, Wwdatsrc,
  uCmSqlParams, DBClient, uCMClientDataSet, Grids, Wwdbigrd, Wwdbgrid, uMensErro,
  uCtrlCadFormulaApuraOrc, uCtrlpadroes, usistema, uctrlParamIntegra, umodulo, FProgresso,
  Menus, wwriched, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd,
  ppClass, ppReport, ppCtrls, ppPrnabl, ppBands, ppCache, fpreview, ppVar,

  uCtrlBlqEntDados;

type
  TFrmWzExecApuraOrc = class(TfrmWizardMT)
    Panel1: TPanel;
    Label2: TLabel;
    Bevel1: TBevel;
    lblExercicio: TLabel;
    lblPeriodo: TLabel;
    Label4: TLabel;
    Bevel2: TBevel;
    Label14: TLabel;
    Label13: TLabel;
    Label3: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label6: TLabel;
    Label15: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    dblkPeriodo: TwwDBLookupCombo;
    spExercicioDest: TwwDBSpinEdit;
    dbComboPeriodoIni: TwwDBComboBox;
    dbComboPeriodoFim: TwwDBComboBox;
    edConteudo1: TEdit;
    sePosFim1: TwwDBSpinEdit;
    sePosIni1: TwwDBSpinEdit;
    ChkSimula: TCheckBox;
    dblkformula: TwwDBLookupCombo;
    Panel4: TPanel;
    dbgrdSaldo: TwwDBGrid;
    cdsOutput: TCMClientDataSet;
    cdsExercicios: TCMClientDataSet;
    cdsFormula: TCMClientDataSet;
    cdsSaldo: TCMClientDataSet;
    cdsPeriodo: TCMClientDataSet;
    SqlExercicios: TCMSqlParams;
    sqlSaldo: TCMSqlParams;
    dsSaldo: TwwDataSource;
    sqlPeriodo: TCMSqlParams;
    sqlFormula: TCMSqlParams;
    Panel2: TPanel;
    Label1: TLabel;
    PopupMenu1: TPopupMenu;
    Salvar1: TMenuItem;
    Imprimir1: TMenuItem;
    SaveDialog1: TSaveDialog;
    meErros: TwwDBRichEdit;
    ppRApura: TppReport;
    ppBDEApura: TppBDEPipeline;
    PopupMenuPrint: TPopupMenu;
    MenuItem2: TMenuItem;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppDBText2: TppDBText;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppDBText1: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppLine1: TppLine;
    ppShape1: TppShape;
    ppLabel9: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable1: TppSystemVariable;
    ppLabel309: TppLabel;
    ppLabel10: TppLabel;
    sqlFundacao: TCMSqlParams;
    cdsFundacao: TCMClientDataSet;
    ppFundacao: TppBDEPipeline;
    dsFundacao: TwwDataSource;
    ppDBImage1: TppDBImage;
    ppDBText9: TppDBText;
    ppLine2: TppLine;
    ppLabel11: TppLabel;
    ppDBText10: TppDBText;
    Bevel3: TBevel;
    chkExclui: TCheckBox;
    chkCalc: TCheckBox;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    lblperiodoOrigem: TppLabel;
    lblexercicioOrigem: TppLabel;
    lblFormula: TppLabel;
    lblContas: TppLabel;
    lblExercioDestino: TppLabel;
    lblPeriodoDestinoIni: TppLabel;
    lblPeriodoDestinoFim: TppLabel;
    cdsSaldoIDPESSOA: TFloatField;
    cdsSaldoIDPLANOORCAMEN: TFloatField;
    cdsSaldoIDCONTAORCAMEN: TStringField;
    cdsSaldoDATAREFERENCIA: TDateTimeField;
    cdsSaldoEXERCICIO: TFloatField;
    cdsSaldoPERIODO: TFloatField;
    cdsSaldoVLRREALIZADO: TFloatField;
    cdsSaldoVLRORCADO: TFloatField;
    cdsSaldoVLRRESERVADO: TFloatField;
    cdsSaldoVLRCOMPROMETIDO: TFloatField;
    cdsSaldoVLRORCACUM: TFloatField;
    cdsSaldoVLRREALACUM: TFloatField;
    cdsSaldoFLGSIMULAATIVO: TStringField;
    cdsSaldoIDCRITERIORATORC: TFloatField;
    cdsSaldoPERCUTILRATEIO2: TFloatField;
    cdsSaldoVLRRATEIOORI2: TFloatField;
    cdsSaldoVALORBASE: TFloatField;
    cdsSaldoNOMECONTAORCAMEN: TStringField;
    cdsSaldoFATORAPLICADO: TFloatField;
    cdsSaldoVLRORCADO_12: TFloatField;
    cdsSaldoCOTACAO: TFloatField;
    cdsSaldoNOMEFORMULA: TStringField;
    ppLabel3: TppLabel;
    ppLabel19: TppLabel;
    ppDBText11: TppDBText;
    Ordenao1: TMenuItem;
    popchkPeriodo: TMenuItem;
    popchkConta: TMenuItem;
    popchkContaPeriodo: TMenuItem;
    popchkGrid: TMenuItem;
    procedure btnContinuarClick(Sender: TObject);
    procedure dblkExercicioChange(Sender: TObject);
    procedure dbgrdSaldoUpdateFooter(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure Salvar1Click(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure ppShape1Print(Sender: TObject);
    procedure dbgrdSaldoDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure ppRApuraBeforePrint(Sender: TObject);
    procedure dbgrdSaldoTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure ChkSimulaClick(Sender: TObject);
    procedure chkExcluiClick(Sender: TObject);
    procedure chkCalcClick(Sender: TObject);
    procedure popchkPeriodoClick(Sender: TObject);
    procedure popchkContaClick(Sender: TObject);
    procedure popchkContaPeriodoClick(Sender: TObject);
    procedure popchkGridClick(Sender: TObject);
  private
    { Private declarations }

    fValCol1, fValCol2 : Extended;
    iordem, iExercOrigem, iPeriodoOrigem, iExercDestino, iPerIniDestino, iPerFimDestino : Integer;

    CtrlBlqEntDados: TCtrlBlqEntDados;

    procedure Totalizasimulacao;
  public
    { Public declarations }
    procedure Progresso(vParam: array of Variant);
  end;

var
  FrmWzExecApuraOrc: TFrmWzExecApuraOrc;
  CtrlCadFormulaApuraOrc : TCtrlCadFormulaApuraOrc;

implementation

{$R *.DFM}

procedure TFrmWzExecApuraOrc.btnContinuarClick(Sender: TObject);
var idFormOrcado,
    iMes: integer;

begin
  if PagControle.ActivePageIndex = 0 then
  begin
    iExercOrigem   := strToIntDef(dblkExercicio.LookupValue, -1);
    if iExercOrigem = -1 then
    begin
      MsgDlg('Exercício de origem inválido.', 'Orçamento', mtWarning, [mbOk], 0);
      exit;
    end;

    iPeriodoOrigem := strToIntDef(dblkPeriodo.LookupValue, -1);
    if iPeriodoOrigem = -1 then
    begin
      MsgDlg('Período de origem inválido.', 'Orçamento', mtWarning, [mbOk], 0);
      exit;
    end;

    iExercDestino  := trunc(spExercicioDest.Value);
    if iExercDestino < 0 then
    begin
      MsgDlg('Exercício de Destino inválido.', 'Orçamento', mtWarning, [mbOk], 0);
      exit;
    end;

    iPerIniDestino := dbComboPeriodoIni.ItemIndex + 1;
    if not iPerIniDestino in [1..12] then
    begin
      MsgDlg('Período inicial de Destino inválido.', 'Orçamento', mtWarning, [mbOk], 0);
      exit;
    end;

    iPerFimDestino := dbComboPeriodoFim.ItemIndex + 1;
    if not iPerFimDestino in [1..12] then
    begin
      MsgDlg('Período final de Destino inválido.', 'Orçamento', mtWarning, [mbOk], 0);
      exit;
    end;

    if iPerIniDestino > iPerFimDestino then
    begin
      MsgDlg('Período destino inicial tem que ser menor ou igual ao período destino final .', 'Orçamento', mtWarning, [mbOk], 0);
      exit;
    end;


    if trim(dbComboPeriodoIni.Text) = '' then
    begin
      MsgDlg('É necessário informar o período destino inicial', 'Orçamento', mtWarning, [mbOk], 0);
      dbComboPeriodoIni.setFocus;
      exit;
    end;

    if trim(dbComboPeriodoFim.Text) = '' then
    begin
      MsgDlg('É necessário informar o período destino final', 'Orçamento', mtWarning, [mbOk], 0);
      dbComboPeriodoFim.setFocus;
      exit;
    end;


    for iMes := iPerIniDestino to iPerFimDestino do
    begin
       if not CtrlBlqEntDados.TestaEntDadosBlq(Sistema.IdUsuario,Sistema.IdEmpresa,
                                               iMes,iExercDestino) then
       begin
          MsgDlg(CtrlBlqEntDados.MessageInfo,'Aviso',mtWarning,[mbOk],0);
          Exit;
       end;
    end;


    if (trunc(sePosIni1.Value) > 0) or (trunc(sePosFim1.value) > 0) or (trim(edConteudo1.text)<> '') then
    begin
      if (trunc(sePosIni1.Value) <= 0) then
      begin
        MsgDlg('Posição Inicial da Conta inválida', 'Orçamento', mtWarning, [mbOk], 0);
        sePosIni1.setFocus;
        exit;
      end;

      if (trunc(sePosFim1.Value) <= 0) then
      begin
        MsgDlg('Quantidade de dígitos inválida', 'Orçamento', mtWarning, [mbOk], 0);
        sePosFim1.setFocus;
        exit;
      end;

      if (trim(edConteudo1.text) = '') then
      begin
        MsgDlg('Conteúdo da Conta inválido', 'Orçamento', mtWarning, [mbOk], 0);
        edConteudo1.setFocus;
        exit;
      end;
    end;

    btnConfirmar.Enabled := false;
    inherited;
    cdsSaldo.Close;
    cdsSaldo.DisableControls;
    btnVoltar.Enabled := false;
    bbtnSair.Enabled := false;
    btnConfirmar.Enabled := false;

    if trim(dblkformula.text) <> '' then
      idformorcado := strToIntDef(dblkformula.lookupvalue, -1)
    else idformorcado := -1;

    meErros.Lines.Clear;
    try
      if chkCalc.Checked or ChkSimula.Checked then
      begin
        CtrlCadFormulaApuraOrc.bCancelaProcApura := false;
        cdsSaldo.Data := CtrlCadFormulaApuraOrc.ProcessaGeracaoOrc(iExercOrigem, iPeriodoOrigem, iExercDestino, iPerIniDestino, iPerFimDestino,
                                                                   sistema.idempresa, modulo.iPlanoOrc, idformorcado,
                                                                   trunc(sePosIni1.Value), trunc(sePosFim1.value), edConteudo1.text);
      end else if (not chkCalc.Checked) and (not ChkSimula.Checked) and (chkExclui.checked) then
      begin
        if CtrlCadFormulaApuraOrc.ExcluiDestino(modulo.iPlanoOrc, sistema.idempresa, iExercDestino, iPerIniDestino,
                                             iPerFimDestino, trunc(sePosIni1.Value), trunc(sePosFim1.value),
                                             edConteudo1.text, idformorcado) then
         meErros.Lines.add(' Exclusão do orçamento efetuada com sucesso ')
        else
         meErros.Lines.add(' Exclusão do orçamento não efetuada ERRO: '+ CtrlCadFormulaApuraOrc.MessageInfo );
      end;
    finally
      btnVoltar.Enabled := true;
      bbtnSair.Enabled := true;
      btnConfirmar.Enabled := true;

      TotalizaSimulacao;
      dbgrdSaldoUpdateFooter(Sender);
      cdsSaldo.EnableControls;
    end;

  end;

//  inherited;
  if (not chkCalc.Checked) and (chkExclui.Checked) and (not ChkSimula.Checked) then
    btnConfirmar.Enabled := false
  else
    btnConfirmar.Enabled := not ChkSimula.Checked;
end;

procedure TFrmWzExecApuraOrc.dblkExercicioChange(Sender: TObject);
begin
  inherited;
  cdsPeriodo.Close;
  sqlPeriodo.Prepare;
  sqlPeriodo.ParamByName('EXERCICIO').asInteger := cdsExercicios.fieldByName('EXERCICIO').asInteger;
  sqlPeriodo.Open;
end;

procedure TFrmWzExecApuraOrc.dbgrdSaldoUpdateFooter(Sender: TObject);
begin
  inherited;
  dbgrdSaldo.Columns[5].FooterValue := formatFloat('#,##0.00', fValCol1);
  dbgrdSaldo.Columns[8].FooterValue := formatFloat('#,##0.00', fValCol2);
end;

procedure TFrmWzExecApuraOrc.totalizaSimulacao;
begin
  fValCol1 := 0;
  fValCol2 := 0;
  if not cdsSaldo.isEmpty then
  begin
    cdsSaldo.First;
    while not cdsSaldo.Eof do
    begin
      fValCol1 := fValCol1 + cdsSaldo.FieldByName('VALORBASE').AsFloat;
      fValCol2 := fValCol2 + cdsSaldo.FieldByName('VLRORCADO').AsFloat;
      cdsSaldo.Next;
    end;
    cdsSaldo.First;
  end;
end;




procedure TFrmWzExecApuraOrc.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(CtrlBlqEntDados);
  
  CtrlCadFormulaApuraOrc.Free;
end;




procedure TFrmWzExecApuraOrc.FormCreate(Sender: TObject);
var wdia, wMes, wAno : word;
begin
  inherited;

  chkExclui.Checked := Not ChkSimula.Checked;
  chkCalc.Checked := Not ChkSimula.Checked;
  chkExclui.Enabled :=  not ChkSimula.Checked;
  chkCalc.Enabled   :=  not ChkSimula.Checked;

  iordem := 0;
  btnConfirmar.Enabled := false;

  cdsFormula.Close;
  sqlFormula.Open;

  CtrlCadFormulaApuraOrc := TCtrlCadFormulaApuraOrc.Create;
  CtrlCadFormulaApuraOrc.InitializeAs(padroes);
  CtrlCadFormulaApuraOrc.Progresso := Progresso;

  CtrlBlqEntDados := TCtrlBlqEntDados.Create;
  CtrlBlqEntDados.InitializeAs(Padroes);

  iExercOrigem   := 0;
  iPeriodoOrigem := 0;
  iExercDestino  := 0;
  iPerIniDestino := 0;
  iPerFimDestino := 0;

  sqlExercicios.Open;
  sqlPeriodo.Prepare;
  sqlPeriodo.ParamByName('EXERCICIO').asInteger := cdsExercicios.fieldByName('EXERCICIO').asInteger;
  sqlPeriodo.Open;
  decodeDate(now, wAno, wMes, wDia);
  spExercicioDest.Value := wAno + 1;
end;

procedure TFrmWzExecApuraOrc.btnConfirmarClick(Sender: TObject);
begin
  inherited;
  if MsgDlg('Deseja realmente gravar o orçamento gerado?', 'Gravação do orçamento', mtWarning, [mbYes,mbNo], 0) = IdYes then
  begin
    if chkExclui.Checked then
      CtrlCadFormulaApuraOrc.ExcluiDestino(modulo.iPlanoOrc, sistema.idempresa, iExercDestino, iPerIniDestino,
                                           iPerFimDestino, trunc(sePosIni1.Value), trunc(sePosFim1.value),
                                           edConteudo1.text, strToIntDef(dblkformula.lookupvalue, -1));

    if CtrlCadFormulaApuraOrc.GravaSimulacao(cdsSaldo.Data) then
    begin
      btnConfirmar.Enabled := false;
      MsgDlg('Orçamento gravado com sucesso.', 'Gravação do orçamento', mtWarning, [mbOK], 0);
      meErros.Lines.add('Orçamento gravado com sucesso.');
    end
    else
    begin
      MsgDlg('Gravação do orçamento não efetuada. ERRO:'+ CtrlCadFormulaApuraOrc.MessageInfo +#13#10+ CtrlCadFormulaApuraOrc.MessageInfo, 'Gravação do orçamento', mtError, [mbOK], 0);
      meErros.Lines.add('Gravação do orçamento não efetuada. ERRO:'+ CtrlCadFormulaApuraOrc.MessageInfo);
    end;
  end;  
end;


procedure TFrmWzExecApuraOrc.Progresso(vParam: array of Variant);
begin
//  Legenda do FormProgresso
//   vParam[0] :  BILHETE
//   vParam[1] :  Tipo da operação (0 = mostra, 1 = anda, 2 = esconde)

//   vParam[2] :  Mínimo de Registros  (em cima)
//   vParam[3] :  Total de Registros   (em cima)
//   vParam[4] :  Registro Atual       (em cima)
//   vParam[5] :  Legenda              (em cima)

//   vParam[6] :  Mínimo de Registros  (em baixo)
//   vParam[7] :  Total de Registros   (em baixo)
//   vParam[8] :  Registro Atual       (em baixo)
//   vParam[9] :  Legenda              (em baixo)
//   vParam(10]:  Retorno de mensagem/resultado

  // Desabilita todos os formulários com exceção de FrmProgress

   if CtrlCadFormulaApuraOrc.bCancelaProcApura then
   begin
     meErros.Text := 'Processo cancelado pelo usuário.';
     cdsSaldo.Close;
     btnConfirmar.Enabled := false;
   end;

   case vParam[1] of
      // -------------------------------------------------------------------------------------------
      0:
      begin
         meErros.Text := '';

         frmprogresso.MostraFormprogresso(vParam[0], true, true true, vParam[2], vParam[3]);

      end;
      // -------------------------------------------------------------------------------------------
      1:
      begin
         frmprogresso.Max  := vParam[3];

         frmprogresso.lblProgress.Caption := vParam[0];
         frmprogresso.AndaFormprogresso(vParam[4], vParam[3]);
      end;
      // -------------------------------------------------------------------------------------------
      2:
      begin
         frmprogresso.EscondeFormprogresso;
      end;
   end;

   CtrlCadFormulaApuraOrc.bCancelaProcApura := frmprogresso.Cancelou;
   if Trim(vParam[6]) <> '' then
      meErros.Text := meErros.Text + vParam[6];
end;


procedure TFrmWzExecApuraOrc.Salvar1Click(Sender: TObject);
begin
  inherited;
  meErros.PlainText := true;
  saveDialog1.Execute;
  if trim(saveDialog1.FileName) <> '' then
    meErros.Lines.saveToFile(saveDialog1.FileName);

end;

procedure TFrmWzExecApuraOrc.Imprimir1Click(Sender: TObject);
begin
  inherited;
  meErros.Print('');
end;

procedure TFrmWzExecApuraOrc.MenuItem2Click(Sender: TObject);
var
  IndexDef : TIndexDef;
begin
  inherited;
  cdsSaldo.IndexName := '';
  cdsSaldo.IndexDefs.Clear;
  IndexDef := cdsSaldo.IndexDefs.AddIndexDef;
  IndexDef.Name := 'i' + IntToStr( GetTickCount );

  if popchkContaPeriodo.Checked then
  begin
     IndexDef.Fields := 'IDCONTAORCAMEN;PERIODO';
     IndexDef.DescFields := '';
     IndexDef.Options := [];
  end
  else if popchkConta.Checked then
  begin
     IndexDef.Fields := IndexDef.Fields + 'IDCONTAORCAMEN';
     IndexDef.DescFields := '';
     IndexDef.Options := [];
  end
  else if (popchkPeriodo.Checked) then
  begin
     IndexDef.Fields := IndexDef.Fields + 'PERIODO';
     IndexDef.DescFields := '';
     IndexDef.Options := [];
  end;

  cdsSaldo.IndexName := IndexDef.Name;

  cdsSaldo.DisableControls;
  TFrmPreview.CreateModalPreview(Application, ppRApura, 'Apuração orçametária');
  cdsSaldo.EnableControls;

  cdsSaldo.IndexName := '';
  cdsSaldo.IndexDefs.Clear;
end;

procedure TFrmWzExecApuraOrc.ppShape1Print(Sender: TObject);
begin
  inherited;
  ppShape1.visible := not ppShape1.visible;
end;

procedure TFrmWzExecApuraOrc.dbgrdSaldoDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
  if (cdsSaldo.Active) then
  begin
    dbgrdSaldo.Canvas.Font.Color := clBlack;
    if ( cdsSaldo.RecNo mod 2 ) = 0 then
      dbgrdSaldo.Canvas.Brush.Color := $EEEEEE
    else
      dbgrdSaldo.Canvas.Brush.Color := clWhite;

    dbgrdSaldo.DefaultDrawDataCell( Rect, Field, State );
  end;
end;

procedure TFrmWzExecApuraOrc.ppRApuraBeforePrint(Sender: TObject);
begin
  inherited;
  lblperiodoOrigem.Caption := dblkPeriodo.Text;
  lblexercicioOrigem.Caption := dblkExercicio.Text;
  lblPeriodoDestinoIni.caption := dbComboPeriodoIni.Text;
  lblPeriodoDestinoFim.caption := dbComboPeriodoFim.Text;
  lblExercioDestino.caption := spExercicioDest.Text;
  lblContas.Caption := sePosIni1.text +'/'+sePosFim1.Text + ' - ' + edConteudo1.text;
  lblFormula.Caption := dblkformula.Text;
  
  cdsFundacao.Close;
  sqlFundacao.Open;
end;

procedure TFrmWzExecApuraOrc.dbgrdSaldoTitleButtonClick(Sender: TObject; AFieldName: String);
var
  IndexDef : TIndexDef;
begin

  inherited;

  if ( iOrdem = 0 ) or ( iOrdem = 2 ) then
    iOrdem := 1
  else
    iOrdem := 2;

  cdsSaldo.IndexName := '';
  cdsSaldo.IndexDefs.Clear;
  IndexDef := cdsSaldo.IndexDefs.AddIndexDef;
  IndexDef.Name := 'i' + IntToStr( GetTickCount );

  if AFieldName = 'IDCONTAORCAMEN' THEN
   AFieldName := 'IDCONTAORCAMEN;PERIODO' ;
 //  
  if iOrdem = 1 then
  begin
    IndexDef.Fields := AFieldName;
    IndexDef.DescFields := '';
    IndexDef.Options := [];
  end
  else
  begin
    IndexDef.Fields := AFieldName;
    IndexDef.DescFields := AFieldName;
    IndexDef.Options := [ixDescending];
  end;

  cdsSaldo.IndexName := IndexDef.Name;
  cdsSaldo.First;

  popchkGrid.Checked := True;
  popchkPeriodo.Checked := False;
  popchkConta.Checked := popchkPeriodo.Checked;
  popchkContaPeriodo.Checked := popchkPeriodo.Checked;
end;

procedure TFrmWzExecApuraOrc.ChkSimulaClick(Sender: TObject);
begin
  inherited;
  chkExclui.Checked := Not ChkSimula.Checked;
  chkCalc.Checked := Not ChkSimula.Checked;
  chkExclui.Enabled :=  not ChkSimula.Checked;
  chkCalc.Enabled   :=  not ChkSimula.Checked;

  btnContinuar.Enabled := (chkExclui.Checked) or (chkCalc.Checked) or (ChkSimula.Checked);
end;

procedure TFrmWzExecApuraOrc.chkExcluiClick(Sender: TObject);
begin
  inherited;
  btnContinuar.Enabled := (chkExclui.Checked) or (chkCalc.Checked) or (ChkSimula.Checked);
end;

procedure TFrmWzExecApuraOrc.chkCalcClick(Sender: TObject);
begin
  inherited;
  btnContinuar.Enabled :=  (chkExclui.Checked) or (chkCalc.Checked) or (ChkSimula.Checked);
end;

procedure TFrmWzExecApuraOrc.popchkPeriodoClick(Sender: TObject);
begin
  inherited;
  popchkPeriodo.Checked := not popchkPeriodo.Checked;
  if popchkPeriodo.Checked then
  begin
    popchkGrid.Checked            := False;
    popchkContaPeriodo.Checked    := False;
    popchkConta.Checked           := False;
  end;
end;

procedure TFrmWzExecApuraOrc.popchkContaClick(Sender: TObject);
begin
  inherited;
  popchkConta.Checked := not popchkConta.Checked;
  if popchkConta.Checked then
  begin
    popchkPeriodo.Checked         := False;
    popchkContaPeriodo.Checked    := False;
    popchkGrid.Checked            := False;
  end;
end;

procedure TFrmWzExecApuraOrc.popchkContaPeriodoClick(Sender: TObject);
begin
  inherited;

  popchkContaPeriodo.Checked := not popchkContaPeriodo.Checked;
  if popchkContaPeriodo.Checked then
  begin
    popchkConta.Checked   := False;
    popchkPeriodo.Checked := False;
    popchkGrid.Checked    := False;
  end;
end;

procedure TFrmWzExecApuraOrc.popchkGridClick(Sender: TObject);
begin
  inherited;

  popchkGrid.Checked := not popchkGrid.Checked;
  if popchkGrid.Checked then
  begin
    popchkConta.Checked            := False;
    popchkPeriodo.Checked          := False;
    popchkContaPeriodo.Checked     := False;
  end;
end;

end.
