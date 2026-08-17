//************************************************************************************************//
// Data      : 01/08/2007
// Código    : AL_6
// Pendencia : 24796
// SOL       : 46743
// Descrição : A expansão da composição dos ativos passa obedecer ao flag
//************************************************************************************************//
// Data      : 18/07/2007
// Código    : AL_5
// Descrição : Criação do fluxo de memória de cálculo
//************************************************************************************************//
// Data      : 26/01/2007
// Código    : AL_4
// Pendencia : 22362
// SOL       : 43207
// Descrição : Retirando a variável com "array" de idativos das queries, nenhum banco faz a
//              cláusula IN com mais de 1000 itens
//************************************************************************************************//
// Data      : 12/08/2005
// Pendencia : 22803
// Código    : AL_3
// Descrição : Não dividir quando o valor for Zero
//************************************************************************************************//
// Data      : 12/08/2005
// Código    : AL_2
// Descrição : Passa a calcular o Indicador junto com os ativos
//************************************************************************************************//
// Data      : 04/08/2005
// Código    : AL_1
// Descrição : Ajuste para inversão da ordem de Plano e Patrocinadora
//             Implementação de novo botão com submenu para seleção de relatório Expandido
//************************************************************************************************//

unit fConsultaPerfil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls,
  Db, DBClient, FProgresso, uMensErro, uCtrlPerfilCota, dBaseDAdos,uSistema,uCMClientDataSet, ImgList,
  MontaSelect, Menus, Wwdatsrc, Mask, wwdbedit, DBCtrls,
  wwdbdatetimepicker, uCtrlHstMovCota, CMDateTimePicker, wwdblook, CMDBLookupCombo,
  uCmSqlParams, uCtrlPlanPrevContabPatro, uVerificaPreenchimento, Grids,
  Wwdbigrd, Wwdbgrid, uCtrlCotaCotacao, Spin, TREdit, URegra, DBTables,
  IBCustomDataSet, IBQuery, IBUpdateSQL, uCtrlCarteiraSPC, IBDatabase,
  TeEngine, Series, TeeProcs, Chart, DBChart, ppComm, ppRelatv, ppProd,
  ppClass, ppReport, ppChrtDP, FPreview, ppPrnabl, ppCtrls, ppChrt, ppBands, ppCache,
  ppDB, ppDBPipe, Wwquery, ppModule, raCodMod, ppStrtch, ppSubRpt, uRegraMT, uCtrlListTerceiros,
  TB97Ctls;

type
   TItem = record
      IDAtivoCota : Integer;
      iIdCarteiraSPC: Integer;
      NoPerfil    : TTreeNode;
      NoCota      : TTreeNode;
      CodHierarq  : string;
      sDescricao  : string;

   end;

   pItem = ^TItem;

   TfrmConsultaPerfil = class(TfrmWizardMT)
      Panel1: TPanel;
      pnlCalCota: TPanel;
      trvCotas: TTreeView;
      pnlPerfil: TPanel;
      trvPerfil: TTreeView;
      pnlBotoes: TPanel;
      btPassaUm: TSpeedButton;
      btVoltaUm: TSpeedButton;
      btPassaTodos: TSpeedButton;
      btVoltaTodos: TSpeedButton;
      CdsNoperfilCota: TCMClientDataSet;
      CdsNoPerfilXativo: TCMClientDataSet;
      imgTreeView: TImageList;
      CdsPerfilCota: TCMClientDataSet;
      ImlPadrao: TImageList;
      MontaSelect: TMontaSelect;
      ds: TwwDataSource;
      CdsPlano: TCMClientDataSet;
      CdsPatro: TCMClientDataSet;
      CdsPerfilCotaDESCRICAO: TStringField;
      CdsPerfilCotaTIPOPERFIL: TStringField;
      CdsCotaCotacao: TCMClientDataSet;
      dsCotaCotacao: TwwDataSource;
    PagControlAbas: TPageControl;
      Pag1: TTabSheet;
      dbGrd: TwwDBGrid;
      Pag2: TTabSheet;
      CdsCotaCotacaoATIVO: TStringField;
      CdsCotaCotacaoVLRPATRIMONIO: TFloatField;
      CdsCotaCotacaoQTDCOTA: TFloatField;
      CdsCotaCotacaoDATA: TDateTimeField;
      CdsCotaCotacaoPLANO: TStringField;
      CdsAtivosAConsolidar: TCMClientDataSet;
      CdsRegraIndex: TCMClientDataSet;
      CdsRegraJuros: TCMClientDataSet;
      dbGridTotalDiario: TwwDBGrid;
      CdsEspecAtivos: TCMClientDataSet;
      Panel2: TPanel;
      Panel3: TPanel;
    tshIndicadores: TTabSheet;
      pgCalculo: TTabSheet;
      Button1: TButton;
    Panel5: TPanel;
    pnlConsulta: TPanel;
    Label1: TLabel;
    Label7: TLabel;
    GroupBox4: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    edDtInicio: TCMDateTimePicker;
    edDtFim: TCMDateTimePicker;
    cmbPlano: TCMDBLookupCombo;
    cmbPatro: TCMDBLookupCombo;
    GroupBox5: TGroupBox;
    Label14: TLabel;
    edPerfil: TwwDBEdit;
    edTipo: TwwDBEdit;
    BitBtn1: TBitBtn;
    rdPerfil: TRadioGroup;
    pnlIndicador: TPanel;
    Label2: TLabel;
    cmbRegraIndex: TCMDBLookupCombo;
    Label3: TLabel;
    cboRegraJuros: TCMDBLookupCombo;
    Label4: TLabel;
    edTxJuros: TDBRealEdit;
    Label5: TLabel;
    sePercentual: TSpinEdit;
    regIndicadores: TRegraMT;
    btExecRegra: TBitBtn;
    thsGrafico: TTabSheet;
    dbGrafico: TDBChart;
    Series1: TLineSeries;
    pnlValores: TPanel;
    pnlIndJuros: TPanel;
    pnlPerSInd: TPanel;
    pnlTitPerSInd: TPanel;
    pnlNomeInd: TPanel;
    Panel9: TPanel;
    Panel8: TPanel;
    pnlValorizacao: TPanel;
    Panel6: TPanel;
    pnlTxJuros: TPanel;
    Panel7: TPanel;
    CbxPlanoSPC: TCheckBox;
    pmnRelatorio: TPopupMenu;
    smnuNormal: TMenuItem;
    smnuExpandido: TMenuItem;
    btRelatorio: TToolbarButton97;

      procedure btPassaUmClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure btProcurarClick(Sender: TObject);
      procedure btPassaTodosClick(Sender: TObject);
      procedure btVoltaUmClick(Sender: TObject);
      procedure btVoltaTodosClick(Sender: TObject);
      procedure btnConfirmarClick(Sender: TObject);
      procedure btnVoltarClick(Sender: TObject);
      procedure cmbPlanoEnter(Sender: TObject);
      procedure cmbPatroEnter(Sender: TObject);
      procedure dbGrdCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure dbGrdTopRowChanged(Sender: TObject);
      procedure CdsPerfilCotaTIPOPERFILGetText(Sender: TField; var Text: String; DisplayText: Boolean);
      procedure rdTipoPlanoClick(Sender: TObject);
      procedure dbGrdTitleButtonClick(Sender: TObject; AFieldName: String);
      procedure rdPerfilClick(Sender: TObject);
      procedure trvPerfilDblClick(Sender: TObject);
      procedure trvCotasDblClick(Sender: TObject);
      procedure dbGridTotalDiarioTitleButtonClick(Sender: TObject; AFieldName: String);
      procedure btExecRegraClick(Sender: TObject);

      procedure CbxPlanoSPCClick(Sender: TObject);

      // ROTINA PARA TRATAR COMPONENTES QUANDO CHECADO
      procedure ChecaPlanoSPC(Const bCheck : Boolean);
    procedure cmbPatroCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure smnuNormalClick(Sender: TObject);
    procedure smnuExpandidoClick(Sender: TObject);

   private  // Private declarations

      //  Controls...
      CtrlPerfilCota : TCtrlPerfilCota;
      CtrlCotaCotacao: TCtrlCotaCotacao;
      CtrlCarteiraSPC: TCtrlCarteiraSPC;

      CtrlHstMovCota : TCtrlHstMovCota;
      CtrlPlanPrevContabPatro: TCtrlPlanPrevContabPatro;

      CtrlListTerceiros : TCtrlListTerceiros;

      //  Variável Global
      ProgressoTotal : Integer;

      function  InserePasta(EumaPasta: Boolean; Arvore: TTreeView; NoDestino: TTreeNode; pDesc: pItem): TTreeNode;
      function  AcharNo(Arvore: TTreeView; sCodHierarq: string): TTreeNode;
      function  AcharPapel(Arvore: TTreeView; iIdPapel: Integer): Boolean;
      function  CriaCaminhoNo(NoEmFoco: TTreeNode; ArvOrigem,ArvDestino: TTreeView): TTreeNode;
      function  VerificaPreenchimento : Boolean;
      function  ContaItemsNo(No: TTreeNode) : Integer;
      function  VerificaSeTemAtivo(Arvore: TTreeView) : Boolean;
      function  TrocaPontoOuVirgula(bPonto: Boolean; sValor: string): string;
      function  ExecutaRegra(Regra: TRegraMT;
                             sDtInicio,sDtFim,sJuros,sPercentual: string): Boolean;

      procedure MensErroMt         (sMsgInfo: string);
      procedure InserePapel        (Arvore: TTreeView; NoDestino: TTreeNode; pDesc: pItem);
      procedure MontaArvorePerfil  (iIdPerfilCota: integer);
      Procedure MontarAtivos       (const Arvore: TTreeView; iIdPerfilCota : Integer = -1);
      Procedure MontarAtivosSPC    (const Arvore: TTreeView; iIdPerfilCota : integer = -1);
      Procedure MontarInvestimento (const Arvore: TTreeView; const nTreeNode: TTreeNode; iIdPerfilCota : Integer);
      Procedure MontarEmprestimo   (const Arvore: TTreeView; const nTreeNode: TTreeNode; iIdPerfilCota : Integer);
      Procedure MontarImobiliario  (const Arvore: TTreeView; const nTreeNode: TTreeNode; iIdPerfilCota : Integer);
      Procedure MontarCotas        (const Arvore: TTreeView; const nTreeNode: TTreeNode; iIdPerfilCota : Integer);
      Procedure MontaNoRFRV        (const Arvore: TTreeView; const sRFRV : string; nTreeNodePai : TTreeNode; iIdPerfilCOta : Integer);
      Procedure MontaNoFundos      (const Arvore: TTreeView; const sFundo: string; nTreeNodePai : TTreeNode; iIdPerfilCOta : Integer);
      Procedure InsereCodHierarq   (const Arvore: TTreeView);
      procedure MoveArvore         (ArvOrigem,ArvDestino: TTreeView);
      procedure PassaNo            (No: TTreeNode; ArvOrigem,ArvDestino: TTreeView) ;
      procedure ExcluiPastaVazia   (Arvore: TTreeView);
      procedure ImprimeRel(Const bExpandido: Boolean);

   public
      // Public declarations
      procedure Progresso(vParam : Array of Variant);

   end;
