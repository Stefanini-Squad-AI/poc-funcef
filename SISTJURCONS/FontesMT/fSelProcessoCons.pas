//N. Sol..........: 138159
//N. Kintana......: 838578
//Data............: 21/06/2010
//Responsável.....:`Paulo Nobre / Adilson Filho
//Descrição.......: A data de atualização dos depositos recursais
//                  é gerada  automaticamente pelo sistema, a partir da ultima
//                  atualização ocorrida.
{*******************************************************
//Rotina..........: CarregaEtapa()
//N. Sol..........: 132498
//N. Kintana......: 763777
//Data............: 17/03/2010
//Responsável.....:`Paulo Nobre / William M. Santos
//Descrição.......: Implementação para que seja corrigido somento o que esta na Grid das Etapas.
*******************************************************
Rotina..........: CarregaProcesso(), CarregaEtapa()
N. Sol..........: 124766
N. Kintana......: 637518
Data............: 24/09/2009
Responsável.....: William Santos
Descrição.......: Implementado filtro pela data de ocorrência, para que seja exibido processos com
                  RO ou RR dentro da data informada no filtro.
************************************************************************************************
//Rotina..........:
//N. Sol..........: 124767
//N. Kintana......: 637517
//Data............: 24/09/2009
//Responsável.....: William Santos
//Descrição.......: Implementado ajuste para corrigir o problema de desfazer correção monetária,
//                    pois não estava gravando valor das custas na hstetapaproctrab.
//************************************************************************************************
//Rotina..........: bbtnConfirmarClick()
//N. Sol..........: 124703
//N. Kintana......: 636194
//Data............: 24/09/2009
//Responsável.....: William Santos
//Descrição.......: Implementação para corrigir o erro de Invalid Data Packet.
//********************************************************************
//Rotina..........: CarregaEtapa(), bbtnConfirmarClick()
//N. Sol..........: 122631
//N. Kintana......: 604039
//Data............: 14/09/2009
//Responsável.....: William Santos
//Descrição.......: Implementação para trazer as etapas referentes ao processo selecionado RM JUR-2009.08.
//********************************************************************
Rotina..........: bbtnConfirmarClick
N. Sol..........: 122896
N. Kintana......: 609811
Data............: 14/07/2009
Responsável.....: William Santos
Descrição.......: Foi apenas descomentado uma linha do código.
*******************************************************
Rotina..........: bbtnConfirmarClick
N. Sol..........: 116518
N. Kintana......: 546991
Data............: 14/07/2009
Responsável.....: William Santos / Paulo Nobre
Descrição.......: Implementação  para trazer processos cujas etapas (na ETAPAPROCTRAB) não tenham uma etapa de Levantamento associada (NUMSEQVINC)
}

//Rotina..........: ;
//N. Sol..........: 116513
//N. Kintana......: 547694
//Data............: 26/06/2009
//Responsável.....: William Santos
//Descrição.......: Implementação de campo data do recurso como filtro na tela de correção monetária os processos

Unit fSelProcessoCons;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, DBTables,
   fCustomSelProcesso, Wwdatsrc, ExtCtrls, wwdblook, Spin, StdCtrls, TEdNum, MAHlpBtn, Buttons,
   TB97, TB97Tlbr, IvDictio, IvMulti, IvEMulti, ComCtrls, wwdbdatetimepicker, DBClient,
   CMDateTimePicker, CmParamReport, uCmSqlParams, uCMClientDataSet, uCtrlGlobalRH, uCtrlTipProc,
   uCtrlListTerceirosRH, uCtrlPessoaFilialPessoa, uCtrlTipAcao, uCtrlTipObjeto, uCtrlTipSent,
   uCtrlTipRec, uCtrlVaraJustica, uCtrlProfiss, uCtrlGrInstr, uCtrlPessoaSindicato;

Type
   TfrmSelProcessoCons = Class(TfrmCustomSelProcesso)
      pgctrlPrincipal: TPageControl;
      tbshGeral: TTabSheet;
      tbshAdv: TTabSheet;
      rgAdv2: TRadioGroup;
      rgAT: TRadioGroup;
      gbxAdv2: TGroupBox;
      dblcAdv2: TwwDBLookupCombo;
      lstAdv2: TListBox;
      lstCodAdv2: TListBox;
      gbxAT: TGroupBox;
      dblcAT: TwwDBLookupCombo;
      lstAT: TListBox;
      lstCodAT: TListBox;
      rgAdv1: TRadioGroup;
      gbxAdv1: TGroupBox;
      dblcAdv1: TwwDBLookupCombo;
      lstAdv1: TListBox;
      lstCodAdv1: TListBox;
      rgVaraJust: TRadioGroup;
      gbxVaraJust: TGroupBox;
      dblcVaraJust: TwwDBLookupCombo;
      lstVaraJust: TListBox;
      lstCodVaraJust: TListBox;
      rgAdvC: TRadioGroup;
      gbxAdvC: TGroupBox;
      dblcAdvC: TwwDBLookupCombo;
      lstAdvC: TListBox;
      lstCodAdvC: TListBox;
      tbshObjetos: TTabSheet;
      rgObjeto: TRadioGroup;
      gbxObjeto: TGroupBox;
      dblcObjeto: TwwDBLookupCombo;
      lstObjeto: TListBox;
      lstCodObjeto: TListBox;
      rgInstancia: TRadioGroup;
      gbxEtapa: TGroupBox;
      dblcEtapa: TwwDBLookupCombo;
      lstEtapa: TListBox;
      lstCodEtapa: TListBox;
      rgSentenca: TRadioGroup;
      gbxSentenca: TGroupBox;
      dblcSentenca: TwwDBLookupCombo;
      lstSentenca: TListBox;
      lstCodSentenca: TListBox;
      rgEtapa: TRadioGroup;
      rgSitProc: TRadioGroup;
      gbxNumPr: TGroupBox;
      Label2: TLabel;
      EdnNum1: TEditNum;
      EdnNum2: TEditNum;
      gbxTipEncer: TGroupBox;
      cbxArquiv: TCheckBox;
      cbxAcordo: TCheckBox;
      cbxDesist: TCheckBox;
      cbxSent: TCheckBox;
      rgParte: TRadioGroup;
      gbxSalario: TGroupBox;
      Label4: TLabel;
      ednCus1: TEditNum;
      ednCus2: TEditNum;
      gbxFaixaInc: TGroupBox;
      Label15: TLabel;
      edDataInc1: TCMDateTimePicker;
      edDataInc2: TCMDateTimePicker;
      gbxFaixaAju: TGroupBox;
      Label6: TLabel;
      EdDataAju1: TCMDateTimePicker;
      EdDataAju2: TCMDateTimePicker;
      gbxFaixaData: TGroupBox;
      Label3: TLabel;
      EdDataNot1: TCMDateTimePicker;
      EdDataNot2: TCMDateTimePicker;
      gbxDataEnc: TGroupBox;
      Label5: TLabel;
      EdDataEnc1: TCMDateTimePicker;
      EdDataEnc2: TCMDateTimePicker;
      gbxTempAdm: TGroupBox;
      Label1: TLabel;
      ednAdm1: TSpinEdit;
      ednAdm2: TSpinEdit;
      rgTipoProc: TRadioGroup;
      gbxTipoProc: TGroupBox;
      dblcTipoProc: TwwDBLookupCombo;
      lstTipoProc: TListBox;
      lstCodTipoProc: TListBox;
      rgTipoAcao: TRadioGroup;
      gbxTipoAcao: TGroupBox;
      dblcTipoAcao: TwwDBLookupCombo;
      lstTipoAcao: TListBox;
      lstCodTipoAcao: TListBox;
      tbsCidadesUF: TTabSheet;
      rgUF: TRadioGroup;
      gbxUF: TGroupBox;
      dblcUF: TwwDBLookupCombo;
      lstUF: TListBox;
      lstCodUF: TListBox;
      rgCidade: TRadioGroup;
      gbxCidade: TGroupBox;
      dblcCidade: TwwDBLookupCombo;
      lstCidade: TListBox;
      lstCodCidade: TListBox;
      cbxCidadeNegativa: TCheckBox;
      dsProcesso: TwwDataSource;
      CdsProcesso: TCMClientDataSet;
      sqlProcesso: TCMSqlParams;
      CdsAdvog2: TCMClientDataSet;
      CdsAdvog1: TCMClientDataSet;
      CdsAdvogCasa: TCMClientDataSet;
      CdsVaraJustica: TCMClientDataSet;
      CdsAT: TCMClientDataSet;
      CdsUF: TCMClientDataSet;
      CdsTipoProc: TCMClientDataSet;
      CdsTipoAcao: TCMClientDataSet;
      CdsObjeto: TCMClientDataSet;
      CdsCidade: TCMClientDataSet;
      CdsEtapa: TCMClientDataSet;
      CdsSentenca: TCMClientDataSet;
      CdsEstab: TCMClientDataSet;
      CdsPlano: TCMClientDataSet;
      CdsPatro: TCMClientDataSet;
      CdsProfis: TCMClientDataSet;
      CdsCargo: TCMClientDataSet;
      CdsGrauInstr: TCMClientDataSet;
      CdsSindic: TCMClientDataSet;
      CdsLotacao: TCMClientDataSet;
      lstSiglaUF: TListBox;
      gbxMateria: TGroupBox;
      cbxMat1: TCheckBox;
      cbxMat3: TCheckBox;
      cbxMat2: TCheckBox;
      cbxMat4: TCheckBox;
      cbxMat5: TCheckBox;
      cbxMat6: TCheckBox;
      cbxMat7: TCheckBox;
      dtpEtapaFim: TCMDateTimePicker;
      gpEtapa: TGroupBox;
      dtpEtapaIni: TCMDateTimePicker;
      lblDe: TLabel;
      lblAte: TLabel;
      CMSqlText: TCMSqlParams;
      CMSqlTextEtapa: TCMSqlParams;
      CMSqlEtapa: TCMSqlParams;
      CdsEtapaGrid: TCMClientDataSet;
      Procedure FormCreate(Sender: TObject);
      Procedure ednAdm2Change(Sender: TObject);
      Procedure ednAdm1Change(Sender: TObject);
      Procedure dblcTipoProcCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
         modified: Boolean);
      Procedure dblcLotacaoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
         modified: Boolean);
      Procedure EdnNum1Change(Sender: TObject);
      Procedure EdnNum2Change(Sender: TObject);
      Procedure ednCus1Change(Sender: TObject);
      Procedure ednCus2Change(Sender: TObject);
      Procedure rgSitProcClick(Sender: TObject);
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure lstTipoProcKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure rgTipoProcClick(Sender: TObject);
      Procedure EdnNum2Exit(Sender: TObject);
   Private
      CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
      CtrlListTerceirosRH: TCtrlListTerceirosRH;
      CtrlGlobalRH: TCtrlGlobalRH;
      CtrlTipProc: TCtrlTipProc;
      CtrlTipAcao: TCtrlTipAcao;
      CtrlTipObjeto: TCtrlTipObjeto;
      CtrlTipSent: TCtrlTipSent;
      CtrlTipRec: TCtrlTipRec;
      CtrlVaraJustica: TCtrlVaraJustica;
      CtrlProfiss: TCtrlProfiss;
      CtrlGrInstr: TCtrlGrInstr;
      CtrlPessoaSindicato: TCtrlPessoaSindicato;

      Procedure MudouEstado;
      //William Santos  KINTANA 604039 SOL 122631 INI
      Function CarregaProcesso: String;
      Function CarregaEtapa: String;
      //William Santos  KINTANA 604039 SOL 122631 FIM
   End;

