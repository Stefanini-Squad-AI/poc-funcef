unit FCadParamContabMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Mask,
  DBCtrls, Wwdotdot, Wwdbcomb, wwdbdatetimepicker, CMDateTimePicker,
  wwdbedit, Wwdbspin, wwdblook, ComCtrls,uCtrlParamContab,uCtrlContab,
  CMProcuraMask,uCtrlListTerceiros,uCtrlHistoContab,uCtrlPlano, uCmSqlParams,
  uCtrlProcessaContab, uCMTypes, CMDBLookupCombo;

type
  TfrmCadParamContabMT = class(TFrmCadastroMT)
    pgc: TPageControl;
    tbs1: TTabSheet;
    Label1: TLabel;
    gbMoedas: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    dblkMoedaGer1: TwwDBLookupCombo;
    dblkMoedaOfi: TwwDBLookupCombo;
    dblkMoedaGer2: TwwDBLookupCombo;
    dblkMoedaGer3: TwwDBLookupCombo;
    dblkPlano: TwwDBLookupCombo;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label7: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    Label6: TLabel;
    Label11: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    Label28: TLabel;
    dbseAtivoIni: TwwDBSpinEdit;
    dbseAtivoFim: TwwDBSpinEdit;
    dbsePassivoIni: TwwDBSpinEdit;
    dbsePassivoFim: TwwDBSpinEdit;
    dbseDespesaIni: TwwDBSpinEdit;
    dbseDespesaFim: TwwDBSpinEdit;
    dbseReceitaIni: TwwDBSpinEdit;
    dbseReceitaFim: TwwDBSpinEdit;
    dbseCustoIni: TwwDBSpinEdit;
    dbseCustoFim: TwwDBSpinEdit;
    dbseOutrosini: TwwDBSpinEdit;
    dbseOutrosfim: TwwDBSpinEdit;
    dbseEstatisticaIni: TwwDBSpinEdit;
    dbseEstatisticaFim: TwwDBSpinEdit;
    GroupBox7: TGroupBox;
    dbedsub1: TwwDBEdit;
    dbedsub2: TwwDBEdit;
    dbedsub3: TwwDBEdit;
    dbedsub4: TwwDBEdit;
    gbFechamento: TGroupBox;
    lblDataUltFecha: TLabel;
    dbrgTipoFecha: TDBRadioGroup;
    dbedDataUltFecha: TCMDateTimePicker;
    tbs2: TTabSheet;
    grbPla: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    dbcbDebCre: TwwDBComboBox;
    dbcbTotDig: TwwDBComboBox;
    GroupBox9: TGroupBox;
    Label26: TLabel;
    Label27: TLabel;
    Label15: TLabel;
    Label29: TLabel;
    dblkTipOperLancam: TwwDBLookupCombo;
    dblkTipOperMoeda: TwwDBLookupCombo;
    dblkTipOperResult: TwwDBLookupCombo;
    dblkTipOperImport: TwwDBLookupCombo;
    GroupBox3: TGroupBox;
    Label14: TLabel;
    Label20: TLabel;
    Label24: TLabel;
    Label33: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label46: TLabel;
    chkCorrespond: TDBCheckBox;
    chkNatureza: TDBCheckBox;
    chkData: TDBCheckBox;
    dbeExercicio: TwwDBEdit;
    chkDocumento: TDBCheckBox;
    chkAtivProj: TDBCheckBox;
    chkTipOper: TDBCheckBox;
    chkVerificaPrePronta: TDBCheckBox;
    dbcbNumPlanil: TwwDBComboBox;
    dbcbCadConta: TwwDBComboBox;
    dbcbSubConta: TwwDBComboBox;
    chkEstorno: TDBCheckBox;
    chkDobrada: TDBCheckBox;
    chkHisto: TDBCheckBox;
    chkMantem: TDBCheckBox;
    CMDateTimePicker1: TCMDateTimePicker;
    chkPermiteZero: TDBCheckBox;
    chkHistCaixaAlta: TDBCheckBox;
    tbs3: TTabSheet;
    Label38: TLabel;
    Bevel1: TBevel;
    dblkHistorico: TwwDBLookupCombo;
    pcAtualAnterior: TPageControl;
    tbsAtual: TTabSheet;
    tbsAnterior: TTabSheet;
    cdsTipoLanc: TCMClientDataSet;
    cdsTipoAtuaMoeda: TCMClientDataSet;
    cmpConta1: TCMProcuraMaskContabil;
    cmpConta2: TCMProcuraMaskContabil;
    cmpConta3: TCMProcuraMaskContabil;
    cmpConta4: TCMProcuraMaskContabil;
    cmpConta5: TCMProcuraMaskContabil;
    cmpConta6: TCMProcuraMaskContabil;
    cmpConta7: TCMProcuraMaskContabil;
    cmpConta8: TCMProcuraMaskContabil;
    cmpConta9: TCMProcuraMaskContabil;
    cmpConta10: TCMProcuraMaskContabil;
    cmpConta11: TCMProcuraMaskContabil;
    cmpConta12: TCMProcuraMaskContabil;
    cmpConta13: TCMProcuraMaskContabil;
    cmpConta14: TCMProcuraMaskContabil;
    cdsMoedaOfi: TCMClientDataSet;
    cdsMoedaGen1: TCMClientDataSet;
    cdsMoedaGen2: TCMClientDataSet;
    cdsMoedaGen3: TCMClientDataSet;
    cdsTipoOperContas: TCMClientDataSet;
    cdsTipoOperImp: TCMClientDataSet;
    cdsHistorico: TCMClientDataSet;
    cdsPlanoContas: TCMClientDataSet;
    Bevel2: TBevel;
    TabSheet1: TTabSheet;
    GroupBox4: TGroupBox;
    cmpConta15: TCMProcuraMaskContabil;
    cmpConta16: TCMProcuraMaskContabil;
    sqlPla: TCMSqlParams;
    lblPla: TLabel;
    cdsPla: TCMClientDataSet;
    DBCheckBox1: TDBCheckBox;
    Label21: TLabel;
    DBCFlgSeq: TDBCheckBox;
    qryaux: TCMSqlParams;
    cdsaux: TCMClientDataSet;
    GroupBox1: TGroupBox;
    Label30: TLabel;
    Label31: TLabel;
    cdsPlanoPrev: TCMClientDataSet;
    cdsPatro: TCMClientDataSet;
    lkPATRO: TCMDBLookupCombo;
    lkPlanoprev: TCMDBLookupCombo;
    dbchkUsaSproc: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure dbrgTipoFechaChange(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmpConta1Exit(Sender: TObject);
    procedure cmpConta2Exit(Sender: TObject);
    procedure cmpConta3Exit(Sender: TObject);
    procedure cmpConta4Exit(Sender: TObject);
    procedure cmpConta5Exit(Sender: TObject);
    procedure cmpConta6Exit(Sender: TObject);
    procedure cmpConta7Exit(Sender: TObject);
    procedure cmpConta8Exit(Sender: TObject);
    procedure cmpConta9Exit(Sender: TObject);
    procedure cmpConta10Exit(Sender: TObject);
    procedure cmpConta12Exit(Sender: TObject);
    procedure cmpConta11Exit(Sender: TObject);
    procedure cmpConta13Exit(Sender: TObject);
    procedure cmpConta14Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblkPlanoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkTipOperMoedaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkTipOperImportCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkTipOperLancamChange(Sender: TObject);
    procedure dblkTipOperLancamCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormDestroy(Sender: TObject);
  private
      CtrlParamContab    :TCtrlParamContab;
      CtrlContab         :TCtrlContab;
      ListTerceiros      :TCtrlListTerceiros;
      CtrlHistoContab    :TCtrlHistoContab;
      CtrlPlano          :TCtrlPlano;
      iPlanoAnt          :integer;
      //Marcus Oliveira P.26548 11/10/2007
      CtrlProcessaContab : TCtrlProcessaContab;
  public
    { Public declarations }
  end;

var
  frmCadParamContabMT: TfrmCadParamContabMT;

implementation

{$R *.DFM}

uses UMensErro, uDatabase, DBaseDados, uAutorizacao, uSistema,
     fTelaAut;

procedure TfrmCadParamContabMT.FormCreate (Sender: TObject);
begin
  inherited;
  //Marcus Oliveira P.26548 11/10/2007
  CtrlProcessaContab := TCtrlProcessaContab.Create;
  CtrlProcessaContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                             Sistema.ConnectionSide,Sistema.AppRemoteServer,True);   // *** Instancia a classe principal ***

  CtrlParamContab := TCtrlParamContab.Create;
  CtrlParamContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                             Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CtrlParamContab.CdsParamContab := Cds;
  Cds.Data := CtrlParamContab.ListParamContab(Sistema.IdEmpresa);
  iPlanoAnt := Cds.FieldByName('PLANO').asInteger;

  //INÍCIO - andre tavares - pendência 19976 - 14/11/2005
  dbcbNumPlanil.Enabled := cds.FieldByName('FLGPLNSEQUENCE').asString <> 'S';
  dbcbNumPlanil.ShowHint := true;
  //FIM - andre tavares - pendência 19976 - 14/11/2005

  lblPla.Visible := False;
  if cds.FieldByName('PACPLNCODIGO').asFloat <> 0 then
  begin
    lblPla.Visible := True;
    sqlPla.Prepare;
    sqlPla.ParamByName('PLNCODIGO').asFloat := cds.FieldByName('PACPLNCODIGO').asFloat;
    sqlPla.Open;

    lblPla.Caption := '[ '+ FloatToStr(cdsPla.FieldByName('PLNPLANIL').asFloat) + ' ]';
  end;

  //Carrega a combo Plano e Patro - Marcus Oliveira P.26548 11/10/2007
  cdsPatro.data     := CtrlProcessaContab.ListaPatro;
  cdsPlanoPrev.data := CtrlProcessaContab.ListaPlanoPrev;

  // *** Instancia a classe geral Ctrlcontab ****
  CtrlPlano := TCtrlPlano.Create;
  CtrlPlano.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                    Sistema.ConnectionSide,Sistema.AppRemoteServer,False);
  CdsPLanoContas.Data := CtrlPlano.ListPlano(0);

  // *** Instancia a classe geral Ctrlcontab ****
  ListTerceiros := TCtrlListTerceiros.Create;
  ListTerceiros.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                    Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  cdsMoedaOfi.Data       := ListTerceiros.ListMoeda;
  cdsMoedaGen1.Data      := ListTerceiros.ListMoeda;
  cdsMoedaGen2.Data      := ListTerceiros.ListMoeda;
  cdsMoedaGen3.Data      := ListTerceiros.ListMoeda;
  cdsTipoLanc.Data       := ListTerceiros.TipoOper(True);
  cdsTipoAtuaMoeda.Data  := ListTerceiros.TipoOper(True);
  cdsTipoOperImp.Data    := ListTerceiros.TipoOper(True);
  cdsTipoOperContas.Data := ListTerceiros.ListTipoOper(True);

  // *** Instancia a classe Historico Contab ***
  CtrlHistoContab := TCtrlHistoContab.Create;
  CtrlHistoContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                             Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  cdsHistorico.Data := CtrlHistoContab.ListHistoContab(Sistema.Idempresa,tohCodigo,'');

  // *** Instancia a classe geral Ctrlcontab ****
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                    Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
     MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);

  // *** colocar, mascara para as contas
  cmpConta1.Plano   := CtrlContab.PlanoParam;
  cmpConta1.Mascara := CtrlContab.MascaraContaParam;

  cmpConta2.Plano   := CtrlContab.PlanoParam;
  cmpConta2.Mascara := CtrlContab.MascaraContaParam;

  cmpConta3.Plano   := CtrlContab.PlanoParam;
  cmpConta3.Mascara := CtrlContab.MascaraContaParam;

  cmpConta4.Plano   := CtrlContab.PlanoParam;
  cmpConta4.Mascara := CtrlContab.MascaraContaParam;

  cmpConta5.Plano   := CtrlContab.PlanoParam;
  cmpConta5.Mascara := CtrlContab.MascaraContaParam;

  cmpConta6.Plano   := CtrlContab.PlanoParam;
  cmpConta6.Mascara := CtrlContab.MascaraContaParam;

  cmpConta7.Plano   := CtrlContab.PlanoParam;
  cmpConta7.Mascara := CtrlContab.MascaraContaParam;

  cmpConta8.Plano   := CtrlContab.PlanoParam;
  cmpConta8.Mascara := CtrlContab.MascaraContaParam;

  cmpConta9.Plano   := CtrlContab.PlanoParam;
  cmpConta9.Mascara := CtrlContab.MascaraContaParam;

  cmpConta10.Plano   := CtrlContab.PlanoParam;
  cmpConta10.Mascara := CtrlContab.MascaraContaParam;

  cmpConta11.Plano   := CtrlContab.PlanoParam;
  cmpConta11.Mascara := CtrlContab.MascaraContaParam;

  cmpConta12.Plano   := CtrlContab.PlanoParam;
  cmpConta12.Mascara := CtrlContab.MascaraContaParam;

  cmpConta13.Plano   := CtrlContab.PlanoParam;
  cmpConta13.Mascara := CtrlContab.MascaraContaParam;

  cmpConta14.Plano   := CtrlContab.PlanoParam;
  cmpConta14.Mascara := CtrlContab.MascaraContaParam;

  cmpConta15.Plano   := CtrlContab.PlanoParam;
  cmpConta15.Mascara := CtrlContab.MascaraContaParam;

  cmpConta16.Plano   := CtrlContab.PlanoParam;
  cmpConta16.Mascara := CtrlContab.MascaraContaParam;

