//******************************************************************************
// Data      : 13/03/2007
// Código    : AL_7
// Motivo    : Ajuste na mensagem de reprocessamento
//******************************************************************************
// Data      : 21/08/2006
// Código    : AL_6
// Pendencia : 23117
// SOL       : 45112
// Motivo    : Implementação para utilização do Fundo de Inv. em Participação
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_5
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data      : 20/02/2005
// Código    : AL_4
// Motivo    : Implementação da verificação de processo de atualização em andamento
//*************************************************************************************
// Data     : 12/12/2005
// Linha(s) : Al_3
// Motivo   : Alteração no layout
//******************************************************************************
// Data     : 31/05/2005
// Código   : AL_2
// Motivo   : Implementação do teste de período contabil em 3 camadas
//******************************************************************************
// Data     : 06/10/2004
// Linha(s) : Alt_1
// Motivo   : Inclusão do campo DTAINIPROC na QryFundoInvest e na funcao Reprocessamento
//******************************************************************************
//Data	    : 29/06/2004
//Origem    : FUNCEF
//Query     : qryDetalhe
//Motivo(S) : Passado o Active da qry para 'False'
//******************************************************************************
//Data	    : 06/04/2004
//Função    : QryFundoInvest : para somente trazer o IDTIPOINVEST = 9 (Fundo de Direito Creditório)
//            qryDetalhe     : para somente trazer as cotacoes com IDTIPOCOTA = NULL
//            Troca do Icone da mensagem que estavam MTInformation Linhas : 206,221,270,358
//            Acerto na máscara de exibição do campo VlrCota do MontaSelect
//            Verificação de Cotação já cadastrada  na Inclusão : Linha 217
//******************************************************************************
//Data	    : 06/04/2004
//Função    : Cadastro de cota dos Fundos de Direito Creditórios por
//            tipo de cota.
//******************************************************************************

unit FCadCotaFundoDirCred;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  wwdbedit, Mask, wwdblook, DBCtrls2, DBCtrls, wwdbdatetimepicker,
  CMDateTimePicker, CmEventosCadastro, ImgList, TREdit, fcLabel, uCtrlInvContab;

type

//******************************************************************************
  TDadosCotas = Record
                 DataCota:TDate;
                 VlrCota :Double
                End;

