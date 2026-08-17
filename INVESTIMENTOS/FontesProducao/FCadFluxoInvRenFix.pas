//******************************************************************************
// SOL        : 39918
// Kintana    : 523459
// Data       : 10/08/2009
// Responsável: Thiago Passos
// Descrição  : Correção de Indices em dias Uteis
//******************************************************************************
// Data      : 17/08/2006
// Código    : AL_9
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data      : 01/08/2006
// Código    : AL_8
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//********************************************************************************************************
//Data	    : 07/10/2005
//Código    : Al_7
//Motivo(S) : Ajuste na rotina de teste de inclsuão retroativa, passa a marcar se o
//              fluxo for no dia da última abertura
//********************************************************************************************************
//Data	    : 26/07/2005
//Código    : Al_6
//Motivo(S) : Acerto na saida da rotina VerificaFluxoRetroativo
//********************************************************************************************************
//Data	    : 08/06/2005
//Código    : Al_5
//Motivo(S) : Implementação do teste de período contabil em 3 camadas
//********************************************************************************************************
// Data   : 24/11/2004
// Código : AL_4
// Função : Alteração na precisão do percentual para 9 casas (DFM)
//********************************************************************************************************
// Data   : 01/10/2004
// Código : AL_3
// Função : Alteração de Curva para Perfil no MontaSelect (DFM)
//********************************************************************************************************
// Data   : 04/08/2004
// Código : AL_2
// Função : Controle do processo de abertura
//******************************************************************************
//Data    : 15/06/2004
//Código  : AL_1
//Função  : Marca o Investimento para ser reprocessado na inclusão retroativa
//*******************************************************************************
//Data	 	 : 07/05/2004
//Função	 : Implementação de botão de consulta
//*******************************************************************************
unit FCadFluxoInvRenFix;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMDetCSInv, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  fcLabel, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe, ExtCtrls, Mask, wwdbedit, wwdblook, TREdit,
  wwdbdatetimepicker, CMDateTimePicker, DBCtrls;