var
  frmConsultaPerfil: TfrmConsultaPerfil;

implementation
{$R *.DFM}
uses
   fCadPerfilCota, fProgressoDuplo, dRelPerfilConsolidado;

procedure TfrmConsultaPerfil.Progresso(vParam : Array of Variant);
begin
//   vParam[0] :  BILHETE
//   vParam[1] :  Tipo da operação (0 = mostra, 1 = anda, 2 = esconde)

//   vParam[2] :  Mínimo de Registros  (em cima)
//   vParam[3] :  Total de Registros   (em cima)
//   vParam[4] :  Registro Atual       (em cima)
//   vParam[5] :  Legenda              (em cima)

//   vParam[6] :  Mínimo de Registros  (em baixo)
//   vParam[7] :  Total de Registros   (em baixo)
//   vParam[8] :  Registro Atual       (em baixo)
//   vParam[9] :  Legenda              (em baixo)


   case vParam[1] of
      0: frmProgressoDuplo.MostraFormProgressoDuplo(vParam[5],  // Legenda  (de cima)
                                                    vParam[9],  // Legenda  (de baixo)
                                                    vParam[2],  // Mínimo   (de cima)
                                                    vParam[6],  // Mínimo   (de baixo)
                                                    vParam[3],  // Máximo   (de cima)
                                                    vParam[7],  // Máximo   (de baixo)
                                                    False,      // Botão Visivel
                                                    False       // Botão Habilitado
                                                   );

      1: frmProgressoDuplo.AndaFormProgressoDuplo(vParam[4], vParam[8]);
      2: frmProgressoDuplo.EscondeFormProgressoDuplo;
   end;

   Application.ProcessMessages;
end;

function TfrmConsultaPerfil.AcharNo(Arvore: TTreeView; sCodHierarq: string): TTreeNode;
var
No: TTreeNode;
begin
   Result := nil;
   if Arvore.Items.Count <> 0 then
   begin
      No := Arvore.Items.GetFirstNode;
      while No <> nil do
      begin
         if pItem(No.Data)^.CodHierarq = sCodHierarq then
         begin
            Result := No;
            Exit;
         end;
         No := No.GetNext;
      end;
   end;
end;

procedure TfrmConsultaPerfil.btPassaUmClick(Sender: TObject);
begin
   inherited;
   if trvPerfil.Items.Count <> 0 then begin
     PassaNo(trvPerfil.Selected,trvPerfil,trvCotas);
     if trvCotas.Items.Count <> 0 then
       trvCotas.Items.GetFirstNode.Selected := true;
   end;
end;

function TfrmConsultaPerfil.CriaCaminhoNo(NoEmFoco: TTreeNode; ArvOrigem,ArvDestino: TTreeView): TTreeNode;
var NoDeLoop, NoDestino, NoEncontrado: TTreeNode;
begin

   NoDeLoop  := ArvOrigem.Items.GetFirstNode;
   NoDestino := nil;

 //  Faz esta rotina, caso a  trvCotas esteja vazia...
 if ArvDestino.Items.Count <> 0 then begin
   while NoDeLoop <> nil do begin
     if NoEmFoco.HasAsParent(NoDeLoop) then begin
       NoEncontrado := AcharNo(ArvDestino,pItem(NoDeLoop.Data)^.CodHierarq);
       if NoEncontrado <> nil then begin
         NoDestino := NoEncontrado;
       end else begin
         NoDestino := InserePasta(False,ArvDestino,NoDestino,NoDeLoop.Data);
       end;
     end;
     NoDeLoop := NoDeLoop.GetNext;
   end;
   Result := NoDestino;

 end else begin
 //  Caso a trvCotas esteja vazia, esta rotina é executada...
   //  Percorre a trvPerfil
   while NoDeLoop <> nil do begin
     //  Verifica se o papel focado da trvPerfi, é parente do nó em loop...
     if NoEmFoco.HasAsParent(NoDeLoop) then begin
       //  Insere a pasta na trvCotas e passa o nó à variável...
       NoDestino := InserePasta(False,ArvDestino,NoDestino,NoDeLoop.Data);
     end;
     //  Move para o próximo nó...
     NoDeLoop := NoDeLoop.GetNext;
   end;
   //  Passa o valor do nó ao Result.
   Result := NoDestino;
  end;
end;

procedure TfrmConsultaPerfil.InserePapel(Arvore: TTreeView;
                                         NoDestino: TTreeNode;
                                         pDesc: pItem);
var No: TTreeNode;
begin
  No := Arvore.Items.AddChildObject(NoDestino,pDesc.sDescricao,pDesc);
  No.ImageIndex    := 2;
  No.SelectedIndex := 3;
end;

function TfrmConsultaPerfil.InserePasta(EumaPasta: Boolean;
                                        Arvore: TTreeView;
                                        NoDestino: TTreeNode;
                                        pDesc: pItem): TTreeNode;
var No: TTreeNode;
begin
  if EumaPasta then
    No := Arvore.Items.AddObject(NoDestino,pDesc.sDescricao,pDesc)
  else
    No := Arvore.Items.AddChildObject(NoDestino,pDesc.sDescricao,pDesc);
  No.ImageIndex    := 0;
  No.SelectedIndex := 1;
  Result := No;
end;

procedure TfrmConsultaPerfil.MensErroMt(sMsgInfo: string);
begin
  MsgDlg(sMsgInfo, Sistema.NomeAplicativo, mtWarning,[mbOk],0);
end;

procedure TfrmConsultaPerfil.MontaArvorePerfil(iIdPerfilCota: integer);
var pPasta, pPapel : pItem;
    EumaPasta: Boolean;
    NoEmFoco: TTreeNode;
    Arvore: TTreeView;
    Nivel,TotalReg,PosicaoReg: Integer;

begin
  CdsPerfilCota.Data     := CtrlPerfilCota.ListaPerfilCota(iIdPerfilCota);
  CdsNoperfilCota.Data   := CtrlPerfilCota.ListaNoPerfilCota(iIdPerfilCota);
  CdsNoPerfilXativo.Data := CtrlPerfilCota.ListaNOPERFILXATIVO(iIdPerfilCota);

  frmProgresso.MostraFormProgresso('Aguade, montando árvore de perfil cadastrado...',false,false,true,0,100);
  TotalReg   := CdsNoperfilCota.RecordCount +  CdsNoPerfilXativo.RecordCount;
  PosicaoReg := 0;
  Arvore     := trvPerfil;
  NoEmFoco   := nil;

    //**************************************************************************
    //                      INSERINDO PASTAS / SUBPASTAS
    //**************************************************************************

  //  Varre o CdsNoperfilCota e insere todas as pastas cadastradas
  while not CdsNoperfilCota.Eof do begin
    Nivel  := frmCadPerfilCota.RetornaNivelCodHierarquico(CdsNoperfilCota.FieldByName('CODHIERARQUICO').AsString);

    //  Verifica se é uma Pasta ou Subpasta atrávés do cod. hierárquico
    EumaPasta := ( Nivel = 0);
    new(pPasta);
    pPasta.IDAtivoCota := 0;
    pPasta.CodHierarq  := CdsNoperfilCota.FieldByName('CODHIERARQUICO').AsString;

    if EumaPasta then
      //  Caso seja uma pasta...
      pPasta.NoPerfil := nil
    else begin
      //  Caso seja uma subpasta
      if Nivel > NoEmFoco.Level then
        pPasta.NoPerfil :=  NoEmFoco;
      if Nivel < NoEmFoco.Level then begin
        repeat
          NoEmFoco := NoEmFoco.Parent;
        until Nivel > NoEmFoco.Level;
        pPasta.NoPerfil := NoEmFoco;
      end;
      if Nivel = NoEmFoco.Level then begin
        NoEmFoco := NoEmFoco.Parent;
        pPasta.NoPerfil := NoEmFoco;
      end;
    end;

    //  Insere a Pasta/Subpasta na árvore
    pPasta.sDescricao := CdsNoperfilCota.FieldByName('DESCRICAO').AsString;
    NoEmFoco := InserePasta(EumaPasta,Arvore,pPasta.NoPerfil,pPasta);

    //**************************************************************************
    //                         INSERINDO PAPÉIS
    //**************************************************************************

    //  Agora, é feito uma filtragem no CdsNoPerfilxAtivo através do cod. hierárquico,
    //para selecionar todos os papéis (ativos) referentes à pasta/subpasta criada
    CdsNoPerfilXAtivo.Filter   := 'CODHIERARQUICO = ' + QuotedStr(CdsNoperfilCota.FieldByName('CODHIERARQUICO').AsString);
    CdsNoPerfilXAtivo.Filtered := true;
    //  Varre o CdsNoPefilxAtivo e insere os papéis encontrados...
    while not CdsNoPerfilXativo.Eof do begin
      new(pPapel);
      pPapel.sDescricao  := CdsNoPerfilXativo.FieldByName('ATIVO').AsString;
      pPapel.IDAtivoCota := CdsNoPerfilXativo.FieldByName('IDATIVOCOTA').AsInteger;
      InserePapel(Arvore,NoEmFoco,pPapel);
      CdsNoPerfilXativo.Next;
      Inc(PosicaoReg);
      frmProgresso.AndaFormProgresso(PosicaoReg,TotalReg);
    end;
    CdsNoPerfilXAtivo.Filtered := false;
    Inc(PosicaoReg);
    frmProgresso.AndaFormProgresso(PosicaoReg,TotalReg);
    CdsNoperfilCota.Next;
  end;

  frmProgresso.EscondeFormProgresso;
  //  É necessário forçar o foco na árvore, pois há eventos que necessitam do nó focado.
  //  Sem isto, ocorre 'Access Violation' nos botões PassaUm/PassaTodos, pois não há foco...
  if CdsNoperfilCota.RecordCount <> 0 then
    trvPerfil.Items.GetFirstNode.Selected := true;
