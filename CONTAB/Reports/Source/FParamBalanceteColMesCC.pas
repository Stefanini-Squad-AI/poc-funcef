{-------------------------------------------------------------------------------
-------------------------------- ALTERAÇÕES ------------------------------------
--------------------------------------------------------------------------------

 SIG ..........: 102043
 Data .........: 22/12/2020
 Responsável ..: Everson Cunha
 Descrição ....: Máscara de conta por PLANO e período vigente
--------------------------------------------------------------------------------
 Rotina..........: TfrmParamBalanceteColMesCC.bbtnConfirmarClick
 N. Sol..........: 117695
 N. Kintana......: 558939
 Data............: 20/05/2009
 Responsável.....: Marilza Colpani
 Descrição.......: Inclusão do checkbox cbDesconsidera
--------------------------------------------------------------------------------
 Desenvolvedor : Marcus Oliveira
 Data          : 23/05/2007
 Pendência     : 25323
 Descrição     : Criado dois botões para Marcar todos e Inverter Marcação para
                 Plano e patro.
--------------------------------------------------------------------------------}


unit FParamBalanceteColMesCC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, uCtrlContab, Controls, Forms, Dialogs,
  fParamReports_Padrao, MontaSelect, Db, Wwdatsrc, wwclient, DBClient,
  uCMClientDataSet, uCmSqlParams, CMProcuraMask, Grids, Wwdbigrd, Wwdbgrid,
  StdCtrls, Spin, ComCtrls, wwdbdatetimepicker, CMDateTimePicker, Mask,
  wwdblook, CmParamReport, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, ExtCtrls, uCMTypes;

type
  TfrmParamBalanceteColMesCC = class(TfrmParamReports_Padrao)
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
    lblDataLimite: TLabel;
    mskCCustoIni: TMaskEdit;
    btnCCustoIni: TBitBtn;
    btnAtivProj: TBitBtn;
    mskAtivProj: TMaskEdit;
    mskCCustoFim: TMaskEdit;
    btnCCustoFim: TBitBtn;
    dteDataLim: TCMDateTimePicker;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    chkCentavos: TCheckBox;
    chkGrau: TCheckBox;
    spnGrau: TSpinEdit;
    cbDesconsideraEstatistica: TCheckBox;
    cbMovimento: TCheckBox;
    chkIndenta: TCheckBox;
    chkLingua: TCheckBox;
    cbImprimeConta: TCheckBox;
    TabSheet2: TTabSheet;
    Label8: TLabel;
    Label9: TLabel;
    edtTitulo: TEdit;
    edtSubTitulo: TEdit;
    tbsPlanoPatro: TTabSheet;
    dbgrPatro: TwwDBGrid;
    dbgrPlanoPrev: TwwDBGrid;
    cmpContaIni: TCMProcuraMaskContabil;
    cmpContaFim: TCMProcuraMaskContabil;
    sqlPeriodoIni: TCMSqlParams;
    sqlExercicio: TCMSqlParams;
    cdsPeriodoIni: TCMClientDataSet;
    cdsExercicio: TCMClientDataSet;
    cdsPeriodoFim: TCMClientDataSet;
    sqlCCusto: TCMSqlParams;
    cdsCCusto: TCMClientDataSet;
    cdsPlanoPrevG: TwwClientDataSet;
    dsPatroG: TwwDataSource;
    dsPlanoPrevG: TwwDataSource;
    cdsPatroG: TwwClientDataSet;
    sqlAtivProj: TCMSqlParams;
    cdsAtivProj: TCMClientDataSet;
    MontaSelectAtivProj: TMontaSelect;
    MontaSelectCCusto: TMontaSelect;
    cdsAux1: TCMClientDataSet;
    sqlAux1: TCMSqlParams;
    sqlPeriodoFim: TCMSqlParams;
    sqlPlanoPrevG: TCMSqlParams;
    sqlPatroG: TCMSqlParams;
    cbDesconsidera: TCheckBox;
    Panel2: TPanel;
    Splitter3: TSplitter;
    Bevel1: TBevel;
    Panel3: TPanel;
    spdInverterPlano: TSpeedButton;
    spdTodosPlano: TSpeedButton;
    Panel4: TPanel;
    spdTodosPatro: TSpeedButton;
    spdInvertePatro: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mskCCustoIniExit(Sender: TObject);
    procedure btnCCustoIniClick(Sender: TObject);
    procedure mskCCustoFimExit(Sender: TObject);
    procedure btnCCustoFimClick(Sender: TObject);
    procedure mskAtivProjExit(Sender: TObject);
    procedure btnAtivProjClick(Sender: TObject);
    procedure dblkExercicioClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmpContaIniExit(Sender: TObject);
    procedure cmpContaFimExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure chkGrauClick(Sender: TObject);
    procedure dblkPeriodoIniCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure spdTodosPlanoClick(Sender: TObject);
    procedure spdInverterPlanoClick(Sender: TObject);
    procedure spdTodosPatroClick(Sender: TObject);
    procedure spdInvertePatroClick(Sender: TObject);
  private
    { Private declarations }
    iPlano :Integer;
    CtrlContab  : TCtrlContab;
    sUnidNegoc,sMascaraPlano :string;
    sPatroMarca, sPlanoPrevMarca : String;
    procedure GuardaMarcadosNosGrids;
    procedure VerificaCamposDeTela;


  public
    { Public declarations }
  end;

var
  frmParamBalanceteColMesCC: TfrmParamBalanceteColMesCC;

implementation

