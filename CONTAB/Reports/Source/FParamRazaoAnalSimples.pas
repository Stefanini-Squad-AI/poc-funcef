{-------------------------------------------------------------------------------
-------------------------------- ALTERAÇÕES ------------------------------------
--------------------------------------------------------------------------------

 SIG ..........: 102043
 Data .........: 22/12/2020
 Responsável ..: Everson Cunha
 Descrição ....: Máscara de conta por PLANO e período vigente
--------------------------------------------------------------------------------

 maRCUS oliveira P. 15362 25/1/2007
 Mudar o cod do CodCentroCusto para CodExterno
--------------------------------------------------------------------------------}

unit FParamRazaoAnalSimples;

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
  TfrmParamRazaoAnalSimpl = class(TfrmParamReports_Padrao)
    grpDatas: TGroupBox;
    lblDataIni: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dteDataFim: TCMDateTimePicker;
    dblkExercicio: TwwDBLookupCombo;
    dteDataIni: TCMDateTimePicker;
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
    mskSubContaIni: TMaskEdit;
    btnSubContaIni: TBitBtn;
    dblkModulo: TwwDBLookupCombo;
    dblkTipoOper: TwwDBLookupCombo;
    dblkHist: TwwDBLookupCombo;
    mskCCustoFim: TMaskEdit;
    btnCCustoFim: TBitBtn;
    chkTipoOper: TCheckBox;
    btnSubContaFim: TBitBtn;
    mskSubContaFim: TMaskEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label14: TLabel;
    rdgLancamentos: TRadioGroup;
    GroupBox1: TGroupBox;
    chkCorresp: TCheckBox;
    chkSubConta: TCheckBox;
    chkQuebra: TCheckBox;
    chkMascara: TCheckBox;
    chkContraPartida: TCheckBox;
    cbQuebraDia: TCheckBox;
    cbImpressora: TCheckBox;
    cbQuebraPeriodo: TCheckBox;
    cbDesconsideraEstatistica: TCheckBox;
    cbSemMov: TCheckBox;
    chkAtivProjSint: TCheckBox;
    spnPagIni: TSpinEdit;
    rdgSubConta: TRadioGroup;
    TabSheet2: TTabSheet;
    Label11: TLabel;
    Label12: TLabel;
    edtTitulo: TEdit;
    edtSubTitulo: TEdit;
    tbsPlanoPatro: TTabSheet;
    dbgrPlanoPrev: TwwDBGrid;
    dbgrPatro: TwwDBGrid;
    tbsAtivProj: TTabSheet;
    dbgrAtivProj: TwwDBGrid;
    sqlHistorico: TCMSqlParams;
    cdsHistorico: TCMClientDataSet;
    sqlModulo: TCMSqlParams;
    cdsModulo: TCMClientDataSet;
    sqlTipoOper: TCMSqlParams;
    cdsTipoOper: TCMClientDataSet;
    sqlExercicio: TCMSqlParams;
    cdsExercicio: TCMClientDataSet;
    MontaSelectSubConta: TMontaSelect;
    MontaSelectCCusto: TMontaSelect;
    MontaSelectAtivProj: TMontaSelect;
    cmpContaIni: TCMProcuraMaskContabil;
    cmpContaFim: TCMProcuraMaskContabil;
    dsPatro: TwwDataSource;
    dsPlanoPrev: TwwDataSource;
    dsAtivProjG: TwwDataSource;
    cdsAtivProj: TCMClientDataSet;
    sqlPatro: TCMSqlParams;
    sqlPlanoPrev: TCMSqlParams;
    sqlAtivProjG: TCMSqlParams;
    sqlSubConta: TCMSqlParams;
    cdsSubConta: TCMClientDataSet;
    sqlAtivProj: TCMSqlParams;
    cdsCCusto: TCMClientDataSet;
    sqlCCusto: TCMSqlParams;
    cdsAtivProjG: TwwClientDataSet;
    cdsPatro: TwwClientDataSet;
    cdsPlanoPrev: TwwClientDataSet;
    sqlData: TCMSqlParams;
    cdsData: TCMClientDataSet;
    procedure btnAtivProjClick(Sender: TObject);
    procedure btnCCustoIniClick(Sender: TObject);
    procedure btnCCustoFimClick(Sender: TObject);
    procedure btnSubContaIniClick(Sender: TObject);
    procedure btnSubContaFimClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cmpContaIniExit(Sender: TObject);
    procedure cmpContaFimExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure mskAtivProjExit(Sender: TObject);
    procedure mskCCustoIniExit(Sender: TObject);
    procedure mskCCustoFimExit(Sender: TObject);
    procedure mskSubContaIniExit(Sender: TObject);
    procedure mskSubContaFimExit(Sender: TObject);
    procedure dteDataIniExit(Sender: TObject);
  private
    { Private declarations }
   CtrlContab  : TCtrlContab;
   CtrlPeriodo : TCtrlPeriodo;
   function  VerificaDatas (dDataIni, dDataFim : TDateTime):boolean;

  public
    { Public declarations }
  end;

