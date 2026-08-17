unit fMTCadParamCAF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet, uCMTypes,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  Wwdbspin, wwdblook, wwdbdatetimepicker, CMDateTimePicker,
  Mask, wwdbedit, DBCtrls, ComCtrls, BfDialogs, BrowseFolder, uProcuraDir,
  uCtrlParamCAF, uCtrlGrupoContab, uCtrlClassedeBem, uCtrlMoeda, uCtrlUnidNegocio;

type
  TfrmMTCadParamCAF = class(TFrmCadastroMT)
    PageControl1: TPageControl;
    TabCadastros: TTabSheet;
    GroupBox4: TGroupBox;
    dbcbCodPlaca: TDBCheckBox;
    dbcbNomeBem: TDBCheckBox;
    dbrgEmpresaGrupo: TDBRadioGroup;
    GroupBox3: TGroupBox;
    dbeMascaraGrupo: TwwDBEdit;
    GroupBox6: TGroupBox;
    dbeMascaraClasse: TwwDBEdit;
    GroupBox1: TGroupBox;
    dbednumdiasano: TwwDBEdit;
    GroupBox2: TGroupBox;
    dbdDataInicial: TCMDateTimePicker;
    gboxNumPlacaIni: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    dbeProxPlaca: TwwDBEdit;
    dbeDigitos: TwwDBEdit;
    dbcbAluguelInterno: TDBCheckBox;
    dbcbGeraRequis: TDBCheckBox;
    TabIntegracao: TTabSheet;
    grpbxIntegra: TGroupBox;
    gbSistemas: TGroupBox;
    cbManut: TCheckBox;
    cbImob: TCheckBox;
    cbAlmox: TCheckBox;
    TabCalculos: TTabSheet;
    gbCalcula: TGroupBox;
    dbrgFlgReaval: TDBRadioGroup;
    gbcalculo: TDBRadioGroup;
    GroupBox5: TGroupBox;
    Label4: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    dblcMoedaFiscal: TwwDBLookupCombo;
    dblcMoedaOficial: TwwDBLookupCombo;
    dblcMoedaGerencial: TwwDBLookupCombo;
    dblcMoedaGerencialB: TwwDBLookupCombo;
    dbrdgTipAtuSaldoContab: TDBRadioGroup;
    gbxNumTaxaDep: TGroupBox;
    dbsNumTaxaDep: TwwDBSpinEdit;
    TabIntegraContab: TTabSheet;
    GroupBox7: TGroupBox;
    dblkcmbPlano: TwwDBLookupCombo;
    GroupBox8: TGroupBox;
    dblkcmbTipoOper: TwwDBLookupCombo;
    dbrgEstornoPlan: TDBRadioGroup;
    GroupBox9: TGroupBox;
    dblkcmbAtivProjeto: TwwDBLookupCombo;
    GroupBox10: TGroupBox;
    dblkcmbPlanoPrev: TwwDBLookupCombo;
    GroupBox11: TGroupBox;
    dblkcmbPatro: TwwDBLookupCombo;
    TabInventario: TTabSheet;
    grbColetor: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    cmbColetor: TComboBox;
    cmbPorta: TComboBox;
    cmbVeloc: TComboBox;
    dbeCDPath: TwwDBEdit;
    bbtnSelPasta: TBitBtn;
    pDirColetor: TProcuraDirDlg;
    cdsPlano: TCMClientDataSet;
    cdsTipOper: TCMClientDataSet;
    cdsAtivProjeto: TCMClientDataSet;
    cdsMoeda: TCMClientDataSet;
    cdsPatro: TCMClientDataSet;
    cdsPlanoPrev: TCMClientDataSet;
    cdsGrupo: TCMClientDataSet;
    cdsClasse: TCMClientDataSet;
    cbCorrMonet: TDBCheckBox;
    cbxContab: TDBCheckBox;
    cbxCpg: TDBCheckBox;
    cbxCre: TDBCheckBox;
    wwDBLookupCombo1: TwwDBLookupCombo;
    Label11: TLabel;
    Panel1: TPanel;
    cbCAF: TCheckBox;
    dbgTipoConjunto: TDBRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure bbtnSelPastaClick(Sender: TObject);
    procedure cbCAFClick(Sender: TObject);
    procedure cbManutClick(Sender: TObject);
    procedure cbAlmoxClick(Sender: TObject);
    procedure cbImobClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
  private
    { Private declarations }
    ParamCAF    : TCtrlParamCAF;
    GrupoContab : TCtrlGrupoContab;
    ClassedeBem : TCtrlClassedeBem;
    Moeda       : TCtrlMoeda;
    AtivProjeto : TCtrlUnidNegocio;
    sSistemas   : String[8];
    procedure SelParamCAF(fIdPessoa : Extended);
  public
    { Public declarations }
  end;

