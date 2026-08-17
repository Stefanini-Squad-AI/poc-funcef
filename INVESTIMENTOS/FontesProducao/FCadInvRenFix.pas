//********************************************************************************************************
//Data	   : 13/11/2007
//Codigo   : AL_10
//Pendência: 23886
//SOL      : 50045
//Função   : Impedir a troca de perfil em um investimento já comprado
//******************************************************************************
//Data	    : 02/10/2007
//Codigo    : AL_8
//Pendência : 26539
//SOL       :
//Função    : Ajuste no montaselect para buscar investimentos sem emissor e sem classe
//           Passa a gravar o campo FLGATIVO o valor 'S' para novos investimentos
//******************************************************************************
//Data	    :  05/10/2007
//Codigo    :  AL_7
//Função    :  Acerto no lay-out e taborders
//******************************************************************************
//Data	    : 04/06/2007
//Codigo    : AL_6
//Pendência : 25309
//SOL       : 58642
//Função    : Implementação de Flag para atualizar o Título no dia da Emissão.
//              Será desenvolvida a atualização no dia da compra - Verificar depois se compra decorrida tb.
//******************************************************************************
//Data	    :  14/03/2007
//Codigo    :  AL_5
//Função    :  Implementado função para verificar exclusão
//******************************************************************************
//Data	    :  06/01/2006
//Codigo    :  AL_4
//Função    :  Implementação da data de emissão e PU de emissão cadastrados no Investimento (DFM)
//******************************************************************************
//Data	    :  25/08/2005
//Codigo    :  AL_3
//Função    :  Se o Investimento possuir operação no histórico, Não poderá ficar sem nenhum Perfil cadastrado.
//******************************************************************************
// Data     : 22/08/2005
// Código   : AL_2
// Motivo   : Implementação do Flag Permite Prorrogação (DFM)
//******************************************************************************
// Data     : 04/08/2004
// Código   : AL_1
// Função   :
// Motivo   : Controle do processo de abertura
//******************************************************************************

unit FCadInvRenFix;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroRMDetCSInv, StdCtrls, DBCtrls, wwdblook, Mask, Db,
  CmEventosCadastro, ImgList, MontaSelect, DBTables, IvDictio, IvMulti,
  IvEMulti, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr, fcLabel, Buttons,
  TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe,
  ExtCtrls, wwdbedit, Wwdotdot, Wwdbcomb, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, uCtrlPadroes, uCtrlParamInvest;

