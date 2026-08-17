//SOL 122382 Kintana 605342 Thiago Passos - 21/08/2009
//******************************************************************************
// Rotina     : bbtnConfirmarClick, RendaVariavel.SincronizacaCotacaoAcaoXCotacaoInvest,sbtnApagarClick
// SOL        : 122382
// Kintana    : 605342
// Data       : 21/08/2009
// Responsável: Thiago Passos
// Descrição  : Sincronização das Tabelas CotacaoAcao com CotacaoInvest
//******************************************************************************
// Rotina     : BuscaCotacaoRV
// SOL        : 92822
// Kintana    : 389089
// Data       : 27/08/2008 
// Responsável: André Luiz
// Descrição  : Instrução CGPC 025 que altera a precificação dos ativos de mercado a vista.
//******************************************************************************
// Data      : 10/10/2006
// Código    : AL_6
// Pendencia : 22856
// SOL       : 44804
// Desc      : Implementação na confirmação da cota para verificar se a data de
//             de cotação é menor que a data de fechamento e o valor alterado é
//             diferente.
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_5
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//*****************************************************************************
//Data	    : 06/03/2006
//Código    : Al_4
//Motivo(S) : Implementação da trava de fechamento de renda variavel
//********************************************************************************************************
//Data	    : 20/10/2005
//Codigo    : AL_3
//Função    : Crítica nos campos Média e Volume Negociado se em branco pois existe um default no Banco;
//********************************************************************************************************
//Data	    : 25/05/2005
//Codigo    : AL_2
//Função    : Implementação do teste de período contabil em 3 camadas
//********************************************************************************************************
//Data	    : 10/03/2005
//Código    : Al_1
//Descrição : Delimita para excluir apenas 60 dias antes do ultimo fechamento
//******************************************************************************
//Data	    : 19/05/2004
//Motivo(S) : Acerto nos SetFocus testado CanFocus
//******************************************************************************
//Data	    :29/04/2004
//Função    :bbtnConfirmar
//Motivo(S) :Retirada a deleção da cotafundo, por já existir na
//           RendaVariavel.MarcarFlagReproc
//******************************************************************************

unit FCadCotacaoAcao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, DBCtrls, TREdit,
  wwdblook, TB97Ctls, TB97Tlbr, wwdbedit, Grids, DBGrids, IvDictio,
  IvMulti, IvEMulti, Mask, wwdbdatetimepicker, CMDateTimePicker,
  CmEventosCadastro, ImgList, uCtrlInvContab, FCadastroCSInv, fcLabel,
  //André Luiz - 27/08/2008 - N. Sol 92822 -  N. Kintana 389089
  uCtrlPadroes;  