var
  frmMTCadParamCAF: TfrmMTCadParamCAF;

implementation

{$R *.DFM}

uses uMensErro, dBasedados, uSistema, uIntegraBack ;

procedure TfrmMTCadParamCAF.FormCreate(Sender: TObject);
var
   iTotBem, iTotconjunto : Integer;
begin
   inherited;
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
   ParamCAF.cds      := cds;
   cdsPlano.Data     := ParamCAF.ListaPlanoContab;
   cdsTipOper.Data   := ParamCAF.ListaTipoOperacao;
   cdsPatro.Data     := ParamCAF.ListaPatro;
   cdsPlanoPrev.Data := ParamCAF.ListaPlanoPrev;
   //-------------------------------------------------------------------------------------
   GrupoContab := TCtrlGrupoContab.Create;
   GrupoContab.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType, // False no 2o.Parâmetro
                          Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
   cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa);
   //-------------------------------------------------------------------------------------
   ClassedeBem := TCtrlClassedeBem.Create;
   ClassedeBem.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType, // False no 2o.Parâmetro
                          Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
   cdsClasse.Data := ClassedeBem.ListaClassedeBem;
   //-------------------------------------------------------------------------------------
   Moeda := TCtrlMoeda.Create;
   Moeda.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType, // False no 2o.Parâmetro
                    Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
   cdsMoeda.Data := Moeda.ListaMoeda;
   //-------------------------------------------------------------------------------------
   AtivProjeto := TCtrlUnidNegocio.Create;
   AtivProjeto.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType, // False no 2o.Parâmetro
                          Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
   cdsAtivProjeto.Data := AtivProjeto.ListaUnidNegocio(Sistema.IdEmpresa);
   //-------------------------------------------------------------------------------------
   PageControl1.ActivePage  := TabCadastros;
   dbgTipoConjunto.ShowHint := True;
   dbgTipoConjunto.Hint := 'Método 1 : Agrupar-se os bens associados de uma forma selecionada,'+#13+
                           'como os componentes de um computador, um veículo e seus acessórios.'+#13+
                           '(Recomendado)'+#13+
                           'Método 2 : Os conjuntos são associados as localizações.'+#13+
                           'Não recomendado, pois gera inconsistências.';
   //-------------------------------------------------------------------------------------
   // Verifica se existem grupos cadastrados
   //-------------------------------------------------------------------------------------
   if not cdsGrupo.IsEmpty then
   begin
      dbeMascaraGrupo.Enabled := False;
   end else
   begin
      dbeMascaraGrupo.Enabled := True;
   end;
   //-------------------------------------------------------------------------------------
   // Verifica se existem Classes Cadastradas
   //-------------------------------------------------------------------------------------
   if not cdsClasse.IsEmpty then
   begin
      dbeMascaraClasse.Enabled := False;
   end else
   begin
      dbeMascaraClasse.Enabled := True;
   end;
   //-------------------------------------------------------------------------------------
   SelParamCAF(Sistema.IdEmpresa);
   //-------------------------------------------------------------------------------------
   iTotBem      := ParamCAF.TotBem(Sistema.IdEmpresa);
   iTotConjunto := ParamCAF.TotConjunto(Sistema.IdEmpresa);
   //-------------------------------------------------------------------------------------
   if not cds.IsEmpty then
   begin
      if iTotConjunto > (iTotBem / 2) then
      begin
         cds.Edit;
         cds.FieldByName('TIPOCONJUNTO').AsInteger := 0;
         cds.Post;
      end else
      begin
         cds.Edit;
         cds.FieldByName('TIPOCONJUNTO').AsInteger := 1;
         cds.Post;
      end;
      //----------------------------------------------------------------------------------
      if cds.FieldByName('SISTEMAS').IsNull then
         sSistemas := '1000'
      else
         sSistemas := cds.FieldByName('SISTEMAS').AsString;
      //----------------------------------------------------------------------------------
      cbCAF.Checked   := (sSistemas[1] = '1');
      cbManut.Checked := (sSistemas[2] = '1');
      cbAlmox.Checked := (sSistemas[3] = '1');
      cbImob.Checked  := (sSistemas[4] = '1');
      //----------------------------------------------------------------------------------
      if gbCalculo.ItemIndex = -1 then
         gbCalculo.ItemIndex := 1;
      //----------------------------------------------------------------------------------
      if cds.FieldByName('COLETORDADOS').IsNull then
         cmbColetor.ItemIndex := 0
      else
         cmbColetor.ItemIndex := cds.FieldByName('COLETORDADOS').AsInteger;
      //----------------------------------------------------------------------------------
      if cds.FieldByName('CDPORTA').IsNull then
         cmbPorta.ItemIndex := 1
      else
         cmbPorta.ItemIndex := cds.FieldByName('CDPORTA').AsInteger;
      //----------------------------------------------------------------------------------
      if cds.FieldByName('CDVELOC').IsNull then
         cmbVeloc.ItemIndex := 0
      else
         cmbVeloc.ItemIndex := cds.FieldByName('CDVELOC').AsInteger;
   end else
   begin
      cds.Insert;
      cds.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
      cds.FieldByName('MOEDAOFICIAL').clear;
      cds.FieldByName('MOEDAFISCAL').clear;
      cds.FieldByName('MOEDAGERENCIAL').clear;
      cds.FieldByName('MOEDAGERENCIALB').clear;
      cds.FieldByName('PLANOVIGENTE').AsInteger := IntegraBack.Plano;
      cds.FieldByName('TIPOPERCTB').AsString := cdsTipOper.FieldbyName('TIPCODIGO').AsString;
      cds.FieldByName('SISTEMAS').AsString := '1000';
      cds.FieldByName('INTEGRACONTAB').AsString := 'N';
      cds.FieldByName('INTEGRACAP').AsString := 'N';
      cds.FieldByName('INTEGRACAR').AsString := 'N';
      cds.FieldByName('NUMDIASANO').AsInteger := 360;
      cds.FieldByName('DATAINICIAL').AsDateTime := date;
      cds.FieldByName('FLGTIPOCALC').AsString := 'M';
      cds.FieldByName('FLGCALCCM').AsInteger := 0;
      cds.FieldByName('FLGREAVAL').AsString := '0';
      cds.FieldByName('ALUGUELINTERNO').AsInteger := 0;
      cds.FieldByName('GERARREQMAT').AsInteger := 0;
      cds.FieldByName('EDITACODBEM').AsInteger := 0;
      cds.FieldByName('EDITACODGRUPO').AsInteger := 0;
      cds.FieldByName('SEQBEMEMP').AsInteger := 0;
      cds.FieldByName('FLGREMOVEPLANCTB').AsString := 'S';
      cds.FieldByName('ATIVPROJETO').AsInteger := cdsAtivProjeto.FieldByName('UNIDNEGOC').AsInteger;
      cds.FieldByName('PROXIMAPLACA').AsFloat := 1;
      cds.FieldByName('FLGCLSDESBEM').AsFloat := 0;
      cds.FieldByName('PLANPREVPADRAO').AsFloat := cdsPlanoPrev.FieldByName('IDPLANOPREV').AsFloat;
      cds.FieldByName('PATROPADRAO').AsFloat := cdsPatro.FieldByName('IDPATRO').AsFloat;
      cds.FieldByName('TIPATUSALDOCONTAB').AsInteger := 0;
      cds.FieldByName('NUMTAXADEP').AsInteger := 1;
      cds.FieldByName('COLETORDADOS').AsInteger := 0;
      cds.FieldByName('CDPORTA').AsInteger := 1;
      cds.FieldByName('CDVELOC').AsString := '0';
      cds.FieldByName('DIGMASCPLACA').AsInteger := 0;
      //----------------------------------------------------------------------------------
      if iTotConjunto > (iTotBem / 2) then
         cds.FieldByName('TIPOCONJUNTO').AsInteger := 0
      else
         cds.FieldByName('TIPOCONJUNTO').AsInteger := 1;
      //----------------------------------------------------------------------------------
      cds.Post;
      //----------------------------------------------------------------------------------
      sSistemas            := '1000';
      cbCAF.Checked        := (sSistemas[1] = '1');
      cbManut.Checked      := (sSistemas[2] = '1');
      cbAlmox.Checked      := (sSistemas[3] = '1');
      cbImob.Checked       := (sSistemas[4] = '1');
      cbCorrMonet.Checked  := False;
      gbCalculo.ItemIndex  := 1;
      cbxContab.Checked    := False;
      cbxCre.Checked       := False;
      cbxCpg.Checked       := False;
      cmbColetor.ItemIndex := 0;
      cmbPorta.ItemIndex   := 1;
      cmbVeloc.ItemIndex   := 0;
      //----------------------------------------------------------------------------------
      if not ParamCAF.AplicaOperacao then
         MsgDlg(ParamCAF.MessageInfo,'Erro',mtError,[mbOK],0);
   end;
   SelParamCaf(Sistema.IdEmpresa);
