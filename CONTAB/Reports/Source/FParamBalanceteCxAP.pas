{-------------------------------------------------------------------------------
-------------------------------- ALTERAÇÕES ------------------------------------
--------------------------------------------------------------------------------

 SIG ..........: 102043
 Data .........: 22/12/2020
 Responsável ..: Everson Cunha
 Descrição ....: Máscara de conta por PLANO e período vigente
--------------------------------------------------------------------------------}


unit FParamBalanceteCxAP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CMProcuraMask, wwdblook, StdCtrls,
  wwdbdatetimepicker, CMDateTimePicker, Mask, Grids, Wwdbigrd, Wwdbgrid,
  ExtCtrls, Spin, ComCtrls, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, MontaSelect, uCmSqlParams, Db,
  DBClient, uCMClientDataSet,uCtrlContab, Wwdatsrc, wwclient,
  FileCtrl, BfDialogs, BrowseFolder, uProcuraDir,
  uCMTypes;

type
  TfrmParamBalanceteCxAP = class(TfrmParamReports_Padrao)
    grpDatas: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    dblkPeriodoIni: TwwDBLookupCombo;
    dblkPeriodoFim: TwwDBLookupCombo;
    Panel1: TPanel;
    Label5: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    mskCCustoIni: TMaskEdit;
    btnCCustoIni: TBitBtn;
    mskCCustoFim: TMaskEdit;
    btnCCustoFim: TBitBtn;
    mskAtivProjIni: TMaskEdit;
    btnAtivProjIni: TBitBtn;
    mskAtivProjFim: TMaskEdit;
    btnAtivProjFim: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label11: TLabel;
    chkMascara: TCheckBox;
    chkLingua: TCheckBox;
    chkGrupo: TCheckBox;
    chkIndenta: TCheckBox;
    chkAnaliticas: TCheckBox;
    spnPagIni: TSpinEdit;
    chkRateio: TCheckBox;
    rdgValores: TRadioGroup;
    chkContraNatureza: TCheckBox;
    cbDesconsidera: TCheckBox;
    cbDesconsideraEstatistica: TCheckBox;
    chkAtivProjSint: TCheckBox;
    TabSheet2: TTabSheet;
    Label8: TLabel;
    Label9: TLabel;
    edtTitulo: TEdit;
    edtSubTitulo: TEdit;
    sqlCCusto: TCMSqlParams;
    cdsCCusto: TCMClientDataSet;
    cdsAtivProj: TCMClientDataSet;
    sqlAtivProj: TCMSqlParams;
    MontaSelectAtivProj: TMontaSelect;
    MontaSelectCCusto: TMontaSelect;
    sqlExercicio: TCMSqlParams;
    cdsExercicio: TCMClientDataSet;
    cdsPeriodoIni: TCMClientDataSet;
    sqlPeriodoIni: TCMSqlParams;
    sqlAux1: TCMSqlParams;
    cdsAux1: TCMClientDataSet;
    sqlPeriodoFim: TCMSqlParams;
    cdsPeriodoFim: TCMClientDataSet;
    cmpContaIni: TCMProcuraMaskContabil;
    cmpContaFim: TCMProcuraMaskContabil;
    sqlPlanCentCusto: TCMSqlParams;
    cdsPlanCentCusto: TCMClientDataSet;
    procedure mskCCustoIniExit(Sender: TObject);
    procedure btnCCustoIniClick(Sender: TObject);
    procedure mskCCustoFimExit(Sender: TObject);
    procedure btnCCustoFimClick(Sender: TObject);
    procedure mskAtivProjIniExit(Sender: TObject);
    procedure btnAtivProjIniClick(Sender: TObject);
    procedure mskAtivProjFimExit(Sender: TObject);
    procedure btnAtivProjFimClick(Sender: TObject);
    procedure dblkExercicioClick(Sender: TObject);
    procedure dblkPeriodoIniCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmpContaIniExit(Sender: TObject);
    procedure cmpContaFimExit(Sender: TObject);
    procedure dblkPeriodoFimChange(Sender: TObject);
  private
    CtrlContab  : TCtrlContab;
  public
    { Public declarations }
  end;