type
  TfrmCadCotacaoAcao = class(TfrmCadastroCSInv)
    QryBolsa: TwwQuery;
    QryAcao: TwwQuery;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DsAcao: TwwDataSource;
    QryBolsaIDBOLSAVALORES: TFloatField;
    QryBolsaSGLBOLSAVALORES: TStringField;
    QryAcaoIDACAO: TFloatField;
    QryAcaoCODTIPOACAO: TStringField;
    QryAcaoCODTIPODIREITO: TStringField;
    QryAcaoDESCINVESTIMENTO: TStringField;
    QryAcaoIDEMISSOR: TFloatField;
    QryAcaoIDMOEDACONTAB: TFloatField;
    QryAcaoMOEDESC: TStringField;
    QryAcaoQTDELOTE: TFloatField;
    QryAcaoSIGLAEMISSOR: TStringField;
    QryDelCotacaoInvest: TwwQuery;
    QryUpdParamInvest: TwwQuery;
    StringField1: TStringField;
    FloatField1: TFloatField;
    DBEdit5: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit7: TDBEdit;
    dbeMedia: TDBEdit;
    dbeVolNeg: TDBEdit;
    DBEdit6: TDBEdit;
    qryIDEMISSOR: TFloatField;
    qryIDBOLSAVALORES: TFloatField;
    qryDATACOTAACAO: TDateTimeField;
    qryIDACAO: TFloatField;
    qryVLRABERTURA: TFloatField;
    qryVLRFECHAMENTO: TFloatField;
    qryVLRMINIMA: TFloatField;
    qryVLRMAXIMA: TFloatField;
    qryVLRMEDIA: TFloatField;
    qryVOLNEGOCIADO: TFloatField;
    qryQTDELOTE: TFloatField;
    qryAuxiliar: TwwQuery;
    Label19: TLabel;
    DBlkBolsa: TwwDBLookupCombo;
    Label11: TLabel;
    DBLkAcao: TwwDBLookupCombo;
    Label10: TLabel;
    dbeEmissor: TDBEdit;
    Label14: TLabel;
    DBDdataAutoriza: TCMDateTimePicker;
    Label9: TLabel;
    dbeMoeda: TDBEdit;
    Label12: TLabel;
    dbeQtdLote: TDBEdit;
    procedure DBlkBolsaExit(Sender: TObject);
    procedure qryBeforePost(DataSet: TDataSet);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
  private
    { Private declarations }
    wCotacaoAnterior: Double;
  public
    wOrdMovInv : boolean;
    wIdInvest, wBolsa, wEmissor : string;
    wDtMov : TDateTime;
    wIDBolsa: integer;
    { Public declarations }
  end;

var
  frmCadCotacaoAcao: TfrmCadCotacaoAcao;
  Emissor : real;

implementation

uses UDiasUteisInv, dBaseDados, UOperComum, UmensErro, UBibliotecaInvest,
  URendaVariavel,
  //André Luiz - 27/08/2008 - N. Sol 92822 -  N. Kintana 389089
  uCtrlParamCotacaoRV;

{$R *.DFM}

procedure TfrmCadCotacaoAcao.CmeCadastroInsert(Sender: TObject);
var sSql : string ;
begin
   qry.Close;
   qry.Sql.Clear;
   sSql :=        'select CTA.IdEmissor,CTA.IdBolsaValores,CTA.DataCotaAcao,CTA.IdAcao, ';
   sSql := sSql + '       CTA.VlrAbertura, CTA.QTDELOTE, CTA.VlrFechamento,CTA.VlrMinima, ';
   sSql := sSql + '       CTA.VlrMaxima,CTA.VlrMedia,CTA.VolNegociado ';
   sSql := sSql + 'From   CotacaoAcao CTA ';
   sSql := sSql + 'Where  1 = 2 ';
   qry.SQL.Add(sSQL);
   qry.Open;
   inherited;
end;


procedure TfrmCadCotacaoAcao.CmeCadastroFind(Sender: TObject);
var
  sSql : string ;
