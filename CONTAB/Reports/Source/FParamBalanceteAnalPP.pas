{-------------------------------------------------------------------------------
-------------------------------- ALTERAÇÕES ------------------------------------
--------------------------------------------------------------------------------
  Desenvolvedor: Luis Ferrari
  Data         : 25/05/2022
  Pendência    : 122748 - Ajustar para Contas Zeradas
  Solução      : foi ajustado e incluido para opção de contas zeradas
                 bbtnConfirmarClick, btnGeraTXTClick
------------------------------------------------------------------------------

 SIG ..........: 102043
 Data .........: 22/12/2020
 Responsável ..: Everson Cunha
 Descrição ....: Máscara de conta por PLANO e período vigente
--------------------------------------------------------------------------------
 Desenvolvedor : andre tavares
 Data          : 24/04/2006
 Pendência     : 19623
 Descrição     : Criar a opção de quebra por plano e plano/patro no balancete.
--------------------------------------------------------------------------------}

unit FParamBalanceteAnalPP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CMProcuraMask, wwdblook, StdCtrls, uCtrlRptBalanceteAnalPP,
  wwdbdatetimepicker, CMDateTimePicker, Mask, Grids, Wwdbigrd, Wwdbgrid,
  ExtCtrls, Spin, ComCtrls, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, MontaSelect, uCmSqlParams, Db,
  DBClient, uCMClientDataSet,uCtrlContab, Wwdatsrc, wwclient,
  FileCtrl, BfDialogs, BrowseFolder, uProcuraDir,
  uCMTypes;


type
  TfrmParamBalanceteAnalPP = class(TfrmParamReports_Padrao)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label10: TLabel;
    chkMascara: TCheckBox;
    chkLingua: TCheckBox;
    chkGrupo: TCheckBox;
    chkGrau: TCheckBox;
    spnGrau: TSpinEdit;
    chkCorresp: TCheckBox;
    chkIndenta: TCheckBox;
    chkEspaco: TCheckBox;
    rdgValores: TRadioGroup;
    spnPagIni: TSpinEdit;
    chkTotalizadores: TCheckBox;
    cbDesconsidera: TCheckBox;
    cbDesconsideraEstatistica: TCheckBox;
    TabSheet2: TTabSheet;
    Label8: TLabel;
    Label9: TLabel;
    edtTitulo: TEdit;
    edtSubTitulo: TEdit;
    Panel1: TPanel;
    lblDataLimite: TLabel;
    dteDataLim1: TCMDateTimePicker;
    grpDatas: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    dblkPeriodoIni: TwwDBLookupCombo;
    dblkPeriodoFim: TwwDBLookupCombo;
    cmpContaIni: TCMProcuraMaskContabil;
    cmpContaFim: TCMProcuraMaskContabil;
    btnGeraTXT: TBitBtn;
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
    dteDataLim2: TCMDateTimePicker;
    Label23: TLabel;
    sqlContafim: TCMSqlParams;
    cdsContaFim: TCMClientDataSet;
    dsContaFim: TwwDataSource;
    SqlCodExterno: TCMSqlParams;
    chkQuebraPprev: TCheckBox;
    chkquebraPorPatro: TCheckBox;
    chkQuebraPorPlanoSpc: TCheckBox;
    chkQuebraPlanoPatro: TCheckBox;
    chkContraNatureza: TCheckBox;
    rgContaszeradas: TRadioGroup;
    procedure dblkExercicioClick(Sender: TObject);
    procedure cmpContaIniExit(Sender: TObject);
    procedure cmpContaFimExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnGeraTXTClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure ProcuraDirSelectionChanged(Sender: TObject; Wnd: HWND;
      Path: String; var ShowText: String; var OKButtonEnabled: Boolean);
    procedure chkGrauClick(Sender: TObject);
    procedure dblkPeriodoIniCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure spdTodasClick(Sender: TObject);
    procedure spdInverterClick(Sender: TObject);
    procedure chkQuebraPprevClick(Sender: TObject);
    procedure chkquebraPorPatroClick(Sender: TObject);
    procedure chkQuebraPlanoPatroClick(Sender: TObject);
    procedure chkQuebraPorPlanoSpcClick(Sender: TObject);
    procedure rgContaszeradasClick(Sender: TObject);
  private
    { Private declarations }
   CtrlContab       : TCtrlContab;
   CtrlRptBalancete : TCtrlRptBalanceteAnalPP;
   FCCustoIncial    : string;
   FCCustoFinal     : string;
   
   procedure GuardaMarcadosNosGrids;
   function  VerificaCamposDeTela: boolean;

  public
    { Public declarations }
  end;

