unit fMovBensPendentes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc, DBTables, Wwquery, Grids,
  Wwdbigrd, Wwdbgrid, DBCtrls, MontaSelect, TREdit, wwdbedit,
  wwdblook, Mask, ComCtrls;

type
  TfrmMovBensPendentes = class(TfrmOkCancelar)
    pnlSelNota: TPanel;
    pnlSelBem: TPanel;
    qryBensPend: TwwQuery;
    dsBensPend: TwwDataSource;
    qryNotas: TwwQuery;
    dsNotas: TwwDataSource;
    dbgNotas: TwwDBGrid;
    dbgBensPend: TwwDBGrid;
    Label2: TLabel;
    qryNotasIDPESSOA: TFloatField;
    qryNotasIDFORNSERV: TFloatField;
    qryNotasNOME: TStringField;
    qryNotasIDNOTA: TStringField;
    qryNotasDTANOTA: TDateTimeField;
    qryNotasSOMANOTA: TFloatField;
    Label1: TLabel;
    updBensPend: TUpdateSQL;
    qryRemBensPend: TwwQuery;
    bbtnProcessaNotas: TBitBtn;
    bbtnProcessaBem: TBitBtn;
    qryBensPendIDPESSOA: TFloatField;
    qryBensPendIDFORNSERV: TFloatField;
    qryBensPendIDNOTA: TStringField;
    qryBensPendIDITENSRECDEV: TFloatField;
    qryBensPendPLACA: TFloatField;
    qryBensPendDESBEM: TStringField;
    qryBensPendVALORG: TFloatField;
    qryBensPendIDMODULO: TFloatField;
    qryBensPendIDGRUPO: TFloatField;
    qryBensPendIDCLASSEBEM: TFloatField;
    qryBensPendIDCONJUNTO: TFloatField;
    qryBensPendIDSITUACAO: TFloatField;
    qryBensPendCONTROLE: TStringField;
    qryBensPendCOMPLNOTA: TStringField;
    qryBensPendDTANOTA: TDateTimeField;
    qryBensPendDTAINCLUSAO: TDateTimeField;
    qryBensPendNUMSERIE: TStringField;
    qryBensPendIDTERCEIRO: TFloatField;
    qryBensPendUNIDNEGOC: TFloatField;
    qryBensPendCODSUBCONTA: TFloatField;
    qryBensPendREGISTRO: TStringField;
    qryBensPendVALHISTORICO: TFloatField;
    qryBensPendTAXADEP: TFloatField;
    qryBensPendDATAINICIODEP: TDateTimeField;
    qryBensPendDATAULTDEP: TDateTimeField;
    qryBensPendIDOPCIONAL: TStringField;
    qryBensPendALTERADO: TFloatField;
    qryBensPendPROCESSOAQUIS: TStringField;
    qryBensPendEMPENHOAQUIS: TStringField;
    qryBensPendPUBAUTOR: TStringField;
    qryBensPendPUBEDITORA: TStringField;
    qryBensPendPUBANO: TFloatField;
    qryBensPendDESCSITUACAO: TStringField;
    qryBensPendIDBENSPENDENTES: TFloatField;
    qryPlaca: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnProcessaNotasClick(Sender: TObject);
    procedure bbtnProcessaBemClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dbgNotasCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgBensPendCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgNotasTopRowChanged(Sender: TObject);
    procedure dbgBensPendTopRowChanged(Sender: TObject);
    procedure dbgBensPendDblClick(Sender: TObject);
  private
    { Private declarations }
    bIntegraContab : boolean;
    MensagemErro : String;
    procedure AtivaBensPendentes(bAtiva : Boolean);
    function  RegistraBemPendente : Boolean;
  public
    { Public declarations }
  end;

var
  frmMovBensPendentes: TfrmMovBensPendentes;

implementation

{$R *.DFM}

uses uSistema, fTelaAut, fCadBemPendente, uAtivoFixo, uMensErro, dBaseDados, uDataBase;

