unit FParamDemoLayout;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, StdCtrls, ExtCtrls, Mask, ComCtrls, wwdblook,
  CmParamReport, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr,
  TB97, uCmSqlParams, Db, DBClient, uCMClientDataSet, MontaSelect, Spin,
  wwclient, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid,
  uCtrlRptDemonstrativo, uCtrlPadroes;

type
  Tfrmparamdemolayout = class(TfrmParamReports_Padrao)
    grpDatas: TGroupBox;
    Label3: TLabel;
    Label1: TLabel;
    Label6: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    dblkPeriodoIni: TwwDBLookupCombo;
    dblkPeriodoFim: TwwDBLookupCombo;
    Panel1: TPanel;
    Label4: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    dblkDemo: TwwDBLookupCombo;
    dblkLayout: TwwDBLookupCombo;
    edtTipo: TEdit;
    Panel4: TPanel;
    Label5: TLabel;
    Label7: TLabel;
    mskCCustoIni: TMaskEdit;
    btnCCustoIni: TBitBtn;
    mskAtivProj: TMaskEdit;
    btnAtivProj: TBitBtn;
    Panel2: TPanel;
    lblMoedaReal: TLabel;
    lblMoedaOrcado: TLabel;
    dblcMoedaReal: TwwDBLookupCombo;
    dblcMoedaOrc: TwwDBLookupCombo;
    pnlPlanPrev: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    dblcPlanoPrev: TwwDBLookupCombo;
    dblcPatro: TwwDBLookupCombo;
    rgValores: TRadioGroup;
    Label11: TLabel;
    MontaSelectCCusto: TMontaSelect;
    MontaSelectAtivProj: TMontaSelect;
    cdsExercicio: TCMClientDataSet;
    sqlExercicio: TCMSqlParams;
    cdsPeriodoIni: TCMClientDataSet;
    sqlPeriodoIni: TCMSqlParams;
    sqlPeriodoFim: TCMSqlParams;
    cdsPeriodoFim: TCMClientDataSet;
    cdsDemo: TCMClientDataSet;
    cdsLay: TCMClientDataSet;
    sqlLay: TCMSqlParams;
    cdsCCusto: TCMClientDataSet;
    sqlCCusto: TCMSqlParams;
    sqlAtivProj: TCMSqlParams;
    cdsAtivProj: TCMClientDataSet;
    sqlMoedaReal: TCMSqlParams;
    cdsMoedaReal: TCMClientDataSet;
    sqlMoedaOrc: TCMSqlParams;
    cdsMoedaOrc: TCMClientDataSet;
    sqlPrev: TCMSqlParams;
    cdsPrev: TCMClientDataSet;
    sqlPatro: TCMSqlParams;
    cdsPatro: TCMClientDataSet;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    tbsAtivProj: TTabSheet;
    dbgrAtivProj: TwwDBGrid;
    cbRealMenosOrc: TCheckBox;
    chkNegativo: TCheckBox;
    chk1000: TCheckBox;
    cbDesconsideraResult: TCheckBox;
    spnPagIni: TSpinEdit;
    Label12: TLabel;
    dsAtivProjG: TwwDataSource;
    sqlAtivProjG: TCMSqlParams;
    cdsAtivProjG: TwwClientDataSet;
    CmParamReport1: TCmParamReport;
    cdsIdReports: TCMClientDataSet;
    sqlIDReport: TCMSqlParams;
    procedure dblkExercicioClick(Sender: TObject);
    procedure dblkDemoClick(Sender: TObject);
    procedure mskCCustoIniExit(Sender: TObject);
    procedure btnCCustoIniClick(Sender: TObject);
    procedure mskAtivProjExit(Sender: TObject);
    procedure btnAtivProjClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkLayoutExit(Sender: TObject);
  private
      sUnidNegoc,sAtivProjMarca :string;
      CtrlDemonstrativo : TCtrlRptDemonstrativo;


  public
    { Public declarations }
  end;

