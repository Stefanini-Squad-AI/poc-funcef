{-------------------------------------------------------------------------------
-------------------------------- ALTERAÇÕES ------------------------------------
--------------------------------------------------------------------------------

 SIG ..........: 102043
 Data .........: 22/12/2020
 Responsável ..: Everson Cunha
 Descrição ....: Máscara de conta por PLANO e período vigente
--------------------------------------------------------------------------------
 maRCUS oliveira P. 15363 25/1/2007
 Mudar o cod do CodCentroCusto para CodExterno
--------------------------------------------------------------------------------}

unit FParamRazaoSint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Spin,
  ExtCtrls, ComCtrls, Mask, wwdblook, wwdbdatetimepicker, CMDateTimePicker,
  CmParamReport, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr,
  TB97, Db, Wwdatsrc, CMProcuraMask, MontaSelect, DBClient, wwclient,
  uCMClientDataSet, uCmSqlParams, uCtrlPeriodo,uCtrlContab,uSistema,
   {$IFDEF VERSAO0505} uComum {$ELSE} uCMTypes {$ENDIF};


type
  TfrmParamRazaoSint = class(TfrmParamReports_Padrao)
    grpDatas: TGroupBox;
    lblDataIni: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label14: TLabel;
    dteDataFim: TCMDateTimePicker;
    dblkExercicio: TwwDBLookupCombo;
    dteDataIni: TCMDateTimePicker;
    spnPagIni: TSpinEdit;
    Panel1: TPanel;
    Label5: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    mskCCustoIni: TMaskEdit;
    mskAtivProj: TMaskEdit;
    btnAtivProj: TBitBtn;
    btnCCustoIni: TBitBtn;
    mskSubConta: TMaskEdit;
    btnSubConta: TBitBtn;
    dblkModulo: TwwDBLookupCombo;
    dblkTipoOper: TwwDBLookupCombo;
    dblkHist: TwwDBLookupCombo;
    mskCCustoFim: TMaskEdit;
    btnCCustoFim: TBitBtn;
    chkTipoOper: TCheckBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    rdgLancamentos: TRadioGroup;
    GroupBox1: TGroupBox;
    chkQuebra: TCheckBox;
    chkMascara: TCheckBox;
    TabSheet2: TTabSheet;
    Label11: TLabel;
    Label12: TLabel;
    edtTitulo: TEdit;
    edtSubTitulo: TEdit;
    cmpContaIni: TCMProcuraMaskContabil;
    cmpContaFim: TCMProcuraMaskContabil;
    cdsCCusto: TCMClientDataSet;
    sqlCCusto: TCMSqlParams;
    cdsAtivProj: TCMClientDataSet;
    sqlAtivProj: TCMSqlParams;
    cdsHistorico: TCMClientDataSet;
    sqlHistorico: TCMSqlParams;
    cdsModulo: TCMClientDataSet;
    sqlModulo: TCMSqlParams;
    cdsTipoOper: TCMClientDataSet;
    sqlTipoOper: TCMSqlParams;
    sqlExercicio: TCMSqlParams;
    cdsExercicio: TCMClientDataSet;
    MontaSelectCCusto: TMontaSelect;
    MontaSelectSubConta: TMontaSelect;
    MontaSelectAtivProj: TMontaSelect;
    sqlSubConta: TCMSqlParams;
    cdsSubConta: TCMClientDataSet;
    cdsContaFim: TCMClientDataSet;
    sqlContafim: TCMSqlParams;
    dsContaFim: TwwDataSource;
    procedure btnCCustoIniClick(Sender: TObject);
    procedure btnCCustoFimClick(Sender: TObject);
    procedure mskCCustoIniExit(Sender: TObject);
    procedure mskCCustoFimExit(Sender: TObject);
    procedure mskAtivProjExit(Sender: TObject);
    procedure btnAtivProjClick(Sender: TObject);
    procedure mskSubContaExit(Sender: TObject);
    procedure btnSubContaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmpContaIniExit(Sender: TObject);
    procedure cmpContaFimExit(Sender: TObject);
    procedure dteDataIniExit(Sender: TObject);
  private
    { Private declarations }
    CtrlContab  :TCtrlContab;
    function  VerificaDatas (dDataIni, dDataFim : TDateTime):boolean;

  public
    { Public declarations }
  end;

var
  frmParamRazaoSint: TfrmParamRazaoSint;
  sUnidNegoc : String;
  
implementation

uses uDatabase, DBaseDados,UMensErro,uModulo;

{$R *.DFM}

procedure TfrmParamRazaoSint.btnCCustoIniClick(Sender: TObject);
var
 sCCusto: string;
