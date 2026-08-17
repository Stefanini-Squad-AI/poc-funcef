{-------------------------------------------------------------------------------
-------------------------------- ALTERAÇÕES ------------------------------------
--------------------------------------------------------------------------------

 SIG ..........: 102043
 Data .........: 22/12/2020
 Responsável ..: Everson Cunha
 Descrição ....: Máscara de conta por PLANO e período vigente
--------------------------------------------------------------------------------
 Rotina..........: TfrmParamBalanceteCxSC.bbtnConfirmarClick
 N. Sol..........: 108683
 N. Kintana......: 495605
 Data............: 01/06/2009
 Responsável.....: Marilza Colpani
 Descrição.......: Inclusão do checkbox cbDesconsidera
--------------------------------------------------------------------------------}


unit FParamBalanceteCxSC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,uCtrlContab,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  MontaSelect, Db, DBClient, uCMClientDataSet, uCmSqlParams, CMProcuraMask,
  Spin, ComCtrls, wwdblook, Mask, uCMTypes;

type
  TfrmParamBalanceteCxSC = class(TfrmParamReports_Padrao)
    Panel1: TPanel;
    Label5: TLabel;
    Label7: TLabel;
    Label2: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    mskCCustoIni: TMaskEdit;
    btnCCustoIni: TBitBtn;
    btnAtivProj: TBitBtn;
    mskAtivProj: TMaskEdit;
    mskCCustoFim: TMaskEdit;
    btnCCustoFim: TBitBtn;
    mskSubContaIni: TMaskEdit;
    btnSubContaIni: TBitBtn;
    mskSubContaFim: TMaskEdit;
    btnSubContaFim: TBitBtn;
    grpDatas: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    dblkPeriodoIni: TwwDBLookupCombo;
    dblkPeriodoFim: TwwDBLookupCombo;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label12: TLabel;
    chkMascara: TCheckBox;
    chkLingua: TCheckBox;
    chkGrupo: TCheckBox;
    chkIndenta: TCheckBox;
    spnPagIni: TSpinEdit;
    rdgValores: TRadioGroup;
    chkContraNatureza: TCheckBox;
    TabSheet2: TTabSheet;
    Label8: TLabel;
    Label9: TLabel;
    edtTitulo: TEdit;
    edtSubTitulo: TEdit;
    cmpContaIni: TCMProcuraMaskContabil;
    cmpContaFim: TCMProcuraMaskContabil;
    sqlExercicio: TCMSqlParams;
    cdsExercicio: TCMClientDataSet;
    cdsPeriodoIni: TCMClientDataSet;
    sqlPeriodoIni: TCMSqlParams;
    sqlPeriodoFim: TCMSqlParams;
    cdsPeriodoFim: TCMClientDataSet;
    sqlCCusto: TCMSqlParams;
    cdsCCusto: TCMClientDataSet;
    cdsAtivProj: TCMClientDataSet;
    sqlAtivProj: TCMSqlParams;
    MontaSelectCCusto: TMontaSelect;
    MontaSelectAtivProj: TMontaSelect;
    cdsSubConta: TCMClientDataSet;
    sqlSubConta: TCMSqlParams;
    MontaSelectSubConta: TMontaSelect;
    sqlAux1: TCMSqlParams;
    cdsAux1: TCMClientDataSet;
    chkAnaliticas: TCheckBox;
    chkSomenteSecretaria: TCheckBox;
    chkDesconsidera: TCheckBox;
    procedure cmpContaIniExit(Sender: TObject);
    procedure cmpContaFimExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnAtivProjClick(Sender: TObject);
    procedure mskAtivProjExit(Sender: TObject);
    procedure mskCCustoIniExit(Sender: TObject);
    procedure btnCCustoIniClick(Sender: TObject);
    procedure mskCCustoFimExit(Sender: TObject);
    procedure btnCCustoFimClick(Sender: TObject);
    procedure mskSubContaIniExit(Sender: TObject);
    procedure btnSubContaIniClick(Sender: TObject);
    procedure btnSubContaFimClick(Sender: TObject);
    procedure mskSubContaFimExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblkPeriodoIniCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkExercicioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    iPlano :Integer;
    CtrlContab  : TCtrlContab;
    sUnidNegoc,sMascaraPlano :string;

  public
    { Public declarations }
  end;