end;

procedure TfrmConsultaPerfil.FormCreate(Sender: TObject);
begin
  CtrlPerfilCota :=  TCtrlPerfilCota.Create;
  CtrlPerfilCota.Initialize (dtmBaseDados.dbBaseDados, true,
                              Sistema.ConnectionType, Sistema.ConnectionSide,
                              Sistema.AppRemoteServer, true, MensErroMT);

  CtrlHstMovCota := TCtrlHstMovCota.Create;
  CtrlHstMovCota.InitializeAs(CtrlPerfilCota);

  CtrlPlanPrevContabPatro := TCtrlPlanPrevContabPatro.Create;
  CtrlPlanPrevContabPatro.InitializeAs(CtrlPerfilCota);

  CtrlCotaCotacao := TCtrlCotaCotacao.Create;
  CtrlCotaCotacao.InitializeAs(CtrlPerfilCota);

  CtrlCarteiraSPC := TCtrlCarteiraSPC.Create;
  CtrlCarteiraSPC.InitializeAs(CtrlPerfilCota);

  CtrlListTerceiros := TCtrlListTerceiros.Create;
  CtrlListTerceiros.InitializeAs(CtrlPerfilCota);

  CtrlCotaCotacao.Progresso  := Progresso;

  //  Define os Cds's do Control como Cds's inseridos no Form
  CtrlPerfilCota.cdsPerfilCota     := CdsPerfilCota;
  CtrlPerfilCota.CdsNoPerfilCota   := CdsNoPerfilCota;
  CtrlPerfilCota.CdsNoPerfilXATivo := CdsNoPerfilXAtivo;

  CtrlCotaCotacao.CdsAtivosConsolidados := dtmRelPerfilConsolidado.CdsAtivosConsolidados;

  CdsRegraIndex.Data := CtrlHstMovCota.ListaRegraIndexador;
  CdsRegraJuros.Data := CtrlHstMovCota.ListaRegraIndexador;
  CdsPerfilCota.Data := CtrlPerfilCota.ListaPerfilCota(-1);

  inherited;
  // AL_1
  WindowState := wsMaximized;

end;

procedure TfrmConsultaPerfil.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlPerfilCota);
  FreeAndNil(CtrlCotaCotacao);
  FreeAndNil(CtrlHstMovCota);

  // Lucas - 26/01/2005
  FreeAndNil(CtrlListTerceiros);
end;

procedure TfrmConsultaPerfil.btProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Executar;
  if MontaSelect.RetornouValor then begin
    rdPerfil.ItemIndex := -1;
    trvPerfil.Items.Clear;
    trvCotas.Items.Clear;
    MontaArvorePerfil(StrToInt(MontaSelect.ValoresChave[0]));
  end;
end;

procedure TfrmConsultaPerfil.btPassaTodosClick(Sender: TObject);
begin
  inherited;
  if trvPerfil.Items.Count <> 0 then begin
    if trvCotas.Items.Count <> 0 then
      MsgDlg('É necessário retornar toda a árvore para executar esta operação!',Sistema.NomeAplicativo,mtWarning,[mbOk],0)
    else
      MoveArvore(trvPerfil,trvCotas);
  end;
end;

procedure TfrmConsultaPerfil.btVoltaUmClick(Sender: TObject);
begin
  inherited;
  if trvCotas.CanFocus then trvCotas.SetFocus;
  if trvCotas.Items.Count <> 0 then begin
    PassaNo(trvCotas.Selected,trvCotas,trvPerfil);
    if trvPerfil.Items.Count <> 0 then
      trvPerfil.Items.GetFirstNode.Selected := true;
  end;
end;

procedure TfrmConsultaPerfil.btVoltaTodosClick(Sender: TObject);
begin
  inherited;
  if trvCotas.Items.Count <> 0 then begin
    if trvPerfil.Items.Count <> 0 then
      MsgDlg('É necessário inserir toda a árvore para executar esta operação!',Sistema.NomeAplicativo,mtWarning,[mbOk],0)
    else
      MoveArvore(trvCotas,trvPerfil);
  end;
end;

procedure TfrmConsultaPerfil.btnConfirmarClick(Sender: TObject);
var NoBuscaAtivos     : TTreeNode;
    iIdPlano, iIdPatro, iIdPlanoSPC: Integer;
    //AL_4    
    sBusca      : String;
    bManual, bEMP, bImob, bRF, bRV, bBMF, bFundoRF, bFundoRV, bFundoImob, bFundoDIC: Boolean;
begin
   inherited;

   try
      //AL_4
      if VerificaPreenchimento then
      begin
        if not(VerificaSeTemAtivo(trvCotas)) then
        begin
           MsgDlg('Não há nenhum ativo a calcular!', Sistema.NomeAplicativo, mtWarning, [mbOk], 0);
           Repaint;
        end
        else
        begin
           NoBuscaAtivos := trvCotas.Items.GetFirstNode;
           //AL_4
           CdsAtivosAConsolidar.Data                           := CtrlHstMovCota.ListaCdsAtivosAConsolidar;
           dtmRelPerfilConsolidado.CdsAtivosConsolidados.Data  := CtrlHstMovCota.ListaCdsAtivosConsolidados;
           dtmRelPerfilConsolidado.CdsCompPerfil.Data          := CtrlHstMovCota.ComposicaoPerfil;
           // AL_1
           dtmRelPerfilConsolidado.CdsCompPerfilDet.Data       := CtrlHstMovCota.ComposicaoPerfil;

           pnlNomeInd.Caption     := ' Nenhum indicador foi informado';
           pnlTxJuros.Caption     := '0,0000 % ';
           pnlIndJuros.Caption    := '0,0000 % ';
           pnlValorizacao.Caption := '0,0000 % ';
           pnlPerSInd.Caption     := '0,0000 % ';


           bManual    := False;
           bEMP       := False;
           bImob      := False;
           bRF        := False;
           bRV        := False;
           bBMF       := False;
           bFundoRF   := False;
           bFundoRV   := False;
           bFundoImob := False;
           bFundoDIC  := False;

           // SE PLANO SPC ESTIVER MARCADO ALIMENTA VARIÁVEIS
           if CbxPlanoSPC.Checked then
           begin
              if cmbPlano.Text <> '' then
                 iIdPlanoSPC := CdsPlano.FieldByName('IDPLANOPREV').AsInteger
              else
                 iIdPlanoSPC := -1;

              iIdPlano := -1;
              iIdPatro := -1;
           end
           else
           begin
              if cmbPlano.Text <> '' then
                 iIdPlano := CdsPlano.FieldByName('IDPLANOPREV').AsInteger
              else
                 iIdPlano := -1;

              if cmbPatro.Text <> '' then
                 iIdPatro := CdsPatro.FieldByName('IDPATRO').AsInteger
              else
                 iIdPatro := -1;

              iIdPlanoSPC := -1;
           end;

           // Varre a árvore de cotas em busca de ativos...
           while NoBuscaAtivos <> nil do
           begin
              if NoBuscaAtivos.ImageIndex = 2 then
              begin
                 //AL_4
                 // Insere o id do papel no Cds local...

                 CdsAtivosAConsolidar.Append;
                 CdsAtivosAConsolidar.FieldByName('IDATIVOCOTA').AsInteger := pItem(NoBuscaAtivos.Data)^.IDAtivoCota;
                 CdsAtivosAConsolidar.Post;

                 dtmRelPerfilConsolidado.CdsCompPerfilDet.Append;
                 dtmRelPerfilConsolidado.CdsCompPerfilDet.FieldByName('TIPOATIVO').AsString := NoBuscaAtivos.Parent.Text;
                 dtmRelPerfilConsolidado.CdsCompPerfilDet.FieldByName('ATIVO').AsString     := NoBuscaAtivos.Text;
                 dtmRelPerfilConsolidado.CdsCompPerfilDet.Post;
                 //AL_4 - Ini
                 if not CtrlHstMovCota.ExisteAtivo(dtmRelPerfilConsolidado.CdsCompPerfil, 'TIPOATIVO', NoBuscaAtivos.Parent.Text) then
                 begin
                    dtmRelPerfilConsolidado.CdsCompPerfil.Append;
                    dtmRelPerfilConsolidado.CdsCompPerfilTIPOATIVO.AsString := NoBuscaAtivos.Parent.Text;
                    dtmRelPerfilConsolidado.CdsCompPerfil.Post;
                 end;
                 //AL_4 - Fim
              end;

              NoBuscaAtivos := NoBuscaAtivos.GetNext;
           end;

           //AL_4
           CdsEspecAtivos.Data := CtrlHstMovCota.ListaAtivosIdentificados(CdsAtivosAConsolidar);

           while not CdsEspecAtivos.Eof do
           begin
              case CdsEspecAtivos.FieldByName('TIPO').AsString[1] of
                '1': bRF        := True;           //  Renda Fixa
                '2': bRV        := True;           //  Renda Variável
                '3': bImob      := True;           //  Imobiliário
                '4': bEMP       := True;           //  Empréstimo
                '5': bFundoRF   := True;           //  Fundos Renda Fixa
                '6': bFundoRV   := True;           //  Fundos Renda Variável
                '7': bFundoImob := True;           //  Fundos Imobiliário
                '8': bBMF       := True;           //  BM&F
                '9': bFundoDIC  := True;           //  Fundos Creditórios
                'M': bManual    := True;           //  Ativos Manuais
              end;
              CdsEspecAtivos.Next;
           end;

           // ----------------------------------------------------------------------------------------
           CtrlCotaCotacao.ProcessaCotaModulos(edDtFim.Date,
                                               bManual,
                                               bEMP,
                                               bImob,
                                               bRF,
                                               bRV,
                                               bBMF,
                                               bFundoRF,
                                               bFundoRV,
                                               bFundoImob,
                                               bFundoDIC,
                                               False,
                                               CtrlCotaCotacao.ProgressFileName,
                                               CdsAtivosAConsolidar,
                                               iIdPlano,
                                               iIdPatro
                                              );
           // ----------------------------------------------------------------------------------------

           //  Após a varredura da árvore, os dados do Cds local são passados
           //para o Cds que está no ControlObject...
           CtrlCotaCotacao.CdsAtivosAConsolidar  := CdsAtivosAConsolidar;

           // -------------------------------------------------------------------------------------------
           // -------------------------------------------------------------------------------------------
           // -------------------------------------------------------------------------------------------

           CtrlCotaCotacao.CreateThreadProgresso;

           try
              //  Faz a consolidação de cotas...
              if CtrlCotaCotacao.ConsolidaCotas(edDtInicio.Date,
                                                edDtFim.Date,
                                                iIdPlano,
                                                iIdPatro,
                                                CtrlCotaCotacao.ProgressFileName,
                                                CdsAtivosAConsolidar,
                                                iIdPlanoSPC
                                               ) then
              begin
                 //  Passa o resultado para o cds local CdsAtivosConsolidados...
                 dtmRelPerfilConsolidado.CdsAtivosConsolidados.Data := CtrlCotaCotacao.CdsAtivosConsolidados.Data;
              end;
           finally
              CtrlCotaCotacao.FreeThreadProgresso;
           end;

           // -------------------------------------------------------------------------------------------
           // -------------------------------------------------------------------------------------------
           // -------------------------------------------------------------------------------------------

           dtmRelPerfilConsolidado.CdsAtivosEspecif.Data :=
                          CtrlHstMovCota.ListaEstatisticasAtivos(CdsAtivosAConsolidar,edDtInicio.Text,
                                                                 edDtFim.Text,iIdPlano,iIdPatro,iIdPlanoSPC);
           //AL_5
           dtmRelPerfilConsolidado.CdsFluxoCota.Data :=
                          CtrlCotaCotacao.ListaFluxoCota(CdsAtivosAConsolidar,edDtInicio.Text,
                                                         edDtFim.Text,iIdPlano,iIdPatro,iIdPlanoSPC);
           PagControle.ActivePageIndex := PagControle.ActivePageIndex + 1;
           // o change do page control somente é executado se o usuário clicar na tab
           // como aqui a tab não é visível, é necessário forçar o método
           PagControle.OnChange(self);
           btnConfirmar.Enabled := false;
           pnlConsulta.Enabled := False;
           btRelatorio.Enabled := (dtmRelPerfilConsolidado.CdsAtivosConsolidados.RecordCount <> 0);
        end;

        // AL_2 - Passa a Atualizar o Indicador ao final do Cálculo
        if dtmRelPerfilConsolidado.CdsAtivosConsolidados.Active then
           ExecutaRegra(regIndicadores,edDtInicio.Text,edDtFim.Text,TrocaPontoOuVirgula(True,edTxJuros.Text),sePercentual.Text);
      end;
   finally

   end;
