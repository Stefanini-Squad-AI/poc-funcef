unit fLancEventosMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, DBCtrls,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, Grids, Wwdbigrd,
  Wwdbgrid, uCmSqlParams, uCtrlEventoDocum, Mask;

type
  TFrmLancEventoMT = class(TFrmCadastroMT)
    SqlTipoEvento: TCMSqlParams;
    CdsTipoEvento: TCMClientDataSet;
    dsTipoEvento: TwwDataSource;
    Panel3: TPanel;
    GpDocumento: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    CMSqlParams2: TCMSqlParams;
    BtnSeleciona: TBitBtn;
    MsDoc: TMontaSelect;
    Panel_Descricao: TPanel;
    Label1: TLabel;
    DBMemo1: TDBMemo;
    PnlEvento: TPanel;
    LblContabilizacao: TLabel;
    GrdEventos: TwwDBGrid;
    Panel2: TPanel;
    Label4: TLabel;
    dblcTipoEvento: TwwDBLookupCombo;
    Label2: TLabel;
    DtEvento: TCMDateTimePicker;
    CdsDoc: TCMClientDataSet;
    dsDoc: TwwDataSource;
    SqlDoc: TCMSqlParams;
    dbDocumento: TDBText;
    dbDataProg: TDBText;
    dbFornecedor: TDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure BtnSelecionaClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
  private
    { Private declarations }
    CtrlEventoDocum : TCtrlEventoDocum;
    iCodDocumento : Integer;
    Procedure Seleciona;
    Function VerificaPreenchimento : boolean;
  public
    { Public declarations }
  end;

var
  FrmLancEventoMT: TFrmLancEventoMT;

implementation

Uses uMensErro, dBasedados, uSistema, uVerificaPreenchimento;

{$R *.DFM}

procedure TFrmLancEventoMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlEventoDocum := TCtrlEventoDocum.Create;
  CtrlEventoDocum.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                             Sistema.ConnectionSide, Sistema.AppRemoteServer, True );
  CtrlEventoDocum.CdsEventoxDocum    := cds;
  CtrlEventoDocum.CdsTipoEventoDocum := CdsTipoEvento;

  cds.data           := CtrlEventoDocum.ListaEventoxDocum(-1);
  CdsTipoEvento.Data := CtrlEventoDocum.ListaTipoEventoDocum( -1000 );

  MontaSelect.Filtro.Add('D.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa) );
  MontaSelect.Filtro.Add('T.IDMODULO  = ' + IntToStr(Sistema.IdModulo) );

  MsDoc.Filtro.Add('D.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa) );
  MsDoc.Filtro.Add('D.IDMODULO  = ' + IntToStr(Sistema.IdModulo) );
end;


procedure TFrmLancEventoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CtrlEventoDocum.Free;
  inherited;
end;


procedure TFrmLancEventoMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlEventoDocum.GravarEventoxDocum;
end;


procedure TFrmLancEventoMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;

  IF MontaSelect.RetornouValor Then begin
     iCodDocumento := StrToint(MontaSelect.ValoresChave[0]);
     cds.data      := CtrlEventoDocum.ListaEventoxDocum(iCodDocumento);
     CdsDoc.Close;
     SqlDoc.Prepare;
     SqlDoc.ParamByName('CODDOCUMENTO').asInteger := StrToInt(MontaSelect.ValoresChave[0]);
     SqlDoc.Open;
  end;

end;

procedure TFrmLancEventoMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  Seleciona;
  GpDocumento.Enabled     := True;
  Panel_Descricao.Enabled := True;
  GrdEventos.Visible      := false;
  dblcTipoEvento.SetFocus;
end;

procedure TFrmLancEventoMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  GpDocumento.Enabled     := False;
  Panel_Descricao.Enabled := False;
  GrdEventos.Visible      := true;
  dbDocumento.DataSource  := ds;
  dbDataProg.DataSource   := ds;
  dbFornecedor.DataSource := ds;
end;

procedure TFrmLancEventoMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  GrdEventos.Visible      := False;
  Panel_Descricao.Enabled := True;
  dblcTipoEvento.SetFocus;
end;

procedure TFrmLancEventoMT.BtnSelecionaClick(Sender: TObject);
begin
  inherited;
  Seleciona;
end;


procedure TFrmLancEventoMT.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  GrdEventos.Visible := true;
  cds.data := CtrlEventoDocum.ListaEventoxDocum(iCodDocumento);
end;


procedure TFrmLancEventoMT.Seleciona;
begin
  If (MsDoc.Executar = MrOk) And (MsDoc.RetornouValor) Then
  begin
    iCodDocumento                            := StrToInt(MsDoc.ValoresChave[0]);
    Cds.FieldByName('CODDOCUMENTO').AsString := MsDoc.ValoresChave[0];
    Cds.FieldByName('IDUSUARIO').AsInteger   := Sistema.IdUsuario;
    CdsDoc.Close;
    SqlDoc.Prepare;
    SqlDoc.ParamByName('CODDOCUMENTO').asInteger := iCodDocumento;
    dbDocumento.DataSource  := dsDoc;
    dbDataProg.DataSource   := dsDoc;
    dbFornecedor.DataSource := dsDoc;
    SqlDoc.Open;
  end;

end;

function TFrmLancEventoMT.VerificaPreenchimento: boolean;
begin
   Result := False;
   try
      if trim(dblcTipoEvento.Text) = '' then
        raise Evalidacao.createVal('Informe o tipo do evento ', dblcTipoEvento );

      if (DtEvento.Text) = '' then
        raise Evalidacao.createVal('Informe a data do evento', DtEvento );
   except
      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.Message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;
   Result := True;
end;

procedure TFrmLancEventoMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

  if cds.State in dsEditModes then begin
     Accept := VerificaPreenchimento;
  end;

end;

procedure TFrmLancEventoMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  GpDocumento.Enabled     := False;
  Panel_Descricao.Enabled := False;
end;

end.
