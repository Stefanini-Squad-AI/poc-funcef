//******************************************************************************
// Data      : 13/03/2007
// Código    : AL_16
// Motivo    : Ajuste na mensagem de reprocessamento
//******************************************************************************
// Data     : 24/11/2005
// Código   : AL_15
// Motivo   : Acerto na qry para passar os parametros IDTIPOINVEST, DATAINI e DATAINI
//            para aceitar NULL pois senão dá erro na impressao do Relatório do
//            FrmCadCotaFundo (Pois não tem período e tipoinvest)
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_14
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data      : 20/02/2005
// Código    : AL_13
// Motivo    : Implementação da verificação de processo de atualização em andamento
//******************************************************************************
// Data     : 20/10/2005
// Linha(s) : AL_12
// Motivo   : Ajustado O MONTASELECT para  nao trazer os fundos FIDC
//******************************************************************************
// Data     : 25/05/2005
// Linha(s) : AL_11
// Motivo   : Implementação do teste de período contabil em 3 camadas
//******************************************************************************
// Data     : 03/01/2004
// Alteração: ALT_10
// Motivo   : Correção no if quando for VALIA, estava diferente(<>) e passei para
//            igual(=)
//******************************************************************************
// Data     : 30/11/2004
// Alt_9
// Motivo   : Tratamento do Caption do Form quando for VALIA
//******************************************************************************
// Data     : 25/10/2004
// Alt_8
// Motivo   : Acerto na impressão dos períodos do relatório
//******************************************************************************
// Data     : 07/10/2004
// Linha(s) : Alt_7
// Motivo   : Tratamento para verificar duplicidade de Inserção
//******************************************************************************
// Data     : 06/10/2004
// Linha(s) : Alt_4
// Motivo   : Inclusão do campo DTAINIPROC na QryFundoInvest e na funcao Reprocessamento
//********************************************************************************************************
//Data    : 04/10/2004
//Código  : AL_3
//Função  : Acerto na crítica de Data
//********************************************************************************************************
//Data    : 17/09/2004
//Código  : AL_2
//Função  : Acerto de lay-out e refresh após Inclusão de Registros
//********************************************************************************************************
//Data    : 12/07/2004
//Código  : AL_1
//Função  : MontaSelect passa a forçar o cartesiano com as alterações no
//           cadastro de fundos e permitir procurar qualquer cota por qualquer nome.
//           Alterado no DFM a query do componente
//******************************************************************************
// Data	    :06/04/2004
// Origem   :FUNCEF
// Função   : bbtnOkDetClick
// LINHA(S) :203
// Motivo(S): Implementação do IDCOTAFUNDO
//********************************************************************************************************
//Data	 	 :      06/04/2004
//Função	 :      QryFundoInvest : para não trazer o IDTIPOINVEST = 9 (Fundo de Direito Creditório)
//                      qryDetalhe     : para não trazer as cotacoes com IDTIPOCOTA = NULL
//                      Troca do Icone da mensagem que estavam MTInformation Linhas : 190,221,270,358
//                      Acerto na máscara de exibição do campo VlrCota do MontaSelect
//                      Acerto no preenchimento da combo dblTipoCota após a volta do Procurar, Linha : 403
//                      Verificação de Cotação já cadastrada  na Inclusão : Linha 217
//********************************************************************************************************
{ AL_1 - Linha Extraida do Monta select para forçar o cartesiano com as alterações no
         cadastro de fundos e permitir procurar qualquer cota por qualquer nome.

  ( H.DTAVIGENCIA = (SELECT MAX(DTAVIGENCIA) FROM HISTFUNDOINVEST WHERE IDFUNDOINVEST = H.IDFUNDOINVEST AND DTAVIGENCIA < COTAFUNDO.DATACOTA+1) )

  AL_1 - Fim}

unit FCadCotaFundo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  wwdbedit, Mask, wwdblook, DBCtrls2, DBCtrls, wwdbdatetimepicker, FPreview,
  CMDateTimePicker, CmEventosCadastro, ImgList, TREdit, fcLabel, uCtrlInvContab;