Var
   frmSelProcessoCons: TfrmSelProcessoCons;
   sListaIdEtapaSel: String; // timão

Implementation

Uses uSistema, uMensErro, fAguarde, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH;

Const
   ORDEM_DADOS: Array[0..9] Of String = (
      'RECLAMANTES.NOME',
      'RECLAMANTES.INSCRICAONUMERO',
      'RECLAMANTES.IDPESSJUR, RECLAMANTES.NOME',
      'RECLAMANTES.IDPESSJUR, RECLAMANTES.MATRICULA',
      'RECLAMANTES.IDPLANOPREV, RECLAMANTES.NOME',
      'RECLAMANTES.IDPLANOPREV, RECLAMANTES.INSCRICAONUMERO',
      'RECLAMANTES.IDPESSJUR, RECLAMANTES.IDPLANOPREV, RECLAMANTES.NOME',
      'RECLAMANTES.IDPESSJUR, RECLAMANTES.IDPLANOPREV, RECLAMANTES.INSCRICAONUMERO',
      'RECLAMANTES.IDPLANOPREV, RECLAMANTES.IDPESSJUR, RECLAMANTES.NOME',
      'RECLAMANTES.IDPLANOPREV, RECLAMANTES.IDPESSJUR, RECLAMANTES.MATRICULA');

   {$R *.DFM}

Procedure TfrmSelProcessoCons.FormCreate(Sender: TObject);
Begin
   Inherited;
   CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
      CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
   CtrlPessoaFilialPessoa.InitializeAs(Padroes);

   CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
      CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
   CtrlListTerceirosRH.InitializeAs(Padroes);

   CtrlGlobalRH := TCtrlGlobalRH.Create;
   CtrlGlobalRH.InitializeAs(Padroes);

   CtrlTipProc := TCtrlTipProc.Create;
   CtrlTipProc.InitializeAs(Padroes);

   CtrlTipAcao := TCtrlTipAcao.Create;
   CtrlTipAcao.InitializeAs(Padroes);

   CtrlTipObjeto := TCtrlTipObjeto.Create;
   CtrlTipObjeto.InitializeAs(Padroes);

   CtrlTipSent := TCtrlTipSent.Create;
   CtrlTipSent.InitializeAs(Padroes);

   CtrlTipRec := TCtrlTipRec.Create;
   CtrlTipRec.InitializeAs(Padroes);

   CtrlVaraJustica := TCtrlVaraJustica.Create;
   CtrlVaraJustica.InitializeAs(Padroes);

   CtrlProfiss := TCtrlProfiss.Create;
   CtrlProfiss.InitializeAs(Padroes);

   CtrlPessoaSindicato := TCtrlPessoaSindicato.Create;
   CtrlPessoaSindicato.InitializeAs(Padroes);

   CtrlGrInstr := TCtrlGrInstr.Create;
   CtrlGrInstr.InitializeAs(Padroes);

   CdsAdvog1.Data := CtrlGlobalRH.ListAdvogadoContratado(Sistema.IdModulo);
   CdsAdvogCasa.Data := CtrlGlobalRH.ListAdvogadoCasa;
   CdsAdvog2.Data := CtrlGlobalRH.ListAdvogadoDoReclamante(Sistema.IdModulo);
   CdsAT.Data := CtrlGlobalRH.ListAssistenteTecnico(Sistema.IdModulo);
   CdsVaraJustica.Data := CtrlVaraJustica.ListVarasDoModulo(Sistema.IdModulo);
   CdsUF.Data := CtrlListTerceirosRH.ListEstado;
   CdsTipoProc.Data := CtrlTipProc.ListTipProc;
   CdsTipoAcao.Data := CtrlTipAcao.ListTipAcao;
   CdsObjeto.Data := CtrlTipObjeto.ListTipObjeto;
   CdsSentenca.Data := CtrlTipSent.ListTipSent;
   CdsEtapa.Data := CtrlTipRec.ListTipRec;
   CdsCidade.Data := CtrlListTerceirosRH.ListCidadeNasc(0, '', '');
   CdsProfis.Data := CtrlProfiss.ListProfissao;
   CdsGrauInstr.Data := CtrlGrInstr.ListGrauInstrucao;
   CdsLotacao.Data := CtrlListTerceirosRH.ListCCusto(IntToStr(Sistema.IdEmpresa), '', true);

   //cmbSequencia.ItemIndex := 0;
   pgctrlPrincipal.ActivePageIndex := 0;
End;

Procedure TfrmSelProcessoCons.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   FreeAndNil(CtrlListTerceirosRH);
   FreeAndNil(CtrlGlobalRH);
   FreeAndNil(CtrlTipProc);
   FreeAndNil(CtrlTipAcao);
   FreeAndNil(CtrlTipObjeto);
   FreeAndNil(CtrlTipSent);
   FreeAndNil(CtrlTipRec);
   FreeAndNil(CtrlVaraJustica);
   FreeAndNil(CtrlPessoaFilialPessoa);
   FreeAndNil(CtrlProfiss);
   FreeAndNil(CtrlPessoaSindicato);
   FreeAndNil(CtrlGrInstr);
   Inherited;
End;

Procedure TfrmSelProcessoCons.dblcLotacaoCloseUp(Sender: TObject; LookupTable,
   FillTable: TDataSet; modified: Boolean);
Begin
   If (modified) And Not (CdsLotacao.IsEmpty) Then
      (Sender As TwwDBLookupCombo).Text := CdsLotacao.FieldByName('CODCENTROCUSTO').asString;
End;

Procedure TfrmSelProcessoCons.dblcTipoProcCloseUp(Sender: TObject; LookupTable,
   FillTable: TDataSet; modified: Boolean);
Begin
   If (Sender = dblcTipoProc) Then
      InserirLista(Modified, lstCodTipoProc, lstTipoProc, CdsTipoProc, 'IDTIPOPROC', 'NOMETIPOPROC')
   Else
      If (Sender = dblcTipoAcao) Then
         InserirLista(Modified, lstCodTipoAcao, lstTipoAcao, CdsTipoAcao, 'IDTIPOACAO', 'DESCRICAO')
      Else
         If (Sender = dblcAdv1) Then
            InserirLista(Modified, lstCodAdv1, lstAdv1, CdsAdvog1, 'IDPESSOA', 'NOME')
         Else
            If (Sender = dblcAdvC) Then
               InserirLista(Modified, lstCodAdvC, lstAdvC, CdsAdvogCasa, 'IDPESSOA', 'NOME')
            Else
               If (Sender = dblcAdv2) Then
                  InserirLista(Modified, lstCodAdv2, lstAdv2, CdsAdvog2, 'IDPESSOA', 'NOME')
               Else
                  If (Sender = dblcAT) Then
                     InserirLista(Modified, lstCodAT, lstAT, CdsAT, 'IDPESSOA', 'NOME')
                  Else
                     If (Sender = dblcVaraJust) Then
                        InserirLista(Modified, lstCodVaraJust, lstVaraJust, CdsVaraJustica, 'IDVARAJUSTICA', 'DESCRICAO')
                     Else
                        If (Sender = dblcUF) And (Modified) Then
                           Begin
                              InserirLista(Modified, lstCodUF, lstUF, CdsUF, 'IDESTADO', 'NOMEESTADO');
                              lstSiglaUF.Items.Add(CdsUF.FieldByName('CODESTADO').asString);
                              MudouEstado;
                           End
                        Else
                           If (Sender = dblcCidade) Then
                              InserirLista(Modified, lstCodCidade, lstCidade, CdsCidade, 'IDCIDADES', 'NOME')
                           Else
                              If (Sender = dblcObjeto) Then
                                 InserirLista(Modified, lstCodObjeto, lstObjeto, CdsObjeto, 'CODTIPOOBJETO', 'DESCRICAO')
                              Else
                                 If (Sender = dblcSentenca) Then
                                    InserirLista(Modified, lstCodSentenca, lstSentenca, CdsSentenca, 'CODTIPOSENT', 'DESCRICAO')
                                 Else
                                    If (Sender = dblcEtapa) Then
                                       InserirLista(Modified, lstCodEtapa, lstEtapa, CdsEtapa, 'CODTIPORECURSO', 'DESCRICAO');
End;

Procedure TfrmSelProcessoCons.lstTipoProcKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
Begin
   If (Sender = lstTipoProc) Then
      ApagarLista(Key, lstCodTipoProc, lstTipoProc)
   Else
      If (Sender = lstTipoAcao) Then
         ApagarLista(Key, lstCodTipoAcao, lstTipoAcao)
      Else
         If (Sender = lstAdv1) Then
            ApagarLista(Key, lstCodAdv1, lstAdv1)
         Else
            If (Sender = lstAdvC) Then
               ApagarLista(Key, lstCodAdvC, lstAdvC)
            Else
               If (Sender = lstAdv2) Then
                  ApagarLista(Key, lstCodAdv2, lstAdv2)
               Else
                  If (Sender = lstAT) Then
                     ApagarLista(Key, lstCodAT, lstAT)
                  Else
                     If (Sender = lstVaraJust) Then
                        ApagarLista(Key, lstCodVaraJust, lstVaraJust)
                     Else
                        If (Sender = lstUF) And (Key = VK_DELETE) And (lstUF.Items.Count > 0) Then
                           Begin
                              ApagarLista(Key, lstCodUF, lstUF);
                              lstSiglaUF.Items.Delete(iIndiceAnt);
                              MudouEstado;
                           End
                        Else
                           If (Sender = lstCidade) Then
                              ApagarLista(Key, lstCodCidade, lstCidade)
                           Else
                              If (Sender = lstObjeto) Then
                                 ApagarLista(Key, lstCodObjeto, lstObjeto)
                              Else
                                 If (Sender = lstSentenca) Then
                                    ApagarLista(Key, lstCodSentenca, lstSentenca)
                                 Else
                                    If (Sender = lstEtapa) Then
                                       ApagarLista(Key, lstCodEtapa, lstEtapa);