end;

procedure TfrmCadParamContabMT.dbrgTipoFechaChange(Sender: TObject);
begin
  inherited;
  dbedDataUltFecha.Enabled := dbrgTipoFecha.ItemIndex = 1;

end;

procedure TfrmCadParamContabMT.CmeCadastroEdit(Sender: TObject);
begin
 // movienta dados para o cds
 pgc.Enabled:= True;
 If (cds.IsEmpty) Then
 Begin
     cds.Insert;
     cds.FieldByName('IDPESSOA').AsInteger         := Sistema.IdEmpresa;
     cds.FieldByName('PACDOBRADA').AsString        := 'N';
     cds.FieldByName('PACCORRESPOND').AsString     := 'N';
     cds.FieldByName('PACMANTEM').AsString         := 'N';
     cds.FieldByName('PACCONTRANATUR').AsString    := 'N';
     cds.FieldByName('PACVALIDAPROC').AsString     := 'N';
     cds.FieldByName('PACESTORNA').AsString        := 'N';
     cds.FieldByName('PACOBRIGAHIST').AsString     := 'N';
     cds.FieldByName('PACNUMDOC').AsString         := 'N';
     cds.FieldByName('PACOBRIGADATA').AsString     := 'N';
     cds.FieldByName('PACATIVPROJ').AsString       := 'N';
     cds.FieldByName('PACTIPOOPER').AsString       := 'N';
     cds.FieldByName('FLGHISTCAIXAALTA').AsString  := 'N';
     cds.FieldByName('PACPESQPLALANC').AsString    := 'N';
     cds.FieldByName('FLGPERMITEZERO').AsString    := 'N';
  End;

  inherited;

 { If CtrlParamContab.ExistePlanilha(Sistema.IdEmpresa) Then
  Begin
     dblkPlano.Enabled     := True;
     dblkMoedaOfi.Enabled  := True;
     dblkMoedaGer1.Enabled := True;
     dblkMoedaGer2.Enabled := True;
     dblkMoedaGer3.Enabled := True;
  End Else
  Begin
     dblkPlano.Enabled     := True;
     dblkMoedaOfi.Enabled  := True;
     dblkMoedaGer1.Enabled := True;
     dblkMoedaGer2.Enabled := True;
     dblkMoedaGer3.Enabled := True;
  End;   }

  {If CtrlParamContab.PlanoExisteConta(CtrlContab.PlanoParam) Then
  Begin
    dbedsub1.Enabled := false;
    dbedsub2.Enabled := false;
    dbedsub3.Enabled := false;
    dbedsub4.Enabled := false;
  End Else
  Begin
    dbedsub1.Enabled := true;
    dbedsub2.Enabled := true;
    dbedsub3.Enabled := true;
    dbedsub4.Enabled := true;
 End;
   }
 If cds.FieldByName('FLGTIPOFECHAMENTO').asString = '' Then
    cds.FieldByName('FLGTIPOFECHAMENTO').asString := 'P';

 If cds.FieldByName('FLGHISTCAIXAALTA').asString = '' Then
    cds.FieldByName('FLGHISTCAIXAALTA').AsString  := 'N';

 If cds.FieldByName('FLGPERMITEZERO').asString = '' Then
    cds.FieldByName('FLGPERMITEZERO').AsString  := 'S';

  dbedDataUltFecha.Enabled := cds.FieldByName('FLGTIPOFECHAMENTO').AsString = 'D';
  pgc.ActivePage := tbs1;


