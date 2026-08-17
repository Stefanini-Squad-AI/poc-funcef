unit FPRelHisFuncionalMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MontaSelect, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery,
  wwdbdatetimepicker, CMDateTimePicker, DBClient, uCMClientDataSet,
  fParamReports_Padrao, CmParamReport, UDiasUteis, 
  uCtrlTempoServico, uSistema, DbaseDados;

type
  TfrmPRelHisFuncionalMT = class(TfrmParamReports_Padrao)
    msElegivel: TMontaSelect;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edMatricula: TEdit;
    Label2: TLabel;
    btnProcurar: TBitBtn;
    edNome: TEdit;
    GroupBox2: TGroupBox;
    ckbContaTempo: TCheckBox;
    Label3: TLabel;
    dtReferencia: TCMDateTimePicker;
    dbDataTempo: TCMDateTimePicker;
    CdsAux: TCMClientDataSet;
    procedure btnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure ckbContaTempoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    CtrlTempoServicoLocal : TCtrlTempoServico;
    procedure MsgErro(sMsg: String);
  public
    { Public declarations }
  end;

var
  frmPRelHisFuncionalMT: TfrmPRelHisFuncionalMT;
  IdPessoa : Integer;
  sTempoTotal, sTempoSemConversao : String;
implementation

Uses UMensErro, dRelTempoServicoMT;

{$R *.DFM}

procedure TfrmPRelHisFuncionalMT.btnProcurarClick(Sender: TObject);
begin
  inherited;
  IdPessoa         := 0;
  edMatricula.Text := '';
  edNome.Text  := StringOfChar(' ',80);
  msElegivel.Executar;
  if (msElegivel.RetornouValor) then
  Begin
    IdPessoa              := StrtoIntDef(msElegivel.ValoresChave[0], -1);
    edMatricula.Text      := msElegivel.ValoresChave[1];
    edNome.Text           := msElegivel.ValoresChave[2];
    ckbContaTempo.Visible := (msElegivel.ValoresChave[3] = 'MA');
  end;

end;

procedure TfrmPRelHisFuncionalMT.bbtnConfirmarClick(Sender: TObject);
Var
 iSeq, iTotal : Integer;
 iTempoSimples : LongInt;
begin
  inherited;
  try
    iSeq := 0;
    if (edMatricula.Text = '') Then
    Begin
      MsgDlg('Escolha uma Matrícula','Erro',mtError,[mbOk,mbHelp],0);
      edMatricula.SetFocus;
      ModalResult := mrNone;
      exit;
    end;
     CdsAux.Close;
     CdsAux.Data := CtrlTempoServicoLocal.BuscaMatricula(edMatricula.Text);

    if cdsAux.IsEmpty Then
    Begin
       MsgDlg('Matrícula não encontrada','Erro',mtError,[mbOk,mbHelp],0);
       edMatricula.SetFocus;
       ModalResult := mrNone;
       exit;
    end;

    if cdsAux.RecordCount > 1 Then
    Begin
       MsgDlg('Mais de uma Matrícula encontrada','Erro',mtError,[mbOk,mbHelp],0);
       edMatricula.SetFocus;
       ModalResult := mrNone;
       exit;
    end;

    IdPessoa     := CdsAux.FieldByName('IDPESSOA').AsInteger;
    edNome.Text  := CdsAux.FieldByName('NOME').AsString;
//    end;

     try
       // passar os parametros do relatorio*****
      cmp_padrao.ParamByName('IDPESSOA').Value        := CdsAux.FieldByName('IDPESSOA').AsInteger;
      cmp_padrao.ParamByName('SDATAREF').AsString     := dtReferencia.Text;
      cmp_padrao.ParamByName('SNOME').AsString        := CdsAux.FieldByName('NOME').AsString;
      cmp_padrao.ParamByName('SDATATEMPO').AsString   := dbDataTempo.Text;
      cmp_padrao.ParamByName('BCONTATEMPO').AsBoolean := ckbContaTempo.Checked;
    except showMessage('Parâmetros do Relatório Inválidos!'); end;

  Finally
    ModalResult := mrOk;
  end
end;

procedure TfrmPRelHisFuncionalMT.ckbContaTempoClick(Sender: TObject);
begin
  inherited;
  If ckbContaTempo.Checked Then
    Begin
     ckbContaTempo.Caption := 'Conta Tempo de Manutenção até';
     dbDataTempo.Visible   := True;
    End
   Else
    Begin
     ckbContaTempo.Caption:='Conta Tempo de Manutenção';
     dbDataTempo.Visible   := False;
    End;

end;

procedure TfrmPRelHisFuncionalMT.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  // Voltar tempo de servico para hoje
//  CtrlTempoServicoLocal.ProcessaHistContrib(IdPessoa, DateToStr(date));
  CtrlTempoServicoLocal.Free;
  inherited;
end;

procedure TfrmPRelHisFuncionalMT.FormCreate(Sender: TObject);
begin
  inherited;
  edMatricula.Text := '';
  IdPessoa         := 0;
  edNome.Text      := StringOfChar(' ',80);

  CtrlTempoServicoLocal := TCtrlTempoServico.Create;
  CtrlTempoServicoLocal.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                              Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro);

end;

procedure TfrmPRelHisFuncionalMT.MsgErro(sMsg: String);
begin
  ShowMessage( sMsg );
end;



procedure TfrmPRelHisFuncionalMT.FormShow(Sender: TObject);
begin
  inherited;
  dtReferencia.Text := DateToStr(date);
  dbDataTempo.Visible := False;
end;

end.
