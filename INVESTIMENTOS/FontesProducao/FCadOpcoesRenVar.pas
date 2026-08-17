unit FCadOpcoesRenVar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCSInv, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, fcLabel, ExtCtrls, wwdbdatetimepicker,
  CMDateTimePicker, TREdit, wwdblook, Mask, DBCtrls;

type
  TfrmCadOpcoesRenVar = class(TfrmCadastroCSInv)
    lblInvestimento: TLabel;
    dbeInvestimento: TDBEdit;
    lblEmissor: TLabel;
    dblEmissor: TwwDBLookupCombo;
    qryEmissor: TwwQuery;
    qryEmissorSIGLAEMISSOR: TStringField;
    qryEmissorIDEMISSOR: TFloatField;
    dbrVlrExercicio: TDBRealEdit;
    lblPuExerc: TLabel;
    dbdDataVencto: TCMDateTimePicker;
    lblDtVencto: TLabel;
    updOpcao: TUpdateSQL;
    qryOpcao: TwwQuery;
    dsOpcao: TwwDataSource;
    qryIDINVESTIMENTO: TFloatField;
    qryDESCINVESTIMENTO: TStringField;
    qryIDEMISSOR: TFloatField;
    qryIDTIPOINVEST: TFloatField;
    qrySTAOPCAO: TStringField;
    qryOpcaoIDOPCAO: TFloatField;
    qryOpcaoIDINVESTIMENTO: TFloatField;
    qryOpcaoDTAVENCTO: TDateTimeField;
    qryOpcaoVLRPRECOEX: TFloatField;
    qryAux: TwwQuery;
    qryAcao: TwwQuery;
    dsAcao: TwwDataSource;
    UpdAcao: TUpdateSQL;
    qryAcaoXBolsa: TwwQuery;
    dsAcaoXBolsa: TwwDataSource;
    UpdAcaoXBolsa: TUpdateSQL;
    qryAcaoIDACAO: TFloatField;
    lblLote: TLabel;
    dbrLote: TDBRealEdit;
    lblBolsa: TLabel;
    dblkBolsa: TwwDBLookupCombo;
    qryBolsa: TwwQuery;
    qryBolsaIDBOLSAVALORES: TFloatField;
    qryBolsaSGLBOLSAVALORES: TStringField;
    qryAcaoXBolsaIDEMISSOR: TFloatField;
    qryAcaoXBolsaIDBOLSAVALORES: TFloatField;
    qryAcaoXBolsaIDACAO: TFloatField;
    qryAcaoXBolsaQTDELOTE: TFloatField;
    qryAcaoXBolsaSIGLAACAOBOLSA: TStringField;
    qryOpcaoIDBOLSAVALORES: TFloatField;
    qryIDBOLSAVALORES: TFloatField;
    qryAcaoXBolsaMOECODIGO: TFloatField;
    lblAtivoBase: TLabel;
    dblAtivoBase: TwwDBLookupCombo;
    qryAtivoBase: TwwQuery;
    qryAtivoBaseDESCINVESTIMENTO: TStringField;
    qryAtivoBaseIDINVESTIMENTO: TFloatField;
    qryIDINVESTBASE: TFloatField;
    qryOpcaoIDINVESTBASE: TFloatField;
    dbrdStaTipoOpcao: TDBRadioGroup;
    DBRadioGroup1: TDBRadioGroup;
    qryOpcaoSTATPAMERICANA: TStringField;
    qryOpcaoSTAOPCCOMPRA: TStringField;
    qryIDMOEDACONTAB: TFloatField;
    qryFLGATIVO: TStringField;
    qryOpcaoIDTIPOOPCAO: TFloatField;
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure dblEmissorExit(Sender: TObject);
    procedure dblkBolsaExit(Sender: TObject);
  private
    { Private declarations }
    procedure Sel(chave : Longint);
    function ValidaCampos:boolean;
    function IncluiEmissor: Boolean;
    procedure AtualizaInvest;
    function ExcluiEmissor: Boolean;
  public
    { Public declarations }
  end;

var
  frmCadOpcoesRenVar: TfrmCadOpcoesRenVar;
  iIdInvestimento : Integer;

implementation

{$R *.DFM}

uses dBaseDados, UMensErro, uDataBase, UBibliotecaInvest, UOperComum;

