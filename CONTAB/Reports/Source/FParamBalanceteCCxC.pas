{-------------------------------------------------------------------------------
-------------------------------- ALTERAÇÕES ------------------------------------
--------------------------------------------------------------------------------

 SIG ..........: 102043
 Data .........: 22/12/2020
 Responsável ..: Everson Cunha
 Descrição ....: Máscara de conta por PLANO e período vigente
--------------------------------------------------------------------------------
 Rotina..........: TfrmParamBalanceteCCxC.bbtnConfirmarClick
 N. Sol..........: 108683
 N. Kintana......: 495605
 Data............: 29/05/2009
 Responsável.....: Marilza Colpani
 Descrição.......: Inclusão do checkbox cbDesconsidera
--------------------------------------------------------------------------------}


unit FParamBalanceteCCxC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, uCtrlContab, Controls, Forms, Dialogs,
  fParamReports_Padrao, MontaSelect, Db, Wwdatsrc, wwclient, DBClient,
  uCMClientDataSet, uCmSqlParams, CMProcuraMask, Grids, Wwdbigrd, Wwdbgrid,
  StdCtrls, Spin, ComCtrls, wwdbdatetimepicker, CMDateTimePicker, Mask,
  wwdblook, CmParamReport, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, ExtCtrls, uCMTypes;

type
  TfrmParamBalanceteCCxC = class(TfrmParamReports_Padrao)
    grpDatas: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    dblkPeriodoIni: TwwDBLookupCombo;
    dblkPeriodoFim: TwwDBLookupCombo;
    Panel1: TPanel;
    Label5: TLabel;
    Label7: TLabel;
    Label2: TLabel;
    mskCCustoIni: TMaskEdit;
    btnCCustoIni: TBitBtn;
    btnAtivProj: TBitBtn;
    mskAtivProj: TMaskEdit;
    mskCCustoFim: TMaskEdit;
    btnCCustoFim: TBitBtn;
    cmpContaIni: TCMProcuraMaskContabil;
    cmpContaFim: TCMProcuraMaskContabil;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label8: TLabel;
    Label9: TLabel;
    edtTitulo: TEdit;
    edtSubTitulo: TEdit;
    rgValores: TRadioGroup;
    chkIndenta: TCheckBox;
    chkMascara: TCheckBox;
    spnPagIni: TSpinEdit;
    Label10: TLabel;
    MontaSelectAtivProj: TMontaSelect;
    MontaSelectCCusto: TMontaSelect;
    cdsCCusto: TCMClientDataSet;
    sqlCCusto: TCMSqlParams;
    cdsAtivProj: TCMClientDataSet;
    sqlAtivProj: TCMSqlParams;
    cdsPeriodoFim: TCMClientDataSet;
    cdsExercicio: TCMClientDataSet;
    cdsPeriodoIni: TCMClientDataSet;
    sqlExercicio: TCMSqlParams;
    sqlPeriodoFim: TCMSqlParams;
    sqlPeriodoIni: TCMSqlParams;
    cdsAux1: TCMClientDataSet;
    sqlAux1: TCMSqlParams;
    chkGrupo: TCheckBox;
    chkZeradas: TCheckBox;
    cdsPlanCentCusto: TCMClientDataSet;
    sqlPlanCentCusto: TCMSqlParams;
    chkDescEncerResult: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkExercicioExit(Sender: TObject);
    procedure dblkPeriodoIniCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure cmpContaIniExit(Sender: TObject);
    procedure cmpContaFimExit(Sender: TObject);
    procedure mskCCustoIniExit(Sender: TObject);
    procedure mskCCustoFimExit(Sender: TObject);
    procedure mskAtivProjExit(Sender: TObject);
    procedure btnCCustoIniClick(Sender: TObject);
    procedure btnCCustoFimClick(Sender: TObject);
    procedure btnAtivProjClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblkPeriodoFimChange(Sender: TObject);
  private
    iPlano :Integer;
    CtrlContab  : TCtrlContab;
    sUnidNegoc,sMascaraPlano :string;
    procedure VerificaCamposDeTela;

  public
    { Public declarations }
  end;

var
  frmParamBalanceteCCxC: TfrmParamBalanceteCCxC;

implementation

uses UMensErro, uDatabase, DBaseDados,  uSistema, uString, 
     uModulo, uData, uFuncaoGeral, FSM_FxLib;

{$R *.DFM}

procedure TfrmParamBalanceteCCxC.FormCreate(Sender: TObject);
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

procedure TfrmParamBalanceteCCxC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.free;

end;

