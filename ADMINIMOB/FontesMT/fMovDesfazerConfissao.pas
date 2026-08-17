{*******************************************************}
{ Analista Responsável: Helen V. Bianchi                }
{ Atualizado Em: 09/10/2011                             }
{ SOL: 136341 Kintana : 815095                          }
{*******************************************************}
unit fMovDesfazerConfissao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Mask, wwdbedit, Wwdbspin, wwdblook,
  CMDBLookupCombo, mProposta, Grids, Wwdbigrd, Wwdbgrid, MontaSelect, uCtrlPadroes,
  Db, DBTables, Wwquery, Wwdatsrc, ComCtrls,
  uCtrlImobDocumento, uCtrlImobLancamento, wwdbdatetimepicker,
  CMDateTimePicker,uCtrlContab,UFuncoesImob,uCtrlLancamentosImovel;

type
  TfrmMovDesfazerConfissao = class(TfrmOkCancelar)
    grbContrato: TGroupBox;
    Label5: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    edtLocatario: TEdit;
    edtResponsavel: TEdit;
    edtAdministradora: TEdit;
    edtConNumero: TEdit;
    edtConNome: TEdit;
    btnContrato: TBitBtn;
    btnLimpar: TBitBtn;
    GroupBox4: TGroupBox;
    edtDataConfissao: TCMDateTimePicker;
    Panel1: TPanel;
    wwDBGrid1: TwwDBGrid;
    qryContrato: TwwQuery;
    MS_ConfissaoAdmin: TMontaSelect;
    dsContrato: TDataSource;
    qryVerificaDocumento: TwwQuery;
    qryVerificaDocumentoCODDOCUMENTO: TFloatField;
    qryVerificaDocumentoPLNCODIGO: TFloatField;
    qryVerificaDocumentoDATALANCTO: TDateTimeField;
    qryVerificaDocumentoVALOR: TFloatField;
    qryVerificaDocumentoOPERACAO: TStringField;
    qryVerificaBaixa: TwwQuery;
    qryContratoLOCATARIO: TStringField;
    qryContratoRESPONSAVEL: TStringField;
    qryContratoADMINISTRADORA: TStringField;
    qryContratoIDCONTRATOIMOVEL: TFloatField;
    qryContratoCONNUMERO: TStringField;
    qryContratoCONNOME: TStringField;
    qryContratoIDCONFISSAODIVIDA: TFloatField;
    qryContratoCODDOCUMENTO: TFloatField;
    qryContratoDATACONFISSAO: TDateTimeField;
    qryContratoDATAVENCIMENTO: TDateTimeField;
    qryContratoVALOR: TFloatField;
    qryContratoPLNCODIGO_OPER: TFloatField;
    qryVerificaIntegracao: TwwQuery;
    qryVerificaIntegracaoCODDOCUMENTO: TFloatField;
    qryVerificaIntegracaoNUMLANCTO: TFloatField;
    qryVerificaIntegracaoCODALTERADOR: TFloatField;
    qryVerificaIntegracaoPLNCODIGO: TFloatField;
    qryVerificaIntegracaoDATALANCTO: TDateTimeField;
    qryVerificaIntegracaoVALOR: TFloatField;
    qryVerificaIntegracaoVALOROUTRAMOEDA: TFloatField;
    qryVerificaIntegracaoDEBCRE: TStringField;
    qryVerificaIntegracaoOPERACAO: TStringField;
    qryVerificaIntegracaoHISTORICOCOMPL: TStringField;
    qryVerificaIntegracaoIDUSUARIOINCLUSAO: TFloatField;
    qryVerificaIntegracaoESTORNO: TFloatField;
    qryVerificaIntegracaoLOTETRANSMISSAO: TFloatField;
    qryVerificaIntegracaoCODTIPDOC: TFloatField;
    qryVerificaIntegracaoVLRLIQUIDO: TFloatField;
    qryVerificaIntegracaoNUMFATURA: TStringField;
    qryVerificaIntegracaoFLGTIPOFATURA: TStringField;
    qryVerificaIntegracaoFLGFATEMITIDA: TStringField;
    qryVerificaIntegracaoNUMRECIBO: TStringField;
    qryVerificaIntegracaoIDNFLIVRO: TFloatField;
    qryVerificaIntegracaoUNIDNEGOC: TFloatField;
    qryVerificaIntegracaoIDPESSOA: TFloatField;
    qryVerificaIntegracaoNUMLOTEMANUAL: TFloatField;
    qryVerificaIntegracaoCODDOCINSS: TFloatField;
    qryVerificaIntegracaoNUMNF: TStringField;
    qryVerificaIntegracaoFLGRECEBEUNF: TStringField;
    qryVerificaIntegracaoIDAPURACAOPIS: TFloatField;
    qryVerificaIntegracaoIDMOTIVOCANCFAT: TFloatField;
    qryVerificaIntegracaoFLGLANCBAIXAADTO: TStringField;
    qryVerificaIntegracaoFLGLANCBAIXA: TStringField;
    qryVerificaIntegracaoFLGCONTABILIZA: TStringField;
    qryVerificaIntegracaoIDLOTEEXPORTACTB: TFloatField;
    qryVerificaIntegracaoPLNANTECIPA: TFloatField;
    qryVerificaIntegracaoIDENVIODOCUMENTO: TFloatField;
    qryVerificaContabil: TwwQuery;
    qryVerificaIntegBaixa: TwwQuery;
    qryVerificaIntegBaixaCODDOCUMENTO: TFloatField;
    qryVerificaIntegBaixaNUMLANCTO: TFloatField;
    qryVerificaIntegBaixaPLNCODIGO: TFloatField;
    qryVerificaIntegBaixaDATALANCTO: TDateTimeField;
    qryVerificaIntegBaixaVALOR: TFloatField;
    qryVerificaBaixaCODDOCUMENTO: TFloatField;
    qryVerificaBaixaPLNCODIGO: TFloatField;
    qryVerificaBaixaNUMLANCTO: TFloatField;
    qryVerificaBaixaDATALANCTO: TDateTimeField;
    qryVerificaBaixaVALOR: TFloatField;
    qryVerificaBaixaHISTORICOCOMPL: TStringField;
    qryVerificaContabilCODDOCUMENTO: TFloatField;
    qryVerificaContabilPLNCODIGO: TFloatField;
    qryVerificaContabilDATALANCTO: TDateTimeField;
    qryVerificaContabilTIPO: TFloatField;
    qryAux: TwwQuery;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure DBgrdBemOriginalCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
    procedure DBgrdBemOriginalTopRowChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnContratoClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
  private
    { Private declarations }

    CtrlDocumento      : TCtrlImobDocumento;
    CtrlLancamento     : TCtrlImobLancamento;
    CtrlContab         : TCtrlContab;
    CtrlLancamentosImovel : TCtrlLancamentosImovel;

    function VerificaConfissao : Boolean;
    function ExcluiLancamentos(const iIdConfissao: Integer) : Boolean;
    function ExcluirConfissao  : Boolean;
  public
    { Public declarations }
  end;

