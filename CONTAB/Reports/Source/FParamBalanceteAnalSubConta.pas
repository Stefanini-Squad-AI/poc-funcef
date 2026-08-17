{-------------------------------------------------------------------------------
-------------------------------- ALTERAÇÕES ------------------------------------
--------------------------------------------------------------------------------

 SIG ..........: 102043
 Data .........: 22/12/2020
 Responsável ..: Everson Cunha
 Descrição ....: Máscara de conta por PLANO e período vigente
--------------------------------------------------------------------------------}

unit FParamBalanceteAnalSubConta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CMProcuraMask, wwdblook, StdCtrls,
  wwdbdatetimepicker, CMDateTimePicker, Mask, Grids, Wwdbigrd, Wwdbgrid,
  ExtCtrls, Spin, ComCtrls, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, MontaSelect, uCmSqlParams, Db,
  DBClient, uCMClientDataSet,uCtrlContab, Wwdatsrc, wwclient,
  FileCtrl, BfDialogs, BrowseFolder, uProcuraDir, 
  uCMTypes, DBCtrls;


type
  TfrmParamBalanceteAnalSubConta = class(TfrmParamReports_Padrao)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    chkMascara: TCheckBox;
    chkLingua: TCheckBox;
    chkGrupo: TCheckBox;
    chkGrau: TCheckBox;
    spnGrau: TSpinEdit;
    chkCorresp: TCheckBox;
    chkIndenta: TCheckBox;
    chkEspaco: TCheckBox;
    rdgValores: TRadioGroup;
    chkTotalizadores: TCheckBox;
    cbDesconsidera: TCheckBox;
    cbDesconsideraEstatistica: TCheckBox;
    TabSheet2: TTabSheet;
    Label8: TLabel;
    Label9: TLabel;
    edtTitulo: TEdit;
    edtSubTitulo: TEdit;
    grpDatas: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    dblkPeriodoIni: TwwDBLookupCombo;
    dblkPeriodoFim: TwwDBLookupCombo;
    ToolbarSep972: TToolbarSep97;
    cdsCCusto: TCMClientDataSet;
    sqlCCusto: TCMSqlParams;
    cdsAtivProj: TCMClientDataSet;
    sqlAtivProj: TCMSqlParams;
    cdsExercicio: TCMClientDataSet;
    sqlExercicio: TCMSqlParams;
    sqlPeriodoFim: TCMSqlParams;
    sqlPeriodoIni: TCMSqlParams;
    cdsPeriodoFim: TCMClientDataSet;
    cdsPeriodoIni: TCMClientDataSet;
    MontaSelectAtivProj: TMontaSelect;
    dsPatroG: TwwDataSource;
    dsPlanoPrevG: TwwDataSource;
    dsAtivProjG: TwwDataSource;
    sqlAtivProjG: TCMSqlParams;
    cdsAtivProjG: TwwClientDataSet;
    cdsBalancete: TCMClientDataSet;
    cdsPatroG: TwwClientDataSet;
    cdsPlanoPrevG: TwwClientDataSet;
    sqlPlanoPrevG: TCMSqlParams;
    sqlPatroG: TCMSqlParams;
    sqlAux1: TCMSqlParams;
    cdsAux1: TCMClientDataSet;
    ProcuraDir: TProcuraDirDlg;
    sqlContafim: TCMSqlParams;
    cdsContaFim: TCMClientDataSet;
    dsContaFim: TwwDataSource;
    SqlCodExterno: TCMSqlParams;
    chkContraNatureza: TCheckBox;
    chkExpandido: TCheckBox;
    Panel1: TPanel;
    lblDataLimite: TLabel;
    Label23: TLabel;
    dteDataLim1: TCMDateTimePicker;
    cmpContaIni: TCMProcuraMaskContabil;
    cmpContaFim: TCMProcuraMaskContabil;
    dteDataLim2: TCMDateTimePicker;
    rdQuebras: TRadioGroup;
    chkQuebraSubConta: TCheckBox;
    spnPagIni: TSpinEdit;
    Label10: TLabel;
    chkExpandidoAnalitica: TCheckBox;
    chkSomenteContasSPC: TCheckBox;
    procedure dblkExercicioClick(Sender: TObject);
    procedure cmpContaIniExit(Sender: TObject);
    procedure cmpContaFimExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure ProcuraDirSelectionChanged(Sender: TObject; Wnd: HWND;
      Path: String; var ShowText: String; var OKButtonEnabled: Boolean);
    procedure chkGrauClick(Sender: TObject);
    procedure dblkPeriodoIniCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure spdTodasClick(Sender: TObject);
    procedure spdInverterClick(Sender: TObject);
  private
    { Private declarations }
   CtrlContab       : TCtrlContab;
   FCCustoIncial    : string;
   FCCustoFinal     : string;
   
   procedure GuardaMarcadosNosGrids;
   function  VerificaCamposDeTela: boolean;

  public
    { Public declarations }
  end;