var
  frmParamBalanceteAnalPP: TfrmParamBalanceteAnalPP;
  sPatroMarca, sPlanoPrevMarca,sAtivProjMarca,sUnidNegoc,sMascaraPlano : String;
  iPlano : LongInt;
  sCaminho :string;


implementation

uses UMensErro, uDatabase, DBaseDados, uSistema, uString,
     uModulo, uData, uFuncaoGeral, FSM_FxLib;

{$R *.DFM}

procedure TfrmParamBalanceteAnalPP.GuardaMarcadosNosGrids;
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

procedure TfrmParamBalanceteAnalPP.dblkExercicioClick(Sender: TObject);
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

procedure TfrmParamBalanceteAnalPP.cmpContaIniExit(Sender: TObject);
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





procedure TfrmParamBalanceteAnalPP.cmpContaFimExit(Sender: TObject);
begin
  inherited;
  If (ActiveControl.Tag <> 999) And (cmpContaFim.Valida <> VcOK) Then
  Begin
    cmpContaFim.SetFocus;
    Exit;
  End;
end;




procedure TfrmParamBalanceteAnalPP.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlContab := TCtrlContab.Create;
   CtrlContab.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

   If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
      MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);

   CtrlRptBalancete := TCtrlRptBalanceteAnalPP.Create;
   CtrlRptBalancete.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                              Sistema.AppRemoteServer,True,nil,nil,False);


end;

procedure TfrmParamBalanceteAnalPP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.Free;
  CtrlRptBalancete.Free;
end;

procedure TfrmParamBalanceteAnalPP.FormShow(Sender: TObject);
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

procedure TfrmParamBalanceteAnalPP.btnGeraTXTClick(Sender: TObject);
var sNomeArquivo, sLinha, sContasZeradas: string;
    iTamanho: integer;
    ArquivoTexto : TextFile;
    iNumero,Ind: integer;

