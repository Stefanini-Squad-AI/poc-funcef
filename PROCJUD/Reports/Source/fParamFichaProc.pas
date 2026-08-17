unit fParamFichaProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn, StdCtrls,
  Buttons, ExtCtrls, Db, DBTables, wwdblook, Mask, DBCtrls, Wwdatsrc, TB97, ComCtrls, TB97Tlbr,
  IvDictio, IvMulti, IvEMulti, MontaSelect, fParamReports_Padrao, CmParamReport;

type
  TfrmParamFichaProc = class(TfrmParamReports_Padrao)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edNumero: TEdit;
    Label4: TLabel;
    edContraParte: TEdit;
    sbtnProcurar: TSpeedButton;
    rgImprimirHonor: TRadioGroup;
    rgImprimirObserv: TRadioGroup;
    rgImprimirOBSObjeto: TRadioGroup;
    MontaSelect: TMontaSelect;
    procedure FormCreate(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  public
    sTipoPessoa: string;
    procedure HabilitarBtOk;
  end;

var
  frmParamFichaProc: TfrmParamFichaProc;

implementation

uses fAguarde, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmParamFichaProc.FormCreate(Sender: TObject);
begin
  inherited;
  HabilitarBtOk;
end;

procedure TfrmParamFichaProc.sbtnProcurarClick(Sender: TObject);
begin
  MontaSelect.Executar;
  if (MontaSelect.RetornouValor) then
  begin
    edNumero.Text := MontaSelect.ValoresChave[0];
    edContraParte.Text := MontaSelect.ValoresChave[1];
    sTipoPessoa := MontaSelect.ValoresChave[2];
  end;
  sbtnProcurar.Down := false;
  HabilitarBtOk;
end;

procedure TfrmParamFichaProc.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  Cmp_Padrao.ParamByName('NumProcesso').asString := edNumero.Text;
  Cmp_Padrao.ParamByName('NomeContraparte').asString := edContraParte.Text;
  Cmp_Padrao.ParamByName('TipoContraparte').asString := sTipoPessoa;
  Cmp_Padrao.ParamByName('ImprimirOBSObjeto').asBoolean := (rgImprimirOBSObjeto.ItemIndex = 0);
  Cmp_Padrao.ParamByName('ImprimirOBSEtapa').asBoolean := (rgImprimirObserv.ItemIndex = 0);
  Cmp_Padrao.ParamByName('ImprimirHonorario').asBoolean := (rgImprimirHonor.ItemIndex = 0);


  frmAguarde.Min := 0;
  frmAguarde.Pos := 0;
  frmAguarde.Mostra('Ficha do Processo');
  frmAguarde.Update;
end;

procedure TfrmParamFichaProc.HabilitarBtOk;
begin
  bbtnConfirmar.Enabled := (edNumero.Text <> '');
end;

end.