end;
//========================================================================================
procedure TfrmMTCadParamCAF.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   inherited;
   sbtnAlterar.Enabled := True;
end;
//========================================================================================
procedure TFrmMTCadParamCAF.SelParamCAF(fIdPessoa : Extended);
begin
   cds.Data := ParamCAF.ListaParamCAF(fIdPessoa);
end;
//========================================================================================
procedure TfrmMTCadParamCAF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   ParamCAF.Free;
   GrupoContab.Free;
   ClassedeBem.Free;
   Moeda.Free;
   AtivProjeto.Free;
end;
//========================================================================================
procedure TfrmMTCadParamCAF.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := ParamCAF.AplicaOperacao;
end;
//========================================================================================
procedure TfrmMTCadParamCAF.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := ParamCAF.AplicaOperacao;
end;
//========================================================================================
procedure TfrmMTCadParamCAF.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := ParamCAF.AplicaOperacao;
end;
//========================================================================================
procedure TfrmMTCadParamCAF.CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
   inherited;
   MsgDlg(ParamCAF.MessageInfo,'Erro',mtError,[mbOK],0);
end;
//========================================================================================
procedure TfrmMTCadParamCAF.CmeCadastroAfterConfirma(Sender: TObject);
begin
   //inherited;
   SelParamCaf(Sistema.IdEmpresa);
