{-------------------------------------------------------------------------------
-------------------------------- ALTERAÇÕES ------------------------------------
--------------------------------------------------------------------------------

 SIG ..........: 102043
 Data .........: 22/12/2020
 Responsável ..: Everson Cunha
 Descrição ....: Máscara de conta por PLANO e período vigente
--------------------------------------------------------------------------------
 Rotina........:
 N. Sol........: 110161
 N. Kintana....: 503760
 Data..........: 02/04/2009
 Responsável...: Ricardo Alves
 Descrição.....: Adicionada ferramenta de exportação do relatório Balancete
                para Excel.
--------------------------------------------------------------------------------
 Desenvolvedor: Marcus Oliveira
 Data         : 10/10/2007
 Pendência    : 26522 - Criar um Flag para imprimir somente padrao da secretaria
 Solução      : Criado parâmetro 30 na CmRptParam, modificado a
                uctrlrptbalancete.fazquery - criado um parâmetro com default
                false
--------------------------------------------------------------------------------
 Desenvolvedor : Marcus Oliveira
 Data          : 23/05/2007
 Pendência     : 25323
 Descrição     : Criado dois botões para Marcar todos e Inverter Marcação para
                 Plano e patro.
--------------------------------------------------------------------------------
 Desenvolvedor : Marcus Oliveira
 Data          : 16/05/2007
 Pendência     : 25013
 Descrição     : Por como default a opção "Sintéticas(Com Movimentação)"
--------------------------------------------------------------------------------
 Desenvolvedor : Rodolpho da Silva
 Data          : 01/12/2005
 Pendência     : 20835
 Descrição     : Atribuir o CODEXTERNO para visualização no relatório
--------------------------------------------------------------------------------
 Desenvolvedor:  Alex Pereira
 Data         : 29/10/2003
 Pendência    : 15206 - Criar um Flag para imprimir saldos zerados
 Solução      : Criado parâmetro 29 na CmPadrao, modificado a
                 uctrlrptbalancete.fazquery - criado um parâmetro com default
--------------------------------------------------------------------------------}

unit FParamBalancete;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CMProcuraMask, wwdblook, StdCtrls, uCtrlRptBalancete,
  wwdbdatetimepicker, CMDateTimePicker, Mask, Grids, Wwdbigrd, Wwdbgrid,
  ExtCtrls, Spin, ComCtrls, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, MontaSelect, uCmSqlParams, Db,
  DBClient, uCMClientDataSet,uCtrlContab, Wwdatsrc, wwclient,
  FileCtrl, BfDialogs, BrowseFolder, uProcuraDir,
  uCMTypes;


type
  TfrmParamBalancete = class(TfrmParamReports_Padrao)
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
    chkContraNatureza: TCheckBox;
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
    tbsPlanoPatro: TTabSheet;
    tbsAtivProj: TTabSheet;
    dbgrAtivProj: TwwDBGrid;
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
    MontaSelectCCusto: TMontaSelect;
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
    chkSoMovim: TCheckBox;
    spdTodas: TSpeedButton;
    spdInverter: TSpeedButton;
    rdgContaszeradas: TRadioGroup;
    SqlCodExterno: TCMSqlParams;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Panel3: TPanel;
    Splitter3: TSplitter;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    dbgrPlanoPrev: TwwDBGrid;
    dbgrPatro: TwwDBGrid;
    spdInverterPlano: TSpeedButton;
    spdTodosPlano: TSpeedButton;
    spdInvertePatro: TSpeedButton;
    spdTodosPatro: TSpeedButton;
    Bevel1: TBevel;
    ckSecretaria: TCheckBox;
    pnlExportar: TPanel;
    chkExportarExcel: TCheckBox;
    Label15: TLabel;
    edtPasta: TEdit;
    btnPasta: TSpeedButton;
    dlgSaveDialog: TSaveDialog;
    procedure dblkExercicioClick(Sender: TObject);
    procedure cmpContaIniExit(Sender: TObject);
    procedure cmpContaFimExit(Sender: TObject);
    procedure mskCCustoIniExit(Sender: TObject);
    procedure btnCCustoIniClick(Sender: TObject);
    procedure btnCCustoFimClick(Sender: TObject);
    procedure mskCCustoFimExit(Sender: TObject);
    procedure mskAtivProjExit(Sender: TObject);
    procedure btnAtivProjClick(Sender: TObject);
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
    procedure rdgContaszeradasClick(Sender: TObject);
    procedure spdTodosPlanoClick(Sender: TObject);
    procedure spdInverterPlanoClick(Sender: TObject);
    procedure spdTodosPatroClick(Sender: TObject);
    procedure spdInvertePatroClick(Sender: TObject);
    procedure btnPastaClick(Sender: TObject);
  private
    { Private declarations }
   CtrlContab       : TCtrlContab;
   CtrlRptBalancete : TCtrlRptBalancete;
   FCCustoIncial    : string;
   FCCustoFinal     : string;

   procedure GuardaMarcadosNosGrids;
   function  VerificaCamposDeTela: boolean;

   property CCustoInicial : string read FCCustoIncial write FCCustoIncial;
   property CCustoFinal   : string read FCCustoFinal  write FCCustoFinal;

  public
    { Public declarations }
  end;

