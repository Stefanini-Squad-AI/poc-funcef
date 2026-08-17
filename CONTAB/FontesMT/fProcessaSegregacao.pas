{---------------------------------------------------------------------------------------------------------
Analista  : Antonio Marcos Fernandes de Souza (amf)
Data      : 03.07.2007
Pendência : 24589
Descrição : Alteração no teste da regra prova zero. A nova função está na uctrlLancamento - CMContabObj50.
---------------------------------------------------------------------------------------------------------
Analista  : Antonio Marcos Fernandes de Souza (amf)
Data      : 15.03.2007
Pendência : 24589
Descrição : Implementado o processamento da segregação da memória de cálculo.
            A segregação da memória de cálculo é determinada segundo critério
            pré-definido.
---------------------------------------------------------------------------------------------------------
Analista : Alex Pereira
Rotina   : VerificaContaSegrega
Data     : 18/02/2005
Pendência: 17193
Solução  : Erro na segregação o processo só pode levar em conta o plano a ser segregado.
---------------------------------------------------------------------------------------------------------}

unit fProcessaSegregacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, Db, DBClient,
  uCMClientDataSet, uCtrlPeriodo, uCtrlSegregacaoProc, uCtrlLancamento, uSistema,
  dBaseDados, uDiasUteis, uVerificaPreenchimento, uMensErro, uCmSqlParams,
  wwriched, Menus, DBTables, CMDatabase, fProgresso, CMProcuraMask, uModulo,
  uCmTypes, uctrlParamGlobal;

type
  TfrmProcessaSegregacao = class(TfrmWizardMT)
    cdsExercicio: TCMClientDataSet;
    CdsPeriodo: TCMClientDataSet;
    dblkExerc: TwwDBLookupCombo;
    Label3: TLabel;
    dblkPeriodo: TwwDBLookupCombo;
    Label4: TLabel;
    edDataProc: TCMDateTimePicker;
    Label14: TLabel;
    cdsSegregaCriter: TCMClientDataSet;
    dbCboSegregaCriter: TwwDBLookupCombo;
    Label12: TLabel;
    sqlProvaZero: TCMSqlParams;
    PopupMenu1: TPopupMenu;
    mnuSalvar: TMenuItem;
    mnuImprimir: TMenuItem;
    dlgSalvar: TSaveDialog;
    meErros: TwwDBRichEdit;
    cdsProvaZero: TCMClientDataSet;
    sqlContaSegrega: TCMSqlParams;
    cdsContaSegrega: TCMClientDataSet;
    CdsSegregaCriterSel: TCMClientDataSet;
    cmContaSegreg: TCMProcuraMaskContabil;
    Panel1: TPanel;
    chkExclui: TCheckBox;
    chkProcessa: TCheckBox;
    rdgPlano: TRadioGroup;
    chkIgnoraProvaZero: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure dblkExercChange(Sender: TObject);
    procedure dblkExercCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkPeriodoEnter(Sender: TObject);
    procedure dblkPeriodoChange(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure mnuSalvarClick(Sender: TObject);
    procedure mnuImprimirClick(Sender: TObject);
    procedure dblkPeriodoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }

    //define se é para processar a segregação da memória de cálculo.
    bSegMemoCalc, bSegComum, bSegAdm: boolean;
    btemPlanoAdm,
    bsegMemoCalcOrigemComum,
    bsegMemoCalcOrigemADM,
    bsegMemoCalcFimMes: boolean;


    CtrlPeriodo   : TCtrlPeriodo;
    CtrlSegregacaoProc: TCtrlSegregacaoProc;
    CtrlLancamento: TCtrlLancamento;

    CtrlParamGlobal: TCtrlParamGlobal;
    cdsLocal: TClientDataSet;
    procedure DataLancamento;
    function VerificaPreenchimento: boolean;

    function VerificaProvaZero(iExercicio: integer = 0; iperiodo: integer = 0): boolean;
    function VerificaContaSegrega: boolean;
    function ProcessaSegregacao: boolean;

    procedure Progresso (vParams: array of variant);
  public
    { Public declarations }
  end;

var
  frmProcessaSegregacao: TfrmProcessaSegregacao;

implementation

{$R *.DFM}

