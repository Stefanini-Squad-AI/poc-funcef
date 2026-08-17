{-------------------------------------------------------------------------------
-------------------------------- ALTERAÇÕES ------------------------------------
--------------------------------------------------------------------------------

 SIG ..........: 102043
 Data .........: 22/12/2020
 Responsável ..: Everson Cunha
 Descrição ....: Máscara de conta por PLANO e período vigente
--------------------------------------------------------------------------------
 Rotina......: sqlCCusto
 Nº SIG......: 66859
 Data........: 17/04/2018
 Responsável.: Marcelo Valério Ferreira
 Descrição...: Ajuste na query de seleção das assinaturas dos associados ao
               centro de custo (.dfm)
--------------------------------------------------------------------------------
 Rotina......: sqlCCusto
 Nº SIG......: 31699
 Data........: 26/10/2016
 Responsável.: Peterson Victor
 Descrição...: Alteração para ajustar os campos das assinaturas (.dfm)
--------------------------------------------------------------------------------
 Rotina......: SqlAssinatura
 Nº SOL......: 142197
 Nº KINTANA..: 906825
 Data........: 23/08/2010
 Responsável.: Renan Cristiano
 Descrição...: Implementação nos relatórios "Demonstrativos CGPC28", inclusão
               do simbolo "(a)" na assinatura dos cargos de Diretor e
               Coordenador.
--------------------------------------------------------------------------------
 Rotina......: bbtnConfirmarClick, GuardaMarcadosNosGrids
 Nº SOL......: 140372
 Nº KINTANA..: 877866
 Data........: 29/07/2010
 Responsável.: Fábio Henrique Beccaria Sampaio
 Descrição...: Implemetação da flag "Sem Quebra"
--------------------------------------------------------------------------------
 Autor.....: Marcos Luiz de Jesus
 SOL.......: 139128
 Kintana...: 852404
 Data      : 08/07/2010
 Descrição : Colocado como Default
             Mostrar CPF e CRC no relatorio quando houver informação.
             Inserido a aba Plano e Patrocinadora
--------------------------------------------------------------------------------}

unit FParamBalanceteCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CMProcuraMask, wwdblook, StdCtrls, uCtrlRptBalanceteAnalPP,
  wwdbdatetimepicker, CMDateTimePicker, Mask, Grids, Wwdbigrd, Wwdbgrid,
  ExtCtrls, Spin, ComCtrls, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, MontaSelect, uCmSqlParams, Db,
  DBClient, uCMClientDataSet,uCtrlContab, Wwdatsrc, wwclient,
  FileCtrl, BfDialogs, BrowseFolder, uProcuraDir,
  uCMTypes, DBGrids;