var
  frmMovDesfazerConfissao: TfrmMovDesfazerConfissao;
  sMens : String;
implementation

{$R *.DFM}
uses uMensErro, uDataBase, uComunsImobiliario, uVerificaPreenchimento,
     uSistema, Dms, dImobiliario;

procedure TfrmMovDesfazerConfissao.bbtnCancelarClick(Sender: TObject);
var bResult : Boolean;
begin
   inherited;
   if MsgDlg('Confirma Exclusão da Confissão de Dívida?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo then begin
      Exit;
   end;
   if VerificaConfissao then begin
      try
         StartTransacao;
         bResult := ExcluiLancamentos(StrToInt(qryContratoIDCONFISSAODIVIDA.AsString));
         if bResult then bResult := ExcluirConfissao;
         if bResult then
         begin
            CommitTransacao;
            MsgDlg('Confissão de Dívida Desfeita com Sucesso','Informação',mtInformation,[mbOk],0);
            btnLimparClick(Sender);
         end else
         begin
            RollBackTransacao;
            MsgDlg('Ocorreram ERROS no Desfazer a Confissão de Dívida. ' + sMens ,'Aviso',mtWarning,[mbOk],0);
         end;
      except
         RollBackTransacao;
         MsgDlg('Ocorreram ERROS no Desfazer a Confissão de Dívida. ' + sMens ,'Aviso' ,mtWarning,[mbOk],0);
      end;
   end;
end;
// -------------------------------------------------------------------------------
// Verifica se existe algum lançamento superior, que impeça desfazer a confissao
// -------------------------------------------------------------------------------
function TfrmMovDesfazerConfissao.VerificaConfissao: Boolean;
begin
    Result := True;
    if qryContratoIDCONTRATOIMOVEL.Value > 0 then
    begin
        qryContrato.First;
        while not qryContrato.eof do
        begin
            // Verifica se exitem documentos Baixados
            qryVerificaDocumento.close;
            qryVerificaDocumento.ParamByName('pCODDOCUMENTO').Value := qryContratoCODDOCUMENTO.value;
            qryVerificaDocumento.Open;
            if qryVerificaDocumentoCODDOCUMENTO.Value > 0 then
               Result := False;
            qryContrato.Next;
        end;
        if Result = False then
        begin
           MsgDlg('Existem parcelas pagas para esta confissão de dívida. Não será possível a exclusão.  ','Aviso',mtWarning,[mbOk],0);
        end
        else
        begin
             qryVerificaContabil.close;
             qryVerificaContabil.ParamByName('pIDCONTRATOIMOVEL').Value  := qryContratoIDCONTRATOIMOVEL.AsFloat;
             qryVerificaContabil.ParamByName('PIDCONFISSAODIVIDA').Value := qryContratoIDCONFISSAODIVIDA.AsFloat;
             qryVerificaContabil.ParamByName('PPLNCODIGO').Value         := qryContratoPLNCODIGO_OPER.AsFloat;
             qryVerificaContabil.open;
             qryVerificaContabil.First;
             while not qryVerificaContabil.eof do
             begin
                  if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,qryVerificaContabilDATALANCTO.AsString) then
                  begin
                      sMens := sMens + CtrlContab.MessageInfo;
                      MsgDlg('Existem parcelas com data de vencimento dentro do período bloqueado pela Contabilidade. Não será possível a exclusão.  ', 'Aviso', mtWarning, [mbOk], 0);
                      Result := False;
                      break;
                  end;
                  qryVerificaContabil.Next;
             end;
        end;
    end;
