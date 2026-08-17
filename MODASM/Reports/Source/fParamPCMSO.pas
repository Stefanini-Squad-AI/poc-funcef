unit fParamPCMSO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, ExtCtrls, TB97, ComCtrls, IvDictio, IvMulti, IvEMulti, TB97Tlbr,
  MontaSelect, CmParamReport, fSairAjuda;

type
  TfrmParamPCMSO = class(TfrmSairAjuda)
    MontaSelect: TMontaSelect;
    Label1: TLabel;
    Label2: TLabel;
    edTituloFicha: TEdit;
    edAssinante: TEdit;
    rgResultado: TRadioGroup;
    bbtnBuscaEmpregado: TBitBtn;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure FormCreate(Sender: TObject);
    procedure bbtnBuscaEmpregadoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  public
    bMontaSelectFunc: Boolean;
    sFunc, sTipoOcorr, sNumSeq, sEmpregado: String;
  end;

var
  frmParamPCMSO: TfrmParamPCMSO;

implementation

uses uSistema, fAguarde, RPCMSO, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmParamPCMSO.FormCreate(Sender: TObject);
begin
  inherited;
  bMontaSelectFunc := false;
  if (CtrlUsoGeralRH.UsuXCCusto <> '') then
    MontaSelect.Filtro.Add('FUNCIONARIO.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto);

  if (CtrlUsoGeralRH.UsuXFilial <> '') then
    MontaSelect.Filtro.Add('FUNCIONARIO.IDESTAB IN ' +CtrlUsoGeralRH.UsuXFilial);
end;

procedure TfrmParamPCMSO.bbtnBuscaEmpregadoClick(Sender: TObject);
begin
  MontaSelect.Executar;
  if (MontaSelect.RetornouValor) then
  begin
    edAssinante.Text := MontaSelect.ValoresChave[1];
    bMontaSelectFunc := true;
  end;
end;

procedure TfrmParamPCMSO.bbtnConfirmarClick(Sender: TObject);
begin
  frmAguarde.Mostra('Ficha PCMSO');

  RptPCMSO := TRptPCMSO.Create(Application);
  RptPCMSO.sFunc := sFunc;
  RptPCMSO.sTipoOcorr := sTipoOcorr;
  RptPCMSO.sNumSeq := sNumSeq;
  RptPCMSO.sEmpregado := sEmpregado;
  RptPCMSO.iIncluiAvalObs := rgResultado.ItemIndex;
  RptPCMSO.sTitRelat := edTituloFicha.Text;
  RptPCMSO.sAssinante := edAssinante.Text;

  RptPCMSO.CrmRptCMBeforePrint(Sender);
  RptPCMSO.CrmRptCM.IdReports := 3832;
  RptPCMSO.CrmRptCM.IdEmpresa := Sistema.IdEmpresa;
  RptPCMSO.CrmRptCM.OrigemCM := 1;
  RptPCMSO.CrmRptCM.IdModulo := Sistema.IdModulo;
  RptPCMSO.CrmRptCM.IdUsuario := Sistema.IdUsuario;
  RptPCMSO.CrmRptCM.Print;
  RptPCMSO.Free;
end;

end.
