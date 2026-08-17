unit fCadParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCadastroMT,
  wwdbedit, Wwdbspin, StdCtrls, Mask, DBCtrls, IvDictio, IvMulti, MontaSelect, DBTables,
  Db, Wwdatsrc, TB97Ctls, MAHlpBtn, Buttons, TB97Tlbr, TB97, wwdblook, ComCtrls, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro, ImgList, DBClient, TREdit,
  uCMClientDataSet,  uCtrlParamRH, uCtrlListTerceirosRH,uCtrlFuncoesRH,
  IvEMulti;

type
  TfrmCadParam = class(TfrmCadastroMT)
    CdsTipoDocPessoa: TCMClientDataSet;
    PageControl1: TPageControl;
    tbshIdentificacao: TTabSheet;
    gbxPosDoc: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dbspedColDoc: TwwDBSpinEdit;
    dbspedTamDoc: TwwDBSpinEdit;
    gbxDoc: TGroupBox;
    dblckDoc: TwwDBLookupCombo;
    tbshPonto: TTabSheet;
    gbxNormal: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    dbedNorIni: TCMDateTimePicker;
    dbedNorFim: TCMDateTimePicker;
    tbshBancoHoras: TTabSheet;
    dbrgBancoHoras: TDBRadioGroup;
    gbxBancoHoras: TGroupBox;
    dbredPer: TwwDBSpinEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbredLim: TwwDBSpinEdit;
    Label6: TLabel;
    Label7: TLabel;
    dbredDSR: TDBRealEdit;
    Label8: TLabel;
    Label9: TLabel;
    dbredNormal: TDBRealEdit;
    Label12: TLabel;
    dbrgIndPeriodo: TDBRadioGroup;
    gbxDataBancoHoras: TGroupBox;
    CMDateTimePicker1: TCMDateTimePicker;
    Label13: TLabel;
    CdsParamRHDatas: TCMClientDataSet;
    gbxRegIndiv: TGroupBox;
    dbcbxFlgFerias: TDBCheckBox;
    dbcbxFlgAfast: TDBCheckBox;
    dbcbxFlgAltera: TDBCheckBox;
    gbxPrazo: TGroupBox;
    dbspePrazoPonto: TwwDBSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure dbrgBancoHorasChange(Sender: TObject);
    procedure dbrgIndPeriodoChange(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    CtrlParamRH: TCtrlParamRH;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;

    procedure SelParamRH;
    function  GravarOperacao: boolean;
  end;

var
  frmCadParam: TfrmCadParam;

implementation

uses uMensErro, uCtrlPadroes, uCtrlUsoGeralRH, uSistema;

{$R *.DFM}

procedure TfrmCadParam.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlParamRH := TCtrlParamRH.Create;
  CtrlParamRH.InitializeAs(Padroes);
  CtrlParamRH.CdsParamRH := Cds;

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CdsTipoDocPessoa.Data := CtrlListTerceirosRH.ListTipoDocPessoa;

  SelParamRH;
  if (Cds.IsEmpty) then
  begin
    CtrlParamRH.ExecInsert;
    CtrlParamRH.GravarParamRH;
    SelParamRH;     
  end;
end;

procedure TfrmCadParam.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlParamRH);
  FreeAndNil(CtrlListTerceirosRH);
  inherited;
end;

procedure TfrmCadParam.FormShow(Sender: TObject);
begin
  inherited;
  pnlFundo.Enabled := true;
  sbtnAlterar.Enabled := not(Cds.IsEmpty);
end;

procedure TfrmCadParam.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  if (Cds.FieldByName('COLDOCUMENTO').asInteger = 0) then
  begin
    Cds.FieldByName('COLDOCUMENTO').asInteger := 1;
    dbspedColDoc.Update;
  end;

  if (Cds.FieldByName('TAMDOCUMENTO').asInteger = 0) then
  begin
    Cds.FieldByName('TAMDOCUMENTO').asInteger := 12;
    dbspedTamDoc.Update;
  end;
end;

procedure TfrmCadParam.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadParam.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarOperacao;
end;

procedure TfrmCadParam.dbrgBancoHorasChange(Sender: TObject);
begin
  gbxBancoHoras.Visible := (dbrgBancoHoras.ItemIndex = 0);
end;

procedure TfrmCadParam.dbrgIndPeriodoChange(Sender: TObject);
begin
  gbxDataBancoHoras.Visible := (dbrgIndPeriodo.ItemIndex = 0);
end;

procedure TfrmCadParam.bbtnConfirmarClick(Sender: TObject);
begin
  if (Trim(dbspedColDoc.Text) = '') then
  begin
    MsgDlg(FU.CMTranslate('Preencha a Posição do Documento.'), fu.CMTranslate('Aviso'),
      mtInformation, [mbOk,mbHelp], 0);
    dbspedColDoc.SetFocus;
  end
  else
  if (Trim(dbspedTamDoc.Text) = '') then
  begin
    MsgDlg(fu.CMTranslate('Preencha o Tamanho do Documento.'), fu.CMTranslate('Aviso'),
      mtInformation, [mbOk,mbHelp], 0);
    dbspedTamDoc.SetFocus;
  end
  else
  begin
    inherited;
    SelParamRH;
    FormShow(Sender);
  end;
end;

procedure TfrmCadParam.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  FormShow(Sender);
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmCadParam.SelParamRH;
begin
  Cds.Data := CtrlParamRH.ListParamRH;
end;

function TfrmCadParam.GravarOperacao: boolean;
begin
  Result := CtrlParamRH.GravarParamRH;
  if not(Result) then
    MsgDlg(CtrlParamRH.MessageInfo, fu.CMTranslate('Erro'), mtError, [mbOk,mbHelp], 0);
end;

end.
