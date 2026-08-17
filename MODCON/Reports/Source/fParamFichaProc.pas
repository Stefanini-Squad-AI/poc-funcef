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
    MontaSelect: TMontaSelect;
    sbtnProcurar: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    rgImprimirRateio: TRadioGroup;
    rgImprimirObserv: TRadioGroup;
    rgImprimirHonor: TRadioGroup;
    edNumero: TEdit;
    edNomeContraparte: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  public
    sNomeNossoAdvog: string;
    
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
  with (MontaSelect) do
  begin
    if (CtrlUsoGeralRH.UsuXCCusto <> '') or (CtrlUsoGeralRH.UsuXFilial <> '') then
    begin
      Tabelas.Add('FUNCIONARIO');
      Filtro.Add('FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA');
    end;

    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      Filtro.Add('FUNCIONARIO.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto);

    if (CtrlUsoGeralRH.UsuXFilial <> '') then
      Filtro.Add('FUNCIONARIO.IDESTAB IN ' +CtrlUsoGeralRH.UsuXFilial);
  end;
  HabilitarBtOk;
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmParamFichaProc.sbtnProcurarClick(Sender: TObject);
begin
  MontaSelect.Executar;
  if (MontaSelect.RetornouValor) then
  begin
    edNumero.Text := MontaSelect.ValoresChave[0];
    edNomeContraparte.Text := MontaSelect.ValoresChave[1];
    sNomeNossoAdvog := MontaSelect.ValoresChave[2];
  end;
  sbtnProcurar.Down := false;
  HabilitarBtOk;
end;

procedure TfrmParamFichaProc.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  Cmp_Padrao.ParamByName('NumProcesso').asString := edNumero.Text;
  Cmp_Padrao.ParamByName('NomeAdvogado').asString := sNomeNossoAdvog;
  Cmp_Padrao.ParamByName('ImprimirRateio').asBoolean := (rgImprimirRateio.ItemIndex = 0);
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