procedure TfrmCadOpcoesRenVar.Sel(chave : Longint);
begin
   qry.Close;
   qry.ParamByName('IDINVESTIMENTO').AsInteger := chave;
   qry.Open;

   qryOpcao.Close;
   qryOpcao.ParamByName('IDINVESTIMENTO').AsInteger := chave;
   qryOpcao.Open;

   OperComum.LimpaParametros(qryAtivoBase);
   qryAtivoBase.ParamByName('IDEMISSOR').AsInteger := qryIDEMISSOR.AsInteger;
   qryAtivoBase.ParamByName('IDBOLSAVALORES').AsInteger := qryOpcaoIDBOLSAVALORES.AsInteger;
   qryAtivoBase.Open;

   OperComum.LimpaParametros(qryAcaoXBolsa);
   qryAcaoXBolsa.ParamByName('IDEMISSOR').AsInteger      := qryIDEMISSOR.AsInteger;
   qryAcaoXBolsa.ParamByName('IDBOLSAVALORES').AsInteger := qryOpcaoIDBOLSAVALORES.AsInteger;
   qryAcaoXBolsa.ParamByName('IDACAO').AsInteger         := qryIDINVESTIMENTO.AsInteger;
   qryAcaoXBolsa.Open;


end;

procedure TfrmCadOpcoesRenVar.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   if MontaSelect.RetornouValor then
      Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadOpcoesRenVar.FormShow(Sender: TObject);
begin
  inherited;
   Sel(-1);
   qry.Open;
   qryOpcao.Open;
   qryEmissor.Open;
    OperComum.LimpaParametros(qryBolsa);
    if pRPI.IDBMF <> 0 then
       qryBolsa.ParamByName('IDBOLSAVALORES').AsInteger := pRPI.IDBMF;
    qryBolsa.Open;
   qryAcao.Open;
   OperComum.LimpaParametros(qryAcaoXBolsa);
   qryAcaoXBolsa.Open;
   OperComum.LimpaParametros(qryAtivoBase);
   qryAtivoBase.Open;
end;

procedure TfrmCadOpcoesRenVar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   qry.Close;
   qryOpcao.Close;
   qryEmissor.Close;
   qryBolsa.Close;
   qryAcao.Close;
   qryAcaoXBolsa.Close;
   qryAtivoBase.Close;
end;

function TfrmCadOpcoesRenVar.ValidaCampos:boolean;
begin
   Result := True;

   if Trim(dbeInvestimento.Text) = '' then
   begin
      MsgDlg('Nome da Opção não informado.', 'Warning', mtWarning, [mbOk], 0);
      if dbeInvestimento.CanFocus then
         dbeInvestimento.SetFocus;
      Result := False;
      Exit;
   end
   else if Trim(dblEmissor.Text) = '' then
   begin
      MsgDlg('Emissor não informado.', 'Warning', mtWarning, [mbOk], 0);
      if dblEmissor.CanFocus then
         dblEmissor.SetFocus;
      Result := False;
      Exit;
   end
   else if Trim(dblkBolsa.Text) = '' then
   begin
      MsgDlg('Bolsa de Valores não informada.', 'Warning', mtWarning, [mbOk], 0);
      if dblkBolsa.CanFocus then
         dblkBolsa.SetFocus;
      Result := False;
      Exit;
   end
   else if Trim(dbdDataVencto.Text) = '' then
   begin
      MsgDlg('Data de Vencimento não informado.', 'Warning', mtWarning, [mbOk], 0);
      if dbdDataVencto.CanFocus then
         dbdDataVencto.SetFocus;
      Result := False;
      Exit;
   end
   else if Trim(dbrVlrExercicio.Text) = '' then
   begin
      MsgDlg('Preço de Exercício não informado.', 'Warning', mtWarning, [mbOk], 0);
      if dbrVlrExercicio.CanFocus then
         dbrVlrExercicio.SetFocus;
      Result := False;
      Exit;
   end
   else if Trim(dblAtivoBase.Text) = '' then
   begin
      MsgDlg('Ativo Base não informado.', 'Warning', mtWarning, [mbOk], 0);
      if dblAtivoBase.CanFocus then
         dblAtivoBase.SetFocus;
      Result := False;
      Exit;
   end
   else if Trim(dbrLote.Text) = '' then
   begin
      MsgDlg('Lote não informado.', 'Warning', mtWarning, [mbOk], 0);
      if dbrLote.CanFocus then
         dbrLote.SetFocus;
      Result := False;
      Exit;
   end;