end;

procedure TfrmConsultaPerfil.btnVoltarClick(Sender: TObject);
begin
   inherited;
   btnConfirmar.Enabled := True;
   pnlConsulta.Enabled  := True;
   btRelatorio.Enabled  := false;
   dtmRelPerfilConsolidado.CdsAtivosConsolidados.Close;
   dtmRelPerfilConsolidado.CdsAtivosEspecif.Close;
end;

procedure TfrmConsultaPerfil.cmbPlanoEnter(Sender: TObject);
begin
   inherited;
   ChecaPlanoSPC(CbxPlanoSPC.Checked);
end;

procedure TfrmConsultaPerfil.cmbPatroEnter(Sender: TObject);
begin
   inherited;

   // AL_1
   if Trim(cmbPatro.Text) = '' then
   begin
      CdsPatro.Data := CtrlHstMovCota.ListaPatro
   end;
end;

function TfrmConsultaPerfil.VerificaPreenchimento: Boolean;
begin
   try
      if trvCotas.Items.Count = 0 then
         raise EValidacao.CreateVal('É necessário selecionar um ativo!',trvPerfil)
      else if edDtInicio.Text = '' then
         raise EValidacao.CreateVal('É necessário informar uma data inicial',edDtInicio)
      else if edDtFim.Text = '' then
         raise EValidacao.CreateVal('É necessário informar uma data final',edDtFim)
      else if edDtInicio.Date > edDtFim.Date then
         raise EValidacao.CreateVal('A data inicial não pode ser maior que a data final!',edDtInicio)
      else
        if ((CbxPlanoSPC.Checked) and (Trim(cmbPlano.Text) = '')) then
           raise EValidacao.CreateVal('É Necessário Informar o Plano SPC!',cmbPlano);


   except

      on ev : EValidacao do
      begin
         Result := False;
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;

procedure TfrmConsultaPerfil.dbGrdCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then
   begin
      if not Highlight then
      begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
         begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end
         else
         begin
            ABrush.Color := clWhite;
         end;
      end;
   end
   else
   begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;

procedure TfrmConsultaPerfil.dbGrdTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmConsultaPerfil.CdsPerfilCotaTIPOPERFILGetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
   inherited;

   if CdsPerfilCotaTIPOPERFIL.AsString = 'S' then Text := 'SPC';

   //  Obs:  Aqui não foi usado o 'ELSE' porque se o campo estiver nulo
   // aparece o display 'ORIGEM' considerando o NULO
   if CdsPerfilCotaTIPOPERFIL.AsString = 'O' then Text := 'Origem';
end;

procedure TfrmConsultaPerfil.rdTipoPlanoClick(Sender: TObject);
begin
   inherited;
   cmbPlano.OnEnter(self);
   cmbPatro.OnEnter(self);
end;

procedure TfrmConsultaPerfil.dbGrdTitleButtonClick(Sender: TObject; AFieldName: String);
begin
   inherited;
   dtmRelPerfilConsolidado.CdsAtivosConsolidados.IndexFieldNames := AFieldName;
end;

procedure TfrmConsultaPerfil.MontarAtivos(const Arvore: TTreeView;
                                          iIdPerfilCota: Integer);
var nNodeInvestimento, nNodeCotas, nNodeEmprestimo, nNodeImobiliario: TTreeNode;
    wItem : pItem;
begin

  FrmProgressoDuplo.MostraFormProgressoDuplo('Progresso Total','Aguarde, montando árvore de Ativos Origem',0,0,11,100,false,false);
  ProgressoTotal := 0;

  //Pasta Investimento
  new(wItem);
  wItem.sDescricao                := 'Investimento';
  wItem.IDAtivoCota               := 0;
  nNodeInvestimento               := nil;
  nNodeInvestimento               := InserePasta(true,Arvore,nNodeInvestimento,wItem);


  //Pasta Imobiliário
  new(wItem);
  wItem.sDescricao                := 'Imobiliário';
  wItem.IDAtivoCota               := 0;
  nNodeImobiliario                := nil;
  nNodeImobiliario                := InserePasta(true,Arvore,nNodeImobiliario,wItem);


  //Pasta Empréstimo
  new(wItem);
  wItem.sDescricao                := 'Empréstimo';
  wItem.IDAtivoCota               := 0;
  nNodeEmprestimo                 := nil;
  nNodeEmprestimo                 := InserePasta(true,Arvore,nNodeEmprestimo,wItem);


  //Pasta Cotas
  new(wItem);
  wItem.sDescricao                := 'Cotas Manuais';
  wItem.IDAtivoCota               := 0;
  nNodeCotas                      := nil;
  nNodeCotas                      := InserePasta(true,Arvore,nNodeCotas,wItem);


  {Procedimentos que preenchem as pastas com os seus devidos valores}
  MontarInvestimento(Arvore,nNodeInvestimento,iIdPerfilCota); // => 04

  MontarImobiliario(Arvore,nNodeImobiliario,iIdPerfilCota);// => 03

  MontarEmprestimo(Arvore,nNodeEmprestimo,iIdPerfilCota); // => 02

  MontarCotas(Arvore,nNodeCotas,iIDPerfilCota); // => 07
  {FIM DO PROCEDIMENTO - 01}

  frmProgressoDuplo.EscondeFormProgressoDuplo;
end;

procedure TfrmConsultaPerfil.MontarAtivosSPC(const Arvore: TTreeView;
                                             iIdPerfilCota: integer);
var nNodeSegmento, nNodeImovelMestre, nNodeCarteira: TTreeNode;
    wItem : pItem;
    iCodSegmento, Posicao : integer;
    DescCarteira, CodTipImovel, ImovelMestre : string;
    CdsPerfilSPC : TCMClientDataSet;

