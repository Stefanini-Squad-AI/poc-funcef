//******************************************************************************
// Data      : 09/08/2007
// Código    : AL_16
// Pendencia : 25761
// SOL       : 63520 / 63519
// Desc      : Retirado a implementação para buscar o IOF pago como despesa
//******************************************************************************
// Data      : 01/08/2007
// Código    : AL_15
// Pendencia : 25761
// SOL       : 63520 / 63519
// Desc      : Implementação para buscar o IOF pago como despesa
//******************************************************************************
// Data      : 30/07/2007
// Código    : AL_14
// Pendencia : 25682
// SOL       :
// Motivo    : Implementação do grafico de rentabilidade da cota
//             Implementação do gráfico paralelo do indexador
//******************************************************************************
// Data      : 02/07/2007
// Código    : AL_13
// Pendencia : 25594
// SOL       : 56257
// Motivo    : Implementação da coluna de DESPESAS, devido a taxa de ingresso e saída
//             referentes aos fundos FIA, FIDC e Participações
//******************************************************************************
// Data      : 13/01/2007
// Pendência : 24420
// SOL       :
// Código    : AL_12
// Motivo    : Ajuste no sql de renda fixa para buscar operações de fluxo (-17,-18,-19)
//               (Pagamento de Juros) pela data de liquidação para evitar recebimentos
//               no fim de semana e feriados com liquidação no próximo dia útil
//******************************************************************************
// Data      : 04/05/2007
// Código    : AL_11
// Pendencia : 25260
// SOL       : 59450
// Desc      : Implementação para buscar as operações de transferências entre planos
//******************************************************************************
// Data      : 20/03/2007
// Código    : AL_10
// Pendencia : 54647/53827
// SOL       : 24610 / 24623
// Desc      : Ajuste na apuração da Rentabilidade.
//******************************************************************************
// Data      : 05/05/2006
// Código    : AL_9
// Pendência :
// SOL       :
// Motivo    : Ajuste no cálculo de Fundos para desprezar o valor de amortização
//               no dia.
//******************************************************************************
// Data      : 26/09/2006
// Código    : AL_8
// Pendencia : 22968
// SOL       :
// Desc      : Segregação de Planp/Patrocinadora
//******************************************************************************
// Data      : 30/08/2006
// Código    : AL_7
// Pendência : 22781
// SOL       :
// Motivo    : Implementação para melhorar perfomance do SQL
//******************************************************************************
// Data      : 23/02/2006
// Pendência : 21583
// SOL       : 40665
// Código    : AL_6
// Motivo    : Ajuste nos tipos de operação de resgate, para desprezar os fluxos
//               pois estes já são montados dinamicamente no SQL da query
//******************************************************************************
// Data      : 22/02/2006
// Pendência : 20152
// SOL       : 36797
// Código    : AL_5
// Motivo    : Acerto na montagem do sqp para período de Renda Variável para trazer
//             o período corretamente
//******************************************************************************
// Data     : 06/01/2005
// Código   : AL_4
// Motivo   : Aumento das casas decimais
//******************************************************************************
// Data     : 20/07/2004
// Código   : AL_3
// Motivo   : Acerto na qry para não fazer cartesiano ao trazer os pagamentos
//              de juros na data de vencimento e não na data da operação
//******************************************************************************
// Data     : 25/06/2004
// Código   : AL_2
// Motivo   : Acerto na qry para trazer os saldos após OPE de Resgate Total
//******************************************************************************
// Data     : 24/06/2004
// Código   : AL_1
// Motivo   : Filtragem de operações de fluxo nos finais de semana
//******************************************************************************

unit FConsMovRentabilidade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, DBCtrls, TREdit, uBibliotecaInvest,
  wwdbdatetimepicker, CMDateTimePicker, Grids, Wwdbigrd, Wwdbgrid, fcLabel,
  ComCtrls, URegra, FPreview;

type
  TResultOpe = record
     fValorApl:      Double;
     fValorRsg:      Double;
  end;

  TfrmConsMovRentabilidade = class(TfrmCadastroCS)
    PnlSelecao: TPanel;
    pnlGrid: TPanel;
    DbGrdAplicacao: TwwDBGrid;
    pnlTitMovimento: TPanel;
    pnlPortfolio: TPanel;
    pnlDatas: TPanel;
    pnlValores: TPanel;
    pnlIndicador: TPanel;
    pnlPerSInd: TPanel;
    pnlTitPerSInd: TPanel;
    pnlNomeInd: TPanel;
    Panel9: TPanel;
    Panel8: TPanel;
    pnlValorizacao: TPanel;
    pnlTitPortfolio: TPanel;
    QryAtualizaSaldo: TwwQuery;
    qryAux: TwwQuery;
    bbtnImprimir: TBitBtn;
    Panel1: TPanel;
    pnlFundoPeriodo: TPanel;
    lblDtInicio: TfcLabel;
    Label2: TLabel;
    Label4: TLabel;
    lblDtFim: TfcLabel;
    trvPortfolio: TTreeView;
    imgTreeView: TImageList;
    qryBuscaSaldoInv: TwwQuery;
    qryBuscaSaldoInvSALDO: TFloatField;
    regRentabilidade: TRegra;
    Panel2: TPanel;
    ToolbarSep972: TToolbarSep97;
    pnlTxJuros: TPanel;
    Panel3: TPanel;
    qryBuscaOpeOpcInd: TwwQuery;
    qryBuscaOpeOpcIndVALORAPL: TFloatField;
    qryBuscaOpeOpcIndVALORRSG: TFloatField;
    qryBuscaPagJur: TwwQuery;
    qryBuscaPagJurTOTPAGJUR: TFloatField;
    qryBuscaAmortFDO: TwwQuery;
    //AL_13
    qryBuscaTaxasFDO: TwwQuery;
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    dtDataInicio, dtDataFim: TDateTime;
    // AL_9
    sInvRVBMF, sInvRF, sInvFundos: String;
    Procedure AbreQry;
    Procedure MontaQry(dDtaInicio,dDtaFim : TDateTime);
    //AL_14
    function VariacaoIndicadores(dDtIni: TDateTime = 0; dDtFim: TDateTime = 0): Double ;
    function BuscaSaldosRV(dData: TDateTime): Double;
    function BuscaOpeOpcInd(dData: TDateTime): TResultOpe;
    function BuscaOpePagJur(dData: TDateTime): Double;
    // AL_9
    function BuscaAmortFDO(dData: TDateTime): Double;
  public
    { Public declarations }
  end;

  pItem = ^TItem;
  TItem = record
     IDTipoInvest:      Integer;
     DescTipoInvest:    String;
     IDTipoFundoInvest: Integer;
     IDInvestimento:    Integer;
     DescInvestimento:  String;
  end;

var
  frmConsMovRentabilidade : TfrmConsMovRentabilidade;
  fValorizacao            : Double;
  //AL_14
  AtualizaTela: procedure(sMsg: String; iMaximo: Integer = 0);

implementation

//AL_13
uses FConsRentabilidade, UOperComum, UFuncoesRendaFixa, FDmRelRentabInvest, UMensErro,
  FDmRelRentabSPC;

{$R *.DFM}

procedure TfrmConsMovRentabilidade.FormShow(Sender: TObject);
var
  nTreeNode: TTreeNode;
begin
   inherited;
   lblDtInicio.Caption := frmConsRentabilidade.dtDtaInicio.Text;
   lblDtFim.Caption    := frmConsRentabilidade.dtDtaFim.Text;
   dtDataInicio        := frmConsRentabilidade.dtDtaInicio.Date;
   dtDataFim           := frmConsRentabilidade.dtDtaFim.Date;
   trvPortfolio.Items  := frmconsrentabilidade.trvPortfolio.Items;

   // Expande todo o TreeView
   nTreeNode := trvPortfolio.Items.GetFirstNode;
   while nTreeNode <> nil do
   begin
     nTreeNode.Expand(True);
     nTreeNode := nTreeNode.getNextSibling;
   end;

   DmRelRentabInvest.qryPortfolio.Open;
   AbreQry;
   VariacaoIndicadores;
   pnlFundo.Enabled := True;
   pnlPortfolio.Enabled := True;
end;

procedure TfrmConsMovRentabilidade.FormActivate(Sender: TObject);
begin
  inherited;
   pnlFundo.Enabled := True;
   //AL_13
end;

Procedure TfrmConsMovRentabilidade.AbreQry;
Var
   sTipoFundoInvest, sTipoInvest, sTipoOpeApl, sTipoOpeResg : String;
   //AL_14
   fQtdCotas, fSaldo , fVlrPgJur, fVlrCotaInd, fVarInd: Double;
   nTreeNode: TTreeNode;
   vOpeOpcInd: TResultOpe;
   //AL_14
   dDtAnt: TDateTime;