var
  frmParamBalancete: TfrmParamBalancete;
  sPatroMarca, sPlanoPrevMarca,sAtivProjMarca,sUnidNegoc,sMascaraPlano : String;
  iPlano : LongInt;
  sCaminho :string;


implementation

uses UMensErro, uDatabase, DBaseDados, uSistema, uString,
     uModulo, uData, uFuncaoGeral, FSM_FxLib;

{$R *.DFM}

procedure TfrmParamBalancete.GuardaMarcadosNosGrids;
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

procedure TfrmParamBalancete.dblkExercicioClick(Sender: TObject);
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

procedure TfrmParamBalancete.cmpContaIniExit(Sender: TObject);
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





procedure TfrmParamBalancete.cmpContaFimExit(Sender: TObject);
begin
  inherited;
  If (ActiveControl.Tag <> 999) And (cmpContaFim.Valida <> VcOK) Then
  Begin
    cmpContaFim.SetFocus;
    Exit;
  End;
end;




procedure TfrmParamBalancete.mskCCustoIniExit(Sender: TObject);
var sCCusto : string;
begin
  inherited;
   if mskCCustoIni.text <> '' then begin
      sCCusto := mskCCustoIni.text;

      with SqlCodExterno do begin

         Prepare;
         ParamByName('IDEMPRESA').asFloat   := sistema.idEmpresa;
         ParamByName('CODEXTERNO').asString := sCCusto;
         Open;
         if not cdsCCusto.isEmpty then begin
            mskCCustoIni.text := cdsCCusto.FieldByName('CODEXTERNO').asString;
            CCustoInicial     := cdsCCusto.FieldByName('CODCENTROCUSTO').asString;
         end else begin
            MsgDlg('O código do centro de custo informado não existe.','Aviso',mtWarning,[mbOk],0);
            mskCCustoIni.SetFocus;
         end;
      end;
   end;
end;



procedure TfrmParamBalancete.btnCCustoIniClick(Sender: TObject);
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
         mskCCustoIni.text   := cdsCCusto.FieldByName('CODEXTERNO').asString;
         CCustoInicial       := sCCusto;
      end;
   end;

end;

procedure TfrmParamBalancete.btnCCustoFimClick(Sender: TObject);
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
         mskCCustoFim.text   := cdsCCusto.FieldByName('CODEXTERNO').asString;
         CCustoFinal         := sCCusto;
      end;
   end;

end;




procedure TfrmParamBalancete.mskCCustoFimExit(Sender: TObject);
var sCCusto : string;
begin
  inherited;
   if mskCCustoFim.text <> '' then begin
      sCCusto := mskCCustoFim.text;

      with SqlCodExterno do begin

         Prepare;
         ParamByName('IDEMPRESA').asFloat       := sistema.idEmpresa;
         ParamByName('CODEXTERNO').asString := sCCusto;
         Open;
         if not cdsCCusto.isEmpty then begin
            mskCCustoFim.text := cdsCCusto.FieldByName('CODEXTERNO').asString;
            CCustoFinal       := cdsCCusto.FieldByName('CODCENTROCUSTO').asString;
         end else begin
            MsgDlg('O código do centro de custo informado não existe.','Aviso',mtWarning,[mbOk],0);
            mskCCustoFim.SetFocus;
         end;
      end;
   end;
end;




procedure TfrmParamBalancete.mskAtivProjExit(Sender: TObject);
var sAtivProj : string;
begin
  inherited;
   if mskAtivProj.text <> '' then begin
      sAtivProj := mskAtivProj.text;
      with sqlAtivProj do begin
         Prepare;
         ParamByName('IDPESSOA').asFloat   := sistema.idEmpresa;
         ParamByName('UNIDNEGOC').asFloat  := StrToFloat(sAtivProj);
         Open;
         if not cdsAtivProj.isEmpty then begin
            mskAtivProj.text := cdsAtivProj.FieldByName('UNECODIGO').asString;
            sUnidNegoc := IntToStr(cdsAtivProj.FieldByName('UNIDNEGOC').asInteger);
         end else begin
            MsgDlg('O código da atividade/projeto informado não existe.','Aviso',mtWarning,[mbOk],0);
            mskAtivProj.SetFocus;
         end;
      end;
   end;