begin
  nNodeSegmento := nil;
  nNodeCarteira := nil;
  nNodeImovelMestre := nil;
  CdsPerfilSPC := TCMClientDataSet.Create(nil);

  // Limpa a árvore
  Arvore.Items.Clear;

  // Carrega  os dados dos ativos, baseados na carteira SPC
  CdsPerfilSPC.Data :=  CtrlCarteiraSpc.ListaCarteiraSPCAtivos(iIdPerfilCota);
  FrmProgresso.MostraFormProgresso('Aguarde, montando árvore ativos SPC',false,false,true,0,100);

  // Define um valor às variáveis
  iCodSegmento := -1;
  DescCarteira := '';
  CodTipImovel := '';
  ImovelMestre := '';
  Posicao      := 0;

  { Inicia o loop, onde vai inserir todas as pastas e subpastas
   de acordo com o resultado obtido do CdsPerfilSPC}
  while not CdsPerfilSPC.Eof do begin

    { Verifica se a variável iCodSegemnto, é diferente do valor do campo
    CODSEGMENTO, pois caso seja, é criado uma nova pasta com o nome referente
    a descrição do segmento encontrado}
    if iCodSegmento <> CdsPerfilSPC.FieldByName('CODSEGMENTO').AsInteger then begin
      iCodSegmento               := CdsPerfilSPC.FieldByName('CODSEGMENTO').AsInteger;
      new(wItem);
      wItem.sDescricao           := CdsPerfilSPC.FieldByName('DESCRICAO').AsString;
      nNodeSegmento              := nil;
      nNodeSegmento              := InserePasta(true,Arvore,nNodeSegmento,wItem);
    end;


    { Verifica se a variável DescCarteira, é diferente do valor do campo
    DESCARTEIRASPC, pois caso seja, é criado uma nova pasta dentro
    da pasta SEGMENTO com o nome referente a descrição da carteira encontrada}
    if  DescCarteira <> CdsPerfilSPC.FieldByName('DESCARTEIRASPC').AsString then begin
      DescCarteira               := CdsPerfilSPC.FieldByName('DESCARTEIRASPC').AsString;
      new(wItem);
      wItem.IDAtivoCota          := 0;
      wItem.iIdCarteiraSPC        := CdsPerfilSPC.FieldByName('IDCARTEIRASPC').AsInteger;
      wItem.sDescricao           := CdsPerfilSPC.FieldByName('DESCARTEIRASPC').AsString;
      nNodeCarteira              := InserePasta(false,Arvore,nNodeSegmento,wItem);
    end;



    { Verifica se a variável ImovelMestre, é nula ou diferente do valor encontrado
    a cada passo do loop, pois caso seja diferente, é criado uma nova pasta
    dentro da pasta CARTEIRA, com o nome referente ao valor encontrado
    no campo MESTRE }
    if  (ImovelMestre <> CdsPerfilSPC.FieldByName('MESTRE').AsString)
    and (CdsPerfilSPC.FieldByName('MESTRE').AsString <> '') then begin
      ImovelMestre               := CdsPerfilSPC.FieldByName('MESTRE').AsString;
      new(wItem);
      wItem.IDAtivoCota          := 0;
      wItem.sDescricao           :=  CdsPerfilSPC.FieldByName('MESTRE').AsString;
      wItem.iIdCarteiraSPC        := -1;
      nNodeImovelMestre          := InserePasta(false,Arvore,nNodeCarteira,wItem);
    end;


    { Verifica se o campo MESTREL está vazio, pois com este campo nulo,
    é ignorado a verificação o mesmo, junto com o campo MESTRE, criando assim um objeto
    dentro da pasta CARTEIRA. Caso não esteja, é criado um objeto dentro
    da pasta MESTRE, com o nome semelhante ao encontrado no campo DESCINVESTIMENTO}
    if CdsPerfilSPC.FieldByName('MESTRE').AsString <> ''   then begin
      new(wItem);
      wItem.IDAtivoCota               := CdsPerfilSPC.FieldByName('IDATIVOCOTA').AsInteger;
      wItem.sDescricao                := CdsPerfilSPC.FieldByName('DESCINVESTIMENTO').AsString;
      wItem.iIdCarteiraSPC             := CdsPerfilSPC.FieldByName('IDCARTEIRASPC').AsInteger;
      InserePapel(Arvore,nNodeImovelMestre,wItem);

    end else if CdsPerfilSPC.FieldByName('DESCINVESTIMENTO').AsString <> '' then  begin
      new(wItem);
      wItem.IDAtivoCota               := CdsPerfilSPC.FieldByName('IDATIVOCOTA').AsInteger;
      wItem.sDescricao                := CdsPerfilSPC.FieldByName('DESCINVESTIMENTO').AsString;
      wItem.iIdCarteiraSPC             := CdsPerfilSPC.FieldByName('IDCARTEIRASPC').AsInteger;
      InserePapel(Arvore,nNodeCarteira,wItem);
    end;


    // Move o cursor para o próximo registro
    Posicao := Posicao + 1;
    FrmProgresso.AndaFormProgresso(Posicao,CdsPerfilSPC.RecordCount);
    CdsPerfilSPC.Next;
  end;

  FrmProgresso.EscondeFormProgresso;
{ FIM DO PROCEDIMENTO - 06}
end;

procedure TfrmConsultaPerfil.MontarInvestimento(const Arvore: TTreeView;
                                                const nTreeNode: TTreeNode;
                                                iIdPerfilCota: Integer);
var wItem: pItem;
    nTreeNodeFundos : TTreeNode;
begin
  inherited;
  // Cria e monta a pasta de RF, dentro da pasta Investimento
  MontaNoRFRV(Arvore,'RF',nTreeNode,iIdPerfilCOta); // => 08
  ProgressoTotal := 1;

  // Cria e monta a pasta de RV, dentro da pasta Investimento
  MontaNoRFRV(Arvore,'RV',nTreeNode,iIdPerfilCOta);  // => 08
  ProgressoTotal := 2;

  // Cria e monta a pasta de BMF, dentro da pasta Investimento
  MontaNoRFRV(Arvore,'BMF',nTreeNode,iIdPerfilCOta); // => 08
  ProgressoTotal := 3;

  // Cria a pasta Fundos, dentro da pasta Investimento
  new(wItem);
  wItem.IDAtivoCota  := 0;
  wItem.sDescricao   := 'Fundos';
  nTreeNodeFundos    := InserePasta(false,Arvore,nTreeNode,wItem);

  ProgressoTotal     := 4;

  {*****Preenche a pasta Fundos*********}
  // Cria e monta a pasta RF dentro da pasta Fundos
  MontaNoFundos(Arvore,'RF',nTreeNodeFundos,iIdPerfilCOta); // => 09
  ProgressoTotal := 5;

  // Cria e monta a pasta RV dentro da pasta Fundos
  MontaNoFundos(Arvore,'RV',nTreeNodeFundos,iIdPerfilCOta); // => 09
  ProgressoTotal := 6;

  // Cria e monta a pasta FDC dentro da pasta Fundos
  MontaNoFundos(Arvore,'FDC',nTreeNodeFundos,iIdPerfilCOta); // => 09
  ProgressoTotal := 7;

  // Cria e monta a pasta Imobiliário dentro da pasta Fundos
  MontaNoFundos(Arvore,'Imobiliário',nTreeNodeFundos,iIdPerfilCOta); // => 09
  ProgressoTotal := 8;

{ FIM DO PROCEDIMENTO - -04}
end;

procedure TfrmConsultaPerfil.MontaNoFundos(const Arvore: TTreeView;
                                           const sFundo: string;
                                           nTreeNodePai: TTreeNode;
                                           iIdPerfilCOta: Integer);
var wItem : pItem;
    nTreeNodeFundos: TTreeNode;
    Posicao1 : integer;
    CdsFundosRFRV : TCMClientDataSet;
begin
  try
     CdsFundosRFRV := TCMClientDataSet.Create(nil);
     nTreeNodeFundos := nil;

     { Zera a variável somente quando for usada pela 1ª vez para controle
     de progresso, pois este procedimento é chamado várias vezes}
     if Posicao1 < 0 then
       Posicao1 := 0;

    {Verifica o tipo de renda e cria as suas respectivas pastas
    dentro da pasta \Investimento\Fundo}

    // Se for renda fixa...
    if sFundo = 'RF' then begin
      new(wItem);
      wItem.sDescricao             := sFundo;
      nTreeNodeFundos              := InserePAsta(false,Arvore,nTreeNodePai,wItem);
      cdsFundosRFRV.Data           :=  CtrlPerfilCota.ListaFundos(3,2,iIdPerfilCota);
      frmProgressoDuplo.Legenda := 'Montando Fundo RF';

    // Se for outro tipo de valor...
    end else begin
      if sFundo = 'RV' then begin
        new(wItem);
        wItem.sDescricao           := sFundo;
        nTreeNodeFundos            := InserePasta(false,Arvore,nTreeNodePai,wItem);
        //---Renan Cristiano KT 523245 SOL 75796 inicio.
        // Ajuste no 2º parametro(14) do CtrlPerfilCota.ListaFundos, para filtrar tambem os fundos do idTipoInvest 14.
        cdsFundosRFRV.Data         := CtrlPerfilCota.ListaFundos(4,14,iIDPerfilCota);
        //---Renan Cristiano KT 523245 SOL 75796 fim.
        frmProgressoDuplo.Legenda := 'Montando Fundo RV';


      end else if sFundo = 'FDC' then begin
        new(wItem);
        wItem.sDescricao           := sFundo;
        nTreeNodeFundos            := InserePasta(false,Arvore,nTreeNodePai,wItem);
        //---Renan Cristiano KT 523256 SOL 75934 inicio.
        // Ajuste no 2º parametro(15) do CtrlPerfilCota.ListaFundos, para filtrar tambem os fundos do idTipoInvest 15.
        cdsFundosRFRV.Data         := CtrlPerfilCota.ListaFundos(5,15,iIDPerfilCota);
        //---Renan Cristiano KT 523256 SOL 75934 fim.
        frmProgressoDuplo.Legenda := 'Montando Fundo FDC';

      end else if sFundo = 'Imobiliário' then begin
        new(wItem);
        wItem.sDescricao           := sFundo;
        nTreeNodeFundos            := InserePasta(false,Arvore,nTreeNodePai,wItem);
        cdsFundosRFRV.Data         := CtrlPerfilCota.ListaFundos(1,0,iIDPerfilCota);
        frmProgressoDuplo.Legenda := 'Montando Fundo Imobiliário';
      end;
    end;

    frmProgressoDuplo.Max2         :=CdsFundosRFRV.RecordCount;


    // Faz um loop para preencher a pasta
    while not cdsFundosRFRV.Eof do begin
      new(wItem);
      wItem.IDAtivoCota            := cdsFundosRFRV.FieldByName('IDATIVOCOTA').AsInteger;
      wItem.sDescricao             := cdsFundosRFRV.FieldByName ('DESCFUNDOINVEST').AsString;
      InserePapel(Arvore,nTreeNodeFundos,wItem);
      Inc(Posicao1);
      frmProgressoDuplo.AndaFormProgressoDuplo(ProgressoTotal,Posicao1);
      cdsFundosRFRV.Next;
    end;

    cdsFundosRFRV.Close;

  finally
    FreeAndNil(CdsFundosRFRV);
  end;
end;

procedure TfrmConsultaPerfil.MontaNoRFRV(const Arvore: TTreeView;
                                         const sRFRV: string;
                                         nTreeNodePai: TTreeNode;
                                         iIdPerfilCOta: Integer);
var wItem: pItem;
    nTreeNodeRFRV: TTreeNode;
    Posicao1 : integer;
    CdsRFRV: TCMClientDataSet;
