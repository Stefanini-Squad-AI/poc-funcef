
unit FParamDemonstrativo5;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, wwclient, Db, Wwdatsrc, MontaSelect, uCmSqlParams,
  DBClient, uCMClientDataSet, StdCtrls, Mask, Grids, Wwdbigrd, Wwdbgrid,
  Spin, ComCtrls, wwdblook, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls;

type
  TfrmParamDemonstrativo5 = class(TfrmParamReports_Padrao)
    grpDatas: TGroupBox;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    dblkPeriodoIni: TwwDBLookupCombo;
    dblkPeriodoFim: TwwDBLookupCombo;
    Panel1: TPanel;
    Label4: TLabel;
    dblkDemo: TwwDBLookupCombo;
    Panel2: TPanel;
    lblMoeda: TLabel;
    dblcMoeda: TwwDBLookupCombo;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label11: TLabel;
    chkIngles: TCheckBox;
    chkImprimeFiltro: TCheckBox;
    chkZerados: TCheckBox;
    cbDesconsideraResult: TCheckBox;
    spnPagIni: TSpinEdit;
    tbsAtivProj: TTabSheet;
    dbgrAtivProj: TwwDBGrid;
    Panel4: TPanel;
    Label5: TLabel;
    Label7: TLabel;
    mskCCustoIni: TMaskEdit;
    btnCCustoIni: TBitBtn;
    mskAtivProj: TMaskEdit;
    btnAtivProj: TBitBtn;
    cdsMoeda: TCMClientDataSet;
    sqlMoeda: TCMSqlParams;
    sqlCCusto: TCMSqlParams;
    cdsCCusto: TCMClientDataSet;
    MontaSelectAtivProj: TMontaSelect;
    cdsAtivProj: TCMClientDataSet;
    sqlAtivProj: TCMSqlParams;
    cdsPeriodoIni: TCMClientDataSet;
    sqlPeriodoIni: TCMSqlParams;
    sqlPeriodoFim: TCMSqlParams;
    cdsPeriodoFim: TCMClientDataSet;
    sqlExercicio: TCMSqlParams;
    cdsExercicio: TCMClientDataSet;
    cdsDemo: TCMClientDataSet;
    sqlDemo: TCMSqlParams;
    sqlAtivProjG: TCMSqlParams;
    dsAtivProjG: TwwDataSource;
    cdsAtivProjG: TwwClientDataSet;
    MontaSelectCCusto: TMontaSelect;
    cdsIdPlanCentCust: TCMClientDataSet;
    sqlIdPlanCentCust: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure btnCCustoIniClick(Sender: TObject);
    procedure mskCCustoIniExit(Sender: TObject);
    procedure mskAtivProjExit(Sender: TObject);
    procedure btnAtivProjClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblkExercicioExit(Sender: TObject);
    procedure dblkPeriodoFimChange(Sender: TObject);
  private
    sUnidNegoc,sAtivProjMarca :string;

  public
    { Public declarations }
  end;

var
  frmParamDemonstrativo5: TfrmParamDemonstrativo5;

implementation

uses UMensErro, uDatabase, DBaseDados, uSistema,
     uModulo,  uData, uFuncaoGeral;

{$R *.DFM}

procedure TfrmParamDemonstrativo5.FormCreate(Sender: TObject);
begin
  inherited;
   with sqlAtivProjG do begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
      Open;
   end;
   TwwClientDataSet(CdsAtivProjG).ControlType.Add('MARCA;CheckBox;S;N');

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
   //
   sqlMoeda.Open;

   mskCCustoIni.editMask := modulo.sMascaraCCusto + ';0; ';
   mskAtivProj.editMask  := modulo.sMascaraUnidNegoc + ';0; ';

   MontaSelectCCusto.Filtro.Add('CENTCUST.IDEMPRESA = ' + IntToStr(sistema.idEmpresa));
   MontaSelectAtivProj.Filtro.Add('UNIDNEGOCIO.IDPESSOA = ' + IntToStr(sistema.idEmpresa));

