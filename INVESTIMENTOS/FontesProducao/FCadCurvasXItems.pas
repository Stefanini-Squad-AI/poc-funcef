//******************************************************************************
//Data	     : 02/10/2007
//Codigo     : AL_4
//Pendência  : 26539
//SOL        :
//Função     : Alteração da qryRegra para fazer join direto com a paraminvest,
//               tornando desnecessário o Parametro de Tipo de Regra.
//             Erro no sql da qryRegra, filtrava o nome do grupo por um valor
//               fixo 'INVESTIMENTO' e na CBS estava cadastrado 'INVESTIMENTOS'
//******************************************************************************
//Data	     : 09/07/2007
//Codigo     : AL_3
//Pendência  : 25793
//SOL        :
//Função     : inserted value too large for column - qryCadastraItems (insert fora de ordem)
//             Precisa ter os campos do insert nomeados, em outra fundação a ordem de criação
//               dos campos pode ser outra e o erro persistirá.
//******************************************************************************
//Data	     : 04/06/2007
//Codigo     : AL_2
//Pendência  : 25309
//SOL        : 58642
//Função     : Implementação de novo flag para informar se exibe ou não o item na tela de
//             Operações.
//******************************************************************************
// Data      : 03/01/2007
// Código    : AL_28
// Pendencia : 23705
// SOL       : 40671
// Desc      : Implementação do ItemRenfix -22 na  qryCadastraItems
//              para Valor de Penhora com o Jurídico  na
//******************************************************************************
// Data      : 04/08/2004
// Código    : AL_1
// Função    :
// Motivo    : Controle do processo de abertura
//******************************************************************************
//Data	     : 29/06/2004
//Origem     : FUNCEF
//Query      : qryLKRegra, qryLKItem
//Motivo(S)  : Passado o Active da qry para 'False'
//******************************************************************************

unit FCadCurvasXItems;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMDetCSInv, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  fcLabel, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe, ExtCtrls, wwdblook, DBCtrls, Mask, wwdbedit,
  Wwdbspin, Wwdotdot, Wwdbcomb, faMensagem, dxCntner, dxExEdtr, dxEdLib,
  dxDBELib;

