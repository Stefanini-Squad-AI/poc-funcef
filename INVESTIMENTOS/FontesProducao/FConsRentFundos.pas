//******************************************************************************
// Data      : 26/07/2007
// Código    : AL_1
// Pendencia : 24874
// SOL       :
// Motivo    : Incluí os campos Rentabilidade Diária e Aplicação, Escolha de
//             plano/patrocinadora, Inclusão de regra para cálculo do índice
//******************************************************************************

unit FConsRentFundos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DBTables, Db, Wwdatsrc, Wwquery, wwdblook,
  Grids, Wwdbigrd, Wwdbgrid, DBGrids, wwdbdatetimepicker, CMDateTimePicker,
  TREdit, CheckLst, Spin, Menus, FPreview,
  //AL_1
  uCtrlParamInvest, URegra;

type
  TfrmConsRentFundos = class(TfrmOkCancelar)
    Label3: TLabel;
    bt_Imprime: TBitBtn;
    Panel11: TPanel;
    pnlTotal: TPanel;
    dbGConsRentFundos: TwwDBGrid;
    qryAux: TwwQuery;
    Label5: TLabel;
    qryConsMoeda: TwwQuery;
    qryConsMoedaMOEDESC: TStringField;
    qryConsMoedaCODTRATAIND: TStringField;
    qryConsMoedaMOECODIGO: TFloatField;
    redtTotal: TRealEdit;
    ToolbarSep972: TToolbarSep97;
    pmnuConsRentFundos: TPopupMenu;
    FixarColuna1: TMenuItem;
    LiberarColuna1: TMenuItem;
    LiberaTodasasColunas1: TMenuItem;
    N1: TMenuItem;
    QryVerSaldoFech: TwwQuery;
    QryUltDataFech: TwwQuery;
    //AL_1
    qryRegra: TwwQuery;
    qryRegraNOMEREGRA: TStringField;
    qryRegraIDREGRA: TFloatField;
    Panel3: TPanel;
    Panel2: TPanel;
    pnlConsulta: TPanel;
    Label2: TLabel;
    edData: TCMDateTimePicker;
    PnlRegra: TPanel;
    Label1: TLabel;
    dblkRegra: TwwDBLookupCombo;
    dblPlanoPatro: TwwDBLookupCombo;
    lblPlanoPatro: TLabel;
    qryPlanoPatro: TwwQuery;
    qryPlanoPatroPLANPRVCONTABPATRO: TStringField;
    qryPlanoPatroIDPLANPREVCTBPATR: TFloatField;
    qryPlanoPatroIDPLANOPREV: TFloatField;
    qryPlanoPatroIDPATRO: TFloatField;
    regRentabilidade: TRegra;
    spePercentual: TSpinEdit;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FixarColuna1Click(Sender: TObject);
    procedure LiberarColuna1Click(Sender: TObject);
    procedure pmnuConsRentFundosPopup(Sender: TObject);
    procedure LiberaTodasasColunas1Click(Sender: TObject);
    procedure dbGConsRentFundosDrawDataCell(Sender: TObject;
      const Rect: TRect; Field: TField; State: TGridDrawState);
    procedure edDataCloseUp(Sender: TObject);
    procedure edDataExit(Sender: TObject);
  private
    Procedure FazQuery;
    { Private declarations }
  public
    { Public declarations }
    wSaldoTot: Double;
    //AL_1
    sIndicador: String;
  end;

var
  frmConsRentFundos: TfrmConsRentFundos;

implementation

{$R *.DFM}
Uses DBaseDados, UOperComum, UDiasUteisInv, FDmRelatoriosFundos, uMensErro,
     UFuncoesRendaFixa, UBibliotecaInvest;

Procedure TfrmConsRentFundos.FazQuery;
Var
   dDtaIniMes, dDtaIniAno,
   //AL_1
   dDtaUtilAnt : TDateTime;
   wSaldo, wPatrimonio, wPerPL, wRentAno, wRentIndAno, wPerIndAno, wRentMes, wRentIndMes,
   wPerIndMes, wCotaIni, wCotaFim, wRentIndAnoDif, wRentIndMesDif,
   //AL_1
   wRentDiaria, wRentAplica: Double;
   Year, Month, Day: Word;
   //AL_1
   iPos: Word;

