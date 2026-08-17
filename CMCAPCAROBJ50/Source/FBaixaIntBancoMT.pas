{
--------------------------------------------------------------------------------
Data      : 27/11/2006
Pendência : 23824
Autor     : Rodolpho da Silva
Descrição : Criticar a data da disponibilidade. A crítica está sendo feita aqui na
            tela, devido a data do float mudar conforme parametrização do portadorforma
--------------------------------------------------------------------------------
Rotina    : TCtrlDocumento.LancaRateioContab
Data      : 21/08/2006
Pendência : 22528
Autor     : Andre Tavares
Descrição : Deve constar no histórico contábil o Nº do lote do documento se o mesmo se encontar em um lote
(isso só ocorre se o documento for CAP).
--------------------------------------------------------------------------------
}
{-------------------------------------------------------------------------------
Pendência: 23081
Data     : 17/08/2006
Autor    : Andre Tavares
Descrição: Fazer a baixa dos documentos com o portadorforma original dos documentos.
-------------------------------------------------------------------------------}

// Andre Tavares - 10/01/2006 - pendencia 19282 - indicar um número de lote para
// baixa automaticamente como é feito na tela de baixa manual.

// André Tavares - pendência 17412 - 24/08/2004 - criação do campo e parâmetro
//                 de data de disponibilidade para baixa dos documentos.
(*******************************************************************************
 19/01/1999
  Alteração na rotina de baixa -> os documentos passam a ser exibidos num grid e
  a baixa é feita como no pagamento manual - Conclusão do CNAB;
 21/01/1999
  Inclusão de Alteradores na baixa, inclusive com o cálculo da tarifa cobrada pelo
  banco;
 25/01/1999
  Implementação do parâmetro de lançamento no financeiro ( Módulo )
  Alteração na rotina de baixa -> os documentos passam a ser exibidos num grid e
  a baixa é feita como no pagamento manual - Conclusão do SISPAG;
 17/03/1999 - 02.06.00
  Alteração no campo FLGINDICARECEBIMENTO para FLGINDICARECEB
 24/03/1999 - 02.06.02
  Alteração na baixa manual para pagamento dos lotes
 07/04/1999 - 02.07.02
  Correção na no lançamento do Financeiro na Baixa dos Título para lançar sempre
  como entrada no contas a receber e saída no contas a pagar;
 11/05/1999 - 2.08.03
  Alteração na visualização do arquivo gerado.
 19/05/1999 - 2.08.04
  Correção da mensagem comando sql não finalizado corretamente ao selecionar
  o arquivo
 22/09/1999 - 2.13.10
  Alateração no valor da baixa para doc's com saldo negativo: o valor gravado
  passou a ser sempre o absoluto;
 30/09/1999 - 2.13.14
  Inclusão da opção de considerar o float para a data do lançamento contábil de
  acordo com o parâmetro do sistema para a contabilização da baixa
 01/11/1999 - 2.14.10
  Implementação da baixa eletrônica dos lotes no contas a pagar
 05/11/1999 - 2.14.11
  Implementação da busca do número do lote de origem do envio e do portador
  forma origem do envio para a baixa;
 30/10/2001 - 3.01.17
   Implementação da rotina de baixa de documentos que forão pagos em uma só
   boleta - Fábio Barros
 *******************************************************************************)
Unit
  FBaixaIntBancoMT;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Db, DBTables,
  wwdblook, Usistema, uAutorizacao,
  uMensErro, TB97Tlbr, Grids, Wwdbigrd, Wwdbgrid, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, CMDBLookupCombo, JclStrings, JclShell, uCMSqlParams,
  DBClient, uCMClientDataSet, uCtrlParamIntegra, uCtrlBaixaIntBanco,
  CmParamReport, uCmFileUtils, wwdbdatetimepicker, CMDateTimePicker, Mask,
  wwdbedit, Wwdbspin, uctrlDocumento,
  fProgressoDuplo,fProgresso, 
  uCtrlFinanc, uCtrlPadroes;

