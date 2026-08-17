unit FAplicacaoFinanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, DBCtrls, wwdblook, CMDBLookupCombo, Mask, wwdbedit, TREdit,
  wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro, ImgList;

type
  TfrmAplicacaoFinanc = class(TfrmCadastroCS)
    dbgrTipoOper: TDBRadioGroup;
    pnlAplicacao: TPanel;
    dblcPortadorConta: TCMDBLookupCombo;
    lblPortadorConta: TLabel;
    lblContaAplic: TLabel;
    qryPortadorConta: TwwQuery;
    dbreNumCotas: TDBRealEdit;
    lblNumCotas: TLabel;
    qryCODLANCAPLIC: TFloatField;
    qryTIPOAPLICACAO: TFloatField;
    qryPLNCODIGO: TFloatField;
    qryMOEDACOTA: TFloatField;
    qryCODPORTADOR: TFloatField;
    qryCODLANCFINANC: TFloatField;
    qryAPLICRESGATEJUROS: TStringField;
    qryVALOR: TFloatField;
    qryCONTAAPLICACAO: TFloatField;
    qryPRAZORESGATE: TFloatField;
    qryDATAPREVRESGATE: TDateTimeField;
    qryDATALANCAMENTO: TDateTimeField;
    qryNUMCOTAS: TFloatField;
    qryIDPESSOA: TFloatField;
    dbreValor: TDBRealEdit;
    lblValor: TLabel;
    lblMoedaCota: TLabel;
    dblcMoeda: TCMDBLookupCombo;
    dbdtLanc: TCMDateTimePicker;
    lblDtLanc: TLabel;
    dblcTipoAplic: TCMDBLookupCombo;
    lblTipoAplic: TLabel;
    dbrePrazoResgate: TDBRealEdit;
    lblPrazoResg: TLabel;
    dbdtResgate: TCMDateTimePicker;
    lblDataPrevResg: TLabel;
    dbreJurosPrev: TDBRealEdit;
    lblTxPrev: TLabel;
    qryMoeda: TwwQuery;
    qryTipoAplic: TwwQuery;
    qryVLRRESGPREV: TFloatField;
    qrySelConta: TwwQuery;
    qrySelContaTIPOAPLICACAO: TFloatField;
    qrySelContaMOEDACOTA: TFloatField;
    qrySelContaCODPORTADOR: TFloatField;
    qrySelContaCODLANCAPLIC: TFloatField;
    qrySelContaCONTAAPLICACAO: TFloatField;
    qrySelContaPRAZORESGATE: TFloatField;
    qrySelContaJUROSPREVISTOS: TFloatField;
    sbProcuraContaAplic: TSpeedButton;
    qryCalcSaldoAplic: TwwQuery;
    qryCalcSaldoAplicSALDOVALOR: TFloatField;
    qryCalcSaldoAplicSALDOCOTAS: TFloatField;
    dbreContaAplicacao: TwwDBEdit;
    qryJUROSPREVISTOS: TFloatField;
    sbtnBuscaInvest: TToolbarButton97;
    qryInvestimento: TwwQuery;
    qryPERCUSTO: TFloatField;
    gbDespesa: TGroupBox;
    Label1: TLabel;
    dbreDespAplic: TDBRealEdit;
    dbreDespRend: TDBRealEdit;
    Label2: TLabel;
    qryPERCUSTOREND: TFloatField;
    lblValorResgPrev: TLabel;
    dbreValorPrev: TDBRealEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbdtLancExit(Sender: TObject);
    procedure dbrePrazoResgateExit(Sender: TObject);
    procedure dblcMoedaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dbreNumCotasExit(Sender: TObject);
    procedure dbreValorExit(Sender: TObject);
    procedure dbreContaAplicacaoExit(Sender: TObject);
    procedure sbProcuraContaAplicClick(Sender: TObject);
    procedure dbgrTipoOperExit(Sender: TObject);
    procedure dbdtResgateExit(Sender: TObject);
    procedure dbreDespAplicExit(Sender: TObject);
    procedure dbreDespRendExit(Sender: TObject);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAplicacaoFinanc: TfrmAplicacaoFinanc;
  rValorCotacao     : Double;
  bTemConta         : Boolean;
  rNumCotas, rValorResgate, rValorRendimento, rValorCustoAplic, rValorCustoResgate : Double;
