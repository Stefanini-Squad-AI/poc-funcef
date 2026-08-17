//******************************************************************************
// Data      : 20/04/2007
// Código    : AL_4
// Pendencia :
// SOL       :
// Desc      : Tratamento para testar o pRPI.FLGCARTGERENC
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
// Data     : 01/06/2005
// Código   : AL_1
// Motivo   : Implementação do teste de período contabil em 3 camadas
//******************************************************************************
// Data	    :13/04/2004
// Origem   :FUNCEF
// Função   :DbgGridInvest
// LINHA(S) :
// Motivo(S): Implementação da grid para identificar melhor a Age
//******************************************************************************

unit FCadAnuncioCarteiraGerenc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMDetCSInv, wwdbdatetimepicker, CMDateTimePicker, StdCtrls,
  wwdblook, CmEventosCadastro, ImgList, MontaSelect, DBTables, IvDictio,
  IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr, fcLabel,
  Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, TREdit, uMensErro, uCtrlInvContab;

type
  TFrmCadAnuncioCarteiraGerenc = class(TfrmCadastroMDetInv)
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbdData: TCMDateTimePicker;
    DblCarteira: TwwDBLookupCombo;
    dbeValor: TDBRealEdit;
    QryAnuncio: TwwQuery;
    QryCarteira: TwwQuery;
    qryDetalheIDHISTPROVISAO: TFloatField;
    qryDetalheIDOPERACAODIREITO: TFloatField;
    qryDetalheIDCARTEIRAGERENC: TFloatField;
    qryDetalheIDCARTEIRAINVEST: TFloatField;
    qryDetalheIDOPERACAOINVEST: TFloatField;
    qryDetalheIDPLANPREVCTBPATR: TFloatField;
    qryDetalheIDCARTEIRAXEVENTO: TFloatField;
    qryDetalheDATAHISTPROVISAO: TDateTimeField;
    qryDetalheSLDHISTPROVISAO: TFloatField;
    qryDetalheTRGDTINCLUSAO: TDateTimeField;
    qryDetalheTRGUSERINCLUSAO: TStringField;
    qryDetalheVLRHISTPROVISAO: TFloatField;
    qryDetalheIDCARTEIRAINVEST_1: TFloatField;
    qryDetalheDESCCARTINVEST: TStringField;
    qryDetalheIDGESTORCARTEIRA: TFloatField;
    qryDetalheFLGCARTPROP: TFloatField;
    qryDetalheFLGCALCDIARIO: TStringField;
    qryDetalheDATAINICIO: TDateTimeField;
    qryDetalheFLGTRATALOTE: TStringField;
    qryDetalheTRGDTINCLUSAO_1: TDateTimeField;
    qryDetalheTRGUSERINCLUSAO_1: TStringField;
    qryDetalheIDPLANOPREV: TFloatField;
    qryDetalheIDPATROCINADORA: TFloatField;
    qryDetalheIDTIPOINVEST: TFloatField;
    qryDetalheIDMERCADO: TFloatField;
    qryDetalheFLGORDMOVINV: TStringField;
    qryDetalheDATAULTFECH: TDateTimeField;
    qryDetalheIDDAIEACART: TFloatField;
    qryDetalheFLGCARTLASTRO: TStringField;
    qryDetalheFLGCARTTERC: TStringField;
    qryDetalheIDCARTEIRAGERENC_1: TFloatField;
    qryDetalheIDCARTEIRAINVEST_2: TFloatField;
    qryDetalheDESCCARTGERENC: TStringField;
    qryDetalheTRGDTINCLUSAO_2: TDateTimeField;
    qryDetalheTRGUSERINCLUSAO_2: TStringField;
    QryDelHistProvisao: TwwQuery;
    MontaSelect1: TMontaSelect;
    QryOperDireitoXinv: TwwQuery;
    DsOperDireitoXinv: TwwDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    dblAnuncio: TwwDBLookupCombo;
    Label5: TLabel;
    edEmissor: TEdit;
    DbgGridInvest: TwwDBGrid;
    procedure FormShow(Sender: TObject);
    procedure dblAnuncioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure dbgrdDetDblClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Sel(S : Integer);    
  public
    { Public declarations }
  end;

var
  FrmCadAnuncioCarteiraGerenc: TFrmCadAnuncioCarteiraGerenc;

implementation

uses UProvisaoComum, UCotaComum, UBibliotecaInvest, dBaseDados,
  URendaVariavel;

{$R *.DFM}

procedure TFrmCadAnuncioCarteiraGerenc.FormShow(Sender: TObject);
begin
  inherited;
   pnlFundo.Enabled := True;
   QryAnuncio.Open;
end;