begin
   inherited;
   MontaSelectCCusto.Executar;
   Repaint;

   if MontaSelectCCusto.RetornouValor then begin
      sCCusto := MontaSelectCCusto.ValoresChave[1];
      with sqlCCusto do begin
         Close;
         Prepare;
         ParamByName('IDEMPRESA').asInteger      := Sistema.idEmpresa;
         ParamByName('CodExterno').asString := sCCusto;
         Open;
         mskCCustoIni.text   := cdsCCusto.FieldByName('CodExterno').asString;
      end;
   end;
   modalResult := mrNone;

end;

procedure TfrmParamRazaoSint.btnCCustoFimClick(Sender: TObject);
var
 sCCusto: string;
begin
   inherited;

   MontaSelectCCusto.Executar;
   Repaint;

   if MontaSelectCCusto.RetornouValor then begin
      sCCusto := MontaSelectCCusto.ValoresChave[1];
      with sqlCCusto do begin
         Prepare;
         ParamByName('IDEMPRESA').asInteger      := Sistema.idEmpresa;
         ParamByName('CodExterno').asString := sCCusto;
         Open;
         mskCCustoFim.text   := cdsCCusto.FieldByName('CodExterno').asString;
      end;
   end;
   modalResult := mrNone;

end;

procedure TfrmParamRazaoSint.mskCCustoIniExit(Sender: TObject);
var sCCusto : string;
begin
  inherited;
  if mskCCustoIni.text <> '' then begin
      sCCusto := mskCCustoIni.text;
      with sqlCCusto do begin
         Close;
         Prepare;
         ParamByName('IDEMPRESA').asInteger     := Sistema.idEmpresa;
         ParamByName('CodExterno').asString := sCCusto;
         Open;
         if not cdsCCusto.isEmpty then begin
            mskCCustoIni.text := cdsCCusto.FieldByName('CodExterno').asString;
         end else begin
            MsgDlg('O código do centro de custo informado não existe.','Aviso',mtWarning,[mbOk],0);
            mskCCustoIni.SetFocus;
         end;
      end;
   end;
   modalResult := mrNone;

end;

procedure TfrmParamRazaoSint.mskCCustoFimExit(Sender: TObject);
var sCCusto : string;
begin
  inherited;
   if mskCCustoFim.text <> '' then begin
      sCCusto := mskCCustoFim.text;
      with sqlCCusto do begin
         Close;
         Prepare;
         ParamByName('IDEMPRESA').asInteger     := Sistema.idEmpresa;
         ParamByName('CodExterno').asString := sCCusto;
         Open;
         if not cdsCCusto.isEmpty then begin
            mskCCustoFim.text := cdsCCusto.FieldByName('CodExterno').asString;
         end else begin
            MsgDlg('O código do centro de custo informado não existe.','Aviso',mtWarning,[mbOk],0);
            mskCCustoFim.SetFocus;
         end;
      end;
   end;
  modalResult := mrNone;

end;

procedure TfrmParamRazaoSint.mskAtivProjExit(Sender: TObject);
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
  modalResult := mrNone;

end;

procedure TfrmParamRazaoSint.btnAtivProjClick(Sender: TObject);
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
   modalResult := mrNone;

end;

procedure TfrmParamRazaoSint.mskSubContaExit(Sender: TObject);
var sSubConta : string;
begin
   inherited;

   if mskSubConta.text <> '' then begin
      sSubConta := mskSubConta.text;
      with sqlSubConta do begin
         Prepare;
         ParamByName('IDPESSOA').asInteger   := Sistema.idEmpresa;
         ParamByName('CODSUBCONTA').asString := sSubConta;
         Open;
         if not cdsSubconta.isEmpty then begin
            mskSubConta.text  := cdsSubConta.FieldByName('CODSUBCONTA').asString;
         end else begin
            MsgDlg('O código da sub-conta informada não existe.','Aviso',mtWarning,[mbOk],0);
            mskSubConta.SetFocus;
         end;
      end;
   end;
  modalResult := mrNone;

end;

procedure TfrmParamRazaoSint.btnSubContaClick(Sender: TObject);
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
         mskSubConta.text    := cdsSubConta.FieldByName('CODSUBCONTA').asString;
      end;
   end;
   modalResult := mrNone;

end;

procedure TfrmParamRazaoSint.FormShow(Sender: TObject);
begin
  inherited;
   PageControl1.ActivePageIndex := 0;

   with sqlExercicio do begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
      Open;
   end;

   with sqlHistorico do begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
      Open;
   end;

   with sqlModulo do begin
      Prepare;
      Open;
   end;

   with sqlTipoOper do begin
      Prepare;
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