var
  frmParamRazaoAnalSimpl: TfrmParamRazaoAnalSimpl;
  iPlano : LongInt;
  sMascaraPlano,sUnidNegoc : String;

implementation

uses uDatabase, DBaseDados,UMensErro,uModulo,uDiasUteis;

{$R *.DFM}

function TfrmParamRazaoAnalSimpl.VerificaDatas(dDataIni, dDataFim:TDateTime):boolean;
begin

   //Faz a verificação se a data final é maior que a data inicial
   result := true;

   if dDataFim < dDataIni then begin
      MsgDlg('A Data Final deve ser maior ou igual que a Data Inicial.','Erro',mtError,[mbOk],0);
      result := false;
   end;

end;

procedure TfrmParamRazaoAnalSimpl.btnAtivProjClick(Sender: TObject);
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

procedure TfrmParamRazaoAnalSimpl.btnCCustoIniClick(Sender: TObject);
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
         mskCCustoIni.text   := cdsCCusto.FieldByName('CodExterno').asString;
      end;
   end;
   modalResult := mrNone;

end;

procedure TfrmParamRazaoAnalSimpl.btnCCustoFimClick(Sender: TObject);
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

procedure TfrmParamRazaoAnalSimpl.btnSubContaIniClick(Sender: TObject);
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
         if rdgSubConta.itemindex = 0 then begin
            mskSubContaIni.text    := cdsSubConta.FieldByName('CODSUBCONTA').asString;
         end else begin
            mskSubContaIni.text    := cdsSubConta.FieldByName('NOMESUBCONTA').asString;
         end;
      end;
   end;
   modalResult := mrNone;

end;

procedure TfrmParamRazaoAnalSimpl.btnSubContaFimClick(Sender: TObject);
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
         if rdgSubConta.itemindex = 0 then begin
            mskSubContaFim.text    := cdsSubConta.FieldByName('CODSUBCONTA').asString;
         end else begin
            mskSubContaFim.text    := cdsSubConta.FieldByName('NOMESUBCONTA').asString;
         end;
      end;
   end;
   modalResult := mrNone;

end;

procedure TfrmParamRazaoAnalSimpl.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlContab := TCtrlContab.Create;
   CtrlContab.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

   CtrlPeriodo := TCtrlPeriodo.Create;
   CtrlPeriodo.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

   If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
      MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);

   //Atribui a máscara da conta contábil e o filtro de plano ao MontaSelect
   MontaSelectCCusto.Filtro.Add('CENTCUST.IDEMPRESA = ' + IntToStr(sistema.idEmpresa));
   MontaSelectSubConta.Filtro.Add('SUBCONTA.IDPESSOA = ' + IntToStr(sistema.idEmpresa));
   MontaSelectAtivProj.Filtro.Add('UNIDNEGOCIO.IDPESSOA = ' + IntToStr(sistema.idEmpresa));
   iPlano        := CtrlContab.PlanoParam;
   sMascaraPlano := CtrlContab.MascaraContaParam;
end;

procedure TfrmParamRazaoAnalSimpl.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.Free;
  CtrlPeriodo.Free;

end;

procedure TfrmParamRazaoAnalSimpl.FormShow(Sender: TObject);
var
  Mes,Ano,Dia :word;
