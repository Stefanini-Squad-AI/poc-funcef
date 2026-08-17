{===============================================================================
Unit    :  FSimulacaoCalcAtuarial
Form    :  frmSimulacaoCalcAtuarial

Autor   : Claudio Faria
Empresa : CM Soluões

Data    : 16/06/2006

Objetivo: Wizard para a geração de um cálculo atuarial

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit FSimulacaoCalcAtuarial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, ExtCtrls, StdCtrls,
  wwdblook, Mask, MskEdDlg, wwdbdatetimepicker, CMDateTimePicker, TreeWzd,
  MontaSelect, Db, Wwdatsrc, DBTables, Wwquery, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, Menus, DBCtrls, wwdbedit,
  CMDBLookupCombo, uCtrlLancamento, uIntegraBack, uCtrlParamIntegra,
  TB97Ctls, DBCtrls2, TabControlDetalhe, ImgList, DBClient, cmseldlg,
  CheckLst, uglobal, wwclient, uFuncGerais, DBGrids;

type
  TFrmSimulacaoCalcAtuarial = class(TfrmSairAjuda)
    PgCtrlEtapa: TPageControl;

    BtnAnterior: TBitBtn;
    BtnProximo : TBitBtn;
    BtnEncerra : TBitBtn;
    BtnCancela : TBitBtn;

    pnlEtapas    : TPanel;
    pnlFundoRetro: TPanel;
    pnlTitulo    : TPanel;

    updReservaPart: TUpdateSQL;

    ToolbarSep971: TToolbarSep97;
    Label29     : TLabel;

    TwCons: TTreeWzd;
    ImlPadrao: TImageList;
    TbsItemHipotese: TTabSheet;
    TbsHipotese: TTabSheet;
    TbsCalcAtuarial: TTabSheet;
    TbsListaCalc: TTabSheet;
    TbsMemoriaCalc: TTabSheet;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    sbtnInserirItem: TToolbarButton97;
    sbtnAlterarItem: TToolbarButton97;
    sbtnProcurarItem: TToolbarButton97;
    sbtnApagarItem: TToolbarButton97;
    Panel1: TPanel;
    Label7: TLabel;
    DBRdGrpNatureza: TDBRadioGroup;
    dbeDescricaoItem: TDBEdit;
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    DBEdtVariavel: TDBEdit;
    qryPrincItem: TwwQuery;
    dsItem: TwwDataSource;
    updtPrincItem: TUpdateSQL;
    MontaSelectItem: TMontaSelect;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    DBCmbBxTabuaGeral: TwwDBLookupCombo;
    qryTabuaItem: TwwQuery;
    Panel2: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbeDescricaoHipotese: TDBEdit;
    dbeDtGeracaoItem: TDBEdit;
    PgCtrlDetalhe: TPageControl;
    tbshDetalhe: TTabSheet;
    DbGrdDet: TwwDBGrid;
    PnlDetalhe: TPanel;
    Label8: TLabel;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    DBCmbBxItem: TwwDBLookupCombo;
    plValor: TPanel;
    Label6: TLabel;
    dbeVl_Hipotese: TDBEdit;
    plTabua: TPanel;
    Label5: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBCmbBxTabua_Mas: TwwDBLookupCombo;
    DBCmbBxTabua_Fem: TwwDBLookupCombo;
    DBCmbBxTabua_Pen: TwwDBLookupCombo;
    pnlBarraDetalhe: TPanel;
    BtProc: TSpeedButton;
    BtExcl: TSpeedButton;
    btAlt: TSpeedButton;
    BtIns: TSpeedButton;
    wwDBLookupCombo1: TwwDBLookupCombo;
    Dock973: TDock97;
    Toolbar972: TToolbar97;
    sbtnInserirHipotese: TToolbarButton97;
    sbtnAlterarHipotese: TToolbarButton97;
    sbtnProcurarHipotese: TToolbarButton97;
    sbtnApagarHipotese: TToolbarButton97;
    Toolbar973: TToolbar97;
    sbtnGerarHipotese: TToolbarButton97;
    ToolbarSep972: TToolbarSep97;
    qryPrincHipotese: TwwQuery;
    dsHipotese: TwwDataSource;
    updtPrincHipotese: TUpdateSQL;
    updtDetalheHipotese: TUpdateSQL;
    dsDetalheHipotese: TwwDataSource;
    qryDetalheHipotese: TwwQuery;
    qryTabua_Pen: TwwQuery;
    qryTabua_Fem: TwwQuery;
    qryTabua_Mas: TwwQuery;
    qryItem: TwwQuery;
    qryAux: TwwQuery;
    qryRegra: TwwQuery;
    MontaSelectHipotese: TMontaSelect;
    seldlgProcuraQry: TcmSelectDlg;
    Panel3: TPanel;
    GrpBxGrupos: TGroupBox;
    SpdBttnGrupoPart: TSpeedButton;
    ChckLstBxGrupoPart: TCheckListBox;
    GroupBoxHipotese: TGroupBox;
    ssbReCalcHipote: TSpeedButton;
    DBLkpCmbBxHipotese: TDBLookupComboBox;
    RadioGroupTipoCalculo: TRadioGroup;
    qryHipotese: TwwQuery;
    qryHipoteseCD_HIPOTESE: TFloatField;
    qryHipoteseDS_HIPOTESE: TStringField;
    qryHipoteseDT_GERACAO: TDateTimeField;
    qryHipoteseNR_IDADE_MIN_TB_SERV: TFloatField;
    qryHipoteseNR_IDADE_MAX_TB_SERV: TFloatField;
    qryHipoteseIDREGRA: TFloatField;
    wwDtSrcHipotese: TwwDataSource;
    bbtnAddLista: TBitBtn;
    qryGrupoPartic: TwwQuery;
    qryGrupoParticCD_GRUPO_PARTIC: TFloatField;
    qryGrupoParticNO_GRUPO_PARTIC: TStringField;
    qryItemHipotese: TwwQuery;
    qryItemHipoteseCD_HIPOTESE: TFloatField;
    qryItemHipoteseCD_ITEM_HIPOTESE: TFloatField;
    qryItemHipoteseVL_HIPOTESE: TFloatField;
    qryItemHipoteseIR_GERA_TAB_SERVICO: TStringField;
    qryItemHipoteseSQ_VERSAO_COMUTACAO_MAS: TFloatField;
    qryItemHipoteseSQ_VERSAO_COMUTACAO_FEM: TFloatField;
    qryItemHipoteseSQ_VERSAO_COMUTACAO_PEN: TFloatField;
    qryParticipantes: TwwQuery;
    qryProcura: TwwQuery;
    GroupBox2: TGroupBox;
    cdsListaCalculo: TwwClientDataSet;
    cdsListaCalculoNO_HIPOTESE: TStringField;
    cdsListaCalculoCD_HIPOTESE: TIntegerField;
    cdsListaCalculoCD_PARTIC: TIntegerField;
    cdsListaCalculoCD_GRUPO: TStringField;
    cdsListaCalculoNR_POSICAO: TIntegerField;
    cdsListaCalculoIR_CALCULA: TBooleanField;
    wwDBGrid1: TwwDBGrid;
    dsListaCalculo: TwwDataSource;
    sbtSobe: TSpeedButton;
    sbtDesce: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel4: TPanel;
    trvMemoria: TTreeView;
    dsMemoria: TwwDataSource;
    qryMemoria: TwwQuery;
    bbtnBuscar: TBitBtn;
    qryAuxMemoria: TwwQuery;
    bbtReCalculo: TBitBtn;
    bbtnEfetivar: TBitBtn;
    qryEfetivaCalculo: TwwQuery;
    bbtnExcluir: TBitBtn;
    qryCalculo: TwwQuery;
    qryOcorCalculo: TwwQuery;
    qryOpcaoCalculo: TwwQuery;
    cdsMassa_Calculo: TClientDataSet;
    qryDatas: TwwQuery;
    qryLista_Hipotese: TwwQuery;
    qryDt_Partic: TwwQuery;
    qryITM_Hipotese: TwwQuery;
    qryInsReferCalculo: TwwQuery;
    qryOpcaoGrupo: TwwQuery;
    qryValores: TwwQuery;
    qryValorParticipante: TwwQuery;

    procedure Prepara_GravaItem(vGrava : TDataSetState);

    procedure FormShow(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnCancelaClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sbtnInserirItemClick(Sender: TObject);
    procedure sbtnAlterarItemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnProcurarItemClick(Sender: TObject);
    procedure BtnEncerraClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtInsClick(Sender: TObject);
    procedure btAltClick(Sender: TObject);
    procedure BtExclClick(Sender: TObject);
    procedure BtProcClick(Sender: TObject);
    procedure sbtnInserirHipoteseClick(Sender: TObject);
    procedure sbtnAlterarHipoteseClick(Sender: TObject);
    procedure sbtnProcurarHipoteseClick(Sender: TObject);
    procedure qryDetalheHipoteseBeforePost(DataSet: TDataSet);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure DBCmbBxItemChange(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure sbtnGerarHipoteseClick(Sender: TObject);
    procedure DBLkpCmbBxHipoteseCloseUp(Sender: TObject);
    procedure bbtnAddListaClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure sbtSobeClick(Sender: TObject);
    procedure sbtDesceClick(Sender: TObject);
    procedure RadioGroupTipoCalculoClick(Sender: TObject);
    procedure SpdBttnGrupoPartClick(Sender: TObject);
    procedure trvMemoriaChange(Sender: TObject; Node: TTreeNode);
    procedure bbtnBuscarClick(Sender: TObject);
    procedure bbtReCalculoClick(Sender: TObject);
    procedure bbtnEfetivarClick(Sender: TObject);
    procedure bbtnExcluirClick(Sender: TObject);
    procedure ssbReCalcHipoteClick(Sender: TObject);
    procedure sbtnApagarItemClick(Sender: TObject);
    procedure sbtnApagarHipoteseClick(Sender: TObject);

  private
    { Private declarations }
    procedure ReOrganiza_Lista;
    procedure Limpa_OpcaoParaCalculo;

    function GetFieldList: TStringList;
    function Localiza_Grupos_Participantes(vDT_GERACAO:TDateTime):TStringList;
    Function PegaGrupo(vGrupo:Integer):Integer;

    Procedure Inicializa_Campos_CDS;
    Procedure Popular_CDS_Calculo;

    Procedure Atualiza_TreeView;

    Procedure OnGetResultLocal( Sender : TObject );

    procedure GeraReferCalculo;
  public
    { Public declarations }
    w_cd_partic : integer;
  end;

var
  FrmSimulacaoCalcAtuarial: TFrmSimulacaoCalcAtuarial;
  PrincipalPost : boolean;//Serve para verificar se Já foi inserido
                          //o Registro Pai         -(Master/Detail)

  w_tp_grupo    : array [1..50] of Integer; // guarda tipos de grupo de participante
  w_ocor_grupo  : Integer;
  w_todos_grupos: Boolean;

  w_dt_geracao, w_dt_refer  : TDatetime;

  iVersao_M, iVersao_F, iVersao_P:Integer;
  Conta, Total:Integer;

  FieldList:TstringList;




implementation

uses FTelaAut, uListaVariaveis, dBaseDados, UMensErro, DRelatsAtuarial,
  uVersaoBase, uProcura, TreeFunc, dInterfaceAtuarial, FAnimacao,
  FVerHipoteses;

{$R *.DFM}

{ TreeFunc ------------------------------------------------------------------- }
{ ---------------------------------------------------------------------------- }

function TFrmSimulacaoCalcAtuarial.GetFieldList: TStringList;
begin
   FieldList.clear;

   If (qryMemoria.FieldByName('IR_CALCULO_EFETIVADO').AsString <> ' ') Then
        FieldList.add(Trim(qryMemoria.FieldByName('IR_CALCULO_EFETIVADO').AsString));

   If (qryMemoria.FieldByName('DS_HIPOTESE').AsString <> ' ') Then
        FieldList.add(Trim(qryMemoria.FieldByName('DS_HIPOTESE').AsString));

   If (qryMemoria.FieldByName('DT_GERACAO').AsString <> ' ') Then
        FieldList.add(Trim(qryMemoria.FieldByName('DT_GERACAO').AsString)); 


   Result := FieldList;
end;

Procedure TFrmSimulacaoCalcAtuarial.Atualiza_TreeView;
Var w_i:Integer;
Begin
   trvMemoria.Items.BeginUpdate;
   qryMemoria.first;
   while not qryMemoria.eof do
   begin
      TreeAddItem(trvMemoria, GetFieldList, qryMemoria.GetBookmark, false);
      qryMemoria.next;
   end;
   trvMemoria.Alphasort;
   trvMemoria.items.Endupdate;

   { Adciona os titulo aos items  }
   For w_i:=0 to trvMemoria.Items.Count-1 Do
   Begin
      trvMemoria.items[w_i].selected := true;
      trvMemoria.items[w_i].Text := trvMemoria.items[w_i].Text;
   End;

End;
{ ---------------------------------------------------------------------------- }


{ Cálculo Atuarial ----------------------------------------------------------- }

Procedure TFrmSimulacaoCalcAtuarial.Inicializa_Campos_CDS;
Var N:Integer;
Begin
   cdsMassa_Calculo.Close;
   cdsMassa_Calculo.FieldDefs.Clear;

   { Cria os campos referentes ao participante }

   For N:=0 to qryParticipantes.FieldCount -1 do
      cdsMassa_Calculo.FieldDefs.Add(qryParticipantes.Fields[N].FieldName,
                                     qryParticipantes.Fields[N].DataType,
                                     qryParticipantes.Fields[N].Size,
                                     False);

   { Cria os campo de datas utilizadas pelo sistema para cada participante}

   If not qryDatas.Active Then qryDatas.Active := True;
   qryDatas.First;
   While Not qryDatas.EOF do
   Begin
      cdsMassa_Calculo.FieldDefs.Add('DT_' + qryDatas.FieldByName('IR_DOMINIO_SISTEMA').AsString, ftDate, 0, False);
      qryDatas.Next;
   End;

   { Cria os campo de valores utilizados pelo sistema para cada participante}

   If not qryValores.Active Then qryValores.Active := True;
   qryValores.First;
   While Not qryValores.EOF do
   Begin
      cdsMassa_Calculo.FieldDefs.Add('VLR_' + qryValores.FieldByName('CD_TIPO_VALOR').AsString, ftFloat, 0, False);
      qryValores.Next;
   End;

   { Cria os campo referentes as todas as hipoteses criadas no sistema }

   If not qryLista_Hipotese.Active Then qryLista_Hipotese.Active := True;
   qryLista_Hipotese.First;

   While Not qryLista_Hipotese.EOF do
   Begin
      If qryLista_Hipotese.FieldByName('IR_ITEM_HIPOTESE').AsString <> 'T' Then
         cdsMassa_Calculo.FieldDefs.Add('ITEM_' + UpperCase(qryLista_Hipotese.FieldByName('NO_VARIAVEL').AsString),
                                        ftString, 50, False);
      qryLista_Hipotese.Next;
   End;

   Popular_CDS_Calculo;
end;

Procedure TFrmSimulacaoCalcAtuarial.Popular_CDS_Calculo;
Var N:Integer;
Begin
   iVersao_M := 0;
   iVersao_F := 0;
   iVersao_P := 0;

   { Abre o CDS que será utilizado para passar, para o regra, as informações
     necessárias para o cálculo atuarial }

   cdsMassa_Calculo.CreateDataSet;

   { Popula o CDS com os campos de cada participante }

   While Not qryParticipantes.Eof do
   Begin
      cdsMassa_Calculo.Insert;

      For N:=1 to qryParticipantes.FieldCount -1 do
         cdsMassa_Calculo.FieldByName(qryParticipantes.Fields[N].FieldName).Value :=
                                             qryParticipantes.Fields[N].Value;



      { Popula o CDS com as datas utlizadas por cada participante }

      qryDt_Partic.Active := False;
      qryDt_Partic.ParamByName('CD_VERSAO').AsString := inttostr(WG_CD_VERSAO);
      qryDt_Partic.ParamByName('CD_PARTIC').AsString := qryParticipantes.FieldByName('CD_PARTIC').AsString;
      qryDt_Partic.Active := True;

      While Not qryDt_Partic.EOF do
      Begin
         cdsMassa_Calculo.FieldByName('DT_' + qryDt_Partic.FieldByName('IR_DOMINIO_SISTEMA').AsString).Value :=
                                      qryDt_Partic.FieldByName('DT_TEMPO').Value;
         qryDt_Partic.Next;
      End;

      { Popula o CDS com os valores utlizados por cada participante }

      qryValorParticipante.Active := False;
      qryValorParticipante.ParamByName('CD_VERSAO').AsString := inttostr(WG_CD_VERSAO);
      qryValorParticipante.ParamByName('CD_PARTIC').AsString := qryParticipantes.FieldByName('CD_PARTIC').AsString;
      qryValorParticipante.Active := True;

      While Not qryValorParticipante.EOF do
      Begin
         cdsMassa_Calculo.FieldByName('VLR_' + qryValorParticipante.FieldByName('CD_TIPO_VALOR').AsString).Value :=
                                      qryValorParticipante.FieldByName('VL_PARTICIPANTE').Value;
         qryValorParticipante.Next;
      End;

      { Popula o CDS com as hipoteses que seram utilizadas em um determinado cálculo }

      qryITM_Hipotese.Active := False;
      qryITM_Hipotese.ParamByName('CD_HIPOTESE').AsString := qryHipotese.FieldByName('CD_HIPOTESE').AsString;
      qryITM_Hipotese.Active := True;

      qryITM_Hipotese.First;
      While Not qryITM_Hipotese.EOF do
      Begin
         If qryITM_Hipotese.FieldByName('IR_ITEM_HIPOTESE').AsString <> 'T' Then
            cdsMassa_Calculo.FieldByName('ITEM_' + qryITM_Hipotese.FieldByName('NO_VARIAVEL').AsString).Value :=
                             qryITM_Hipotese.FieldByName('VL_HIPOTESE').Value
         Else
         Begin
            If Not qryITM_Hipotese.FieldByName('SQ_VERSAO_COMUTACAO_MAS').IsNull Then
               iVersao_M := qryITM_Hipotese.FieldByName('SQ_VERSAO_COMUTACAO_MAS').AsInteger;

            If Not qryITM_Hipotese.FieldByName('SQ_VERSAO_COMUTACAO_FEM').IsNull Then
               iVersao_F := qryITM_Hipotese.FieldByName('SQ_VERSAO_COMUTACAO_FEM').AsInteger;

            If Not qryITM_Hipotese.FieldByName('SQ_VERSAO_COMUTACAO_PEN').IsNull Then
               iVersao_P := qryITM_Hipotese.FieldByName('SQ_VERSAO_COMUTACAO_PEN').AsInteger;
         End;

         qryITM_Hipotese.Next;
      End;

      cdsMassa_Calculo.Post;

      qryParticipantes.Next;
   End;
End;

Procedure TFrmSimulacaoCalcAtuarial.OnGetResultLocal( Sender : TObject );
begin
//   ShowMessage( DtmInterfaceAtuarial.RegraMt.Result );
   inc(conta);
   Caption := IntToStr(Conta) + ' - ' + IntToStr(Total);
   Application.ProcessMessages;
   frmAnimacao.SetProgressBar( conta);
end;

{--------------------------------------------------------}
{Rotina para Atualizar Referencia de Calculo do Movimento}
procedure TFrmSimulacaoCalcAtuarial.GeraReferCalculo;
var w_i : Integer;   
begin
   With dtmBaseDados.dbBaseDados do
   Begin
      If not InTransaction then
         StartTransaction;

      Try
         //-- Grava referência do cálculo
         qryInsReferCalculo.Close;
         qryInsReferCalculo.ParamByName('DT_GERACAO').asdatetime         := w_dt_geracao;
         qryInsReferCalculo.ParamByName('CD_VERSAO').asinteger           := WG_CD_VERSAO;
         qryInsReferCalculo.ParamByName('CD_PESSOA_ENTID').asinteger     := WG_CD_PESSOA_ENTID;
         qryInsReferCalculo.ParamByName('CD_PESSOA_PATROC').asinteger    := WG_CD_PESSOA_PATROC;
         qryInsReferCalculo.ParamByName('CD_PLANO').asinteger            := WG_CD_PLANO;
         qryInsReferCalculo.ParamByName('CD_HIPOTESE').asinteger         := qryHipotese.FieldByName('CD_HIPOTESE').AsInteger;
         qryInsReferCalculo.ParamByName('DT_REFER_CALCULO').asdatetime   := w_dt_refer;
         qryInsReferCalculo.ParamByName('IR_CALCULO_EFETIVADO').asstring := 'N';
         qryInsReferCalculo.ExecSql;

         //-- Grava opção de grupos de participante
         For w_i := 1 to w_ocor_grupo do
            If ChckLstBxGrupoPart.checked[w_i-1]   then
            Begin
               qryOpcaoGrupo.Close;
               qryOpcaoGrupo.ParamByName('DT_GERACAO').asdatetime      := w_dt_geracao;
               qryOpcaoGrupo.ParamByName('CD_PESSOA_ENTID').asinteger  := WG_CD_PESSOA_ENTID;
               qryOpcaoGrupo.ParamByName('CD_VERSAO').asinteger        := WG_CD_VERSAO;
               qryOpcaoGrupo.ParamByName('CD_PESSOA_PATROC').asinteger := WG_CD_PESSOA_PATROC;
               qryOpcaoGrupo.ParamByName('CD_PLANO').asinteger         := WG_CD_PLANO;
               qryOpcaoGrupo.ParamByName('CD_GRUPO_PARTIC').asinteger  := w_tp_grupo[w_i];

               qryOpcaoGrupo.execsql;
            End;

            //-- Atualiza na base
            Commit;  
      Except
         on EDatabaseError do
         Begin
            Raise Exception.Create ('Erro na atualização da referência do cálculo atuarial');
            rollback;
            exit;
         End;
      End;
   End;
end;

{ ---------------------------------------------------------------------------- }


procedure TFrmSimulacaoCalcAtuarial.Prepara_GravaItem(vGrava : TDataSetState);
Begin
   BtnAnterior.Enabled      := False;
   BtnProximo.Enabled       := False;
   BtnEncerra.Caption       := 'Confirma';

   If PgCtrlEtapa.ActivePage = TbsItemHipotese then
   Begin
      sbtnAlterarItem.Enabled  := False;
      sbtnApagarItem.Enabled   := False;
      sbtnProcurarItem.Enabled := False;

      dbeDescricaoItem.SetFocus;

      If vGrava = dsInsert Then QryPrincItem.Insert;

      If vGrava = dsEdit Then QryPrincItem.Edit;
   End;

   If PgCtrlEtapa.ActivePage = TbsHipotese then
   Begin
      sbtnAlterarHipotese.Enabled  := False;
      sbtnApagarHipotese.Enabled   := False;
      sbtnProcurarHipotese.Enabled := False;

      dbeDescricaoHipotese.SetFocus;

      If vGrava = dsInsert Then qryPrincHipotese.Insert;

      If vGrava = dsEdit Then qryPrincHipotese.Edit;
   End;
End;

procedure TFrmSimulacaoCalcAtuarial.FormCreate(Sender: TObject);
Var w_i:Integer;
begin
   inherited;

   { Verifica se já foi escolhida uma versão da base }
   If uGlobal.WG_CD_VERSAO = 0 then
   Begin
      ShowMessage('Selecione primerio uma Versão da Base !');
      AbrirForm(frmVersaoBase,TfrmVersaoBase,False );
      close;
      exit;
   End;

   { Tira a Aba dos Tabsheets }
   TbsItemHipotese.TabVisible := False;
   TbsHipotese.TabVisible := False;
   TbsCalcAtuarial.TabVisible := False;
   TbsListaCalc.TabVisible := False;
   TbsMemoriaCalc.TabVisible := False;
   
   PgCtrlEtapa.ActivePage := TbsItemHipotese;

   { Referente a tab de Itens de Hipotese ------------------------------------}
   {--------------------------------------------------------------------------}
   If Not qryPrincItem.Active Then qryPrincItem.Open;
   If Not qryTabuaItem.Active Then qryTabuaItem.Open;

   { Referenta a tab de hipoteses --------------------------------------------}
   {--------------------------------------------------------------------------}

   If Not qryItem.Active            Then qryItem.Open;

   If Not qryPrincHipotese.Active   Then qryPrincHipotese.Open;
   If Not qryDetalheHipotese.Active Then qryDetalheHipotese.Open;

   If Not qryTabua_Mas.Active       Then qryTabua_Mas.Open;
   If Not qryTabua_Fem.Active       Then qryTabua_Fem.Open;
   If Not qryTabua_Pen.Active       Then qryTabua_Pen.Open;

   If Not qryRegra.Active           Then qryRegra.Open;  //ClaudioR - 16-05-06

   DbGrdDet.Visible  :=true;
   PnlDetalhe.Visible:=false;

   If (qryPrincHipotese.BOF) and (qryPrincHipotese.EOF) then
      PrincipalPost := false
   Else
      PrincipalPost := true;

   sbtnGerarHipotese.Enabled := sbtnAlterarHipotese.Enabled;

   { Referente a Tab de Cálculo Atuarial -------------------------------------}
   {--------------------------------------------------------------------------}

   If Not qryHipotese.Active       Then qryHipotese.open;
   If Not qryItemHipotese.Active   Then qryItemHipotese.Open;

   {Carrega opções de grupo de participantes}
   qryGrupoPartic.close;
   qryGrupoPartic.ParamByName('cd_pessoa_entid').asinteger  := WG_CD_PESSOA_ENTID;
   qryGrupoPartic.ParamByName('cd_pessoa_patroc').asinteger := WG_CD_PESSOA_PATROC;
   qryGrupoPartic.ParamByName('cd_plano').asinteger         := WG_CD_PLANO;
   qryGrupoPartic.open;

   w_i := 0;

   While not qryGrupoPartic.eof do
   Begin
      ChckLstBxGrupoPart.items.add(qryGrupoParticNO_GRUPO_PARTIC.asstring);
      w_i := w_i + 1;
      w_tp_grupo[w_i] := qryGrupoParticCD_GRUPO_PARTIC.asinteger;
      w_ocor_grupo := w_i;

      qryGrupoPartic.next;
   End;

   ChckLstBxGrupoPart.itemindex := 0;

   w_todos_grupos:= false;   

   { Referente a Tab de Memória de Cálculo -----------------------------------}
   {--------------------------------------------------------------------------}

   FieldList := TStringList.create;

   qryMemoria.Close;
   qryMemoria.ParamByName('CD_PESSOA_ENTID').asInteger := WG_CD_PESSOA_ENTID;
   qryMemoria.ParamByName('CD_PESSOA_PATROC').asInteger := WG_CD_PESSOA_PATROC;
   qryMemoria.ParamByName('CD_PLANO').asInteger := WG_CD_PLANO;
   qryMemoria.ParamByName('CD_VERSAO').asInteger := WG_CD_VERSAO;
   qryMemoria.Open;

   Atualiza_TreeView;

   FieldList.clear;
end;


procedure TFrmSimulacaoCalcAtuarial.FormShow(Sender: TObject);
begin
   inherited;
   TwCons.Etapa.Pos := 1;
end;

procedure TFrmSimulacaoCalcAtuarial.BtnProximoClick(Sender: TObject);
begin
   TwCons.Etapa.Avancar;

   If PgCtrlEtapa.ActivePageIndex  = PgCtrlEtapa.PageCount - 1 Then
      PgCtrlEtapa.ActivePageIndex := PgCtrlEtapa.PageCount - 1
   Else
      PgCtrlEtapa.ActivePageIndex := PgCtrlEtapa.ActivePageIndex + 1;
end;

procedure TFrmSimulacaoCalcAtuarial.BtnAnteriorClick(Sender: TObject);
begin
   TwCons.Etapa.Retornar;
   
   If PgCtrlEtapa.ActivePageIndex  = 0 Then
      PgCtrlEtapa.ActivePageIndex := 0
   Else
      PgCtrlEtapa.ActivePageIndex := PgCtrlEtapa.ActivePageIndex - 1;
end;

procedure TFrmSimulacaoCalcAtuarial.BtnCancelaClick(Sender: TObject);
begin
   inherited;

   BtnAnterior.Enabled      := True;
   BtnProximo.Enabled       := True;

   BtnEncerra.Caption       := 'Encerra';

   If PgCtrlEtapa.ActivePage = TbsItemHipotese Then
   Begin
      sbtnInserirItem.Enabled  := True;
      sbtnAlterarItem.Enabled  := True;
      sbtnApagarItem.Enabled   := True;
      sbtnProcurarItem.Enabled := True;

      sbtnInserirItem.Down     := False;
      sbtnAlterarItem.Down     := False;
      sbtnApagarItem.Down      := False;
      sbtnProcurarItem.Down    := False;

      QryPrincItem.Cancel;
   End;

   If PgCtrlEtapa.ActivePage = TbsHipotese Then
   Begin
      sbtnInserirHipotese.Enabled  := True;
      sbtnAlterarHipotese.Enabled  := True;
      sbtnApagarHipotese.Enabled   := True;
      sbtnProcurarHipotese.Enabled := True;

      sbtnInserirHipotese.Down     := False;
      sbtnAlterarHipotese.Down     := False;
      sbtnApagarHipotese.Down      := False;
      sbtnProcurarHipotese.Down    := False;

      qryPrincHipotese.Cancel;
   End;
end;

procedure TFrmSimulacaoCalcAtuarial.SpeedButton1Click(Sender: TObject);
begin
   inherited;

   If (trim(dbeDescricaoItem.text) = '') or
      (DBRdGrpNatureza.ItemIndex = 3)  then
      exit;

   If (SBtnInserirItem.Down) or (SBtnAlterarItem.Down) then
   Begin
      AbrirForm(FrmListaVariaveis,TFrmListaVariaveis,False );
      frmListaVariaveis.NoVariavel := '';
      frmListaVariaveis.Op := 'H';
   End;
end;

procedure TFrmSimulacaoCalcAtuarial.sbtnInserirItemClick(Sender: TObject);
begin
   inherited;

   Prepara_GravaItem(dsInsert);
end;

procedure TFrmSimulacaoCalcAtuarial.sbtnAlterarItemClick(Sender: TObject);
begin
   inherited;

   Prepara_GravaItem(dsEdit);
end;

procedure TFrmSimulacaoCalcAtuarial.sbtnProcurarItemClick(
  Sender: TObject);
begin
  MontaSelectItem.Executar;

  if (MontaSelectItem.ValoresChave.Count > 0) and
     (MontaSelectItem.ValoresChave[0] <> '') then
   QryPrincItem.Locate('CD_ITEM_HIPOTESE', MontaSelectItem.ValoresChave[0], []);

  sbtnProcurarItem.Down := False;
end;

procedure TFrmSimulacaoCalcAtuarial.BtnEncerraClick(Sender: TObject);
begin
   inherited;

   If BtnEncerra.Caption = 'Confirma' Then
   Begin
      try
         If Not dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.StartTransaction;

         If PgCtrlEtapa.ActivePage = TbsItemHipotese Then
            QryPrincItem.Post;

         If PgCtrlEtapa.ActivePage = TbsHipotese Then
            qryPrincHipotese.Post;

      Except
         On E:EDBEngineError do
         begin
            MostrarErro(E);
            dtmBaseDados.dbBaseDados.Rollback;
            Exit;
         End;
      End;
   End;

   BtnCancelaClick(sender);
end;

procedure TFrmSimulacaoCalcAtuarial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   inherited;

   qryPrincItem.Close;
   qryTabuaItem.Close;

   qryPrincHipotese.Close;
   qryDetalheHipotese.Close;
   qryItem.Close;
   qryTabua_Mas.Close;
   qryTabua_Fem.Close;
   qryTabua_Pen.Close;
   qryRegra.Close;

   qryHipotese.Close;
   qryItemHipotese.Close;
   qryGrupoPartic.Close;

   qryMemoria.Close;
end;

procedure TFrmSimulacaoCalcAtuarial.BtInsClick(Sender: TObject);
begin
   If PrincipalPost then
   Begin
      // Abaixa Botao
      BtIns.Down :=True;

      // Inabilita Botoes de Detalhe
      BtAlt.Enabled :=False;
      BtProc.Enabled:=False;
      BtExcl.Enabled:=False;

      // Esconde Grid Mostra Painel
      DbGrdDet.Visible  :=False;
      PnlDetalhe.Visible:=True;
      DBCmbBxItem.Enabled := true;
      DBCmbBxItem.SetFocus;

      DBCmbBxItem.Text := '';

      DBCmbBxTabua_Mas.Text := '';
      DBCmbBxTabua_Fem.Text := '';
      DBCmbBxTabua_Pen.Text := '';
      
      DBCmbBxItem.Enabled := true;

      // Inclui Novo Registro
      qryDetalheHipotese.Append;
   End
   Else
   Begin
      BtIns.Down := false;
      exit;
   End;
end;

procedure TFrmSimulacaoCalcAtuarial.btAltClick(Sender: TObject);
begin
   If PrincipalPost then
   Begin
      // Se Nao Houverem Registros de Detalhe, Sai
      If qryDetalheHipotese.RecordCount=0 then
      Begin
         BtAlt.Down := False;
         Exit;
      End;

      // Abaixa Botao
      BtAlt.Down    :=True;

      // Inabilita Botoes de Detalhe
      BtIns.Enabled :=False;
      BtProc.Enabled:=False;
      BtExcl.Enabled:=False;

      // Esconde Grid Mostra Painel
      DbGrdDet.Visible  :=False;
      PnlDetalhe.Visible:=True;

      qryItem.Locate('CD_ITEM_HIPOTESE', qryDetalheHipotese.FieldByName('CD_ITEM_HIPOTESE').Value , []);

      DBCmbBxItem.Text := qryDetalheHipotese.FieldByName('DS_ITEM_HIPOTESE').AsString;

      If qryItem.FieldByName('IR_ITEM_HIPOTESE').AsString <> 'T' then
         dbeVl_Hipotese.SetFocus
      Else
         DBCmbBxTabua_Mas.SetFocus;

      DBCmbBxTabua_Mas.Text := qryDetalheHipotese.FieldByName('DS_VERSAO_COMUTACAO_MAS').AsString;
      DBCmbBxTabua_Fem.Text := qryDetalheHipotese.FieldByName('DS_VERSAO_COMUTACAO_FEM').AsString;
      DBCmbBxTabua_Pen.Text := qryDetalheHipotese.FieldByName('DS_VERSAO_COMUTACAO_PEN').AsString;

      DBCmbBxItem.Enabled := false;

      // Alterar Registro
      qryDetalheHipotese.Edit;
   End
   Else
   Begin
      BtAlt.Down := False;
      exit;
   End;
end;

procedure TFrmSimulacaoCalcAtuarial.BtExclClick(Sender: TObject);
begin
   If PrincipalPost then
   Begin
      // Executa query de Detalhe
      With qryDetalheHipotese Do
      Begin
         // Se Nao Houverem Registros de Detalhe, Sai
         If qryDetalheHipotese.RecordCount=0 then
         Begin
            Exit;
         End;

         // Se Confirmar, Exclui Registro Posicionado
         If MessageBox(0,'Deseja realmente apagar este registro ?','Cálculo Atuarial',4) = IdYes Then
         Begin
            Delete;
            ApplyUpdates;
            CommitUpDates;
            Close;
            Open;
         End;
      End;
   End
   Else
      exit;
end;

procedure TFrmSimulacaoCalcAtuarial.BtProcClick(Sender: TObject);
begin
  // Muda Base de Dados e Executa Componente de Pesquisa
  SelDlgProcuraQry.DataSet:=qryDetalheHipotese;
  SelDlgProcuraQry.Execute;

  // Volta Base de Dados Anterior
  SelDlgProcuraQry.DataSet:=qryPrincHipotese;
end;

procedure TFrmSimulacaoCalcAtuarial.sbtnInserirHipoteseClick(
  Sender: TObject);
begin
   PrincipalPost := false;

   Prepara_GravaItem(dsInsert);
end;

procedure TFrmSimulacaoCalcAtuarial.sbtnAlterarHipoteseClick(
  Sender: TObject);
begin
   PrincipalPost := false;

   Prepara_GravaItem(dsEdit);
end;

procedure TFrmSimulacaoCalcAtuarial.sbtnProcurarHipoteseClick(
  Sender: TObject);
begin
   MontaSelectHipotese.Executar;

   If (MontaSelectHipotese.ValoresChave.Count > 0) and
      (MontaSelectHipotese.ValoresChave[0] <> '') then
      qryPrincHipotese.Locate('CD_HIPOTESE', MontaSelectHipotese.ValoresChave[0], []);

   sbtnProcurarHipotese.Down := False;
end;

procedure TFrmSimulacaoCalcAtuarial.qryDetalheHipoteseBeforePost(
  DataSet: TDataSet);
begin
   inherited;

   If BtIns.Down Then
   Begin
      qryDetalheHipotese.FieldByName('CD_HIPOTESE').asInteger :=
                          qryPrincHipotese.FieldByName('CD_HIPOTESE').asInteger;
      qryDetalheHipotese.FieldByName('CD_ITEM_HIPOTESE').asInteger :=
                              qryItem.FieldByName('CD_ITEM_HIPOTESE').asInteger;

      If trim(DBCmbBxTabua_Mas.Text) = '' then
         qryDetalheHipotese.FieldByName('SQ_VERSAO_COMUTACAO_MAS').Value := null
      Else
         qryDetalheHipotese.FieldByName('SQ_VERSAO_COMUTACAO_MAS').asInteger :=
                      qryTabua_Mas.FieldByName('SQ_VERSAO_COMUTACAO').asInteger;

      If trim(DBCmbBxTabua_Fem.Text) = '' then
         qryDetalheHipotese.FieldByName('SQ_VERSAO_COMUTACAO_FEM').Value := null
      Else
         qryDetalheHipotese.FieldByName('SQ_VERSAO_COMUTACAO_FEM').asInteger :=
                      qryTabua_Fem.FieldByName('SQ_VERSAO_COMUTACAO').asInteger;

      If trim(DBCmbBxTabua_Pen.Text) = '' then
         qryDetalheHipotese.FieldByName('SQ_VERSAO_COMUTACAO_PEN').Value := null
      Else
         qryDetalheHipotese.FieldByName('SQ_VERSAO_COMUTACAO_PEN').asInteger :=
                      qryTabua_Pen.FieldByName('SQ_VERSAO_COMUTACAO').asInteger;
   End
   Else
      If BtAlt.Down Then
      Begin
         If trim(DBCmbBxTabua_Mas.Text) = '' then
            qryDetalheHipotese.FieldByName('SQ_VERSAO_COMUTACAO_MAS').Value := null
         Else
            qryDetalheHipotese.FieldByName('SQ_VERSAO_COMUTACAO_MAS').asInteger :=
                      qryTabua_Mas.FieldByName('SQ_VERSAO_COMUTACAO').asInteger;

         If trim(DBCmbBxTabua_Fem.Text) = '' then
            qryDetalheHipotese.FieldByName('SQ_VERSAO_COMUTACAO_FEM').Value := null
         Else
            qryDetalheHipotese.FieldByName('SQ_VERSAO_COMUTACAO_FEM').asInteger :=
                      qryTabua_Fem.FieldByName('SQ_VERSAO_COMUTACAO').asInteger;

         If trim(DBCmbBxTabua_Pen.Text) = '' then
            qryDetalheHipotese.FieldByName('SQ_VERSAO_COMUTACAO_PEN').Value := null
         Else
            qryDetalheHipotese.FieldByName('SQ_VERSAO_COMUTACAO_PEN').asInteger :=
                      qryTabua_Pen.FieldByName('SQ_VERSAO_COMUTACAO').asInteger;
      End;   
end;

procedure TFrmSimulacaoCalcAtuarial.bbtnOkDetClick(Sender: TObject);
begin
   If trim(DBCmbBxItem.Text) = '' then
   Begin
      ShowMessage('Informe um Ítem de Hipótese');
      DBCmbBxItem.SetFocus;
      exit;
   End;

   If qryItem.FieldByName('IR_ITEM_HIPOTESE').asString = 'T' then
      If (qryTabua_MAS.RecordCount > 0) and
         (trim(DBCmbBxTabua_Mas.Text) = '') and
         (trim(DBCmbBxTabua_Fem.Text) = '') and
         (trim(DBCmbBxTabua_Pen.Text) = '') then
      Begin
         ShowMessage('Informe uma Tábua');
         DBCmbBxTabua_Mas.SetFocus;
         exit;
      End;

   With qryDetalheHipotese do
   Begin
      Try
         Post;
         ApplyUpDates;
         CommitUpDates;
      Except
         bbtnCancelarDet.Click;
         exit;
      End;
   End;

   bbtnCancelarDet.Click;
end;

procedure TFrmSimulacaoCalcAtuarial.DBCmbBxItemChange(Sender: TObject);
begin
   If qryItem.FieldByName('IR_ITEM_HIPOTESE').asString <> 'T' then
   Begin
      plTabua.Visible := False;
      plValor.Visible := True;

      dbeVl_Hipotese.Enabled := True
   End
   Else
   Begin
      plTabua.Visible := True;
      plValor.Visible := False; 

      dbeVl_Hipotese.Enabled := False;
   End
end;

procedure TFrmSimulacaoCalcAtuarial.bbtnCancelarDetClick(Sender: TObject);
begin
   // Levanta Botoes
   BtIns.Down :=False;
   BtAlt.Down :=False;

   // Inabilita Botoes
   BtIns.Enabled :=True;
   BtAlt.Enabled :=True;
   BtProc.Enabled:=True;
   BtExcl.Enabled:=True;

   // ReExecuta a Query
   qryDetalheHipotese.Close;
   qryDetalheHipotese.Open;

   // Mostra Grid
   PnlDetalhe.Visible:=False;
   DbGrdDet.Visible  :=True;
end;

procedure TFrmSimulacaoCalcAtuarial.sbtnGerarHipoteseClick(
  Sender: TObject);
begin
   SBtnGerarHipotese.Down := false;
   If qryPrincHipotese.IsEmpty then
      exit;

   dtmRelatsAtuarial.qryEmiteHipotese.ParamByName('CD_HIPOTESE').asInteger :=
                          qryPrincHipotese.FieldByName('CD_HIPOTESE').asInteger;
   dtmRelatsAtuarial.qryEmiteHipotese.Open;
   dtmRelatsAtuarial.rpHipotese.Print;
   dtmRelatsAtuarial.qryEmiteHipotese.Close;
end;

procedure TFrmSimulacaoCalcAtuarial.DBLkpCmbBxHipoteseCloseUp(
  Sender: TObject);
begin
   bbtnAddLista.Enabled := true;
end;

procedure TFrmSimulacaoCalcAtuarial.Limpa_OpcaoParaCalculo;
Var N:Integer;
Begin
   For N:=0 to ChckLstBxGrupoPart.Items.Count -1 do
      ChckLstBxGrupoPart.Checked[N] := False;

   DBLkpCmbBxHipotese.KeyValue := '';

   RadioGroupTipoCalculo.ItemIndex := 1;

   bbtnAddLista.Enabled := False;
End;

procedure TFrmSimulacaoCalcAtuarial.bbtnAddListaClick(Sender: TObject);
Var w_Individual, w_grupo_sql:String;
    w_opcao:boolean;
    w_i, w_Posicao:Integer;
begin
   { Calculo individual }
   w_Individual := '';
   If  RadioGroupTipoCalculo.ItemIndex = 0 then
   Begin
      frmProcura := TfrmProcura.create(application);
      frmProcura.DataSet := qryProcura;
      frmProcura.Form := 'Calculo';
      frmProcura.CD_VERSAO := inttostr(WG_CD_VERSAO);
      w_cd_partic := 0;
      frmProcura.ShowModal;

      If w_cd_partic = 0 then
      Begin
         frmProcura.free;
         Raise Exception.Create ('Selecione um Participante para realizar o cálculo');
      End;

      w_Individual := IntToStr(w_cd_partic);

      frmProcura.free;
   End;

   { Calculo para grupos }
   If  RadioGroupTipoCalculo.ItemIndex = 0 then
   Else
   Begin
      w_opcao := false;
      w_grupo_sql := ' ';

      For w_i := 1 to w_ocor_grupo do
         If ChckLstBxGrupoPart.checked[w_i-1]   then
         Begin
            w_grupo_sql := w_grupo_sql + inttostr(w_tp_grupo[w_i]) + ', ';
            w_opcao := true;
         End;

      If (not w_opcao) And (w_Individual = '') then
         Raise Exception.Create ('Selecione pelo menos um grupo de Participantes ou um Participante Individual');

      If w_opcao then
         w_grupo_sql := copy(w_grupo_sql, 1, length(w_grupo_sql) - 2);
   End;

   If cdsListaCalculo.IsEmpty Then
      w_Posicao := 10
   Else
   Begin
      cdsListaCalculo.Last;
      w_Posicao := cdsListaCalculo.FieldByName('NR_POSICAO').AsInteger + 10;
      cdsListaCalculo.First;
   End;

   cdsListaCalculo.Append;
   cdsListaCalculo.FieldByName('IR_CALCULA').AsBoolean  := True;
   cdsListaCalculo.FieldByName('NO_HIPOTESE').AsString  := qryHipotese.FieldByName('DS_HIPOTESE').AsString;
   cdsListaCalculo.FieldByName('NR_POSICAO').AsInteger  := w_Posicao;
   cdsListaCalculo.FieldByName('CD_HIPOTESE').AsInteger := qryHipotese.FieldByName('CD_HIPOTESE').AsInteger;
   cdsListaCalculo.FieldByName('CD_PARTIC').AsString    := w_Individual;
   cdsListaCalculo.FieldByName('CD_GRUPO').AsString     := w_Grupo_SQL;
   cdsListaCalculo.Post;

   Limpa_OpcaoParaCalculo;
end;

procedure TFrmSimulacaoCalcAtuarial.SpeedButton2Click(Sender: TObject);
Var iIdCalculo : Integer;
    bErro:Boolean;
begin
   Screen.Cursor := crSQLWait;

   Application.CreateForm(TfrmAnimacao, frmAnimacao);

   Try
      With cdsListaCalculo do
      Begin
         First;
         While not EOF do
         Begin
            Conta := 1;
            w_dt_refer   := refer_base;
            w_dt_geracao := now;

            { Localiza os Participantes para um Cálculo }

            qryParticipantes.Close;

            qryParticipantes.SQL[1] := QuotedStr(DateTimeToStr(w_dt_geracao)) +
                                                           ' AS "DT_GERACAO", ';

            If FieldByName('CD_PARTIC').AsString <> '' Then
               qryParticipantes.SQL[75] := 'and P.CD_PARTIC = ' + FieldByName('CD_PARTIC').AsString
            Else
               qryParticipantes.SQL[75] := 'and P.CD_GRUPO_CALCULO in (' + FieldByName('CD_GRUPO').AsString + ')';

            qryParticipantes.ParamByName('CD_PLANO').asinteger  := WG_CD_PLANO;
            qryParticipantes.ParamByName('CD_VERSAO').asinteger := WG_CD_VERSAO;
            qryParticipantes.open;

            Total := qryParticipantes.RecordCount;
            frmAnimacao.SetAnimacao ('Realizando cálculo atuarial ...',Total,True,True,aviCopyFiles);

            { Retorna os items utilizados pela hipótese }
            QryItemHipotese.Close;
            QryItemHipotese.ParamByName('CD_HIPOTESE').AsInteger := qryHipotese.FieldByName('CD_HIPOTESE').AsInteger;
            QryItemHipotese.Open;

            If qryParticipantes.recordcount = 0 then
               Raise Exception.Create ('Falta cadastrar Participantes para o cálculo desejado');

            { Inicializa os campos e popula a tabela virtual para ser utilizado no regra }
            Inicializa_Campos_CDS;

            cdsMassa_Calculo.SaveToFile('c:\massadeteste.cds');

            GeraReferCalculo;

            DtmInterfaceAtuarial.ExecutaRegra(qryHipotese.FieldByName('IDREGRA').AsInteger,
                                              cdsMassa_Calculo,
                                              iVersao_M, iVersao_F, iVersao_P, iIdCalculo ,
                                              bErro, True, False, OnGetResultLocal );

            Next;
         End;
      End;
   Finally
      Screen.Cursor := crDefault;

      cdsListaCalculo.EmptyDataSet;
      Limpa_OpcaoParaCalculo;

      qryMemoria.Close;
      qryMemoria.ParamByName('CD_PESSOA_ENTID').asInteger := WG_CD_PESSOA_ENTID;
      qryMemoria.ParamByName('CD_PESSOA_PATROC').asInteger := WG_CD_PESSOA_PATROC;
      qryMemoria.ParamByName('CD_PLANO').asInteger := WG_CD_PLANO;
      qryMemoria.ParamByName('CD_VERSAO').asInteger := WG_CD_VERSAO;
      qryMemoria.Open;

      frmAnimacao.Close;
      frmAnimacao.Free;

      Atualiza_TreeView;
   End;
end;

procedure TFrmSimulacaoCalcAtuarial.ReOrganiza_Lista;
Var w_Posicao:Integer;
Begin
   dsListaCalculo.DataSet := Nil;

   w_Posicao := cdsListaCalculo.RecordCount * 10;

   cdsListaCalculo.Last;
   While Not cdsListaCalculo.BOF do
   Begin
      Dec(w_Posicao, 10);

      cdsListaCalculo.Edit;
      cdsListaCalculo.FieldByName('NR_POSICAO').AsInteger := w_Posicao + 10;
      cdsListaCalculo.Post;

      cdsListaCalculo.Prior;
   End;

   dsListaCalculo.DataSet := cdsListaCalculo;
End;

procedure TFrmSimulacaoCalcAtuarial.sbtSobeClick(Sender: TObject);
Var Guarda:String;
begin
   inherited;

   With cdsListaCalculo do
   Begin
      Guarda := FieldByName('NO_HIPOTESE').AsString;
      If FieldByName('NR_POSICAO').AsInteger > 10 Then
      Begin
         Edit;
         FieldByName('NR_POSICAO').AsInteger := FieldByName('NR_POSICAO').AsInteger - 15;
         Post;
      End;
   End;
   ReOrganiza_Lista;
   cdsListaCalculo.Locate('NO_HIPOTESE', Guarda, []);
end;

procedure TFrmSimulacaoCalcAtuarial.sbtDesceClick(Sender: TObject);
Var Guarda:String;
begin
   inherited;
   With cdsListaCalculo do
   Begin
      Guarda := FieldByName('NO_HIPOTESE').AsString;
      If Not EOF Then
      Begin
         Edit;
         FieldByName('NR_POSICAO').AsInteger := FieldByName('NR_POSICAO').AsInteger + 15;
         Post;
      End;
   End;
   ReOrganiza_Lista;
   cdsListaCalculo.Locate('NO_HIPOTESE', Guarda, []);
end;

procedure TFrmSimulacaoCalcAtuarial.RadioGroupTipoCalculoClick(
  Sender: TObject);
Var N:Integer;
Begin
   If RadioGroupTipoCalculo.ItemIndex = 0 then
   Begin
      For N:=0 to ChckLstBxGrupoPart.Items.Count -1 do
         ChckLstBxGrupoPart.Checked[N] := False;

      GrpBxGrupos.Enabled := false;
   End
   Else
      GrpBxGrupos.Enabled := true;
end;

procedure TFrmSimulacaoCalcAtuarial.SpdBttnGrupoPartClick(
  Sender: TObject);
var N: integer;
begin
   If w_todos_grupos  then
   Begin
      w_todos_grupos := false;
      For N:=0 to ChckLstBxGrupoPart.Items.Count -1 do
         ChckLstBxGrupoPart.checked[N] := False;
   End
   Else
   Begin
      w_todos_grupos := true;
      For N:=0 to ChckLstBxGrupoPart.Items.Count -1 do
         ChckLstBxGrupoPart.checked[N] := True;
   End;
end;

procedure TFrmSimulacaoCalcAtuarial.trvMemoriaChange(Sender: TObject;
  Node: TTreeNode);
begin
   dsMemoria.enabled := Node.data <> nil;

   bbtReCalculo.Enabled := False;
   bbtnBuscar.Enabled   := False;
   bbtnEfetivar.Enabled := False;
   bbtnExcluir.Enabled  := False;

   If dsMemoria.enabled then
   Begin
      qryMemoria.GotoBookmark(node.data);

      bbtReCalculo.Enabled := True;
      bbtnBuscar.Enabled   := True;
      bbtnExcluir.Enabled  := True;

      If qryMemoria.FieldByName('IR_CALCULO_EFETIVADO').AsString = 'Não efetivado' Then
         bbtnEfetivar.Enabled := True;
   End;
end;

procedure TFrmSimulacaoCalcAtuarial.bbtnBuscarClick(Sender: TObject);
begin
   if qryMemoria.isEmpty then
      exit;

   frmProcura := TfrmProcura.create(application);
   frmProcura.DataSet := qryAuxMemoria;
   frmProcura.Form := 'MemoriaCalculo';
   frmProcura.CD_VERSAO := intToStr(WG_CD_VERSAO);
   frmProcura.DT_GERACAO := DateTimeToStr(qryMemoria.FieldByName('DT_GERACAO').asDateTime);

   frmProcura.ShowModal;

   frmProcura.free;
end;

{ Localiza os grupos que foram utilizados para aquele cálculo }
function TFrmSimulacaoCalcAtuarial.Localiza_Grupos_Participantes(vDT_GERACAO:TDateTime):TStringList;
Var qry:TwwQuery;
    lstGrupo:TStringList;
begin
   qry := TwwQuery.Create(nil);
   lstGrupo := TStringList.Create;

   qry.Close;
   qry.DatabaseName := 'BaseDados';
   qry.SQL.Clear;
   qry.sql.Add('select distinct DT_GERACAO, CD_GRUPO_PARTIC');
   qry.sql.Add('from   FI_OCOR_CALCULO_ATUARIAL');
   qry.sql.Add('where  DT_GERACAO = :DT_GERACAO');
   qry.sql.Add('order by DT_GERACAO desc  ');
   qry.ParamByName('DT_GERACAO').AsDateTime := vDT_GERACAO;
   qry.Open;

   lstGrupo.Clear;
   while not qry.Eof do
   Begin
      lstGrupo.Add(qry.FieldByname('CD_GRUPO_PARTIC').AsString);

      qry.next;
   End;

   Result := lstGrupo;
   FreeAndNil(qry);
end;

{ Retorna a posição do grupo na lista}
Function TFrmSimulacaoCalcAtuarial.PegaGrupo(vGrupo:Integer):Integer;
Var N:Integer;
Begin
   For N:=0 to 50 do
     If w_tp_grupo[N] = vGrupo Then
        Result := N-1;
End;

procedure TFrmSimulacaoCalcAtuarial.bbtReCalculoClick(Sender: TObject);
Var N, vCheck:Integer;
    lstGrupo:TStringList;
begin
   inherited;

   DBLkpCmbBxHipotese.KeyValue := qryMemoria.FieldByName('CD_HIPOTESE').AsInteger;

   DBLkpCmbBxHipotese.Enabled    := False;
   RadioGroupTipoCalculo.Enabled := False;

   bbtnAddLista.Enabled := True;

   lstGrupo := TStringList.Create;
   lstGrupo := Localiza_Grupos_Participantes(qryMemoria.FieldByName('DT_GERACAO').AsDateTime);

   For N:=0 to ChckLstBxGrupoPart.Items.Count-1 do
       ChckLstBxGrupoPart.Checked[N] := False;

   For N:=0 to lstGrupo.Count -1 do
   Begin
      vCheck := PegaGrupo(StrToInt(lstGrupo[N]));
      ChckLstBxGrupoPart.Checked[vCheck] := True;
   end;

   ssbReCalcHipote.Visible := True;

   PgCtrlEtapa.ActivePage := TbsCalcAtuarial;
end;

procedure TFrmSimulacaoCalcAtuarial.bbtnEfetivarClick(Sender: TObject);
var Node: TTreeNode;
begin
   qryEfetivaCalculo.ExecSQL;

   Node := trvMemoria.Selected;
   Node.Delete;

   qryMemoria.Close;
   qryMemoria.Open;

   Atualiza_TreeView;
end;

procedure TFrmSimulacaoCalcAtuarial.bbtnExcluirClick(Sender: TObject);
Var CascadeDeleteLevel : Integer;
    Node: TTreeNode;
begin
   if MessageBox(0,'Deseja realmente apagar este registro ?','Cálculo Atuarial',4) <> IdYes Then
      exit;

   qryOcorCalculo.ExecSQL;

   qryOpcaoCalculo.ExecSQL;

   qryCalculo.ParamByName('DT_GERACAO').AsDateTime      := qryMemoria.FieldByName('DT_GERACAO').AsDateTime;
   qryCalculo.ParamByName('CD_PESSOA_ENTID').AsInteger  := qryMemoria.FieldByName('CD_PESSOA_ENTID').AsInteger;
   qryCalculo.ParamByName('CD_PESSOA_PATROC').AsInteger := qryMemoria.FieldByName('CD_PESSOA_PATROC').AsInteger;
   qryCalculo.ParamByName('CD_PLANO').AsInteger         := qryMemoria.FieldByName('CD_PLANO').AsInteger;
   qryCalculo.ParamByName('CD_VERSAO').AsInteger        := qryMemoria.FieldByName('CD_VERSAO').AsInteger;
   qryCalculo.ExecSQL;

   qryMemoria.Close;
   qryMemoria.Open;

   trvMemoria.Items.Clear;
   Atualiza_TreeView;

   ShowMessage('Memória de cálculo excluida com sucesso !');
end;

procedure TFrmSimulacaoCalcAtuarial.ssbReCalcHipoteClick(Sender: TObject);
begin
   inherited;
   AbrirFormModal(FrmVerHipoteses, TFrmVerHipoteses);
end;

procedure TFrmSimulacaoCalcAtuarial.sbtnApagarItemClick(Sender: TObject);
begin
   If MessageBox(0,'Deseja realmente apagar esta Hipótese de Cálculo?','Cálculo Atuarial',4) <> IdYes Then
   Begin
      sbtnApagarItem.Down := false;
      exit;
   End;

   sbtnApagarItem.Down := false;

   qryPrincItem.Delete;
   qryPrincItem.ApplyUpdates;
   qryPrincItem.CommitUpdates;
end;

procedure TFrmSimulacaoCalcAtuarial.sbtnApagarHipoteseClick(
  Sender: TObject);
begin
   If qryDetalheHipotese.RecordCount > 0 then
   Begin
     If MessageBox(0,'Deseja apagar todas as Ocorrências?','Cálculo Atuarial',4) = IdYes Then
     Begin
        Repeat
           qryDetalheHipotese.Delete;
           qryDetalheHipotese.ApplyUpdates;
           qryDetalheHipotese.CommitUpdates;
           qryDetalheHipotese.Close;
           qryDetalheHipotese.Open;
        Until qryDetalheHipotese.RecordCount = 0;
     End
     Else
     Begin
        sbtnApagarHipotese.Down := false;
        exit;
     End;
   End
   Else
      If MessageBox(0,'Deseja realmente apagar esta Hipótese de Cálculo?','Cálculo Atuarial',4) <> IdYes Then
      Begin
         sbtnApagarHipotese.Down := false;
         exit;
      End;

   sbtnApagarHipotese.Down := false;
   qryPrincHipotese.Delete;
   qryPrincHipotese.ApplyUpdates;
   qryPrincHipotese.CommitUpdates;
   sbtnApagarHipotese.Down := false;

   If qryPrincHipotese.RecordCount = 0 then
   Begin
      PrincipalPost := false;
      sbtnProcurarHipotese.Click;
      sbtnGerarHipotese.Enabled := false;
   End
   Else
   Begin
      PrincipalPost := true;
      sbtnGerarHipotese.Enabled := true;
   End;
end;

end.