end;

procedure TfrmParamBalancete.btnAtivProjClick(Sender: TObject);
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
         mskAtivProj.text     := cdsAtivProj.FieldByName('UNECODIGO').asString;
         sUnidNegoc  := IntToStr(cdsAtivProj.FieldByName('UNIDNEGOC').asInteger);

      end;
   end;

end;

procedure TfrmParamBalancete.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlContab := TCtrlContab.Create;
   CtrlContab.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

   If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
      MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);

   CtrlRptBalancete := TCtrlRptBalancete.Create;
   CtrlRptBalancete.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                              Sistema.AppRemoteServer,True,nil,nil,False);


   MontaSelectCCusto.Filtro.Add('CENTCUST.IDEMPRESA = ' + IntToStr(sistema.idEmpresa));
   MontaSelectAtivProj.Filtro.Add('UNIDNEGOCIO.IDPESSOA = ' + IntToStr(sistema.idEmpresa));

end;

procedure TfrmParamBalancete.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.Free;
  CtrlRptBalancete.Free;
end;

procedure TfrmParamBalancete.FormShow(Sender: TObject);
begin
  inherited;
   PageControl1.ActivePageIndex := 0;
   tbsPlanoPatro.Enabled := Sistema.UsaPlanoPatro;

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

   mskCCustoIni.editMask := modulo.sMascaraCCusto + ';0; ';
   mskCCustoFim.editMask := modulo.sMascaraCCusto + ';0; ';

   mskAtivProj.editMask  := modulo.sMascaraUnidNegoc + ';0; ';

   spnGrau.MaxValue := FuncaoGeral.CalcGrauMax(CtrlContab.MascaraContaParam);
   spnGrau.Value    := FuncaoGeral.CalcGrauMax(CtrlContab.MascaraContaParam);
   spnGrau.MinValue := 1;


end;

