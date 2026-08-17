//*************************************************************************************
//*************************************************************************************
// Memória de cálculo a ser adotada para a atualização do Objetos
// Passada pela Contabilidade em 14/06/2011 pelo Sr. Igor

//Cálculo Correto - processo 3860

//Saldo em 12/2010	A	 15.210.840,00
//Principal 	B	          1.000.000,00
//Correção Acum.	C	  7.266.761,00
//Juros Acumulado	D	  6.944.079,00
//Índice TRN Jan/11	E       	0,0715%
//Qtde mês JUROS	F	            85

//Cálculo Correção
//=(B+C)*E	G	              5.910,73
//Cálculo JUROS
//=(B+C+G)*F%-D	H	             87.691,97

//Saldo em 01/2011 = A+G+H = I   15.304.442,71
//PercOrig = (I/B) * 100              1.530,44

//**************************************************************************************
//**************************************************************************************
//Rotina..........: Geral
//N. Sol..........: 169482
//N. Kintana......: 1501827
//Data............: 12/12/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Ajuste na atualização monetária dos processos em lote.
//************************************************************************************************
//Rotina..........: chklstProcessoClick(), bbtnConfirmarClick()
//N. Sol..........: 133001
//N. Kintana......: 771169
//Data............: 26/03/2010
//Responsável.....:`Paulo Nobre / William M. Santos
//Descrição.......: Correção ao fazer o desfazer correção, o sistema estava apagando todo o histórico.
//*******************************************************
//Rotina..........: bbtnCorrigirClick()
//N. Sol..........: 132498
//N. Kintana......: 763777
//Data............: 17/03/2010
//Responsável.....:`Paulo Nobre / William M. Santos
//Descrição.......: Implementação para que seja corrigido somente as etapas que estão na Grid das Etapas.
//*******************************************************
//Rotina..........: cbxObjetosClick(), cbxRecursosClick(), cbxCustasClick(), dtedLimiteExit()
//N. Sol..........: 127548
//N. Kintana......: 676940
//Data............: 24/11/2009
//Responsável.....: William M. Santos
//Descrição.......: Comentado a chamada a função TrazDataSugerida conforme solicitação.
//********************************************************************
//Rotina..........: bbtnConfirmarClick(), FormCreate()
//N. Sol..........: 125242
//N. Kintana......: 643010
//Data............: 02/10/2009
//Responsável.....: William Santos
//Descrição.......: Solicito crítica para a tela de correção monetária dos
//                  processos, quando não for marcado nenhum tipo de filtro e/ou selecionado nenhum
//                  tipo de processo, visto que atualmente o sistema gera erro.
//********************************************************************
//Rotina..........: bbtnCorrigirClick()
//N. Sol..........: 124899
//N. Kintana......: 638946
//Data............: 28/09/2009
//Responsável.....: William Santos
//Descrição.......: Implementação para que seja informado o índice para as Custas.
//********************************************************************
//Rotina..........:
//N. Sol..........: 124767
//N. Kintana......: 637517
//Data............: 24/09/2009
//Responsável.....: William Santos
//Descrição.......: Implementado ajuste para corrigir o problema de desfazer correção monetária,
//                  pois não estava gravando valor das custas na hstetapaproctrab.
//********************************************************************
//Rotina..........: bbtnConfirmarClick(), chklstProcessoClick()
//N. Sol..........: 122631
//N. Kintana......: 604039
//Data............: 14/09/2009
//Responsável.....: William Santos
//Descrição.......: Implementação para trazer as etapas referentes ao processo selecionado RM JUR-2009.08.
//********************************************************************
//Rotina..........: Corrigir
//N. Sol..........: 123110
//N. Kintana......: 612018
//Data............: 12/08/2009
//Responsável.....: William Santos / Paulo Nobre
//Descrição.......: Alterado o where da qry para receber mais de um ID. Usamos uma tabela temporária para
//                  armazenar os valores dos NumProcTrab.
//********************************************************************
//Rotina..........: TCtrlHstObjProcTrab.ExistePlanoPatro
//N. Sol..........: 119538
//N. Kintana......: 568985
//Data............: 09/06/2009
//Responsável.....: William Santos / Paulo Nobre
//Descrição.......: Mudança no sinal de comparação das datas.
//*******************************************************
//Rotina..........: TCtrlHstObjProcTrab.ExistePlanoPatro
//N. Sol..........: 106982
//N. Kintana......: 479746
//Data............: 22/01/2009
//Responsável.....: Marilza Colpani
//Descrição.......: Inclusão da instrução "in" na query para
//                  possibilitar contabilização quando existir
//                  mais de um processo.
//*******************************************************
//Rotina..........: TfrmCorrecaoMonet.bbtnCorrigirClick
//N. Sol..........: 103388
//N. Kintana......: 461486
//Data............: 11/12/2008
//Responsável.....: Marilza Colpani
//Descrição.......: Inclusão de uma condição para fazer o lançamento
//                  de acordo com o  tipo previdencial selecionado.
//*******************************************************}
Unit fCorrecaoMonet;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   fSelProcessoCons, uCmSqlParams, Db, DBClient, uCMClientDataSet, Wwdatsrc,
   CmParamReport, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, wwdblook, Spin, wwdbdatetimepicker, CMDateTimePicker,
   TEdNum, ExtCtrls, ComCtrls, TREdit, CMProcuraSubTipo, CheckLst, uCtrlPeriodo,
   ColorCheckListBox, uCtrlGlobalRH, uCtrlListTerceirosRH, uCtrlCorrigeObjEtapasProc,
   uCtrlEtapaProcesso, uCtrlParamRH, uCtrlHstEtapaProcTrab, uCmControlObject, uCmDbObject,
   uMensErro, DBTables, Grids, DBGrids, Wwdbigrd, Wwdbgrid, Wwquery, uCtrlFuncoesRH,
   fcLabel, uCtrlContab, uCMMath;
Type
   TfrmCorrecaoMonet = Class(TfrmSelProcessoCons)
      tbshCorrecaoMonet: TTabSheet;
      CdsTipoDesemb: TCMClientDataSet;
      CdsTipoOper: TCMClientDataSet;
      CdsTipoDoc: TCMClientDataSet;
      PageControlRateio: TPageControl;
      tbshSelecao: TTabSheet;
      chklstProcesso: TColorCheckListBox;
      bbtnSelTodosFunc: TBitBtn;
      bbtnInverteSelFunc: TBitBtn;
      bbtnCorrigir: TBitBtn;
      dtedLimite: TCMDateTimePicker;
      lblAtualizar: TLabel;
      gbxOpcoes: TGroupBox;
      cbxObjetos: TCheckBox;
      cbxRecursos: TCheckBox;
      cbxCustas: TCheckBox;
      gbxRecursos: TGroupBox;
      dblckIndRecursos: TwwDBLookupCombo;
      gbxCustas: TGroupBox;
      dblckIndCustas: TwwDBLookupCombo;
      dbredJurosRecursos: TRealEdit;
      dbredJurosCustas: TRealEdit;
      Label8: TLabel;
      Label9: TLabel;
      CdsMoeda: TCMClientDataSet;
      CdsMoeda2: TCMClientDataSet;
      cbxProcesso: TCheckBox;
      cbxEtapa: TCheckBox;
      cbxDesfazer: TCheckBox;
      qryListaProcesso: TQuery;
      dsEtapa: TwwDataSource;
      Label7: TLabel;
      dbgEtapas: TwwDBGrid;
      CdsEtapaGridDESCRICAO: TStringField;
      CdsEtapaGridNUMSEQ: TFloatField;
      CdsEtapaGridVALORREC: TFloatField;
      CdsEtapaGridDATAREALOCOR: TDateTimeField;
      CdsEtapaGridDATAPREVOCORR: TDateTimeField;
      CdsEtapaGridVALORCUSTAS: TFloatField;
      CdsEtapaGridNUMPROCTRAB: TFloatField;
      Label10: TLabel;
      Label11: TLabel;
      Query1: TQuery;
      SpeedButton1: TSpeedButton;
      Label12: TLabel;
      lblProc: TLabel;
      Label13: TLabel;
      lblProg: TLabel;
      Label16: TLabel;
      lblSubProg: TLabel;
      Label18: TLabel;
      lblObj: TLabel;
      Label14: TLabel;
      lblSit: TLabel;
      Procedure bbtnSelTodosFuncClick(Sender: TObject);
      Procedure bbtnInverteSelFuncClick(Sender: TObject);
      Procedure HabilitaBtOk;
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure bbtnCorrigirClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure cbxObjetosClick(Sender: TObject);
      Procedure cbxRecursosClick(Sender: TObject);
      Procedure cbxProcessoClick(Sender: TObject);
      Procedure cbxEtapaClick(Sender: TObject);
      Procedure cbxDesfazerClick(Sender: TObject);
      //Procedure dtedLimiteChange(Sender: TObject);

      //William Santos / Paulo Nobre KINTANA 546991 SOL 116518 INICIO
      Procedure dtedLimiteExit(Sender: TObject);
      Procedure chklstProcessoClick(Sender: TObject);
      Procedure SpeedButton1Click(Sender: TObject);
      //William Santos / Paulo Nobre KINTANA 546991 SOL 116518 FIM

   Protected

   Private
      { Private declarations }
      CtrlGlobalRH: TCtrlGlobalRH;
      CtrlFuncoesRH: TCtrlFuncoesRH;
      CtrlCorrigeObjEtapasProc: TCtrlCorrigeObjEtapasProc;
      CtrlListTerceirosRH: TCtrlListTerceirosRH;
      CtrlEtapaProcesso: TCtrlEtapaProcesso;

      CtrlPeriodo: TCtrlPeriodo;
      CtrlParamRH: TCtrlParamRH;
      ListaNumProcesso: TStringList;
      sListaProcesso: String;
      IdPatro, IdPlanoPrev: integer;
      bFazCAP, bFazContab: boolean;
      FPlnCodigo: double;

      //---Emerson KT 546989  SOL 116516 inicio--//
      cdsHistoricoEtapas: TCMClientDataSet;
      //---Emerson KT 546989  SOL 116516 fim----//

      Function CompStr(a: String; Tam: integer; Letra: char; Direcao: boolean): String;
   Public
      { Public declarations }

      //William Santos  KINTANA 604039 SOL 122631 INI
      sidproc: String;
      //William Santos  KINTANA 604039 SOL 122631 FIM

      Function CorrigirObjetos(Query, TipoSel, ListaProcesso, DataLim: String;
         FazContab: boolean; IdEmpresa, IdModulo, IdUsuario: integer;
         Desfazer: boolean): boolean;
   End;

