{-------------------------------------------------------------------------------
-------------------------------- ALTERAÇÕES ------------------------------------
--------------------------------------------------------------------------------

 SIG ..........: 102043
 Data .........: 22/12/2020
 Responsável ..: Everson Cunha
 Descrição ....: Máscara de conta por PLANO e período vigente
--------------------------------------------------------------------------------
 Desenvolvedor : Marcus Oliveira
 Data          : 23/05/2007
 Pendência     : 25323
 Descrição     : Criado dois botões para Marcar todos e Inverter Marcação para
                 Plano e patro.
--------------------------------------------------------------------------------}


unit FParamBalanceteCol;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, uCtrlContab, Controls, Forms, Dialogs,
  fParamReports_Padrao, MontaSelect, Db, Wwdatsrc, wwclient, DBClient,
  uCMClientDataSet, uCmSqlParams, CMProcuraMask, Grids, Wwdbigrd, Wwdbgrid,
  StdCtrls, Spin, ComCtrls, wwdbdatetimepicker, CMDateTimePicker, Mask,
  wwdblook, CmParamReport, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  JCLSysUtils, TB97Tlbr, TB97, ExtCtrls, uCMTypes ;

type
  TfrmParamBalanceteCol = class(TfrmParamReports_Padrao)
    grpDatas: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    dblkPeriodoIni: TwwDBLookupCombo;
    dblkPeriodoFim: TwwDBLookupCombo;
    Panel1: TPanel;
    Label5: TLabel;
    Label7: TLabel;
    Label2: TLabel;
    mskCCustoIni: TMaskEdit;
    btnCCustoIni: TBitBtn;
    btnAtivProj: TBitBtn;
    mskAtivProj: TMaskEdit;
    mskCCustoFim: TMaskEdit;
    btnCCustoFim: TBitBtn;
    cmpContaIni: TCMProcuraMaskContabil;
    cmpContaFim: TCMProcuraMaskContabil;
    MontaSelectAtivProj: TMontaSelect;
    MontaSelectCCusto: TMontaSelect;
    cdsCCusto: TCMClientDataSet;
    sqlCCusto: TCMSqlParams;
    cdsAtivProj: TCMClientDataSet;
    sqlAtivProj: TCMSqlParams;
    cdsPeriodoFim: TCMClientDataSet;
    cdsExercicio: TCMClientDataSet;
    cdsPeriodoIni: TCMClientDataSet;
    sqlExercicio: TCMSqlParams;
    sqlPeriodoFim: TCMSqlParams;
    sqlPeriodoIni: TCMSqlParams;
    cdsAux1: TCMClientDataSet;
    sqlAux1: TCMSqlParams;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    chkCentavos: TCheckBox;
    chkGrau: TCheckBox;
    spnGrau: TSpinEdit;
    cbDesconsideraEstatistica: TCheckBox;
    cbMovimento: TCheckBox;
    cbDesconsidera: TCheckBox;
    chkIndenta: TCheckBox;
    chkLingua: TCheckBox;
    cbImprimeConta: TCheckBox;
    TabSheet2: TTabSheet;
    Label8: TLabel;
    Label9: TLabel;
    edtTitulo: TEdit;
    edtSubTitulo: TEdit;
    tbsPlanoPatro: TTabSheet;
    dbgrPlanoPrev: TwwDBGrid;
    dbgrPatro: TwwDBGrid;
    cdsPatroG: TwwClientDataSet;
    sqlPatroG: TCMSqlParams;
    dsPatroG: TwwDataSource;
    dsPlanoPrevG: TwwDataSource;
    sqlPlanoPrevG: TCMSqlParams;
    cdsPlanoPrevG: TwwClientDataSet;
    chkPagTot: TCheckBox;
    Panel2: TPanel;
    Splitter3: TSplitter;
    Bevel1: TBevel;
    Panel3: TPanel;
    spdInverterPlano: TSpeedButton;
    spdTodosPlano: TSpeedButton;
    Panel4: TPanel;
    spdInvertePatro: TSpeedButton;
    spdTodosPatro: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkExercicioExit(Sender: TObject);
    procedure dblkPeriodoIniCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure cmpContaIniExit(Sender: TObject);
    procedure cmpContaFimExit(Sender: TObject);
    procedure mskCCustoIniExit(Sender: TObject);
    procedure mskCCustoFimExit(Sender: TObject);
    procedure mskAtivProjExit(Sender: TObject);
    procedure btnCCustoIniClick(Sender: TObject);
    procedure btnCCustoFimClick(Sender: TObject);
    procedure btnAtivProjClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chkGrauClick(Sender: TObject);
    procedure spdTodosPlanoClick(Sender: TObject);
    procedure spdInverterPlanoClick(Sender: TObject);
    procedure spdTodosPatroClick(Sender: TObject);
    procedure spdInvertePatroClick(Sender: TObject);
    procedure cbDesconsideraClick(Sender: TObject);

  private
    iPlano :Integer;
    CtrlContab  : TCtrlContab;
    sPatroMarca, sPlanoPrevMarca : String;
    sUnidNegoc,sMascaraPlano :string;
   procedure GuardaMarcadosNosGrids;
   procedure VerificaCamposDeTela;

  public
    { Public declarations }
  end;