procedure TfrmParamBalanceteCCxC.dblkExercicioExit(Sender: TObject);
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

procedure TfrmParamBalanceteCCxC.dblkPeriodoIniCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
var
 iPlanoAnt :integer;

begin
  inherited;
  if dblkExercicio.text = '' then
  begin
    MsgDlg('O Exercício deve ser preenchido.','Erro',mtError,[mbOk],0);
    dblkPeriodoIni.Text := '';
    dblkExercicio.SetFocus;
    Exit;
  end else
  begin
     sqlAux1.SQL.Clear;
     sqlAux1.SQL.Add('SELECT PERDATINI FROM PERIODO ');
     sqlAux1.SQL.Add('WHERE (PEREXERCICIO = '+dblkExercicio.LookupValue+')');
     sqlAux1.SQL.Add('  AND (PERNUMERO    = '+dblkPeriodoIni.LookupValue+')');
     sqlAux1.SQL.Add('  AND (IDPESSOA     = '+IntToStr(Sistema.idEmpresa)+')');
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

procedure TfrmParamBalanceteCCxC.cmpContaIniExit(Sender: TObject);
begin
  inherited;
    If (cmpContaIni.Valida <> VcOK) Then
    Begin
      cmpContaIni.SetFocus;
      Exit;
    End;

end;

procedure TfrmParamBalanceteCCxC.cmpContaFimExit(Sender: TObject);
begin
  inherited;
    If (cmpContaFim.Valida <> VcOK) Then
    Begin
      cmpContaFim.SetFocus;
      Exit;
    End;

end;

procedure TfrmParamBalanceteCCxC.mskCCustoIniExit(Sender: TObject);
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

procedure TfrmParamBalanceteCCxC.mskCCustoFimExit(Sender: TObject);
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

procedure TfrmParamBalanceteCCxC.mskAtivProjExit(Sender: TObject);
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

procedure TfrmParamBalanceteCCxC.btnCCustoIniClick(Sender: TObject);
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

procedure TfrmParamBalanceteCCxC.btnCCustoFimClick(Sender: TObject);
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

procedure TfrmParamBalanceteCCxC.btnAtivProjClick(Sender: TObject);
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

procedure TfrmParamBalanceteCCxC.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  VerificaCamposDeTela;

  if mskAtivProj.Text = '' then sUnidNegoc := '';

  //*** passa os paramentos para o componente padrao ***
  Cmp_Padrao.ParamValues[0].AsFloat    := StrToFloat(dblkExercicio.LookupValue);
  Cmp_Padrao.ParamValues[1].AsInteger  := StrToInt(dblkPeriodoIni.LookupValue);
  Cmp_Padrao.ParamValues[2].AsInteger  := StrToInt(dblkPeriodoFim.LookupValue);
  Cmp_Padrao.ParamValues[3].AsString   := cmpContaIni.Conta.Numero;
  Cmp_Padrao.ParamValues[4].AsString   := cmpContaFim.Conta.Numero;
  Cmp_Padrao.ParamValues[5].AsString   := Trim(mskCCustoIni.text);
  Cmp_Padrao.ParamValues[6].AsString   := Trim(mskCCustoFim.text);
  Cmp_Padrao.ParamValues[7].AsString   := sUnidNegoc;
  Cmp_Padrao.ParamValues[8].AsInteger  := rgValores.ItemIndex;
  Cmp_Padrao.ParamValues[9].AsBoolean  := chkIndenta.Checked;
  Cmp_Padrao.ParamValues[10].AsBoolean := chkMascara.Checked;
  Cmp_Padrao.ParamValues[11].AsBoolean := chkGrupo.Checked;
  Cmp_Padrao.ParamValues[12].AsBoolean := chkZeradas.Checked;
  Cmp_Padrao.ParamValues[13].AsInteger := StrToInt(spnPagIni.text);
  Cmp_Padrao.ParamValues[14].AsString  := edtTitulo.text;
  Cmp_Padrao.ParamValues[15].AsString  := edtSubTitulo.text;
  Cmp_Padrao.ParamValues[16].AsBoolean := chkDescEncerResult.Checked; //Marilza Colpani 29/05/2009 N.Sol: 108683 - N.Kintana: 495605


end;

procedure TfrmParamBalanceteCCxC.VerificaCamposDeTela;
begin
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

end;

procedure TfrmParamBalanceteCCxC.FormShow(Sender: TObject);
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
   mskAtivProj.editMask  := modulo.sMascaraUnidNegoc + ';0; ';


end;

procedure TfrmParamBalanceteCCxC.dblkPeriodoFimChange(Sender: TObject);
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
