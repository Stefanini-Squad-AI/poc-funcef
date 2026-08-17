//N. Sol..........: 135759
//N. Kintana......: 808903
//Data............: 13/05/2010
//Responsável.....: Adilson Filho
//Descrição.......: solicito a retirada da critica nunsecvinc relativa aso Dep. Recursal.
//************************************************************************************************
//Rotina..........: Componente dbrgAbate
//N. Sol..........: 126260
//N. Kintana......: 658259
//Data............: 06/11/2009
//Responsável.....: William Santos
//Descrição.......: Implementado uma nova opção de escolha para as etapas do processo, "Outros".
//************************************************************************************************
//Rotina..........:
//N. Sol..........: 124767
//N. Kintana......: 637517
//Data............: 24/09/2009
//Responsável.....: William Santos
//Descrição.......: Implementado ajuste para corrigir o problema de desfazer correção monetária,
//                    pois não estava gravando valor das custas na hstetapaproctrab.
//************************************************************************************************
//Rotina..........: btnVerHistoricoEtapasClick
//N. Sol..........: 122630
//N. Kintana......: 604044
//Data............: 04/08/2009
//Responsável.....: William Santos / Paulo Nobre
//Descrição.......: Implementação para criação do histórico para custas lançadas na etapa de
//                  Recurso de Revista e Recurso Ordinário.

Unit fCadProcesso;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   fCustomCadProcesso, MontaSelect, Db, DBClient, uCMClientDataSet,
   CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
   MAHlpBtn, TB97Tlbr, TB97Ctls, TB97, StdCtrls, Buttons, Wwdbspin, Mask,
   DBCtrls, ExtCtrls, TREdit, CMProcuraSubTipo, wwdbedit, CMProcura, Grids,
   Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, wwdblook,
   wwdbdatetimepicker, CMDateTimePicker, TB97Tlwn, DBTables, Wwquery,
   Provider, Wwdbgrd2;

