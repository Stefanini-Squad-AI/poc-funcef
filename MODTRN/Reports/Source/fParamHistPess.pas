unit fParamHistPess;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fOkCancelar,
  StdCtrls, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, uCmSqlParams, Db, DBClient, uCMClientDataSet;

type
  TfrmParamHistPess = class(TfrmOkCancelar)
    gbxFaixaData: TGroupBox;
    Label9: TLabel;
    EdData1: TCMDateTimePicker;
    EdData2: TCMDateTimePicker;
    gbxSelCursos: TGroupBox;
    cbxRealProgr: TCheckBox;
    cbxRealNaoProgr: TCheckBox;
    cbxNaoRealProgr: TCheckBox;
    cbxNaoRealNaoProgr: TCheckBox;
    rgIncluiExternos: TRadioGroup;
    rgTipoCusto: TRadioGroup;
    gbxSeqRel: TGroupBox;
    cmbSeqRel: TComboBox;
    rgConsolida: TRadioGroup;
    CdsHistPess: TCMClientDataSet;
    sqlHistPess: TCMSqlParams;
    rgFaltas: TRadioGroup;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  public
    sIdPessoa, sTipoPessoa, sDataini: string;
  end;

var
  frmParamHistPess: TfrmParamHistPess;

implementation

uses uSistema, uCtrlFuncoesRH, RHistPess;

{$R *.DFM}

procedure TfrmParamHistPess.FormCreate(Sender: TObject);
begin
  inherited;
  cmbSeqRel.ItemIndex := 0;
end;

procedure TfrmParamHistPess.FormShow(Sender: TObject);
begin
  inherited;
  with (sqlHistPess.SQL) do
  begin
    Clear;
    Add('SELECT MIN(DATREINI) AS DATAINI FROM HSTTRN WHERE IDPESSOA = '+sIdPessoa);
    sqlHistPess.Open;

    if CdsHistPess.FieldByName('DATAINI').asString = '' then
    begin
      Clear;
      Add('SELECT MIN(DATPLINI) AS DATAINI FROM HSTTRN WHERE IDPESSOA = '+sIdPessoa);
      sqlHistPess.Open;
    end;
    if CdsHistPess.FieldByName('DATAINI').asString <> '' then
      EdData1.Date := CdsHistPess.FieldByName('DATAINI').asDateTime;

  end;
  EdData2.Date := StrToDate('31/12/'+IntToStr(FU.ExtraiAno(Date)));
end;

procedure TfrmParamHistPess.bbtnConfirmarClick(Sender: TObject);
var
  Rpt: TRptHistPess;
begin
  inherited;
  Rpt := TRptHistPess.Create(Application);

  Rpt.sIdPessoa := sIdPessoa;
  Rpt.sTipoPessoa := sTipoPessoa;

  Rpt.DataIni := EdData1.Text;
  Rpt.DataFim := EdData2.Text;
  Rpt.IncPorConta := rgIncluiExternos.ItemIndex;
  Rpt.TipoCusto := rgTipoCusto.ItemIndex;
  Rpt.SeqRelat := cmbSeqRel.ItemIndex;
  Rpt.Consolida := rgConsolida.ItemIndex;
  Rpt.CalcFalta := rgFaltas.ItemIndex;
  Rpt.SelCurso1 := cbxRealProgr.Checked;
  Rpt.SelCurso2 := cbxRealNaoProgr.Checked;
  Rpt.SelCurso3 := cbxNaoRealProgr.Checked;
  Rpt.SelCurso4 := cbxNaoRealNaoProgr.Checked;

  Rpt.CrmRptCM.IdReports := 4004;
  Rpt.CrmRptCM.IdEmpresa := Sistema.IdEmpresa;
  Rpt.CrmRptCM.OrigemCM := 1;
  Rpt.CrmRptCM.IdModulo := Sistema.IdModulo;
  Rpt.CrmRptCM.IdUsuario := Sistema.IdUsuario;
  Rpt.CrmRptCM.Print;
  FreeAndNil(Rpt);
end;

end.