end;

procedure TfrmCadParamContabMT.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
   sbtnInserir.Enabled  := False;
   sbtnApagar.Enabled   := False;
   sbtnProcurar.Enabled := False;
   sbtnAlterar.Enabled  := True;
   //
   pnlFundo.Enabled := true;
   If sbtnAlterar.Down Then
   Begin
      tbs1.Enabled := true;
      tbs2.Enabled := true;
      tbs3.Enabled := true;
   End Else
   Begin
      tbs1.Enabled   := false;
      tbs2.Enabled   := false;
      tbs3.Enabled   := false;
   End;

end;

procedure TfrmCadParamContabMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  Cds.Data := CtrlParamContab.ListParamContab(Sistema.IdEmpresa); //andre tavares - pendência 19976 - 14/11/2005
  //INÍCIO - andre tavares - pendência 19976 - 14/11/2005
  dbcbNumPlanil.Enabled := cds.FieldByName('FLGPLNSEQUENCE').asString <> 'S';
  dbcbNumPlanil.ShowHint := true;
  //FIM - andre tavares - pendência 19976 - 14/11/2005
end;

procedure TfrmCadParamContabMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  If Cds.State in [dsEdit, dsInsert] Then
  Begin
    if  (dbseativoini.text       = '') or (dbseativofim.text       = '') or (dbsepassivoini.text = '') or
        (dbsepassivofim.text     = '') or (dbsereceitaini.text     = '') or (dbsereceitafim.text = '') or
        (dbsedespesaini.text     = '') or (dbsedespesafim.text     = '') or (dbsecustoini.text   = '') or
        (dbsecustofim.text       = '') or (dbseOutrosini.text      = '') or (dbseOutrosfim.text  = '') or
        (dbseEstatisticaini.text = '') or (dbseEstatisticafim.text = '') Then
    Begin
        MsgDlg('Preencha corretamente a faixa de códigos reduzidos.','Aviso',mtWarning,[mbOk],0);
        accept := false;
    End;

    If dblkPlano.text = '' Then
    Begin
      MsgDlg('Plano de Contas não selecionado.','Aviso',mtWarning,[mbOk],0);
      Accept := false;
    End;

    If dbcbDebCre.Text = '' Then
    Begin
       MsgDlg('"Verificação de planilhas" (Saldo de Débito/Crédito) não selecionada.','Aviso',mtWarning,[mbOk],0);
       Accept := false;
    End;

    If dbcbTotDig.text = '' Then
    Begin
       MsgDlg('"Verificação de planilhas" (Total Digitad/Informado) não selecionada.','Aviso',mtWarning,[mbOk],0);
       Accept := false;
    End;

    If dbcbNumPlanil.text = '' Then
    Begin
       MsgDlg('"Numeração das Planilhas" não selecionada.','Aviso',mtWarning,[mbOk],0);
       Accept := false;
    End;

    If dbcbCadConta.text = '' Then
    Begin
      MsgDlg('"Efetuar lançamentos por" não selecionada.','Aviso',mtWarning,[mbOk],0);
      Accept := false;
    End;

    If dbcbSubConta.text = '' Then
    Begin
      MsgDlg('"Ordenar subconta por" não selecionada.','Aviso',mtWarning,[mbOk],0);
      Accept := false;
    End;

    cds.FieldByName('IDUSUARIOINCLUSAO').asInteger := sistema.idUsuario;
    cds.FieldByName('IDPESSOA').asInteger          := sistema.idEmpresa;

    If cds.Fieldbyname('PACREDUZA').IsNull Then
    Begin
       cds.Fieldbyname('PACREDUZA').asInteger := StrToInt(dbseativoini.text);
       cds.Fieldbyname('PACREDUZP').asInteger := StrToInt(dbsepassivoini.text);
       cds.Fieldbyname('PACREDUZR').asInteger := StrToInt(dbsereceitaini.text);
       cds.Fieldbyname('PACREDUZD').asInteger := strToInt(dbsedespesaini.text);
       cds.Fieldbyname('PACREDUZC').asInteger := StrToInt(dbsecustoini.text);
       cds.Fieldbyname('PACREDUZO').asInteger := StrToInt(dbseOutrosini.text);
       cds.Fieldbyname('PACREDUZE').asInteger := StrToInt(dbseEstatisticaini.text);
    End;

  End;