Type
   TfrmCadProcesso = Class(TfrmCustomCadProcesso)
      dbrgMateria: TDBRadioGroup;
      LabelDataAjuiz2: TLabel;
      dbedDataAju2: TCMDateTimePicker;
      labellDataNot2: TLabel;
      dbedDataNot2: TCMDateTimePicker;
      rgAtivo: TDBRadioGroup;
      ntbkDadosRequerente: TNotebook;
      Label9: TLabel;
      Label10: TLabel;
      Label11: TLabel;
      Label12: TLabel;
      Label23: TLabel;
      Label32: TLabel;
      dbedCargo: TDBEdit;
      dbedSalAtual_ModCon: TDBEdit;
      dbrgTipoSalar: TDBRadioGroup;
      dbedAdm_ModCon: TDBEdit;
      dbedDem_ModCon: TDBEdit;
      dbedMotivo: TDBEdit;
      dbedEstab: TDBEdit;
      Label60: TLabel;
      Label61: TLabel;
      Label62: TLabel;
      Label63: TLabel;
      dbedRazao: TDBEdit;
      dbedNumDoc: TDBEdit;
      dbrgTipoPessoa: TDBRadioGroup;
      dbedEmail: TDBEdit;
      dbedLogra: TDBEdit;
      dbedNumLogra: TDBEdit;
      dbedComplem: TDBEdit;
      dbedBairro: TDBEdit;
      Label51: TLabel;
      Label53: TLabel;
      Label54: TLabel;
      Label55: TLabel;
      Label56: TLabel;
      Label57: TLabel;
      Label58: TLabel;
      Label59: TLabel;
      dbedPlano: TDBEdit;
      dbedInscNum: TDBEdit;
      dbedInscData: TDBEdit;
      dbedPatro: TDBEdit;
      dbedCargoI: TDBEdit;
      dbedSalAtual_ProcPrev: TDBEdit;
      dbedAdm_ProcPrev: TDBEdit;
      dbedDem_ProcPrev: TDBEdit;
      MontaSelectPartic: TMontaSelect;
      dbrgCategoria2: TDBRadioGroup;
      Procedure dbreCustoChange(Sender: TObject);
      Procedure sbtnFichaClick(Sender: TObject);
      Procedure spbtnProcContraparteClick(Sender: TObject);
      Procedure spbtnProcLitisconsorteClick(Sender: TObject);
      Procedure dsLitisStateChange(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
   Private
      Procedure AssociarComponentesPart;
   Protected
      Procedure OnMudarParametrosTela; Override;
      Procedure OnMudarDadosParticipante; Override;
      Function GetDataDemissao: TDate; Override;
      Procedure OnClick_ProcurarProcesso; Override;
      Procedure OnClick_ProcurarProcessoComLitisconsortes; Override;
   End;

Var
   frmCadProcesso: TfrmCadProcesso;
Implementation

{$R *.DFM}

Uses uMensErro, uCtrlFuncoesRH, fProcuraPessoaDoc, RFichaProc,
   fParamFichaProc, uSistema, fCustomParamFichaProc, FCmReport;

Procedure TfrmCadProcesso.OnMudarParametrosTela;
Begin
   // Mudar Rótulos dos Combos de integração
   dblckTipoDesemb.Options := [loColLines, loTitles];
   dblckTipoDesemb.Selected.Add('RECPAG' + #9 + '07' + #9 + 'Rec / Pag');

   dblckTipoDoc.Options := [loColLines, loTitles];
   dblckTipoDoc.Selected.Add('RECPAG' + #9 + '07' + #9 + 'Rec / Pag');
   dblckTipoDoc.Selected.Add('DEBCRE' + #9 + '35' + #9 + 'D/C');

   DataAjuizamento := dbedDataAju2;
   DataNotificacao := dbedDataNot2;
End;

Procedure TfrmCadProcesso.OnMudarDadosParticipante;
Begin
   CdsPartic.Close;
   AssociarComponentesPart;

   If Cds.FieldByName('INDMATERIA').asInteger = 1 Then
      Begin
         CdsPartic.Data := CtrlPessoaFuncionario.ListDadosParticipante(
            Cds.FieldByName('IDRECLAMANTE').asFloat);
         If Cds.State In [dsInsert, dsEdit] Then
            Cds.FieldByName('CODCCUSTOCPARTE').asString :=
               CdsPartic.FieldByName('CODCENTROCUSTO').asString;
      End
   Else If Cds.FieldByName('INDMATERIA').asInteger In [2, 3] Then
      CdsPartic.Data := CtrlPessoaFuncionario.ListDadosParticipante_ComPlano(
         Cds.FieldByName('IDRECLAMANTE').asFloat, Cds.FieldByName('IDPATRO').asFloat,
         Cds.FieldByName('IDPLANOPREV').asFloat)
   Else
      CdsPartic.Data := CtrlPessoaFuncionario.ListDadosParticipante_ComEndereco(
         Cds.FieldByName('IDRECLAMANTE').asFloat);

   edNomeContraparte.Text := CdsPartic.FieldByName('NOME').asString;
End;

Procedure TfrmCadProcesso.dbreCustoChange(Sender: TObject);
Begin
   Inherited;
   If (CdsPartic.Active) Then
      redValorAtual.Value := CtrlCalcRub.ValorAtualProcesso(
         Cds.FieldByName('CUSTOPROC').asFloat,
         Cds.FieldByName('DATANOTIF').asString,
         Cds.FieldByName('MOEDAPROCTRAB').asString,
         Cds.FieldByName('IDREGRA').asString,
         Cds.FieldByName('NUMPROCTRAB').asString,
         dbrgIndTaxaConv.ItemIndex);
End;

Function TfrmCadProcesso.GetDataDemissao: TDate;
Begin
   If (Cds.FieldByName('INDMATERIA').asInteger = 1) And // ModCon
   Not (CdsPartic.FieldByName('DATADEMISSAO').IsNull) And
      (CdsPartic.FieldByName('DATADEMISSAO').asString <> '') Then
      Result := CdsPartic.FieldByName('DATADEMISSAO').asDateTime
   Else
      Result := 0;
End;

Procedure TfrmCadProcesso.AssociarComponentesPart;
Begin
   Case (Cds.FieldByName('INDMATERIA').asInteger) Of
      1: // ModCon
         Begin
            ntbkDadosRequerente.ActivePage := 'ModCon';
            dbedCargo.DataSource := dsPartic;
            dbedSalAtual_ModCon.DataSource := dsPartic;
            dbrgTipoSalar.DataSource := dsPartic;
            dbedAdm_ModCon.DataSource := dsPartic;
            dbedDem_ModCon.DataSource := dsPartic;
            dbedMotivo.DataSource := dsPartic;
            dbedEstab.DataSource := dsPartic;

            dbedPlano.DataSource := Nil;
            dbedInscNum.DataSource := Nil;
            dbedInscData.DataSource := Nil;
            dbedPatro.DataSource := Nil;
            dbedCargoI.DataSource := Nil;
            dbedSalAtual_ProcPrev.DataSource := Nil;
            dbedAdm_ProcPrev.DataSource := Nil;
            dbedDem_ProcPrev.DataSource := Nil;

            dbedRazao.DataSource := Nil;
            dbedNumDoc.DataSource := Nil;
            dbrgTipoPessoa.DataSource := Nil;
            dbedEmail.DataSource := Nil;
            dbedLogra.DataSource := Nil;
            dbedNumLogra.DataSource := Nil;
            dbedComplem.DataSource := Nil;
            dbedBairro.DataSource := Nil;
         End;
      2, 3: // ProcPrev
         Begin
            ntbkDadosRequerente.ActivePage := 'Procprev';
            dbedPlano.DataSource := dsPartic;
            dbedInscNum.DataSource := dsPartic;
            dbedInscData.DataSource := dsPartic;
            dbedPatro.DataSource := dsPartic;
            dbedCargoI.DataSource := dsPartic;
            dbedSalAtual_ProcPrev.DataSource := dsPartic;
            dbedAdm_ProcPrev.DataSource := dsPartic;
            dbedDem_ProcPrev.DataSource := dsPartic;

            dbedCargo.DataSource := Nil;
            dbedSalAtual_ModCon.DataSource := Nil;
            dbrgTipoSalar.DataSource := Nil;
            dbedAdm_ModCon.DataSource := Nil;
            dbedDem_ModCon.DataSource := Nil;
            dbedMotivo.DataSource := Nil;
            dbedEstab.DataSource := Nil;

            dbedRazao.DataSource := Nil;
            dbedNumDoc.DataSource := Nil;
            dbrgTipoPessoa.DataSource := Nil;
            dbedEmail.DataSource := Nil;
            dbedLogra.DataSource := Nil;
            dbedNumLogra.DataSource := Nil;
            dbedComplem.DataSource := Nil;
            dbedBairro.DataSource := Nil;
         End;
   Else // ProcJud
      Begin
         ntbkDadosRequerente.ActivePage := 'ProcJud';
         dbedRazao.DataSource := dsPartic;
         dbedNumDoc.DataSource := dsPartic;
         dbrgTipoPessoa.DataSource := dsPartic;
         dbedEmail.DataSource := dsPartic;
         dbedLogra.DataSource := dsPartic;
         dbedNumLogra.DataSource := dsPartic;
         dbedComplem.DataSource := dsPartic;
         dbedBairro.DataSource := dsPartic;

         dbedCargo.DataSource := Nil;
         dbedSalAtual_ModCon.DataSource := Nil;
         dbrgTipoSalar.DataSource := Nil;
         dbedAdm_ModCon.DataSource := Nil;
         dbedDem_ModCon.DataSource := Nil;
         dbedMotivo.DataSource := Nil;
         dbedEstab.DataSource := Nil;

         dbedPlano.DataSource := Nil;
         dbedInscNum.DataSource := Nil;
         dbedInscData.DataSource := Nil;
         dbedPatro.DataSource := Nil;
         dbedCargoI.DataSource := Nil;
         dbedSalAtual_ProcPrev.DataSource := Nil;
         dbedAdm_ProcPrev.DataSource := Nil;
         dbedDem_ProcPrev.DataSource := Nil;
      End;
   End;
End;

Procedure TfrmCadProcesso.OnClick_ProcurarProcesso;
Begin
   //  if MontaSelect.CamposChave.Count = 1 then
   //    MontaSelect.CamposChave.Add('PESSOA.NOME');
End;

Procedure TfrmCadProcesso.OnClick_ProcurarProcessoComLitisconsortes;
Begin
   //  if MontaSelect.CamposChave.Count = 1 then
   //    MontaSelect.CamposChave.Add('PESSOA.NOME');
End;

Procedure TfrmCadProcesso.sbtnFichaClick(Sender: TObject);
Var
   c: integer;
Begin
   //  inherited;
   With TfrmParamFichaProc.Create(Application) Do
      Begin
         edNumero.Text := dbedNumProcesso.Text;
         edContraParte.Text := edNomeContraparte.Text;
         sTipoPessoa := 'F';
         HabilitarBtOk;
         If (ShowModal = mrOk) Then
            Begin
               RptFichaProc := TRptFichaProc.Create(Application);
               RptFichaProc.CrmRptCM.IdReports := 4077;
               RptFichaProc.CrmRptCM.IdEmpresa := Sistema.IdEmpresa;
               RptFichaProc.CrmRptCM.OrigemCM := 1;
               RptFichaProc.CrmRptCM.IdModulo := Sistema.IdModulo;
               RptFichaProc.CrmRptCM.IdUsuario := Sistema.IdUsuario;
               For c := 0 To Cmp_Padrao.Params.Count - 1 Do
                  RptFichaProc.CmpRptCM.ParamValues[c].Value := Cmp_Padrao.ParamValues[c].Value;
               RptFichaProc.CrmRptCM.Print;
               FreeAndNil(RptFichaProc);
            End;
      End;
End;
{
var
  c: integer;
  Frm: TfrmCustomParamFichaProc;
  Rpt: TFrmCmReport;
begin
  // Criar Form de Parâmetros de acordo com o módulo
  case (dbrgMateria.ItemIndex) of
    0    :
    begin
      Frm := TfrmParamFichaProc_ModCon.Create(Application);
      Frm.TipoPessoa := 'F';
    end;
    1..2 :
    begin
      Frm := TfrmParamFichaProc_ProcPrev.Create(Application);
      Frm.TipoPessoa := '';
    end;
    3..6 :
    begin
      Frm := TfrmParamFichaProc_ProcJud.Create(Application);
      Frm.TipoPessoa := '';
    end;
  end;

  try
    CopiarDadosMontaSelect(MontaSelect, Frm.MontaSelect);
    Frm.MontaSelect.SensivelACaixa[0] := 'S';
    Frm.MontaSelect.ItemsBusca.Add(edNomeContraparte.Text);
    Frm.edNumero.Text := dbedNumProcesso.Text;
    Frm.edNomeContraparte.Text := edNomeContraparte.Text;
    Frm.NomeNossoAdvog := CMProcuraAdv2.Text;
    Frm.OnClose := FormCloseParamFichaProc;
    Frm.IdReports := 4077;
    Frm.HabilitarBtOk;
    if (Frm.ShowModal = mrOk) then
    begin
      // Criar Relatório de acordo com o módulo
      case (dbrgMateria.ItemIndex) of
        0    : Rpt := TRptFichaProc_ModCon.Create(Application);
        1..2 : Rpt := TRptFichaProc_ProcPrev.Create(Application);
        3..6 : Rpt := TRptFichaProc_ProcJud.Create(Application);
      end;
      try
        Rpt.CrmRptCM.IdReports := Frm.IdReports;
        Rpt.CrmRptCM.IdEmpresa := Sistema.IdEmpresa;
        Rpt.CrmRptCM.OrigemCM := 1;
        Rpt.CrmRptCM.IdModulo := Sistema.IdModulo;
        Rpt.CrmRptCM.IdUsuario := Sistema.IdUsuario;
        for c:=0 to Frm.Cmp_Padrao.Params.Count-1 do
          Rpt.CmpRptCM.ParamValues[c].Value := Frm.Cmp_Padrao.ParamValues[c].Value;
        Rpt.CrmRptCM.Print;
      finally
        Rpt.Free;
      end;
    end;
  finally
    Frm.Free;
  end;
end;
}

Procedure TfrmCadProcesso.spbtnProcContraparteClick(Sender: TObject);
Begin
   If (Cds.State In [dsInsert, dsEdit]) And (dbrgMateria.ItemIndex In [1, 2]) And
      (MsgDlg('Deseja Restringir a Busca a Participantes?', 'Confirmação',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then
      Begin
         MontaSelectPartic.Executar;
         If (MontaSelectPartic.RetornouValor) Then
            Begin
               Cds.FieldByName('IDRECLAMANTE').asString := MontaSelectPartic.ValoresChave[0];
               Cds.FieldByName('IDPATRO').asFloat := StrToFloat(MontaSelectPartic.ValoresChave[2]);
               Cds.FieldByName('IDPLANOPREV').asFloat := StrToFloat(MontaSelectPartic.ValoresChave[3]);
               edNomeContraparte.Text := MontaSelectPartic.ValoresChave[1];
               OnMudarDadosParticipante;
               MudarNomeSubConta(edNomeContraparte.Text);
            End;
         exit;
      End;

   If (Cds.State In [dsInsert, dsEdit]) And (dbrgMateria.ItemIndex = 0) And
      (MsgDlg('Deseja Restringir a Busca a (ex-)Empregados?', 'Confirmação',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then
      Begin
         MontaSelectFunc.Executar;
         If (MontaSelectFunc.RetornouValor) Then
            Begin
               Cds.FieldByName('IDRECLAMANTE').asString := MontaSelectFunc.ValoresChave[0];
               edNomeContraparte.Text := MontaSelectFunc.ValoresChave[1];
               OnMudarDadosParticipante;
               MudarNomeSubConta(edNomeContraparte.Text);
            End;
         exit;
      End;

   Inherited;
   {  if (Cds.State in [dsInsert,dsEdit]) and (frmProcuraPessoaDoc.ShowModal = mrOk) then
     begin
       Cds.FieldByName('IDRECLAMANTE').asString := frmProcuraPessoaDoc.sIDPessoa;
       edNomeContraparte.Text := frmProcuraPessoaDoc.sNomePessoa;
       OnMudarDadosParticipante;
       MudarNomeSubConta(edNomeContraparte.Text);
     end; }
End;

Procedure TfrmCadProcesso.spbtnProcLitisconsorteClick(Sender: TObject);
Begin
   If (Cds.State In [dsInsert, dsEdit]) And (dbrgMateria.ItemIndex In [1, 2]) And
      (MsgDlg('Deseja Restringir a Busca a Participantes?', 'Confirmação',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then
      Begin
         MontaSelectPartic.Executar;
         If (MontaSelectPartic.RetornouValor) Then
            Begin
               CdsLitis.FieldByName('IDPESSOA').asString := MontaSelectPartic.ValoresChave[0];
               CdsLitis.FieldByName('IDPLANPREVCTBPATR').asString :=
                  CtrlProcessoTrab.RetornaPlanoPatro(MontaSelectPartic.ValoresChave[3], MontaSelectPartic.ValoresChave[2]);
               edLitisconsorte.Text := MontaSelectPartic.ValoresChave[1];
               If (CdsLitis.State = dsInsert) Then
                  Begin
                     CdsOutroProc.Data := CtrlProcessoTrab.VerificaContraParte(CdsLitis.FieldByName('IDPESSOA').asString);
                     If Not (CdsOutroProc.IsEmpty) Then
                        Begin
                           townOutroProc.Top := 200;
                           townOutroProc.BringToFront;
                           townOutroProc.Visible := true;
                           Self.Enabled := false;
                        End;
                  End;
            End;
         exit;
      End;

   If (Cds.State In [dsInsert, dsEdit]) And (dbrgMateria.ItemIndex = 0) And
      (MsgDlg('Deseja Restringir a Busca a (ex-)Empregados?', 'Confirmação',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then
      Begin
         MontaSelectFunc.Executar;
         If (MontaSelectFunc.RetornouValor) Then
            Begin
               CdsLitis.FieldByName('IDPESSOA').asString := MontaSelectFunc.ValoresChave[0];
               edLitisconsorte.Text := MontaSelectFunc.ValoresChave[1];
               CdsLitis.FieldByName('CODCENTROCUSTO').asString :=
                  CtrlPessoaFuncionario.GetCodCentroCusto(CdsLitis.FieldByName('IDPESSOA').asFloat);
               If (CdsLitis.State = dsInsert) Then
                  Begin
                     CdsOutroProc.Data := CtrlProcessoTrab.VerificaContraParte(CdsLitis.FieldByName('IDPESSOA').asString);
                     If Not (CdsOutroProc.IsEmpty) Then
                        Begin
                           townOutroProc.Top := 200;
                           townOutroProc.BringToFront;
                           townOutroProc.Visible := true;
                           Self.Enabled := false;
                        End;
                  End;
            End;
         exit;
      End;
   Inherited;
End;

Procedure TfrmCadProcesso.dsLitisStateChange(Sender: TObject);
Begin
   Inherited;
   If (CdsLitis.State In [dsInsert, dsEdit]) Then
      Begin
         dbrgCategoria.Visible := rgAtivo.ItemIndex <> 2;
         dbrgCategoria2.Visible := rgAtivo.ItemIndex = 2;
      End;
End;

Procedure TfrmCadProcesso.FormCreate(Sender: TObject);
Begin
   iTipoIntegraCAPCAR := CAPCAR; // Indica que este módulo osmente faz integração com o CAP e CAR
   Inherited;
End;

End.