var
  frmParamBalanceteCxAP: TfrmParamBalanceteCxAP;
  iPlano   :LongInt;
  sUnidNegocIni,sUnidNegocFim,sMascaraPlano :string;

implementation

uses UMensErro, uDatabase, DBaseDados, uSistema, uString,
     uModulo, uData, uFuncaoGeral, FSM_FxLib;

{$R *.DFM}

procedure TfrmParamBalanceteCxAP.mskCCustoIniExit(Sender: TObject);
var sCCusto : string;
begin
  inherited;
   if mskCCustoIni.text <> '' then begin
      sCCusto := mskCCustoIni.text;
      with sqlCCusto do begin
         Prepare;
         ParamByName('IDEMPRESA').asFloat := sistema.idEmpresa;
         ParamByName('CODEXTERNO').asString   := sCCusto;
         Open;
         if not cdsCCusto.isEmpty then begin
            mskCCustoIni.text := cdsCCusto.FieldByName('CODEXTERNO').asString;
         end else begin
            MsgDlg('O código do centro de custo informado não existe.','Aviso',mtWarning,[mbOk],0);
            mskCCustoIni.SetFocus;
         end;
      end;
   end;

end;

procedure TfrmParamBalanceteCxAP.btnCCustoIniClick(Sender: TObject);
var sCCusto : string;
begin
  inherited;
   MontaSelectCCusto.Executar;
   Repaint;

   if MontaSelectCCusto.RetornouValor then begin
      sCCusto := MontaSelectCCusto.ValoresChave[2];

      with sqlCCusto do begin
         Prepare;
         ParamByName('IDEMPRESA').asFloat := sistema.idEmpresa;
         ParamByName('CODEXTERNO').asString   := sCCusto;
         Open;
         mskCCustoIni.text   := cdsCCusto.FieldByName('CODEXTERNO').asString;
      end;
   end;

end;

procedure TfrmParamBalanceteCxAP.mskCCustoFimExit(Sender: TObject);
var sCCusto : string;
begin
  inherited;
   if mskCCustoFim.text <> '' then begin
      sCCusto := mskCCustoFim.text;
      with sqlCCusto do begin
         Prepare;
         ParamByName('IDEMPRESA').asFloat := sistema.idEmpresa;
         ParamByName('CODEXTERNO').asString   := sCCusto;
         Open;
         if not cdsCCusto.isEmpty then begin
            mskCCustoFim.text := cdsCCusto.FieldByName('CODEXTERNO').asString;
         end else begin
            MsgDlg('O código do centro de custo informado não existe.','Aviso',mtWarning,[mbOk],0);
            mskCCustoFim.SetFocus;
         end;
      end;
   end;

end;

procedure TfrmParamBalanceteCxAP.btnCCustoFimClick(Sender: TObject);
var sCCusto : string;
begin
  inherited;
   MontaSelectCCusto.Executar;
   Repaint;

   if MontaSelectCCusto.RetornouValor then begin
      sCCusto := MontaSelectCCusto.ValoresChave[2];
      with sqlCCusto do begin
         Prepare;
         ParamByName('IDEMPRESA').asFloat := sistema.idEmpresa;
         ParamByName('CODEXTERNO').asString   := sCCusto;
         Open;
         mskCCustoFim.text   := cdsCCusto.FieldByName('CODEXTERNO').asString;

      end;
   end;

end;

procedure TfrmParamBalanceteCxAP.mskAtivProjIniExit(Sender: TObject);
var sAtivProj : string;
begin
  inherited;
   if mskAtivProjIni.text <> '' then begin
      sAtivProj := mskAtivProjIni.text;
      with sqlAtivProj do begin
         Prepare;
         ParamByName('IDPESSOA').asFloat   := sistema.idEmpresa;
         ParamByName('UNIDNEGOC').asFloat  := StrToFloat(sAtivProj);
         Open;
         if not cdsAtivProj.isEmpty then begin
            mskAtivProjIni.text := cdsAtivProj.FieldByName('UNECODIGO').asString;
            sUnidNegocIni := IntToStr(cdsAtivProj.FieldByName('UNIDNEGOC').asInteger);
         end else begin
            MsgDlg('O código da atividade/projeto informado não existe.','Aviso',mtWarning,[mbOk],0);
            mskAtivProjIni.SetFocus;
         end;
      end;
   end;