end;

procedure TfrmParamDemonstrativo5.btnCCustoIniClick(Sender: TObject);
var sCCusto : string;
begin
  inherited;
   MontaSelectCCusto.Executar;
   Repaint;

   if MontaSelectCCusto.RetornouValor then begin
      sCCusto := MontaSelectCCusto.ValoresChave[3];
      with sqlCCusto do begin
         Prepare;
         ParamByName('IDEMPRESA').asFloat := sistema.idEmpresa;
         ParamByName('CODCENTROCUSTO').asString   := sCCusto;
         Open;
         mskCCustoIni.text   := cdsCCusto.FieldByName('CODEXTERNO').asString;
      end;
   end;

end;

procedure TfrmParamDemonstrativo5.mskCCustoIniExit(Sender: TObject);
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

procedure TfrmParamDemonstrativo5.mskAtivProjExit(Sender: TObject);
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

procedure TfrmParamDemonstrativo5.btnAtivProjClick(Sender: TObject);
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
         ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
         ParamByName('UNECODIGO').asString := sAtivProj;
         Open;
         mskAtivProj.text  := cdsAtivProj.FieldByName('UNECODIGO').asString;
         sUnidNegoc  := IntToStr(cdsAtivProj.FieldByName('UNIDNEGOC').asInteger);

      end;
   end;

end;

procedure TfrmParamDemonstrativo5.FormShow(Sender: TObject);
begin
  inherited;
   PageControl1.ActivePageIndex := 0;

end;

procedure TfrmParamDemonstrativo5.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   If mskAtivProj.text = '' then
      sUnidNegoc := '';

   if dblkExercicio.text = '' then begin
      MsgDlg('O Exercício deve ser preenchido.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
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
   //
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

  //*** passa os paramentos para o componente padrao ***
  Cmp_Padrao.ParamValues[0].AsString  := dblkExercicio.LookupValue;
  Cmp_Padrao.ParamValues[1].AsString  := dblkPeriodoIni.LookupValue;
  Cmp_Padrao.ParamValues[2].AsString  := dblkPeriodoFim.LookupValue;
  Cmp_Padrao.ParamValues[3].AsString  := dblkDemo.LookupValue;
  Cmp_Padrao.ParamValues[4].AsString  := Trim(mskCCustoIni.text);
  Cmp_Padrao.ParamValues[5].AsString  := sUnidNegoc;
  Cmp_Padrao.ParamValues[6].AsString  := dblcMoeda.LookupValue;
  Cmp_Padrao.ParamValues[7].AsBoolean := chkImprimeFiltro.Checked;
  Cmp_Padrao.ParamValues[8].AsBoolean := chkIngles.Checked;
  Cmp_Padrao.ParamValues[9].AsBoolean := chkZerados.Checked;
  Cmp_Padrao.ParamValues[10].AsBoolean := cbDesconsideraResult.Checked;
  Cmp_Padrao.ParamValues[11].AsInteger := StrToInt(spnPagIni.text);
  Cmp_Padrao.ParamValues[12].AsString  := sAtivProjMarca;


end;

procedure TfrmParamDemonstrativo5.dblkExercicioExit(Sender: TObject);
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

procedure TfrmParamDemonstrativo5.dblkPeriodoFimChange(Sender: TObject);
begin
  inherited;
  sqlIdPlanCentCust.Prepare;
  sqlIdPlanCentCust.ParamByName('DATA').AsString :=  (dblkPeriodoIni.LookupValue + '/' + dblkExercicio.Text ) ;
  sqlIdPlanCentCust.open;
  MontaSelectCCusto.Filtro.add('IDPLANCENTCUST = '+ IntToStr(cdsIdPlanCentCust.fieldbyname('IDPLANCENTCUST').AsInteger));
  mskCCustoIni.Text := '';

end;

end.
