unit FCadLancPreProntaMT;
(*==============================================================================
Analista           : Marcus Oliveira
Data               : 20/12/2006
Pendência          : 24117
Métodos Atualizados: ListLancaPrePronta.
Descrição          : Removido o outer join do HITCODHIST, pois trazia registro vazio.
(*==============================================================================
Analista           : Marcus Oliveira
Data               : 20/12/2006
Pendência          : 23804
Métodos Atualizados: ListLancaPrePronta
Descrição          : Permitir que a fundação possa optar por código reduzido, Código
                     da conta contabil e código correspondente.
//==============================================================================
// Autor     : Rodolpho da Silva
// Data      : 23/05/2005
// Pendência : 19242
// Descrição : Correção de alguns bug's na tela.
//
//==============================================================================
//==============================================================================
// Autor     : Rodolpho da Silva
// Data      : 17/01/2005
// Pendência : 17425
// Descrição : Implementação da aba Regra Prova Zero
//
//==============================================================================
// Analista: Andre Tavares - pendência 16618 - 17/05/2004 - inclui um parametro opcional no método ListLancaPrePronta
(*==============================================================================
Analista : Alex Pereira
Data     : 19/01/04
Pendência: 14451 Nova estrutura para segregação
Solução  : Criar a estrutura FLGSEGREGACRITER
  Data         : 20/01/04
  Solução      : modificada a criação do uCtrlSegregacao
==============================================================================*)

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, fcLabel, Mask, ComCtrls, TREdit, wwdblook,uCtrlProcessaContab,
  wwdbdatetimepicker, CMDateTimePicker, Db, DBClient, uCMClientDataSet,
  uCtrlPrePlanilhaPP,uCtrlContab,uCtrlHistoContab,uCtrlListTerceiros, MontaSelect,
  CMProcuraMask,uCtrlContaContabil,uCtrlSubConta, DBCtrls, Wwdatsrc,
  uCmSqlParams, uCtrlSegregacao, Grids, Wwdbigrd, Wwdbgrid, uCmTypes;


type
  TfrmCadLancPreProntaMT = class(TfrmOkCancelar)
    Panel1: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label1: TLabel;
    dteData: TCMDateTimePicker;
    dblkPrePronta: TwwDBLookupCombo;
    redDeb: TRealEdit;
    redCre: TRealEdit;
    btnProximo: TBitBtn;
    btnAnterior: TBitBtn;
    pgc1: TPageControl;
    tbsLancamentos: TTabSheet;
    Panel4: TPanel;
    lblStatus: TLabel;
    Panel2: TPanel;
    lblCCustoDeb: TLabel;
    lblSubContaDeb: TLabel;
    dblkCCustoDeb: TwwDBLookupCombo;
    btnSubContaDeb: TBitBtn;
    edtNomeSubContaDeb: TEdit;
    mskSubContaDeb: TMaskEdit;
    Panel10: TPanel;
    Panel11: TPanel;
    fcLabel3: TfcLabel;
    Panel3: TPanel;
    lblCCustoCre: TLabel;
    lblSubContaCre: TLabel;
    dblkCCustoCre: TwwDBLookupCombo;
    btnSubContaCre: TBitBtn;
    edtNomeSubContaCre: TEdit;
    mskSubContaCre: TMaskEdit;
    Panel12: TPanel;
    fcLabel4: TfcLabel;
    tblDetalhes: TTabSheet;
    Panel6: TPanel;
    lbConvOfDeb: TLabel;
    lbConvG1Deb: TLabel;
    lbConvG2Deb: TLabel;
    lbConvG3Deb: TLabel;
    Label23: TLabel;
    Panel9: TPanel;
    fcLabel1: TfcLabel;
    cmbConvOfDeb: TComboBox;
    cmbConvG1Deb: TComboBox;
    cmbConvG2Deb: TComboBox;
    cmbConvG3Deb: TComboBox;
    Panel7: TPanel;
    lbConvOfCre: TLabel;
    lbConvG1Cre: TLabel;
    lbConvG2Cre: TLabel;
    lbConvG3Cre: TLabel;
    Label24: TLabel;
    Panel8: TPanel;
    fcLabel2: TfcLabel;
    cmbConvOfCre: TComboBox;
    cmbConvG1Cre: TComboBox;
    cmbConvG2Cre: TComboBox;
    cmbConvG3Cre: TComboBox;
    CdsPlanilhaPrePronta: TCMClientDataSet;
    CdsPlanoPrev: TCMClientDataSet;
    CdsPatro: TCMClientDataSet;
    CdsAtivProj: TCMClientDataSet;
    CdsTipoOper: TCMClientDataSet;
    CdsHistoPadrao: TCMClientDataSet;
    MontaSelectSubConta: TMontaSelect;
    MontaSelectAtivProj: TMontaSelect;
    CdsCentroCustoD: TCMClientDataSet;
    CdsCentroCustoC: TCMClientDataSet;
    cmpContaCre: TCMProcuraMaskContabil;
    cdsLancamentos: TCMClientDataSet;
    cdsTotalDebCre: TCMClientDataSet;
    ds: TwwDataSource;
    cdsSubConta: TCMClientDataSet;
    redHistDeb: TDBRealEdit;
    redHistCre: TDBRealEdit;
    redOfDeb: TDBRealEdit;
    redG1Deb: TDBRealEdit;
    redG3Deb: TDBRealEdit;
    redOfCre: TDBRealEdit;
    redG1Cre: TDBRealEdit;
    redG3Cre: TDBRealEdit;
    redG2Cre: TDBRealEdit;
    redG2Deb: TDBRealEdit;
    cdsConsiste: TCMClientDataSet;
    cdsAux: TCMClientDataSet;
    sqlAux: TCMSqlParams;
    cdsSegrega: TCMClientDataSet;
    Panel13: TPanel;
    pnlPlanoPatroC: TPanel;
    lblPlanoPrevC: TLabel;
    lblPatroC: TLabel;
    dblcPlanoPrevC: TwwDBLookupCombo;
    dblcPatroC: TwwDBLookupCombo;
    panSegregacao: TPanel;
    Label3: TLabel;
    Label6: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    CMDateTimePicker1: TCMDateTimePicker;
    Panel5: TPanel;
    Label11: TLabel;
    Label9: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    mskUnidNegoc: TMaskEdit;
    dblkHistorico: TwwDBLookupCombo;
    edtAtivProj: TEdit;
    btnAtivProj: TBitBtn;
    Memo1: TMemo;
    mskHist1: TMaskEdit;
    mskHist2: TMaskEdit;
    mskHist3: TMaskEdit;
    mskHist4: TMaskEdit;
    mskHist5: TMaskEdit;
    dblkTipoOper: TwwDBLookupCombo;
    dbDocumento: TDBEdit;
    RedValor: TDBRealEdit;
    mskAtivProj: TMaskEdit;
    tbsRegraZero: TTabSheet;
    dbGrid: TwwDBGrid;
    dsRegraZero: TwwDataSource;
    CdsRegraZero: TCMClientDataSet;
    SqlRegraZero: TCMSqlParams;
    cmpContaDeb: TCMProcuraMaskContabil;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnAtivProjClick(Sender: TObject);
    procedure dblkPreProntaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure cmpContaDebExit(Sender: TObject);
    procedure cmpContaCreExit(Sender: TObject);
    procedure btnSubContaCreClick(Sender: TObject);
    procedure btnSubContaDebClick(Sender: TObject);
    procedure mskSubContaCreExit(Sender: TObject);
    procedure mskSubContaDebExit(Sender: TObject);
    procedure mskAtivProjExit(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure RedValorExit(Sender: TObject);
    procedure dbDocumentoExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblkHistoricoExit(Sender: TObject);
    procedure pgc1Change(Sender: TObject);
    procedure CdsRegraZeroAfterOpen(DataSet: TDataSet);
    procedure dbGridCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure mskHist1Change(Sender: TObject);
  private
    dPlnCodContab :double;
    { Private declarations }
    CtrlContab        : TCtrlContab;
    CtrlHistoContab   : TCtrlHistoContab;
    ListTerceiros     : TCtrlListTerceiros;
    CtrlPlanilhaPP    : TCtrlPrePlanilhaPP;
    CtrlConta         : TCtrlContaContabil;
    CtrlSubConta      : TCtrlSubConta;
    ProcessaContab    : TCtrlProcessaContab;
    CtrlSegregacao    : TCtrlSegregacao;


    //  Variáveis globais utilizada para
    //instanciar campos dentro da procedure MostraLancAtual
    rValorAnt         : Double;
    sDocAnt           : string;

    //  Esta varíável marca o ponto de saída do registro em foco
    //do cdsLancamento, pois no evento pgc1Change(pgc1.ActivePage = tbsRegraZero),
    //é feito uma varredura neste Cds para cálculos de RegraProvaZero
    //desponteirando assim o Cds.
    //  É utilizada para retornar exatemente no registro de saída.
    bmPontoSaida      : TBookmark;


    procedure LimpaLancamentos;
    procedure BuscaAtivProj(sAtivProj:string);
    procedure MostraLancAtual;
    procedure BuscaSubConta(sDebCre, sSubConta:string);
    procedure PreencheHistorico(CodHist :String);
    procedure AtualizaCds;
    procedure LimpaTela;
    procedure AtuParamContab(dCodPla:Double);
    procedure HabilitaBotoes(bHabilita: boolean);


  public
    { Public declarations }
  end;

var
  frmCadLancPreProntaMT: TfrmCadLancPreProntaMT;

implementation

uses dBaseDados, uModulo, uSistema, uString, uMensErro;

{$R *.DFM}



procedure TfrmCadLancPreProntaMT.BuscaAtivProj(sAtivProj:string);
begin
   If sAtivProj <> '' Then
   Begin
      CdsAtivProj.Data :=  ListTerceiros.ListAtivProj(Sistema.IdEmpresa,0,sAtivProj,tapAmbos,toapNome);

      If Not CdsAtivProj.isEmpty Then
      Begin
        If CdsAtivProj.FieldByName('UNETIPO').asString = 'S' Then
        Begin
           MsgDlg('A Atividade/Projeto selecionada deve ser Analítica.','Aviso',mtWarning,[mbOk],0);
           mskAtivProj.SetFocus;
           Exit;
        End Else
        Begin
           mskAtivProj.text  := CdsAtivProj.FieldByName('UNECODIGO').asString;
           mskUnidNegoc.text := IntToStr(CdsAtivProj.FieldByName('UNIDNEGOC').asInteger);
           edtAtivProj.text  := CdsAtivProj.FieldByName('NOME').asString;
        End;
      End Else
      Begin
        MsgDlg('O código da Atividade/Projeto informado não existe.','Aviso',mtWarning,[mbOk],0);
        if mskAtivProj.CanFocus then mskAtivProj.SetFocus;
      End;
    End;

end;




procedure TfrmCadLancPreProntaMT.FormCreate(Sender: TObject);
begin
  inherited;
   // *** Instancia a classe pre-planilha ***
  CtrlPlanilhaPP := TCtrlPrePlanilhaPP.Create;
  CtrlPlanilhaPP.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                             Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CdsPlanilhaPrePronta.Data := CtrlPlanilhaPP.ListPlanilhasPreProntas(Sistema.IdEmpresa);
  CtrlPlanilhaPP.cdsLancamentos := cdsLancamentos;

  // *** Instancia a classe geral ProcessaContab  ***
  ProcessaContab := TCtrlProcessaContab.Create;
  ProcessaContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  // *** Instancia a classe Subconta  ***
  CtrlSubConta := TCtrlSubConta.Create;
  CtrlSubConta.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                             Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  // *** Instancia a classe conta contabil ***
  CtrlConta := TCtrlContaContabil.Create;
  CtrlConta.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                             Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  // *** Instancia a classe Historico Contab ***
  CtrlHistoContab := TCtrlHistoContab.Create;
  CtrlHistoContab.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                             Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CdsHistoPadrao.Data := CtrlHistoContab.ListHistoContab(Sistema.IdEmpresa,tohCodigo,'');


  // *** Instancia a classe CtrlContab ***
  dPlnCodContab  := 0;
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
     MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);
  dPlnCodContab := CtrlContab.PlnCodigo;

  If (CtrlContab.MoedaOficial <> 0) Then
  Begin
     cmbConvOfDeb.Enabled := True;
     cmbConvOfCre.Enabled := True;

     redOfDeb.Enabled   := True;
     redOfCre.Enabled   := True;
     redOfDeb.Color     := clWindow;
     redOfCre.Color     := clWindow;
     redHistDeb.Enabled := True;
     redHistCre.Enabled := True;

  End;

  If (CtrlContab.MoedaGerencial <> 0) Then
  Begin
     cmbConvG1Deb.Enabled := True;
     cmbConvG1Cre.Enabled := True;

     redG1Deb.Enabled   := True;
     redG1Cre.Enabled   := True;
     redG1Deb.Color     := clWindow;
     redG1Cre.Color     := clWindow;
     redHistDeb.Enabled := True;
     redHistCre.Enabled := True;

  End;

  If (CtrlContab.MoedaGeren1 <> 0) Then
  Begin
     cmbConvG2Deb.Enabled := True;
     cmbConvG2Cre.Enabled := True;

     redG2Deb.Enabled   := True;
     redG2Cre.Enabled   := True;
     redG2Deb.Color     := clWindow;
     redG2Cre.Color     := clWindow;
     redHistDeb.Enabled := True;
     redHistCre.Enabled := True;

  End;

  If (CtrlContab.MoedaGeren2 <> 0) Then
  Begin
     cmbConvG3Deb.Enabled := True;
     cmbConvG3Cre.Enabled := True;

     redG3Deb.Enabled   := True;
     redG3Cre.Enabled   := True;
     redG3Deb.Color     := clWindow;
     redG3Cre.Color     := clWindow;
     redHistDeb.Enabled := True;
     redHistCre.Enabled := True;

  End;

  // *** Instancia a classe ListTerceiros ***
  ListTerceiros  := TCtrlListTerceiros.Create;
  ListTerceiros.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                           Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CdsAtivProj.Data  := ListTerceiros.ListAtivProj(Sistema.IdEmpresa,0,'',tapAmbos,toapNome);
  CdsPatro.Data     := ListTerceiros.ListPlanoPatro;
  CdsPlanoPrev.Data := ListTerceiros.ListPlanoPrev;
  CdsTipoOper.Data  := ListTerceiros.ListTipoOper(True);

  //Atribui a máscara da ativ/proj e o filtro de pessoa ao MontaSelect
  MontaSelectAtivProj.Mascaras[0] := modulo.sMascaraUnidNegoc + ';0; ';
  MontaSelectAtivProj.Filtro.Add('UNIDNEGOCIO.IDPESSOA = ' + IntToStr(Sistema.idEmpresa));

  MontaSelectSubConta.Filtro.Add('SUBCONTA.IDPESSOA = ' + IntToStr(Sistema.idEmpresa));

  cmpContaDeb.Plano     := CtrlContab.PlanoParam;
  cmpContaDeb.Mascara   := CtrlContab.MascaraContaParam;
  cmpContaCre.Plano     := CtrlContab.PlanoParam;
  cmpContaCre.Mascara   := CtrlContab.MascaraContaParam;

  mskAtivProj.EditMask  := modulo.sMascaraUnidNegoc + ';0; ';

  If Sistema.UsaPlanoPatro Then
  Begin
    pnlPlanoPatroC.Enabled    := Sistema.UsaPlanoPatro;
    dblcPlanoPrevC.DataField  := 'IDPLANOPREV';
    dblcPlanoPrevC.DataSource := ds;

    dblcPatroC.DataField  := 'IDPATRO';
    dblcPatroC.DataSource := ds;
  End;

  CtrlSegregacao := TCtrlSegregacao.Create;
  CtrlSegregacao.InitializeAs (CtrlPlanilhaPP);
  CtrlSegregacao.GetParams (Sistema.IdEmpresa);
  cdsSegrega.Data := CtrlSegregacao.ListaSegregaCriter;
  panSegregacao.Visible := CtrlSegregacao.SegregaVirtual;

end;

procedure TfrmCadLancPreProntaMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlPlanilhaPP.Free;
  CtrlContab.Free;
  CtrlHistoContab.Free;
  ListTerceiros.Free;
  CtrlConta.Free;
  CtrlSubConta.Free;
  ProcessaContab.free;
  CtrlSegregacao.Free;
end;


procedure TfrmCadLancPreProntaMT.FormShow(Sender: TObject);
begin
  inherited;
  pgc1.ActivePage := tbsLancamentos;
end;




procedure TfrmCadLancPreProntaMT.btnAtivProjClick(Sender: TObject);
begin
  inherited;
   MontaSelectAtivProj.Executar;
   Repaint;
   If MontaSelectAtivProj.RetornouValor Then
      BuscaAtivProj(MontaSelectAtivProj.ValoresChave[0]);
end;




procedure TfrmCadLancPreProntaMT.LimpaLancamentos;
begin

   cmpContaCre.Clear;
   cmpContaDeb.Clear;
   RedValor.Value           := 0;
   dblcPatroC.Text          := '';
   dblkHistorico.Text       := '';
   dblkTipoOper.Text        := '';
   dblcPlanoPrevC.Text      := '';
   dbDocumento.Text         := '';

   dblkCCustoDeb.text       := '';
   dblkCCustoDeb.enabled    := false;
   lblCCustoDeb.enabled     := false;
   dblkCCustoDeb.color      := clBtnFace;

   lblSubContaDeb.enabled   := false;
   mskSubContaDeb.text      := '';
   edtNomeSubContaDeb.text  := '';
   mskSubContaDeb.enabled   := false;
   mskSubContaDeb.color     := clBtnFace;
   edtNomeSubContaDeb.color := clBtnFace;
   btnSubContaDeb.enabled   := false;

   lblCCustoCre.enabled     := false;
   dblkCCustoCre.text       := '';
   dblkCCustoCre.enabled    := false;
   dblkCCustoCre.color      := clBtnFace;

   lblSubContaCre.enabled   := false;
   mskSubContaCre.text      := '';
   edtNomeSubContaCre.text  := '';
   mskSubContaCre.enabled   := false;
   mskSubContaCre.color     := clBtnFace;
   edtNomeSubContaCre.color := clBtnFace;
   btnSubContaCre.enabled   := false;

   mskAtivProj.Text         := '';
   mskUnidNegoc.Text        := '';
   edtAtivProj.Text         := '';


end;


procedure TfrmCadLancPreProntaMT.dblkPreProntaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

  If  dblkPrePronta.Text = '' Then Exit;

  If CdsPlanilhaPrePronta.FieldByName('PANPROCESSADA').asString = 'S' Then
  Begin
     If MsgDlg('Esta Planilha já foi usada neste período. Deseja REALMENTE reprocessá-la?','Aviso',mtConfirmation,[mbYes, mbNo],0)= mrNo Then
        Exit;
  End;

   rValorAnt      := 0;
   redDeb.value   := 0;
   redCre.value   := 0;
   redValor.Text  := '';
   redValor.Value := 0;

   LimpaLancamentos;


   cdsLancamentos.Data := CtrlPlanilhaPP.ListLancaPrePronta(Sistema.Idempresa,
                          CdsPlanilhaPrePronta.FieldByName('PANCODIGO').asFloat, true);
   HabilitaBotoes(true);

   If cdsLancamentos.IsEmpty Then
   Begin
     MsgDlg('A Planilha Pré-Pronta selecionada não tem nenhum lançamento.','Aviso',mtWarning,[mbOk],0);
     HabilitaBotoes(false);
     Exit;
   End;
   //  Este ELSE foi criado, pois quando abria a tela, os botões já
   //estavam habilitados, então, quando o usuário clickava nos mesmos,
   //acontecia o erro de Access Violation, pois o CdsLancamentos estava
   //vazio. Então, estou forçando habilitar os botões somente se
   //houver registros no CdsLancamentos.



  //============================================================================
  if (CtrlContab.PacDebCre = 'B')  then
  begin
     if dPlnCodContab <> 0 then
     begin
        sqlAux.Prepare;
        sqlAux.ParamByName('PLNCODIGO').asFloat := dPlnCodContab;
        sqlAux.Open;


        MsgDlg('Proibido Efetuar Operações com a Planilha Selecionada.'+CHR(13)+'Débito não bate com o Crédito na Planilha '+cdsAux.FieldByName('PLNPLANIL').AsString+' do dia '+cdsAux.FieldByName('PLNDATDIA').AsString+'.'+CHR(13)+'Acerte a planilha indicada para ter acesso as demais.','Aviso',MtWarning,[mbOk],0);

        HabilitaBotoes(false);

        Pgc1.Enabled          := False;
        bbtnConfirmar.Enabled := False;
        bbtnCancelar.Enabled  := False;
        Exit;
     end else
     begin
       HabilitaBotoes(true);

       Pgc1.Enabled          := True;
       bbtnConfirmar.Enabled := True;
       bbtnCancelar.Enabled  := True;
     end;
  end;

   CtrlPlanilhaPP.cdsTotalDebCre.Data := cdsLancamentos.Data;
   cdsConsiste.Data := cdsLancamentos.Data;

   if cdsLancamentos.RecordCount > 200 Then
   Begin
      MsgDlg('A Planilha Pré-Pronta selecionada tem mais do que 200 itens.','Aviso',mtWarning,[mbOk],0);
      Exit;
   End;

   cdsLancamentos.First;


   If (cdsLancamentos.FieldByName('PANTIPO').AsString = 'C') Or
      (cdsLancamentos.FieldByName('PANTIPO').AsString = 'D') Then
   Begin
       MostraLancAtual;
   End Else
   Begin
     If msgDlg('O seguinte Lançamento: ' + CHR(13) +
               '   * Conta: ' + cdsLancamentos.FieldByName('PLACONTA').AsString + CHR(13) +
               '   * Centro de Custo: ' + cdsLancamentos.FieldByName('CODCENTROCUSTO').asString + CHR(13) +
               '   * Documento: ' + cdsLancamentos.FieldByName('NUMDOC').asString + CHR(13) +
               '   * Ativ./Proj.: ' + cdsLancamentos.FieldByName('UNIDNEGOC').asString + CHR(13) +
               'foi configurado como "AMBOS" no Cadastro de Planilhas Pré-Prontas.' + CHR(13) +
               'Ele deve ser considerado como um Lançamento a DÉBITO?', 'Aviso', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
     Begin
       cdsLancamentos.Edit;
       cdsLancamentos.FieldByName('PANTIPO').AsString := 'D';
       cdsLancamentos.Post;
     End Else
     Begin
       cdsLancamentos.Edit;
       cdsLancamentos.FieldByName('PANTIPO').AsString := 'C';
       cdsLancamentos.Post;
     End;
     MostraLancAtual;
   End;
   cdsLancamentos.Edit;

   if not cdsLancamentos.isEmpty then
   begin
     cmpContaCreExit(sender);
     cmpContaDebExit(sender);
   end;

end;




procedure TfrmCadLancPreProntaMT.MostraLancAtual;
var
   sNatureza : string;
begin
   LimpaLancamentos;
   cdsLancamentos.Edit;

   If Not ((cdsLancamentos.FieldByName('PANTIPO').AsString = 'C') Or
          (cdsLancamentos.FieldByName('PANTIPO').AsString = 'D')) Then
   Begin
     If msgDlg('O seguinte Lançamento: ' + CHR(13) +
               '   * Conta: ' + cdsLancamentos.FieldByName('PLACONTA').AsString + CHR(13) +
               '   * Centro de Custo: ' + cdsLancamentos.FieldByName('CODCENTROCUSTO').asString + CHR(13) +
               '   * Documento: ' + cdsLancamentos.FieldByName('NUMDOC').asString + CHR(13) +
               '   * Ativ./Proj.: ' + cdsLancamentos.FieldByName('UNIDNEGOC').asString + CHR(13) +
               'foi configurado como "AMBOS" no Cadastro de Planilhas Pré-Prontas.' + CHR(13) +
               'Ele deve ser considerado como um Lançamento a DÉBITO?', 'Aviso', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
     Begin
       cdsLancamentos.FieldByName('PANTIPO').AsString := 'D';
       cdsLancamentos.Post;
     End Else
     Begin
       cdsLancamentos.FieldByName('PANTIPO').AsString := 'C';
       cdsLancamentos.Post;
     End;
     cdsLancamentos.Edit;
   End;

  if (CtrlContab.PlaReduz = 'R') and (cdsLancamentos.FieldByName('PANTIPO').AsString = 'C') then
  begin
    cmpContaCre.CampoPesquisa := cpPlaReduz;
    cmpContaCre.DataField := 'PLAREDUZC';
    cmpContaDeb.Clear;
    cmpContaDeb.Caption   := 'Conta Contábil (Cod.Red)';
    cmpContaCre.Caption   := 'Conta Contábil (Cod.Red)';
    cmpContaCreExit(self);
    cmpContaDebExit(self);

  end else

  if (CtrlContab.PlaReduz = 'C') and (cdsLancamentos.FieldByName('PANTIPO').AsString = 'C') then
  begin
    cmpContaCre.CampoPesquisa := cpPlaConta;
    cmpContaCre.DataField := 'PLACONTAC';
    cmpContaDeb.Caption   := 'Conta Contábil';
    cmpContaCre.Caption   := 'Conta Contábil';
    cmpContaDeb.Clear;
    cmpContaCreExit(self);
    cmpContaDebExit(self);
  end else

  if (CtrlContab.PlaReduz = 'P') and (cdsLancamentos.FieldByName('PANTIPO').AsString = 'C') then
  begin
    cmpContaCre.CampoPesquisa := cpPlaCorresp;
    cmpContaCre.DataField := 'PLACONCORRESPC';
    cmpContaDeb.Clear;
    cmpContaDeb.Caption   := 'Conta Contábil (Cod.Corresp)';
    cmpContaCre.Caption   := 'Conta Contábil (Cod.Corresp)';
    cmpContaCreExit(self);
    cmpContaDebExit(self);
  end else
   //Fim de Crédito
  if (CtrlContab.PlaReduz = 'R') and (cdsLancamentos.FieldByName('PANTIPO').AsString = 'D') then
  begin
    cmpContaDeb.CampoPesquisa := cpPlaReduz;
    cmpContaDeb.DataField := 'PLAREDUZD';
    cmpContaCre.Clear;
    cmpContaDeb.Caption   := 'Conta Contábil (Cod.Red)';
    cmpContaCre.Caption   := 'Conta Contábil (Cod.Red)';
    cmpContaCreExit(self);
    cmpContaDebExit(self);
  end else

  if (CtrlContab.PlaReduz = 'C') and (cdsLancamentos.FieldByName('PANTIPO').AsString = 'D') then
  begin
    cmpContaDeb.CampoPesquisa := cpPlaConta;
    cmpContaDeb.DataField := 'PLACONTAD';
    cmpContaDeb.Caption   := 'Conta Contábil';
    cmpContaCre.Caption   := 'Conta Contábil';
    cmpContaCre.Clear;
    cmpContaCreExit(self);
    cmpContaDebExit(self);
  end else

  if (CtrlContab.PlaReduz = 'P') and (cdsLancamentos.FieldByName('PANTIPO').AsString = 'D') then
  begin
    cmpContaDeb.CampoPesquisa := cpPlaCorresp;
    cmpContaDeb.DataField := 'PLACONCORRESPD';
    cmpContaCre.Clear;
    cmpContaDeb.Caption   := 'Conta Contábil (Cod.Corresp)';
    cmpContaCre.Caption   := 'Conta Contábil (Cod.Corresp)';
    cmpContaCreExit(self);
    cmpContaDebExit(self);
  end;
  //Fim Débito Marcus Oliveira


   If CtrlPlanilhaPP.TemHistoIguais(Sistema.idEmpresa,cdsLancamentos.FieldByName('PANCODIGO').asInteger) Then
   Begin
     cdsLancamentos.FieldByName('HIST1').asString := mskHist1.text;
     cdsLancamentos.FieldByName('HIST2').asString := mskHist2.text;
     cdsLancamentos.FieldByName('HIST3').asString := mskHist3.text;
     cdsLancamentos.FieldByName('HIST4').asString := mskHist4.text;
     cdsLancamentos.FieldByName('HIST5').asString := mskHist5.text;
   End Else
   Begin
     mskHist1.text := cdsLancamentos.FieldByName('HIST1').asString;
     mskHist2.text := cdsLancamentos.FieldByName('HIST2').asString;
     mskHist3.text := cdsLancamentos.FieldByName('HIST3').asString;
     mskHist4.text := cdsLancamentos.FieldByName('HIST4').asString;
     mskHist5.text := cdsLancamentos.FieldByName('HIST5').asString;
   End;

   BuscaAtivProj(cdsLancamentos.FieldByName('UNECODIGO').asString);

   cmbConvOfDeb.itemIndex := CtrlPlanilhaPP.RetornaIndiceTipConv(cdsLancamentos.FieldByName('CONVOFDEB').asString);
   cmbConvG1Deb.itemIndex := CtrlPlanilhaPP.RetornaIndiceTipConv(cdsLancamentos.FieldByName('CONVG1DEB').asString);
   cmbConvG2Deb.itemIndex := CtrlPlanilhaPP.RetornaIndiceTipConv(cdsLancamentos.FieldByName('CONVG2DEB').asString);
   cmbConvG3Deb.itemIndex := CtrlPlanilhaPP.RetornaIndiceTipConv(cdsLancamentos.FieldByName('CONVG3DEB').asString);

   cmbConvOfCre.itemIndex := CtrlPlanilhaPP.RetornaIndiceTipConv(cdsLancamentos.FieldByName('CONVOFCRE').asString);
   cmbConvG1Cre.itemIndex := CtrlPlanilhaPP.RetornaIndiceTipConv(cdsLancamentos.FieldByName('CONVG1CRE').asString);
   cmbConvG2Cre.itemIndex := CtrlPlanilhaPP.RetornaIndiceTipConv(cdsLancamentos.FieldByName('CONVG2CRE').asString);
   cmbConvG3Cre.itemIndex := CtrlPlanilhaPP.RetornaIndiceTipConv(cdsLancamentos.FieldByName('CONVG3CRE').asString);

   If cdsLancamentos.FieldByName('PANTIPO').asString = 'C' Then
      sNatureza := 'Crédito'
   Else
   If cdsLancamentos.FieldByName('PANTIPO').asString = 'D' Then
      sNatureza := 'Débito';


   If cdsLancamentos.FieldByName('VALOR').AsFloat = 0 Then
      cdsLancamentos.FieldByName('VALOR').asFloat := rValorAnt;

   If cdsLancamentos.FieldByName('NUMDOC').AsString = '' Then
      cdsLancamentos.FieldByName('NUMDOC').asString := sDocAnt;

   lblStatus.caption := 'Lançamento Nº ' + cdsLancamentos.FieldByName('NUMORDEM').AsString + ' de ' + IntToStr(cdsLancamentos.RecordCount) + ' - ' + sNatureza;
   dblkHistoricoExit(self);
end;


procedure TfrmCadLancPreProntaMT.cmpContaDebExit(Sender: TObject);
var sContaAux: string;
begin
  inherited;

  CdsCentroCustoD.Close;
  cmpContaDeb.Valida;
  sContaAux := '';
  if Trim(cmpContaDeb.Conta.Numero) <> '' then
    sContaAux := Trim(cmpContaDeb.Conta.Numero)
  else if cmpContaDeb.DataField <> '' then
    sContaAux := trim(cdsLancamentos.FieldByName(cmpContaDeb.DataField).asString);

  CtrlConta.TestaContaContabil(CtrlContab.PlanoParam, sistema.idempresa,  0, 0, sContaAux, true, true);
  if (CtrlConta.ObrigaCentroCusto = 'S') then
  Begin
    dblkCCustoCre.Text       := '';

    dblkCCustoDeb.DataSource := ds;
    dblkCCustoDeb.DataField  := 'CODCENTROCUSTO';

    lblCCustoDeb.enabled  := true;
    dblkCCustoDeb.enabled := true;
    dblkCCustoDeb.color   := clWindow;

    CdsCentroCustoD.Data  := CtrlConta.ListContasxCC(CtrlContab.PlanoParam,Sistema.IdEmpresa,
                                                     sContaAux, '',tccAmbasCC,toCodigo);

    if (cdsLancamentos.Active) and (trim(dblkCCustoDeb.datafield) <> '') then
    begin
      dblkCCustoDeb.Enabled := true;
      dblkCCustoDeb.LookupValue := cdsLancamentos.fieldbyName('CODCENTROCUSTO').asString;
      dblkCCustoDeb.RefreshDisplay;
    end;

  End Else
  Begin

    dblkCCustoDeb.DataSource := nil;
    dblkCCustoDeb.Text       := '';
    dblkCCustoDeb.DataField  := '';

    lblCCustoDeb.enabled  := false;
    dblkCCustoDeb.enabled := false;
    dblkCCustoDeb.color   := clBtnFace;
  End;

  if (CtrlConta.ObrigaSubConta = 'S') then
  Begin
     mskSubContaCre.Text      := '';
     edtNomeSubContaCre.Text  := '';

     lblSubContaDeb.enabled   := true;
     mskSubContaDeb.enabled   := true;
     mskSubContaDeb.color     := clWindow;
     edtNomeSubContaDeb.color := clWindow;
     btnSubContaDeb.enabled   := true;
   End Else
   Begin
     mskSubContaCre.Text      := '';
     edtNomeSubContaCre.Text  := '';

     lblSubContaDeb.enabled   := false;
     mskSubContaDeb.enabled   := false;
     mskSubContaDeb.color     := clBtnFace;
     edtNomeSubContaDeb.color := clBtnFace;
     btnSubContaDeb.enabled   := false;
     mskSubContaDeb.Text      := '';
   End;

   if cdsLancamentos.Active then
     if not cdsLancamentos.FieldByName('CODSUBCONTA').isNull then
     begin
       mskSubContaDeb.Text     := FloatToStr(cdsLancamentos.FieldByName('CODSUBCONTA').asFloat);
       edtNomeSubContaDeb.Text := cdsLancamentos.FieldByName('NOMESUBCONTA').asString;
     end;
end;




procedure TfrmCadLancPreProntaMT.cmpContaCreExit(Sender: TObject);
var sAux, sContaAux: string;
begin
  inherited;
  CdsCentroCustoC.Close;
  cmpContaCre.Valida;
  sContaAux := '';

  if Trim(cmpContaCre.Conta.Numero) <> '' then
    sContaAux := Trim(cmpContaCre.Conta.Numero)
  else if cmpContaCre.DataField <> '' then
    sContaAux := trim(cdsLancamentos.FieldByName(cmpContaCre.DataField).asString);

  CtrlConta.TestaContaContabil(CtrlContab.PlanoParam, sistema.idempresa,  0, 0, sContaAux, true, true);
  if (CtrlConta.ObrigaCentroCusto = 'S') then
  begin

    lblCCustoCre.enabled  := true;
    dblkCCustoCre.enabled := true;
    dblkCCustoCre.color   := clWindow;
    dblkCCustoCre.DataSource := ds;
    dblkCCustoCre.DataField  := 'CODCENTROCUSTO';

    CdsCentroCustoC.Data  := CtrlConta.ListContasxCC(CtrlContab.PlanoParam,Sistema.IdEmpresa,
                                       sContaAux, '',tccAmbasCC,toCodigo);

    if (cdsLancamentos.Active) and (trim(dblkCCustoCre.datafield) <> '') then
    begin
      dblkCCustoCre.Enabled := true;
      dblkCCustoCre.LookupValue := cdsLancamentos.fieldbyName('CODCENTROCUSTO').asString;
      dblkCCustoCre.RefreshDisplay;
    end;

  End Else
  Begin

    dblkCCustoCre.DataSource := nil;
    dblkCCustoCre.DataField  := '';
    dblkCCustoCre.text    := '';

    lblCCustoCre.enabled  := false;
    dblkCCustoCre.enabled := false;
    dblkCCustoCre.color   := clBtnFace;
  End;

  if (CtrlConta.ObrigaSubConta = 'S') then
  Begin
     mskSubContaDeb.Text      := '';
     edtNomeSubContaDeb.Text  := '';

     lblSubContaCre.enabled   := true;
     mskSubContaCre.enabled   := true;
     mskSubContaCre.color     := clWindow;
     edtNomeSubContaCre.color := clWindow;
     btnSubContaCre.enabled   := true;
   End Else
   Begin
     mskSubContaDeb.Text      := '';
     edtNomeSubContaDeb.Text  := '';

     lblSubContaCre.enabled   := false;
     mskSubContaCre.Text      := '';
     mskSubContaCre.enabled   := false;
     mskSubContaCre.color     := clBtnFace;
     edtNomeSubContaCre.color := clBtnFace;
     btnSubContaCre.enabled   := false;
   End;

   if cdsLancamentos.Active then
     if not cdsLancamentos.FieldByName('CODSUBCONTA').isNull then
     begin
       mskSubContaCre.Text     := FloatToStr(cdsLancamentos.FieldByName('CODSUBCONTA').asFloat);
       edtNomeSubContaCre.Text := cdsLancamentos.FieldByName('NOMESUBCONTA').asString;
     end;
end;




procedure TfrmCadLancPreProntaMT.btnSubContaCreClick(Sender: TObject);
begin
  inherited;
   MontaSelectSubConta.Executar;
   Repaint;
   if MontaSelectSubConta.RetornouValor Then
   Begin
      BuscaSubConta('C', MontaSelectSubConta.ValoresChave[0]);
   End;
end;




procedure TfrmCadLancPreProntaMT.BuscaSubConta(sDebCre, sSubConta: string);
begin
   cdsSubConta.Data := CtrlSubConta.ListSubConta(Sistema.IdEmpresa,StrToInt(sSubConta));

   If Not cdsSubConta.isEmpty Then
   Begin
      If sDebCre = 'D' Then
      Begin
         mskSubContaDeb.text     := IntToStr(cdsSubConta.FieldByName('CODSUBCONTA').asInteger);
         edtNomeSubContaDeb.text := cdsSubConta.FieldByName('NOMESUBCONTA').asString;
      End Else
      Begin
         mskSubContaCre.text     := IntToStr(cdsSubConta.FieldByName('CODSUBCONTA').asInteger);
         edtNomeSubContaCre.text := cdsSubConta.FieldByName('NOMESUBCONTA').asString;
      End;
   End Else
   Begin
     MsgDlg('O código da sub-conta informado não existe.','Aviso',mtWarning,[mbOk],0);
     If sDebCre = 'D' Then
        mskSubContaDeb.SetFocus
     Else
        mskSubContaCre.SetFocus;
   End;
end;




procedure TfrmCadLancPreProntaMT.btnSubContaDebClick(Sender: TObject);
begin
  inherited;
   MontaSelectSubConta.Executar;
   Repaint;
   if MontaSelectSubConta.RetornouValor Then
   Begin
      BuscaSubConta('D', MontaSelectSubConta.ValoresChave[0]);
   End;
end;




procedure TfrmCadLancPreProntaMT.mskSubContaCreExit(Sender: TObject);
begin
   inherited;
   If  mskSubContaCre.Text <> '' Then
       BuscaSubConta('C', mskSubContaCre.Text);
end;




procedure TfrmCadLancPreProntaMT.mskSubContaDebExit(Sender: TObject);
begin
  inherited;
   If  mskSubContaDeb.Text <> '' Then
       BuscaSubConta('D', mskSubContaDeb.Text);
end;




procedure TfrmCadLancPreProntaMT.mskAtivProjExit(Sender: TObject);
begin
  inherited;
   If mskAtivProj.Text <> '' Then
      BuscaAtivProj(mskAtivProj.Text);
end;




procedure TfrmCadLancPreProntaMT.PreencheHistorico(CodHist :String);
begin
      CdsHistoPadrao.Data := CtrlHistoContab.ListHistoContab(Sistema.IdEmpresa,tohCodigo,dblkHistorico.LookupValue);

      CtrlHistoContab.ArrumaHistorico(cdsHistoPadrao.FieldByName('HITDESCR1').asString);

      CtrlHistoContab.FormataLinhasHisto(CtrlHistoContab.Hist1,CtrlHistoContab.Hist2,
                                         CtrlHistoContab.Hist3,CtrlHistoContab.Hist4,
                                         CtrlHistoContab.Hist5);

      mskHist1.EditMask := CtrlHistoContab.Hist1;
      mskHist2.EditMask := CtrlHistoContab.Hist2;
      mskHist3.EditMask := CtrlHistoContab.Hist3;
      mskHist4.EditMask := CtrlHistoContab.Hist4;
      mskHist5.EditMask := CtrlHistoContab.Hist5;
end;




procedure TfrmCadLancPreProntaMT.btnProximoClick(Sender: TObject);
begin
  inherited;
  AtualizaCds;
  CtrlPlanilhaPP.cdsTotalDebCre.Data := cdsLancamentos.Data;
  cdsConsiste.Data := cdsLancamentos.Data;

  CtrlPlanilhaPP.TotalizaDebCre;
  redDeb.Value := CtrlPlanilhaPP.TotalredDeb;
  redCre.Value := CtrlPlanilhaPP.TotalredCre;

  If (cdsLancamentos.RecNo = cdsLancamentos.RecordCount) Then
  begin
     pgc1.ActivePage := tbsRegraZero;
     pgc1.OnChange(self);
  end

  else
  begin
    cdsLancamentos.Next;
    MostraLancAtual;

    HabilitaBotoes(true);
  end;
end;




procedure TfrmCadLancPreProntaMT.btnAnteriorClick(Sender: TObject);
begin
  inherited;
  AtualizaCds;
  CtrlPlanilhaPP.cdsTotalDebCre.Data := cdsLancamentos.Data;
  cdsConsiste.Data := cdsLancamentos.Data;

  CtrlPlanilhaPP.TotalizaDebCre;
  redDeb.Value := CtrlPlanilhaPP.TotalredDeb;
  redCre.Value := CtrlPlanilhaPP.TotalredCre;

  cdsLancamentos.Prior;
  MostraLancAtual;

  HabilitaBotoes(true);
end;




procedure TfrmCadLancPreProntaMT.AtualizaCds;
begin
  cdsLancamentos.Edit;

  If (cdsLancamentos.FieldByName('PANTIPO').AsString = 'C') Then
  Begin
    if mskSubContaCre.text <> '' then
       cdsLancamentos.FieldByName('CODSUBCONTA').asFloat := StrToFloat(mskSubContaCre.text)
  End Else
  Begin
    if mskSubContaDeb.text <> '' then
       cdsLancamentos.FieldByName('CODSUBCONTA').asFloat := StrToFloat(mskSubContaDeb.text);
  End;

  cdsLancamentos.FieldByName('HITCODHIST').asString  := dblkHistorico.text;

  cdsLancamentos.FieldByName('UNECODIGO').asString   := mskAtivProj.Text;

  if mskUnidNegoc.Text <> '' then
     cdsLancamentos.FieldByName('UNIDNEGOC').asFloat    := StrToFloat(mskUnidNegoc.Text)
  else
     cdsLancamentos.FieldByName('UNIDNEGOC').asFloat    := 0;

  cdsLancamentos.FieldByName('CONVOFDEB').asString   := CtrlPlanilhaPP.RetornaTipConv(cmbConvOfDeb.itemIndex);
  cdsLancamentos.FieldByName('CONVG1DEB').asString   := CtrlPlanilhaPP.RetornaTipConv(cmbConvG1Deb.itemIndex);
  cdsLancamentos.FieldByName('CONVG2DEB').asString   := CtrlPlanilhaPP.RetornaTipConv(cmbConvG2Deb.itemIndex);
  cdsLancamentos.FieldByName('CONVG3DEB').asString   := CtrlPlanilhaPP.RetornaTipConv(cmbConvG3Deb.itemIndex);

  cdsLancamentos.FieldByName('CONVOFCRE').asString   := CtrlPlanilhaPP.RetornaTipConv(cmbConvOfCre.itemIndex);
  cdsLancamentos.FieldByName('CONVG1CRE').asString   := CtrlPlanilhaPP.RetornaTipConv(cmbConvG1Cre.itemIndex);
  cdsLancamentos.FieldByName('CONVG2CRE').asString   := CtrlPlanilhaPP.RetornaTipConv(cmbConvG2Cre.itemIndex);
  cdsLancamentos.FieldByName('CONVG3CRE').asString   := CtrlPlanilhaPP.RetornaTipConv(cmbConvG3Cre.itemIndex);

  cdsLancamentos.FieldByName('HIST1').asString := mskHist1.text;
  cdsLancamentos.FieldByName('HIST2').asString := mskHist2.text;
  cdsLancamentos.FieldByName('HIST3').asString := mskHist3.text;
  cdsLancamentos.FieldByName('HIST4').asString := mskHist4.text;
  cdsLancamentos.FieldByName('HIST5').asString := mskHist5.text;
  cdsLancamentos.Post;
end;




procedure TfrmCadLancPreProntaMT.RedValorExit(Sender: TObject);
begin
  inherited;
  rValorAnt  := redValor.Value;

  AtualizaCds;
  CtrlPlanilhaPP.cdsTotalDebCre.Data := cdsLancamentos.Data;
  cdsConsiste.Data := cdsLancamentos.Data;

  CtrlPlanilhaPP.TotalizaDebCre;
  redDeb.Value := CtrlPlanilhaPP.TotalredDeb;
  redCre.Value := CtrlPlanilhaPP.TotalredCre;

  HabilitaBotoes(true);
end;




procedure TfrmCadLancPreProntaMT.dbDocumentoExit(Sender: TObject);
begin
  inherited;
  sDocAnt := dbDocumento.Text;
end;




procedure TfrmCadLancPreProntaMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  AtualizaCds;
  CtrlPlanilhaPP.cdsTotalDebCre.Data := cdsLancamentos.Data;
  CtrlPlanilhaPP.TotalizaDebCre;

  If dteData.Text = '' then
  Begin
    MsgDlg('A Data da Planilha deve ser Informada.' ,'Aviso',mtWarning,[mbOk],0);
    dteData.SetFocus;
    Exit;
  End;

  If (CtrlPlanilhaPP.TotalredDeb = 0) and (CtrlPlanilhaPP.TotalredCre = 0) then
  Begin
    MsgDlg('Lançamentos incompletos, Campo valor não preenchido.' ,'Aviso',mtWarning,[mbOk],0);
    Exit;
  End;

  If cdsLancamentos.IsEmpty Then
  Begin
    MsgDlg('Planilha sem Lançamentos.' ,'Aviso',mtWarning,[mbOk],0);
    Exit;
  End;

  if (CtrlContab.PacDebCre = 'B') or (CtrlContab.PacDebCre = 'S') then
  begin
     If (CtrlPlanilhaPP.TotalredDeb <> CtrlPlanilhaPP.TotalredCre)  then
        MsgDlg('O Débito não está batendo com o Crédito.','Erro',MtError,[mbOk],0);
  end;


  // *** consiste dados de tela de acordo com os parametros
  cdsConsiste.Data := cdsLancamentos.Data;
  cdsConsiste.First;
  While Not cdsConsiste.Eof Do
  Begin
     If cdsConsiste.FieldByName('PANTIPO').asString = 'D' Then
     Begin
       If (cdsConsiste.FieldByName('PLACONTA').asString <> '') AND
          (dblkCCustoDeb.enabled = True) AND
          (dblkCCustoDeb.text    = '') Then
       Begin
          MsgDlg('Lançamento No. ' + IntToStr(cdsLancamentos.RecNo) + ': Conta a Débito obriga Centro de Custo.','Aviso',mtWarning,[mbOk],0);
          pgc1.ActivePage := tbsLancamentos;
          cdsLancamentos.Locate('PANCODIGO',cdsConsiste.FieldByName('PANCODIGO').asFloat,[]);
          MostraLancAtual;
          cdsLancamentos.Edit;
          dblkCCustoDeb.SetFocus;
          Abort;
       End;

       If (cdsConsiste.FieldByName('PLACONTA').asString <> '') And
          (mskSubContaDeb.enabled = True) AND
          (mskSubContaDeb.text = '') Then
       Begin
          MsgDlg('Lançamento No. ' + IntToStr(cdsLancamentos.RecNo) + ': Conta a Débito obriga Sub-Conta.','Aviso',mtWarning,[mbOk],0);
          pgc1.ActivePage := tbsLancamentos;
          cdsLancamentos.Locate('PANCODIGO',cdsConsiste.FieldByName('PANCODIGO').asFloat,[]);
          MostraLancAtual;
          cdsLancamentos.Edit;
          mskSubContaDeb.SetFocus;
          Abort;
       End;
     End;

     If cdsConsiste.FieldByName('PANTIPO').asString = 'C' Then
     Begin
       If (cdsConsiste.FieldByName('PLACONTA').asString <> '') AND
          (dblkCCustoCre.enabled = True) AND
          (dblkCCustoCre.text    = '') Then
       Begin
          MsgDlg('Lançamento No. ' + IntToStr(cdsLancamentos.RecNo) + ': Conta a Crédito obriga Centro de Custo.','Aviso',mtWarning,[mbOk],0);
          pgc1.ActivePage := tbsLancamentos;
          cdsLancamentos.Locate('PANCODIGO',cdsConsiste.FieldByName('PANCODIGO').asFloat,[]);
          MostraLancAtual;
          cdsLancamentos.Edit;
          dblkCCustoCre.SetFocus;
          Abort;
       End;

       If (cdsConsiste.FieldByName('PLACONTA').asString <> '') And
          (mskSubContaCre.enabled = True) AND
          (mskSubContaCre.text = '') Then
       Begin
          MsgDlg('Lançamento No. ' + IntToStr(cdsLancamentos.RecNo) + ': Conta a Crédito obriga Sub-Conta.','Aviso',mtWarning,[mbOk],0);
          pgc1.ActivePage := tbsLancamentos;
          cdsLancamentos.Locate('PANCODIGO',cdsConsiste.FieldByName('PANCODIGO').asFloat,[]);
          MostraLancAtual;
          cdsLancamentos.Edit;
          mskSubContaCre.SetFocus;
          Abort;
       End;
     End;

     If CtrlContab.ObrigaNumDoc = 'S' Then
     Begin
        If cdsConsiste.FieldByName('NUMDOC').asString = '' Then
        Begin
          MsgDlg('Lançamento No. ' + IntToStr(cdsLancamentos.RecNo) + ': Número do Documento não preenchido.','Aviso',mtWarning,[mbOk],0);
          cdsLancamentos.Locate('PANCODIGO',cdsConsiste.FieldByName('PANCODIGO').asFloat,[]);
          MostraLancAtual;
          cdsLancamentos.Edit;
          pgc1.ActivePage := tbsLancamentos;
          dbDocumento.SetFocus;
          Abort;
        End;
     End;

     If CtrlContab.ObrigaHistorico = 'S' Then
     Begin
        If cdsConsiste.FieldByName('HITCODHIST').asString = '' Then
        Begin
          MsgDlg('Lançamento No. ' + IntToStr(cdsLancamentos.RecNo) + ': Código do Histórico não preenchido.','Aviso',mtWarning,[mbOk],0);
          cdsLancamentos.Locate('PANCODIGO',cdsConsiste.FieldByName('PANCODIGO').asFloat,[]);
          MostraLancAtual;
          cdsLancamentos.Edit;
          pgc1.ActivePage := tbsLancamentos;
          dblkHistorico.SetFocus;
          Abort;
        End;
     End;

     If CtrlContab.ObrigaTipoOper = 'S' Then
     Begin
       If cdsConsiste.FieldByName('TIPCODIGO').asString = '' Then
       Begin
         MsgDlg('Lançamento No. ' + IntToStr(cdsLancamentos.RecNo) + ': Tipo da Operação não preenchida.','Aviso',mtWarning,[mbOk],0);
         cdsLancamentos.Locate('PANCODIGO',cdsConsiste.FieldByName('PANCODIGO').asFloat,[]);
         MostraLancAtual;
         cdsLancamentos.Edit;
         pgc1.ActivePage := tbsLancamentos;
         dblkTipoOper.SetFocus;
         Abort;
       End;
     End;

     If Sistema.UsaPlanoPatro Then
     Begin
        If cdsConsiste.FieldByName('IDPLANOPREV').asFloat = 0 Then
        Begin
           MsgDlg('Lançamento No. ' + IntToStr(cdsLancamentos.RecNo) + ': Plano Previdenciário não preenchido.','Aviso',mtWarning,[mbOk],0);
           cdsLancamentos.Locate('PANCODIGO',cdsConsiste.FieldByName('PANCODIGO').asFloat,[]);
           MostraLancAtual;
           cdsLancamentos.Edit;
           pgc1.ActivePage := tbsLancamentos;
           dblcPlanoPrevC.SetFocus;
           Abort;
        End;
        If cdsConsiste.FieldByName('IDPATRO').asFloat = 0 Then
        Begin
           MsgDlg('Lançamento No. ' + IntToStr(cdsLancamentos.RecNo) + ': Patrocinadora não preenchida.','Aviso',mtWarning,[mbOk],0);
           cdsLancamentos.Locate('PANCODIGO',cdsConsiste.FieldByName('PANCODIGO').asFloat,[]);
           MostraLancAtual;
           cdsLancamentos.Edit;
           pgc1.ActivePage := tbsLancamentos;
           dblcPatroC.SetFocus;
           Abort;
        End;
     End;

     cdsConsiste.Next;
  End;

  If CtrlPlanilhaPP.FazLancamentos(Sistema.IdEmpresa,Sistema.IdModulo,CtrlContab.PlanoParam,
                                  Sistema.idUsuario,dteData.Text,False,Sistema.UsaPlanoPatro) Then
  begin
     if (CtrlContab.PacDebCre = 'B') then
        AtuParamContab(CtrlPlanilhaPP.CodPlanilha);

     MsgDlg(CtrlPlanilhaPP.MessageInfo,'Aviso',mtInformation,[mbOk],0);
     LimpaTela;
  End Else
     MsgDlg(CtrlPlanilhaPP.MessageInfo,'Erro',mtError,[mbOk],0);
end;




procedure TfrmCadLancPreProntaMT.LimpaTela;
begin
  LimpaLancamentos;
  mskHist1.Text := '';
  mskHist2.Text := '';
  mskHist3.Text := '';
  mskHist4.Text := '';
  mskHist5.Text := '';

  mskHist1.EditMask := '';
  mskHist2.EditMask := '';
  mskHist3.EditMask := '';
  mskHist4.EditMask := '';
  mskHist5.EditMask := '';


  dteData.Text := '';
  dblkPrePronta.Text  := '';
  redDeb.Value := 0;
  redCre.Value := 0;
end;




procedure TfrmCadLancPreProntaMT.dblkHistoricoExit(Sender: TObject);
begin
  inherited;
  PreencheHistorico(dblkHistorico.LookupValue);
end;




procedure TfrmCadLancPreProntaMT.AtuParamContab(dCodPla:Double);
begin

  //-----------------------------------------------------------------
  // grava o codigo da planilha no paramcontab
  //-----------------------------------------------------------------
  if CtrlContab.PacDebCre = 'B' then
  begin
     CtrlPlanilhaPP.TotalizaDebCre;

     If (CtrlPlanilhaPP.TotalredDeb <> CtrlPlanilhaPP.TotalredCre) then
     begin
       ProcessaContab.AtualizaParamContab(Sistema.idEmpresa,dCodPla);
     end;
  end;
end;




procedure TfrmCadLancPreProntaMT.pgc1Change(Sender: TObject);
var
   iPlano,iPatro,iCriterioSegre: integer;
   sDataCriterio: string;
   fTotalCredito, fTotalDebito: Extended;


begin
  inherited;
  if cdsLancamentos.IsEmpty then
     Exit
  else
  if pgc1.ActivePage = tbsRegraZero then
  begin
     iPlano              := 0;
     iPatro              := 0;
     iCriterioSegre      := 0;
     fTotalCredito       := 0;
     fTotalDebito        := 0;

     bmPontoSaida := cdsLancamentos.GetBookmark;
     HabilitaBotoes(false);

     if CdsRegraZero.Active then CdsRegraZero.Close;
     SqlRegraZero.Prepare;
     SqlRegraZero.Open;


     //  Faz a varredura do cdsLancamento e agrupa os valores
     //de Débito/Crédito, inserindo - os no cdsRegraZero
     //  Eu usei para ordenação dos campos, um índice criado
     //no próprio Cds
     with cdsLancamentos do
     begin
        DisableControls;
        First;


        while not Eof do
        begin
           //  Acumulando valores...
           iPlano            := FieldByName('IDPLANOPREV').AsInteger;
           iPatro            := FieldByName('IDPATRO').AsInteger;
           iCriterioSegre    := FieldByName('IDSEGREGACRITER').AsInteger;
           sDataCriterio     := FieldByName('DATASEGREGACRITER').AsString;
           if cdsLancamentos.FieldByName('PANTIPO').AsString = 'C' then
              fTotalCredito  := fTotalCredito + cdsLancamentos.FieldByName('VALOR').AsFloat
           else
              fTotalDebito   := fTotalDebito  + cdsLancamentos.FieldByName('VALOR').AsFloat;


           //  Move o cursor para o próximo registro
           Next;


           //  Verifica se a linha em foco é diferente da linha anteior
           if not ((FieldByName('IDPLANOPREV').AsInteger        = iPlano)          and
                   (FieldByName('IDPATRO').AsInteger            = iPatro)          and
                   (FieldByName('IDSEGREGACRITER').AsInteger    = iCriterioSegre)  and
                   (FieldByName('DATASEGREGACRITER').AsString   = sDataCriterio) ) then

           //  Caso a linha em foco seja diferente da linha anterior, é inserido um
           //novo registro no CdsRegraZero, com os valores acumulados...
           begin
              CdsRegraZero.Append;
              //  Busca o nome do Plano Previdenciário
              if not CdsPlanoPrev.Locate('IDPLANOPREV',iPlano,[]) then
                 CdsRegraZero.FieldByName('PLANO').AsString    := 'Plano não informado'
              else
                 CdsRegraZero.FieldByName('PLANO').AsString    := CdsPlanoPrev.FieldByName('NOME').AsString;

              //  Busca o nome da Patrocinadora
              if not CdsPatro.Locate('IDPESSOA',iPatro,[]) then
                 CdsRegraZero.FieldByName('PATRO').AsString    := 'Patrocinadora não informada'
              else
                 CdsRegraZero.FieldByName('PATRO').AsString    := CdsPatro.FieldByName('NOME').AsString;

              //  Busca o nome do critério de segregação
              if not cdsSegrega.Locate('IDSEGREGACRITER',iCriterioSegre,[]) then
                 CdsRegraZero.FieldByName('CRITERIO').AsString := ''
              else
                 CdsRegraZero.FieldByName('CRITERIO').AsString := cdsSegrega.FieldByName('DESCRICAO').AsString;




              CdsRegraZero.FieldByName('DTCRITERIO').AsString  := FieldByName('DATASEGREGACRITER').AsString;
              CdsRegraZero.FieldByName('DEBITO').AsFloat       := fTotalDebito;
              CdsRegraZero.FieldByName('CREDITO').AsFloat      := fTotalCredito;
              CdsRegraZero.FieldByName('SALDO').AsFloat        := fTotalDebito - fTotalCredito;
              CdsRegraZero.Post;
              //  Zera as varíaveis
              iPlano         := 0;
              iPatro         := 0;
              iCriterioSegre := 0;
              fTotalCredito  := 0;
              fTotalDebito   := 0;
           end;


           //   Se estiver no final do cds, inclui o último registro
           if cdsLancamentos.Eof then
           begin
              CdsRegraZero.Append;
              //  Busca o nome do Plano Previdenciário
              if not CdsPlanoPrev.Locate('IDPLANOPREV',iPlano,[]) then
                 CdsRegraZero.FieldByName('PLANO').AsString   := 'Plano não informado'
              else
                 CdsRegraZero.FieldByName('PLANO').AsString   := CdsPlanoPrev.FieldByName('NOME').AsString;

              //  Busca o nome da Patrocinadora
              if not CdsPatro.Locate('IDPESSOA',iPatro,[]) then
                 CdsRegraZero.FieldByName('PATRO').AsString   := 'Patrocinadora não informada'
              else
                 CdsRegraZero.FieldByName('PATRO').AsString   := CdsPatro.FieldByName('NOME').AsString;


              //  Busca o nome do critério de segregação
              if not cdsSegrega.Locate('IDSEGREGACRITER',iCriterioSegre,[]) then
                 CdsRegraZero.FieldByName('CRITERIO').AsString := ''
              else
                 CdsRegraZero.FieldByName('CRITERIO').AsString := cdsSegrega.FieldByName('DESCRICAO').AsString;


              CdsRegraZero.FieldByName('DTCRITERIO').AsString := FieldByName('DATASEGREGACRITER').AsString;
              CdsRegraZero.FieldByName('DEBITO').AsFloat      := fTotalDebito;
              CdsRegraZero.FieldByName('CREDITO').AsFloat     := fTotalCredito;
              CdsRegraZero.FieldByName('SALDO').AsFloat       := fTotalDebito - fTotalCredito;
              CdsRegraZero.Post;
           end;
        end;
        EnableControls;
        CdsRegraZero.First;
     end;
  end
  else
  begin
     if bmPontoSaida <> nil then
     begin
        cdsLancamentos.GotoBookmark(bmPontoSaida);
        cdsLancamentos.FreeBookmark(bmPontoSaida);
        bmPontoSaida := nil;
     end;

     AtualizaCds;
     MostraLancAtual;
     HabilitaBotoes(true);

  end;
end;




procedure TfrmCadLancPreProntaMT.CdsRegraZeroAfterOpen(DataSet: TDataSet);
begin
   inherited;
   TFloatField(CdsRegraZero.FieldByName('CREDITO')).DisplayFormat := '#,##0.00;(#,##0.00)';
   TFloatField(CdsRegraZero.FieldByName('DEBITO')).DisplayFormat  := '#,##0.00;(#,##0.00)';
   TFloatField(CdsRegraZero.FieldByName('SALDO')).DisplayFormat   := '#,##0.00;(#,##0.00)';
end;




procedure TfrmCadLancPreProntaMT.dbGridCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  if CdsRegraZero.FieldByName('SALDO').AsFloat <> 0 then
  ABrush.Color := $00A0A0FC; // vermelho claro
end;




procedure TfrmCadLancPreProntaMT.HabilitaBotoes(bHabilita: boolean);
begin
  //  Nota: Não foi utilizado aqui o método BOF porque
  //ele só é instanciado para TRUE se o cds sofrer
  //mais um NEXT.
  if cdsLancamentos.RecNo = 1 then
  begin
     btnAnterior.Enabled := False;
     btnProximo.Enabled  := True;
  end
  else
  begin
     btnAnterior.Enabled := bHabilita;
     btnProximo.Enabled  := bHabilita;
  end;
end;




procedure TfrmCadLancPreProntaMT.mskHist1Change(Sender: TObject);
var
  sTexto: string;
begin
  inherited;
  sTexto := Trim(StringReplace((sender as TMaskEdit).Text,'_','',[rfReplaceAll]));

  if Length(sTexto) =  (sender as TMaskEdit).MaxLength then
     Perform(WM_NEXTDLGCTL,0,0);
end;

end.
