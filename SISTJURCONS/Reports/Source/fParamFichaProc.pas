unit fParamFichaProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelProcessoCons,
  Db, DBTables, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97, wwdblook, TEdNum, Spin, wwdbdatetimepicker, CMDateTimePicker, ExtCtrls, ComCtrls,
  Grids, DBGrids, uCmSqlParams, DBClient, uCMClientDataSet, CmParamReport,
  MontaSelect;

type
  TfrmParamFichaProc = class(TfrmSelProcessoCons)
    tbshRelatorio: TTabSheet;
    rgImprimirLitis: TRadioGroup;
    rgImprimirObservEtapa: TRadioGroup;
    rgImprimirHonor: TRadioGroup;
    rgImprimirOBSObjeto: TRadioGroup;
    rgSelecao: TRadioGroup;
    gbxContraParte: TGroupBox;
    edNumero: TEdit;
    edContraParte: TEdit;
    sbtnProcurar: TSpeedButton;
    MontaSelect: TMontaSelect;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure HabilitarBtOk;
    procedure HabilitaOpcoes(Habilita: boolean);
    procedure rgSelecaoClick(Sender: TObject);
  end;

var
  frmParamFichaProc: TfrmParamFichaProc;
  sTipoPessoa: string;

implementation

uses fAguarde, uCtrlFuncoesRH, uMensErro;

{$R *.DFM}

procedure TfrmParamFichaProc.FormCreate(Sender: TObject);
begin
  inherited;
  IrPaginaResult := false;
  AbrirQueryPrincipal := false;
  rgSelecaoClick(Self);
end;

procedure TfrmParamFichaProc.bbtnConfirmarClick(Sender: TObject);
var
  sListaNumProcesso: string;
begin
  frmAguarde.Pos := 0;
  frmAguarde.Mostra('Fichas dos Processos');
  frmAguarde.Update;
  if rgSelecao.ItemIndex = 0 then
    sListaNumProcesso := trim(edNumero.Text)
  else
  begin
    AbrirQueryPrincipal := true;
    inherited;
    if (CdsProcesso.IsEmpty) then
    begin
      frmAguarde.Apaga;
      MsgDlg('Nenhum processo foi encontrado com as características selecionadas.', 'Aviso',
        mtInformation, [mbOk,mbHelp], 0);
      ModalResult := mrNone;
      exit;
    end
    else
    begin
      frmAguarde.Update;
      sListaNumProcesso := '';
      repeat
        if (sListaNumProcesso = '') then
          sListaNumProcesso := CdsProcesso.FieldByName('NUMPROCTRAB').asString
        else
          sListaNumProcesso := sListaNumProcesso +','+ CdsProcesso.FieldByName('NUMPROCTRAB').asString;

        CdsProcesso.Next;
      until (CdsProcesso.EOF);
    end;
  end;


  Cmp_Padrao.ParamByName('NumProcesso').asString := sListaNumProcesso;
  Cmp_Padrao.ParamByName('ImprimirObsEtapa').asBoolean := (rgImprimirObservEtapa.ItemIndex = 0);
  Cmp_Padrao.ParamByName('ImprimirObsObjeto').asBoolean := (rgImprimirOBSObjeto.ItemIndex = 0);
  Cmp_Padrao.ParamByName('ImprimirHonorario').asBoolean := (rgImprimirHonor.ItemIndex = 0);
  Cmp_Padrao.ParamByName('ImprimirLitis').asBoolean := (rgImprimirLitis.ItemIndex = 0);
end;

procedure TfrmParamFichaProc.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Executar;
  if (MontaSelect.RetornouValor) then
  begin
    edNumero.Text := MontaSelect.ValoresChave[0];
    edContraParte.Text := MontaSelect.ValoresChave[1];
    //sTipoPessoa := MontaSelect.ValoresChave[2];
  end;
  sbtnProcurar.Down := false;
  HabilitarBtOk;
end;

procedure TfrmParamFichaProc.rgSelecaoClick(Sender: TObject);
begin
  inherited;
  gbxContraParte.Visible := (rgSelecao.ItemIndex = 0);
  HabilitaOpcoes(not(gbxContraParte.Visible));
  HabilitarBtOk;
end;

procedure TfrmParamFichaProc.HabilitarBtOk;
begin
  bbtnConfirmar.Enabled := ((rgSelecao.ItemIndex = 0) and (Trim(edNumero.Text) <> '')) or
    (rgSelecao.ItemIndex = 1);
end;

procedure TfrmParamFichaProc.HabilitaOpcoes(Habilita: boolean);
begin
  tbsCidadesUF.TabVisible := Habilita;
  tbshAdv.TabVisible := Habilita;
  tbshGeral.TabVisible := Habilita;
  tbshObjetos.TabVisible := Habilita;
end;

end.
