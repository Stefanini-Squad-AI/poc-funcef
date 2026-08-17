
unit FParamDemonstrativo1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, Db, Wwdatsrc, wwclient, DBClient, uCMClientDataSet,
  uCmSqlParams, Grids, Wwdbigrd, Wwdbgrid, Spin, StdCtrls, ComCtrls, Mask,
  wwdblook, CmParamReport, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect;

type
  TfrmParamDemonstrativo1 = class(TfrmParamReports_Padrao)
    grpDatas: TGroupBox;
    Label3: TLabel;
    Label1: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    dblkPeriodo: TwwDBLookupCombo;
    Panel1: TPanel;
    Label4: TLabel;
    dblkDemo: TwwDBLookupCombo;
    Panel3: TPanel;
    Label5: TLabel;
    Label7: TLabel;
    mskCCustoIni: TMaskEdit;
    btnCCustoIni: TBitBtn;
    mskAtivProj: TMaskEdit;
    btnAtivProj: TBitBtn;
    Panel2: TPanel;
    lblMoeda: TLabel;
    dblcMoeda: TwwDBLookupCombo;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label11: TLabel;
    chkIngles: TCheckBox;
    chkDiferenca: TCheckBox;
    chkZerados: TCheckBox;
    cbDesconsideraResult: TCheckBox;
    cbSoMovimento: TCheckBox;
    cbUltimoPeriodo: TCheckBox;
    spnPagIni: TSpinEdit;
    cbGeraTXT: TCheckBox;
    chkImprimeFiltro: TCheckBox;
    tbsAtivProj: TTabSheet;
    dbgrAtivProj: TwwDBGrid;
    sqlCCusto: TCMSqlParams;
    cdsCCusto: TCMClientDataSet;
    cdsAtivProj: TCMClientDataSet;
    sqlAtivProj: TCMSqlParams;
    cdsAtivProjG: TwwClientDataSet;
    sqlAtivProjG: TCMSqlParams;
    dsAtivProjG: TwwDataSource;
    MontaSelectCCusto: TMontaSelect;
    cdsDemo: TCMClientDataSet;
    sqlDemo: TCMSqlParams;
    sqlMoeda: TCMSqlParams;
    cdsMoeda: TCMClientDataSet;
    sqlPeriodo: TCMSqlParams;
    sqlExercicio: TCMSqlParams;
    cdsPeriodo: TCMClientDataSet;
    cdsExercicio: TCMClientDataSet;
    MontaSelectAtivProj: TMontaSelect;
    sqlIdPlanCentCust: TCMSqlParams;
    cdsIdPlanCentCust: TCMClientDataSet;
    procedure mskCCustoIniExit(Sender: TObject);
    procedure btnCCustoIniClick(Sender: TObject);
    procedure mskAtivProjExit(Sender: TObject);
    procedure btnAtivProjClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblkExercicioExit(Sender: TObject);
    procedure dblkPeriodoChange(Sender: TObject);
  private
    { Private declarations }
    sUnidNegoc,sAtivProjMarca :string;
  public
    { Public declarations }
  end;

var
  frmParamDemonstrativo1: TfrmParamDemonstrativo1;

implementation

uses UMensErro, uDatabase, DBaseDados, uSistema,
     uModulo,  uData, uFuncaoGeral;

{$R *.DFM}

procedure TfrmParamDemonstrativo1.mskCCustoIniExit(Sender: TObject);
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

procedure TfrmParamDemonstrativo1.btnCCustoIniClick(Sender: TObject);
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

procedure TfrmParamDemonstrativo1.mskAtivProjExit(Sender: TObject);
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

procedure TfrmParamDemonstrativo1.btnAtivProjClick(Sender: TObject);
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

procedure TfrmParamDemonstrativo1.FormCreate(Sender: TObject);
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
   with sqlPeriodo do begin
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

   MontaSelectCCusto.Filtro.Add('CENTCUST.IDEMPRESA = ' + IntToStr(sistema.idEmpresa));
   MontaSelectAtivProj.Filtro.Add('UNIDNEGOCIO.IDPESSOA = ' + IntToStr(sistema.idEmpresa));

   mskCCustoIni.editMask := modulo.sMascaraCCusto + ';0; ';
   mskAtivProj.editMask  := modulo.sMascaraUnidNegoc + ';0; ';

end;

procedure TfrmParamDemonstrativo1.FormShow(Sender: TObject);
begin
  inherited;
   PageControl1.ActivePageIndex := 0;

end;

procedure TfrmParamDemonstrativo1.bbtnConfirmarClick(Sender: TObject);
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

   If mskAtivProj.text = '' then
      sUnidNegoc := ''
   else
     sAtivProjMarca := '';

  //*** passa os paramentos para o componente padrao ***
  Cmp_Padrao.ParamValues[0].AsString   := dblkExercicio.LookupValue;
  Cmp_Padrao.ParamValues[1].AsString   := dblkPeriodo.LookupValue;
  Cmp_Padrao.ParamValues[2].AsString   := dblkDemo.LookupValue;
  Cmp_Padrao.ParamValues[3].AsString   := Trim(mskCCustoIni.text);
  Cmp_Padrao.ParamValues[4].AsString   := sUnidNegoc;
  Cmp_Padrao.ParamValues[5].AsString   := dblcMoeda.LookupValue;
  Cmp_Padrao.ParamValues[6].AsInteger  := StrToInt(spnPagIni.text);
  Cmp_Padrao.ParamValues[7].AsBoolean  := cbUltimoPeriodo.Checked;
  Cmp_Padrao.ParamValues[8].AsBoolean  := cbSoMovimento.Checked;
  Cmp_Padrao.ParamValues[9].AsBoolean  := cbDesconsideraResult.Checked;
  Cmp_Padrao.ParamValues[10].AsBoolean := chkZerados.Checked;
  Cmp_Padrao.ParamValues[11].AsBoolean := chkDiferenca.Checked;
  Cmp_Padrao.ParamValues[12].AsBoolean := chkIngles.Checked;
  Cmp_Padrao.ParamValues[13].AsBoolean := chkImprimeFiltro.Checked;
  Cmp_Padrao.ParamValues[14].AsBoolean := cbGeraTXT.Checked;
  Cmp_Padrao.ParamValues[15].AsString  := sAtivProjMarca;

end;

procedure TfrmParamDemonstrativo1.dblkExercicioExit(Sender: TObject);
begin
  inherited;
  if dblkExercicio.LookupValue <> '' then
  begin
    with sqlPeriodo do begin
       Prepare;
       ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
       ParamByName('PEREXERCICIO').asInteger := StrToInt(dblkExercicio.LookupValue);
       Open;
    end;
  end;
end;

procedure TfrmParamDemonstrativo1.dblkPeriodoChange(Sender: TObject);
begin
  inherited;
  sqlIdPlanCentCust.Prepare;
  sqlIdPlanCentCust.ParamByName('DATA').AsString :=  (dblkPeriodo.LookupValue + '/' + dblkExercicio.Text ) ;
  sqlIdPlanCentCust.open;
  MontaSelectCCusto.Filtro.add('IDPLANCENTCUST = '+ IntToStr(cdsIdPlanCentCust.fieldbyname('IDPLANCENTCUST').AsInteger));
  mskCCustoIni.Text := '';

end;

end.