var
  frmParamBalanceteCol: TfrmParamBalanceteCol;

implementation

uses UMensErro, uDatabase, DBaseDados,  uSistema, uString,
     uModulo, uData, uFuncaoGeral, FSM_FxLib;

{$R *.DFM}

procedure TfrmParamBalanceteCol.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlContab := TCtrlContab.Create;
   CtrlContab.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

   If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
      MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);

   MontaSelectCCusto.Filtro.Add('CENTCUST.IDEMPRESA = ' + IntToStr(sistema.idEmpresa));
   MontaSelectAtivProj.Filtro.Add('UNIDNEGOCIO.IDPESSOA = ' + IntToStr(sistema.idEmpresa));

end;

procedure TfrmParamBalanceteCol.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.free;

end;

procedure TfrmParamBalanceteCol.dblkExercicioExit(Sender: TObject);
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

procedure TfrmParamBalanceteCol.dblkPeriodoIniCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
var
 iPlanoAnt :integer;

begin
  inherited;
  if dblkExercicio.text = '' then
  begin
    MsgDlg('O Exercício deve ser preenchido.','Erro',mtError,[mbOk],0);
    dblkPeriodoIni.Text := '';
    dblkExercicio.SetFocus;
    Exit;
  end else
  begin
    if dblkPeriodoIni.LookupValue <> '' then
    begin
     sqlAux1.SQL.Clear;
     sqlAux1.SQL.Add('SELECT PERDATINI FROM PERIODO ');
     sqlAux1.SQL.Add('WHERE (PEREXERCICIO = '+dblkExercicio.LookupValue+')');
     sqlAux1.SQL.Add('  AND (PERNUMERO    = '+dblkPeriodoIni.LookupValue+')');
     sqlAux1.SQL.Add('  AND (IDPESSOA     = '+IntToStr(Sistema.idEmpresa)+')');
     sqlAux1.Open;
     //
     sMascaraPlano := Modulo.sMascaraContas;
     iPlanoAnt     := Modulo.iPlano;

     If CtrlContab.SelecionaPlanoData(Sistema.IdEmpresa, DateToStr(cdsAux1.FieldByName('PERDATINI').AsDateTime)) Then
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
  end;

end;

procedure TfrmParamBalanceteCol.cmpContaIniExit(Sender: TObject);
begin
  inherited;
    If (cmpContaIni.Valida <> VcOK) Then
    Begin
      cmpContaIni.SetFocus;
      Exit;
    End;

end;

procedure TfrmParamBalanceteCol.cmpContaFimExit(Sender: TObject);
begin
  inherited;
    If (cmpContaFim.Valida <> VcOK) Then
    Begin
      cmpContaFim.SetFocus;
      Exit;
    End;

end;

procedure TfrmParamBalanceteCol.mskCCustoIniExit(Sender: TObject);
var sCCusto : string;
begin
  inherited;
   if mskCCustoIni.text <> '' then begin
      sCCusto := mskCCustoIni.text;
      with sqlCCusto do begin
         Prepare;
         ParamByName('IDEMPRESA').asFloat := sistema.idEmpresa;
         ParamByName('CodExterno').asString   := sCCusto;
         Open;
         if not cdsCCusto.isEmpty then begin
            mskCCustoIni.text := cdsCCusto.FieldByName('CodExterno').asString;
         end else begin
            MsgDlg('O código do centro de custo informado não existe.','Aviso',mtWarning,[mbOk],0);
            mskCCustoIni.SetFocus;
         end;
      end;
   end;

end;