var
  frmParamBalanceteCxSC: TfrmParamBalanceteCxSC;

implementation
uses UMensErro, uDatabase, DBaseDados,  uSistema, uString, 
     uModulo, uData, uFuncaoGeral, FSM_FxLib;

{$R *.DFM}

procedure TfrmParamBalanceteCxSC.cmpContaIniExit(Sender: TObject);
begin
  inherited;
    If (cmpContaIni.Valida <> VcOK) Then
    Begin
      cmpContaIni.SetFocus;
      Exit;
    End;

end;

procedure TfrmParamBalanceteCxSC.cmpContaFimExit(Sender: TObject);
begin
  inherited;
    If (cmpContaFim.Valida <> VcOK) Then
    Begin
      cmpContaFim.SetFocus;
      Exit;
    End;

end;

procedure TfrmParamBalanceteCxSC.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlContab := TCtrlContab.Create;
   CtrlContab.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

   If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
      MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);

   MontaSelectCCusto.Filtro.Add('CENTCUST.IDEMPRESA = ' + IntToStr(sistema.idEmpresa));
   MontaSelectAtivProj.Filtro.Add('UNIDNEGOCIO.IDPESSOA = ' + IntToStr(sistema.idEmpresa));
   MontaSelectSubConta.Filtro.Add('SUBCONTA.IDPESSOA = ' + IntToStr(sistema.idEmpresa));


end;

procedure TfrmParamBalanceteCxSC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.free;
end;

procedure TfrmParamBalanceteCxSC.FormShow(Sender: TObject);
begin
  inherited;
   PageControl1.ActivePageIndex := 0;

   //Preenche as combo-boxes
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
   mskAtivProj.editMask  := modulo.sMascaraUnidNegoc + ';0; ';

end;

procedure TfrmParamBalanceteCxSC.btnAtivProjClick(Sender: TObject);
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
         ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
         ParamByName('UNIDNEGOC').asInteger := StrToInt(sAtivProj);
         Open;
         mskAtivProj.text  := cdsAtivProj.FieldByName('UNECODIGO').asString;
         sUnidNegoc  := IntToStr(cdsAtivProj.FieldByName('UNIDNEGOC').asInteger);

      end;
   end;

end;

procedure TfrmParamBalanceteCxSC.mskAtivProjExit(Sender: TObject);
var sAtivProj : string;
begin
  inherited;
   if mskAtivProj.text <> '' then begin
      sAtivProj := mskAtivProj.text;
      with sqlAtivProj do begin
         Prepare;
         ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
         ParamByName('UNIDNEGOC').asInteger := StrToInt(sAtivProj);
         Open;
         if not cdsAtivProj.isEmpty then begin
            mskAtivProj.text  := cdsAtivProj.FieldByName('UNECODIGO').asString;
            sUnidNegoc  := IntToStr(cdsAtivProj.FieldByName('UNIDNEGOC').asInteger);
         end else begin
            MsgDlg('O código da atividade/projeto informado não existe.','Aviso',mtWarning,[mbOk],0);
            mskAtivProj.SetFocus;
         end;
      end;
   end;

end;

procedure TfrmParamBalanceteCxSC.mskCCustoIniExit(Sender: TObject);
var sCCusto : string;
begin
  inherited;
   if mskCCustoIni.text <> '' then begin
      sCCusto := mskCCustoIni.text;
      with sqlCCusto do begin
         Prepare;
         ParamByName('IDEMPRESA').asFloat := sistema.idEmpresa;
         ParamByName('CODCENTROCUSTO').asString   := sCCusto;
         Open;
         if not cdsCCusto.isEmpty then begin
            mskCCustoIni.text := cdsCCusto.FieldByName('CODCENTROCUSTO').asString;
         end else begin
            MsgDlg('O código do centro de custo informado não existe.','Aviso',mtWarning,[mbOk],0);
            mskCCustoIni.SetFocus;
         end;
      end;
   end;

end;