uses UMensErro, uDatabase, DBaseDados,  uSistema, uString, 
     uModulo, uData, uFuncaoGeral, FSM_FxLib;

{$R *.DFM}

procedure TfrmParamBalanceteColMesCC.VerificaCamposDeTela;
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

procedure TfrmParamBalanceteColMesCC.GuardaMarcadosNosGrids;
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

procedure TfrmParamBalanceteColMesCC.FormCreate(Sender: TObject);
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

procedure TfrmParamBalanceteColMesCC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.free;
end;

procedure TfrmParamBalanceteColMesCC.mskCCustoIniExit(Sender: TObject);
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
            mskCCustoIni.text := cdsCCusto.FieldByName('CODCENTROCUSTO').asString;
         end else begin
            MsgDlg('O código do centro de custo informado não existe.','Aviso',mtWarning,[mbOk],0);
            mskCCustoIni.SetFocus;
         end;
      end;
   end;

end;

procedure TfrmParamBalanceteColMesCC.btnCCustoIniClick(Sender: TObject);
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
         ParamByName('CODCENTROCUSTO').asString   := sCCusto;
         Open;
         mskCCustoIni.text   := cdsCCusto.FieldByName('CODCENTROCUSTO').asString;
      end;
   end;

end;

procedure TfrmParamBalanceteColMesCC.mskCCustoFimExit(Sender: TObject);
var sCCusto : string;
begin
  inherited;
   if mskCCustoFim.text <> '' then begin
      sCCusto := mskCCustoFim.text;
      with sqlCCusto do begin
         Prepare;
         ParamByName('IDEMPRESA').asFloat := sistema.idEmpresa;
         ParamByName('CODCENTROCUSTO').asString   := sCCusto;
         Open;
         if not cdsCCusto.isEmpty then begin
            mskCCustoFim.text := cdsCCusto.FieldByName('CODCENTROCUSTO').asString;
         end else begin
            MsgDlg('O código do centro de custo informado não existe.','Aviso',mtWarning,[mbOk],0);
            mskCCustoFim.SetFocus;
         end;
      end;
   end;

end;

procedure TfrmParamBalanceteColMesCC.btnCCustoFimClick(Sender: TObject);
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
         ParamByName('CODCENTROCUSTO').asString   := sCCusto;
         Open;
         mskCCustoFim.text   := cdsCCusto.FieldByName('CODCENTROCUSTO').asString;
      end;
   end;

end;

procedure TfrmParamBalanceteColMesCC.mskAtivProjExit(Sender: TObject);
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

procedure TfrmParamBalanceteColMesCC.btnAtivProjClick(Sender: TObject);
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

procedure TfrmParamBalanceteColMesCC.dblkExercicioClick(Sender: TObject);
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

procedure TfrmParamBalanceteColMesCC.FormShow(Sender: TObject);
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

procedure TfrmParamBalanceteColMesCC.cmpContaIniExit(Sender: TObject);
begin
  inherited;
    If (cmpContaIni.Valida <> VcOK) Then
    Begin
      cmpContaIni.SetFocus;
      Exit;
    End;

end;

procedure TfrmParamBalanceteColMesCC.cmpContaFimExit(Sender: TObject);
begin
  inherited;
    If (cmpContaFim.Valida <> VcOK) Then
    Begin
      cmpContaFim.SetFocus;
      Exit;
    End;

end;

procedure TfrmParamBalanceteColMesCC.bbtnConfirmarClick(Sender: TObject);
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
  if dteDataLim.Text <> '' then
     Cmp_Padrao.ParamValues[8].AsString := dteDataLim.Text;

  Cmp_Padrao.ParamValues[9].AsBoolean  := chkCentavos.Checked;
  Cmp_Padrao.ParamValues[10].AsString  := spnGrau.Text;
  Cmp_Padrao.ParamValues[11].AsBoolean := chkLingua.Checked;
  Cmp_Padrao.ParamValues[12].AsBoolean := cbDesconsideraEstatistica.Checked;
  Cmp_Padrao.ParamValues[13].AsBoolean := cbMovimento.Checked;
  Cmp_Padrao.ParamValues[14].AsBoolean := chkIndenta.Checked;
  Cmp_Padrao.ParamValues[15].AsBoolean := cbImprimeConta.Checked;
  //Cmp_Padrao.ParamValues[16].AsBoolean := cbDesconsidera.Checked;
  //Marilza Colpani 26/05/2009 N.Sol: 117695 - N.Kintana: 558939
  Cmp_Padrao.ParamValues[16].AsString  := iif( cbDesconsidera.Checked, 'True', 'False' );
  Cmp_Padrao.ParamValues[17].AsString  := edtTitulo.text;
  Cmp_Padrao.ParamValues[18].AsString  := edtSubTitulo.text;
  Cmp_Padrao.ParamValues[19].AsString  := sPlanoPrevMarca;
  Cmp_Padrao.ParamValues[20].AsString  := sPatroMarca;

end;

procedure TfrmParamBalanceteColMesCC.chkGrauClick(Sender: TObject);
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

procedure TfrmParamBalanceteColMesCC.dblkPeriodoIniCloseUp(Sender: TObject;
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

procedure TfrmParamBalanceteColMesCC.spdTodosPlanoClick(Sender: TObject);
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

procedure TfrmParamBalanceteColMesCC.spdInverterPlanoClick(
  Sender: TObject);
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

procedure TfrmParamBalanceteColMesCC.spdTodosPatroClick(Sender: TObject);
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
procedure TfrmParamBalanceteColMesCC.spdInvertePatroClick(Sender: TObject);
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

end.
