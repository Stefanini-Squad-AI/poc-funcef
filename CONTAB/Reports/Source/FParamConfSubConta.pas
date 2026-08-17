unit FParamConfSubConta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, StdCtrls, ExtCtrls, ComCtrls, Mask, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, CmParamReport, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, MontaSelect, uCmSqlParams,
  Db, DBClient, uCMClientDataSet;

type
  TfrmParamConfSubConta = class(TfrmParamReports_Padrao)
    grpDatas: TGroupBox;
    lblDataIni: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dteDataFim: TCMDateTimePicker;
    dblkExercicio: TwwDBLookupCombo;
    dteDataIni: TCMDateTimePicker;
    Panel1: TPanel;
    lblGrupo: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    mskPlanilhaIni: TMaskEdit;
    btnPlanilhaIni: TBitBtn;
    mskPlanilhaFim: TMaskEdit;
    btnPlanilhaFim: TBitBtn;
    dblkTipoOper: TwwDBLookupCombo;
    dblkModulo: TwwDBLookupCombo;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    rdgLancamentos: TRadioGroup;
    rdgOrdenacao: TRadioGroup;
    chkMascara: TCheckBox;
    TabSheet2: TTabSheet;
    Label8: TLabel;
    Label9: TLabel;
    edtTitulo: TEdit;
    edtSubTitulo: TEdit;
    MontaSelectPlanilha: TMontaSelect;
    cdsPla: TCMClientDataSet;
    cdsPla2: TCMClientDataSet;
    sqlPla: TCMSqlParams;
    sqlPla2: TCMSqlParams;
    cdsExercicio: TCMClientDataSet;
    sqlExercicio: TCMSqlParams;
    sqlTipoOper: TCMSqlParams;
    cdsTipoOper: TCMClientDataSet;
    cdsSistema: TCMClientDataSet;
    sqlSistema: TCMSqlParams;
    procedure btnPlanilhaIniClick(Sender: TObject);
    procedure mskPlanilhaIniExit(Sender: TObject);
    procedure mskPlanilhaFimExit(Sender: TObject);
    procedure btnPlanilhaFimClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    function  VerificaDatas (dDataIni, dDataFim : TDateTime):boolean;

  public
    { Public declarations }
  end;

var
  frmParamConfSubConta: TfrmParamConfSubConta;

implementation

uses UMensErro, uDatabase, DBaseDados, uSistema,
     uModulo, uFuncaoGeral;

{$R *.DFM}

procedure TfrmParamConfSubConta.btnPlanilhaIniClick(Sender: TObject);
var
 sPlanilha: string;
begin
   inherited;

   MontaSelectPlanilha.Executar;
   Repaint;
   if MontaSelectPlanilha.RetornouValor then begin
      sPlanilha := MontaSelectPlanilha.ValoresChave[0];
      with sqlPla do begin
         ParamByName('PLNCODIGO').asInteger  := StrToInt(sPlanilha);
         Open;
         mskPlanilhaIni.text  := cdsPla.FieldByName('PLNPLANIL').asString;
      end;
   end;

end;

procedure TfrmParamConfSubConta.mskPlanilhaIniExit(Sender: TObject);
var sPlanilha : string;
begin
   inherited;

   if mskPlanilhaIni.text <> '' then begin
      sPlanilha := mskPlanilhaIni.text;
      with sqlPla2 do begin
         ParamByName('PLNPLANIL').asInteger  := StrToInt(sPlanilha);
         Open;
         if not cdsPla2.isEmpty then begin
            mskPlanilhaIni.text := cdsPla2.FieldByName('PLNPLANIL').asString;
         end else begin
            MsgDlg('O número da planilha informado não existe.','Aviso',mtWarning,[mbOk],0);
            mskPlanilhaIni.SetFocus;
         end;
      end;
   end;

end;

procedure TfrmParamConfSubConta.mskPlanilhaFimExit(Sender: TObject);
var sPlanilha : string;
begin
   inherited;

   if mskPlanilhaFim.text <> '' then begin
      sPlanilha := mskPlanilhaFim.text;
      with sqlPla2 do begin
         ParamByName('PLNPLANIL').asInteger  := StrToInt(sPlanilha);
         Open;
         if not cdsPla2.isEmpty then begin
            mskPlanilhaFim.text := cdsPla2.FieldByName('PLNPLANIL').asString;
         end else begin
            MsgDlg('O número da planilha informado não existe.','Aviso',mtWarning,[mbOk],0);
            mskPlanilhaFim.SetFocus;
         end;
      end;
   end;

end;

procedure TfrmParamConfSubConta.btnPlanilhaFimClick(Sender: TObject);
var
 sPlanilha: string;
begin
   inherited;

   MontaSelectPlanilha.Executar;
   Repaint;
   if MontaSelectPlanilha.RetornouValor then begin
      sPlanilha := MontaSelectPlanilha.ValoresChave[0];
      with sqlPla do begin
         ParamByName('PLNCODIGO').asInteger  := StrToInt(sPlanilha);
         Open;
         mskPlanilhaFim.text  := cdsPla.FieldByName('PLNPLANIL').asString;
      end;
   end;

end;

procedure TfrmParamConfSubConta.FormShow(Sender: TObject);
begin
  inherited;
   PageControl1.ActivePageIndex := 0;
   //Preenche as combo-boxes
   with sqlExercicio do begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
      Open;
   end;
   with sqlSistema do begin
      Prepare;
      Open;
   end;
   with sqlTipoOper do begin
      Prepare;
      Open;
   end;

end;

procedure TfrmParamConfSubConta.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   if dblkExercicio.text = '' then begin
      MsgDlg('O Exercício deve ser preenchido.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      Exit;
   end;

   //Filtra os dados da tela para passar para o relatório
   if not ((dteDataIni.Text = '') or (dteDataFim.Text = '')) then begin

      //Verifica se a data final é maior ou igual à inicial
      if VerificaDatas(dteDataIni.date, dteDataFim.date) then begin

          //*** passa os paramentos para o componente padrao ***
          Cmp_Padrao.ParamValues[0].AsString   := dblkExercicio.Text;
          Cmp_Padrao.ParamValues[1].AsDateTime := StrToDate(dteDataIni.Text);
          Cmp_Padrao.ParamValues[2].AsDateTime := StrToDate(dteDataFim.Text);
          Cmp_Padrao.ParamValues[3].AsString   := mskPlanilhaIni.Text;
          Cmp_Padrao.ParamValues[4].AsString   := mskPlanilhaFim.Text;
          Cmp_Padrao.ParamValues[5].AsInteger  := StrToIntDef(dblkModulo.LookupValue,0);
          Cmp_Padrao.ParamValues[6].AsString   := dblkTipoOper.LookupValue;
          Cmp_Padrao.ParamValues[7].AsInteger  := rdgLancamentos.ItemIndex;
          Cmp_Padrao.ParamValues[8].AsBoolean  := chkMascara.Checked;
          Cmp_Padrao.ParamValues[9].AsInteger  := rdgOrdenacao.ItemIndex;
          Cmp_Padrao.ParamValues[10].AsString  := edtTitulo.Text;
          Cmp_Padrao.ParamValues[11].AsString  := edtSubTitulo.Text;

      end;

   end;


end;

function TfrmParamConfSubConta.VerificaDatas(dDataIni,
  dDataFim: TDateTime): boolean;
begin

   result := true;

   if dDataFim < dDataIni then begin
      MsgDlg('A Data Final deve ser maior ou igual que a Data Inicial.','Erro',mtError,[mbOk],0);
      result := false;
   end;

end;

end.
