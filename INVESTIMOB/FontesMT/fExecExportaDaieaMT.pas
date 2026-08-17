unit fExecExportaDaieaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, uCMClientDataSet, uCtrlExpDaiea,
  wwriched, Menus;


type
  TfrmExecExportaDaieaMT = class(TfrmWizardMT)
    edArqExporta: TEdit;
    Label1: TLabel;
    btnBuscaArq: TBitBtn;
    btnLimpaArq: TBitBtn;
    dlgSalvar: TSaveDialog;
    Label2: TLabel;
    edtDataGeracao: TCMDateTimePicker;
    meErros: TwwDBRichEdit;
    PopupMenu1: TPopupMenu;
    mnuSalvar: TMenuItem;
    mnuImprimir: TMenuItem;
    procedure btnBuscaArqClick(Sender: TObject);
    procedure btnLimpaArqClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure mnuSalvarClick(Sender: TObject);
    procedure mnuImprimirClick(Sender: TObject);
  private
    { Private declarations }
    CtrlExpDaiea : TCtrlExpDaiea;

    function  VerificaPreenchimento : Boolean;
    function  GeraArquivo: Boolean;
    procedure Progresso (vParams: array of variant);
  public
    { Public declarations }
  end;

var
  frmExecExportaDaieaMT: TfrmExecExportaDaieaMT;

implementation

uses dBaseDados, uMensErro, uSistema, uComunsImobiliario, dMS, uModuloImobiliario,
  FProgresso;

{$R *.DFM}

procedure TfrmExecExportaDaieaMT.FormCreate(Sender: TObject);
begin
  inherited;
  // Cria os CtrlObjects dos objetos a serem utilizados
  CtrlExpDaiea := TCtrlExpDaiea.Create;

  // Inicializa os CtrlObjects dos objetos a serem utilizados
  CtrlExpDaiea.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                          Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                          ComunsImobiliario.MensErroMT);

  CtrlExpDaiea.Progresso := Progresso;

  edtDataGeracao.Date := Date;
end;

procedure TfrmExecExportaDaieaMT.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil( CtrlExpDaiea );
end;

procedure TfrmExecExportaDaieaMT.btnBuscaArqClick(Sender: TObject);
begin
  inherited;
  // se for preenchido um arquivo, limpa a seleção de Imóvel e grupo
  dlgSalvar.Execute;
  edArqExporta.Text := dlgSalvar.FileName;
end;

procedure TfrmExecExportaDaieaMT.btnLimpaArqClick(Sender: TObject);
begin
  inherited;
  edArqExporta.Clear;
end;


function TfrmExecExportaDaieaMT.VerificaPreenchimento: Boolean;
begin
  Result := False;
  try
    if edtDataGeracao.Text = '' then
      raise EValidacao.CreateVal('Informe a Data de geração do arquivo', edtDataGeracao);
    if edArqExporta.Text = ''   then
      raise EValidacao.CreateVal('Informe o nome do arquivo', edArqExporta);
  except
    on ev : EValidacao do begin
      if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;
  Result := True;
end;

procedure TfrmExecExportaDaieaMT.btnContinuarClick(Sender: TObject);
begin
  if MsgDlg('Confirma a geração do arquivo ?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    if VerificaPreenchimento then begin
      inherited;
      GeraArquivo;
    end;
  end;
end;

function TfrmExecExportaDaieaMT.GeraArquivo: Boolean;
var vArquivo : OLEVariant;
    cdsTemp  : TCMClientDataSet;
    ArqSaida : TextFile;
    bGrava   : Boolean;
begin
  try
    { Cria ou associa um arquivo a uma variavel }
    AssignFile(ArqSaida,dlgSalvar.FileName);

    { Abre o Arquivo para Gravacao }
    Try
      Rewrite(ArqSaida);
    Except
      MessageDlg('Não foi possível criar o arquivo de Saída ..',MtError,[mbOk],0);
      Exit;
    End;

    CtrlExpDaiea.CreateThreadProgresso;
    frmProgresso.MostraFormProgresso('Gerando arquivo...');
    meErros.Lines.Add('INÍCIO DA GERAÇÃO DO ARQUIVO... ');
    meErros.Lines.Add('');

    bGrava := CtrlExpDaiea.GeraArquivo( edtDataGeracao.Date, vArquivo,
                                        CtrlExpDaiea.ProgressFileName );

    meErros.Lines.Add('');
    meErros.Lines.Add('');
    meErros.Lines.Add('TÉRMINO DA GERAÇÃO DO ARQUIVO... ');
    frmProgresso.EscondeFormProgresso;

    if not bGrava then begin
      if MsgDlg('Ocorreram erros na geração do arquivo,' +#13#10+
                'Grava o arquivo com erros?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
        bGrava := True;
      end;
    end;

    if bGrava then begin
      cdsTemp := TCMClientDataSet.Create( nil );
      cdsTemp.Data := vArquivo;
      cdsTemp.First;
      while not cdsTemp.Eof do begin
        writeLn(ArqSaida, cdsTemp.FieldByName('LINHA').AsString );
        cdsTemp.Next;
      end;
    end;
  finally
    FreeAndNil( cdsTemp );
    CloseFile( ArqSaida );
    frmProgresso.EscondeFormProgresso;
    CtrlExpDaiea.FreeThreadProgresso;
  end;
end;

procedure TfrmExecExportaDaieaMT.Progresso(vParams: array of variant);
begin
  frmProgresso.AndaFormProgresso(vParams[1], vParams[2]);
  if vParams[3] <> '' then meErros.Lines.Add ( vParams[3] );
end;

procedure TfrmExecExportaDaieaMT.mnuSalvarClick(Sender: TObject);
begin
  inherited;
  DlgSalvar.Execute;
  if DlgSalvar.FileName <> '' then
    meErros.Lines.SaveToFile(DlgSalvar.FileName);
end;

procedure TfrmExecExportaDaieaMT.mnuImprimirClick(Sender: TObject);
begin
  inherited;
  meErros.Print('');
end;

end.
