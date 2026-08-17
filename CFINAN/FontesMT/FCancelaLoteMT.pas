(*******************************************************************************
 13/08/2002
  Migração desta tela para o modelo 3 camadas - Fábio Barros
 *******************************************************************************)

unit FCancelaLoteMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Grids, Wwdbigrd,
  Wwdbgrid, Db, DBTables, Wwdatsrc, UMensErro, uSistema,
  TB97Tlbr, IvDictio, IvMulti, IvEMulti, uIntegraBack, fcOutlookList,
  fcButton, fcImgBtn, fcShapeBtn, fcClearPanel, fcButtonGroup, fcOutlookBar,
  ImgList, wwdbdatetimepicker, CMDateTimePicker, uCmSqlParams, DBClient,
  uCMClientDataSet, uCtrlCancelaLote, uCtrlParamIntegra;

type
  TCancelaLoteError = Exception;

  TFrmCancelaLoteMT = class(TfrmSairAjuda)
    Panel1: TPanel;
    Panel2: TPanel;
    dbgrdLotePagto: TwwDBGrid;
    DsGrid: TwwDataSource;
    Dbgrdlote: TwwDBGrid;
    dsLote: TwwDataSource;
    Pnldocpago: TPanel;
    Panel5: TPanel;
    Panel3: TPanel;
    FobCancela: TfcOutlookBar;
    LstGerados: TfcOutlookList;
    PageGerados: TfcShapeBtn;
    Lstcancelados: TfcOutlookList;
    PageCancelados: TfcShapeBtn;
    ImlLotes: TImageList;
    Panel4: TPanel;
    Label2: TLabel;
    DlIni: TCMDateTimePicker;
    Label1: TLabel;
    DlFim: TCMDateTimePicker;
    cdsLotePagto: TCMClientDataSet;
    cdsGrid: TCMClientDataSet;
    cdsAux: TCMClientDataSet;
    sqlAux: TCMSqlParams;
    procedure FormCreate(Sender: TObject);

    procedure DbgrdloteMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

    procedure fcOutlookBar1OutlookList1Items0Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);

    procedure fcOutlookBar1OutlookList1Items1Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items1Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);

    procedure FobCancelaChange(ButtonGroup: TfcCustomButtonGroup;
      OldSelected, Selected: TfcButtonGroupItem);

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    _CancelaLote : TCtrlCancelaLote;
    procedure Limpa_Tela;
    procedure SelecionaDoc;
    procedure SelecionaLote;
  public
    { Public declarations }
  protected
    iNumSeqLote : Double;
  end;

var
  FrmCancelaLoteMT: TFrmCancelaLoteMT;

implementation

uses DBaseDados, Uautorizacao, UDataBase, uModulo, uLancFinanc, uLancContab;

{$R *.DFM}

procedure TFrmCancelaLoteMT.limpa_tela;
begin
  if cdsLotePagto.Active then cdsLotePagto.Close;
  cdsLotePagto.Data := _CancelaLote.ListLotePagtoEmpty;

  if cdsGrid.Active then cdsGrid.Close;
  cdsGrid.Data := _CancelaLote.ListDadosGridEmpty;
end;

procedure TFrmCancelaLoteMT.FormCreate(Sender: TObject);
begin
  inherited;
  _CancelaLote               := TCtrlCancelaLote.Create;
  _CancelaLote.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  _CancelaLote._cdsGrid      := cdsGrid;
  _CancelaLote._cdsLotePagto := cdsLotePagto;

  Limpa_Tela;

  DlIni.Date                 := Date;
  DlFim.Date                 := Date;
  FobCancela.ActivePage      := PageGerados;
end;


procedure TFrmCancelaLoteMT.selecionadoc;
begin
  cdsGrid.Data := _CancelaLote.SelecionaDocumentos(Sistema.IDEmpresa,
                                                   Sistema.IDUsuario,
                                                   ParamIntegra.RecPag,
                                                   cdsLotePagto.FieldByName('NUMLOTE').AsString);