end;

procedure TfrmCadParamContabMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept := CtrlParamContab.Gravar;

end;

procedure TfrmCadParamContabMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept := CtrlParamContab.Gravar;

end;

procedure TfrmCadParamContabMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept := CtrlParamContab.Gravar;

end;

procedure TfrmCadParamContabMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  If CtrlParamContab.MessageInfo <> '' Then
     MsgDlg(CtrlParamContab.MessageInfo,'Erro',mtError,[mbOK],0);

end;

procedure TfrmCadParamContabMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//   inherited;
   CtrlParamContab.free;
   CtrlContab.free;
   ListTerceiros.free;
   CtrlHistoContab.free;
   CtrlPlano.free;
   inherited;
end;

procedure TfrmCadParamContabMT.cmpConta1Exit(Sender: TObject);
begin
  inherited;
  If (cmpConta15.Valida <> VcOK) Then
  Begin
     cmpConta15.SetFocus;
     Exit;
  End;

end;

procedure TfrmCadParamContabMT.cmpConta2Exit(Sender: TObject);
begin
  inherited;
  If (cmpConta16.Valida <> VcOK) Then
  Begin
     cmpConta16.SetFocus;
     Exit;
  End;

end;

procedure TfrmCadParamContabMT.cmpConta3Exit(Sender: TObject);
begin
  inherited;
  If (cmpConta3.Valida <> VcOK) Then
  Begin
     cmpConta3.SetFocus;
     Exit;
  End;