procedure TfrmParamRazaoSint.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlContab := TCtrlContab.Create;
   CtrlContab.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

   If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
      MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);

   //Atribui a máscara da conta contábil e o filtro de plano ao MontaSelect
   MontaSelectCCusto.Filtro.Add('CENTCUST.IDEMPRESA = ' + IntToStr(sistema.idEmpresa));
   MontaSelectSubConta.Filtro.Add('SUBCONTA.IDPESSOA = ' + IntToStr(sistema.idEmpresa));
   MontaSelectAtivProj.Filtro.Add('UNIDNEGOCIO.IDPESSOA = ' + IntToStr(sistema.idEmpresa));

end;

function TfrmParamRazaoSint.VerificaDatas(dDataIni, dDataFim:TDateTime):boolean;
begin

   //Faz a verificação se a data final é maior que a data inicial
   result := true;

   if dDataFim < dDataIni then begin
      MsgDlg('A Data Final deve ser maior ou igual que a Data Inicial.','Erro',mtError,[mbOk],0);
      result := false;
   end;

end;

procedure TfrmParamRazaoSint.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   if dblkExercicio.text = '' then begin
      MsgDlg('O Exercício deve ser preenchido.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      Exit;
   end;

   //Filtra os dados da tela para passar para o relatório
   if not ((dteDataIni.Text = '') or (dteDataFim.Text = '')) then
   begin

      //Verifica se a data final é maior ou igual à inicial
      if VerificaDatas(dteDataIni.date, dteDataFim.date) then
      begin

          if  mskAtivProj.Text = '' then sUnidNegoc := '';
          
          //*** passa os paramentos para o componente padrao ***
          Cmp_Padrao.ParamValues[0].AsInteger  := StrToInt(dblkExercicio.LookupValue);
          Cmp_Padrao.ParamValues[1].AsString   := dteDataIni.Text;
          Cmp_Padrao.ParamValues[2].AsString   := dteDataFim.Text;
          Cmp_Padrao.ParamValues[3].AsString   := cmpContaIni.Conta.Numero;
          Cmp_Padrao.ParamValues[4].AsString   := cmpContaFim.Conta.Numero;
          Cmp_Padrao.ParamValues[5].AsString   := Trim(mskCCustoIni.text);
          Cmp_Padrao.ParamValues[6].AsString   := Trim(mskCCustoFim.text);
          Cmp_Padrao.ParamValues[7].AsString   := Trim(mskSubConta.text);
          Cmp_Padrao.ParamValues[8].AsString   := sUnidNegoc;
          Cmp_Padrao.ParamValues[9].AsInteger  := StrToIntDef(dblkModulo.LookupValue,0);
          Cmp_Padrao.ParamValues[10].AsString  := Trim(dblkHist.LookupValue);
          Cmp_Padrao.ParamValues[11].AsInteger := StrToIntDef(dblkTipoOper.LookupValue,0);
          Cmp_Padrao.ParamValues[12].AsBoolean := chkTipoOper.Checked;
          Cmp_Padrao.ParamValues[13].AsInteger := rdgLancamentos.ItemIndex;
          Cmp_Padrao.ParamValues[14].AsBoolean := chkMascara.Checked;
          Cmp_Padrao.ParamValues[15].AsBoolean := chkQuebra.Checked;
          Cmp_Padrao.ParamValues[16].AsInteger := StrToInt(spnPagIni.text);
          Cmp_Padrao.ParamValues[17].AsString  := edtTitulo.text;
          Cmp_Padrao.ParamValues[18].AsString  := edtSubTitulo.text;
      end;
   end;

end;

procedure TfrmParamRazaoSint.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.free;
end;

procedure TfrmParamRazaoSint.cmpContaIniExit(Sender: TObject);
begin
  inherited;
    If (cmpContaIni.Valida <> VcOK) Then
    Begin
      cmpContaIni.SetFocus;
      Exit;
    End;

    if  cmpContaIni.Conta.Numero <> '' then
    begin
      sqlContaFim.Open;
      cdsContaFim.Edit;
      cdsContaFim.FieldByName('PLACONTA').asString := cmpContaIni.Conta.Numero;
    end;
end;

procedure TfrmParamRazaoSint.cmpContaFimExit(Sender: TObject);
begin
  inherited;
    If (cmpContaFim.Valida <> VcOK) Then
    Begin
      cmpContaFim.SetFocus;
      Exit;
    End;

end;

//Everson Cunha - SIG102043 - Ini
procedure TfrmParamRazaoSint.dteDataIniExit(Sender: TObject);
begin
  inherited;

  CtrlContab.SelecionaPlanoData(Sistema.IdEmpresa, dteDataIni.Text);

  //Coloca as máscaras
  cmpContaIni.Plano   := CtrlContab.PlanoData;
  cmpContaIni.Mascara := CtrlContab.MascaraContaData;
  cmpContaFim.Plano   := CtrlContab.PlanoData;
  cmpContaFim.Mascara := CtrlContab.MascaraContaData;
end;
//Everson Cunha - SIG102043 - Fim

end.