begin
   if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
   begin
      qry.Close;
      qry.Sql.Clear;

      // Pegar o original
      sSql :=        'SELECT CTA.IDEMISSOR, CTA.IDBOLSAVALORES, CTA.DATACOTAACAO, CTA.IDACAO, CTA.VLRABERTURA, CTA.QTDELOTE, ';
      sSql := sSql + '       CTA.VLRFECHAMENTO, CTA.VLRMINIMA, CTA.VLRMAXIMA, CTA.VLRMEDIA, CTA.VOLNEGOCIADO, E.SIGLAEMISSOR ';
      sSql := sSql + 'FROM COTACAOACAO CTA, EMISSOR E ';
      sSql := sSql + 'WHERE  CTA.IDEMISSOR      = '''+MontaSelect.ValoresChave[0]+'''';
      sSql := sSql + '  AND  CTA.IDEMISSOR      = E.IDEMISSOR';
      sSql := sSql + '  AND  CTA.IDBOLSAVALORES = '''+MontaSelect.ValoresChave[1]+'''';
      sSql := sSql + '  AND  CTA.DATACOTAACAO   = TO_DATE ('''+MontaSelect.ValoresChave[2]+''',''dd/mm/yyyy'')';
      sSql := sSql + '  AND  CTA.IDACAO         = '''+MontaSelect.ValoresChave[3]+'''';

      Qry.SQL.Add(sSQL);
      Qry.Prepare;
      Qry.Open;

      inherited;
   end;
end;


procedure TfrmCadCotacaoAcao.DBlkBolsaExit(Sender: TObject);
begin
   inherited;
   QryAcao.ParamByName('BOLSA').Value := QryBolsa.FieldByName('IDBOLSAVALORES').Value;
   QryAcao.Close;
   QryAcao.Open;
end;

procedure TfrmCadCotacaoAcao.QryBeforePost(DataSet: TDataSet);
begin
   inherited;
// Transfere Dados
   Qry.FieldByName('IDEMISSOR').Value   := QryAcao.FieldByName('IDEMISSOR').asFloat;
   Qry.FieldByName('QTDELOTE').AsString := QryAcao.FieldByName('QTDELOTE').AsString;
end;

procedure TfrmCadCotacaoAcao.sbtnInserirClick(Sender: TObject);
begin
   inherited;
      // AL_4 - Controle de travamento
   if qry.State = dsInsert then
   begin
      DBDdataAutoriza.Text	:= FormatDateTime( 'dd/mm/yyyy',Date );
      qryAcao.Params.ParamByName('BOLSA').AsString := qry.FieldByName('IDBOLSAVALORES').AsString;
      qryAcao.Close;
      qryAcao.Open;
      if not(qryAcao.IsEmpty) then
         qryAcao.Locate('IDACAO',qry.FieldByName('IDACAO').AsInteger,[]);

      // Melhoria na movimentação  14/02/2001
      if wBolsa = '' then
      begin
         if DBlkBolsa.Canfocus then
            DBlkBolsa.SetFocus;
         DBDdataAutoriza.TabStop := True;
         end
      else begin
         // Posiciona a Bolsa
         qry.FieldByName('IDBOLSAVALORES').Value := wIDBolsa;
         DBlkBolsaExit(frmCadCotacaoAcao);
         // Posiciona a Data
         qry.FieldByName('DATACOTAACAO').Value := wDtMov;
         DBDdataAutoriza.Date := wDtMov;
         DBDdataAutoriza.Text := DateToStr(wDtMov);
         // Foca o Investimento
         DBDdataAutoriza.TabStop := False;
         if DBLkAcao.Canfocus then
            DBLkAcao.SetFocus;
      end;
      wCotacaoAnterior := 0;
   end;
end;

procedure TfrmCadCotacaoAcao.bbtnCancelarClick(Sender: TObject);
begin
   if ds.State = dsInsert then
      qryAcao.Close;
   inherited;
end;

procedure TfrmCadCotacaoAcao.sbtnProcurarClick(Sender: TObject);
begin
   inherited;
   if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
   begin
      qryAcao.ParamByName('BOLSA').value := qryBolsa.FieldByName('IDBOLSAVALORES').Value;
      qryAcao.Close;
      qryAcao.Open;
      qryAcao.Locate( 'IDACAO',qry.FieldByName('IDACAO').AsInteger,[]);
   end;
end;

procedure TfrmCadCotacaoAcao.bbtnConfirmarClick(Sender: TObject);
Var dDataAnt: TDateTime;
    iInvestimento: Integer;
    fVlrMedia: Double;
    mrResposta: TModalResult;
begin
   if Trim(DBlkBolsa.Text) = '' then
   begin
      ShowMessage('Bolsa de Valores deve ser Preenchida . ');
      if DBlkBolsa.Canfocus then
         DBlkBolsa.SetFocus;
      Exit;
   end else if Trim(DBLkAcao.Text) = '' then
   begin
      ShowMessage('Ação deve ser Preenchida . ');
      if DBLkAcao.Canfocus then
         DBLkAcao.SetFocus;
      Exit;
   end else if Trim(DBDdataAutoriza.Text) = '' then
   begin
      ShowMessage('Data da Cotação deve ser Preenchida . ');
      if DBDdataAutoriza.Canfocus then
         DBDdataAutoriza.SetFocus;
      Exit;
   end;
   //AL_3 Ini
   if Trim(dbeMedia.Text) = '' then
      dbeMedia.Text := '0';
   if Trim(dbeVolNeg.Text) = '' then
      dbeVolNeg.Text := '0';
   //AL_3 Fim

   //AL_6 - ini
   // AL_2 - Testa o Periodo Contabil
   if not CtrlInvContab.TestaPeriodo(DBDdataAutoriza.Text,
                                     //AL_5
                                     2) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      Exit;
   end;

   wDtMov        := StrToDate(DBDdataAutoriza.Text);
   wBolsa        := DBlkBolsa.Text;
   wIDBolsa      := QryBolsa.FieldByName('IDBOLSAVALORES').AsInteger;
   iInvestimento := qry.FieldByName('IDACAO').AsInteger;
   fVlrMedia     := qry.FieldByName('VLRMEDIA').AsFloat;

   mrResposta := 0;
   if ((DBDdataAutoriza.DateTime <= pRPI.DATAULTFECH) and (wCotacaoAnterior <> fVlrMedia)) then
      mrResposta := MsgDlg('Cotação Incluida em Data já Fechada. ' + #13 +
                           'Este Investimento será Reprocessado no próximo Fechamento.' + #13 +
                           'Continua?',
                           'Mensagem do Sistema', mtWarning, [mbYes, mbNo],0);
   if mrResposta = mrNo then
   begin
     if DBDdataAutoriza.Canfocus then
        DBDdataAutoriza.SetFocus;
     Exit;
   End;
   //Al_06 - Fim

   // Heranca
   Inherited;

   dDataAnt := StrToDate(DBDdataAutoriza.Text)-1;
   While not DiasUteisInv.DiaUtil(dDataAnt,-1,1,'',True,False,False) Do
      dDataAnt  := dDataAnt - 1;   // Achar o dia útil anterior

   if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

   // Só marca o flag se a data for anterior ou igual ao último fechamento
   if mrResposta = mrYes then
   begin
      if wCotacaoAnterior <> fVlrMedia then
      begin
         RendaVariavel.MarcarFlagReproc(iInvestimento, -1, -1, wDtMov);
         //Exclui o histórico de cotas da carteira gerencial para ser reprocessada ...
         // HistCota
         if wDtMov <= (pRPI.DATAULTFECH-60) then
            wDtMov := (pRPI.DATAULTFECH-60)+1;

         qryAuxiliar.Close;
         qryAuxiliar.SQL.Clear;
         qryAuxiliar.SQL.Text := 'DELETE FROM HISTCOTA WHERE '+
                                 '(DATAHISTCOTA >= TO_DATE('''+
                                  DateToStr(wDtMov)+''',''DD/MM/YYYY'')) ';
         qryAuxiliar.ExecSQL;
         qryAuxiliar.Close;
      end;
   end;

    //SOL 122382 Kintana 605342 Thiago Passos - 21/08/2009
   if not RendaVariavel.SincronizacaCotacaoAcaoXCotacaoInvest(iInvestimento,wDtMov) then
      begin
        ShowMessage('Erro na Sincronizacao entre a CotacaoAcao com a CotacaoInvest !');
        DtmBaseDados.dbBaseDados.Rollback;
        Abort;
      end;

   DtmBaseDados.dbBaseDados.Commit;

   wCotacaoAnterior := 0;

end;

procedure TfrmCadCotacaoAcao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Qry.Close;
  QryBolsa.Close;
  QryAcao.Close;
end;

procedure TfrmCadCotacaoAcao.FormShow(Sender: TObject);
Begin
  inherited;
  Qry.Open;
  QryBolsa.Open;
  QryAcao.ParamByName('BOLSA').AsString := Qry.FieldByName('IDBOLSAVALORES').AsString;
  QryAcao.Open;

  If wOrdMovInv = True Then
  Begin
     Qry.Locate('IDBOLSAVALORES;IDEMISSOR;DATACOTAACAO;IDACAO',
                 VarArrayOf([wBolsa, wEmissor, wDtMov, wIdInvest]),
                 [loPartialKey])
  End;
End;
procedure TfrmCadCotacaoAcao.sbtnApagarClick(Sender: TObject);
Var
   dDataAtual, dDataAnt : TDateTime;
   iIdAcao  : Integer;
begin

  // AL_4
  if RendaVariavel.VerEmAbertura then
  begin
     CmeCadastro.AtualizaBotoes(Self);
     Exit;
  end;

  iIdAcao      := QryAcao.FieldByName('IDACAO').AsInteger;

  dDataAtual   := StrToDate(DBDdataAutoriza.Text);

  dDataAnt     := dDataAtual - 1;
  While not DiasUteisInv.DiaUtil(dDataAnt,-1,1,'',True,False,False) Do
     dDataAnt  := dDataAnt - 1;   // Achar o dia útil anterior

  // AL_2 - Testa o Periodo Contabil
  if not CtrlInvContab.TestaPeriodo(DBDdataAutoriza.Text,
                                    //AL_5
                                    2) then
  begin
     MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     Exit;
  end;

  inherited;

  Try

    if not dtmBaseDados.dbBaseDados.InTransaction then
       dtmBaseDados.dbBaseDados.StartTransaction;

    QryDelCotacaoInvest.Close;
    QryDelCotacaoInvest.ParamByName('DATACOTACAO').AsDateTime   := dDataAtual;
    QryDelCotacaoInvest.ParamByName('IDINVESTIMENTO').AsInteger := iIdAcao;
    QryDelCotacaoInvest.ExecSql;

    RendaVariavel.MarcarFlagReproc(iIdAcao, -1, -1, dDataAtual);
    //SOL 122382 Kintana 605342 Thiago Passos - 21/08/2009
    if not RendaVariavel.SincronizacaCotacaoAcaoXCotacaoInvest(Qry.FieldbyName('idAcao').AsInteger,Qry.FieldbyName('DataCotaAcao').AsDateTime) then
      begin
        ShowMessage('Erro na Sincronizacao entre a CotacaoAcao com a CotacaoInvest !');
        DtmBaseDados.dbBaseDados.Rollback;
        Abort;
      end;
    DtmBaseDados.dbBaseDados.Commit;

  Except
     DtmBaseDados.dbBaseDados.Rollback;
     MsgDlg('Não é possível excluir essa Cotação.','Mensagem do Sistema',
               MtError,[MbOk],0);
  End;

end;

procedure TfrmCadCotacaoAcao.sbtnAlterarClick(Sender: TObject);
//André Luiz - 27/08/2008 - N. Sol 92822 -  N. Kintana 389089
var
 sCampo,sTipoCotacao : String;
 CtrlParamCotacaoRV  : TCtrlParamCotacaoRV;
begin
   inherited;
   //André Luiz - 27/08/2008 - N. Sol 92822 -  N. Kintana 389089
   CtrlParamCotacaoRV := TCtrlParamCotacaoRV.Create;
   CtrlParamCotacaoRV.InitializeAs(Padroes);

   sCampo := CtrlParamCotacaoRV.RetornaCotacaoVigente(DBDdataAutoriza.Date,sTipoCotacao);

   wCotacaoAnterior := qry.FieldByName(sCampo).AsFloat;

   FreeAndNil(CtrlParamCotacaoRV);
end;

end.