end;

procedure TfrmCadOpcoesRenVar.sbtnInserirClick(Sender: TObject);
begin
  inherited;
   if dbeInvestimento.CanFocus then
      dbeInvestimento.SetFocus;
   qryOpcaoSTAOPCCOMPRA.AsString   := 'S';
   qryOpcaoSTATPAMERICANA.AsString := 'S';
   qryOpcaoIDTIPOOPCAO.AsInteger   := 2;
   dblEmissor.Enabled   := True;
   dblkBolsa.Enabled    := True;
   dblAtivoBase.Enabled := True;
end;

procedure TfrmCadOpcoesRenVar.bbtnConfirmarClick(Sender: TObject);
begin
   if not ValidaCampos then
      Exit;
   if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;
   Try
      qryIDMOEDACONTAB.AsInteger := pRPI.MOECODIGO;
      qryFLGATIVO.AsString := 'S';

      qryOpcaoIDBOLSAVALORES.AsInteger := qryBolsaIDBOLSAVALORES.AsInteger;
      qryOpcaoIDINVESTBASE.AsInteger   := qryAtivoBaseIDINVESTIMENTO.AsInteger;

      if (qry.State = DsInsert) then
      begin
         qryAcaoIDACAO.AsInteger := iIdInvestimento;

         qryAcaoXBolsaIDEMISSOR.AsInteger      := qryIDEMISSOR.AsInteger;
         qryAcaoXBolsaIDBOLSAVALORES.AsInteger := qryBolsa.FieldByName('IDBOLSAVALORES').AsInteger;
         qryAcaoXBolsaIDACAO.AsInteger         := qryIDINVESTIMENTO.AsInteger;
         qryAcaoXBolsaMOECODIGO.AsInteger      := pRPI.MOECODIGO;
         qryAcaoXBolsaSIGLAACAOBOLSA.AsString  := Copy(qryDESCINVESTIMENTO.AsString,1,10);
      end;
      IncluiEmissor;

      qry.ApplyUpdates;
      qry.CommitUpdates;
      qryAcao.ApplyUpdates;
      qryAcao.CommitUpdates;
      qryAcaoXBolsa.ApplyUpdates;
      qryAcaoXBolsa.CommitUpdates;
      qryOpcao.ApplyUpdates;
      qryOpcao.CommitUpdates;
      dtmBaseDados.dbBaseDados.Commit;
   except
      begin
         dtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Ocorreu problema ao incluir a Opção.','Mensagem do Sistema ',mtWarning,[mbOK],0);
      end;
   end;

  inherited;
end;


procedure TfrmCadOpcoesRenVar.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
   iIdInvestimento := LeUltRegistro(nil, 'INVESTIMENTO');

   qryIDINVESTIMENTO.AsInteger := iIdInvestimento;
   qrySTAOPCAO.AsString      := 'S';
   qryIDTIPOINVEST.AsInteger := 2;

   // Insere na tabela Opções
   qryOpcao.Insert;
   qryOpcaoIDOPCAO.AsInteger := LeUltRegistro(nil, 'OPCOES');
   qryOpcaoIDINVESTIMENTO.AsInteger := iIdInvestimento;
   qryAcao.Insert;
   qryAcaoXBolsa.Insert;

end;

procedure TfrmCadOpcoesRenVar.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   qryOpcao.Cancel;
   qryOpcao.CancelUpdates;
   qryAcao.Cancel;
   qryAcao.CancelUpdates;
   qryAcaoXBolsa.Cancel;
   qryAcaoXBolsa.CancelUpdates;
end;

