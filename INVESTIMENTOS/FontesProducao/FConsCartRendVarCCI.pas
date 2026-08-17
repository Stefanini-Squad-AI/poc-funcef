//******************************************************************************
// Data      : 04/05/2007
// Código    : AL_8
// Pendência : 25195
// SOL       : 53035
// Motivo    : Ajuste no SQL para eliminar o cartesiano causado pelo lote
//******************************************************************************
// Data      : 30/04/2007
// Código    : AL_7
// Pendência : 25195
// SOL       : 53035
// Motivo    : Passa a executar a consulta somente no botao de OK e
//              fechar a qry ao escolher novos filtros
//             Retirado o <= da data para = e trazer os saldos da data escolhida
//******************************************************************************
// Data      : 25/04/2007
// Código    : AL_6
// Pendência : 25195
// SOL       : 53035
// Motivo    : Implementação que permiti tirar o relatório agrupado pelas
//             carteiras.
//******************************************************************************
// Data     : 03/01/2007
// Código   : AL_5
// Pendencia: 24116
// Desc     : Ajuste nos filtros da tela.
//            Ajuste na dinâmica de funcionamento da tela
//******************************************************************************
// Data     : 05/10/2006
// Código   : Al_4
// Desc     : Ajuste na abertura da query e na busca por plano/patrocinadora
//******************************************************************************
// Data     : 05/10/2006
// Código   : Al_3
// Desc     : Ajuste na performance da query QryUltDataMov
//******************************************************************************
// Data      : 02/10/2006
// Código    : AL_2
// Pendencia : 22967
// Desc      : Segregação de Planos
//******************************************************************************
// Data     : 09/06/2006
// Código   : AL_1
// Desc     : Ajuste na consulta da carteira para não trazer duplicidade
//******************************************************************************
// Data     : 22/03/2005
// Descrição: Retirada do Emissor e alterado para deixar somente a
//            Quantidade Antiga, Nova e Total (Alteração no DFM).
//******************************************************************************

unit FConsCartRendVarCCI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DBTables, Db, Wwdatsrc, Wwquery, wwdblook,
  Grids, Wwdbigrd, Wwdbgrid, DBGrids, wwdbdatetimepicker, CMDateTimePicker,
  TREdit, FPreview, Menus, fcLabel, FOkCancelarInv, 
  //AL_6
  CheckLst;

type
  TfrmConsCartRendVarCCI = class(TfrmOkCancelarInv)
    qryConsCarteira: TwwQuery;
    //AL_6
    Label3: TLabel;
    qryEmissor: TwwQuery;
    qryEmissorSIGLAEMISSOR: TStringField;
    qryEmissorIDEMISSOR: TFloatField;
    pnlConsulta: TPanel;
    Label2: TLabel;
    //AL_6
    edData: TCMDateTimePicker;
    //AL_6
    Label4: TLabel;
    dblConsEmissor: TwwDBLookupCombo;
    dbGConsRVariavel: TwwDBGrid;
    QryUltDataMov: TwwQuery;
    //AL_6
    ToolbarSep972: TToolbarSep97;
    bt_Imprime: TBitBtn;
    ToolbarSep973: TToolbarSep97;
    Label5: TLabel;
    dblPlanoPrev: TwwDBLookupCombo;
    qryPlanoPrev: TwwQuery;
    qryPlanoPrevPLANPRVCONTABPATRO: TStringField;
    qryPlanoPrevPLANOCONTABIL: TStringField;
    qryPlanoPrevPATROCINADORA: TStringField;
    qryPlanoPrevIDPLANPREVCTBPATR: TFloatField;
    qryPlanoPrevIDPLANOPREV: TFloatField;
    qryPlanoPrevIDPATRO: TFloatField;
    CkLstCart: TCheckListBox;
    lblCarteira: TLabel;
    qryConsCarteiraID: TFloatField;
    qryConsCarteiraIDCARTEIRAINVEST: TFloatField;
    qryConsCarteiraIDCARTEIRAGERENC: TFloatField;
    qryConsCarteiraFLGCARTPROP: TFloatField;
    qryConsCarteiraDESCCARTINVEST: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    //AL_6
    procedure dblConsCarteiraCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure bbtnSairClick(Sender: TObject);
    procedure dblPlanoPrevExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure edDataEnter(Sender: TObject);
    procedure dblPlanoPrevChange(Sender: TObject);
    procedure dblPlanoPrevCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblPlanoPrevEnter(Sender: TObject);
    procedure dblConsCarteiraChange(Sender: TObject);
    procedure dblConsCarteiraEnter(Sender: TObject);
    procedure dblConsCarteiraExit(Sender: TObject);
    procedure dblConsEmissorChange(Sender: TObject);
    procedure dblConsEmissorEnter(Sender: TObject);
    procedure CkLstCartEnter(Sender: TObject);
  private
    Procedure AbreQuery;
    procedure FechaQuery(bEmissor: Boolean = False);
    procedure AbreEmissor;
    //AL_6
    procedure MontaCarteira;
    //AL_6        
    procedure MontaListCart;
    //AL_6
    function MontaQuery(dDataAntGroup, dDataAtuGroup: TDateTime;
                        sPlanPrevGroup, sCartInvestGroup, sCartGerGroup, sEmissorGroup,
                        sGroup, sCarteirasGroup: String): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsCartRendVarCCI: TfrmConsCartRendVarCCI;
  edDataAnt, dDtaAtual, dDtaAnterior: TDateTime;
  iPlanAnt, iCarteiraAnt, iEmissorAnt: Integer;
  //AL_6
  ListaGeral, ListaCartGer, ListaCarteiras, ListaCarteirasGer, ListaGeralDesc : TStringList;