type
  TfrmCadCurvasXITems = class(TfrmCadastroMDetInv)
    dblCurva: TwwDBLookupCombo;
    Label1: TLabel;
    qryCurvas: TwwQuery;
    qryCurvasIDCURVARENFIX: TFloatField;
    qryCurvasDESCCURVARENFIX: TStringField;
    dblItem: TwwDBLookupCombo;
    dblRegra: TwwDBLookupCombo;
    dbsSeqCalculo: TwwDBSpinEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    qryItem: TwwQuery;
    qryItemIDITEMRENFIX: TFloatField;
    qryItemDESCITEMRENFIX: TStringField;
    qryRegra: TwwQuery;
    qryRegraIDREGRA: TFloatField;
    qryRegraNOMEREGRA: TStringField;
    qryMaxSeqCalc: TwwQuery;
    qryDetalheIDCURVARENFIX: TFloatField;
    qryDetalheIDITEMRENFIX: TFloatField;
    qryDetalheIDREGRA: TFloatField;
    qryDetalheFLGMOEDA: TStringField;
    qryDetalheFLGDESTACADO: TStringField;
    qryDetalheSEQCALCULO: TFloatField;
    qryLKItem: TwwQuery;
    qryLKItemIDITEMRENFIX: TFloatField;
    qryLKItemDESCITEMRENFIX: TStringField;
    qryLKRegra: TwwQuery;
    qryDetalheItem: TStringField;
    qryDetalheRegra: TStringField;
    qryCadastraItems: TwwQuery;
    qryMaxSeqCalcSEQ: TFloatField;
    qrySeqCalc: TwwQuery;
    qryBuscaOperCurva: TwwQuery;
    qryAux: TwwQuery;
    qryBuscaOperCurvaIDINVESTIMENTO: TFloatField;
    qryBuscaHist: TwwQuery;
    qryBuscaOperCurvaIDOPERRENFIX: TFloatField;
    qryDestacado: TwwQuery;
    qryDestacadoIDDESTACADO: TStringField;
    qryDestacadoDESTACADO: TStringField;
    qryDestacadoINDICE: TFloatField;
    fraMens: TfraMensagem;
    qryDetalheFLGCENTRALIZADO: TStringField;
    qryDetalheDESTACADO: TStringField;
    qryDetalheFLGEXIBENAOPER: TStringField;
    Label5: TLabel;
    dblDestacado: TwwDBLookupCombo;
    dbckMoeda: TDBCheckBox;
    chkExibe: TdxDBCheckEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure dblCurvaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure dblCurvaExit(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure dblCurvaEnter(Sender: TObject);
    procedure sbtnConsDetClick(Sender: TObject);
  private
    { Private declarations }
    sCurva: String;
    bTroca: Boolean;
    mrInsSeq: TModalResult;
    procedure Sel(Chave: Largeint);
    procedure HabBtDet;
    function VerificaCampos: Boolean;
    function CriaItem(sCurva, sItem: String; sRegra: String = 'NULL'): Boolean;
  public
    { Public declarations }
  end;

var
  frmCadCurvasXITems: TfrmCadCurvasXITems;

implementation

{$R *.DFM}

Uses uMensErro, UDataBase, uSistema, UBibliotecaInvest, UOperacaoInvest,
     fAguardeInv, DBaseDados, URendaFixa;

{ TfrmCadCurvasXITems }

procedure TfrmCadCurvasXITems.Sel(Chave: Largeint);
begin
   qryDetalhe.Close;
   qryDetalhe.ParamByName('IDCURVARENFIX').AsInteger := Chave;
   qryDetalhe.Open;
end;

procedure TfrmCadCurvasXITems.FormShow(Sender: TObject);
begin
  fraMens.Apaga;
  Sel(-1);
  qryCurvas.Open;
  qryItem.Open;
  //AL_4
  qryRegra.Open;
  inherited;
end;

procedure TfrmCadCurvasXITems.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryCurvas.Close;
  qryItem.Close;
  qryRegra.Close;
  inherited;
end;

procedure TfrmCadCurvasXITems.sbtnProcurarClick(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
   begin
      Sel(StrToInt(MontaSelect.ValoresChave[0]));
      dblCurva.LookupValue := MontaSelect.ValoresChave[0];
   end;
   pnlFundo.Enabled := True;
   pnlMestre.Enabled := True;
   tbcDetalhe.Enabled := True;
   pgctrlDetalhe.Enabled := True;

   sbtnInsDet.Enabled := False;
   sbtnAltDet.Enabled := False;
   if qryDetalhe.IsEmpty then
      sbtnExcluiDet.Enabled := False
   else sbtnExcluiDet.Enabled := False;

   bbtnOkDet.Enabled := False;
   bbtnCancelarDet.Enabled := False;
   bbtnVoltarDet.Enabled := False;

   HabBtDet;

   dblCurva.SetFocus;
end;

procedure TfrmCadCurvasXITems.bbtnOkDetClick(Sender: TObject);
var iSeqCalculo: Integer;
begin
   try
      try
         if not dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.StartTransaction;

         if not VerificaCampos then exit;
         iSeqCalculo := qryDetalheSEQCALCULO.AsInteger;
         if (iSeqCalculo > 0) and (mrInsSeq = mrYes) then
         begin
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('UPDATE CURVASXITEMRENFIX ');
            qryAux.SQL.Add('SET SEQCALCULO = SEQCALCULO + 1 ');
            qryAux.SQL.Add('WHERE IDCURVARENFIX = ' + dblCurva.LookupValue + ' ');
            qryAux.SQL.Add('  AND SEQCALCULO >= ' + IntToStr(iSeqCalculo));
            qryAux.ExecSQL;
         end;
         qryDetalheIDCURVARENFIX.AsString := dblCurva.LookupValue;
         if Trim(dblRegra.Text) <> '' then
            qryDetalheIDREGRA.AsString := dblRegra.LookupValue
         else
            qryDetalheIDREGRA.Clear;

         //Cancela o Repetir Inserir
         CmeDetalhe.RepetirInsert := False;

         inherited;

         // Chama rotina para inserir o item no histórico
         if not CriaItem(dblCurva.LookupValue, dblItem.LookupValue, dblRegra.LookupValue) then
            Raise Exception.Create('Erro na Inclusão deste Item nas operações existentes');

         dtmBaseDados.dbBaseDados.Commit;
         AplicaAlteracoes([qryDetalhe]);

      except on E: Exception do
         begin
            dtmBaseDados.dbBaseDados.Rollback;
            MsgDlg('Ocorreu um problema na Inclusão deste Item.' + #13 +
                   'Mensagem: ' + E.Message,'Mensagem do Sistema ',mtError,[mbOK],0);
         end;
      end;
   finally
      qryItem.Close;
      qryItem.Open;
      Sel(StrToInt(dblCurva.LookupValue));
      HabBtDet;
   end;
end;

function TfrmCadCurvasXITems.VerificaCampos: Boolean;
begin
   Result := False;
   mrInsSeq := mrNone;
   if Trim(dblCurva.Text) = '' then
   begin
      MsgDlg('Curva não Selecionada','Mensagem do Sistema',mtWarning,[MbOk],0);
      dblCurva.SetFocus;
      Exit;
   end;

   if Trim(dblItem.Text) = '' then
   begin
      MsgDlg('Item não Selecionada','Mensagem do Sistema',mtWarning,[MbOk],0);
      dblItem.SetFocus;
      Exit;
   end;

   // Verifica a sequência de cálculo
   qrySeqCalc.Close;
   qrySeqCalc.ParamByName('IDCURVARENFIX').AsInteger := qryCurvasIDCURVARENFIX.AsInteger;
   qrySeqCalc.ParamByName('IDITEMRENFIX').AsInteger := qryDetalheIDITEMRENFIX.AsInteger;
   qrySeqCalc.ParamByName('SEQCALCULO').AsFloat := dbsSeqCalculo.Value;
   qrySeqCalc.Open;

   if not qrySeqCalc.IsEmpty then
   begin
      mrInsSeq := MsgDlg('Já existe um Item com esta sequência de cálculo. Continua?', 'Insersão', mtConfirmation, [mbYes, mbNo],0);
      if mrInsSeq = mrNo then
      begin
         qrySeqCalc.Close;
         dbsSeqCalculo.SetFocus;
         Exit;
      end;
   end;
   qrySeqCalc.Close;

   Result := True;
end;


procedure TfrmCadCurvasXITems.sbtnInsDetClick(Sender: TObject);
begin
   inherited;
   // AL_1 - Controle do processo de abertura de renda fixa
   if qryDetalhe.State = dsInsert then
   begin
      qryItem.Close;
      qryItem.ParamByName('IDCURVARENFIX').AsString := dblCurva.LookupValue;
      qryItem.Open;

      qryMaxSeqCalc.Close;
      qryMaxSeqCalc.ParamByName('IDCURVARENFIX').AsString := dblCurva.LookupValue;
      qryMaxSeqCalc.Open;
      dbsSeqCalculo.Value := (qryMaxSeqCalc.FieldByName('SEQ').AsFloat + 1);

      qryDetalheFLGMOEDA.AsString := 'N';
      dbckMoeda.Checked := False;
      qryDetalheFLGCENTRALIZADO.AsString := 'N';

      dblItem.Enabled := True;
      dblItem.SetFocus;
   end;
end;

procedure TfrmCadCurvasXITems.HabBtDet;
begin
  if Trim(dblCurva.Text) = '' then
  begin
     sbtnInsDet.Enabled := False;
     sbtnAltDet.Enabled := False;
     sbtnExcluiDet.Enabled := False;
  end else begin
     sbtnInsDet.Enabled := True;
     sbtnAltDet.Enabled := True;
     sbtnExcluiDet.Enabled := True;
  end;
  dbsSeqCalculo.MinValue := 1;
end;

procedure TfrmCadCurvasXITems.sbtnExcluiDetClick(Sender: TObject);
var iSeqCalculo: Integer;
    mrResposta: TModalResult;
begin
   // AL_1 - Controle do processo de abertura de renda fixa
   // Não faz se estiver em Abertura
   if RendaFixa.VerEmAbertura then
      Exit;

   qryBuscaOperCurva.Close;
   qryBuscaOperCurva.ParamByName('IDCURVARENFIX').AsInteger := StrToInt(sCurva);
   qryBuscaOperCurva.Open;
   if not qryBuscaOperCurva.IsEmpty then
   begin
      MsgDlg('Já existem operações neste perfil.' + #13 +
             'Não será possível excluir o Item',
             'Exclusão', mtInformation, [mbOk],0);
      Exit;
   end;

   mrResposta := MsgDlg('Confirma a exclusão deste Item?', 'Exclusão', mtConfirmation, [mbYes, mbNo, mbCancel],0);
   if (mrResposta <> mrCancel) then
   begin
      if (not qryDetalhe.IsEmpty) then
      begin
         try
            if not dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.StartTransaction;

            iSeqCalculo := qryDetalheSEQCALCULO.AsInteger;
            inherited;
            if iSeqCalculo > 0 then
            begin
               qryAux.Close;
               qryAux.SQL.Clear;
               qryAux.SQL.Add('UPDATE CURVASXITEMRENFIX ');
               qryAux.SQL.Add('SET SEQCALCULO = SEQCALCULO - 1 ');
               qryAux.SQL.Add('WHERE IDCURVARENFIX = ' + dblCurva.LookupValue + ' ');
               qryAux.SQL.Add('  AND SEQCALCULO >= ' + IntToStr(iSeqCalculo));
               qryAux.ExecSQL;
            end;
            dtmBaseDados.dbBaseDados.Commit;
            AplicaAlteracoes([qryDetalhe]);
         except on E: Exception do
            begin
               dtmBaseDados.dbBaseDados.Rollback;
               MsgDlg('Ocorreu um problema na Exclusão deste Item.' + #13 +
                      'Mensagem: ' + E.Message,'Mensagem do Sistema ',mtError,[mbOK],0);
            end;
         end;
      end;
   end;
   HabBtDet;
end;

procedure TfrmCadCurvasXITems.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  HabBtDet;
end;

procedure TfrmCadCurvasXITems.sbtnAltDetClick(Sender: TObject);
begin
  qryItem.Close;
  qryItem.ParamByName('IDCURVARENFIX').AsInteger := -1;
  qryItem.Open;
  dblItem.Enabled := False;

  if qryDetalheFLGCENTRALIZADO.IsNull then
  begin
     qryDestacado.First;
     dblDestacado.Text := qryDestacadoDESTACADO.AsString;
     dblDestacado.PerformSearch;
  end;

  inherited;
end;

procedure TfrmCadCurvasXITems.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  HabBtDet;
end;

procedure TfrmCadCurvasXITems.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  if dblCurva.CanFocus then
     dblCurva.SetFocus;
end;

procedure TfrmCadCurvasXITems.dblCurvaEnter(Sender: TObject);
begin
   inherited;
   if Trim(dblCurva.Text) = '' then
      sCurva := ''
   else
      sCurva := dblCurva.LookupValue;
   bTroca := True;
end;

procedure TfrmCadCurvasXITems.dblCurvaCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  if modified then
  begin
     bTroca := True;
     if sCurva <> '' then
     begin
        qrySeqCalc.Close;
        qrySeqCalc.ParamByName('IDCURVARENFIX').AsString := sCurva;
        qrySeqCalc.ParamByName('SEQCALCULO').AsFloat := 0;
        qrySeqCalc.Open;

        if not qrySeqCalc.IsEmpty then
        begin
           MsgDlg('Ainda existem Items com sequência de cálculo 0 (zero) neste Perfil. Favor Ajustá-los','Mensagem do Sistema',mtWarning,[MbOk],0);
           bTroca := False
        end;

        qrySeqCalc.Close;
     end;

     if (Trim(dblCurva.Text) <> '') and (bTroca) then
     begin
        qryCadastraItems.Close;
        qryCadastraItems.ParamByName('IDCURVARENFIX').AsString := dblCurva.LookupValue;
        qryCadastraItems.ParamByName('DTINCLUSAO').AsDateTime := Now();
        qryCadastraItems.ParamByName('USERINCLUSAO').AsInteger := Sistema.IdUsuario;
        qryCadastraItems.Prepare;
        qryCadastraItems.ExecSQL;
        Sel(StrToInt(dblCurva.LookupValue));
        sCurva := dblCurva.LookupValue;
     end else begin
        if sCurva <> '' then
           Sel(StrToInt(sCurva))
        else
           Sel(-1);
        dblCurva.LookupValue := sCurva;
     end;
  end;
  inherited;
  HabBtDet;
end;

procedure TfrmCadCurvasXITems.dblCurvaExit(Sender: TObject);
begin
  inherited;
  HabBtDet;
end;

function TfrmCadCurvasXITems.CriaItem(sCurva, sItem: String; sRegra: String = 'NULL'): Boolean;
var wOper, wInvest, wIdHist, sPerc: String;
    iMaxOper, iPosOper: Integer;
begin

   Result := True;

   qryBuscaOperCurva.Close;
   qryBuscaOperCurva.ParamByName('IDCURVARENFIX').AsInteger := StrToInt(sCurva);
   qryBuscaOperCurva.Open;

   // Se não houverem Operações para esta Curva abandona a rotina com Result True
   if qryBuscaOperCurva.IsEmpty then
      Exit;

   try // Finally
      fraMens.Mostra;
      try // Except
         iPosOper := 0;
         fraMens.Pos := iPosOper;
         iMaxOper := qryBuscaOperCurva.RecordCount;
         fraMens.Max := iMaxOper;

         while not qryBuscaOperCurva.Eof do
         begin
            fraMens.Mes := 'Incluindo Item nas Operações deste Perfil... ';
            wOper := qryBuscaOperCurva.FieldByName('IDOPERRENFIX').AsString;
            wInvest := qryBuscaOperCurva.FieldByName('IDINVESTIMENTO').AsString;

            // Verifica se o Item já existe nas Operações
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('SELECT IDOPERRENFIX ');
            qryAux.SQL.Add('FROM OPERRENFIXXCURVAS ');
            qryAux.SQL.Add('WHERE IDOPERRENFIX = '  + wOper  + ' AND ');
            qryAux.SQL.Add('      IDCURVARENFIX = ' + sCurva + ' AND ');
            qryAux.SQL.Add('      IDITEMRENFIX = '  + sItem );
            qryAux.Open;

            if sItem = '-15' then
               sPerc := '0'
            else
               sPerc := '100';

            // Se não existir o Item, inserir
            if qryAux.IsEmpty then
            begin
               qryAux.Close;
               qryAux.SQL.Clear;
               qryAux.SQL.Add('INSERT INTO OPERRENFIXXCURVAS ');
               qryAux.SQL.Add('  (IDOPERRENFIX, IDCURVARENFIX, IDITEMRENFIX, MOECODIGO, VLRCURVA, PERCCURVA) ');
               qryAux.SQL.Add('VALUES ');
               qryAux.SQL.Add('  (' + wOper + ', ' + sCurva + ', ' + sItem + ', NULL, 0, ' + sPerc + ')');
               qryAux.ExecSQL;
            end;

            // Seleciona Todos os Históricos para esta Operação neste Investimento
            qryBuscaHist.Close;
            qryBuscaHist.SQL.Clear;
            qryBuscaHist.SQL.Add('SELECT DISTINCT IDHISTRENFIX ');
            qryBuscaHist.SQL.Add('FROM HISTRENFIXXITENS ');
            qryBuscaHist.SQL.Add('WHERE IDHISTRENFIX IN (SELECT IDHISTRENFIX ');
            qryBuscaHist.SQL.Add('                       FROM HISTRENFIX ');
            qryBuscaHist.SQL.Add('                       WHERE IDINVESTIMENTO = ' + wInvest );
            qryBuscaHist.SQL.Add('                         AND IDOPERRENFIXAPLIC = ' + wOper + ')');
            qryBuscaHist.Open;

            fraMens.Max := qryBuscaHist.RecordCount;
            fraMens.Pos := 0;
            fraMens.Mes := 'Incluindo Item nos Históricos deste Perfil... ';

            while not qryBuscaHist.Eof do
            begin
               wIdHist := qryBuscaHist.FieldByName('IDHISTRENFIX').AsString;
               qryAux.Close;
               qryAux.SQL.Clear;
               qryAux.SQL.Add('SELECT IDHISTRENFIX ');
               qryAux.SQL.Add('FROM HISTRENFIXXITENS ');
               qryAux.SQL.Add('WHERE IDHISTRENFIX = ' + wIdHist + ' AND ');
               qryAux.SQL.Add('      IDITEMRENFIX = ' + sItem );
               qryAux.Open;

               // Se o Item não existir, Inserir
               if qryAux.IsEmpty then
               begin
                  if Trim(sRegra) = '' then
                     sRegra := 'NULL';
                  qryAux.Close;
                  qryAux.SQL.Clear;
                  qryAux.SQL.Add('INSERT INTO HISTRENFIXXITENS ');
                  qryAux.SQL.Add('  (IDHISTRENFIX, IDCURVARENFIX, IDITEMRENFIX, PUITEM, PUACUITEM, IDREGRACALCULO) ');
                  qryAux.SQL.Add('VALUES ');
                  qryAux.SQL.Add('  (' + wIdHist + ', ' + sCurva + ', ' + sItem + ', 0, 0, ' + sRegra + ')');
                  qryAux.ExecSQL;
               end;

               qryBuscaHist.Next;
               fraMens.Incrementa;
            end;

            fraMens.Max := iMaxOper;
            fraMens.Pos := iPosOper;

            qryBuscaOperCurva.Next;
            fraMens.Incrementa;
            Inc(iPosOper);
         end;
      except on E: Exception do
         begin
            fraMens.Apaga;
            Result := False;
            Exit;
         end;
      end;
   finally
      fraMens.Apaga;
   end;
end;

procedure TfrmCadCurvasXITems.sbtnConsDetClick(Sender: TObject);
begin
  inherited;
  qryItem.Close;
  qryItem.ParamByName('IDCURVARENFIX').AsInteger := -1;
  qryItem.Open;
  dblItem.Enabled := False;

  if qryDetalheFLGDESTACADO.IsNull then
  begin
     qryDestacado.First;
     dblDestacado.Text := qryDestacadoDESTACADO.AsString;
     dblDestacado.PerformSearch;
  end;

end;

end.