Type
  TFrmBaixaIntBancoMT = class(TfrmOkCancelar)
    DlgAbrir: TOpenDialog;
    GrdCdsDocumentos: TwwDBGrid;
    Panel1: TPanel;
    LblPgto: TLabel;
    EdtArquivoRetorno: TEdit;
    LblPath: TLabel;
    SbtnAbrirArquivoRet: TSpeedButton;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    DsCdsDocumentos: TwwDataSource;
    CmbModeloCnab: TCMDBLookupCombo;
    CdsDocumentos: TCMClientDataSet;
    CdsPortaDorForma: TCMClientDataSet;
    CdsParamCAP: TCMClientDataSet;
    CdsOcorrencia: TCMClientDataSet;
    CdsAux: TCMClientDataSet;
    CdsUnid: TCMClientDataSet;
    CdsModelosCnab: TCMClientDataSet;
    CdsAlt: TCMClientDataSet;
    CdsAuxCodDoc: TCMClientDataSet;
    dtpDataDisp: TCMDateTimePicker;
    lblDataDisp: TLabel;
    sqlParamFinanc: TCMSqlParams;
    cdsParamFinanc: TCMClientDataSet;
    valCommit: TwwDBSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtTotDocs: TEdit;
    CMSqlParams1: TCMSqlParams;
    Procedure SbtnAbrirArquivoRetClick(Sender: TObject);
    Procedure bbtnCancelarClick(Sender: TObject);
    Procedure bbtnConfirmarClick(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure CdsDocumentosAfterOpen(DataSet: TDataSet);
    procedure GrdCdsDocumentosCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
    procedure GrdCdsDocumentosTopRowChanged(Sender: TObject);
    procedure GrdCdsDocumentosUpdateFooter(Sender: TObject);

  Private
    { Private declarations }
    CtrlBaixaIntBanco : TCtrlBaixaIntBanco;
    sNumChequeBordero : String;
    sListaRetorno     : TStrings;
    procedure mostraProcessamento(vParam: array of Variant);

  Public
    { Public declarations }
  End;

Var
  FrmBaixaIntBancoMT: TFrmBaixaIntBancoMT;

Implementation

Uses
  DBaseDados, uModulo, uFuncaoGeral, fAguarde, uDataBase;

{$R *.DFM}

Procedure TFrmBaixaIntBancoMT.FormCreate(Sender: TObject);
Begin
  Inherited;
  self.DoubleBuffered := true;
  CtrlBaixaIntBanco := nil; //andre tavares - 07/12/2006
  
  If ParamIntegra.Recpag = 'P' Then Begin
// Daniel Simões - 25/01/2006 - Início------------------------------------------
    HelpContext           := 30033;
    bbtnAjuda.HelpContext := 30033;
    Caption               := 'Pagamento Eletrônico (MT)';
    LblPgto.Caption       := 'Tipo de Arquivo IntBanco';
  End
  Else
  Begin
    HelpContext           := 40052;
    bbtnAjuda.HelpContext := 40052;
  End;

  sqlParamFinanc.Open;
  dtpDataDisp.Text := '';
  dtpDataDisp.Visible := (cdsParamFinanc.FieldByName('FLGINTDISPFIN').asString = 'Y');
  lblDataDisp.Visible := dtpDataDisp.Visible;


  CtrlBaixaIntBanco := TCtrlBaixaIntBanco.Create;

  CtrlBaixaIntBanco.IdEmpresa        := Sistema.IdEmpresa;
  CtrlBaixaIntBanco.IdModulo         := Sistema.IdModulo;
  CtrlBaixaIntBanco.IdUsuario        := Sistema.IdUsuario;
  CtrlBaixaIntBanco.IdEspAcesso      := Sistema.IdEspAcesso;
  CtrlBaixaIntBanco.UsaPlanoPatro    := Sistema.UsaPlanoPatro;
  CtrlBaixaIntBanco.PlanoConta       := ParamIntegra.Plano;
  CtrlBaixaIntBanco.RecPag           := ParamIntegra.RecPag;
  CtrlBaixaIntBanco.PrefixoServidor  := Sistema.PrefixoServidor;
  CtrlBaixaIntBanco.LancaBaixaFloat  := Modulo.LancaBaixaFloat;
  CtrlBaixaIntBanco.IntegraContab    := ParamIntegra.IntegraContabPag;
  CtrlBaixaIntBanco.PartidaDobrada   := ParamIntegra.PartidaDobrada;

  CtrlBaixaIntBanco.CdsDocumentos    := CdsDocumentos;
  CtrlBaixaIntBanco.CdsPortaDorForma := CdsPortaDorForma;
  CtrlBaixaIntBanco.CdsParamCAP      := CdsParamCAP;
  CtrlBaixaIntBanco.CdsOcorrencia    := CdsOcorrencia;
  CtrlBaixaIntBanco.CdsAux           := CdsAux;
  CtrlBaixaIntBanco.CdsUnid          := CdsUnid;
  CtrlBaixaIntBanco.CdsModelosCnab   := CdsModelosCnab;
  CtrlBaixaIntBanco.CdsAlt           := CdsAlt;
  CtrlBaixaIntBanco.CdsAuxCodDoc     := CdsAuxCodDoc;

  CtrlBaixaIntBanco.InitializeAs( ParamIntegra );
  CtrlBaixaIntBanco.AbreQueries;

  CtrlBaixaIntBanco.OnBaixa := self.mostraProcessamento;
End;

Procedure TFrmBaixaIntBancoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
Begin
  If ( CdsDocumentos.ChangeCount > 0 ) Then CdsDocumentos.CancelUpdates;

  CtrlBaixaIntBanco.FechaQueries;

  freeAndNil(CtrlBaixaIntBanco);

  Inherited;
End;

Procedure TFrmBaixaIntBancoMT.SbtnAbrirArquivoRetClick(Sender: TObject);
Begin
  Inherited;
  Application.ProcessMessages;

  If CmbModeloCnab.Text = '' Then Begin
    MsgDlg('Favor Indicar o ' + LblPgto.Caption,'Aviso',mtError,[mbOk],0);
    CmbModeloCnab.SetFocus;
    Exit;
  End;

  If Not CtrlBaixaIntBanco.AbreOcorrencia( CmbModeloCnab.LookupValue ) Then Begin
    MsgDlg( CtrlBaixaIntBanco.MessageInfo, 'Aviso', mtError, [ mbOk ], 0 );
    Exit;
  End;

  Try
    If DlgAbrir.Execute Then Begin
      EdtArquivoRetorno.Text := DlgAbrir.FileName;

      sListaRetorno := TStringList.Create;
      sListaRetorno := CtrlBaixaIntBanco.BuscaBaixa( StrToIntDef( CmbModeloCnab.LookupValue, 0 ),
                                                        DlgAbrir.FileName,
                                                        UpperCase( Sistema.NomeEmpresa ) );
      If sListaRetorno <> Nil Then

      If sListaRetorno.Count = 0 Then Begin
        MsgDlg('Não foram encontrados registros para baixa no arquivo','Aviso',mtError,[mbOk],0);
        Exit;
      End;

      If sListaRetorno <> Nil Then


      If Copy(sListaRetorno[ 0 ], 1, 4 ) = 'Erro' Then  Exit;

      CdsDocumentos.EmptyDataSet;

      CdsDocumentos.DisableControls;
      CdsDocumentos.LogChanges := false;

      CtrlBaixaIntBanco.MontaGrid( sListaRetorno,
                                   CmbModeloCnab.LookupValue );

      edtTotDocs.Text := intToStr(CdsDocumentos.RecordCount);

      CdsDocumentos.EnableControls;
      CdsDocumentos.LogChanges := true;

    End;

    mostraProcessamento([2, 0, sListaRetorno.count, cdsDocumentos.RecordCount, 'Selecionando Documentos para Baixa']);


    if (CdsDocumentos.IsEmpty) and (trim(CtrlBaixaIntBanco.sNomeArqLog) <> '') then
      VisualizaArquivo(CtrlBaixaIntBanco.sNomeArqLog, '');

    CdsDocumentos.Edit;
    CdsDocumentos.Post;

  Except
    MsgDlg('Não foi possível ler o arquivo','Aviso',mtError,[mbOk],0);
    Raise;
  End;

End;

Procedure TFrmBaixaIntBancoMT.bbtnCancelarClick(Sender: TObject);
Begin
  Inherited;
  EdtArquivoRetorno.Text := '';
  CmbModeloCnab.Text := '';
  DlgAbrir.FileName := '';
End;


Procedure TFrmBaixaIntBancoMT.bbtnConfirmarClick(Sender: TObject);
Var
  sAux: String;
  iCodPortForma: Integer;
Begin
  Inherited;
  with TCtrlDocumento.Create do
  begin
    try
      InitializeAs(ParamIntegra);
      sNumChequeBordero := intToStr(GetNumChqBordero);
    finally
      free;
    end;
  end;

  if (trim(dtpDataDisp.Text) = '') and  (dtpDataDisp.Visible) then
  begin
    MsgDlg('Preencha a Data de Disponibilidade ', 'Aviso',mtError,[mbOk],0);
    dtpDataDisp.SetFocus;
    Exit;
  end;

  If CmbModeloCnab.Text = '' Then Begin
    MsgDlg('Favor Indicar o ' + LblPgto.Caption,'Aviso',mtError,[mbOk],0);
    CmbModeloCnab.SetFocus;
    Exit;
  End;

  If CdsDocumentos.IsEmpty Then Begin
    MsgDlg('Não Existem Documentos para este ' + LblPgto.Caption,'Aviso',mtError,[mbOk],0);
    Exit;
  End;

  If ParamIntegra.RecPag = 'R' Then Begin
    If (CdsParamcap.FieldByName('CODALTERADORABAT').AsInteger = 0) Then Begin
      MsgDlg('Falta Indicar Alterador para Abatimento no Cadastro de Parâmetro do Sistema','Aviso',mtError,[mbOk],0);
      Exit;
    End;

    If (CdsParamcap.FieldByName('CODALTERADORDESC').AsInteger = 0) Then Begin
      MsgDlg('Falta Indicar Alterador para Desconto no Cadastro de Parâmetro do Sistema','Aviso',mtError,[mbOk],0);
      Exit;
    End;

    If (CdsParamcap.FieldByName('CODALTERADORTARIF').AsInteger = 0) Then Begin
      MsgDlg('Falta Indicar Alterador para Outros Valores no Cadastro de Parâmetro do Sistema','Aviso',mtError,[mbOk],0);
      Exit;
    End;

    If (CdsParamcap.FieldByName('CODALTERADORJUROS').AsInteger = 0) Then Begin
      MsgDlg('Falta Indicar Alterador para Juros no Cadastro de Parâmetro do Sistema','Aviso',mtError,[mbOk],0);
      Exit;
    End;

    sAux:= 'Lote de Recebimento'
  End Else
    sAux:= 'Cheque / Borderô';

  If Not InputQuery('Baixa Automática','Favor Indicar o Nº do ' + sAux,sNumChequeBordero) Then Begin
    MsgDlg('Falta indicação do Nº do ' + sAux,'Aviso',mtError,[mbOk],0);
    Exit;
  End;

  If sNumChequeBordero = '' Then Begin
    MsgDlg('Falta indicação do Nº do ' + sAux,'Aviso',mtError,[mbOk],0);
    Exit;
  End;

  sAux := '';
  with TCtrlFinanc.Create(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario,Sistema.UsaPlanoPatro) do
  try
     InitializeAs(Padroes);
     if not TestaDispFinanc(Sistema.IdEmpresa,Sistema.IdUsuario,
                            dtpDataDisp.Date) then
        sAux := MessageInfo;
  finally
     Free;
  end;

  if Trim(sAux) <> '' then
  begin
     MsgDlg(sAux, 'Aviso', mtWarning, [mbOk], 0);
     Exit;
  end;



  If ( Not CdsDocumentos.IsEmpty ) Then
  Begin

    Try
      mostraProcessamento([3,cdsDocumentos.Recno,0,1,cdsDocumentos.RecordCount,'Documentos ']);
      iCodPortForma := CdsDocumentos.FieldByName('CODPORTFORMA').AsInteger;

      CdsDocumentos.DisableControls;
      CdsDocumentos.LogChanges := false;
      CtrlBaixaIntBanco.bUsaPortFormaRetorno := true;

      If ( CtrlBaixaIntBanco.bbtnConfirmarClick( sListaRetorno,
                                                 iCodPortForma,
                                                 StrToFloat(sNumChequeBordero),
                                                 CdsDocumentos.FieldByName('DataBaixa').AsDateTime, dtpDataDisp.Date, trunc(valCommit.value) )) Then Begin

      End Else Begin

      End;
    Finally
      MostraProcessamento([5]);

      CdsDocumentos.EnableControls;
      CdsDocumentos.LogChanges := true;
      sListaRetorno.Free;

      if trim(CtrlBaixaIntBanco.sNomeArqLog) <> '' then
        VisualizaArquivo(CtrlBaixaIntBanco.sNomeArqLog, '');
    End;
  End;
End;


procedure TFrmBaixaIntBancoMT.mostraProcessamento(vParam: array of Variant);
begin
  case vParam[0] of
     0: begin
           frmProgressoDuplo.DoubleBuffered := true;
           frmProgressoDuplo.Caption := 'Processamento de Baixa dos Documentos';

           frmProgressoDuplo.Min      := 0;
           frmProgressoDuplo.Max      := vParam[4];
           frmProgressoDuplo.Min2     := 0;
           frmProgressoDuplo.Max2     := vParam[7];
           frmProgressoDuplo.Legenda  := vParam[5];
           frmProgressoDuplo.Legenda2 := vParam[8];

           frmProgressoDuplo.btnCancelar.Visible := false;
           frmProgressoDuplo.MostraFormProgressoDuplo(vParam[5],vParam[8],vParam[3],vParam[6],vParam[4],vParam[7],false,false);
        end;

     1: begin
           if not frmProgressoDuplo.Visible then
              frmProgressoDuplo.MostraFormProgressoDuplo(vParam[5],vParam[8],vParam[3],vParam[6],vParam[4],vParam[7],false,false);

           frmProgressoDuplo.Legenda  := vParam[5];
           frmProgressoDuplo.Legenda2 := vParam[8];
           frmProgressoDuplo.Min      := vParam[3];
           frmProgressoDuplo.Min2     := vParam[6];
           frmProgressoDuplo.Max      := vParam[4];
           frmProgressoDuplo.Max2     := vParam[7];
           frmProgressoDuplo.AndaFormProgressoDuplo(vParam[1],vParam[2]);
        end;

     2: frmProgressoDuplo.EscondeFormProgressoDuplo;


     3: begin
           frmProgresso.DoubleBuffered := true;
           frmProgresso.Caption        := 'Processamento de Baixa dos Documentos';
           frmProgresso.MostraFormProgresso(vParam[5],false,false,true,vParam[3],vParam[4]);
        end;

     4: begin
          frmProgresso.Min     := vParam[3];
          frmProgresso.Max     := vParam[4];
          frmProgresso.Legenda := vParam[5];
          frmProgresso.AndaFormProgresso(vParam[1],vParam[4]);
        end;

     5: frmProgresso.EscondeFormProgresso;
  end;
  Application.ProcessMessages;
  Repaint;
end;



procedure TFrmBaixaIntBancoMT.FormActivate(Sender: TObject);  
begin
  if frmProgressoDuplo.Visible then
  begin 
    SetWindowPos(frmProgressoDuplo.handle, HWND_TOPMOST, frmProgressoDuplo.Left, frmProgressoDuplo.Top, frmProgressoDuplo.Width, frmProgressoDuplo.Height, 0);
    Repaint;
    Application.ProcessMessages;
  end
  else
    inherited;
end;




procedure TFrmBaixaIntBancoMT.CdsDocumentosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField(DataSet.FieldByName('VALOR')).DisplayFormat := '#,##0.00;-#,##0.00';
end;




procedure TFrmBaixaIntBancoMT.GrdCdsDocumentosCalcCellColors(
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
           ABrush.Color := clWhite;
        end;
     end;
  end else begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end;
end;




procedure TFrmBaixaIntBancoMT.GrdCdsDocumentosTopRowChanged(
  Sender: TObject);
begin
  inherited;
  (sender as TwwDBGrid).Invalidate;
end;




procedure TFrmBaixaIntBancoMT.GrdCdsDocumentosUpdateFooter(
  Sender: TObject);
var
  rTotal: Double;
begin
  inherited;
  rTotal := 0;

  with TClientDataSet.Create(nil) do
  try
     Data := CdsDocumentos.Data;
     while not Eof do
     begin
        rTotal := rTotal + FieldByName('VALOR').AsFloat;
        Next;
     end;

    (sender as TwwDBGrid).ColumnByName('VALOR').FooterValue := FormatFloat('#,##0.00;-#,##0.00',rTotal);
  finally
     Free;
  end;
end;

end.