begin
 try
   { Zera a variável somente quando for usada pela 1ª vez para controle
   de progresso, pois este procedimento é chamado várias vezes}
   if Posicao1 < 0 then
     Posicao1 := 0;
   CdsRFRV := TCMClientDataSet.Create(nil);

  // Cria as pastas Rendas Fixas/Variáveis
  new(wItem);
  wItem.IDAtivoCota           := 0;
  wItem.sDescricao            := sRFRV;
  nTreeNodeRFRV               := InserePasta(false,Arvore,nTreeNodePai,wItem);



  {Verifica o tipo de renda, se é Fixa/Variável/BMG, e monta a qry
   de acordo com o resultado}
  if sRFRV = 'RF' then begin
    CdsRFRV.Data         := CtrlPerfilCota.ListaAtivosRFRV(1,iIdPerfilCOta);
    frmProgressoDuplo.Legenda := 'Montando RF';
  end else if sRFRV = 'RV' then begin
    CdsRFRV.Data         := CtrlPerfilCota.ListaAtivosRFRV(2,iIdPerfilCOta);
    frmProgressoDuplo.Legenda := 'Montando RV';
  end else if sRFRV = 'BMF' then begin
    CdsRFRV.Data         := CtrlPerfilCota.ListaAtivosRFRV(8,iIdPerfilCOta);
    frmProgressoDuplo.Legenda := 'Montando BM&&F';
  end;

  frmProgressoDuplo.Max2 := CdsRFRV.RecordCount;


 //Faz o loop, inserindo na pasta, comforme resultado da qry

  while not CdsRFRV.Eof do begin
    new(wItem);
    wItem.IDAtivoCota            := CdsRFRV.FieldByName('IDATIVOCOTA').AsInteger;
    wItem.sDescricao             := CdsRFRV.FieldByName ('DESCINVESTIMENTO').AsString;
    InserePapel(Arvore,nTreeNodeRFRV,wItem);
    Inc(Posicao1);
    frmProgressoDuplo.AndaFormProgressoDuplo(ProgressoTotal,Posicao1);
    CdsRFRV.Next;
  end;

  // Passa o valor da variável local Posicao2 para a variável global ProgressoTotal
  CdsRFRV.Close;


 finally
   FreeAndNil(CdsRFRV);
 end;


end;

procedure TfrmConsultaPerfil.MontarCotas(const Arvore: TTreeView;
                                         const nTreeNode: TTreeNode;
                                         iIdPerfilCota: Integer);
var wItem: pItem;
    Posicao1 : integer;
    CdsCotas : TCMClientDataSet;
begin
  try
    CdsCotas := TCMClientDataSet.Create(nil);


    cdsCotas.Data                  := CtrlPerfilCota.ListaCotas(iIdPerfilCota);
    frmProgressoDuplo.Max2         := CdsCotas.RecordCount;
    frmProgressoDuplo.Legenda      := 'Montando Cotas Manuais';
    Posicao1 := 0;

    while not cdsCotas.Eof do begin
      new(wItem);
      wItem.IDAtivoCota := cdsCotas.FieldByName('IDATIVOCOTA').AsInteger;
      wItem.sDescricao  := cdsCotas.FieldByName ('DESCRICAO').AsString;
      InserePapel(Arvore,nTreeNode,wItem);
      Posicao1          := Posicao1 + 1;
      FrmProgressoDuplo.AndaFormProgressoDuplo(ProgressoTotal,Posicao1);
      cdsCotas.Next;
    end;

    ProgressoTotal := 11;
    cdsCotas.Close;
  finally
    FreeAndNil(CdsCotas);
  end;
{ FIM DO PROCEDIMENTO - 07}
end;

procedure TfrmConsultaPerfil.MontarEmprestimo(const Arvore: TTreeView;
                                              const nTreeNode: TTreeNode;
                                              iIdPerfilCota: Integer);
var wItem: pItem;
    Posicao1 : integer;
    CdsEmprestimo : TCmClientDataSet;
begin
  inherited;
  CdsEmprestimo  := TCMClientDataSet.Create(nil);
  try
    //Lista os ativos do empréstimo
    cdsEmprestimo.Data             := CtrlPerfilCota.ListaAtivosEmprestimo(iIdPerfilCota);
    frmProgressoDuplo.Max2         := CdsEmprestimo.RecordCount;
    frmProgressoDuplo.Legenda      := 'Montando Empréstimo';
    Posicao1                       := 0;

    //Insere os dados obtidos no cds para pasta já criada
    while not cdsEmprestimo.Eof do begin
      new(wItem);
      wItem.IDAtivoCota            := cdsEmprestimo.FieldByName ('IDATIVOCOTA').AsInteger;
      wItem.sDescricao             := cdsEmprestimo.FieldByName ('TCEDESCRICAO').AsString;
      InserePapel(Arvore,nTreeNode,wItem);
      Posicao1                     := Posicao1 + 1;
      frmProgressoDuplo.AndaFormProgressoDuplo(ProgressoTotal,Posicao1);
      cdsEmprestimo.Next;
    end;

    ProgressoTotal := 10;
    cdsEmprestimo.Close;
  finally
    FreeAndNil(CdsEmprestimo);
  end;

{ Fim do PROCEDIMENTO - 02}
end;

procedure TfrmConsultaPerfil.MontarImobiliario(const Arvore: TTreeView;
                                               const nTreeNode: TTreeNode;
                                                     iIdPerfilCota: Integer);
var wItem: pItem;
    nTreeNodeImovelMestre, nTreeNodeTipoImovel: TTreeNode;
    sCodTipImovel: string;
    iIdImovelMestre,Posicao1 : integer;
    CdsImobiliario: TCMClientDataSet;
begin
  inherited;
  try
    CdsImobiliario := TCMClientDataSet.Create(nil);

    //Monta a qry de ativos imobiliário
    CdsImobiliario.Data    := CtrlPerfilCota.ListaAtivosImobiliario(iIdPerfilCota);
    frmProgressoDuplo.Max2 := cdsImobiliario.RecordCount;
    frmProgressoDuplo.Legenda := 'Montando Imobiliário';
    Posicao1 := 0;

    while not cdsImobiliario.Eof do begin
      // Fazer um loop para inserir as árvores com os tipos de imóveis
      sCodTipImovel                := cdsImobiliario.FieldByName('CODTIPIMOVEL').AsString;

      // Cria uma pasta referente ao campo CODTIPIMOVEL
      new(wItem);
      wItem.IDAtivoCota            := 0;
      wItem.sDescricao             := sCodTipImovel;
      nTreeNodeTipoImovel          := InserePasta(false,Arvore,nTreeNode,wItem);

      //
      while (sCodTipImovel = cdsImobiliario.FieldByName('CODTIPIMOVEL').AsString) and
            not (cdsImobiliario.Eof) do begin

        // Fazer um loop para inserir imóveis mestres
        iIdImovelMestre            := cdsImobiliario.FieldByName('IDIMOVELMESTRE').AsInteger;
        new(wItem);
        wItem.IDAtivoCota          := 0;
        wItem.sDescricao           := cdsImobiliario.FieldByName('MESTRE').AsString;
        nTreeNodeImovelMestre      := InserePasta(false,Arvore,nTreeNodeTipoImovel,wItem);

        while (sCodTipImovel = cdsImobiliario.FieldByName('CODTIPIMOVEL').AsString) and
              (iIdImovelMestre = cdsImobiliario.FieldByName('IDIMOVELMESTRE').AsInteger) and
              not (cdsImobiliario.Eof) do begin

          new(wItem);
          wItem.IDAtivoCota        := cdsImobiliario.FieldByName('IDATIVOCOTA').AsInteger;
          wItem.sDescricao         := cdsImobiliario.FieldByName('IMONOME').AsString;
          InserePapel(Arvore,nTreeNodeImovelMestre,wItem);
          Inc(Posicao1);
          FrmProgressoDuplo.AndaFormProgressoDuplo(ProgressoTotal,Posicao1);
          cdsImobiliario.Next;
        end;
        ProgressoTotal             := 9;
      end;
    end;
    cdsImobiliario.Close;
  finally
    FreeAndNil(CdsImobiliario);
  end;
{ Fim do PROCEDIMENTO - 03}
end;



procedure TfrmConsultaPerfil.rdPerfilClick(Sender: TObject);
begin
  inherited;
  edPerfil.Clear;
  edTipo.Clear;
  if rdPerfil.ItemIndex = 0 then begin
    trvPerfil.Items.Clear;
    trvCotas.Items.Clear;
    MontarAtivosSPC(trvPerfil);
    InsereCodHierarq(trvPerfil);
  end else begin
    trvPerfil.Items.Clear;
    trvCotas.Items.Clear;
    MontarAtivos(trvPerfil);
    InsereCodHierarq(trvPerfil);
  end;
  if trvPerfil.Items.Count <> 0 then
    trvPerfil.Items.GetFirstNode.Selected := true;
end;

procedure TfrmConsultaPerfil.InsereCodHierarq(const Arvore: TTreeView);
var No: TTreeNode;
    Pos, QtdItens: Integer;
begin
   FrmProgresso.MostraFormProgresso('Aguarde, Processando Itens da Árvore',false,false,true,0,100);
   Pos := 0;
   No := Arvore.Items.GetFirstNode;
   QtdItens := Arvore.Items.Count;
   while No <> nil do
   begin
      if No.ImageIndex = 0 then
        pItem(No.Data)^.CodHierarq := frmCadPerfilCota.RetornaCodHierarquico(Arvore,No);
      No := No.GetNext;
      Inc(Pos);
      FrmProgresso.AndaFormProgresso(Pos,QtdItens);
   end;
   FrmProgresso.EscondeFormProgresso;
end;

procedure TfrmConsultaPerfil.MoveArvore(ArvOrigem, ArvDestino: TTreeView);
var NoGeral, NoDestino: TTreeNode;
    pPasta,pPapel: pItem;
    TotalArvore,PosicaoArv: integer;
begin
  if ArvOrigem.Items.Count <> 0 then begin
    ArvDestino.Items.Clear;
    NoGeral     := ArvOrigem.Items.GetFirstNode;
    NoDestino   := nil;
    TotalArvore := ArvOrigem.Items.Count;
    PosicaoArv  := 0;
    frmProgresso.MostraFormProgresso('Aguarde, inserindo toda a árvore...',false,false,true,0,TotalArvore);

    //  Varre toda a árvore...
    while NoGeral <> nil do begin
      //  Se for uma pasta...
      if NoGeral.ImageIndex = 0 then begin
        pPasta := NoGeral.Data;


        //  Define o nó destino para a pasta
        if NoGeral.Level = 0 then
          pPasta.NoCota  := nil
        else if NoGeral.Level = NoDestino.Level then
          pPasta.NoCota := NoDestino.Parent
        else if NoGeral.Level < NoDestino.Level then begin
          Repeat NoDestino := NoDestino.Parent
          until pItem(NoDestino.Data)^.CodHierarq = pItem(NoGeral.Parent.Data)^.CodHierarq;
          pPasta.NoCota := NoDestino;
        end else
          pPasta.NoCota := NoDestino;

        //  Insere a pasta na arvore
        pPasta.NoPerfil := NoGeral;
        NoDestino := InserePasta((NoGeral.Level = 0),ArvDestino,pPasta.NoCota,pPasta);



      //  Se for um papel...
      end else begin
         pPapel          := NoGeral.Data;
         pPapel.NoPerfil := NoGeral;
         InserePapel(ArvDestino,NoDestino,pPapel);
      end;

      //  Move para o próximo nó e anda a barra de progresso
      NoGeral := NoGeral.GetNext;
      Inc(PosicaoArv);
      frmProgresso.AndaFormProgresso(PosicaoArv,TotalArvore);
    end;
    ArvOrigem.Items.Clear;
    ArvOrigem.Refresh;
    frmProgresso.EscondeFormProgresso;

  end