procedure TfrmMovBensPendentes.FormCreate(Sender: TObject);
begin
   inherited;
   qryNotas.Prepare;
   qryBensPend.Prepare;
   qryPlaca.Prepare;
   //-------------------------------------------------------------------------------------
   qryNotas.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   qryNotas.Open;
   qryNotas.First;
   //-------------------------------------------------------------------------------------
   MensagemErro := '';
   AtivaBensPendentes(False);
end;
//========================================================================================
procedure TfrmMovBensPendentes.bbtnProcessaNotasClick(Sender: TObject);
begin
   inherited;
   AtivaBensPendentes(True);
end;
//========================================================================================
procedure TfrmMovBensPendentes.AtivaBensPendentes(bAtiva : boolean);
begin
   qryBensPend.Close;
   if bAtiva then
   begin
      try
         StartTransacao;
         //-------------------------------------------------------------------------------
         qryBensPend.ParamByName('PIDPESSOA').AsFloat   := qryNotas.FieldByName('IDPESSOA').AsFloat;
         qryBensPend.ParamByName('PIDFORNSERV').AsFloat := qryNotas.FieldByName('IDFORNSERV').AsFloat;
         qryBensPend.ParamByName('PIDNOTA').AsString    := trim(qryNotas.FieldByName('IDNOTA').AsString);
         qryBensPend.Open;
         //-------------------------------------------------------------------------------
         // Verifica se algum Bem Pendente já foi cadastrado no CAF
         //-------------------------------------------------------------------------------
         qryBensPend.First;
         while not qryBensPend.EOF do
         begin
            qryPlaca.Close;
            qryPlaca.ParamByName('IDPESSOA').AsFloat := qryBensPend.FieldByName('IDPESSOA').AsFloat;
            qryPlaca.ParamByName('PLACA').AsFloat    := qryBensPend.FieldByName('PLACA').AsFloat;
            qryPlaca.Open;
            //----------------------------------------------------------------------------
            if (not qryPlaca.IsEmpty) and (qryBensPend.FieldByName('PLACA').AsFloat > 0) then
            begin
               if MsgDlg('Já existe um Bem Cadastrado no Ativo Fixo com a Placa ' + qryPlaca.FieldByName('PLACA').AsString + ' : ' + #13 + #13 +
                         'Descrição'+#9+': ' + qryPlaca.FieldByName('DESBEM').AsString + #13 +
                         'Documento'+#9+': ' + qryPlaca.FieldByName('IDNOTA').AsString + #13 +
                         'Data'+#9+#9+': ' + qryPlaca.FieldByName('DTANOTA').AsString + #13 +
                         'Fornecedor'+#9+': ' + qryPlaca.FieldByName('NOMEFORN').AsString + #13 + #13 +
                         'Deseja marcar o Bem Pendente como já registrado no Ativo Fixo ?',
                         'Confirmação',mtConfirmation,[mbYes,mbNo,MbCancel],0) = mrYes then
               begin
                  if not Sistema.GravaLogOperacoes('Remoção de Bens Pendentes do Bem ' + qryBensPend.FieldByName('PLACA').AsString) then
                     raise Exception.Create('Erro ao gravar Log de Operação');
                  qryRemBensPend.ParamByName('PIDBENSPENDENTES').AsInteger := qryBensPend.FieldByName('IDBENSPENDENTES').AsInteger;
                  qryRemBensPend.ExecSQL;
               end;
            end;
            //----------------------------------------------------------------------------
            qryBensPend.Next;
         end;
         CommitTransacao;
      except
         On E : Exception do
         begin
            RollBackTransacao;
            MsgDlg('Placa : ' + qryBensPend.FieldByName('PLACA').AsString + #13+#13+
                   'Causa : '+E.Message,
                   'Erro', mtError, [mbOk], 0);
         end;
      end;
      //-------------------------------------------------------------------------------
      qryBensPend.Close;
      qryBensPend.ParamByName('PIDPESSOA').AsFloat   := qryNotas.FieldByName('IDPESSOA').AsFloat;
      qryBensPend.ParamByName('PIDFORNSERV').AsFloat := qryNotas.FieldByName('IDFORNSERV').AsFloat;
      qryBensPend.ParamByName('PIDNOTA').AsString    := trim(qryNotas.FieldByName('IDNOTA').AsString);
      qryBensPend.Open;
      //-------------------------------------------------------------------------------
      if qryBensPend.IsEmpty then
      begin
         qryNotas.Close;
         qryNotas.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
         qryNotas.Open;
         qryNotas.First;
         //----------------------------------------------------------------------------
         qryBensPend.ParamByName('PIDPESSOA').Clear;
         qryBensPend.ParamByName('PIDFORNSERV').Clear;
         qryBensPend.ParamByName('PIDNOTA').Clear;
         qryBensPend.Open;
         //-------------------------------------------------------------------------------
         pnlSelNota.Enabled := True;
         pnlSelBem.Enabled  := False;
         bbtnProcessaNotas.Enabled := True;
         bbtnProcessaBem.Enabled   := False;
         bbtnConfirmar.Enabled     := False;
         bbtnCancelar.Enabled      := False;
      end else
      begin
         pnlSelNota.Enabled := False;
         pnlSelBem.Enabled  := True;
         bbtnProcessaNotas.Enabled := False;
         bbtnProcessaBem.Enabled   := True;
         bbtnConfirmar.Enabled     := True;
         bbtnCancelar.Enabled      := True;
      end;
   end else
   begin
      qryBensPend.ParamByName('PIDPESSOA').Clear;
      qryBensPend.ParamByName('PIDFORNSERV').Clear;
      qryBensPend.ParamByName('PIDNOTA').Clear;
      qryBensPend.Open;
      //----------------------------------------------------------------------------------
      pnlSelNota.Enabled := True;
      pnlSelBem.Enabled  := False;
      bbtnProcessaNotas.Enabled := True;
      bbtnProcessaBem.Enabled   := False;
      bbtnConfirmar.Enabled     := False;
      bbtnCancelar.Enabled      := False;
   end;
   Application.ProcessMessages;