end;

procedure TfrmParamBalanceteCxAP.btnAtivProjIniClick(Sender: TObject);
var
 sAtivProj: string;
begin
   inherited;

   MontaSelectAtivProj.Executar;
   Repaint;
   if MontaSelectAtivProj.RetornouValor then begin
      sAtivProj := MontaSelectAtivProj.ValoresChave[0];
      with sqlAtivProj do begin
         Prepare;
         ParamByName('IDPESSOA').asFloat  := sistema.idEmpresa;
         ParamByName('UNIDNEGOC').asFloat := StrToFloat(sAtivProj);
         Open;
         mskAtivProjIni.text     := cdsAtivProj.FieldByName('UNECODIGO').asString;
         sUnidNegocIni  := IntToStr(cdsAtivProj.FieldByName('UNIDNEGOC').asInteger);

      end;
   end;

end;

procedure TfrmParamBalanceteCxAP.mskAtivProjFimExit(Sender: TObject);
var sAtivProj : string;
begin
  inherited;
   if mskAtivProjFim.text <> '' then begin
      sAtivProj := mskAtivProjFim.text;
      with sqlAtivProj do begin
         Prepare;
         ParamByName('IDPESSOA').asFloat   := sistema.idEmpresa;
         ParamByName('UNIDNEGOC').asFloat  := StrToFloat(sAtivProj);
         Open;
         if not cdsAtivProj.isEmpty then begin
            mskAtivProjFim.text := cdsAtivProj.FieldByName('UNECODIGO').asString;
            sUnidNegocFim := IntToStr(cdsAtivProj.FieldByName('UNIDNEGOC').asInteger);
         end else begin
            MsgDlg('O código da atividade/projeto informado não existe.','Aviso',mtWarning,[mbOk],0);
            mskAtivProjFim.SetFocus;
         end;
      end;
   end;

end;

procedure TfrmParamBalanceteCxAP.btnAtivProjFimClick(Sender: TObject);
var
 sAtivProj: string;
begin
   inherited;

   MontaSelectAtivProj.Executar;
   Repaint;
   if MontaSelectAtivProj.RetornouValor then begin
      sAtivProj := MontaSelectAtivProj.ValoresChave[0];
      with sqlAtivProj do begin
         Prepare;
         ParamByName('IDPESSOA').asFloat  := sistema.idEmpresa;
         ParamByName('UNIDNEGOC').asFloat := StrToFloat(sAtivProj);
         Open;
         mskAtivProjFim.text     := cdsAtivProj.FieldByName('UNECODIGO').asString;
         sUnidNegocFim  := IntToStr(cdsAtivProj.FieldByName('UNIDNEGOC').asInteger);

      end;
   end;

end;

procedure TfrmParamBalanceteCxAP.dblkExercicioClick(Sender: TObject);
begin
  inherited;
   //Preenche a combo-box de período
   if dblkExercicio.text <> '' then begin
      with sqlPeriodoIni do begin
         Prepare;
         ParamByName('IDPESSOA').asInteger     := Sistema.idEmpresa;
         ParamByName('PEREXERCICIO').asInteger := StrToInt(dblkExercicio.text);
         Open;
      end;
      with sqlPeriodoFim do begin
         Prepare;
         ParamByName('IDPESSOA').asInteger     := Sistema.idEmpresa;
         ParamByName('PEREXERCICIO').asInteger := StrToInt(dblkExercicio.text);
         Open;
      end;
   end;

end;