begin
  inherited;
  tbsPlanoPatro.Enabled := Sistema.UsaPlanoPatro;
  PageControl1.ActivePageIndex := 0;

   sqlPlanoPrev.Open;
   TwwClientDataSet(CdsPlanoPrev).ControlType.Add('MARCA;CheckBox;S;N');

   sqlPatro.Open;
   TwwClientDataSet(CdsPatro).ControlType.Add('MARCA;CheckBox;S;N');

   //Preenche as combo-boxes
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

   sqlData.Open;

   DecodeDate(cdsData.FieldByName('DATAATUAL').AsDateTime,Ano,Mes,Dia);

   dteDataFim.Text := DateToStr(EncodeDate(Ano,Mes,1) -1);

   DecodeDate(StrToDate(dteDataFim.Text),Ano,Mes,Dia);

   dteDataIni.Text := DateToStr(EncodeDate(Ano,Mes,1));

   dblkExercicio.LookupValue := FloatToStr(Ano);
   cmpContaIni.Setfocus;
end;

procedure TfrmParamRazaoAnalSimpl.cmpContaIniExit(Sender: TObject);
begin
  inherited;
    If (cmpContaIni.Valida <> VcOK) Then
    Begin
      cmpContaIni.SetFocus;
      Exit;
    End;

end;

procedure TfrmParamRazaoAnalSimpl.cmpContaFimExit(Sender: TObject);
begin
  inherited;
    If (cmpContaFim.Valida <> VcOK) Then
    Begin
      cmpContaFim.SetFocus;
      Exit;
    End;

end;

procedure TfrmParamRazaoAnalSimpl.bbtnConfirmarClick(Sender: TObject);
var sAtivProjMarca,sPatroMarca, sPlanoPrevMarca : string;