var
  frmParamBalanceteAnalSubConta: TfrmParamBalanceteAnalSubConta;
  sPatroMarca, sPlanoPrevMarca,sAtivProjMarca,sUnidNegoc,sMascaraPlano : String;
  iPlano : LongInt;
  sCaminho :string;


implementation

uses UMensErro, uDatabase, DBaseDados, uSistema, uString,
     uModulo, uData, uFuncaoGeral, FSM_FxLib;

{$R *.DFM}

procedure TfrmParamBalanceteAnalSubConta.GuardaMarcadosNosGrids;
begin
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

procedure TfrmParamBalanceteAnalSubConta.dblkExercicioClick(Sender: TObject);
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

procedure TfrmParamBalanceteAnalSubConta.cmpContaIniExit(Sender: TObject);
begin
  inherited;
  If (ActiveControl.Tag <> 999) And (cmpContaIni.Valida <> VcOK) Then
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





procedure TfrmParamBalanceteAnalSubConta.cmpContaFimExit(Sender: TObject);
begin
  inherited;
  If (ActiveControl.Tag <> 999) And (cmpContaFim.Valida <> VcOK) Then
  Begin
    cmpContaFim.SetFocus;
    Exit;
  End;
end;




procedure TfrmParamBalanceteAnalSubConta.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlContab := TCtrlContab.Create;
   CtrlContab.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

   If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
      MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);


end;

procedure TfrmParamBalanceteAnalSubConta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CtrlContab.Free;
  inherited;
end;

procedure TfrmParamBalanceteAnalSubConta.FormShow(Sender: TObject);
begin
  inherited;
   PageControl1.ActivePageIndex := 0;

   sqlPlanoPrevG.Open;
   TwwClientDataSet(cdsPlanoPrevG).ControlType.Add('MARCA;CheckBox;S;N');

   sqlPatroG.Open;
   TwwClientDataSet(cdsPatroG).ControlType.Add('MARCA;CheckBox;S;N');

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

   //Coloca as máscaras
   cmpContaIni.Plano     := CtrlContab.PlanoParam;
   cmpContaIni.Mascara   := CtrlContab.MascaraContaParam;
   cmpContaFim.Plano     := CtrlContab.PlanoParam;
   cmpContaFim.Mascara   := CtrlContab.MascaraContaParam;

   spnGrau.MaxValue := FuncaoGeral.CalcGrauMax(CtrlContab.MascaraContaParam);
   spnGrau.Value    := FuncaoGeral.CalcGrauMax(CtrlContab.MascaraContaParam);
   spnGrau.MinValue := 1;


end;

function TfrmParamBalanceteAnalSubConta.VerificaCamposDeTela: boolean;
begin
   Result := False;
   if dblkExercicio.text = '' then begin
      MsgDlg('O Exercício deve ser preenchido.','Erro',mtError,[mbOk],0);
      Exit;
   end;

   if dblkPeriodoIni.text = '' then begin
      MsgDlg('O Período Inicial deve ser preenchido.','Erro',mtError,[mbOk],0);
      Exit;
   end;

   if dblkPeriodoFim.text = '' then begin
      MsgDlg('O Período Final deve ser preenchido.','Erro',mtError,[mbOk],0);
      Exit;
   end;

   Result := True;
end;