procedure TfrmParamBalanceteCxSC.btnCCustoIniClick(Sender: TObject);
var sCCusto : string;
begin
  inherited;
   MontaSelectCCusto.Executar;
   Repaint;

   if MontaSelectCCusto.RetornouValor then begin
      sCCusto := MontaSelectCCusto.ValoresChave[1];
      with sqlCCusto do begin
         Prepare;
         ParamByName('IDEMPRESA').asFloat := sistema.idEmpresa;
         ParamByName('CODCENTROCUSTO').asString   := sCCusto;
         Open;
         mskCCustoIni.text   := cdsCCusto.FieldByName('CODCENTROCUSTO').asString;
      end;
   end;

end;

procedure TfrmParamBalanceteCxSC.mskCCustoFimExit(Sender: TObject);
var sCCusto : string;
begin
  inherited;
   if mskCCustoFim.text <> '' then begin
      sCCusto := mskCCustoFim.text;
      with sqlCCusto do begin
         Prepare;
         ParamByName('IDEMPRESA').asFloat := sistema.idEmpresa;
         ParamByName('CODCENTROCUSTO').asString   := sCCusto;
         Open;
         if not cdsCCusto.isEmpty then begin
            mskCCustoFim.text := cdsCCusto.FieldByName('CODCENTROCUSTO').asString;
         end else begin
            MsgDlg('O código do centro de custo informado não existe.','Aviso',mtWarning,[mbOk],0);
            mskCCustoFim.SetFocus;
         end;
      end;
   end;

end;

procedure TfrmParamBalanceteCxSC.btnCCustoFimClick(Sender: TObject);
var sCCusto : string;
begin
  inherited;
   MontaSelectCCusto.Executar;
   Repaint;

   if MontaSelectCCusto.RetornouValor then begin
      sCCusto := MontaSelectCCusto.ValoresChave[1];
      with sqlCCusto do begin
         Prepare;
         ParamByName('IDEMPRESA').asFloat := sistema.idEmpresa;
         ParamByName('CODCENTROCUSTO').asString   := sCCusto;
         Open;
         mskCCustoFim.text   := cdsCCusto.FieldByName('CODCENTROCUSTO').asString;
      end;
   end;

end;

procedure TfrmParamBalanceteCxSC.mskSubContaIniExit(Sender: TObject);
var sSubConta : string;
begin
   inherited;

   if mskSubContaIni.text <> '' then begin
      sSubConta := mskSubContaIni.text;
      with sqlSubConta do begin
         Prepare;
         ParamByName('IDPESSOA').asInteger   := Sistema.idEmpresa;
         ParamByName('CODSUBCONTA').asString := sSubConta;
         Open;
         if not cdsSubConta.isEmpty then begin
            mskSubContaIni.text  := cdsSubConta.FieldByName('CODSUBCONTA').asString;
         end else begin
            MsgDlg('O código da sub-conta informada não existe.','Aviso',mtWarning,[mbOk],0);
            mskSubContaIni.SetFocus;
         end;
      end;
   end;

end;

procedure TfrmParamBalanceteCxSC.btnSubContaIniClick(Sender: TObject);
var
 sSubConta: string;
begin
   inherited;

   MontaSelectSubConta.Executar;
   Repaint;

   if MontaSelectSubConta.RetornouValor then begin
      sSubConta := MontaSelectSubConta.ValoresChave[1];
      with sqlSubConta do begin
         Prepare;
         ParamByName('IDPESSOA').asInteger   := Sistema.idEmpresa;
         ParamByName('CODSUBCONTA').asString := sSubConta;
         Open;
         mskSubContaIni.text    := cdsSubConta.FieldByName('CODSUBCONTA').asString;
      end;
   end;

end;

procedure TfrmParamBalanceteCxSC.btnSubContaFimClick(Sender: TObject);
var
 sSubConta: string;
begin
   inherited;

   MontaSelectSubConta.Executar;
   Repaint;

   if MontaSelectSubConta.RetornouValor then begin
      sSubConta := MontaSelectSubConta.ValoresChave[1];
      with sqlSubConta do begin
         Prepare;
         ParamByName('IDPESSOA').asInteger   := Sistema.idEmpresa;
         ParamByName('CODSUBCONTA').asString := sSubConta;
         Open;
         mskSubContaFim.text    := cdsSubConta.FieldByName('CODSUBCONTA').asString;
      end;
   end;