Var
   frmCorrecaoMonet: TfrmCorrecaoMonet;
   _CdsUltimoHistoricoObjeto: TCMClientDataSet;
   dPlnCodigo: Double;
   qtdProcCorrigidos: Integer;

Implementation

{$R *.DFM}

Uses uSistema, uCtrlUsoGeralRH, uCtrlPadroes, dCds, uCtrlParamIntegra, fAguarde, dBaseDados;

Procedure TfrmCorrecaoMonet.FormCreate(Sender: TObject);
Begin
   Inherited;

   dtedLimite.Date := Date;

   ListaNumProcesso := TStringList.Create;

   CtrlCorrigeObjEtapasProc := TCtrlCorrigeObjEtapasProc.Create;
   CtrlCorrigeObjEtapasProc.InitializeAs(Padroes);

   CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
      CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
   CtrlListTerceirosRH.InitializeAs(Padroes);

   CtrlEtapaProcesso := TCtrlEtapaProcesso.Create(CtrlUsoGeralRH.UsuXFilial,
      CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
   CtrlEtapaProcesso.InitializeAs(Padroes);

   CtrlPeriodo := TCtrlPeriodo.Create;
   CtrlPeriodo.InitializeAs(Padroes);

   CtrlGlobalRH := TCtrlGlobalRH.Create;
   CtrlGlobalRH.InitializeAs(Padroes);
   dmCds.Cds.Data := CtrlGlobalRH.GetParamRH('FLGINTEGRACAP, FLGINTEGRACONT, INDCONTABJUR');

   // Paulo
   CtrlFuncoesRH := TCtrlFuncoesRH.Create;
   CtrlFuncoesRH.InitializeAs(Padroes);

   CtrlParamRH := TCtrlParamRH.Create;
   CtrlParamRH.InitializeAs(Padroes);
   CdsMoeda.Data := CtrlParamRH.ListMoeda;
   CdsMoeda2.Data := CtrlParamRH.ListMoeda;

   // Integração com a Contabilidade
   bFazContab := (dmCds.Cds.FieldByName('FLGINTEGRACONT').asInteger = 1) And
      (CtrlPeriodo.RetornaPeriodoExercicioData(Sistema.IdEmpresa, DateToStr(Date)));

   If (bFazCAP) Or (bFazContab) Then
      Begin
         CdsTipoDesemb.Data := CtrlListTerceirosRH.ListTipoDocRecebDesemb(Sistema.IdEmpresa, 'P', true);

         CtrlEtapaProcesso.IniciarIntegracao(Sistema.IdEmpresa, Sistema.IdModulo,
            Sistema.IdUsuario, Sistema.IdEspAcesso, Sistema.UsaPlanoPatro,
            ParamIntegra.ObrigaAbc, ParamIntegra.ObrigaCRespon,
            ParamIntegra.PlanoPrevGlobal, ParamIntegra.PatroGlobal);
      End;

   //William M. Santos SOL 125242 - KINTANA 643010 - INI
   tbshCorrecaoMonet.TabVisible := false;
End;

Procedure TfrmCorrecaoMonet.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   Inherited;
   ListaNumProcesso.Free;
   FreeAndNil(CtrlCorrigeObjEtapasProc);
   FreeAndNil(CtrlGlobalRH);
   FreeAndNil(CtrlEtapaProcesso);
   FreeAndNil(CtrlPeriodo);
   FreeAndNil(CtrlListTerceirosRH);
   FreeAndNil(CtrlParamRH);
   FreeAndNil(qryListaProcesso);
End;

Procedure TfrmCorrecaoMonet.bbtnSelTodosFuncClick(Sender: TObject);
Var
   c: integer;
Begin
   For c := 0 To chklstProcesso.Items.Count - 1 Do
      chklstProcesso.Checked[c] := true;
   chklstProcesso.Repaint;
   HabilitaBtOk;
End;

Procedure TfrmCorrecaoMonet.bbtnInverteSelFuncClick(Sender: TObject);
Var
   c: integer;
Begin
   For c := 0 To chklstProcesso.Items.Count - 1 Do
      chklstProcesso.Checked[c] := Not (chklstProcesso.Checked[c]);
   chklstProcesso.Repaint;
   HabilitaBtOk;
End;

Procedure TfrmCorrecaoMonet.HabilitaBtOk;
Begin
   bbtnCorrigir.Enabled := chklstProcesso.Items.Count > 0;
   bbtnSelTodosFunc.Enabled := chklstProcesso.Items.Count > 0;
   bbtnInverteSelFunc.Enabled := chklstProcesso.Items.Count > 0;
End;

Function TfrmCorrecaoMonet.CompStr(a: String; Tam: integer; Letra: char; Direcao: boolean): String;
Var
   i: integer;
   b: String;
Begin
   b := '';
   If (Tam < Length(a)) Then
      a := Copy(a, 1, Tam);

   If (Tam > Length(a)) Then
      For i := 1 To Abs(Tam - Length(a)) Do
         b := b + Letra;

   If (Direcao) Then
      b := b + a
   Else
      b := a + b;

   Result := b;
End;

Procedure TfrmCorrecaoMonet.bbtnCorrigirClick(Sender: TObject);
Var
   wNum, wNum1, wNum2: word;
   dValor: double;
   IdPlanoPrev, IdPatro: integer;
   bUsaPlanoPatro: boolean;
   sQuery, sTipoSel {0=Sem IN, 1=IN, 2=NOT IN}: String;

   dDateAuxi, dDataPrimeiroDiadoMesDaCorrecao, dDataUltimoDiadoMesDaCorrecao: TDateTime;
   wAno, wMes, wDia: word;
Begin
   Inherited;

   //William M. Santos - SOL 124899 KINTANA 638946 - INI
   If ((cbxRecursos.Checked) And (dblckIndCustas.Text = '') And (Not cbxDesfazer.Checked)) Then
      Begin
         MsgDlg('É necessário ser informado pelo menos o Índice das Custas!', 'Aviso', mtInformation, [mbOk], 0);
         dblckIndCustas.SetFocus;
         Exit;
      End;
   //William M. Santos - SOL 124899 KINTANA 638946 - FIM

   If (Not cbxDesfazer.Checked) And (Not cbxObjetos.Checked) And (Not cbxRecursos.Checked) And (Not cbxCustas.Checked) Then
      Begin
         MsgDlg('Selecione Pelo Menos 1 das Opções', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
         cbxObjetos.SetFocus;
         exit;
      End;

   wNum1 := CdsProcesso.RecordCount;
   wNum := FU.CriaListaOpcoes(chklstProcesso, ListaNumProcesso, sListaProcesso, ',', false);

   If (wNum = 0) Then
      Begin
         MsgDlg('Selecione Pelo Menos 1 Processo', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
         chklstProcesso.SetFocus;
         exit;
      End;

   sTipoSel := '0';

   If (wNum <> wNum1) Then
      Begin
         If (wNum > round(0.2 * wNum1)) And (wNum < round(0.8 * wNum1)) And
            (MsgDlg('Ao Fazer uma 2ª Seleção de Processos, o Sistema' + CR_LF +
            'Utiliza um Procedimento Que Pode Ser Inconveniente' + CR_LF +
            'Caso Muitos Processos Tenham Sido (Des)Selecionados.' + CR_LF +
            'Confirma a Execução Assim Mesmo ?', 'Confirmação',
            mtConfirmation, [mbYes, mbNo], 0) <> mrYes) Then
            exit;

         If (wNum > round(0.5 * wNum1)) Then
            Begin
               sTipoSel := '2';
               bbtnInverteSelFuncClick(Self);
               wNum2 := FU.CriaListaOpcoes(chklstProcesso, ListaNumProcesso, sListaProcesso, ',', false);
               bbtnInverteSelFuncClick(Self);
            End
         Else
            sTipoSel := '1';

      End;

   // Paulo Nobre
   IdPatro := 0;
   IdPlanoPrev := 0;

   sQuery := sqlProcesso.SQL.Text;
   If (cbxRecursos.Checked) And (Not cbxObjetos.Checked) Then
      Begin
         If CtrlCorrigeObjEtapasProc.CorrigirEtapas(dtedLimite.Text,
            Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario,
            FU.IFF(cbxEtapa.Checked, 0, CdsMoeda.FieldByName('MOECODIGO').asInteger),
            FU.IFF(dblckIndCustas.Value = '', 0, CdsMoeda2.FieldByName('MOECODIGO').asInteger),
            FU.IFF(cbxEtapa.Checked, 0, dbredJurosRecursos.Value),
            dbredJurosCustas.Value,
            cbxDesfazer.Checked,
            CdsEtapaGrid) Then
            Begin
               MsgDlg('Correção efetuada para cada um das ' + IntToStr(CdsEtapaGrid.RecordCount) + ' Etapas Selecionadas.', 'Aviso',
                  mtInformation, [mbOk, mbHelp], 0);

               bbtnConfirmarClick(Self);
            End
         Else
            If CtrlCorrigeObjEtapasProc.MessageInfo <> '' Then
               MsgDlg(CtrlCorrigeObjEtapasProc.MessageInfo, 'Erro', mtError, [mbOk, mbHelp], 0);
      End
   Else // Objetos
      Begin

         If Not cbxDesfazer.Checked Then
            Begin
               If (MsgDlg('Confirma as Atualizações Financeiras dos Objetos ?', 'Confirmação',
                  mtConfirmation, [mbYes, mbNo], 0) <> mrYes) Then
                  exit;
            End
         Else
            Begin
               If (MsgDlg('Confirma o Desfazer das Atualizações Financeiras dos Objetos ?', 'Confirmação',
                  mtConfirmation, [mbYes, mbNo], 0) <> mrYes) Then
                  exit;
            End;

         If CorrigirObjetos(sQuery, sTipoSel, sListaProcesso, dtedLimite.Text,
            bFazContab, Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario, cbxDesfazer.Checked) Then
            Begin
               If Not cbxDesfazer.Checked Then
                  Begin
                     MsgDlg('Quantidade de Objetos Atualizados    : ' + IntToStr(qtdProcCorrigidos) + CR_LF +
                        FU.IFF(FPlnCodigo > 0, CR_LF + 'Planilha Contábil Nº ' +
                        FloatToStr(FPlnCodigo), ''), 'Aviso',
                        mtInformation, [mbOk, mbHelp], 0)
                  End
               Else
                  Begin
                     MsgDlg('Correção Desfeita para os Objetos Atualizados !', 'Aviso',
                        mtInformation, [mbOk, mbHelp], 0);
                  End;
            End
         Else
            If CtrlCorrigeObjEtapasProc.MessageInfo <> '' Then
               MsgDlg(CtrlCorrigeObjEtapasProc.MessageInfo, 'Erro', mtError, [mbOk, mbHelp], 0);
      End;
End;

Procedure TfrmCorrecaoMonet.cbxObjetosClick(Sender: TObject);
Begin
   Inherited;
   dtedLimite.Date := Date;

   //William M. Santos - nº Sol 127548 Kintana nº 676940
   If (cbxRecursos.Checked) And (Not cbxObjetos.Checked) Then
      cbxRecursosClick(Sender);
End;

Procedure TfrmCorrecaoMonet.cbxRecursosClick(Sender: TObject);
Begin
   Inherited;
   gbxRecursos.Enabled := cbxRecursos.Checked;
   dtedLimite.Date := Date;

   //William M. Santos - nº Sol 127548 Kintana nº 676940
   If (Not cbxObjetos.Checked) And (cbxRecursos.Checked) Then
      dtedLimite.Date := CtrlCorrigeObjEtapasProc.TrazDataSugerida(CdsProcesso.FieldByName('NUMPROCTRAB').AsFloat);

   cbxCustas.Checked := cbxRecursos.Checked;
End;

Procedure TfrmCorrecaoMonet.cbxProcessoClick(Sender: TObject);
Begin
   Inherited;
   gbxCustas.Visible := Not cbxProcesso.Checked;
End;

Procedure TfrmCorrecaoMonet.cbxEtapaClick(Sender: TObject);
Begin
   Inherited;
   gbxRecursos.Visible := Not cbxEtapa.Checked;
End;

Procedure TfrmCorrecaoMonet.cbxDesfazerClick(Sender: TObject);
Begin
   Inherited;
   If cbxDesfazer.Checked Then
      lblAtualizar.Caption := 'Desfazer Até:'
   Else
      lblAtualizar.Caption := 'Atualizar Até:'
End;

Procedure TfrmCorrecaoMonet.dtedLimiteExit(Sender: TObject);
Var
   dDateAuxi, dDataPrimeiroDiadoMesDaCorrecao, dDataUltimoDiadoMesDaCorrecao: TDateTime;
   wAno, wMes, wDia: word;
Begin
   //   Inherited;
      //William M. Santos - nº Sol 127548 Kintana nº 676940 - Comentado tudo abaixo.- INI
      //William Santos / Paulo Nobre KINTANA 546991 SOL 116518 INÍCIO
   {   If Not cbxDesfazer.Checked Then
         Begin
            If (cbxRecursos.Checked) And (Not cbxObjetos.Checked) Then
               Begin
                  // Ultimo dia do mês
                  dDataUltimoDiadoMesDaCorrecao := CtrlCorrigeObjEtapasProc.TrazDataSugerida(CdsProcesso.FieldByName('NUMPROCTRAB').AsFloat);
                  DecodeDate(dDataUltimoDiadoMesDaCorrecao, wAno, wMes, wDia);
                  dDataPrimeiroDiadoMesDaCorrecao := strtodate('01/' + FormatFloat('00', wMes) + '/' + inttostr(wAno));

                  If (dtedLimite.Date < dDataPrimeiroDiadoMesDaCorrecao) Or (dtedLimite.Date > dDataUltimoDiadoMesDaCorrecao) Then
                     If (dtedLimite.Date > dDataUltimoDiadoMesDaCorrecao) Then
                        Begin
                           Application.MessageBox(pchar('Data deve estar dentro do período de correção - ' +
                              datetostr(dDataPrimeiroDiadoMesDaCorrecao) +
                              ' a ' +
                              datetostr(dDataUltimoDiadoMesDaCorrecao)), 'Data Inválida', Mb_IconExclamation);

                           dtedLimite.Date := dDataUltimoDiadoMesDaCorrecao;
                        End;
               End;

            bbtnConfirmarClick(Self);
            //William Santos / Paulo Nobre KINTANA 546991 SOL 116518 FIM
         End;                        }
      //William M. Santos - nº Sol 127548 Kintana nº 676940 - Comentado tudo acima.- FIM
End;

Procedure TfrmCorrecaoMonet.bbtnConfirmarClick(Sender: TObject);
Begin
   If (dtpEtapaIni.Text <> '') And (dtpEtapaFim.Text <> '') Then
      Begin
         If StrToDate(dtpEtapaIni.Text) > StrToDate(dtpEtapaFim.Text) Then
            Begin
               MsgDlg('Data Inicial não pode ser maior que a Data Final !', 'Aviso', mtInformation, [mbOk], 0);
               dtpEtapaIni.SetFocus;
               exit;
            End;
      End;
   //William Santos SOL 116513 KINTANA 547694 - FIM

   Inherited;

   // Carregando a stringlist com os processos
   chklstProcesso.Clear;
   ListaNumProcesso.Clear;
   CdsProcesso.First;
   While Not CdsProcesso.Eof Do
      Begin
         If CdsProcesso.FieldByName('NOME').AsString <> '' Then
            Begin
               chklstProcesso.Items.Add(CompStr(CdsProcesso.FieldByName('NUMPROCTRAB').AsString, 8, ' ', false) + ' ' + //William Santos  KINTANA 604039 SOL 122631
                  CompStr(CdsProcesso.FieldByName('PROCJCJNUM').AsString, 20, ' ', false) + ' ' +
                  CompStr(CdsProcesso.FieldByName('NOME').AsString, 30, ' ', false) + ' ' +
                  CompStr(CdsProcesso.FieldByName('NOMEVARA').AsString, 30, ' ', false));

               ListaNumProcesso.Add(CdsProcesso.FieldByName('NUMPROCTRAB').AsString);
            End;
         CdsProcesso.Next;
      End;

   // William / Paulo Sol 133001 Kintana 77169 - 26/03/2010
//   Label11.caption := inttostr(chklstProcesso.Items.Count) + ' Processo(s)';

   // William Santos  KINTANA 604039 SOL 122631 INI
   // É passado para o filter do cdsEtapaGrid o primeiro id do componente chklstProcesso.
   If Not CdsProcesso.IsEmpty Then
      Begin
         sidproc := trim(copy(chklstProcesso.Items.Strings[0], 1, 8)); // sIdProcesso[0];
         CdsEtapaGrid.Filtered := false;
         CdsEtapaGrid.Filter := 'NUMPROCTRAB = ' + sidproc + '';
         CdsEtapaGrid.Filtered := true;
      End;
   // William Santos  KINTANA 604039 SOL 122631 FIM

   // William / Paulo Sol 133001 Kintana 77169 - 26/03/2010
   label10.caption := inttostr(CdsEtapaGrid.recordcount);

   CdsProcesso.First;

   bbtnOutraVezClick(Self);
   bbtnSelTodosFuncClick(Self);

   //William M. Santos SOL 125242 - KINTANA 643010 - INI
   If Not cdsProcesso.IsEmpty Then
      Begin
         tbshCorrecaoMonet.TabVisible := true;
         pgctrlPrincipal.ActivePageIndex := 4;
         pageControlRateio.ActivePageIndex := 0;
      End
   Else
      Begin
         tbshCorrecaoMonet.TabVisible := false;
         pgctrlPrincipal.ActivePageIndex := 0;
         MsgDlg('Não foi econtrado nenhum Processo/Recurso para Correção.', 'Aviso', mtInformation, [mbOk], 0);
      End;

   //William M. Santos SOL 125242 - KINTANA 643010 - FIM

End;

Procedure TfrmCorrecaoMonet.chklstProcessoClick(Sender: TObject);
Begin
   Inherited;
   //William Santos  KINTANA 604039 SOL 122631 INI
   //Captura o processo selecionado e passa para o filter.
   cdsEtapaGrid.Filtered := false;
   sidproc := trim(copy(chklstProcesso.Items.Strings[chklstProcesso.ItemIndex], 1, 8));
   cdsEtapaGrid.Filter := 'NUMPROCTRAB = ' + sidproc + '';
   cdsEtapaGrid.Filtered := true;

   // William / Paulo Sol 133001 Kintana 77169 - 26/03/2010
   label10.caption := inttostr(CdsEtapaGrid.recordcount);
   //William Santos  KINTANA 604039 SOL 122631 FIM
End;

Procedure TfrmCorrecaoMonet.SpeedButton1Click(Sender: TObject);
Begin
   Inherited;
   dtmBaseDados.dbBaseDados.StartTransaction;
   query1.ExecSQL;
   dtmBaseDados.dbBaseDados.Commit;
End;

Function TfrmCorrecaoMonet.CorrigirObjetos(Query, TipoSel, ListaProcesso, DataLim: String;
   FazContab: boolean; IdEmpresa, IdModulo, IdUsuario: integer;
   Desfazer: boolean): boolean;
Var
   _CdsHstObjeto: TCMClientDataSet;

   _CdsObjeto: Twwquery;
   qryPrograma: Twwquery;
   qryAux1: Twwquery;
   qryAux2: Twwquery;

   sMovimentoAnalitico: TStringList;

   dDataCorrObj: TdateTime;
   bPrimProc: Boolean;

   IdPatro, IdPlanoPrev, iNumPlnCodigoObj, iPlnCodigo, iQtd_Meses, Aplica_se_A, IdSegregaCriterio, iTipoCorrecao: integer;
   sDataAtualCorrecao, sDataUltimaCorrecao, Sinal, sListaProcPSp, sProcAtu, sProcAnt, sLinhaMov, sIndiceCM: String;
   dValorJurosAcumContab, dValorAtualizadoAnteriorProporcional, dValorAtualCorrigido, dValorJurosObj, dValorCorrecaoMonetariaObj,
      dValorCorrecaoMonetariaAcumContab, dValorAtualNovo, dValorPrincipalAcumContab, dValorPrincipalAcumEncerramentoContab, dValorLancamento: Double;
   dPercOrigAtual, dIdHistorico, dUltimoJurosAcumuladoProporcional, dValorReclamadoProporcional, dUltimaCorrecaoAcumuladaProporcional, dValorTemp, dJurosAcumuladoAtual: Double;
Begin
   Result := False;
   _CdsHstObjeto := TCMClientDataSet.Create(Nil);
   _CdsUltimoHistoricoObjeto := TCMClientDataSet.Create(Nil);
   qryPrograma := Twwquery.Create(Nil);

   _CdsObjeto := Twwquery.Create(Nil);
   qryAux1 := Twwquery.Create(Nil);
   qryAux2 := Twwquery.Create(Nil);

   sMovimentoAnalitico := TStringList.Create();

   Sinal := ' < ';
   If (Desfazer) Then
      Sinal := ' >= ';

   dPlnCodigo := 0;
   sDataAtualCorrecao := DataLim;

   If Desfazer = False Then
      Begin
         If Not dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.StartTransaction;

         qryAux1.DataBaseName := 'BaseDados';
         qryAux1.Close;
         qryAux1.SQL.Clear;
         // Só atualiza programa e sub-programa para os objetos que foram incluidos dentro do mes da correção do dia 01 do mes em diante
         qryAux1.SQL.Add('UPDATE objproctrab oj SET oj.idtipoproc = (SELECT tp1.idtipoproc FROM tipoobjproctrab tp1 WHERE tp1.codtipoobjeto = oj.codtipoobjeto), ');
         qryAux1.SQL.Add(' oj.tipcodigo = (SELECT tp2.tipcodigo FROM tipoobjproctrab tp2 WHERE tp2.codtipoobjeto = oj.codtipoobjeto)          ');
         qryAux1.SQL.Add('WHERE TRUNC(oj.TRGDTINCLUSAO) >= TRUNC(TO_DATE(' + QuotedStr(sDataAtualCorrecao) + '),''MONTH'') '); // este comando dá o 1º dia do mês
         qryAux1.SQL.Add('AND oj.idtipoproc is null AND oj.tipcodigo is null  ');
         If Not qryAux1.Prepared Then
            qryAux1.Prepare;
         qryAux1.ExecSQL;
         dtmBaseDados.dbBaseDados.Commit;
      End;

   Try
      If Not dtmBaseDados.dbBaseDados.InTransaction Then
         dtmBaseDados.dbBaseDados.StartTransaction;

      _CdsObjeto.DataBaseName := 'BaseDados';
      _CdsObjeto.Close;
      _CdsObjeto.SQL.Clear;
      _CdsObjeto.SQL.Add('SELECT');
      _CdsObjeto.SQL.Add('P.MOEDAPROCTRAB, P.TAXAJUROS, P.FLGSITPROC, P.CODSUBCONTA, P.IDPLANOPREV, P.IDPATRO, P.DATAEFETENC, ');
      _CdsObjeto.SQL.Add(' DECODE(P.DATAJUROS, NULL, P.DATANOTIF, P.DATAJUROS) As DATAJUROS, ');
      _CdsObjeto.SQL.Add(' DECODE(O.DATAAVAL, NULL, P.DATANOTIF, O.DATAAVAL) As DATA_ULTIMA_CORRECAO, O.DATAINICIO, ');
      _CdsObjeto.SQL.Add(' O.NUMPROCTRAB, O.CODTIPOOBJETO, O.IDTIPOPROC, O.TIPCODIGO, O.VALORRECL, O.PERCPROB, ');
      _CdsObjeto.SQL.Add(' O.VALORSENTENCA, O.OBSERVACAO, O.INDVALOR, O.DATAFINAL, O.PERCORIG, O.DATAAVAL, O.FLGCONTABVLPRINC, ');
      _CdsObjeto.SQL.Add(' T.DESCRICAO, O.FLGCONTABENCERRADO');
      _CdsObjeto.SQL.Add(' FROM');
      _CdsObjeto.SQL.Add(' PROCESSOTRAB P, OBJPROCTRAB O, TIPOOBJPROCTRAB T');
      _CdsObjeto.SQL.Add(' WHERE');
      _CdsObjeto.SQL.Add(' P.NUMPROCTRAB = O.NUMPROCTRAB');
      _CdsObjeto.SQL.Add(' And O.CODTIPOOBJETO = T.CODTIPOOBJETO');
      _CdsObjeto.SQL.Add(' And NVL(O.VALORRECL, 0) > 0'); // Somente Objetos com Valor
      _CdsObjeto.SQL.Add(' And NVL(O.PERCORIG, 0) > 0'); // Somente com % de Origem > 0
      _CdsObjeto.SQL.Add(' And NVL(O.PERCPROB, 0) > 0'); // Somente com % de probabilidade > 0
      _CdsObjeto.SQL.Add(' And (O.DATAAVAL IS NOT NULL And O.DATAAVAL ' + Sinal + ' ' + QuotedStr(sDataAtualCorrecao) + ')');
      _CdsObjeto.SQL.Add(' And TRUNC(O.TRGDTINCLUSAO) <= ' + QuotedStr(sDataAtualCorrecao)); // Regra indicada pela Contabilidade e GEJUR
      _CdsObjeto.SQL.Add(' And O.IDTIPOPROC IS NOT NULL And O.TIPCODIGO IS NOT NULL   ');

      If (StrToFloat(ednNum1.Text) > 0) And (ednNum2.Text <> '9999999999') Then
         _CdsObjeto.SQL.Add(' And ' + CtrlFuncoesRH.QuebrarListaFiltro(1, '(O.NUMPROCTRAB', ListaProcesso, 500))
      Else
         Begin
            _CdsObjeto.SQL.Add(' And O.NUMPROCTRAB IN (SELECT PT.NUMPROCTRAB ');
            _CdsObjeto.SQL.Add('                       FROM PROCESSOTRAB PT  ');
            _CdsObjeto.SQL.Add('                       WHERE (PT.FLGSITPROC = 0) OR ');
            _CdsObjeto.SQL.Add('                             (PT.FLGSITPROC = 1 AND PT.DATAEFETENC >= ' + QuotedStr(EdDataEnc1.text) + ') '); // Encerrado
            Case (rgParte.ItemIndex) Of
               0: _CdsObjeto.SQL.Add('                        AND (PT.FLGPARTEATIVA = 1) )');
               1: _CdsObjeto.SQL.Add('                        AND (PT.FLGPARTEATIVA = 0) )'); // Passiva
               2: _CdsObjeto.SQL.Add('                        AND (PT.FLGPARTEATIVA = 2) ) ');
               3: _CdsObjeto.SQL.Add('      ) ');
            End;
         End;

      _CdsObjeto.Open;
      If Not _CdsObjeto.IsEmpty Then
         Begin
            qtdProcCorrigidos := 0;

            lblProc.Caption := '';
            lblObj.Caption := '';
            lblProg.caption := ''; ;
            lblSubProg.caption := '';
            lblSit.Caption := '';

            // Pegando o parâmetro que indica se a correção vai ser feita pelo valor real ou por um percentual de probabilidade
            qryAux1.DataBaseName := 'BaseDados';
            qryAux1.Close;
            qryAux1.SQL.Clear;
            qryAux1.SQL.Add('SELECT FLGPERCPROB, DATACORROBJ, PLNCODIGOOBJ ');
            qryAux1.SQL.Add('FROM PARAMRH       ');
            qryAux1.Open;
            iTipoCorrecao := qryAux1.FieldByName('FLGPERCPROB').asInteger;
            qryAux1.Close;

            If (Desfazer) Then
               Begin
                  // Rotina para Desfazer a Correção (Volta dados para o Objeto e Deleta os Históricos com DataAval >= Data da Correção)
                  _CdsObjeto.First;
                  While Not _CdsObjeto.EOF Do
                     Begin
                        // Selecionar o Histórico do mês anterior.
                        // Ex.: Se estamos desfazendo em 30/04, então, ele tras os dados do histórico corrigido de 31/03.
                        _CdsUltimoHistoricoObjeto.Data := CtrlCorrigeObjEtapasProc.BuscaUltimoHistoricoObjeto(_CdsObjeto.FieldByName('NUMPROCTRAB').asString,
                           _CdsObjeto.FieldByName('CODTIPOOBJETO').asString, sDataAtualCorrecao);

                        If Not _CdsUltimoHistoricoObjeto.Eof Then
                           Begin

                              lblProc.Caption := _CdsObjeto.FieldByName('NUMPROCTRAB').asString;
                              lblObj.Caption := _CdsObjeto.FieldByName('CODTIPOOBJETO').asString;
                              lblSit.Caption := 'Desfazendo Atualização dos Objetos...';
                              Application.ProcessMessages;

                              // Atualiza o Objeto com os dados do Histórico anterior selecionado
                              qryAux2.DataBaseName := 'BaseDados';
                              qryAux2.Close;
                              qryAux2.SQL.Clear;
                              qryAux2.SQL.Add('UPDATE OBJPROCTRAB SET                       ');
                              qryAux2.SQL.Add('valorrecl =:p1, percprob =:p2, valorsentenca =:p3, observacao =:p4, indvalor =:p5, ');
                              qryAux2.SQL.Add('datainicio =:p6, datafinal =:p7, percorig =:p8, dataaval =:p9, flgcontabvlprinc =:p10,   ');
                              qryAux2.SQL.Add('flgcontabencerrado =:p11, qtdmesescalculo = qtdmesescalculo - 1, vlrjurosacumulado =:p12   ');
                              qryAux2.SQL.Add('WHERE (NUMPROCTRAB   = ' + _CdsObjeto.FieldByName('NUMPROCTRAB').asString + ') AND ');
                              qryAux2.SQL.Add('      (CODTIPOOBJETO = ' + _CdsObjeto.FieldByName('CODTIPOOBJETO').asString + ') ');
                              qryAux2.Parambyname('p1').asFloat := _CdsUltimoHistoricoObjeto.FieldByName('VALORRECL').asFloat;
                              qryAux2.Parambyname('p2').asFloat := _CdsUltimoHistoricoObjeto.FieldByName('PERCPROB').asFloat;
                              qryAux2.Parambyname('p3').asFloat := _CdsUltimoHistoricoObjeto.FieldByName('VALORSENTENCA').asFloat; //
                              qryAux2.Parambyname('p4').asString := _CdsUltimoHistoricoObjeto.FieldByName('OBSERVACAO').asString; //
                              qryAux2.Parambyname('p5').asString := _CdsUltimoHistoricoObjeto.FieldByName('INDVALOR').asString;
                              qryAux2.Parambyname('p6').asString := _CdsUltimoHistoricoObjeto.FieldByName('DATAINICIO').asString;
                              qryAux2.Parambyname('p7').asString := _CdsUltimoHistoricoObjeto.FieldByName('DATAFINAL').asString; //
                              qryAux2.Parambyname('p8').asFloat := _CdsUltimoHistoricoObjeto.FieldByName('PERCORIG').asFloat;
                              qryAux2.Parambyname('p9').asString := _CdsUltimoHistoricoObjeto.FieldByName('DATAAVAL').asString;
                              qryAux2.Parambyname('p10').asInteger := _CdsUltimoHistoricoObjeto.FieldByName('FLGCONTABVLPRINC').asInteger;
                              qryAux2.Parambyname('p11').asInteger := _CdsUltimoHistoricoObjeto.FieldByName('FLGCONTABENCERRADO').asInteger;
                              qryAux2.Parambyname('p12').asFloat := _CdsUltimoHistoricoObjeto.FieldByName('JUROS').asFloat;
                              If Not qryAux2.Prepared Then
                                 qryAux2.Prepare;
                              qryAux2.ExecSQL;
                           End;

                        // Exclui os Históricos, cuja Dataaval seja >= Data da Correção
                        // e o registro for do tipo = 'C', ou seja, lançado pela Correção
                        CtrlCorrigeObjEtapasProc.DeletaHistorico(_CdsObjeto.FieldByName('NUMPROCTRAB').asString,
                           _CdsObjeto.FieldByName('CODTIPOOBJETO').asString, sDataAtualCorrecao);

                        _CdsObjeto.Next;

                     End;
               End
            Else
               Begin
                  /////////////////////////////////////////////////////////////////////////
                  // MONTAGEM DE UM ARQUIVO DE MOVIMENTO ANALÍTICO DOS OBJETOS ATUALIZADOS
                  /////////////////////////////////////////////////////////////////////////
                  sLinhaMov :=
                     'DataCorrecao' + ';' +
                     'DataUltimaCorrecao' + ';' +
                     'Processo' + ';' +
                     'Objeto' + ';' +
                     'ValorReclamado' + ';' +
                     'PercProb' + ';' +
                     'PercOrigAnt' + ';' +
                     'dValorAtualizadoAnteriorProporcional' + ';' +
                     'ValorReclamadoProporcional' + ';' +
                     'dUltimaCorrecaoAcumuladaProporcional' + ';' +
                     'dUltimoJurosAcumuladoProporcional' + ';' +
                     'Índice CM' + ';' +
                     'QtdMeses' + ';' +
                     'ValorCorrecaoMonetCalculada' + ';' +
                     'ValorJurosCalculado' + ';' +
                     'ValorAtualizado' + ';' +
                     'PercOrigAtual' + ';' +
                     'Programa' + ';' +
                     'SubPrograma' + ';' +
                     'SituacaoProc' + ';' +
                     'ContabPrincipal' + ';' +
                     'DataEncerramento' + ';' +
                     'CodMoeda' + ';' +
                     'CodObjeto' + ';' +
                     'Programa' + ';' +
                     'SubPrograma';

                  sMovimentoAnalitico.Add(sLinhaMov);
                  /////////////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////////////

                  // JUR_PROGRAMAXSUBPROGRAMA - Tabela que relaciona todos os Programas com os Sub-Programas
                  // Select feito para facilitar a filtragem por Programa e Sub-Programa no DataSet (_CdsObjeto)
                  qryPrograma.DataBaseName := 'BaseDados';
                  qryPrograma.Close;
                  qryPrograma.SQL.Clear;
                  qryPrograma.SQL.Add('SELECT P.IDTIPOPROC, P.NOMETIPOPROC, T.TIPCODIGO, T.TIPDESCRICAO, J.IDSEGREGACRITER  ');
                  qryPrograma.SQL.Add('FROM JUR_PROGRAMAXSUBPROGRAMA J, TIPOPROCESSO P, TIPOPER T    ');
                  qryPrograma.SQL.Add('WHERE J.IDTIPOPROC = P.IDTIPOPROC AND                         ');
                  qryPrograma.SQL.Add('T.TIPCODIGO = J.TIPCODIGO                                     ');
                  qryPrograma.SQL.Add('ORDER BY P.IDTIPOPROC, T.TIPCODIGO                            ');
                  qryPrograma.Open;
                  While Not qryPrograma.EOF Do
                     Begin
                        // Filtrando os Objetos do dataset principal (_CdsObjeto) pelo Programa e Sub-Programa
                        _CdsObjeto.Filtered := False;
                        _CdsObjeto.Filter := 'IDTIPOPROC = ' + QuotedStr(qryPrograma.FieldByName('IDTIPOPROC').asString) + ' AND ' +
                           'TIPCODIGO = ' + QuotedStr(qryPrograma.FieldByName('TIPCODIGO').asString);
                        _CdsObjeto.filtered := True;

                        lblProg.caption := qryPrograma.FieldByName('NOMETIPOPROC').asString;
                        lblSubProg.caption := qryPrograma.FieldByName('TIPDESCRICAO').asString;
                        lblSit.Caption := 'Atualizando Objetos...';
                        Application.ProcessMessages;

                        dValorPrincipalAcumContab := 0.00;
                        dValorJurosAcumContab := 0.00;
                        dValorCorrecaoMonetariaAcumContab := 0.00;
                        dValorPrincipalAcumEncerramentoContab := 0.00;

                        dValorCorrecaoMonetariaObj := 0.00;
                        dValorJurosObj := 0.00;
                        dValorAtualCorrigido := 0.00;

                        dValorReclamadoProporcional := 0.00;
                        dUltimaCorrecaoAcumuladaProporcional := 0.00;

                        dValorAtualNovo := 0.00;
                        dValorTemp := 0.00;
                        dJurosAcumuladoAtual := 0.00;

                        dPercOrigAtual := 0;

                        If Not _CdsObjeto.EOF Then
                           Begin
                              // Verifica se tem cotacao através do Índice de correção do Processo
                              If Not CtrlCorrigeObjEtapasProc.AchouCotacao(_CdsObjeto.FieldByName('MOEDAPROCTRAB').asInteger, sDataAtualCorrecao) Then
                                 Begin
                                    Application.MessageBox('Não foi possível localizar o Índice de Correção' + #13 +
                                       'para o mês da data informada.', 'Atenção !', MB_DEFBUTTON1 + MB_ICONEXCLAMATION);
                                    dtmBaseDados.dbBaseDados.Rollback;
                                    Result := false;
                                    Exit;
                                 End;

                              // Faz o loop dos objetos filtrados com mesmo Programa e Sub-Programa para acumular os valores
                              _CdsObjeto.First;
                              sListaProcPSp := '';
                              sProcAtu := _CdsObjeto.FieldByName('NUMPROCTRAB').asString;
                              sProcAnt := '999999999999999';
                              bPrimProc := True;
                              While Not _CdsObjeto.EOF Do
                                 Begin
                                    lblProc.Caption := _CdsObjeto.FieldByName('NUMPROCTRAB').asString;
                                    lblObj.Caption := _CdsObjeto.FieldByName('CODTIPOOBJETO').asString;
                                    Application.ProcessMessages;

                                    iQtd_Meses := 0;
                                    dUltimoJurosAcumuladoProporcional := 0.00;
                                    // O IF abaixo foi usado para gerar uma lista de processos que foram filtrados por programa e sub-programa.
                                    // Esta lista será usada na função ContabilizaUsandoCriteriosDeRateios, apenas quando forem:
                                    // PROGRAMA INVESTIMENTO - Empréstimo ou PROGRAMA ADMINISTRATIVO ou PROGRAMA PREVIDENCIAL
                                    If sProcAtu <> sProcAnt Then
                                       Begin
                                          If bPrimProc Then
                                             Begin
                                                sListaProcPSp := sProcAtu;
                                                bPrimProc := False;
                                             End
                                          Else
                                             sListaProcPSp := sListaProcPSp + ',' + sProcAtu;
                                       End;

                                    // Data da Última Correção do Objeto
                                    sDataUltimaCorrecao := _CdsObjeto.FieldByName('DATA_ULTIMA_CORRECAO').asString;

                                    // Último Valor Atualizado (A)
                                    dValorAtualizadoAnteriorProporcional := RoundCM(((_CdsObjeto.FieldByName('PERCPROB').asFloat * _CdsObjeto.FieldByName('VALORRECL').asFloat) / 100) *
                                       (CtrlFuncoesRH.IFF(iTipoCorrecao = 0, 1, _CdsObjeto.FieldByName('PERCORIG').asFloat / 100)), 2);

                                    // Valor Reclamado do Processo (B)
                                    dValorReclamadoProporcional := RoundCM((_CdsObjeto.FieldByName('PERCPROB').asFloat * _CdsObjeto.FieldByName('VALORRECL').asFloat) / 100, 2);

                                    // Último JUROS acumulado (D)
                                    // Selecionar o Histórico mais recente (pegando o MAX do IDHSTOBJPROCTRAB)
                                    _CdsUltimoHistoricoObjeto.Data := CtrlCorrigeObjEtapasProc.BuscaUltimoHistoricoObjeto(_CdsObjeto.FieldByName('NUMPROCTRAB').asString,
                                       _CdsObjeto.FieldByName('CODTIPOOBJETO').asString, sDataAtualCorrecao);
                                    If Not _CdsUltimoHistoricoObjeto.IsEmpty Then
                                       dUltimoJurosAcumuladoProporcional := roundCM((_CdsUltimoHistoricoObjeto.FieldByName('JUROS').asFloat * _CdsObjeto.FieldByName('PERCPROB').asFloat / 100), 2);

                                    // Última CORREÇÃO Acumulada (C) = A - B - D
                                    dUltimaCorrecaoAcumuladaProporcional := dValorAtualizadoAnteriorProporcional - dValorReclamadoProporcional - dUltimoJurosAcumuladoProporcional;

                                    //------------------------------------------------
                                    // Serão corrigidos os Processos em Aberto OU
                                    // que foram encerrados com data de encerramento acima do periodo de correção
                                    // (isso somente quando do desfazer e refazer meses anteriores).
                                    // Regra indicada pela contabilidade
                                    //------------------------------------------------
                                    If (_CdsObjeto.FieldByName('FLGSITPROC').asInteger = 0) Or
                                       ((_CdsObjeto.FieldByName('DATAEFETENC').asDateTime > strTodate(sDataAtualCorrecao)) And
                                       (_CdsObjeto.FieldByName('FLGSITPROC').asInteger = 1)) Then
                                       Begin
                                          // 1º passo: Atualizando o Valor Atual com a CORREÇÃO MONETÁRIA (G) = (B + C) * ÍNDICE
                                          dValorAtualCorrigido := roundCM(CtrlCorrigeObjEtapasProc.AplicaCorrecaoMonetaria(
                                             dValorReclamadoProporcional + dUltimaCorrecaoAcumuladaProporcional, // (B + C)
                                             StrToDate(sDataAtualCorrecao),
                                             _CdsObjeto.FieldByName('MOEDAPROCTRAB').asInteger), 2);
                                          //  ********  Guardando somente a Correção Monetária do Objeto = (G) - (B + C)
                                          dValorCorrecaoMonetariaObj := (dValorAtualCorrigido - (dValorReclamadoProporcional + dUltimaCorrecaoAcumuladaProporcional));

                                          // 2º passo: Achando o Juros (H) = ((B + C + G) * (F / 100)) - D
                                          // Achando a quantidade de meses entre a data do juros até a data da correção
                                          qryAux1.DataBaseName := 'BaseDados';
                                          qryAux1.Close;
                                          qryAux1.SQL.Clear;
                                          qryAux1.SQL.Add('SELECT ROUND(MONTHS_BETWEEN(:p1, LAST_DAY(:p2)), 2) AS QTD_MESES ');
                                          qryAux1.SQL.Add('FROM DUAL       ');
                                          qryAux1.Parambyname('p1').asDateTime := StrToDate(sDataAtualCorrecao);
                                          qryAux1.Parambyname('p2').asDateTime := _CdsObjeto.FieldByName('DATAJUROS').asDateTime;
                                          qryAux1.Open;
                                          If Not qryAux1.IsEmpty Then
                                             Begin
                                                If qryAux1.FieldByName('QTD_MESES').asInteger > 0 Then
                                                   iQtd_Meses := qryAux1.FieldByName('QTD_MESES').asInteger // (F)
                                                Else
                                                   iQtd_Meses := 1; // (F) - Evitar ficar com ZERO
                                             End;

                                          dValorTemp := dValorReclamadoProporcional + dUltimaCorrecaoAcumuladaProporcional + dValorCorrecaoMonetariaObj; // (B + C + G)
                                          dValorJurosObj := RoundCM((dValorTemp * (qryAux1.FieldByName('QTD_MESES').asInteger / 100)), 2) - dUltimoJurosAcumuladoProporcional; // ((B + C + G) * F) - D
                                          qryAux1.Close;

                                          // 3º passo: Achando o Valor Atual atualizado (I) = (A + G + H)
                                          dValorAtualNovo := dValorAtualizadoAnteriorProporcional + dValorCorrecaoMonetariaObj + dValorJurosObj;

                                          // Achando o novo % de origem  (I / B) * 100
                                          If (dValorAtualNovo > 0) And (dValorReclamadoProporcional > 0) Then
                                             dPercOrigAtual := roundCM((dValorAtualNovo / dValorReclamadoProporcional) * 100, 4)
                                          Else // se não houver valores > 0, então percorig = percorig anterior
                                             dPercOrigAtual := _CdsObjeto.FieldByName('PERCORIG').asFloat;

                                          // Somente acumula para a Contabilização, se a probabilidade de sucesso do Processo for >= 11.0000 %
                                          // Regra definida pela da Contabilidade de não contabilizar processos com probabilidade REMOTA (10%) de sucesso
                                          If (_CdsObjeto.FieldByName('PERCPROB').AsFloat >= 11.0000) Then
                                             Begin
                                                // Verificando se o Valor Principal do Objeto já foi Contabilizado, ou seja,
                                                // se é a primeira vez de um processo novo
                                                // (0 - acumula primeira vez / 1 - não acumula mais)
                                                If (_CdsObjeto.FieldByName('FLGCONTABVLPRINC').isNull) Or
                                                   (_CdsObjeto.FieldByName('FLGCONTABVLPRINC').AsInteger = 0) Then
                                                   // ******** ACUMULANDO o Valor Principal
                                                   dValorPrincipalAcumContab := dValorPrincipalAcumContab + dValorAtualizadoAnteriorProporcional;
                                                //  ********  ACUMULANDO a Correção Monetária
                                                dValorCorrecaoMonetariaAcumContab := dValorCorrecaoMonetariaAcumContab + dValorCorrecaoMonetariaObj;
                                                //  ********  ACUMULANDO o Juros
                                                dValorJurosAcumContab := dValorJurosAcumContab + dValorJurosObj;
                                             End;

                                          // Achando o juros acumulado atual cheio, sem a probabilidade (proporcionalidade)
                                          dJurosAcumuladoAtual := roundCM(((dUltimoJurosAcumuladoProporcional / _CdsObjeto.FieldByName('PERCPROB').asFloat) * 100) +
                                             ((dValorJurosObj / _CdsObjeto.FieldByName('PERCPROB').asFloat) * 100), 2);

                                          // Atualiza o Objeto
                                          qryAux1.DataBaseName := 'BaseDados';
                                          qryAux1.Close;
                                          qryAux1.SQL.Clear;
                                          qryAux1.SQL.Add('UPDATE OBJPROCTRAB    	            ');
                                          qryAux1.SQL.Add('SET PERCORIG =:p1, DATAAVAL =:p2, QTDMESESCALCULO =:p3, VLRJUROSACUMULADO =:p4   ');
                                          If ((_CdsObjeto.FieldByName('FLGCONTABVLPRINC').isNull) Or
                                             (_CdsObjeto.FieldByName('FLGCONTABVLPRINC').AsInteger = 0)) And
                                             (_CdsObjeto.FieldByName('PERCPROB').AsFloat >= 11.0000) Then
                                             qryAux1.SQL.Add(', FLGCONTABVLPRINC =:p5  ');
                                          qryAux1.SQL.Add('WHERE NUMPROCTRAB =:p6 AND CODTIPOOBJETO =:p7 ');
                                          qryAux1.Parambyname('p1').asFloat := dPercOrigAtual;
                                          qryAux1.Parambyname('p2').asString := sDataAtualCorrecao;
                                          qryAux1.Parambyname('p3').asInteger := iQtd_Meses;
                                          qryAux1.Parambyname('p4').asFloat := dJurosAcumuladoAtual;
                                          If ((_CdsObjeto.FieldByName('FLGCONTABVLPRINC').isNull) Or
                                             (_CdsObjeto.FieldByName('FLGCONTABVLPRINC').AsInteger = 0)) And
                                             (_CdsObjeto.FieldByName('PERCPROB').AsFloat >= 11.0000) Then
                                             qryAux1.Parambyname('p5').asString := '1'; // (1 - não é mais a primeira vez, não acumulará mais o valor principal)
                                          qryAux1.Parambyname('p6').asString := _CdsObjeto.FieldByName('NUMPROCTRAB').asString;
                                          qryAux1.Parambyname('p7').asString := _CdsObjeto.FieldByName('CODTIPOOBJETO').asString;
                                          If Not qryAux1.Prepared Then
                                             qryAux1.Prepare;
                                          qryAux1.ExecSQL;
                                          qryAux1.Close;

                                          // Inserir os dados do Objeto no histórico
                                          qryAux2.DataBaseName := 'BaseDados';
                                          qryAux2.Close;
                                          qryAux2.SQL.Clear;
                                          qryAux2.SQL.Add('INSERT INTO HSTOBJPROCTRAB (                       ');
                                          qryAux2.SQL.Add('idhstobjproctrab, numproctrab, codtipoobjeto,      ');
                                          qryAux2.SQL.Add('valorrecl, percprob, valorsentenca, indvalor, ');
                                          qryAux2.SQL.Add('datainicio, datafinal, percorig, dataaval, juros, correcao, ');
                                          qryAux2.SQL.Add('idTipoProc, tipcodigo, flgcontabvlprinc, flgTipoLancto, flgcontabencerrado) ');
                                          qryAux2.Sql.Add('VALUES (SEQHSTOBJPROCTRAB.NEXTVAL, :p2, :p3, :p4, :p5, :p6, ');
                                          qryAux2.Sql.Add(' :p8, :p9, :p10, :p11, :p12, :p13, :p14, :p15, :p16, :p17, :p18, :p19 ) ');
                                          qryAux2.Parambyname('p2').asFloat := _CdsObjeto.FieldByName('NUMPROCTRAB').asFloat;
                                          qryAux2.Parambyname('p3').asFloat := _CdsObjeto.FieldByName('CODTIPOOBJETO').asFloat;
                                          qryAux2.Parambyname('p4').asFloat := _CdsObjeto.FieldByName('VALORRECL').asFloat;
                                          qryAux2.Parambyname('p5').asFloat := _CdsObjeto.FieldByName('PERCPROB').asFloat;
                                          qryAux2.Parambyname('p6').asFloat := _CdsObjeto.FieldByName('VALORSENTENCA').asFloat;
                                          qryAux2.Parambyname('p8').asString := _CdsObjeto.FieldByName('INDVALOR').asString;
                                          qryAux2.Parambyname('p9').asString := sDataUltimaCorrecao; // Dt. Inicio
                                          qryAux2.Parambyname('p10').asString := _CdsObjeto.FieldByName('DATAFINAL').asString;
                                          qryAux2.Parambyname('p11').asFloat := dPercOrigAtual;
                                          qryAux2.Parambyname('p12').asString := sDataAtualCorrecao; // Data Aval
                                          qryAux2.Parambyname('p13').asFloat := dJurosAcumuladoAtual; // Juros acumulado
                                          qryAux2.Parambyname('p14').asFloat := dValorCorrecaoMonetariaObj; // Correção do mês
                                          qryAux2.Parambyname('p15').asInteger := _CdsObjeto.FieldByName('IDTIPOPROC').asInteger;
                                          qryAux2.Parambyname('p16').asString := _CdsObjeto.FieldByName('TIPCODIGO').asString;
                                          qryAux2.Parambyname('p17').asInteger := _CdsObjeto.FieldByName('FLGCONTABVLPRINC').asInteger;
                                          qryAux2.Parambyname('p18').asString := 'C'; // Lançado pela Correção
                                          qryAux2.Parambyname('p19').asInteger := _CdsObjeto.FieldByName('FLGCONTABENCERRADO').asInteger;
                                          If Not qryAux2.Prepared Then
                                             qryAux2.Prepare;
                                          qryAux2.ExecSQL;
                                          qryAux2.Close;
                                          inc(qtdProcCorrigidos);
                                       End
                                    Else
                                       Begin
                                          //--------------------------------------------------------------------------
                                          // Processos Encerrados com data de encerramento <= ao periodo de correção
                                          // Neste caso, o valor para contabilização será o do último mês da correção
                                          // ,ou seja, o valor que já está gravado.
                                          //--------------------------------------------------------------------------
                                          If _CdsObjeto.FieldByName('FLGCONTABENCERRADO').asInteger = 0 Then // Ainda não contabilizado
                                             Begin
                                                // Somente acumula para a Contabilização, se a probabilidade de sucesso do Processo for >= 11.0000 %
                                                // Regra definida pela da Contabilidade de não contabilizar processos com probabilidade REMOTA (10%) de sucesso
                                                If (_CdsObjeto.FieldByName('PERCPROB').AsFloat >= 11.0000) Then
                                                   Begin
                                                      // ******** ACUMULANDO o Valor Principal do Encerrado, baseado no último
                                                      // valor corrigido do mês anterior
                                                      dValorPrincipalAcumEncerramentoContab := dValorPrincipalAcumEncerramentoContab + dValorAtualizadoAnteriorProporcional;
                                                   End;

                                                // Atualizar o Objeto
                                                qryAux1.DataBaseName := 'BaseDados';
                                                qryAux1.Close;
                                                qryAux1.SQL.Clear;
                                                qryAux1.SQL.Add('UPDATE OBJPROCTRAB    	         ');
                                                qryAux1.SQL.Add('SET FLGCONTABENCERRADO =:p1     ');
                                                qryAux1.SQL.Add('WHERE NUMPROCTRAB =:p2 AND CODTIPOOBJETO =:p3 ');
                                                qryAux1.Parambyname('p1').asString := '1'; // Contabilizou o Encerrado
                                                qryAux1.Parambyname('p2').asString := _CdsObjeto.FieldByName('NUMPROCTRAB').asString;
                                                qryAux1.Parambyname('p3').asString := _CdsObjeto.FieldByName('CODTIPOOBJETO').asString;
                                                If Not qryAux1.Prepared Then
                                                   qryAux1.Prepare;
                                                qryAux1.ExecSQL;
                                                qryAux1.Close;

                                                // Inserir os Dados do Objeto no Histórico
                                                qryAux2.DataBaseName := 'BaseDados';
                                                qryAux2.Close;
                                                qryAux2.SQL.Clear;
                                                qryAux2.SQL.Add('INSERT INTO HSTOBJPROCTRAB (                       ');
                                                qryAux2.SQL.Add('idhstobjproctrab, numproctrab, codtipoobjeto,      ');
                                                qryAux2.SQL.Add('valorrecl, percprob, valorsentenca, indvalor, ');
                                                qryAux2.SQL.Add('datainicio, datafinal, percorig, dataaval, juros, correcao, ');
                                                qryAux2.SQL.Add('idTipoProc, tipcodigo, flgcontabvlprinc, flgTipoLancto, flgContabEncerrado) ');
                                                qryAux2.Sql.Add('VALUES (SEQHSTOBJPROCTRAB.NEXTVAL, :p2, :p3, :p4, :p5, :p6, ');
                                                qryAux2.Sql.Add(' :p8, :p9, :p10, :p11, :p12, :p13, :p14, :p15, :p16, :p17, :p18, :p19 ) ');
                                                qryAux2.Parambyname('p2').asFloat := _CdsObjeto.FieldByName('NUMPROCTRAB').asFloat;
                                                qryAux2.Parambyname('p3').asFloat := _CdsObjeto.FieldByName('CODTIPOOBJETO').asFloat;
                                                qryAux2.Parambyname('p4').asFloat := _CdsObjeto.FieldByName('VALORRECL').asFloat;
                                                qryAux2.Parambyname('p5').asFloat := _CdsObjeto.FieldByName('PERCPROB').asFloat;
                                                qryAux2.Parambyname('p6').asFloat := _CdsObjeto.FieldByName('VALORSENTENCA').asFloat;
                                                qryAux2.Parambyname('p8').asString := _CdsObjeto.FieldByName('INDVALOR').asString;
                                                qryAux2.Parambyname('p9').asString := _CdsObjeto.FieldByName('DATAINICIO').asString;
                                                qryAux2.Parambyname('p10').asString := _CdsObjeto.FieldByName('DATAFINAL').asString;
                                                qryAux2.Parambyname('p11').asFloat := _CdsObjeto.FieldByName('PERCORIG').asFloat;
                                                qryAux2.Parambyname('p12').asString := _CdsObjeto.FieldByName('DATAAVAL').asString;
                                                qryAux2.Parambyname('p13').asFloat := _CdsUltimoHistoricoObjeto.FieldByName('JUROS').asFloat;
                                                qryAux2.Parambyname('p14').asFloat := dUltimaCorrecaoAcumuladaProporcional;
                                                qryAux2.Parambyname('p15').asInteger := _CdsObjeto.FieldByName('IDTIPOPROC').asInteger;
                                                qryAux2.Parambyname('p16').asString := _CdsObjeto.FieldByName('TIPCODIGO').asString;
                                                qryAux2.Parambyname('p17').asInteger := _CdsObjeto.FieldByName('FLGCONTABVLPRINC').asInteger;
                                                qryAux2.Parambyname('p18').asString := 'C'; // Lançado pela Correção
                                                If (_CdsObjeto.FieldByName('PERCPROB').AsFloat >= 11.0000) Then
                                                   qryAux2.Parambyname('p19').asInteger := 1 // Contabilizou o Encerrado
                                                Else
                                                   qryAux2.Parambyname('p19').asInteger := 0;
                                                If Not qryAux2.Prepared Then
                                                   qryAux2.Prepare;
                                                qryAux2.execSQL;
                                                qryAux2.Close;
                                                inc(qtdProcCorrigidos);
                                             End;
                                       End;

                                    /////////////////////////////////////////////////////////////////////////
                                    // MONTAGEM DE UM ARQUIVO DE MOVIMENTO ANALÍTICO DOS OBJETOS ATUALIZADOS
                                    /////////////////////////////////////////////////////////////////////////
                                    If (dValorCorrecaoMonetariaObj > 0) And ((dValorReclamadoProporcional + dUltimaCorrecaoAcumuladaProporcional) > 0) Then
                                       sIndiceCM := floattostrf((dValorCorrecaoMonetariaObj / (dValorReclamadoProporcional + dUltimaCorrecaoAcumuladaProporcional)) * 100, ffnumber, 12, 4)
                                    Else
                                       sIndiceCM := '0.0000';

                                    sLinhaMov :=
                                       sDataAtualCorrecao + ';' +
                                       sDataUltimaCorrecao + ';' +
                                       _CdsObjeto.FieldByName('NUMPROCTRAB').asString + ';' +
                                       _CdsObjeto.FieldByName('DESCRICAO').asString + ';' +
                                       floattostrf(_CdsObjeto.FieldByName('VALORRECL').asFloat, ffnumber, 12, 2) + ';' +
                                       _CdsObjeto.FieldByName('PERCPROB').asString + ';' +
                                       floattostrf(_CdsObjeto.FieldByName('PERCORIG').asFloat, ffnumber, 12, 2) + ';' +
                                       floattostrf(dValorAtualizadoAnteriorProporcional, ffnumber, 12, 2) + ';' + // A
                                    floattostrf(dValorReclamadoProporcional, ffnumber, 12, 2) + ';' + // B
                                    floattostrf(dUltimaCorrecaoAcumuladaProporcional, ffnumber, 12, 2) + ';' + // C
                                    floattostrf(dUltimoJurosAcumuladoProporcional, ffnumber, 12, 2) + ';' + // D
                                    sIndiceCM + ';' + // Indice (E)
                                    inttostr(iQtd_Meses) + ';' +
                                       floattostrf(dValorCorrecaoMonetariaObj, ffnumber, 12, 2) + ';' + // (G) = (B + C) * Índice
                                    floattostrf(dValorJurosObj, ffnumber, 12, 2) + ';' + // (H) = ((B + C + G) * (F / 100)) - D
                                    floattostrf(dValorAtualNovo, ffnumber, 12, 2) + ';' + // (I) = (A + G + H)
                                    floattostrf(dPercOrigAtual, ffnumber, 12, 2) + ';' + // (I / B) * 100
                                    qryPrograma.FieldByName('NOMETIPOPROC').asString + ';' +
                                       qryPrograma.FieldByName('TIPDESCRICAO').asString + ';' +
                                       ctrlfuncoesrh.IFF(_CdsObjeto.FieldByName('FLGSITPROC').asInteger = 0, 'Aberto', 'Encerrado') + ';' +
                                       _CdsObjeto.FieldByName('FLGCONTABVLPRINC').asString + ';' +
                                       _CdsObjeto.FieldByName('DATAEFETENC').asString + ';' +
                                       _CdsObjeto.FieldByName('MOEDAPROCTRAB').asString + ';' +
                                       _CdsObjeto.FieldByName('CODTIPOOBJETO').asString + ';' +
                                       _CdsObjeto.FieldByName('IDTIPOPROC').asString + ';' +
                                       _CdsObjeto.FieldByName('TIPCODIGO').asString;

                                    sMovimentoAnalitico.Add(sLinhaMov);

                                    ///////////////////////////////////////////////////////////////////////
                                    ///////////////////////////////////////////////////////////////////////

                                    sProcAnt := sProcAtu;

                                    _CdsObjeto.Next;

                                    sProcAtu := _CdsObjeto.FieldByName('NUMPROCTRAB').asString;
                                 End;

                              If (FazContab) Then
                                 Begin
                                    ///////////////////////////////////////////////////////////////////
                                    //
                                    // CONTABILIZAR dValorPrincipalAcumContab,
                                    //              dValorCorrecaoMonetariaAcumContab,
                                    //              dValorJurosAcumContab e
                                    //              dValorPrincipalAcumEncerramentoContab
                                    //              por Programa e Sub-Programa contidos nos Objetos
                                    //
                                    ///////////////////////////////////////////////////////////////////
                                    _CdsObjeto.First;

                                    //-------------------------
                                    // Processos em Aberto
                                    //-------------------------
                                    If (dValorPrincipalAcumContab > 0) Or (dValorCorrecaoMonetariaAcumContab > 0) Or (dValorJurosAcumContab > 0) Then
                                       Begin
                                          IdSegregaCriterio := qryPrograma.fieldbyname('IDSEGREGACRITER').asInteger;
                                          // LOOP para cada Aplicação do Objeto (campo "Aplica-se A" da tela de Parametrização)
                                          // valores: 0 -> Principal; 1 -> Correção Monetária; 2 -> Juros
                                          For Aplica_se_A := 0 To 2 Do
                                             Begin
                                                dValorLancamento := ctrlfuncoesrh.IFF(Aplica_se_A = 0, dValorPrincipalAcumContab, ctrlfuncoesrh.IFF(Aplica_se_A = 1, dValorCorrecaoMonetariaAcumContab, dValorJurosAcumContab));

                                                If (dValorLancamento <> 0) Then
                                                   Begin
                                                      lblSit.Caption := 'Contabilizando Prog./SubProg....';
                                                      Application.ProcessMessages;

                                                      // Função que contabiliza através dos % de rateio dos Planos e Patro
                                                      If Not CtrlCorrigeObjEtapasProc.ContabilizaUsandoCriteriosDeRateios(
                                                         ednNum1.Text,
                                                         ednNum2.Text,
                                                         EdDataEnc1.Text,
                                                         rgParte.ItemIndex,
                                                         sListaProcPSp,
                                                         'P', // (P)rovisionar
                                                         Aplica_se_A, // 0 -> Principal; 1 -> Correção Monetária; 2 -> Juros
                                                         idSegregaCriterio, // Id da tabela de rateio da Contabilidade
                                                         '',
                                                         _CdsObjeto.FieldByName('IDTIPOPROC').asInteger, // Programa
                                                         _CdsObjeto.FieldByName('TIPCODIGO').asString, // Sub-Programa
                                                         '2', // Tipo do Lançamento (0 - Débito; 1 - Crédito; 2 - Partida Dobrada)
                                                         IdEmpresa, // Empresa
                                                         IdModulo, // Módulo de Origem
                                                         IdUsuario, // Usuário Ativo
                                                         0, // Plano de Contas - a função vai fornecer este campo
                                                         -1, // Unidade de Negócio
                                                         _CdsObjeto.FieldByName('CODSUBCONTA').asFloat, // Sub-Conta de Débito
                                                         _CdsObjeto.FieldByName('CODSUBCONTA').asFloat, // Sub-Conta de Crédito
                                                         _CdsObjeto.FieldByName('IDPLANOPREV').asInteger, // Plano
                                                         _CdsObjeto.FieldByName('IDPATRO').asInteger, // Patro
                                                         0, // Número da Planilha - a função vai fornecer este campo
                                                         0, // Número do Lançamento
                                                         sDataAtualCorrecao, // Data da Correção
                                                         Copy(sDataAtualCorrecao, 7, 4) + Copy(sDataAtualCorrecao, 3, 3), // Número do Documento
                                                         // Histórico concatenado
                                                         Copy('Programa: ' + qryPrograma.FieldByName('NOMETIPOPROC').asString, 1, 40), // 1ª Linha
                                                         Copy('SubPrograma: ' + qryPrograma.fieldbyname('TIPDESCRICAO').asString, 1, 40), // 2ª Linha
                                                         Copy(ctrlfuncoesrh.IFF(Aplica_se_A = 0, 'Entrada de Processo', 'Atualização de Processo'), 1, 40), // 3ª Linha
                                                         Copy(ctrlfuncoesrh.IFF(Aplica_se_A = 0, 'Valor Principal', ctrlfuncoesrh.IFF(Aplica_se_A = 1, 'Correção Monetária', 'Juros')), 1, 40), // 4ª Linha
                                                         '', // 5ª Linha da Histórico - a função vai fornecer este campo
                                                         //
                                                         '', // Centro de Custo para Débito
                                                         '', // Conta para Débito - a função vai fornecer este campo
                                                         '', // Centro de Custo para Crédito
                                                         '', // Conta para Crédito - a função vai fornecer este campo
                                                         '', // Código do Histórico Padrão
                                                         dValorLancamento, // Valor do Lançamento
                                                         True, // Indica se os Lançamentos devem ser unidos em uma mesma Planilha
                                                         True, // Indica se usa Plano da Patrocinadora
                                                         dPlnCodigo
                                                         ) Then
                                                         Begin
                                                            dtmBaseDados.dbBaseDados.Rollback;
                                                            Result := false;
                                                            Exit;
                                                         End;
                                                   End;
                                             End;
                                       End;

                                    //----------------------
                                    // Processos Encerrados
                                    //----------------------
                                    If dValorPrincipalAcumEncerramentoContab > 0 Then
                                       Begin
                                          IdSegregaCriterio := qryPrograma.fieldbyname('IDSEGREGACRITER').asInteger;
                                          // Função que contabiliza através dos % de rateio dos Planos e Patro
                                          If Not CtrlCorrigeObjEtapasProc.ContabilizaUsandoCriteriosDeRateios(
                                             ednNum1.Text,
                                             ednNum2.Text,
                                             EdDataEnc1.text,
                                             rgParte.ItemIndex,
                                             sListaProcPSp,
                                             'E', // (E)stornar
                                             0, // 0 -> Principal
                                             idSegregaCriterio, // Id da tabela de rateio da Contabilidade
                                             '',
                                             _CdsObjeto.FieldByName('IDTIPOPROC').asInteger, // Programa
                                             _CdsObjeto.FieldByName('TIPCODIGO').asString, // Sub-Programa
                                             '2', // Tipo do Lançamento (0 - Débito; 1 - Crédito; 2 - Partida Dobrada)
                                             IdEmpresa, // Empresa
                                             IdModulo, // Módulo de Origem
                                             IdUsuario, // Usuário Ativo
                                             0, // Plano de Contas - a função vai fornecer este campo
                                             -1, // Unidade de Negócio
                                             _CdsObjeto.FieldByName('CODSUBCONTA').asFloat, // Sub-Conta de Débito
                                             _CdsObjeto.FieldByName('CODSUBCONTA').asFloat, // Sub-Conta de Crédito
                                             _CdsObjeto.FieldByName('IDPLANOPREV').asInteger, // Plano
                                             _CdsObjeto.FieldByName('IDPATRO').asInteger, // Patro
                                             0, // Número da Planilha - a função vai fornecer este campo
                                             0, // Número do Lançamento
                                             sDataAtualCorrecao, // Data da Correção
                                             Copy(sDataAtualCorrecao, 7, 4) + Copy(sDataAtualCorrecao, 3, 3), // Número do Documento
                                             // Histórico concatenado
                                             Copy('Programa: ' + qryPrograma.FieldByName('NOMETIPOPROC').asString, 1, 40), // 1ª Linha
                                             Copy('SubPrograma: ' + qryPrograma.fieldbyname('TIPDESCRICAO').asString, 1, 40), // 2ª Linha
                                             'Encerramento de Processo', // 3ª Linha
                                             'Valor Principal', // 4ª Linha
                                             '', // 5ª Linha da Histórico - a função vai fornecer este campo
                                             //
                                             '', // Centro de Custo para Débito
                                             '', // Conta para Débito - a função vai fornecer este campo
                                             '', // Centro de Custo para Crédito
                                             '', // Conta para Crédito - a função vai fornecer este campo
                                             '', // Código do Histórico Padrão
                                             dValorPrincipalAcumEncerramentoContab, // Valor do Lançamento
                                             True, // Indica se os Lançamentos devem ser unidos em uma mesma Planilha
                                             True, // Indica se usa Plano da Patrocinadora
                                             dPlnCodigo
                                             ) Then
                                             Begin
                                                dtmBaseDados.dbBaseDados.Rollback;
                                                Result := false;
                                                Exit;
                                             End;
                                       End;
                                 End;
                           End;

                        qryPrograma.Next;

                     End;

                  //////////////////////////////////////////////////////////////////////
                  // GRAVAÇÃO DO ARQUIVOS DE MOVIMENTO ANALÍTICO DOS OBJETOS ATUALIZADOS
                  //////////////////////////////////////////////////////////////////////
                  sMovimentoAnalitico.savetofile(Sistema.RetornaCaminhoArquivos(Sistema.idEmpresa) + '\' + FormatDateTime('ddmmyyyy', (strtodate(sDataAtualCorrecao))) + '_MovimentoContabAnalitico.csv');
                  //////////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////////

               End;

            If Not Desfazer Then
               Begin
                  lblProc.Caption := '';
                  lblObj.Caption := '';
                  lblProg.caption := ''; ;
                  lblSubProg.caption := '';
                  lblSit.Caption := 'Objetos Atualizados !';
                  Application.ProcessMessages;
                  FPlnCodigo := 0;
                  If (dPlnCodigo > 0) Then // Houve a Contabilização
                     Begin
                        FPlnCodigo := CtrlListTerceirosRH.GetNumeroPlanilha(dPlnCodigo);

                        // Atualizar a tabela de parâmetro (PARAMRH) com a data da correção e o plncodigo
                        qryAux2.DataBaseName := 'BaseDados';
                        qryAux2.Close;
                        qryAux2.SQL.Clear;
                        qryAux2.SQL.Add('UPDATE PARAMRH SET                   ');
                        qryAux2.SQL.Add('DATACORROBJ =:p1, PLNCODIGOOBJ =:p2  ');
                        qryAux2.Parambyname('p1').asString := sDataAtualCorrecao;
                        qryAux2.Parambyname('p2').asFloat := dPlnCodigo;
                        If Not qryAux2.Prepared Then
                           qryAux2.Prepare;
                        qryAux2.execSQL;
                     End
                  Else
                     Application.MessageBox('Não houve Contabilização, pelos motivos abaixo: ' + #13 + #13 +
                        'Parâmetro de Integração Contábil não está ativo OU ' + #13 +
                        'Contabilidade está fechada. Verifique !', 'Atenção !', MB_DEFBUTTON1 + MB_ICONEXCLAMATION);
               End
            Else
               Begin
                  lblSit.Caption := 'Atualização dos Objetos Desfeita !';
                  Application.ProcessMessages;
               End;

            If Not dtmBaseDados.dbBaseDados.InTransaction Then
               dtmBaseDados.dbBaseDados.StartTransaction;
            dtmBaseDados.dbBaseDados.Commit;
            Result := true;
         End
      Else
         Begin
            Application.MessageBox('Não há Correções a serem Feitas ou Desfeitas para a Data informada !', 'Atenção !', MB_DEFBUTTON1 + MB_ICONEXCLAMATION);
            dtmBaseDados.dbBaseDados.Rollback;
            Result := false;
         End;
   Except
      On E: Exception Do
         Begin
            dtmBaseDados.dbBaseDados.Rollback;
            Result := false;
            showmessage(E.Message);
         End;
   End;

   FreeAndNil(_CdsObjeto);
   FreeAndNil(_CdsHstObjeto);
   FreeAndNil(_CdsUltimoHistoricoObjeto);
   FreeAndNil(qryPrograma);
   FreeAndNil(qryAux1);
   FreeAndNil(qryAux2);
   FreeAndNil(sMovimentoAnalitico);
End;

End.