end;

procedure TfrmCadParamContabMT.cmpConta4Exit(Sender: TObject);
begin
  inherited;
  If (cmpConta4.Valida <> VcOK) Then
  Begin
     cmpConta4.SetFocus;
     Exit;
  End;

end;

procedure TfrmCadParamContabMT.cmpConta5Exit(Sender: TObject);
begin
  inherited;
  If (cmpConta5.Valida <> VcOK) Then
  Begin
     cmpConta5.SetFocus;
     Exit;
  End;

end;

procedure TfrmCadParamContabMT.cmpConta6Exit(Sender: TObject);
begin
  inherited;
  If (cmpConta6.Valida <> VcOK) Then
  Begin
     cmpConta6.SetFocus;
     Exit;
  End;

end;

procedure TfrmCadParamContabMT.cmpConta7Exit(Sender: TObject);
begin
  inherited;
  If (cmpConta7.Valida <> VcOK) Then
  Begin
     cmpConta7.SetFocus;
     Exit;
  End;

end;

procedure TfrmCadParamContabMT.cmpConta8Exit(Sender: TObject);
begin
  inherited;
  If (cmpConta8.Valida <> VcOK) Then
  Begin
     cmpConta8.SetFocus;
     Exit;
  End;

end;

procedure TfrmCadParamContabMT.cmpConta9Exit(Sender: TObject);
begin
  inherited;
  If (cmpConta9.Valida <> VcOK) Then
  Begin
     cmpConta9.SetFocus;
     Exit;
  End;

