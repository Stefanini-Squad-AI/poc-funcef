unit fParamProcTrab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelProcessoMT,
  Db, DBTables, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97, wwdblook, TEdNum, Spin, wwdbdatetimepicker, CMDateTimePicker, ExtCtrls, ComCtrls,
  TREdit, CheckLst, uCmSqlParams, DBClient, uCMClientDataSet, CmParamReport, ColorCheckListBox;

type
  TfrmParamProcTrab = class(TfrmSelProcessoMT)
    tbshRelatorio: TTabSheet;
    gbxTituloRelat: TGroupBox;
    edTituloRelat: TEdit;
    rgNumProc: TRadioGroup;
    rgImprimirCabRod: TRadioGroup;
    rgImprimirLitis: TRadioGroup;
    rgImprimirCargo: TRadioGroup;
    rgImprimirRateio: TRadioGroup;
    rgImprimirResumo: TRadioGroup;
    rgImprimirEtapa: TRadioGroup;
    rgExibirRelatRisco: TRadioGroup;
    rgImprimirObservEtapa: TRadioGroup;
    rgImprimirObj: TRadioGroup;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rgImprimirEtapaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  end;

var
  frmParamProcTrab: TfrmParamProcTrab;

implementation

uses fAguarde;

{$R *.DFM}

procedure TfrmParamProcTrab.FormCreate(Sender: TObject);
begin
  inherited;
  IrPaginaResult := false;
  AbrirQueryPrincipal := false;
end;

procedure TfrmParamProcTrab.rgImprimirEtapaClick(Sender: TObject);
begin
  rgImprimirObservEtapa.Enabled := (rgImprimirEtapa.ItemIndex <> 1);
end;

procedure TfrmParamProcTrab.bbtnConfirmarClick(Sender: TObject);
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
  Cmp_Padrao.ParamByName('ImprimirCargo').asBoolean := (rgImprimirCargo.ItemIndex = 0);

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
  Cmp_Padrao.ParamByName('ImprimirSomenteProcAbertos').asBoolean := (rgSitProc.ItemIndex > 0);
  Cmp_Padrao.ParamByName('ImprimirRateio').asBoolean := (rgImprimirRateio.ItemIndex = 0);
  Cmp_Padrao.ParamByName('ImprimirResumo').asBoolean := (rgImprimirResumo.ItemIndex = 0);
end;
                                       
end.