End;

Procedure TfrmSelProcessoCons.ednAdm2Change(Sender: TObject);
Begin
   If (ednAdm2.Value < ednAdm1.Value) Then
      ednAdm2.Value := ednAdm1.Value;
End;

Procedure TfrmSelProcessoCons.ednAdm1Change(Sender: TObject);
Begin
   If (ednAdm1.Value > ednAdm2.Value) Then
      ednAdm1.Value := ednAdm2.Value;
End;

Procedure TfrmSelProcessoCons.EdnNum1Change(Sender: TObject);
Begin
   {   Try
         If (StrToFloat(ednNum1.Text) > StrToFloat(ednNum2.Text)) Then
            ednNum1.Text := ednNum2.Text;
      Except
      End;}
End;

Procedure TfrmSelProcessoCons.EdnNum2Change(Sender: TObject);
Begin
   Try
      //      If (StrToFloat(ednNum1.Text) > StrToFloat(ednNum2.Text)) Then
      //         MsgDlg('Primeiro campo não pode ser maior que o Segundo campo !', 'Aviso', mtInformation, [mbOk], 0);
            //         ednNum2.Text := ednNum1.Text;
   Except
   End;
End;

Procedure TfrmSelProcessoCons.ednCus1Change(Sender: TObject);
Begin
   Try
      If (StrToFloat(ednCus1.Text) > StrToFloat(ednCus2.Text)) Then
         ednCus1.Text := ednCus2.Text;
   Except
   End;
End;

Procedure TfrmSelProcessoCons.ednCus2Change(Sender: TObject);
Begin
   Try
      If (StrToFloat(ednCus2.Text) < StrToFloat(ednCus1.Text)) Then
         ednCus2.Text := ednCus1.Text;
   Except
   End;
End;

Procedure TfrmSelProcessoCons.rgTipoProcClick(Sender: TObject);
Begin
   If (Sender = rgTipoProc) Then
      HabilitarLista(rgTipoProc, gbxTipoProc, CdsTipoProc)
   Else
      If (Sender = rgTipoAcao) Then
         HabilitarLista(rgTipoAcao, gbxTipoAcao, CdsTipoAcao)
      Else
         If (Sender = rgAdv1) Then
            HabilitarLista(rgAdv1, gbxAdv1, CdsAdvog1)
         Else
            If (Sender = rgAdvC) Then
               HabilitarLista(rgAdvC, gbxAdvC, CdsAdvogCasa)
            Else
               If (Sender = rgAdv2) Then
                  HabilitarLista(rgAdv2, gbxAdv2, CdsAdvog2)
               Else
                  If (Sender = rgAT) Then
                     HabilitarLista(rgAT, gbxAT, CdsAT)
                  Else
                     If (Sender = rgVaraJust) Then
                        HabilitarLista(rgVaraJust, gbxVaraJust, CdsVaraJustica)
                     Else
                        If (Sender = rgUF) Then
                           Begin
                              HabilitarLista(rgUF, gbxUF, CdsUF);
                              MudouEstado;
                           End
                        Else
                           If (Sender = rgCidade) Then
                              HabilitarLista(rgCidade, gbxCidade, CdsCidade)
                           Else
                              If (Sender = rgObjeto) Then
                                 HabilitarLista(rgObjeto, gbxObjeto, CdsObjeto)
                              Else
                                 If (Sender = rgEtapa) Then
                                    HabilitarLista(rgEtapa, gbxEtapa, CdsEtapa)
                                 Else
                                    If (Sender = rgSentenca) Then
                                       HabilitarLista(rgSentenca, gbxSentenca, CdsSentenca);
End;

Procedure TfrmSelProcessoCons.rgSitProcClick(Sender: TObject);
Begin
   gbxTipEncer.Visible := (rgSitProc.ItemIndex > 0);
   gbxDataEnc.Visible := (rgSitProc.ItemIndex > 0);
   rgSentenca.Visible := (rgSitProc.ItemIndex > 0);
   gbxSentenca.Visible := (rgSitProc.ItemIndex > 0);
End;

Procedure TfrmSelProcessoCons.bbtnConfirmarClick(Sender: TObject);
Var
   sListaIdTipoProcSel, sListaIdTipoAcaoSel, sListaIdAdvog1Sel, sListaIdAdvogCasaSel,
      sListaIdAdvog2Sel, sListaIdATSel, sListaIdVaraJusticaSel, sListaIdUFSel,
      sListaIdCidadesSel, sListaIdObjetoSel, sListaIdSentencaSel, sListaIdEtapaSel,
      sListaIdPlanoSel, sListaIdPatroSel, sListaIdCargoSel, sListaIdEstabSel,
      sListaIdSindicSel: String;
Begin
   //William M. Santos - KINTANA 636194  SOL 124703 - INI
   sqlProcesso.SQL.Text := CarregaProcesso;
   //William M. Santos - KINTANA 636194  SOL 124703 - FIM

   If (AbrirQueryPrincipal) Then
      Begin
         CdsProcesso.DisableControls;
         //William Santos  KINTANA 604039 SOL 122631 INI
         //Correção do bug que havia quando se clicava duas vezes no OK.
         //sqlProcesso.SQL.add(CarregaProcesso);

         //sqlProcesso.SQL.Text := CarregaProcesso;  //William M. Santos - KINTANA 636194  SOL 124703
         sqlProcesso.Open;
         CdsProcesso.EnableControls;

         //É aberto o cds referente a etapas, que e exibido na grid do form frmCorrecaoMonet
         CdsEtapaGrid.DisableControls;
         //CMSqlEtapa.SQL.add(CarregaEtapa);
         CMSqlEtapa.SQL.text := CarregaEtapa;

         CMSqlEtapa.Open;
         CdsEtapaGrid.EnableControls;
         //William Santos  KINTANA 604039 SOL 122631 INI
      End;

   If (IrPaginaResult) Then
      ExecutarIrPaginaResult;

   ModalResult := mrOk;
   bSelOk := true;
End;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

Procedure TfrmSelProcessoCons.MudouEstado;
Begin
   CdsCidade.Data := CtrlListTerceirosRH.ListCidadeNasc(0, GerarListaItens(rgUF, lstSiglaUF, lstUF));
End;

Function TfrmSelProcessoCons.CarregaProcesso: String;
Var
   sListaIdTipoProcSel, sListaIdTipoAcaoSel, sListaIdAdvog1Sel, sListaIdAdvogCasaSel,
      sListaIdAdvog2Sel, sListaIdATSel, sListaIdVaraJusticaSel, sListaIdUFSel,
      sListaIdCidadesSel, sListaIdObjetoSel, sListaIdSentencaSel, sListaIdEtapaSel,
      sListaIdPlanoSel, sListaIdPatroSel, sListaIdCargoSel, sListaIdEstabSel,
      sListaIdSindicSel: String;
