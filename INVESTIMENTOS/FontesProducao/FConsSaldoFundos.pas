//******************************************************************************
// Data      : 06/12/2007
// Código    : AL_16
// Pendencia :
// SOL       :
// Desc      : Implementação do "TRUNC" na QryFundoInvestOperacao que faz join com a tabela de
//             cadastro de fundo(HISTFUNDOINVEST). Essa inclusão trata a busca
//             independente da hora.
//******************************************************************************
// Data      : 01/08/2007
// Código    : AL_15
// Pendencia : 24957/25291
// SOL       : 56201/59686
// Motivo    : Implementações do Relatório Consolidado por Fundo
//             Utilizei a MontaMascaraDecQtdHist (Fundo Invest/Data Operação)
//             Melhorar a performance.
//             Atenção a QrySaldoFundo é montada tb em FcadLancamentoFundo
//******************************************************************************
// Data      : 29/05/2007
// Código    : AL_14
// Pendencia : 25291
// SOL       : 59686
// Motivo    : Implementações para melhorar a performance da funcionalidade
//******************************************************************************
// Data      : 18/04/2006
// Código    : AL_13
// Pendencia :
// SOL       :
// Motivo    : Acerto na filtragem de Gestor, DmRelFundosSaldo.QrySaldoTot e
//             DmRelFundosSaldo.QrySaldoDet para utilizar a HISTFUNDOINVEST
//             conforme a data de Vigência
//******************************************************************************
// Data      : 05/02/2007
// Código    : AL_12
// Pendencia :
// SOL       :
// Motivo    : Implementação do check para filtrar os fundos com Saldo Bloqueado
//******************************************************************************
// Data      : 27/09/2006
// Código    : AL_11
// Pendencia :
// SOL       :
// Motivo    : Implementação da verificação de registros para a impressão
//******************************************************************************
// Data      : 23/08/2006
// Código    : AL_10
// Pendencia : 23123
// SOL       : 45112
// Motivo    : Implementação para utilização do Fundo de Inv. em Participação
//******************************************************************************
// Data      : 26/04/2006
// Código    : Al_9
// Pendencia :
// SOL       :
// Motivo    : Melhora de performance nas querys de saldos
//******************************************************************************
// Data      : 23/02/2005
// Código    : Al_8
// Pendencia :
// SOL       :
// Motivo    : Ajuste no layout da tela.
//******************************************************************************
// Data      : 03/01/2006
// Código    : AL_7
// Pendencia :
// SOL       :
// Motivo    : Implementação da quantidade bloqueada e do filtro para todos os planos
//             (QrySaldoFundo, QrySaldoFundoTotal)
//******************************************************************************
// Data     : 13/07/2005
// Linha(s) : AL_6
// Linha(s) : Ajuste no layout do relatorio.
//******************************************************************************
// Data     : 07/07/2005
// Linha(s) : AL_5
// Linha(s) : Retiradao a crítica pois foi colocado na funcao BuscaSaldos
//            QryVerSaldoFech e QrySaldoFundo e QrySaldoFundoTotal filtragem de
//            NATUREZAOPERACAO <> 'R' do TIPOOPERACAO
//******************************************************************************
// Data     : 11/07/2005
// Linha(s) : AL_4
// Linha(s) : Retirada  a coluna de variação do Saldo.
//******************************************************************************
// Data     : 29/06/2005
// Linha(s) : AL_3
// Linha(s) : Retiradao do tratamento de abertura e fechamento
//******************************************************************************
// Data     : 30/03/2005
// Linha(s) : AL_01
// Linha(s) : Implementação do saldo de abertura e fechamento
//******************************************************************************
// Data     : 12/01/2005
// Linha(s) : QryFundoInvestOperacao, QrySaldoFundo
// Motivo   : Ajuste na busca da DTAVIGENCIA da tabela FUNDOINVEST, não trazia o mais recente
//            registro
//******************************************************************************
// Data     : 27/10/2004
// Linha(s) : Al_2
// Motivo   : Ajuste para buscar a ultima data de fechamento
//******************************************************************************
// Data     : 04/10/2004
// Linha(s) : Al_1
// Motivo   : Inclusão da nova concepção para apuração de CPMF sobre as operações de
//            resgate
//******************************************************************************

unit FConsSaldoFundos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, wwdblook, StdCtrls, Mask, wwdbedit, MontaSelect, DBTables,
  Db, Wwdatsrc, Wwquery, TB97, MAHlpBtn, Buttons, ExtCtrls, TB97Ctls,
  //AL_10
  TB97Tlbr, IvDictio, IvMulti, IvEMulti, ComCtrls, DBCtrls,
  Grids, DBGrids, Wwdbigrd, Wwdbgrid, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, CmEventosCadastro, ImgList, Menus, ppDB, ppDBPipe,
  ppDBBDE, ppCtrls, ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppComm,
  //AL_10
  ppRelatv, ppProd, ppReport, FPreview, fcLabel, wwriched;