type
  TfrmParamBalanceteCad = class(TfrmParamReports_Padrao)
    pgInfo: TPageControl;
    tsConfiguracao: TTabSheet;
    Label10: TLabel;
    chkMascara: TCheckBox;
    chkGrupo: TCheckBox;
    spnPagIni: TSpinEdit;
    cbDesconsidera: TCheckBox;
    cbDesconsideraEstatistica: TCheckBox;
    tsAssinaturas: TTabSheet;
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
    cdsExercicio: TCMClientDataSet;
    sqlExercicio: TCMSqlParams;
    sqlPeriodoFim: TCMSqlParams;
    sqlPeriodoIni: TCMSqlParams;
    cdsPeriodoFim: TCMClientDataSet;
    cdsPeriodoIni: TCMClientDataSet;
    cdsBalancete: TCMClientDataSet;
    sqlAux1: TCMSqlParams;
    cdsAux1: TCMClientDataSet;
    ProcuraDir: TProcuraDirDlg;
    dteDataLim2: TCMDateTimePicker;
    Label23: TLabel;
    lblAnexo: TLabel;
    edtAnexo: TEdit;
    rdgValores: TRadioGroup;
    rdbImprimeContasZeradas: TRadioGroup;
    pnlAssinaturas: TPanel;
    dbgAssinatura: TDBGrid;
    dsCCusto: TDataSource;
    cdsCCustoORDEM: TFloatField;
    cdsCCustoDEPARTAMENTO: TStringField;
    cdsCCustoRESPONSAVEL: TStringField;
    cdsCCustoTIPODOCUMENTO: TStringField;
    cdsCCustoDOCUMENTO: TStringField;
    rgQuebra: TRadioGroup;
    cdsPatroG: TwwClientDataSet;
    dsPatroG: TwwDataSource;
    dsPlanoPrevG: TwwDataSource;
    cdsPlanoPrevG: TwwClientDataSet;
    tbsPlanoPatro: TTabSheet;
    dbgrPlanoPrev: TwwDBGrid;
    dbgrPatro: TwwDBGrid;
    sqlPlanoPrevG: TCMSqlParams;
    sqlPatroG: TCMSqlParams;
    cdsPlanoPrevGIDPLANOPREV: TFloatField;
    cdsPlanoPrevGNOME: TStringField;
    cdsPlanoPrevGMARCA: TStringField;
    cdsPatroGIDPESSOA: TFloatField;
    cdsPatroGNOME: TStringField;
    cdsPatroGMARCA: TStringField;
    Panel2: TPanel;
    Panel3: TPanel;
    btMarcaTodosPlano: TSpeedButton;
    btInverteSelecaoPlano: TSpeedButton;
    Panel4: TPanel;
    btMarcaTodosPatro: TSpeedButton;
    btInverteSelecaoPatro: TSpeedButton;
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
    procedure dblkPeriodoIniCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkPeriodoFimExit(Sender: TObject);
    procedure pgInfoChange(Sender: TObject);
    procedure btMarcaTodosPlanoClick(Sender: TObject);
    procedure btInverteSelecaoPlanoClick(Sender: TObject);
    procedure btMarcaTodosPatroClick(Sender: TObject);
    procedure btInverteSelecaoPatroClick(Sender: TObject);
  private
    { Private declarations }
    CtrlContab  : TCtrlContab;
    CtrlRptBalanceteAnalPP : TCtrlRptBalanceteAnalPP;

    FTiutloRelatorio: String;

    function VerificaCamposDeTela : Boolean;
    procedure CarregarDadosCentroDeCustos;
    function RetornaTipoContaZerada(const pIdContaZerada: Integer): String;
    procedure GuardaMarcadosNosGrids;

  public
    { Public declarations }
  end;

var
  frmParamBalanceteCad: TfrmParamBalanceteCad;
  sPatroMarca,
  sPlanoPrevMarca,
  sAtivProjMarca,
  sUnidNegoc,
  sMascaraPlano : String;
  iPlano : LongInt;
  sCaminho :string;


implementation

uses UMensErro, uDatabase, DBaseDados, uSistema, uString,
     uModulo, uData, uFuncaoGeral, FSM_FxLib;

{$R *.DFM}

procedure TfrmParamBalanceteCad.dblkExercicioClick(Sender: TObject);
begin
  inherited;
   //Preenche a combo-box de período
   if dblkExercicio.text <> '' then begin
      with sqlPeriodoIni do
      begin
         Prepare;
         ParamByName('IDPESSOA').asInteger     := Sistema.idEmpresa;
         ParamByName('PEREXERCICIO').asInteger := StrToInt(dblkExercicio.text);
         Open;
      end;
      with sqlPeriodoFim do
      begin
         Prepare;
         ParamByName('IDPESSOA').asInteger     := Sistema.idEmpresa;
         ParamByName('PEREXERCICIO').asInteger := StrToInt(dblkExercicio.text);
         Open;
      end;
   end;

end;

procedure TfrmParamBalanceteCad.cmpContaIniExit(Sender: TObject);
begin
  inherited;
  If (ActiveControl.Tag <> 999) And (cmpContaFim.Valida <> VcOK) Then
  Begin
    cmpContaFim.SetFocus;
    Exit;
  End;