implementation

{$R *.DFM}
Uses DBaseDados, UOperComum, UDiasUteisInv, UBibliotecaInvest, FDmRelConsCartRenVarCCI,
  //AL_6
  uString, FPrincipal, UMensErro;

Procedure TfrmConsCartRendVarCCI.AbreQuery;
begin
   //AL_5 - ini
   //Al_4
   if (Trim(edData.Text) <> '') then
   begin
      //AL_6
      MontaListCart;
      //AL_7
      dDtaAnterior := StrToDate(edData.Text) - 1;
      while not DiasUteisInv.DiaUtil(dDtaAnterior,-1,1,'',True,False,False) do
         dDtaAnterior := dDtaAnterior - 1;   // Achar o dia útil anterior

      DmRelConsCartRenVarCCI.qryConsCartRenVarCCI.Filter   := '';
      DmRelConsCartRenVarCCI.qryConsCartRenVarCCI.Filtered := False;
      OperComum.LimpaParametros(DmRelConsCartRenVarCCI.qryConsCartRenVarCCI);
      //AL_6
      if not MontaQuery(dDtaAnterior, edData.Date,
                        OperComum.IIF((Trim(dblPlanoPrev.Text) <> ''),dblPlanoPrev.LookupValue,''),
                        OperComum.IIF((ListaCarteiras.Count = 1), ListaCarteiras.Text,''),
                        OperComum.IIF((ListaCarteirasGer.Count = 1), ListaCarteirasGer.Text,''),
                        OperComum.IIF((Trim(dblConsEmissor.Text) <> ''),dblConsEmissor.LookupValue,''),
                        OperComum.IIF(((ListaCarteiras.Count > 1) and (ListaCarteiras.Count <> CkLstCart.Items.Count-1)),'S','A'),
                        ListaCarteiras.Text) then
      begin
         MsgDlg('Não foi possível executar a consulta!'+#13+
                'Entre em contato com um analista de sistemas da CM Soluções Informática!','Mensagem do Sistema',mtWarning,[MbOk],0);
         if edData.CanFocus then
            edData.SetFocus;
      end
      else
      begin
         if DmRelConsCartRenVarCCI.qryConsCartRenVarCCI.IsEmpty then
         begin
            MsgDlg('Nenhum saldo foi encontrado neste período !','Mensagem do Sistema',mtWarning,[MbOk],0);
            if edData.CanFocus then
               edData.SetFocus;
         end;
      end;
      DmRelConsCartRenVarCCI.qryConsCartRenVarCCI.EnableControls;
   end
   //AL_6
   else
   begin
      MsgDlg('Data não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if edData.CanFocus then
         edData.SetFocus;
   end;
end;

procedure TfrmConsCartRendVarCCI.FormCreate(Sender: TObject);
begin
   inherited;
   //AL_6
   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;
end;

procedure TfrmConsCartRendVarCCI.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   //AL_5
   FechaQuery;
   edData.Text := '';
   //AL_6
   dblConsEmissor.Text := '';
   edData.SetFocus;
   //AL_6
end;

procedure TfrmConsCartRendVarCCI.FormShow(Sender: TObject);
begin
   inherited;
   //AL_6
   ListaCarteiras    := TStringList.Create;
   ListaCarteirasGer := TStringList.Create;
   ListaGeral        := TStringList.Create;
   ListaCartGer      := TStringList.Create;
   ListaGeralDesc    := TStringList.Create;

   OperComum.LimpaParametros(qryEmissor);
   //AL_2
   qryEmissor.Open;
   qryPlanoPrev.Open;

   MontaCarteira;   
end;

procedure TfrmConsCartRendVarCCI.bt_ImprimeClick(Sender: TObject);
begin
   inherited;
   //AL_6                                 
   if not DmRelConsCartRenVarCCI.qryConsCartRenVarCCI.IsEmpty then
   begin
      DmRelConsCartRenVarCCI.qryConsCartRenVarCCI.DisableControls;
      if ((ListaCarteiras.Count > 1) and (ListaCarteiras.Count <> CkLstCart.Items.Count)) then
      begin
         DmRelConsCartRenVarCCI.lblDataGroup.Caption := edData.Text;
         TfrmPreview.CreateModalPreview(Application,
                                        DmRelConsCartRenVarCCI.rptConsCartRVCCIGroup,
                                        DmRelConsCartRenVarCCI.rptConsCartRVCCIGroup.PrinterSetup.DocumentName);
      end
      else
      begin
         DmRelConsCartRenVarCCI.lblData.Caption := edData.Text;
         TfrmPreview.CreateModalPreview(Application,
                                        DmRelConsCartRenVarCCI.rptConsCartRenVarCCI,
                                        DmRelConsCartRenVarCCI.rptConsCartRenVarCCI.PrinterSetup.DocumentName);
      end;
      DmRelConsCartRenVarCCI.qryConsCartRenVarCCI.EnableControls;
   end;
end;

procedure TfrmConsCartRendVarCCI.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
   inherited;
   //AL_2
   qryPlanoPrev.Close;
   //AL_5
   qryConsCarteira.Close;
   OperComum.LimpaParametros(DmRelConsCartRenVarCCI.qryConsCartRenVarCCI);
end;

//AL_6

procedure TfrmConsCartRendVarCCI.dblConsCarteiraCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   //AL_5
   if modified then
      FechaQuery;
end;

procedure TfrmConsCartRendVarCCI.bbtnSairClick(Sender: TObject);
begin
   DmRelConsCartRenVarCCI.qryConsCartRenVarCCI.Close;
   inherited;
end;

procedure TfrmConsCartRendVarCCI.dblPlanoPrevExit(Sender: TObject);
begin
   inherited;
end;

//AL_5
procedure TfrmConsCartRendVarCCI.bbtnConfirmarClick(Sender: TObject);
var x, j : Integer;
begin
  inherited;
   if (pRPI.FLGCARTGERENC = 'S') then
   begin
      j := 0;
      for x := 0 to (CkLstCart.Items.Count-1) do
      begin
         // Caso Checado incluir na lista
         if CkLstCart.Checked[x] then
            j := j + 1;
      end;
      if j > 1 then
      begin
         MsgDlg('Selecionar apenas uma Carteira de Investimentos!','Mensagem do Sistema',mtWarning,[MbOk],0);
         if CkLstCart.CanFocus then
            CkLstCart.SetFocus;
         exit;
      end;
   end;
   AbreQuery;
end;

//AL_5
procedure TfrmConsCartRendVarCCI.AbreEmissor;
begin
   if (Trim(edData.Text) <> '') then
   begin
      try
         OperComum.LimpaParametros(qryEmissor);
         qryEmissor.ParamByName('DATAATUAL').AsString    := edData.Text;
         if dblPlanoPrev.Text <> '' then
            qryEmissor.ParamByName('IDPLANPREVCTBPATR').AsInteger := qryPlanoPrev.FieldByName('IDPLANPREVCTBPATR').AsInteger;
      finally
         qryEmissor.Open;
      end;
   end;
end;

//AL_5
procedure TfrmConsCartRendVarCCI.FechaQuery(bEmissor: Boolean = False);
begin
   OperComum.LimpaParametros(DmRelConsCartRenVarCCI.qryConsCartRenVarCCI);

   //AL_6
   if not MontaQuery(-1, -1,'','','','','','') then
   begin
      MsgDlg('Não foi possível executar a consulta!'+#13+
             'Entre em contato com um analista de sistemas da CM Soluções Informática!','Mensagem do Sistema',mtWarning,[MbOk],0);
      if edData.CanFocus then
         edData.SetFocus;
   end
   else
   begin
      if Trim(dblConsEmissor.Text) <> '' then
         iEmissorAnt := qryEmissor.FieldByName('IDEMISSOR').asInteger;
      if not bEmissor then
      begin
         OperComum.LimpaParametros(qryEmissor);
         qryEmissor.Open;
         qryEmissor.First;
         if qryEmissor.Locate('IDEMISSOR', iEmissorAnt, []) then
         begin
            dblConsEmissor.Text := qryEmissor.FieldByName('SIGLAEMISSOR').AsString;
            dblConsEmissor.PerformSearch;
         end;
      end;
   end;      
end;

//AL_5
procedure TfrmConsCartRendVarCCI.edDataEnter(Sender: TObject);
begin
  inherited;
  DmRelConsCartRenVarCCI.qryConsCartRenVarCCI.Close;
end;

//AL_5
procedure TfrmConsCartRendVarCCI.dblPlanoPrevChange(Sender: TObject);
begin
  inherited;
end;

//AL_5
procedure TfrmConsCartRendVarCCI.dblPlanoPrevCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
end;

//AL_5
procedure TfrmConsCartRendVarCCI.dblPlanoPrevEnter(Sender: TObject);
begin
  inherited;
  DmRelConsCartRenVarCCI.qryConsCartRenVarCCI.Close;
end;

//AL_5
procedure TfrmConsCartRendVarCCI.dblConsCarteiraChange(Sender: TObject);
begin
  inherited;
   FechaQuery;
end;

//AL_5
procedure TfrmConsCartRendVarCCI.dblConsCarteiraEnter(Sender: TObject);
begin
  inherited;
  iCarteiraAnt := qryConsCarteira.FieldByName('IDCARTEIRAINVEST').asInteger;
end;

//AL_5
procedure TfrmConsCartRendVarCCI.dblConsCarteiraExit(Sender: TObject);
begin
  inherited;
  if iCarteiraAnt <> qryConsCarteira.FieldByName('IDCARTEIRAINVEST').asInteger then
     FechaQuery;
end;

//AL_5
procedure TfrmConsCartRendVarCCI.dblConsEmissorChange(Sender: TObject);
begin
  inherited;
end;

//AL_5
procedure TfrmConsCartRendVarCCI.dblConsEmissorEnter(Sender: TObject);
begin
  inherited;
  DmRelConsCartRenVarCCI.qryConsCartRenVarCCI.Close;
end;

//AL_6
procedure TfrmConsCartRendVarCCI.MontaListCart;
var
   sLine : String;
   x, j : integer;
begin
   ListaCarteiras.Clear;
   ListaCarteirasGer.Clear;
   DmRelConsCartRenVarCCI.ppMemoGroup.Lines.Clear;
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
            if (ListaCarteiras.Count = 0) then
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
               if (j <> 2) Then
                  sLine := sLine + Espaco(' ', (60-Length(Trim(ListaGeralDesc.Strings[x]))+10));
            end;

            if (j = 2) Then
            begin
               DmRelConsCartRenVarCCI.ppMemoGroup.Lines.Add(sLine);
               sLine := '';
               j := 0;
            end;
         end;
      end;
      if (j > 0) Then
         DmRelConsCartRenVarCCI.ppMemoGroup.Lines.Add(sLine);
   end
   else
   begin
      j := 0;
      for x := 0 to (CkLstCart.Items.Count-1) do
      begin
         // Caso Checado incluir na lista
         if CkLstCart.Checked[x] then
         begin
            if (ListaCarteiras.Count = 0) or ((pRPI.FLGCARTGERENC = 'S') and (ListaCarteirasGer.Count = 0))then
            begin
               if (pRPI.FLGCARTGERENC = 'S') then
                  ListaCarteirasGer.Add(ListaCartGer.Strings[x])
               else
                  ListaCarteiras.Add(ListaGeral.Strings[x]);
               DmRelConsCartRenVarCCI.ppMemoGroup.Lines.Add(ListaGeralDesc.Strings[x]);
            end
            else
            begin
               ListaCarteiras.Add(',' + ListaGeral.Strings[x]);
               DmRelConsCartRenVarCCI.ppMemoGroup.Lines.Add(ListaGeralDesc.Strings[x]);
            end;
         end;
      end;
   end;
end;

//AL_6
function TfrmConsCartRendVarCCI.MontaQuery(dDataAntGroup, dDataAtuGroup : TDateTime;
                                            sPlanPrevGroup, sCartInvestGroup, sCartGerGroup, sEmissorGroup,
                                            sGroup, sCarteirasGroup : String) : Boolean;
begin
   try
      with DmRelConsCartRenVarCCI do
      begin
         OperComum.LimpaParametros(DmRelConsCartRenVarCCI.qryConsCartRenVarCCI);
         qryConsCartRenVarCCI.SQL.Clear;
         //AL_8
         qryConsCartRenVarCCI.SQL.Add('SELECT DESCCARTINVEST, PLANPRVCONTABPATRO, NOMEEMISSOR, DESCINVESTIMENTO, CODISIN, ');
         qryConsCartRenVarCCI.SQL.Add('       IDCARTEIRAINVEST, DATAMOVCARTINV, IDEMISSOR,');
         qryConsCartRenVarCCI.SQL.Add('       SUM(QTDE) AS QTDE,');
         qryConsCartRenVarCCI.SQL.Add('       SUM(QTDECC) AS QTDECC,');
         qryConsCartRenVarCCI.SQL.Add('       SUM(QTDECCI) AS QTDECCI,');
         qryConsCartRenVarCCI.SQL.Add('       SUM(QTDEANTERIOR) AS QTDEANTERIOR,');
         qryConsCartRenVarCCI.SQL.Add('       SUM(QTDECCANTERIOR) AS QTDECCANTERIOR,');
         qryConsCartRenVarCCI.SQL.Add('       SUM(QTDECCIANTERIOR) AS QTDECCIANTERIOR');
         qryConsCartRenVarCCI.SQL.Add('FROM (');
         qryConsCartRenVarCCI.SQL.Add('   SELECT DECODE('+QuotedStr(sGroup)+',''A'',DESCCARTINVEST,'''') AS DESCCARTINVEST, PLANPRVCONTABPATRO,');
         //AL_8
         qryConsCartRenVarCCI.SQL.Add('          NOMEEMISSOR, DESCINVESTIMENTO, CODISIN, IDEMISSOR, DATAMOVCARTINV,');
         qryConsCartRenVarCCI.SQL.Add('          DECODE('+QuotedStr(sGroup)+',''A'',IDCARTEIRAINVEST,1) AS IDCARTEIRAINVEST,');
         qryConsCartRenVarCCI.SQL.Add('          QTDE, QTDECC, QTDECCI, QTDEANTERIOR, QTDECCANTERIOR, QTDECCIANTERIOR');
         qryConsCartRenVarCCI.SQL.Add('   FROM (');
         qryConsCartRenVarCCI.SQL.Add('      SELECT DESCCARTINVEST, PLANPRVCONTABPATRO, NOMEEMISSOR, DESCINVESTIMENTO,');
         //AL_8
         qryConsCartRenVarCCI.SQL.Add('             CODISIN, DATAMOVCARTINV, IDEMISSOR, IDCARTEIRAINVEST,');
         qryConsCartRenVarCCI.SQL.Add('             QTDE, QTDECC, QTDECCI, QTDEANTERIOR, QTDECCANTERIOR, QTDECCIANTERIOR');
         qryConsCartRenVarCCI.SQL.Add('      FROM (');
         qryConsCartRenVarCCI.SQL.Add('         SELECT DISTINCT');
         if sCartGerGroup = '' then
            qryConsCartRenVarCCI.SQL.Add('            CA.DESCCARTINVEST AS DESCCARTINVEST,')
         else
            qryConsCartRenVarCCI.SQL.Add('            CG.DESCCARTGERENC AS DESCCARTINVEST,');
         qryConsCartRenVarCCI.SQL.Add('            PP.PLANPRVCONTABPATRO,');
         qryConsCartRenVarCCI.SQL.Add('            PS.NOME AS NOMEEMISSOR,');
         qryConsCartRenVarCCI.SQL.Add('            IV.DESCINVESTIMENTO,');
         qryConsCartRenVarCCI.SQL.Add('            IV.CODISIN,');
         //AL_8
         qryConsCartRenVarCCI.SQL.Add('            NVL(H1.SALDOQTDEINVCART,0) AS QTDE,');
         qryConsCartRenVarCCI.SQL.Add('            NVL(H1.SALDOQTDECPMF,0) AS QTDECC,');
         qryConsCartRenVarCCI.SQL.Add('            (NVL(H1.SALDOQTDEINVCART,0) - NVL(H1.SALDOQTDECPMF,0)) AS QTDECCI,');
         qryConsCartRenVarCCI.SQL.Add('            SALDOANTERIOR.SALDOQTDEINVCART AS QTDEANTERIOR,');
         qryConsCartRenVarCCI.SQL.Add('            SALDOANTERIOR.QTDECC AS QTDECCANTERIOR,');
         qryConsCartRenVarCCI.SQL.Add('            SALDOANTERIOR.QTDECCI AS QTDECCIANTERIOR,');
         qryConsCartRenVarCCI.SQL.Add('            H1.DATAMOVCARTINV, IV.IDEMISSOR,');
         qryConsCartRenVarCCI.SQL.Add('            H1.IDCARTEIRAINVEST');
         qryConsCartRenVarCCI.SQL.Add('         FROM');
         qryConsCartRenVarCCI.SQL.Add('            HISTCARTINV H1,');
         qryConsCartRenVarCCI.SQL.Add('           (SELECT HA.IDPLANPREVCTBPATR, HA.IDCARTEIRAINVEST, HA.IDINVESTIMENTO, HA.SALDOQTDEINVCART,');
         qryConsCartRenVarCCI.SQL.Add('               NVL(HA.SALDOQTDECPMF,0) AS QTDECC,');
         qryConsCartRenVarCCI.SQL.Add('              (NVL(HA.SALDOQTDEINVCART,0) - NVL(HA.SALDOQTDECPMF,0)) AS QTDECCI, HA.SALDOVLRINVCART');
         qryConsCartRenVarCCI.SQL.Add('            FROM HISTCARTINV HA');
         qryConsCartRenVarCCI.SQL.Add('            WHERE (HA.IDHISTCARTINV IN');
         qryConsCartRenVarCCI.SQL.Add('                   (SELECT MAX(HA2.IDHISTCARTINV)');
         qryConsCartRenVarCCI.SQL.Add('                    FROM HISTCARTINV HA2');
         qryConsCartRenVarCCI.SQL.Add('                    WHERE (HA2.IDTIPOINVEST = 2)');
         if trim(sPlanPrevGroup) = '' then
            qryConsCartRenVarCCI.SQL.Add('                       AND (HA2.IDPLANPREVCTBPATR > 0)')
         else
            qryConsCartRenVarCCI.SQL.Add('                       AND (HA2.IDPLANPREVCTBPATR = '+sPlanPrevGroup+')');
         if trim(sCartInvestGroup) = '' then
            qryConsCartRenVarCCI.SQL.Add('                       AND (HA2.IDCARTEIRAINVEST > 0)')
         else
            qryConsCartRenVarCCI.SQL.Add('                       AND (HA2.IDCARTEIRAINVEST = '+sCartInvestGroup+')');
         if trim(sCartGerGroup) = '' then
            qryConsCartRenVarCCI.SQL.Add('                       AND (HA2.IDCARTEIRAGERENC IS NULL)')
         else
            qryConsCartRenVarCCI.SQL.Add('                       AND (HA2.IDCARTEIRAGERENC = '+sCartGerGroup+')');
         qryConsCartRenVarCCI.SQL.Add('                      AND (HA2.DATAMOVCARTINV || HA2.IDINVESTIMENTO) IN');
         qryConsCartRenVarCCI.SQL.Add('                                (SELECT (MAX(HA3.DATAMOVCARTINV) || HA3.IDINVESTIMENTO)');
         qryConsCartRenVarCCI.SQL.Add('                                 FROM HISTCARTINV HA3');
         qryConsCartRenVarCCI.SQL.Add('                                 WHERE (HA3.IDTIPOINVEST = 2)');
         if trim(sPlanPrevGroup) = '' then
            qryConsCartRenVarCCI.SQL.Add('                                AND (HA3.IDPLANPREVCTBPATR > 0)')
         else
            qryConsCartRenVarCCI.SQL.Add('                                AND (HA3.IDPLANPREVCTBPATR = '+sPlanPrevGroup+')');
         if trim(sCartInvestGroup) = '' then
            qryConsCartRenVarCCI.SQL.Add('                                AND (HA3.IDCARTEIRAINVEST > 0)')
         else
            qryConsCartRenVarCCI.SQL.Add('                                AND (HA3.IDCARTEIRAINVEST = '+sCartInvestGroup+')');
         if trim(sCartGerGroup) = '' then
            qryConsCartRenVarCCI.SQL.Add('                                AND (HA3.IDCARTEIRAGERENC IS NULL)')
         else
            qryConsCartRenVarCCI.SQL.Add('                                AND (HA3.IDCARTEIRAGERENC = '+sCartGerGroup+')');
         //AL_7
         qryConsCartRenVarCCI.SQL.Add('                                AND (HA3.DATAMOVCARTINV = TO_DATE('+QuotedStr(DateToStr(dDataAntGroup))+',''DD/MM/YYYY''))');
         qryConsCartRenVarCCI.SQL.Add('                                 GROUP BY HA3.IDINVESTIMENTO)');
         qryConsCartRenVarCCI.SQL.Add('                    GROUP BY HA2.IDPLANPREVCTBPATR, HA2.IDCARTEIRAINVEST, HA2.IDINVESTIMENTO) )');
         qryConsCartRenVarCCI.SQL.Add('              AND (HA.SALDOVLRINVCART IS NOT NULL )) SALDOANTERIOR,');
         //AL_8
         qryConsCartRenVarCCI.SQL.Add('            INVESTIMENTO IV, CARTEIRAINVEST CA, CARTEIRAGERENC CG, PESSOA PS, VWPLANPREVCTBPATR PP');
         qryConsCartRenVarCCI.SQL.Add('         WHERE (H1.IDTIPOINVEST = 2)');
         if trim(sPlanPrevGroup) = '' then
            qryConsCartRenVarCCI.SQL.Add('           AND (H1.IDPLANPREVCTBPATR > 0)')
         else
            qryConsCartRenVarCCI.SQL.Add('           AND (H1.IDPLANPREVCTBPATR = '+sPlanPrevGroup+')');
         if trim(sCartInvestGroup) = '' then
            qryConsCartRenVarCCI.SQL.Add('           AND (H1.IDCARTEIRAINVEST > 0)')
         else
            qryConsCartRenVarCCI.SQL.Add('           AND (H1.IDCARTEIRAINVEST = '+sCartInvestGroup+')');
         if trim(sCartGerGroup) = '' then
            qryConsCartRenVarCCI.SQL.Add('           AND (H1.IDCARTEIRAGERENC IS NULL)')
         else
            qryConsCartRenVarCCI.SQL.Add('           AND (H1.IDCARTEIRAGERENC = '+sCartGerGroup+')');
         qryConsCartRenVarCCI.SQL.Add('           AND (H1.IDHISTCARTINV  IN');
         qryConsCartRenVarCCI.SQL.Add('                (SELECT MAX(H2.IDHISTCARTINV)');
         qryConsCartRenVarCCI.SQL.Add('                 FROM HISTCARTINV H2');
         qryConsCartRenVarCCI.SQL.Add('                 WHERE (H2.IDTIPOINVEST = 2)');
         if trim(sPlanPrevGroup) = '' then
            qryConsCartRenVarCCI.SQL.Add('                AND (H2.IDPLANPREVCTBPATR > 0)')
         else
            qryConsCartRenVarCCI.SQL.Add('                AND (H2.IDPLANPREVCTBPATR = '+sPlanPrevGroup+')');
         if trim(sCartInvestGroup) = '' then
            qryConsCartRenVarCCI.SQL.Add('                AND (H2.IDCARTEIRAINVEST > 0)')
         else
            qryConsCartRenVarCCI.SQL.Add('                AND (H2.IDCARTEIRAINVEST = '+sCartInvestGroup+')');
         if trim(sCartGerGroup) = '' then
            qryConsCartRenVarCCI.SQL.Add('                AND (H2.IDCARTEIRAGERENC IS NULL)')
         else
            qryConsCartRenVarCCI.SQL.Add('                AND (H2.IDCARTEIRAGERENC = '+sCartGerGroup+')');
         qryConsCartRenVarCCI.SQL.Add('                   AND (H2.DATAMOVCARTINV || H2.IDINVESTIMENTO) IN');
         qryConsCartRenVarCCI.SQL.Add('                            (SELECT (MAX(H3.DATAMOVCARTINV) || H3.IDINVESTIMENTO)');
         qryConsCartRenVarCCI.SQL.Add('                             FROM HISTCARTINV H3');
         qryConsCartRenVarCCI.SQL.Add('                             WHERE (H3.IDTIPOINVEST = 2)');
         if trim(sPlanPrevGroup) = '' then
            qryConsCartRenVarCCI.SQL.Add('                               AND (H3.IDPLANPREVCTBPATR > 0)')
         else
            qryConsCartRenVarCCI.SQL.Add('                               AND (H3.IDPLANPREVCTBPATR = '+sPlanPrevGroup+')');
         if trim(sCartInvestGroup) = '' then
            qryConsCartRenVarCCI.SQL.Add('                               AND (H3.IDCARTEIRAINVEST > 0)')
         else
            qryConsCartRenVarCCI.SQL.Add('                               AND (H3.IDCARTEIRAINVEST = '+sCartInvestGroup+')');
         if trim(sCartGerGroup) = '' then
            qryConsCartRenVarCCI.SQL.Add('                               AND (H3.IDCARTEIRAGERENC IS NULL)')
         else
            qryConsCartRenVarCCI.SQL.Add('                               AND (H3.IDCARTEIRAGERENC = '+sCartGerGroup+')');
         qryConsCartRenVarCCI.SQL.Add('                               AND	(H3.DATAMOVCARTINV  = TO_DATE('+QuotedStr(DateToStr(dDataAtuGroup))+',''DD/MM/YYYY''))');
         qryConsCartRenVarCCI.SQL.Add('                             GROUP BY H3.IDINVESTIMENTO)');
         qryConsCartRenVarCCI.SQL.Add('                 GROUP BY H2.IDPLANPREVCTBPATR, H2.IDCARTEIRAINVEST, H2.IDINVESTIMENTO))');
         qryConsCartRenVarCCI.SQL.Add('           AND (NVL(H1.SALDOQTDEINVCART,0)        <> 0)');
         if trim(sEmissorGroup) <> '' then
            qryConsCartRenVarCCI.SQL.Add('           AND (IV.IDEMISSOR = '+sEmissorGroup+')');
         qryConsCartRenVarCCI.SQL.Add('           AND (IV.IDINVESTIMENTO(+)              = H1.IDINVESTIMENTO)');
         qryConsCartRenVarCCI.SQL.Add('           AND (IV.IDEMISSOR                      = PS.IDPESSOA)');
         qryConsCartRenVarCCI.SQL.Add('           AND (CA.IDCARTEIRAINVEST(+)            = H1.IDCARTEIRAINVEST)');
         qryConsCartRenVarCCI.SQL.Add('           AND (CG.IDCARTEIRAGERENC(+)            = H1.IDCARTEIRAGERENC)');
         //AL_8
         qryConsCartRenVarCCI.SQL.Add('           AND (SALDOANTERIOR.IDCARTEIRAINVEST(+) = H1.IDCARTEIRAINVEST)');
         qryConsCartRenVarCCI.SQL.Add('           AND (SALDOANTERIOR.IDINVESTIMENTO(+)   = H1.IDINVESTIMENTO)');
         qryConsCartRenVarCCI.SQL.Add('           AND (SALDOANTERIOR.IDPLANPREVCTBPATR(+)= H1.IDPLANPREVCTBPATR)');
         qryConsCartRenVarCCI.SQL.Add('           AND (PP.IDPLANPREVCTBPATR              = H1.IDPLANPREVCTBPATR)');
         qryConsCartRenVarCCI.SQL.Add('         ORDER BY PLANPRVCONTABPATRO, DESCCARTINVEST, NOMEEMISSOR, IV.DESCINVESTIMENTO');
         if trim(sCarteirasGroup) = '' then
            qryConsCartRenVarCCI.SQL.Add('      )')
         else
            qryConsCartRenVarCCI.SQL.Add('      ) WHERE (IDCARTEIRAINVEST IN ('+sCarteirasGroup+') )');
         qryConsCartRenVarCCI.SQL.Add('     )');
         qryConsCartRenVarCCI.SQL.Add('    )');
         qryConsCartRenVarCCI.SQL.Add('GROUP BY PLANPRVCONTABPATRO, DESCCARTINVEST, NOMEEMISSOR, DESCINVESTIMENTO, DATAMOVCARTINV,');
         //AL_8
         qryConsCartRenVarCCI.SQL.Add('         CODISIN, IDCARTEIRAINVEST, IDEMISSOR');
         qryConsCartRenVarCCI.SQL.Add('ORDER BY PLANPRVCONTABPATRO, DESCCARTINVEST, NOMEEMISSOR, DESCINVESTIMENTO');
         qryConsCartRenVarCCI.Open;
      end;
      Result := True;
   except
      Result := False;
   end;
end;

//AL_6
Procedure TfrmConsCartRendVarCCI.MontaCarteira;
begin
   if (pRPI.FLGCARTGERENC = 'S') then
   begin
      with qryConsCarteira do
      begin
         Close;
         Sql.Clear;
         //AL_1
         Sql.Add('SELECT (IDCARTEIRAINVEST+IDCARTEIRAGERENC+100) AS ID,');
         Sql.Add('IDCARTEIRAINVEST, IDCARTEIRAGERENC, (0) AS FLGCARTPROP,');
         Sql.Add('DESCCARTGERENC AS DESCCARTINVEST FROM     ');
         Sql.Add('CARTEIRAGERENC ');
         Sql.Add('UNION                                     ');
         Sql.Add('SELECT (IDCARTEIRAINVEST) AS ID,');
         Sql.Add('IDCARTEIRAINVEST, 0 AS IDCARTEIRAGERENC, FLGCARTPROP,');
         Sql.Add('DESCCARTINVEST FROM  CARTEIRAINVEST WHERE');
         Sql.Add('IDTIPOINVEST = 2');
         Sql.Add('ORDER BY DESCCARTINVEST');
      end;
   end;
   qryConsCarteira.Open;

   ListaGeral.Clear;
   ListaCartGer.Clear;
   
   CkLstCart.Clear;

   while not qryConsCarteira.Eof do
   begin
      CkLstCart.Items.Add(Trim(qryConsCarteira.FieldByName('DESCCARTINVEST').AsString));
      CkLstCart.Checked[CkLstCart.Items.Count-1] := (qryConsCarteira.FieldByName('FLGCARTPROP').AsInteger = 1);

      if (pRPI.FLGCARTGERENC = 'S') then
          ListaCartGer.Add(qryConsCarteira.FieldByName('IDCARTEIRAGERENC').AsString);

      ListaGeral.Add(qryConsCarteira.FieldByName('IDCARTEIRAINVEST').AsString);
      ListaGeralDesc.Add(Trim(qryConsCarteira.FieldByName('DESCCARTINVEST').AsString));

      qryConsCarteira.Next;
   end;
end;

//AL_7
procedure TfrmConsCartRendVarCCI.CkLstCartEnter(Sender: TObject);
begin
  inherited;
   DmRelConsCartRenVarCCI.qryConsCartRenVarCCI.Close;
end;

end.
