//andre tavares - pendência 19305 - implementado um botao para selecionar todos os documentos,
//aproveitei para abolir o uso do control uCtrlAgrupaCnab e passei a utilizar a uCtrlDocumento.

unit FAgrupaCnabMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, wwdbdatetimepicker, CMDateTimePicker,
  CMProcuraSubTipo, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, ExtCtrls,
  uCtrlDocumento, uCtrlPadroes,
  Db, Wwdatsrc, DBTables,
  DBClient, uCMClientDataSet, Grids, Wwdbgrid,
  uCtrlPortadorForma, wwdblook, uCtrlParamIntegra, Wwdbigrd;

type
  TfrmAgrupaCnabMT = class(TfrmSairAjuda)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    dtpData: TCMDateTimePicker;
    CmpForCli: TCMProcuraForCli;
    btSeleciona: TBitBtn;
    cds: TCMClientDataSet;
    ds: TwwDataSource;
    TB97oKCancelar: TToolbar97;
    bbtnConfirmar: TBitBtn;
    dblcPortadorForma: TwwDBLookupCombo;
    lblPortadorForma: TLabel;
    cdsPortForma: TCMClientDataSet;
    Panel1: TPanel;
    wwDBGrid1: TwwDBGrid;
    Panel2: TPanel;
    bBtnMarcaTodos: TBitBtn;
    cdsInput: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure btSelecionaClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bBtnMarcaTodosClick(Sender: TObject);
  private
    { Private declarations }
//início - andre tavares - pendência 19305
    ctrlDocumento : TctrlDocumento;   
//fim - andre tavares - pendência 19305
    _PortadorForma       : TCtrlPortadorForma;
  public
    { Public declarations }
  end;

var
  frmAgrupaCnabMT: TfrmAgrupaCnabMT;

implementation

uses USistema, UMensErro, DBaseDados;

{$R *.DFM}

procedure TfrmAgrupaCnabMT.FormCreate(Sender: TObject);
begin
  inherited;
//início - andre tavares - pendência 19305
  CtrlDocumento := TCtrlDocumento.Create;
  CtrlDocumento.InitializeAs(Padroes);
//fim - andre tavares - pendência 19305

  _PortadorForma       := TCtrlPortadorForma.Create;
  _PortadorForma.Initialize(DtmBaseDados.dbBaseDados,false,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

  dtpData.Date      := Date;

  cdsPortForma.Data := _PortadorForma.ListPortadorforma(ParamIntegra.RecPag, 0, Sistema.IdEmpresa);
//início - andre tavares - pendência 19305
  cds.Data          := CtrlDocumento.IntBanco.ListDocumentos(0, DateToStr(Date), 0);
//fim - andre tavares - pendência 19305
  cds.Edit;
end;

procedure TfrmAgrupaCnabMT.btSelecionaClick(Sender: TObject);
begin
  inherited;
  if trim(dblcPortadorForma.Text) = '' then
  begin
    MsgDlg('Favor informar a Conta/Caixa x Tipo de Cobrança.','Informação',mtInformation,[mbOk],0);
    dblcPortadorForma.SetFocus;
    Exit;
  end;
  if trim(dtpData.Text) = '' then
  begin
    MsgDlg('Favor informar a Data Programada.','Informação',mtInformation,[mbOk],0);
    dtpData.SetFocus;
    Exit;
  end;
//início - andre tavares - pendência 19305
  cds.Data          := CtrlDocumento.IntBanco.ListDocumentos(CmpForCli.ForCliReg.ID, dtpData.Text, StrToInt(dblcPortadorForma.LookupValue));
//fim - andre tavares - pendência 19305

  cds.Edit;
end;

procedure TfrmAgrupaCnabMT.bbtnConfirmarClick(Sender: TObject);
begin
  // inicio - andre tavares
  if not CtrlDocumento.IntBanco.VerificaConsistencia(cds.data) then
  begin
    showMessage('Só é Permitido o Agrupamento de Documentos do Mesmo Cliente.');
    exit;
  end;
  // fim - andre tavares

  with cds do
  begin
    if State = dsEdit then Post;
    First;
    // inicio - andre tavares - pendência 19305
    cdsInput.Data := cds.Data;
    cdsInput.EmptyDataSet;
    // fim - andre tavares - pendência 19305
    while not EOF do
    begin
      if FieldByName('SELECIONAR').AsString = 'S' then
      begin
      // inicio - andre tavares - pendência 19305
        cdsInput.Append;
        cdsInput.FieldByName('IDFORCLI').AsString       := FieldByName('IDFORCLI').AsString;
        cdsInput.FieldByName('CODDOCUMENTO').AsString   := FieldByName('CODDOCUMENTO').AsString;
        cdsInput.FieldByName('RAZAOSOCIAL').AsString    := FieldByName('RAZAOSOCIAL').AsString;
        cdsInput.FieldByName('NODOCUMENTO').AsString    := FieldByName('NODOCUMENTO').AsString;
        cdsInput.FieldByName('DATAPROGRAMADA').AsString := FieldByName('DATAPROGRAMADA').AsString;
        cdsInput.Post;
      // fim - andre tavares - pendência 19305
      end; //if
      Next;
    end;
  end;

  if cdsInput.IsEmpty then
  begin
    MsgDlg('Selecione um documento.','Erro',mtError,[mbOk],0);
    dblcPortadorForma.SetFocus;
    Exit;
  end;
// inicio - andre tavares - pendência 19305 -
  if CtrlDocumento.IntBanco.AgrupaDocCnab(cdsInput, true, false, ['IDFORCLI']) then
  begin
    cds.Data := CtrlDocumento.IntBanco.ListDocumentos(CmpForCli.ForCliReg.ID, dtpData.Text, StrToInt(dblcPortadorForma.LookupValue));
// fim - andre tavares - pendência 19305 -
    MsgDlg('Operação finalizada com sucesso!','Informação',mtInformation,[mbOk],0);
  end
  else
    MsgDlg(CtrlDocumento.MessageInfo,'Erro',mtError,[mbOk],0);
end;

procedure TfrmAgrupaCnabMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlDocumento.Free;
  _PortadorForma.Free;
end;

procedure TfrmAgrupaCnabMT.bBtnMarcaTodosClick(Sender: TObject);
begin
  inherited;
  cds.DisableControls;
  cds.First;
  while not cds.Eof do
  begin
    cds.Edit;

    if cds.FieldByName('SELECIONAR').asString <> 'S' then
      cds.FieldByName('SELECIONAR').asString := 'S'
    else
      cds.FieldByName('SELECIONAR').asString := 'N';

    cds.Post;  
    cds.Next;
  end;// while
  cds.First;
  cds.EnableControls;
end;

end.