procedure TfrmProcessaSegregacao.FormCreate(Sender: TObject);
begin
  inherited;

  btemPlanoAdm              := false;

  CtrlLancamento := TCtrlLancamento.Create;
  CtrlLancamento.Initialize (dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CtrlPeriodo    := TCtrlPeriodo.Create;
  CtrlPeriodo.InitializeAs (CtrlLancamento);

  CtrlSegregacaoProc := TCtrlSegregacaoProc.Create;
  CtrlSegregacaoProc.InitializeAs (CtrlLancamento);
  CtrlSegregacaoProc.GetParams(Sistema.IdEmpresa);

  CdsExercicio.Data := CtrlPeriodo.ListExercicios(Sistema.IdEmpresa,True);
  cdsSegregaCriter.Data := CtrlSegregacaoProc.ListaSegregaCriter;

  CtrlSegregacaoProc.Progresso := Progresso;

  cmContaSegreg.Plano          := Modulo.iPlano;
  cmContaSegreg.Mascara        := Modulo.sMascaraContas;


  CtrlParamGlobal := TCtrlParamGlobal.Create;
  CtrlParamGlobal.InitializeAs(ctrlLancamento);

  cdsLocal := TClientDataSet.Create(Self);

  cdsLocal.Data := ctrlParamGlobal.ListaParamGlobal(Sistema.IdEmpresa);

  btemPlanoAdm := (not cdsLocal.FieldByName('IDPLANOPREVADM').IsNull);

  //Teve segregação da memória de cálculo na origem para o plano comum
  bsegMemoCalcOrigemComum := (cdsLocal.FieldByName('FLGSEGREGAORCOMUM').AsString = 'S') and
                             (cdsLocal.FieldByName('FLGSEGORCOMFIN').AsString = 'S');

  bsegComum               := ( not bsegMemoCalc);

  //Teve segregação da memória de cálculo na Origem para o plano comum e não tem plano ADM
  if ( not btemPlanoAdm ) then begin
     // se não tem plano administrativo desabilita o radioGroup 'Plano a Segregar'
     rdgPlano.Enabled   := btemPlanoADM;
     //marca automaticamente a segregação do plano comum
     rdgPlano.ItemIndex := 0;

     if ( bsegMemoCalcOrigemComum) then begin
        MsgDlg ('Não há parametrização de Plano Previdenciário Administrativo e o Plano Comum já está segregado na origem.', 'Segregação', mtWarning, [mbok], 0);
        Close;
        exit;
     end;
  end
  else begin
          bsegMemoCalcOrigemADM := (cdsLocal.FieldByName('FLGSEGREGAORADM').AsString = 'S') and
                                   (cdsLocal.FieldByName('FLGSEGORADMFIN').AsString = 'S');
          //se tem plano ADM e não segregou na origem
          bsegAdm := ( (not bsegMemoCalc) and (btemPlanoADM) );
  end;


  //obtém os parâmetros do Global
  //indica que está sendo usada a segregação é virtual, ou seja, usa a MEMOCALC.
  bsegMemoCalc := false;
  if bsegMemoCalcOrigemADM then
    bsegMemoCalc := ( cdsLocal.FieldByName('FLGSEGORADMFIN').AsString = 'S' )
  else if bsegMemoCalcOrigemComum then
    bsegMemoCalc := ( cdsLocal.FieldByName('FLGSEGORCOMFIN').AsString = 'S' )
end;

procedure TfrmProcessaSegregacao.dblkExercChange(Sender: TObject);
begin
  inherited;
  if dblkExerc.Text <> '' then begin
    CtrlPeriodo.Exercicio := StrToInt (dblkExerc.Text);
    CdsPeriodo.Data  := CtrlPeriodo.ListPeriodo(Sistema.IdEmpresa,tbpTodos,CtrlPeriodo.Exercicio,0);
  end else begin
    CtrlPeriodo.Exercicio := 0;
    CdsPeriodo.Close;
  end;
  DataLancamento;
end;

procedure TfrmProcessaSegregacao.dblkExercCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if dblkExerc.Text <> '' then begin
    CtrlPeriodo.Exercicio := StrToInt (dblkExerc.Text);
    CdsPeriodo.Data  := CtrlPeriodo.ListPeriodo(Sistema.IdEmpresa,tbpTodos,CtrlPeriodo.Exercicio,0);
  end else begin
    CtrlPeriodo.Exercicio := 0;
    CdsPeriodo.Close;
  end;
  DataLancamento;
end;

procedure TfrmProcessaSegregacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil (CtrlLancamento);
  FreeAndNil (CtrlPeriodo);
  FreeAndNil (CtrlSegregacaoProc);

  FreeAndNil(ctrlParamGlobal);
  inherited;

end;

procedure TfrmProcessaSegregacao.dblkPeriodoEnter(Sender: TObject);
begin
  inherited;
  if not CdsPeriodo.Active then dblkExerc.SetFocus;
end;

procedure TfrmProcessaSegregacao.DataLancamento;
begin
  if (dblkExerc.Text <> '') and (dblkPeriodo.Text <> '') then
    edDataProc.Date := DiasUteis.UltDiaMes(CtrlPeriodo.Exercicio, CtrlPeriodo.Periodo)
  else
    edDataProc.Text := '';
end;

procedure TfrmProcessaSegregacao.dblkPeriodoChange(Sender: TObject);
begin
  inherited;
  if dblkPeriodo.Text <> '' then
    CtrlPeriodo.Periodo := CdsPeriodo.FieldByName('PERNUMERO').AsInteger;
  DataLancamento;
end;

procedure TfrmProcessaSegregacao.btnContinuarClick(Sender: TObject);
// 25815 09/07 implementado ignorar crítica regra prova zero
var
    bRegraProvaZero: boolean;
    bProcessoOK: boolean;
begin

  bProcessoOK := true;

  case PagControle.ActivePageIndex of
    0: if VerificaPreenchimento then begin
         inherited;
         meErros.Clear;
         if (chkProcessa.Checked) then begin
            bRegraProvaZero := VerificaProvaZero;
            if (not bRegraProvaZero) and (not chkIgnoraProvaZero.Checked)then
            begin
               MsgDlg ('Existem planilhas que não atendem a regra proza zero, verifique log na tela!',
                       'Regra Prova Zero', mtWarning, [mbok], 0);
               bProcessoOK := false;
            end
            else if (not VerificaContaSegrega) then
                 //amf 04.10.2007
                 begin
                     MsgDlg ('Existem parametrizações a serem feitas, verifique log na tela!',
                             'Conta para Segregação', mtWarning, [mbok], 0);
                     exit;
                 end;
         end; //amf 04.10.2007 - passei o encerramento do if chProcessa.checked... para este ponto
            //else

         //amf 04.10.2007 - agora esta rotina será executada sem a necessidade do parametro chkProcessa... estar marcado.
         if ( bProcessoOK ) then
         begin
            if not ProcessaSegregacao then
               MsgDlg ('Processo concluído com erros/avisos, Verifique log na tela!', 'Erros/Avisos no Processo', mtWarning, [mbok], 0);
            //end;
         end;
       end;
  end;
end;
function TfrmProcessaSegregacao.VerificaPreenchimento: boolean;
begin
  Result := False;
  try
    if edDataProc.Text = '' then
      raise EValidacao.CreateVal('Escolha o período e o exercício!', dblkExerc);

    if not CtrlPeriodo.TestaPeriodoBloqueado(Sistema.IdEmpresa, tbIntegrado, CtrlPeriodo.Periodo, CtrlPeriodo.Exercicio, false) then
      raise EValidacao.createVal('O período deve estar integrado para proceder a segregação!', dblkExerc);

    //não criticar se a segregação é da memória de cálculo.
    if ( bsegMemoCalc ) then begin
       if chkProcessa.Checked then begin
         if cmContaSegreg.Conta.Numero = '' then
           raise EValidacao.createVal('A conta contábil para ajuste da segregação é obrigatória!', cmContaSegreg);

         if not(cmContaSegreg.Valida = VcOK) then
           raise EValidacao.createVal('Escolha uma conta contábil válida!', cmContaSegreg);
       end;
    end;

  except
    on ev : EValidacao do begin
      if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;
  Result := True;

end;

procedure TfrmProcessaSegregacao.mnuSalvarClick(Sender: TObject);
begin
  inherited;
  DlgSalvar.Execute;
  if DlgSalvar.FileName <> '' then
    meErros.Lines.SaveToFile(DlgSalvar.FileName);
end;

procedure TfrmProcessaSegregacao.mnuImprimirClick(Sender: TObject);
begin
  inherited;
  meErros.Print('');
end;

function TfrmProcessaSegregacao.VerificaProvaZero(iExercicio: integer = 0; iperiodo: integer = 0): boolean;
begin
  meErros.Lines.Add ('Processando segregação de: ' + dblkPeriodo.Text + '/' + dblkExerc.Text);
  meErros.Lines.Add ('===================================================================================');
  meErros.Lines.Add ('*** Verificando Regra Prova Zero nas planilhas do período ***');
  meErros.Lines.Add ('');
  Application.ProcessMessages;

  cdsProvaZero.Data := CtrlLancamento.getProvaZero(CtrlPeriodo.Exercicio, CtrlPeriodo.Periodo);

  if cdsProvaZero.IsEmpty then begin
    Result := true;
    meErros.Lines.Add ('Prova Zero OK');
  end else begin
    Result := False;
    meErros.Lines.Add ('Verifique erro(s) no(s) seguinte(s) código(s) de planilha interno:');
    cdsProvaZero.First;
    while not cdsProvaZero.Eof do begin
      meErros.Lines.Add (cdsProvaZero.FieldByName('PLNCODIGO').AsString);

      cdsProvaZero.Next;
    end;
    meErros.Lines.Add ('');
    meErros.Lines.Add ('Processo abortado!')
  end;

  meErros.Lines.Add ('===================================================================================');
end;

// Esta função verifica se todas as contas que possuem segregação estão parametrizas no plano de contas
function TfrmProcessaSegregacao.VerificaContaSegrega: boolean;
var
  sPlaContaSegrega: string;
  iIdplanoPrev : Integer;
begin
  Result := True;

  //se já foi segregado na origem, não deve processar esta função.
  if ( (bsegMemoCalcOrigemComum) or (bsegMemoCalcOrigemADM) ) then
     exit;

  meErros.Lines.Add ('*** Verificando Parametrização das contas contábeis para segregação ***');
  meErros.Lines.Add ('');
  Application.ProcessMessages;

  if rdgPlano.ItemIndex = 0 then iIdPlanoPrev := CtrlSegregacaoProc.PlanoPrevComum
  else iIdPlanoPrev := CtrlSegregacaoProc.PlanoPrevAdm;

  sqlContaSegrega.Prepare;
  sqlContaSegrega.ParamByName('PEREXERCICIO').AsInteger := CtrlPeriodo.Exercicio;
  sqlContaSegrega.ParamByName('PERNUMERO').AsInteger    := CtrlPeriodo.Periodo;
  sqlContaSegrega.ParamByName('IDPLANOPREV').AsInteger  := iIdplanoPrev;
  sqlContaSegrega.ParamByName('IDPATRO').AsInteger      := CtrlSegregacaoProc.PatroComum;
  sqlContaSegrega.Open;

  if cdsContaSegrega.IsEmpty then begin
    meErros.Lines.Add ('Não foi encontrado nenhum lançamento para segregar!');
    meErros.Lines.Add ('');
    meErros.Lines.Add ('Processo abortado!');
    Result := False;
    exit;
  end;

  // verifica todas as contas contábeis para segregação, independente erros encontrados
  cdsContaSegrega.First;
  while not cdsContaSegrega.Eof do begin
    sPlaContaSegrega := CtrlSegregacaoProc.ContaContabilSegregacao(cdsContaSegrega.FieldByName('PLACONTA').AsString);
    if sPlaContaSegrega = '' then begin
      Result := False;
      meErros.Lines.Add ('Verificar Parametrização da conta: ' + cdsContaSegrega.FieldByName('PLACONTA').AsString);
    end else begin
      cdsContaSegrega.Edit;
      cdsContaSegrega.FieldByName('SEGREGACONTA').AsString := sPlaContaSegrega;
      cdsContaSegrega.Post;
    end;
    cdsContaSegrega.Next;
  end;

  if not Result then begin
    meErros.Lines.Add ('');
    meErros.Lines.Add ('Processo abortado!')
  end else
    meErros.Lines.Add ('Parametrização OK');


  meErros.Lines.Add ('===================================================================================');
end;

function TfrmProcessaSegregacao.ProcessaSegregacao: boolean;
var
  iIdPlanoPrev: integer;
begin
  Result := True;
  meErros.Lines.Add ('*** Processando Segregação ***');
  meErros.Lines.Add ('');

  if dbCboSegregaCriter.Text <> '' then begin
    CdsSegregaCriterSel.Data := CtrlSegregacaoProc.ListaSegregaCriter(-2);
    CdsSegregaCriterSel.Insert;
    CdsSegregaCriterSel.FieldByName('IDSEGREGACRITER').AsInteger := cdsSegregaCriter.FieldByName('IDSEGREGACRITER').AsInteger;
    CdsSegregaCriterSel.FieldByName('DESCRICAO').AsString := cdsSegregaCriter.FieldByName('DESCRICAO').AsString;
    CdsSegregaCriterSel.FieldByName('FLGTIPOCOTACAO').AsString := cdsSegregaCriter.FieldByName('FLGTIPOCOTACAO').AsString;
    CdsSegregaCriterSel.FieldByName('HITCODHIST').AsString := cdsSegregaCriter.FieldByName('HITCODHIST').AsString;
    CdsSegregaCriterSel.FieldByName('TIPCODIGO').AsString := cdsSegregaCriter.FieldByName('TIPCODIGO').AsString;
    CdsSegregaCriterSel.Post;
  end else
    CdsSegregaCriterSel.Data := cdsSegregaCriter.Data;

  try
    CtrlSegregacaoProc.CreateThreadProgresso;
    frmProgresso.MostraFormProgresso('Processando Segregação...', false);

  if rdgPlano.ItemIndex = 0 then iIdPlanoPrev := CtrlSegregacaoProc.PlanoPrevComum
  else iIdPlanoPrev := CtrlSegregacaoProc.PlanoPrevAdm;

  // processa a segregação pois, não foi segregada na origem.
  if ( (not bsegMemoCalcOrigemComum) or (not bsegMemoCalcOrigemADM) and (bsegMemoCalc) ) then
     Result := CtrlSegregacaoProc.ProcessaSegregacaoMemoCalc(CtrlSegregacaoProc.ProgressFileName,
                                                             DateToStr (edDataProc.DateTime),
                                                             cmContaSegreg.Conta.Numero,
                                                             Sistema.IdUsuario,
                                                             StrToInt(dblkExerc.Text),
                                                             CdsPeriodo.FieldByName('PERNUMERO').AsInteger,
                                                             iIdPlanoPrev,
                                                             Sistema.UsaPlanoPatro, chkProcessa.Checked);

  // processa a segregação para plano Comum ou ADM mas, não usou a MemoCalc.
  if ( (bSegComum) or (bSegAdm) ) then
     Result := CtrlSegregacaoProc.ProcessaSegregacao(CtrlSegregacaoProc.ProgressFileName,
                                                     DateToStr (edDataProc.DateTime),
                                                     cmContaSegreg.Conta.Numero,
                                                     CdsSegregaCriterSel.Data,
                                                     cdsContaSegrega.Data,
                                                     Sistema.IdUsuario,
                                                     StrToInt(dblkExerc.Text),
                                                     CdsPeriodo.FieldByName('PERNUMERO').AsInteger,
                                                     iIdPlanoPrev,
                                                     Sistema.UsaPlanoPatro, chkProcessa.Checked);

  finally
    frmProgresso.EscondeFormProgresso;
    CtrlSegregacaoProc.FreeThreadProgresso;
  end;

  meErros.Lines.Add ('===================================================================================');

end;

procedure TfrmProcessaSegregacao.Progresso(vParams: array of variant);
begin
  frmProgresso.AndaFormProgresso(vParams[1], vParams[2]);
  if (High (vParams) = 3) then
    if vParams[3] <> '' then meErros.Lines.Add ( vParams[3] );

end;



procedure TfrmProcessaSegregacao.dblkPeriodoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if dblkPeriodo.Text <> '' then
    CtrlPeriodo.Periodo := CdsPeriodo.FieldByName('PERNUMERO').AsInteger;
  DataLancamento;
end;

end.
