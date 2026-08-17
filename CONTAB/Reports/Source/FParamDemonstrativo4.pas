
unit FParamDemonstrativo4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, StdCtrls, Mask, Spin, ExtCtrls, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, MontaSelect, uCmSqlParams, Db,
  DBClient, uCMClientDataSet, Wwdatsrc, wwclient, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls;

type
  TfrmParamDemonstrativo4 = class(TfrmParamReports_Padrao)
    grpDatas: TGroupBox;
    Label3: TLabel;
    Label1: TLabel;
    Label10: TLabel;
    lblDataIni: TLabel;
    lblDataFim: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    dblkPeriodoFim: TwwDBLookupCombo;
    dblkPeriodoIni: TwwDBLookupCombo;
    dbedDataIni: TCMDateTimePicker;
    dbedDataFim: TCMDateTimePicker;
    rgPD: TRadioGroup;
    Panel1: TPanel;
    Label4: TLabel;
    Label13: TLabel;
    dblkDemo: TwwDBLookupCombo;
    spnPagIni: TSpinEdit;
    Panel4: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    mskCCustoIni: TMaskEdit;
    btnCCustoIni: TBitBtn;
    mskAtivProj: TMaskEdit;
    btnAtivProj: TBitBtn;
    Panel2: TPanel;
    lblMoeda: TLabel;
    dblcMoeda: TwwDBLookupCombo;
    pnlPlanPrev: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    dblcPlanoPrev: TwwDBLookupCombo;
    dblcPatro: TwwDBLookupCombo;
    rgValores: TRadioGroup;
    cdsCCusto: TCMClientDataSet;
    sqlCCusto: TCMSqlParams;
    MontaSelectCCusto: TMontaSelect;
    MontaSelectAtivProj: TMontaSelect;
    cdsAtivProj: TCMClientDataSet;
    sqlAtivProj: TCMSqlParams;
    cdsDemo: TCMClientDataSet;
    sqlDemo: TCMSqlParams;
    cdsExercicio: TCMClientDataSet;
    sqlExercicio: TCMSqlParams;
    cdsPeriodoIni: TCMClientDataSet;
    cdsPeriodoFim: TCMClientDataSet;
    sqlPeriodoFim: TCMSqlParams;
    sqlPeriodoIni: TCMSqlParams;
    cdsMoeda: TCMClientDataSet;
    sqlMoeda: TCMSqlParams;
    sqlPlano: TCMSqlParams;
    cdsPlano: TCMClientDataSet;
    sqlPatro: TCMSqlParams;
    cdsPatro: TCMClientDataSet;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    tbsAtivProj: TTabSheet;
    dbgrAtivProj: TwwDBGrid;
    chkIngles: TCheckBox;
    chkDecimais: TCheckBox;
    chkZerados: TCheckBox;
    cbAcumPerAnt: TCheckBox;
    chkImprimeFiltro: TCheckBox;
    chkNegativo: TCheckBox;
    sqlAtivProjG: TCMSqlParams;
    cdsAtivProjG: TwwClientDataSet;
    dsAtivProjG: TwwDataSource;
    cdsIdPlanCentCust: TCMClientDataSet;
    sqlIdPlanCentCust: TCMSqlParams;
    procedure mskCCustoIniExit(Sender: TObject);
    procedure btnCCustoIniClick(Sender: TObject);
    procedure mskAtivProjExit(Sender: TObject);
    procedure btnAtivProjClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rgPDClick(Sender: TObject);
    procedure dblkExercicioExit(Sender: TObject);
    procedure dblkPeriodoFimChange(Sender: TObject);
  private
   sUnidNegoc,sAtivProjMarca :string;
  public
    { Public declarations }
  end;

var
  frmParamDemonstrativo4: TfrmParamDemonstrativo4;

implementation

uses UMensErro, uDatabase, DBaseDados, uSistema,
     uModulo,  uData;

{$R *.DFM}

procedure TfrmParamDemonstrativo4.mskCCustoIniExit(Sender: TObject);
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
            mskCCustoIni.text := cdsCCusto.FieldByName('CODEXTERNO').asString;
         end else begin
            MsgDlg('O código do centro de custo informado não existe.','Aviso',mtWarning,[mbOk],0);
            mskCCustoIni.SetFocus;
         end;
      end;
   end;

end;

procedure TfrmParamDemonstrativo4.btnCCustoIniClick(Sender: TObject);
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
         ParamByName('CODCENTROCUSTO').asString   := sCCusto;
         Open;
         mskCCustoIni.text   := cdsCCusto.FieldByName('CODEXTERNO').AsString;
      end;
   end;

end;

procedure TfrmParamDemonstrativo4.mskAtivProjExit(Sender: TObject);
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

procedure TfrmParamDemonstrativo4.btnAtivProjClick(Sender: TObject);
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

procedure TfrmParamDemonstrativo4.FormCreate(Sender: TObject);
begin
  inherited;
   MontaSelectCCusto.Filtro.Add('CENTCUST.IDEMPRESA = ' + IntToStr(sistema.idEmpresa));
   MontaSelectAtivProj.Filtro.Add('UNIDNEGOCIO.IDPESSOA = ' + IntToStr(sistema.idEmpresa));

end;

procedure TfrmParamDemonstrativo4.FormShow(Sender: TObject);
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
   with sqlDemo do begin
      Prepare;
      ParamByName('PESSOA').asInteger := Sistema.idEmpresa;
      Open;
   end;
   pnlPlanPrev.Enabled := Sistema.UsaPlanoPatro;

   with sqlAtivProjG do begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
      Open;
   end;
   TwwClientDataSet(CdsAtivProjG).ControlType.Add('MARCA;CheckBox;S;N');

   //
   sqlPlano.Open;
   //
   sqlPatro.Open;

   mskCCustoIni.editMask := modulo.sMascaraCCusto + ';0; ';
   mskAtivProj.editMask  := modulo.sMascaraUnidNegoc + ';0; ';

   sqlMoeda.Open;