end;

procedure TFrmCancelaLoteMT.selecionalote;
begin
  Limpa_Tela;
  cdsLotePagto.Data := _CancelaLote.SelecionaLote((FobCancela.ActivePage = PageGerados),
                                                   Sistema.IDEmpresa, Sistema.IDUsuario,
                                                   ParamIntegra.RecPag,
                                                   DlIni.Text, DlFim.Text);
  if not cdsLotePagto.IsEmpty then SelecionaDoc;
end;



procedure TFrmCancelaLoteMT.DbgrdloteMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if cdsLotePagto.IsEmpty then Exit;
  SelecionaDoc;
end;


procedure TFrmCancelaLoteMT.fcOutlookBar1OutlookList1Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  SelecionaLote;
end;

procedure TFrmCancelaLoteMT.fcOutlookBar1OutlookList1Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  if (not cdsLotePagto.IsEmpty) and
     (Application.MessageBox('Confirma o cancelamento do Lote','Atenção',Mb_YesNo + Mb_IconQuestion) = Id_Yes) then
  begin
    Dbgrdlote.Enabled  := False;
    try
      if _CancelaLote.Cancela_Lote(cdsLotePagto.FieldByName('IDPROCESSO').AsString,
                                Sistema.IdEmpresa,
                                Sistema.IdModulo,
                                Sistema.IDUsuario,
                                ParamIntegra.Plano,
                                Sistema.UsaPlanoPatro,
                                ParamIntegra.IntegraContab,
                                Modulo.EstornaFinanc,
                                ParamIntegra.EstornaContab) then
        Msgdlg('Lote cancelado com sucesso.','Aviso',mtInformation,[mbOk],0);
      Dbgrdlote.SelectedList.clear;
      Dbgrdlote.enabled  := true;
      SelecionaLote;
    except
      on E:Exception do
      begin
        Msgdlg('O Lote não pode ser cancelado. ' + (#13+#10) + E.Message,'Aviso',mtError,[mbOk],0);
        Dbgrdlote.SelectedList.Clear;
        Dbgrdlote.enabled := True;
        SelecionaLote;
        raise;
      end;
    end;
  end;
end;

procedure TFrmCancelaLoteMT.fcOutlookBar1OutlookList2Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  cdsGrid.first;
  while not cdsGrid.EOF do
  begin
    sqlAux.SQL.Clear;
    sqlAux.SQL.Append('SELECT 1 FROM LOTEXDOCUM WHERE CODDOCUMENTO = ' +
                       cdsGrid.FieldByName('CODDOCUMENTO').AsString +
                      ' AND NUMLOTE > ' + cdsGrid.FieldByName('NUMLOTE').AsString);
    if cdsAux.Active then cdsAux.Close;
    sqlAux.Open;
    if not cdsAux.IsEmpty then
    begin
      Msgdlg('Existe documento deste lote em outro lote', 'Aviso', mterror, [mbOk], 0);
      Exit;
    end;
    cdsGrid.Next;
  end;

  cdsGrid.First;
  if (not cdsLotePagto.IsEmpty) and
     (Application.MessageBox('Confirma que deseja regerar o lote','Atenção',Mb_YesNo + Mb_IconQuestion) = Id_Yes) Then
  begin
    try
      Dbgrdlote.enabled           := False;
      _CancelaLote.Regera_Lote;
      Dbgrdlote.SelectedList.clear;
      Dbgrdlote.enabled  := true;
      Selecionalote;
    except
      Dbgrdlote.enabled           := True;
      Msgdlg('O Lote não pode ser regerado','Aviso',mterror,[mbOk],0);
    end;
  end;
end;


procedure TFrmCancelaLoteMT.FobCancelaChange(
  ButtonGroup: TfcCustomButtonGroup; OldSelected,
  Selected: TfcButtonGroupItem);
begin
  inherited;
  Limpa_Tela;
end;

procedure TFrmCancelaLoteMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  _CancelaLote.Free;
end;

end.
