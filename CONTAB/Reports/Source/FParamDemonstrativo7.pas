
unit FParamDemonstrativo7;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, MontaSelect, StdCtrls, Mask, wwdblook,
  CmParamReport, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr,
  TB97, ExtCtrls, uCmSqlParams, Db, DBClient, uCMClientDataSet, Spin,
  Wwdatsrc, wwclient, Grids, Wwdbigrd, Wwdbgrid, ComCtrls;

type
  TfrmParamDemonstrativo7 = class(TfrmParamReports_Padrao)
    grpDatas: TGroupBox;
    Label3: TLabel;
    Label1: TLabel;
    Label6: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    dblkPeriodoIni: TwwDBLookupCombo;
    dblkPeriodoFim: TwwDBLookupCombo;
    Panel1: TPanel;
    Label4: TLabel;
    dblkDemo: TwwDBLookupCombo;
    Panel3: TPanel;
    Label5: TLabel;
    Label7: TLabel;
    edtAtivProj: TEdit;
    mskAtivProj: TMaskEdit;
    mskCCustoIni: TMaskEdit;
    btnCCustoIni: TBitBtn;
    btnAtivProj: TBitBtn;
    Panel2: TPanel;
    lblMoeda: TLabel;
    Label2: TLabel;
    dblkMoedaReal: TwwDBLookupCombo;
    dblkMoedaOrc: TwwDBLookupCombo;
    MontaSelectCCusto: TMontaSelect;
    MontaSelectAtivProj: TMontaSelect;
    cdsExercicio: TCMClientDataSet;
    sqlExercicio: TCMSqlParams;
    cdsPeriodoIni: TCMClientDataSet;
    sqlPeriodoIni: TCMSqlParams;
    sqlPeriodoFim: TCMSqlParams;
    cdsPeriodoFim: TCMClientDataSet;
    sqlDemo: TCMSqlParams;
    cdsDemo: TCMClientDataSet;
    sqlMoedaReal: TCMSqlParams;
    cdsMoedaReal: TCMClientDataSet;
    sqlMoedaOrc: TCMSqlParams;
    cdsMoedaOrc: TCMClientDataSet;
    cdsCCusto: TCMClientDataSet;
    sqlCCusto: TCMSqlParams;
    sqlAtivProj: TCMSqlParams;
    cdsAtivProj: TCMClientDataSet;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    tbsAtivProj: TTabSheet;
    dbgrAtivProj: TwwDBGrid;
    chkIngles: TCheckBox;
    chkImprimeFiltro: TCheckBox;
    chkTxt: TCheckBox;
    chkZerados: TCheckBox;
    chkDesconsidera: TCheckBox;
    Label13: TLabel;
    spnPagIni: TSpinEdit;
    sqlAtivProjG: TCMSqlParams;
    cdsAtivProjG: TwwClientDataSet;
    dsAtivProjG: TwwDataSource;
    cdsIdPlanCentCust: TCMClientDataSet;
    sqlIdPlanCentCust: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure mskCCustoIniExit(Sender: TObject);
    procedure btnCCustoIniClick(Sender: TObject);
    procedure mskAtivProjExit(Sender: TObject);
    procedure btnAtivProjClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblkExercicioExit(Sender: TObject);
    procedure dblkPeriodoFimExit(Sender: TObject);
  private
   sUnidNegoc,sAtivProjMarca :string;
  public
    { Public declarations }
  end;

var
  frmParamDemonstrativo7: TfrmParamDemonstrativo7;

implementation

uses UMensErro, uDatabase, DBaseDados, uSistema,
     uModulo,  uData;

{$R *.DFM}

procedure TfrmParamDemonstrativo7.FormCreate(Sender: TObject);
begin
  inherited;
   MontaSelectCCusto.Filtro.Add('CENTCUST.IDEMPRESA = ' + IntToStr(sistema.idEmpresa));
   MontaSelectAtivProj.Filtro.Add('UNIDNEGOCIO.IDPESSOA = ' + IntToStr(sistema.idEmpresa));

end;

procedure TfrmParamDemonstrativo7.mskCCustoIniExit(Sender: TObject);
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

procedure TfrmParamDemonstrativo7.btnCCustoIniClick(Sender: TObject);
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

procedure TfrmParamDemonstrativo7.mskAtivProjExit(Sender: TObject);
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

procedure TfrmParamDemonstrativo7.btnAtivProjClick(Sender: TObject);
var
 sAtivProj: string;
begin
   inherited;

   MontaSelectAtivProj.Executar;
   Repaint;
   if MontaSelectAtivProj.RetornouValor then begin
      sAtivProj := MontaSelectAtivProj.ValoresChave[3];
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

procedure TfrmParamDemonstrativo7.FormShow(Sender: TObject);
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
   with sqlAtivProjG do begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
      Open;
   end;
   TwwClientDataSet(CdsAtivProjG).ControlType.Add('MARCA;CheckBox;S;N');


   mskCCustoIni.editMask := modulo.sMascaraCCusto + ';0; ';
   mskAtivProj.editMask  := modulo.sMascaraUnidNegoc + ';0; ';

   sqlMoedaOrc.Open;
   sqlMoedaReal.Open;

end;

procedure TfrmParamDemonstrativo7.bbtnConfirmarClick(Sender: TObject);
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
  Cmp_Padrao.ParamValues[3].AsString   := dblkDemo.LookupValue;
  Cmp_Padrao.ParamValues[4].AsString   := Trim(mskCCustoIni.text);
  Cmp_Padrao.ParamValues[5].AsString   := sUnidNegoc;
  Cmp_Padrao.ParamValues[6].AsString   := dblkMoedaReal.LookupValue;
  Cmp_Padrao.ParamValues[7].AsString   := dblkMoedaOrc.LookupValue;
  Cmp_Padrao.ParamValues[8].AsInteger  := StrToInt(spnPagIni.text);
  Cmp_Padrao.ParamValues[9].AsBoolean  := chkTxt.Checked;
  Cmp_Padrao.ParamValues[10].AsBoolean := chkIngles.Checked;
  Cmp_Padrao.ParamValues[11].AsBoolean := chkImprimeFiltro.Checked;
  Cmp_Padrao.ParamValues[12].AsBoolean := chkZerados.Checked;
  Cmp_Padrao.ParamValues[13].AsBoolean := chkDesconsidera.Checked;
  Cmp_Padrao.ParamValues[14].AsString  := sAtivProjMarca;

end;

procedure TfrmParamDemonstrativo7.dblkExercicioExit(Sender: TObject);
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

procedure TfrmParamDemonstrativo7.dblkPeriodoFimExit(Sender: TObject);
begin
  inherited;
  sqlIdPlanCentCust.Prepare;
  sqlIdPlanCentCust.ParamByName('DATA').AsString :=  (dblkPeriodoIni.LookupValue + '/' + dblkExercicio.Text ) ;
  sqlIdPlanCentCust.open;
  MontaSelectCCusto.Filtro.add('IDPLANCENTCUST = '+ IntToStr(cdsIdPlanCentCust.fieldbyname('IDPLANCENTCUST').AsInteger));
  mskCCustoIni.Text := '';

end;

end.