var
  frmparamdemolayout: Tfrmparamdemolayout;

implementation

uses UMensErro, uDatabase, DBaseDados, uSistema,
     uModulo,  uData;

{$R *.DFM}

procedure Tfrmparamdemolayout.dblkExercicioClick(Sender: TObject);
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

procedure Tfrmparamdemolayout.dblkDemoClick(Sender: TObject);
begin
  inherited;
   if dblkDemo.text <> '' then begin
      with sqlLay do begin
         Prepare;
         ParamByName('IDDEMONSTRATIVO').asInteger := StrToInt(dblkDemo.LookupValue);
         Open;
      end;
   end;

end;

procedure Tfrmparamdemolayout.mskCCustoIniExit(Sender: TObject);
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

procedure Tfrmparamdemolayout.btnCCustoIniClick(Sender: TObject);
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

procedure Tfrmparamdemolayout.mskAtivProjExit(Sender: TObject);
var sAtivProj : string;
begin
  inherited;
   if mskAtivProj.text <> '' then begin
      sAtivProj := mskAtivProj.text;
      with sqlAtivProj do begin
         Prepare;
         ParamByName('IDPESSOA').asFloat  := sistema.idEmpresa;
         ParamByName('UNECODIGO').assTRING := sAtivProj;
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

procedure Tfrmparamdemolayout.btnAtivProjClick(Sender: TObject);
var
 sAtivProj: string;
begin
   inherited;

   MontaSelectAtivProj.Executar;
   Repaint;
   if MontaSelectAtivProj.RetornouValor then begin
      sAtivProj := MontaSelectAtivProj.ValoresChave[2];
      with sqlAtivProj do begin
         Prepare;
         ParamByName('IDPESSOA').asFloat  := sistema.idEmpresa;
         ParamByName('UNECODIGO').asString := sAtivProj;
         Open;
         mskAtivProj.text     := cdsAtivProj.FieldByName('UNECODIGO').asString;
         sUnidNegoc  := IntToStr(cdsAtivProj.FieldByName('UNIDNEGOC').asInteger);
      end;
   end;

end;

procedure Tfrmparamdemolayout.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlDemonstrativo := TCtrlRptDemonstrativo.Create;
   CtrlDemonstrativo.InitializeAs(Padroes);

   MontaSelectCCusto.Filtro.Add('CENTCUST.IDEMPRESA = ' + IntToStr(sistema.idEmpresa));
   MontaSelectAtivProj.Filtro.Add('UNIDNEGOCIO.IDPESSOA = ' + IntToStr(sistema.idEmpresa));

end;




procedure Tfrmparamdemolayout.FormShow(Sender: TObject);
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

   cdsDemo.Data := CtrlDemonstrativo.ListaDemonstrativoSPC(Sistema.IdEmpresa);


   with sqlAtivProjG do begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
      Open;
   end;
   TwwClientDataSet(CdsAtivProjG).ControlType.Add('MARCA;CheckBox;S;N');

   mskCCustoIni.editMask := modulo.sMascaraCCusto + ';0; ';
   mskAtivProj.editMask  := modulo.sMascaraUnidNegoc + ';0; ';

   pnlPlanPrev.Enabled := Sistema.UsaPlanoPatro;

   sqlMoedaReal.Open;
   sqlMoedaOrc.Open;
   sqlPrev.Open;
   sqlPatro.Open;
end;

