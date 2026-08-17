// Rotina     : bt_ImprimeClick()
// SOL        : 173456
// Kintana    : 1567145
// Data       : 30/09/2009
// Responsável: Otacilio Aquino
// Descrição  : Na qryMapaRenVar implementado os campos IDSEGMENTACAO,DESCSEGMENTACAO
//              sintaxe do SQL estava com erro.
//******************************************************************************
// Rotina     : bt_ImprimeClick()
// SOL        : 125637
// Kintana    : 649764
// Data       : 13/10/2009
// Responsável: William M. Santos
// Descrição  : Na Query que traz os registros na grid, estava sendo feita uma divisão desnecessária para os Saldos de CC e CCI,
//              o saldo CC/CCI correto é o resultado da conta (QTDECC * COTACAO) e não (QTDECC * COTACAO)/LOTE, pois na propria query a cotação ja estava
//              sendo divida pelo lote mais abaixo no corpo da query.
//******************************************************************************
// Rotina     : cbxContaCorrenteChange(), CalculaRodape(), bt_ImprimeClick()
// SOL        : 125084
// Kintana    : 641687
// Data       : 30/09/2009
// Responsável: William M. Santos
// Descrição  : Recompilação para concertar erro de pacote. referente ao chamado 122648-605169.
//******************************************************************************
// Rotina     : cbxContaCorrenteChange(), CalculaRodape(), bt_ImprimeClick()
// SOL        : 122648
// Kintana    : 605169
// Data       : 10/09/2009
// Responsável: William M. Santos
// Descrição  : Implementação da quantidade CC/CCI e saldo CC/CCI na grid e nos relatórios.
//******************************************************************************
// Data      : 03/08/2007
// Código    : AL_4
// Pendência : 24957
// SOL       : 56201
// Motivo    : Implementação do Saldo Consolidado por Investimento Agrupado ou não
//             pelas carteiras
//******************************************************************************
// Data      : 25/04/2007
// Código    : AL_3
// Pendência : 25198
// SOL       : 53035
// Motivo    : Implementação que permiti tirar o relatório agrupado pelas
//             carteiras.
//******************************************************************************
// Data      : 13/09/2006
// Código    : AL_2
// Pendência : 22967
// Motivo    : Segregação de Planos
//******************************************************************************
// Data      : 09/05/2006
// Código    : AL_1
// Pendencia : 21408
// SOL       : 40084
// Motivo    : Retirado a consulta por período. E otimizada a qryMapaRenVar.
//******************************************************************************
// Data      : 05/08/2005
// Motivo    : Implementação da Consulta e Relatório Mapa de Custo de R.Variavel
//******************************************************************************

unit FConsMapaPosicaoRenVar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarRelInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, FPreview, Db, DBTables,
  Grids, Wwdbigrd, Wwdbgrid, wwdblook, wwdbdatetimepicker, CMDateTimePicker,
  Menus, 
  //AL_3
  CheckLst;

