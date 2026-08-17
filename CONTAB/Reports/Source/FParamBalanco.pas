{-------------------------------------------------------------------------------
-------------------------------- ALTERAÇÕES ------------------------------------
--------------------------------------------------------------------------------

 SIG ..........: 102043
 Data .........: 22/12/2020
 Responsável ..: Everson Cunha
 Descrição ....: Máscara de conta por PLANO e período vigente
--------------------------------------------------------------------------------}

unit FParamBalanco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, MontaSelect,
  uCmSqlParams, Db, DBClient, uCMClientDataSet, CMProcuraMask, Spin,
  ComCtrls, Mask, wwdblook,uCtrlContab;

type
  TfrmParamBalanco = class(TfrmParamReports_Padrao)
    grpDatas: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    dblkPeriodo: TwwDBLookupCombo;
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
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label10: TLabel;
    chkMascara: TCheckBox;
    chkLingua: TCheckBox;
    chkGrupo: TCheckBox;
    chkGrau: TCheckBox;
    spnGrau: TSpinEdit;
    chkCorresp: TCheckBox;
    chkIndenta: TCheckBox;
    chkEspaco: TCheckBox;
    spnPagIni: TSpinEdit;
    cbDesconsideraEstatistica: TCheckBox;
    TabSheet2: TTabSheet;
    Label8: TLabel;
    Label9: TLabel;
    edtTitulo: TEdit;
    edtSubTitulo: TEdit;
    cmpContaIni: TCMProcuraMaskContabil;
    cmpContaFim: TCMProcuraMaskContabil;
    cdsPeriodo: TCMClientDataSet;
    cdsExercicio: TCMClientDataSet;
    sqlPeriodo: TCMSqlParams;
    sqlExercicio: TCMSqlParams;
    MontaSelectCCusto: TMontaSelect;
    MontaSelectAtivProj: TMontaSelect;
    cdsAtivProj: TCMClientDataSet;
    sqlAtivProj: TCMSqlParams;
    sqlCusto: TCMSqlParams;
    cdsCusto: TCMClientDataSet;
    sqlAux1: TCMSqlParams;
    cdsAux1: TCMClientDataSet;
    procedure btnAtivProjClick(Sender: TObject);
    procedure mskAtivProjExit(Sender: TObject);
    procedure mskCCustoIniExit(Sender: TObject);
    procedure btnCCustoIniClick(Sender: TObject);
    procedure mskCCustoFimExit(Sender: TObject);
    procedure btnCCustoFimClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkGrauClick(Sender: TObject);
    procedure dblkPeriodoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
    CtrlContab :TCtrlContab;
  public
    { Public declarations }
  end;

var
  frmParamBalanco: TfrmParamBalanco;
  sUnidNegoc : String;
  iPlano : LongInt;
  sMascaraPlano : String;

implementation

uses UMensErro, uDatabase, DBaseDados, uSistema,uData,
     uModulo, uFuncaoGeral, uString;

{$R *.DFM}

procedure TfrmParamBalanco.btnAtivProjClick(Sender: TObject);
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
         mskAtivProj.text     := cdsAtivProj.FieldByName('UNECODIGO').asString;
         sUnidNegoc  := IntToStr(cdsAtivProj.FieldByName('UNIDNEGOC').asInteger);
      end;
   end;

end;

procedure TfrmParamBalanco.mskAtivProjExit(Sender: TObject);
var sAtivProj : string;
begin
  inherited;
   if mskAtivProj.text <> '' then begin
      sAtivProj := mskAtivProj.text;
      with sqlAtivProj do begin
         Prepare;
         ParamByName('IDPESSOA').asFloat   := sistema.idEmpresa;
         ParamByName('UNIDNEGOC').asFloat  := StrToFloat(sAtivProj);
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

procedure TfrmParamBalanco.mskCCustoIniExit(Sender: TObject);
var sCCusto : string;
begin
   inherited;

   if mskCCustoIni.text <> '' then begin
      sCCusto := mskCCustoIni.text;
      with sqlCusto do begin
         Prepare;
         ParamByName('IDEMPRESA').AsFloat  := sistema.idEmpresa;
         ParamByName('CODCENTROCUSTO').asString   := sCCusto;
         Open;
         if not cdsCusto.isEmpty then begin
            mskCCustoIni.text := cdsCusto.FieldByName('CODCENTROCUSTO').asString;
         end else begin
            MsgDlg('O código do centro de custo informado não existe.','Aviso',mtWarning,[mbOk],0);
            mskCCustoIni.SetFocus;
         end;
      end;
   end;