end;
//========================================================================================
procedure TfrmMovBensPendentes.bbtnProcessaBemClick(Sender: TObject);
begin
   inherited;
   AbrirFormModal(frmCadBemPendente,tFrmCadBemPendente);
end;
//========================================================================================
procedure TfrmMovBensPendentes.dbgBensPendDblClick(Sender: TObject);
begin
   inherited;
   qryBensPend.Edit;
   if qryBensPend.FieldbyName('ALTERADO').AsInteger = 1 then
      qryBensPend.FieldbyName('ALTERADO').AsInteger := 0;
   qryBensPend.Post;
end;
//========================================================================================
procedure TfrmMovBensPendentes.bbtnConfirmarClick(Sender: TObject);
var
   iExercicio, iPeriodo      : Integer;
   sMensagem                 : String;
   rBemPendente              : TModalResult;
   
begin
   inherited;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   //-------------------------------------------------------------------------------------
   try
      StartTransacao;
      //----------------------------------------------------------------------------------
      if bIntegraContab then
         if not AtivoFixo.VerificaPeriodoContabil(Sistema.IdEmpresa,
                                                  qryNotas.Fieldbyname('DTANOTA').AsDateTime,
                                                  iExercicio, iPeriodo, sMensagem, True) then
            Raise Exception.Create(AtivoFixo.MensagemErro);
      //----------------------------------------------------------------------------------
      qryBensPend.First;
      while not qryBensPend.EOF do
      begin
         //-------------------------------------------------------------------------------
         // Verifica se algum Bem Pendente já foi cadastrado no CAF
         //-------------------------------------------------------------------------------
         qryPlaca.Close;
         qryPlaca.ParamByName('IDPESSOA').AsFloat := qryBensPend.FieldByName('IDPESSOA').AsFloat;
         qryPlaca.ParamByName('PLACA').AsFloat    := qryBensPend.FieldByName('PLACA').AsFloat;
         qryPlaca.Open;
         if (not qryPlaca.IsEmpty) and (qryBensPend.FieldByName('PLACA').AsFloat > 0) then
         begin
            rBemPendente := MsgDlg('Já existe um Bem Cadastrado no Ativo Fixo com a Placa ' + qryPlaca.FieldByName('PLACA').AsString + ' : ' + #13 + #13 +
                                   'Descrição'+#9+': ' + qryPlaca.FieldByName('DESBEM').AsString + #13 +
                                   'Documento'+#9+': ' + qryPlaca.FieldByName('IDNOTA').AsString + #13 +
                                   'Data'+#9+#9+': ' + qryPlaca.FieldByName('DTANOTA').AsString + #13 +
                                   'Fornecedor'+#9+': ' + qryPlaca.FieldByName('NOMEFORN').AsString + #13 + #13 +
                                   'Deseja marcar o Bem Pendente como já registrado no Ativo Fixo ?',
                                   'Confirmação',mtConfirmation,[mbYes,mbNo,MbCancel],0);
            //----------------------------------------------------------------------------
            case rBemPendente of
               mrYes    : begin
                             if not Sistema.GravaLogOperacoes('Remoção de Bens Pendentes do Bem ' + qryBensPend.FieldByName('PLACA').AsString) then
                                raise Exception.Create('Erro ao gravar Log de Operação');
                             qryRemBensPend.ParamByName('PIDBENSPENDENTES').AsInteger := qryBensPend.FieldByName('IDBENSPENDENTES').AsInteger;
                             qryRemBensPend.ExecSQL;
                          end;
               mrNo     : if not RegistraBemPendente then
                             Raise Exception.Create(MensagemErro);
               mrCancel : Raise Exception.Create('Processamento da Nota Cancelado pelo Usuário!');
            end;
         end else
         begin
            if not RegistraBemPendente then
               Raise Exception.Create(MensagemErro);
         end;
         //-------------------------------------------------------------------------------
         qryBensPend.Next;
      end;
      qryBensPend.CancelUpdates;
      //----------------------------------------------------------------------------------
      CommitTransacao;
      MsgDlg('BENS do Documento selecionado cadastrados no Ativo Fixo.',
             'Informação', mtInformation, [mbOk], 0);
      //----------------------------------------------------------------------------------
      AtivaBensPendentes(False);
      qryNotas.Close;
      qryNotas.Open;
      qryNotas.First;
   except
      On E : Exception do
      begin
         RollBackTransacao;
         MsgDlg('BENS do Documento selecionado NÃO cadastrados no Ativo Fixo.'+#13+#13+
                'Placa : ' + qryBensPend.FieldByName('PLACA').AsString + #13+#13+
                'Causa : '+E.Message,
                'Erro', mtError, [mbOk], 0);
      end;
   end;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;