end;
// -----------------------------------------------------------------------------
// Exclui os registros da Confissao e desfaz a contabilização da incorporação
// -----------------------------------------------------------------------------
function TfrmMovDesfazerConfissao.ExcluiLancamentos(const iIdConfissao: Integer): Boolean;
var sSql, sCond  : String;
    iTipo : Integer;
begin
   Result := True;
   try
      qryContrato.First;
      qryContrato.DisableControls;
      // Verifica os Documentos  Baixados e Desfaz a Baixa
      qryVerificaBaixa.close;
      qryVerificaBaixa.ParamByName('PIDCONFISSAODIVIDA').AsFloat := qryContratoIDCONFISSAODIVIDA.Value ;
      qryVerificaBaixa.ParamByName('pIDCONTRATOIMOVEL').AsFloat  := qryContratoIDCONTRATOIMOVEL.Value ;
      qryVerificaBaixa.Open;
      qryVerificaBaixa.First;
      while not qryVerificaBaixa.eof do
      begin
          // Some com o LancToDocum e desfaz a contabilização se houver
          CtrlDocumento.Prepare(OpLanctoDocumImob, odlAlteradorImob);
          CtrlDocumento.OpenTransaction       := False;
          CtrlDocumento.UsaPlanoPatro         := Sistema.UsaPlanoPatro;
          CtrlDocumento.CodDocumento          := qryVerificaBaixaCODDOCUMENTO.asInteger;
          CtrlDocumento.Lanctodocum.NumLancto := qryVerificaBaixaNUMLANCTO.asInteger;
          CtrlDocumento.Delete;
          CtrlLancamento.OpenTransaction := False;
          CtrlLancamento.ExcluiLancaContab( Sistema.idUsuario,
                                            qryVerificaBaixaPLNCODIGO.asInteger,
                                            Sistema.idModulo, 0,
                                            Sistema.UsaPlanoPatro, True);
          sSql := ' UPDATE DOCUMENTO SET FLGNAOCONCILIADO = ''1'' '+#13+
                  ' WHERE CODDOCUMENTO = ' + (qryVerificaBaixaCODDOCUMENTO.AsString);
           if not ExecutarQuery(qryAux, sSql) then
           begin
               Result := False;
               sMens  := sMens + ' Falha ao Atualizar Documento.';
               Break;
             end;


          qryVerificaBaixa.Next;
      end;
      try
         // Exclui os Documentos Gerados  - Novas Parcelas
         with qryContrato do
         begin
            if not IsEmpty then
            begin
               First;
               while not Eof do
               begin
                  if not qryContratoCODDOCUMENTO.IsNull then
                  begin
                      // Verifica dados da integraçao , se já foram integrados
                      qryVerificaIntegracao.close;
                      qryVerificaIntegracao.ParamByName('PCODDOCUMENTO').AsFloat := qryContratoCODDOCUMENTO.Value ;
                      qryVerificaIntegracao.open;
                      if not qryVerificaIntegracao.Eof then
                      begin
                           if not CtrlLancamentosImovel.Excluir(qryVerificaIntegracaoCODDOCUMENTO.AsInteger,False, qryVerificaIntegracaoPLNCODIGO.AsInteger) then
                           begin
                             sMens := sMens +  CtrlLancamentosImovel.MessageInfo ;
                             Result := False;
                             Break;
                           end;
                      end
                      else
                      begin
                         sSql := 'DELETE FROM LANCAMENTOSIMOVEL '+#13+
                                 ' WHERE IDDOCUMENTO = ' + (qryContratoCODDOCUMENTO.AsString);
                         if not ExecutarQuery(qryAux, sSql) then
                         begin
                             Result := False;
                             sMens  := sMens + ' Falha ao excluir Lançamentos.';
                             Break;
                           end;

                      end;
                  end;
                  Next;
               end;
            end;
         end;
         if Result = true then
         begin
             // Exclui a Contabilização dos Operadores
             if not qryContratoPLNCODIGO_OPER.IsNull then
             begin
                // exclui os lançamentos da planilha Contabil
                with dtmImobiliario.qryExcluiLancContab do begin
                   LimpaParametros(dtmImobiliario.qryExcluiLancContab);
                   ParamByName('PPLNCODIGO').asInteger := qryContratoPLNCODIGO_OPER.AsInteger;
                   ExecSQL;
                end;
                // exclui a planilha contabil
                with dtmImobiliario.qryExcluiPlanilha do
                begin
                   LimpaParametros(dtmImobiliario.qryExcluiPlanilha);
                   ParamByName('PPLNCODIGO').asInteger := qryContratoPLNCODIGO_OPER.AsInteger;
                   ExecSQL;
                end;
             end;
         end;
      except
         Result := False;
      end;
   finally
      qryContrato.EnableControls;
   end;