type

//******************************************************************************
  TDadosCotas = Record
                 DataCota:TDate;
                 VlrCota :Double
                End;

//******************************************************************************

  TfrmCadCotaFundo = class(TfrmCadMestreDetalheCS)
    qryDetalhe: TwwQuery;
    dblInvest: TwwDBLookupCombo;
    Investimento: TLabel;
    QryFundoInvest: TwwQuery;
    Label2: TLabel;
    Label3: TLabel;
    qryDetalheIDFUNDOINVEST: TFloatField;
    qryDetalheDATACOTA: TDateTimeField;
    qryDetalheVLRCOTA: TFloatField;
    dsInvest: TwwDataSource;
    updDet: TUpdateSQL;
    QryFundoInvestIDFUNDOINVEST: TFloatField;
    QryFundoInvestDESCFUNDOINVEST: TStringField;
    QryFundoInvestIDGESTORCARTEIRA: TFloatField;
    QryFundoInvestTRGDTINCLUSAO: TDateTimeField;
    QryFundoInvestTRGUSERINCLUSAO: TStringField;
    QryFundoInvestMOECODIGO: TFloatField;
    QryFundoInvestIDCARTEIRAINVEST: TFloatField;
    QryFundoInvestIDTIPOFUNDOINVEST: TFloatField;
    QryFundoInvestCNPJFUNDO: TStringField;
    QryFundoInvestSTAEXCLUSIVO: TStringField;
    QryFundoInvestPZOCARENCIA: TFloatField;
    QryFundoInvestPZOANIVERSARIO: TFloatField;
    QryFundoInvestPZOLIQAPLIC: TFloatField;
    QryFundoInvestPZOLIQRESG: TFloatField;
    QryFundoInvestQTDDECQTD: TFloatField;
    QryFundoInvestQTDDECVALOR: TFloatField;
    QryFundoInvestSTAFUNDO: TStringField;
    QryFundoInvestPZOAMORTIZACAO: TFloatField;
    QryFundoInvestPERCTXPERFORM: TFloatField;
    QryFundoInvestPERCTXADM: TFloatField;
    QryFundoInvestCODFUNCETIP: TStringField;
    QryFundoInvestSTAPROVISIONAIR: TStringField;
    QryFundoInvestSTAPROVISIONAIOF: TStringField;
    QryFundoInvestCONTRCETIP: TStringField;
    dbdDta: TCMDateTimePicker;
    DbEdValorCota: TDBRealEdit;
    QryTipoFundoInvest: TwwQuery;
    QryAux: TwwQuery;
    Bevel1: TBevel;
    pnlTitulo: TPanel;
    lbNomItem: TfcLabel;
    qryDetalheIDCOTAFUNDO: TFloatField;
    QryTipoFundoInvestIDTIPOFUNDOINVEST: TFloatField;
    QryTipoFundoInvestIDTIPOINVEST: TFloatField;
    QryTipoFundoInvestDESCTIPOFUNDOINV: TStringField;
    QryTipoFundoInvestDATAULTFECH: TDateTimeField;
    QryTipoFundoInvestTRGDTINCLUSAO: TDateTimeField;
    QryTipoFundoInvestTRGUSERINCLUSAO: TStringField;
    QryFundoInvestDTAINIPROC: TDateTimeField;
    sbtnImprimir: TToolbarButton97;
    procedure FormShow(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure dbgrdDetDblClick(Sender: TObject);
    procedure dbdDtaChange(Sender: TObject);
    procedure dblInvestCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure DbEdValorCotaExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DbEdValorCotaKeyPress(Sender: TObject; var Key: Char);
    procedure dblInvestExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbtnImprimirClick(Sender: TObject);

  private
    { Private declarations }
    procedure ControlaBotoes;
  public
    { Public declarations }
  end;

var
  frmCadCotaFundo: TfrmCadCotaFundo;

implementation

uses UDataBase, uMensErro,UDiasUteisInv, UFundoComum, UBibliotecaInvest,
     UOperComum, FDmRelConsCotaFundo, USistema;

{$R *.DFM}

procedure TfrmCadCotaFundo.FormShow(Sender: TObject);
begin
// Abre Qry's
  QryFundoInvest.Close;
  QryFundoInvest.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
  QryFundoInvest.Open;
  qryDetalhe.Open;
// Mostra a Grid do Detalhe
  dbgrdDet.BringToFront;
  sbtnInsDet.Enabled := False;
  ControlaBotoes;
   //Alt_9
   // if Sistema.TipoCliente = 20041 then // VALIA (Padrao 5 somente)
   // ALT_10
   if Sistema.NumDocEmpresa = '42271429000163' then // VALIA
      lbNomItem.Caption := 'Cotas Legislação Societária';
end;

procedure TfrmCadCotaFundo.bbtnOkDetClick(Sender: TObject);
Var
   dDataAnt, dDataAlt, dDataFech, dDataUltFec : TDateTime;
   DadosCota : TDadosCota;
begin
  //AL_3
  if Trim(dbdDta.Text) = '' then
  begin
    MsgDlg('A Data da Cota não foi informada.', 'Atenção', MtWarning , [MbOk],0);
    if dbdDta.Canfocus then
       dbdDta.SetFocus;
    Exit;
  end;

  // AL_11
  //AL_14
  if not CtrlInvContab.TestaPeriodo(dbdDta.Text, iTipoInvestUsu) then
  begin
     MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if dbdDta.Canfocus then
        dbdDta.SetFocus;
     Exit;
  end;

  //AL_13
  if Trim(dblInvest.Text) = '' then
  begin
    MsgDlg('O Fundo não foi informado.', 'Atenção', MtWarning , [MbOk],0);
     if dblInvest.Canfocus then
        dblInvest.SetFocus;
     Exit;
  end;

  if Trim(DbEdValorCota.Text) = '' then
  begin
    MsgDlg('O Valor da Cota não foi informado.', 'Atenção', MtWarning , [MbOk],0);
    if DbEdValorCota.Canfocus then
       DbEdValorCota.SetFocus;
    Exit;
  end;

  //AL_13
  if VerEmAbertura(QryFundoInvestIDTIPOFUNDOINVEST.AsInteger) then
     Exit;  

  // Alt_7 - Testar se a chave já existe
  DadosCota := UFundoComum.BuscaCotaFundo(QryAux,
                                          StrToInt(dblInvest.LookupValue),
                                          StrToDate(dbdDta.Text));
  DadosCota.DataCota := QryAux.FieldByName('DATACOTA').AsDateTime;
  DadosCota.VlrCota  := QryAux.FieldByName('VLRCOTA').AsFloat;
  QryAux.Close;

  if (DadosCota.DataCota <> 0) and (qryDetalhe.State = dsInsert) Then
  begin
    MsgDlg('Já existe Cota para esta Data.', 'Atenção', MtWarning , [MbOk],0);
    if dbdDta.Canfocus then
       dbdDta.SetFocus;
    Exit;
  end;

  dDataAnt := dbdDta.Date - 1;
  While not DiasUteisInv.DiaUtil(dDataAnt,-1,1,'',True,False,False) Do
     dDataAnt  := dDataAnt - 1;   // Achar o dia útil anterior

  // Busca dados da Cota
  DadosCota := UFundoComum.BuscaCotaFundo(QryAux,
                                          StrToInt(dblInvest.LookupValue),
                                          dDataAnt);

  DadosCota.DataCota := QryAux.FieldByName('DATACOTA').AsDateTime;
  DadosCota.VlrCota  := QryAux.FieldByName('VLRCOTA').AsFloat;

  QryAux.Close;

  If ABS(DbEdValorCota.Value - DadosCota.VlrCota) > 1 Then
  Begin
     If MsgDlg('A Cota de hoje está com uma diferença de '+
         FloatToStrF(DbEdValorCota.Value - DadosCota.VlrCota,ffNumber,18,9)+' '#13+
            'comparada com a cota do dia anterior. '#13+
            'Confirma esse Valor de Cota?',
            'Mensagem do Sistema', MtConfirmation ,[mbYes, mbNo],0) = mrYes Then
     Else
     Begin
        if DbEdValorCota.CanFocus then
           DbEdValorCota.SetFocus;
        Exit;
     End;
  End;

  If DbEdValorCota.Value = 0 Then
  Begin
     If MsgDlg('O Valor da Cota não pode ser igual a Zéro.'+ #13+
            'Verifique.',
            'Mensagem do Sistema', MtWarning ,[mbOk],0) = mrYes Then
     Else
     Begin
        if DbEdValorCota.CanFocus then
           DbEdValorCota.SetFocus;
        Exit;
     End;
  End;

 // Altera a data do parâmetro devido o fechamento
  dDataUltFec   := StrToDate(dbdDta.Text)-1;
  While not DiasUteisInv.DiaUtil(dDataUltFec,-1,1,'',True,False,False) Do
     dDataUltFec := dDataUltFec - 1;   // Achar o dia útil anterior

  qryDetalheIDCOTAFUNDO.AsInteger  := LeUltRegistro(NIL,'COTAFUNDO');
  qryDetalheIDFUNDOINVEST.Value := strtoint(dblInvest.LookupValue);
  bbtnConfirmar.Enabled := True;
  pnlControlesDet.SendToBack;
  qryDetalhe.post;

  QryTipoFundoInvest.Close;
  QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger :=
                                        QryFundoInvestIDTIPOFUNDOINVEST.AsInteger;
  QryTipoFundoInvest.Open;

  //A_3
  dDataAlt := qryDetalheDATACOTA.AsDateTime;

  inherited;

  AplicaAlteracoes([qryDetalhe]);
  CmeDetalhe.Cancel(Self);

  qryDetalhe.Close;
  qryDetalhe.Open;

  sbtnInsDet.Enabled    := True;
  sbtnAltDet.Enabled    := True;
  sbtnExcluiDet.Enabled := True;

  //AL_3
  If dDataAlt <= QryTipoFundoInvestDATAULTFECH.AsDateTime Then
  begin
     //AL_4
     If Not Reprocessamento(iTipoInvestUsu,
                            QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                            QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger,
                            -1,
                            dDataAlt, //StrToDate(dbdDta.Text),
                            QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                            QryFundoInvest.FieldByName('DTAINIPROC').AsDateTime,
                            True) Then
        //AL_16                    
        MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
               'Mensagem do Sistema', MtInformation,[MbOk],0);
  end;

  QryTipoFundoInvest.Close;
  //AL_3
  if dbdDta.CanFocus then
     dbdDta.SetFocus;
