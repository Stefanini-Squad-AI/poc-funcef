unit FGeraArqDarfJud;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, wwdbdatetimepicker,
  CMDateTimePicker, Buttons, ExtCtrls, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, TB97, uDiasUteis, Db, Wwdatsrc, DBClient,
  uCMClientDataSet, dBaseDados, uSistema, uMensErro,
  uCmSqlParams, uCtrlGeraArqDarfJud;

type
  TFrmGeraArqDarfJud = class(TfrmSairAjuda)
    Grid: TwwDBGrid;
    Panel1: TPanel;
    Cds: TCMClientDataSet;
    CdsFLGEXCLUI: TStringField;
    CdsCONTRIBUINTE: TStringField;
    CdsDATAEMISDARF: TDateTimeField;
    CdsDATAVENCDARF: TDateTimeField;
    CdsVLRTOTAL: TFloatField;
    CdsCODNATUREZA: TStringField;
    CdsFAVORECIDO: TStringField;
    CdsIDDARF: TFloatField;
    CdsCODDOCUMENTO: TFloatField;
    ds: TwwDataSource;
    bbtnGera: TBitBtn;
    SqlParams: TCMSqlParams;
    btnTodas: TSpeedButton;
    btnInverter: TSpeedButton;
    BitBtn1: TBitBtn;
    lblNomeArq: TLabel;
    edtNomeArquivo: TEdit;
    sbtnGravaArqAtivo: TSpeedButton;
    rdgFiltragem: TRadioGroup;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtDtInicio: TCMDateTimePicker;
    edtDtFim: TCMDateTimePicker;
    svdArqDarfJud: TSaveDialog;
    procedure btnTodasClick(Sender: TObject);
    procedure btnInverterClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnGeraClick(Sender: TObject);
    procedure sbtnGravaArqAtivoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
    DarfJud  : TCtrlGeraArqDarfJud;
    procedure MudaStatusSelecao;
    procedure MensErroMt(sMsgInfo: string);

  public
    { Public declarations }
  end;

var
  FrmGeraArqDarfJud: TFrmGeraArqDarfJud;

implementation

{$R *.DFM}

procedure TFrmGeraArqDarfJud.btnTodasClick(Sender: TObject);
begin
  inherited;
  if not Cds.IsEmpty then
  begin
    Cds.DisableControls;
    Cds.First;

    while not Cds.Eof do
    begin
      if Cds.FieldByName('FLGEXCLUI').AsString <> 'S' then
      begin
        Cds.Edit;
        Cds.FieldByName('FLGEXCLUI').AsString := 'S';
        Cds.Post;
      end;
      Cds.Next;
    end;

    Cds.First;
    Cds.EnableControls;
  end;
End;

procedure TFrmGeraArqDarfJud.btnInverterClick(Sender: TObject);
begin
  inherited;
  if not Cds.IsEmpty then
  begin
    Cds.DisableControls;
    Cds.First;

    while not Cds.Eof do
    begin
      MudaStatusSelecao;
      Cds.Next;
    end;

    Cds.First;
    Cds.EnableControls;
  end;
end;

procedure TFrmGeraArqDarfJud.BitBtn1Click(Sender: TObject);
var
  bFiltroVencimento: boolean;

begin
  inherited;
  if rdgFiltragem.ItemIndex = 0 then
    // Filtra por data de emissão do DARF
    bFiltroVencimento := false
  else
    // Filtra por data de vencimento do DARF
    bFiltroVencimento := True;

  Cds.Data := DarfJud.ListaDarfs(False,bFiltroVencimento,edtDtInicio.Date,edtDtFim.Date, False);
end;

procedure TFrmGeraArqDarfJud.FormCreate(Sender: TObject);
Var
  iAno, iMes, iDia : Word;

begin
  inherited;

  DarfJud          := TCtrlGeraArqDarfJud.Create;
  DarfJud.Initialize (dtmBaseDados.dbBaseDados, true,
                       Sistema.ConnectionType, Sistema.ConnectionSide,
                       Sistema.AppRemoteServer, true, MensErroMT);

  Cds.Data := DarfJud.ListaDarfs(True,false,0,0,False);

  DecodeDate(Date, iAno, iMes, iDia);
  edtDtInicio.Date := EncodeDate( iAno, iMes, 1);
  edtDtFim.Date    := DiasUteis.UltDiaMes(iAno, iMes);
end;

procedure TFrmGeraArqDarfJud.MudaStatusSelecao;
begin
  if not Cds.IsEmpty then
  begin
    if Cds.FieldByName('FLGEXCLUI').AsString = 'S' then
    begin
      Cds.Edit;
      Cds.FieldByName('FLGEXCLUI').AsString := 'N';
      Cds.Post;
    end
    else
    begin
      Cds.Edit;
      Cds.FieldByName('FLGEXCLUI').AsString := 'S';
      Cds.Post;
    end;
  end;
end;

procedure TFrmGeraArqDarfJud.MensErroMt(sMsgInfo: string);
begin
  //forma a mensagem de erro
  MsgDlg(sMsgInfo, Sistema.NomeAplicativo, mtWarning,[mbOk],0);
end;

procedure TFrmGeraArqDarfJud.bbtnGeraClick(Sender: TObject);
begin
  inherited;
  DarfJud.GeraArquivo(cds.Data, edtNomeArquivo.Text);
  MsgDlg('Processo terminado', 'Informação', mtInformation, [mbOk], 0);
end;

procedure TFrmGeraArqDarfJud.sbtnGravaArqAtivoClick(Sender: TObject);
begin
  inherited;
  If svdArqDarfJud.Execute Then
    edtNomeArquivo.Text := svdArqDarfJud.FileName;
end;

procedure TFrmGeraArqDarfJud.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DarfJud.Free;
end;

end.