procedure TfrmParamBalanceteCxAP.dblkPeriodoIniCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
var iPlanoAnt : LongInt;
begin
  inherited;
  if dblkExercicio.Text = '' then
  begin
    MsgDlg('O Exercício deve ser preenchido.','Erro',mtError,[mbOk],0);
    dblkPeriodoIni.Text := '';
    dblkExercicio.SetFocus;
    Exit;
  end else
  begin
    if dblkPeriodoIni.Text <> '' then begin
       sqlAux1.SQL.Clear;
       sqlAux1.SQL.Add('SELECT PERDATINI FROM PERIODO ');
       sqlAux1.SQL.Add('WHERE (PEREXERCICIO = '+dblkExercicio.LookupValue+')');
       sqlAux1.SQL.Add('  AND (PERNUMERO = '+dblkPeriodoIni.LookupValue+')');
       sqlAux1.SQL.Add('  AND (IDPESSOA = '+IntToStr(Sistema.idEmpresa)+')');
       sqlAux1.Open;
       //
       sMascaraPlano := Modulo.sMascaraContas;
       iPlanoAnt     := Modulo.iPlano;

       If CtrlContab.SelecionaPlanoData(Sistema.IdEmpresa, DateToStr(cdsAux1.FieldByName('PERDATINI').AsDateTime)) Then
          iPlano := CtrlContab.PlanoData;

        if (iPlano <> iPlanoAnt) and (iPlano <> 0) then begin
           cmpContaIni.Plano     := iPlano;
           //cmpContaIni.Mascara   := CtrlContab.MascaraContaParam; //Everson Cunha - SIG102043
           cmpContaIni.Mascara   := CtrlContab.MascaraContaData;    //Everson Cunha - SIG102043
           cmpContaFim.Plano     := iPlano;
           //cmpContaFim.Mascara   := CtrlContab.MascaraContaParam; //Everson Cunha - SIG102043
           cmpContaFim.Mascara   := CtrlContab.MascaraContaData;    //Everson Cunha - SIG102043
        end else begin
           cmpContaIni.Plano     := CtrlContab.PlanoParam;
           cmpContaIni.Mascara   := CtrlContab.MascaraContaParam;
           cmpContaFim.Plano     := CtrlContab.PlanoParam;
           cmpContaFim.Mascara   := CtrlContab.MascaraContaParam;

           iPlano := CtrlContab.PlanoParam;

        end;
     end;
  end;

end;

procedure TfrmParamBalanceteCxAP.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlContab := TCtrlContab.Create;
   CtrlContab.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

   If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
      MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);


   MontaSelectCCusto.Filtro.Add('CENTCUST.IDEMPRESA = ' + IntToStr(sistema.idEmpresa));
   MontaSelectAtivProj.Filtro.Add('UNIDNEGOCIO.IDPESSOA = ' + IntToStr(sistema.idEmpresa));

end;

procedure TfrmParamBalanceteCxAP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.free;

end;

