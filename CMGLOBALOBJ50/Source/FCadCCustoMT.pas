{-------------------------------------------------------------------------------
------------------------- HISTÓRICO DE ALTERAÇÕES ------------------------------
--------------------------------------------------------------------------------
 Responsável: Luis Ferrari
 Data.......: 10/01/2025 27/02/2025 Ajustes
 Atender....: WO17542 - Global - Cadastro de centro de custo
 Descrição..: Correção na Inclusão da Hora nos campos Data Final
--------------------------------------------------------------------------------

 Responsável: Arnaldo V. Scarin
 Data.......: 11/11/2024
 Atender....: WO15987 - Global - Cadastro de centro de custo
 Descrição..: Inclusão da Hora nos campos Data
--------------------------------------------------------------------------------

 Responsável: Everson Cunha
 Data.......: 10/05/2021
 SIG........: 134236
 Descrição..: Histórico movimentação Centro Custo (Desmembramento, unificação..)
              DE/PARA
--------------------------------------------------------------------------------
 Responsável: Everson Cunha
 Data.......: 07/12/2021
 SIG........: 121175
 Descrição..: Remover a obrigatoriedade de inclusão do Gestor na criação dos
              centros de custo
--------------------------------------------------------------------------------
Rotina             :
N. SIG..........   : 48344
Data da Alteração: : 17/12/2018
Alteração Form:    : FCadCCustoMT
Responsável:       : Everson Luiz Pereira da Cunha
Descrição.......   : Segregação do inventário dos bens
De acordo com o MEG 075 de infraestrutura, subitem 5.1.10.1 - A COPAD realizará
inventário anual dos Bens Patrimoniais, exceto os equipamentos de TI.
Os equipamentos de TI serão inventariados pela GETIF.
--------------------------------------------------------------------------------
Rotina             : Func_VerificarMesmaOrdem, FormCreate, sbtnInsDetClick,
                     sbtnAltDetClick, Func_RespSemUltimaDataVigencia,
                     CmeSubstitutosInsert, CmeSubstitutosBeforeConfirma
N. SIG..........   : 60690
Data da Alteração: : 08/02/2018
Alteração Form:    : FCadCCustoMT
Responsável:       : Everson Luiz Pereira da Cunha
Descrição.......   : O sistema deve permitir a inclusão de mais de um substituto
                     sem a data de término de vigência estar preenchida.
                     Criar campo para ordenar os substitutos
--------------------------------------------------------------------------------
Rotina             : btnProcurarLotacaoClick, VerificaPreenchimento
N. SIG..........   : 59823.59824
Data da Alteração: : 07/12/2017
Alteração Form:    : FCadCCustoMT
Responsável:       : Cássio Florêncio Rovaroto
Descrição.......   : Remoção da aba "eSocial" e respectivos campos
                     e suas operações.
--------------------------------------------------------------------------------
 Autor......: Andre Imakawa
 Data.......: 06/01/2016
 Sol........: 258754/17869
 PPM........: 1136600
 Descrição..: Alteração referente a aba eSocial.
--------------------------------------------------------------------------------
 Autor......: Felipe A. Santos
 Data.......: 08/12/2014
 Sol........: 229874/16591
 Kintana....: 544751
 Descrição..: Criação da aba eSocial.
--------------------------------------------------------------------------------
 Autor......: Thiago Melo
 Data.......: 07/10/2014
 Sol........: 236997
 Kintana....: 478691
 Descrição..: Ao excluir determinado centro de custo, o sistema tenta apagar a
              tabela CENTCUST antes da RESPCENTCUST, ocasionando um erro
              da constraint R_10739
--------------------------------------------------------------------------------
 Autor......: Felipe A. Santos
 Data.......: 13/09/2013
 Sol........: 195376
 Kintana....: 1866485
 Descrição..: Criação da Aba Substitutos e inclusão dos campos Matrícula e
              Portaria no grid
--------------------------------------------------------------------------------
 Autor......: Mosé Pietro
 Data.......: 13/09/2012
 Sol........: 176165
 Kintana....: 1609814
 Descrição..: Inclusão do campo código de área (CODAREA) DFM
--------------------------------------------------------------------------------
 Rotina.....: AtualizarResponsavelCentroCusto
 Autor......: Higor Ferreira
 Data.......: 12/06/2012
 Sol........: 182148
 Kintana....: 1649720
 Descrição..: Recompilação.
--------------------------------------------------------------------------------
Rotina.....: Montaselect (msPessoa)
Data.......: 10/10/2011
Sol........: 142865/6741
Kintana....: 1446574
Descrição..: Colocar a matrícula na pesquisa de Funcionário. 
--------------------------------------------------------------------------------
Rotina.....: TfrmCadCCusto.sbtnInsDetClick,
             TfrmCadCCusto.CmeDetalheBeforeConfirma
Data.......: 04/10/2011
Sol........: 142865.6461
Kintana....: 1423815
Descrição..: No global é possivel inserir um novo responsavel para um centro
             de custo sem que se coloque uma data de termino de vigencia,
             corrigido o problema.
--------------------------------------------------------------------------------
Rotina.....: Montaselect (msPessoa)
Autor......: Thaise Amaral Martins
Data.......: 08/09/2011
Sol........: 142865
Kintana....: 917808
Descrição..: Consultando apenas Pessoas que estão cadastradas na
             tabela FUNCIONARIO.
--------------------------------------------------------------------------------
Rotina.....: sbtnExcluiDetClick
Autor......: Brunno Mattos
Data.......: 11/11/2010
Sol........: 142865
Kintana....: 917808
Descrição..: Passa parâmetro para CTRL para que o responsável de um funcionário
             seja atualizado instantaneamente a partir do momento que o
             responsável de um determinado Centro de Custo for alterado,
             sem que o antigo responsável seja alterado mantendo o histórico.
--------------------------------------------------------------------------------
Rotina    : MontaArvore
Data      : 31/01/2006
Pendencia : 21368
Descrição : Implementação de filtro por Plano de Centro de Custo
--------------------------------------------------------------------------------
Rotina    : CmeCadastroBeforeConfirma
Data      : 15/12/2003
Pendencia : 14804
Descrição : A Função Modulo.CalcGrau está trazendo o código EXTERNO do Centro
            de custo. Não está sendo localizado o pai corretamente.
            Foi retirada a verificação (temporariamente).
--------------------------------------------------------------------------------
Rotina    : -
Data      : 30/10/2003
Pendencia : 14804
Descrição : Implementação das alterações em função do De/Para de Centros
            de Custo
--------------------------------------------------------------------------------
Rotina    : dbedCodExit
Data      : 13/05/2004
Pendencia : 15860
Descrição : Não permitir cadastro de códigos com zeros à direita.
--------------------------------------------------------------------------------
Rotina    : dbedCodExit
Data      : 21/05/2004
Pendencia : 16784
Descrição : Corrigidos problemas na tela.
--------------------------------------------------------------------------------
Rotina    : Várias
Data      : 27/05/2004 (término)
Pendencia : 15166
Descrição : Implementação do cadastro de responsáveis por centros de custo e
            de responsabilida e  suas respectivas vigências.
--------------------------------------------------------------------------------}


unit FCadCCustoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, ComCtrls, uCMTreeViewMT, MontaSelect, Db, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97,
  ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, wwdblook, CMDBLookupCombo, DBCtrls,
  wwdbedit, Mask, uCtrlCentroCusto, uCtrlPrograma, uAutorizacao,uCtrlPadroes,
  wwdbdatetimepicker, CMProcura, TabControlDetalhe, uCtrlCadPlanCentCust
{$IFNDEF VERSAO0505}
  , uCmTypes, uCmSqlParams, DBTables, Wwquery, dxCntner, dxEditor,
  dxExEdtr, dxEdLib, dxDBELib
{$ENDIF}
;

