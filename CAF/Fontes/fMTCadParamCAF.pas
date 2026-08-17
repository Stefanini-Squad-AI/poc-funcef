{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina..........: FormCreate
N. Sol..........: 163982/6901
N. Kintana......: 1472467
Data............: 04/11/2011
Responsável.....: Vinicius Eduardo Nascimento Maciel
Descrição.......: Foi alterada a rotina para que retorne apenas as atividades
                  Ativas. 
--------------------------------------------------------------------------------
Padrão       : 5.10.19
Congelado(s) : 5.10.16 / 5.10.17 / 5.10.18
Pendência    : 27279
Responsável  : Daniel Simões
Data         : 24/01/2008
Descrição    : Sobreposição do form em função da pendência...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fMTCadParamCAF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet, uCMTypes,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, 
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  Wwdbspin, wwdblook, wwdbdatetimepicker, CMDateTimePicker,
  Mask, wwdbedit, DBCtrls, ComCtrls, BfDialogs, BrowseFolder, uProcuraDir,
  uCtrlParamCAF, uCtrlGrupoContab, uCtrlClassedeBem, uCtrlMoeda, uCtrlUnidNegocio,
  uCtrlPadroes, uCmSqlParams, IvEMulti;

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
    dbgTipoConjunto: TDBRadioGroup;
    dbgPartidaContabil: TDBRadioGroup;
    dbgCtaDespesaDepreciacao: TDBRadioGroup;
    cdsBem: TCMClientDataSet;
    sqlBem: TCMSqlParams;
    cbCAF: TCheckBox;
    cdsParamGlobal: TCMClientDataSet;
    Label12: TLabel;
    Label13: TLabel;
    dbcmbPais: TwwDBLookupCombo;
    cdsPais: TCMClientDataSet;
    sqlTemp: TCMSqlParams;
    GroupBox1: TGroupBox;
    dbednumdiasano: TwwDBEdit;
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
    procedure FormShow(Sender: TObject);
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

uses uMensErro, uSistema, uCtrlParamIntegra;

procedure TfrmMTCadParamCAF.FormCreate(Sender: TObject);
var
   iTotBem, iTotConjunto : Integer;
   
begin
   inherited;
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.InitializeAs(Padroes);
   ParamCAF.cds      := cds;
   cdsPlano.Data     := ParamCAF.ListaPlanoContab;
   cdsTipOper.Data   := ParamCAF.ListaTipoOperacao;
   cdsPatro.Data     := ParamCAF.ListaPatro;
   cdsPlanoPrev.Data := ParamCAF.ListaPlanoPrev;
   cdsPais.Data      := ParamCAF.ListaPaises;
   //-------------------------------------------------------------------------------------
   GrupoContab := TCtrlGrupoContab.Create;
   GrupoContab.InitializeAs(Padroes);
   cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa);
   //-------------------------------------------------------------------------------------
   ClassedeBem := TCtrlClassedeBem.Create;
   ClassedeBem.InitializeAs(Padroes);
   cdsClasse.Data := ClassedeBem.ListaClassedeBem;
   //-------------------------------------------------------------------------------------
   Moeda := TCtrlMoeda.Create;
   Moeda.InitializeAs(Padroes);
   cdsMoeda.Data := Moeda.ListaMoeda;
   //-------------------------------------------------------------------------------------
   AtivProjeto := TCtrlUnidNegocio.Create;
   AtivProjeto.InitializeAs(Padroes);
   //Vinicius Maciel - SOL 163982/6901 - KTN 1472467
   //cdsAtivProjeto.Data := AtivProjeto.ListaUnidNegocio(Sistema.IdEmpresa);
   cdsAtivProjeto.Data := AtivProjeto.ListaUnidNegocio(Sistema.IdEmpresa,0,'',tapSoAnaliticaAP,toapNome,'S');
   //Vinicius Maciel - SOL 163982/6901 - KTN 1472467 -  FIM
   //-------------------------------------------------------------------------------------
   PageControl1.ActivePage  := TabCadastros;
   dbgTipoConjunto.ShowHint := True;
   dbgTipoConjunto.Hint := 'Método 1 : Agrupar-se os bens associados de uma forma selecionada,' + #13 +
                           'como os componentes de um computador, um veículo e seus acessórios.' + #13 +
                           '(Recomendado)' + #13 +
                           'Método 2 : Os conjuntos são associados as localizações.' + #13 +
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
      cds.Append;
      cds.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
      cds.FieldByName('MOEDAOFICIAL').Clear;
      cds.FieldByName('MOEDAFISCAL').Clear;
      cds.FieldByName('MOEDAGERENCIAL').Clear;
      cds.FieldByName('PLANOVIGENTE').AsInteger := ParamIntegra.Plano;
      cds.FieldByName('TIPOPERCTB').AsString := cdsTipOper.FieldbyName('TIPCODIGO').AsString;
      cds.FieldByName('SISTEMAS').AsString := '1000';
      cds.FieldByName('INTEGRACONTAB').AsString := 'N';
      cds.FieldByName('INTEGRACAP').AsString := 'N';
      cds.FieldByName('INTEGRACAR').AsString := 'N';
      cds.FieldByName('NUMDIASANO').AsInteger := 360;
      cds.FieldByName('DATAINICIAL').AsDateTime := date;
      cds.FieldByName('FLGTIPOCALC').AsString := 'M';
      cds.FieldByName('FLGCALCCM').AsInteger := 0;
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
      cds.FieldByName('FLGREAVAL').AsInteger := 2;
      //----------------------------------------------------------------------------------
      if iTotConjunto > (iTotBem / 2) then
         cds.FieldByName('TIPOCONJUNTO').AsInteger := 0
      else
         cds.FieldByName('TIPOCONJUNTO').AsInteger := 1;
      //----------------------------------------------------------------------------------
      cdsParamGlobal.Data := ParamCAF.ListaParamGlobal(Sistema.IdEmpresa);
      if not cdsParamGlobal.IsEmpty then
         if cdsParamGlobal.FieldByName('MOEDACORRENTE').AsFloat <> 0 then
            cds.FieldByName('MOEDAOFICIAL').AsFloat := cdsParamGlobal.FieldByName('MOEDACORRENTE').AsFloat;
      cdsParamGlobal.Close;
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
procedure TfrmMTCadParamCAF.FormShow(Sender: TObject);
begin
   inherited;
   pnlFundo.Enabled := True;
   TabCadastros.Enabled := False;
   TabIntegracao.Enabled := False;
   TabCalculos.Enabled := False;
   TabIntegraContab.Enabled := False;
   TabInventario.Enabled := False;