end;

procedure TfrmCadParamContabMT.cmpConta10Exit(Sender: TObject);
begin
  inherited;
  If (cmpConta10.Valida <> VcOK) Then
  Begin
     cmpConta10.SetFocus;
     Exit;
  End;

end;

procedure TfrmCadParamContabMT.cmpConta12Exit(Sender: TObject);
begin
  inherited;
  If (cmpConta12.Valida <> VcOK) Then
  Begin
     cmpConta12.SetFocus;
     Exit;
  End;

end;

procedure TfrmCadParamContabMT.cmpConta11Exit(Sender: TObject);
begin
  inherited;
  If (cmpConta11.Valida <> VcOK) Then
  Begin
     cmpConta11.SetFocus;
     Exit;
  End;

end;

procedure TfrmCadParamContabMT.cmpConta13Exit(Sender: TObject);
begin
  inherited;
  If (cmpConta13.Valida <> VcOK) Then
  Begin
     cmpConta13.SetFocus;
     Exit;
  End;

end;

procedure TfrmCadParamContabMT.cmpConta14Exit(Sender: TObject);
begin
  inherited;
  If (cmpConta14.Valida <> VcOK) Then
  Begin
     cmpConta14.SetFocus;
     Exit;
  End;

end;

procedure TfrmCadParamContabMT.FormShow(Sender: TObject);
begin
  inherited;
  pgc.ActivePage := tbs1;

