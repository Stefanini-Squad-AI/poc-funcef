unit FParamPlanilhas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CMProcuraMask, StdCtrls, ExtCtrls, ComCtrls, Mask,
  wwdblook, wwdbdatetimepicker, CMDateTimePicker, CmParamReport, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, uCmSqlParams, Db,
  DBClient, uCMClientDataSet, MontaSelect,uCtrlContab;

type
  TfrmParamPlanilhas = class(TfrmParamReports_Padrao)
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
    Label9: TLabel;
    Label11: TLabel;
    mskPlanilhaIni: TMaskEdit;
    btnPlanilhaIni: TBitBtn;
    mskPlanilhaFim: TMaskEdit;
    btnPlanilhaFim: TBitBtn;
    dblkTipoOper: TwwDBLookupCombo;
    dblkModulo: TwwDBLookupCombo;
    dblkHist: TwwDBLookupCombo;
    mskNumDoc: TMaskEdit;
    btnNumDoc: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    rdgLancamentos: TRadioGroup;
    rdgDebCre: TRadioGroup;
    GroupBox1: TGroupBox;
    chkMascara: TCheckBox;
    chkQuebra: TCheckBox;
    rdgOrdenacao: TRadioGroup;
    chkTipoOper: TCheckBox;
    chkAtivProjSint: TCheckBox;
    TabSheet2: TTabSheet;
    Label8: TLabel;
    Label6: TLabel;
    edtTitulo: TEdit;
    edtSubTitulo: TEdit;
    cmpContaIni: TCMProcuraMaskContabil;
    cmpContaFim: TCMProcuraMaskContabil;
    MontaSelectPlanilha: TMontaSelect;
    MontaSelectNumDoc: TMontaSelect;
    cdsHisto: TCMClientDataSet;
    cdsSistema: TCMClientDataSet;
    cdsPlaIni: TCMClientDataSet;
    cdsPlaFim: TCMClientDataSet;
    sqlPlaFim: TCMSqlParams;
    sqlPlaIni: TCMSqlParams;
    sqlSistema: TCMSqlParams;
    sqlHisto: TCMSqlParams;
    cdsTipoOper: TCMClientDataSet;
    sqlTipoOper: TCMSqlParams;
    sqlExercicio: TCMSqlParams;
    cdsExercicio: TCMClientDataSet;
    procedure btnNumDocClick(Sender: TObject);
    procedure btnPlanilhaIniClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure mskPlanilhaIniExit(Sender: TObject);
    procedure mskPlanilhaFimExit(Sender: TObject);
    procedure btnPlanilhaFimClick(Sender: TObject);
  private
    { Private declarations }
   CtrlContab  : TCtrlContab;

     function  VerificaDatas (dDataIni, dDataFim : TDateTime):boolean;

  public
    { Public declarations }
  end;

var
  frmParamPlanilhas: TfrmParamPlanilhas;

implementation

uses UMensErro, uDatabase, DBaseDados, uSistema,
     uFuncaoGeral;

{$R *.DFM}

procedure TfrmParamPlanilhas.btnNumDocClick(Sender: TObject);
var
 sNumDoc: string;
begin
   inherited;

   MontaSelectNumDoc.Executar;
   Repaint;
   if MontaSelectNumDoc.RetornouValor then begin
      sNumDoc := MontaSelectNumDoc.ValoresChave[0];
      mskNumDoc.text  := MontaSelectNumDoc.ValoresChave[0];
   end;
   modalResult := mrNone;

end;

procedure TfrmParamPlanilhas.btnPlanilhaIniClick(Sender: TObject);
var
 sPlanilha: string;
begin
   inherited;

   MontaSelectPlanilha.Executar;
   Repaint;
   if MontaSelectPlanilha.RetornouValor then begin
      sPlanilha := MontaSelectPlanilha.ValoresChave[0];
      with sqlPlaIni do begin
         prepare;
         ParamByName('PLNCODIGO').asInteger  := StrToInt(sPlanilha);
         Open;
         mskPlanilhaIni.text  := cdsPlaIni.FieldByName('PLNPLANIL').asString;
      end;
   end;
  modalResult := mrNone;

end;

procedure TfrmParamPlanilhas.FormShow(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePageIndex := 0;

   //Preenche as combo-boxes
   with sqlExercicio do begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
      Open;
   end;
   with sqlHisto do begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
      Open;
   end;

   sqlSistema.Open;
   sqlTipoOper.Open;

   cmpContaIni.Plano     := CtrlContab.PlanoParam;
   cmpContaIni.Mascara   := CtrlContab.MascaraContaParam;
   cmpContaFim.Plano     := CtrlContab.PlanoParam;
   cmpContaFim.Mascara   := CtrlContab.MascaraContaParam;

end;

procedure TfrmParamPlanilhas.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlContab := TCtrlContab.Create;
   CtrlContab.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

   If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
      MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);

end;

procedure TfrmParamPlanilhas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.free;
end;

procedure TfrmParamPlanilhas.bbtnConfirmarClick(Sender: TObject);
var
  SisOri,sHisto,sTipoOp :string;