end;

procedure TfrmParamDemonstrativo4.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   if dblkExercicio.text = '' then begin
      MsgDlg('O Exercício deve ser preenchido.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      Exit;
   end;
   if rgPD.ItemIndex = 0 then begin
      if dblkPeriodoIni.text = '' then begin
         MsgDlg('O Período Inicial deve ser preenchido.','Erro',mtError,[mbOk],0);
         dblkPeriodoIni.SetFocus;
         modalResult := mrNone;
         Exit;
      end;
      if dblkPeriodoFim.text = '' then begin
         MsgDlg('O Período Final deve ser preenchido.','Erro',mtError,[mbOk],0);
         dblkPeriodoFim.SetFocus;
         modalResult := mrNone;
         Exit;
      end;
   end else begin
      if dbedDataIni.text = '' then begin
         MsgDlg('A Data Inicial deve ser preenchida.','Erro',mtError,[mbOk],0);
         dbedDataIni.SetFocus;
         modalResult := mrNone;
         Exit;
      end;
      if dbedDataFim.text = '' then begin
         MsgDlg('A Data Final deve ser preenchida.','Erro',mtError,[mbOk],0);
         dbedDataFim.SetFocus;
         modalResult := mrNone;
         Exit;
      end;
   end;
   if dblkDemo.text = '' then begin
      MsgDlg('O Demonstrativo deve ser selecionado.','Erro',mtError,[mbOk],0);
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
  if dbedDataIni.Text <> '' then
     Cmp_Padrao.ParamValues[3].AsDateTime := StrToDate(dbedDataIni.Text);

  if dbedDataFim.Text <> '' then
     Cmp_Padrao.ParamValues[4].AsDateTime := StrToDate(dbedDataFim.Text);

  Cmp_Padrao.ParamValues[5].AsInteger  := rgPD.ItemIndex;
  Cmp_Padrao.ParamValues[6].AsString   := dblkDemo.LookupValue;
  Cmp_Padrao.ParamValues[7].AsString   := Trim(mskCCustoIni.text);
  Cmp_Padrao.ParamValues[8].AsString   := sUnidNegoc;
  Cmp_Padrao.ParamValues[9].AsString   := dblcMoeda.LookupValue;
  Cmp_Padrao.ParamValues[10].AsString  := dblcPlanoPrev.LookupValue;
  Cmp_Padrao.ParamValues[11].AsString  := dblcPatro.LookupValue;
  Cmp_Padrao.ParamValues[12].AsInteger := StrToInt(spnPagIni.text);
  Cmp_Padrao.ParamValues[13].AsInteger := rgValores.ItemIndex;
  Cmp_Padrao.ParamValues[14].AsBoolean := chkIngles.Checked;
  Cmp_Padrao.ParamValues[15].AsBoolean := chkImprimeFiltro.Checked;
  Cmp_Padrao.ParamValues[16].AsBoolean := chkZerados.Checked;
  Cmp_Padrao.ParamValues[17].AsBoolean := chkNegativo.Checked;
  Cmp_Padrao.ParamValues[18].AsBoolean := chkDecimais.Checked;
  Cmp_Padrao.ParamValues[19].AsBoolean := cbAcumPerAnt.Checked;
  Cmp_Padrao.ParamValues[20].AsString  := sAtivProjMarca;

end;

procedure TfrmParamDemonstrativo4.rgPDClick(Sender: TObject);
begin
  inherited;
  if rgPD.ItemIndex = 0 then begin
     dblkPeriodoIni.Enabled := true;
     dblkPeriodoFim.Enabled := true;
     dbedDataIni.Enabled    := false;
     dbedDataFim.Enabled    := false;
  end else begin
     dblkPeriodoIni.Text := '';
     dblkPeriodoFim.Text := '';

     dblkPeriodoIni.LookupValue := '';
     dblkPeriodoFim.LookupValue := '';

     dblkPeriodoIni.Enabled := false;
     dblkPeriodoFim.Enabled := false;
     dbedDataIni.Enabled    := true;
     dbedDataFim.Enabled    := true;
  end;

end;

procedure TfrmParamDemonstrativo4.dblkExercicioExit(Sender: TObject);
begin
  inherited;
  if dblkExercicio.LookupValue <> '' then
  begin
    with sqlPeriodoIni do begin
       Prepare;
       ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
       ParamByName('PEREXERCICIO').asInteger := StrToInt(dblkExercicio.LookupValue);
       Open;
    end;
    with sqlPeriodoFim do begin
       Prepare;
       ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
       ParamByName('PEREXERCICIO').asInteger := StrToInt(dblkExercicio.LookupValue);
       Open;
    end;

  end;

end;

procedure TfrmParamDemonstrativo4.dblkPeriodoFimChange(Sender: TObject);
begin
  inherited;
  sqlIdPlanCentCust.Prepare;
  sqlIdPlanCentCust.ParamByName('DATA').AsString :=  (dblkPeriodoIni.LookupValue + '/' + dblkExercicio.Text ) ;
  sqlIdPlanCentCust.open;
  MontaSelectCCusto.Filtro.add('IDPLANCENTCUST = '+ IntToStr(cdsIdPlanCentCust.fieldbyname('IDPLANCENTCUST').AsInteger));
  mskCCustoIni.Text := '';

end;

end.