type

  TfrmConsSaldoFundos = class(TfrmCadastroCS)
    Label6: TLabel;
    QryFundoInvestOperacao: TwwQuery;
    //AL_10
    QryFundoInvestOperacaoIDFUNDOINVEST: TFloatField;
    QryFundoInvestOperacaoDESCFUNDOINVEST: TStringField;
    QryFundoInvestOperacaoIDGESTORCARTEIRA: TFloatField;
    QryFundoInvestOperacaoTRGDTINCLUSAO: TDateTimeField;
    QryFundoInvestOperacaoTRGUSERINCLUSAO: TStringField;
    QryFundoInvestOperacaoMOECODIGO: TFloatField;
    QryFundoInvestOperacaoIDCARTEIRAINVEST: TFloatField;
    QryFundoInvestOperacaoIDTIPOFUNDOINVEST: TFloatField;
    QryFundoInvestOperacaoCNPJFUNDO: TStringField;
    QryFundoInvestOperacaoSTAEXCLUSIVO: TStringField;
    QryFundoInvestOperacaoPZOCARENCIA: TFloatField;
    QryFundoInvestOperacaoPZOANIVERSARIO: TFloatField;
    QryFundoInvestOperacaoPZOLIQAPLIC: TFloatField;
    QryFundoInvestOperacaoPZOLIQRESG: TFloatField;
    QryFundoInvestOperacaoQTDDECQTD: TFloatField;
    QryFundoInvestOperacaoQTDDECVALOR: TFloatField;
    QryFundoInvestOperacaoSTAFUNDO: TStringField;
    QryFundoInvestOperacaoPZOAMORTIZACAO: TFloatField;
    QryFundoInvestOperacaoPERCTXPERFORM: TFloatField;
    QryFundoInvestOperacaoPERCTXADM: TFloatField;
    QryFundoInvestOperacaoCODFUNCETIP: TStringField;
    QryFundoInvestOperacaoSTAPROVISIONAIR: TStringField;
    QryFundoInvestOperacaoSTAPROVISIONAIOF: TStringField;
    QryFundoInvestOperacaoCONTRCETIP: TStringField;
    //AL_10
    QryAux: TwwQuery;
    pnlDadosBase: TPanel;
    Label2: TLabel;
    DtEdDataReferenciaGeral: TCMDateTimePicker;
    Panel1: TPanel;
    //AL_10
    DblTipoFundo: TwwDBLookupCombo;
    Label7: TLabel;
    QryTipoFundo: TwwQuery;
    Label33: TLabel;
    dblGestorCarteira: TwwDBLookupCombo;
    QryGestorCart: TwwQuery;
    QryGestorCartNOME: TStringField;
    QryGestorCartIDGESTORCARTEIRA: TFloatField;
    QryGestorCartIDPESSOA: TFloatField;
    QryTipoFundoInvest: TwwQuery;
    sbtnSaldos: TToolbarButton97;
    PopMnuSaldo: TPopupMenu;
    MnuUmPlanoAbert: TMenuItem;
    //AL_14
    MnuTodosPlanosAbert: TMenuItem;
    //AL_10
    pnlTitulo: TPanel;
    lbNomItem: TfcLabel;
    dbGrdSaldos: TwwDBGrid;
    Panel5: TPanel;
    Label14: TLabel;
    BtProcuraSaldo: TSpeedButton;
    Label30: TLabel;
    Label5: TLabel;
    DbLkcSaldo: TwwDBLookupCombo;
    CbxAplic: TComboBox;
    DbDtRefAplc: TCMDateTimePicker;
    ToolbarSep972: TToolbarSep97;
    //AL_10
    CbxPlano: TCheckBox;
    QryTipoCota: TwwQuery;
    lblTipoCota: TLabel;
    dblTipoCota: TwwDBLookupCombo;
    //AL_12
    CbxBloq: TCheckBox;
    MnuConsolidadoporFundo: TMenuItem;
    //AL_10
    procedure FormActivate(Sender: TObject);
    //AL_10
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtProcuraSaldoClick(Sender: TObject);
    procedure DtEdDataReferenciaGeralExit(Sender: TObject);
    procedure DbLkcSaldoEnter(Sender: TObject);
    procedure MnuUmPlanoAbertClick(Sender: TObject);
    procedure MnuTodosPlanosAbertClick(Sender: TObject);
    procedure DbLkcSaldoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DbLkcSaldoExit(Sender: TObject);
    procedure dblGestorCarteiraEnter(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    //AL_10
    procedure DblTipoFundoExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CbxAplicExit(Sender: TObject);
    //AL_7
    procedure CbxPlanoClick(Sender: TObject);
    procedure dbGrdSaldosUpdateFooter(Sender: TObject);
    //AL_14
    procedure DblTipoFundoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblGestorCarteiraCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    //AL_14
    procedure DtEdDataReferenciaGeralEnter(Sender: TObject);
    procedure dblGestorCarteiraExit(Sender: TObject);
    procedure DblTipoFundoEnter(Sender: TObject);
    //AL_10
    procedure CmeCadastroFind(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    //AL_12
    procedure CbxBloqClick(Sender: TObject);
    procedure MnuConsolidadoporFundoClick(Sender: TObject);

  private
    { Private declarations }
    wValAnt,MascaraDecQtdHist,MascaraDecVlrHist : String;
    //AL_10
    bModif, bTodos  : Boolean;
    //AL_10
    //AL_15

    Procedure AbreQryFundoInvestOperacao;
    //AL_15
    Procedure MontaSqlSaldo;

  public
    { Public declarations }

  end;

var
  frmConsSaldoFundos: TfrmConsSaldoFundos;

implementation

Uses
  //AL_10
  UmensErro, UDataBase, uBibliotecaInvest, uSistema,
  dBaseDados, FTelaAut, UOperComum, FDmRelFundosSaldo, UFundoComum;

{$R *.DFM}

procedure TfrmConsSaldoFundos.FormActivate(Sender: TObject);
begin
   inherited;
   PnlFundo.Enabled := True;
   WindowState      := wsMaximized;
end;

//AL_10

procedure TfrmConsSaldoFundos.FormShow(Sender: TObject);
begin
   inherited;

   MontaSelect.Filtro.Add('HISTFUNDO.IDTIPOINVEST = '+IntToStr(iTipoInvestUsu));


   CbxAplic.Text := '';

   QryTipoFundo.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;

   QryTipoFundo.Open;

   //AL_14
   if QryTipoFundo.RecordCount > 1 then
   begin
      QryTipoFundo.First;
      While Not QryTipoFundo.Eof Do
      begin
         if QryTipoFundo.FieldByName('DATAULTFECH').AsDateTime > DtEdDataReferenciaGeral.DateTime then
         begin
            DtEdDataReferenciaGeral.Text     := QryTipoFundo.FieldByName('DATAULTFECH').AsString;
            DtEdDataReferenciaGeral.DateTime := QryTipoFundo.FieldByName('DATAULTFECH').AsDateTime;
            DtEdDataReferenciaGeral.Update;
         end;
         QryTipoFundo.Next;
      end;
      QryTipoFundo.First;
   end
   else
   begin
      DtEdDataReferenciaGeral.Text     := QryTipoFundo.FieldByName('DATAULTFECH').AsString;
      DtEdDataReferenciaGeral.DateTime := QryTipoFundo.FieldByName('DATAULTFECH').AsDateTime;
      DtEdDataReferenciaGeral.Update;
   end;

   //AL_13
   OperComum.LimpaParametros(QryGestorCart);
   QryGestorCart.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;

   //AL_14
   QryGestorCart.ParamByName('DATAMOVFUNDO').AsString  := DtEdDataReferenciaGeral.Text;
   QryGestorCart.Open;

   //AL_10
   QryTipoCota.Open;

   //AL_14

   If DtEdDataReferenciaGeral.Text = '' Then
   Begin
      DtEdDataReferenciaGeral.Text := DateToStr(Date);
      DtEdDataReferenciaGeral.DateTime := Date;
      DtEdDataReferenciaGeral.Update;
   End;

   //AL_14
   //AL_01
   MnuUmPlanoAbert.Caption  := sPlanPrevCtbPatro;

   //AL_10
   if iTipoInvestUsu in [9,10] then
   begin
      lblTipoCota.Visible  := True;
      dblTipoCota.Visible  := True;
   end;

   SelectNext(ActiveControl,True,True);

   AbreQryFundoInvestoperacao;

   //AL_14
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;

end;

procedure TfrmConsSaldoFundos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   //AL_10
   DmRelFundosSaldo.QrySaldoDet.Close;
   DmRelFundosSaldo.QrySaldoTot.Close;
   QryFundoInvestOperacao.Close;
   QryTipoFundoInvest.Close;
   //AL_14
   QryGestorCart.Close;
   QryTipoFundo.Close;
   //AL_10
   QryTipoCota.Close;
   qry.Close;

   //AL_15
   DmRelFundosSaldo.QrySaldoCon.Close;

   inherited;

end;

//AL_10
procedure TfrmConsSaldoFundos.BtProcuraSaldoClick(Sender: TObject);
begin
   inherited;
   //Al_1
   If CbxAplic.ItemIndex = 0 then
      DbDtRefAplc.Clear;

   If (DbDtRefAplc.Text  = '') And (CbxAplic.ItemIndex > 0) then
       DbDtRefAplc.Text := DateToStr(pRPI.DTMUDACPMF);

   //AL_15
   MontaSqlSaldo;
   //AL_10

end;

procedure TfrmConsSaldoFundos.DtEdDataReferenciaGeralExit(Sender: TObject);
begin
   inherited;
   //AL_14
   //AL_10
   If ((Trim(DtEdDataReferenciaGeral.Text) <> '') And (wValAnt <> DtEdDataReferenciaGeral.Text)) Then
      AbreQryFundoInvestoperacao;
end;

procedure TfrmConsSaldoFundos.MnuUmPlanoAbertClick(Sender: TObject);
begin
   inherited;
   //AL_15
   if CbxPlano.Checked then
      CbxPlano.Checked := False;
   MontaSqlSaldo;

    //AL_10
    with DmRelFundosSaldo do
    begin
       //AL_11
       if Not QrySaldoDet.IsEmpty then
       begin
          QrySaldoDet.DisableControls;

          //AL_14
          pplblSaldoFundosDataRef.Caption := DtEdDataReferenciaGeral.Text;

          LblPlano.Caption := 'TODOS OS PLANOS';

          // AL_15

          if not CbxPlano.Checked then
             LblPlano.Caption := sPlanPrevCtbPatro;

          ghbCabecalhoPlano.Visible := (CbxPlano.Checked);
          gfbRodapePlano.Visible := (CbxPlano.Checked);

          //AL_15
          // Formatando as colunas do relatorio total
          DmRelFundosSaldo.ppDBSaldoFundosQTD.DisplayFormat := MascaraDecQtdHist; // QtdeCotas
          DmRelFundosSaldo.ppDBText2.DisplayFormat          := MascaraDecQtdHist; // QtdeBloqueada
          DmRelFundosSaldo.ppDBCalc1.DisplayFormat          := MascaraDecQtdHist; // Somatorio QtdeCotas
          DmRelFundosSaldo.ppDBCalc2.DisplayFormat          := MascaraDecQtdHist; // Somatorio QtdeBloqueada
          DmRelFundosSaldo.ppDBCalc3.DisplayFormat          := MascaraDecQtdHist; // Somatorio QtdeCotas
          DmRelFundosSaldo.ppDBCalc4.DisplayFormat          := MascaraDecQtdHist; // Somatorio QtdeBloqueada
          //Formatando as colunas do relatorio detalhe
          DmRelFundosSaldo.ppDBSSaldoFundosVlrCota.DisplayFormat := MascaraDecVlrHist;
          DmRelFundosSaldo.ppDBText1.DisplayFormat               := MascaraDecQtdHist;
          DmRelFundosSaldo.ppDBSSaldoFundosQTD.DisplayFormat     := MascaraDecQtdHist;

          //Al_6
          TfrmPreview.CreateModalPreview(Application,
                                         rptSaldoFundos,
                                         rptSaldoFundos.PrinterSetup.DocumentName);
          QrySaldoDet.Filter   := '';
          QrySaldoDet.Filtered := False;
          QrySaldoTot.Filter   := '';
          QrySaldoTot.Filtered := False;

          QrySaldoDet.EnableControls;
       end;
    end;
end;

procedure TfrmConsSaldoFundos.MnuTodosPlanosAbertClick(Sender: TObject);
begin
   inherited;
   //AL_15
   if not CbxPlano.Checked then
      CbxPlano.Checked := True;

   MontaSqlSaldo;

   //AL_10
   with DmRelFundosSaldo do
   begin
      //AL_11
      if Not QrySaldoDet.IsEmpty then
      begin
         QrySaldoDet.DisableControls;

         //AL_14
         pplblSaldoFundosDataRef.Caption := DtEdDataReferenciaGeral.Text;

         LblPlano.Caption := 'TODOS OS PLANOS';

         //AL_15

         if not CbxPlano.Checked then
            LblPlano.Caption := sPlanPrevCtbPatro;

         ghbCabecalhoPlano.Visible := (CbxPlano.Checked);
         gfbRodapePlano.Visible := (CbxPlano.Checked);

         //AL_15
         // Formatando as colunas do relatorio total
         DmRelFundosSaldo.ppDBSaldoFundosQTD.DisplayFormat := MascaraDecQtdHist; // QtdeCotas
         DmRelFundosSaldo.ppDBText2.DisplayFormat          := MascaraDecQtdHist; // QtdeBloqueada
         DmRelFundosSaldo.ppDBCalc1.DisplayFormat          := MascaraDecQtdHist; // Somatorio QtdeCotas
         DmRelFundosSaldo.ppDBCalc2.DisplayFormat          := MascaraDecQtdHist; // Somatorio QtdeBloqueada
         DmRelFundosSaldo.ppDBCalc3.DisplayFormat          := MascaraDecQtdHist; // Somatorio QtdeCotas
         DmRelFundosSaldo.ppDBCalc4.DisplayFormat          := MascaraDecQtdHist; // Somatorio QtdeBloqueada
         //Formatando as colunas do relatorio detalhe
         DmRelFundosSaldo.ppDBSSaldoFundosVlrCota.DisplayFormat := MascaraDecVlrHist;
         DmRelFundosSaldo.ppDBText1.DisplayFormat               := MascaraDecQtdHist;
         DmRelFundosSaldo.ppDBSSaldoFundosQTD.DisplayFormat     := MascaraDecQtdHist; // Fim AL_15

         //Al_6
         TfrmPreview.CreateModalPreview(Application,
                                        rptSaldoFundos,
                                        rptSaldoFundos.PrinterSetup.DocumentName);
         QrySaldoDet.Filter   := '';
         QrySaldoDet.Filtered := False;
         QrySaldoTot.Filter   := '';
         QrySaldoTot.Filtered := False;
         QrySaldoDet.EnableControls;
      end;
   end;
end;

//AL_15

procedure TfrmConsSaldoFundos.DbLkcSaldoEnter(Sender: TObject);
begin
   inherited;
   //AL_10
   wValAnt := DbLkcSaldo.LookupValue;
end;

procedure TfrmConsSaldoFundos.DbLkcSaldoCloseUp(Sender: TObject; LookupTable,FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   //AL_10
   bModif := modified;
   if ((modified) And ((Trim(DtEdDataReferenciaGeral.Text) <> '') And (wValAnt <> DbLkcSaldo.LookupValue))) Then
   begin
      if DbLkcSaldo.LookupValue = '' then
         bTodos := True
      else
         bTodos := False;
      //AL_14
   end;
end;

procedure TfrmConsSaldoFundos.DbLkcSaldoExit(Sender: TObject);
begin
  inherited;
  //AL_10
  if ((Not bModif) And ((Trim(DtEdDataReferenciaGeral.Text) <> '') And (wValAnt <> DbLkcSaldo.LookupValue) Or
                       ((wValAnt = '') And (not bTodos)))) then
  begin
     if DbLkcSaldo.LookupValue = '' then
        bTodos := True
     else
        bTodos := False;
     //AL_14
  end;
  bModif := false
end;

procedure TfrmConsSaldoFundos.AbreQryFundoInvestoperacao;
begin
   with QryFundoInvestOperacao do
   begin
     OperComum.LimpaParametros(QryFundoInvestOperacao);
     if Trim(DblTipoFundo.Text) <> ''  then
        ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
            QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
     if Trim(dblGestorCarteira.Text) <> ''  then
        ParamByName('IDGESTORCARTEIRA').AsInteger :=
            qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;
     ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
     if Trim(DtEdDataReferenciaGeral.Text) <> '' then
        ParamByName('DATAMOVFUNDO').AsString := DtEdDataReferenciaGeral.Text;
     Open;
   end;
end;

procedure TfrmConsSaldoFundos.dblGestorCarteiraEnter(Sender: TObject);
begin
   inherited;
   wValAnt := dblGestorCarteira.LookupValue;
end;

procedure TfrmConsSaldoFundos.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   PnlFundo.Enabled := True;
   //AL_14
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;

   DblTipoFundo.Clear;
   dblGestorCarteira.Clear;
   dblTipoCota.Clear;
   CbxAplic.Text := '';
   DbDtRefAplc.Clear;
   DbLkcSaldo.Clear;

   OperComum.LimpaParametros(DmRelFundosSaldo.QrySaldoDet);
   OperComum.LimpaParametros(DmRelFundosSaldo.QrySaldoTot);
   //AL_15
   OperComum.LimpaParametros(DmRelFundosSaldo.QrySaldoCon);
end;

procedure TfrmConsSaldoFundos.DblTipoFundoExit(Sender: TObject);
begin
   inherited;
   //AL_13
   OperComum.LimpaParametros(QryGestorCart);
   QryGestorCart.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
   if Trim(DtEdDataReferenciaGeral.Text) <> '' then
      QryGestorCart.ParamByName('DATAMOVFUNDO').AsString := DtEdDataReferenciaGeral.Text;
   if Trim(DblTipoFundo.Text) <> '' then
   QryGestorCart.ParamByName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(DblTipoFundo.LookupValue);
   QryGestorCart.Open;
   //AL_14
   //AL_10
   if ((Not bModif) And ((Trim(DtEdDataReferenciaGeral.Text) <> '') And (wValAnt <> DblTipoFundo.LookupValue))) then
      AbreQryFundoInvestoperacao;

   bModif := false;
end;

procedure TfrmConsSaldoFundos.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   pnlFundo.Enabled := True;
   //AL_14
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
   //AL_15
   MontaSqlSaldo;

end;

procedure TfrmConsSaldoFundos.CbxAplicExit(Sender: TObject);
begin
   inherited;
    //Al_1
    If CbxAplic.ItemIndex = 0 then
       DbDtRefAplc.Clear;

    If (DbDtRefAplc.Text  = '') And (CbxAplic.ItemIndex > 0) then
       DbDtRefAplc.Text  := DateToStr(pRPI.DTMUDACPMF);
end;

//AL_7
procedure TfrmConsSaldoFundos.CbxPlanoClick(Sender: TObject);
begin
   inherited;
   //AL_15
   MontaSqlSaldo;
   //AL_10

end;

//Al_8
procedure TfrmConsSaldoFundos.dbGrdSaldosUpdateFooter(Sender: TObject);
var QtdDec : Integer;
begin
   //AL_15
   //AL_10

   inherited;
   //AL_10
   with DmRelFundosSaldo do
   begin
      dbGrdSaldos.Columns[0].FooterValue  := 'SALDO TOTAL';
      //AL_15

      dbGrdSaldos.Columns[4].FooterValue  := FormatFloat(MascaraDecQtdHist,QrySaldoTotSALDOQTDCOTASG.AsFloat);
      dbGrdSaldos.Columns[5].FooterValue  := FormatFloat('###,###,###,##0.00',QrySaldoTotSALDOVLRFUNDOG.AsFloat);
      dbGrdSaldos.Columns[7].FooterValue  := FormatFloat(MascaraDecQtdHist,QrySaldoTotSALDOQTDCOTASBLQG.AsFloat);
      dbGrdSaldos.Columns[8].FooterValue  := FormatFloat('#,###,###,##0.00',QrySaldoTotVLRIOFPROVG.AsFloat);
      dbGrdSaldos.Columns[9].FooterValue  := FormatFloat('#,###,###,##0.00',QrySaldoTotVLRIRPROVG.AsFloat);
      dbGrdSaldos.Columns[10].FooterValue := FormatFloat('###,###,###,##0.00',QrySaldoTotSALDOLIQUIDOG.AsFloat); // Fim AL_15

   end;
end;

//AL_14
//AL_10
procedure TfrmConsSaldoFundos.DblTipoFundoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   //AL_13
   OperComum.LimpaParametros(QryGestorCart);
   QryGestorCart.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
   if Trim(DtEdDataReferenciaGeral.Text) <> '' then
      QryGestorCart.ParamByName('DATAMOVFUNDO').AsString := DtEdDataReferenciaGeral.Text;
   if Trim(DblTipoFundo.Text) <> '' then
      QryGestorCart.ParamByName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(DblTipoFundo.LookupValue);
   QryGestorCart.Open;

   bModif := modified;
   //AL_14
   if ((modified) And ((Trim(DtEdDataReferenciaGeral.Text) <> '') And (wValAnt <> DblTipoFundo.LookupValue))) Then
      AbreQryFundoInvestoperacao;
end;

//AL_10
procedure TfrmConsSaldoFundos.dblGestorCarteiraCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   bModif := modified;
   //AL_14
   if ((modified) And ((Trim(DtEdDataReferenciaGeral.Text) <> '') And (wValAnt <> dblGestorCarteira.LookupValue))) Then
      AbreQryFundoInvestoperacao;
end;

//AL_10
procedure TfrmConsSaldoFundos.DtEdDataReferenciaGeralEnter(
  Sender: TObject);
begin
   inherited;
   //AL_13
   if Trim(DtEdDataReferenciaGeral.Text) <> '' then
      wValAnt := DtEdDataReferenciaGeral.Text;
end;

//AL_10
procedure TfrmConsSaldoFundos.dblGestorCarteiraExit(Sender: TObject);
begin
   inherited;
   //AL_14
   if ((Not bModif) And ((Trim(DtEdDataReferenciaGeral.Text) <> '') And (wValAnt <> dblGestorCarteira.LookupValue))) then
      AbreQryFundoInvestoperacao;

   bModif := false;
end;

//AL_10
procedure TfrmConsSaldoFundos.DblTipoFundoEnter(Sender: TObject);
begin
   inherited;
   wValAnt := DblTipoFundo.LookupValue;
end;

//AL_10
procedure TfrmConsSaldoFundos.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   pnlFundo.Enabled := True;
   if MontaSelect.RetornouValor then
   begin
      DtEdDataReferenciaGeral.Text := MontaSelect.ValoresChave[3];
      DblTipoFundo.LookupValue := MontaSelect.ValoresChave[0];
      DblTipoFundo.PerformSearch;
      AbreQryFundoInvestoperacao;
      DbLkcSaldo.LookupValue   := MontaSelect.ValoresChave[2];
      DbLkcSaldo.PerformSearch;
      CbxPlano.Checked := True;
   end;
end;

//AL_10
procedure TfrmConsSaldoFundos.sbtnProcurarClick(Sender: TObject);
begin
   inherited;
   pnlFundo.Enabled := True;
   //AL_14
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;

//AL_12
procedure TfrmConsSaldoFundos.CbxBloqClick(Sender: TObject);
begin
   inherited;
   //AL_15
   MontaSqlSaldo;

end;

//AL_15
procedure TfrmConsSaldoFundos.MnuConsolidadoporFundoClick(Sender: TObject);
begin
   inherited;
   // Vou montar a QueryDet com os parâmetros permitidos,
   // para isto vou apagar os parâmetros que não permitidos
   dblGestorCarteira.Clear;
   dblTipoCota.Clear;
   CbxAplic.ItemIndex := -1;
   DbDtRefAplc.Clear;
   CbxPlano.Checked := True;
   // Refazendo Query Detalhe
   MontaSqlSaldo;
   // Gerando a Query Consolidada
   OperComum.LimpaParametros(DmRelFundosSaldo.QrySaldoCon);
   DmRelFundosSaldo.QrySaldoCon.Sql.Clear;

   if Not DmRelFundosSaldo.QrySaldoDet.IsEmpty then
   begin
      DmRelFundosSaldo.QrySaldoCon.Sql.Add('SELECT DESCTIPOFUNDOINV, DESCFUNDOINVEST,'+ #13);
      DmRelFundosSaldo.QrySaldoCon.Sql.Add('IDTIPOFUNDOINVEST, IDFUNDOINVEST,'+ #13);
      DmRelFundosSaldo.QrySaldoCon.Sql.Add('SUM(SALDOQTDCOTAS) AS SALDOQTDCOTAS, '+ #13);
      DmRelFundosSaldo.QrySaldoCon.Sql.Add('SUM(SALDOQTDCOTASBLQ) AS SALDOQTDCOTASBLQ, '+ #13);
      DmRelFundosSaldo.QrySaldoCon.Sql.Add('SUM(SALDOVLRFUNDO) AS SALDOVLRFUNDO,'+ #13);
      DmRelFundosSaldo.QrySaldoCon.Sql.Add('SUM(VLRIOFPROV) AS VLRIOFPROV,' + #13);
      DmRelFundosSaldo.QrySaldoCon.Sql.Add('SUM(VLRIRPROV) AS VLRIRPROV,' + #13);
      DmRelFundosSaldo.QrySaldoCon.Sql.Add('SUM(SALDOLIQUIDO) AS SALDOLIQUIDO FROM ( ' + #13);
      DmRelFundosSaldo.QrySaldoCon.Sql.Add( '' + #13);
      DmRelFundosSaldo.QrySaldoCon.Sql.Add(DmRelFundosSaldo.QrySaldoDet.Sql.GetText);
      DmRelFundosSaldo.QrySaldoCon.Sql.Add( '' + #13);
      DmRelFundosSaldo.QrySaldoCon.Sql.Add( ' ) ' + #13);
      DmRelFundosSaldo.QrySaldoCon.Sql.Add( ' GROUP BY DESCTIPOFUNDOINV, DESCFUNDOINVEST, IDTIPOFUNDOINVEST, IDFUNDOINVEST' + #13);
      DmRelFundosSaldo.QrySaldoCon.Sql.Add( ' ORDER BY DESCTIPOFUNDOINV, DESCFUNDOINVEST, IDTIPOFUNDOINVEST, IDFUNDOINVEST' + #13);
      DmRelFundosSaldo.QrySaldoCon.Open;

      DmRelFundosSaldo.pplblSaldoFundosConDataRef.Caption := DtEdDataReferenciaGeral.Text;

      // Formatando as colunas do relatorio consolidado
      DmRelFundosSaldo.ppDBText7.DisplayFormat := MascaraDecQtdHist; // QtdeCotas
      DmRelFundosSaldo.ppDBText12.DisplayFormat := MascaraDecQtdHist; // QtdeBloqueada
      DmRelFundosSaldo.ppDBCalc26.DisplayFormat := MascaraDecQtdHist; // Somatorio QtdeCotas
      DmRelFundosSaldo.ppDBCalc25.DisplayFormat := MascaraDecQtdHist; // Somatorio QtdeBloqueada

      TfrmPreview.CreateModalPreview(Application,
                                     DmRelFundosSaldo.rptSaldoFundoCon,
                                     DmRelFundosSaldo.rptSaldoFundoCon.PrinterSetup.DocumentName);

      DmRelFundosSaldo.QrySaldoCon.Filter   := '';
      DmRelFundosSaldo.QrySaldoCon.Filtered := False;

  end;
end;

//AL_15
procedure TfrmConsSaldoFundos.MontaSqlSaldo;
begin

   //Montando as Mascaras de Histfundo
   //Atenção as mascaras tem relacao com a data do saldo do fundo
   If Trim(DbLkcSaldo.Text) <> '' Then
   Begin
      MascaraDecVlrHist := MontaMascaraDecVlrHist(QryFundoInvestOperacaoIDFUNDOINVEST.AsInteger,DtEdDataReferenciaGeral.text);
      MascaraDecQtdHist := MontaMascaraDecQtdHist(QryFundoInvestOperacaoIDFUNDOINVEST.AsInteger,DtEdDataReferenciaGeral.text);
   End
   Else
   Begin
      MascaraDecVlrHist := '###,#0.000000000000';
      MascaraDecQtdHist := '###,#0.000000000000';
   end;
   // Montando mascara de detalhe
   DmRelFundosSaldo.QrySaldoDetVLRCOTAAPLICACAO.DisplayFormat := MascaraDecVlrHist;
   DmRelFundosSaldo.QrySaldoDetVLRCOTAATUAL.DisplayFormat     := MascaraDecVlrHist;
   DmRelFundosSaldo.QrySaldoDetSALDOQTDCOTAS.DisplayFormat    := MascaraDecQtdHist;
   DmRelFundosSaldo.QrySaldoDetSALDOQTDCOTASBLQ.DisplayFormat := MascaraDecQtdHist;
   // Montando mascara de Rodape
   DmRelFundosSaldo.QrySaldoTotSALDOQTDCOTASG.DisplayFormat    := MascaraDecQtdHist;
   DmRelFundosSaldo.QrySaldoTotSALDOQTDCOTASBLQG.DisplayFormat := MascaraDecQtdHist;
   DmRelFundosSaldo.QrySaldoTotVLRIOFPROVG.DisplayFormat       := '#,###,###,##0.00';
   DmRelFundosSaldo.QrySaldoTotVLRIRPROVG.DisplayFormat        := '#,###,###,##0.00';
   DmRelFundosSaldo.QrySaldoTotSALDOLIQUIDOG.DisplayFormat     := '###,###,###,##0.00';
   DmRelFundosSaldo.QrySaldoTotSALDOVLRFUNDOG.DisplayFormat    := '###,###,###,##0.00';

   // Montando a Query Detalhe
   DmRelFundosSaldo.QrySaldoDet.DisableControls;
   DmRelFundosSaldo.QrySaldoTot.DisableControls;
   OperComum.LimpaParametros(DmRelFundosSaldo.QrySaldoDet);
   DmRelFundosSaldo.QrySaldoDet.SQL.Clear;
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('SELECT /*+INDEX (H1.XPKHISTFUNDO)*/' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('       FI.IDFUNDOINVEST, FI.DESCFUNDOINVEST, '+ #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('       FI.IDTIPOFUNDOINVEST,FI.DESCTIPOFUNDOINV,'+ #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('       H1.DATAAPLICACAO, H1.DATAMOVFUNDO,' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('       H1.SALDOQTDCOTAS, H1.SALDOQTDCOTASBLQ,' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('       NVL(CAT.VLRCOTA,0)       AS VLRCOTAATUAL,' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('       H1.SALDOVLRFUNDO,' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('       NVL(H1.VLRIRPROV,0)    AS VLRIRPROV,' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('       NVL(H1.VLRIOFPROV,0)   AS VLRIOFPROV,' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('       (NVL(H1.SALDOVLRFUNDO,0) - NVL(H1.VLRIOFPROV,0)) AS  SALDOLIQUIDO,' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('       NVL(H1.COTAAPLICACAO,0) AS VLRCOTAAPLICACAO,' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('       PLANO.PLANPRVCONTABPATRO,' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('       H1.IDPLANPREVCTBPATR,' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('       TC.DESCTIPOCOTA ' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('FROM' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('       HISTFUNDO H1,' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('       (SELECT /*+INDEX (HI.XIE1HISTFUNDO)*/  MAX(HI.IDHISTFUNDO) AS IDHISTFUNDO ' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('        FROM HISTFUNDO HI, ' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('             (SELECT IDTIPOINVEST, IDTIPOOPERACAO' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('              FROM   TIPOOPERACAO ' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('              WHERE (IDTIPOINVEST = '+IntToStr(iTipoInvestUsu)+')' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('                    AND   (NATUREZAOPERACAO <> ''R'')) TP,' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('             (SELECT HF1.IDFUNDOINVEST, HF1.IDTIPOFUNDOINVEST, HF1.DESCFUNDOINVEST ' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('              FROM HISTFUNDOINVEST HF1 ' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('              WHERE (IDFUNDOINVEST || TO_CHAR(DTAVIGENCIA,''DD/MM/YYYY, HH24:MI:SS'') IN ' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('                         (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCIA),''DD/MM/YYYY, HH24:MI:SS'')' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('                          FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('                          WHERE ' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('                              (TF.IDTIPOINVEST = '+IntToStr(iTipoInvestUsu)+')' + #13);
   if DblTipoFundo.Text <> '' then
      DmRelFundosSaldo.QrySaldoDet.SQL.Add('                               AND  (TF.IDTIPOFUNDOINVEST = '+QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsString+')' + #13);
   if DbLkcSaldo.Text <> '' then
      DmRelFundosSaldo.QrySaldoDet.SQL.Add('                               AND  (HF.IDFUNDOINVEST     = '+DbLkcSaldo.LookupValue+')' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('                               AND (HF.DTAVIGENCIA       < TO_DATE('+QuotedStr(DtEdDataReferenciaGeral.Text)+',''DD/MM/YYYY'')+1) ' + #13);
   if dblGestorCarteira.Text <> ''  then
      DmRelFundosSaldo.QrySaldoDet.SQL.Add('                              AND  (HF.IDGESTORCARTEIRA  = '+qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsString+')' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('                              AND (HF.IDTIPOFUNDOINVEST  = TF.IDTIPOFUNDOINVEST) ' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('                              GROUP BY HF.IDFUNDOINVEST))' + #13);
   if DblTipoFundo.Text <> '' then
      DmRelFundosSaldo.QrySaldoDet.SQL.Add('                    AND  (HF1.IDTIPOFUNDOINVEST = '+QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsString+')'+ #13);
   //Ricardo Cristiano - 26/09/2011 - N. Sol 165409 -  N. Kintana 1432653 INI      
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('                    AND NOT EXISTS' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('                            (SELECT 1' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('                             FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('                             WHERE' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('                                   TF.IDTIPOINVEST = '+IntToStr(iTipoInvestUsu) + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('                               AND HF.IDFUNDOINVEST = HF1.IDFUNDOINVEST' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('                               AND HF.DTAVIGENCIA   > HF1.DTAVIGENCIA' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('                               AND (HF.DTAVIGENCIA  < TO_DATE('+QuotedStr(DtEdDataReferenciaGeral.Text)+',''DD/MM/YYYY'')+1)' + #13);   
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('                               AND HF.IDTIPOFUNDOINVEST <> HF1.IDTIPOFUNDOINVEST' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('                               AND HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('                             GROUP BY HF.IDFUNDOINVEST)    ) FI ' + #13);
   //Ricardo Cristiano - 26/09/2011 - N. Sol 165409 -  N. Kintana 1432653 FIM   
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('        WHERE ' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('             (HI.IDTIPOINVEST      = '+IntToStr(iTipoInvestUsu)+')' + #13);
   if not CbxPlano.Checked then
      DmRelFundosSaldo.QrySaldoDet.SQL.Add('             AND  (HI.IDPLANPREVCTBPATR = '+IntToStr(iPlanPrevCtbPatro)+')' + #13)
   else
      DmRelFundosSaldo.QrySaldoDet.Sql.add('             AND (HI.IDPLANPREVCTBPATR > 0)');
   if DbLkcSaldo.Text <> '' then
      DmRelFundosSaldo.QrySaldoDet.SQL.Add('             AND (HI.IDFUNDOINVEST = '+DbLkcSaldo.LookupValue+')' + #13)
   else
      DmRelFundosSaldo.QrySaldoDet.Sql.add('             AND (HI.IDFUNDOINVEST > 0)');
   if Trim(DbDtRefAplc.Text) <> '' then
   begin
      if CbxAplic.ItemIndex = 1 Then
         DmRelFundosSaldo.QrySaldoDet.Sql.add('             AND (HI.DATAAPLICACAO < TO_DATE('+QuotedStr(DbDtRefAplc.Text)+',''DD/MM/YYYY''))')
      else if CbxAplic.ItemIndex = 2 Then
              DmRelFundosSaldo.QrySaldoDet.Sql.add('             AND (HI.DATAAPLICACAO >= TO_DATE('+QuotedStr(DbDtRefAplc.Text)+',''DD/MM/YYYY''))')
           else
              DmRelFundosSaldo.QrySaldoDet.Sql.add('             AND (HI.DATAAPLICACAO <= TO_DATE('+QuotedStr(DtEdDataReferenciaGeral.Text)+',''DD/MM/YYYY''))');
   end;
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('             AND (HI.DATAMOVFUNDO      = TO_DATE('+QuotedStr(DtEdDataReferenciaGeral.Text)+', ''DD/MM/YYYY'')) ' + #13);
   if ((dblTipoCota.Visible) And (dblTipoCota.Text <> '')) then
      DmRelFundosSaldo.QrySaldoDet.SQL.Add('             AND (HI.IDTIPOCOTA = '+QryTipoCota.FieldByName('IDTIPOCOTA').AsString+') ' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('             AND (HI.TIPMOVFUNDO      <> ''PIR'') ' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('             AND (FI.IDFUNDOINVEST     = HI.IDFUNDOINVEST) ' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('             AND (TP.IDTIPOINVEST      = HI.IDTIPOINVEST) ' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('             AND (TP.IDTIPOOPERACAO    = HI.IDTIPOOPERACAO) ' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('             GROUP BY HI.IDTIPOINVEST,  HI.IDPLANPREVCTBPATR, HI.IDFUNDOINVEST, HI.DATAAPLICACAO,' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('                      HI.DATAMOVFUNDO,  HI.IDTIPOCOTA) HM,' + #13);

   DmRelFundosSaldo.QrySaldoDet.SQL.Add('       COTAFUNDO CAT, TIPOCOTA TC, ' + #13);

   DmRelFundosSaldo.QrySaldoDet.SQL.Add('       (SELECT HF1.IDFUNDOINVEST, HF1.IDTIPOFUNDOINVEST, HF1.DESCFUNDOINVEST,TF1.DESCTIPOFUNDOINV' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('        FROM HISTFUNDOINVEST HF1,TIPOFUNDOINVEST TF1' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('        WHERE' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('           (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,''DD/MM/YYYY, HH24:MI:SS'') IN' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('                 (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCIA),''DD/MM/YYYY, HH24:MI:SS'')' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('                  FROM   HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF ' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('                  WHERE ' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('                      (TF.IDTIPOINVEST       = '+IntToStr(iTipoInvestUsu)+')' + #13);
   if DblTipoFundo.Text <> '' then
      DmRelFundosSaldo.QrySaldoDet.SQL.Add('                       AND (TF.IDTIPOFUNDOINVEST = '+ QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsString+')' + #13);
   if DbLkcSaldo.Text <> '' then
      DmRelFundosSaldo.QrySaldoDet.SQL.Add('                       AND (HF.IDFUNDOINVEST     = '+ DbLkcSaldo.LookupValue +')' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('                       AND (HF.DTAVIGENCIA       < TO_DATE('+QuotedStr(DtEdDataReferenciaGeral.Text)+',''DD/MM/YYYY'')+1)' + #13);
   If dblGestorCarteira.Text <> ''  then
      DmRelFundosSaldo.QrySaldoDet.SQL.Add('                       AND (HF.IDGESTORCARTEIRA  = '+qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsString+')' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('                       AND (HF.IDTIPOFUNDOINVEST  = TF.IDTIPOFUNDOINVEST)' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('                       GROUP BY HF.IDFUNDOINVEST))' + #13);
   if DblTipoFundo.Text <> '' then
      DmRelFundosSaldo.QrySaldoDet.SQL.Add('           AND (HF1.IDTIPOFUNDOINVEST = '+ QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsString+')' + #13);
   //Ricardo Cristiano - 26/09/2011 - N. Sol 165409 -  N. Kintana 1432653 INI      
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('           AND (HF1.IDTIPOFUNDOINVEST = TF1.IDTIPOFUNDOINVEST) ' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('           AND NOT EXISTS' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('                   (SELECT 1' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('                    FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('                    WHERE' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('                          TF.IDTIPOINVEST  = '+IntToStr(iTipoInvestUsu) + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('                      AND HF.IDFUNDOINVEST = HF1.IDFUNDOINVEST' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('                      AND HF.DTAVIGENCIA   > HF1.DTAVIGENCIA' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('                      AND (HF.DTAVIGENCIA  < TO_DATE('+QuotedStr(DtEdDataReferenciaGeral.Text)+',''DD/MM/YYYY'')+1)' + #13);   
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('                      AND HF.IDTIPOFUNDOINVEST <> HF1.IDTIPOFUNDOINVEST' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('                      AND HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('                    GROUP BY HF.IDFUNDOINVEST)    ) FI, ' + #13);
   //Ricardo Cristiano - 26/09/2011 - N. Sol 165409 -  N. Kintana 1432653 FIM      
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('       VWPLANPREVCTBPATR PLANO' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('WHERE ' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('     (H1.IDHISTFUNDO       = HM.IDHISTFUNDO) ' + #13);
   if CbxBloq.Checked then
      DmRelFundosSaldo.QrySaldoDet.SQL.Add('     AND (H1.SALDOQTDCOTASBLQ > 0)' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('     AND (H1.SALDOQTDCOTAS > 0)' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('     AND (H1.IDPLANPREVCTBPATR = PLANO.IDPLANPREVCTBPATR)' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('     AND (H1.IDFUNDOINVEST     = FI.IDFUNDOINVEST)' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('     AND (H1.DATAMOVFUNDO      = CAT.DATACOTA(+))' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('     AND (H1.IDFUNDOINVEST     = CAT.IDFUNDOINVEST(+))' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('     AND (NVL(H1.IDTIPOCOTA,0) = NVL(CAT.IDTIPOCOTA(+),0))' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('     AND (H1.IDTIPOCOTA        =  TC.IDTIPOCOTA(+)) ' + #13);
   DmRelFundosSaldo.QrySaldoDet.SQL.Add('ORDER BY PLANPRVCONTABPATRO, IDPLANPREVCTBPATR, DESCFUNDOINVEST, DATAAPLICACAO, DESCTIPOCOTA' + #13);

   // Montando a Query Tot da Query Detalhe
   // Preparando a QrySaldoTot
   DmRelFundosSaldo.QrySaldoTot.Filter := '';
   DmRelFundosSaldo.QrySaldoTot.Filtered  := False;
   OperComum.LimpaParametros(DmRelFundosSaldo.QrySaldoTot);
   DmRelFundosSaldo.QrySaldoTot.Sql.Clear;
   DmRelFundosSaldo.QrySaldoTot.Sql.Add('SELECT '+ #13);
   DmRelFundosSaldo.QrySaldoTot.Sql.Add('DET.DESCTIPOFUNDOINV, DET.PLANPRVCONTABPATRO, DET.DESCFUNDOINVEST,'+ #13);
   DmRelFundosSaldo.QrySaldoTot.Sql.Add('DET.IDTIPOFUNDOINVEST, DET.IDPLANPREVCTBPATR, DET.IDFUNDOINVEST,'+ #13);
   DmRelFundosSaldo.QrySaldoTot.Sql.Add('DET.SALDOQTDCOTAS, '+ #13);
   DmRelFundosSaldo.QrySaldoTot.Sql.Add('DET.SALDOQTDCOTASBLQ, '+ #13);
   DmRelFundosSaldo.QrySaldoTot.Sql.Add('DET.SALDOVLRFUNDO,'+ #13);
   DmRelFundosSaldo.QrySaldoTot.Sql.Add('DET.VLRIOFPROV,' + #13);
   DmRelFundosSaldo.QrySaldoTot.Sql.Add('DET.VLRIRPROV,' + #13);
   DmRelFundosSaldo.QrySaldoTot.Sql.Add('DET.SALDOLIQUIDO,' + #13);
   DmRelFundosSaldo.QrySaldoTot.Sql.Add('GERAL.SALDOQTDCOTASG, '+ #13);
   DmRelFundosSaldo.QrySaldoTot.Sql.Add('GERAL.SALDOQTDCOTASBLQG, '+ #13);
   DmRelFundosSaldo.QrySaldoTot.Sql.Add('GERAL.SALDOVLRFUNDOG,'+ #13);
   DmRelFundosSaldo.QrySaldoTot.Sql.Add('GERAL.VLRIOFPROVG,' + #13);
   DmRelFundosSaldo.QrySaldoTot.Sql.Add('GERAL.VLRIRPROVG,' + #13);
   DmRelFundosSaldo.QrySaldoTot.Sql.Add('GERAL.SALDOLIQUIDOG FROM ( ' + #13);
   // Detalhe
   DmRelFundosSaldo.QrySaldoTot.Sql.Add( '' + #13);
   DmRelFundosSaldo.QrySaldoTot.Sql.Add('SELECT '+ #13);
   DmRelFundosSaldo.QrySaldoTot.Sql.Add('DESCTIPOFUNDOINV, PLANPRVCONTABPATRO, DESCFUNDOINVEST,'+ #13);
   DmRelFundosSaldo.QrySaldoTot.Sql.Add('IDTIPOFUNDOINVEST, IDPLANPREVCTBPATR, IDFUNDOINVEST,'+ #13);
   DmRelFundosSaldo.QrySaldoTot.Sql.Add('SUM(SALDOQTDCOTAS) AS SALDOQTDCOTAS, '+ #13);
   DmRelFundosSaldo.QrySaldoTot.Sql.Add('SUM(SALDOQTDCOTASBLQ) AS SALDOQTDCOTASBLQ, '+ #13);
   DmRelFundosSaldo.QrySaldoTot.Sql.Add('SUM(SALDOVLRFUNDO) AS SALDOVLRFUNDO,'+ #13);
   DmRelFundosSaldo.QrySaldoTot.Sql.Add('SUM(VLRIOFPROV) AS VLRIOFPROV,' + #13);
   DmRelFundosSaldo.QrySaldoTot.Sql.Add('SUM(VLRIRPROV) AS VLRIRPROV,' + #13);
   DmRelFundosSaldo.QrySaldoTot.Sql.Add('SUM(SALDOLIQUIDO) AS SALDOLIQUIDO FROM( ' + #13);
   DmRelFundosSaldo.QrySaldoTot.Sql.Add(DmRelFundosSaldo.QrySaldoDet.Sql.GetText);
   DmRelFundosSaldo.QrySaldoTot.Sql.Add( ')' + #13);
   DmRelFundosSaldo.QrySaldoTot.Sql.Add( 'GROUP BY DESCTIPOFUNDOINV, PLANPRVCONTABPATRO, DESCFUNDOINVEST,' + #13);
   DmRelFundosSaldo.QrySaldoTot.Sql.Add( '         IDTIPOFUNDOINVEST, IDPLANPREVCTBPATR, IDFUNDOINVEST' + #13);
   DmRelFundosSaldo.QrySaldoTot.Sql.Add( 'ORDER BY DESCTIPOFUNDOINV, PLANPRVCONTABPATRO, DESCFUNDOINVEST,' + #13);
   DmRelFundosSaldo.QrySaldoTot.Sql.Add( '         IDTIPOFUNDOINVEST, IDPLANPREVCTBPATR, IDFUNDOINVEST ' + #13);
   DmRelFundosSaldo.QrySaldoTot.Sql.Add( '' + #13);
   DmRelFundosSaldo.QrySaldoTot.Sql.Add( ' ) DET, ' + #13);
   // Fim Detalhe
   // Geral
   DmRelFundosSaldo.QrySaldoTot.Sql.Add( '' + #13);
   DmRelFundosSaldo.QrySaldoTot.Sql.Add('( SELECT '+ #13);
   DmRelFundosSaldo.QrySaldoTot.Sql.Add('         SUM(SALDOQTDCOTAS) AS SALDOQTDCOTASG,'+ #13);
   DmRelFundosSaldo.QrySaldoTot.Sql.Add('         SUM(SALDOQTDCOTASBLQ) AS SALDOQTDCOTASBLQG,'+ #13);
   DmRelFundosSaldo.QrySaldoTot.Sql.Add('         SUM(SALDOVLRFUNDO) AS SALDOVLRFUNDOG, '+ #13);
   DmRelFundosSaldo.QrySaldoTot.Sql.Add('         SUM(VLRIOFPROV) AS VLRIOFPROVG,'+ #13);
   DmRelFundosSaldo.QrySaldoTot.Sql.Add('         SUM(VLRIRPROV) AS VLRIRPROVG,' + #13);
   DmRelFundosSaldo.QrySaldoTot.Sql.Add('         SUM(SALDOLIQUIDO) AS SALDOLIQUIDOG FROM( ' + #13);
   DmRelFundosSaldo.QrySaldoTot.Sql.Add(                      DmRelFundosSaldo.QrySaldoDet.Sql.GetText);
   DmRelFundosSaldo.QrySaldoTot.Sql.Add( '                                               )' + #13);
   DmRelFundosSaldo.QrySaldoTot.Sql.Add( '' + #13);
   DmRelFundosSaldo.QrySaldoTot.Sql.Add( ' ) GERAL ' + #13);

   DmRelFundosSaldo.QrySaldoDet.Filter := '';
   DmRelFundosSaldo.QrySaldoDet.Filtered  := False;
   DmRelFundosSaldo.QrySaldoDet.Open;
   DmRelFundosSaldo.QrySaldoTot.Open;

   if DmRelFundosSaldo.QrySaldoDet.IsEmpty then
   begin
      if DtEdDataReferenciaGeral.CanFocus then
         DtEdDataReferenciaGeral.SetFocus;
      dbGrdSaldosUpdateFooter(Self);
      DmRelFundosSaldo.QrySaldoDet.EnableControls;
      Exit;
   end;

   DmRelFundosSaldo.QrySaldoDet.EnableControls;
   DmRelFundosSaldo.QrySaldoTot.EnableControls;

   // No caso de ser Fundo de Dir Cred ou Part
   DmRelFundosSaldo.QrySaldoDetDESCTIPOCOTA.Visible := iTipoInvestUsu in [9,10];
   DmRelFundosSaldo.ImpTipoCota := dblTipoCota.Visible;

   pnlFundo.Enabled := True;

   sbtnSaldos.Down  := False;

   dbGrdSaldosUpdateFooter(Self);

end;

end.