//******************************************************************************

  TfrmCadCotaFundoDirCred = class(TfrmCadMestreDetalheCS)
    qryDetalhe: TwwQuery;
    dblInvest: TwwDBLookupCombo;
    Investimento: TLabel;
    QryFundoInvest: TwwQuery;
    Label2: TLabel;
    Label3: TLabel;
    qryDetalheIDFUNDOINVEST: TFloatField;
    qryDetalheDATACOTA: TDateTimeField;
    qryDetalheVLRCOTA: TFloatField;
    //AL_6
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
    //AL_6
    DbEdValorCota: TDBRealEdit;
    QryTipoFundoInvest: TwwQuery;
    //AL_6
    QryAux: TwwQuery;
    Bevel1: TBevel;
    pnlTitulo: TPanel;
    lbNomItem: TfcLabel;
    dblTipoCota: TwwDBLookupCombo;
    Label1: TLabel;
    QryTipoCota: TwwQuery;
    //AL_6
    qryDetalheIDTIPOCOTA: TFloatField;
    qryDetalheIDCOTAFUNDO: TFloatField;
    QryFundoInvestDTAINIPROC: TDateTimeField;
    procedure FormShow(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure dbgrdDetDblClick(Sender: TObject);
    procedure dbdDtaChange(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure DbEdValorCotaExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DbEdValorCotaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dblTipoCotaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblTipoCotaExit(Sender: TObject);
    procedure dblInvestExit(Sender: TObject);

  private
    { Private declarations }
    procedure ControlaBotoes;
  public
    { Public declarations }
  end;

var
  frmCadCotaFundoDirCred: TfrmCadCotaFundoDirCred;

implementation

uses UDataBase, uMensErro,UDiasUteisInv, UFundoComum, UBibliotecaInvest,
     UOperComum;

{$R *.DFM}

procedure TfrmCadCotaFundoDirCred.FormShow(Sender: TObject);
begin
// Abre Qry's
  QryFundoInvest.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
  QryFundoInvest.Open;
  QryTipoCota.Open;  
  qryDetalhe.Open;
// Mostra a Grid do Detalhe
  dbgrdDet.BringToFront;
  sbtnInsDet.Enabled := False;
  ControlaBotoes;
end;

procedure TfrmCadCotaFundoDirCred.bbtnOkDetClick(Sender: TObject);
Var
   dDataAnt, dDataAlt, dDataFech, dDataUltFec : TDateTime;
   DadosCota : TDadosCota;
begin
   // AL_2 - Inicio
   if dbdDta.Text = '' then begin
      MsgDlg('A Data deve ser preenchida', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if dbdDta.CanFocus then
         dbdDta.SetFocus;
      Exit;
   end;

   //AL_5
   if not CtrlInvContab.TestaPeriodo(dbdDta.Text, iTipoInvestUsu) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if dbdDta.CanFocus then
         dbdDta.SetFocus;
      Exit;
   end;

   //AL_4
   if VerEmAbertura(QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
      Exit;

   if DbEdValorCota.Text = '' then begin
      MsgDlg('O Valor da Cota deve ser preenchido', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if DbEdValorCota.CanFocus then
         DbEdValorCota.SetFocus;
      Exit;
   end;

   if dblTipoCota.Text = '' then begin
      MsgDlg('O Tipo de Cota deve ser preenchido', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if dblTipoCota.CanFocus then
         dblTipoCota.SetFocus;
      Exit;
   end;

   dDataAnt     := dbdDta.Date - 1;
   While not DiasUteisInv.DiaUtil(dDataAnt,-1,1,'',True,False,False) Do
      dDataAnt  := dDataAnt - 1;   // Achar o dia útil anterior

   // Busca dados da Cota
   DadosCota := UFundoComum.BuscaCotaFundo(QryAux,
                                           StrToInt(dblInvest.LookupValue),
                                           dDataAnt,
                                           StrToInt(dblTipoCota.LookupValue),);

   DadosCota.DataCota := QryAux.FieldByName('DATACOTA').AsDateTime;
   DadosCota.VlrCota  := QryAux.FieldByName('VLRCOTA').AsFloat;

   QryAux.Close;

   If ABS(DbEdValorCota.Value - DadosCota.VlrCota) > 1 Then
   Begin
      If MsgDlg('A Cota de hoje está com uma diferença de '+
                FloatToStrF(DbEdValorCota.Value - DadosCota.VlrCota,ffNumber,18,9)+' '#13+
                'comparada com a cota do dia anterior. '#13+
                'Confirma esse Valor de Cota?',
                'Mensagem do Sistema', MtConfirmation ,[mbYes, mbNo],0) = mrNo Then
      Begin
         if DbEdValorCota.CanFocus then
            DbEdValorCota.SetFocus;
         Exit;
      End;
   End;

   If DbEdValorCota.Value = 0 Then
   Begin
      If MsgDlg('O Valor da Cota não pode ser igual a Zero.'+ #13+
                'Verifique.',
                'Mensagem do Sistema', MtWarning ,[mbOk],0) = mrNo Then
      Begin
         if DbEdValorCota.CanFocus then
            DbEdValorCota.SetFocus;
         Exit;
      End;
   End;
   // AL_2 - Fim

   // Altera a data do parâmetro devido o fechamento
   dDataUltFec   := StrToDate(dbdDta.Text)-1;
   While not DiasUteisInv.DiaUtil(dDataUltFec,-1,1,'',True,False,False) Do
      dDataUltFec := dDataUltFec - 1;   // Achar o dia útil anterior

   if qryDetalhe.State = DsInsert then
      qryDetalheIDCOTAFUNDO.AsInteger := LeUltRegistro(Nil,'COTAFUNDO');
 
   qryDetalheIDFUNDOINVEST.Value   := strtoint(dblInvest.LookupValue);
   qryDetalheIDTIPOCOTA.Value      := strtoint(dblTipoCota.LookupValue);
 
   bbtnConfirmar.Enabled := True;
   pnlControlesDet.SendToBack;
   qryDetalhe.post;

   //AL_6 
   OperComum.LimpaParametros(QryTipoFundoInvest);
   QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger :=
                                         QryFundoInvestIDTIPOFUNDOINVEST.AsInteger;
   QryTipoFundoInvest.Open;

   inherited;

   dbdDta.SetFocus;

   AplicaAlteracoes([qryDetalhe]);
 
   CmeDetalhe.Cancel(Self);
   sbtnInsDet.Enabled    := True;
   sbtnAltDet.Enabled    := True;
   sbtnExcluiDet.Enabled := True;

   If StrToDate(dbdDta.Text) <= QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
   begin
      //AL_6
      //Alt_1
      If Not Reprocessamento(iTipoInvestUsu,
                             QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                             QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger,
                             -1,
                             StrToDate(dbdDta.Text),
                             QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                             QryFundoInvest.FieldByName('DTAINIPROC').AsDateTime,
                             True,
                             QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger) Then
         //AL_7                    
         MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                'Mensagem do Sistema', MtInformation,[MbOk],0);
   end;

   QryTipoFundoInvest.Close;

end;

procedure TfrmCadCotaFundoDirCred.FormPaint(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled :=True;
  pnlMestre.Enabled:=True;
end;

procedure TfrmCadCotaFundoDirCred.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  QryDetalhe.Cancel;
  //AL_6
  OperComum.LimpaParametros(qryDetalhe);
  if (Trim(dblInvest.Text) <> '') And (Trim(dblTipoCota.Text) <> '') then
  begin
     qryDetalhe.ParambyName('IDFUNDOINVEST').AsString := dblInvest.LookupValue;
     qryDetalhe.ParambyName('IDTIPOCOTA').AsString    := dblTipoCota.LookupValue;
  end
  else
  begin
     qryDetalhe.ParambyName('IDFUNDOINVEST').AsInteger := -1;
     qryDetalhe.ParambyName('IDTIPOCOTA').AsInteger    := -1;
  end;
  qryDetalhe.Open;

  // Altera Formato do Valor da Cota
  DbEdValorCota.DecDigits   := QryFundoInvest.FieldByName('QTDDECVALOR').AsInteger;

  if DbEdValorCota.CanFocus then
     DbEdValorCota.SetFocus;

  sbtnInsDet.Enabled    := True;
  sbtnAltDet.Enabled    := True;
  sbtnExcluiDet.Enabled := True;
end;

procedure TfrmCadCotaFundoDirCred.sbtnInsDetClick(Sender: TObject);
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

procedure TfrmCadCotaFundoDirCred.sbtnExcluiDetClick(Sender: TObject);
begin
   if (not qryDetalhe.IsEmpty) then
   begin
      // AL_2 - Inicio
      //AL_5
      if not CtrlInvContab.TestaPeriodo(qryDetalheDATACOTA.AsString, iTipoInvestUsu) then
      begin
         MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
         Exit;
      end;

      //AL_4
      if VerEmAbertura(QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
         Exit;

      //AL_6
      OperComum.LimpaParametros(QryTipoFundoInvest);
      QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger :=
                                         QryFundoInvestIDTIPOFUNDOINVEST.AsInteger;
      QryTipoFundoInvest.Open;

      If (QryDetalhe.FieldByName('DATACOTA').AsDateTime <=
          QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime) Then
      begin
         MsgDlg('Esse Fundo já foi Atualizado, não é possível excluir a Cota do Dia!',
                'Mensagem do Sistema', MtInformation , [MbOk],0);
         QryTipoFundoInvest.Close;
         Exit;
      end;

      QryTipoFundoInvest.Close;

      if MsgDlg('Deseja realmente excluir este registro?',
                'Exclusão',
                mtConfirmation, [mbYes,mbNo],0) = mrYes Then
      Begin
      
         inherited;

         aplicaAlteracoes([qryDetalhe]);

      End;

      sbtnInsDet.Enabled    := True;
      sbtnAltDet.Enabled    := True;
      sbtnExcluiDet.Enabled := True;
      sbtnExcluiDet.Down    := False;
   end;
end;

procedure TfrmCadCotaFundoDirCred.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  sbtnInsDet.Enabled    := True;
  sbtnAltDet.Enabled    := True;
  sbtnExcluiDet.Enabled := True;
end;

procedure TfrmCadCotaFundoDirCred.dbgrdDetDblClick(Sender: TObject);
begin
  inherited;
  sbtnAltDet.Click
end;

procedure TfrmCadCotaFundoDirCred.dbdDtaChange(Sender: TObject);
begin
  inherited;
  DbEdValorCota.setFocus;
end;

procedure TfrmCadCotaFundoDirCred.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  //AL_6
  if MontaSelect.RetornouValor then
  begin
     OperComum.LimpaParametros(qryDetalhe);
     qryDetalhe.ParambyName('IDFUNDOINVEST').asInteger := strtoint(montaSelect.ValoresChave[0]);
     qryDetalhe.ParambyName('DATACOTA').asString       := montaSelect.ValoresChave[1];
     qryDetalhe.ParambyName('IDTIPOCOTA').asInteger    := strtoint(montaSelect.ValoresChave[2]);     
     qryDetalhe.Open;
     dblInvest.LookupValue := MontaSelect.ValoresChave[0];
     dblInvest.PerFormSearch;
     dblTipoCota.LookupValue := MontaSelect.ValoresChave[2];
     dblTipoCota.PerFormSearch;
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

procedure TfrmCadCotaFundoDirCred.DbEdValorCotaExit(Sender: TObject);

begin
//  inherited  
   If bbtnOkDet.CanFocus Then
      bbtnOkDet.SetFocus;
end;

procedure TfrmCadCotaFundoDirCred.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
// Fecha Qry's
  //AL_6
  QryTipoFundoInvest.Close;
  QryFundoInvest.Close;
  QryTipoCota.Close;
  QryDetalhe.Close;
  Qry.Close;
end;

procedure TfrmCadCotaFundoDirCred.DbEdValorCotaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  If Key = '.' Then Key := ',';
end;

procedure TfrmCadCotaFundoDirCred.FormCreate(Sender: TObject);
begin
  inherited;
   MontaSelect.Filtro.Add('TIPOFUNDOINVEST.IDTIPOINVEST = ' + IntToStr(iTipoInvestUsu));
end;

procedure TfrmCadCotaFundoDirCred.ControlaBotoes;
begin
   sbtnInsDet.Enabled    := (qryDetalhe.State = dsBrowse) and
                            (Trim(dblInvest.Text)<>'');
   sbtnAltDet.Enabled    := (qryDetalhe.State = dsBrowse) and
                            (not qryDetalhe.IsEmpty);
   sbtnExcluiDet.Enabled := (qryDetalhe.State = dsBrowse) and
                            (not qryDetalhe.IsEmpty);
end;
procedure TfrmCadCotaFundoDirCred.FormActivate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := True;
  dblInvest.SetFocus;
end;

procedure TfrmCadCotaFundoDirCred.dblTipoCotaCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  //AL_6
   OperComum.LimpaParametros(qryDetalhe);
   if (Trim(dblInvest.Text) <> '') And (Trim(dblTipoCota.Text) <> '') then
   begin
      qryDetalhe.ParambyName('IDFUNDOINVEST').AsString := dblInvest.LookupValue;
      qryDetalhe.ParambyName('IDTIPOCOTA').AsString    := dblTipoCota.LookupValue;
   end
   else
   begin
      qryDetalhe.ParambyName('IDFUNDOINVEST').AsInteger := -1;
      qryDetalhe.ParambyName('IDTIPOCOTA').AsInteger    := -1;
   end;
   qryDetalhe.Open;
   // Altera Formato do Valor da Cota
   DbEdValorCota.DecDigits   := QryFundoInvest.FieldByName('QTDDECVALOR').AsInteger;
   
   if DbEdValorCota.CanFocus then
      DbEdValorCota.SetFocus;
end;

procedure TfrmCadCotaFundoDirCred.dblTipoCotaExit(Sender: TObject);
begin
  inherited;
   if Trim(dblInvest.Text) = '' then
   begin
      OperComum.LimpaParametros(qryDetalhe);
      qryDetalhe.Open;
   end;
     
   DbEdValorCota.DecDigits         := QryFundoInvestQTDDECVALOR.AsInteger;
   qryDetalheVLRCOTA.DisplayFormat := MontaMascaraDecVlr(QryFundoInvestIDFUNDOINVEST.AsInteger);
   ControlaBotoes;
end;

procedure TfrmCadCotaFundoDirCred.dblInvestExit(Sender: TObject);
begin
  inherited;
   if Trim(dblInvest.Text) = '' then
   begin
      OperComum.LimpaParametros(qryDetalhe);
      qryDetalhe.Open;
   end;
end;

end.