end;

procedure TfrmConsultaPerfil.PassaNo(No: TTreeNode; ArvOrigem,ArvDestino: TTreeView);
var
NoEncontrado,NoDestino,NoAdeletar: TTreeNode;
Nivel,iIndice,iItemsNo,iPosicao: integer;

begin
  // 1 -  Se o nó selecionado for uma pasta...
  if No.ImageIndex = 0 then begin
    Nivel      := No.Level;
    iIndice    := No.Index;
    NoDestino  := nil;
    NoAdeletar := No;
    iItemsNo   := ContaItemsNo(No);
    iPosicao   := 0;

    frmProgresso.MostraFormProgresso('Aguarde, inserindo o(s) items(s)...',false,false,true,0,iItemsNo);
    // 1.1 - Aqui é inicado um loop, que varre todo o nó selecionado pelo usuário.
    //O loop é feito enquanto o nível do cursor seja igual ao nó selecionado
    //e o índice do cursor seja diferente do nó selecionado.
    while not ((Nivel = No.Level) and (iIndice <> No.Index))  do begin

      // 1.2 - Verifica se o nó em foco é uma pasta
      if No.ImageIndex = 0 then begin

        //  1.3 - Verifica se o nó em foco já existe na árvore de destino
        NoEncontrado := AcharNo(ArvDestino,pItem(No.Data)^.CodHierarq);

        // 1.4 - Caso o nó em foco não exista, o mesmo é criado na a´rvore de destino
        if NoEncontrado = nil then begin

          // 1.5 - Verifica se o nó em foco está no primeiro nível da árvore, e se
          //estiver, define-o com nil
          if No.Level = 0 then
            NoDestino := nil

          // 1.6 - Verifica se à items na árvore de destino
          //Sem esta verificação, ocorre 'Access Violation' devido alguns eventos
          //utilizado neste bloco.
          else if ArvDestino.Items.Count <> 0 then begin

            // 1.7 - Verifica se o nó de destino é null
            if NoDestino = nil then begin

              // 1.8 - Verifica se o nó de destino já existe na árvore de destino
              NoDestino := AcharNo(ArvDestino,pItem(No.Parent.Data)^.CodHierarq);

              // 1.9 - Caso o nó de destino não exista na árvore de destino, é criado
              //o caminho do nó selecionado, na árvore de destino
              if NoDestino = nil then

                // 1.10 - Aqui é criado o caminho do nó em foco, na árvore de destino,
                //e o nó obtido é passado para para o nó de destino
                NoDestino := CriaCaminhoNo(No,ArvOrigem,ArvDestino);

            // 1.11 - Caso o nó de destino não seja null, estas rotinas são executadas
            //Aqui, é verificado se o nível do nó em foco é o mesmo do nó de destino
            end else if No.Level = NoDestino.Level then

              // 1.12 - Se for, o nó de destino recebe o nó 'parent' do próprio
              NoDestino := NoDestino.Parent

            // 1.13 - Caso os níveis do nó em foco e nó destino não sejam iguais,
            //é verificado se o nível do nó em foco é menor que o nível do nó de destino
            else if No.Level < NoDestino.Level then begin

              // 1.14 - Se for, o nó de destino vai pegando o seu 'parent' até
              //que o código hierárquico do nó de destino seja igual ao código
              //hierárquico do nó em foco.
              Repeat NoDestino := NoDestino.Parent
              until pItem(NoDestino.Data)^.CodHierarq = pItem(No.Parent.Data)^.CodHierarq;
            end;

          // 1.15 - Caso a árvore de destino não contenha items, é criado na árvore de
          //destino, o caminho do nó em foco e passado este nó ao nó de destino.
          end else NoDestino := CriaCaminhoNo(No,ArvOrigem,ArvDestino);

          // 1.16 - Finalmente, é criado a pasta na árvore de destino
          NoDestino := InserePasta(false,ArvDestino,NoDestino,No.Data);

        // 1.17 - Caso o nó encontrado não seja nil, então o nó de destino
        //recebe o nó encontrado na árvore de destino.
        end else
          NoDestino := NoEncontrado;

      // 1.18 - Caso o nó em foco seja um papel, é executado este bloco.
      end else begin

        // 1.19 - Verifica se o papél em foco já exite na árvore de destino.
        //Se não existir, é inserido na árvore de destino, na pasta de destino
        if not AcharPapel(ArvDestino,pItem(No.Data)^.IDAtivoCota) then begin
          pItem(No.Data)^.NoPerfil := No;
          InserePapel(ArvDestino,NoDestino,No.Data);
        end;
      end;

      // 1.20 - Move o nó em foco para o próximo nó
      No := No.GetNext;

      // 1.21 - Incrementa um numero à variável 'iPosicao'
      Inc(iPosicao);

      // 1.22 - Faz o gauge do form andar
      frmProgresso.AndaFormProgresso(iPosicao,iItemsNo);

      // 1.23 - Se o nó em foco for nil, então o nó selecionado pelo usuário
      //é deletado e é finalizado o bloco.
      if No = nil then begin
        NoAdeletar.Delete;
        frmProgresso.EscondeFormProgresso;
        Exit;

      // 1.24 - Se o nível do nó em foco for menor que o nó selecionado,
      //então o nó selecionado pelo usuário é deletado e é finalizado o bloco.
      end else if No.Level <= (Nivel -1) then begin
        NoAdeletar.Delete;
        frmProgresso.EscondeFormProgresso;
        Exit;
      end;
    end;


  // 2 -  Se o nó selecionado for um papel...
  end else begin
    NoAdeletar := No;

    // 2.1 - Verifica se a árvore de destino tem items
    if ArvDestino.Items.Count <> 0 then

      // 2.2 - Verifica se o 'parent' do papel em foco existe na árvore de destino.
      //Caso exista, é passa do o nó deste 'parent' para o nó de destino
      NoDestino := AcharNo(ArvDestino,pItem(No.Parent.Data)^.CodHierarq)

    // 2.3 - Caso a árvore de destino não contenha items, o nó de destino é definido
    //como nil.
    else
      NoDestino := nil;

    // 2.4 - Se o nó de destino estiver na árvorte de destino, o papél íe inserido
    if  NoDestino <> nil then begin
      InserePapel(ArvDestino,NoDestino,No.Data);

    // 2.5 - Caso contrário...
    end else begin

      // 2.6 - Cria o caminho do nó de destino na árvore de destino
      //e insere o papél na árvore.
      NoDestino := CriaCaminhoNo(No,ArvOrigem,ArvDestino);
      InserePapel(ArvDestino,NoDestino,No.Data);
    end;
  end;

   // 2.7 - Deleta o nó selecionado pelo usuário
   NoAdeletar.Delete;
   ExcluiPastaVazia(ArvOrigem);
   frmProgresso.EscondeFormProgresso;
end;

function TfrmConsultaPerfil.AcharPapel(Arvore: TTreeView;
  iIdPapel: Integer): Boolean;
var
No: TTreeNode;

begin
  No := Arvore.Items.GetFirstNode;
  Result := false;

  while No <> nil do begin
    if No.ImageIndex <> 0 then begin
      if pItem(No.Data)^.IDAtivoCota = iIdPapel then begin
        Result := True;
        Exit;
      end;
    end;
    No := No.GetNext;
  end;
end;

function TfrmConsultaPerfil.ContaItemsNo(No: TTreeNode): Integer;
var
iItems: integer;
iNivel: integer;

begin
  iNivel := No.Level;
  iItems := 0;
  No := No.GetNext;
  Inc(iItems);

  while No <> nil do begin
    if No.Level <=  iNivel then begin
      Result := iItems;
      Exit;
    end;
    Inc(iItems);
    No := No.GetNext;
  end;

  Result := iItems;
end;

procedure TfrmConsultaPerfil.ExcluiPastaVazia(Arvore: TTreeView);
var
No: TTreeNode;

begin
   No:= Arvore.Items.GetFirstNode;
   while No <> nil do begin
     if No.ImageIndex <> 0 then
       Exit;
     No := No.GetNext;
   end;
   Arvore.Items.Clear;
end;

procedure TfrmConsultaPerfil.trvPerfilDblClick(Sender: TObject);
begin
  inherited;
  btPassaUm.Click;
end;

procedure TfrmConsultaPerfil.trvCotasDblClick(Sender: TObject);
begin
  inherited;
  btVoltaUm.Click;
end;

function TfrmConsultaPerfil.VerificaSeTemAtivo(Arvore: TTreeView): Boolean;
var
No: TTreeNode;

begin
  No     := Arvore.Items.GetFirstNode;
  Result := False;

  while No <> nil do
  begin
    // Se o nó em foco não for uma pasta...
    if No.ImageIndex <> 0 then
    begin
      Result := True;
      Exit;
    end;
    No := No.GetNext;
  end;


end;



procedure TfrmConsultaPerfil.dbGridTotalDiarioTitleButtonClick(
  Sender: TObject; AFieldName: String);
begin
  inherited;
  dtmRelPerfilConsolidado.CdsAtivosEspecif.IndexFieldNames := AFieldName;
end;



function TfrmConsultaPerfil.TrocaPontoOuVirgula(bPonto: Boolean;
  sValor: string): string;
var
i, iItemsString: integer;
sValorFinal: string;

begin
//   Esta função troca todos as vírgulas encontradas na string
//passada por ponto, para poderem ser usadas nas qry's.
   Result       := '';
   iItemsString := Length(sValor);

   for i := 1 to iItemsString do
   begin
     //  Se for trocar vírgula por ponto...
     if bPonto then
     begin
        if sValor[i] = ',' then
           sValorFinal := sValorFinal + '.'
        else
           sValorFinal := sValorFinal + sValor[i];
     end
     else
     //  Se for trocar ponto por vírgula...
     begin
        if sValor[i] = '.' then
           sValorFinal := sValorFinal + ','
        else
           sValorFinal := sValorFinal + sValor[i];
     end;
   end;

   Result := sValorFinal;
end;



function TfrmConsultaPerfil.ExecutaRegra(Regra: TRegraMT; sDtInicio,
  sDtFim, sJuros, sPercentual: string): Boolean;