end;

procedure TfrmCadParamContabMT.dblkPlanoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
 { if iPlanoAnt <>  StrToInt(dblkPlano.LookupValue) then
  begin
    if CtrlParamContab.ExisteContaPlano(iPlanoAnt) then
    begin
      MsgDlg('O Plano não pode ser alterado, pois existem dados associados a ele.','Aviso',mtWarning,[mbOk],0);
      Abort;
    end;
  end; }
end;

procedure TfrmCadParamContabMT.dblkTipOperMoedaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
  var
  ssql:string;
begin
  inherited;
    //catia - 22735 - 18/08/2006
      cdsaux.Close;
     sSql := ' SELECT PACTIPOPERLANC FROM  PARAMCONTAB  WHERE '+dblkTipOperMoeda.LookupValue   + ' = ' +dblkTipOperResult.LookupValue;
    qryaux.Sql.Text := sSql;
    qryaux.Open;
    if  not cdsaux.IsEmpty   then
    begin
      MsgDlg('Não pode selecionar o Tipo Operação igual ao Encerra Conta Resultado','Aviso',mtwarning,[mbOk],0);
      dblkTipOperMoeda.clear;
      dblkTipOperMoeda.SetFocus;
      exit;
    end;
end;

procedure TfrmCadParamContabMT.dblkTipOperImportCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
   var
  ssql:string;
begin
  inherited;
   //catia - 22735 - 18/08/2006
    cdsaux.Close;
     sSql := ' SELECT PACTIPOPERLANC FROM  PARAMCONTAB  WHERE '+dblkTipOperImport.LookupValue   + ' = ' +dblkTipOperResult.LookupValue;
    qryaux.Sql.Text := sSql;
    qryaux.Open;
    if  not cdsaux.IsEmpty   then
    begin
      MsgDlg('Não pode selecionar o Tipo Operação igual ao Encerra Conta Resultado','Aviso',mtwarning,[mbOk],0);
      dblkTipOperImport.clear;
      dblkTipOperImport.SetFocus;
      exit;
    end;
end;

procedure TfrmCadParamContabMT.dblkTipOperLancamChange(Sender: TObject);
  var
  ssql: string;
begin
  inherited;

end;

procedure TfrmCadParamContabMT.dblkTipOperLancamCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
  var
  ssql:string;
  begin
  inherited;
//catia - 22735 - 18/08/2006
 cdsaux.Close;
     sSql := ' SELECT PACTIPOPERLANC FROM  PARAMCONTAB  WHERE '+dblkTipOperLancam.LookupValue   + ' = ' +dblkTipOperResult.LookupValue;
    qryaux.Sql.Text := sSql;
    qryaux.Open;
    if  not cdsaux.IsEmpty   then
    begin
      MsgDlg('Não pode selecionar o Tipo Operação igual ao Encerra Conta Resultado','Aviso',mtwarning,[mbOk],0);
      dblkTipOperLancam.Clear;
      dblkTipOperLancam.SetFocus;

      exit;
    end;
end;

procedure TfrmCadParamContabMT.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil( CtrlProcessaContab );
end;

end.