begin
  inherited;
   if dblkExercicio.text = '' then begin
      MsgDlg('O Exercício deve ser preenchido.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      Exit;
   end;

   If Not CtrlPeriodo.RetornaPeriodoExercicioData(Sistema.idEmpresa,dteDataIni.Text)  Then
   begin
      modalResult := mrNone;
      Exit;
   end;

   if CtrlPeriodo.Exercicio <> StrToInt(dblkExercicio.text) then begin
      MsgDlg('A Data Inicial não pertence a este Exercício.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      Exit;
   end;

   //Filtra os dados da tela para passar para o relatório
   If not ((dteDataIni.Text = '') or (dteDataFim.Text = '')) Then
   Begin

      //Verifica se a data final é maior ou igual à inicial
      If VerificaDatas(dteDataIni.date, dteDataFim.date) Then
      Begin

         //Avisa ao usuário da quebra por subcontas
         If chkSubConta.checked Then
         Begin
           If MsgDlg('Não serão exibidos os valores dos Lançamentos sem Sub-Conta, ' + CHR(13) +
                     'pois a opção de quebra por Sub-Conta foi selecionada.' + CHR(13) + CHR(13) +
                     'Deseja prosseguir?',
                     'Aviso',mtConfirmation,[mbYes, mbNo],0) = mrNo then begin
              modalResult := mrNone;
              Exit;
           End;
         End;

         //*** preenche a variavel com as atividades de projeto selecionadas
         sAtivProjMarca := '';
         cdsAtivProjG.First;
         While not cdsAtivProjG.EOF do
         Begin
            If cdsAtivProjG.FieldByName('MARCA').AsString = 'S' Then
            Begin
               If sAtivProjMarca = '' Then
               Begin
                  sAtivProjMarca := trim(IntToStr(cdsAtivProjG.FieldByName('UNIDNEGOC').AsInteger));
               End Else
               Begin
                  sAtivProjMarca := sAtivProjMarca+','+trim(IntToStr(cdsAtivProjG.FieldByName('UNIDNEGOC').AsInteger));
               End;
            End;
            cdsAtivProjG.Next;
         End;


         //*** preenche a variavel com os planos e patrocinadoras selecionadas
         sPlanoPrevMarca  := '';
         sPatroMarca      := '';
         If Sistema.UsaPlanoPatro Then
         Begin
            cdsPatro.First;
            While not cdsPatro.EOF do begin
               If cdsPatro.FieldByName('MARCA').AsString = 'S' Then
               Begin
                  If sPatroMarca = '' Then
                  Begin
                     sPatroMarca := trim(IntToStr(cdsPatro.FieldByName('IDPESSOA').AsInteger));
                  End Else
                  Begin
                     sPatroMarca := sPatroMarca+','+trim(IntToStr(cdsPatro.FieldByName('IDPESSOA').AsInteger));
                  End;
               End;
               cdsPatro.Next;
            End;

            cdsPlanoPrev.First;
            While not cdsPlanoPrev.EOF do
            Begin
               If cdsPlanoPrev.FieldByName('MARCA').AsString = 'S' Then
               Begin
                  If sPlanoPrevMarca = '' Then
                  Begin
                     sPlanoPrevMarca := trim(IntToStr(cdsPlanoPrev.FieldByName('IDPLANOPREV').AsInteger));
                  End Else
                  Begin
                     sPlanoPrevMarca := sPlanoPrevMarca+','+trim(IntToStr(cdsPlanoPrev.FieldByName('IDPLANOPREV').AsInteger));
                  End;
               End;
               cdsPlanoPrev.Next;
            End;
         End;
     End;
   End;

   if mskAtivProj.Text = '' then sUnidNegoc := '';
   
  //*** passa os paramentos para o componente padrao ***
  Cmp_Padrao.ParamValues[0].AsInteger  := StrToInt(dblkExercicio.LookupValue);
  Cmp_Padrao.ParamValues[1].AsString   := dteDataIni.Text;
  Cmp_Padrao.ParamValues[2].AsString   := dteDataFim.Text;
  Cmp_Padrao.ParamValues[3].AsString   := cmpContaIni.Conta.Numero;
  Cmp_Padrao.ParamValues[4].AsString   := cmpContaFim.Conta.Numero;
  Cmp_Padrao.ParamValues[5].AsString   := sUnidNegoc;
  Cmp_Padrao.ParamValues[6].AsString   := Trim(mskCCustoIni.text);
  Cmp_Padrao.ParamValues[7].AsString   := Trim(mskCCustoFim.text);
  Cmp_Padrao.ParamValues[8].AsString   := dblkModulo.LookupValue;
  Cmp_Padrao.ParamValues[9].AsString   := Trim(mskSubContaIni.text);
  Cmp_Padrao.ParamValues[10].AsString  := Trim(mskSubContaFim.text);
  Cmp_Padrao.ParamValues[11].AsString  := dblkHist.LookupValue;
  Cmp_Padrao.ParamValues[12].AsString  := dblkTipoOper.LookupValue;
  Cmp_Padrao.ParamValues[13].AsBoolean := chkTipoOper.Checked;
  Cmp_Padrao.ParamValues[14].AsInteger := rdgLancamentos.ItemIndex;
  Cmp_Padrao.ParamValues[15].AsInteger := rdgSubConta.ItemIndex;
  Cmp_Padrao.ParamValues[16].AsInteger := StrToInt(spnPagIni.text);
  Cmp_Padrao.ParamValues[17].AsBoolean := chkMascara.Checked;
  Cmp_Padrao.ParamValues[18].AsBoolean := chkContraPartida.Checked;
  Cmp_Padrao.ParamValues[19].AsBoolean := chkSubConta.Checked;
  Cmp_Padrao.ParamValues[20].AsBoolean := chkCorresp.Checked;
  Cmp_Padrao.ParamValues[21].AsBoolean := chkQuebra.Checked;
  Cmp_Padrao.ParamValues[22].AsBoolean := cbQuebraDia.Checked;
  Cmp_Padrao.ParamValues[23].AsBoolean := cbQuebraPeriodo.Checked;
  Cmp_Padrao.ParamValues[24].AsBoolean := cbDesconsideraEstatistica.Checked;
  Cmp_Padrao.ParamValues[25].AsBoolean := chkAtivProjSint.Checked;
  Cmp_Padrao.ParamValues[26].AsBoolean := cbSemMov.Checked;
  Cmp_Padrao.ParamValues[27].AsString  := edtTitulo.text;
  Cmp_Padrao.ParamValues[28].AsString  := edtSubTitulo.text;
  Cmp_Padrao.ParamValues[29].AsString  := sPlanoPrevMarca;
  Cmp_Padrao.ParamValues[30].AsString  := sPatroMarca;
  Cmp_Padrao.ParamValues[31].AsString  := sAtivProjMarca;

end;

procedure TfrmParamRazaoAnalSimpl.mskAtivProjExit(Sender: TObject);
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

procedure TfrmParamRazaoAnalSimpl.mskCCustoIniExit(Sender: TObject);
var sCCusto : string;
begin
  inherited;
  if mskCCustoIni.text <> '' then begin
      sCCusto := mskCCustoIni.text;
      with sqlCCusto do begin
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

procedure TfrmParamRazaoAnalSimpl.mskCCustoFimExit(Sender: TObject);
var sCCusto : string;
begin
  inherited;
   if mskCCustoFim.text <> '' then begin
      sCCusto := mskCCustoFim.text;
      with sqlCCusto do begin
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

procedure TfrmParamRazaoAnalSimpl.mskSubContaIniExit(Sender: TObject);
var sSubConta : string;
begin
  inherited;
   if rdgSubConta.itemindex = 0 then begin
      if mskSubContaIni.text <> '' then begin
         sSubConta := mskSubContaIni.text;
         with sqlSubConta do begin
            Prepare;
            ParamByName('IDPESSOA').asInteger   := Sistema.idEmpresa;
            ParamByName('CODSUBCONTA').asString := sSubConta;
            Open;
            if not cdsSubConta.isEmpty then begin
               mskSubContaIni.text  := cdsSubConta.FieldByName('CODSUBCONTA').asString;
            end else begin
               MsgDlg('O código da sub-conta inicial informada não existe.','Aviso',mtWarning,[mbOk],0);
               mskSubContaIni.SetFocus;
            end;
        end;
      end;
   end;
  modalResult := mrNone;
end;

procedure TfrmParamRazaoAnalSimpl.mskSubContaFimExit(Sender: TObject);
var sSubConta : string;
begin
  inherited;
   if rdgSubConta.itemindex = 0 then begin
      if mskSubContaFim.text <> '' then begin
         sSubConta := mskSubContaFim.text;
         with sqlSubConta do begin
            Prepare;
            ParamByName('IDPESSOA').asInteger   := Sistema.idEmpresa;
            ParamByName('CODSUBCONTA').asString := sSubConta;
            Open;
            if not cdsSubConta.isEmpty then begin
               mskSubContaFim.text  := cdsSubConta.FieldByName('CODSUBCONTA').asString;
            end else begin
               MsgDlg('O código da sub-conta final informada não existe.','Aviso',mtWarning,[mbOk],0);
               mskSubContaFim.SetFocus;
            end;
         end;
      end;
   end;
  modalResult := mrNone;
end;

procedure TfrmParamRazaoAnalSimpl.dteDataIniExit(Sender: TObject);
var iPlanoAnt : LongInt;
begin
  inherited;
   sMascaraPlano := CtrlContab.MascaraContaParam;
   iPlanoAnt     := CtrlContab.PlanoParam;

   If CtrlContab.SelecionaPlanoData(Sistema.IdEmpresa, dteDataIni.Text) Then
      iPlano := CtrlContab.PlanoData;

   if (iPlano <> iPlanoAnt) and (iPlano <> 0) then begin
      cmpContaIni.Plano     := iPlano;
      //cmpContaIni.Mascara   := CtrlContab.MascaraContaParam; //Everson Cunha - SIG102043
      cmpContaIni.Mascara   := CtrlContab.MascaraContaData;    //Everson Cunha - SIG102043
      cmpContaFim.Plano     := iPlano;
      //cmpContaFim.Mascara   := CtrlContab.MascaraContaParam; //Everson Cunha - SIG102043
      cmpContaFim.Mascara   := CtrlContab.MascaraContaData;    //Everson Cunha - SIG102043
   end else begin
      cmpContaIni.Plano     := CtrlContab.PlanoParam;
      cmpContaIni.Mascara   := CtrlContab.MascaraContaParam;
      cmpContaFim.Plano     := CtrlContab.PlanoParam;
      cmpContaFim.Mascara   := CtrlContab.MascaraContaParam;

      iPlano := CtrlContab.PlanoParam;
   end;

end;

end.