begin
  inherited;
    If  dblkTipoOper.Text <> '' then
        sTipoOp := dblkTipoOper.LookupValue
    else
        sTipoOp := '0';

    If dblkModulo.Text <> '' then
       SisOri := dblkModulo.LookupValue
    Else
       SisOri := '0';

    If dblkHist.Text <> '' Then
       sHisto := dblkHist.LookupValue
    Else
       sHisto := '0';

   if dblkExercicio.text = '' then begin
      MsgDlg('O Exercício deve ser preenchido.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      Exit;
   end;

   if not ((dteDataIni.Text = '') or (dteDataFim.Text = '')) then
   begin
      if VerificaDatas(dteDataIni.date, dteDataFim.date) then
      begin
          //*** passa os paramentos para o componente padrao ***
          Cmp_Padrao.ParamValues[0].AsInteger  := StrToInt(dblkExercicio.LookupValue);
          Cmp_Padrao.ParamValues[1].AsString   := dteDataIni.Text;
          Cmp_Padrao.ParamValues[2].AsString   := dteDataFim.Text;
          Cmp_Padrao.ParamValues[3].AsInteger  := StrToIntDef(mskPlanilhaIni.Text,0);
          Cmp_Padrao.ParamValues[4].AsInteger  := StrToIntDef(mskPlanilhaFim.Text,0);
          Cmp_Padrao.ParamValues[5].AsString   := cmpContaIni.Conta.Numero;
          Cmp_Padrao.ParamValues[6].AsString   := cmpContaFim.Conta.Numero;

          Cmp_Padrao.ParamValues[7].AsString   := SisOri;
          Cmp_Padrao.ParamValues[8].AsString   := sHisto;
          Cmp_Padrao.ParamValues[9].AsString   := sTipoOp;

          Cmp_Padrao.ParamValues[10].AsString  := mskNumDoc.Text;
          Cmp_Padrao.ParamValues[11].AsBoolean := chkTipoOper.Checked;
          Cmp_Padrao.ParamValues[12].AsInteger := rdgLancamentos.ItemIndex;
          Cmp_Padrao.ParamValues[13].AsInteger := rdgDebCre.ItemIndex;
          Cmp_Padrao.ParamValues[14].AsInteger := rdgOrdenacao.ItemIndex;
          Cmp_Padrao.ParamValues[15].AsBoolean := chkQuebra.Checked;
          Cmp_Padrao.ParamValues[16].AsBoolean := chkMascara.Checked;
          Cmp_Padrao.ParamValues[17].AsBoolean := chkAtivProjSint.Checked;
          Cmp_Padrao.ParamValues[18].AsString  := edtTitulo.Text;
          Cmp_Padrao.ParamValues[19].AsString  := edtSubTitulo.Text;
      end;
   end;
    
end;

procedure TfrmParamPlanilhas.mskPlanilhaIniExit(Sender: TObject);
var sPlanilha : string;
begin
   inherited;

   if mskPlanilhaIni.text <> '' then begin
      sPlanilha := mskPlanilhaIni.text;
      with sqlPlaFim do begin
         prepare;
         ParamByName('PLNPLANIL').asInteger  := StrToInt(sPlanilha);
         Open;
         if not cdsPlaFim.isEmpty then begin
            mskPlanilhaIni.text := cdsPlaFim.FieldByName('PLNPLANIL').asString;
         end else begin
            MsgDlg('O número da planilha informado não existe.','Aviso',mtWarning,[mbOk],0);
            mskPlanilhaIni.SetFocus;
         end;
      end;
   end;

end;

procedure TfrmParamPlanilhas.mskPlanilhaFimExit(Sender: TObject);
var sPlanilha : string;
begin
   inherited;

   if mskPlanilhaFim.text <> '' then begin
      sPlanilha := mskPlanilhaFim.text;
      with sqlPlaFim do begin
         Prepare;
         ParamByName('PLNPLANIL').asInteger  := StrToInt(sPlanilha);
         Open;
         if not cdsPlaFim.isEmpty then begin
            mskPlanilhaFim.text := cdsPlaFim.FieldByName('PLNPLANIL').asString;
         end else begin
            MsgDlg('O número da planilha informado não existe.','Aviso',mtWarning,[mbOk],0);
            mskPlanilhaFim.SetFocus;
         end;
      end;
   end;

end;

procedure TfrmParamPlanilhas.btnPlanilhaFimClick(Sender: TObject);
var
 sPlanilha: string;
begin
   inherited;

   MontaSelectPlanilha.Executar;
   Repaint;
   if MontaSelectPlanilha.RetornouValor then begin
      sPlanilha := MontaSelectPlanilha.ValoresChave[0];
      with sqlPlaIni do begin
         prepare;
         ParamByName('PLNCODIGO').asInteger  := StrToInt(sPlanilha);
         Open;
         mskPlanilhaFim.text  := cdsPlaIni.FieldByName('PLNPLANIL').asString;
      end;
   end;
   modalResult := mrNone;

end;

function TfrmParamPlanilhas.VerificaDatas(dDataIni,
  dDataFim: TDateTime): boolean;
begin
   //Faz a verificação se a data final é maior que a data inicial
   result := true;

   if dDataFim < dDataIni then begin
      MsgDlg('A Data Final deve ser maior ou igual que a Data Inicial.','Erro',mtError,[mbOk],0);
      result := false;
   end;

end;

end.