type
  TfrmConsMapaPosicaoRenVar = class(TfrmOkCancelarRelInv)
    pnlConsulta: TPanel;
    //AL_3
    lblDtFim: TLabel;
    //AL_3
    dDataFim: TCMDateTimePicker;
    dbgGrid: TwwDBGrid;
    Label1: TLabel;
    dblPlanoPrev: TwwDBLookupCombo;
    pmnuConsPosCartRV: TPopupMenu;
    FixarColuna1: TMenuItem;
    LiberarColuna1: TMenuItem;
    N1: TMenuItem;
    LiberaTodasasColunas1: TMenuItem;
    //AL_3
    CkLstCart: TCheckListBox;
    lblCarteira: TLabel;
    //AL_4
    ChkConsolidado: TCheckBox;
    cbxContaCorrente: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    dblSegmentacao: TwwDBLookupCombo;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
    procedure dbgGridCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgGridTopRowChanged(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dbgGridUpdateFooter(Sender: TObject);
    procedure dbgGridRowChanged(Sender: TObject);
    procedure dbgGridColEnter(Sender: TObject);
    procedure pmnuConsPosCartRVPopup(Sender: TObject);
    procedure FixarColuna1Click(Sender: TObject);
    procedure LiberarColuna1Click(Sender: TObject);
    procedure LiberaTodasasColunas1Click(Sender: TObject);
    procedure dDataFimCloseUp(Sender: TObject);
    procedure dblPlanoPrevCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblPlanoPrevExit(Sender: TObject);
    procedure dDataFimExit(Sender: TObject);
    procedure CkLstCartClick(Sender: TObject);
    procedure ChkConsolidadoClick(Sender: TObject);
    procedure cbxContaCorrenteChange(Sender: TObject); // Criado por William M. Santos - Sol 122648 Kintana 605169
  private
    { Private declarations }
    procedure CalculaRodape;
    //AL_3
    procedure MontaListCart;
  public
    { Public declarations }
  end;

var
  frmConsMapaPosicaoRenVar: TfrmConsMapaPosicaoRenVar;
  //AL_3
  ListaGeral, ListaCarteiras, ListaGeralDesc : TStringList;

implementation

uses FDmRelMapaRenVar, UOperComum, UMensErro, UBibliotecaInvest, UDiasUteisInv,
     //AL_3
     FPrincipal, uString;

{$R *.DFM}

procedure TfrmConsMapaPosicaoRenVar.FormShow(Sender: TObject);
begin
   inherited;
   //AL_2
   OperComum.LimpaParametros(DmRelMapaRenVar.qryCarteira);

   DmRelMapaRenVar.qryCarteira.Open;
   //AL_3
   ListaCarteiras := TStringList.Create;   
   ListaGeral     := TStringList.Create;
   ListaGeralDesc := TStringList.Create;   

   ListaGeral.Clear;
   CkLstCart.Clear;

   while not DmRelMapaRenVar.qryCarteira.Eof do
   begin
      CkLstCart.Items.Add(Trim(DmRelMapaRenVar.qryCarteira.FieldByName('DESCCARTINVEST').AsString));
      CkLstCart.Checked[CkLstCart.Items.Count-1] := (DmRelMapaRenVar.qryCarteira.FieldByName('FLGCARTPROP').AsInteger = 1);

      ListaGeral.Add(DmRelMapaRenVar.qryCarteira.FieldByName('IDCARTEIRAINVEST').AsString);
      ListaGeralDesc.Add(Trim(DmRelMapaRenVar.qryCarteira.FieldByName('DESCCARTINVEST').AsString));

      DmRelMapaRenVar.qryCarteira.Next;
   end;   

   OperComum.LimpaParametros(DmRelMapaRenVar.qryPlanoPatro);
   DmRelMapaRenVar.qryPlanoPatro.Open;

   //Renan Cristiano Sol 131501 Kintana 759733 Inicio.
   OperComum.LimpaParametros(DmRelMapaRenVar.qrySegmentacao);
   DmRelMapaRenVar.qrySegmentacao.ParamByName('GRUPO').AsInteger := 2;//Renda Variavel
   DmRelMapaRenVar.qrySegmentacao.Open;
   //Renan Cristiano Sol 131501 Kintana 759733 Fim.
end;

procedure TfrmConsMapaPosicaoRenVar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   inherited;
   DmRelMapaRenVar.qryCarteira.Close;
   DmRelMapaRenVar.qryPlanoPatro.Close;
   DmRelMapaRenVar.qrySegmentacao.Close; //Renan Cristiano Sol Kintana.
   DmRelMapaRenVar.qryMapaRenVar.Close;
   //AL_4
   DmRelMapaRenVar.QryMapaRenVarCon.Open;
end;

procedure TfrmConsMapaPosicaoRenVar.FormCreate(Sender: TObject);
begin
  inherited;
   //AL_3
   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;
end;

procedure TfrmConsMapaPosicaoRenVar.bbtnConfirmarClick(Sender: TObject);
var
   dDataAnt : TDateTime;
begin
  inherited;
  //Renan Cristiano - Sol: 39931 | Kintana: 523366 Inicio
   if (dDataFim.Date < pRpi.DATARELINICIAL) then
   begin
     MsgDlg('Consulta/Impressão somente permitido para data após '+ DateToStr(pRpi.DATARELINICIAL) +' !!','Mensagem do Sistema',mtWarning,[MbOk],0);
     Exit;
   end;
   //Renan - Sol: 39931 | Kintana: 523366 Fim
   //AL_4
   If ChkConsolidado.Checked then
      dblPlanoPrev.Clear; // Consolidado é todos os planos

   //AL_1
   if Trim(dDataFim.Text) = '' then
   begin
      MsgDlg('Data não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dDataFim.CanFocus then
         dDataFim.SetFocus;
      Exit;
   end;

   //AL_3
   MontaListCart;



   if (ListaCarteiras.Count < 1) then
   begin
      MsgDlg('Carteira de Investimentos não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if CkLstCart.CanFocus then
         CkLstCart.SetFocus;
      Exit;
   end;


   with DmRelMapaRenVar do
   begin
      //AL_3   
      dDataAnt := DiasUteisInv.UltDiaUtilAnterior(StrToDate(dDataFim.Text),-1,1,'',True,False,False);
      OperComum.LimpaParametros(DmRelMapaRenVar.qryMapaRenVar);
      if not DmRelMapaRenVar.MontaQuery(dDataAnt, StrToDate(dDataFim.Text), StrToDate(dDataFim.Text),
                                        OperComum.IIF((Trim(dblPlanoPrev.Text) <> ''),dblPlanoPrev.LookupValue,''),
                                        OperComum.IIF((ListaCarteiras.Count = 1), ListaCarteiras.Text,''),
                                        OperComum.IIF(((ListaCarteiras.Count > 1) and (ListaCarteiras.Count <> CkLstCart.Items.Count-1)),'S','A'),
                                        ListaCarteiras.Text, dblSegmentacao.LookupValue //Renan Cristiano Sol 131501 Kintana 759733.
                                        ) then
      begin
         MsgDlg('Não foi possível executar a consulta!'+#13+
                'Entre em contato com um analista de sistemas da CM Soluções Informática!','Mensagem do Sistema',mtWarning,[MbOk],0);
         if dDataFim.CanFocus then
            dDataFim.SetFocus;
      end
      else
      begin
         if qryMapaRenVar.IsEmpty then
         begin
            MsgDlg('Nenhum saldo foi encontrado neste período !','Mensagem do Sistema',mtWarning,[MbOk],0);
            if dDataFim.CanFocus then
               dDataFim.SetFocus;
         end;
      end;
   end;
end;

procedure TfrmConsMapaPosicaoRenVar.bt_ImprimeClick(Sender: TObject);
begin
  inherited;
   //AL_3
   if not DmRelMapaRenVar.qryMapaRenVar.IsEmpty then
   begin
      DmRelMapaRenVar.qryMapaRenVar.DisableControls;
      //AL_4
      If (ChkConsolidado.Checked = True) and (ListaCarteiras.Count = 1) then
      begin
         OperComum.LimpaParametros(DmRelMapaRenVar.QryMapaRenVarCon);
         DmRelMapaRenVar.QryMapaRenVarCon.Sql.Clear;

         if Not DmRelMapaRenVar.qryMapaRenVar.IsEmpty then
         begin
            // Kintana 1567145 SOL 173456 Otacilio ** Inicio **
            DmRelMapaRenVar.QryMapaRenVarCon.Sql.Add('SELECT DESCCARTINVEST, SIGLAACAOBOLSA, DESCINVESTIMENTO, DATACOTACAO, COTACAO, LOTE, IDSEGMENTACAO,DESCSEGMENTACAO, '+ #13);
            // Kintana 1567145 SOL 173456 Otacilio ** Fim **

            DmRelMapaRenVar.QryMapaRenVarCon.Sql.Add('SUM(SALDOQTDEINVCART) AS SALDOQTDEINVCART, '+ #13);
            DmRelMapaRenVar.QryMapaRenVarCon.Sql.Add('SUM(SALDOVLRINVCART) AS SALDOVLRINVCART,  '+ #13);
            // William M. Santos - Sol 122648 Kintana 605169 - INI
            // William M. Santos - SOL 125637 Kintana 649764 - INI
            DmRelMapaRenVar.QryMapaRenVarCon.Sql.Add('SUM(SALDOQTDEINVCART) AS SALDOQTDEINVCART, SUM(QTDECC) AS QTDECC, TRUNC(SUM(QTDECC * COTACAO),2) AS SALDOVLRCC, TRUNC(SUM (QTDECCI * COTACAO),2) AS SALDOVLRCCI, SUM(QTDECCI) AS QTDECCI'+ #13);
            // William M. Santos - SOL 125637 Kintana 649764 - INI
            // William M. Santos - Sol 122648 Kintana 605169 - FIM
            DmRelMapaRenVar.QryMapaRenVarCon.Sql.Add('                    FROM ( ' + #13);
            DmRelMapaRenVar.QryMapaRenVarCon.Sql.Add( '' + #13);
            DmRelMapaRenVar.QryMapaRenVarCon.Sql.Add(DmRelMapaRenVar.qryMapaRenVar.Sql.GetText);
            DmRelMapaRenVar.QryMapaRenVarCon.Sql.Add( '' + #13);
            DmRelMapaRenVar.QryMapaRenVarCon.Sql.Add( ' ) ' + #13);

            // Kintana 1567145 SOL 173456 Otacilio ** Inicio **
            DmRelMapaRenVar.QryMapaRenVarCon.Sql.Add( ' GROUP BY DESCCARTINVEST, SIGLAACAOBOLSA, DESCINVESTIMENTO, DATACOTACAO, COTACAO, LOTE, IDSEGMENTACAO,DESCSEGMENTACAO' + #13);
            // Kintana 1567145 SOL 173456 Otacilio ** Fim**
            
            DmRelMapaRenVar.QryMapaRenVarCon.Sql.Add( ' ORDER BY DESCINVESTIMENTO' + #13);

            DmRelMapaRenVar.ppLabel77.Caption := dDataFim.Text;

            DmRelMapaRenVar.QryMapaRenVarCon.Open;

            DmRelMapaRenVar.pplabel77.Caption := dDataFim.Text;
            // William M. Santos - Sol 122648 Kintana 605169 - INI
            if cbxContaCorrente.text = 'CC' then
            begin
              DmRelMapaRenVar.ppLabel79.Caption := 'Quantidade CC';
              DmRelMapaRenVar.ppDBText52.DataField := 'QTDECC';
              DmRelMapaRenVar.ppLabel80.Caption := 'Saldo Atual CC';
              DmRelMapaRenVar.ppDBText50.DataField := 'SALDOVLRCC';
              DmRelMapaRenVar.ppDBCalc33.DataField := 'SALDOVLRCC';
            end
            else
            if cbxContaCorrente.text = 'CCI' then
            begin
              DmRelMapaRenVar.ppLabel79.Caption := 'Quantidade CCI';
              DmRelMapaRenVar.ppDBText52.DataField := 'QTDECCI';
              DmRelMapaRenVar.ppLabel80.Caption := 'Saldo Atual CCI';
              DmRelMapaRenVar.ppDBText50.DataField := 'SALDOVLRCCI';
              DmRelMapaRenVar.ppDBCalc33.DataField := 'SALDOVLRCCI';
            end
            else
            begin
              DmRelMapaRenVar.ppLabel79.Caption := 'Quantidade';
              DmRelMapaRenVar.ppDBText52.DataField := 'SALDOQTDEINVCART';
              DmRelMapaRenVar.ppLabel80.Caption := 'Saldo Atual';
              DmRelMapaRenVar.ppDBText50.DataField := 'SALDOVLRINVCART';
              DmRelMapaRenVar.ppDBCalc33.DataField := 'SALDOVLRINVCART';
            end;
            // William M. Santos - Sol 122648 Kintana 605169 - FIM

            TfrmPreview.CreateModalPreview(Application,
                                           DmRelMapaRenVar.rptMapaPosicaoRenVarCon,
                                           DmRelMapaRenVar.rptMapaPosicaoRenVarCon.PrinterSetup.DocumentName);


         end;
      end // Fim AL_4
      else
      If (ChkConsolidado.Checked = True) and (ListaCarteiras.Count > 1) then
      begin
         OperComum.LimpaParametros(DmRelMapaRenVar.QryMapaRenVarCon);
         DmRelMapaRenVar.QryMapaRenVarCon.Sql.Clear;

         if Not DmRelMapaRenVar.qryMapaRenVar.IsEmpty then
         begin
            DmRelMapaRenVar.QryMapaRenVarCon.Sql.Add('SELECT DESCCARTINVEST,SIGLAACAOBOLSA,DESCINVESTIMENTO,DATACOTACAO,COTACAO,LOTE,IDSEGMENTACAO,DESCSEGMENTACAO,'+ #13);
            DmRelMapaRenVar.QryMapaRenVarCon.Sql.Add('SUM(SALDOQTDEINVCART) AS SALDOQTDEINVCART, '+ #13);
            DmRelMapaRenVar.QryMapaRenVarCon.Sql.Add('SUM(SALDOVLRINVCART) AS SALDOVLRINVCART,  '+ #13);
            // William M. Santos - Sol 122648 Kintana 605169 - INI
            // William M. Santos - SOL 125637 Kintana 649764 - INI
            DmRelMapaRenVar.QryMapaRenVarCon.Sql.Add('SUM(SALDOQTDEINVCART) AS SALDOQTDEINVCART, SUM(QTDECC) AS QTDECC, TRUNC(SUM(QTDECC * COTACAO),2) AS SALDOVLRCC, TRUNC(SUM (QTDECCI * COTACAO),2) AS SALDOVLRCCI, SUM(QTDECCI) AS QTDECCI'+ #13);
            // William M. Santos - SOL 125637 Kintana 649764 - FIM
            // William M. Santos - Sol 122648 Kintana 605169 - FIM
            DmRelMapaRenVar.QryMapaRenVarCon.Sql.Add('                    FROM ( ' + #13);
            DmRelMapaRenVar.QryMapaRenVarCon.Sql.Add( '' + #13);
            DmRelMapaRenVar.QryMapaRenVarCon.Sql.Add(DmRelMapaRenVar.qryMapaRenVar.Sql.GetText);
            DmRelMapaRenVar.QryMapaRenVarCon.Sql.Add( '' + #13);
            DmRelMapaRenVar.QryMapaRenVarCon.Sql.Add( ' ) ' + #13);
            DmRelMapaRenVar.QryMapaRenVarCon.Sql.Add( ' GROUP BY DESCCARTINVEST, SIGLAACAOBOLSA,DESCINVESTIMENTO,DATACOTACAO,COTACAO,LOTE,IDSEGMENTACAO,DESCSEGMENTACAO' + #13);
            DmRelMapaRenVar.QryMapaRenVarCon.Sql.Add( ' ORDER BY IDSEGMENTACAO,DESCINVESTIMENTO' + #13);

            DmRelMapaRenVar.ppLabel77.Caption := dDataFim.Text;

            DmRelMapaRenVar.QryMapaRenVarCon.Open;

            DmRelMapaRenVar.pplabel92.Caption := dDataFim.Text;

            // William M. Santos - Sol 122648 Kintana 605169 - INI
            if cbxContaCorrente.text = 'CC' then
            begin
              DmRelMapaRenVar.ppLabel94.Caption := 'Quantidade CC';
              DmRelMapaRenVar.ppDBText63.DataField := 'QTDECC';
              DmRelMapaRenVar.ppLabel95.Caption := 'Saldo Atual CC';
              DmRelMapaRenVar.ppDBText61.DataField := 'SALDOVLRCC';
              DmRelMapaRenVar.ppDBCalc34.DataField := 'SALDOVLRCC';
            end
            else
            if cbxContaCorrente.text = 'CCI' then
            begin
              DmRelMapaRenVar.ppLabel94.Caption := 'Quantidade CCI';
              DmRelMapaRenVar.ppDBText63.DataField := 'QTDECCI';
              DmRelMapaRenVar.ppLabel95.Caption := 'Saldo Atual CCI';
              DmRelMapaRenVar.ppDBText61.DataField := 'SALDOVLRCCI';
              DmRelMapaRenVar.ppDBCalc34.DataField := 'SALDOVLRCCI';
            end
            else
            begin
              DmRelMapaRenVar.ppLabel94.Caption := 'Quantidade';
              DmRelMapaRenVar.ppDBText63.DataField := 'SALDOQTDEINVCART';
              DmRelMapaRenVar.ppLabel95.Caption := 'Saldo Atual';
              DmRelMapaRenVar.ppDBText61.DataField := 'SALDOVLRINVCART';
              DmRelMapaRenVar.ppDBCalc34.DataField := 'SALDOVLRINVCART';
            end;
            // William M. Santos - Sol 122648 Kintana 605169 - FIM

            TfrmPreview.CreateModalPreview(Application,
                                           DmRelMapaRenVar.rptMapaPosRVGroupCon,
                                           DmRelMapaRenVar.rptMapaPosRVGroupCon.PrinterSetup.DocumentName);
         end;
      end // Fim AL_4
      else
      if (ListaCarteiras.Count > 1) then
      begin
         // William M. Santos - Sol 122648 Kintana 605169 - INI
         if cbxContaCorrente.text = 'CC' then
            begin
              DmRelMapaRenVar.ppLabel17.Caption := 'Quantidade CC';
              DmRelMapaRenVar.ppDBText23.DataField := 'QTDECC';
              DmRelMapaRenVar.ppLabel18.Caption := 'Saldo Atual CC';
              DmRelMapaRenVar.ppDBText18.DataField := 'SALDOVLRCC';
              DmRelMapaRenVar.ppDBCalc3.DataField := 'SALDOVLRCC';
              DmRelMapaRenVar.ppDBText26.DataField := 'SALDOPLANOCC';

            end
            else
            if cbxContaCorrente.text = 'CCI' then
            begin
              DmRelMapaRenVar.ppLabel17.Caption := 'Quantidade CCI';
              DmRelMapaRenVar.ppDBText23.DataField := 'QTDECCI';
              DmRelMapaRenVar.ppLabel18.Caption := 'Saldo Atual CCI';
              DmRelMapaRenVar.ppDBText18.DataField := 'SALDOVLRCCI';
              DmRelMapaRenVar.ppDBCalc3.DataField := 'SALDOVLRCCI';
              DmRelMapaRenVar.ppDBText26.DataField := 'SALDOPLANOCCI';
            end
            else
            begin
              DmRelMapaRenVar.ppLabel17.Caption := 'Quantidade';
              DmRelMapaRenVar.ppDBText23.DataField := 'SALDOQTDEINVCART';
              DmRelMapaRenVar.ppLabel18.Caption := 'Saldo Atual';
              DmRelMapaRenVar.ppDBText18.DataField := 'SALDOVLRINVCART';
              DmRelMapaRenVar.ppDBCalc3.DataField := 'SALDOVLRINVCART';
              DmRelMapaRenVar.ppDBText26.DataField := 'SALDOPLANO';
            end;
            // William M. Santos - Sol 122648 Kintana 605169 - FIM

         DmRelMapaRenVar.lblPeriodoPosGroup.Caption := dDataFim.Text;
         TfrmPreview.CreateModalPreview(Application,
                                        DmRelMapaRenVar.rptMapaPosRVGroup,
                                        DmRelMapaRenVar.rptMapaPosRVGroup.PrinterSetup.DocumentName);
      end
      else
      begin
         // William M. Santos - Sol 122648 Kintana 605169 - INI
         if cbxContaCorrente.text = 'CC' then
            begin
              DmRelMapaRenVar.ppLabel33.Caption := 'Quantidade CC';
              DmRelMapaRenVar.ppDBText22.DataField := 'QTDECC';
              DmRelMapaRenVar.ppLabel34.Caption := 'Saldo Atual CC';
              DmRelMapaRenVar.ppDBText19.DataField := 'SALDOVLRCC';
              DmRelMapaRenVar.ppDBCalc2.DataField := 'SALDOVLRCC';
              DmRelMapaRenVar.ppDBText6.DataField := 'SALDOCARTCC';
              DmRelMapaRenVar.ppDBText9.DataField := 'SALDOPLANOCC';

            end
            else
            if cbxContaCorrente.text = 'CCI' then
            begin
              DmRelMapaRenVar.ppLabel33.Caption := 'Quantidade CCI';
              DmRelMapaRenVar.ppDBText22.DataField := 'QTDECCI';
              DmRelMapaRenVar.ppLabel34.Caption := 'Saldo Atual CCI';
              DmRelMapaRenVar.ppDBText19.DataField := 'SALDOVLRCCI';
              DmRelMapaRenVar.ppDBCalc2.DataField := 'SALDOVLRCC';
              DmRelMapaRenVar.ppDBText6.DataField := 'SALDOCARTCCI';
              DmRelMapaRenVar.ppDBText9.DataField := 'SALDOPLANOCCI';
            end
            else
            begin
              DmRelMapaRenVar.ppLabel33.Caption := 'Quantidade';
              DmRelMapaRenVar.ppDBText22.DataField := 'SALDOQTDEINVCART';
              DmRelMapaRenVar.ppLabel34.Caption := 'Saldo Atual';
              DmRelMapaRenVar.ppDBText19.DataField := 'SALDOVLRINVCART';
              DmRelMapaRenVar.ppDBCalc2.DataField := 'SALDOVLRINVCART';
              DmRelMapaRenVar.ppDBText6.DataField := 'SALDOCART';
              DmRelMapaRenVar.ppDBText9.DataField := 'SALDOPLANO';
            end;
            // William M. Santos - Sol 122648 Kintana 605169 - FIM

         DmRelMapaRenVar.lblPeriodoPosicao.Caption := dDataFim.Text;
         TfrmPreview.CreateModalPreview(Application,
                                        DmRelMapaRenVar.rptMapaPosicaoRenVar,
                                        DmRelMapaRenVar.rptMapaPosicaoRenVar.PrinterSetup.DocumentName);
      end;

      DmRelMapaRenVar.qryMapaRenVar.Filtered := False; //Renan Cristiano Sol 131501 Kintana 759733.
      DmRelMapaRenVar.qryMapaRenVar.EnableControls;
   end;
end;

procedure TfrmConsMapaPosicaoRenVar.dbgGridCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then
   begin
      if not Highlight then
      begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
            ABrush.Color := $00C0FFFF // amarelo bebê
         else
            ABrush.Color := clWhite;
      end;
   end
   else
   begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;

procedure TfrmConsMapaPosicaoRenVar.dbgGridTopRowChanged(Sender: TObject);
begin
  inherited;
  TwwDBGrid(Sender).Invalidate;
end;

//AL_2
procedure TfrmConsMapaPosicaoRenVar.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   OperComum.LimpaParametros(DmRelMapaRenVar.qryMapaRenVar);
   DmRelMapaRenVar.qryMapaRenVar.Open;

   dDataFim.Text        := '';

   if dDataFim.CanFocus then
      dDataFim.SetFocus;
end;

//AL_2
procedure TfrmConsMapaPosicaoRenVar.CalculaRodape;
begin
   if (DmRelMapaRenVar.qryMapaRenVar.Active) and (DmRelMapaRenVar.qryMapaRenVar.RecordCount > 0) then
   begin
      //AL_3
      if ((dbgGrid.GetActiveCol = 1) and (ListaCarteiras.Count = 1)) or (dbgGrid.GetActiveCol = 2) then
      begin
         dbgGrid.ColumnByName('PLANPRVCONTABPATRO').FooterValue := DmRelMapaRenVar.qryMapaRenVar.FieldByName('PLANPRVCONTABPATRO').AsString;
         dbgGrid.ColumnByName('DESCCARTINVEST').FooterValue := '';
         dbgGrid.ColumnByName('DESCINVESTIMENTO').FooterValue := '';

         // William M. Santos - Sol 122648 Kintana 605169 - INI
         // dbgGrid.ColumnByName('SALDOVLRINVCART').FooterValue := FloatToStrF(DmRelMapaRenVar.qryMapaRenVar.FieldByName('SALDOPLANO').Value, ffNumber, 22, 2);
         if cbxContaCorrente.Text = 'CC' then
           dbgGrid.ColumnByName('SALDOVLRCC').FooterValue := FloatToStrF(DmRelMapaRenVar.qryMapaRenVar.FieldByName('SALDOPLANOCC').AsFloat, ffNumber, 22, 2)
         else
         if cbxContaCorrente.Text = 'CCI' then
           dbgGrid.ColumnByName('SALDOVLRCCI').FooterValue := FloatToStrF(DmRelMapaRenVar.qryMapaRenVar.FieldByName('SALDOPLANOCCI').AsFloat, ffNumber, 22, 2)
         else
           dbgGrid.ColumnByName('SALDOVLRINVCART').FooterValue := FloatToStrF(DmRelMapaRenVar.qryMapaRenVar.FieldByName('SALDOPLANO').AsFloat, ffNumber, 22, 2);
         // William M. Santos - Sol 122648 Kintana 605169 - FIM

      end
      else if ((dbgGrid.GetActiveCol = 3) and (ListaCarteiras.Count = 1)) then
      begin
         dbgGrid.ColumnByName('PLANPRVCONTABPATRO').FooterValue := '';
         dbgGrid.ColumnByName('DESCCARTINVEST').FooterValue := DmRelMapaRenVar.qryMapaRenVar.FieldByName('DESCCARTINVEST').AsString;
         dbgGrid.ColumnByName('DESCINVESTIMENTO').FooterValue := '';

         // William M. Santos - Sol 122648 Kintana 605169 - INI
         //dbgGrid.ColumnByName('SALDOVLRINVCART').FooterValue := FloatToStrF(DmRelMapaRenVar.qryMapaRenVar.FieldByName('SALDOCART').Value, ffNumber, 22, 2);
         if cbxContaCorrente.Text = 'CC' then
           dbgGrid.ColumnByName('SALDOVLRCC').FooterValue := FloatToStrF(DmRelMapaRenVar.qryMapaRenVar.FieldByName('SALDOCARTCC').AsFloat, ffNumber, 22, 2)
         else
         if cbxContaCorrente.Text = 'CCI' then
           dbgGrid.ColumnByName('SALDOVLRCCI').FooterValue := FloatToStrF(DmRelMapaRenVar.qryMapaRenVar.FieldByName('SALDOCARTCCI').AsFloat, ffNumber, 22, 2)
         else
           dbgGrid.ColumnByName('SALDOVLRINVCART').FooterValue := FloatToStrF(DmRelMapaRenVar.qryMapaRenVar.FieldByName('SALDOCART').AsFloat, ffNumber, 22, 2);
         // William M. Santos - Sol 122648 Kintana 605169 - FIM

      end
      else if (dbgGrid.GetActiveCol = 4) or
             ((dbgGrid.GetActiveCol = 3) and (ListaCarteiras.Count > 1)) then
      begin
         dbgGrid.ColumnByName('PLANPRVCONTABPATRO').FooterValue := '';
         dbgGrid.ColumnByName('DESCCARTINVEST').FooterValue := '';
         dbgGrid.ColumnByName('DESCINVESTIMENTO').FooterValue := DmRelMapaRenVar.qryMapaRenVar.FieldByName('DESCINVESTIMENTO').AsString;

         // William M. Santos - Sol 122648 Kintana 605169 - INI
         //dbgGrid.ColumnByName('SALDOVLRINVCART').FooterValue := FloatToStrF(DmRelMapaRenVar.qryMapaRenVar.FieldByName('SALDOINV').Value, ffNumber, 22, 2);
         if cbxContaCorrente.Text = 'CC' then
           dbgGrid.ColumnByName('SALDOVLRCC').FooterValue := FloatToStrF(DmRelMapaRenVar.qryMapaRenVar.FieldByName('SALDOINVCC').AsFloat, ffNumber, 22, 2)
         else
         if cbxContaCorrente.Text = 'CCI' then
           dbgGrid.ColumnByName('SALDOVLRCCI').FooterValue := FloatToStrF(DmRelMapaRenVar.qryMapaRenVar.FieldByName('SALDOINVCCI').AsFloat, ffNumber, 22, 2)
         else
           dbgGrid.ColumnByName('SALDOVLRINVCART').FooterValue := FloatToStrF(DmRelMapaRenVar.qryMapaRenVar.FieldByName('SALDOINV').AsFloat, ffNumber, 22, 2);
         // William M. Santos - Sol 122648 Kintana 605169 - FIM
      end
      else
      begin
         dbgGrid.ColumnByName('PLANPRVCONTABPATRO').FooterValue := '';
         dbgGrid.ColumnByName('DESCCARTINVEST').FooterValue := '';
         dbgGrid.ColumnByName('DESCINVESTIMENTO').FooterValue := '';
         dbgGrid.ColumnByName('SALDOVLRINVCART').FooterValue := '';
      end;
   end;
end;

procedure TfrmConsMapaPosicaoRenVar.dbgGridUpdateFooter(Sender: TObject);
begin
  inherited;
  CalculaRodape;
end;

procedure TfrmConsMapaPosicaoRenVar.dbgGridRowChanged(Sender: TObject);
begin
  inherited;
  CalculaRodape;
end;

procedure TfrmConsMapaPosicaoRenVar.dbgGridColEnter(Sender: TObject);
begin
   inherited;
   CalculaRodape;
end;

procedure TfrmConsMapaPosicaoRenVar.pmnuConsPosCartRVPopup(Sender: TObject);
begin
   inherited;
   if dbgGrid.DataSource.DataSet.Active then
   begin
      if dbgGrid.FixedCols = 0 then
      begin
         LiberarColuna1.Enabled := False;
         LiberaTodasasColunas1.Enabled := False;
      end
      else
      begin
         LiberarColuna1.Enabled := True;
         LiberaTodasasColunas1.Enabled := True;
      end;

      if dbgGrid.FixedCols = dbgGrid.GetColCount then
         FixarColuna1.Enabled := False
      else
         FixarColuna1.Enabled := True;
   end
   else
   begin
      LiberarColuna1.Enabled := False;
      LiberaTodasasColunas1.Enabled := False;
      FixarColuna1.Enabled := False
   end;
end;

procedure TfrmConsMapaPosicaoRenVar.FixarColuna1Click(Sender: TObject);
begin
   inherited;
   dbgGrid.FixedCols := dbgGrid.FixedCols + 1;
end;

procedure TfrmConsMapaPosicaoRenVar.LiberarColuna1Click(Sender: TObject);
begin
   inherited;
   dbgGrid.FixedCols := dbgGrid.FixedCols - 1;
end;

procedure TfrmConsMapaPosicaoRenVar.LiberaTodasasColunas1Click(Sender: TObject);
begin
   inherited;
   dbgGrid.FixedCols := 0;
end;

//AL_3
procedure TfrmConsMapaPosicaoRenVar.MontaListCart;
var
   sLine : String;
   x, j : integer;
begin
   ListaCarteiras.Clear;
   DmRelMapaRenVar.ppMemoPosGroup.Lines.Clear;
   //AL_4
   DmRelMapaRenVar.MemoMovGroupCon.Lines.Clear;// Fim AL_4
   j := 0;
   for x := 0 to (CkLstCart.Items.Count-1) do
   begin
      // Caso Checado incluir na lista
      if CkLstCart.Checked[x] then
         j := j + 1;
   end;
   if j > 5 then
   begin
      j := 0;
      for x := 0 to (CkLstCart.Items.Count-1) do
      begin
         // Caso Checado incluir na lista
         if CkLstCart.Checked[x] then
         begin
            if ListaCarteiras.Count = 0 then
            begin
               ListaCarteiras.Add(ListaGeral.Strings[x]);
               sLine := sLine + ListaGeralDesc.Strings[x];
               sLine := sLine + Espaco(' ', (60-Length(Trim(ListaGeralDesc.Strings[x]))+10));
               j := j + 1;
            end
            else
            begin
               ListaCarteiras.Add(',' + ListaGeral.Strings[x]);
               sLine := sLine + ListaGeralDesc.Strings[x];
               j := j + 1;
               if (j <> 3) Then
                  sLine := sLine + Espaco(' ', (60-Length(Trim(ListaGeralDesc.Strings[x]))+10));
            end;

            if (j = 3) Then
            begin
               DmRelMapaRenVar.ppMemoPosGroup.Lines.Add(sLine);
               //AL_4
               DmRelMapaRenVar.MemoMovGroupCon.Lines.Add(sLine);// Fim AL_4
               sLine := '';
               j := 0;
            end;
         end;
      end;
      if (j > 0) Then
      // AL_4
      begin // Fim AL_4
         DmRelMapaRenVar.ppMemoPosGroup.Lines.Add(sLine);
      //AL_4
      DmRelMapaRenVar.MemoMovGroupCon.Lines.Add(sLine);
      end; // Fim AL_4
   end
   else
   begin
      j := 0;
      for x := 0 to (CkLstCart.Items.Count-1) do
      begin
         // Caso Checado incluir na lista
         if CkLstCart.Checked[x] then
         begin
            if ListaCarteiras.Count = 0 then
            begin
               ListaCarteiras.Add(ListaGeral.Strings[x]);
               DmRelMapaRenVar.ppMemoPosGroup.Lines.Add(ListaGeralDesc.Strings[x]);
               //AL_4
               DmRelMapaRenVar.MemoMovGroupCon.Lines.Add(ListaGeralDesc.Strings[x]); // Fim AL_4
            end
            else
            begin
               ListaCarteiras.Add(',' + ListaGeral.Strings[x]);
               DmRelMapaRenVar.ppMemoPosGroup.Lines.Add(ListaGeralDesc.Strings[x]);
               //AL_4
               DmRelMapaRenVar.MemoMovGroupCon.Lines.Add(ListaGeralDesc.Strings[x]); // Fim AL_4
            end;
         end;
      end;
   end;
end;

procedure TfrmConsMapaPosicaoRenVar.dDataFimCloseUp(Sender: TObject);
begin
  inherited;
   DmRelMapaRenVar.qryMapaRenVar.Close;
end;

procedure TfrmConsMapaPosicaoRenVar.dblPlanoPrevCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   DmRelMapaRenVar.qryMapaRenVar.Close;
end;

procedure TfrmConsMapaPosicaoRenVar.dblPlanoPrevExit(Sender: TObject);
begin
  inherited;
   DmRelMapaRenVar.qryMapaRenVar.Close;
end;

procedure TfrmConsMapaPosicaoRenVar.dDataFimExit(Sender: TObject);
begin
  inherited;
  DmRelMapaRenVar.qryMapaRenVar.Close;
end;

procedure TfrmConsMapaPosicaoRenVar.CkLstCartClick(Sender: TObject);
begin
  inherited;
   DmRelMapaRenVar.qryMapaRenVar.Close;
end;

//AL_4
procedure TfrmConsMapaPosicaoRenVar.ChkConsolidadoClick(Sender: TObject);
begin
  inherited;
  If ChkConsolidado.Checked then
  begin
     dblPlanoPrev.Clear;
     bbtnConfirmarClick(Self);
  end;
end;

// William M. Santos - Sol 122648 Kintana 605169 - INI
procedure TfrmConsMapaPosicaoRenVar.cbxContaCorrenteChange(
  Sender: TObject);
begin
  inherited;
  if  cbxContaCorrente.Text = 'CC' then
    begin
      dbgGrid.Selected.clear;
      dbgGrid.Selected.add('STAAJUSTEQTD'#9'1'#9' '#9'F');
      dbgGrid.Selected.add('PLANPRVCONTABPATRO'#9'30'#9'Plano / Patrocinadora'#9'F');
      dbgGrid.Selected.add('DESCINVESTIMENTO'#9'30'#9'Investimento'#9'F');
      dbgGrid.Selected.add('SIGLAACAOBOLSA'#9'12'#9'Sigla'#9'F');
      dbgGrid.Selected.add('QTDECC'#9'18'#9'Quantidade CC'#9'F');
      dbgGrid.Selected.add('LOTE'#9'7'#9'Lote'#9'F');
      dbgGrid.Selected.add('DATACOTACAO'#9'10'#9'Data da~Cotação'#9'F');
      dbgGrid.Selected.add('COTACAO'#9'16'#9'Cotação'#9'F');
      dbgGrid.Selected.add('SALDOVLRCC'#9'18'#9'Saldo Atual CC'#9'F');
    end
    else
    if cbxContaCorrente.Text = 'CCI' then
    begin
      dbgGrid.Selected.clear;
      dbgGrid.Selected.add('STAAJUSTEQTD'#9'1'#9' '#9'F');
      dbgGrid.Selected.add('PLANPRVCONTABPATRO'#9'30'#9'Plano / Patrocinadora'#9'F');
      dbgGrid.Selected.add('DESCINVESTIMENTO'#9'30'#9'Investimento'#9'F');
      dbgGrid.Selected.add('SIGLAACAOBOLSA'#9'12'#9'Sigla'#9'F');
      dbgGrid.Selected.add('QTDECCI'#9'18'#9'Quantidade CCI'#9'F');
      dbgGrid.Selected.add('LOTE'#9'7'#9'Lote'#9'F');
      dbgGrid.Selected.add('DATACOTACAO'#9'10'#9'Data da~Cotação'#9'F');
      dbgGrid.Selected.add('COTACAO'#9'16'#9'Cotação'#9'F');
      dbgGrid.Selected.add('SALDOVLRCCI'#9'18'#9'Saldo Atual CCI'#9'F');
    end
    else
    begin
      dbgGrid.Selected.clear;
      dbgGrid.Selected.add('STAAJUSTEQTD'#9'1'#9' '#9'F');
      dbgGrid.Selected.add('PLANPRVCONTABPATRO'#9'30'#9'Plano / Patrocinadora'#9'F');
      dbgGrid.Selected.add('DESCINVESTIMENTO'#9'30'#9'Investimento'#9'F');
      dbgGrid.Selected.add('SIGLAACAOBOLSA'#9'12'#9'Sigla'#9'F');
      dbgGrid.Selected.add('SALDOQTDEINVCART'#9'18'#9'Quantidade'#9'F');
      dbgGrid.Selected.add('LOTE'#9'7'#9'Lote'#9'F');
      dbgGrid.Selected.add('DATACOTACAO'#9'10'#9'Data da~Cotação'#9'F');
      dbgGrid.Selected.add('COTACAO'#9'16'#9'Cotação'#9'F');
      dbgGrid.Selected.add('SALDOVLRINVCART'#9'18'#9'Saldo Atual'#9'F');
    end;

end;
// William M. Santos - Sol 122648 Kintana 605169 - FIM

end.