procedure TFrmCadAnuncioCarteiraGerenc.dblAnuncioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If Trim(dblAnuncio.Text) <> '' Then
  Begin
     edEmissor.Text := QryAnuncio.FieldByName('SIGLAEMISSOR').AsString;

     qryDetalhe.Close;
     qryDetalhe.ParamByName('IDOPERACAODIREITO').AsInteger :=
                QryAnuncio.FieldByName('IDOPERACAODIREITO').AsInteger;
     qryDetalhe.Open;

     QryOperDireitoXinv.Close;
     QryOperDireitoXinv.ParamByName('IDOPERACAODIREITO').AsInteger :=
                QryAnuncio.FieldByName('IDOPERACAODIREITO').AsInteger;
     QryOperDireitoXinv.Open;

     If qryDetalhe.IsEmpty Then
     begin
        sbtnInsDet.Enabled    := True;
        sbtnAltDet.Enabled    := False;
        sbtnExcluiDet.Enabled := False;
     end
     Else
     begin
        sbtnInsDet.Enabled    := True;
        sbtnAltDet.Enabled    := True;
        sbtnExcluiDet.Enabled := True;
     end;
  End;
end;

procedure TFrmCadAnuncioCarteiraGerenc.bbtnConfirmarClick(Sender: TObject);
Var
   wIdCarteiraXEvento : Integer;
