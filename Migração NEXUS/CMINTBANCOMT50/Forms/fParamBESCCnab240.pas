unit fParamBESCCnab240;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, fcOutlookList, fcButton, fcImgBtn, fcShapeBtn, fcClearPanel,
  fcButtonGroup, fcOutlookBar, ExtCtrls, StdCtrls, TREdit, Spin,
  wwdbdatetimepicker, CMDateTimePicker, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97;

type
  TfrmParamBescCnab240MT = class(TfrmOkCancelar)
    Panel1: TPanel;
    NtbCnab: TNotebook;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    DtCredito: TCMDateTimePicker;
    CmbCarteira: TComboBox;
    RgFormaCad: TRadioGroup;
    RgTipoDoc: TRadioGroup;
    RgDistribuicao: TRadioGroup;
    CmbEmissao: TComboBox;
    RgAceite: TRadioGroup;
    CmbProtesto: TComboBox;
    SpNumDiasProtesto: TSpinEdit;
    CmbBaixaDevol: TComboBox;
    SpNumDiasBaixa: TSpinEdit;
    ReContrato: TRealEdit;
    EdtMens1: TEdit;
    EdtMens2: TEdit;
    CmEspecie: TComboBox;
    rgTipo: TRadioGroup;
    ReNumConvenio: TEdit;
    Label11: TLabel;
    LblCodDesc3: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label12: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label24: TLabel;
    Label26: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label28: TLabel;
    Bevel1: TBevel;
    CmbCodDesc2: TComboBox;
    CmbCodDesc3: TComboBox;
    CmbMulta: TComboBox;
    DtDesc2: TCMDateTimePicker;
    ReValDesc2: TRealEdit;
    DtDesc3: TCMDateTimePicker;
    ReValDesc3: TRealEdit;
    DtMulta: TCMDateTimePicker;
    ReValMulta: TRealEdit;
    EdtMens3: TEdit;
    EdtMens4: TEdit;
    CmbCodJuros: TComboBox;
    CmbCodDesc: TComboBox;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    CmbTipoImpressao: TComboBox;
    SpeNumLinhas: TSpinEdit;
    cmbTipChar: TComboBox;
    EdtMesnCnab: TEdit;
    fcObParametros: TfcOutlookBar;
    fcObParametrosfcShapeBtn1: TfcShapeBtn;
    fcListPrametros: TfcOutlookList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamBescCnab240MT: TfrmParamBescCnab240MT;

implementation

{$R *.DFM}

end.
