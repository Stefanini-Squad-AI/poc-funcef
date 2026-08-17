unit fParamProcPrev;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelProcessoMT,
  Db, DBTables, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97, wwdblook, TEdNum, Spin, wwdbdatetimepicker, CMDateTimePicker, ExtCtrls, ComCtrls,
  Grids, DBGrids, uCmSqlParams, DBClient, uCMClientDataSet, CmParamReport;

type
  TfrmParamProcPrev = class(TfrmSelProcessoMT)
    tbshRelatorio: TTabSheet;
    gbxTituloRelat: TGroupBox;
    edTituloRelat: TEdit;
    rgNumProc: TRadioGroup;
    rgImprimirCabRod: TRadioGroup;
    rgImprimirLitis: TRadioGroup;
    rgImprimirCargo: TRadioGroup;
    rgOpcaoImpressao: TRadioGroup;
    rgImprimirResumo: TRadioGroup;
    rgImprimirEtapa: TRadioGroup;
    rgExibirRelatRisco: TRadioGroup;
    rgImprimirObservEtapa: TRadioGroup;
    rgImprimirObj: TRadioGroup;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rgImprimirEtapaClick(Sender: TObject);
  end;

var
  frmParamProcPrev: TfrmParamProcPrev;

implementation

uses fAguarde;

{$R *.DFM}

procedure TfrmParamProcPrev.FormCreate(Sender: TObject);
begin
  inherited;
  IrPaginaResult := false;
  AbrirQueryPrincipal := false;
end;

procedure TfrmParamProcPrev.rgImprimirEtapaClick(Sender: TObject);
begin
  rgImprimirObservEtapa.Enabled := (rgImprimirEtapa.ItemIndex <> 1);
end;

procedure TfrmParamProcPrev.bbtnConfirmarClick(Sender: TObject);
var
  sListaCodEtapa, sListaObjSel: string;
begin
  frmAguarde.Pos := 0;
  frmAguarde.Mostra('Relatório de Processos');
  inherited;
  frmAguarde.Update;
  Cmp_Padrao.ParamByName('TituloRelatorio').asString := edTituloRelat.Text;
  Cmp_Padrao.ParamByName('SQL').asString := sqlProcesso.SQL.Text;
  Cmp_Padrao.ParamByName('ImprimirLitis').asInteger := rgImprimirLitis.ItemIndex;
  Cmp_Padrao.ParamByName('ImprimirNumProcVara').asBoolean := (rgNumProc.ItemIndex = 1);
  Cmp_Padrao.ParamByName('ExibirRelatRiscoMax').asBoolean := (rgExibirRelatRisco.ItemIndex = 0);
  Cmp_Padrao.ParamByName('OpcaoImpressao').asInteger := rgOpcaoImpressao.ItemIndex;

  Cmp_Padrao.ParamByName('ImprimirEtapa').asBoolean := (rgImprimirEtapa.ItemIndex <> 1);
  Cmp_Padrao.ParamByName('ImprimirEtapaSel').asBoolean := (rgImprimirEtapa.ItemIndex = 2);
  Cmp_Padrao.ParamByName('ImprimirObsEtapa').asBoolean :=
    (rgImprimirEtapa.ItemIndex <> 1) and (rgImprimirObservEtapa.ItemIndex = 0);

  // Cria a lista de IDs das Etapas selecionadas
  if (Cmp_Padrao.ParamByName('ImprimirEtapaSel').asBoolean) then
    sListaCodEtapa := GerarParamSELECT(rgEtapa, lstCodEtapa, lstEtapa)
  else
    sListaCodEtapa := '';
  Cmp_Padrao.ParamByName('ListaCodEtapa').asString := sListaCodEtapa;

  Cmp_Padrao.ParamByName('ImprimirObj').asBoolean := (rgImprimirObj.ItemIndex <> 1);
  Cmp_Padrao.ParamByName('ImprimirObjSel').asBoolean := (rgImprimirObj.ItemIndex = 2);

  // Cria a lista de IDs dos Objetos selecionados
  if (Cmp_Padrao.ParamByName('ImprimirObjSel').asBoolean) then
    sListaObjSel := GerarParamSELECT(rgObjeto, lstCodObjeto, lstObjeto)
  else
    sListaObjSel := '';
  Cmp_Padrao.ParamByName('ListaCodObjeto').asString := sListaObjSel;

  Cmp_Padrao.ParamByName('ImprimirCabRod').asBoolean := (rgImprimirCabRod.ItemIndex = 0);
  Cmp_Padrao.ParamByName('ImprimirResumo').asBoolean := (rgImprimirResumo.ItemIndex = 0);
  Cmp_Padrao.ParamByName('ImprimirCargo').asBoolean := (rgImprimirCargo.ItemIndex = 0);
end;

end.