//========================================================================================
function TfrmMovBensPendentes.RegistraBemPendente : Boolean;
var
   iPlanilha, iTerceiro, iFornecedor,
   iSubConta, iAtivProjeto, iIdBem,
   iBemOld                             : Integer;
   sIdNota, sControle, sRegistro       : String;

begin
   try
      if qryBensPend.FieldByName('ALTERADO').AsInteger = 1 then
      begin
         iBemOld := -1;
         sIdNota := trim(qryNotas.FieldByName('IDNOTA').AsString);
         //-------------------------------------------------------------------------------
         if qryBensPend.FieldByName('IDTERCEIRO').AsInteger = 0 then
         begin
            iTerceiro := -1;
         end else
         begin
            iTerceiro := qryBensPend.FieldByName('IDTERCEIRO').AsInteger;
         end;
         //-------------------------------------------------------------------------------
         if qryBensPend.FieldByName('IDFORNSERV').IsNull then
         begin
            iFornecedor := -1;
         end else
         begin
            iFornecedor := qryBensPend.FieldByName('IDFORNSERV').AsInteger;
         end;
         //-------------------------------------------------------------------------------
         sControle    := qryBensPend.FieldByName('CONTROLE').AsString;
         sRegistro    := qryBensPend.FieldByName('REGISTRO').AsString;
         iSubConta    := qryBensPend.FieldByName('CODSUBCONTA').AsInteger;
         iAtivProjeto := qryBensPend.FieldByName('UNIDNEGOC').AsInteger;
         //-------------------------------------------------------------------------------
         iIdBem := AtivoFixo.ExecutaEntrada(iBemOld,
                                            Sistema.IdModulo,
                                            qryBensPend.FieldByName('IDPESSOA').AsInteger,
                                            qryBensPend.FieldByName('IDCONJUNTO').AsInteger,
                                            iTerceiro,
                                            qryBensPend.FieldByName('IDGRUPO').AsInteger,
                                            iSubConta,
                                            iAtivProjeto,
                                            qryBensPend.FieldByName('IDCLASSEBEM').AsInteger,
                                            qryBensPend.FieldByName('IDITENSRECDEV').AsInteger,
                                            iFornecedor,
                                            -1,                                           // IDIMAGEM
                                            qryBensPend.FieldByName('PLACA').AsFloat,
                                            qryBensPend.FieldByName('IDSITUACAO').AsInteger,
                                            qryBensPend.FieldByName('REGISTRO').AsString,
                                            qryBensPend.FieldByName('CONTROLE').AsString,
                                            qryBensPend.FieldByName('DESBEM').AsString,
                                            qryBensPend.FieldByName('IDNOTA').AsString,
                                            qryBensPend.FieldByName('COMPLNOTA').AsString,
                                            qryBensPend.FieldByName('NUMSERIE').AsString,
                                            qryBensPend.FieldByName('DTANOTA').AsDateTime,
                                            qryBensPend.FieldByName('DTAINCLUSAO').AsDateTime,
                                            qryBensPend.FieldByName('VALORG').AsCurrency,
                                            qryBensPend.FieldByName('VALORG').AsCurrency,
                                            0,
                                            qryBensPend.FieldByName('DATAINICIODEP').AsDateTime,
                                            0,
                                            qryBensPend.FieldByName('TAXADEP').AsFloat,
                                            0,
                                            0,
                                            0,
                                            -1,                                           // Prioridade
                                            -1,                                           // DataInstalacao
                                            -1,                                           // DataTerminoGar
                                            0, 0, 0, 0, '', 0, '',                        // Reavaliações
                                            0, 0, 0, 0, '', 0, '',
                                            qryBensPend.FieldByName('IDOPCIONAL').AsString,
                                            qryBensPend.FieldByName('PROCESSOAQUIS').AsString,
                                            qryBensPend.FieldByName('EMPENHOAQUIS').AsString,
                                            qryBensPend.FieldByName('PUBAUTOR').AsString,
                                            qryBensPend.FieldByName('PUBEDITORA').AsString,
                                            qryBensPend.FieldByName('PUBANO').AsString,
                                            False,-1,
                                            iPlanilha,
                                            True);
         //-------------------------------------------------------------------------------
         if iIdBem > 0 then
         begin
            //----------------------------------------------------------------------------
            // Remove o lancamento
            //----------------------------------------------------------------------------
            qryRemBensPend.ParamByName('PIDBENSPENDENTES').AsInteger := qryBensPend.FieldByName('IDBENSPENDENTES').AsInteger;
            qryRemBensPend.ExecSQL;
         end else
            Raise Exception.Create(AtivoFixo.MensagemErro);
      end;
      Result := True;
   except
      On E : Exception do
      begin
         Result := False;
         MensagemErro := E.Message;
      end;
   end;
end;
//========================================================================================
procedure TfrmMovBensPendentes.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   AtivaBensPendentes(False);
end;
//========================================================================================
procedure TfrmMovBensPendentes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryPlaca.Close;
   qryNotas.Close;
   qryBensPend.Close;
   qryNotas.UnPrepare;
   qryBensPend.UnPrepare;
   qryPlaca.UnPrepare;
end;
//========================================================================================
procedure TfrmMovBensPendentes.dbgNotasCalcCellColors(Sender: TObject;
          Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
          ABrush: TBrush);
begin
   inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if (State <> [gdSelected]) then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := clWhite;
         end else begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;
//========================================================================================
procedure TfrmMovBensPendentes.dbgBensPendCalcCellColors(Sender: TObject;
          Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
          ABrush: TBrush);
begin
   inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := clWhite;
         end else begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;
//========================================================================================
procedure TfrmMovBensPendentes.dbgNotasTopRowChanged(Sender: TObject);
begin
   inherited;
   dbgNotas.Invalidate;
end;
//========================================================================================
procedure TfrmMovBensPendentes.dbgBensPendTopRowChanged(Sender: TObject);
begin
  inherited;
  dbgBensPend.Invalidate;
end;

end.