Begin

   fValorizacao := 0;

   MontaQry(dtDataInicio, dtDataFim);

   try //Finally

      //AL_14
      if Assigned(AtualizaTela) then
         AtualizaTela('Processando informações', DmRelRentabInvest.QryMovRentabilidade.RecordCount);

      With DmRelRentabInvest, DmRelRentabInvest.QryMovRentabilidade, OperComum Do
      Begin
         if not Eof then
         begin
            //AL_14
            if Assigned(AtualizaTela) then
               AtualizaTela('Captando cota inicial', 0);

            Edit;

            // AL_9
            // Se for Fundo de Investimento tem que abater a amortização
            if sInvFundos <> '' then
               QryMovRentabilidadeSALDOCOT.AsFloat := QryMovRentabilidadeSALDOCOT.AsFloat - BuscaAmortFDO(QryMovRentabilidadeDATA.AsDateTime);

            // Se for Renda Variável o Saldo vem zerado
            if sInvRVBMF <> '' then
            begin
               // Busca o Saldo dos Investimentos do TreeView para cada Data
               QryMovRentabilidadeSALDO.AsFloat := QryMovRentabilidadeSALDO.AsFloat +
                                                   BuscaSaldosRV(QryMovRentabilidadeDATA.AsDateTime);

               // Busca Aplicações e Resgates de Opções de Índice
               vOpeOpcInd := BuscaOpeOpcInd(QryMovRentabilidadeDATA.AsDateTime);
               QryMovRentabilidadeSALDO.AsFloat := QryMovRentabilidadeSALDO.AsFloat + vOpeOpcInd.fValorApl - vOpeOpcInd.fValorRsg;

               // Calcula o Saldo sem Aplicações e Resgates
               QryMovRentabilidadeSALDOCOT.AsFloat := (QryMovRentabilidadeSALDO.AsFloat -
                                                       QryMovRentabilidadeVLRAPLICACAO.AsFloat +
                                                       QryMovRentabilidadeVLRRESGATE.AsFloat);
            end;

            if sInvRF <> '' then
            begin
               // Tratamento para Voltar com o valor do Pagamento de Juros para
               //    o saldo dos títulos com cotação de Renda Fixa ATÉ ACERTO DA BASE.
               //    A ROTINA DE ATUALIZAÇÃO DEVE COMPENSAR O PAGAMENTO DE JUROS
               fVlrPgJur := BuscaOpePagJur(QryMovRentabilidadeDATA.AsDateTime);
               QryMovRentabilidadeSALDO.AsFloat := QryMovRentabilidadeSALDO.AsFloat + fVlrPgJur;
               QryMovRentabilidadeSALDOCOT.AsFloat := QryMovRentabilidadeSALDOCOT.AsFloat + fVlrPgJur;
            end;

            fQtdCotas := DivValorZero(FieldByName('SALDO').AsFloat,1000);
            //AL_14
            dDtAnt := QryMovRentabilidade.FieldByName('DATA').AsDateTime;

            //AL_13
            QryMovRentabilidadeSALDO.AsFloat := QryMovRentabilidadeSALDO.AsFloat - QryMovRentabilidadeVLRTAXAS.AsFloat;

            //AL_14
            FieldByName('VLRCOTAIND').AsFloat     := 1000;
            fVlrCotaInd                           := 1000;

            FieldByName('VLRCOTA').AsFloat        := 1000;
            fValorizacao                          := 1000;
            FieldByName('QUANTIDADE').AsFloat     := fQtdCotas;
            Post;

            Next;
            While Not Eof Do
            Begin
               //AL_14
               if Assigned(AtualizaTela) then
                  AtualizaTela('Processando dia ' + QryMovRentabilidadeDATA.AsString, -2);

               Edit;

               //AL_14
               fVarInd := VariacaoIndicadores(dDtAnt, QryMovRentabilidadeDATA.AsDateTime);
               fVlrCotaInd := fVlrCotaInd * fVarInd;
               FieldByName('VLRCOTAIND').AsFloat := fVlrCotaInd;
               dDtAnt := QryMovRentabilidadeDATA.AsDateTime;

               // AL_9
               // Se for Fundo de Investimento tem que abater a amortização
               if sInvFundos <> '' then
                  QryMovRentabilidadeSALDOCOT.AsFloat := QryMovRentabilidadeSALDOCOT.AsFloat - BuscaAmortFDO(QryMovRentabilidadeDATA.AsDateTime);

               if sInvRVBMF <> '' then
               begin
                  // Busca o Saldo dos Investimentos do TreeView para cada Data
                  QryMovRentabilidadeSALDO.AsFloat := QryMovRentabilidadeSALDO.AsFloat +
                                                      BuscaSaldosRV(QryMovRentabilidadeDATA.AsDateTime);

                  // Busca Aplicações e Resgates de Opções de Índice
                  vOpeOpcInd := BuscaOpeOpcInd(QryMovRentabilidadeDATA.AsDateTime);
                  QryMovRentabilidadeSALDO.AsFloat := QryMovRentabilidadeSALDO.AsFloat + vOpeOpcInd.fValorApl - vOpeOpcInd.fValorRsg;

                  // Calcula o Saldo sem Aplicações e Resgates
                  QryMovRentabilidadeSALDOCOT.AsFloat := (QryMovRentabilidadeSALDO.AsFloat -
                                                          QryMovRentabilidadeVLRAPLICACAO.AsFloat +
                                                          QryMovRentabilidadeVLRRESGATE.AsFloat);
               end;

               if sInvRF <> '' then
               begin
                  // Tratamento para Voltar com o valor do Pagamento de Juros para
                  //    o saldo dos títulos com cotação de Renda Fixa ATÉ ACERTO DA BASE.
                  //    A ROTINA DE ATUALIZAÇÃO DEVE COMPENSAR O PAGAMENTO DE JUROS
                  fVlrPgJur := BuscaOpePagJur(QryMovRentabilidadeDATA.AsDateTime);
                  QryMovRentabilidadeSALDO.AsFloat := QryMovRentabilidadeSALDO.AsFloat + fVlrPgJur;
                  QryMovRentabilidadeSALDOCOT.AsFloat := QryMovRentabilidadeSALDOCOT.AsFloat + fVlrPgJur;
               end;

               //AL_13
               QryMovRentabilidadeSALDO.AsFloat := QryMovRentabilidadeSALDO.AsFloat - QryMovRentabilidadeVLRTAXAS.AsFloat;

               FieldByName('VLRCOTA').AsFloat := DivValorZero(FieldByName('SALDOCOT').AsFloat,
                                                              fQtdCotas);
               //AL_15
               fQtdCotas := DivValorZero(FieldByName('SALDOCOT').AsFloat, FieldByName('VLRCOTA').AsFloat);

               //AL_16
               fQtdCotas := fQtdCotas + DivValorZero((FieldByName('VLRAPLICACAO').AsFloat-
                                                      FieldByName('VLRRESGATE').AsFloat),
                                                      FieldByName('VLRCOTA').AsFloat);

               FieldByName('QUANTIDADE').AsFloat  := fQtdCotas;
               fValorizacao  := FieldByName('VLRCOTA').AsFloat;
               Post;
               //AL_14
               if Assigned(AtualizaTela) then
                  AtualizaTela('');
               Next;
            End;

            fValorizacao           := (DivValorZero(fValorizacao,1000)-1)*100;
            //AL_4
            pnlValorizacao.Caption := FormatFloat('#0.00000000', fValorizacao)+' % ';

            First;
         End;
      End;
   finally
      //AL_14
      if Assigned(AtualizaTela) then
         AtualizaTela('', -1);
   end;

End;

procedure TfrmConsMovRentabilidade.MontaQry(dDtaInicio,dDtaFim : TDateTime);
Var
   sTipoOperacaoApl, sTipoOperacaoRes, sTipoInvest : String;
   // AL_9
   sTipoFundo : String;
   nTreeNode, nTreeNodeInv: TTreeNode;
   bTipoRF, bTipoRVBMF, bOutrosInv, bUnion, bInc: Boolean;
   asTipoFundo, asTipoInvest: array of Integer;
   iTam: Integer;