procedure TfrmParamBalanceteCol.mskCCustoFimExit(Sender: TObject);
var sCCusto : string;
begin
  inherited;
   if mskCCustoFim.text <> '' then begin
      sCCusto := mskCCustoFim.text;
      with sqlCCusto do begin
         Prepare;
         ParamByName('IDEMPRESA').asFloat := sistema.idEmpresa;
         ParamByName('CodExterno').asString   := sCCusto;
         Open;
         if not cdsCCusto.isEmpty then begin
            mskCCustoFim.text := cdsCCusto.FieldByName('CodExterno').asString;
         end else begin
            MsgDlg('O código do centro de custo informado não existe.','Aviso',mtWarning,[mbOk],0);
            mskCCustoFim.SetFocus;
         end;
      end;
   end;

end;

procedure TfrmParamBalanceteCol.mskAtivProjExit(Sender: TObject);
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

end;

procedure TfrmParamBalanceteCol.btnCCustoIniClick(Sender: TObject);
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
         ParamByName('CodExterno').asString   := sCCusto;
         Open;
         mskCCustoIni.text   := cdsCCusto.FieldByName('CodExterno').asString;
      end;
   end;

end;

procedure TfrmParamBalanceteCol.btnCCustoFimClick(Sender: TObject);
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
         ParamByName('CodExterno').asString   := sCCusto;
         Open;
         mskCCustoFim.text   := cdsCCusto.FieldByName('CodExterno').asString;
      end;
   end;

end;

procedure TfrmParamBalanceteCol.btnAtivProjClick(Sender: TObject);
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

end;

procedure TfrmParamBalanceteCol.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  VerificaCamposDeTela;
  GuardaMarcadosNosGrids;

  if mskAtivProj.Text = '' then  sUnidNegoc := '';

  //*** passa os paramentos para o componente padrao ***
  Cmp_Padrao.ParamValues[0].AsFloat    := StrToFloat(dblkExercicio.LookupValue);
  Cmp_Padrao.ParamValues[1].AsInteger  := StrToInt(dblkPeriodoIni.LookupValue);
  Cmp_Padrao.ParamValues[2].AsInteger  := StrToInt(dblkPeriodoFim.LookupValue);
  Cmp_Padrao.ParamValues[3].AsString   := cmpContaIni.Conta.Numero;
  Cmp_Padrao.ParamValues[4].AsString   := cmpContaFim.Conta.Numero;
  Cmp_Padrao.ParamValues[5].AsString   := Trim(mskCCustoIni.text);
  Cmp_Padrao.ParamValues[6].AsString   := Trim(mskCCustoFim.text);
  Cmp_Padrao.ParamValues[7].AsString   := sUnidNegoc;
  Cmp_Padrao.ParamValues[8].AsBoolean  := chkLingua.Checked;
  Cmp_Padrao.ParamValues[9].AsInteger  := StrToInt(spnGrau.Text);
  Cmp_Padrao.ParamValues[10].AsBoolean := cbMovimento.Checked;
  Cmp_Padrao.ParamValues[11].AsBoolean := chkIndenta.Checked;
  Cmp_Padrao.ParamValues[12].AsString  := iif( cbDesconsideraEstatistica.Checked, 'True', 'False');
  Cmp_Padrao.ParamValues[13].AsString  := sPlanoPrevMarca;
  Cmp_Padrao.ParamValues[14].AsString  := sPatroMarca;
  Cmp_Padrao.ParamValues[15].AsBoolean := chkCentavos.Checked;
  Cmp_Padrao.ParamValues[16].AsBoolean := cbImprimeConta.Checked;
  Cmp_Padrao.ParamValues[17].AsBoolean := chkPagTot.Checked;
  Cmp_Padrao.ParamValues[18].AsString  := edtTitulo.text;
  Cmp_Padrao.ParamValues[19].AsString  := edtSubTitulo.text;
  Cmp_Padrao.ParamValues[20].AsString  := iif( cbDesconsidera.Checked, 'True', 'False' );
end;

procedure TfrmParamBalanceteCol.VerificaCamposDeTela;
begin
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

end;

