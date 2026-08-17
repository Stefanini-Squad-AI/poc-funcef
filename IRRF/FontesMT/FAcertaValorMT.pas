unit FAcertaValorMT;

{******************************************************************************
Analista.: Edilaine Ferraresi
Data.....: 21/08/2013
Sol......: 202259
Kintana..: 2042903
Descrição: verificar se há dados selecionados
*******************************************************************************
Analista.: Claudio Faria
Pendencia: 24608
Rotina...: Varias
Descrição: Novas maneira de parametrizar os acertos.
*******************************************************************************}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc, uCmSqlParams, DBClient,
  uCMClientDataSet, ComCtrls, Grids, Wwdbigrd, Wwdbgrid, uCtrlGeraAcerto, uSistema,
  uMensErro;

type
  TfrmAcertaValorMT = class(TfrmOkCancelar)
    pcValoresNegativos: TPageControl;
    tbsAcerto: TTabSheet;
    Panel1: TPanel;
    udAcerto: TUpDown;
    edtDataRef: TEdit;
    Label1: TLabel;
    btnTodas: TSpeedButton;
    btnInverter: TSpeedButton;
    wwDBGrid1: TwwDBGrid;
    btnFiltra: TBitBtn;
    cdsBuscaDados: TCMClientDataSet;
    SqlBuscaDados: TCMSqlParams;
    dsBuscaDados: TwwDataSource;
    cdsInforme: TCMClientDataSet;
    sqlInforme: TCMSqlParams;
    dsInforme: TwwDataSource;
    chbProcIntegral: TCheckBox;
    Label5: TLabel;
    edFiltroCPF: TEdit;
    procedure btnTodasClick(Sender: TObject);
    procedure btnInverterClick(Sender: TObject);
    procedure btnFiltraClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnAcertaDeducoesClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure pcValoresNegativosChange(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
    CtrlGeraAcerto : TCtrlGeraAcerto;

    Function Retorna_IDInforme:String; //CPrev - 24608
  public
    { Public declarations }
  end;

var
  frmAcertaValorMT: TfrmAcertaValorMT;

implementation

uses DBaseDados;

{$R *.DFM}

procedure TfrmAcertaValorMT.btnTodasClick(Sender: TObject);
begin
  // Edilaine - SOL 202259 / KTN 2042903
  if (cdsBuscaDados.isEmpty) or (cdsBuscaDados.recordcount = 0) then
     Abort;

  inherited;
  With cdsBuscaDados do
  begin
    DisableControls;
    First;
    While not EOF do
    begin
      Edit;
      if FieldByName('FLGBUSCA').AsString = 'N' then
        FieldByName('FLGBUSCA').AsString := 'S';
      Post;
      Next;
    end;
    EnableControls;
  end;
end;

procedure TfrmAcertaValorMT.btnInverterClick(Sender: TObject);
begin
  // Edilaine - SOL 202259 / KTN 2042903
  if (cdsBuscaDados.isEmpty) or (cdsBuscaDados.recordcount = 0) then
     Abort;

  inherited;
  With cdsBuscaDados do
  begin
    DisableControls;
    First;
    While not EOF do
    begin
       Edit;
       if FieldByName('FLGBUSCA').AsString = 'S' then
         FieldByName('FLGBUSCA').AsString := 'N'
       else
         FieldByName('FLGBUSCA').AsString := 'S';
       Post;
       Next;
    end;
    EnableControls;
  end;
end;

procedure TfrmAcertaValorMT.btnFiltraClick(Sender: TObject);
begin
  inherited;
  cdsBuscaDados.Data := CtrlGeraAcerto.ListGeraAcerto(edtDataRef.Text,edFiltroCPF.Text);
end;

procedure TfrmAcertaValorMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGeraAcerto := TCtrlGeraAcerto.Create;
  CtrlGeraAcerto.Initialize(DtmBaseDados.dbBaseDados,
                            True,
                            Sistema.ConnectionType,
                            Sistema.ConnectionSide,
                            Sistema.AppRemoteServer,
                            False,
                            nil);

  //CPrev - 24608 - Inicio
  udAcerto.Position  := StrToInt(FormatDateTime('YYYY', Date));
//  udDeducao.Position := StrToInt(FormatDateTime('YYYY', Date));

  pcValoresNegativos.ActivePageIndex := 0;

//  btnAcertaDeducoes.Visible := False;
//  If Sistema.TipoCliente = 19991 Then
//    btnAcertaDeducoes.Visible := True;
  //CPrev - 24608 - Fim
end;

procedure TfrmAcertaValorMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlGeraAcerto.Free;
end;

procedure TfrmAcertaValorMT.bbtnConfirmarClick(Sender: TObject);
begin
  // Edilaine - SOL 202259 / KTN 2042903
  if (cdsBuscaDados.isEmpty) or (cdsBuscaDados.recordcount = 0) then
     Abort;

  inherited;

  bbtnConfirmar.enabled := False;
  bbtnCancelar.Enabled  := False;

//Bruno Bastos - 19/02/2009 -  If not CtrlGeraAcerto.GeraAcerto(edtDataRef.Text, cdsBuscaDados.Data) Then
  If not CtrlGeraAcerto.NovoGeraAcerto(edtDataRef.Text,
                                       cdsBuscaDados.Data,
                                       chbProcIntegral.Checked,
                                       False) Then //Bruno Bastos - 19/02/2009
    MsgDlg(CtrlGeraAcerto.MessageInfo, 'Informação', mtInformation, [mbOk], 0)
  else
  Begin
    MsgDlg('Acerto efetuado com Sucesso', 'Informação', mtInformation, [mbOk], 0);
  end;

  bbtnConfirmar.enabled := True;
  bbtnCancelar.Enabled  := True;
end;

procedure TfrmAcertaValorMT.btnAcertaDeducoesClick(Sender: TObject);
begin
  inherited;
  {
  If not CtrlGeraAcerto.AcertaDevContrib(edtPessoa.text, StrToInt(edtDataRef.Text)) Then
  Begin
    MsgDlg('Processo interrompido.', 'Erro', mtError, [MbOk], 0);
    Exit;
  End;

  If not CtrlGeraAcerto.AcertaRendNegativo(edtPessoa.text, StrToInt(edtDataRef.Text)) Then
  Begin
    MsgDlg('Processo interrompido.', 'Erro', mtError, [MbOk], 0);
    Exit;
  End;
  }

  //If not CtrlGeraAcerto.AcertaDeducoes(edtPessoa.text, StrToInt(edtDataRef.Text)) Then                           //CPrev - 24608
  {
  If not CtrlGeraAcerto.AcertaDeducoes(edtPessoa.text, Retorna_IDInforme, StrToInt(edtDataRefDeducao.Text)) Then   //CPrev - 24608
  Begin
    MsgDlg('Processo interrompido.', 'Erro', mtError, [MbOk], 0);
    Exit;
  End;

  if not CtrlGeraAcerto.AcertaDeducoesIsento(edtPessoa.text, StrToInt(edtDataRef.Text)) Then
  Begin
    MsgDlg('Processo interrompido.', 'Erro', mtError, [MbOk], 0);
    Exit;
  End;
  }

    MsgDlg('Processo concluído com sucesso.', 'Informação', mtInformation, [MbOk], 0);
end;

procedure TfrmAcertaValorMT.BitBtn1Click(Sender: TObject);
begin
  inherited;
  {
  //If not CtrlGeraAcerto.CompensaDeducoes(edtPessoa.text, StrToInt(edtDataRef.Text)) Then                         //CPrev - 24608
  If not CtrlGeraAcerto.CompensaDeducoes(edtPessoa.text, Retorna_IDInforme, StrToInt(edtDataRefDeducao.Text)) Then //CPrev - 24608
    MsgDlg('Processo interrompido.', 'Erro', mtError, [MbOk], 0)
  Else
    MsgDlg('Processo concluído com sucesso.', 'Informação', mtInformation, [MbOk], 0);
    }
end;

procedure TfrmAcertaValorMT.BitBtn2Click(Sender: TObject);
begin
  inherited;
  //CtrlGeraAcerto.DesfazInsereIsento(edtPessoa.Text, StrToInt(edtDataRef.Text));
  //CtrlGeraAcerto.DesfazInsereLancxInforme(edtPessoa.Text, Retorna_IDInforme, StrToInt(edtDataRefDeducao.Text));
end;

procedure TfrmAcertaValorMT.pcValoresNegativosChange(Sender: TObject);
begin
  inherited;

  bbtnConfirmar.Enabled := (pcValoresNegativos.ActivePageIndex = 0);
end;

//CPrev - 24608 - Inicio
function TfrmAcertaValorMT.Retorna_IDInforme: String;
begin
  Result := '';

  cdsInforme.DisableControls;
  cdsInforme.First;
  while not cdsInforme.Eof do
  Begin
    If cdsInforme.FieldByName('FLGBUSCA').AsString = 'S' Then
      Result := Result + IntToStr(cdsInforme.FieldByName('IDINFORME').AsInteger) + ', ';

    cdsInforme.Next;
  End;       
  Result := Copy(Result, 1, Length(Result) - 2);
  cdsInforme.EnableControls;
end;
//CPrev - 24608 - Fim

procedure TfrmAcertaValorMT.FormShow(Sender: TObject);
begin
  inherited;

  sqlInforme.Open;

end;

end.
