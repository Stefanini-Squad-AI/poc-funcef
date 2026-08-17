unit fParamRelCAT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, CmParamReport,
  fParamReports_Padrao, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, Mask, wwdbedit, CMProcura, MontaSelect,
  ComCtrls, TREdit;

type
  TfrmParamRelCAT = class(TfrmParamReports_Padrao)
    MontaSelectCidade: TMontaSelect;
    PageControl1: TPageControl;
    tbsGeral: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cmbTipoCAT: TComboBox;
    cmbTipoAcid: TComboBox;
    rgHouveAfast: TRadioGroup;
    edDataUtlDia: TCMDateTimePicker;
    gbxLocal: TGroupBox;
    lblCNPJ: TLabel;
    cmbLocal: TComboBox;
    ProcuraCidade: TCMProcura;
    edUF: TEdit;
    edCNPJ: TEdit;
    edParteCorpo: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    edAgente: TEdit;
    Label6: TLabel;
    edSitGeradora: TEdit;
    rgRegPolicial: TRadioGroup;
    rgMorte: TRadioGroup;
    tbsTestemunhas: TTabSheet;
    edNome1: TEdit;
    edEnder1: TEdit;
    edBairro1: TEdit;
    edCEP1: TEdit;
    edCidade1: TEdit;
    edUF1: TEdit;
    edTelef1: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Bevel1: TBevel;
    edNome2: TEdit;
    edEnder2: TEdit;
    edBairro2: TEdit;
    edCEP2: TEdit;
    edCidade2: TEdit;
    edUF2: TEdit;
    edTelef2: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    MontaSelectTestemunha: TMontaSelect;
    bbtnBusca1: TBitBtn;
    bbtnBusca2: TBitBtn;
    tbsAtestado: TTabSheet;
    edUnidade: TEdit;
    Label21: TLabel;
    dtDataAtend: TCMDateTimePicker;
    edHora: TEdit;
    rgInternacao: TRadioGroup;
    redDias: TRealEdit;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    rgAfastarse: TRadioGroup;
    edLesao: TEdit;
    Label26: TLabel;
    Label27: TLabel;
    edDiagnostico: TEdit;
    edCID: TEdit;
    Label28: TLabel;
    memObserv: TMemo;
    Label29: TLabel;
    Label30: TLabel;
    edHoraAcid: TEdit;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ProcuraCidadeValidaDados(Sender: TObject);
    procedure cmbLocalChange(Sender: TObject);
    procedure bbtnBusca1Click(Sender: TObject);
    procedure bbtnBusca2Click(Sender: TObject);
    procedure cmbTipoCATChange(Sender: TObject);
    procedure rgHouveAfastClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  public
    sFunc, sTipoOcorr, sNumSeq, sData, sUnidade, sDiagnostico, sCID, sObserv: string;
    dDias: double;
  end;

var
  frmParamRelCAT: TfrmParamRelCAT;

implementation

uses uSistema, fAguarde, RCAT;

{$R *.DFM}

procedure TfrmParamRelCAT.FormCreate(Sender: TObject);
begin
  inherited;
  cmbTipoCAT.ItemIndex := 0;
  cmbTipoAcid.ItemIndex := 0;
  cmbLocal.ItemIndex := 0;
end;

procedure TfrmParamRelCAT.FormShow(Sender: TObject);
begin
  inherited;
  edDataUtlDia.Date := StrToDate(sData);
  dtDataAtend.Date := StrToDate(sData);
  edUnidade.Text := sUnidade;
  edDiagnostico.Text := sDiagnostico;
  edCID.Text := sCID;
  memObserv.Text := sObserv;
  redDias.Value := dDias;
end;

procedure TfrmParamRelCAT.ProcuraCidadeValidaDados(Sender: TObject);
begin
  edUF.Text := MontaSelectCidade.ValoresChave[1];
end;

procedure TfrmParamRelCAT.cmbTipoCATChange(Sender: TObject);
begin
  if (cmbTipoCAT.ItemIndex = 2) then
    rgMorte.ItemIndex := 0;
end;

procedure TfrmParamRelCAT.cmbLocalChange(Sender: TObject);
begin
  edCNPJ.Visible := (cmbLocal.ItemIndex = 1);
  lblCNPJ.Visible := (cmbLocal.ItemIndex = 1);
end;

procedure TfrmParamRelCAT.bbtnBusca1Click(Sender: TObject);
begin
  MontaSelectTestemunha.Executar;
  if (MontaSelectTestemunha.RetornouValor) then
  begin
    edNome1.Text  := Trim(MontaSelectTestemunha.ValoresChave[1]);
    edEnder1.Text := Trim(MontaSelectTestemunha.ValoresChave[2]) + ', ' +
                     Trim(MontaSelectTestemunha.ValoresChave[3]) + ' ' +
                     Trim(MontaSelectTestemunha.ValoresChave[4]);
    edBairro1.Text:= Trim(MontaSelectTestemunha.ValoresChave[5]);
    edCEP1.Text   := Trim(MontaSelectTestemunha.ValoresChave[6]);
    edCidade1.Text:= Trim(MontaSelectTestemunha.ValoresChave[7]);
    edUF1.Text    := Trim(MontaSelectTestemunha.ValoresChave[8]);
    edTelef1.Text := Trim(MontaSelectTestemunha.ValoresChave[9]) + '-' +
                     Trim(MontaSelectTestemunha.ValoresChave[10]) + '-' +
                     Trim(MontaSelectTestemunha.ValoresChave[11]);
  end;
