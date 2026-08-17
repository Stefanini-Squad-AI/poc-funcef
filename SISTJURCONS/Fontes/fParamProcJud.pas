Unit fParamProcJud;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelProcessoCons,
   Db, DBTables, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
   TB97, wwdblook, TEdNum, Spin, wwdbdatetimepicker, CMDateTimePicker, ExtCtrls, ComCtrls,
   Grids, DBGrids, uCmSqlParams, DBClient, uCMClientDataSet, CmParamReport;

Type
   TfrmParamProcJud = Class(TfrmSelProcessoCons)
      tbshRelatorio: TTabSheet;
      gbxTituloRelat: TGroupBox;
      edTituloRelat: TEdit;
      rgNumProc: TRadioGroup;
      rgImprimirCabRod: TRadioGroup;
      rgImprimirLitis: TRadioGroup;
      rgOpcaoImpressao: TRadioGroup;
      rgImprimirResumo: TRadioGroup;
      rgImprimirEtapa: TRadioGroup;
      rgExibirRelatRisco: TRadioGroup;
      rgImprimirObservEtapa: TRadioGroup;
      rgImprimirObj: TRadioGroup;
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure rgOpcaoImpressaoClick(Sender: TObject);
      Procedure rgImprimirEtapaClick(Sender: TObject);
   End;

Var
   frmParamProcJud: TfrmParamProcJud;

Implementation

Uses fAguarde, uCtrlFuncoesRH;

{$R *.DFM}

Procedure TfrmParamProcJud.FormCreate(Sender: TObject);
Begin
   Inherited;
   rgExibirRelatRisco.Items[0] := 'da Causa';

   IrPaginaResult := false;
   AbrirQueryPrincipal := false;
End;

Procedure TfrmParamProcJud.rgImprimirEtapaClick(Sender: TObject);
Begin
   rgImprimirObservEtapa.Enabled := (rgImprimirEtapa.ItemIndex <> 1);
End;

Procedure TfrmParamProcJud.rgOpcaoImpressaoClick(Sender: TObject);
Begin
   rgExibirRelatRisco.Visible := (rgOpcaoImpressao.ItemIndex = 0);
End;

Procedure TfrmParamProcJud.bbtnConfirmarClick(Sender: TObject);
Var
   sListaCodEtapa, sListaObjSel: String;
Begin
   frmAguarde.Pos := 0;
   frmAguarde.Mostra('Relatório de Processos');
   Inherited;
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
      (rgImprimirEtapa.ItemIndex <> 1) And (rgImprimirObservEtapa.ItemIndex = 0);

   // Cria a lista de IDs das Etapas selecionadas
   If (Cmp_Padrao.ParamByName('ImprimirEtapaSel').asBoolean) Then
      sListaCodEtapa := GerarParamSELECT(rgEtapa, lstCodEtapa, lstEtapa)
   Else
      sListaCodEtapa := '';
   Cmp_Padrao.ParamByName('ListaCodEtapa').asString := sListaCodEtapa;

   Cmp_Padrao.ParamByName('ImprimirObj').asBoolean := (rgImprimirObj.ItemIndex <> 1);
   Cmp_Padrao.ParamByName('ImprimirObjSel').asBoolean := (rgImprimirObj.ItemIndex = 2);

   // Cria a lista de IDs dos Objetos selecionados
   If (Cmp_Padrao.ParamByName('ImprimirObjSel').asBoolean) Then
      sListaObjSel := GerarParamSELECT(rgObjeto, lstCodObjeto, lstObjeto)
   Else
      sListaObjSel := '';
   Cmp_Padrao.ParamByName('ListaCodObjeto').asString := sListaObjSel;

   Cmp_Padrao.ParamByName('ImprimirCabRod').asBoolean := (rgImprimirCabRod.ItemIndex = 0);
   Cmp_Padrao.ParamByName('ImprimirResumo').asBoolean := (rgImprimirResumo.ItemIndex = 0);
End;

End.