type
  TfrmCadInvRenFix = class(TfrmCadastroRMDetInv)
    qryIDINVESTIMENTO: TFloatField;
    qryIDEMISSOR: TFloatField;
    qryIDTIPOINVEST: TFloatField;
    qryDESCINVESTIMENTO: TStringField;
    qryIDCLASSETIT: TFloatField;
    qryFLGATIVO: TStringField;
    qryOBSINVESTIMENTO: TStringField;
    qryDESCCLASSINVEST: TStringField;
    qryCODISIN: TStringField;
    qryAux: TwwQuery;
    qryEmissor: TwwQuery;
    qryEmissorSIGLAEMISSOR: TStringField;
    qryEmissorIDEMISSOR: TFloatField;
    qryClasse: TwwQuery;
    qryClasseDESCCLASSETIT: TStringField;
    qryClasseIDCLASSETIT: TFloatField;
    qryCurva: TwwQuery;
    qryCurvaDESCCURVARENFIX: TStringField;
    qryCurvaIDCURVARENFIX: TFloatField;
    Label2: TLabel;
    dbckCentralizado: TDBCheckBox;
    qryDetalheIDINVESTIMENTO: TFloatField;
    qryDetalheIDCURVARENFIX: TFloatField;
    qryDetalheDESCCURVARENFIX: TStringField;
    qryDetalheFLGCURVACONTABIL: TStringField;
    dblCurva: TwwDBLookupCombo;
    qryCARENCIA: TFloatField;
    qryDetalheFLGTPCURVASWAP: TStringField;
    dbTipoItem: TwwDBComboBox;
    Label6: TLabel;
    qryDetalheFLGCOTRENFIX: TStringField;
    dbckCotRenFix: TDBCheckBox;
    qryCarteiraSPC: TwwQuery;
    qryIDCARTEIRASPC: TFloatField;
    qryCarteiraSPCIDCARTEIRASPC: TFloatField;
    qryCarteiraSPCDESCARTEIRASPC: TStringField;
    qryFLGREPACTUA: TStringField;
    qryDATAEMISSAO: TDateTimeField;
    qryPUEMISSAO: TFloatField;
    dbckAtuEmiss: TDBCheckBox;
    qryDetalheFLGCORREMISS: TStringField;
    pgcDados: TPageControl;
    tbsPrincipal: TTabSheet;
    dbeCarencia: TDBEdit;
    lblCarencia: TLabel;
    chkRepactua: TDBCheckBox;
    dbckCarencia: TDBCheckBox;
    dbeIsin: TDBEdit;
    Label5: TLabel;
    dblClasse: TwwDBLookupCombo;
    Label4: TLabel;
    dbeInvestimento: TDBEdit;
    Label1: TLabel;
    Label3: TLabel;
    dblEmissor: TwwDBLookupCombo;
    Label7: TLabel;
    dblCarteiraSPC: TwwDBLookupCombo;
    Label8: TLabel;
    dbdDataEmissao: TCMDateTimePicker;
    dbePuEmissao: TDBRealEdit;
    Label17: TLabel;
    qryTAXAEMISSAO: TFloatField;
    qryMOEDACALCMKT: TFloatField;
    qryMOEDATXINDMKT: TFloatField;
    qryTAXAJUROSMKT: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnApagarClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure dblClasseExit(Sender: TObject);
    procedure DesabilitaCarenciaPoupanca;
    procedure HabilitaCarenciaPoupanca;
    procedure dblClasseCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure dblCurvaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
    //AL_10
    iInvestimento, iPerfil: Integer;
    procedure Sel(Chave: Largeint);
    //AL_5
    function VerificaExclusao : boolean;
    //AL_10
    function VerificaAlteracao(pInvestimento, pPerfil: Integer): boolean;
  public
    { Public declarations }
  end;

var
  frmCadInvRenFix: TfrmCadInvRenFix;

implementation

{$R *.DFM}
uses dBaseDados, UMensErro, uDataBase,UBibliotecaInvest, URendaFixa, uOperComum;
{ TfrmCadInvRenFix }

procedure TfrmCadInvRenFix.Sel(Chave: Largeint);
begin
   qry.Close;
   qry.ParamByName('IDINVESTIMENTO').AsInteger := Chave;
   qry.Open;
end;

procedure TfrmCadInvRenFix.FormShow(Sender: TObject);
begin
   Sel(-1);
   qryEmissor.Open;
   qryClasse.Open;
   qryCurva.Open;
   qryCarteiraSPC.Open;
   if (qryClasseIDCLASSETIT.AsInteger = CtrlPInv.IdClassePoup) or
      (qryClasseIDCLASSETIT.AsInteger = CtrlPInv.IdClassPoupBloq) then // É poupança
      HabilitaCarenciaPoupanca
   else
      DesabilitaCarenciaPoupanca;
   inherited;
end;

procedure TfrmCadInvRenFix.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qryEmissor.Close;
   qryClasse.Close;
   qryCurva.Close;
   inherited;
end;