var
fVlrCotaInicial,fVlrCotaFinal,fVlrCotaDiferenca,fPercValorizacao,fFatorCDI: Extended;

begin
  fVlrCotaDiferenca := 0;
  fVlrCotaFinal     := 0;
  fVlrCotaInicial   := 0;
  fPercValorizacao  := 0;
  fFatorCDI         := 1;


  try

     Result := false;

     //  Insere a qry de entrada com os parâmetros...
     Regra.GeraDataSet(CtrlHstMovCota.ListaSQLEntradaRegra(sDtInicio,sDtFim,TrocaPontoOuVirgula(True,sPercentual),TrocaPontoOuVirgula(True,sJuros)));

     //  Escreve o nome do Indicador no panel
     if cmbRegraIndex.Text <> '' then
        pnlNomeInd.Caption := cmbRegraIndex.Text
     else
        pnlNomeInd.Caption := 'Nenhum indicador foi informado';

     //  Escreve a taxa de juros no panel
     if edTxJuros.Text <> '0,00' then
        pnlTxJuros.Caption := FormatFloat('#0.0000',(StrToFloat(edTxJuros.Text))) + ' % '
     else
        pnlTxJuros.Caption := '0,0000 % ';



//                       Executa a regra de indexador
//==============================================================================
     if cmbRegraIndex.Text <> '' then
     begin
        Regra.RuleNumber := CdsRegraIndex.FieldByName('IDREGRA').AsString;
        if not Regra.Execute then
           Result := False;

        fFatorCDI := StrToFloaT(TrocaPontoOuVirgula(False,Regra.Result));
     end;
//==============================================================================



//                         Executa a regra de juros
//==============================================================================
     if cboRegraJuros.Text <> '' then
     begin
        Regra.RuleNumber := CdsRegraJuros.FieldByName('IDREGRA').AsString;
        if not Regra.Execute then
           Result := False;

        fFatorCDI := fFatorCDI * StrToFloat(TrocaPontoOuVirgula(False,Regra.Result));
     end;
//==============================================================================


     //  Acumula o fator
     fFatorCDI := ((fFatorCDI - 1) * 100);


     //  Escreve o panel Indicador + juros
     pnlIndJuros.Caption := FormatFloat('#0.0000', fFatorCDI) + ' % ';



//                   Escreve a valorização da cota no panel
//==============================================================================
        dtmRelPerfilConsolidado.CdsAtivosConsolidados.DisableControls;
        //  Pega o valor da cota inicial
        dtmRelPerfilConsolidado.CdsAtivosConsolidados.First;
        fVlrCotaInicial := dtmRelPerfilConsolidado.CdsAtivosConsolidadosVLRCOTA.Value;
        //  Pega o valor da cota final
        dtmRelPerfilConsolidado.CdsAtivosConsolidados.Last;
        fVlrCotaFinal   := dtmRelPerfilConsolidado.CdsAtivosConsolidadosVLRCOTA.Value;
        //  Estrai a diferença das cotas
        fVlrCotaDiferenca := fVlrCotaFinal - fVlrCotaInicial;
        //  Calcula o percentual de valorização
        //AL_3
        if (fVlrCotaInicial = 0) or (fVlrCotaDiferenca = 0) then
           fPercValorizacao := 0
        else
           fPercValorizacao := fVlrCotaDiferenca / (fVlrCotaInicial / 100);
        //  Escreve no panel o percentual de valorização
        pnlValorizacao.Caption := FormatFloat('#0.0000',fPercValorizacao) + ' % ';
        // Move ao primeiro registro e habilita os controles
        dtmRelPerfilConsolidado.CdsAtivosConsolidados.First;
        dtmRelPerfilConsolidado.CdsAtivosConsolidados.EnableControls;
//==============================================================================


//              Escreve o percentual sobre o indicador no panel
//==============================================================================
     if (fFatorCDI = 0) or (fFatorCDI = 1) then
        pnlPerSInd.Caption := FormatFloat('#,##0.0000', 0)+' % '
     else
     begin
        if ((fFatorCDI * fPercValorizacao) > 0) then
           pnlPerSInd.Caption := FormatFloat('#,##0.0000', (fPercValorizacao / fFatorCDI) * 100) + ' % '
        else if fFatorCDI < 0 then
           pnlPerSInd.Caption := FormatFloat('#,##0.0000', ((fPercValorizacao / Abs(fFatorCDI)) * 100) + 100) + ' % '
        else
           pnlPerSInd.Caption := FormatFloat('#,##0.0000', ((Abs(fPercValorizacao) / fFatorCDI) * 100) - 100) + ' % '
   end;
//==============================================================================

   Result := True;

  except
     on E: Exception do
     begin
        MsgDlg('Erro ao executar a regra de cálculo.'                    + #13 +
               'Mensagem: ' + E.Message,Sistema.NomeAplicativo, mtError,[mbOk],0);
     end;
  end;
end;



procedure TfrmConsultaPerfil.btExecRegraClick(Sender: TObject);
begin
  inherited;
  if dtmRelPerfilConsolidado.CdsAtivosConsolidados.Active then
     begin
        ExecutaRegra(regIndicadores,edDtInicio.Text,edDtFim.Text,TrocaPontoOuVirgula(True,edTxJuros.Text),sePercentual.Text);
        PagControlAbas.ActivePage := tshIndicadores;
     end;
end;

procedure TfrmConsultaPerfil.CbxPlanoSPCClick(Sender: TObject);
begin
  inherited;
  ChecaPlanoSPC(CbxPlanoSPC.Checked);
end;

// SE PLANO SPC MARCADO, LISTA NO COMBO LISTAPLANOSPC, SE NÃO, LISTAPLANOCONTABIL
procedure TfrmConsultaPerfil.ChecaPlanoSPC(Const bCheck : Boolean);
begin
   if bCheck then
   begin
      cmbPatro.Enabled := False;
      cmbPatro.Clear;
      cmbPlano.Clear;

      CdsPlano.Data := CtrlListTerceiros.ListaPlanoSPC;
   end
   else
   begin
      cmbPatro.Enabled := True;

      if cmbPatro.Text = '' then
         CdsPlano.Data := CtrlHstMovCota.ListaPlanoContabil
      else
         CdsPlano.Data := CtrlPlanPrevContabPatro.ListaPlanoPatro(-1,CdsPatro.FieldByName('IDPATRO').AsInteger,-1);

   end;

   Application.ProcessMessages;
end;

procedure TfrmConsultaPerfil.cmbPatroCloseUp(Sender: TObject; LookupTable,
   FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if modified then
      cmbPlano.Clear;
end;

// AL_1
procedure TfrmConsultaPerfil.smnuNormalClick(Sender: TObject);
var sDescPerfil: string;
begin
  inherited;
  ImprimeRel(False);
end;

// AL_1
procedure TfrmConsultaPerfil.smnuExpandidoClick(Sender: TObject);
begin
  inherited;
  ImprimeRel(True);
end;

// AL_1
procedure TfrmConsultaPerfil.ImprimeRel(Const bExpandido: Boolean);
var sDescPerfil: string;
begin
  with dtmRelPerfilConsolidado do
  begin
     ppLbPeriodo.Caption := 'Período de   '+ edDtInicio.Text + '   à   ' + edDtFim.Text;
     ppLbIndicador.Caption := pnlNomeInd.Caption;
     ppLbTxJuros.Caption   := pnlTxJuros.Caption;
     ppLbIndJuros.Caption  := pnlIndJuros.Caption;
     ppLbVlrCota.Caption   := pnlValorizacao.Caption;
     ppLbSobreInd.Caption  := pnlPerSInd.Caption;

     case rdPerfil.ItemIndex of
        0: sDescPerfil := 'SPC';
        1: sDescPerfil := 'Origem';
     else
        sDescPerfil := CdsPerfilCotaDESCRICAO.AsString + '  -  ' + CdsPerfilCotaTIPOPERFIL.Text;
     end;

     ppLbDescPerfil.Caption := sDescPerfil;
     CdsAtivosEspecif.DisableControls;
     CdsAtivosConsolidados.DisableControls;

     // CRÍTICA PARA ALTERAR O TÍTULO DO RELATÓRIO
     ppLPlanoSPC.Visible := CbxPlanoSPC.Checked;

     if ((Trim(cmbPlano.Text) = '') and (Trim(cmbPatro.Text) = '')) then
     begin
        lnCabecalho.Top      := 1.1042;
        ppLbPeriodo.Top  := 0.8646;
        ppLPlano.Visible := False;
        ppLPatro.Visible := False;
     end
     else
     begin
        ppLPlano.Caption := 'Plano ' + cmbPlano.Text;
        ppLPatro.Caption := 'Patrocinadora ' + cmbPatro.Text;

        if ((Trim(cmbPlano.Text) <> '') and (Trim(cmbPatro.Text) <> '')) then
        begin
           lnCabecalho.Top      := 1.3229;
           ppLbPeriodo.Top  := 0.7813;
           ppLPlano.Top     := 0.9583;
           ppLPatro.Top     := 1.1354;
           ppLPlano.Visible := True;
           ppLPatro.Visible := True;
        end;

        if ((Trim(cmbPlano.Text) <> '') and (Trim(cmbPatro.Text) = '')) then
        begin
           lnCabecalho.Top      := 1.1354;
           ppLbPeriodo.Top  := 0.7813;
           ppLPlano.Top     := 0.9583;
           ppLPatro.Top     := 1.1354;
           ppLPlano.Visible := True;
           ppLPatro.Visible := False;
        end;

        if ((Trim(cmbPlano.Text) = '') and (Trim(cmbPatro.Text) <> '')) then
        begin
           lnCabecalho.Top      := 1.1354;
           ppLbPeriodo.Top  := 0.7813;
           ppLPlano.Top     := 1.1354;
           ppLPatro.Top     := 0.9583;
           ppLPlano.Visible := False;
           ppLPatro.Visible := True;
        end;
     end;

     srptDetDrillMov.ExpandAll := bExpandido;

     //AL_6 - Conposição de Ativos expandida.
     srptComposicaoDet.ExpandAll := bExpandido;

     TFrmPreview.CreateModalPreview(Application,
                                   dtmRelPerfilConsolidado.rpRelPerfilConsolidado,
                                   rpRelPerfilConsolidado.PrinterSetup.DocumentName);
     CdsAtivosEspecif.EnableControls;
     CdsAtivosConsolidados.EnableControls;
  end;
end;

end.
