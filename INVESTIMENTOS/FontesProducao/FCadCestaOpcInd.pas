//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_3
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
//Data	    : 06/03/2006
//Código    : Al_2
//Pendencia :
//SOL       :
//Motivo(S) : Implementação da trava de fechamento de renda variavel
//******************************************************************************
// Data     : 10/06/2005
// Código   : AL_1
// Motivo   : Implementação do teste de período contabil em 3 camadas
//******************************************************************************

unit FCadCestaOpcInd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMDetCSInv, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  fcLabel, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe, ExtCtrls, wwdblook, wwdbdatetimepicker, FPreview,
  CMDateTimePicker, TREdit, faMensagem, uCtrlInvContab;

type
  TTipoOper = set of (Inserir,Excluir,Consultar);

  TfrmCadCestaOpcInd = class(TfrmCadastroMDetInv)
    dblOpcao: TwwDBLookupCombo;
    Label1: TLabel;
    dDbDataVigencia: TCMDateTimePicker;
    lblCarteira: TLabel;
    lblCustodiante: TLabel;
    dblkCustodianteCesta: TwwDBLookupCombo;
    Label3: TLabel;
    dblkAcao: TwwDBLookupCombo;
    dbreQtdCesta: TDBRealEdit;
    Label6: TLabel;
    lblCotacao: TLabel;
    dbreCotacao: TDBRealEdit;
    Label8: TLabel;
    dbreVlrCesta: TDBRealEdit;
    dblkCarteiraCesta: TwwDBLookupCombo;
    qryCarteiraCesta: TwwQuery;
    qryCarteiraCestaCARTEIRA: TStringField;
    qryCarteiraCestaIDCARTEIRA: TStringField;
    qryCarteiraCestaIDCARTEIRAINVEST: TFloatField;
    qryCarteiraCestaIDCARTEIRAGERENC: TFloatField;
    qryCustodianteCesta: TwwQuery;
    qryCustodianteCestaSGLCUSTODIANTE: TStringField;
    qryCustodianteCestaIDCUSTODIANTE: TFloatField;
    qryAcaoCesta: TwwQuery;
    qryAcaoCestaDESCINVESTIMENTO: TStringField;
    qryAcaoCestaSGLCUSTODIANTE: TStringField;
    qryAcaoCestaSALDOLIBERADO: TFloatField;
    qryAcaoCestaSALDOBLOQUEADO: TFloatField;
    qryAcaoCestaIDCARTEIRAINVEST: TFloatField;
    qryAcaoCestaIDCUSTODIANTE: TFloatField;
    qryAcaoCestaIDINVESTIMENTO: TFloatField;
    qryAcaoCestaIDLOTE: TStringField;
    qryIDCESTAOPCIND: TFloatField;
    qryDATAVIGENCIA: TDateTimeField;
    qryIDINVESTIMENTO: TFloatField;
    qryQUANTIDADE: TFloatField;
    qryCOTACAO: TFloatField;
    qryVALOR: TFloatField;
    qryIDCUSTODIANTE: TFloatField;
    qryIDCARTEIRAINVEST: TFloatField;
    qryIDCARTEIRAGERENC: TFloatField;
    qryDESCINVESTIMENTO: TStringField;
    QryDelCestaDia: TwwQuery;
    Toolbar974: TToolbar97;
    Panel1: TPanel;
    lblValTotCesta: TfcLabel;
    fcLabel2: TfcLabel;
    pnlEspacador: TPanel;
    lblValMinCesta: TfcLabel;
    fcLabel1: TfcLabel;
    fcLabel3: TfcLabel;
    lblValMaxCesta: TfcLabel;
    qryIDORDEMOPCIND: TFloatField;
    qryIDLOTE: TStringField;
    qryOrdemOpcInd: TwwQuery;
    qryOrdemOpcIndDESCINVESTIMENTO: TStringField;
    qryOrdemOpcIndDATAORDEM: TDateTimeField;
    qryOrdemOpcIndIDCESTAOPCIND: TFloatField;
    qryOrdemOpcIndIDINVESTIMENTO: TFloatField;
    qryOrdemOpcIndIDTIPOOPERACAO: TFloatField;
    qryDetalheIDCESTAOPCIND: TFloatField;
    qryDetalheDATAVIGENCIA: TDateTimeField;
    qryDetalheIDINVESTIMENTO: TFloatField;
    qryDetalheQUANTIDADE: TFloatField;
    qryDetalheCOTACAO: TFloatField;
    qryDetalheVALOR: TFloatField;
    qryDetalheIDCUSTODIANTE: TFloatField;
    qryDetalheIDCARTEIRAINVEST: TFloatField;
    qryDetalheIDCARTEIRAGERENC: TFloatField;
    qryDetalheTRGDTINCLUSAO: TDateTimeField;
    qryDetalheTRGUSERINCLUSAO: TStringField;
    qryOrdemOpcIndIDLOTE: TStringField;
    QryMaxMinCesta: TwwQuery;
    qryAcaoCestaIDEMISSOR: TFloatField;
    qryOrdemOpcIndIDBOLETA: TStringField;
    Label2: TLabel;
    fraCestaOpcInd: TfraMensagem;
    qryVerificaVigencias: TwwQuery;
    qryVerificaVigenciasDATAVIGENCIA: TDateTimeField;
    sbtnPosicao: TToolbarButton97;
    qryDESCCARTINVEST: TStringField;
    qryIDBOLETA: TStringField;
    lblStatus: TfcLabel;
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblOpcaoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure dbgrdDetDblClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure dblkCarteiraCestaExit(Sender: TObject);
    procedure dblkCustodianteCestaExit(Sender: TObject);
    procedure dblkAcaoExit(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure dbreQtdCestaExit(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure dbreCotacaoExit(Sender: TObject);
    procedure dDbDataVigenciaExit(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnPosicaoClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dblOpcaoExit(Sender: TObject);
  private
    { Private declarations }
    fLote, fDif, fValAnt, fMinCesta, fMaxCesta: Double;
    iOrdem: Integer;
    bExibeMens: Boolean;
    procedure AbreQry;
    procedure AbreQryAcoes;
    procedure AbreQryCustodiante;
    procedure AtualizaBotoesDet(bAlterar : Boolean);
    procedure CalculaValorInvCesta;
    procedure MostraVlrCesta;
    function  VerificaValoresCesta: Boolean;
    function  VerDifCesta(fValorAcresc : Double) : boolean;
  public
    { Public declarations }
  end;

var
  frmCadCestaOpcInd: TfrmCadCestaOpcInd;
  fValorNovoCesta,fQtdTransf : Double;
  bFlagAlteraCesta : Boolean;
  sTipoOper : TTipoOper;
  iIdHistCartInvDest,iCarteiraOrig,iCarteiraDest,iMotBloqOrig,iMotBloqDest,iMercadoOrig,iMercadoDest : Integer;
implementation

uses dBaseDados, UOpcaoIndice, UOperacaoInvest, UBibliotecaInvest, UOperComum,
     UDiasUteisInv, UDataBase, UMensErro, dOpcoesIndice,
     FDmRelConsPosAltCestaOpcInd, URendaVariavel;

{$R *.DFM}

procedure TfrmCadCestaOpcInd.bbtnOkDetClick(Sender: TObject);
Var
   fValorCestaAntes : Double;
begin
  if not CtrlInvContab.TestaPeriodo(dDbDataVigencia.Text, 2, 8) then
  begin
     MsgDlg(CtrlInvContab.MessageInfo,'Mensagem do Sistema', MtWarning,[MbOk],0);
     Exit;
  end;

  try
     qry.FieldByName('DESCINVESTIMENTO').AsString := dblkAcao.Text;
     qry.FieldByName('IDCESTAOPCIND').AsInteger   := StrToInt(dblOpcao.LookupValue);

     if not VerificaValoresCesta then
        Exit;

     fQtdTransf := Qry.FieldByName('QUANTIDADE').AsFloat;

     If (Qry.FieldByName('QUANTIDADE').OldValue <> Qry.FieldByName('QUANTIDADE').AsFloat) or
        (Qry.FieldByName('VALOR').OldValue <> Qry.FieldByName('VALOR').AsFloat) Then
     begin
        bFlagAlteraCesta := True;
        if qry.State = dsInsert then
           sTipoOper := [Inserir]
        else if qry.State = dsEdit then
        begin
           fQtdTransf := Abs(Qry.FieldByName('QUANTIDADE').OldValue - Qry.FieldByName('QUANTIDADE').AsFloat);
           if Qry.FieldByName('QUANTIDADE').OldValue = Qry.FieldByName('QUANTIDADE').AsFloat then
              sTipoOper := [Consultar]
           else if Qry.FieldByName('QUANTIDADE').OldValue > Qry.FieldByName('QUANTIDADE').AsFloat then
              sTipoOper := [Excluir]
           else
              sTipoOper := [Inserir]
        end;

     end;

     fValorNovoCesta := fValorNovoCesta + Qry.FieldByName('VALOR').AsFloat;

     lblValTotCesta.Caption := FormatFloat('###,###,###,###,##0.00', fValorNovoCesta);
     lblValTotCesta.Repaint;

     inherited;

     fValorCestaAntes := fValorNovoCesta;

     bbtnCancelarDetClick(Sender);

     fValorNovoCesta  := fValorCestaAntes;
  finally
     bbtnCancelar.Default   := True;
     bbtnConfirmar.Cancel   := True;
     bbtnOkDet.Default      := False;
     bbtnCancelarDet.Cancel := False;
  end;
end;

procedure TfrmCadCestaOpcInd.bbtnConfirmarClick(Sender: TObject);
var
   dDataAnt : TDateTime;
begin
  //AL_1
  //AL_3
  if not CtrlInvContab.TestaPeriodo(dDbDataVigencia.Text, 2, 8) then
  begin
     MsgDlg(CtrlInvContab.MessageInfo,'Mensagem do Sistema', MtWarning,[MbOk],0);
     Exit;
  end;

  If Not bFlagAlteraCesta Then
     Exit;

  fValorNovoCesta := 0;

  Try
     If not dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.StartTransaction;

     Qry.DisableControls;
     Qry.First;
     OperComum.LimpaParametros(QryDelCestaDia);
     QryDelCestaDia.ParamByName('IDCESTAOPCIND').AsInteger :=
                    Qry.FieldByName('IDCESTAOPCIND').AsInteger;
     QryDelCestaDia.ParamByName('DATAVIGENCIA').AsString   := dDbDataVigencia.Text;
     QryDelCestaDia.ExecSQL;

     OperComum.LimpaParametros(QryDetalhe);
     QryDetalhe.Open;

     While Not Qry.Eof Do
     begin
        QryDetalhe.Insert;
        QryDetalhe.FieldByName('IDCESTAOPCIND').AsInteger    :=
                   Qry.FieldByName('IDCESTAOPCIND').AsInteger;

        QryDetalhe.FieldByName('IDCUSTODIANTE').AsInteger    :=
                  Qry.FieldByName('IDCUSTODIANTE').AsInteger;

        QryDetalhe.FieldByName('IDINVESTIMENTO').AsInteger   :=
                  Qry.FieldByName('IDINVESTIMENTO').AsInteger;

        QryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger :=
                  Qry.FieldByName('IDCARTEIRAINVEST').AsInteger;

        QryDetalhe.FieldByName('DATAVIGENCIA').AsDateTime    := StrToDate(dDbDataVigencia.Text);

        QryDetalhe.FieldByName('VALOR').AsFloat              :=
                   Qry.FieldByName('VALOR').AsFloat;

        QryDetalhe.FieldByName('COTACAO').AsFloat            :=
                   Qry.FieldByName('COTACAO').AsFloat;

        QryDetalhe.FieldByName('QUANTIDADE').AsFloat         :=
                   Qry.FieldByName('QUANTIDADE').AsFloat;

        QryDetalhe.Post;
        QryDetalhe.ApplyUpdates;
        QryDetalhe.CommitUpdates;
        Qry.Next;
     end;

     Qry.Close;

     fMinCesta := 0;
     fMaxCesta := 0;
     fValorNovoCesta := 0;

     If Not VerDifCesta(0) Then
     begin
        MostraVlrCesta;
        MsgDlg('Essa Operação será Cancelada.', 'Mensagem do Sistema', MtWarning,[MbOk],0);
        If dtmBaseDados.dbBaseDados.InTransaction then
           dtmBaseDados.dbBaseDados.Rollback;

        Qry.EnableControls;
        bbtnCancelarClick(Sender);
        Exit;
     end;

     dtmBaseDados.dbBaseDados.Commit;

     fMinCesta := 0;
     fMaxCesta := 0;
     fValorNovoCesta := 0;

     AbreQry;
     VerDifCesta(0);
     MostraVlrCesta;

     fValorNovoCesta := StrToFloat(StrTran(lblValTotCesta.Caption,'.'));

     If Not Qry.IsEmpty Then
        AtualizaBotoesDet(True)
     Else
        AtualizaBotoesDet(False);

     Qry.EnableControls;

     if bExibeMens then
        MsgDlg('Operação Concluída com Sucesso!', 'Mensagem do Sistema', MtConfirmation,[MbOk],0);
  Except
     MsgDlg('Ocorreu algum erro na Operação.', 'Mensagem do Sistema', MtWarning,[MbOk],0);
     If dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.Rollback;
     Qry.EnableControls;
     bbtnCancelarClick(Sender);
     Exit;
  end;

  QryDetalhe.Close;
  QryDetalhe.Open;

  AtualizaBotoesDet(True);
  bbtnConfirmar.Enabled := False;
  bbtnCancelar.Enabled  := False;

  If bExibeMens Then
     bFlagAlteraCesta      := False;

end;

procedure TfrmCadCestaOpcInd.FormShow(Sender: TObject);
begin
   inherited;

   fraCestaOpcInd.Apaga;

   pnlFundo.Enabled   := True;
   pnlMestre.Enabled  := True;
   dblOpcao.Enabled   := True;

   qryCarteiraCesta.Open;

   dDbDataVigencia.DateTime    := pRPI.DATAULTFECH;
   While not DiasUteisInv.DiaUtil(dDbDataVigencia.DateTime,-1,1,'',True,False,False) Do
      dDbDataVigencia.DateTime := dDbDataVigencia.DateTime + 1;   // Achar o proximo dia útil

   qryOrdemOpcInd.Close;
   qryOrdemOpcInd.ParamByName('DATAFECHTO').AsString := DateToStr(dDbDataVigencia.Date);
   qryOrdemOpcInd.Open;

   bExibeMens := True;

end;

procedure TfrmCadCestaOpcInd.dblOpcaoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   fMinCesta := 0;
   fMaxCesta := 0;
   sbtnApagar.Enabled := False;
   fValorNovoCesta := 0;

   If Trim(dblOpcao.Text) <> '' Then
   begin
      AbreQry;
      VerDifCesta(0);
      MostraVlrCesta;
      If Not Qry.IsEmpty Then
         AtualizaBotoesDet(True)
      Else
         AtualizaBotoesDet(False);

      bFlagAlteraCesta := False;
      sbtnApagar.Enabled := True;
   end
   Else
      bbtnCancelarClick(Sender);     

   fValorNovoCesta := StrToFloat(StrTran(lblValTotCesta.Caption,'.'));

end;

procedure TfrmCadCestaOpcInd.AbreQry;
begin
   OperComum.LimpaParametros(qry);
   qry.ParamByName('IDCESTAOPCIND').AsInteger := StrToInt(dblOpcao.LookupValue);
   qry.ParamByName('DATAVIGENCIA').AsString   := dDbDataVigencia.Text;
   qry.Open;

   OperComum.LimpaParametros(qryDetalhe);
   qryDetalhe.Open;

   if (qryDATAVIGENCIA.AsDateTime = dDbDataVigencia.DateTime) and (not qryIDBOLETA.IsNull) then
   begin
      dbgrdDet.Color := clBtnFace;
      tbcDetalhe.Enabled := False;
      lblStatus.Caption := 'Boleta ' + qryIDBOLETA.AsString;
      lblStatus.Visible := True;
   end
   else
   begin
      lblStatus.Visible := False;
      dbgrdDet.Color := clWhite;
      tbcDetalhe.Enabled := True
   end;

end;

procedure TfrmCadCestaOpcInd.AbreQryAcoes;
begin
   OperComum.LimpaParametros(qryAcaoCesta);
   if Trim(dDbDataVigencia.Text) <> '' then
   begin
      qryAcaoCesta.ParamByName('DATAMOV').AsString := dDbDataVigencia.Text;
      if Trim(dblkCarteiraCesta.Text) <> '' then
         qryAcaoCesta.ParamByName('IDCARTEIRAINVEST').AsInteger := qryCarteiraCestaIDCARTEIRAINVEST.AsInteger;
      if Trim(qryCustodianteCesta.Text) <> '' then
         qryAcaoCesta.ParamByName('IDCUSTODIANTE').AsInteger := qryCustodianteCestaIDCUSTODIANTE.AsInteger;
   end else begin
      qryAcaoCesta.ParamByName('DATAMOV').AsString := '';
      qryAcaoCesta.ParamByName('IDCARTEIRAINVEST').AsInteger := 0;
      qryAcaoCesta.ParamByName('IDCUSTODIANTE').AsInteger := 0;
   end;
   qryAcaoCesta.Open;
end;

procedure TfrmCadCestaOpcInd.AbreQryCustodiante;
begin
   OperComum.LimpaParametros(qryCustodianteCesta);
   qryCustodianteCesta.ParamByName('DATAMOV').AsString := dDbDataVigencia.Text;
   if Trim(dblkCarteiraCesta.Text) <> '' then
      qryCustodianteCesta.ParamByName('IDCARTEIRAINVEST').AsInteger := qryIDCARTEIRAINVEST.AsInteger;
   qryCustodianteCesta.Open;
end;

procedure TfrmCadCestaOpcInd.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   sbtnApagar.Enabled := False;
   if (MontaSelect.RetornouValor) And (Trim(MontaSelect.ValoresChave[0]) <> '')then
   begin
      if qryOrdemOpcInd.Locate('IDCESTAOPCIND', MontaSelect.ValoresChave[0], []) then
      begin

         dblOpcao.Text        := MontaSelect.ValoresChave[1];
         dblOpcao.LookupValue := MontaSelect.ValoresChave[0];

         dDbDataVigencia.DateTime := DiasUteisInv.PrimeiroDiaUtilPosterior(pRPI.DATAULTFECH-1,-1,1,'',True,False,False);

         fMinCesta := 0;
         fMaxCesta := 0;
         fValorNovoCesta := 0;
         AbreQry;
         VerDifCesta(0);
         MostraVlrCesta;
         fValorNovoCesta := StrToFloat(StrTran(lblValTotCesta.Caption,'.'));
         AtualizaBotoesDet(True);
         sbtnApagar.Enabled := True;
      end
      else
      begin
         dblOpcao.Clear;
         dDbDataVigencia.Clear;

         Qry.Close;
         QryDetalhe.Close;

         fMinCesta := 0;
         fMaxCesta := 0;
         fValorNovoCesta := 0;

         MostraVlrCesta;

         AtualizaBotoesDet(False);
      end;
   end
   else
   begin
      Qry.Close;
      QryDetalhe.Close;

      AtualizaBotoesDet(False);
   end;

end;

procedure TfrmCadCestaOpcInd.AtualizaBotoesDet(bAlterar : Boolean);
begin
   If bAlterar Then
   begin
      sbtnInsDet.Enabled    := True;
      sbtnAltDet.Enabled    := True;
      sbtnExcluiDet.Enabled := True;
   end
   else
   begin
      sbtnInsDet.Enabled    := False;
      sbtnAltDet.Enabled    := False;
      sbtnExcluiDet.Enabled := False;
   end
end;

procedure TfrmCadCestaOpcInd.bbtnCancelarDetClick(Sender: TObject);
begin
   If Not bFlagAlteraCesta Then
      fValorNovoCesta := fValorNovoCesta + Qry.FieldByName('VALOR').OldValue;

   inherited;

   AtualizaBotoesDet(True);

   If Not bFlagAlteraCesta Then
   begin
      bbtnConfirmar.Enabled := False;
      bbtnCancelar.Enabled  := False;
   end;

   bbtnCancelar.Default   := True;
   bbtnConfirmar.Cancel   := True;
   bbtnOkDet.Default      := False;
   bbtnCancelarDet.Cancel := False;

end;

procedure TfrmCadCestaOpcInd.bbtnVoltarDetClick(Sender: TObject);
begin
   inherited;
   If fValorNovoCesta <> 0 Then
      fValorNovoCesta := fValorNovoCesta - dbreVlrCesta.Value;

   AtualizaBotoesDet(True);

   If Not bFlagAlteraCesta Then
   begin
      bbtnConfirmar.Enabled := False;
      bbtnCancelar.Enabled  := False;
   end;

   bbtnCancelar.Default   := True;
   bbtnConfirmar.Cancel   := True;
   bbtnOkDet.Default      := False;
   bbtnCancelarDet.Cancel := False;

end;

procedure TfrmCadCestaOpcInd.dbgrdDetDblClick(Sender: TObject);
begin
   If (Qry.IsEmpty) Then
      Exit;
       
  inherited;

end;

procedure TfrmCadCestaOpcInd.bbtnCancelarClick(Sender: TObject);
begin
   dblOpcao.Clear;
   dDbDataVigencia.Clear;

   fMinCesta := 0;
   fMaxCesta := 0;
   fValorNovoCesta := 0;

   MostraVlrCesta;

   dbgrdDet.BringToFront;
   
  inherited;

   If dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Rollback;

   QryDetalhe.Close;
   Qry.Close;

   pnlFundo.Enabled   := True;
   pnlMestre.Enabled  := True;
   dblOpcao.Enabled   := True;

   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   bFlagAlteraCesta      := False;
end;

procedure TfrmCadCestaOpcInd.sbtnInsDetClick(Sender: TObject);
Var
   iCarteira, iCustodiante : Integer;
begin
   // AL_2
   if RendaVariavel.VerEmAbertura then
      Exit;

   If not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

   bbtnCancelar.Enabled  := True;
   bbtnConfirmar.Enabled := True;

   bbtnCancelar.Default   := False;
   bbtnConfirmar.Cancel   := False;
   bbtnOkDet.Default      := True;
   bbtnCancelarDet.Cancel := True;

   dblkCarteiraCesta.Enabled    := True;
   dblkCustodianteCesta.Enabled := True;
   dblkAcao.Enabled             := True;

   inherited;

   QryDetalhe.Insert;

   AbreQryCustodiante;

   AbreQryAcoes;

   if dblkCarteiraCesta.CanFocus then
      dblkCarteiraCesta.SetFocus;

end;

procedure TfrmCadCestaOpcInd.sbtnAltDetClick(Sender: TObject);
var fCotacao: Double;
begin
   // AL_2
   if RendaVariavel.VerEmAbertura then
      Exit;

   If not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

   bbtnCancelar.Enabled  := True;
   bbtnConfirmar.Enabled := True;

   bbtnCancelar.Default   := False;
   bbtnConfirmar.Cancel   := False;
   bbtnOkDet.Default      := True;
   bbtnCancelarDet.Cancel := True;

   inherited;

   fLote    := 0;

   fCotacao := OpcaoIndice.BuscaCotacaoLoteAcao(StrToInt(dblkAcao.LookupValue),
                                                dDbDataVigencia.DateTime,
                                                False, fLote);
   QryDetalhe.Edit;

   dbreCotacao.Value := fCotacao;
   fValorNovoCesta := fValorNovoCesta - Qry.FieldByName('VALOR').AsFloat;

   AbreQryCustodiante;
   AbreQryAcoes;

   dblkCarteiraCesta.Enabled    := False;
   dblkCustodianteCesta.Enabled := False;
   dblkAcao.Enabled             := False;

   if dbreQtdCesta.CanFocus then
      dbreQtdCesta.SetFocus;

end;

procedure TfrmCadCestaOpcInd.dblkCarteiraCestaExit(Sender: TObject);
begin
  inherited;
   if Trim(dblkCarteiraCesta.Text) <> '' then
   begin
      AbreQryCustodiante;
      AbreQryAcoes;
   end;
end;

procedure TfrmCadCestaOpcInd.dblkCustodianteCestaExit(Sender: TObject);
begin
  inherited;
   if Trim(dblkCustodianteCesta.Text) <> '' then
      AbreQryAcoes;
end;

procedure TfrmCadCestaOpcInd.dblkAcaoExit(Sender: TObject);
var
   fCotacao : Double;
begin
  inherited;
   fCotacao := 0;
   fLote    := 0;
   If Trim(dblkAcao.Text) <> '' Then
   begin

      fCotacao := OpcaoIndice.BuscaCotacaoLoteAcao(StrToInt(dblkAcao.LookupValue),
                                                   (dDbDataVigencia.DateTime),
                                                    False, fLote);
      dbreCotacao.Value := fCotacao;

      dbreQtdCesta.Value := qryAcaoCestaSALDOLIBERADO.AsFloat;

      CalculaValorInvCesta;
   end;
end;

procedure TfrmCadCestaOpcInd.CalculaValorInvCesta;
var
   fValor : Double;
begin
   if (dbreQtdCesta.Value <> 0) and (dbreCotacao.Value <> 0) and (Trim(dblkAcao.Text) <> '') then
   begin
      if dbreVlrCesta.Value = 0 then
         fValor := OperComum.Trunca(dbreQtdCesta.Value * (dbreCotacao.Value / fLote),2)
      else begin
         fValor := dbreVlrCesta.Value;
         if OperComum.ComparaValores(fValor, OperComum.Trunca((dbreQtdCesta.Value * (dbreCotacao.Value / fLote)),2), '<>') then
            fValor := OperComum.Trunca(dbreQtdCesta.Value * (dbreCotacao.Value / fLote),2);
      end;
      dbreVlrCesta.Value := fValor;
   end;
end;

procedure TfrmCadCestaOpcInd.sbtnExcluiDetClick(Sender: TObject);
begin
  // AL_2
  if RendaVariavel.VerEmAbertura then
     Exit;

  //AL_1
  //AL_3
  if not CtrlInvContab.TestaPeriodo(qryDATAVIGENCIA.AsString, 2, 8) then
  begin
     MsgDlg(CtrlInvContab.MessageInfo,'Mensagem do Sistema', MtWarning,[MbOk],0);
     Exit;
  end;

  if (MsgDlg('Deseja realmente excluir?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
  begin
      If not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;

      bbtnCancelar.Enabled  := True;
      bbtnConfirmar.Enabled := True;

      fValorNovoCesta := fValorNovoCesta - Qry.FieldbyName('VALOR').AsFloat;

      lblValTotCesta.Caption := FormatFloat('###,###,###,###,##0.00', fValorNovoCesta);

      bFlagAlteraCesta := True;

      if qry.RecordCount = 1 then
      begin
         bExibeMens := False;
         bbtnConfirmar.Click;

         If not dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.StartTransaction;

         qry.Edit;
         qryQUANTIDADE.AsFloat := 0;
         qryCOTACAO.AsFloat := 0;
         qryVALOR.AsFloat := 0;
         qry.Post;
         qry.ApplyUpdates;
         qry.CommitUpdates;

         bExibeMens := True;
         bbtnConfirmar.Click;
      end
      else
         inherited;

      AtualizaBotoesDet(True);

  end;

end;

procedure TfrmCadCestaOpcInd.MostraVlrCesta;
begin
  lblValTotCesta.Caption := FormatFloat('###,###,###,###,##0.00',
                                        OpcaoIndice.BuscaValorCesta(qryIDCESTAOPCIND.AsInteger,
                                        dDbDataVigencia.Date));
  lblValMinCesta.Caption := FormatFloat('###,###,###,###,##0.00', fMinCesta);
  lblValMaxCesta.Caption := FormatFloat('###,###,###,###,##0.00', fMaxCesta);
end;

function TfrmCadCestaOpcInd.VerificaValoresCesta: Boolean;
begin
   Result := False;

   if Trim(dblkCarteiraCesta.Text) = '' then
   begin
      MsgDlg('Informe a carteira do Investimento para a Cesta.', 'Mensagem do Sistema', MtWarning,[MbOk],0);
      if dblkCarteiraCesta.CanFocus then
         dblkCarteiraCesta.SetFocus;
      Exit;
   end;

   if Trim(dblkCustodianteCesta.Text) = '' then
   begin
      MsgDlg('Informe a Custodiante do Investimento para a Cesta.', 'Mensagem do Sistema', MtWarning,[MbOk],0);
      if dblkCustodianteCesta.CanFocus then
         dblkCustodianteCesta.SetFocus;
      Exit;
   end;

   if Trim(dblkAcao.Text) = '' then
   begin
      MsgDlg('Informe o Investimento para a Cesta.', 'Mensagem do Sistema', MtWarning,[MbOk],0);
      if dblkAcao.CanFocus then
         dblkAcao.SetFocus;
      Exit;
   end
   else
   begin
      if qry.State = dsInsert then
      begin
         if OpcaoIndice.VerificaCestaInv(qryIDCESTAOPCIND.AsInteger,
                                         qryIDCARTEIRAINVEST.AsInteger,
                                         qryIDCUSTODIANTE.AsInteger,
                                         qryIDINVESTIMENTO.AsInteger,
                                         dDbDataVigencia.Date,
                                         qryIDCARTEIRAGERENC.AsInteger) then
         begin
            MsgDlg('Esta Cesta já Contém este Investimento.', 'Mensagem do Sistema', MtWarning,[MbOk],0);
            if dblkAcao.CanFocus then
               dblkAcao.SetFocus;
            Exit;
         end;
      end;
   end;

   if dbreQtdCesta.Value = 0 then
   begin
      MsgDlg('Informe a Quantidade do Investimento para a Cesta.', 'Mensagem do Sistema', MtWarning,[MbOk],0);
      if dbreQtdCesta.CanFocus then
         dbreQtdCesta.SetFocus;
      Exit;
   end;

   if dbreCotacao.Value = 0 then
   begin
      MsgDlg('Informe a Cotação do Investimento para a Cesta.', 'Mensagem do Sistema', MtWarning,[MbOk],0);
      if dbreCotacao.CanFocus then
         dbreCotacao.SetFocus;
      Exit;
   end;

   if dbreVlrCesta.Value = 0 then
   begin
      MsgDlg('Informe o Valor do Investimento para a Cesta.', 'Mensagem do Sistema', MtWarning,[MbOk],0);
      if dbreVlrCesta.CanFocus then
         dbreVlrCesta.SetFocus;
      Exit;
   end;

   Result := True;
end;

// Verifica o valor da cesta se está de acordo com o total possível
//  sModo: T - Total, verifica todos os limites, mínimo e máximo
//         P - Parcial, verifica somente o valor máximo
function TfrmCadCestaOpcInd.VerDifCesta(fValorAcresc : Double) : boolean;
var
   fVlrMaior, fVlrMenor, fVlrCesta, fValor : Double;
   bFirst : boolean;
   iIdOrd : Integer;
   sLote  : String;
   sVlrCesta,sVlrMaior,sVlrMenor : String;
begin
   Result    := True;
   fVlrMaior := 0;
   fVlrMenor := 0;
   fVlrCesta := 0;
   iIdOrd    := 0;
   bFirst    := True;

   QryMaxMinCesta.Close;
   QryMaxMinCesta.ParamByName('IDBOLETA').AsString := qryOrdemOpcInd.FieldByName('IDBOLETA').AsString;
   QryMaxMinCesta.ParamByName('IDLOTE').AsString := qryOrdemOpcInd.FieldByName('IDLOTE').AsString;
   QryMaxMinCesta.Open;

   QryMaxMinCesta.First;
   while not QryMaxMinCesta.Eof do
   begin
      sLote := QryMaxMinCesta.FieldByName('IDLOTE').AsString;
      while ((not QryMaxMinCesta.Eof) and
             (sLote = QryMaxMinCesta.FieldByName('IDLOTE').AsString)) do
      begin
         if not QryMaxMinCesta.FieldByName('IDCESTAOPCIND').IsNull then
         begin
            fVlrCesta := OpcaoIndice.BuscaValorCesta(QryMaxMinCesta.FieldByName('IDCESTAOPCIND').AsInteger, dDbDataVigencia.Date);
            if iOrdem = QryMaxMinCesta.FieldByName('IDORDEMOPCIND').AsInteger then
            begin
               fVlrCesta := fVlrCesta + fDif;
            end;
         end;

         fValor := OpcaoIndice.BuscaValorMaxCesta(QryMaxMinCesta.FieldByName('IDORDEMOPCIND').AsInteger);

         if bFirst then
         begin
             fVlrMaior := fValor;
             fVlrMenor := fValor;
             bFirst    := False;
         end
         else
         begin
            if fValor > fVlrMaior then
               fVlrMaior := fValor;
            if fValor < fVlrMenor then
               fVlrMenor := fValor;
         end;

         QryMaxMinCesta.Next;
      end;

      fMinCesta := fVlrMenor;
      fMaxCesta := fVlrMaior;

      if (fVlrCesta <> 0) and (fMinCesta <> fMaxCesta)then
      begin
         sVlrCesta := FormatFloat('###,###,###,###,##0.00',fVlrCesta);
         sVlrMaior := FormatFloat('###,###,###,###,##0.00',fVlrMaior + pRPI.DIFMAXOPCIND);
         sVlrMenor := FormatFloat('###,###,###,###,##0.00',fVlrMenor - pRPI.DIFMAXOPCIND);
      end;
   end;
end;

procedure TfrmCadCestaOpcInd.dbreQtdCestaExit(Sender: TObject);
begin
  inherited;
   CalculaValorInvCesta;
end;

procedure TfrmCadCestaOpcInd.sbtnProcurarClick(Sender: TObject);
begin
   inherited;
   if not Qry.IsEmpty then
      AtualizaBotoesDet(True);

   pnlFundo.Enabled   := True;
   pnlMestre.Enabled  := True;
   dblOpcao.Enabled   := True;

end;

procedure TfrmCadCestaOpcInd.dbreCotacaoExit(Sender: TObject);
begin
  inherited;
    CalculaValorInvCesta;
end;

procedure TfrmCadCestaOpcInd.dDbDataVigenciaExit(Sender: TObject);
Var
   dDataFechto : TDateTime;
begin
   inherited;

   While not DiasUteisInv.DiaUtil(dDbDataVigencia.DateTime,-1,1,'',True,False,False) Do
      dDbDataVigencia.DateTime := dDbDataVigencia.DateTime - 1;

   dDataFechto    := pRPI.DATAULTFECH + 1;
   While not DiasUteisInv.DiaUtil(dDataFechto,-1,1,'',True,False,False) Do
      dDataFechto := dDataFechto + 1;

   if dDbDataVigencia.DateTime > dDataFechto then
   begin
      MsgDlg('A Nova Vigência não pode ser maior que o Fechamento do dia de Renda Variável',
             'Mensagem do Sistema', MtWarning,[MbOk],0);
      dDbDataVigencia.DateTime := dDataFechto;
      if dDbDataVigencia.CanFocus then
         dDbDataVigencia.SetFocus;
   end;

   fMinCesta := 0;
   fMaxCesta := 0;
   sbtnApagar.Enabled := False;
   fValorNovoCesta := 0;

   If Trim(dblOpcao.Text) <> '' Then
   begin
      AbreQry;
      VerDifCesta(0);
      MostraVlrCesta;
      If Not Qry.IsEmpty Then
         AtualizaBotoesDet(True)
      Else
         AtualizaBotoesDet(False);

      bFlagAlteraCesta := False;
      sbtnApagar.Enabled := True;
   end;

   fValorNovoCesta := StrToFloat(StrTran(lblValTotCesta.Caption,'.'));
   
end;

procedure TfrmCadCestaOpcInd.sbtnApagarClick(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadCestaOpcInd.sbtnPosicaoClick(Sender: TObject);
begin
  inherited;
   If Not Qry.IsEmpty Then
   begin
      Qry.DisableControls;
      With DmRelConsPosAltCestaOpcInd Do
      begin
         pplConsAltCestaOpcInd.DataSource := Ds;
               
         ppOpcao.Caption         := dblOpcao.Text;

         ppDataVigencia.Caption  := dDbDataVigencia.Text;

         ppLVlrMin.Caption       := lblValMinCesta.Caption;

         ppLVlrMax.Caption       := lblValMaxCesta.Caption;

         ppLVlrAtual.Caption     := lblValTotCesta.Caption;

         TfrmPreview.CreateModalPreview(Application,
                                        ppRConsAltCestaOpcInd,
                                        ppRConsAltCestaOpcInd.PrinterSetup.DocumentName);
      end;
      Qry.EnableControls;

   end;

   sbtnPosicao.Down := False;

end;

procedure TfrmCadCestaOpcInd.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
   Qry.close;
   QryDetalhe.Close;
   qryOrdemOpcInd.Close;
   QryMaxMinCesta.Close;
end;

procedure TfrmCadCestaOpcInd.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   inherited;
   pnlFundo.Enabled    := True;
end;

procedure TfrmCadCestaOpcInd.dblOpcaoExit(Sender: TObject);
begin
  inherited;
   If Trim(dblOpcao.Text) = '' Then
      bbtnCancelarClick(Sender);
end;

end.