type
  TfrmCadFluxoInvestRenFix = class(TfrmCadastroMDetInv)
    lblCurva: TLabel;
    dblCurva: TwwDBLookupCombo;
    lblTitulo: TLabel;
    dblInvestimento: TwwDBLookupCombo;
    qryCurva: TwwQuery;
    qryInvestimento: TwwQuery;
    qryCurvaDESCCURVARENFIX: TStringField;
    qryCurvaIDCURVARENFIX: TFloatField;
    dblItem: TwwDBLookupCombo;
    Label1: TLabel;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    qryInvestimentoIDCLASSETIT: TFloatField;
    qryInvestimentoIDEMISSOR: TFloatField;
    qryDetalheIDINVESTIMENTO: TFloatField;
    qryDetalheIDCURVARENFIX: TFloatField;
    qryDetalheIDITEMRENFIX: TFloatField;
    qryDetalheDATAFLUXO: TDateTimeField;
    qryDetalhePERCFLUXO: TFloatField;
    qryItem: TwwQuery;
    Label2: TLabel;
    Label3: TLabel;
    dbePercFluxo: TDBRealEdit;
    Label4: TLabel;
    qryExcluiItem: TwwQuery;
    qryOperXFluxo: TwwQuery;
    FloatField2: TFloatField;
    qryOperAplic: TwwQuery;
    qryOperAplicIDOPERRENFIXAPLIC: TFloatField;
    qryOperAplicDATAOPERACAO: TDateTimeField;
    qryItemIDITEMRENFIX: TFloatField;
    qryItemDESCITEMRENFIX: TStringField;
    qryDetalheIDFLUXOINVESTRENFIX: TFloatField;
    dbdtDataFluxoOriginal: TCMDateTimePicker;
    qryDetalheDATAFLUXOORIGINAL: TDateTimeField;
    Label5: TLabel;
    dbdtDataFluxo: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure dblInvestimentoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblCurvaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblItemCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure dblInvestimentoExit(Sender: TObject);
    procedure dblCurvaExit(Sender: TObject);
    procedure dblItemExit(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure dbdtDataFluxoOriginalExit(Sender: TObject);
  private
    { Private declarations }
    procedure Sel(iInv, iCurva, iItem: Largeint);
    procedure HabBtDet;
    function VerificaCampos: Boolean;
    function VerificaLiquidacaoFluxos(dDataFluxo:TDateTime):boolean;
    function VerificaFluxoRetroativo(dDataFluxo:TDateTime;iIdInvestimento:Integer):boolean;
  public
    { Public declarations }
  end;

var
  frmCadFluxoInvestRenFix: TfrmCadFluxoInvestRenFix;
  sTipoOper : String;
implementation

{$R *.DFM}
uses dBaseDados, UMensErro, uDataBase, UBibliotecaInvest, UOperComum, UOperacaoInvest,URendaFixa,  UDiasUteisInv,
     //AL_4
     uCtrlInvContab;
{ TfrmCadFluxoInvestRenFix }

procedure TfrmCadFluxoInvestRenFix.HabBtDet;
begin
  if (Trim(dblInvestimento.Text) <> '') and (Trim(dblCurva.Text) <> '') and
     (Trim(dblItem.Text) <> '') then
  begin
     sbtnInsDet.Enabled := True;
     if qryDetalhe.IsEmpty then
     begin
        sbtnAltDet.Enabled := False;
        sbtnExcluiDet.Enabled := False
     end else begin
        sbtnAltDet.Enabled := True;
        sbtnExcluiDet.Enabled := True;
     end;
  end else begin
     sbtnInsDet.Enabled := False;
     sbtnAltDet.Enabled := False;
     sbtnExcluiDet.Enabled := False;
  end;
end;

procedure TfrmCadFluxoInvestRenFix.Sel(iInv, iCurva, iItem: Largeint);
begin
   qryDetalhe.Close;
   if iInv <> -2 then begin
      qryDetalhe.ParamByName('IDINVESTIMENTO').AsInteger := iInv;
      qryCurva.Close;
      if iInv = -1 then
         qryCurva.ParamByName('IDINVESTIMENTO').Clear
      else
         qryCurva.ParamByName('IDINVESTIMENTO').AsInteger := iInv;
      qryCurva.Open;
   end;
   if iCurva <> -2 then begin
      qryDetalhe.ParamByName('IDCURVARENFIX').AsInteger := iCurva;
      qryItem.Close;
      if iCurva = -1 then
         qryItem.ParamByName('IDCURVARENFIX').Clear
      else
         qryItem.ParamByName('IDCURVARENFIX').AsInteger := iCurva;
      qryItem.Open;
   end;
   if iItem <> -2 then
      qryDetalhe.ParamByName('IDITEMRENFIX').AsInteger := iItem;
   qryDetalhe.Open;
   HabBtDet;
end;

function TfrmCadFluxoInvestRenFix.VerificaCampos: Boolean;
begin
   Result := False;
   if Trim(dblInvestimento.Text) = '' then
   begin
      MsgDlg('Investimento não Selecionado','Mensagem do Sistema',mtWarning,[MbOk],0);
      dblInvestimento.SetFocus;
      Exit;
   end;
   if Trim(dblCurva.Text) = '' then
   begin
      MsgDlg('Curva não Selecionada','Mensagem do Sistema',mtWarning,[MbOk],0);
      dblCurva.SetFocus;
      Exit;
   end;
   if Trim(dblItem.Text) = '' then
   begin
      MsgDlg('Item não Selecionado','Mensagem do Sistema',mtWarning,[MbOk],0);
      dblItem.SetFocus;
      Exit;
   end;

   if Trim(dbdtDataFluxoOriginal.Text) = '' then
   begin
      MsgDlg('Data do Fluxo não informada','Mensagem do Sistema',mtWarning,[MbOk],0);
      dblItem.SetFocus;
      Exit;
   end;
   if Trim(dbePercFluxo.Text) = '' then
   begin
      MsgDlg('Percentual do Fluxo não informado','Mensagem do Sistema',mtWarning,[MbOk],0);
      dbePercFluxo.SetFocus;
      Exit;
   end;
   Result := True;
end;

procedure TfrmCadFluxoInvestRenFix.FormShow(Sender: TObject);
begin
  Sel(-1,-1,-1);
  qryInvestimento.Open;
  qryCurva.Open;
  qryItem.Open;
  inherited;
end;

procedure TfrmCadFluxoInvestRenFix.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryInvestimento.Close;
  qryCurva.Close;
  qryItem.Close;
  inherited;
end;

procedure TfrmCadFluxoInvestRenFix.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
   if MontaSelect.RetornouValor then
   begin
      Sel(StrToInt(MontaSelect.ValoresChave[0]),StrToInt(MontaSelect.ValoresChave[1]),
          StrToInt(MontaSelect.ValoresChave[2]));
      dblInvestimento.LookupValue := MontaSelect.ValoresChave[0];
      dblCurva.LookupValue := MontaSelect.ValoresChave[1];
      dblItem.LookupValue := MontaSelect.ValoresChave[2];
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

   dbdtDataFluxoOriginal.SetFocus;

end;

procedure TfrmCadFluxoInvestRenFix.bbtnOkDetClick(Sender: TObject);
var
sDataReceb:string;
begin

   {  if not DiasUteisInv.DiaUtil(dbdtDataFluxoOriginal.DateTime, -1, 1, '', True, False, False) then
          sDataReceb := DateToStr(DiasUteisInv.PrimeiroDiaUtilPosterior(dbdtDataFluxoOriginal.DateTime, -1, 1, '', True, False, False))
      else
          sDataReceb  :=dbdtDataFluxoOriginal.text;
   }
   if not VerificaCampos then exit;
   if not VerificaLiquidacaoFluxos(StrToDate(dbdtDataFluxo.text)) then exit;
   if not VerificaFluxoRetroativo(StrToDate(dbdtDataFluxo.text),qryInvestimentoIDINVESTIMENTO.AsInteger)
   then
      exit;

   try
      qryDetalheIDINVESTIMENTO.AsString := dblInvestimento.LookupValue;
      qryDetalheIDCURVARENFIX.AsString := dblCurva.LookupValue;
      qryDetalheIDITEMRENFIX.AsString := dblItem.LookupValue;



      inherited;
      CmeDetalhe.Cancel(Self);
      qryDetalhe.ApplyUpdates;
      qryDetalhe.CommitUpdates;
      dtmbasedados.dbBaseDados.Commit;
      HabBtDet;
   except
      on E:Exception do
      begin

      end;
   end;
end;

procedure TfrmCadFluxoInvestRenFix.dblInvestimentoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
  begin
     if Trim(dblInvestimento.Text) = '' then
        Sel(-1,-2,-2)
     else
        Sel(StrToInt(dblInvestimento.LookupValue),-2,-2);
  end;
end;

procedure TfrmCadFluxoInvestRenFix.dblCurvaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
  begin
     if Trim(dblCurva.Text) = '' then
        Sel(-2,-1,-2)
     else
        Sel(-2,StrToInt(dblCurva.LookupValue),-2);
  end;
end;

procedure TfrmCadFluxoInvestRenFix.dblItemCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
     if Trim(dblItem.Text) = '' then
        Sel(-2,-2,-1)
     else
        Sel(-2,-2,StrToInt(dblItem.LookupValue));
end;

procedure TfrmCadFluxoInvestRenFix.sbtnInsDetClick(Sender: TObject);
begin
   inherited;
   // AL_2 - Controle do processo de abertura de renda fixa
   if qryDetalhe.State = dsInsert then
   begin
     sTipoOper := 'Inclusão';
     dbdtDataFluxoOriginal.Enabled := True;
     dbdtDataFluxoOriginal.SetFocus;
     qryDetalhePERCFLUXO.AsFloat := 100;
   end;
end;

procedure TfrmCadFluxoInvestRenFix.dblInvestimentoExit(Sender: TObject);
begin
  inherited;
  HabBtDet;
end;

procedure TfrmCadFluxoInvestRenFix.dblCurvaExit(Sender: TObject);
begin
  inherited;
  HabBtDet;
end;

procedure TfrmCadFluxoInvestRenFix.dblItemExit(Sender: TObject);
begin
  inherited;
  HabBtDet;
end;

procedure TfrmCadFluxoInvestRenFix.sbtnExcluiDetClick(Sender: TObject);
var iInv, iCurva, iItem: Integer;
begin
   // AL_2 - Controle do processo de abertura de renda fixa
   // Não faz se estiver em Abertura
   if RendaFixa.VerEmAbertura then Exit;

   //AL_9
   sTipoOper := 'Exclusão';

   if not VerificaLiquidacaoFluxos(StrToDate(dbdtDataFluxo.Text)) then exit;

   iInv := qryDetalheIDINVESTIMENTO.AsInteger;
   iCurva := qryDetalheIDCURVARENFIX.AsInteger;
   iItem := qryDetalheIDITEMRENFIX.AsInteger;

   if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;
   Try
      if (MsgDlg('Deseja realmente excluir este Fluxo?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
      begin
         qryExcluiItem.Close;
         qryExcluiItem.ParamByName('DATAFLUXO').AsString := qryDetalheDATAFLUXO.AsString;
         qryExcluiItem.ParamByName('IDINVESTIMENTO').AsInteger := iInv;
         qryExcluiItem.ParamByName('IDCURVARENFIX').AsInteger := iCurva;
         qryExcluiItem.ParamByName('IDITEMRENFIX').AsInteger := iItem;
         qryExcluiItem.Prepare;
         qryExcluiItem.ExecSQL;
         dtmBaseDados.dbBaseDados.Commit;
      end else
         dtmBaseDados.dbBaseDados.Rollback;
   except
      begin
         dtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Ocorreu um problema ao excluir o Fluxo.','Mensagem do Sistema ',mtWarning,[mbOK],0);
      end;
   end;

   qryDetalhe.Close;
   qryDetalhe.Open;
end;

procedure TfrmCadFluxoInvestRenFix.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  HabBtDet;
end;

procedure TfrmCadFluxoInvestRenFix.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  HabBtDet;
end;

procedure TfrmCadFluxoInvestRenFix.sbtnAltDetClick(Sender: TObject);
begin
  sTipoOper := 'Alteração';
  dbdtDataFluxoOriginal.Enabled := False;
  inherited;
end;

function TfrmCadFluxoInvestRenFix.VerificaLiquidacaoFluxos(dDataFluxo:TDateTime):boolean;
var
   iTipoOper : Integer;
begin
   iTipoOper := 0;
   Result    := True;   
   if qryDetalhe.State <> dsInsert then
   begin
      // Nao permite alt/exc se houver operacao com o fluxo
      // Busco as aplicações do investimento
      OperComum.LimpaParametros(qryOperAplic);
      qryOperAplic.ParamByName('IDINVESTIMENTO').AsInteger := qryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;

      if qryItemIDITEMRENFIX.AsInteger = pRPI.IDOPERPAGTOJUROS then
         iTipoOper := -17
      else if qryItemIDITEMRENFIX.AsInteger = pRPI.IDOPERAMORTPRINC then
         iTipoOper := -18
      else if qryItemIDITEMRENFIX.AsInteger = pRPI.IDOPERINCJUROS then
         iTipoOper := -19;
      qryOperAplic.ParamByName('IDTIPOOPERACAO').AsInteger := iTipoOper;
      qryOperAplic.ParamByName('dDataRef').AsString := DateToStr(dDataFluxo);
      qryOperAplic.Open;

      if not qryOperAplic.IsEmpty then
      begin
         //AL_9
         MsgDlg(''+sTipoOper+' não permitida. '+#13+
                'Existem operações com o fluxo nesta data ou futuras ' +#13+
                'que precisam ser excluídas primeiramente.','Mensagem do Sistema ',mtWarning,[mbOK],0);
         Result := False;
      end;
   end;
end;

function TfrmCadFluxoInvestRenFix.VerificaFluxoRetroativo(dDataFluxo:TDateTime;iIdInvestimento:Integer):boolean;
begin
   // AL_5 - Ajuste na rotina e no tratamento das mensagens
   Result := False;
   if dDataFluxo <= pRPI.DATAULTFECHRF then
   begin
      if MsgDlg('A data do fluxo é anterior ao último fechamento!'+#13+
                'Se Continuar, o Investimento será Reprocessamento a partir desta Data.',
                'Mensagem do Sistema', mtConfirmation, [mbYes, mbNo],0) = mrYes then
      begin
           // AL_7 - Ini
           // AL_1 - 15/06/2004 - Não volta data, marca o investimento
            //AL_8
            if not CtrlInvContab.TestaPeriodo(dbdtDataFluxo.text,
                                              1, -1,
                                              qryInvestimento.FieldByName('IDCLASSETIT').AsInteger) then
            begin
               Result := False;
               MsgDlg(CtrlInvContab.MessageInfo,'Mensagem do Sistema',mtWarning,[mbOk],0);
               Exit;
            end;

            try
               if RendaFixa.MarcaInvRep(StrToDate(dbdtDataFluxo.text),
                                        qryInvestimentoIDINVESTIMENTO.AsInteger,
                                        -1, -1) = -1 then
               begin
                  MsgDlg('Não foi Possível Marcar este Título para Reprocessamento.',
                         'Mensagem do Sistema', mtWarning,[mbOk],0);
                  Exit;
               end;
               Result := True;
            except
               on E: Exception do
                  MsgDlg(E.Message, 'Mensagem do Sistema', mtWarning, [mbOk],0);
            end;
//         // AL_1 - 15/06/2004 - Fim
           // AL_7 - Fim
      end;
   end
   else
      //AL_6
      Result := True;
   // AL_5 - Fim
end;

procedure TfrmCadFluxoInvestRenFix.dbdtDataFluxoOriginalExit(
  Sender: TObject);
  var
  dDataReceb:TDateTime;
begin
  inherited;
      dDataReceb:=0;
      if not DiasUteisInv.DiaUtil(dbdtDataFluxoOriginal.DateTime, -1, 1, '', True, False, False) then
          dDataReceb := DiasUteisInv.PrimeiroDiaUtilPosterior(dbdtDataFluxoOriginal.DateTime, -1, 1, '', True, False, False)
      else
          dDataReceb  :=dbdtDataFluxoOriginal.DateTime;
          qryDetalheDataFluxo.asDateTime := dDataReceb;
     // dbdtDataFluxo.Text := DateToStr(dDataReceb);

end;

end.