begin
   wRentIndAno := 0;
   wRentIndMes := 0;
   DmRelatoriosFundo.qryConsRentFundos.Close;
   DmRelatoriosFundo.qryConsRentFundos.DisableControls;
   DmRelatoriosFundo.qryConsRentFundos.Filtered := False;
   DmRelatoriosFundo.qryConsRentFundos.ParamByName('DATAMOVFUNDO').AsDateTime := edData.DateTime;
   //AL_1
   If dblPlanoPatro.Text <> '' then
      DmRelatoriosFundo.qryConsRentFundos.ParamByName('IDPLANPREVCTBPATR').AsInteger := qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger;

   DmRelatoriosFundo.qryConsRentFundos.Open;
   DmRelatoriosFundo.qryConsRentFundos.First;

   DecodeDate(edData.DateTime, Year, Month, Day);
   // Primeiro dia util do ano
   dDtaIniAno := DiasUteisInv.EnesimoDiaUtilMes(Year,1,1,-1,1,'',True,False,False);

   // Primeiro dia util do mes
   dDtaIniMes := DiasUteisInv.EnesimoDiaUtilMes(Year,Month,1,-1,1,'',True,False,False);

   //AL_1
   // Primeiro dia util anterior a data sugerida
   dDtaUtilAnt := DiasUteisInv.UltDiaUtilAnterior(edData.DateTime,-1{cidade},1{pais},''{estado},True,False,False);

   if frmConsRentFundos.pnlRegra.Visible then
   begin
      //Indice
      sIndicador :=  dblkRegra.Text;
      iPos := Pos('INV - ',sIndicador);
      if iPos > 0 then
         Delete(sIndicador, iPos, 6);
      sIndicador := ' ' + sIndicador;

      // Rentabilidade do Mes
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT ');
      qryAux.SQL.Add(QuotedStr(datetostr(dDtaIniMes)) + ' AS DATAINICIO, ');
      qryAux.SQL.Add(QuotedStr(edData.Text) + ' AS DATAFINAL, ');
      qryAux.SQL.Add(TrocaVirgulaPonto(spePercentual.Text) + ' AS PERCENTUAL, ');
      qryAux.SQL.Add('-1 AS IDCIDADES, ');
      qryAux.SQL.Add(' 1 AS IDPAIS, ');
      qryAux.SQL.Add(''' '' AS CODESTADO');
      qryAux.SQL.Add('FROM DUAL');
      qryAux.Open;

      // Chama regra de cálculo da Variação do Indice
      if Trim(dblkRegra.Text) <> '' then
      begin
         regRentabilidade.RuleName := qryRegraIDREGRA.AsString;
         regRentabilidade.QueryIn  := qryAux;
         try
            regRentabilidade.Execute;
         except
            on E:Exception do
            begin
               MsgDlg('Erro ao calcular a Variação do : ' + #13 +
                     //AL_1
                     '  ' + sIndicador + #13 +

                     'Regra: ' + #13 +
                     '  ' + qryRegraNOMEREGRA.AsString +
                     'Com a Mensagem:' + #13 +
                     '  ' + E.Message, 'Mensagem do Sistema', MtError,[MbOk],0);
               Exit;
            end;
         end;
         wRentIndMes := StrToFloat(TrocaPontoVirgula(regRentabilidade.Result));
      end;

      // Rentabilidade do Ano
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT ');
      qryAux.SQL.Add(QuotedStr(datetostr(dDtaIniAno)) + ' AS DATAINICIO, ');
      qryAux.SQL.Add(QuotedStr(edData.Text) + ' AS DATAFINAL, ');
      qryAux.SQL.Add(TrocaVirgulaPonto(spePercentual.Text) + ' AS PERCENTUAL, ');
      qryAux.SQL.Add('-1 AS IDCIDADES, ');
      qryAux.SQL.Add(' 1 AS IDPAIS, ');
      qryAux.SQL.Add(''' '' AS CODESTADO');
      qryAux.SQL.Add('FROM DUAL');
      qryAux.Open;

      // Chama regra de cálculo da Variação do Indice
      if Trim(dblkRegra.Text) <> '' then
      begin
         regRentabilidade.RuleName := qryRegraIDREGRA.AsString;
         regRentabilidade.QueryIn  := qryAux;
         try
            regRentabilidade.Execute;
         except
            on E:Exception do
            begin
               MsgDlg('Erro ao calcular a Variação do : ' + #13 +
                     //AL_1
                     '  ' + sIndicador + #13 +

                     'Regra: ' + #13 +
                     '  ' + qryRegraNOMEREGRA.AsString +
                     'Com a Mensagem:' + #13 +
                     '  ' + E.Message, 'Mensagem do Sistema', MtError,[MbOk],0);
               Exit;
            end;
         end;
         wRentIndAno := StrToFloat(TrocaPontoVirgula(regRentabilidade.Result));
      end;

   end;

   if wRentIndAno <> 0 then
      wRentIndAno := (wRentIndAno-1)*100;

   if wRentIndMes <> 0 then
      wRentIndMes := (wRentIndMes-1)*100;


   wSaldoTot := 0;

   while not DmRelatoriosFundo.qryConsRentFundos.Eof do
   begin
      // Saldo do Fundo na Data
      wSaldo := DmRelatoriosFundo.qryConsRentFundos.FieldByName('SALDOEM').AsFloat;
      wSaldoTot := wSaldoTot + wSaldo;

      // Busca Patrimonio do Fundo em uma Data
      if DmRelatoriosFundo.qryConsRentFundos.FieldByName('EXCLUSIVO').AsString = 'SIM' then
         wPatrimonio := wSaldo
      else
      begin
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add('SELECT VLRPATRIMONIO ' +
                        'FROM   PATRIMONIOFUNDO ' +
                        'WHERE  IDFUNDOINVEST  = ' + DmRelatoriosFundo.qryConsRentFundos.FieldByName('IDFUNDOINVEST').AsString + ' AND ' +
                        '       DATAREFERENCIA = TO_DATE(''' + edData.Text + ''',''DD/MM/YYYY'') ');
         qryAux.Open;

         wPatrimonio := qryAux.FieldByName('VLRPATRIMONIO').AsFloat;
      end;

      // Calcula o percentual sobre o patrimonio
      wPerPL := (OperComum.DivValorZero(wSaldo,wPatrimonio) * 100);


      // Calcula Rentabilidade no ano
      // Cota Inicial
      //AL_1
      wCotaIni := 0;
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT VLRCOTA ' +
                     'FROM   COTAFUNDO ' +
                     'WHERE  IDFUNDOINVEST = ' + DmRelatoriosFundo.qryConsRentFundos.FieldByName('IDFUNDOINVEST').AsString + ' AND ' +
                     '       DATACOTA      = TO_DATE(''' + DateToStr(dDtaIniAno) + ''',''DD/MM/YYYY'') ');
      qryAux.Open;
      wCotaIni := qryAux.FieldByName('VLRCOTA').AsFloat;

      if wCotaIni = 0 then
      begin
         if DmRelatoriosFundo.qryConsRentFundos.FieldByName('DATAAPLICACAO').AsDateTime > dDtaIniAno then
         begin
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('SELECT VLRCOTA ' +
                           'FROM   COTAFUNDO ' +
                           'WHERE  IDFUNDOINVEST = ' + DmRelatoriosFundo.qryConsRentFundos.FieldByName('IDFUNDOINVEST').AsString + ' AND ' +
                           '       DATACOTA      = TO_DATE(''' + DmRelatoriosFundo.qryConsRentFundos.FieldByName('DATAAPLICACAO').AsString + ''',''DD/MM/YYYY'') ');
            qryAux.Open;
            wCotaIni := qryAux.FieldByName('VLRCOTA').AsFloat;
         end
         else
         begin
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('SELECT VLRCOTA ' +
                           'FROM   COTAFUNDO ' +
                           'WHERE  IDFUNDOINVEST = ' + DmRelatoriosFundo.qryConsRentFundos.FieldByName('IDFUNDOINVEST').AsString + ' AND ' +
                           '       DATACOTA = (SELECT MIN(DATACOTA) FROM COTAFUNDO ' +
                                              'WHERE IDFUNDOINVEST = ' + DmRelatoriosFundo.qryConsRentFundos.FieldByName('IDFUNDOINVEST').AsString  + ' AND ' +
                                              'DATACOTA > TO_DATE(''' + DateToStr(dDtaIniAno) + ''',''DD/MM/YYYY'')) ');
            qryAux.Open;
            wCotaIni := qryAux.FieldByName('VLRCOTA').AsFloat;
         end;
      end;

       // Cota Final
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT VLRCOTA ' +
                     'FROM   COTAFUNDO ' +
                     'WHERE  IDFUNDOINVEST = ' + DmRelatoriosFundo.qryConsRentFundos.FieldByName('IDFUNDOINVEST').AsString + ' AND ' +
                     '       DATACOTA      = TO_DATE(''' + edData.Text + ''',''DD/MM/YYYY'') ');
      qryAux.Open;
      wCotaFim := qryAux.FieldByName('VLRCOTA').AsFloat;
      // Variação
      if (wCotaFim = 0) or (wCotaIni = 0) then
         wRentAno := 0
      else
         wRentAno := (OperComum.DivValorZero(wCotaFim,wCotaIni)-1)*100;

      //AL_1
      wCotaIni := 0;

      // Calcula Rentabilidade no Mes
      // Cota Inicial
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT VLRCOTA ' +
                     'FROM COTAFUNDO ' +
                     'WHERE IDFUNDOINVEST = ' + DmRelatoriosFundo.qryConsRentFundos.FieldByName('IDFUNDOINVEST').AsString + ' AND ' +
                     '      DATACOTA      = TO_DATE(''' + DateToStr(dDtaIniMes) + ''',''DD/MM/YYYY'') ');
      qryAux.Open;
      wCotaIni := qryAux.FieldByName('VLRCOTA').AsFloat;

      // Variação
      if (wCotaFim = 0) or (wCotaIni = 0) then
         wRentMes := 0
      else
         wRentMes := (OperComum.DivValorZero(wCotaFim,wCotaIni)-1)*100;

      //AL_1
      //Calcula a Rentabilidade da data da aplicacao
      wCotaIni := 0;
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT VLRCOTA ' +
                     'FROM   COTAFUNDO ' +
                     'WHERE  IDFUNDOINVEST = ' + DmRelatoriosFundo.qryConsRentFundos.FieldByName('IDFUNDOINVEST').AsString + ' AND ' +
                     '       DATACOTA      = TO_DATE(''' + DmRelatoriosFundo.qryConsRentFundos.FieldByName('DATAAPLICACAO').AsString + ''',''DD/MM/YYYY'') ');
      qryAux.Open;
      wCotaIni := qryAux.FieldByName('VLRCOTA').AsFloat;

      if wCotaIni = 0 then // Se não houver cota para o início da aplicação, vou pegar a primeira cota após a data da aplicação
      begin
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add('SELECT VLRCOTA ' +
                        'FROM   COTAFUNDO ' +
                        'WHERE  IDFUNDOINVEST = ' + DmRelatoriosFundo.qryConsRentFundos.FieldByName('IDFUNDOINVEST').AsString + ' AND ' +
                        '       DATACOTA = (SELECT MIN(DATACOTA) FROM COTAFUNDO ' +
                                           'WHERE IDFUNDOINVEST = ' + DmRelatoriosFundo.qryConsRentFundos.FieldByName('IDFUNDOINVEST').AsString  + ' AND ' +
                                           'DATACOTA > TO_DATE(''' + DmRelatoriosFundo.qryConsRentFundos.FieldByName('DATAAPLICACAO').AsString  + ''',''DD/MM/YYYY'')) ');
         qryAux.Open;
         wCotaIni := qryAux.FieldByName('VLRCOTA').AsFloat;

      end;
      // Variação da data da aplição
      if (wCotaFim = 0) or (wCotaIni = 0) then
         wRentAplica := 0
      else
         wRentAplica := (OperComum.DivValorZero(wCotaFim,wCotaIni)-1)*100;

      //AL_1
      //Calcula a Rentabilidade diaria da aplicacao
      wCotaIni := 0;
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT VLRCOTA ' +
                     'FROM   COTAFUNDO ' +
                     'WHERE  IDFUNDOINVEST = ' + DmRelatoriosFundo.qryConsRentFundos.FieldByName('IDFUNDOINVEST').AsString + ' AND ' +
                     '       DATACOTA      = TO_DATE(''' + datetostr(dDtaUtilAnt) + ''',''DD/MM/YYYY'') ');
      qryAux.Open;
      wCotaIni := qryAux.FieldByName('VLRCOTA').AsFloat;

      // Variação diaria da aplição
      if (wCotaFim = 0) or (wCotaIni = 0) then
         wRentDiaria := 0
      else
         wRentDiaria := (OperComum.DivValorZero(wCotaFim,wCotaIni)-1)*100;

      //***********************************************************************

      // Verifica se o inicio do Fundo é posterior ao inicio do ano
      if DmRelatoriosFundo.qryConsRentFundos.FieldByName('DATAINICIOFUNDO').AsDateTime >
         dDtaIniAno then
      begin
         //AL_1
         // Calculando a Rentabilidade do Indice da data do inicio do fundo
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add('SELECT ');
         qryAux.SQL.Add(QuotedStr(DmRelatoriosFundo.qryConsRentFundos.FieldByName('DATAINICIOFUNDO').AsString) + ' AS DATAINICIO, ');
         qryAux.SQL.Add(QuotedStr(edData.Text) + ' AS DATAFINAL, ');
         qryAux.SQL.Add(TrocaVirgulaPonto(spePercentual.Text) + ' AS PERCENTUAL, ');
         qryAux.SQL.Add('-1 AS IDCIDADES, ');
         qryAux.SQL.Add(' 1 AS IDPAIS, ');
         qryAux.SQL.Add(''' '' AS CODESTADO');
         qryAux.SQL.Add('FROM DUAL');
         qryAux.Open;

         if Trim(dblkRegra.Text) <> '' then
            begin
               regRentabilidade.RuleName := qryRegraIDREGRA.AsString;
               regRentabilidade.QueryIn  := qryAux;
               try
                  regRentabilidade.Execute;
               except
                  on E:Exception do
                  begin
                     MsgDlg('Erro ao calcular a Variação do : ' + #13 +
                            '  ' + sIndicador + #13 +
                            'Regra: ' + #13 +
                            '  ' + qryRegraNOMEREGRA.AsString +
                            'Com a Mensagem:' + #13 +
                            '  ' + E.Message, 'Mensagem do Sistema', MtError,[MbOk],0);
                     Exit;
                  end;
               end;
               wRentIndAnoDif := StrToFloat(TrocaPontoVirgula(regRentabilidade.Result));
            end;


         wRentIndAnoDif := (wRentIndAnoDif-1)*100;
         wPerIndAno := OperComum.DivValorZero(wRentAno, wRentIndAnoDif)*100;
      end // FIM
      else
         wPerIndAno := OperComum.DivValorZero(wRentAno, wRentIndAno)*100;

      // Verifica se o inicio do Fundo é posterior ao inicio do mês
      if DmRelatoriosFundo.qryConsRentFundos.FieldByName('DATAINICIOFUNDO').AsDateTime >
         dDtaIniMes then
      begin
         //AL_1
         // Calculando a Rentabilidade Mensal do Indice da data do inicio do fundo
         //AL_1
         // Calculando a Rentabilidade do Indice da data do inicio do fundo
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add('SELECT ');
         qryAux.SQL.Add(QuotedStr(DmRelatoriosFundo.qryConsRentFundos.FieldByName('DATAINICIOFUNDO').AsString) + ' AS DATAINICIO, ');
         qryAux.SQL.Add(QuotedStr(edData.Text) + ' AS DATAFINAL, ');
         qryAux.SQL.Add(TrocaVirgulaPonto(spePercentual.Text) + ' AS PERCENTUAL, ');
         qryAux.SQL.Add('-1 AS IDCIDADES, ');
         qryAux.SQL.Add(' 1 AS IDPAIS, ');
         qryAux.SQL.Add(''' '' AS CODESTADO');
         qryAux.SQL.Add('FROM DUAL');
         qryAux.Open;

         if Trim(dblkRegra.Text) <> '' then
            begin
               regRentabilidade.RuleName := qryRegraIDREGRA.AsString;
               regRentabilidade.QueryIn  := qryAux;
               try
                  regRentabilidade.Execute;
               except
                  on E:Exception do
                  begin
                     MsgDlg('Erro ao calcular a Variação do : ' + #13 +
                            '  ' + sIndicador + #13 +
                            'Regra: ' + #13 +
                            '  ' + qryRegraNOMEREGRA.AsString +
                            'Com a Mensagem:' + #13 +
                            '  ' + E.Message, 'Mensagem do Sistema', MtError,[MbOk],0);
                     Exit;
                  end;
               end;
               wRentIndMesDif := StrToFloat(TrocaPontoVirgula(regRentabilidade.Result));
            end;


         wRentIndMesDif := (wRentIndMesDif-1)*100;
         wPerIndMes := OperComum.DivValorZero(wRentMes, wRentIndMesDif)*100;
      end
      else
         wPerIndMes := OperComum.DivValorZero(wRentMes, wRentIndMes)*100;

      DmRelatoriosFundo.qryConsRentFundos.Edit;
      DmRelatoriosFundo.qryConsRentFundos.FieldByName('PATRIMONIO').AsFloat := wPatrimonio;
      DmRelatoriosFundo.qryConsRentFundos.FieldByName('PERPL').AsFloat      := wPerPL;
      DmRelatoriosFundo.qryConsRentFundos.FieldByName('RENTANO').AsFloat    := wRentAno;
      DmRelatoriosFundo.qryConsRentFundos.FieldByName('PERCDIANO').AsFloat  := wPerIndAno;
      DmRelatoriosFundo.qryConsRentFundos.FieldByName('RENTMES').AsFloat    := wRentMes;
      DmRelatoriosFundo.qryConsRentFundos.FieldByName('PERCDIMES').AsFloat  := wPerIndMes;
      DmRelatoriosFundo.qryConsRentFundos.FieldByName('RENTDIA').AsFloat    := wRentDiaria;
      DmRelatoriosFundo.qryConsRentFundos.FieldByName('RENTAPLICA').AsFloat    := wRentAplica;
      DmRelatoriosFundo.qryConsRentFundos.Post;
      DmRelatoriosFundo.qryConsRentFundos.Next;
   end;

   redtTotal.Value := wSaldoTot;

   DmRelatoriosFundo.qryConsRentFundos.Filtered := True;
   DmRelatoriosFundo.qryConsRentFundos.EnableControls;
   DmRelatoriosFundo.qryConsRentFundoTot.Close;
   DmRelatoriosFundo.qryConsRentFundoTot.ParamByName('DATAMOVFUNDO').AsDateTime     := edData.DateTime;
   //AL_1

   If dblPlanoPatro.Text <> '' then
      DmRelatoriosFundo.qryConsRentFundoTot.ParamByName('IDPLANPREVCTBPATR').AsInteger := qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger;

   DmRelatoriosFundo.qryConsRentFundoTot.Open;
   DmRelatoriosFundo.qryConsRentFundoTotCat.Close;
   DmRelatoriosFundo.qryConsRentFundoTotCat.ParamByName('DATAMOVFUNDO').AsDateTime  := edData.DateTime;
   //AL_1
   If dblPlanoPatro.Text <> '' then
      DmRelatoriosFundo.qryConsRentFundoTotCat.ParamByName('IDPLANPREVCTBPATR').AsInteger := qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger;


   DmRelatoriosFundo.qryConsRentFundoTotCat.Open;

   dbGConsRentFundos.FixedCols   := 0;
   LiberaTodasasColunas1.Enabled := False;
   LiberarColuna1.Enabled        := False;
   FixarColuna1.Enabled          := True;

end;

procedure TfrmConsRentFundos.FormCreate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := True;
  WindowState      := wsMaximized;
end;

procedure TfrmConsRentFundos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = VK_Return Then      //Enter - Troca de Campo
     SelectNext(ActiveControl,True,True)

end;

procedure TfrmConsRentFundos.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  If Trim(edData.Text) = '' then
  begin
    MsgDlg('Informe a Data de Referência.','Mensagem do Sistema',MtError,[MbOk],0);
    edData.SetFocus;
    exit;
  end;

  //AL_1

  if Trim(spePercentual.Text) = '' then
  begin
    MsgDlg('Informe o Índice Comparativo.','Mensagem do Sistema',MtError,[MbOk],0);
    spePercentual.SetFocus;
    exit;
  end;

  if Trim(dblPlanoPatro.Text) = '' then
  begin
    MsgDlg('Informe o Plano/Patrocinadora.','Mensagem do Sistema',MtError,[MbOk],0);
    dblPlanoPatro.SetFocus;
    exit;
  end;

  FazQuery;
end;

procedure TfrmConsRentFundos.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  DmRelatoriosFundo.qryConsRentFundos.Close;
  dbGConsRentFundos.FixedCols := 0;
  LiberaTodasasColunas1.Enabled := False;
  LiberarColuna1.Enabled := False;
  FixarColuna1.Enabled := False;

  edData.Text := '';
  //AL_1
  redtTotal.Clear;
  edData.SetFocus;
end;

procedure TfrmConsRentFundos.FormShow(Sender: TObject);
begin
  inherited;

  //Verifica a ultima data de fechamento do Fundo
  QryUltDataFech.Close;
  QryUltDataFech.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
  QryUltDataFech.ParamByName('IDTIPOFUNDOINVEST').Clear;
  QryUltDataFech.Open;
  While Not QryUltDataFech.Eof Do
  Begin
     edData.Text := QryUltDataFech.FieldByName('DATAULTFECH').AsString;
     edData.Repaint;

     //AL_1
     qryRegra.Close;
     //Passo o tipo de regra de rentabilidade para exibir somente regra de rentabilidade
     qryRegra.ParamByName('IDTIPOREGRA').AsInteger    :=  CtrlPInv.IdTipoRegraRent;
     qryRegra.Open;
     qryPlanoPatro.Open;
     if qryPlanoPatro.Locate('IDPLANPREVCTBPATR', CtrlPInv.IdPlanPrevCtbPatr, []) then
     begin
        dblPlanoPatro.Text := qryPlanoPatro.FieldByName('PLANPRVCONTABPATRO').AsString;
        dblPlanoPatro.PerformSearch;
     end;
     PnlRegra.Visible := (CtrlPInv.IdTipoRegraRent <> 0);

     //Verifica se há saldo para o plano patrocinadora escolhido pelo usuário na entrada
     // Porém não trava o relatório
     QryVerSaldoFech.Close;
     QryVerSaldoFech.ParamByName('IDFUNDOINVEST').Clear;
     QryVerSaldoFech.ParamByName('DATAMOVFUNDO').AsString       := edData.Text;
     QryVerSaldoFech.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
     QryVerSaldoFech.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
     QryVerSaldoFech.Open;
     If Not QryVerSaldoFech.IsEmpty Then
        QryUltDataFech.Last;
     QryUltDataFech.Next;

  End;

  If edData.Text = '' Then
  Begin
     edData.Text := DateToStr(Date);
     edData.Repaint;
  End;

  QryVerSaldoFech.Close;
  QryUltDataFech.Close;

  //AL_1

  redtTotal.Clear;
end;

procedure TfrmConsRentFundos.bt_ImprimeClick(Sender: TObject);
begin
  DmRelatoriosFundo.qryConsRentFundos.DisableControls;
  inherited;
  DmRelatoriosFundo.lblConsRentFndTotGer.Text := FloatToStrF( wSaldoTot,ffNumber,12,2 );
  DmRelatoriosFundo.lblConsRentFndDataRef.Text := edData.Text;
  //AL_1
  DmRelatoriosFundo.lblindicador.text := sIndicador;

  TfrmPreview.CreateModalPreview(Application,
                                 DmRelatoriosFundo.rptConsRentFundos,
                                 DmRelatoriosFundo.rptConsRentFundos.PrinterSetup.DocumentName);

  DmRelatoriosFundo.qryConsRentFundos.EnableControls;

end;

procedure TfrmConsRentFundos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DmRelatoriosFundo.qryConsRentFundos.Close;

  //AL_1
  qryRegra.Close;
  qryPlanoPatro.Close;
  //AL_1

end;

procedure TfrmConsRentFundos.FixarColuna1Click(Sender: TObject);
begin
  inherited;
  dbGConsRentFundos.FixedCols := dbGConsRentFundos.FixedCols + 1;
end;

procedure TfrmConsRentFundos.LiberarColuna1Click(Sender: TObject);
begin
  inherited;
  dbGConsRentFundos.FixedCols := dbGConsRentFundos.FixedCols - 1;
end;

procedure TfrmConsRentFundos.pmnuConsRentFundosPopup(Sender: TObject);
begin
  inherited;
  if dbGConsRentFundos.DataSource.DataSet.Active then
  begin
     if dbGConsRentFundos.FixedCols = 0 then begin
        LiberarColuna1.Enabled := False;
        LiberaTodasasColunas1.Enabled := False;
        end
     else begin
        LiberarColuna1.Enabled := True;
        LiberaTodasasColunas1.Enabled := True;
     end;

     if dbGConsRentFundos.FixedCols = dbGConsRentFundos.GetColCount then
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

procedure TfrmConsRentFundos.LiberaTodasasColunas1Click(Sender: TObject);
begin
  inherited;
  dbGConsRentFundos.FixedCols := 0;
end;

procedure TfrmConsRentFundos.dbGConsRentFundosDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
  if not ((gdSelected in State) or (gdFixed in State)) then
  begin
     if DmRelatoriosFundo.qryConsRentFundosCORCATEGFUNDO.AsInteger <> 0 then
        dbGConsRentFundos.Canvas.Brush.Color := DmRelatoriosFundo.qryConsRentFundosCORCATEGFUNDO.AsInteger
     else
        dbGConsRentFundos.Canvas.Brush.Color := clwhite;

        dbGConsRentFundos.DefaultDrawDataCell(Rect, Field, State);
  end
  else if (gdSelected in State) or (gdFocused in State) then
  begin
     if DmRelatoriosFundo.qryConsRentFundosCORCATEGFUNDO.AsInteger <> 0 then
        dbGConsRentFundos.Canvas.Font.Color := DmRelatoriosFundo.qryConsRentFundosCORCATEGFUNDO.AsInteger
     else
        dbGConsRentFundos.Canvas.Font.Color := clWhite;

     if (State = [gdSelected]) then
        dbGConsRentFundos.Canvas.Brush.Color := clNavy;

        dbGConsRentFundos.DefaultDrawDataCell(Rect, Field, State);
  end;

end;

procedure TfrmConsRentFundos.edDataCloseUp(Sender: TObject);
begin
  inherited;
  //AL_1
  // Se a data solicitada não for um dia útil, irei sugerir o ultimo dia útil anterior a data informada
  If Not (DiasUteisInv.DiaUtil(edData.DateTime,-1{cidade},1{pais},''{estado},True,False,False)) then
          edData.DateTime := DiasUteisInv.UltDiaUtilAnterior(edData.DateTime,-1{cidade},1{pais},''{estado},True,False,False);
end;

procedure TfrmConsRentFundos.edDataExit(Sender: TObject);
begin
  inherited;
  //AL_1
  // Se a data solicitada não for um dia útil, irei sugerir o ultimo dia útil anterior a data informada
  If Not (DiasUteisInv.DiaUtil(edData.DateTime,-1{cidade},1{pais},''{estado},True,False,False)) then
          edData.DateTime := DiasUteisInv.UltDiaUtilAnterior(edData.DateTime,-1{cidade},1{pais},''{estado},True,False,False);
end;

end.