procedure TfrmParamBalanceteCol.FormShow(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePageIndex := 0;
  tbsPlanoPatro.Enabled := Sistema.UsaPlanoPatro;

   sqlPlanoPrevG.Open;
   TwwClientDataSet(cdsPlanoPrevG).ControlType.Add('MARCA;CheckBox;S;N');

   sqlPatroG.Open;
   TwwClientDataSet(cdsPatroG).ControlType.Add('MARCA;CheckBox;S;N');


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

   //Coloca as máscaras
   cmpContaIni.Plano     := CtrlContab.PlanoParam;
   cmpContaIni.Mascara   := CtrlContab.MascaraContaParam;
   cmpContaFim.Plano     := CtrlContab.PlanoParam;
   cmpContaFim.Mascara   := CtrlContab.MascaraContaParam;

   mskCCustoIni.editMask := modulo.sMascaraCCusto + ';0; ';
   mskCCustoFim.editMask := modulo.sMascaraCCusto + ';0; ';
   mskAtivProj.editMask  := modulo.sMascaraUnidNegoc + ';0; ';

   spnGrau.MaxValue := FuncaoGeral.CalcGrauMax(CtrlContab.MascaraContaParam);
   spnGrau.Value    := FuncaoGeral.CalcGrauMax(CtrlContab.MascaraContaParam);
   spnGrau.MinValue := 1;

end;

procedure TfrmParamBalanceteCol.chkGrauClick(Sender: TObject);
begin
  inherited;
   if chkGrau.checked then begin
      spnGrau.enabled := true;
      spnGrau.Color   := clWindow;
   end else begin
      spnGrau.enabled := false;
      spnGrau.Color   := clBtnFace;
   end;

end;

procedure TfrmParamBalanceteCol.GuardaMarcadosNosGrids;
begin
   sPlanoPrevMarca  := '';
   sPatroMarca      := '';
   if Sistema.UsaPlanoPatro then
   begin
      cdsPatroG.First;
      While not cdsPatroG.EOF do begin
         if cdsPatroG.FieldByName('MARCA').AsString = 'S' then begin
            if sPatroMarca = '' then begin
               sPatroMarca := trim(IntToStr(cdsPatroG.FieldByName('IDPESSOA').AsInteger));
            end else begin
               sPatroMarca := sPatroMarca+','+trim(IntToStr(cdsPatroG.FieldByName('IDPESSOA').AsInteger));
            end;
         end;
         cdsPatroG.Next;
      end;

      cdsPlanoPrevG.First;
      While not cdsPlanoPrevG.EOF do begin
         if cdsPlanoPrevG.FieldByName('MARCA').AsString = 'S' then begin
            if sPlanoPrevMarca = '' then begin
               sPlanoPrevMarca := trim(IntToStr(cdsPlanoPrevG.FieldByName('IDPLANOPREV').AsInteger));
            end else begin
               sPlanoPrevMarca := sPlanoPrevMarca+','+trim(IntToStr(cdsPlanoPrevG.FieldByName('IDPLANOPREV').AsInteger));
            end;
         end;
         cdsPlanoPrevG.Next;
      end;
   end;
end;

procedure TfrmParamBalanceteCol.spdTodosPlanoClick(Sender: TObject);
begin
  inherited;
  cdsPlanoPrevG.First;
  while not cdsPlanoPrevG.Eof do
  begin
    with cdsPlanoPrevG do
      begin
        DisableControls;
        edit;
        FieldByName('MARCA').AsString := 'S';
        post;
        Next;
      end;
    cdsPlanoPrevG.EnableControls;
  end;
end;

procedure TfrmParamBalanceteCol.spdInverterPlanoClick(Sender: TObject);
begin
  inherited;
  cdsPlanoPrevG.First;
  while not cdsPlanoPrevG.eof do
  begin
    with cdsPlanoPrevG do
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
    cdsPlanoPrevG.EnableControls;
  end;
end;

procedure TfrmParamBalanceteCol.spdTodosPatroClick(Sender: TObject);
begin
  inherited;
  cdsPatroG.First;
  while not cdsPatroG.Eof do
  begin
    with cdsPatroG do
      begin
        DisableControls;
        edit;
        FieldByName('MARCA').AsString := 'S';
        post;
        Next;
      end;
    cdsPatroG.EnableControls;
end;
end;

procedure TfrmParamBalanceteCol.spdInvertePatroClick(Sender: TObject);
begin
  inherited;
  cdsPatroG.First;
  while not cdsPatroG.eof do
  begin
    with cdsPatroG do
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
    cdsPatroG.EnableControls;
  end;
end;

procedure TfrmParamBalanceteCol.cbDesconsideraClick(Sender: TObject);
begin
  inherited;
  If cbDesconsidera.Checked then
   MsgDlg('Quando esse parametro é selecionado, deve-se fazer uma atualização'+#13+
          'de encerramento das contas para que o resultado seja o esperado.'+#13+
          'Essa opção deve ser executada somente uma vez ao ano.','Atenção',mtWarning,[mbOk],0);
end;

end.