procedure TfrmParamBalancete.btnGeraTXTClick(Sender: TObject);
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

    case rdgContaszeradas.ItemIndex of
      0: sContasZeradas := 'S';
      1: sContasZeradas := 'SM';
      2: sContasZeradas := 'A';
      3: sContasZeradas := 'N';
    end;

    cdsBalancete.Data := CtrlRptBalancete.FazQuery(dteDataLim1.Text,dteDataLim2.Text,dblkExercicio.text,
                         cdsPeriodoIni.FieldByName('PERNUMERO').asString,
                         cdsPeriodoFim.FieldByName('PERNUMERO').asString,
                         cmpContaIni.conta.Numero, cmpContaFim.conta.Numero,
                         mskCCustoIni.text,mskCCustoFim.text,IntToStr(iNumero),
                         mskAtivProj.text,IntToStr(iPlano),IntToStr(sistema.idEmpresa),
                         CtrlContab.TipoOpEncer,sPlanoPrevMarca,sPatroMarca,
                         sAtivProjMarca,IntToStr(spnGrau.value),chkLingua.checked,
                         chkCorresp.checked,chkIndenta.Checked, chkContraNatureza.checked,
                         cbDesconsidera.Checked,cbDesconsideraEstatistica.Checked,
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

    cdsBalancete.Data := CtrlRptBalancete.AjustaModImpresao(cdsBalancete.Data,chkSoMovim.Checked,(rdgContaszeradas.ItemIndex = 1));

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




function TfrmParamBalancete.VerificaCamposDeTela: boolean;
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




procedure TfrmParamBalancete.bbtnConfirmarClick(Sender: TObject);
var sContasZeradas: string;
begin
  inherited;
  if not VerificaCamposDeTela then
  begin
     ModalResult := mrNone;
     Exit;
  end;
  GuardaMarcadosNosGrids;

  if mskAtivProj.text = '' then  sUnidNegoc := '';

  //*** passa os paramentos para o componente padrao ***
  Cmp_Padrao.ParamValues[0].AsInteger  := StrToInt(dblkExercicio.LookupValue);
  Cmp_Padrao.ParamValues[1].AsInteger  := StrToInt(dblkPeriodoIni.LookupValue);
  Cmp_Padrao.ParamValues[2].AsInteger  := StrToInt(dblkPeriodoFim.LookupValue);
  Cmp_Padrao.ParamValues[3].AsString   := cmpContaIni.Conta.Numero;
  Cmp_Padrao.ParamValues[4].AsString   := cmpContaFim.Conta.Numero;

  Cmp_Padrao.ParamValues[5].AsString   := CCustoInicial;
  Cmp_Padrao.ParamValues[6].AsString   := CCustoFinal;


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
  Cmp_Padrao.ParamValues[17].AsBoolean := chkContraNatureza.Checked;
  Cmp_Padrao.ParamValues[18].AsBoolean := chkTotalizadores.Checked;
  Cmp_Padrao.ParamValues[19].AsBoolean := cbDesconsidera.Checked;
  Cmp_Padrao.ParamValues[20].AsBoolean := cbDesconsideraEstatistica.Checked;
  Cmp_Padrao.ParamValues[21].AsInteger := rdgValores.ItemIndex;
  Cmp_Padrao.ParamValues[22].AsBoolean := chkSoMovim.Checked;
  Cmp_Padrao.ParamValues[23].AsInteger := StrToInt(spnPagIni.text);
  Cmp_Padrao.ParamValues[24].AsString  := edtTitulo.text;
  Cmp_Padrao.ParamValues[25].AsString  := edtSubTitulo.text;
  Cmp_Padrao.ParamValues[26].AsString  := sPlanoPrevMarca;
  Cmp_Padrao.ParamValues[27].AsString  := sPatroMarca;
  Cmp_Padrao.ParamValues[28].AsString  := sAtivProjMarca;

  Cmp_Padrao.ParamValues[30].AsBoolean := ckSecretaria.Checked;

  case rdgContaszeradas.ItemIndex of
    0: sContasZeradas := 'S';
    1: sContasZeradas := 'SM';
    2: sContasZeradas := 'A';
    3: sContasZeradas := 'N';
  end;
  Cmp_Padrao.ParamValues[29].AsString := sContasZeradas;

  // Ricardo Al. SOL: 110161 KTN: 503760
  // recebe os parâmetros para geração do arquivo em excel.
  Cmp_Padrao.ParamValues[ 31 ].AsBoolean := chkExportarExcel.Checked;
  Cmp_Padrao.ParamValues[ 32 ].AsString  := edtPasta.Text;

  if ( chkExportarExcel.Checked ) and ( Trim( edtPasta.Text ) = '' ) then
  begin
    MsgDlg( 'Entre com a pasta onde será gravado o arquivo exportado. ',
      'Informação', mtInformation, [mbOk], 0 );
    ModalResult := mrNone;
    edtPasta.SetFocus;
    Exit;
  end;
end;




procedure TfrmParamBalancete.ProcuraDirSelectionChanged(Sender: TObject;
  Wnd: HWND; Path: String; var ShowText: String;
  var OKButtonEnabled: Boolean);
begin
  inherited;
  sCaminho := Path;
end;



procedure TfrmParamBalancete.chkGrauClick(Sender: TObject);
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




procedure TfrmParamBalancete.dblkPeriodoIniCloseUp(Sender: TObject;
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

procedure TfrmParamBalancete.spdTodasClick(Sender: TObject);
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

procedure TfrmParamBalancete.spdInverterClick(Sender: TObject);
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



procedure TfrmParamBalancete.rdgContaszeradasClick(Sender: TObject);
begin
  inherited;
  if rdgContaszeradas.ItemIndex = 1 then
  begin
     chkGrau.Checked    := False;
     chkGrau.Enabled    := False;
     chkSoMovim.Checked := False;
     chkSoMovim.Enabled := False;
  end
  else
  begin
     chkGrau.Enabled    := True;
     chkSoMovim.Enabled := True;
  end;
end;

 //Seleciona todos os Plano
procedure TfrmParamBalancete.spdTodosPlanoClick(Sender: TObject);
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

//Inverte a seleção do Plano
procedure TfrmParamBalancete.spdInverterPlanoClick(Sender: TObject);
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

   //Seleciona todos os Patro
procedure TfrmParamBalancete.spdTodosPatroClick(Sender: TObject);
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
   //Inverte a seleção do Patro.
procedure TfrmParamBalancete.spdInvertePatroClick(Sender: TObject);
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

procedure TfrmParamBalancete.btnPastaClick(Sender: TObject);
begin
  dlgSaveDialog.DefaultExt := '*.xls';
  dlgSaveDialog.Filter := 'Planilha do Excel (*.xls)|*.XLS|Todos os arquivos (*.*)|*.*';

  if ( dlgSaveDialog.Execute ) then
     edtPasta.Text := dlgSaveDialog.FileName;

end;

end.