end;

procedure TfrmParamBalanceteCxSC.mskSubContaFimExit(Sender: TObject);
var sSubConta : string;
begin
   inherited;

   if mskSubContaFim.text <> '' then begin
      sSubConta := mskSubContaFim.text;
      with sqlSubConta do begin
         Prepare;
         ParamByName('IDPESSOA').asInteger   := Sistema.idEmpresa;
         ParamByName('CODSUBCONTA').asString := sSubConta;
         Open;
         if not cdsSubConta.isEmpty then begin
            mskSubContaFim.text  := cdsSubConta.FieldByName('CODSUBCONTA').asString;
         end else begin
            MsgDlg('O código da sub-conta informada não existe.','Aviso',mtWarning,[mbOk],0);
            mskSubContaFim.SetFocus;
         end;
      end;
   end;

end;

procedure TfrmParamBalanceteCxSC.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   if dblkExercicio.text = '' then begin
      MsgDlg('O Exercício deve ser preenchido.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      Exit;
   end;

   if dblkPeriodoIni.text = '' then begin
      MsgDlg('O Período Inicial deve ser preenchido.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      Exit;
   end;

   if dblkPeriodoFim.text = '' then begin
      MsgDlg('O Período Final deve ser preenchido.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      Exit;
   end;

  if mskAtivProj.Text = '' then sUnidNegoc := '';

  //*** passa os paramentos para o componente padrao ***
  Cmp_Padrao.ParamValues[0].AsFloat    := StrToFloat(dblkExercicio.LookupValue);
  Cmp_Padrao.ParamValues[1].AsInteger  := StrToInt(dblkPeriodoIni.LookupValue);
  Cmp_Padrao.ParamValues[2].AsInteger  := StrToInt(dblkPeriodoFim.LookupValue);
  Cmp_Padrao.ParamValues[3].AsString   := cmpContaIni.Conta.Numero;
  Cmp_Padrao.ParamValues[4].AsString   := cmpContaFim.Conta.Numero;
  Cmp_Padrao.ParamValues[5].AsString   := Trim(mskCCustoIni.text);
  Cmp_Padrao.ParamValues[6].AsString   := Trim(mskCCustoFim.text);
  Cmp_Padrao.ParamValues[7].AsString   := Trim(mskSubContaIni.Text);
  Cmp_Padrao.ParamValues[8].AsString   := Trim(mskSubContaFim.Text);
  Cmp_Padrao.ParamValues[9].AsString   := sUnidNegoc;
  Cmp_Padrao.ParamValues[10].AsInteger := rdgValores.ItemIndex;
  Cmp_Padrao.ParamValues[11].AsBoolean := chkGrupo.Checked;
  Cmp_Padrao.ParamValues[12].AsBoolean := chkIndenta.Checked;
  Cmp_Padrao.ParamValues[13].AsBoolean := chkLingua.Checked;
  Cmp_Padrao.ParamValues[14].AsBoolean := chkMascara.Checked;
  Cmp_Padrao.ParamValues[15].AsBoolean := chkContraNatureza.Checked;
  Cmp_Padrao.ParamValues[16].AsBoolean := chkAnaliticas.Checked;
  Cmp_Padrao.ParamValues[17].AsString  := spnPagIni.text;
  Cmp_Padrao.ParamValues[18].AsString  := edtTitulo.text;
  Cmp_Padrao.ParamValues[19].AsString  := edtSubTitulo.text;
  //Iferreira 27312
  Cmp_Padrao.ParamValues[20].AsBoolean := chkSomenteSecretaria.Checked;
  Cmp_Padrao.ParamValues[21].AsBoolean := chkDesconsidera.Checked; //Marilza Colpani 01/06/2009 N.Sol: 108683 - N.Kintana: 495605

end;

procedure TfrmParamBalanceteCxSC.dblkPeriodoIniCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
var
 iPlanoAnt :integer;
begin
  inherited;
  if  dblkExercicio.Text = '' then
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

procedure TfrmParamBalanceteCxSC.dblkExercicioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
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

end.