begin
   inherited;
   ProcuraDir.Execute;
   if sCaminho = '' then
   begin
      MsgDlg('O Caminho onde o Balancete será Gravado é Obrigatório.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      Exit;
   end;


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

   //Cria Um Novo Arquivo ou Sobrescreve um já existente
   Ind := 0;
   sNomeArquivo := 'BAL' + FormatDateTime('yyyymmdd',date);

   Repeat
     Ind := Ind + 1;
   Until Not FileExists(sCaminho + '\'+ sNomeArquivo + '_' + IntToStr(Ind) + '.TXT');

   sNomeArquivo := 'BAL' + FormatDateTime('yyyymmdd',date) + '_'+ IntToStr(Ind) + '.TXT';

   if MsgDlg('Será Gerado um Arquivo Chamado ' + sNomeArquivo +  ' no Diretório '+ sCaminho + '. Deseja Prosseguir?','Aviso',mtConfirmation,[mbYes, mbNo],0) = mrYes then
   Begin
     screen.cursor := crHourglass;

     AssignFile(ArquivoTexto, sCaminho + '\' +sNomeArquivo);
     ReWrite(Arquivotexto);

     GuardaMarcadosNosGrids;

     iNumero := FuncaoGeral.CalcNumEleGrau(CtrlContab.MascaraContaParam, 1);

    //==============
    // Inicio SIG 122748 Ferrari
    case rgContaszeradas.ItemIndex of
      0: sContasZeradas := 'S';
      1: sContasZeradas := 'SM';
      2: sContasZeradas := 'A';
      3: sContasZeradas := 'N';
    end;
    // fim

    cdsBalancete.Data := CtrlRptBalancete.FazQuery(dteDataLim1.Text,dteDataLim2.Text,dblkExercicio.text,
                         cdsPeriodoIni.FieldByName('PERNUMERO').asString,
                         cdsPeriodoFim.FieldByName('PERNUMERO').asString,
                         cmpContaIni.conta.Numero, cmpContaFim.conta.Numero,
                         Cmp_Padrao.ParamValues[22].AsBoolean,
                         Cmp_Padrao.ParamValues[29].AsBoolean, IntToStr(iNumero),
                         '', IntToStr(iPlano),IntToStr(sistema.idEmpresa),
                         CtrlContab.TipoOpEncer,sPlanoPrevMarca,sPatroMarca,
                         sAtivProjMarca,IntToStr(spnGrau.value),chkLingua.checked,
                         chkCorresp.checked,chkIndenta.Checked, Cmp_Padrao.ParamValues[17].AsBoolean,
                         cbDesconsidera.Checked,cbDesconsideraEstatistica.Checked,
                         chkQuebraPlanoPatro.Checked, chkContraNatureza.Checked,sContasZeradas);



    //==============
     If cdsBalancete.IsEmpty Then
     Begin
       MsgDlg('Nenhum Dado Obitdo para Gerar o Arquivo.','Aviso',mtInformation,[mbOk],0);
       CloseFile(ArquivoTexto);
       screen.cursor := crDefault;
       modalResult := mrNone;
       Exit;
     End;

     //Gera o Cabeçalho do arquivo texto
     sLinha := 'Exercicio: ' + dblkExercicio.text + '    Periodo Inicial: ' + dblkPeriodoIni.text + '    Periodo Final: ' + dblkPeriodoFim.text;
     WriteLn(ArquivoTexto, sLinha);
     WriteLn(ArquivoTexto, ' ');

     cdsBalancete.First;
     While not cdsBalancete.Eof do
     Begin
        sLinha := '';

        //Concatena o Código da Conta
        iTamanho := length(cdsBalancete.FieldByName('PLACONTA').asString);
        sLinha := sLinha + cdsBalancete.FieldByName('PLACONTA').asString + FuncaoGeral.spc(18-iTamanho);

        //Concatena o Nome da Conta
        iTamanho := length(cdsBalancete.FieldByName('PLANOME').asString);
        sLinha := sLinha + cdsBalancete.FieldByName('PLANOME').asString + FuncaoGeral.spc(40-iTamanho);

        //Concatena o Saldo Anterior
        sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', ABS(cdsBalancete.FieldByName('SALDOANT').AsFloat)), 20);

        //Concatena se o saldo está a Débito ou a Crédito
        if cdsBalancete.FieldByName('SALDOANT').AsFloat >= 0 then begin
           sLinha := sLinha + 'D';
        end else begin
           sLinha := sLinha + 'C';
        end;

        //Concatena os valores de Débito e crédito
        sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', cdsBalancete.FieldByName('DEB').AsFloat), 20);
        sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', cdsBalancete.FieldByName('CRED').AsFloat), 20);

        //Concatena a movimentação
        sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', ABS(cdsBalancete.FieldByName('MOV').AsFloat)), 20);

        //Concatena se a movimentação está a Débito ou a Crédito
        if cdsBalancete.FieldByName('MOV').AsFloat >= 0 then begin
           sLinha := sLinha + 'D';
        end else begin
           sLinha := sLinha + 'C';
        end;

        //Concatena o Saldo Atual
        sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', ABS(cdsBalancete.FieldByName('SALDO').AsFloat)), 20);

        //Concatena se o saldo está a Débito ou a Crédito
        if cdsBalancete.FieldByName('SALDO').AsFloat >= 0 then begin
           sLinha := sLinha + 'D';
        end else begin
           sLinha := sLinha + 'C';
        end;
        WriteLn(ArquivoTexto, sLinha);
        cdsBalancete.Next;
     End;

     CloseFile(ArquivoTexto);
     screen.cursor := crDefault;
     MsgDlg('Arquivo gerado com sucesso.','Aviso',mtInformation,[mbOk],0);
     modalResult := mrNone;

   End;

end;




function TfrmParamBalanceteAnalPP.VerificaCamposDeTela: boolean;
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




procedure TfrmParamBalanceteAnalPP.bbtnConfirmarClick(Sender: TObject);
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

  chkQuebraPprev.Checked := (not chkQuebraPorPlanoSpc.checked) and (not chkQuebraPlanoPatro.checked) and (not chkquebraPorPatro.checked);

  // Inicio SIG 122748 Ferrari
  case rgContaszeradas.ItemIndex of
    0: sContasZeradas := 'S';
    1: sContasZeradas := 'SM';
    2: sContasZeradas := 'A';
    3: sContasZeradas := 'N';
  end;
  // fim
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
  Cmp_Padrao.ParamValues[17].AsBoolean := chkQuebraPprev.Checked;//quebra por plano previdenciário contábil
  Cmp_Padrao.ParamValues[18].AsBoolean := chkTotalizadores.Checked;
  Cmp_Padrao.ParamValues[19].AsBoolean := cbDesconsidera.Checked;
  Cmp_Padrao.ParamValues[20].AsBoolean := cbDesconsideraEstatistica.Checked;
  Cmp_Padrao.ParamValues[21].AsInteger := rdgValores.ItemIndex;
  Cmp_Padrao.ParamValues[22].AsBoolean := chkquebraPorPatro.checked;//quebra por patrocinadora
  Cmp_Padrao.ParamValues[23].AsInteger := StrToInt(spnPagIni.text);
  Cmp_Padrao.ParamValues[24].AsString  := edtTitulo.text;
  Cmp_Padrao.ParamValues[25].AsString  := edtSubTitulo.text;
  Cmp_Padrao.ParamValues[26].AsString  := sPlanoPrevMarca;
  Cmp_Padrao.ParamValues[27].AsString  := sPatroMarca;
  Cmp_Padrao.ParamValues[28].AsString  := sAtivProjMarca;
  Cmp_Padrao.ParamValues[30].AsBoolean := chkQuebraPlanoPatro.checked;
  Cmp_Padrao.ParamValues[29].AsBoolean := chkQuebraPorPlanoSpc.checked;
  Cmp_Padrao.ParamValues[31].AsBoolean := chkContraNatureza.checked;
  // Inicio SIg 122748 Ferrari
  Cmp_Padrao.ParamValues[32].AsString := sContasZeradas;
  // Fim

end;




procedure TfrmParamBalanceteAnalPP.ProcuraDirSelectionChanged(Sender: TObject;
  Wnd: HWND; Path: String; var ShowText: String;
  var OKButtonEnabled: Boolean);
begin
  inherited;
  sCaminho := Path;
end;



procedure TfrmParamBalanceteAnalPP.chkGrauClick(Sender: TObject);
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




procedure TfrmParamBalanceteAnalPP.dblkPeriodoIniCloseUp(Sender: TObject;
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

procedure TfrmParamBalanceteAnalPP.spdTodasClick(Sender: TObject);
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

procedure TfrmParamBalanceteAnalPP.spdInverterClick(Sender: TObject);
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




procedure TfrmParamBalanceteAnalPP.chkQuebraPprevClick(Sender: TObject);
begin
  inherited;
  if chkQuebraPprev.Checked then
  begin
     chkquebraPorPatro.checked     := false;
    chkQuebraPlanoPatro.checked    := false;
    chkQuebraPorPlanoSpc.checked   := false
  end;
end;

procedure TfrmParamBalanceteAnalPP.chkquebraPorPatroClick(Sender: TObject);
begin
  inherited;
  if chkquebraPorPatro.Checked then
  begin
    chkQuebraPprev.checked       := false;
    chkQuebraPlanoPatro.checked    := false;
    chkQuebraPorPlanoSpc.checked   := false
  end;
end;

procedure TfrmParamBalanceteAnalPP.chkQuebraPlanoPatroClick(Sender: TObject);
begin
  inherited;
  if chkQuebraPlanoPatro.Checked then
  begin
    chkQuebraPprev.checked       := false;
    chkquebraPorPatro.checked    := false;
    chkQuebraPorPlanoSpc.checked := false
  end;

end;

procedure TfrmParamBalanceteAnalPP.chkQuebraPorPlanoSpcClick(Sender: TObject);
begin
  inherited;
  if chkQuebraPorPlanoSpc.Checked then
  begin
    chkQuebraPprev.checked       := false;
    chkquebraPorPatro.checked    := false;
    chkQuebraPlanoPatro.checked  := false
  end;

end;

procedure TfrmParamBalanceteAnalPP.rgContaszeradasClick(Sender: TObject);
begin
  inherited;
  if rgContaszeradas.ItemIndex = 1 then
  begin
     chkGrau.Checked    := False;
     chkGrau.Enabled    := False;
//     chkSoMovim.Checked := False;
//     chkSoMovim.Enabled := False;
  end
  else
  begin
     chkGrau.Enabled    := True;
//     chkSoMovim.Enabled := True;
  end;

end;

end.