end;

procedure TfrmCadCotaFundo.FormPaint(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled :=True;
  pnlMestre.Enabled:=True;
end;

procedure TfrmCadCotaFundo.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  QryDetalhe.Cancel;

  qryDetalhe.Close;
  qryDetalhe.ParambyName('DATACOTA').Clear;
  if Trim(dblInvest.Text) <> '' then
  begin
     qryDetalhe.ParambyName('IDFUNDOINVEST').AsString := dblInvest.LookupValue;
     qryDetalhe.Open;
     // Altera Formato do Valor da Cota
     DbEdValorCota.DecDigits   := QryFundoInvest.FieldByName('QTDDECVALOR').AsInteger;
  end
  else
  begin
     qryDetalhe.ParambyName('IDFUNDOINVEST').AsInteger := -1;
     qryDetalhe.Open;
  end;
  if DbEdValorCota.CanFocus then
     DbEdValorCota.SetFocus;
  
  sbtnInsDet.Enabled    := True;
  sbtnAltDet.Enabled    := True;
  sbtnExcluiDet.Enabled := True;
end;

procedure TfrmCadCotaFundo.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  sbtnInsDet.Enabled := True;
  DbEdValorCota.Clear;
  dbdDta.Clear;
  qryDetalheDATACOTA.Clear;
  qryDetalheVLRCOTA.Clear;
  if dbdDta.CanFocus then
     dbdDta.SetFocus;
end;

procedure TfrmCadCotaFundo.sbtnExcluiDetClick(Sender: TObject);
// AL_11
begin
   if (not qryDetalhe.IsEmpty) then
   begin
      // AL_11 - Inicio
      try
         // AL_11
         //AL_14
         if not CtrlInvContab.TestaPeriodo(QryDetalhe.FieldByName('DATACOTA').AsString, iTipoInvestUsu) then
         begin
            MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
            Exit;
         end;

         QryTipoFundoInvest.Close;
         QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger :=
                                            QryFundoInvestIDTIPOFUNDOINVEST.AsInteger;
         QryTipoFundoInvest.Open;

         If (QryDetalhe.FieldByName('DATACOTA').AsDateTime <=
             QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime) Then
         begin
            MsgDlg('Esse Fundo já foi Atualizado, não é possível excluir a Cota do Dia!',
                   'Mensagem do Sistema', MtInformation , [MbOk],0);
            Exit;
         end;

         if MsgDlg('Deseja realmente excluir este registro?', 'Exclusão',
                   mtConfirmation, [mbYes,mbNo],0) = mrYes Then
         Begin
           inherited;
           aplicaAlteracoes([qryDetalhe]);
         End;

         sbtnInsDet.Enabled    := True;
         sbtnAltDet.Enabled    := True;
         sbtnExcluiDet.Enabled := True;
         sbtnExcluiDet.Down    := False;
      finally
         QryTipoFundoInvest.Close;
      end;
      // AL_11 - Fim
   end;
end;

procedure TfrmCadCotaFundo.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  sbtnInsDet.Enabled    := True;
  sbtnAltDet.Enabled    := True;
  sbtnExcluiDet.Enabled := True;
end;

procedure TfrmCadCotaFundo.dbgrdDetDblClick(Sender: TObject);
begin
  inherited;
  sbtnAltDet.Click
end;

procedure TfrmCadCotaFundo.dbdDtaChange(Sender: TObject);
begin
  inherited;
  if DbEdValorCota.CanFocus then
     DbEdValorCota.setFocus;
end;

procedure TfrmCadCotaFundo.dblInvestCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   qryDetalhe.Close;
   qryDetalhe.ParambyName('DATACOTA').Clear;
   if Trim(dblInvest.Text) <> '' then
   begin
      qryDetalhe.ParambyName('IDFUNDOINVEST').AsString := dblInvest.LookupValue;
      qryDetalhe.Open;
      // Altera Formato do Valor da Cota
      DbEdValorCota.DecDigits   := QryFundoInvest.FieldByName('QTDDECVALOR').AsInteger;
   end
   else
   begin
      qryDetalhe.ParambyName('IDFUNDOINVEST').AsInteger := -1;
      qryDetalhe.Open;
   end;
   if DbEdValorCota.CanFocus then
      DbEdValorCota.SetFocus;
end;

procedure TfrmCadCotaFundo.sbtnProcurarClick(Sender: TObject);
begin
  inherited;

  if MontaSelect.RetornouValor then begin
     qryDetalhe.Close;
     qryDetalhe.ParambyName('IDFUNDOINVEST').asInteger := strtoint(montaSelect.ValoresChave[0]);
     qryDetalhe.ParambyName('DATACOTA').asString       := montaSelect.ValoresChave[1];
     qryDetalhe.Open;
     dblInvest.LookupValue := MontaSelect.ValoresChave[0];
     dblInvest.PerFormSearch;
  end;

  PnlFundo.Enabled :=True;
  pnlMestre.Enabled:=True;

  sbtnInsDet.Enabled    := True;
  sbtnAltDet.Enabled    := True;
  sbtnExcluiDet.Enabled := True;
  dblInvest.Enabled     := True;
// Altera Formato do Valor da Cota
   DbEdValorCota.DecDigits         := QryFundoInvestQTDDECVALOR.AsInteger;
   qryDetalheVLRCOTA.DisplayFormat := MontaMascaraDecVlr(QryFundoInvestIDFUNDOINVEST.AsInteger);
end;

procedure TfrmCadCotaFundo.DbEdValorCotaExit(Sender: TObject);

begin
//  inherited  
   If bbtnOkDet.CanFocus Then
      bbtnOkDet.SetFocus;
end;

procedure TfrmCadCotaFundo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  QryFundoInvest.Close;
  QryDetalhe.Close;
end;

procedure TfrmCadCotaFundo.DbEdValorCotaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  If Key = '.' Then Key := ',';
end;

procedure TfrmCadCotaFundo.dblInvestExit(Sender: TObject);
begin
  inherited;
   DbEdValorCota.DecDigits         := QryFundoInvestQTDDECVALOR.AsInteger;
   qryDetalheVLRCOTA.DisplayFormat := MontaMascaraDecVlr(QryFundoInvestIDFUNDOINVEST.AsInteger);
   ControlaBotoes;
   //AL_15
   if Trim(dblInvest.Text) = '' then
   begin
      OperComum.LimpaParametros(qryDetalhe);
      qryDetalhe.Open;
   end;
end;

procedure TfrmCadCotaFundo.FormCreate(Sender: TObject);
begin
  inherited;
  if iTipoInvestUsu <> 0 then
     MontaSelect.Filtro.Add('TIPOFUNDOINVEST.IDTIPOINVEST = ' + IntToStr(iTipoInvestUsu));
end;

procedure TfrmCadCotaFundo.ControlaBotoes;
begin
   sbtnInsDet.Enabled := (qryDetalhe.State = dsBrowse) and
                         (Trim(dblInvest.Text)<>'');
   sbtnAltDet.Enabled := (qryDetalhe.State = dsBrowse) and
                         (not qryDetalhe.IsEmpty);
   sbtnExcluiDet.Enabled := (qryDetalhe.State = dsBrowse) and
                            (not qryDetalhe.IsEmpty);
end;
procedure TfrmCadCotaFundo.FormActivate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := True;
  if dblInvest.CanFocus then
  dblInvest.SetFocus;
end;

procedure TfrmCadCotaFundo.sbtnImprimirClick(Sender: TObject);
var
  dDataIni, dDataFim : TDateTime;
begin
  inherited;
   //AL_15
   if Trim(dblInvest.Text) = '' then
   begin
     MsgDlg('O Fundo de Investimento não foi informado.', 'Atenção', MtWarning , [MbOk],0);
     if dblInvest.Canfocus then
        dblInvest.SetFocus;
     Exit;
     sbtnImprimir.Down := False;
   end;

   with DmRelConsCotaFundo do
   begin
      OperComum.LimpaParametros(QryCotaFundo);
      If dblInvest.Text <> '' Then
         QryCotaFundo.ParamByName('IDFUNDOINVEST').AsInteger := StrToInt(dblInvest.lookupvalue);
      QryCotaFundo.Open;
      //Alt_8
      if not QryCotaFundo.IsEmpty then
      begin
         QryCotaFundo.First;
         dDataIni := QryCotaFundo.FieldByName('DATACOTA').AsDateTime;
         dDataFim := QryCotaFundo.FieldByName('DATACOTA').AsDateTime;
         while not QryCotaFundo.EOF do
         begin
            if QryCotaFundo.FieldByName('DATACOTA').AsDateTime < dDataIni then
               dDataIni := QryCotaFundo.FieldByName('DATACOTA').AsDateTime;

            if QryCotaFundo.FieldByName('DATACOTA').AsDateTime > dDataFim then
               dDataFim := QryCotaFundo.FieldByName('DATACOTA').AsDateTime;

            QryCotaFundo.Next;
         end;
         DmRelConsCotaFundo.lblDtIni.Caption := DateToStr(dDataIni);
         DmRelConsCotaFundo.lblDtFin.Caption := DateToStr(dDataFim);


         TfrmPreview.CreateModalPreview(Application,
                                        rptCotaFundo,
                                        rptCotaFundo.PrinterSetup.DocumentName);
      end;
      QryCotaFundo.Close;
   end;

   pnlFundo.Enabled := True;
   sbtnImprimir.Down  := False;
end;

end.