end;

procedure TfrmParamBalanceteCad.cmpContaFimExit(Sender: TObject);
begin
  inherited;
  If (ActiveControl.Tag <> 999) And (cmpContaFim.Valida <> VcOK) Then
  Begin
    cmpContaFim.SetFocus;
    Exit;
  End;

end;

procedure TfrmParamBalanceteCad.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlContab := TCtrlContab.Create;
   CtrlContab.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

   If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
      MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);

   CtrlRptBalanceteAnalPP := TCtrlRptBalanceteAnalPP.Create;
   CtrlRptBalanceteAnalPP.Initialize(DtmBaseDados.dbBaseDados,
                                     True,
                                     Sistema.ConnectionType,
                                     Sistema.ConnectionSide,
                                     Sistema.AppRemoteServer,
                                     True,
                                     nil,
                                     nil,
                                     False);
end;

procedure TfrmParamBalanceteCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  cdsCCusto.Close;
  CtrlContab.Free;
  CtrlRptBalanceteAnalPP.Free;
end;

procedure TfrmParamBalanceteCad.FormShow(Sender: TObject);
begin
  inherited;
   pgInfo.ActivePageIndex := 0;

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
end;

procedure TfrmParamBalanceteCad.btnGeraTXTClick(Sender: TObject);
var sNomeArquivo, sLinha: string;
    iTamanho: integer;
    ArquivoTexto : TextFile;
    iNumero,Ind: integer;
    sContasZeradas : String;
