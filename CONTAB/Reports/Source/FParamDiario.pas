{ --------------------------------------------------------------------------------------------------
Rotina......: bbtnConfirmarClick
Nº SOL......: 129731
Nº KINTANA..: 715203
Data........: 19/06/2011
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação da opção "Exportar Direto para PDF".
---------------------------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
  Desenvolvedor : Marcus Oliveira
  Data          : 23/05/2007
  Pendência     : 25323
  Descrição     : Criado dois botões para Marcar todos e Inverter Marcação para
                  Plano e patro.
{------------------------------------------------------------------------------
 Desenvolvedor: Marcus Oliveira
 Data         : 09/05/2007
 Pendência    : 25303
 Solução      : Aumentado o campo máximo de 50000 para 500000 do componente spnPagIni.
{------------------------------------------------------------------------------
 26/09/03 - Pend 15095 by Alex
 Diário Consolidado
 Necessário para consolidar multi-empresa, ex;
   EMPRESA A
   EMPRESA B
   EMPRESA CONSOLIDADO  == O sistema gera esta empresa no multi-empresa

   para tirar o diário consolidado é necessário logar como CONSOLIDADO
   e o sistema emite o diário das outras empresas

   CAMPO INVISÍVEL CASO SEJA UMA ÚNICA EMPRESA
   }
{------------------------------------------------------------------------------
  Desenvolvedor:  Alex Pereira
  Data         : 04/12/2003
  Pendência    : 15608 - Erro ao se selecionar múltiplas Patrocinadoras ou Patros
  Solução      : Corrigidos as propriedades 25 e 25 do Cmp_Padrao. Trocado de
                 real para string, pois são vetores de plano e patro.
------------------------------------------------------------------------------}

unit FParamDiario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, wwdbdatetimepicker, CMDateTimePicker, Mask,
  wwdblook, StdCtrls, Spin, ExtCtrls, ComCtrls, CmParamReport, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, uCmSqlParams, Db,
  DBClient, uCMClientDataSet, MontaSelect, CMProcuraMask,uCtrlContab,
  wwclient, Grids, Wwdbigrd, Wwdbgrid, Wwdatsrc;

type
  TfrmParamDiario = class(TfrmParamReports_Padrao)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    rdgLancamentos: TRadioGroup;
    GroupBox1: TGroupBox;
    Label13: TLabel;
    chkCorresp: TCheckBox;
    chkQuebra: TCheckBox;
    chkMascara: TCheckBox;
    spnPagIni: TSpinEdit;
    cbConsolidado: TCheckBox;
    cbPlanilZerada: TCheckBox;
    chkAtivProjSint: TCheckBox;
    TabSheet3: TTabSheet;
    rdgOrdenacao: TRadioGroup;
    chkNumDoc: TCheckBox;
    TabSheet2: TTabSheet;
    Label11: TLabel;
    Label12: TLabel;
    edtTitulo: TEdit;
    edtSubTitulo: TEdit;
    tbsPlanoPatro: TTabSheet;
    Panel1: TPanel;
    Label5: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label14: TLabel;
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
    grpDatas: TGroupBox;
    lblDataIni: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dteDataFim: TCMDateTimePicker;
    dblkExercicio: TwwDBLookupCombo;
    dteDataIni: TCMDateTimePicker;
    cdsTipoOper: TCMClientDataSet;
    sqlTipoOper: TCMSqlParams;
    cdsHisto: TCMClientDataSet;
    sqlHisto: TCMSqlParams;
    cdsExerc: TCMClientDataSet;
    sqlExerc: TCMSqlParams;
    MontaSelectSubConta: TMontaSelect;
    MontaSelectAtivProj: TMontaSelect;
    MontaSelectConta: TMontaSelect;
    MontaSelectCCusto: TMontaSelect;
    cdsModulo: TCMClientDataSet;
    sqlModulo: TCMSqlParams;
    sqlSubConta: TCMSqlParams;
    cdsSubConta: TCMClientDataSet;
    sqlAtivProj: TCMSqlParams;
    cdsAtivProj: TCMClientDataSet;
    sqlCCusto: TCMSqlParams;
    cdsCCusto: TCMClientDataSet;
    cmpContaIni: TCMProcuraMaskContabil;
    cmpContaFim: TCMProcuraMaskContabil;
    sqlPatro: TCMSqlParams;
    sqlPlanoPrev: TCMSqlParams;
    dbgrPlanoPrev: TwwDBGrid;
    dbgrPatro: TwwDBGrid;
    cdsPatro: TwwClientDataSet;
    cdsPlanoPrev: TwwClientDataSet;
    dsPatro: TwwDataSource;
    dsPlanoPrev: TwwDataSource;
    sqlMultiEmpresa: TCMSqlParams;
    cdsMultiEmpresa: TwwClientDataSet;
    Panel5: TPanel;
    Splitter3: TSplitter;
    Bevel1: TBevel;
    Panel6: TPanel;
    spdInverterPlano: TSpeedButton;
    spdTodosPlano: TSpeedButton;
    Panel7: TPanel;
    spdInvertePatro: TSpeedButton;
    spdTodosPatro: TSpeedButton;
    chkExport: TCheckBox;
    Label15: TLabel;
    edPasta: TEdit;
    sbPasta: TSpeedButton;
    sdDialog: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure cmpContaIniExit(Sender: TObject);
    procedure cmpContaFimExit(Sender: TObject);
    procedure btnCCustoIniClick(Sender: TObject);
    procedure mskCCustoIniExit(Sender: TObject);
    procedure btnCCustoFimClick(Sender: TObject);
    procedure mskCCustoFimExit(Sender: TObject);
    procedure mskSubContaExit(Sender: TObject);
    procedure btnSubContaClick(Sender: TObject);
    procedure mskAtivProjExit(Sender: TObject);
    procedure btnAtivProjClick(Sender: TObject);
    procedure dteDataIniExit(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure spdTodosPlanoClick(Sender: TObject);
    procedure spdInverterPlanoClick(Sender: TObject);
    procedure spdTodosPatroClick(Sender: TObject);
    procedure spdInvertePatroClick(Sender: TObject);
    procedure sbPastaClick(Sender: TObject);
  private
    { Private declarations }
   CtrlContab :TCtrlContab;
   function  VerificaDatas (dDataIni, dDataFim : TDateTime):boolean;
   procedure GuardaMarcadosNosGrids;

  public
    { Public declarations }
  end;

var
  frmParamDiario: TfrmParamDiario;
  iPlano : LongInt;
  sUnidNegoc,sPlanoPrevMarca,sPatroMarca : String;

implementation

uses UMensErro, uDatabase, DBaseDados, uSistema,uString,uModulo,
     uCMTypes;

{$R *.DFM}

function TfrmParamDiario.VerificaDatas(dDataIni, dDataFim:TDateTime):boolean;
begin

   //Faz a verificação se a data final é maior que a data inicial
   result := true;

   if dDataFim < dDataIni then begin
      MsgDlg('A Data Final deve ser maior ou igual que a Data Inicial.','Erro',mtError,[mbOk],0);
      result := false;
   end;

end;

procedure TfrmParamDiario.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlContab := TCtrlContab.Create;
   CtrlContab.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                         Sistema.AppRemoteServer,True,nil,nil,False);

   If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
      MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);

   MontaSelectCCusto.Filtro.Add('CENTCUST.IDEMPRESA = ' + IntToStr(sistema.idEmpresa));
   MontaSelectSubConta.Filtro.Add('SUBCONTA.IDPESSOA = ' + IntToStr(sistema.idEmpresa));
   MontaSelectAtivProj.Filtro.Add('UNIDNEGOCIO.IDPESSOA = ' + IntToStr(sistema.idEmpresa));
   iPlano := Modulo.iPlano;

   { Diário Consolidado
     Necessário para consolidar multi-empresa, ex;

     EMPRESA A
     EMPRESA B
     EMPRESA CONSOLIDADO  == O sistema gera esta empresa no multi-empresa

     para tirar o diário consolidado é necessário logar como CONSOLIDADO
     e o sistema emite o diário das outras empresas

     CAMPO INVISÍVEL CASO SEJA UMA ÚNICA EMPRESA
   }
   sqlMultiEmpresa.Open;
   if cdsMultiEmpresa.FieldByName('TOTAL').AsInteger = 1 then
      cbConsolidado.Visible := false;

   cdsMultiEmpresa.Close;
end;


procedure TfrmParamDiario.cmpContaIniExit(Sender: TObject);
begin
  inherited;
  If (ActiveControl.Tag <> 999) And (cmpContaIni.Valida <> VcOK) Then
  Begin
    cmpContaIni.SetFocus;
    Exit;
  End;

end;

procedure TfrmParamDiario.cmpContaFimExit(Sender: TObject);
begin
  inherited;
    If (ActiveControl.Tag <> 999) And (cmpContaFim.Valida <> VcOK) Then
    Begin
      cmpContaFim.SetFocus;
      Exit;
    End;

end;

procedure TfrmParamDiario.btnCCustoIniClick(Sender: TObject);
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
         ParamByName('IDEMPRESA').asInteger     := Sistema.idEmpresa;
         ParamByName('CODCENTROCUSTO').asString := sCCusto;
         Open;
         mskCCustoIni.text   := cdsCCusto.FieldByName('CODCENTROCUSTO').asString;
      end;
   end;
   modalResult := mrNone;

end;

procedure TfrmParamDiario.mskCCustoIniExit(Sender: TObject);
var sCCusto : string;
begin
   inherited;

   if mskCCustoIni.text <> '' then begin
      sCCusto := mskCCustoIni.text;
      with sqlCCusto do begin
         Prepare;
         ParamByName('IDEMPRESA').asInteger     := Sistema.idEmpresa;
         ParamByName('CODCENTROCUSTO').asString := sCCusto;
         Open;
         if not cdsCCusto.isEmpty then begin
            mskCCustoIni.text := cdsCCusto.FieldByName('CODCENTROCUSTO').asString;
         end else begin
            MsgDlg('O código do centro de custo informado não existe.','Aviso',mtWarning,[mbOk],0);
            mskCCustoIni.SetFocus;
         end;
      end;
   end;
   modalResult := mrNone;

end;

procedure TfrmParamDiario.btnCCustoFimClick(Sender: TObject);
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
         ParamByName('IDEMPRESA').asInteger     := Sistema.idEmpresa;
         ParamByName('CODCENTROCUSTO').asString := sCCusto;
         Open;
         mskCCustoFim.text   := cdsCCusto.FieldByName('CODCENTROCUSTO').asString;
      end;
   end;
   modalResult := mrNone;

end;

procedure TfrmParamDiario.mskCCustoFimExit(Sender: TObject);
var sCCusto : string;
begin
   inherited;

   if mskCCustoFim.text <> '' then begin
      sCCusto := mskCCustoFim.text;
      with sqlCCusto do begin
         Prepare;
         ParamByName('IDEMPRESA').asInteger     := Sistema.idEmpresa;
         ParamByName('CODCENTROCUSTO').asString := sCCusto;
         Open;
         if not cdsCCusto.isEmpty then begin
            mskCCustoFim.text := cdsCCusto.FieldByName('CODCENTROCUSTO').asString;
         end else begin
            MsgDlg('O código do centro de custo informado não existe.','Aviso',mtWarning,[mbOk],0);
            mskCCustoFim.SetFocus;
         end;
      end;
   end;
   modalResult := mrNone;

end;

procedure TfrmParamDiario.mskSubContaExit(Sender: TObject);
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
         if not cdsSubConta.isEmpty then begin
            mskSubConta.text  := cdsSubConta.FieldByName('CODSUBCONTA').asString;
         end else begin
            MsgDlg('O código da sub-conta informada não existe.','Aviso',mtWarning,[mbOk],0);
            mskSubConta.SetFocus;
         end;
      end;
   end;
   modalResult := mrNone;

end;

procedure TfrmParamDiario.btnSubContaClick(Sender: TObject);
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

procedure TfrmParamDiario.mskAtivProjExit(Sender: TObject);
var sAtivProj : string;
begin
   inherited;

   if mskAtivProj.text <> '' then begin
      sAtivProj := mskAtivProj.text;
      With sqlAtivProj do begin
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
      End;
   end;
   modalResult := mrNone;

end;

procedure TfrmParamDiario.btnAtivProjClick(Sender: TObject);
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
         mskAtivProj.text := cdsAtivProj.FieldByName('UNECODIGO').asString;
         sUnidNegoc  := IntToStr(cdsAtivProj.FieldByName('UNIDNEGOC').asInteger);

      end;
   end;
   modalResult := mrNone;

end;

procedure TfrmParamDiario.dteDataIniExit(Sender: TObject);
var iPlanoAnt : LongInt;
begin
  inherited;
   iPlanoAnt  := CtrlContab.PlanoParam;

   if CtrlContab.SelecionaPlanoData(Sistema.IdEmpresa, dteDataIni.Text) then iPlano := CtrlContab.PlanoData;

   if (iPlano <> iPlanoAnt) and (iPlano <> 0) then
   begin
      cmpContaIni.Plano     := iPlano;
      cmpContaIni.Mascara   := CtrlContab.MascaraContaParam;
      cmpContaFim.Plano     := iPlano;
      cmpContaFim.Mascara   := CtrlContab.MascaraContaParam;
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



procedure TfrmParamDiario.PageControl1Change(Sender: TObject);
begin
   if edtTitulo.text = '' then
   begin
      //Imprime os títulos
      edtTitulo.text := 'Diário - período de ' + dteDataIni.text + ' a ' + dteDataFim.text;

      if trim(mskCCustoIni.text) <> '' then begin
         edtSubTitulo.text := edtSubTitulo.text +  '     Centro de Custo Inicial : ' + mskCCustoIni.Text;
      end;
      if trim(mskCCustoFim.text) <> '' then begin
         edtSubTitulo.text := edtSubTitulo.text +  '     Centro de Custo Final : ' + mskCCustoFim.Text;
      end;
      if trim(mskSubConta.text) <> '' then begin
         edtSubTitulo.text := edtSubTitulo.text +  '     Sub-Conta : ' + mskSubConta.Text;
      end;
      if trim(mskAtivProj.text) <> '' then begin
         edtSubTitulo.text := edtSubTitulo.text +  '     Atividade/Projeto : ' + mskAtivProj.Text;
      end;
      if trim(dblkModulo.text) <> '' then begin
         edtSubTitulo.text := edtSubTitulo.text +  '     Módulo : ' + dblkModulo.Text;
      end;
      if trim(dblkTipoOper.text) <> '' then begin
         edtSubTitulo.text := edtSubTitulo.text +  '     Tipo de Operação : ' + dblkTipoOper.Text;
      end;
      if trim(dblkHist.text) <> '' then begin
         edtSubTitulo.text := edtSubTitulo.text +  '     Histórico Padrão : ' + dblkHist.Text;
      end;
      case rdgLancamentos.itemIndex of
         0: edtSubTitulo.text := edtSubTitulo.text +  '    Lançamentos : TODOS';
         1: edtSubTitulo.text := edtSubTitulo.text +  '    Lançamentos : Somente Integrados';
         2: edtSubTitulo.text := edtSubTitulo.text +  '    Lançamentos : Somente NÃO Integrados';
      end;

   end;
end;



procedure TfrmParamDiario.FormShow(Sender: TObject);
begin
  inherited;

   sqlTipoOper.Open;

   sqlModulo.Open;

   PageControl1.activePage := TabSheet1;

   //tbsPlanoPatro.Visible   := Sistema.UsaPlanoPatro;
   //
   sqlPlanoPrev.Open;
   TwwClientDataSet(cdsPlanoPrev).ControlType.Add('MARCA;CheckBox;S;N');
   //
   sqlPatro.Open;
   TwwClientDataSet(cdsPatro).ControlType.Add('MARCA;CheckBox;S;N');

   //Preenche as combo-boxes
   with sqlExerc do
   begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
      Open;
   end;

   with sqlHisto do
   begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
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
end;



procedure TfrmParamDiario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   CtrlContab.Free;
end;



procedure TfrmParamDiario.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;

   if dblkExercicio.text = '' then
   begin
      MsgDlg('O Exercício deve ser preenchido.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      Exit;
   end;

   //Filtra os dados da tela para passar para o relatório
   If not ((dteDataIni.Text = '') or (dteDataFim.Text = '')) Then
   Begin
     If Not VerificaDatas(dteDataIni.date, dteDataFim.date) Then
     Begin
       Exit;
       modalResult := mrNone;
     End;
   End;

   // Alterado por FHBS - SOL: 129731 KTN: 715203
   if chkExport.Checked then
     if trim(edPasta.Text) = '' then
     begin
       MsgDlg('Nome e Local do arquivo PDF deve ser preenchido.', 'Erro', mtError, [mbOk], 0);
       modalResult := mrNone;
       Exit;
     end;
   // Fim - Alterado por FHBS - SOL: 129731 KTN: 715203

  GuardaMarcadosNosGrids;

   If mskAtivProj.text = '' then
      sUnidNegoc := '';

  //*** Passa parametros ***
  Cmp_Padrao.ParamValues[0].AsInteger  := StrToInt(dblkExercicio.LookupValue);
  Cmp_Padrao.ParamValues[1].AsDateTime := StrToDate(dteDataIni.Text);
  Cmp_Padrao.ParamValues[2].AsDateTime := StrToDate(dteDataFim.Text);
  Cmp_Padrao.ParamValues[3].AsString   := cmpContaIni.Conta.Numero;
  Cmp_Padrao.ParamValues[4].AsString   := cmpContaFim.Conta.Numero;
  Cmp_Padrao.ParamValues[5].AsString   := sUnidNegoc;
  Cmp_Padrao.ParamValues[6].AsString   := Trim(mskCCustoIni.text);
  Cmp_Padrao.ParamValues[7].AsString   := Trim(mskCCustoFim.text);
  Cmp_Padrao.ParamValues[8].AsInteger  := StrToIntDef(dblkModulo.LookupValue, 0);
  Cmp_Padrao.ParamValues[9].AsString   := Trim(mskSubConta.text);
  Cmp_Padrao.ParamValues[10].AsString  := dblkHist.LookupValue;
  Cmp_Padrao.ParamValues[11].AsString  := dblkTipoOper.LookupValue;
  Cmp_Padrao.ParamValues[12].AsBoolean := chkTipoOper.Checked;
  Cmp_Padrao.ParamValues[13].AsInteger := rdgLancamentos.ItemIndex;
  Cmp_Padrao.ParamValues[14].AsInteger := StrToInt(spnPagIni.text);
  Cmp_Padrao.ParamValues[15].AsBoolean := chkQuebra.Checked;
  Cmp_Padrao.ParamValues[16].AsBoolean := chkMascara.Checked;
  Cmp_Padrao.ParamValues[17].AsBoolean := chkCorresp.Checked;
  Cmp_Padrao.ParamValues[18].AsBoolean := cbConsolidado.Checked;
  Cmp_Padrao.ParamValues[19].AsBoolean := cbPlanilZerada.Checked;
  Cmp_Padrao.ParamValues[20].AsBoolean := chkAtivProjSint.Checked;
  Cmp_Padrao.ParamValues[21].AsBoolean := chkNumDoc.Checked;
  Cmp_Padrao.ParamValues[22].AsInteger := rdgOrdenacao.ItemIndex;
  Cmp_Padrao.ParamValues[23].AsString  := edtTitulo.text;
  Cmp_Padrao.ParamValues[24].AsString  := edtSubTitulo.text;
  Cmp_Padrao.ParamValues[25].AsString  := sPlanoPrevMarca;
  Cmp_Padrao.ParamValues[26].AsString  := sPatroMarca;

  // Alterado por FHBS - SOL: 129731 KTN: 715203
  Cmp_Padrao.ParamValues[27].AsBoolean := chkExport.Checked;
  Cmp_Padrao.ParamValues[28].AsString  := edPasta.Text;

end;

procedure TfrmParamDiario.GuardaMarcadosNosGrids;
begin
   sPlanoPrevMarca  := '';
   sPatroMarca      := '';
   if Sistema.UsaPlanoPatro then
   begin
      cdsPatro.First;
      While not cdsPatro.EOF do begin
         if cdsPatro.FieldByName('MARCA').AsString = 'S' then begin
            if sPatroMarca = '' then begin
               sPatroMarca := trim(IntToStr(cdsPatro.FieldByName('IDPESSOA').AsInteger));
            end else begin
               sPatroMarca := sPatroMarca+','+trim(IntToStr(cdsPatro.FieldByName('IDPESSOA').AsInteger));
            end;
         end;
         cdsPatro.Next;
      end;

      cdsPlanoPrev.First;
      While not cdsPlanoPrev.EOF do begin
         if cdsPlanoPrev.FieldByName('MARCA').AsString = 'S' then begin
            if sPlanoPrevMarca = '' then begin
               sPlanoPrevMarca := trim(IntToStr(cdsPlanoPrev.FieldByName('IDPLANOPREV').AsInteger));
            end else begin
               sPlanoPrevMarca := sPlanoPrevMarca+','+trim(IntToStr(cdsPlanoPrev.FieldByName('IDPLANOPREV').AsInteger));
            end;
         end;
         cdsPlanoPrev.Next;
      end;
   end;

end;

procedure TfrmParamDiario.spdTodosPlanoClick(Sender: TObject);
begin
  inherited;
  cdsPlanoPrev.First;
  while not cdsPlanoPrev.Eof do
  begin
    with cdsPlanoPrev do
      begin
        DisableControls;
        edit;
        FieldByName('MARCA').AsString := 'S';
        post;
        Next;
      end;
    cdsPlanoPrev.EnableControls;
  end;

end;

procedure TfrmParamDiario.spdInverterPlanoClick(Sender: TObject);
begin
  inherited;
  cdsPlanoPrev.First;
  while not cdsPlanoPrev.eof do
  begin
    with cdsPlanoPrev do
    begin
      DisableControls;
      edit;

      if FieldByName('MARCA').AsString = 'S' then
         FieldByName('MARCA').AsString := 'N'
      else
         FieldByName('MARCA').AsString := 'S';

      Post;
      Next;
    end;
    cdsPlanoPrev.EnableControls;
  end;
end;

procedure TfrmParamDiario.spdTodosPatroClick(Sender: TObject);
begin
  inherited;
  cdsPatro.First;
  while not cdsPatro.Eof do
  begin
    with cdsPatro do
      begin
        DisableControls;
        edit;
        FieldByName('MARCA').AsString := 'S';
        post;
        Next;
      end;
    cdsPatro.EnableControls;
  end;  
end;

procedure TfrmParamDiario.spdInvertePatroClick(Sender: TObject);
begin
  cdsPatro.First;
  while not cdsPatro.eof do
  begin
    with cdsPatro do
    begin
      DisableControls;
      edit;

      if FieldByName('MARCA').AsString = 'S' then
         FieldByName('MARCA').AsString := 'N'
      else
         FieldByName('MARCA').AsString := 'S';

      Post;
      Next;
    end;
    cdsPatro.EnableControls;
  end;
end;

procedure TfrmParamDiario.sbPastaClick(Sender: TObject);
begin
  inherited;
  sdDialog.DefaultExt := '*.pdf';
  sdDialog.Filter := 'Arquivos PDF (*.pdf)|*.PDF|Todos os arquivos (*.*)|*.*';

  if ( sdDialog.Execute ) then
     edPasta.Text := sdDialog.FileName;

end;

end.
