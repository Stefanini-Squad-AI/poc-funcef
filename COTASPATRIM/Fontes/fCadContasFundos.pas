unit fCadContasFundos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, Mask, DBCtrls, uCmSqlParams, uCtrlContasFundos, uDbCpConta,
  uCtrlPadroes, uSistema, uMensErro, uCMTypes, wwdblook, CMDBLookupCombo, uCtrlAtivo;

type
  TfrmCadContasFundos = class(TFrmCadastroGridMT)
    Label1: TLabel;
    dbEdtNome: TDBEdit;
    Label3: TLabel;
    cmlkpAtivo: TCMDBLookupCombo;
    CdsAtivo: TCMClientDataSet;
    dbmemDescricao: TDBMemo;
    lblDescricao: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure dbGrdDblClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);

  private
    CtrlContasFundos: TCtrlContasFundos;
    CtrlAtivo: TCtrlAtivo;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadContasFundos: TfrmCadContasFundos;

implementation

{$R *.DFM}

procedure TfrmCadContasFundos.FormCreate(Sender: TObject);
begin
  inherited;
  //Cria a classe e carrega o CDS
  CtrlContasFundos:=TCtrlContasFundos.Create;
  CtrlContasFundos.InitializeAs(padroes);
  CtrlContasFundos.Cds:=Cds;
  cds.data:= CtrlContasFundos.CarregaContasFundos;

  //Carrega Combo Ativo
  CtrlAtivo:=TCtrlAtivo.Create;
  CtrlAtivo.InitializeAs(padroes);
  CdsAtivo.Data:= CtrlAtivo.CarregaAtivo;

  //Atualiza Botoes o Idle carrega quando está vazio.
  CmeCadastro.Operacao := opIdle;
  CmeCadastro.AtualizaBotoes(Self);
end;

procedure TfrmCadContasFundos.FormDestroy(Sender: TObject);
begin
  inherited;
  CtrlContasFundos.Free;
  CtrlAtivo.Free;
end;

procedure TfrmCadContasFundos.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := CtrlContasFundos.GravaDadosConta;
  if Not Accept then
    MsgDlg(CtrlContasFundos.MessageInfo, 'Atenção', mtError, [MbOk], 0);
end;

procedure TfrmCadContasFundos.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  Cds.data:=CtrlContasFundos.CarregaContasFundos;
end;

procedure TfrmCadContasFundos.dbGrdDblClick(Sender: TObject);
begin
  inherited;
  if not Cds.IsEmpty then sbtnAlterarClick( Self );
end;

procedure TfrmCadContasFundos.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
  inherited;

  Accept := False;

  if dbEdtNome.Text = '' then
  begin
    MsgDlg('O nome deve ser informado.', 'Atenção', mtWarning, [mbOk], 0);
    dbEdtNome.SetFocus;
    exit;
  end;

  if cmlkpAtivo.Text = '' then
  begin
    MsgDlg('O ativo deve ser informado.', 'Atenção', mtWarning, [mbOk], 0);
    cmlkpAtivo.SetFocus;
    exit;
  end;             

  if not CtrlContasFundos.VerificaNome( Cds.FieldByName('IDCPCONTA').AsInteger, dbEdtNome.Text ) then
  begin
    MsgDlg('Nome já cadastrado', 'Atenção', mtError, [MbOk], 0);
    dbEdtNome.SetFocus;
    exit;
  end;

  Accept := True;
end;

procedure TfrmCadContasFundos.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  cds.data:= CtrlContasFundos.CarregaContasFundos;
end;

end.
