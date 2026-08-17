unit fCustomParamFichaProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn, StdCtrls,
  Buttons, ExtCtrls, Db, DBTables, wwdblook, Mask, DBCtrls, Wwdatsrc, TB97, ComCtrls, TB97Tlbr,
  IvDictio, IvMulti, IvEMulti, MontaSelect, fParamReports_Padrao, CmParamReport;

type
  TfrmCustomParamFichaProc = class(TfrmParamReports_Padrao)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edNumero: TEdit;
    Label4: TLabel;
    edNomeContraparte: TEdit;
    sbtnProcurar: TSpeedButton;
    rgImprimirHonor: TRadioGroup;
    rgImprimirObserv: TRadioGroup;
    MontaSelect: TMontaSelect;
    procedure FormCreate(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  public
    IdReports: integer;
    TipoPessoa, NomeNossoAdvog: string;
    
    procedure HabilitarBtOk;
  end;

var
  frmCustomParamFichaProc: TfrmCustomParamFichaProc;

implementation

uses fAguarde, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmCustomParamFichaProc.FormCreate(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCustomParamFichaProc.FormShow(Sender: TObject);
begin
  inherited;
  MontaSelect.Tabelas.Add('PESSOA ADVOG');
  MontaSelect.Filtro.Add('PROCESSOTRAB.IDADVOGRECDA  = ADVOG.IDPESSOA(+)');

  HabilitarBtOk;
end;

procedure TfrmCustomParamFichaProc.sbtnProcurarClick(Sender: TObject);
begin
  MontaSelect.Executar;
  if (MontaSelect.RetornouValor) then
  begin
    edNumero.Text := MontaSelect.ValoresChave[0];
    edNomeContraparte.Text := MontaSelect.ValoresChave[1];
    TipoPessoa := MontaSelect.ValoresChave[2];
    NomeNossoAdvog := MontaSelect.ValoresChave[3];
  end;
  sbtnProcurar.Down := false;
  HabilitarBtOk;
end;

procedure TfrmCustomParamFichaProc.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  Cmp_Padrao.ParamByName('NumProcesso').asString := edNumero.Text;
  Cmp_Padrao.ParamByName('NomeAdvogado').asString := NomeNossoAdvog;
  Cmp_Padrao.ParamByName('ImprimirOBSEtapa').asBoolean := (rgImprimirObserv.ItemIndex = 0);
  Cmp_Padrao.ParamByName('ImprimirHonorario').asBoolean := (rgImprimirHonor.ItemIndex = 0);

  frmAguarde.Min := 0;
  frmAguarde.Pos := 0;
  frmAguarde.Mostra('Ficha do Processo');
  frmAguarde.Update;
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmCustomParamFichaProc.HabilitarBtOk;
begin
  bbtnConfirmar.Enabled := (edNumero.Text <> '');
end;

end.