end;

procedure TfrmParamBalanco.btnCCustoIniClick(Sender: TObject);
var
 sCCusto: string;
begin
   inherited;

   MontaSelectCCusto.Executar;
   Repaint;

   if MontaSelectCCusto.RetornouValor then begin
      sCCusto := MontaSelectCCusto.ValoresChave[1];
      with sqlCusto do begin
         Prepare;
         ParamByName('IDEMPRESA').AsFloat  := sistema.idEmpresa;
         ParamByName('CODCENTROCUSTO').asString   := sCCusto;
         Open;
         mskCCustoIni.text   := cdsCusto.FieldByName('CODCENTROCUSTO').asString;
      end;
   end;
end;

procedure TfrmParamBalanco.mskCCustoFimExit(Sender: TObject);
var sCCusto : string;
begin
  inherited;
   if mskCCustoFim.text <> '' then begin
      sCCusto := mskCCustoFim.text;
      with sqlCusto do begin
         Prepare;
         ParamByName('IDEMPRESA').asFloat       := Sistema.idEmpresa;
         ParamByName('CODCENTROCUSTO').asString := sCCusto;
         Open;
         if not cdsCusto.isEmpty then begin
            mskCCustoFim.text := cdsCusto.FieldByName('CODCENTROCUSTO').asString;
         end else begin
            MsgDlg('O código do centro de custo informado não existe.','Aviso',mtWarning,[mbOk],0);
            mskCCustoFim.SetFocus;
         end;
      end;
   end;        
end;

procedure TfrmParamBalanco.btnCCustoFimClick(Sender: TObject);
var
 sCCusto: string;
begin
   inherited;

   MontaSelectCCusto.Executar;
   Repaint;

   if MontaSelectCCusto.RetornouValor then begin
      sCCusto := MontaSelectCCusto.ValoresChave[1];
      with sqlCusto do begin
         Prepare;
         ParamByName('IDEMPRESA').AsFloat  := sistema.idEmpresa;
         ParamByName('CODCENTROCUSTO').asString   := sCCusto;
         Open;
         mskCCustoFim.text   := cdsCusto.FieldByName('CODCENTROCUSTO').asString;
      end;
   end;

end;

procedure TfrmParamBalanco.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlContab := TCtrlContab.Create;
   CtrlContab.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

   If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
      MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);

   MontaSelectCCusto.Filtro.Add('CENTCUST.IDEMPRESA = ' + IntToStr(sistema.idEmpresa));
   MontaSelectAtivProj.Filtro.Add('UNIDNEGOCIO.IDPESSOA = ' + IntToStr(sistema.idEmpresa));

   iPlano := Modulo.iPlano;
   sMascaraPlano := Modulo.sMascaraContas;

end;

procedure TfrmParamBalanco.FormShow(Sender: TObject);
begin
  inherited;
   PageControl1.ActivePageIndex := 0;

   with sqlExercicio do begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
      Open;
   end;
   with sqlPeriodo do begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
      ParamByName('PEREXERCICIO').asInteger := Year(Date);
      Open;
   end;

   //Coloca as máscaras nas edit's
   cmpContaIni.Plano     := CtrlContab.PlanoParam;
   cmpContaIni.Mascara   := CtrlContab.MascaraContaParam;
   cmpContaFim.Plano     := CtrlContab.PlanoParam;
   cmpContaFim.Mascara   := CtrlContab.MascaraContaParam;

   mskCCustoIni.editMask := modulo.sMascaraCCusto + ';0; ';
   mskCCustoFim.editMask := modulo.sMascaraCCusto + ';0; ';
   mskAtivProj.editMask  := modulo.sMascaraUnidNegoc + ';0; ';

   spnGrau.MaxValue := FuncaoGeral.CalcGrauMax(sMascaraPlano);
   spnGrau.Value    := FuncaoGeral.CalcGrauMax(sMascaraPlano);
   spnGrau.MinValue := 1;

end;