Begin
   // Cria a lista de IDs dos Tipos de Processo selecionados
   //William M. Santos - SOL 122896 KINTANA - 609811 - INI
   sListaIdTipoProcSel := GerarParamSELECT(rgTipoProc, lstCodTipoProc, lstTipoProc);
   //William M. Santos - SOL 122896 KINTANA - 609811 - FIM
   // Cria a lista de IDs dos Tipos de Ação em Processos selecionados
   sListaIdTipoAcaoSel := GerarParamSELECT(rgTipoAcao, lstCodTipoAcao, lstTipoAcao);

   // Cria a lista de IDs dos Advogados Contratados selecionados
   sListaIdAdvog1Sel := GerarParamSELECT(rgAdv1, lstCodAdv1, lstAdv1);

   // Cria a lista de IDs dos Advogados da Casa selecionados
   sListaIdAdvogCasaSel := GerarParamSELECT(rgAdvC, lstCodAdvC, lstAdvC);

   // Cria a lista de IDs dos Advogados da Contraparte selecionados
   sListaIdAdvog2Sel := GerarParamSELECT(rgAdv2, lstCodAdv2, lstAdv2);

   // Cria a lista de IDs dos Assistentes Técnicos selecionados
   sListaIdATSel := GerarParamSELECT(rgAT, lstCodAT, lstAT);

   // Cria a lista de IDs das Varas de Justiça selecionadas
   sListaIdVaraJusticaSel := GerarParamSELECT(rgVaraJust, lstCodVaraJust, lstVaraJust);

   // Cria a lista de IDs das UFs selecionadas
   sListaIdUFSel := GerarParamSELECT(rgUF, lstCodUF, lstUF);

   // Cria a lista de IDs das Cidades selecionadas
   sListaIdCidadesSel := GerarParamSELECT(rgCidade, lstCodCidade, lstCidade);

   // Cria a lista de IDs dos Objetos selecionados
   sListaIdObjetoSel := GerarParamSELECT(rgObjeto, lstCodObjeto, lstObjeto);

   // Cria a lista de IDs das Sentenças selecionadas
   sListaIdSentencaSel := GerarParamSELECT(rgSentenca, lstCodSentenca, lstSentenca);

   // Cria a lista de IDs das Etapas selecionadas
   sListaIdEtapaSel := GerarParamSELECT(rgEtapa, lstCodEtapa, lstEtapa);

   With (CMSqlText.Sql) Do
      Begin
         Clear;
         //William M. Santos -
         Add('SELECT DISTINCT');
         Add('  PT.*, RECLAMANTES.*, CI.IDESTADO, VJ.DESCRICAO AS NOMEVARA,');
         Add('  CASE WHEN NVL(PT.FLGSITPROC,0) = 1 THEN ''Sim'' ELSE ''Não'' END AS ENCERRADO');
         Add('FROM');
         Add('  PROCESSOTRAB PT, CIDADES CI, VARAJUSTICA VJ,');
         //--------------------------------------------------------------------------
         Add('  (SELECT DISTINCT');
         Add('     P.NOME, P.TIPO, P.NUMDOCUMENTO, P.IDPESSOA, PF.IDSINDICATO,');
         Add('     PF.IDFONTRECR, PF.IDGRINSTR, PF.IDPROFISS,');
         Add('     PF.DATANASC, PF.SEXO, PF.ESTCIVIL, PF.NUMDEPIRRF, PF.NUMDEPSALF,');
         Add('     PF.NUMDEPTOT, PF.FLGISENTOIRRF, PF.CORPESSOA, PF.FLGDEFICIENTE,');
         Add('     CI.NOME AS CIDADE, E.LOGRADOURO, E.CODESTADO, E.NUMERO,');
         Add('     E.COMPLEMENTO, E.BAIRRO, E.CEP,');

         Add('     ('' '') AS DATADEMISSAO, ('' '') AS DATAADMISSAO, 0 AS IDPESSJUR');

         Add('   FROM');
         Add('     PESSOA P, PESSOAFISICA PF, ENDPESS E, CIDADES CI, PROCESSOTRAB PT');

         Add('   WHERE');
         If (Not cbxMat1.Checked) Then
            Add('     (PT.INDMATERIA     <> 1) AND');
         If (Not cbxMat2.Checked) Then
            Add('     (PT.INDMATERIA     <> 2) AND');
         If (Not cbxMat3.Checked) Then
            Add('     (PT.INDMATERIA     <> 3) AND');
         If (Not cbxMat4.Checked) Then
            Add('     (PT.INDMATERIA     <> 4) AND');
         If (Not cbxMat5.Checked) Then
            Add('     (PT.INDMATERIA     <> 5) AND');
         If (Not cbxMat6.Checked) Then
            Add('     (PT.INDMATERIA     <> 6) AND');
         If (Not cbxMat7.Checked) Then
            Add('     (PT.INDMATERIA     <> 7) AND');
         Add('     (PT.IDRECLAMANTE    = P.IDPESSOA) AND');
         Add('     (P.IDENDRESIDENCIAL = E.IDENDERECO(+)) AND');
         Add('     (E.IDCIDADES        = CI.IDCIDADES(+)) AND');
         Add('     (P.IDPESSOA         = PF.IDPESSOA(+)) AND');

         sSQL := CMSqlText.SQL[Count - 1];
         If (UpperCase(Copy(sSQL, Length(sSQL) - 2, 3)) = 'AND') Then
            Begin
               sSQL := Copy(sSQL, 1, Length(sSQL) - 4);
               CMSqlText.SQL[Count - 1] := sSQL;
            End;

         Add('  ) RECLAMANTES');
         //--------------------------------------------------------------------------

         If (rgObjeto.ItemIndex * lstObjeto.Items.Count > 0) Then
            Begin
               Add('     ,(SELECT NUMPROCTRAB, COUNT(*) AS TOTALOBJ');
               Add('       FROM   OBJPROCTRAB');
               Add('       WHERE  (CODTIPOOBJETO ' + sListaIdObjetoSel + ')');
               Add('       GROUP BY NUMPROCTRAB) OBJETOS');
            End;

         If (rgEtapa.ItemIndex * lstEtapa.Items.Count > 0) Then
            Begin
               If (rgEtapa.ItemIndex = 1) Then
                  Begin
                     Add('     ,(SELECT NUMPROCTRAB');
                     Add('       FROM   ETAPAPROCTRAB');
                     Add('       WHERE  (CODTIPORECURSO ' + sListaIdEtapaSel + ') AND');
                     Add('              (DATAREALOCOR  <= SYSDATE) AND');
                     Add('              (DATAREALOCOR   = (SELECT MAX(DATAREALOCOR)');
                     Add('                                 FROM   ETAPAPROCTRAB E');
                     Add('                                 WHERE  (E.NUMPROCTRAB = ETAPAPROCTRAB.NUMPROCTRAB)');
                     Add('                                 GROUP BY NUMPROCTRAB))) ETAPAS');
                  End
               Else
                  Begin
                     Add('     ,(SELECT NUMPROCTRAB, COUNT(*) AS TOTALETP');
                     Add('       FROM   ETAPAPROCTRAB');
                     Add('       WHERE  (CODTIPORECURSO ' + sListaIdEtapaSel + ')');
                     Add('       GROUP BY NUMPROCTRAB) ETAPAS');
                  End;
            End;

         //William Santos SOL 116513 KINTANA 547694 - INÍCIO
         If (dtpEtapaIni.Text <> '') Or (dtpEtapaFim.Text <> '') Then
            Begin
               Add('       ,(SELECT NUMPROCTRAB');
               Add('         FROM ETAPAPROCTRAB');
               Add('         WHERE  DATAREALOCOR >= TO_DATE(' + QuotedStr(dtpEtapaIni.Text) + ',''DD/MM/YYYY'') AND');
               Add('                DATAREALOCOR <= TO_DATE(' + QuotedStr(dtpEtapaFim.Text) + ',''DD/MM/YYYY'')) ETAPA');
            End;
         //William Santos SOL 116513 KINTANA 547694 - FIM

         If ((dtpEtapaIni.Text <> '') Or (dtpEtapaFim.Text <> '')) Or
            ((rgEtapa.ItemIndex * lstEtapa.Items.Count > 0)) Then
            Begin

               //William Santos / Paulo Nobre KINTANA 546991 SOL 116518 INÍCIO

               Add('          ,(SELECT E1.NUMPROCTRAB, E1.NUMSEQ, E1.CODTIPORECURSO, E1.NUMSEQVINC');
               Add('            FROM ETAPAPROCTRAB E1');
               Add('            WHERE  NOT EXISTS (SELECT 1');
               Add('                               FROM ETAPAPROCTRAB E2');
               Add('                               WHERE E2.CODTIPORECURSO = 1034');
               Add('                               AND E2.NUMSEQVINC     > 0');
               Add('                               AND E2.NUMSEQVINC     = E1.NUMSEQ');
               Add('                               AND E2.NUMPROCTRAB    = E1.NUMPROCTRAB)');
               //Wiliam M. Santos - SOL 124766 - KINTANA 637518 - INI
               //Add('            AND E1.CODTIPORECURSO <> 1034');
               Add('              AND E1.NUMSEQVINC = 0');

               If (dtpEtapaIni.Text <> '') Or (dtpEtapaFim.Text <> '') Then
                  Begin
                     Add('      AND  (E1.DATAREALOCOR >= TO_DATE(' + QuotedStr(dtpEtapaIni.Text) + ',''DD/MM/YYYY'') ');
                     Add('      AND   E1.DATAREALOCOR <= TO_DATE(' + QuotedStr(dtpEtapaFim.Text) + ',''DD/MM/YYYY''))   ');
                  End;
               //Wiliam M. Santos - SOL 124766 - KINTANA 637518 - FIM

               If (rgEtapa.ItemIndex * lstEtapa.Items.Count > 0) Then
                  Add('         AND E1.CODTIPORECURSO ' + sListaIdEtapaSel + ') ETAPASRECURSO')
               Else
                  Add('                                                       ) ETAPASRECURSO')
                     //William Santos / Paulo Nobre KINTANA 546991 SOL 116518 FIM
            End
         Else
            Begin

               Add('          ,(SELECT E1.NUMPROCTRAB, E1.NUMSEQ, E1.CODTIPORECURSO, E1.NUMSEQVINC');
               Add('            FROM ETAPAPROCTRAB E1');
               If (dtpEtapaIni.Text <> '') Or (dtpEtapaFim.Text <> '') Then
                  Begin
                     Add('      AND  (E1.DATAREALOCOR >= TO_DATE(' + QuotedStr(dtpEtapaIni.Text) + ',''DD/MM/YYYY'') ');
                     Add('      AND   E1.DATAREALOCOR <= TO_DATE(' + QuotedStr(dtpEtapaFim.Text) + ',''DD/MM/YYYY''))   ');
                  End;
               If (rgEtapa.ItemIndex * lstEtapa.Items.Count > 0) Then
                  Add('         AND E1.CODTIPORECURSO ' + sListaIdEtapaSel + ') ETAPASRECURSO')
               Else
                  Add('                                                       ) ETAPASRECURSO');

            End;

         Add('WHERE');
         If (Not cbxMat1.Checked) Then
            Add('     (PT.INDMATERIA     <> 1) AND');
         If (Not cbxMat2.Checked) Then
            Add('     (PT.INDMATERIA     <> 2) AND');
         If (Not cbxMat3.Checked) Then
            Add('     (PT.INDMATERIA     <> 3) AND');
         If (Not cbxMat4.Checked) Then
            Add('     (PT.INDMATERIA     <> 4) AND');
         If (Not cbxMat5.Checked) Then
            Add('     (PT.INDMATERIA     <> 5) AND');
         If (Not cbxMat6.Checked) Then
            Add('     (PT.INDMATERIA     <> 6) AND');
         If (Not cbxMat7.Checked) Then
            Add('     (PT.INDMATERIA     <> 7) AND');
         Add('  (PT.IDRECLAMANTE  = RECLAMANTES.IDPESSOA) AND');
         Add('  (PT.IDVARAJUSTICA = VJ.IDVARAJUSTICA(+)) AND');
         Add('  (PT.IDCIDADES     = CI.IDCIDADES(+)) AND');

         If (EdDataInc1.Text <> '') Then
            Add('  (TRUNC(PT.TRGDTINCLUSAO) >= TO_DATE(' + QuotedStr(EdDataInc1.Text) + ',''DD/MM/YYYY'')) AND');

         If (EdDataInc2.Text <> '') Then
            Add('  (TRUNC(PT.TRGDTINCLUSAO) <= TO_DATE(' + QuotedStr(EdDataInc2.Text) + ',''DD/MM/YYYY'')) AND');

         If (EdDataAju1.Text <> '') Then
            Add('  (PT.DATAJUIZO >= TO_DATE(' + QuotedStr(EdDataAju1.Text) + ',''DD/MM/YYYY'')) AND');

         If (EdDataAju2.Text <> '') Then
            Add('  (PT.DATAJUIZO <= TO_DATE(' + QuotedStr(EdDataAju2.Text) + ',''DD/MM/YYYY'')) AND');

         If (EdDataNot1.Text <> '') Then
            Add('  (PT.DATANOTIF >= TO_DATE(' + QuotedStr(EdDataNot1.Text) + ',''DD/MM/YYYY'')) AND');

         If (EdDataNot2.Text <> '') Then
            Add('  (PT.DATANOTIF <= TO_DATE(' + QuotedStr(EdDataNot2.Text) + ',''DD/MM/YYYY'')) AND');

         If (rgSitProc.ItemIndex < 2) Then
            Add('  (FLGSITPROC = ' + IntToStr(rgSitProc.ItemIndex) + ') AND');

         If (rgSitProc.ItemIndex > 0) And ((EdDataEnc1.Text <> '') Or (EdDataEnc2.Text <> '')) Then
            Begin
               sSQL := '  (FLGSITPROC = 0 OR ';

               If (EdDataEnc1.Text <> '') Then
                  Begin
                     If (EdDataEnc2.Text <> '') Then
                        sSQL := sSQL + '(';

                     sSQL := sSQL + '(PT.DATAEFETENC >= TO_DATE(''' +
                        EdDataEnc1.Text + ''',''DD/MM/YYYY''))';
                  End;

               If (EdDataEnc2.Text <> '') Then
                  Begin
                     If (EdDataEnc1.Text <> '') Then
                        sSQL := sSQL + ' AND ';

                     sSQL := sSQL + '(PT.DATAEFETENC <= TO_DATE(''' +
                        EdDataEnc2.Text + ''',''DD/MM/YYYY''))';

                     If (EdDataEnc1.Text <> '') Then
                        sSQL := sSQL + ')';
                  End;

               Add(sSQL + ') AND');
            End;

         If (rgSitProc.ItemIndex > 0) Then
            Begin
               If Not (cbxArquiv.Checked) Then
                  Add('  (FLGSITPROC = 0 or TIPOENCER <> ''A'') AND');
               If Not (cbxAcordo.Checked) Then
                  Add('  (FLGSITPROC = 0 or TIPOENCER <> ''C'') AND');
               If Not (cbxDesist.Checked) Then
                  Add('  (FLGSITPROC = 0 or TIPOENCER <> ''D'') AND');
               If Not (cbxSent.Checked) Then
                  Add('  (FLGSITPROC = 0 or TIPOENCER <> ''S'') AND');
            End;

         If (rgAdvC.ItemIndex * lstAdvC.Items.Count > 0) Then
            Add('  (IDADVOGCASA ' + sListaIdAdvogCasaSel + ') AND');

         If (rgAdv1.ItemIndex * lstAdv1.Items.Count > 0) Then
            Add('  (IDADVOGRECDA ' + sListaIdAdvog1Sel + ') AND');

         If (rgAdv2.ItemIndex * lstAdv2.Items.Count > 0) Then
            Add('  (IDADVOGRECTE ' + sListaIdAdvog2Sel + ') AND');

         If (rgAT.ItemIndex * lstAT.Items.Count > 0) Then
            Add('  (IDASSISTTECN ' + sListaIdATSel + ') AND');

         If (rgVaraJust.ItemIndex * lstVaraJust.Items.Count > 0) Then
            Add('  (PT.IDVARAJUSTICA ' + sListaIdVaraJusticaSel + ') AND');

         If (rgUF.ItemIndex * lstUF.Items.Count > 0) Then
            Add('  (CI.IDESTADO ' + sListaIdUFSel + ') AND');

         If (rgCidade.ItemIndex * lstCidade.Items.Count > 0) Then
            Add('  (PT.IDCIDADES ' +
               FU.IFF(cbxCidadeNegativa.Checked,
               FU.IFF(pos(',', sListaIdCidadesSel) > 0, 'NOT ' + sListaIdCidadesSel, '<> ' + copy(sListaIdCidadesSel, 3, length(sListaIdCidadesSel) - 2)),
               sListaIdCidadesSel) + ') AND');

         If (rgTipoProc.ItemIndex * lstTipoProc.Items.Count > 0) Then
            Add('  (IDTIPOPROC ' + sListaIdTipoProcSel + ') AND');

         If (rgTipoAcao.ItemIndex * lstTipoAcao.Items.Count > 0) Then
            Add('  (IDTIPOACAO ' + sListaIdTipoAcaoSel + ') AND');

         If (rgSentenca.ItemIndex * lstSentenca.Items.Count > 0) Then
            Add('  ((FLGSITPROC = 0) OR (CODTIPOSENT ' + sListaIdSentencaSel + ')) AND');

         If (rgObjeto.ItemIndex * lstObjeto.Items.Count > 0) Then
            Begin
               Add('  (NVL(OBJETOS.TOTALOBJ,0) > 0) AND');
               Add('  (PT.NUMPROCTRAB = OBJETOS.NUMPROCTRAB(+)) AND');
            End;

         If (rgEtapa.ItemIndex * lstEtapa.Items.Count > 0) Then
            If (rgEtapa.ItemIndex = 1) Then
               Add('  (PT.NUMPROCTRAB = ETAPAS.NUMPROCTRAB) AND')
            Else
               Begin
                  Add('  (PT.NUMPROCTRAB = ETAPAS.NUMPROCTRAB) AND');
                  Add('  (NVL(ETAPAS.TOTALETP,0) > 0) AND');
               End;

         //William Santos SOL 116513 KINTANA 547694 - INÍCIO
         If (dtpEtapaIni.Text <> '') Or (dtpEtapaFim.Text <> '') Then
            Add('    (PT.NUMPROCTRAB = ETAPA.NUMPROCTRAB) AND');
         //William Santos SOL 116513 KINTANA 547694 - FIM

         //William Santos / Paulo Nobre KINTANA 546991 SOL 116518 INICIO
         If ((dtpEtapaIni.Text <> '') Or (dtpEtapaFim.Text <> '')) Or
            ((rgEtapa.ItemIndex * lstEtapa.Items.Count > 0)) Then
            Add('  (PT.NUMPROCTRAB = ETAPASRECURSO.NUMPROCTRAB) AND')
         Else
            Add('  (PT.NUMPROCTRAB = ETAPASRECURSO.NUMPROCTRAB(+)) AND');
         //William Santos / Paulo Nobre KINTANA 546991 SOL 116518 FIM
         If (ednAdm1.Value > 0) Then //Tempo de Existencia
            Begin
               Add('  (TO_NUMBER(SUBSTR(TO_CHAR(DECODE(FLGSITPROC, 1, DATAEFETENC, SYSDATE),''DD/MM/YYYY''),7,10)) -');
               Add('   TO_NUMBER(SUBSTR(TO_CHAR(DATANOTIF,''DD/MM/YYYY''),7,10))) * 12 +');
               Add('   TO_NUMBER(SUBSTR(TO_CHAR(DECODE(FLGSITPROC, 1, DATAEFETENC, SYSDATE),''DD/MM/YYYY''),4,2)) -');
               Add('   TO_NUMBER(SUBSTR(TO_CHAR(DATANOTIF,''DD/MM/YYYY''),4,2)) +');
               Add('   DECODE((TO_NUMBER(SUBSTR(TO_CHAR(DECODE(FLGSITPROC, 1, DATAEFETENC, SYSDATE),''DD/MM/YYYY''),1,2)) -');
               Add('   TO_NUMBER(SUBSTR(TO_CHAR(DATANOTIF,''DD/MM/YYYY''),1,2))) /');
               Add('   DECODE(SUBSTR(TO_CHAR(DECODE(FLGSITPROC, 1, DATAEFETENC, SYSDATE),''DD/MM/YYYY''),1,2),');
               Add('   SUBSTR(TO_CHAR(DATANOTIF,''DD/MM/YYYY''),1,2),1,');
               Add('   ABS(TO_NUMBER(SUBSTR(TO_CHAR(DECODE(FLGSITPROC, 1, DATAEFETENC, SYSDATE),''DD/MM/YYYY''),1,2)) -');
               Add('   TO_NUMBER(SUBSTR(TO_CHAR(DATANOTIF,''DD/MM/YYYY''),1,2)))),-1,-1,0)' +
                  ' >= ' + IntToStr(ednAdm1.Value) + ' AND');
            End;

         If (ednAdm2.Value < 999) Then //Tempo de Existencia
            Begin
               Add('  (TO_NUMBER(SUBSTR(TO_CHAR(DECODE(FLGSITPROC, 1, DATAEFETENC, SYSDATE),''DD/MM/YYYY''),7,10)) -');
               Add('   TO_NUMBER(SUBSTR(TO_CHAR(DATANOTIF,''DD/MM/YYYY''),7,10))) * 12 +');
               Add('   TO_NUMBER(SUBSTR(TO_CHAR(DECODE(FLGSITPROC, 1, DATAEFETENC, SYSDATE),''DD/MM/YYYY''),4,2)) -');
               Add('   TO_NUMBER(SUBSTR(TO_CHAR(DATANOTIF,''DD/MM/YYYY''),4,2)) +');
               Add('   DECODE((TO_NUMBER(SUBSTR(TO_CHAR(DECODE(FLGSITPROC, 1, DATAEFETENC, SYSDATE),''DD/MM/YYYY''),1,2)) -');
               Add('   TO_NUMBER(SUBSTR(TO_CHAR(DATANOTIF,''DD/MM/YYYY''),1,2))) /');
               Add('   DECODE(SUBSTR(TO_CHAR(DECODE(FLGSITPROC, 1, DATAEFETENC, SYSDATE),''DD/MM/YYYY''),1,2),');
               Add('   SUBSTR(TO_CHAR(DATANOTIF,''DD/MM/YYYY''),1,2),1,');
               Add('   ABS(TO_NUMBER(SUBSTR(TO_CHAR(DECODE(FLGSITPROC, 1, DATAEFETENC, SYSDATE),''DD/MM/YYYY''),1,2)) -');
               Add('   TO_NUMBER(SUBSTR(TO_CHAR(DATANOTIF,''DD/MM/YYYY''),1,2)))),-1,-1,0)' +
                  ' <= ' + IntToStr(ednAdm2.Value) + ' AND');
            End;

         If (rgInstancia.ItemIndex > 0) Then
            Begin
               Case (rgInstancia.ItemIndex) Of
                  1: Add('  (PROCJCJNUM IS NOT NULL AND PROCTRTNUM IS NULL AND ' +
                        'PROCTSTNUM IS NULL AND NUMPROCEXEC IS NULL) AND');
                  2: Add('  (PROCJCJNUM IS NOT NULL AND PROCTRTNUM IS NOT NULL AND ' +
                        'PROCTSTNUM IS NULL AND NUMPROCEXEC IS NULL) AND');
                  3: Add('  (PROCJCJNUM IS NOT NULL AND PROCTRTNUM IS NOT NULL AND ' +
                        'PROCTSTNUM IS NOT NULL AND NUMPROCEXEC IS NULL) AND');
                  4: Add('  (NUMPROCEXEC IS NOT NULL) AND');
               End;
            End;

         If (rgParte.ItemIndex < 3) Then
            Begin
               Case (rgParte.ItemIndex) Of
                  0: Add('  (FLGPARTEATIVA = 1) AND');
                  1: Add('  (FLGPARTEATIVA = 0) AND');
                  2: Add('  (FLGPARTEATIVA = 2) AND');
               End;
            End;

         If (StrToFloat(ednNum1.Text) > 0) Then
            Add('  (PT.NUMPROCTRAB >= ' + ednNum1.Text + ') AND');

         If (ednNum2.Text <> '9999999999') Then
            Add('  (PT.NUMPROCTRAB <= ' + ednNum2.Text + ') AND');

         If (StrToFloat(ednCus1.Text) > 0) Then
            Add('  (PT.CUSTOPROC >= ' + ednCus1.Text + ') AND');

         If (ednCus2.Text <> '9999999999') Then
            Add('  (PT.CUSTOPROC <= ' + ednCus2.Text + ') AND');

         sSQL := CMSqlText.SQL[Count - 1];
         If (UpperCase(Copy(sSQL, Length(sSQL) - 2, 3)) = 'AND') Then
            Begin
               sSQL := Copy(sSQL, 1, Length(sSQL) - 4);
               CMSqlText.SQL[Count - 1] := sSQL;
            End;

         Add('ORDER BY ' + ORDEM_DADOS[0]);

      End;

   RESULT := CMSqlText.SQL.GetText;

End;

Function TfrmSelProcessoCons.CarregaEtapa: String;
Var
   sListaIdTipoProcSel, sListaIdTipoAcaoSel, sListaIdAdvog1Sel, sListaIdAdvogCasaSel,
      sListaIdAdvog2Sel, sListaIdATSel, sListaIdVaraJusticaSel, sListaIdUFSel,
      sListaIdCidadesSel, sListaIdObjetoSel, sListaIdSentencaSel, // timão
   sListaIdPlanoSel, sListaIdPatroSel, sListaIdCargoSel, sListaIdEstabSel,
      sListaIdSindicSel: String;
Begin
   // Cria a lista de IDs dos Tipos de Processo selecionados
   //William M. Santos - SOL 122896 KINTANA - 609811 - INI
   sListaIdTipoProcSel := GerarParamSELECT(rgTipoProc, lstCodTipoProc, lstTipoProc);
   //William M. Santos - SOL 122896 KINTANA - 609811 - FIM
   // Cria a lista de IDs dos Tipos de Ação em Processos selecionados
   sListaIdTipoAcaoSel := GerarParamSELECT(rgTipoAcao, lstCodTipoAcao, lstTipoAcao);

   // Cria a lista de IDs dos Advogados Contratados selecionados
   sListaIdAdvog1Sel := GerarParamSELECT(rgAdv1, lstCodAdv1, lstAdv1);

   // Cria a lista de IDs dos Advogados da Casa selecionados
   sListaIdAdvogCasaSel := GerarParamSELECT(rgAdvC, lstCodAdvC, lstAdvC);

   // Cria a lista de IDs dos Advogados da Contraparte selecionados
   sListaIdAdvog2Sel := GerarParamSELECT(rgAdv2, lstCodAdv2, lstAdv2);

   // Cria a lista de IDs dos Assistentes Técnicos selecionados
   sListaIdATSel := GerarParamSELECT(rgAT, lstCodAT, lstAT);

   // Cria a lista de IDs das Varas de Justiça selecionadas
   sListaIdVaraJusticaSel := GerarParamSELECT(rgVaraJust, lstCodVaraJust, lstVaraJust);

   // Cria a lista de IDs das UFs selecionadas
   sListaIdUFSel := GerarParamSELECT(rgUF, lstCodUF, lstUF);

   // Cria a lista de IDs das Cidades selecionadas
   sListaIdCidadesSel := GerarParamSELECT(rgCidade, lstCodCidade, lstCidade);

   // Cria a lista de IDs dos Objetos selecionados
   sListaIdObjetoSel := GerarParamSELECT(rgObjeto, lstCodObjeto, lstObjeto);

   // Cria a lista de IDs das Sentenças selecionadas
   sListaIdSentencaSel := GerarParamSELECT(rgSentenca, lstCodSentenca, lstSentenca);

   // Cria a lista de IDs das Etapas selecionadas
   sListaIdEtapaSel := GerarParamSELECT(rgEtapa, lstCodEtapa, lstEtapa);

   With (CMSqlTextEtapa.Sql) Do
      Begin
         Clear;
         //Wiliam M. Santos - SOL 124766 - KINTANA 637518 - INI
         Add('SELECT DISTINCT');
         Add('  ETAPASRECURSO.CODTIPORECURSO, ETAPASRECURSO.NUMSEQ, ETAPASRECURSO.VALORREC, ETAPASRECURSO.DATAREALOCOR, ');
         Add('  ETAPASRECURSO.FLGVALORABATE, ETAPASRECURSO.ASSUNTO, ETAPASRECURSO.DATAPREVOCORR, ETAPASRECURSO.VALORCUSTAS, ');
         Add('  PT.NUMPROCTRAB, PT.TAXAJUROS, ');
         Add('  TR.DESCRICAO, TR.INDJUROS, TR.TAXAJUROS AS JUROSETAPA, TR.MOECODIGO AS INDICETAPA'); //William Santos / Paulo Nobre KINTANA 763777 SOL 132498
         //Wiliam M. Santos - SOL 124766 - KINTANA 637518 - FIM
         Add('FROM');
         Add('  PROCESSOTRAB PT, CIDADES CI, VARAJUSTICA VJ, TIPORECTRAB TR, ');
         //--------------------------------------------------------------------------
         Add('  (SELECT DISTINCT');
         Add('     P.NOME, P.TIPO, P.NUMDOCUMENTO, P.IDPESSOA, PF.IDSINDICATO,');
         Add('     PF.IDFONTRECR, PF.IDGRINSTR, PF.IDPROFISS,');
         Add('     PF.DATANASC, PF.SEXO, PF.ESTCIVIL, PF.NUMDEPIRRF, PF.NUMDEPSALF,');
         Add('     PF.NUMDEPTOT, PF.FLGISENTOIRRF, PF.CORPESSOA, PF.FLGDEFICIENTE,');
         Add('     CI.NOME AS CIDADE, E.LOGRADOURO, E.CODESTADO, E.NUMERO,');
         Add('     E.COMPLEMENTO, E.BAIRRO, E.CEP,');

         Add('     ('' '') AS DATADEMISSAO, ('' '') AS DATAADMISSAO, 0 AS IDPESSJUR');

         Add('   FROM');
         Add('     PESSOA P, PESSOAFISICA PF, ENDPESS E, CIDADES CI, PROCESSOTRAB PT');

         Add('   WHERE');
         If (Not cbxMat1.Checked) Then
            Add('     (PT.INDMATERIA     <> 1) AND');
         If (Not cbxMat2.Checked) Then
            Add('     (PT.INDMATERIA     <> 2) AND');
         If (Not cbxMat3.Checked) Then
            Add('     (PT.INDMATERIA     <> 3) AND');
         If (Not cbxMat4.Checked) Then
            Add('     (PT.INDMATERIA     <> 4) AND');
         If (Not cbxMat5.Checked) Then
            Add('     (PT.INDMATERIA     <> 5) AND');
         If (Not cbxMat6.Checked) Then
            Add('     (PT.INDMATERIA     <> 6) AND');
         If (Not cbxMat7.Checked) Then
            Add('     (PT.INDMATERIA     <> 7) AND');
         Add('     (PT.IDRECLAMANTE    = P.IDPESSOA) AND');
         Add('     (P.IDENDRESIDENCIAL = E.IDENDERECO(+)) AND');
         Add('     (E.IDCIDADES        = CI.IDCIDADES(+)) AND');
         Add('     (P.IDPESSOA         = PF.IDPESSOA(+)) AND');

         sSQL := CMSqlTextEtapa.SQL[Count - 1];
         If (UpperCase(Copy(sSQL, Length(sSQL) - 2, 3)) = 'AND') Then
            Begin
               sSQL := Copy(sSQL, 1, Length(sSQL) - 4);
               CMSqlTextEtapa.SQL[Count - 1] := sSQL;
            End;

         Add('  ) RECLAMANTES');
         //--------------------------------------------------------------------------

         If (rgObjeto.ItemIndex * lstObjeto.Items.Count > 0) Then
            Begin
               Add('     ,(SELECT NUMPROCTRAB, COUNT(*) AS TOTALOBJ');
               Add('       FROM   OBJPROCTRAB');
               Add('       WHERE  (CODTIPOOBJETO ' + sListaIdObjetoSel + ')');
               Add('       GROUP BY NUMPROCTRAB) OBJETOS');
            End;

         If (rgEtapa.ItemIndex * lstEtapa.Items.Count > 0) Then
            Begin
               If (rgEtapa.ItemIndex = 1) Then
                  Begin
                     Add('     ,(SELECT NUMPROCTRAB');
                     Add('       FROM   ETAPAPROCTRAB');
                     Add('       WHERE  (CODTIPORECURSO ' + sListaIdEtapaSel + ') AND');
                     Add('              (DATAREALOCOR  <= SYSDATE) AND');
                     Add('              (DATAREALOCOR   = (SELECT MAX(DATAREALOCOR)');
                     Add('                                 FROM   ETAPAPROCTRAB E');
                     Add('                                 WHERE  (E.NUMPROCTRAB = ETAPAPROCTRAB.NUMPROCTRAB)');
                     Add('                                 GROUP BY NUMPROCTRAB))) ETAPAS');
                  End
               Else
                  Begin
                     Add('     ,(SELECT NUMPROCTRAB, COUNT(*) AS TOTALETP');
                     Add('       FROM   ETAPAPROCTRAB');
                     Add('       WHERE  (CODTIPORECURSO ' + sListaIdEtapaSel + ')');
                     Add('       GROUP BY NUMPROCTRAB) ETAPAS');
                  End;
            End;

         //William Santos SOL 116513 KINTANA 547694 - INÍCIO
         If (dtpEtapaIni.Text <> '') Or (dtpEtapaFim.Text <> '') Then
            Begin
               Add('       ,(SELECT NUMPROCTRAB');
               Add('         FROM ETAPAPROCTRAB');
               Add('         WHERE  DATAREALOCOR >= TO_DATE(' + QuotedStr(dtpEtapaIni.Text) + ',''DD/MM/YYYY'') AND');
               Add('                DATAREALOCOR <= TO_DATE(' + QuotedStr(dtpEtapaFim.Text) + ',''DD/MM/YYYY'')) ETAPA');
            End;
         //William Santos SOL 116513 KINTANA 547694 - FIM

         //William Santos / Paulo Nobre KINTANA 546991 SOL 116518 INÍCIO

         If ((dtpEtapaIni.Text <> '') Or (dtpEtapaFim.Text <> '')) Or
            ((rgEtapa.ItemIndex * lstEtapa.Items.Count > 0)) Then
            Begin

               //William Santos / Paulo Nobre KINTANA 546991 SOL 116518 INÍCIO

               Add('          ,(SELECT E1.NUMPROCTRAB, E1.NUMSEQ, E1.CODTIPORECURSO, E1.NUMSEQVINC , E1.VALORREC, E1.DATAREALOCOR, E1.DATAPREVOCORR, E1.VALORCUSTAS, E1.FLGVALORABATE, E1.ASSUNTO'); //William Santos / Paulo Nobre KINTANA 763777 SOL 132498
               Add('            FROM ETAPAPROCTRAB E1');
               Add('            WHERE  NOT EXISTS (SELECT 1');
               Add('                               FROM ETAPAPROCTRAB E2');
               Add('                               WHERE E2.CODTIPORECURSO = 1034');
               Add('                               AND E2.NUMSEQVINC     > 0');
               Add('                               AND E2.NUMSEQVINC     = E1.NUMSEQ');
               Add('                               AND E2.NUMPROCTRAB    = E1.NUMPROCTRAB)');

               //Wiliam M. Santos - SOL 124766 - KINTANA 637518 - INI
               //Add('            AND E1.CODTIPORECURSO <> 1034');
               Add('              AND E1.NUMSEQVINC = 0');

               If (dtpEtapaIni.Text <> '') Or (dtpEtapaFim.Text <> '') Then
                  Begin
                     Add('      AND  (E1.DATAREALOCOR >= TO_DATE(' + QuotedStr(dtpEtapaIni.Text) + ',''DD/MM/YYYY'') ');
                     Add('      AND   E1.DATAREALOCOR <= TO_DATE(' + QuotedStr(dtpEtapaFim.Text) + ',''DD/MM/YYYY''))   ');
                  End;
               //Wiliam M. Santos - SOL 124766 - KINTANA 637518 - FIM

               If (rgEtapa.ItemIndex * lstEtapa.Items.Count > 0) Then
                  Add('         AND E1.CODTIPORECURSO ' + sListaIdEtapaSel + ') ETAPASRECURSO')
               Else
                  Add('                                                       ) ETAPASRECURSO')
                     //William Santos / Paulo Nobre KINTANA 546991 SOL 116518 FIM
            End
         Else
            Begin

               Add('          ,(SELECT E1.NUMPROCTRAB, E1.NUMSEQ, E1.CODTIPORECURSO, E1.NUMSEQVINC , E1.VALORREC, E1.DATAREALOCOR, E1.DATAPREVOCORR, E1.VALORCUSTAS, E1.FLGVALORABATE, E1.ASSUNTO'); //William Santos / Paulo Nobre KINTANA 763777 SOL 132498
               Add('            FROM ETAPAPROCTRAB E1');
               If (dtpEtapaIni.Text <> '') Or (dtpEtapaFim.Text <> '') Then
                  Begin
                     Add('      AND  (E1.DATAREALOCOR >= TO_DATE(' + QuotedStr(dtpEtapaIni.Text) + ',''DD/MM/YYYY'') ');
                     Add('      AND   E1.DATAREALOCOR <= TO_DATE(' + QuotedStr(dtpEtapaFim.Text) + ',''DD/MM/YYYY''))   ');
                  End;
               //Wiliam M. Santos - SOL 124766 - KINTANA 637518 - FIM

               If (rgEtapa.ItemIndex * lstEtapa.Items.Count > 0) Then
                  Add('         AND E1.CODTIPORECURSO ' + sListaIdEtapaSel + ') ETAPASRECURSO')
               Else
                  Add('                                                       ) ETAPASRECURSO');
            End;

         Add('WHERE');
         If (Not cbxMat1.Checked) Then
            Add('     (PT.INDMATERIA     <> 1) AND');
         If (Not cbxMat2.Checked) Then
            Add('     (PT.INDMATERIA     <> 2) AND');
         If (Not cbxMat3.Checked) Then
            Add('     (PT.INDMATERIA     <> 3) AND');
         If (Not cbxMat4.Checked) Then
            Add('     (PT.INDMATERIA     <> 4) AND');
         If (Not cbxMat5.Checked) Then
            Add('     (PT.INDMATERIA     <> 5) AND');
         If (Not cbxMat6.Checked) Then
            Add('     (PT.INDMATERIA     <> 6) AND');
         If (Not cbxMat7.Checked) Then
            Add('     (PT.INDMATERIA     <> 7) AND');
         Add('  (PT.IDRECLAMANTE  = RECLAMANTES.IDPESSOA) AND');

         //William Santos  KINTANA 604039 SOL 122631 INI
         //Join com as tabelas adicionadas.
         If (rgEtapa.ItemIndex * lstEtapa.Items.Count > 0) Then
            Add(' (TR.CODTIPORECURSO ' + sListaIdEtapaSel + ') AND');

         Add('  (ETAPASRECURSO.CODTIPORECURSO = TR.CODTIPORECURSO) AND');

         //Wiliam M. Santos - SOL 124766 - KINTANA 637518 - INI
         // Add('  (ETP.CODTIPORECURSO = TR.CODTIPORECURSO) AND');
         // Add('  (PT.NUMPROCTRAB = ETP.NUMPROCTRAB) AND      ');
         //Wiliam M. Santos - SOL 124766 - KINTANA 637518 - FIM

          //William Santos  KINTANA 604039 SOL 122631 FIM

         Add('  (PT.IDVARAJUSTICA = VJ.IDVARAJUSTICA(+)) AND');
         Add('  (PT.IDCIDADES     = CI.IDCIDADES(+)) AND');

         If (EdDataInc1.Text <> '') Then
            Add('  (TRUNC(PT.TRGDTINCLUSAO) >= TO_DATE(' + QuotedStr(EdDataInc1.Text) + ',''DD/MM/YYYY'')) AND');

         If (EdDataInc2.Text <> '') Then
            Add('  (TRUNC(PT.TRGDTINCLUSAO) <= TO_DATE(' + QuotedStr(EdDataInc2.Text) + ',''DD/MM/YYYY'')) AND');

         If (EdDataAju1.Text <> '') Then
            Add('  (PT.DATAJUIZO >= TO_DATE(' + QuotedStr(EdDataAju1.Text) + ',''DD/MM/YYYY'')) AND');

         If (EdDataAju2.Text <> '') Then
            Add('  (PT.DATAJUIZO <= TO_DATE(' + QuotedStr(EdDataAju2.Text) + ',''DD/MM/YYYY'')) AND');

         If (EdDataNot1.Text <> '') Then
            Add('  (PT.DATANOTIF >= TO_DATE(' + QuotedStr(EdDataNot1.Text) + ',''DD/MM/YYYY'')) AND');

         If (EdDataNot2.Text <> '') Then
            Add('  (PT.DATANOTIF <= TO_DATE(' + QuotedStr(EdDataNot2.Text) + ',''DD/MM/YYYY'')) AND');

         If (rgSitProc.ItemIndex < 2) Then
            Add('  (FLGSITPROC = ' + IntToStr(rgSitProc.ItemIndex) + ') AND');

         If (rgSitProc.ItemIndex > 0) And ((EdDataEnc1.Text <> '') Or (EdDataEnc2.Text <> '')) Then
            Begin
               sSQL := '  (FLGSITPROC = 0 OR ';

               If (EdDataEnc1.Text <> '') Then
                  Begin
                     If (EdDataEnc2.Text <> '') Then
                        sSQL := sSQL + '(';

                     sSQL := sSQL + '(PT.DATAEFETENC >= TO_DATE(''' +
                        EdDataEnc1.Text + ''',''DD/MM/YYYY''))';
                  End;

               If (EdDataEnc2.Text <> '') Then
                  Begin
                     If (EdDataEnc1.Text <> '') Then
                        sSQL := sSQL + ' AND ';

                     sSQL := sSQL + '(PT.DATAEFETENC <= TO_DATE(''' +
                        EdDataEnc2.Text + ''',''DD/MM/YYYY''))';

                     If (EdDataEnc1.Text <> '') Then
                        sSQL := sSQL + ')';
                  End;

               Add(sSQL + ') AND');
            End;

         If (rgSitProc.ItemIndex > 0) Then
            Begin
               If Not (cbxArquiv.Checked) Then
                  Add('  (FLGSITPROC = 0 or TIPOENCER <> ''A'') AND');
               If Not (cbxAcordo.Checked) Then
                  Add('  (FLGSITPROC = 0 or TIPOENCER <> ''C'') AND');
               If Not (cbxDesist.Checked) Then
                  Add('  (FLGSITPROC = 0 or TIPOENCER <> ''D'') AND');
               If Not (cbxSent.Checked) Then
                  Add('  (FLGSITPROC = 0 or TIPOENCER <> ''S'') AND');
            End;

         If (rgAdvC.ItemIndex * lstAdvC.Items.Count > 0) Then
            Add('  (IDADVOGCASA ' + sListaIdAdvogCasaSel + ') AND');

         If (rgAdv1.ItemIndex * lstAdv1.Items.Count > 0) Then
            Add('  (IDADVOGRECDA ' + sListaIdAdvog1Sel + ') AND');

         If (rgAdv2.ItemIndex * lstAdv2.Items.Count > 0) Then
            Add('  (IDADVOGRECTE ' + sListaIdAdvog2Sel + ') AND');

         If (rgAT.ItemIndex * lstAT.Items.Count > 0) Then
            Add('  (IDASSISTTECN ' + sListaIdATSel + ') AND');

         If (rgVaraJust.ItemIndex * lstVaraJust.Items.Count > 0) Then
            Add('  (PT.IDVARAJUSTICA ' + sListaIdVaraJusticaSel + ') AND');

         If (rgUF.ItemIndex * lstUF.Items.Count > 0) Then
            Add('  (CI.IDESTADO ' + sListaIdUFSel + ') AND');

         If (rgCidade.ItemIndex * lstCidade.Items.Count > 0) Then
            Add('  (PT.IDCIDADES ' +
               FU.IFF(cbxCidadeNegativa.Checked,
               FU.IFF(pos(',', sListaIdCidadesSel) > 0, 'NOT ' + sListaIdCidadesSel, '<> ' + copy(sListaIdCidadesSel, 3, length(sListaIdCidadesSel) - 2)),
               sListaIdCidadesSel) + ') AND');

         If (rgTipoProc.ItemIndex * lstTipoProc.Items.Count > 0) Then
            Add('  (IDTIPOPROC ' + sListaIdTipoProcSel + ') AND');

         If (rgTipoAcao.ItemIndex * lstTipoAcao.Items.Count > 0) Then
            Add('  (IDTIPOACAO ' + sListaIdTipoAcaoSel + ') AND');

         If (rgSentenca.ItemIndex * lstSentenca.Items.Count > 0) Then
            Add('  ((FLGSITPROC = 0) OR (CODTIPOSENT ' + sListaIdSentencaSel + ')) AND');

         If (rgObjeto.ItemIndex * lstObjeto.Items.Count > 0) Then
            Begin
               Add('  (NVL(OBJETOS.TOTALOBJ,0) > 0) AND');
               Add('  (PT.NUMPROCTRAB = OBJETOS.NUMPROCTRAB(+)) AND');
            End;

         If (rgEtapa.ItemIndex * lstEtapa.Items.Count > 0) Then
            If (rgEtapa.ItemIndex = 1) Then
               Add('  (PT.NUMPROCTRAB = ETAPAS.NUMPROCTRAB) AND')
            Else
               Begin
                  Add('  (PT.NUMPROCTRAB = ETAPAS.NUMPROCTRAB) AND');
                  Add('  (NVL(ETAPAS.TOTALETP,0) > 0) AND');
               End;

         //William Santos SOL 116513 KINTANA 547694 - INÍCIO
         If (dtpEtapaIni.Text <> '') Or (dtpEtapaFim.Text <> '') Then
            Add('    (PT.NUMPROCTRAB = ETAPA.NUMPROCTRAB) AND');
         //William Santos SOL 116513 KINTANA 547694 - FIM

         //William Santos / Paulo Nobre KINTANA 546991 SOL 116518 INICIO
         If ((dtpEtapaIni.Text <> '') Or (dtpEtapaFim.Text <> '')) Or
            ((rgEtapa.ItemIndex * lstEtapa.Items.Count > 0)) Then
            Add('  (PT.NUMPROCTRAB = ETAPASRECURSO.NUMPROCTRAB) AND')
         Else
            Add('  (PT.NUMPROCTRAB = ETAPASRECURSO.NUMPROCTRAB(+)) AND');
         //William Santos / Paulo Nobre KINTANA 546991 SOL 116518 FIM
         If (ednAdm1.Value > 0) Then //Tempo de Existencia
            Begin
               Add('  (TO_NUMBER(SUBSTR(TO_CHAR(DECODE(FLGSITPROC, 1, DATAEFETENC, SYSDATE),''DD/MM/YYYY''),7,10)) -');
               Add('   TO_NUMBER(SUBSTR(TO_CHAR(DATANOTIF,''DD/MM/YYYY''),7,10))) * 12 +');
               Add('   TO_NUMBER(SUBSTR(TO_CHAR(DECODE(FLGSITPROC, 1, DATAEFETENC, SYSDATE),''DD/MM/YYYY''),4,2)) -');
               Add('   TO_NUMBER(SUBSTR(TO_CHAR(DATANOTIF,''DD/MM/YYYY''),4,2)) +');
               Add('   DECODE((TO_NUMBER(SUBSTR(TO_CHAR(DECODE(FLGSITPROC, 1, DATAEFETENC, SYSDATE),''DD/MM/YYYY''),1,2)) -');
               Add('   TO_NUMBER(SUBSTR(TO_CHAR(DATANOTIF,''DD/MM/YYYY''),1,2))) /');
               Add('   DECODE(SUBSTR(TO_CHAR(DECODE(FLGSITPROC, 1, DATAEFETENC, SYSDATE),''DD/MM/YYYY''),1,2),');
               Add('   SUBSTR(TO_CHAR(DATANOTIF,''DD/MM/YYYY''),1,2),1,');
               Add('   ABS(TO_NUMBER(SUBSTR(TO_CHAR(DECODE(FLGSITPROC, 1, DATAEFETENC, SYSDATE),''DD/MM/YYYY''),1,2)) -');
               Add('   TO_NUMBER(SUBSTR(TO_CHAR(DATANOTIF,''DD/MM/YYYY''),1,2)))),-1,-1,0)' +
                  ' >= ' + IntToStr(ednAdm1.Value) + ' AND');
            End;

         If (ednAdm2.Value < 999) Then //Tempo de Existencia
            Begin
               Add('  (TO_NUMBER(SUBSTR(TO_CHAR(DECODE(FLGSITPROC, 1, DATAEFETENC, SYSDATE),''DD/MM/YYYY''),7,10)) -');
               Add('   TO_NUMBER(SUBSTR(TO_CHAR(DATANOTIF,''DD/MM/YYYY''),7,10))) * 12 +');
               Add('   TO_NUMBER(SUBSTR(TO_CHAR(DECODE(FLGSITPROC, 1, DATAEFETENC, SYSDATE),''DD/MM/YYYY''),4,2)) -');
               Add('   TO_NUMBER(SUBSTR(TO_CHAR(DATANOTIF,''DD/MM/YYYY''),4,2)) +');
               Add('   DECODE((TO_NUMBER(SUBSTR(TO_CHAR(DECODE(FLGSITPROC, 1, DATAEFETENC, SYSDATE),''DD/MM/YYYY''),1,2)) -');
               Add('   TO_NUMBER(SUBSTR(TO_CHAR(DATANOTIF,''DD/MM/YYYY''),1,2))) /');
               Add('   DECODE(SUBSTR(TO_CHAR(DECODE(FLGSITPROC, 1, DATAEFETENC, SYSDATE),''DD/MM/YYYY''),1,2),');
               Add('   SUBSTR(TO_CHAR(DATANOTIF,''DD/MM/YYYY''),1,2),1,');
               Add('   ABS(TO_NUMBER(SUBSTR(TO_CHAR(DECODE(FLGSITPROC, 1, DATAEFETENC, SYSDATE),''DD/MM/YYYY''),1,2)) -');
               Add('   TO_NUMBER(SUBSTR(TO_CHAR(DATANOTIF,''DD/MM/YYYY''),1,2)))),-1,-1,0)' +
                  ' <= ' + IntToStr(ednAdm2.Value) + ' AND');
            End;

         If (rgInstancia.ItemIndex > 0) Then
            Begin
               Case (rgInstancia.ItemIndex) Of
                  1: Add('  (PROCJCJNUM IS NOT NULL AND PROCTRTNUM IS NULL AND ' +
                        'PROCTSTNUM IS NULL AND NUMPROCEXEC IS NULL) AND');
                  2: Add('  (PROCJCJNUM IS NOT NULL AND PROCTRTNUM IS NOT NULL AND ' +
                        'PROCTSTNUM IS NULL AND NUMPROCEXEC IS NULL) AND');
                  3: Add('  (PROCJCJNUM IS NOT NULL AND PROCTRTNUM IS NOT NULL AND ' +
                        'PROCTSTNUM IS NOT NULL AND NUMPROCEXEC IS NULL) AND');
                  4: Add('  (NUMPROCEXEC IS NOT NULL) AND');
               End;
            End;

         If (rgParte.ItemIndex < 3) Then
            Begin
               Case (rgParte.ItemIndex) Of
                  0: Add('  (FLGPARTEATIVA = 1) AND');
                  1: Add('  (FLGPARTEATIVA = 0) AND');
                  2: Add('  (FLGPARTEATIVA = 2) AND');
               End;
            End;

         If (StrToFloat(ednNum1.Text) > 0) Then
            Add('  (PT.NUMPROCTRAB >= ' + ednNum1.Text + ') AND');

         If (ednNum2.Text <> '9999999999') Then
            Add('  (PT.NUMPROCTRAB <= ' + ednNum2.Text + ') AND');

         If (StrToFloat(ednCus1.Text) > 0) Then
            Add('  (PT.CUSTOPROC >= ' + ednCus1.Text + ') AND');

         If (ednCus2.Text <> '9999999999') Then
            Add('  (PT.CUSTOPROC <= ' + ednCus2.Text + ') AND');

         sSQL := CMSqlTextEtapa.SQL[Count - 1];
         If (UpperCase(Copy(sSQL, Length(sSQL) - 2, 3)) = 'AND') Then
            Begin
               sSQL := Copy(sSQL, 1, Length(sSQL) - 4);
               CMSqlTextEtapa.SQL[Count - 1] := sSQL;
            End;

         // Add('ORDER BY ' + ORDEM_DADOS[0]);
         Add('ORDER BY ETAPASRECURSO.NUMSEQ');
      End;

   Result := CMSqlTextEtapa.SQL.GetText;

End;

Procedure TfrmSelProcessoCons.EdnNum2Exit(Sender: TObject);
Begin
   Inherited;
{   If (StrToFloat(ednNum1.Text) > StrToFloat(ednNum2.Text)) Then
      Begin
         MsgDlg('Primeiro campo não pode ser maior que o Segundo campo !', 'Aviso', mtInformation, [mbOk], 0);
         ednNum1.SelectAll;
         ednNum1.setfocus;
      End;}
End;

End.