end;
//========================================================================================
procedure TfrmMTCadParamCAF.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   inherited;
   sbtnAlterar.Enabled := True;
   pnlFundo.Enabled := True;
   if cds.State in [dsInsert,dsEdit] then
   begin
      TabCadastros.Enabled := True;
      TabIntegracao.Enabled := True;
      TabCalculos.Enabled := True;
      TabIntegraContab.Enabled := True;
      TabInventario.Enabled := True;
   end else
   begin
      TabCadastros.Enabled := False;
      TabIntegracao.Enabled := False;
      TabCalculos.Enabled := False;
      TabIntegraContab.Enabled := False;
      TabInventario.Enabled := False;
   end;
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
   cdsPlano.Close;
   cdsTipOper.Close;
   cdsPatro.Close;
   cdsPlanoPrev.Close;
   cdsPais.Close;
   cdsGrupo.Close;
   cdsClasse.Close;
   cdsMoeda.Close;
   cdsAtivProjeto.Close;
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
   cds.FieldByName('COLETORDADOS').AsInteger := cmbColetor.ItemIndex;
   cds.FieldByName('CDPORTA').AsInteger := cmbPorta.ItemIndex;
   cds.FieldByName('CDVELOC').AsString := inttostr(cmbVeloc.ItemIndex);
   //-------------------------------------------------------------------------------------
   Accept := True;
   inherited;
end;

end.