procedure TfrmCadInvRenFix.sbtnApagarClick(Sender: TObject);
var iInv: Integer;
begin
   // AL_1 - Controle do processo de abertura de renda fixa
   // Não faz se estiver em Abertura
   if RendaFixa.VerEmAbertura then
   begin
      CmeCadastro.AtualizaBotoes(Self);
      CmeDetalhe.AtualizaBotoes(Self);
      Exit;
   end;

   //AL_5
   if not VerificaExclusao then
      Exit;

   iInv := qryIDINVESTIMENTO.AsInteger;
   if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;
   Try
      if (MsgDlg('Deseja realmente excluir este Investimento e suas Curvas?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
      begin

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add('DELETE FROM FLUXOINVESTRENFIX ' +
                        'WHERE IDINVESTIMENTO = ' + qryIDINVESTIMENTO.AsString);
         qryAux.Prepare;
         qryAux.ExecSQL;

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add('DELETE FROM INVESTXCURVARENFIX ' +
                        'WHERE IDINVESTIMENTO = ' + qryIDINVESTIMENTO.AsString);
         qryAux.Prepare;
         qryAux.ExecSQL;

         qry.Delete;
         qry.ApplyUpdates;
         qry.CommitUpdates;
         dtmBaseDados.dbBaseDados.Commit;
         Sel(-1);
      end else begin
         dtmBaseDados.dbBaseDados.Rollback;
         Sel(iInv);  // Posiciona no mesmo registro
      end;
   except
      begin
         dtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Ocorreu problema ao excluir o Investimento.','Mensagem do Sistema ',mtWarning,[mbOK],0);
         Sel(iInv);  // Posiciona no mesmo registro
      end;
   end;
   CmeCadastro.AtualizaBotoes(Self);
   CmeDetalhe.AtualizaBotoes(Self);
   sbtnApagar.Down := False;
end;

procedure TfrmCadInvRenFix.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadInvRenFix.bbtnOkDetClick(Sender: TObject);
begin
   if Trim(dblCurva.Text) = '' then
   begin
      MsgDlg('Falta selecionar uma Curva.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if dblCurva.CanFocus then
         dblCurva.SetFocus;
      Exit;
   end;

   //AL_10
   if qryDetalhe.State = dsEdit then
   begin
      if not VerificaAlteracao(iInvestimento, iPerfil) then
      begin
         if qryDetalheIDCURVARENFIX.AsInteger <> iPerfil then
         begin
            MsgDlg('Existem operações neste Perfil para este Investimento, e o mesmo não pode ser alterado.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
            if dblCurva.CanFocus then
               dblCurva.SetFocus;
            Exit;
         end;
      end;
   end;

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('SELECT DESCCURVARENFIX FROM CURVASRENFIX ' +
                  'WHERE  IDCURVARENFIX = ' + dblCurva.LookupValue);
   qryAux.Open;
   qryDetalheDESCCURVARENFIX.AsString := qryAux.FieldByName('DESCCURVARENFIX').AsString;
   qryDetalheIDCURVARENFIX.AsString := dblCurva.LookupValue;
   qryDetalheIDINVESTIMENTO.AsInteger := qryIDINVESTIMENTO.AsInteger;
   qryAux.Close;
   qryAux.SQL.Clear;
   inherited;
   qryCurva.Close;
   if qryDetalhe.State = dsInsert then
      qryCurva.ParamByName('IDINVESTIMENTO').AsInteger := qryIDINVESTIMENTO.AsInteger
   else
      qryCurva.ParamByName('IDINVESTIMENTO').Clear;
   qryCurva.Open;
end;

procedure TfrmCadInvRenFix.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  qryDetalheIDINVESTIMENTO.AsInteger := qryIDINVESTIMENTO.AsInteger;
  qryDetalheFLGCURVACONTABIL.AsString := 'N';
  qryDetalheFLGTPCURVASWAP.AsString   := 'N';
  //AL_3
  OperComum.LimpaParametros(qryCurva);
  qryCurva.Open;
end;

procedure TfrmCadInvRenFix.sbtnInserirClick(Sender: TObject);
begin
   inherited;
   if dbeInvestimento.CanFocus then
      dbeInvestimento.SetFocus;
   DesabilitaCarenciaPoupanca;
   dbckCarencia.Checked := False;
end;

procedure TfrmCadInvRenFix.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  qryIDINVESTIMENTO.AsInteger := LeUltRegistro(nil, 'INVESTIMENTO');
  qryIDTIPOINVEST.AsInteger := 1;
  //AL_8
  qryFLGATIVO.AsString := 'S';

  qryDetalhe.Close;
  qryDetalhe.ParamByName('IDINVESTIMENTO').AsInteger := qryIDINVESTIMENTO.AsInteger;
  qryDetalhe.Open;
end;

procedure TfrmCadInvRenFix.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   Sel(qryIDINVESTIMENTO.AsInteger);
   if (qryClasseIDCLASSETIT.AsInteger = CtrlPInv.IdClassePoup) or
      (qryClasseIDCLASSETIT.AsInteger = CtrlPInv.IdClassPoupBloq) then // É poupança
      HabilitaCarenciaPoupanca
   else
      DesabilitaCarenciaPoupanca;
end;

procedure TfrmCadInvRenFix.bbtnConfirmarClick(Sender: TObject);
begin
  if Trim(dbeInvestimento.Text) = '' then
  begin
     MsgDlg('Falta a descrição do Investimento.', 'Warning', mtWarning, [mbOk], 0);
     if dbeInvestimento.CanFocus then
        dbeInvestimento.SetFocus;
     Exit;
  end;

  if Trim(dblEmissor.Text) = '' then
  begin
     MsgDlg('Falta a definição do Emissor.', 'Warning', mtWarning, [mbOk], 0);
     if dblEmissor.CanFocus then
        dblEmissor.SetFocus;
     Exit;
  end;

  if (qryCARENCIA.IsNull) and
     ((qryClasseIDCLASSETIT.AsInteger = CtrlPInv.IdClassePoup) or
      (qryClasseIDCLASSETIT.AsInteger = CtrlPInv.IdClassPoupBloq)) then
  begin
     MsgDlg('Falta informar se a poupança é trimestral ou não.', 'Warning', mtWarning, [mbOk], 0);
     if dblEmissor.CanFocus then
        dblEmissor.SetFocus;
     Exit;
  end;

  if Trim(dblCarteiraSPC.Text) = '' then
  begin
     MsgDlg('Falta Selecionar a Carteira SPC.', 'Warning', mtWarning, [mbOk], 0);
     if dblCarteiraSPC.CanFocus then
        dblCarteiraSPC.SetFocus;
     Exit;
  end;

  //AL_3
  if ((RendaFixa.BuscaOperacao(-1,)) and (qryDetalhe.IsEmpty)) then
  begin
     MsgDlg('Existem operações neste Investimento e o mesmo' +#13+
            'deve ter ao menos um Perfil cadastrado.', 'Warning', mtWarning, [mbOk], 0);
     if dbeInvestimento.CanFocus then
        dbeInvestimento.SetFocus;
     Exit;
  end;

  inherited;

  pgcDados.ActivePage := tbsPrincipal;

end;

procedure TfrmCadInvRenFix.sbtnAltDetClick(Sender: TObject);
begin
   //AL_10
   iInvestimento := qryDetalheIDINVESTIMENTO.AsInteger;
   iPerfil := qryDetalheIDCURVARENFIX.AsInteger;
   inherited;
   qryCurva.Close;
   qryCurva.ParamByName('IDINVESTIMENTO').Clear;
   qryCurva.Open;
end;

procedure TfrmCadInvRenFix.dblClasseExit(Sender: TObject);
begin
  inherited;
   if (qryClasseIDCLASSETIT.AsInteger = CtrlPInv.IdClassePoup) or
      (qryClasseIDCLASSETIT.AsInteger = CtrlPInv.IdClassPoupBloq) then // É poupança
      HabilitaCarenciaPoupanca
   else
      DesabilitaCarenciaPoupanca;

   if (qryCARENCIA.IsNull) and (ds.State in [dsEdit, dsInsert]) then
   begin
      qryCARENCIA.AsInteger := 1;
      dbckCarencia.Checked := False;
   end;
end;

procedure TfrmCadInvRenFix.DesabilitaCarenciaPoupanca;
begin
   dbckCarencia.Visible := False;
   dbeCarencia.Visible  := True;
   lblCarencia.Visible  := True;
end;

procedure TfrmCadInvRenFix.HabilitaCarenciaPoupanca;
begin
   dbckCarencia.Visible := True;
   dbeCarencia.Visible  := False;
   lblCarencia.Visible  := False;
end;

//AL_10
function TfrmCadInvRenFix.VerificaAlteracao(pInvestimento, pPerfil: Integer) : boolean;
begin
   try
      Result := True;
      OperComum.LimpaParametros(qryAux);
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT O.IDOPERRENFIX ' + #13 +
                     'FROM OPERRENFIX O, OPERRENFIXXCURVAS C ' + #13 +
                     'WHERE O.IDINVESTIMENTO = ' + IntToStr(pInvestimento) + #13 +
                     '  AND C.IDCURVARENFIX = ' + IntToStr(pPerfil) + #13 +
                     '  AND O.IDOPERRENFIX = C.IDOPERRENFIX ' + #13 +
                     'GROUP BY O.IDOPERRENFIX');
      qryAux.Open;
      if not qryAux.IsEmpty then
        Result := False;
   finally
      qryAux.Close;
   end;
end;

//AL_5
function TfrmCadInvRenFix.VerificaExclusao : boolean;
begin
   try
      Result := True;
      OperComum.LimpaParametros(qryAux);
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT IDINVESTIMENTO FROM OPERRENFIX ' +
                     'WHERE IDINVESTIMENTO = ' + qryIDINVESTIMENTO.AsString);
      qryAux.Open;
      if not qryAux.IsEmpty then
      begin
        MsgDlg('Existem operações neste Investimento e o mesmo' +#13+
               'não pode ser excluído.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
        Result := False;
        Exit;
      end;

      OperComum.LimpaParametros(qryAux);
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT IDINVESTIMENTO FROM FLUXOINVESTRENFIX ' +
                     'WHERE IDINVESTIMENTO = ' + qryIDINVESTIMENTO.AsString);
      qryAux.Open;
      if not qryAux.IsEmpty then
      begin
        MsgDlg('Existem fluxos de operações para este Investimento e o mesmo' +#13+
               'não pode ser excluído.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
        Result := False;
        Exit;
      end;

      OperComum.LimpaParametros(qryAux);
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT IDINVESTIMENTO FROM ATIVOCOTA ' +
                     'WHERE IDINVESTIMENTO = ' + qryIDINVESTIMENTO.AsString);
      qryAux.Open;
      if not qryAux.IsEmpty then
      begin
        MsgDlg('Este Investimento existe no Módulo de Cotas e o mesmo' +#13+
               'não pode ser excluído.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
        Result := False;
        Exit;
      end;
   finally
      qryAux.Close;
   end;
end;

procedure TfrmCadInvRenFix.dblClasseCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if (qryClasseIDCLASSETIT.AsInteger = CtrlPInv.IdClassePoup) or
      (qryClasseIDCLASSETIT.AsInteger = CtrlPInv.IdClassPoupBloq) then // É poupança
      HabilitaCarenciaPoupanca
   else
      DesabilitaCarenciaPoupanca;
end;

procedure TfrmCadInvRenFix.dblCurvaCloseUp(Sender: TObject; LookupTable,  FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   //AL_10
   if not VerificaAlteracao(iInvestimento, iPerfil) then
   begin
      if qryDetalheIDCURVARENFIX.AsInteger <> iPerfil then
      begin
         MsgDlg('Existem operações neste Perfil para este Investimento, e o mesmo não pode ser alterado.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
         if qryCurva.Locate('IDCURVARENFIX', iPerfil, []) then
         begin
            dblCurva.Text := qryCurvaDESCCURVARENFIX.AsString;
            dblCurva.PerformSearch;
         end;
         if dblCurva.CanFocus then
            dblCurva.SetFocus;
      end;
   end;
end;

end.