end;
//========================================================================================
procedure TfrmMTCadParamCAF.bbtnSelPastaClick(Sender: TObject);
begin
   inherited;
   pDirColetor.ShowPath := False;
   pDirColetor.Caption := 'Pasta de Trabalho do Coletor de Dados';
   pDirColetor.Execute;
   cds.FieldByName('CDPATH').AsString := pDirColetor.Directory;
end;
//========================================================================================
procedure TfrmMTCadParamCAF.cbCAFClick(Sender: TObject);
begin
   inherited;
   if cbCAF.Checked then
      sSistemas[1] := '1'
   else
      sSistemas[1] := '0';
end;
//========================================================================================
procedure TfrmMTCadParamCAF.cbManutClick(Sender: TObject);
begin
   inherited;
   if cbManut.Checked then
      sSistemas[2] := '1'
   else
      sSistemas[2] := '0';
end;
//========================================================================================
procedure TfrmMTCadParamCAF.cbAlmoxClick(Sender: TObject);
begin
   inherited;
   if cbAlmox.Checked then
      sSistemas[3] := '1'
   else
      sSistemas[3] := '0';
end;
//========================================================================================
procedure TfrmMTCadParamCAF.cbImobClick(Sender: TObject);
begin
   inherited;
   if cbImob.Checked then
      sSistemas[4] := '1'
   else
      sSistemas[4] := '0';
end;
//========================================================================================
procedure TfrmMTCadParamCAF.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   Accept := False;
   //-------------------------------------------------------------------------------------
   cds.FieldByName('SISTEMAS').AsString := sSistemas;
   //-------------------------------------------------------------------------------------
   if dblcMoedaOficial.Text = '' then
      cds.FieldByName('MOEDAOFICIAL').clear;
   //-------------------------------------------------------------------------------------
   if dblcMoedaFiscal.Text = '' then
      cds.FieldByName('MOEDAFISCAL').clear;
   //-------------------------------------------------------------------------------------
   if dblcMoedaGerencial.Text = '' then
      cds.FieldByName('MOEDAGERENCIAL').clear;
   //-------------------------------------------------------------------------------------
   if dblcMoedaGerencialB.Text = '' then
      cds.FieldByName('MOEDAGERENCIALB').clear;
   //-------------------------------------------------------------------------------------
   cds.FieldByName('COLETORDADOS').AsInteger := cmbColetor.ItemIndex;
   cds.FieldByName('CDPORTA').AsInteger      := cmbPorta.ItemIndex;
   cds.FieldByName('CDVELOC').AsString       := inttostr(cmbVeloc.ItemIndex);
   //-------------------------------------------------------------------------------------
   Accept := True;
   inherited;
end;

end.