begin
   bTipoRF    := False;
   bTipoRVBMF := False;
   bOutrosInv := False;
   bUnion     := False;

   sTipoFundo := '';
   sInvFundos := '';
   sInvRF     := '';
   sInvRVBMF  := '';

   asTipoInvest := nil;
   asTipoFundo := nil;
   iTam := 0;

   //AL_14
   if Assigned(AtualizaTela) then
      AtualizaTela('Montando portfólio de investimentos', -2);

   nTreeNode := trvPortfolio.Items.GetFirstNode;
   while nTreeNode <> nil do
   begin
      bInc := True;
      if pItem(nTreeNode.Data).IDTipoFundoInvest > 0 then
      begin
         // Se for Fundo de Investimento
         // Monta string de Tipos de Fundo
         if OperComum.AScan(asTipoFundo, pItem(nTreeNode.Data).IDTipoFundoInvest) = -1 then
         begin
            iTam := Length(asTipoFundo);
            SetLength(asTipoFundo,iTam + 1);
            asTipoFundo[iTam] := pItem(nTreeNode.Data).IDTipoFundoInvest;
         end;
         sTipoFundo := sTipoFundo + IntToStr(pItem(nTreeNode.Data).IDTipoFundoInvest) + ', ';

         if OperComum.AScan(asTipoInvest, pItem(nTreeNode.Data).IDTipoInvest) = -1 then
         begin
            iTam := Length(asTipoInvest);
            SetLength(asTipoInvest,iTam + 1);
            asTipoInvest[iTam] := pItem(nTreeNode.Data).IDTipoInvest;
         end;
         sTipoInvest := sTipoInvest + IntToStr(pItem(nTreeNode.Data).IDTipoInvest) + ', ';

         nTreeNodeInv := nTreeNode.getFirstChild;
         while nTreeNodeInv <> nil do
         begin
            // Monta string de Fundos de Investimento
            sInvFundos := sInvFundos + IntToStr(pItem(nTreeNodeInv.Data).IDInvestimento) + ', ';

            // Inclui registro do Portfolio
            if bInc then
            begin
               DmRelRentabInvest.qryPortfolio.Insert;
               if nTreeNode.ImageIndex in [4,5] then
               begin
                  DmRelRentabInvest.qryPortfolioTIPO.AsString := pItem(nTreeNodeInv.Data).DescTipoInvest;
                  DmRelRentabInvest.qryPortfolioINVESTIMENTO.AsString := 'Todos';
                  bInc := False;
               end else begin
                  DmRelRentabInvest.qryPortfolioTIPO.AsString := pItem(nTreeNodeInv.Data).DescTipoInvest;
                  DmRelRentabInvest.qryPortfolioINVESTIMENTO.AsString := pItem(nTreeNodeInv.Data).DescInvestimento;
               end;
               DmRelRentabInvest.qryPortfolio.Post;
            end;

            nTreeNodeInv := nTreeNode.GetNextChild(nTreeNodeInv);
         end;
      end else begin
      // Se Não for Fundo de Investimento
         Case pItem(nTreeNode.Data).IDTipoInvest of
         1:   begin  // Monta String de Investimentos de Renda Fixa
                bTipoRF := True;
                nTreeNodeInv := nTreeNode.getFirstChild;
                while nTreeNodeInv <> nil do
                begin
                   sInvRF := sInvRF + IntToStr(pItem(nTreeNodeInv.Data).IDInvestimento) + ', ';

                   // Inclui registro do Portfolio
                   if bInc then
                   begin
                      DmRelRentabInvest.qryPortfolio.Insert;
                      if nTreeNode.ImageIndex in [4,5] then
                      begin
                         DmRelRentabInvest.qryPortfolioTIPO.AsString := pItem(nTreeNodeInv.Data).DescTipoInvest;
                         DmRelRentabInvest.qryPortfolioINVESTIMENTO.AsString := 'Todos';
                         bInc := False;
                      end else begin
                         DmRelRentabInvest.qryPortfolioTIPO.AsString := pItem(nTreeNodeInv.Data).DescTipoInvest;
                         DmRelRentabInvest.qryPortfolioINVESTIMENTO.AsString := pItem(nTreeNodeInv.Data).DescInvestimento;
                      end;
                      DmRelRentabInvest.qryPortfolio.Post;
                   end;
                   nTreeNodeInv := nTreeNode.GetNextChild(nTreeNodeInv);
                end;
              end;
         2,8: begin // Monta String de Investimentos de Renda Variável e BMF (HistCartInv)
                bTipoRVBMF := True;
                nTreeNodeInv := nTreeNode.getFirstChild;
                while nTreeNodeInv <> nil do
                begin
                   sInvRVBMF := sInvRVBMF + IntToStr(pItem(nTreeNodeInv.Data).IDInvestimento) + ', ';

                   // Inclui registro do Portfolio
                   if bInc then
                   begin
                      DmRelRentabInvest.qryPortfolio.Insert;
                      if nTreeNode.ImageIndex in [4,5] then
                      begin
                         DmRelRentabInvest.qryPortfolioTIPO.AsString := pItem(nTreeNodeInv.Data).DescTipoInvest;
                         DmRelRentabInvest.qryPortfolioINVESTIMENTO.AsString := 'Todos';
                         bInc := False;
                      end else begin
                         DmRelRentabInvest.qryPortfolioTIPO.AsString := pItem(nTreeNodeInv.Data).DescTipoInvest;
                         DmRelRentabInvest.qryPortfolioINVESTIMENTO.AsString := pItem(nTreeNodeInv.Data).DescInvestimento;
                      end;
                      DmRelRentabInvest.qryPortfolio.Post;
                   end;
                   nTreeNodeInv := nTreeNode.GetNextChild(nTreeNodeInv);
                end;
              end;
         else
              bOutrosInv := True;
         end;
      end;
      nTreeNode := nTreeNode.getNextSibling;
   end;

   // Montar a String pelo vetor de Tipos
   sTipoFundo := '';
   for iTam := 0 to Length(asTipoFundo) -1 do
      sTipoFundo := sTipoFundo + IntToStr(asTipoFundo[iTam]) + ', ';

   sTipoInvest := '';
   for iTam := 0 to Length(asTipoInvest) -1 do
      sTipoInvest := sTipoInvest + IntToStr(asTipoInvest[iTam]) + ', ';

   if not Vazio(sTipoFundo) then
      Delete(sTipoFundo,Length(sTipoFundo)-1,2);
   if not Vazio(sInvFundos) then
      Delete(sInvFundos,Length(sInvFundos)-1,2);
   if not Vazio(sTipoInvest) then
      Delete(sTipoInvest,Length(sTipoInvest)-1,2);
   if bTipoRF then
      Delete(sInvRF, Length(sInvRF)-1,2);
   if bTipoRVBMF then
      Delete(sInvRVBMF, Length(sInvRVBMF)-1,2);
   if bOutrosInv then
      MsgDlg('Atenção : Existem Tipos de Investimentos Não Tratados' + #13 +
             'Favor Informar ao Analista da CM Soluções Responsável pelo Módulo.','Mensagem do Sistema ',mtWarning,[mbOK],0);

   //AL_14
   if Assigned(AtualizaTela) then
      AtualizaTela('Selecionando informações na base de dados', -2);

   // Começa a montagem da query de movimento dos Investimentos
   DmRelRentabInvest.QryMovRentabilidade.Close;
   DmRelRentabInvest.QryMovRentabilidade.Sql.Clear;

   // Inclui SQL de Totalização das SubQueries de cada Investimento
   //AL_13
   //AL_14
   DmRelRentabInvest.QryMovRentabilidade.Sql.Add('SELECT DATA, SUM(QUANTIDADE) AS QUANTIDADE, SUM(VLRCOTA) AS VLRCOTA, 0 AS VLRCOTAIND, ');
   DmRelRentabInvest.QryMovRentabilidade.Sql.Add('       SUM(SALDO) AS SALDO, SUM(SALDOCOT) AS SALDOCOT, ');
   DmRelRentabInvest.QryMovRentabilidade.Sql.Add('       SUM(VLRAPLICACAO) AS VLRAPLICACAO, SUM(VLRRESGATE) AS VLRRESGATE,');
   DmRelRentabInvest.QryMovRentabilidade.Sql.Add('       SUM(VLRDESPESAS) AS VLRDESPESAS, SUM(VLRTAXAS) AS VLRTAXAS, IDRELATORIO ');
   DmRelRentabInvest.QryMovRentabilidade.Sql.Add('FROM (');

   // Fundos de Investimento
   if not ((Vazio(sTipoFundo)) and (Vazio(sInvFundos))) then
   begin
      //AL_11
      //AL_10
      // Busca dados do Tipo de Operacao - Aplicação
      FazQuery(QryAux,'SELECT * FROM TIPOOPERACAO WHERE IDTIPOINVEST IN (' + sTipoInvest + ')' +
                      ' AND (CODTIPDOC IS NOT NULL)'+
                      ' AND ((IDTIPOOPERACAO > 0) AND (NATUREZAOPERACAO =  ''A''))'+
                      ' OR (((IDTIPOOPERACAO = -100) OR (IDTIPOOPERACAO = -105) OR (IDTIPOOPERACAO = -108)) AND (NATUREZAOPERACAO =  ''A''))');

      while not QryAux.Eof do
      begin
         sTipoOperacaoApl := sTipoOperacaoApl + QryAux.FieldByName('IDTIPOOPERACAO').AsString + ', ';
         qryAux.Next;
      end;

      If Trim(sTipoOperacaoApl) = '' Then
         sTipoOperacaoApl      := '0';

      Delete(sTipoOperacaoApl,Length(sTipoOperacaoApl)-1,2);

      //AL_11
      // Busca dados do Tipo de Operacao - Resgate
      FazQuery(QryAux,'SELECT * FROM TIPOOPERACAO WHERE IDTIPOINVEST IN (' + sTipoInvest + ')' +
                      ' AND (CODTIPDOC IS NOT NULL)'+
                      ' AND (NATUREZAOPERACAO =  ''D'')'+
                      ' OR ((IDTIPOOPERACAO   = -107) AND (NATUREZAOPERACAO =  ''D''))');

      while not QryAux.Eof do
      begin
         sTipoOperacaoRes := sTipoOperacaoRes + QryAux.FieldByName('IDTIPOOPERACAO').AsString + ', ';
         qryAux.Next;
      end;

      If Trim(sTipoOperacaoRes) = '' Then
         sTipoOperacaoRes      := '0';

      Delete(sTipoOperacaoRes,Length(sTipoOperacaoRes)-1,2);

      With DmRelRentabInvest.QryMovRentabilidade Do
      Begin
         //AL_10
         Sql.Add('SELECT SALDO.DATAMOVFUNDO AS DATA,0 AS QUANTIDADE, 0 AS VLRCOTA, SALDO.SALDOVLRFUNDO AS SALDO, ');
         //AL_13
         Sql.Add('      (SALDO.SALDOVLRFUNDO - NVL(APL.VLRMOVFUNDO,0) + NVL(RESG.VLRMOVFUNDO,0)) AS SALDOCOT, ');
         Sql.Add('       NVL(APL.VLRMOVFUNDO,0) AS VLRAPLICACAO, NVL(RESG.VLRMOVFUNDO,0) AS VLRRESGATE, ');
         Sql.Add('       NVL(TXA.VLRMOVFUNDO,0) AS VLRDESPESAS, ');
         Sql.Add('       NVL(TXA.VLRMOVFUNDO,0) AS VLRTAXAS, 1 AS IDRELATORIO ');
         Sql.Add('FROM ');
         Sql.Add('(SELECT SUM(NVL(H1.SALDOQTDCOTAS,0)) AS SALDOQTDCOTAS, SUM(NVL(H1.SALDOVLRFUNDO,0)) AS SALDOVLRFUNDO, ');
         Sql.Add('        H1.DATAMOVFUNDO');
         Sql.Add(' FROM HISTFUNDO H1,');
         Sql.Add('                          (SELECT MAX(IDHISTFUNDO) AS IDHISTFUNDO ');
         Sql.Add('                           FROM HISTFUNDO HF');
         Sql.Add('                           WHERE ');
         //AL_6
         Sql.Add('                            (HF.IDTIPOINVEST > 0) AND ');
         //AL_8
         if frmConsRentabilidade.qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger > 0 then
            Sql.Add('                         (HF.IDPLANPREVCTBPATR = '+frmConsRentabilidade.qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsString+') AND ')
         else
            Sql.Add('                         (HF.IDPLANPREVCTBPATR > 0) AND ');
         Sql.Add('                            (HF.IDFUNDOINVEST IN ('+sInvFundos+')) AND');
         Sql.Add('                            (HF.DATAAPLICACAO     <= TO_DATE('''+DateToStr(dDtaFim)+''',''DD/MM/YYYY''))   AND ');
         Sql.Add('                           ((HF.DATAMOVFUNDO      >= TO_DATE('''+DateToStr(dDtaInicio)+''',''DD/MM/YYYY'')) AND');
         Sql.Add('                            (HF.DATAMOVFUNDO      <= TO_DATE('''+DateToStr(dDtaFim)+''',''DD/MM/YYYY'')))   AND ');
         Sql.Add('                            (HF.TIPMOVFUNDO       <>''PIR'')');
         Sql.Add('                           GROUP BY HF.IDTIPOINVEST, HF.IDPLANPREVCTBPATR, HF.IDFUNDOINVEST, HF.DATAAPLICACAO, HF.DATAMOVFUNDO, HF.IDTIPOCOTA) HMAX ');
         Sql.Add(' WHERE ');
         Sql.Add('H1.IDHISTFUNDO = HMAX.IDHISTFUNDO AND ');
         Sql.Add('H1.SALDOQTDCOTAS > 0');
         Sql.Add(' GROUP BY H1.DATAMOVFUNDO) SALDO,');
         //AL_13
         Sql.Add('(SELECT OP.DATAOPERACAO AS DATAMOVFUNDO, SUM(NVL(VLROPERACAO,0)) AS VLRMOVFUNDO');
         Sql.Add(' FROM  OPERACAOFUNDO OP ');
         Sql.Add(' WHERE');
         //AL_6
         Sql.Add('     OP.IDTIPOINVEST > 0 AND ');
         //AL_8
         if frmConsRentabilidade.qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger > 0 then
            Sql.Add('  OP.IDPLANPREVCTBPATR = '+frmConsRentabilidade.qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsString+' AND ')
         else
            Sql.Add('  OP.IDPLANPREVCTBPATR > 0 AND ');
         Sql.Add('     OP.IDFUNDOINVEST IN ('+sInvFundos+')  AND');
         Sql.Add('     OP.DATAOPERACAO BETWEEN TO_DATE('''+DateToStr(dDtaInicio)+''',''DD/MM/YYYY'') AND ');
         Sql.Add('                             TO_DATE('''+DateToStr(dDtaFim)+''',''DD/MM/YYYY'') AND ');
         Sql.Add('     OP.IDTIPOOPERACAO IN ('+sTipoOperacaoApl+')');
         Sql.Add(' GROUP BY OP.DATAOPERACAO) APL,');
         //AL_13
         Sql.Add('(SELECT OP.DATAOPERACAO AS DATAMOVFUNDO, SUM(NVL(OP.VLROPERACAO,0)) AS VLRMOVFUNDO');
         Sql.Add(' FROM OPERACAOFUNDO OP');
         Sql.Add(' WHERE');
         //AL_6
         Sql.Add('     OP.IDTIPOINVEST > 0 AND ');
         //AL_8
         if frmConsRentabilidade.qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger > 0 then
            Sql.Add('  OP.IDPLANPREVCTBPATR = '+frmConsRentabilidade.qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsString+' AND ')
         else
            Sql.Add('  OP.IDPLANPREVCTBPATR > 0 AND ');
         Sql.Add('     OP.IDFUNDOINVEST IN ('+sInvFundos+') AND');
         Sql.Add('     OP.DATAOPERACAO BETWEEN TO_DATE('''+DateToStr(dDtaInicio)+''',''DD/MM/YYYY'') AND ');
         Sql.Add('                             TO_DATE('''+DateToStr(dDtaFim)+''',''DD/MM/YYYY'') AND ');
         Sql.Add('     OP.IDTIPOOPERACAO IN ('+sTipoOperacaoRes+')');
         //AL_13
         Sql.Add(' GROUP BY OP.DATAOPERACAO ) RESG,');
         //AL_15
         //AL_16
         Sql.Add('(SELECT OP.DATAOPERACAO AS DATAMOVFUNDO, SUM(NVL(OP.VLRTAXAS,0)) AS VLRMOVFUNDO');
         Sql.Add(' FROM OPERACAOFUNDO OP');
         Sql.Add(' WHERE');
         Sql.Add('     OP.IDTIPOINVEST > 0 AND ');
         if frmConsRentabilidade.qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger > 0 then
            Sql.Add('  OP.IDPLANPREVCTBPATR = '+frmConsRentabilidade.qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsString+' AND ')
         else
            Sql.Add('  OP.IDPLANPREVCTBPATR > 0 AND ');
         Sql.Add('     OP.IDFUNDOINVEST IN ('+sInvFundos+') AND');
         Sql.Add('     OP.DATAOPERACAO BETWEEN TO_DATE('''+DateToStr(dDtaInicio)+''',''DD/MM/YYYY'') AND ');
         Sql.Add('                             TO_DATE('''+DateToStr(dDtaFim)+''',''DD/MM/YYYY'') AND ');
         Sql.Add('     OP.IDTIPOOPERACAO IN (-174,-175,-176,-177)');
         Sql.Add(' GROUP BY OP.DATAOPERACAO) TXA ');
         Sql.Add('WHERE');
         Sql.Add('   (APL.DATAMOVFUNDO(+)   = SALDO.DATAMOVFUNDO) AND ');
         //AL_13
         Sql.Add('   (RESG.DATAMOVFUNDO(+)  = SALDO.DATAMOVFUNDO) AND ');
         //AL_16
         Sql.Add('   (TXA.DATAMOVFUNDO(+)   = SALDO.DATAMOVFUNDO)     ');
         Sql.Add('GROUP BY SALDO.DATAMOVFUNDO, APL.VLRMOVFUNDO, RESG.VLRMOVFUNDO, TXA.VLRMOVFUNDO, ');
         Sql.Add('         SALDO.SALDOVLRFUNDO, SALDO.SALDOQTDCOTAS  ');
         bUnion := True;
         //AL_10
     end;
   end;

   // Renda Fixa
   if bTipoRF then
   begin
      sTipoOperacaoApl := '';
      sTipoOperacaoRes := '';
      //AL_11
      // Busca dados do Tipo de Operacao - Aplicações
      FazQuery(QryAux,'SELECT * FROM TIPOOPERACAO WHERE IDTIPOINVEST = 1 ' +
                      ' AND  (CODTIPDOC IS NOT NULL)' +
                      ' AND ((IDTIPOOPERACAO > 0)   AND (NATUREZAOPERACAO =  ''A''))'+
                      ' OR  ((IDTIPOOPERACAO = -98) AND (NATUREZAOPERACAO =  ''A''))');

      while not QryAux.Eof do
      begin
         sTipoOperacaoApl := sTipoOperacaoApl + QryAux.FieldByName('IDTIPOOPERACAO').AsString + ', ';
         qryAux.Next;
      end;
      Delete(sTipoOperacaoApl,Length(sTipoOperacaoApl)-1,2);

      //AL_11
      // AL_6
      // Busca dados do Tipo de Operacao - Resgates
      FazQuery(QryAux,'SELECT * FROM TIPOOPERACAO WHERE IDTIPOINVEST = 1 and idtipooperacao not in (-19,-18,-17) ' +
                      ' AND  (CODTIPDOC IS NOT NULL)'+
                      ' AND ((IDTIPOOPERACAO > 0)   AND (NATUREZAOPERACAO =  ''D''))'+
                      ' OR  ((IDTIPOOPERACAO = -97) AND (NATUREZAOPERACAO =  ''D''))');

      while not QryAux.Eof do
      begin
         sTipoOperacaoRes := sTipoOperacaoRes + QryAux.FieldByName('IDTIPOOPERACAO').AsString + ', ';
         qryAux.Next;
      end;
      Delete(sTipoOperacaoRes,Length(sTipoOperacaoRes)-1,2);

      // Monta o SQL
      // Montar a query para RF
      With DmRelRentabInvest.QryMovRentabilidade Do
      Begin
         if bUnion then
            SQL.Add('UNION ');
         Sql.Add('SELECT SALDO.DATAHISTRENFIX AS DATA,0 AS QUANTIDADE, 0 AS VLRCOTA, SALDO.SALDOVLRRF AS SALDO,');
         // Passa a utilizar o saldo Inicial para o cálculo
         Sql.Add('       (SALDO.SALDOVLRRF - NVL(APL.VLRMOVRF,0) + NVL(RESG.VLRMOVRF,0)) AS SALDOCOT, ');
         //AL_13
         Sql.Add('       NVL(APL.VLRMOVRF,0) AS VLRAPLICACAO, NVL(RESG.VLRMOVRF,0) AS VLRRESGATE, ');
         Sql.Add('       0 AS VLRDESPESAS, 0 AS VLRTAXAS, 1 AS IDRELATORIO');
         Sql.Add('FROM ');

         Sql.Add('   (SELECT SUM(H1.SALDOQTDHISTRENFI) AS SALDOQTDRF, SUM(H1.SALDOVLRHISTRENFI) AS SALDOVLRRF, H1.DATAHISTRENFIX');
         Sql.Add('    FROM HISTRENFIX H1');
         Sql.Add('    WHERE (H1.DATAHISTRENFIX BETWEEN TO_DATE('''+DateToStr(dDtaInicio)+''',''DD/MM/YYYY'')  AND');
         Sql.Add('                                     TO_DATE('''+DateToStr(dDtaFim)+''',''DD/MM/YYYY'')) ');
         Sql.Add('      AND (H1.IDINVESTIMENTO IN (' + sInvRF + '))');
         //AL_8
         if frmConsRentabilidade.qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger > 0 then
            Sql.Add('      AND (H1.IDPLANPREVCTBPATR = '+frmConsRentabilidade.qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsString+') ');
         Sql.Add('      AND (H1.IDHISTRENFIX IN ');
         Sql.Add('                 (SELECT MAX(H2.IDHISTRENFIX)');
         Sql.Add('                  FROM HISTRENFIX H2');
         Sql.Add('                  WHERE (H2.DATAHISTRENFIX BETWEEN TO_DATE('''+DateToStr(dDtaInicio)+''',''DD/MM/YYYY'')  AND');
         Sql.Add('                                                   TO_DATE('''+DateToStr(dDtaFim)+''',''DD/MM/YYYY'')) ');
         Sql.Add('                    AND (H2.IDINVESTIMENTO IN (' + sInvRF + '))');
            //AL_2
         //AL_8
         if frmConsRentabilidade.qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger > 0 then
         begin
            Sql.Add('                    AND (H2.IDPLANPREVCTBPATR = '+frmConsRentabilidade.qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsString+') ');
            Sql.Add('                  GROUP BY H2.DATAHISTRENFIX, H2.IDINVESTIMENTO, H2.IDOPERRENFIXAPLIC)) ');// AND');
         end
         else
            Sql.Add('                  GROUP BY H2.DATAHISTRENFIX, H2.IDINVESTIMENTO, H2.IDOPERRENFIXAPLIC, H2.IDPLANPREVCTBPATR)) ');// AND');

         Sql.Add('    GROUP BY H1.DATAHISTRENFIX ) SALDO,');

         // AL_12
         Sql.Add('(SELECT DATAOPERACAO, SUM(VLRMOVRF) AS VLRMOVRF ');
         Sql.Add(' FROM ');
         //AL_13
         Sql.Add('   (SELECT DATAOPERACAO, SUM(NVL(VLROPERACAO,0)) AS VLRMOVRF');
         Sql.Add('    FROM OPERRENFIX');
         Sql.Add('    WHERE');
         Sql.Add('       (IDINVESTIMENTO IN (' + sInvRF + ')) AND');
         Sql.Add('       (IDTIPOOPERACAO IN (' + sTipoOperacaoApl + ')) AND');
         //AL_8
         if frmConsRentabilidade.qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger > 0 then
            Sql.Add('       (IDPLANPREVCTBPATR = '+frmConsRentabilidade.qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsString+') AND ');
         Sql.Add('       (DATAOPERACAO BETWEEN TO_DATE('''+DateToStr(dDtaInicio)+''',''DD/MM/YYYY'')  AND');
         Sql.Add('                             TO_DATE('''+DateToStr(dDtaFim)+''',''DD/MM/YYYY''))');
         //AL_12
         Sql.Add('    GROUP BY DATAOPERACAO  ');
         Sql.Add('    UNION  ');
         //AL_13
         Sql.Add('    SELECT DATAOPERACAO, SUM(NVL(VLROPERACAO,0)) AS VLRMOVRF');
         Sql.Add('    FROM OPERRENFIX');
         Sql.Add('    WHERE');
         Sql.Add('       (IDINVESTIMENTO IN (' + sInvRF + ')) AND');
         Sql.Add('       (IDTIPOOPERACAO = -98) AND');
         if frmConsRentabilidade.qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger > 0 then
            Sql.Add('       (IDPLANPREVCTBPATR = '+frmConsRentabilidade.qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsString+') AND ');
         Sql.Add('       (DATAOPERACAO BETWEEN TO_DATE('''+DateToStr(dDtaInicio)+''',''DD/MM/YYYY'')  AND');
         Sql.Add('                             TO_DATE('''+DateToStr(dDtaFim)+''',''DD/MM/YYYY''))');
         Sql.Add('    GROUP BY DATAOPERACAO)  ');
         Sql.Add('    GROUP BY DATAOPERACAO  ) APL,');
         // AL_3
         Sql.Add('(SELECT DATAOPERACAO, SUM(VLRMOVRF) AS VLRMOVRF ');
         Sql.Add(' FROM ');
         //AL_13
         Sql.Add('   (SELECT DATAOPERACAO, SUM(NVL(VLROPERACAO,0)) AS VLRMOVRF');
         Sql.Add('    FROM OPERRENFIX');
         Sql.Add('    WHERE');
         Sql.Add('        (IDINVESTIMENTO IN (' + sInvRF + ')) AND');
         //AL_1
         Sql.Add('        (IDTIPOOPERACAO IN (' + sTipoOperacaoRes + ')) AND');
         //AL_8
         if frmConsRentabilidade.qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger > 0 then
            Sql.Add('        (IDPLANPREVCTBPATR = '+frmConsRentabilidade.qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsString+') AND ');
         Sql.Add('        (DATAOPERACAO BETWEEN TO_DATE('''+DateToStr(dDtaInicio)+''',''DD/MM/YYYY'')  AND');
         Sql.Add('                              TO_DATE('''+DateToStr(dDtaFim)+''',''DD/MM/YYYY''))');
         Sql.Add('    GROUP BY DATAOPERACAO  ');
         //AL_1
         //AL_12
         Sql.Add('    UNION  ');
         //AL_13
         Sql.Add('    SELECT (DATALIQUIDACAO) AS DATAOPERACAO, SUM(NVL(VLROPERACAO,0)) AS VLRMOVRF');
         Sql.Add('    FROM OPERRENFIX O');
         Sql.Add('    WHERE');
         Sql.Add('       (IDINVESTIMENTO IN (' + sInvRF + ')) AND');
         Sql.Add('       (IDTIPOOPERACAO IN (-17,-18,-19)) AND');
         //AL_8
         if frmConsRentabilidade.qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger > 0 then
            Sql.Add('       (IDPLANPREVCTBPATR = '+frmConsRentabilidade.qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsString+') AND ');
         Sql.Add('       (DATALIQUIDACAO BETWEEN TO_DATE('''+DateToStr(dDtaInicio)+''',''DD/MM/YYYY'')  AND');
         Sql.Add('                             TO_DATE('''+DateToStr(dDtaFim)+''',''DD/MM/YYYY''))');
         //AL_12
         Sql.Add('    GROUP BY DATALIQUIDACAO ');
         Sql.Add('    UNION  ');
         //AL_13
         Sql.Add('    SELECT DATAOPERACAO , SUM(NVL(VLROPERACAO,0)) AS VLRMOVRF');
         Sql.Add('    FROM OPERRENFIX O');
         Sql.Add('    WHERE');
         Sql.Add('       (IDINVESTIMENTO IN (' + sInvRF + ')) AND');
         Sql.Add('       (IDTIPOOPERACAO = -97) AND');
         if frmConsRentabilidade.qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger > 0 then
            Sql.Add('       (IDPLANPREVCTBPATR = '+frmConsRentabilidade.qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsString+') AND ');
         Sql.Add('       (DATAOPERACAO BETWEEN TO_DATE('''+DateToStr(dDtaInicio)+''',''DD/MM/YYYY'')  AND');
         Sql.Add('                             TO_DATE('''+DateToStr(dDtaFim)+''',''DD/MM/YYYY''))');
         Sql.Add('    GROUP BY DATAOPERACAO) ');
         Sql.Add(' GROUP BY DATAOPERACAO ) RESG');
         Sql.Add('WHERE');
         Sql.Add('   (TO_CHAR(SALDO.DATAHISTRENFIX,''D'') NOT IN (''1'',''7'')) AND');
         Sql.Add('   (SALDO.DATAHISTRENFIX NOT IN (SELECT DATAFERIADO FROM FERIADOS');
         Sql.Add('                                 WHERE DATAFERIADO BETWEEN TO_DATE('''+DateToStr(dDtaInicio)+''',''DD/MM/YYYY'')  AND');
         Sql.Add('                                                           TO_DATE('''+DateToStr(dDtaFim)+''',''DD/MM/YYYY'') AND');
         Sql.Add('                                       FLGAMBITO = ''F'')) AND');
         Sql.Add('   (APL.DATAOPERACAO(+)   = SALDO.DATAHISTRENFIX) AND');
         Sql.Add('   (RESG.DATAOPERACAO(+)  = SALDO.DATAHISTRENFIX)    ');
         Sql.Add('GROUP BY SALDO.DATAHISTRENFIX, APL.VLRMOVRF, RESG.VLRMOVRF, SALDO.SALDOVLRRF, SALDO.SALDOQTDRF');
         bUnion := True;
      end;
   end;

   // Renda Variável, BM&F e Opção de Índice
   if bTipoRVBMF then
   begin
      sTipoOperacaoApl := '';
      sTipoOperacaoRes := '';
      //AL_11
      // Busca dados do Tipo de Operacao - Aplicações
      FazQuery(QryAux,'SELECT * FROM TIPOOPERACAO WHERE IDTIPOINVEST IN (2,8) ' +
                      ' AND  (CODTIPDOC IS NOT NULL)'+
                      ' AND ((FLGOPGERENC <> ''S'')     OR (FLGOPGERENC IS NULL))' +
                      ' AND (NATUREZAOPERACAO =  ''A'')'+
                      ' OR  ((NATUREZAOPERACAO = ''R'') AND (FLGOPDIREITO =''S''))'+
                      ' OR  ((IDTIPOOPERACAO = -159) OR (IDTIPOOPERACAO = -10159) AND (NATUREZAOPERACAO =  ''A''))');

      while not QryAux.Eof do
      begin
         sTipoOperacaoApl := sTipoOperacaoApl + QryAux.FieldByName('IDTIPOOPERACAO').AsString + ', ';
         qryAux.Next;
      end;
      Delete(sTipoOperacaoApl,Length(sTipoOperacaoApl)-1,2);
      //AL_11
      // Busca dados do Tipo de Operacao - Resgates
      FazQuery(QryAux,'SELECT * FROM TIPOOPERACAO WHERE IDTIPOINVEST IN (2,8) ' +
                      ' AND ((FLGOPGERENC <> ''S'') OR (FLGOPGERENC IS NULL))' +
                      ' AND (NATUREZAOPERACAO =  ''D'')'+
                      ' OR  ((IDTIPOOPERACAO = -158) OR (IDTIPOOPERACAO = -10158) AND (NATUREZAOPERACAO =  ''D''))');
      while not QryAux.Eof do
      begin
         sTipoOperacaoRes := sTipoOperacaoRes + QryAux.FieldByName('IDTIPOOPERACAO').AsString + ', ';
         qryAux.Next;
      end;
      Delete(sTipoOperacaoRes,Length(sTipoOperacaoRes)-1,2);

      With DmRelRentabInvest.QryMovRentabilidade Do
      Begin
         if bUnion then
            SQL.Add('UNION ');
         //AL_13
         Sql.Add('SELECT SALDO.DATAMOVCARTINV AS DATA,0 AS QUANTIDADE, 0 AS VLRCOTA, 0 AS SALDO, 0 AS SALDOCOT, ');
         Sql.Add('       NVL(APL.VLRMOVRVBMF,0) AS VLRAPLICACAO, NVL(RESG.VLRMOVRVBMF,0) AS VLRRESGATE,');
         Sql.Add('       0 AS VLRDESPESAS, 0 AS VLRTAXAS, 1 AS IDRELATORIO');
         Sql.Add('FROM ');

         Sql.Add('(SELECT H1.DATAMOVCARTINV, 0 AS SALDOQTD, 0 AS SALDORVBMF');
         Sql.Add(' FROM   HISTCARTINV H1');
         Sql.Add(' WHERE  (H1.IDCARTEIRAGERENC IS NULL)');
         Sql.Add('   AND ((H1.IDCARTEIRAINVEST = 1) OR (H1.IDCARTEIRAINVEST = 2) OR (H1.IDCARTEIRAINVEST = 8))');
         //AL_8
         if frmConsRentabilidade.qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger > 0 then
            Sql.Add('   AND (H1.IDPLANPREVCTBPATR = '+frmConsRentabilidade.qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsString+')');
         Sql.Add('   AND (H1.IDINVESTIMENTO IN (' + sInvRVBMF + '))');
         //AL_5
         Sql.Add('    AND (H1.DATAMOVCARTINV BETWEEN TO_DATE('''+DateToStr(dDtaInicio)+''',''DD/MM/YYYY'')  AND');
         Sql.Add('                                   TO_DATE('''+DateToStr(dDtaFim)+''',''DD/MM/YYYY''))');
         Sql.Add(' GROUP BY H1.DATAMOVCARTINV ');
         Sql.Add(' UNION ');
         Sql.Add(' SELECT H1.DATAHISTOPCIND, 0 AS SALDOQTD, 0 AS SALDORVBMF');
         Sql.Add(' FROM   HISTOPCIND H1');
         Sql.Add(' WHERE  (IDCARTEIRAGERENC IS NULL)');
         //AL_8
         if frmConsRentabilidade.qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger > 0 then
            Sql.Add('    AND (H1.IDPLANPREVCTBPATR = '+frmConsRentabilidade.qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsString+')');
         Sql.Add('    AND (H1.IDINVESTIMENTO IN (' + sInvRVBMF + '))');
         Sql.Add('    AND (H1.DATAHISTOPCIND BETWEEN TO_DATE('''+DateToStr(dDtaInicio)+''',''DD/MM/YYYY'')  AND');
         Sql.Add('                                   TO_DATE('''+DateToStr(dDtaFim)+''',''DD/MM/YYYY''))');
         Sql.Add(' GROUP BY H1.DATAHISTOPCIND ) SALDO,');
         //AL_5
         //AL_13
         Sql.Add('(SELECT DATAOPERACAO, ROUND(SUM((((NVL(PRECOUNITOPERACAO,0)*NVL(QTDEOPERACAO,0))/NVL(QTDELOTE,1)))),2) AS VLRMOVRVBMF');
         Sql.Add(' FROM OPERACAOINVEST, ACOESXBOLSA');
         Sql.Add(' WHERE');
         Sql.Add('     (IDINVESTIMENTO IN (' + sInvRVBMF + ')) AND');
         Sql.Add('     (IDTIPOOPERACAO IN (' + sTipoOperacaoApl + ')) AND');
         Sql.Add('     (IDCARTEIRAGERENC IS NULL) AND ');
         Sql.Add('     (IDTIPOINVEST IN (2,8) ) AND ');
         //AL_8
         if frmConsRentabilidade.qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger > 0 then
            Sql.Add('     ((IDPLANPREVCTBPATR = '+frmConsRentabilidade.qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsString+') OR (IDPLANPREVCTBPATR IS NULL)) AND');
         Sql.Add('     (DATAOPERACAO BETWEEN TO_DATE('''+DateToStr(dDtaInicio)+''',''DD/MM/YYYY'')  AND');
         //AL_5
         Sql.Add('                           TO_DATE('''+DateToStr(dDtaFim)+''',''DD/MM/YYYY'')) AND');
         Sql.Add('     (ACOESXBOLSA.IDACAO(+)           = OPERACAOINVEST.IDINVESTIMENTO)');
         Sql.Add(' GROUP BY DATAOPERACAO  ) APL,');
         //AL_13
         Sql.Add('(SELECT DATAOPERACAO, SUM(NVL(VLROPERACAO,0)) AS VLRMOVRVBMF');
         Sql.Add(' FROM OPERACAOINVEST');
         Sql.Add(' WHERE');
         Sql.Add('     (IDINVESTIMENTO IN (' + sInvRVBMF + ')) AND');
         Sql.Add('     (IDTIPOOPERACAO IN (' + sTipoOperacaoRes + ')) AND');
         Sql.Add('     (IDCARTEIRAGERENC IS NULL) AND ');
         Sql.Add('     (IDTIPOINVEST IN (2,8) ) AND ');
         //AL_8
         if frmConsRentabilidade.qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger > 0 then
            Sql.Add('     ((IDPLANPREVCTBPATR = '+frmConsRentabilidade.qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsString+') OR (IDPLANPREVCTBPATR IS NULL)) AND');
         Sql.Add('     (DATAOPERACAO BETWEEN TO_DATE('''+DateToStr(dDtaInicio)+''',''DD/MM/YYYY'')  AND');
         Sql.Add('                           TO_DATE('''+DateToStr(dDtaFim)+''',''DD/MM/YYYY''))');
         Sql.Add(' GROUP BY DATAOPERACAO  ) RESG');

         Sql.Add('WHERE');
         Sql.Add('   (APL.DATAOPERACAO(+)  = SALDO.DATAMOVCARTINV) AND');
         Sql.Add('   (RESG.DATAOPERACAO(+) = SALDO.DATAMOVCARTINV)    ');
         Sql.Add('GROUP BY SALDO.DATAMOVCARTINV, APL.VLRMOVRVBMF, RESG.VLRMOVRVBMF, SALDO.SALDORVBMF, SALDO.SALDOQTD');
         bUnion := True;
      End;
   end;

   DmRelRentabInvest.QryMovRentabilidade.Sql.Add(') GROUP BY DATA, IDRELATORIO');

   if bUnion then
   begin
     try
        DmRelRentabInvest.QryMovRentabilidade.Open;
     except
        Raise;
     end;
   end;

end;

//AL_14
function TfrmConsMovRentabilidade.VariacaoIndicadores(dDtIni: TDateTime = 0; dDtFim: TDateTime = 0): Double;
Var
   wFatorCDI : Double;
   dDataIni, dDataAnt, dDataFim : TDateTime;
   sIndicador: String;
   iPos: Word;
   nTreeNode: TTreeNode;
   //AL_14
   bAchou, bProc: Boolean;
begin
   //AL_14
   bProc := True;
   if dDtIni = 0 then
   begin
      bProc := False;
      if DmRelRentabInvest.QryMovRentabilidade.FieldByName('DATA').AsString = '' then
         dDtIni := frmConsRentabilidade.dtDtaInicio.DateTime
      else
         dDtIni := DmRelRentabInvest.QryMovRentabilidade.FieldByName('DATA').AsDateTime;
      dDtFim := frmConsRentabilidade.dtDtaFim.DateTime;

      //AL_14
      if Assigned(AtualizaTela) then
         AtualizaTela('Calculando percentual sobre o Indicador', -2);

   end;

   wFatorCDI := 1;

   if frmConsRentabilidade.pnlRegra.Visible then
   begin
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT ');
      //AL_14
      qryAux.SQL.Add(QuotedStr(DateToStr(dDtIni)) + ' AS DATAINICIO, ');
      qryAux.SQL.Add(QuotedStr(DateToStr(dDtFim)) + ' AS DATAFINAL, ');
      qryAux.SQL.Add(TrocaVirgulaPonto(frmConsRentabilidade.spePercentual.Text) + ' AS PERCENTUAL, ');
      qryAux.SQL.Add(TrocaVirgulaPonto(frmConsRentabilidade.edtJuros.Text) + ' AS TAXA, ');
      qryAux.SQL.Add('-1 AS IDCIDADES, ');
      qryAux.SQL.Add(' 1 AS IDPAIS, ');
      qryAux.SQL.Add(''' '' AS CODESTADO');
      qryAux.SQL.Add('FROM DUAL');
      qryAux.Open;

      // Chama regra de cálculo da Variação do Indicador
      if Trim(frmConsRentabilidade.dblkRegra.Text) <> '' then
      begin
         regRentabilidade.RuleName := frmConsRentabilidade.qryRegraIDREGRA.AsString;
         regRentabilidade.QueryIn  := qryAux;
         try
            if frmConsRentabilidade.chkPassoaPasso.Checked then
               regRentabilidade.PassoaPasso
            else
               regRentabilidade.Execute;
         except
            on E:Exception do
            begin
               MsgDlg('Erro ao calcular a Variação do : ' + #13 +
                     '  ' + frmConsRentabilidade.qryConsMoedaMOEDESC.AsString + #13 +
                     'Regra: ' + #13 +
                     '  ' + frmConsRentabilidade.qryRegraNOMEREGRA.AsString +
                     'Com a Mensagem:' + #13 +
                     '  ' + E.Message, 'Mensagem do Sistema', MtError,[MbOk],0);
               Exit;
            end;
         end;
         wFatorCDI := StrToFloat(TrocaPontoVirgula(regRentabilidade.Result));
         //AL_14
         Result := wFatorCDI;
      end;

      // Chama regra de cálculo do Juros
      if Trim(frmConsRentabilidade.dblRegraJur.Text) <> '' then
      begin
         regRentabilidade.RuleName := frmConsRentabilidade.qryRegraJurIDREGRA.AsString;
         regRentabilidade.QueryIn  := qryAux;
         try
            if frmConsRentabilidade.chkPassoaPasso.Checked then
               regRentabilidade.PassoaPasso
            else
               regRentabilidade.Execute;
         except
            on E:Exception do
            begin
               MsgDlg('Erro ao calcular a Variação do : ' + #13 +
                     '  ' + frmConsRentabilidade.qryConsMoedaMOEDESC.AsString + #13 +
                     'Regra: ' + #13 +
                     '  ' + frmConsRentabilidade.qryRegraNOMEREGRA.AsString +
                     'Com a Mensagem:' + #13 +
                     '  ' + E.Message, 'Mensagem do Sistema', MtError,[MbOk],0);
               Exit;
            end;
         end;
         wFatorCDI := wFatorCDI * StrToFloat(TrocaPontoVirgula(regRentabilidade.Result));
         //AL_14
         Result := wFatorCDI;
      end;
      wFatorCDI := ((wFatorCDI -1) * 100);
   end else begin
      //AL_14
      FuncoesRendaFixa.FatorIndicadores(
                       dDtIni, dDtFim,
                       0,0,
                       frmConsRentabilidade.qryConsMoeda.FieldByName('CODTRATAIND').AsString,
                       frmConsRentabilidade.qryConsMoeda.FieldByName('MOESIGLA').AsString,
                       0{iIndexRendFix},
                       frmConsRentabilidade.qryConsMoeda.FieldByName('MOECODIGO').AsInteger,
                       frmConsRentabilidade.spePercentual.Value,
                       False,
                       wFatorCDI);
      //AL_14
      Result := wFatorCDI;
      wFatorCDI := ((wFatorCDI-1)*100);
   end;

   //AL_14
   if not bProc then
   begin
      if frmConsRentabilidade.pnlRegra.Visible then
      begin
         sIndicador :=  frmConsRentabilidade.dblkRegra.Text;
         iPos := Pos('INV - ',sIndicador);
         if iPos > 0 then
            Delete(sIndicador, iPos, 6);
      end else
         sIndicador :=  frmConsRentabilidade.dblConsMoeda.Text;

      sIndicador := ' ' + sIndicador;

      pnlNomeInd.Caption := sIndicador;

      pnlIndicador.Caption := FormatFloat('#0.0000', wFatorCDI)+' % ';

      if (wFatorCDI = 0) or (wFatorCDI = 1) then
         pnlPerSInd.Caption := FormatFloat('#,##0.0000', 0)+' % '
      else begin
         if ((wFatorCDI * fValorizacao) > 0) then
            pnlPerSInd.Caption := FormatFloat('#,##0.0000', (fValorizacao / wFatorCDI) * 100) + ' % '
         else if wFatorCDI < 0 then
            pnlPerSInd.Caption := FormatFloat('#,##0.0000', ((fValorizacao / Abs(wFatorCDI)) * 100) + 100) + ' % '
         else
            pnlPerSInd.Caption := FormatFloat('#,##0.0000', ((Abs(fValorizacao) / wFatorCDI) * 100) - 100) + ' % '
      end;

      pnlTxJuros.Caption := FormatFloat('#0.0000', frmConsRentabilidade.edtJuros.Value) + ' % ';

     // Verifica se existem investimentos de Renda Variável e
     //     se existir não mostra o percentual sobre o indice
     nTreeNode := trvPortfolio.Items.GetFirstNode;
     bAchou := False;
     while nTreeNode <> nil do
     begin
       if pItem(nTreeNode.Data).IDTipoInvest = 2 then
       begin
          bAchou := True;
          break;
       end;
       nTreeNode := nTreeNode.getNextSibling;
     end;

     if bAchou then
     begin
        pnlTitPerSInd.Caption := '';
        pnlPerSInd.Caption := '';
     end else pnlTitPerSInd.Caption := '% sobre Indicador';
   end;

end;

procedure TfrmConsMovRentabilidade.bbtnConfirmarClick(Sender: TObject);
begin
  With DmRelRentabInvest Do
  Begin
     QryMovRentabilidade.DisableControls;
     QryRelatorio.Close;
     QryRelatorio.Open;

     lblPeriodo.Caption     := 'Período de '+DateToStr(dtDataInicio)+' até '+DateToStr(dtDataFim);
     //AL_8
     lblPlano.Caption        := frmConsRentabilidade.qryPlanoPatro.FieldByName('PLANPRVCONTABPATRO').AsString;

     lblValorizacao.Caption  := pnlValorizacao.Caption;

     lblIndicador.Caption    := pnlNomeInd.Caption;

     lblPerIndicador.Caption := pnlIndicador.Caption;

     if pnlPerSInd.Caption = '' then
        lblTitPersInd.Caption := ''
     else lblTitPersInd.Caption := '% sobre Indicador';

     lblPerSind.Caption      := pnlPerSInd.Caption;

     TfrmPreview.CreateModalPreview(Application,
                                    ppRConsRentabilidade,
                                    ppRConsRentabilidade.PrinterSetup.DocumentName);
     //AL_13

     ppRConsRentabilidade.CloseDataPipelines;

     QryMovRentabilidade.EnableControls;

  End;
end;

procedure TfrmConsMovRentabilidade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   inherited;
   DmRelRentabInvest.qryPortfolio.Close;
   DmRelRentabInvest.QryMovRentabilidade.Close;
   //AL_13
end;

function TfrmConsMovRentabilidade.BuscaSaldosRV(dData: TDateTime): Double;
var fSaldo: Double;
    I: byte;
begin
   Result := 0;
   with qryBuscaSaldoInv do
   begin
      for I := 0 to SQL.Count - 1 do
         Sql.Strings[I] := TrocaString(Sql.Strings[I], '0000', sInvRVBMF);

      OperComum.LimpaParametros(qryBuscaSaldoInv);
      ParamByName('DATAATU').AsString := DateToStr(dData);
      //AL_8
      if frmConsRentabilidade.qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger > 0 then
         ParamByName('IDPLANPREVCTBPATR').AsInteger := frmConsRentabilidade.qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger;
      Open;
      Result := qryBuscaSaldoInvSALDO.AsFloat;
      Close;
   end;
end;

function TfrmConsMovRentabilidade.BuscaOpeOpcInd(dData: TDateTime): TResultOpe;
var I: byte;
begin
   Result.fValorApl := 0;
   Result.fValorRsg := 0;

   with qryBuscaOpeOpcInd do
   begin
      for I := 0 to SQL.Count - 1 do
         Sql.Strings[I] := TrocaString(Sql.Strings[I], '0000', sInvRVBMF);

      OperComum.LimpaParametros(qryBuscaOpeOpcInd);
      ParamByName('DATAATU').AsString := DateToStr(dData);
      //AL_8
      if frmConsRentabilidade.qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger > 0 then
         ParamByName('IDPLANPREVCTBPATR').AsInteger := frmConsRentabilidade.qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger;
      Open;
      Result.fValorApl := qryBuscaOpeOpcIndVALORAPL.AsFloat;
      Result.fValorRsg := qryBuscaOpeOpcIndVALORRSG.AsFloat;
      Close;
   end;
end;

function TfrmConsMovRentabilidade.BuscaOpePagJur(dData: TDateTime): Double;
var I: byte;
begin
   Result := 0;

   with qryBuscaPagJur do
   begin
      for I := 0 to SQL.Count - 1 do
         Sql.Strings[I] := TrocaString(Sql.Strings[I], '0000', sInvRF);

      OperComum.LimpaParametros(qryBuscaPagJur);
      ParamByName('DATAATU').AsString := DateToStr(dData);
      //AL_8
      if frmConsRentabilidade.qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger > 0 then
         ParamByName('IDPLANPREVCTBPATR').AsInteger := frmConsRentabilidade.qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger;
      Open;
      Result := qryBuscaPagJurTOTPAGJUR.AsFloat;
      Close;
   end;
end;

// AL_9
function TfrmConsMovRentabilidade.BuscaAmortFDO(dData: TDateTime): Double;
var I: byte;
begin
   Result := 0;
   with qryBuscaAmortFDO do
   begin
      for I := 0 to SQL.Count - 1 do
         Sql.Strings[I] := TrocaString(Sql.Strings[I], '0000', sInvFundos);

      //AL_13
      OperComum.LimpaParametros(qryBuscaAmortFDO);
      ParamByName('DATAATU').AsString := DateToStr(dData);
      //AL_8
      if frmConsRentabilidade.qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger > 0 then
         ParamByName('IDPLANPREVCTBPATR').AsInteger := frmConsRentabilidade.qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger;
      Open;
      Result := qryBuscaAmortFDO.FieldByName('VLROPERACAO').AsFloat;
      Close;
   end;
end;

end.