type

     // Início - P: 20372 - 02/02/06
   TItem = record
      CodExterno   : string;
      CodCentCust  : string;
      NomeCentCust : string;
      FlgAnaSint   : string;
   end;

   pItem = ^TItem;
   // Fim -  02/02/2006
   TfrmCadCCusto = class(TFrmCadastroMT)
      pnlArvore: TPanel;
      PageContabil: TPageControl;
      TbsGeral: TTabSheet;
      PnlGeral: TPanel;
      Label2: TLabel;
      Label3: TLabel;
      Label5: TLabel;
      Label6: TLabel;
      dbedDescricao: TDBEdit;
      pnAnaSint: TPanel;
      sbtnAnalitico: TSpeedButton;
      sbtnSintetico: TSpeedButton;
      dbedCod: TwwDBEdit;
      DbeCodReduz: TwwDBEdit;
      DbeCodCorresp: TwwDBEdit;
      TbsContasXCC: TTabSheet;
      Panel3: TPanel;
      BtnApagar: TBitBtn;
      BtnReplicar: TBitBtn;
      PgIntContabil: TPageControl;
      TbsContasCC: TTabSheet;
      wwDBGrid1: TwwDBGrid;
      TbsAranha: TTabSheet;
      wwDBGrid2: TwwDBGrid;
      DBCheckBox1: TDBCheckBox;
      PnlPrograma: TPanel;
      CmbPrograma: TCMDBLookupCombo;
      Label13: TLabel;
      CdsContasXCc: TCMClientDataSet;
      DsContasXCc: TwwDataSource;
      CdsAranha: TCMClientDataSet;
      DsAranha: TwwDataSource;
      MsCentrodeCusto: TMontaSelect;
      MsAranha: TMontaSelect;
      CdsAux: TCMClientDataSet;
      CdsCentroCusto: TCMClientDataSet;
      CdsPrograma: TCMClientDataSet;
      DsPrograma: TwwDataSource;
      tbcDetalhe: TTabControlDetalhe;
      Dock973: TDock97;
      tb97BotoesDetalhe: TToolbar97;
      sbtnInsDet: TToolbarButton97;
      sbtnAltDet: TToolbarButton97;
      sbtnExcluiDet: TToolbarButton97;
      CmeDetalhe: TCmEventosCadastro;
      dsDet: TwwDataSource;
      cdsDet: TCMClientDataSet;
      msPessoa: TMontaSelect;
      Dock974: TDock97;
      tb97Detalhe: TToolbar97;
      bbtnOkDet: TBitBtn;
      bbtnCancelarDet: TBitBtn;
      bbtnVoltarDet: TBitBtn;
      DbLcbPlanoCC: TwwDBLookupCombo;
      lbPlanoCC: TLabel;
      CdsPlanoCC: TCMClientDataSet;
      DsPlanoCC: TDataSource;
      DsAux: TwwDataSource;
      DsCentroCusto: TwwDataSource;
      TreeCCusto: TTreeView;
      imgTreeView: TImageList;
      Label8: TLabel;
      sqlaranha: TCMSqlParams;
    dbedCodArea: TDBEdit; //Mosé Pietro SOL 176165 KTN 1609814
    Label9: TLabel;
    PageDetalhe: TPageControl;
    tbsGestores: TTabSheet;
    dbgrdDet: TwwDBGrid;
    pnlControlesDet: TPanel;
    lblGestor: TLabel;
    lblIniVig: TLabel;
    lblTerVig: TLabel;
    cmpPessoa: TCMProcura;
    dtIniVig: TwwDBDateTimePicker;
    dtFimVig: TwwDBDateTimePicker; //Mosé Pietro SOL 176165 KTN 1609814
    tbsSubstitutos: TTabSheet;
    tbsMovimentacao: TTabSheet;
    dbgrdSub: TwwDBGrid;
    dbgrdMovimentacao: TwwDBGrid;
    cdsSub: TCMClientDataSet;
    dsSub: TDataSource;
    GroupBox1: TGroupBox;
    lblPort: TLabel;
    DbePortaria: TwwDBEdit;
    pnlControleSub: TPanel;
    lblSub: TLabel;
    lblIniVigSub: TLabel;
    lblTerVigSub: TLabel;
    lblPortSub: TLabel;
    cmpPessoaSub: TCMProcura;
    dtIniVigSub: TwwDBDateTimePicker;
    dtFimVigSub: TwwDBDateTimePicker;
    grbPortSub: TGroupBox;
    DbePortSub: TwwDBEdit;
    CmeSubstitutos: TCmEventosCadastro; // Felipe A. Santos SOL 229874/16591 PPM 544751
    dbEdtOrdem: TdxDBSpinEdit;
    lblOrdem: TLabel;
    dbchkTI: TDBCheckBox;  //Everson Cunha - SIG48344
    dsMovimentacao: TwwDataSource;
    CdsMovimentacao: TCMClientDataSet;  

      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure CmeCadastroFind(Sender: TObject);
      procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
      procedure CmeCadastroEdit(Sender: TObject);
      procedure CmeCadastroInsert(Sender: TObject);
      procedure CmeCadastroAtualizaBotoes(Sender: TObject);
      procedure BtnReplicarClick(Sender: TObject);
      procedure BtnApagarClick(Sender: TObject);
      procedure PageContabilChanging(Sender: TObject; var AllowChange: Boolean);
      procedure CmeCadastroCancel(Sender: TObject);
      procedure sbtnAnaliticoClick(Sender: TObject);
      procedure sbtnSinteticoClick(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
      procedure dbedCodExit(Sender: TObject);
      procedure CdsAfterScroll(DataSet: TDataSet);
      procedure sbtnInsDetClick(Sender: TObject);
      procedure sbtnAltDetClick(Sender: TObject);
      procedure sbtnExcluiDetClick(Sender: TObject);
      procedure bbtnOkDetClick(Sender: TObject);
      procedure bbtnCancelarDetClick(Sender: TObject);
      procedure dbgrdDetDblClick(Sender: TObject);
      procedure bbtnVoltarDetClick(Sender: TObject);
      procedure tbcDetalheChange(Sender: TObject);
      procedure tbcDetalheChanging(Sender: TObject;
      var AllowChange: Boolean);
      procedure CmeDetalheInsert(Sender: TObject);
      procedure CmeDetalheEdit(Sender: TObject);
      procedure CmeDetalheDelete(Sender: TObject);
      procedure CmeDetalheConfirma(Sender: TObject);
      procedure CmeDetalheCancel(Sender: TObject);
      procedure AtualizaBotoes(Sender: TObject); // Alterado por Felipe A. Santos SOL 195376 KTN 1866485
      procedure CmeDetalheBeforeConfirma(sender: TObject;
      var Accept: Boolean);
      procedure DbLcbPlanoCCCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
      procedure CmeCadastroDelete(Sender: TObject);
      procedure CmeCadastroConfirma(Sender: TObject);
      procedure TreeCCustoChange(Sender: TObject; Node: TTreeNode);
      procedure sbtnApagarClick(Sender: TObject);
      procedure bbtnCancelarClick(Sender: TObject);
    procedure CmeSubstitutosInsert(Sender: TObject);
    procedure CmeSubstitutosEdit(Sender: TObject);
    procedure CmeSubstitutosCancel(Sender: TObject);
    procedure CmeSubstitutosDelete(Sender: TObject);
    procedure CmeSubstitutosBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeSubstitutosConfirma(Sender: TObject);
    procedure dbgrdSubDblClick(Sender: TObject);
    //Cássio Rovaroto  - SIG nº 59823.59824 - Início
    //procedure btnProcurarLotacaoClick(Sender: TObject);//Andre Imakawa SOL 258754/17869 PPM 1136600
    //Cássio Rovaroto  - SIG nº 59823.59824 - Fim


    private  // Private declarations

      bMontandoArvore   : Boolean;
      bDeletando        : Boolean;
      sMascCCusto       : String;
      lNivel            : array[0..20] of Integer;
      ind               : Integer;
      fPlanCentCust     : Extended;
      // P:21368 - 31/01/2006
      CtrlCadPlanCentCust : TCtrlCadPlanCentCust;
      sFiltro       : String ;

      // Kintana 1423815  Sol 142865/6461 Otacilio
      sDataIni, sDataFinal : string;
      sOrdem : Double; // SIG 60690

      procedure FazerVoltarDet;

      // P:21368 - 31/01/2006
      procedure MontaArvore(iIdEmpresa: integer; fIdPlanoCentCust: Double; sMascara: string);
      function  RetornaCod(sCod: string): string;
      function  AcharNo(sCod: string): boolean;
      function  InserePasta(bEumaPasta:
                Boolean;  Arvore: TTreeView; NoDestino: TTreeNode; pDesc: pItem): TTreeNode;
      procedure InserePapel(Arvore: TTreeView; NoDestino: TTreeNode; pDesc: pItem);
      function VerificaMestre : boolean;

      function Func_RespSemUltimaDataVigencia: Integer;
      function Func_MenorDataVigencia(Data: TDateTime): Integer;
      function Func_ValidarUltimaDataVigencia(DataIni, DataFim: TDateTime; ppessoa: string): Integer;    // WO17542 Ferrari
      function Func_ValidarInicioDataVigencia(DataIni, DataFim: TDateTime): Integer;
      function Func_VerificarMesmaOrdem(Ordem: Double):Boolean; // SIG 60690

      public   // Public declarations

      CentroCusto: TCtrlCentroCusto;
      Programa:    TCtrlPrograma;

      procedure PegaRegCCusto(State: TDataSetState; PegaFilhos: Boolean = False);
      procedure CopiaRegCCusto(State: TDataSetState);

      procedure Seleciona(IDPessoa        : Double = 0;
                          IDPlanCentCust  : Extended = 0;
                          IdCentroCusto   : String = ''
                         );

     procedure VarrerChefia;

     // Felipe A. Santos SOL 195376 KTN 1866485
     function VerificaMascara( sMascara: String; var lNivel: Array of Integer;
                              var ind: Integer ): Boolean;
     // Felipe A. Santos SOL 195376 KTN 1866485 - fim

     function VerificaPreenchimento : boolean; // Felipe A. Santos SOL 229874/16591 PPM 544751
   end;



var
  frmCadCCusto: TfrmCadCCusto;



implementation
{$R *.DFM}
uses
   uMensErro, dBasedados, uSistema, uMidasUtil, uCtrlParamIntegra, dGlobal;

procedure TfrmCadCCusto.PegaRegCCusto(State: TDataSetState; PegaFilhos: Boolean = False);
begin
   if State = DsInsert then
      cdsCentroCusto.Data := CentroCusto.ListaCentroCusto(-1)
   else
      cdsCentroCusto.Data := CentroCusto.ListaCentroCusto(Sistema.IdEmpresa,
                                                          Cds.FieldByName('CODCENTROCUSTO').AsString,
                                                          False,
                                                          0,
                                                          '',
                                                          fPlanCentCust);

   if PegaFilhos then
   begin
      CdsContasXCc.Data := CentroCusto.ListaContasXCC(Sistema.IdEmpresa, Cds.FieldByName('CODCENTROCUSTO').AsString);
      CdsAranha.Data    := CentroCusto.ListaAranhaXCc(Sistema.IdEmpresa, Cds.FieldByName('CODCENTROCUSTO').AsString);
      cdsDet.Data       := CentroCusto.RecuperaRespPorCentCust( Sistema.IdEmpresa, Cds.FieldByName('CODCENTROCUSTO').AsString );
      cdsSub.Data       := CentroCusto.RecuperaRespPorCentCust( Sistema.IdEmpresa, Cds.FieldByName('CODCENTROCUSTO').AsString, 'S'); // Felipe A. Santos SOL 195376 KTN 1866485
      CdsMovimentacao.Data := CentroCusto.ListaCentroCustoOrigem(Cds.FieldByName('CODCENTROCUSTO').AsString); //Everson Cunha - SIG134236
   end;
end;



procedure TfrmCadCCusto.CopiaRegCCusto(State: TDatasetState);
var
   i     : Integer;
   sNome : String;
begin
   if State = dsInsert then
   begin
      CdsCentroCusto.Append;
   end
   else
   begin
      CdsCentroCusto.Edit;
   end;

   for i := 0 to (Cds.Fields.Count - 1) do
   begin
      sNome := Cds.Fields[i].FieldName;
      CdsCentroCusto.FieldByName(snome).Value := Cds.FieldByName(snome).Value;
   end;

   CdsCentroCusto.Post;
end;



procedure TfrmCadCCusto.Seleciona(IDPessoa        : Double = 0;
                                  IDPlanCentCust  : Extended = 0;
                                  IdCentroCusto   : String = ''
                                 );
begin
   cds.Data := CentroCusto.ListaCentroCusto(IdPessoa,
                                            IdCentroCusto,
                                            False,
                                            0,
                                            '',
                                            IDPlanCentCust
                                            );

   cds.FieldByName('CODEXTERNO').EditMask := sMascCCusto + ';0; ';
end;



procedure TfrmCadCCusto.FormCreate(Sender: TObject);
var
  i : integer;
begin

  CmeDetalhe.RepetirInsert := true;
  CmeSubstitutos.RepetirInsert := true; // Felipe A. Santos SOL 195376 KTN 1866485

  inherited;

  tbcDetalhe.TabIndex := 0;
  tbcDetalheChange(tbcDetalhe);

   bMontandoArvore   := False;
   bDeletando        := False;
   sMascCCusto       := '';

   sOrdem            := -1; // SIG 60690

   CentroCusto       := TCtrlCentroCusto.Create;
   Programa          := TCtrlPrograma.Create;




   CentroCusto.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                           Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

   // P:21368 - 31/01/2006
   CtrlCadPlanCentCust := TCtrlCadPlanCentCust.Create;
   CtrlCadPlanCentCust.InitializeAs(Padroes);


   CdsPlanoCC.Data := CtrlCadPlanCentCust.Procurar(0);

   // fim

   Programa.InitializeAs(CentroCusto);

   CentroCusto.Cds             := CdsCentroCusto;
   CentroCusto.CdsAranha       := CdsAranha;
   CentroCusto.CdsContas       := CdsContasXCc;
   CentroCusto.cdsRespCentCust := cdsDet;
   CentroCusto.cdsRespCentCustSub := cdsSub; // Felipe A. Santos SOL 195376 KTN 1866485

   // Andre Imakawa SOL 258754/17869 PPM 1136600 - Inicio
   //CdsLotacaoeSocial.Data := CentroCusto.ListaLotacaoeSocial;  // Felipe A. Santos SOL 229874/16591 PPM 544751
   // Andre Imakawa SOL 258754/17869 PPM 1136600 - Fim

   // pendência 14804 - 30/10/2003
   // ----------------------------------------------------------------------------------------------
   dtmGlobal.cdsParamGlobal.Close;

   dtmGlobal.sqlParamGlobal.Prepare;
   dtmGlobal.sqlParamGlobal.ParamByName('PIDPESSOA').AsInteger := Sistema.IDEmpresa;
   dtmGlobal.sqlParamGlobal.Open;

   fPlanCentCust  := dtmGlobal.CdsParamGlobal.FieldByName('IDPLANCENTCUST').AsFloat;

    // P:21368 - 31/01/2006
    DbLcbPlanoCC.Lookupvalue:=Floattostr(fPlanCentCust);
    //
    sMascCCusto    := dtmGlobal.CdsParamGlobal.FieldByName('MASCARACC').AsString;


   dtmGlobal.cdsParamGlobal.Close;
   // ----------------------------------------------------------------------------------------------
   // FIM  pendência 14804 - 30/10/2003

   if (Sistema.IdModulo = 2) then
   begin
      HelpContext := 20009; // global
   end
   else if (Sistema.IdModulo = 21) then
   begin
      HelpContext := 230076; // modfol
   end;

   try
      PnlPrograma.Visible := (UpperCase(Sistema.TipoEmpresa) = 'P');

      if PnlPrograma.Visible then CdsPrograma.Data := Programa.ListaPrograma();

      PageContabil.ActivePage := TbsGeral;
      bMontandoArvore := False;

      if not(VerificaMascara(sMascCCusto, lNivel, ind)) then // Alterado Felipe A. Santos SOL 195376 KTN 1866485
      begin
         MessageBeep(0);
         ShowMessage(Translate('Máscara do Centro de Custo Inválida'));
         Repaint;
         Exit;
      end;

      MontaArvore(Sistema.IdEmpresa,fPlanCentCust,sMascCCusto);
      MontaSelect.Filtro.Add('CCU.IDEMPRESA      = ' + IntToStr(Sistema.IdEmpresa));
      Sfiltro:=MontaSelect.Filtro.Text;

      if not(Cds.IsEmpty) then CmeCadastro.Operacao := OpIdle;
   except
      Raise;
   end;
end;



procedure TfrmCadCCusto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;

   dtmGlobal.cdsParamGlobal.Close;

   Programa.Free;
   CentroCusto.Free;
   cds.free;
end;



procedure TfrmCadCCusto.CmeCadastroFind(Sender: TObject);
begin
   inherited;

   if MontaSelect.RetornouValor then
   begin
     cds.Locate('CODCENTROCUSTO', MontaSelect.ValoresChave[0], [loPartialKey]);
     AcharNo(Cds.FieldByName('CODEXTERNO').AsString);
   end;
   Repaint;
end;



procedure TfrmCadCCusto.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
   inherited;

   Cds.FieldByName('IDUSUARIOINCLUSAO').AsFloat := Sistema.IdUsuario;
    if not bMontandoArvore then


   begin
      if sbtnAnalitico.Down = True then
         Cds.FieldByName('STATUSGRUPOCDC').AsString := 'A'
      else
         if  sbtnSintetico.Down = True  then
         Cds.FieldByName('STATUSGRUPOCDC').AsString := 'S';
   end;
   CopiaRegCCusto(DsInsert);
   VarrerChefia;
   Accept := CentroCusto.Gravar;

  if Accept then
      MontaArvore(Sistema.IdEmpresa,fPlanCentCust,'');
end;



procedure TfrmCadCCusto.CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
   inherited;

   MsgDlg(CentroCusto.MessageInfo, 'Erro', mtError, [mbOK], 0);
   Repaint;

   PnlPrograma.Enabled := False;
end;



procedure TfrmCadCCusto.CmeCadastroEdit(Sender: TObject);
begin
   inherited;

   PegaRegCCusto(DsEdit);
   PnlPrograma.Enabled := True;
   // 09/02/06
   DbLcbPlanoCC.enabled := False;
   if dbedDescricao.CanFocus then dbedDescricao.SetFocus;
end;



procedure TfrmCadCCusto.CmeCadastroInsert(Sender: TObject);
begin
   inherited;

   PegaRegCCusto(DsInsert);

   Cds.FieldByName('IDPLANCENTCUST').AsFloat := fPlanCentCust;
   Cds.FieldByName('IDEMPRESA').AsFloat      := Sistema.IdEmpresa;
   Cds.FieldByName('ATIVO').AsString         := 'S';

   dbchkTI.Checked := False;                           //Everson Cunha - SIG48344
   Cds.FieldByName('FLGINVENTARIOTI').AsString := '0'; //Everson Cunha - SIG48344

   treeCCusto.Enabled   := False;
   BtnReplicar.Enabled  := False;
   BtnApagar.Enabled    := False;
   PnlPrograma.Enabled  := True;
   dbedCod.Enabled      := True;
   dbedCod.SetFocus;
   // 09/02/2006
   DbLcbPlanoCC.Enabled := False;
   dbedCod.SetFocus;

   CdsContasXCc.Data    := CentroCusto.ListaContasXCC(Sistema.IdEmpresa, Cds.FieldByName('CODCENTROCUSTO').AsString);
   CdsAranha.Data       := CentroCusto.ListaAranhaXCc(Sistema.IdEmpresa, Cds.FieldByName('CODCENTROCUSTO').AsString);
   cdsDet.Data          := CentroCusto.RecuperaRespPorCentCust( Sistema.IdEmpresa, Cds.FieldByName('CODCENTROCUSTO').AsString );
   cdsSub.Data          := CentroCusto.RecuperaRespPorCentCust( Sistema.IdEmpresa, Cds.FieldByName('CODCENTROCUSTO').AsString, 'S'); // Felipe A. Santos SOL 195376 KTN 1866485
   CdsMovimentacao.Data := CentroCusto.ListaCentroCustoOrigem(Cds.FieldByName('CODCENTROCUSTO').AsString); //Everson Cunha - SIG134236
end;



procedure TfrmCadCCusto.CdsAfterScroll(DataSet: TDataSet);
begin
   inherited;

   if not(bMontandoArvore) then
   begin
      if cds.FieldByName('STATUSGRUPOCDC').AsString = 'A' then
         sbtnAnalitico.Down := True
      else
         if cds.FieldByName('STATUSGRUPOCDC').AsString = 'S' then
            sbtnSintetico.Down := True;

      if not(bDeletando) then
      begin
         CdsContasXCc.Data := CentroCusto.ListaContasXCC(Sistema.IdEmpresa, Cds.FieldByName('CODCENTROCUSTO').AsString);
         CdsAranha.Data    := CentroCusto.ListaAranhaXCc(Sistema.IdEmpresa, Cds.FieldByName('CODCENTROCUSTO').AsString);
         cdsDet.Data       := CentroCusto.RecuperaRespPorCentCust( Sistema.IdEmpresa, cds.FieldByName('CODCENTROCUSTO').AsString );
         cdsSub.Data       := CentroCusto.RecuperaRespPorCentCust( Sistema.IdEmpresa, Cds.FieldByName('CODCENTROCUSTO').AsString, 'S'); // Felipe A. Santos SOL 195376 KTN 1866485
         CdsMovimentacao.Data := CentroCusto.ListaCentroCustoOrigem(Cds.FieldByName('CODCENTROCUSTO').AsString); //Everson Cunha - SIG134236
      end;
   end;
end;



procedure TfrmCadCCusto.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   inherited;
  CmeDetalhe.Atualizabotoes(Self);
  pnlFundo.Enabled := true;

   if CmeCadastro.Operacao = OpInserir then
      sbtnAlterar.Enabled := False
   else
      sbtnAlterar.Enabled := not(cds.IsEmpty);

   if CmeCadastro.Operacao in [OpAlterar, OpInserir] then
      sbtnApagar.Enabled := False
   else
      sbtnApagar.Enabled := not(cds.IsEmpty);

   pnlFundo.Enabled    := True;
   pnAnaSint.Enabled   := bbtnConfirmar.Enabled;

   // Pendência 16784
   TreeCCusto.Enabled  := ( not( cds.IsEmpty ) ) and ( not bbtnConfirmar.Enabled );
   dbedCod.ReadOnly         := not bbtnConfirmar.Enabled;
   DbeCodReduz.ReadOnly     := not bbtnConfirmar.Enabled;
   dbedDescricao.ReadOnly   := not bbtnConfirmar.Enabled;

   DBCheckBox1.ReadOnly     := not bbtnConfirmar.Enabled;
   DbeCodCorresp.ReadOnly   := not bbtnConfirmar.Enabled;
   CmbPrograma.ReadOnly     := not bbtnConfirmar.Enabled;
   wwDBGrid1.ReadOnly       := not bbtnConfirmar.Enabled;
   wwDBGrid2.ReadOnly       := not bbtnConfirmar.Enabled;

   btnReplicar.Enabled      := bbtnConfirmar.Enabled;
   btnApagar.Enabled        := bbtnConfirmar.Enabled;
end;



procedure TfrmCadCCusto.BtnReplicarClick(Sender: TObject);
begin
   inherited;

   if PgIntContabil.ActivePageIndex = 0 then
   begin
      if (CmeCadastro.Operacao in [OpInserir, OpAlterar]) and
         (MsgDlg('Atenção: Os relacionamentos anteriores, se existirem, serão excluídos. ' +
                 'Confirma A Replicação das contas para o centro de custo específico ?',
                 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes) and
         (MsCentrodeCusto.Executar = MrOk) then
      begin
         try
            Screen.Cursor := CrHourGlass;
            CentroCusto.ReplicarCC(Sistema.IdEmpresa, Cds.FieldByName('CODCENTROCUSTO').AsString,
                                  MsCentrodeCusto.ValoresChave[0]);
            CdsContasXCc.Data := CentroCusto.ListaContasXCC(Sistema.IdEmpresa, Cds.FieldByName('CODCENTROCUSTO').AsString);
         finally
            Screen.Cursor := CrDefault;
         end;
      end;
   end
   else
   begin
      if (CmeCadastro.Operacao in [OpInserir, OpAlterar]) and
         (MsgDlg('Atenção: Os relacionamentos anteriores, se existirem, serão excluídos. ' +
                 'Confirma A Replicação do Relacionamento da Parametrização Contábil Predominante com o centro de custo específico ?',
                 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes) and
         (MsAranha.Executar = MrOk) then
      begin
         try
            Screen.Cursor := CrHourGlass;
            CentroCusto.ReplicarAranha(Sistema.IdEmpresa, Cds.FieldByName('CODCENTROCUSTO').AsString,
                                      MsAranha.ValoresChave[0]);
            CdsAranha.Data := CentroCusto.ListaAranhaXCc(Sistema.IdEmpresa, Cds.FieldByName('CODCENTROCUSTO').AsString);
         finally
            Screen.Cursor := CrDefault;
         end;
      end;
   end;
end;



procedure TfrmCadCCusto.BtnApagarClick(Sender: TObject);
begin
   inherited;
   if CmeCadastro.Operacao in [OpInserir, OpAlterar] then
   begin
      if PgIntContabil.ActivePageIndex = 0 then
      begin
         if not(CdsContasXCc.IsEmpty) then CdsContasXCc.Delete;
      end
      else
      begin
         if not(CdsAranha.IsEmpty) then CdsAranha.Delete;
      end;
   end;
end;



procedure TfrmCadCCusto.PageContabilChanging(Sender: TObject; var AllowChange: Boolean);
begin
   inherited;
   AllowChange := not(Cds.FieldByName('CODCENTROCUSTO').IsNull);

   if not(AllowChange) then
   begin
      MsgDlg('Centro de Custo não informado', 'Centro de Custo', mtError, [mbOk], 0);
      Repaint;
   end;
end;

procedure TfrmCadCCusto.CmeCadastroDelete(Sender: TObject);
begin
  try
      bDeletando := True;
      if TreeCCusto.Selected.HasChildren then
      begin
         MsgDlg('O Centro de Centro de Custo possui Filho(s)', 'Atenção', mtWarning, [mbok], 0);
         Repaint;
      end
      else
      begin
         PegaRegCCusto(DsEdit, True);

         CdsContasXCc.First;
         while not(CdsContasXCc.EOF) do CdsContasXCc.Delete;

         CdsAranha.First;
         while not(CdsAranha.EOF) do CdsAranha.Delete;

         CdsDet.First;
         while not(CdsDet.EOF) do CdsDet.Delete;

         CdsSub.First; // Felipe A. Santos // Felipe A. Santos SOL 195376 KTN 1866485
         while not(CdsSub.Eof) do cdsSub.Delete; // Felipe A. Santos // Felipe A. Santos SOL 195376 KTN 1866485
      end;

      bDeletando := False;
   except
     Raise;
   end;
         inherited;
end;




procedure TfrmCadCCusto.CmeCadastroCancel(Sender: TObject);
var
   i : integer;
begin
   CmeDetalhe.Cancel(Self);
   i := 0;
   while (i < ComponentCount) do begin
         if (Components[i] Is TCmClientDataSet) and
            (TCmClientDataSet(Components[i]).Active) and
            (TCmClientDataSet(Components[i]).ChangeCount > 0) then
            TCmClientDataSet(Components[i]).CancelUpdates;
         Inc(i);
   end;
   inherited;
   DbLcbPlanoCC.Enabled:= True;
   TreeCCusto.Enabled      := True;
   PageContabil.ActivePage := TbsGeral;
   PnlPrograma.Enabled     := False;
end;

procedure TfrmCadCCusto.sbtnAnaliticoClick(Sender: TObject);
begin
   inherited;
   Cds.FieldByName('STATUSGRUPOCDC').AsString := 'A';
end;

procedure TfrmCadCCusto.sbtnSinteticoClick(Sender: TObject);
begin
   inherited;
   Cds.FieldByname('STATUSGRUPOCDC').AsString := 'S';
end;

procedure TfrmCadCCusto.bbtnConfirmarClick(Sender: TObject);
begin
  // Felipe A. Santos SOL 229874/16591 PPM 544751 - início - comentário
  // Kintana 1423815  Sol 142865/6461 Otacilio ** Inicio **
  {if cdsDet.IsEmpty then
  begin
    ShowMessage('Cadastre um Gestor para o Centro de Custo.'); // alterado por Felipe A. Santos SOL 195376 KTN 1866485
    // Felipe A. Santos SOL 195376 KTN 1866485
    tbcDetalhe.TabIndex := 0;


    tbcDetalheChange(Self);
    //PageDetalhe.ActivePage := tbsGestores;
    //CmeDetalhe.AtualizaBotoes(Self);


    // Felipe A. Santos SOL 195376 KTN 1866485 - fim
    Abort;
  end;
  // Kintana 1423815  Sol 142865/6461 Otacilio ** Fim ** }
  // Felipe A. Santos SOL 229874/16591 PPM 544751 - fim - comentário

  // Felipe A. Santos SOL 229874/16591 PPM 544751 - início
  if not(VerificaPreenchimento) then
     Exit;
  // Felipe A. Santos SOL 229874/16591 PPM 544751 - fim
  
  inherited;
   DbLcbPlanoCC.Enabled:= True;
end;



procedure TfrmCadCCusto.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
   inherited;
   CopiaRegCCusto(DsEdit);
   VarrerChefia;
   Accept := CentroCusto.Gravar;

   // P:21368 - 31/01/2006
   if Accept then
      MontaArvore(Sistema.IdEmpresa,fPlanCentCust,'');
end;

procedure TfrmCadCCusto.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
var
   iGrau       : Integer;
   sPai        : String;
   EstadoQry   : TDatasetState;
begin
   inherited;

   CmeDetalhe.Confirma(Self);
   Accept := CmeDetalhe.ConfirmaCadastro;

   PageContabil.ActivePage := TbsGeral;

   if EstadoQry in [DsEdit, DsInsert] then
   begin
      try
            if not(VerificaMascara(sMascCCusto, lNivel, ind)) then // alterado por Felipe A. Santos
            begin
               MessageBeep(0);
               ShowMessage(Translate('Máscara do Centro de Custo Inválida'));
               Repaint;
               Exit;
            end;

            // Verifica se o tipo de Desemb já está cadastrado
            CdsAux.Data := CentroCusto.ListaCentroCusto(Sistema.IdEmpresa,
                                                        Trim(dbEdCod.Text),
                                                        False,
                                                        0,
                                                        '',
                                                        fPlanCentCust
                                                        );

            if not(CdsAux.IsEmpty) then
            begin
               CdsAux.Close;
               CentroCusto.MessageInfo := 'Centro de Custo já cadastrado';
               Accept := False;
               DbEdCod.SetFocus;
               Exit;
            end;

            CdsAux.Close;

            if dbedCod.Modified then
            begin
               if not(CdsContasXCc.IsEmpty) then
               begin
                 CdsContasXCc.First;

                  while not(CdsContasXCc.EOF) do
                  begin
                     CdsContasXCc.Edit;
                     CdsContasXCc.FieldByName('CODCENTROCUSTO').AsString := Cds.FieldByName('CODCENTROCUSTO').AsString;
                     CdsContasXCc.FieldByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
                     CdsContasXCc.Post;
                     CdsContasXCc.Next;
                  end;

                  CdsContasXCc.First;
               end;

               if not(CdsAranha.IsEmpty) then
               begin
                  CdsAranha.First;
                  while not(CdsAranha.EOF) do
                  begin
                     CdsAranha.Edit;
                     CdsAranha.FieldByName('CODCENTROCUSTO').AsString := Cds.FieldByName('CODCENTROCUSTO').AsString;
                     CdsAranha.FieldByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
                     CdsAranha.Post;
                     CdsAranha.Next;
                  end;
                  CdsAranha.First;
               end;

               if not(cdsDet.IsEmpty) then
               begin
                  cdsDet.First;
                  while not(cdsDet.EOF) do
                  begin
                     cdsDet.Edit;
                     cdsDet.FieldByName('CODCENTROCUSTO').AsString := Cds.FieldByName('CODCENTROCUSTO').AsString;
                     cdsDet.FieldByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
                     cdsDet.Post;
                     cdsDet.Next;
                  end;
                  cdsDet.First;
               end;
               // Felipe A. Santos SOL 195376 KTN 1866485
               if not(cdsSub.IsEmpty) then
               begin
                  cdsSub.First;
                  while not(cdsSub.EOF) do
                  begin
                     cdsSub.Edit;
                     cdsSub.FieldByName('CODCENTROCUSTO').AsString := Cds.FieldByName('CODCENTROCUSTO').AsString;
                     cdsSub.FieldByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
                     cdsSub.Post;
                     cdsSub.Next;
                  end;
                  cdsSub.First;
               end;
              // Felipe A. Santos SOL 195376 KTN 1866485 - FIM
            end;

      except
         Raise;
      end;

      if sbtnAnalitico.Down then
         Cds.FieldByName('STATUSGRUPOCDC').AsString := 'A'
      else
         Cds.FieldByName('STATUSGRUPOCDC').AsString := 'S';

         TreeCCusto.Enabled := (Cds.State = dsEdit);
   end;
end;



{  Pendências 15860 e 16784 }
procedure TfrmCadCCusto.dbedCodExit(Sender: TObject);
var
  i : integer;
  sParte : string;
  s, sCodigo : string;
  bEncontrouPai : boolean;
begin

  inherited;

  if not( cds.State in [dsInsert, dsEdit] ) then
    exit;

  if Trim(dbedCod.Text) = '' then
     Exit;

  sCodigo := cds.FieldByName('CODEXTERNO').DisplayText;

  sParte := '';
  i := length( sCodigo );
  while i > 0 do
  begin
    if sCodigo[i] = '0' then
    begin
      sParte := sCodigo[i] + sParte;
      dec( i );
      Continue;
    end;

    if sCodigo[i] = '.' then
    begin
      if StrToIntDef( sParte, 0 ) = 0 then
        sCodigo := Copy( sCodigo, 1, i - 1 );
      i := length( sCodigo );
      Continue;
    end;

    if sCodigo[i] = ' ' then
    begin
      dec( i );
      Continue;
    end;

    break;
  end;

  sCodigo := StringReplace( sCodigo, '.', '', [rfReplaceAll] );
  if StrToIntDef( sCodigo, 0 ) = 0 then sCodigo := '';

  cds.FieldByName('CODEXTERNO').AsString := sCodigo;

  sCodigo := cds.FieldByName('CODEXTERNO').DisplayText;
  sCodigo := StringReplace( sCodigo, ' ', '', [rfReplaceAll] );
  while Pos( '..', sCodigo ) > 0 do
    sCodigo := StringReplace( sCodigo, '..', '.', [rfReplaceAll] );
  sCodigo := Copy( sCodigo, 1, length( sCodigo ) - 1 );

  i := length( sCodigo );
  while i > 0 do
  begin
    if sCodigo[i] = '.' then break;
    dec( i );
  end;

  if i > 0 then
  begin
    sCodigo := Copy( sCodigo, 1, i - 1 );

    bEncontrouPai := False;
    for i := 0 to ( TreeCCusto.Items.Count - 1 ) do
    begin
      s := TreeCCusto.Items[i].Text;
      s := Copy( s, 1, Pos( ' ', s ) - 1 );
      if s = sCodigo then
      begin
        bEncontrouPai := True;
        break;
      end;
    end;

    if not bEncontrouPai then
    begin
      MsgDlg('Não é possível inserir este ' + Caption + ',   pois não há um pai cadastrado.','Aviso',mtWarning,[mbOk],0);
      cds.FieldByName('CODEXTERNO').Clear;
      dbedCod.SetFocus;
    end;
  end;
  if AcharNo(dbedCod.Text) then
  begin
     MsgDlg('Não é possível inserir este Centro de Custo, pois ele já existe','Aviso',mtWarning,[mbOk],0);
     dbedCod.SetFocus;
  end;
end;    

procedure TfrmCadCCusto.sbtnInsDetClick(Sender: TObject);
begin
// SIG 60690 - Permitir cadastrar novo Substituto sem data de término do último Substituto. Para o Gestor, permanece a mesma coisa ** Início **
  // Kintana 1423815  Sol 142865/6461 Otacilio ** Inicio **
  // Não pode cadastrar um novo responsavel sem antes cadastrar a data termino do ultimo responsavel
  {if Func_RespSemUltimaDataVigencia > 0 then
  begin
    MessageBox(Handle, PChar('Antes de cadastrar um novo responsável' + #13 + 'preencha a data término de vigência do último responsável. '), 'Atenção', MB_OK + MB_ICONWARNING);
    CmeDetalhe.Atualizabotoes(Self);
    Abort;
  end;}
  // Kintana 1423815  Sol 142865/6461 Otacilio ** Fim **
// SIG 60690 - Permitir cadastrar novo Substituto sem data de término do último Substituto. Para o Gestor, permanece a mesma coisa ** Fim **

  inherited;
  if sbtnInsDet.Down then
  begin
    if (PageDetalhe.ActivePage = tbsGestores) then // Felipe A. Santos SOL 195376 KTN 1866485

// SIG 60690 - Permitir cadastrar novo Substituto sem data de término do último Substituto. ** Início **
      if Func_RespSemUltimaDataVigencia > 0 then
      begin
       MessageBox(Handle, PChar('Preencha a data de término de vigência do último Gestor. '), 'Atenção', MB_OK + MB_ICONWARNING);
       CmeDetalhe.Atualizabotoes(Self);
       Abort;
      end
      else
// SIG 60690 - Permitir cadastrar novo Substituto sem data de término do último Substituto. ** Fim **
      begin
        dbgrdDet.SendToBack;
        tb97Detalhe.Visible := true;
        CmeDetalhe.Insert(Self);
        CmeDetalhe.Atualizabotoes(Self);
        CmeDetalhe.Operacao := OpInserir;
      end

    else if(PageDetalhe.ActivePage = tbsSubstitutos) then  // Felipe A. Santos SOL 195376 KTN 1866485
    begin
         // Felipe A. Santos SOL 195376 KTN 1866485
         dbgrdSub.SendToBack;
         tb97Detalhe.Visible := true;
         cmeSubstitutos.Insert(Self);
         cmeSubstitutos.AtualizaBotoes(Self);
         cmeSubstitutos.Operacao := OpInserir;
         // Felipe A. Santos SOL 195376 KTN 1866485 - fim

    end;
  end
  else
    sbtnInsDet.Down := true;
end;

procedure TfrmCadCCusto.sbtnAltDetClick(Sender: TObject);
begin
  inherited;

  if (PageDetalhe.ActivePage = tbsGestores) then // Felipe A. Santos SOL 195376 KTN 1866485
  begin
     // Kintana 1423815  Sol 142865/6461 Otacilio
     sDataIni   := dtIniVig.Text;
     sDataFinal := dtFimVig.Text;
     // Kintana 1423815  Sol 142865/6461 Otacilio - fim
  end
  else if (PageDetalhe.ActivePage = tbsSubstitutos) then // Felipe A. Santos SOL 195376 KTN 1866485
  begin
     // Felipe A. Santos
     sDataIni   := dtIniVigSub.Text;
     sDataFinal := dtFimVigSub.Text;
     // Felipe A. Santos SOL 195376 KTN 1866485 - fim
     sOrdem     := dbEdtOrdem.Value; // SIG 60690
  end;

  if sbtnAltDet.Down then
  begin
       if (PageDetalhe.ActivePage = tbsGestores) then  // Felipe A. Santos SOL 195376 KTN 1866485
       begin
         dbgrdDet.SendToBack;
         tb97Detalhe.Visible := true;
         CmeDetalhe.Edit(Self);
         CmeDetalhe.Atualizabotoes(Self);
         CmeDetalhe.Operacao := OpAlterar;
       end
       else if(PageDetalhe.ActivePage = tbsSubstitutos) then // Felipe A. Santos SOL 195376 KTN 1866485
       begin
         // Felipe A. Santos SOL 195376 KTN 1866485
         dbgrdSub.SendToBack;
         tb97Detalhe.Visible := true;
         cmeSubstitutos.Edit(Self);
         cmeSubstitutos.AtualizaBotoes(Self);
         cmeSubstitutos.Operacao := opAlterar;
         // Felipe A. Santos SOL 195376 KTN 1866485 - fim
       end;
  end
  else
      sbtnAltDet.Down := true;
end;

procedure TfrmCadCCusto.sbtnExcluiDetClick(Sender: TObject);
begin
  inherited;
  if (PageDetalhe.ActivePage = tbsGestores) then // Felipe A. Santos SOL 195376 KTN 1866485
  begin
    CmeDetalhe.Operacao := OpApagar;
    CmeDetalhe.Delete(Self);
    CmeDetalhe.Atualizabotoes(Self);
  end
  else if (PageDetalhe.ActivePage = tbsSubstitutos) then // Felipe A. Santos SOL 195376 KTN 1866485
  begin
    // Felipe A. Santos SOL 195376 KTN 1866485   
    CmeSubstitutos.Operacao := opApagar;
    CmeSubstitutos.Delete(Self);
    CmeSubstitutos.AtualizaBotoes(Self);
    // Felipe A. Santos SOL 195376 KTN 1866485 - Fim
  end;
end;

procedure TfrmCadCCusto.bbtnOkDetClick(Sender: TObject);
begin
  inherited;
  if (PageDetalhe.ActivePage = tbsGestores) then // Felipe A. Santos SOL 195376 KTN 1866485
     CmeDetalhe.Confirma(Self)
  else if (PageDetalhe.ActivePage = tbsSubstitutos) then // Felipe A. Santos SOL 195376 KTN 1866485
     CmeSubstitutos.Confirma(Self);
end;

procedure TfrmCadCCusto.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
   if (PageDetalhe.ActivePage = tbsGestores) then // Felipe A. Santos SOL 195376 KTN 1866485
     CmeDetalhe.Cancel(Self)
  else if (PageDetalhe.ActivePage = tbsSubstitutos) then // Felipe A. Santos SOL 195376 KTN 1866485
     CmeSubstitutos.Cancel(Self);
end;

procedure TfrmCadCCusto.dbgrdDetDblClick(Sender: TObject);
begin
  inherited;
  If (CmeCadastro.Operacao In [OpInserir, OpAlterar]) Then
     If (dbgrdDet.DataSource.DataSet.IsEmpty) Then
       sbtnInsDet.Click
     Else
       sbtnAltDet.Click;
end;

procedure TfrmCadCCusto.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  FazerVoltarDet;
end;

procedure TfrmCadCCusto.FazerVoltarDet;
begin
   if (PageDetalhe.ActivePage = tbsGestores) then // Felipe A. Santos SOL 195376 KTN 1866485
   begin
      if (CdsDet <> nil) and (CdsDet.State in [dsEdit,dsInsert]) then
         CdsDet.Cancel;

      tb97Detalhe.Visible := false;

      if dbgrdDet <> nil then dbgrdDet.BringToFront;
   end
   else if (PageDetalhe.ActivePage = tbsSubstitutos) then // Felipe A. Santos SOL 195376 KTN 1866485
   begin
      // Felipe A. Santos
      if (CdsSub.State in [dsEdit,dsInsert]) then
         CdsSub.Cancel;

      tb97Detalhe.Visible := false;
      dbgrdSub.BringToFront;
      // Felipe A. Santos SOL 195376 KTN 1866485 - fim
   end;

   CmeDetalhe.Atualizabotoes(Self); // Felipe A. Santos SOL 195376 KTN 1866485
end;

procedure TfrmCadCCusto.tbcDetalheChange(Sender: TObject);
begin
  inherited;
  // Felipe A. Santos SOL 195376 KTN 1866485
  PageDetalhe.ActivePageIndex := tbcDetalhe.TabIndex;
  bbtnVoltarDetClick(Self);
  CmeDetalhe.AtualizaBotoes(Self);
  // Felipe A. Santos SOL 195376 KTN 1866485 - fim

  // Felipe A. Santos SOL 229874/16591 PPM 544751  - início
  if tbcDetalhe.detdbGrids.Count > 0 then
  begin
     //if tbcDetalhe.detdbGrids[tbcDetalhe.TabIndex] = '' then //Everson Cunha - SIG134236
     if (tbcDetalhe.detdbGrids[tbcDetalhe.TabIndex] = '') or (tbcDetalhe.detdbGrids[tbcDetalhe.TabIndex] = 'dbgrdMovimentacao') then //Everson Cunha - SIG134236
        tb97BotoesDetalhe.Visible := false
     else
        tb97BotoesDetalhe.Visible := true;
  end;
  // Felipe A. Santos SOL 229874/16591 PPM 544751 - fim

  // Felipe A. Santos SOL 195376 KTN 1866485 - inicio comentário

  {if tbcDetalhe.detdbGrids.count > 0 then
  begin
       dbgrdDet := TwwDBGrid(TComponent(sender).Owner.FindComponent(tbcDetalhe.detdbGrids[tbcDetalhe.TabIndex]));
       if dbgrdDet <> nil then
          cdsDet := TCMClientDataSet(dbgrdDet.DataSource.DataSet)
       else
           cdsDet := nil;

       if tbcDetalhe.detdbGrids[tbcDetalhe.TabIndex] = '' then
          tb97BotoesDetalhe.Visible := false
       else
           tb97BotoesDetalhe.Visible := true;

       bbtnVoltarDetClick(Self);
  end;}
  // Felipe A. Santos SOL 195376 KTN 1866485 - fim comentário

  
end;

procedure TfrmCadCCusto.tbcDetalheChanging(Sender: TObject;
  var AllowChange: Boolean);
var
   mResult : TModalResult;
   sEstado,
   sEstadoCaption : string;
   dsState : TDataSetState; // Felipe A. Santos
begin
  inherited;
  //if (cdsDet <> nil) and (cdsDet.state in [dsInsert,dsEdit]) then // Felipe A. Santos SOL 195376 KTN 1866485

  // Felipe A. Santos SOL 195376 KTN 1866485
  if (tbcDetalhe.Tabs[tbcDetalhe.TabIndex] = 'Gestores') then
     dsState := cdsDet.State
  else if (tbcDetalhe.Tabs[tbcDetalhe.TabIndex] = 'Substitutos')  then
     dsState := cdsSub.State;
  // Felipe A. Santos SOL 229874/16591 PPM 544751 - início

  // Felipe A. Santos SOL 229874/16591 PPM 544751 - fim
  // Felipe A. Santos SOL 195376 KTN 1866485 - fim

  if (dsState in [dsInsert, dsEdit]) then // Felipe A. Santos SOL 195376 KTN 1866485
  begin
       //if cdsDet.state in [dsInsert] then // Felipe A. Santos SOL 195376 KTN 1866485
       if dsState in [dsInsert] then // Felipe A. Santos SOL 195376 KTN 1866485
       begin
            sEstado := 'inclusão';
            sEstadoCaption := 'Inclusão';
       end
       else
       begin
            sEstado := 'alteração';
            sEstadoCaption := 'Alteração';
       end;

     mResult := MsgDlg('Você está tentando mudar de pasta sem confirmar a '+sEstado+' de '+tbcDetalhe.Tabs[tbcDetalhe.TabIndex]+'.'+#13+#10+'Confirma a '+sEstado+' de '+tbcDetalhe.Tabs[tbcDetalhe.TabIndex]+'?', sEstadoCaption+' não confirmada', mtConfirmation, [mbYes, mbNo, mbCancel],0);
     try
        if mResult = mrYes then
        begin
             if (tbcDetalhe.Tabs[tbcDetalhe.TabIndex] = 'Gestores') then// Felipe A. Santos SOL 195376 KTN 1866485
             begin
                CmeDetalhe.RepetirInsert := false;
                bbtnOkDet.Click;
                CmeDetalhe.RepetirInsert := true;
             end
             else if (tbcDetalhe.Tabs[tbcDetalhe.TabIndex] = 'Substitutos') then // Felipe A. Santos SOL 195376 KTN 1866485
             begin
                // Felipe A. Santos
                CmeSubstitutos.RepetirInsert := false;
                bbtnOkDet.Click;
                CmeSubstitutos.RepetirInsert := true;
                // Felipe A. Santos SOL 195376 KTN 1866485 - fim
             end;
        end
        else if mResult = mrNo then
             bbtnCancelarDet.Click
        else if mResult = mrCancel then
             AllowChange := false;
     except end;
  end;


end;

procedure TfrmCadCCusto.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  FazerVoltarDet;
  inherited;
  CmeDetalhe.Atualizabotoes(Self);

end;

procedure TfrmCadCCusto.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  cdsDet.Insert;
end;

procedure TfrmCadCCusto.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  cdsDet.Edit;
end;

procedure TfrmCadCCusto.CmeDetalheDelete(Sender: TObject);
begin
  inherited;
  cdsDet.Delete;
  bbtnOkDetClick(Self);
end;

procedure TfrmCadCCusto.CmeDetalheConfirma(Sender: TObject);
var
  bRepete : boolean;
begin
  if (cdsDet <> nil ) and (cdsDet.State in [dsInsert, dsEdit]) then
  begin
      bRepete := (CmeDetalhe.RepetirInsert) and (cdsDet.State = dsInsert);
      try
         if msPessoa.RetornouValor then
            cdsDet.FieldByName('MATRICULA').AsString := msPessoa.ValoresChave[1];// Felipe A. Santos SOL 195376 KTN 1866485

         cdsDet.FieldByName('TIPORESPCENTCUST').AsString := 'G'; // Felipe A. Santos SOL 195376 KTN 1866485
         cdsDet.Post;
         if bRepete then
            CmeDetalhe.Insert(Self)
         else
            FazerVoltarDet;  
      except end;
      CmeDetalhe.Atualizabotoes(Self);
  end;
end;

procedure TfrmCadCCusto.CmeDetalheCancel(Sender: TObject);
begin
  inherited;
  if cdsDet <> nil then
  begin
      cdsDet.Cancel;
      dbgrdDet.BringToFront;
  end;

  tb97Detalhe.Visible := false;
  CmeDetalhe.Atualizabotoes(Self);
end;

procedure TfrmCadCCusto.AtualizaBotoes(Sender: TObject);
var
  lTemReg : Boolean;
  dsState : TDataSetState;
begin
  inherited;

  // Felipe A. Santos SOL 195376 KTN 1866485
  {If  (cdsDet <> nil) Then
  Begin
     sbtnInsDet.Down := (cdsDet.State = dsInsert);
     sbtnAltDet.Down := (cdsDet.State = dsEdit);
  End;
  }

  if (PageDetalhe.ActivePage = tbsGestores) then
     dsState := cdsDet.State
  else if (PageDetalhe.ActivePage = tbsSubstitutos) then
     dsState := cdsSub.State;  

  sbtnInsDet.Down := (dsState = dsInsert);
  sbtnAltDet.Down := (dsState = dsEdit);

  // Felipe A. Santos SOL 195376 KTN 1866485 - fim

  if (CmeCadastro.Operacao in [opInserir,opAlterar]) and
     (VerificaMestre) then
  begin
    if (PageDetalhe.ActivePage = tbsGestores) then // Felipe A. Santos SOL 195376 KTN 1866485
    begin
      if (cdsDet <> nil) and (not cdsDet.IsEmpty) then
         lTemReg := true
      else
         lTemReg := false;
    end
    else if (PageDetalhe.ActivePage = tbsSubstitutos) then // Felipe A. Santos
    begin
      // Felipe A. Santos SOL 195376 KTN 1866485
      if (cdsSub <> nil) and (not cdsSub.IsEmpty) then
         lTemReg := true
      else
         lTemReg := false;
      // Felipe A. Santos SOL 195376 KTN 1866485 - fim   
    end;

    sbtnInsDet.Enabled := (Not sbtnAltDet.Down);
    sbtnAltDet.Enabled := lTemReg And (Not sbtnInsDet.Down);
    sbtnExcluiDet.Enabled := lTemReg And (Not sbtnInsDet.Down) And (Not sbtnAltDet.Down);
  end
  else
  begin
     sbtnInsDet.Enabled := false;
     sbtnAltDet.Enabled := false;
     sbtnExcluiDet.Enabled := false;
  end;

  AutorizarForm(afSoDesabilitar);
end;

function TfrmCadCCusto.VerificaMestre: boolean;
begin
   if Cds.Active then
   begin
        if Cds.State in ([dsInsert,dsEdit]) then
           Result := true
        else
            if (Cds.IsEmpty) then
               Result := false
            else
                Result := true;
   end
   else
       Result := false;
end;

procedure TfrmCadCCusto.CmeDetalheBeforeConfirma(sender: TObject;
  var Accept: Boolean);
var dDataFinal : tDateTime;
begin
  inherited;
  if cdsDet.State in [dsInsert, dsEdit] then
  begin
    cdsDet.FieldByName('NOME').AsString := cmpPessoa.Text;

    if cdsDet.FieldByName('IDPESSOA').IsNull then
    begin
      ShowMessage('Selecione o gestor.'); // Alterador por Felipe A. Santos
      Abort;
    end;

    if ( dtIniVig.Text <> '' ) and ( dtFimVig.Text <> '' ) then
    begin
      if dtIniVig.Date > dtFimVig.Date then
      begin
        ShowMessage('O início da vigência não pode ser posterior ao seu término.');
        Abort;
      end;
    end;

    // Kintana 1423815  Sol 142865/6461 Otacilio ** Inicio **
    if Trim(dtIniVig.Text) = '' then
    begin
      MessageBox(Handle, 'Preencha a data inicio de vigência.', 'Atenção', MB_OK + MB_ICONWARNING);
      Abort;
    end;

    // Não pode cadastrar um novo responsavel com data Inicial menor ou igual a data termino do ultimo responsavel
    if cdsDet.State in [dsInsert] then
    begin
      if Func_MenorDataVigencia(dtIniVig.Date) > 0 then
      begin
        MessageBox(Handle, Pchar('Data inicio de vigência não pode ser menor ou igual ' + #13 + 'a data término de vigência do responsável anterior.'), 'Atenção', MB_OK + MB_ICONWARNING);
        Abort;
      end;
    end;

    // WO15987 - Global - Cadastro de centro de custo
    // Alterado por Arnaldo V. Scarin em 25/11/2024
    sDataFinal := dtFimVig.Text;    // Ferrari  WO17542
    if (cdsDet.State in [dsInsert, dsEdit]) and (Trim(dtFimVig.Text) <> '') and (Trunc(dtFimVig.Date) <> 0)  then
    begin
       // 25/11/2024 23:59:59
       dDataFinal := dtFimVig.Date;
       // o Campo dDataFinal vai receber o Valor da Data e hora do componente
       // se o CAmpo dDataFinal não tiver a hora, ao ser comparado com o
       // trunc da Data, os 2 vão ser iguais.
       // Nesse Caso é necessário informar a hora, como sendo '23:59:59'
       if dDataFinal = Trunc(dDataFinal) then
         CdsDet.FieldByName('DTFIMVIG').asString := sDataFinal + ' 23:59:59';
    End;

    // Ao alterar uma data termino de vigencia não pode ser maior ou igual a data inicio de um responsavel ja cadastrado.
    if (cdsDet.State in [dsEdit]) and (sDataFinal <> Trim(dtFimVig.Text)) then
    begin
      if Func_ValidarUltimaDataVigencia(dtIniVig.Date, dtFimVig.Date,CdsDet.FieldByName('idpessoa').asString) > 0 then    // WO17542 Ferrari
      begin
        MessageBox(Handle, PChar('Existe responsável com data inicio de vigência menor ou igual ' + #13 + 'a data término de vigência alterada.'), 'Atenção', MB_OK + MB_ICONWARNING);
        Abort;
      end
    end;

    // Ao alterar a data inicio de vigencia não pode ser menor ou igual a um responsavel ja cadastrado anteriormente.
    if (cdsDet.State in [dsEdit]) and (sDataIni <> Trim(dtIniVig.Text))  then
    begin
      if Func_ValidarInicioDataVigencia(dtIniVig.Date, dtFimVig.Date) > 0 then
      begin
        MessageBox(Handle, PChar('A data inicio de vigência não pode ser menor ou igual ' + #13 + 'a data término de vigência do responsável anterior.'), 'Atenção', MB_OK + MB_ICONWARNING);
        Abort;
      end
    end;
    // Kintana 1423815  Sol 142865/6461 Otacilio ** Fim **
  end;
end;

procedure TfrmCadCCusto.MontaArvore(iIdEmpresa: integer; fIdPlanoCentCust: Double; sMascara: string);
 var
  ItemNo      : pItem;
  No          : TTreeNode;
  sCodPaiGrup : string;
begin
  // P:21368 - 31/01/2006

   Seleciona(iIdEmpresa, fIdPlanoCentCust);

   try
      TreeCCusto.Items.Clear;
      No := TreeCCusto.Items.GetFirstNode;
      bMontandoArvore := true;

      Cds.First;
      sCodPaiGrup := Cds.FieldByName('CODEXTERNO').AsString;

      while not Cds.Eof do
      begin
         new(ItemNo);
         ItemNo.CodExterno   := Cds.FieldByName('CODEXTERNO').AsString;
         ItemNo.CodCentCust  := Cds.FieldByName('CODCENTROCUSTO').AsString;
         ItemNo.NomeCentCust := RetornaCod(Cds.FieldByName('CODEXTERNO').DisplayText) + ' - ' + Cds.FieldByName('NOME').AsString;
         ItemNo.FlgAnaSint   := Cds.FieldByName('STATUSGRUPOCDC').AsString;

         if (No <> nil) then
         begin
            while pItem(No.Data)^.CodExterno <> Copy(Cds.FieldByName('CODEXTERNO').AsString,1,Length(pItem(No.Data)^.CodExterno)) do
            begin
               if sCodPaiGrup = Copy(Cds.FieldByName('CODEXTERNO').AsString,1,Length(sCodPaiGrup)) then
                  No := No.Parent
               else
               begin
                  sCodPaiGrup := Cds.FieldByName('CODEXTERNO').AsString;
                  No          := nil;
                  Break;
               end;
            end;
          end ;

         if ItemNo.FlgAnaSint = 'S' then
         begin
            No          := InserePasta(False, TreeCCusto,No,ItemNo);
         end
         else
            InserePapel(TreeCCusto,No,ItemNo);

         Cds.Next;
      end;

   finally
      bMontandoArvore := False;
      ItemNo := nil;

   end;
end;

procedure TfrmCadCCusto.DbLcbPlanoCCCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  // P:21368 - 31/01/2006
  fPlanCentCust := cdsPlanoCC.FieldbyName('IdPlanCentCust').AsFloat;
  sMascCCusto   := cdsPlanoCC.FieldByName('MASCARA').AsString;
  MontaSelect.Filtro.text:=sfiltro;
  MontaSelect.Filtro.Add('CCU.IDPLANCENTCUST = ' + FormatFloat('#0', fPlanCentCust));
  MontaArvore(Sistema.IdEmpresa,
              fPlanCentCust,
              cdsPlanoCC.FieldbyName('Mascara').Asstring);
end;

function TfrmCadCCusto.RetornaCod(sCod: string): string;
var
  i: integer;
begin
   for i := Length(sCod) downto 1 do
   begin
      if sCod[i] in ['0'..'9'] then
      begin
         Result := Copy(sCod,1,i);
         Break
      end;
   end;
end;

function TfrmCadCCusto.AcharNo(sCod: string): Boolean;
var
  No: TTreeNode;
begin

   No := TreeCCusto.Items.GetFirstNode;
    //  09/02
   if  (no <> nil) then

   while (Trim(pItem(No.Data)^.CodExterno) <> Trim(sCod)) do
   begin
      if Trim(pItem(No.Data)^.CodExterno) = Copy(sCod,1,Length(pItem(No.Data)^.CodExterno)) then
         No := No.GetNext
      else
         No := No.getNextSibling;
      if No = nil then Break;
   end;

   Result := (No <> nil);
end;

function TfrmCadCCusto.InserePasta(bEumaPasta: Boolean;
  Arvore: TTreeView; NoDestino: TTreeNode; pDesc: pItem): TTreeNode;
var
  No: TTreeNode;

begin
  if bEumaPasta then
    No := Arvore.Items.AddObject(NoDestino,pDesc.NomeCentCust,pDesc)
  else
    No := Arvore.Items.AddChildObject(NoDestino,pDesc.NomeCentCust,pDesc);
  No.ImageIndex    := 0;
  No.SelectedIndex := 1;
  Result := No;
end;

procedure TfrmCadCCusto.InserePapel(Arvore: TTreeView;
  NoDestino: TTreeNode; pDesc: pItem);
var
  No: TTreeNode;

begin
  No := Arvore.Items.AddChildObject(NoDestino,pDesc.NomeCentCust,pDesc);
  No.ImageIndex    := 2;
  No.SelectedIndex := 3;
end;




procedure TfrmCadCCusto.TreeCCustoChange(Sender: TObject; Node: TTreeNode);
begin
  inherited;

   if Cds.Locate('CODEXTERNO',pItem(TreeCCusto.selected.Data)^.CodExterno,[]) then
   begin
      if Cds.FieldByName('STATUSGRUPOCDC').AsString = 'A' then
         sbtnAnalitico.Down := True
      else
         if Cds.FieldByName('STATUSGRUPOCDC').AsString = 'S' then
            sbtnSintetico.Down := True;
   end;
end;

procedure TfrmCadCCusto.sbtnApagarClick(Sender: TObject);
begin
  if (mrOk = Msgdlg('Confirma exclusão', 'Confirmação', mtConfirmation, [ mbOk, mbCancel ], 0)) then
  begin
    Repaint;
    // Thiago Melo SOL 236997 PPM 478691
    //if not CentroCusto.CentCustExclui(cds.FieldByName('CODCENTROCUSTO').AsInteger,cds.FieldByName('IDEMPRESA').AsFloat) then
    if (not CentroCusto.excluirResponsavelCentCust(cds.FieldByName('CODCENTROCUSTO').AsInteger,cds.FieldByName('IDEMPRESA').AsFloat)) then // Thiago Melo SOL 236997 PPM 478691
    // Thiago Melo SOL 236997 PPM 478691
    begin
      // Felipe A. Santos SOL 195376 KTN 1866485
      if (Pos('Master has detail records', CentroCusto.MessageInfo) > 0) then begin// Testa para ver se erro de chave filha // Thiago Melo SOL 236997 PPM 478691
        CentroCusto.MessageInfo := 'Não é possível excluir o centro de custo pois ele possui vinculação.';
        // Thiago Melo SOL 236997 PPM 478691
        MsgDlg(CentroCusto.MessageInfo, 'Erro', mtError, [ mbOk ], 0);
        Repaint;
        // Thiago Melo SOL 236997 PPM 478691
      end else begin
        // Felipe A. Santos SOL 195376 KTN 1866485 - fim
        MsgDlg(CentroCusto.MessageInfo, 'Erro', mtError, [ mbOk ], 0);
        Repaint;
      end;
    end else begin
      // Thiago Melo SOL 236997 PPM 478691
      //TreeCCusto.Selected.Delete;
      //MontaArvore(Sistema.IdEmpresa,fPlanCentCust,'');
      // Thiago Melo SOL 236997 PPM 478691
    end;
  end;
  bbtnCancelarClick(Self);
end;

procedure TfrmCadCCusto.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  MontaArvore(Sistema.IdEmpresa,fPlanCentCust,'');
  // 10/02/2006
  DbLcbPlanoCC.Enabled:= True;
end;

procedure TfrmCadCCusto.VarrerChefia;
begin
  CentroCusto.IdChefe:= '';
  cdsDet.Last;
  while not cdsDet.Bof do
  begin
    // Kintana 1423815  Sol 142865/6461 Otacilio - Esta condicao estava com erro.
    //if cdsDet.FieldByName('DTFIMVIG').AsDateTime = 0 then
    //begin
      CentroCusto.IdChefe:= cdsDet.FieldByName('IDPESSOA').AsString;
      //Break;
    //end;
    cdsDet.Prior;
  end;
end;

function TfrmCadCCusto.Func_RespSemUltimaDataVigencia: Integer;
begin
  Result := -1;
// SIG 60690 - Permitir cadastrar novo Substituto sem data de término do último Substituto. Para o Gestor, permanece a mesma coisa ** Início **
  {if (PageDetalhe.ActivePage = tbsGestores) then // Felipe A. Santos SOL 195376 KTN 1866485
  begin }
// SIG 60690 - Permitir cadastrar novo Substituto sem data de término do último Substituto. Para o Gestor, permanece a mesma coisa ** Fim **

  cdsDet.Filtered := False;
  cdsDet.Filter   := 'DTFIMVIG IS NULL';
  cdsDet.Filtered := True;

  if not cdsDet.IsEmpty then
  begin
    Result := cdsDet.RecordCount;
    cdsDet.Filtered := False;
  end;

    cdsDet.Filtered := False;

  // SIG 60690 - Permitir cadastrar novo Substituto sem data de término do último Substituto. Para o Gestor, permanece a mesma coisa ** Início **
  {end
  else if (PageDetalhe.ActivePage = tbsSubstitutos) then // Felipe A. Santos SOL 195376 KTN 1866485
  begin
    // Felipe A. Santos SOL 195376 KTN 1866485
    cdsSub.Filtered := False;
    cdsSub.Filter   := 'DTFIMVIG IS NULL';
    cdsSub.Filtered := True;

    if not cdsSub.IsEmpty then
    begin
      cdsSub.Filtered := False;
      Result := cdsSub.RecordCount;
    end;

    cdsSub.Filtered := False;
    // Felipe A. Santos SOL 195376 KTN 1866485 - fim
  end;  }
  // SIG 60690 - Permitir cadastrar novo Substituto sem data de término do último Substituto. Para o Gestor, permanece a mesma coisa ** Fim **
end;

function TfrmCadCCusto.Func_MenorDataVigencia(Data: TDateTime): Integer;
  var J: Integer;
     CdsTemp: TClientDataSet;
begin
  Result := -1;
  try
    CdsTemp := TClientDataSet.Create(Nil);

    if (PageDetalhe.ActivePage = tbsGestores) then // Felipe A. Santos SOL 195376 KTN 1866485
       CdsTemp.CloneCursor(cdsDet, False, False)
    else if (PageDetalhe.ActivePage = tbsSubstitutos) then // Felipe A. Santos SOL 195376 KTN 1866485
       CdsTemp.CloneCursor(cdsSub, False, False); // Felipe A. Santos SOL 195376 KTN 1866485

    CdsTemp.Filtered := False;
    CdsTemp.Filter   := 'DTFIMVIG >= ' + QuotedStr(DateToStr(Data)) ;
    CdsTemp.Filtered := True;

    if CdsTemp.IsEmpty then
      Exit;

    // Result := cdsDet.RecordCount; // Felipe A. Santos SOL 195376 KTN 1866485
    Result := CdsTemp.RecordCount; // Felipe A. Santos SOL 195376 KTN 1866485

  finally
    FreeAndNil(CdsTemp);
  end;

end;

function TfrmCadCCusto.Func_ValidarUltimaDataVigencia(DataIni, DataFim: TDateTime; ppessoa: string): Integer;     // WO17542 Ferrari
var CdsTemp: TClientDataSet;
begin
  Result := -1;
  try
    CdsTemp  := TClientDataSet.Create(Nil);

    if (DataIni <> 0) and (DataFim <> 0) then
    begin
      if (PageDetalhe.ActivePage = tbsGestores) then // Felipe A. Santos SOL 195376 KTN 1866485
         CdsTemp.CloneCursor(cdsDet, False, False)
      else if (PageDetalhe.ActivePage = tbsSubstitutos) then // Felipe A. Santos SOL 195376 KTN 1866485
         CdsTemp.CloneCursor(cdsSub, False, False); // Felipe A. Santos SOL 195376 KTN 1866485

      CdsTemp.Filtered := False;
      CdsTemp.Filter   := 'DTINICIOVIG > ' + QuotedStr(DateToStr(DataIni)) +
                          ' AND DTINICIOVIG <= ' + QuotedStr(DateToStr(DataFim)) +
                          ' AND IDPESSOA = ' + QuotedStr(ppessoa);   // WO17542 Ferrari
      CdsTemp.Filtered := True;
    end;

    if CdsTemp.IsEmpty then
      Exit;

    Result := CdsTemp.RecordCount;

  finally
    FreeAndNil(CdsTemp);
  end;
end;

function TfrmCadCCusto.Func_ValidarInicioDataVigencia(DataIni, DataFim: TDateTime): Integer;
var CdsTemp: TClientDataSet;
begin
  Result := -1;
  try
    CdsTemp := TClientDataSet.Create(Nil);
    if (DataIni <> 0) then
    begin
      if (PageDetalhe.ActivePage = tbsGestores) then // Felipe A. Santos SOL 195376 KTN 1866485
         CdsTemp.CloneCursor(cdsDet, False, False)
      else if (PageDetalhe.ActivePage = tbsSubstitutos) then // Felipe A. Santos SOL 195376 KTN 1866485
         CdsTemp.CloneCursor(cdsSub, False, False); // Felipe A. Santos SOL 195376 KTN 1866485

      CdsTemp.Filtered := False;
//      CdsTemp.Filter   := 'DTFIMVIG >= ' + QuotedStr(DateToStr(DataIni)) +
//                          'AND DTINICIOVIG < ' + QuotedStr(sDataIni{DateToStr(DataIni)});
      // WO15987 - Global - Cadastro de centro de custo
      // Alterado por Arnaldo V. Scarin em 11/11/2024
      // Foi feito o Ajuste para que seja considerado o Time no Campo Data
      CdsTemp.Filter   := 'DTFIMVIG >= ' + QuotedStr(DateTimeToStr(DataIni)) +
                          'AND DTINICIOVIG < ' + QuotedStr(sDataIni{DateToStr(DataIni)});

      CdsTemp.Filtered := True;
    end;

    if CdsTemp.IsEmpty then
      Exit;

    Result := CdsTemp.RecordCount;
  finally
    FreeAndNil(CdsTemp);
  end;

end;

function TfrmCadCCusto.VerificaMascara(sMascara: String;
  var lNivel: array of Integer; var ind: Integer): Boolean;
var
  i, iSoma: Integer; // Felipe A. Santos SOL 195376 KTN 1866485
begin
  // Felipe A. Santos SOL 195376 KTN 1866485 - a rotina foi copiada do Umodulo do globalcm
  Result := True;
  iSoma  := 0;
  lNivel[ 0 ] := 1;

  For i := 1 To Length( sMascara ) Do Begin
      If copy( sMascara, i, 1 ) = '.'{ivlm} Then Begin
         Inc( ind );
         lnivel[ ind ] := i - ind - iSoma;
         iSoma := iSoma + lNivel[ ind ];
      End;
  End;

  If ( ind = 0 ) And ( Length( sMascara ) > 0 ) Then Begin
     lnivel[ 1 ] := Length( sMascara );
     ind := 1;
  End;

  If ind = 0 Then
     Result := False;

  lNivel[ ind + 1 ] := Length( sMascara ) - ind - iSoma;
  // Felipe A. Santos SOL 195376 KTN 1866485 - fim
end;

procedure TfrmCadCCusto.CmeSubstitutosInsert(Sender: TObject);
begin
  inherited;
  cdsSub.Insert;
  cdsSub.FieldByName('ORDEM').asfloat := 1; // SIG 60690
  sOrdem := -1; //SIG 60690
end;

procedure TfrmCadCCusto.CmeSubstitutosEdit(Sender: TObject);
begin
  inherited;
  cdsSub.Edit;
end;

procedure TfrmCadCCusto.CmeSubstitutosCancel(Sender: TObject);
begin
  inherited;
  // Felipe A. Santos SOL 195376 KTN 1866485
  cdsSub.Cancel;
  dbgrdSub.BringToFront;
  tb97Detalhe.Visible := false;
  cmeSubstitutos.Atualizabotoes(Self);
  // Felipe A. Santos SOL 195376 KTN 1866485 - fim
end;

procedure TfrmCadCCusto.CmeSubstitutosDelete(Sender: TObject);
begin
  inherited;
  cdsSub.Delete; // Felipe A. Santos SOL 195376 KTN 1866485
end;

procedure TfrmCadCCusto.CmeSubstitutosBeforeConfirma(sender: TObject;
  var Accept: Boolean);
var dDataFinal : TDateTime;
begin
  inherited;
  // Felipe A. Santos
  if cdsSub.State in [dsInsert, dsEdit] then
  begin
    cdsSub.FieldByName('NOME').AsString := cmpPessoaSub.Text;

    if cdsSub.FieldByName('IDPESSOA').IsNull then
    begin
      MessageBox(Handle, PChar('Selecione o Substituto.'), 'Atenção', MB_OK + MB_ICONWARNING);
      Abort;
    end;

    if ( dtIniVigSub.Text <> '' ) and ( dtFimVigSub.Text <> '' ) then
    begin
      if dtIniVigSub.Date > dtFimVigSub.Date then
      begin
        MessageBox(Handle, PChar('O início da vigência não pode ser posterior ao seu término.'), 'Atenção', MB_OK + MB_ICONWARNING);
        dtIniVigSub.SetFocus;
        Abort;
      end;
    end;

    if Trim(dtIniVigSub.Text) = '' then
    begin
      MessageBox(Handle, 'Preencha a data início de vigência.', 'Atenção', MB_OK + MB_ICONWARNING);
      dtIniVigSub.SetFocus;
      Abort;
    end;

// SIG 60690 - Permitir cadastrar novo Substituto sem data de término do último Substituto. Para o Gestor, permanece a mesma coisa ** Início **
    if dtFimVigSub.Text = '' then
    if (sOrdem <> dbEdtOrdem.Value) then
    if (cdsSub.State in [dsInsert, dsEdit]) and (Func_VerificarMesmaOrdem(dbEdtOrdem.Value)) then
    begin
      MessageBox(Handle, 'Ordem de substituição já definida para outro Substituto.' + #13 + 'Favor modificar a ordem.', 'Atenção', MB_OK + MB_ICONWARNING);
      dbEdtOrdem.SetFocus;
      Abort;
    end;
// SIG 60690 - Permitir cadastrar novo Substituto sem data de término do último Substituto. Para o Gestor, permanece a mesma coisa ** Fim **


    // Não pode cadastrar um novo responsavel com data Inicial menor ou igual a data termino do ultimo responsavel
    if cdsSub.State in [dsInsert] then
    begin
      if Func_MenorDataVigencia(dtIniVigSub.Date) > 0 then
      begin
        MessageBox(Handle, Pchar('Data início de vigência não pode ser menor ou igual ' + #13 + 'a data término de vigência do responsável anterior.'), 'Atenção', MB_OK + MB_ICONWARNING);
        dtIniVigSub.SetFocus;
        Abort;
      end;
    end;

    // WO15987 - Global - Cadastro de centro de custo
    // Alterado por Arnaldo V. Scarin em 25/11/2024
    sDataFinal := dtFimVigSub.Text;    // Ferrari  WO17542
//    if (cdsSub.State in [dsInsert, dsEdit]) and (Trim(dtFimVigSub.Text) <> '') and (Trunc(dtFimVig.Date) <> 0) then    // Ferrari  WO17542
    if (cdsSub.State in [dsInsert, dsEdit]) and (Trim(dtFimVigSub.Text) <> '') and (Trunc(dtFimVigSub.Date) <> 0) then   // Ferrari  WO17542
    begin
       // 25/11/2024 23:59:59
       dDataFinal := dtFimVigSub.Date;
       // o Campo dDataFinal vai receber o Valor da Data e hora do componente
       // se o CAmpo dDataFinal não tiver a hora, ao ser comparado com o
       // trunc da Data, os 2 vão ser iguais.
       // Nesse Caso é necessário informar a hora, como sendo '23:59:59'
       if dDataFinal = Trunc(dDataFinal) then
         CdsSub.FieldByName('DTFIMVIG').asString := sDataFinal + ' 23:59:59';
    End;

    // Ao alterar uma data termino de vigencia não pode ser maior ou igual a data inicio de um responsavel ja cadastrado.
    if (cdsSub.State in [dsEdit]) and (sDataFinal <> Trim(dtFimVigSub.Text)) then
    begin
      if Func_ValidarUltimaDataVigencia(dtIniVigSub.Date, dtFimVigSub.Date,cdsSub.FieldByName('idpessoa').asString) > 0 then    // WO17542 Ferrari
      begin
        MessageBox(Handle, PChar('Existe responsável com data início de vigência menor ou igual ' + #13 + 'a data término de vigência alterada.'), 'Atenção', MB_OK + MB_ICONWARNING);
        dtFimVigSub.SetFocus;
        Abort;
      end
    end;


    // Ao alterar a data inicio de vigencia não pode ser menor ou igual a um responsavel ja cadastrado anteriormente.
    if (cdsSub.State in [dsEdit]) and (sDataIni <> Trim(dtIniVigSub.Text))  then
    begin
      if Func_ValidarInicioDataVigencia(dtIniVigSub.Date, dtFimVigSub.Date) > 0 then
      begin
        MessageBox(Handle, PChar('A data início de vigência não pode ser menor ou igual ' + #13 + 'a data término de vigência do responsável anterior.'), 'Atenção', MB_OK + MB_ICONWARNING);
        dtIniVigSub.SetFocus;
        Abort;
      end
    end;
  end;
  // Felipe A. Santos SOL 195376 KTN 1866485 - fim
end;

procedure TfrmCadCCusto.CmeSubstitutosConfirma(Sender: TObject);
var
   bRepete : boolean;
begin
  inherited;
  // Felipe A. Santos SOL 195376 KTN 1866485
  if (cdsSub.State in [dsInsert, dsEdit]) then
  begin
      bRepete := (CmeSubstitutos.RepetirInsert) and (cdsSub.State = dsInsert);
      try
         if msPessoa.RetornouValor then
            cdsSub.FieldByName('MATRICULA').AsString := msPessoa.ValoresChave[1];

         cdsSub.FieldByName('TIPORESPCENTCUST').AsString := 'S';
         cdsSub.Post;
         if bRepete then
            CmeSubstitutos.Insert(Self)
         else
            FazerVoltarDet; 
      except end;
      CmeSubstitutos.Atualizabotoes(Self);
  end;
  // Felipe A. Santos SOL 195376 KTN 1866485 - fim
end;

procedure TfrmCadCCusto.dbgrdSubDblClick(Sender: TObject);
begin
  inherited;
  // Felipe A. Santos SOL 195376 KTN 1866485
  If (CmeCadastro.Operacao In [OpInserir, OpAlterar]) Then
     If (dbgrdSub.DataSource.DataSet.IsEmpty) Then
       sbtnInsDet.Click
     Else
       sbtnAltDet.Click;
  // Felipe A. Santos SOL 195376 KTN 1866485 - fim
end;

function TfrmCadCCusto.VerificaPreenchimento: boolean;
begin
  // Felipe A. Santos SOL 229874/16591 PPM 544751 - início
  Result := False;

  // Andre Imakawa SOL 258754/17869 PPM 1136600 - Inicio     
  if (Trim(dbedCod.Text) = '') then
  begin
    PageContabil.ActivePageIndex := 0;
    MsgDlg('Preencha o campo Código.', 'Aviso', mtWarning, [mbOk, mbHelp], HelpContext);
    dbedCod.SetFocus;
  end
  // Andre Imakawa SOL 258754/17869 PPM 1136600  - Fim
  //Everson Cunha - SIG121175 - Ini
  {else if cdsDet.IsEmpty then
  begin
    ShowMessage('Cadastre um Gestor para o Centro de Custo.');
    tbcDetalhe.TabIndex := 0;
    tbcDetalheChange(Self);
  //Cássio Rovaroto - SIG nº 59823.59824 - Início
  //end
  //else if (Trim(dbeCodLotacao.Text) = '') then
  //begin
  //   tbcDetalhe.TabIndex := 2;
  //   tbcDetalheChange(Self);
  //   MsgDlg('Preencha o campo Tipo de Lotação Tributária.', 'Aviso', mtWarning, [mbOk, mbHelp], HelpContext);
  //   dbeCodLotacao.SetFocus;
  end}
  //Everson Cunha - SIG121175 - Fim
  else
  begin
       Result := True;
  end;

  // Felipe A. Santos SOL 229874/16591 PPM 544751 - fim
end;

//Cássio Rovaroto  - SIG nº 59823.59824 - Início
// Andre Imakawa SOL 258754/17869 PPM 1136600 - Início
//procedure TfrmCadCCusto.btnProcurarLotacaoClick(Sender: TObject);
//begin
//  if (Cds.State in [dsInsert, dsEdit]) then
//  begin
//    inherited;
//    msLotacao.Executar;
//    if (msLotacao.RetornouValor) then
//    begin
//        Cds.FieldByName('CODLOTACAOESOCIAL').AsString := msLotacao.ValoresChave[0];
//        Cds.FieldByName('DESCCODLOTACAO').AsString := msLotacao.ValoresChave[1];
//
//    end;
//  end;
//end;
// Andre Imakawa SOL 258754/17869 PPM 1136600 - fim
//Cássio Rovaroto  - SIG nº 59823.59824 - Fim

// SIG 60690 - Permitir cadastrar novo Substituto sem data de término do último Substituto. Para o Gestor, permanece a mesma coisa ** Início **
function TfrmCadCCusto.Func_VerificarMesmaOrdem(Ordem: Double): Boolean;
Var
cdsAux: TClientDataSet;
begin

  cdsAux := TClientDataSet.Create(Nil);
  Result := False;

  try
  cdsAux.CloneCursor(cdsSub, false);

  cdsAux.Filtered := False;
  cdsAux.Filter   := 'DTFIMVIG IS NULL AND ORDEM = ' + floattostr(Ordem);
  cdsAux.Filtered := True;

  if not cdsAux.IsEmpty then
    Result := True;

  finally
    FreeAndNil(cdsAux);
  end;
end;
// SIG 60690 - Permitir cadastrar novo Substituto sem data de término do último Substituto. Para o Gestor, permanece a mesma coisa ** Fim **

end.
