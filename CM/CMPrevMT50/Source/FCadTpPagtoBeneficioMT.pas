unit FCadTpPagtoBeneficioMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  uCtrlTpPagtoBeneficio, uCtrlTpPeriodicidade,
  dBaseDados, uSistema, uMensErro, wwdblook, DBCtrls, Mask;

type
  TfrmCadTpPagtoBeneficioMT = class(TFrmCadastroMT)
    Label2: TLabel;
    dbedNome: TDBEdit;
    dbrgrpTpPagto: TDBRadioGroup;
    lbPeriodicidade: TLabel;
    dblkcmbPeriodicidade: TwwDBLookupCombo;
    lblQtdeMeses: TLabel;
    dbedQtdeMeses: TDBEdit;
    cdsTpPeriodicidade: TCMClientDataSet;
    dsTpPeriodicidade: TwwDataSource;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbrgrpTpPagtoChange(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
  private
    { Private declarations }
    CtrlTpPagtoBeneficio : TCtrlTpPagtoBeneficio;
    CtrlTpPeriodicidade  : TCtrlTpPeriodicidade;

    procedure MessageCtrlTpPagtoBeneficio(sMessageInfo: String);
  public
    { Public declarations }
  end;

var
  frmCadTpPagtoBeneficioMT: TfrmCadTpPagtoBeneficioMT;

implementation

{$R *.DFM}

procedure TfrmCadTpPagtoBeneficioMT.FormCreate(Sender: TObject);
begin
  inherited;

  CtrlTpPagtoBeneficio := TCtrlTpPagtoBeneficio.Create;
  CtrlTpPagtoBeneficio.Initialize(DtmBaseDados.DbBaseDados, True,
                                  Sistema.ConnectionType,
                                  Sistema.ConnectionSide,
                                  Sistema.AppRemoteServer,
                                  True, MessageCtrlTpPagtoBeneficio );

  CtrlTpPeriodicidade := TCtrlTpPeriodicidade.Create;
  CtrlTpPeriodicidade.Initialize(DtmBaseDados.DbBaseDados, True,
                                 Sistema.ConnectionType,
                                 Sistema.ConnectionSide,
                                 Sistema.AppRemoteServer,
                                 True, MessageCtrlTpPagtoBeneficio );

  Cds.Data                := CtrlTpPagtoBeneficio.SelecionaTpPagtoBeneficio(-1);
  cdsTpPeriodicidade.Data := CtrlTpPeriodicidade.ListaTpPeriodicidade;
end;

procedure TfrmCadTpPagtoBeneficioMT.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;

  CtrlTpPagtoBeneficio.CdsTpPagtoBeneficio.Data := Cds.Data;
  CtrlTpPagtoBeneficio.GravaTpPagtoBeneficio;
end;

procedure TfrmCadTpPagtoBeneficioMT.MessageCtrlTpPagtoBeneficio(sMessageInfo: String);
begin
  MsgDlg(sMessageInfo, 'Erro', mtError, [mbOk],0)
end;

procedure TfrmCadTpPagtoBeneficioMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;

  if MontaSelect.RetornouValor then
    Cds.Data := CtrlTpPagtoBeneficio.SelecionaTpPagtoBeneficio( StrToInt( MontaSelect.ValoresChave[0] ) );
end;

procedure TfrmCadTpPagtoBeneficioMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CtrlTpPagtoBeneficio.Free;
  CtrlTpPeriodicidade.Free;
  
  inherited;
end;

procedure TfrmCadTpPagtoBeneficioMT.dbrgrpTpPagtoChange(Sender: TObject);
begin
  inherited;

  Case dbrgrpTpPagto.ItemIndex of
    0 : Begin 
          lbPeriodicidade.Visible      := False;
          dblkcmbPeriodicidade.Visible := False;
          lblQtdeMeses.Visible         := False;
          dbedQtdeMeses.Visible        := False;
        End;
    1 : Begin
          lbPeriodicidade.Visible      := True;
          dblkcmbPeriodicidade.Visible := True;
          lblQtdeMeses.Visible         := False;
          dbedQtdeMeses.Visible        := False;
        End;
    2 : Begin
          lbPeriodicidade.Visible      := True;
          dblkcmbPeriodicidade.Visible := True;
          lblQtdeMeses.Visible         := True;
          dbedQtdeMeses.Visible        := True;
        End;
  End;
end;

procedure TfrmCadTpPagtoBeneficioMT.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
  If Trim(dbedNome.Text) = '' Then
  Begin
    MsgDlg('Descrição da Forma de Pagamento do Benefício não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
    Exit;
  End;

  If dbrgrpTpPagto.ItemIndex = -1 Then
  Begin
    MsgDlg('Tipo de Pagamento não selecionado.','Erro',mtError,[mbOk,mbHelp],0);
    Exit;
  End;

  If dbrgrpTpPagto.ItemIndex = 0 Then
  Begin
    cds.Fieldbyname('IDTPPERIODICIDADE').Clear;
    cds.Fieldbyname('QTDEMESES').Clear;
  End;

  If dbrgrpTpPagto.ItemIndex = 1 Then
  Begin
    cds.Fieldbyname('QTDEMESES').Clear;
  End;

  If ((dbrgrpTpPagto.ItemIndex = 1) Or
      (dbrgrpTpPagto.ItemIndex = 2)) And
     (Trim(dblkcmbPeriodicidade.Text) = '') Then
  Begin
    MsgDlg('Periodicidade não preenchida.','Erro',mtError,[mbOk,mbHelp],0);
    Exit;
  End;

  If (dbrgrpTpPagto.ItemIndex = 2) and (Trim(dbedQtdeMeses.Text) = '') Then
  Begin
    MsgDlg('Quantidade de Meses não preenchida.','Erro',mtError,[mbOk,mbHelp],0);
    Exit;
  End;

  If (dbrgrpTpPagto.ItemIndex = 0) Or
     (dbrgrpTpPagto.ItemIndex = 1) Then
    cds.Fieldbyname('FLGPRAZOCERTO').AsInteger := 0
  Else
    cds.Fieldbyname('FLGPRAZOCERTO').AsInteger := 1;

 // If cds.State = dsInsert Then
 //   cds.FieldByName('IDTPPAGTOBENEFIC').AsInteger := LeUltRegistro(nil,'TPPAGTOBENEFICIO');

  inherited;
end;

end.