implementation

{$R *.DFM}

Uses uSistema, uFuncaoGeral, uDataBase, uMensErro, uModulo;

procedure TfrmAplicacaoFinanc.FormCreate(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.ParamByName('CODLANCAPLIC').AsFloat := -1;
  qry.Open;
  //
  MontaSelect.Filtro.Add('APLICACOES.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
end;

procedure TfrmAplicacaoFinanc.FormActivate(Sender: TObject);
begin
  inherited;
  qryTipoAplic.Close;
  qryTipoAplic.Open;
  //
  qryMoeda.Close;
  qryMoeda.Open;
  //
  qryPortadorConta.Close;
  qryPortadorConta.ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
  qryPortadorConta.Open;
  //
end;

procedure TfrmAplicacaoFinanc.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dblcMoeda.Enabled             := true;
  dblcTipoAplic.Enabled         := true;
  dblcPortadorConta.Enabled     := true;
  dbgrTipoOper.Enabled          := True;
  qryAPLICRESGATEJUROS.AsString := 'A';
  qryIDPESSOA.AsInteger         := Sistema.IdEmpresa;
  dbdtResgate.Text              := DateToStr(Date);
  dbdtResgate.Date              := Date;
  qryDATALANCAMENTO.AsDateTime  := Date;
  dbreNumCotas.Enabled          := False;
  dbreValor.Enabled             := True;
  dbgrTipoOper.SetFocus;
end;

procedure TfrmAplicacaoFinanc.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dblcMoeda.Enabled         := true;
  dblcTipoAplic.Enabled     := true;
  dblcPortadorConta.Enabled := true;
  dbreContaAplicacao.SetFocus;
  dbgrTipoOper.Enabled := False;
  If qryMOEDACOTA.IsNull Then begin
     dbreNumCotas.Enabled  := False;
     dbreValor.Enabled     := True;
  end else begin
     dbreNumCotas.Enabled  := True;
     dbreValor.Enabled     := False;
  end;
end;

procedure TfrmAplicacaoFinanc.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor then begin
     qry.Close;
     qry.ParamByName('CODLANCAPLIC').AsFloat := StrToInt(MontaSelect.ValoresChave[0]);
     qry.Open;
  end;
end;

procedure TfrmAplicacaoFinanc.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmAplicacaoFinanc.CmeCadastroDelete(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmAplicacaoFinanc.dbdtLancExit(Sender: TObject);
begin
  inherited;
  qryDATAPREVRESGATE.AsDateTime := qryDATALANCAMENTO.AsDateTime + dbrePrazoResgate.Value;
  dbdtResgate.Date := qryDATAPREVRESGATE.AsDateTime;
  dbdtResgate.Text := DateToStr(qryDATAPREVRESGATE.AsDateTime);
  If not qryMOEDACOTA.IsNull Then begin
     rValorCotacao    := FuncaoGeral.TestaCotacaoMoeda(qryMOEDACOTA.AsInteger,dbdtLanc.Text,'S');
     if rValorCotacao = 0 then begin
        if bTemConta then
           bbtnCancelar.Click
        else
           qryMOEDACOTA.Clear;
        dbreNumCotas.Enabled := False;
        dbreValor.Enabled    := True;
     end else begin
        dbreNumCotas.Enabled := True;
        dbreValor.Enabled    := False;
        dbreValor.Value      := dbreNumCotas.Value * rValorCotacao;
        qryVALOR.AsFloat     := dbreValor.Value;
     end;
  end;
end;

procedure TfrmAplicacaoFinanc.dbrePrazoResgateExit(Sender: TObject);
begin
  inherited;
  qryDATAPREVRESGATE.AsDateTime := qryDATALANCAMENTO.AsDateTime + dbrePrazoResgate.Value;
  dbdtResgate.Date := qryDATAPREVRESGATE.AsDateTime;
  dbdtResgate.Text := DateToStr(qryDATAPREVRESGATE.AsDateTime);
end;

procedure TfrmAplicacaoFinanc.dblcMoedaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If dblcMoeda.LookupValue <> '' Then begin
     dbreNumCotas.Enabled := True;
     dbreValor.Enabled    := False;
     rValorCotacao        := FuncaoGeral.TestaCotacaoMoeda(qryMOEDACOTA.AsInteger,dbdtLanc.Text,'S');
     if rValorCotacao = 0 then begin
        if bTemConta then
           bbtnCancelar.Click
        else
           qryMOEDACOTA.Clear;
        dbreNumCotas.Enabled := False;
        dbreValor.Enabled    := True;
     end else begin
        dbreNumCotas.Enabled := True;
        dbreValor.Enabled    := False;
        dbreValor.Value      := dbreNumCotas.Value * rValorCotacao;
        qryVALOR.AsFloat     := dbreValor.Value;
     end;
  end else begin
     dbreNumCotas.Enabled := False;
     dbreValor.Enabled    := True;
  end;
end;

procedure TfrmAplicacaoFinanc.dbreNumCotasExit(Sender: TObject);
begin
  inherited;
  rValorCotacao    := FuncaoGeral.TestaCotacaoMoeda(qryMOEDACOTA.AsInteger,dbdtLanc.Text,'S');
  if rValorCotacao = 0 then begin
     if bTemConta then
        bbtnCancelar.Click
     else
        qryMOEDACOTA.Clear;
     dbreNumCotas.Enabled := False;
     dbreValor.Enabled    := True;
  end else begin
     dbreNumCotas.Enabled := True;
     dbreValor.Enabled    := False;
     dbreValor.Value      := dbreNumCotas.Value * rValorCotacao;
     qryVALOR.AsFloat     := dbreValor.Value;
  end;
  if not Modulo.CalcValorPrev(false,true,qryAPLICRESGATEJUROS.AsString, dbreNumCotas.Value,
                       dbreJurosPrev.Value, dbrePrazoResgate.Value, dbreValor.Value,
                       dbreDespAplic.Value, dbreDespRend.Value,
                       dbdtResgate.Date, dbdtLanc.Date, qryMOEDACOTA.AsInteger,
                       rValorResgate, rValorRendimento, rValorCustoAplic, rValorCustoResgate, rNumCotas) then begin
     dbreValorPrev.Value    := rValorResgate;
     qryVLRRESGPREV.AsFloat := rValorResgate;
     dbdtResgate.SetFocus;
     Exit;
  end;
  dbreValorPrev.Value    := rValorResgate;
  qryVLRRESGPREV.AsFloat := rValorResgate;
end;

procedure TfrmAplicacaoFinanc.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
Begin
   Accept := False;
   If (dbreContaAplicacao.Text = '') then begin
      MsgDlg('Obrigatório preencher a Conta de Aplicação','Erro',mtError,[mbOk],0);
      dbreContaAplicacao.SetFocus;
      Exit;
   end;
   If dbgrTipoOper.ItemIndex = 0 then begin
      if trim(dblcTipoAplic.Text) = '' then begin
         MsgDlg('Obrigatório preencher o Tipo de Aplicação','Erro',mtError,[mbOk],0);
         dblcTipoAplic.SetFocus;
         Exit;
      end;
      if trim(dblcPortadorConta.Text) = '' then begin
         MsgDlg('Obrigatório preencher a Conta Bancária/Caixa','Erro',mtError,[mbOk],0);
         dblcPortadorConta.SetFocus;
         Exit;
      end;
      if dbrePrazoResgate.Value = 0 then begin
         MsgDlg('Obrigatório preencher o Prazo de Resgate','Erro',mtError,[mbOk],0);
         dbrePrazoResgate.SetFocus;
         Exit;
      end;
      if trim(dbdtResgate.Text) = '' then begin
         MsgDlg('Obrigatório preencher a Data Prevista de Resgate','Erro',mtError,[mbOk],0);
         dbdtResgate.SetFocus;
         Exit;
      end;
      if (dbreJurosPrev.Value = 0) and (trim(dblcMoeda.Text) = '') and (dbreValorPrev.Value = 0) then begin
         MsgDlg('Obrigatório preencher os Juros Previsto ou a Moeda da Cota ou o Valor Previsto de Resgate','Erro',mtError,[mbOk],0);
         dbreJurosPrev.SetFocus;
         Exit;
      end;
   end;
   if trim(dbdtLanc.Text) = '' then begin
      MsgDlg('Obrigatório preencher a Data do Lançamento','Erro',mtError,[mbOk],0);
      dbdtLanc.SetFocus;
      Exit;
   end;
   if dbreValor.Value = 0 then begin
      MsgDlg('Obrigatório preencher o Valor do Lançamento','Erro',mtError,[mbOk],0);
      dbreValor.SetFocus;
      Exit;
   end;
   Accept := True;
   If qryCODLANCAPLIC.IsNull Then
      qryCODLANCAPLIC.AsFloat := LeUltRegistro(nil,'APLICACOES');
end;


procedure TfrmAplicacaoFinanc.dbreValorExit(Sender: TObject);
begin
  inherited;
  if not Modulo.CalcValorPrev(false,true, qryAPLICRESGATEJUROS.AsString, dbreNumCotas.Value,
                       dbreJurosPrev.Value, dbrePrazoResgate.Value, dbreValor.Value,
                       dbreDespAplic.Value, dbreDespRend.Value,
                       dbdtResgate.Date, dbdtLanc.Date, qryMOEDACOTA.AsInteger,
                       rValorResgate, rValorRendimento, rValorCustoAplic, rValorCustoResgate, rNumCotas) then begin
     dbreValorPrev.Value    := rValorResgate;
     qryVLRRESGPREV.AsFloat := rValorResgate;
     dbdtResgate.SetFocus;
     Exit;
  end;
  dbreValorPrev.Value    := rValorResgate;
  qryVLRRESGPREV.AsFloat := rValorResgate;
end;

procedure TfrmAplicacaoFinanc.dbreContaAplicacaoExit(Sender: TObject);
begin
  inherited;
  If ActiveControl.Tag <> 999 then
   begin
      bTemConta := False;
      qrySelConta.Close;
      qrySelConta.ParamByName('CONTAAPLICACAO').AsFloat := StrToFloat(dbreContaAplicacao.Text);
      qrySelConta.ParamByName('IDPESSOA').AsFloat       := Sistema.IdEmpresa;
      qrySelConta.ParamByName('CODLANCAPLIC').AsFloat   := qryCODLANCAPLIC.AsFloat;
      qrySelConta.Open;
      If not qrySelConta.isEmpty then
       begin
          dblcMoeda.Enabled         := false;
          dblcTipoAplic.Enabled     := false;
          dblcPortadorConta.Enabled := false;
          //
          if not qrySelContaMOEDACOTA.IsNull then
             qryMOEDACOTA.AsInteger  := qrySelContaMOEDACOTA.AsInteger;

          qryTIPOAPLICACAO.AsInteger := qrySelContaTIPOAPLICACAO.AsInteger;
          qryCODPORTADOR.AsInteger   := qrySelContaCODPORTADOR.AsInteger;
          dbrePrazoResgate.Value     := qrySelContaPRAZORESGATE.AsInteger;
          dbreJurosPrev.Value        := qrySelContaJUROSPREVISTOS.AsFloat;
          qryPRAZORESGATE.AsInteger  := qrySelContaPRAZORESGATE.AsInteger;
          qryJUROSPREVISTOS.AsFloat  := qrySelContaJUROSPREVISTOS.AsFloat;
          //
          If qryAPLICRESGATEJUROS.AsString = 'R' then
           begin
              qryCalcSaldoAplic.Close;
              qryCalcSaldoAplic.ParamByName('CONTAAPLICACAO').AsFloat := StrToFloat(dbreContaAplicacao.Text);
              qryCalcSaldoAplic.ParamByName('IDPESSOA').AsFloat       := Sistema.IdEmpresa;
              qryCalcSaldoAplic.Open;
              //
              if not qrySelContaMOEDACOTA.IsNull then
               begin
                  dbreNumCotas.Value  := qryCalcSaldoAplicSALDOCOTAS.AsFloat;
                  qryNUMCOTAS.AsFloat := qryCalcSaldoAplicSALDOCOTAS.AsFloat;
               end
              else
               begin
                 //Calcular o valor do resgate estimado.
               end;
           end;
          //
          bTemConta := True;
       end
      else
       begin
          If qryAPLICRESGATEJUROS.AsString <> 'A' then
           begin
              MsgDlg('Obrigatório existir a Conta de Aplicação para Lançar Resgate ou Juros','Erro',mtError,[mbOk],0);
              dbreContaAplicacao.SetFocus;
              Exit;
           end;
       end;
   end;
end;

procedure TfrmAplicacaoFinanc.sbProcuraContaAplicClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Executar;
  If MontaSelect.RetornouValor then begin
     qryCONTAAPLICACAO.AsInteger := StrToInt(MontaSelect.ValoresChave[1]);
     dbreContaAplicacao.Text     := FloatToStr(qryCONTAAPLICACAO.AsFloat);
     dbreContaAplicacao.SetFocus;
  end;
end;

procedure TfrmAplicacaoFinanc.dbgrTipoOperExit(Sender: TObject);
begin
  inherited;
  dblcTipoAplic.Enabled     := qryAPLICRESGATEJUROS.AsString = 'A';
  dblcPortadorConta.Enabled := qryAPLICRESGATEJUROS.AsString = 'A';
  dbrePrazoResgate.Enabled  := qryAPLICRESGATEJUROS.AsString = 'A';
  dbdtResgate.Enabled       := qryAPLICRESGATEJUROS.AsString = 'A';
  dbreJurosPrev.Enabled     := qryAPLICRESGATEJUROS.AsString = 'A';
  dbreValorPrev.Enabled     := qryAPLICRESGATEJUROS.AsString = 'A';
end;

procedure TfrmAplicacaoFinanc.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  sbtnBuscaInvest.Enabled := sbtnProcurar.Enabled;
end;

procedure TfrmAplicacaoFinanc.dbdtResgateExit(Sender: TObject);
begin
  inherited;
  qryPRAZORESGATE.AsInteger := StrToInt(FloatToStr(dbdtResgate.Date - dbdtLanc.Date));
  dbrePrazoResgate.Value    := qryPRAZORESGATE.AsInteger;
end;

procedure TfrmAplicacaoFinanc.dbreDespAplicExit(Sender: TObject);
begin
  inherited;
  if not Modulo.CalcValorPrev(false,true, qryAPLICRESGATEJUROS.AsString, dbreNumCotas.Value,
                       dbreJurosPrev.Value, dbrePrazoResgate.Value, dbreValor.Value,
                       dbreDespAplic.Value, dbreDespRend.Value,
                       dbdtResgate.Date, dbdtLanc.Date, qryMOEDACOTA.AsInteger,
                       rValorResgate, rValorRendimento, rValorCustoAplic, rValorCustoResgate, rNumCotas) then begin
     dbreValorPrev.Value    := rValorResgate;
     qryVLRRESGPREV.AsFloat := rValorResgate;
     dbdtResgate.SetFocus;
     Exit;
  end;
  dbreValorPrev.Value    := rValorResgate;
  qryVLRRESGPREV.AsFloat := rValorResgate;
end;

procedure TfrmAplicacaoFinanc.dbreDespRendExit(Sender: TObject);
begin
  inherited;
  if not Modulo.CalcValorPrev(false,true, qryAPLICRESGATEJUROS.AsString, dbreNumCotas.Value,
                       dbreJurosPrev.Value, dbrePrazoResgate.Value, dbreValor.Value,
                       dbreDespAplic.Value, dbreDespRend.Value,
                       dbdtResgate.Date, dbdtLanc.Date, qryMOEDACOTA.AsInteger,
                       rValorResgate, rValorRendimento, rValorCustoAplic, rValorCustoResgate, rNumCotas) then begin
     dbreValorPrev.Value    := rValorResgate;
     qryVLRRESGPREV.AsFloat := rValorResgate;
     dbdtResgate.SetFocus;
     Exit;
  end;
  dbreValorPrev.Value    := rValorResgate;
  qryVLRRESGPREV.AsFloat := rValorResgate;
end;

end.
