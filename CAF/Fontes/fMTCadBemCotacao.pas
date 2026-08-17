unit FMTCadBemCotacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, StdCtrls, Mask, wwdbedit, MontaSelect, Db, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  DBCtrls, wwdbdatetimepicker, CMDateTimePicker, fcLabel, TREdit,
  uCMTypes, uCtrlPadroes, uCtrlBemCotacao, uCtrlBem, IvEMulti;

type
  TfrmMTCadBemCotacao = class(TFrmCadastroMT)
    Label26: TLabel;
    Label22: TLabel;
    dbeDesBem: TDBMemo;
    dbePlaca: TwwDBEdit;
    bbtnSelBem: TBitBtn;
    dsSelBem: TwwDataSource;
    cdsSelBem: TCMClientDataSet;
    fcLabel2: TfcLabel;
    edDataInicioDep: TCMDateTimePicker;
    DBRealEdit1: TDBRealEdit;
    fcLabel1: TfcLabel;
    MSBem: TMontaSelect;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure bbtnSelBemClick(Sender: TObject);
  private
    { Private declarations }
    BemCotacao : TCtrlBemCotacao;
    Bem : TCtrlBem;
    Procedure SelBemCotacao(fEmpresaProp, fBem, fBemCotacao : Extended);
  public
    { Public declarations }
  end;

var
  frmMTCadBemCotacao: TfrmMTCadBemCotacao;

implementation

{$R *.DFM}

Uses uMensErro, uSistema;

procedure TfrmMTCadBemCotacao.FormCreate(Sender: TObject);
begin
   inherited;
   BemCotacao := TCtrlBemCotacao.Create;
   BemCotacao.InitializeAs(Padroes);
   BemCotacao.cds := cds;
   //-------------------------------------------------------------------------------------
   Bem := TCtrlBem.Create;
   Bem.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   SelBemCotacao(-1, -1, -1);
end;

procedure TfrmMTCadBemCotacao.SelBemCotacao(fEmpresaProp, fBem, fBemCotacao : Extended);
begin
   cds.Data := BemCotacao.ListaBemCotacao(fEmpresaProp, fBem, fBemCotacao);
end;

procedure TfrmMTCadBemCotacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   Bem.Free;
   BemCotacao.Free;
end;

procedure TfrmMTCadBemCotacao.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   bbtnSelBem.Enabled := False;
end;

procedure TfrmMTCadBemCotacao.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := BemCotacao.AplicaOperacao;
end;

procedure TfrmMTCadBemCotacao.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := BemCotacao.AplicaOperacao;
end;

procedure TfrmMTCadBemCotacao.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := BemCotacao.AplicaOperacao;
end;

procedure TfrmMTCadBemCotacao.CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
   inherited;
   MsgDlg(BemCotacao.MessageInfo,'Erro',mtError,[mbOK],0);
end;

procedure TfrmMTCadBemCotacao.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      SelBemCotacao(strtofloat(MontaSelect.ValoresChave[0]),
                    strtofloat(MontaSelect.ValoresChave[1]),
                    strtofloat(MontaSelect.ValoresChave[2]));
end;

procedure TfrmMTCadBemCotacao.CmeCadastroAfterConfirma(Sender: TObject);
begin
// inherited;
   bbtnSelBem.Enabled := True;
end;

procedure TfrmMTCadBemCotacao.bbtnSelBemClick(Sender: TObject);
begin
   inherited;
   MSBem.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSBem.RetornouValor then
   begin
      cdsSelBem.Data := Bem.ListaBem(strtofloat(MSBem.ValoresChave[0]),strtofloat(MSBem.ValoresChave[1]));
      cds.FieldByName('IDPESSOA').AsFloat := cdsSelBem.FieldByName('IDPESSOA').AsFloat;
      cds.FieldByName('IDBEM').AsFloat := cdsSelBem.FieldByName('IDBEM').AsFloat;
      cds.FieldByName('PLACA').AsFloat := cdsSelBem.FieldByName('PLACA').AsFloat;
      cds.FieldByName('DESBEM').AsString := cdsSelBem.FieldByName('DESBEM').AsString;
   end;
end;

end.