begin
   inherited;

   ProcuraDir.Execute;

   if sCaminho = '' then
   begin
      MsgDlg('O Caminho onde o Balancete será Gravado é Obrigatório.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      Exit;
   end;

   if dblkExercicio.text = '' then
   begin
      MsgDlg('O Exercício deve ser preenchido.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      Exit;
   end;

   if dblkPeriodoIni.text = '' then
   begin
      MsgDlg('O Período Inicial deve ser preenchido.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      Exit;
   end;

   if dblkPeriodoFim.text = '' then
   begin
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

   if MsgDlg('Será Gerado um Arquivo Chamado ' + sNomeArquivo +  ' no Diretório '+ sCaminho + '. Deseja Prosseguir?',
             'Aviso',
             mtConfirmation,
             [mbYes, mbNo],
             0) = mrYes then
   Begin
     screen.cursor := crHourglass;

     sContasZeradas := RetornaTipoContaZerada(rdbImprimeContasZeradas.ItemIndex);

     AssignFile(ArquivoTexto, sCaminho + '\' +sNomeArquivo);
     ReWrite(Arquivotexto);

     iNumero := FuncaoGeral.CalcNumEleGrau(CtrlContab.MascaraContaParam, 1);

     //==============
     cdsBalancete.Data := CtrlRptBalanceteAnalPP.FazQuery(dteDataLim1.Text,
                                                          dteDataLim2.Text,
                                                          dblkExercicio.text,
                                                          cdsPeriodoIni.FieldByName('PERNUMERO').asString,
                                                          cdsPeriodoFim.FieldByName('PERNUMERO').asString,
                                                          cmpContaIni.conta.Numero,
                                                          cmpContaFim.conta.Numero,
                                                          False,  // Cmp_Padrao.ParamValues[22].AsBoolean
                                                          Cmp_Padrao.ParamValues[23].asBoolean,
                                                          IntToStr(iNumero),
                                                          '',
                                                          IntToStr(iPlano),
                                                          IntToStr(sistema.idEmpresa),
                                                          CtrlContab.TipoOpEncer,
                                                          sPlanoPrevMarca,
                                                          sPatroMarca,
                                                          sAtivProjMarca,
                                                          '',
                                                          False,
                                                          False,
                                                          False,
                                                          False, // Cmp_Padrao.ParamValues[17].AsBoolean
                                                          cbDesconsidera.Checked,
                                                          cbDesconsideraEstatistica.Checked,
                                                          (rgQuebra.ItemIndex = 0),
                                                          false,
                                                          sContasZeradas);
     //==============
     If cdsBalancete.IsEmpty Then
     Begin
       MsgDlg('Nenhum Dado Obitdo para Gerar o Arquivo.','Aviso',mtInformation,[mbOk],0);
       CloseFile(ArquivoTexto);
       screen.cursor := crDefault;
       modalResult := mrNone;
       Exit;
     End;

{     CdsBalancete.Data := CtrlRptBalanceteAnalPP.AjustaModImpressao(CdsBalancete.Data,
                                                                    true,
                                                                    (sContasZeradas = 'SM'));

 }

     //Gera o Cabeçalho do arquivo texto
     sLinha := 'Exercicio: ' + dblkExercicio.text + '    Periodo Inicial: ' + dblkPeriodoIni.text + '    Periodo Final: ' + dblkPeriodoFim.text;
     WriteLn(ArquivoTexto, sLinha);
     WriteLn(ArquivoTexto, ' ');

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
       if cdsBalancete.FieldByName('SALDOANT').AsFloat >= 0 then
         sLinha := sLinha + 'D'
       else
         sLinha := sLinha + 'C';

       //Concatena os valores de Débito e crédito
       sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', cdsBalancete.FieldByName('DEB').AsFloat), 20);
       sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', cdsBalancete.FieldByName('CRED').AsFloat), 20);

       //Concatena a movimentação
       sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', ABS(cdsBalancete.FieldByName('MOV').AsFloat)), 20);

       //Concatena se a movimentação está a Débito ou a Crédito
       if cdsBalancete.FieldByName('MOV').AsFloat >= 0 then
         sLinha := sLinha + 'D'
       else
         sLinha := sLinha + 'C';

       //Concatena o Saldo Atual
       sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', ABS(cdsBalancete.FieldByName('SALDO').AsFloat)), 20);

       //Concatena se o saldo está a Débito ou a Crédito
       if cdsBalancete.FieldByName('SALDO').AsFloat >= 0 then
         sLinha := sLinha + 'D'
       else
         sLinha := sLinha + 'C';
       WriteLn(ArquivoTexto, sLinha);
       cdsBalancete.Next;
     End;
     CloseFile(ArquivoTexto);
     screen.cursor := crDefault;
     MsgDlg('Arquivo gerado com sucesso.','Aviso',mtInformation,[mbOk],0);
     modalResult := mrNone;
   End;
end;

function TfrmParamBalanceteCad.VerificaCamposDeTela : Boolean;
begin
   result := True;
   if dblkExercicio.text = '' then
   begin
      MsgDlg('O Exercício deve ser preenchido.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      result := False;
      Exit;
   end;

   if dblkPeriodoIni.text = '' then
   begin
      MsgDlg('O Período Inicial deve ser preenchido.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      result := False;
      Exit;
   end;

   if dblkPeriodoFim.text = '' then
   begin
      MsgDlg('O Período Final deve ser preenchido.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      result := False;
      Exit;
   end;

   if edtAnexo.text = '' then
   begin
      MsgDlg('A informação do Anexo deve ser preenchida.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      result := False;
   end;

  GuardaMarcadosNosGrids;
end;

procedure TfrmParamBalanceteCad.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If Not VerificaCamposDeTela then
    Exit;

  //*** passa os paramentos para o componente padrao ***
  Cmp_Padrao.ParamValues[0].AsInteger  := StrToInt(dblkExercicio.LookupValue);
  Cmp_Padrao.ParamValues[1].AsInteger  := StrToInt(dblkPeriodoIni.LookupValue);
  Cmp_Padrao.ParamValues[2].AsInteger  := StrToInt(dblkPeriodoFim.LookupValue);
  Cmp_Padrao.ParamValues[3].AsString   := cmpContaIni.Conta.Numero;
  Cmp_Padrao.ParamValues[4].AsString   := cmpContaFim.Conta.Numero;
  Cmp_Padrao.ParamValues[5].AsString   := '';
  Cmp_Padrao.ParamValues[6].AsString   := '';
  Cmp_Padrao.ParamValues[7].AsString   := '';
  Cmp_Padrao.ParamValues[8].AsString   := dteDataLim1.Text;
  Cmp_Padrao.ParamValues[9].AsString   := dteDataLim2.Text;
  Cmp_Padrao.ParamValues[10].AsBoolean := chkMascara.Checked;
  Cmp_Padrao.ParamValues[11].AsBoolean := chkGrupo.Checked;
  Cmp_Padrao.ParamValues[12].AsInteger := 0;
  Cmp_Padrao.ParamValues[13].AsBoolean := False;
  Cmp_Padrao.ParamValues[14].AsBoolean := cbDesconsidera.Checked;
  Cmp_Padrao.ParamValues[15].AsBoolean := cbDesconsideraEstatistica.Checked;
  Cmp_Padrao.ParamValues[16].AsInteger := StrToInt(spnPagIni.text);

  // Alterado por FHBS - SOL: 140372 KTN: 877866
  if rgQuebra.ItemIndex = 2 then
    Cmp_Padrao.ParamValues[17].AsString  := FTiutloRelatorio
  else
    Cmp_Padrao.ParamValues[17].AsString  := '';

  Cmp_Padrao.ParamValues[18].AsString  := '';
  Cmp_Padrao.ParamValues[19].AsString  := sPlanoPrevMarca;
  Cmp_Padrao.ParamValues[20].AsString  := sPatroMarca;
  Cmp_Padrao.ParamValues[21].AsString  := sAtivProjMarca;
  Cmp_Padrao.ParamValues[22].AsString  := edtAnexo.Text;
  Cmp_Padrao.ParamValues[23].AsBoolean := rgQuebra.ItemIndex = 1;
  Cmp_Padrao.ParamValues[24].AsBoolean := rgQuebra.ItemIndex = 0;
  Cmp_Padrao.ParamValues[25].AsInteger := rdgValores.ItemIndex;
  Cmp_Padrao.ParamValues[26].AsString  := RetornaTipoContaZerada(rdbImprimeContasZeradas.ItemIndex);
  Cmp_Padrao.ParamValues[27].AsBoolean := False;
  // Alterado por FHBS - SOL: 140372 KTN: 877866
  Cmp_Padrao.ParamValues[28].AsBoolean := rgQuebra.ItemIndex = 2;
end;

function TfrmParamBalanceteCad.RetornaTipoContaZerada(const pIdContaZerada : Integer) : String;
begin
  Result := '';
  case pIdContaZerada of
    0: Result := 'S';
    1: Result := 'SM';
    2: Result := 'A';
    3: Result := 'N';
  end;
end;

procedure TfrmParamBalanceteCad.ProcuraDirSelectionChanged(Sender: TObject;
  Wnd: HWND; Path: String; var ShowText: String;
  var OKButtonEnabled: Boolean);
begin
  inherited;
  sCaminho := Path;
end;


procedure TfrmParamBalanceteCad.dblkPeriodoIniCloseUp(Sender: TObject;
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
  end
  else
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

     if (iPlano <> iPlanoAnt) and (iPlano <> 0) then
     begin
        cmpContaIni.Plano     := iPlano;
        //cmpContaIni.Mascara   := CtrlContab.MascaraContaParam; //Everson Cunha - SIG102043
        cmpContaIni.Mascara   := CtrlContab.MascaraContaData;    //Everson Cunha - SIG102043
        cmpContaFim.Plano     := iPlano;
        //cmpContaFim.Mascara   := CtrlContab.MascaraContaParam; //Everson Cunha - SIG102043
        cmpContaFim.Mascara   := CtrlContab.MascaraContaData;    //Everson Cunha - SIG102043
     end
     else
     begin
        cmpContaIni.Plano     := CtrlContab.PlanoParam;
        cmpContaIni.Mascara   := CtrlContab.MascaraContaParam;
        cmpContaFim.Plano     := CtrlContab.PlanoParam;
        cmpContaFim.Mascara   := CtrlContab.MascaraContaParam;
        iPlano                := CtrlContab.PlanoParam;
     end;
  end;
end;

procedure TfrmParamBalanceteCad.dblkPeriodoFimExit(Sender: TObject);
begin
  inherited;
  // Alterado por Arnaldo Vicente Scarin em 14/09/2009
  // SOL: 40495 Kintana: 523623
  // Alterações no layout do relatório conforme solicitação do SOL
  CarregarDadosCentroDeCustos;
end;

// Alterado por Arnaldo Vicente Scarin em 14/09/2009
// SOL: 40495 Kintana: 523623
// Alterações no layout do relatório conforme solicitação do SOL
procedure TFrmParamBalanceteCad.CarregarDadosCentroDeCustos;
var sDataSelecao : String;
begin
  If (dblkExercicio.Text = '') or
     (dblkPeriodoFim.Text = '') then
    exit;

  sDataSelecao := DateToStr(UltimoDiaMes( StrToDate('01/'+
                                          IntToStr(cdsPeriodoFim.FieldByName('Pernumero').asInteger)+'/'+
                                          dblkExercicio.text) ) );
  with SqlCCusto do
  begin
    Prepare;
    ParamByName('DataSelecao').AsString := sDataSelecao;
    Open;
  end;
end;

// Alterado por Arnaldo Vicente Scarin em 14/09/2009
// SOL: 40495 Kintana: 523623
// Alterações no layout do relatório conforme solicitação do SOL
procedure TfrmParamBalanceteCad.pgInfoChange(Sender: TObject);
begin
  inherited;
  if (pgInfo.ActivePageIndex = 1) and
     Not (cdsCCusto.Active) then
  begin
    If dblkPeriodoFim.Text = '' then
    begin
      MsgDlg('Para seleção das Assinaturas, é necessário informar o periodo Final',
             'Erro',
             MtError,
             [mbOk],
             0);
      pgInfo.ActivePageIndex := 0;
      dblkExercicio.SetFocus;
    end
    else
      CarregarDadosCentroDeCustos;
  end;
end;

procedure TfrmParamBalanceteCad.GuardaMarcadosNosGrids;
var
  bTodosSel: Boolean;
begin
   // Alterado por FHBS - SOL: 140372 KTN: 877866
   FTiutloRelatorio := '';
   bTodosSel := True;
   // Fim - Alterado por FHBS
    
   sPlanoPrevMarca  := '';
   sPatroMarca      := '';
   if Sistema.UsaPlanoPatro then
   begin
      cdsPlanoPrevG.First;
      While not cdsPlanoPrevG.EOF do begin
         if cdsPlanoPrevG.FieldByName('MARCA').AsString = 'S' then begin
            if sPlanoPrevMarca = '' then begin
               sPlanoPrevMarca := trim(IntToStr(cdsPlanoPrevG.FieldByName('IDPLANOPREV').AsInteger));
            end else begin
               sPlanoPrevMarca := sPlanoPrevMarca+','+trim(IntToStr(cdsPlanoPrevG.FieldByName('IDPLANOPREV').AsInteger));
            end;

            // Alterado por FHBS - SOL: 140372 KTN: 877866
            if FTiutloRelatorio = '' then
              FTiutloRelatorio := cdsPlanoPrevG.FieldByName('NOME').AsString
            else
              FTiutloRelatorio := FTiutloRelatorio + ' / ' + cdsPlanoPrevG.FieldByName('NOME').AsString;
            // Fim - Alterado por FHBS
         end else begin
           bTodosSel := False; // Alterado por FHBS - SOL: 140372 KTN: 877866
         end;
         cdsPlanoPrevG.Next;
      end;

      cdsPatroG.First;
      While not cdsPatroG.EOF do begin
         if cdsPatroG.FieldByName('MARCA').AsString = 'S' then begin
            if sPatroMarca = '' then begin
               sPatroMarca := trim(IntToStr(cdsPatroG.FieldByName('IDPESSOA').AsInteger));
            end else begin
               sPatroMarca := sPatroMarca+','+trim(IntToStr(cdsPatroG.FieldByName('IDPESSOA').AsInteger));
            end;

            // Alterado por FHBS - SOL: 140372 KTN: 877866
            if FTiutloRelatorio = '' then
              FTiutloRelatorio := cdsPatroG.FieldByName('NOME').AsString
            else
              FTiutloRelatorio := FTiutloRelatorio + ' / ' + cdsPatroG.FieldByName('NOME').AsString;
            // Fim - Alterado por FHBS
         end else begin
           bTodosSel := False; // Alterado por FHBS - SOL: 140372 KTN: 877866
         end;
         cdsPatroG.Next;
      end;

      if bTodosSel then FTiutloRelatorio := ''; // Alterado por FHBS - SOL: 140372 KTN: 877866
      
   end;
end;

procedure TfrmParamBalanceteCad.btMarcaTodosPlanoClick(Sender: TObject);
begin
  inherited;
  try
    cdsPlanoPrevG.DisableControls;
    cdsPlanoPrevG.First;
    while not cdsPlanoPrevG.Eof do
    begin
      cdsPlanoPrevG.Edit;
      cdsPlanoPrevG.FieldByName('MARCA').AsString := 'S';
      cdsPlanoPrevG.Post;
      cdsPlanoPrevG.Next;
    end;
  finally
    cdsPlanoPrevG.EnableControls;
  end;
end;

procedure TfrmParamBalanceteCad.btInverteSelecaoPlanoClick(
  Sender: TObject);
begin
  inherited;
  try
    cdsPlanoPrevG.DisableControls;
    cdsPlanoPrevG.First;
    while not cdsPlanoPrevG.Eof do
    begin
      cdsPlanoPrevG.Edit;
      if cdsPlanoPrevG.FieldByName('MARCA').AsString = 'S' then
        cdsPlanoPrevG.FieldByName('MARCA').AsString := 'N'
      else
        cdsPlanoPrevG.FieldByName('MARCA').AsString := 'S';

      cdsPlanoPrevG.Post;
      cdsPlanoPrevG.Next;
    end;
  finally
    cdsPlanoPrevG.EnableControls;
  end;
end;

procedure TfrmParamBalanceteCad.btMarcaTodosPatroClick(Sender: TObject);
begin
  inherited;
  try
    cdsPatroG.DisableControls;
    cdsPatroG.First;
    while not cdsPatroG.Eof do
    begin
      cdsPatroG.Edit;
      cdsPatroG.FieldByName('MARCA').AsString := 'S';
      cdsPatroG.Post;
      cdsPatroG.Next;
    end;
  finally
    cdsPatroG.EnableControls;
  end;
end;

procedure TfrmParamBalanceteCad.btInverteSelecaoPatroClick(
  Sender: TObject);
begin
  inherited;
  try
    cdsPatroG.DisableControls;
    cdsPatroG.First;
    while not cdsPatroG.Eof do
    begin
      cdsPatroG.Edit;
      if cdsPatroG.FieldByName('MARCA').AsString = 'S' then
        cdsPatroG.FieldByName('MARCA').AsString := 'N'
      else
        cdsPatroG.FieldByName('MARCA').AsString := 'S';

      cdsPatroG.Post;
      cdsPatroG.Next;
    end;
  finally
    cdsPatroG.EnableControls;
  end;
end;

end.