begin
  // AL_1
  // AL_3
  if not CtrlInvContab.TestaPeriodo(QryDetalhe.FieldByName('DATAHISTPROVISAO').AsString, 2) then
  begin
     MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     Exit;
  end;

  //AL_4
  if pRPI.FLGCARTGERENC <> 'S' Then
  begin
     MsgDlg('O Sistema não está parametrizado para gerar informações' + #13 +
            'para Carteiras Gerenciais.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     Exit;
  end;

  Try
     If not dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.StartTransaction;

     QryDelHistProvisao.Close;
     QryDelHistProvisao.ParamByName('IDOPERACAODIREITO').AsInteger :=
                        QryAnuncio.FieldByName('IDOPERACAODIREITO').AsInteger;
     QryDelHistProvisao.ExecSql;

     QryDetalhe.First;
     While Not QryDetalhe.Eof Do
     begin
        wIdCarteiraXEvento  := CotaComum.BuscaEventoPorTpOper(
                                           QryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                           QryDetalhe.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                           -70{Anuncio de Proventos});

        If Not ProvisaoComum.GravaProvisao(QryDetalhe.FieldByName('DATAHISTPROVISAO').AsDateTime,
                                           QryDetalhe.FieldByName('DATAHISTPROVISAO').AsDateTime,
                                           QryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                           QryDetalhe.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                           wIdCarteiraXEvento, 0,
                                           QryAnuncio.FieldByName('IDOPERACAODIREITO').AsInteger,
                                           0{Plano},
                                           QryDetalhe.FieldByName('VLRHISTPROVISAO').AsFloat) Then
        begin
           MsgDlg('Atenção: Não foi possível gravar o evento de Caixa.',
                  'Mensagem do Sistema', MtWarning, [MbOk], 0);
           Abort;
        end;

        QryDetalhe.Next;
     end;

     dtmBaseDados.dbBaseDados.Commit;

     QryDetalhe.Close;
     QryDetalhe.Open;
     QryDetalhe.First;

     bbtnConfirmar.Enabled := False;
     bbtnCancelar.Enabled  := False;

   Except

     dtmBaseDados.dbBaseDados.Rollback;

   End;
end;

procedure TFrmCadAnuncioCarteiraGerenc.bbtnOkDetClick(Sender: TObject);
begin
   If dbdData.Date < pRPI.DATAULTFECH Then
   begin
       MsgDlg('Verificar a Data de  Provisão.',
              'Mensagem do Sistema', MtWarning, [MbOk], 0);
       dbdData.SetFocus;
       Exit;
   end;

   // AL_1
   // AL_3
   if not CtrlInvContab.TestaPeriodo(dbdData.Text, 2) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if dbdData.CanFocus then
         dbdData.SetFocus;
      Exit;
   end;

   If Trim(DblCarteira.Text) = '' Then
   begin
       MsgDlg('Carteira Gerencial em branco.',
              'Mensagem do Sistema', MtWarning, [MbOk], 0);
       DblCarteira.SetFocus;
       Exit;
   end;

   If dbeValor.Value = 0 Then
   begin
       MsgDlg('Valor igual a zero.',
              'Mensagem do Sistema', MtWarning, [MbOk], 0);
       dbeValor.SetFocus;
       Exit;
   end;

   qryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger :=
                      QryCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;
   qryDetalhe.FieldByName('DESCCARTGERENC').AsString    := DblCarteira.Text;

   qryDetalhe.Post;

   bbtnVoltarDetClick(Sender);

   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
   sbtnInsDet.Enabled    := True;
   sbtnAltDet.Enabled    := True;
   sbtnExcluiDet.Enabled := True;
end;

procedure TFrmCadAnuncioCarteiraGerenc.bbtnCancelarDetClick(
  Sender: TObject);
begin
  inherited;
   dbgrdDet.BringToFront;
   If qryDetalhe.IsEmpty Then
   begin
      sbtnInsDet.Enabled    := True;
      sbtnAltDet.Enabled    := False;
      sbtnExcluiDet.Enabled := False;
   end
   Else
   begin
      sbtnInsDet.Enabled    := True;
      sbtnAltDet.Enabled    := True;
      sbtnExcluiDet.Enabled := True;
   end;
end;

procedure TFrmCadAnuncioCarteiraGerenc.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
   dbgrdDet.BringToFront;
end;

procedure TFrmCadAnuncioCarteiraGerenc.sbtnInsDetClick(Sender: TObject);
begin
   // AL_2
   if RendaVariavel.VerEmAbertura then
   begin
      sbtnInsDet.Down := False;
      Exit;
   end;
  inherited;
   QryCarteira.Open;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
end;

procedure TFrmCadAnuncioCarteiraGerenc.sbtnAltDetClick(Sender: TObject);
begin
   // AL_2
   if RendaVariavel.VerEmAbertura then
   begin
      sbtnAltDet.Down := False;
      Exit;
   end;
  inherited;
   QryCarteira.Open;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
end;

procedure TFrmCadAnuncioCarteiraGerenc.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   pnlFundo.Enabled := True;
   QryAnuncio.Open;
   Qry.Open;
   If qryDetalhe.IsEmpty Then
   begin
      sbtnInsDet.Enabled    := True;
      sbtnAltDet.Enabled    := False;
      sbtnExcluiDet.Enabled := False;
   end
   Else
   begin
      sbtnInsDet.Enabled    := True;
      sbtnAltDet.Enabled    := True;
      sbtnExcluiDet.Enabled := True;
   end;
end;

procedure TFrmCadAnuncioCarteiraGerenc.sbtnExcluiDetClick(Sender: TObject);
begin
   // AL_2
   if RendaVariavel.VerEmAbertura then
   begin
      sbtnExcluiDet.Down := False;
      Exit;
   end;

   // AL_1
   // AL_3
   if not CtrlInvContab.TestaPeriodo(qryDetalheDATAHISTPROVISAO.AsString, 2) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      Exit;
   end;

   If MsgDlg('Confirma Exclusão ?','Mensagem ',mtInformation,
            [mbYes, mbNo],0) = mrYes  Then

   begin
      Try
        inherited;
        If QryDetalhe.IsEmpty Then
        begin
           dblAnuncio.Clear;
           edEmissor.Clear;
        end;
      except
        MsgDlg('Não é possível excluir essa provisão.',
               'Mensagem do Sistema', MtWarning, [MbOk], 0);
      end;
      pnlFundo.Enabled := True;
   end;
end;

procedure TFrmCadAnuncioCarteiraGerenc.dbgrdDetDblClick(Sender: TObject);
begin
   If QryDetalhe.IsEmpty Then
      Exit;
  inherited;

end;

procedure TFrmCadAnuncioCarteiraGerenc.sbtnProcurarClick(Sender: TObject);
begin
  inherited;

  if MontaSelect.RetornouValor then
  begin
     Sel(StrToInt(MontaSelect.ValoresChave[0]));
     If QryAnuncio.Locate('IDOPERACAODIREITO', StrToInt(MontaSelect.ValoresChave[0]),[]) Then
     begin
        dblAnuncio.Text        := QryAnuncio.FieldByName('DESCTIPOOPERACAO').AsString;
        dblAnuncio.LookupValue := QryAnuncio.FieldByName('IDOPERACAODIREITO').AsString;
        edEmissor.Text         := QryAnuncio.FieldByName('SIGLAEMISSOR').AsString;
     end;

     If qryDetalhe.IsEmpty Then
     begin
        sbtnInsDet.Enabled    := True;
        sbtnAltDet.Enabled    := False;
        sbtnExcluiDet.Enabled := False;
     end
     Else
     begin
        sbtnInsDet.Enabled    := True;
        sbtnAltDet.Enabled    := True;
        sbtnExcluiDet.Enabled := True;
     end;

  end;

  pnlFundo.Enabled  := True;
  pnlMestre.Enabled := True;

  if dblAnuncio.CanFocus then
     dblAnuncio.SetFocus;

end;

procedure TFrmCadAnuncioCarteiraGerenc.Sel(S : Integer);
begin
  qryDetalhe.Close;
  qryDetalhe.ParamByName('IDOPERACAODIREITO').AsInteger         := S;
  qryDetalhe.Open;

  QryOperDireitoXinv.Close;
  QryOperDireitoXinv.ParamByName('IDOPERACAODIREITO').AsInteger := S;
  QryOperDireitoXinv.Open;
end;

end.