procedure Tfrmparamdemolayout.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   if dblkLayout.text = '' then begin
      MsgDlg('O Layout do Demonstrativo deve ser preenchido.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      Exit;
   end;

   sqlIDReport.Prepare;
   sqlIDReport.ParamByName('IDDESENHODEMO').AsInteger := StrToInt( dblkLayout.LookupValue );
   sqlIDReport.Open;

   Cmp_Padrao.ParamValues[19].AsString   := cdsIdReports.fieldbyname('IDREPORTS').AsString;

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

   if dblkDemo.text = '' then begin
      MsgDlg('O Demonstrativo deve ser selecionado.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      Exit;
   end;

   if dblkLayout.text = '' then begin
      MsgDlg('O Layout do Demonstrativo deve ser selecionado.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      Exit;
   end;

   if dblcPlanoPrev.text = '' then begin
      MsgDlg('O Plano Previdenciário deve ser selecionado.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      Exit;
   end;

   sAtivProjMarca := '';
   cdsAtivProjG.First;
   While not cdsAtivProjG.EOF do begin
      if cdsAtivProjG.FieldByName('MARCA').AsString = 'S' then begin
         if sAtivProjMarca = '' then begin
            sAtivProjMarca := trim(IntToStr(cdsAtivProjG.FieldByName('UNIDNEGOC').AsInteger));
         end else begin
            sAtivProjMarca := sAtivProjMarca+','+trim(IntToStr(cdsAtivProjG.FieldByName('UNIDNEGOC').AsInteger));
         end;
      end;
      cdsAtivProjG.Next;
   end;


   if mskAtivProj.text = '' then
      sUnidNegoc := ''
   else
      sAtivProjMarca := '';

  //*** passa os paramentos para o componente padrao ***
  Cmp_Padrao.ParamValues[0].AsString   := dblkExercicio.LookupValue;
  Cmp_Padrao.ParamValues[1].AsString   := dblkPeriodoIni.LookupValue;
  Cmp_Padrao.ParamValues[2].AsString   := dblkPeriodoFim.LookupValue;
  Cmp_Padrao.ParamValues[3].AsString   := dblkDemo.LookupValue;

  Cmp_Padrao.ParamValues[5].AsString   := Trim(mskCCustoIni.text);
  Cmp_Padrao.ParamValues[6].AsString   := sUnidNegoc;
  Cmp_Padrao.ParamValues[7].AsString   := dblcMoedaReal.LookupValue;
  Cmp_Padrao.ParamValues[8].AsString   := dblcMoedaOrc.LookupValue;
  Cmp_Padrao.ParamValues[9].AsString   := dblcPlanoPrev.LookupValue;
  Cmp_Padrao.ParamValues[10].AsString  := dblcPatro.LookupValue;
  Cmp_Padrao.ParamValues[11].AsInteger := StrToInt(spnPagIni.text);
  Cmp_Padrao.ParamValues[12].AsInteger := rgValores.ItemIndex;
  Cmp_Padrao.ParamValues[13].AsBoolean := chkNegativo.Checked;
  Cmp_Padrao.ParamValues[14].AsBoolean := chk1000.Checked;
  Cmp_Padrao.ParamValues[15].AsBoolean := cbDesconsideraResult.Checked;
  Cmp_Padrao.ParamValues[16].AsBoolean := cbRealMenosOrc.Checked;
  Cmp_Padrao.ParamValues[17].AsString  := sAtivProjMarca;
  Cmp_Padrao.ParamValues[18].AsInteger := StrToIntDef( dblcPlanoPrev.LookupValue,-1 );

  cdsLay.Filtered := False;

end;

procedure Tfrmparamdemolayout.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlDemonstrativo);
  inherited;

end;

procedure Tfrmparamdemolayout.dblkLayoutExit(Sender: TObject);
var sTipo : string;
begin
  inherited;

   if dblkLayout.text <> '' then
   begin
      sTipo := cdsLay.FieldByName('FLGTIPOLAYOUT').asString;
      case sTipo[1] of
         '1': edtTipo.text := 'Normal';
         '2': edtTipo.text := 'Colunado';
         '3': edtTipo.text := 'Colunado Mensal';
         '4': edtTipo.text := 'Balanço Patrimonial';
      end;
      case sTipo[1] of
         '1': cbDesconsideraResult.Enabled := True;
         '2': cbDesconsideraResult.Enabled := False;
         '3': cbDesconsideraResult.Enabled := False;
         '4': cbDesconsideraResult.Enabled := False;
      end;
   end;

end;

end.