procedure TfrmParamBalanceteAnalSubConta.bbtnConfirmarClick(Sender: TObject);
var sContasZeradas: string;
begin
  inherited;
  if not VerificaCamposDeTela then
  begin
     ModalResult := mrNone;
     Exit;
  end;
  GuardaMarcadosNosGrids;

  //*** passa os paramentos para o componente padrao ***

  Cmp_Padrao.ParamValues[0].AsInteger  := StrToInt(dblkExercicio.LookupValue);
  Cmp_Padrao.ParamValues[1].AsInteger  := StrToInt(dblkPeriodoIni.LookupValue);
  Cmp_Padrao.ParamValues[2].AsInteger  := StrToInt(dblkPeriodoFim.LookupValue);
  Cmp_Padrao.ParamValues[3].AsString   := cmpContaIni.Conta.Numero;
  Cmp_Padrao.ParamValues[4].AsString   := cmpContaFim.Conta.Numero;

  Cmp_Padrao.ParamValues[5].AsString   := '';
  Cmp_Padrao.ParamValues[6].AsString   := '';

  Cmp_Padrao.ParamValues[7].AsString   := sUnidNegoc;

  Cmp_Padrao.ParamValues[8].AsString   := dteDataLim1.Text;
  Cmp_Padrao.ParamValues[9].AsString   := dteDataLim2.Text;

  Cmp_Padrao.ParamValues[10].AsBoolean  := chkMascara.Checked;
  Cmp_Padrao.ParamValues[11].AsBoolean := chkGrupo.Checked;
  Cmp_Padrao.ParamValues[12].AsBoolean := chkLingua.Checked;
  Cmp_Padrao.ParamValues[13].AsInteger := StrToInt(spnGrau.Text);
  Cmp_Padrao.ParamValues[14].AsBoolean := chkCorresp.Checked;
  Cmp_Padrao.ParamValues[15].AsBoolean := chkEspaco.Checked;
  Cmp_Padrao.ParamValues[16].AsBoolean := chkIndenta.Checked;
  Cmp_Padrao.ParamValues[18].AsBoolean := chkTotalizadores.Checked;
  Cmp_Padrao.ParamValues[19].AsBoolean := cbDesconsidera.Checked;
  Cmp_Padrao.ParamValues[20].AsBoolean := cbDesconsideraEstatistica.Checked;
  Cmp_Padrao.ParamValues[21].AsInteger := rdgValores.ItemIndex;
  Cmp_Padrao.ParamValues[23].AsInteger := StrToInt(spnPagIni.text);
  Cmp_Padrao.ParamValues[24].AsString  := edtTitulo.text;
  Cmp_Padrao.ParamValues[25].AsString  := edtSubTitulo.text;
  Cmp_Padrao.ParamValues[26].AsString  := sPlanoPrevMarca;
  Cmp_Padrao.ParamValues[27].AsString  := sPatroMarca;
  Cmp_Padrao.ParamValues[28].AsString  := sAtivProjMarca;
  Cmp_Padrao.ParamValues[31].AsBoolean := chkContraNatureza.checked;
  Cmp_Padrao.ParamValues[32].AsBoolean := chkExpandido.checked;
  Cmp_Padrao.ParamValues[33].AsBoolean := chkQuebraSubConta.checked;

  Cmp_Padrao.ParamValues[30].AsBoolean := rdQuebras.ItemIndex = 0; //quebra por plano e patro
  Cmp_Padrao.ParamValues[17].AsBoolean := rdQuebras.ItemIndex = 1; //quebra por plano previdenciário
  Cmp_Padrao.ParamValues[22].AsBoolean := rdQuebras.ItemIndex = 2; //quebra por patrocinadora
  Cmp_Padrao.ParamValues[29].AsBoolean := rdQuebras.ItemIndex = 3; //quebra por plano SPC

  Cmp_Padrao.ParamValues[34].AsBoolean := chkExpandidoAnalitica.checked; //Expandir somente as contas analiticas
  Cmp_Padrao.ParamValues[35].AsBoolean := chkSomenteContasSPC.Checked; //pendência 27313 - 28/01/2008 - para incluir no balancete somente as contas padrão da SPC
end;




procedure TfrmParamBalanceteAnalSubConta.ProcuraDirSelectionChanged(Sender: TObject;
  Wnd: HWND; Path: String; var ShowText: String;
  var OKButtonEnabled: Boolean);
begin
  inherited;
  sCaminho := Path;
end;



procedure TfrmParamBalanceteAnalSubConta.chkGrauClick(Sender: TObject);
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




procedure TfrmParamBalanceteAnalSubConta.dblkPeriodoIniCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
var iPlanoAnt : LongInt;
begin
  inherited;
  if dblkExercicio.Text = '' then
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
      sqlAux1.SQL.Add('  AND (PERNUMERO = '+dblkPeriodoIni.LookupValue+')');
      sqlAux1.SQL.Add('  AND (IDPESSOA = '+IntToStr(Sistema.idEmpresa)+')');
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

procedure TfrmParamBalanceteAnalSubConta.spdTodasClick(Sender: TObject);
begin
  inherited;
   cdsAtivProjG.DisableControls;
   with cdsAtivProjG do begin
      First;
      while not eof do begin
         Edit;
         FieldByName('MARCA').asString := 'S';
         Post;
         Next;
      end;
      First;
   end;
   cdsAtivProjG.EnableControls;

end;

procedure TfrmParamBalanceteAnalSubConta.spdInverterClick(Sender: TObject);
begin
  inherited;
   cdsAtivProjG.DisableControls;
   with cdsAtivProjG do begin
      First;
      while not eof do begin
         Edit;
         FieldByName('MARCA').asString := 'N';
         Post;
         Next;
      end;
      First;
   end;
   cdsAtivProjG.EnableControls;
end;




end.
