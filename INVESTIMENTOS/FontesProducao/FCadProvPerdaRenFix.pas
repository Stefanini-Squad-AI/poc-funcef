//********************************************************************************************************
// Data	     : 28/05/2008
// Codigo    : AL_6
// Pendência : 24716
// SOL       : 55534
// Função    : Out of Memory
//******************************************************************************
// Data      : 16/02/2007
// Código    : AL_5
// Pendencia : 22779
// SOL       : 43633
// Desc      : Implementação de mais de um TRC entre Planos
//******************************************************************************
// Data      : 01/08/2006
// Código    : AL_4
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//********************************************************************************************************
// Data   : 06/01/2006
// Código : AL_3
// Função : Acerto na filtragem da curva após o Procurar
//********************************************************************************************************
// Data   : 24/11/2004
// Código : AL_2
// Função : Alteração na precisão do percentual para 9 casas (DFM)
//********************************************************************************************************
// Data   : 04/08/2004
// Código : AL_1
// Função : Controle do processo de abertura
//******************************************************************************
//Data	  : 07/05/2004
//Função  : Implementação de botão de consulta
//*******************************************************************************
//Data    : 28/04/2004
//Função  : Permite cadastrar um novo fluxo retroativamente (precisa testar)
//             Permite excluir um fluxo no passado  (precisa testar)
//Motivo  : Implementação do Reprocessamento
//*******************************************************************************
unit FCadProvPerdaRenFix;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMDetCSInv, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  fcLabel, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe, ExtCtrls, Mask, wwdbedit, wwdblook, TREdit,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmCadProvPerdaRenFix = class(TfrmCadastroMDetInv)
    lblCurva: TLabel;
    dblCurva: TwwDBLookupCombo;
    lblTitulo: TLabel;
    dblInvestimento: TwwDBLookupCombo;
    qryCurva: TwwQuery;
    qryInvestimento: TwwQuery;
    qryCurvaDESCCURVARENFIX: TStringField;
    qryCurvaIDCURVARENFIX: TFloatField;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    qryInvestimentoIDCLASSETIT: TFloatField;
    qryInvestimentoIDEMISSOR: TFloatField;
    qryDetalheIDINVESTIMENTO: TFloatField;
    qryDetalheIDCURVARENFIX: TFloatField;
    qryDetalheIDITEMRENFIX: TFloatField;
    qryDetalheDATAFLUXO: TDateTimeField;
    qryDetalhePERCFLUXO: TFloatField;
    dbdtDataFluxo: TCMDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    dbePercFluxo: TDBRealEdit;
    Label4: TLabel;
    qryExcluiItem: TwwQuery;
    qryOperXFluxo: TwwQuery;
    FloatField2: TFloatField;
    qryDetalheIDFLUXOINVESTRENFIX: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure dblInvestimentoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblCurvaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure dblInvestimentoExit(Sender: TObject);
    procedure dblCurvaExit(Sender: TObject);
    procedure dblItemExit(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
  private
    { Private declarations }
    procedure Sel(iInv, iCurva: Largeint);
    procedure HabBtDet;
    function VerificaCampos: Boolean;
    function VerificaFluxoRetroativo(dDataFluxo:TDateTime;iIdInvestimento:Integer):boolean;
  public
    { Public declarations }
  end;

var
  frmCadProvPerdaRenFix: TfrmCadProvPerdaRenFix;
  sTipoOper : String;
implementation

{$R *.DFM}
uses dBaseDados, UMensErro, uDataBase, UBibliotecaInvest, UOperComum, UOperacaoInvest,URendaFixa,
   //AL_4
   uCtrlInvContab;


procedure TfrmCadProvPerdaRenFix.HabBtDet;
begin
  if (Trim(dblInvestimento.Text) <> '') and (Trim(dblCurva.Text) <> '') then
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

procedure TfrmCadProvPerdaRenFix.Sel(iInv, iCurva: Largeint);
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
   end;
   qryDetalhe.Open;
   HabBtDet;
end;

function TfrmCadProvPerdaRenFix.VerificaCampos: Boolean;
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
   if Trim(dbdtDataFluxo.Text) = '' then
   begin
      MsgDlg('Data do Fluxo não informada','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dbdtDataFluxo.CanFocus then
         dbdtDataFluxo.SetFocus
      else
         dblCurva.SetFocus;
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

procedure TfrmCadProvPerdaRenFix.FormShow(Sender: TObject);
begin
  Sel(-1,-1);
  qryInvestimento.Open;
  qryCurva.Open;
  inherited;
end;

procedure TfrmCadProvPerdaRenFix.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryInvestimento.Close;
  qryCurva.Close;
  inherited;
end;

procedure TfrmCadProvPerdaRenFix.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
   if MontaSelect.RetornouValor then
   begin
      Sel(StrToInt(MontaSelect.ValoresChave[0]),StrToInt(MontaSelect.ValoresChave[1]));
      if qryInvestimento.Locate('IDINVESTIMENTO', MontaSelect.ValoresChave[0], []) then
      begin
         dblInvestimento.Text := qryInvestimentoDESCINVESTIMENTO.AsString;
         dblInvestimento.PerformSearch;
      end;

      if qryCurva.Locate('IDCURVARENFIX', MontaSelect.ValoresChave[1], []) then
      begin
         dblCurva.Text := qryCurvaDESCCURVARENFIX.AsString;
         dblCurva.PerformSearch;
      end;

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

   if dbdtDataFluxo.CanFocus then
      dbdtDataFluxo.SetFocus;

end;

procedure TfrmCadProvPerdaRenFix.bbtnOkDetClick(Sender: TObject);
begin
   if not VerificaCampos then exit;
   if not VerificaFluxoRetroativo(StrToDate(dbdtDataFluxo.Text),qryInvestimentoIDINVESTIMENTO.AsInteger) then exit;

   qryDetalheIDINVESTIMENTO.AsString := dblInvestimento.LookupValue;
   qryDetalheIDCURVARENFIX.AsString := dblCurva.LookupValue;
   qryDetalheIDITEMRENFIX.AsInteger := -15;
   CmeDetalhe.RepetirInsert := False; //Cancelar o RepetirInserir
   inherited;
   qryDetalhe.ApplyUpdates;
   qryDetalhe.CommitUpdates;
   HabBtDet;
end;

procedure TfrmCadProvPerdaRenFix.dblInvestimentoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
  begin
     if Trim(dblInvestimento.Text) = '' then
        Sel(-1,-2)
     else
        Sel(StrToInt(dblInvestimento.LookupValue),-2);
  end;
end;

procedure TfrmCadProvPerdaRenFix.dblCurvaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
  begin
     if Trim(dblCurva.Text) = '' then
        Sel(-2,-1)
     else
        Sel(-2,StrToInt(dblCurva.LookupValue));
  end;
end;

procedure TfrmCadProvPerdaRenFix.sbtnInsDetClick(Sender: TObject);
begin
   //AL_6
   // Força uma saida do controle ativo
   SelectNext(ActiveControl,True,True);
   inherited;
   // AL_1 - Controle do processo de abertura de renda fixa
   if qryDetalhe.State = dsInsert then
   begin
      sTipoOper := 'Inclusão';
      dbdtDataFluxo.Enabled := True;
      dbdtDataFluxo.SetFocus;
      qryDetalhePERCFLUXO.AsFloat := 0;
   end;
end;

procedure TfrmCadProvPerdaRenFix.dblInvestimentoExit(Sender: TObject);
begin
   inherited;
   if Trim(dblInvestimento.Text) = '' then
      Sel(-1,-2)
   else
      Sel(StrToInt(dblInvestimento.LookupValue),-2);

   HabBtDet;
end;

procedure TfrmCadProvPerdaRenFix.dblCurvaExit(Sender: TObject);
begin
   inherited;
   if Trim(dblCurva.Text) = '' then
      Sel(-2,-1)
   else
      Sel(-2,StrToInt(dblCurva.LookupValue));

   HabBtDet;
end;

procedure TfrmCadProvPerdaRenFix.dblItemExit(Sender: TObject);
begin
  inherited;
  HabBtDet;
end;

procedure TfrmCadProvPerdaRenFix.sbtnExcluiDetClick(Sender: TObject);
var iInv, iCurva, iItem: Integer;
begin
   // Não faz se estiver em Abertura
   if RendaFixa.VerEmAbertura then Exit;

   sTipoOper := 'Exclusão';
   iInv := qryDetalheIDINVESTIMENTO.AsInteger;
   iCurva := qryDetalheIDCURVARENFIX.AsInteger;

   if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;
   Try
      if (MsgDlg('Deseja realmente excluir este Fluxo?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
      begin
         if not VerificaFluxoRetroativo(dbdtDataFluxo.DateTime,iInv) then
            Raise Exception.Create('');
         qryExcluiItem.Close;
         qryExcluiItem.ParamByName('DATAFLUXO').AsString := qryDetalheDATAFLUXO.AsString;
         qryExcluiItem.ParamByName('IDINVESTIMENTO').AsInteger := iInv;
         qryExcluiItem.ParamByName('IDCURVARENFIX').AsInteger := iCurva;
         qryExcluiItem.Prepare;
         qryExcluiItem.ExecSQL;
         dtmBaseDados.dbBaseDados.Commit;
      end else
         dtmBaseDados.dbBaseDados.Rollback;
   except
      //AL_6
      on E:Exception do
      begin
         dtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Ocorreu um problema ao excluir o Fluxo.','Mensagem do Sistema ',mtWarning,[mbOK],0);
      end;
   end;

   qryDetalhe.Close;
   qryDetalhe.Open;

   HabBtDet;
end;

procedure TfrmCadProvPerdaRenFix.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  HabBtDet;
end;

procedure TfrmCadProvPerdaRenFix.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  HabBtDet;
end;

procedure TfrmCadProvPerdaRenFix.sbtnAltDetClick(Sender: TObject);
begin
  sTipoOper := 'Alteração';
  dbdtDataFluxo.Enabled := False;
  inherited;
end;


function TfrmCadProvPerdaRenFix.VerificaFluxoRetroativo(dDataFluxo:TDateTime;iIdInvestimento:Integer):boolean;
begin
   Result := True;

   if dDataFluxo <= pRPI.DATAULTFECHRF then
   begin
      if MsgDlg('A data do fluxo é anterior ao último fechamento!'+#13+
                'Esta Ação Implicará no Reprocessamento Automático ' + #13 +
                'de Todas as Aplicações deste Investimento. '+#13+
                'Continua?',
                'Atenção',mtWarning,[mbYes, mbNo],0) = mrYes then
      begin
         // Exclui registro do investimento para datas posteriores
         //AL_4
         if not CtrlInvContab.TestaPeriodo(DateToStr(dDataFluxo),
                                           1, -1,
                                           qryInvestimento.FieldByName('IDCLASSETIT').AsInteger) then
         begin
            Result := False;
            MsgDlg(CtrlInvContab.MessageInfo,'Mensagem do Sistema',mtWarning,[mbOk],0);
            Exit;
         end;

         //AL_5
         //AL_6
         if not RendaFixa.ExcluiHistRenFix(dDataFluxo,True,-1,-1,-1,iIdInvestimento,True,False,nil,False) then
         begin
            Result := False;
            Exit;
         end;

         if RendaFixa.MarcaInvRep(dDataFluxo, iIdInvestimento, -1, -1) = -1 then
         begin
            Result := False;
            MsgDlg('Não foi Possível Marcar o Título ' + #13 +
                   qryInvestimentoDESCINVESTIMENTO.AsString + #13 +
                   'para Reprocessamento Automático.',
                   'Mensagem do Sistema',mtWarning,[mbOk],0);
         end;
      end
      else
         Result := False;
   end;
end;


end.