end;

procedure TfrmMovDesfazerConfissao.DBgrdBemOriginalCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWindow;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;

procedure TfrmMovDesfazerConfissao.DBgrdBemOriginalTopRowChanged(
  Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;


procedure TfrmMovDesfazerConfissao.FormCreate(Sender: TObject);
begin
  inherited;

  CtrlDocumento  := TCtrlImobDocumento.Create;
  CtrlLancamento := TCtrlImobLancamento.Create;
  CtrlContab     := TCtrlContab.Create;
  CtrlDocumento.InitializeAs(Padroes);
  CtrlLancamento.InitializeAs(Padroes);
  CtrlContab.InitializeAs(Padroes);
  CtrlLancamentosImovel := TCtrlLancamentosImovel.Create(Sistema.IdEmpresa,Sistema.IDModulo, Sistema.IdUsuario, Sistema.IdEspAcesso,Sistema.UsaPlanoPatro);
  CtrlLancamentosImovel.InitializeAs(Padroes);
end;



procedure TfrmMovDesfazerConfissao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FreeAndNil(CtrlDocumento);
   FreeAndNil(CtrlLancamento);
   FreeAndNil(CtrlContab);
   FreeAndNil(CtrlLancamentosImovel);
  inherited;
end;


procedure TfrmMovDesfazerConfissao.btnContratoClick(Sender: TObject);
begin
  inherited;
  MS_ConfissaoAdmin.Executar;
  Repaint;
  if MS_ConfissaoAdmin.RetornouValor then
  begin
      if StrToInt(MS_ConfissaoAdmin.ValoresChave[0])  > 0 then
      begin
          qryContrato.Close ;
          qryContrato.ParamByName('pIDCONTRATOIMOVEL').AsFloat := StrTofloat(MS_ConfissaoAdmin.ValoresChave[0]);
          qryContrato.ParamByName('pIDCONFISSAODIVIDA').AsFloat := StrTofloat(MS_ConfissaoAdmin.ValoresChave[1]);
          qryContrato.Open ;
          edtConNumero.text := qryContratoCONNUMERO.AsString ;
          edtConNome.text   := qryContratoCONNOME.AsString ;
          edtLocatario.text := qryContratoLOCATARIO.AsString ;
          edtAdministradora.text := qryContratoADMINISTRADORA.AsString ;
          edtResponsavel.text    := qryContratoRESPONSAVEL.AsString ;
          edtDataConfissao.text  := qryContratoDATACONFISSAO.asString  ;
          bbtnCancelar.Enabled   := True;
          sMens := '';
      end;
  end;
end;

procedure TfrmMovDesfazerConfissao.btnLimparClick(Sender: TObject);
begin
  inherited;
  edtConNumero.Clear ;
  edtConNome.Clear;
  edtLocatario.Clear;
  edtAdministradora.Clear;
  edtResponsavel.Clear;
  edtDataConfissao.Clear;
  qryContrato.Close;
  bbtnCancelar.Enabled   := False;
end;

function TfrmMovDesfazerConfissao.ExcluirConfissao: Boolean;
var sSql : String;
begin
   Result := True;
   try
       sSql := ' DELETE FROM CONFISSAOXOPER ' +
               ' WHERE IDCONFISSAODIVIDA  =  ' + qryContratoIDCONFISSAODIVIDA.AsString;
             ExecutarQuery(qryAux, sSql);

       sSql := ' DELETE FROM CONFISSAOXCONDICAO ' +
               ' WHERE IDCONFISSAODIVIDA  =  ' + qryContratoIDCONFISSAODIVIDA.AsString;
       ExecutarQuery(qryAux, sSql);

       sSql := ' DELETE FROM CONFISSAOXDOCUMENTO ' +
               ' WHERE IDCONFISSAODIVIDA  =  ' + qryContratoIDCONFISSAODIVIDA.AsString;
       ExecutarQuery(qryAux, sSql);

       sSql := ' DELETE FROM CONFISSAODIVIDA ' +
               ' WHERE IDCONFISSAODIVIDA  =  ' + qryContratoIDCONFISSAODIVIDA.AsString;
       ExecutarQuery(qryAux, sSql);
   except
         Result := False;
   end;

end;

end.