end;

procedure TfrmParamRelCAT.bbtnBusca2Click(Sender: TObject);
begin
  MontaSelectTestemunha.Executar;
  if (MontaSelectTestemunha.RetornouValor) then
  begin
    edNome2.Text  := Trim(MontaSelectTestemunha.ValoresChave[1]);
    edEnder2.Text := Trim(MontaSelectTestemunha.ValoresChave[2]) + ', ' +
                     Trim(MontaSelectTestemunha.ValoresChave[3]) + ' ' +
                     Trim(MontaSelectTestemunha.ValoresChave[4]);
    edBairro2.Text:= Trim(MontaSelectTestemunha.ValoresChave[5]);
    edCEP2.Text   := Trim(MontaSelectTestemunha.ValoresChave[6]);
    edCidade2.Text:= Trim(MontaSelectTestemunha.ValoresChave[7]);
    edUF2.Text    := Trim(MontaSelectTestemunha.ValoresChave[8]);
    edTelef2.Text := Trim(MontaSelectTestemunha.ValoresChave[9]) + '-' +
                     Trim(MontaSelectTestemunha.ValoresChave[10]) + '-' +
                     Trim(MontaSelectTestemunha.ValoresChave[11]);
  end;
end;

procedure TfrmParamRelCAT.rgHouveAfastClick(Sender: TObject);
begin
  rgAfastarse.ItemIndex := rgHouveAfast.ItemIndex;
end;

procedure TfrmParamRelCAT.bbtnConfirmarClick(Sender: TObject);
begin
  frmAguarde.Mostra('Ficha CAT');

  RptCAT := TRptCAT.Create(Application);
  RptCAT.sFunc := sFunc;
  RptCAT.sTipoOcorr := sTipoOcorr;
  RptCAT.sNumSeq := sNumSeq;
  RptCAT.sTipoCAT := IntToStr(cmbTipoCAT.ItemIndex + 1);
  RptCAT.sDataAcid := sData;
  RptCAT.sHoraAcid := edHoraAcid.Text;
  RptCAT.sTipoAcid := IntToStr(cmbTipoAcid.ItemIndex + 1);
  RptCAT.sHouveAfast := IntToStr(rgHouveAfast.ItemIndex + 1);
  RptCAT.sUltData := edDataUtlDia.Text;
  RptCAT.sLocalAcid := IntToStr(cmbLocal.ItemIndex + 1);
  RptCAT.sEspecLocal := cmbLocal.Text;
  RptCAT.sSituacao := edSitGeradora.Text;
  RptCAT.sLocalCNPJ := edCNPJ.Text;
  RptCAT.sUFLocal := edUF.Text;
  RptCAT.sMunicLocal := ProcuraCidade.Text;
  RptCAT.sParteCorpo := edParteCorpo.Text;
  RptCAT.sAgente := edAgente.Text;
  RptCAT.sHouveRegPol:= IntToStr(rgRegPolicial.ItemIndex + 1);
  RptCAT.sHouveMorte := IntToStr(rgMorte.ItemIndex + 1);
  RptCAT.sNomeTest1 := edNome1.Text;
  RptCAT.sEnderTest1 := edEnder1.Text;
  RptCAT.sBairroTest1:= edBairro1.Text;
  RptCAT.sCEPTest1 := edCEP1.Text;
  RptCAT.sMunicTest1 := edCidade1.Text;
  RptCAT.sUFTest1 := edUF1.Text;
  RptCAT.sTelefTest1 := edTelef1.Text;
  RptCAT.sNomeTest2 := edNome2.Text;
  RptCAT.sEnderTest2 := edEnder2.Text;
  RptCAT.sBairroTest2:= edBairro2.Text;
  RptCAT.sCEPTest2 := edCEP2.Text;
  RptCAT.sMunicTest2 := edCidade2.Text;
  RptCAT.sUFTest2 := edUF2.Text;
  RptCAT.sTelefTest2 := edTelef2.Text;
  RptCAT.sUnidAtend := edUnidade.Text;
  RptCAT.sDataAtend := dtDataAtend.Text;
  RptCAT.sHoraAtend := edHora.Text;
  RptCAT.sHouveInternacao := IntToStr(rgInternacao.ItemIndex + 1);
  RptCAT.sDiasTrat := FloatToStr(redDias.Value);
  RptCAT.sDeveAfast := IntToStr(rgAfastarse.ItemIndex + 1);
  RptCAT.sLesao := edLesao.Text;
  RptCAT.sDescCID := edDiagnostico.Text;
  RptCAT.sCID10 := edCID.Text;
  RptCAT.sObserv := memObserv.Text;
  //RptCAT.sAposAcid := ??;

  RptCAT.CrmRptCMBeforePrint(Sender);
  RptCAT.CrmRptCM.IdReports := 3834;
  RptCAT.CrmRptCM.IdEmpresa := Sistema.IdEmpresa;
  RptCAT.CrmRptCM.OrigemCM := 1;
  RptCAT.CrmRptCM.IdModulo := Sistema.IdModulo;
  RptCAT.CrmRptCM.IdUsuario := Sistema.IdUsuario;
  RptCAT.CrmRptCM.Print;
  RptCAT.Free;
end;

end.