procedure TfrmParamBalanco.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   if dblkExercicio.text = '' then begin
      MsgDlg('O Exercício deve ser preenchido.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      Exit;
   end;

   if dblkPeriodo.text = '' then begin
      MsgDlg('O Período deve ser preenchido.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      Exit;
   end;

  if mskAtivProj.Text = '' then sUnidNegoc := '';

  //*** passa os paramentos para o componente padrao ***
  Cmp_Padrao.ParamValues[0].AsString   := dblkExercicio.LookupValue;
  Cmp_Padrao.ParamValues[1].AsString   := dblkPeriodo.LookupValue;
  Cmp_Padrao.ParamValues[2].AsString   := cmpContaIni.Conta.Numero;
  Cmp_Padrao.ParamValues[3].AsString   := cmpContaFim.Conta.Numero;
  Cmp_Padrao.ParamValues[4].AsString   := Trim(mskCCustoIni.text);
  Cmp_Padrao.ParamValues[5].AsString   := Trim(mskCCustoFim.text);
  Cmp_Padrao.ParamValues[6].AsString   := sUnidNegoc;
  Cmp_Padrao.ParamValues[7].AsBoolean  := chkMascara.Checked;
  Cmp_Padrao.ParamValues[8].AsBoolean  := chkGrupo.Checked;
  Cmp_Padrao.ParamValues[9].AsBoolean  := chkLingua.Checked;
  Cmp_Padrao.ParamValues[10].AsBoolean := chkCorresp.Checked;
  Cmp_Padrao.ParamValues[11].AsBoolean := chkEspaco.Checked;
  Cmp_Padrao.ParamValues[12].AsBoolean := chkIndenta.Checked;
  Cmp_Padrao.ParamValues[13].AsBoolean := cbDesconsideraEstatistica.Checked;
  Cmp_Padrao.ParamValues[14].AsInteger := StrToInt(spnGrau.Text);
  Cmp_Padrao.ParamValues[15].AsInteger := StrToInt(spnPagIni.text);
  Cmp_Padrao.ParamValues[16].AsString  := edtTitulo.text;
  Cmp_Padrao.ParamValues[17].AsString  := edtSubTitulo.text;

end;

procedure TfrmParamBalanco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.free;
end;

procedure TfrmParamBalanco.chkGrauClick(Sender: TObject);
begin
  inherited;
   if chkGrau.checked then begin
      spnGrau.enabled := true;
      spnGrau.Color   := clWindow;
   end else begin
      spnGrau.enabled := false;
      spnGrau.Color   := clBtnFace;
   end;

end;

//Everson Cunha - SIG102043 - Ini
procedure TfrmParamBalanco.dblkPeriodoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
var iPlanoAnt : LongInt;
begin
  inherited;

  if dblkExercicio.Text = '' then
  begin
    MsgDlg('O Exercício deve ser preenchido.','Erro',mtError,[mbOk],0);
    dblkExercicio.SetFocus;
    Exit;
  end
  else
  begin
    if dblkPeriodo.LookupValue <> '' then
    begin
      sqlAux1.SQL.Clear;
      sqlAux1.SQL.Add('SELECT PERDATINI FROM PERIODO ');
      sqlAux1.SQL.Add('WHERE (PEREXERCICIO = '+dblkExercicio.LookupValue+')');
      sqlAux1.SQL.Add('  AND (PERNUMERO = '+dblkPeriodo.LookupValue+')');
      sqlAux1.SQL.Add('  AND (IDPESSOA = '+IntToStr(Sistema.idEmpresa)+')');
      sqlAux1.Open;
      //
      iPlanoAnt     := Modulo.iPlano;

      If CtrlContab.SelecionaPlanoData(Sistema.IdEmpresa, DateToStr(cdsAux1.FieldByName('PERDATINI').AsDateTime)) Then
        iPlano := CtrlContab.PlanoData;

       if (iPlano <> iPlanoAnt) and (iPlano <> 0) then
       begin
         cmpContaIni.Plano     := iPlano;
         cmpContaIni.Mascara   := CtrlContab.MascaraContaData;
         cmpContaFim.Plano     := iPlano;
         cmpContaFim.Mascara   := CtrlContab.MascaraContaData;
       end
       else
       begin
         cmpContaIni.Plano     := CtrlContab.PlanoParam;
         cmpContaIni.Mascara   := CtrlContab.MascaraContaParam;
         cmpContaFim.Plano     := CtrlContab.PlanoParam;
         cmpContaFim.Mascara   := CtrlContab.MascaraContaParam;

         iPlano := CtrlContab.PlanoParam;
       end;
    end;
  end;
end;
//Everson Cunha - SIG102043 - Fim

end.