procedure TfrmParamBalanceteCxAP.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

   if dblkExercicio.text = '' then
   begin
      MsgDlg('O Exercício deve ser preenchido.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      Exit;
   end;

   if dblkPeriodoIni.text = '' then
   begin
      MsgDlg('O Período Inicial deve ser preenchido.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      Exit;
   end;

   if dblkPeriodoFim.text = '' then
   begin
      MsgDlg('O Período Final deve ser preenchido.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      Exit;
   end;

   if mskAtivProjIni.Text = '' then
      sUnidNegocIni := '';

   if mskAtivProjFim.Text = '' then
      sUnidNegocFim := '';

  //*** passa os paramentos para o componente padrao ***
  Cmp_Padrao.ParamValues[0].AsString   := dblkExercicio.LookupValue;
  Cmp_Padrao.ParamValues[1].AsString   := dblkPeriodoIni.LookupValue;
  Cmp_Padrao.ParamValues[2].AsString   := dblkPeriodoFim.LookupValue;
  Cmp_Padrao.ParamValues[3].AsString   := cmpContaIni.Conta.Numero;
  Cmp_Padrao.ParamValues[4].AsString   := cmpContaFim.Conta.Numero;
  Cmp_Padrao.ParamValues[5].AsString   := Trim(mskCCustoIni.text);
  Cmp_Padrao.ParamValues[6].AsString   := Trim(mskCCustoFim.text);
  Cmp_Padrao.ParamValues[7].AsString   := sUnidNegocIni;
  Cmp_Padrao.ParamValues[8].AsString   := sUnidNegocFim;
  Cmp_Padrao.ParamValues[9].AsInteger  := rdgValores.ItemIndex;
  Cmp_Padrao.ParamValues[10].AsBoolean := chkMascara.Checked;
  Cmp_Padrao.ParamValues[11].AsBoolean := chkGrupo.Checked;
  Cmp_Padrao.ParamValues[12].AsBoolean := chkLingua.Checked;
  Cmp_Padrao.ParamValues[13].AsBoolean := chkIndenta.Checked;
  Cmp_Padrao.ParamValues[14].AsBoolean := chkAnaliticas.Checked;
  Cmp_Padrao.ParamValues[15].AsBoolean := chkRateio.Checked;
  Cmp_Padrao.ParamValues[16].AsBoolean := chkContraNatureza.Checked;
  Cmp_Padrao.ParamValues[17].AsBoolean := cbDesconsidera.Checked;
  Cmp_Padrao.ParamValues[18].AsBoolean := cbDesconsideraEstatistica.Checked;
  Cmp_Padrao.ParamValues[19].AsBoolean := chkAtivProjSint.Checked;
  Cmp_Padrao.ParamValues[20].AsInteger := StrToInt(spnPagIni.Text);
  Cmp_Padrao.ParamValues[21].AsString  := edtTitulo.text;
  Cmp_Padrao.ParamValues[22].AsString  := edtSubTitulo.text;

end;

procedure TfrmParamBalanceteCxAP.FormShow(Sender: TObject);
begin
  inherited;
   PageControl1.ActivePageIndex := 0;

   with sqlExercicio do begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
      Open;
   end;
   with sqlPeriodoIni do begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
      ParamByName('PEREXERCICIO').asInteger := Year(Date);
      Open;
   end;
   with sqlPeriodoFim do begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
      ParamByName('PEREXERCICIO').asInteger := Year(Date);
      Open;
   end;

   //Coloca as máscaras
   cmpContaIni.Plano     := CtrlContab.PlanoParam;
   cmpContaIni.Mascara   := CtrlContab.MascaraContaParam;
   cmpContaFim.Plano     := CtrlContab.PlanoParam;
   cmpContaFim.Mascara   := CtrlContab.MascaraContaParam;

   mskCCustoIni.editMask := modulo.sMascaraCCusto + ';0; ';
   mskCCustoFim.editMask := modulo.sMascaraCCusto + ';0; ';
   mskAtivProjIni.editMask := modulo.sMascaraUnidNegoc + ';0; ';
   mskAtivProjFim.editMask := modulo.sMascaraUnidNegoc + ';0; ';


end;

procedure TfrmParamBalanceteCxAP.cmpContaIniExit(Sender: TObject);
begin
  inherited;
  If (cmpContaIni.Valida <> VcOK) Then
  Begin
    cmpContaIni.SetFocus;
    Exit;
  End;

end;

procedure TfrmParamBalanceteCxAP.cmpContaFimExit(Sender: TObject);
begin
  inherited;
  If (cmpContaFim.Valida <> VcOK) Then
  Begin
    cmpContaFim.SetFocus;
    Exit;
  End;

end;

procedure TfrmParamBalanceteCxAP.dblkPeriodoFimChange(Sender: TObject);
begin
  inherited;
  sqlPlanCentCusto.Prepare;
  sqlPlanCentCusto.ParamByName('DATA').AsString :=  (dblkPeriodoIni.LookupValue + '/' + dblkExercicio.Text );
  sqlPlanCentCusto.open;
  MontaSelectCCusto.Filtro.add('IDPLANCENTCUST = '+ IntToStr(cdsPlanCentCusto.fieldbyname('IDPLANCENTCUST').AsInteger));
  mskCCustoIni.Text := '';
  mskCCustoFim.Text := '';

end;

end.