procedure TfrmCadOpcoesRenVar.sbtnApagarClick(Sender: TObject);
begin
//  inherited;
   iIdInvestimento := qryIDINVESTIMENTO.AsInteger;
   if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;
   Try
      if (MsgDlg('Deseja realmente excluir esta Opçãoe ?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
      begin
         qryAux.SQL.Clear;
         qryAux.SQL.Add('DELETE FROM OPCOES ' +
                        'WHERE IDINVESTIMENTO = ' + qryIDINVESTIMENTO.AsString);
         qryAux.ExecSQL;

         qryAux.SQL.Clear;
         qryAux.SQL.Add('DELETE FROM ACOESXBOLSA ' +
                        'WHERE IDACAO = ' + qryIDINVESTIMENTO.AsString);
         qryAux.ExecSQL;

         qryAux.SQL.Clear;
         qryAux.SQL.Add('DELETE FROM ACAO ' +
                        'WHERE IDACAO = ' + qryIDINVESTIMENTO.AsString);
         qryAux.ExecSQL;

         qry.Delete;
         qry.ApplyUpdates;
         qry.CommitUpdates;
         dtmBaseDados.dbBaseDados.Commit;
         Sel(-1);
      end else begin
         dtmBaseDados.dbBaseDados.Rollback;
         Sel(iIdInvestimento);  // Posiciona no mesmo registro
      end;
   except
      begin
         dtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Ocorreu problema ao excluir o Investimento.','Mensagem do Sistema ',mtWarning,[mbOK],0);
         Sel(iIdInvestimento);  // Posiciona no mesmo registro
      end;
   end;
   CmeCadastro.AtualizaBotoes(Self);
   sbtnApagar.Down := False;
end;

procedure TfrmCadOpcoesRenVar.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
   qryOpcao.Edit;
   qryAcao.Edit;
   qryAcaoXBolsa.Edit;
   dblEmissor.Enabled   := False;
   dblkBolsa.Enabled    := False;
   dblAtivoBase.Enabled := False;
end;

Function TfrmCadOpcoesRenVar.IncluiEmissor: Boolean;
Var
  sSiglaEmissor:String;
begin
   Result := True;
   // Verifica Se Emissor já foi Associado.Caso Não, Associa a Bolsa
   if Not FazQuery(QryAux,'SELECT IDBOLSAVALORES, IDEMISSOR '+
                          'FROM EMISSORXBOLSA WHERE IDEMISSOR = '''+
                          qry.FieldByName('IDEMISSOR').AsString +
                          ''' AND IDBOLSAVALORES = '''+
                          Qry.FieldByName('IDBOLSAVALORES').AsString+'''') then
   begin
      Try
         ExecutaQuery(QryAux,
           'INSERT INTO EMISSORXBOLSA (IDBOLSAVALORES, IDEMISSOR, SGLEMISSORBOLSA) '+
           'VALUES ('+ qry.FieldByName('IDBOLSAVALORES').AsString +', '  +
                       qry.FieldByName('IDEMISSOR').AsString	  +', '''+
                       qry.FieldByName('DESCINVESTIMENTO').AsString        +''') ');
      Except
        Result := False;
      End;
   end;
end;

procedure TfrmCadOpcoesRenVar.dblEmissorExit(Sender: TObject);
begin
  inherited;
   AtualizaInvest;
end;

procedure TfrmCadOpcoesRenVar.dblkBolsaExit(Sender: TObject);
begin
  inherited;
   AtualizaInvest;
end;

procedure TfrmCadOpcoesRenVar.AtualizaInvest;
begin
  inherited;
   OperComum.LimpaParametros(qryAtivoBase);
   if Trim(dblEmissor.Text) <> '' then
      qryAtivoBase.ParamByName('IDEMISSOR').AsInteger := qryEmissorIDEMISSOR.AsInteger;
   if Trim(dblkBolsa.Text) <> '' then
      qryAtivoBase.ParamByName('IDBOLSAVALORES').AsInteger := qryBolsaIDBOLSAVALORES.AsInteger;
   qryAtivoBase.Open;
end;

function TfrmCadOpcoesRenVar.ExcluiEmissor: Boolean;
begin
   Result := True;
   Try
      ExecutaQuery(QryAux,
        'DELETE FROM ACOESXBOLSA WHERE '+
        'IDEMISSOR = '      + qryIDEMISSOR.AsString +' AND '  +
        'IDBOLSAVALORES = ' + qryBolsa.FieldByName('IDBOLSAVALORES').AsString +' AND '+
        'IDACAO = '         + qryIDINVESTIMENTO.AsString +' ');
   except
      Result := False;
   end;
end;

end.
