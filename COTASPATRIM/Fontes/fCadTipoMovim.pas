{ --------------------------------------------------------------------------------------------------
Data      : 22/08/2006
Autor     : Marcus Santos Oliveira
Pendencia : 23104
Descrição : Cadastro de Tipo Movimento.
---------------------------------------------------------------------------------------------------}

unit fCadTipoMovim;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, DBCtrls, Mask,
  uCmSqlParams, uCtrlCadTipoMovim, uCtrlPadroes, uCMTypes, uMensErro;

type
  TfrmCadTipoMovim = class(TFrmCadastroGridMT)
    Label1: TLabel;                                           
    Label2: TLabel;
    dbedtOperacao: TDBEdit;
    DBMDescricao: TDBMemo;
    dbgrdEntSai: TDBRadioGroup;
    Label3: TLabel;
    dbedtNomeParaRegra: TDBEdit;
    dbgrdTpMovim: TDBRadioGroup;
    Panel1: TPanel;
    lblDescTipo: TLabel;
    dbgrdUnidade: TDBRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure dbGrdDblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure dbgrdTpMovimClick(Sender: TObject);
    procedure CdsAfterScroll(DataSet: TDataSet);
  private

    CtrlCadTipoMovim : TCtrlCadTipoMovim;

    procedure SelecionouTipoMovim;

  public
    { Public declarations }
  end;

var
  frmCadTipoMovim: TfrmCadTipoMovim;

implementation

{$R *.DFM}

procedure TfrmCadTipoMovim.FormCreate(Sender: TObject);
begin
  inherited;
  //Cria a classe e carrega o CDS
  CtrlCadTipoMovim:=TCtrlCadTipoMovim.Create;
  CtrlCadTipoMovim.InitializeAs(padroes);
  CtrlCadTipoMovim._Cds:=Cds;
  Cds.data:= CtrlCadTipoMovim.CarregaMovim;

  //Atualiza Botoes o Idle carrega quando está vazio.
  CmeCadastro.Operacao := opIdle;
  CmeCadastro.AtualizaBotoes(Self);
end;

procedure TfrmCadTipoMovim.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  Cds.data := CtrlCadTipoMovim.CarregaMovim;
end;

procedure TfrmCadTipoMovim.dbGrdDblClick(Sender: TObject);
begin
  inherited;
  if not Cds.IsEmpty then sbtnAlterarClick( Self );
end;

procedure TfrmCadTipoMovim.FormDestroy(Sender: TObject);
begin
  inherited;
  CtrlCadTipoMovim.Free;
end;

procedure TfrmCadTipoMovim.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  cds.FieldByName('FLGTPMOVIM').AsString  := 'T';
  cds.FieldByName('FLGENTSAI').AsString   := 'E';
  cds.FieldByName('TIPOUNIDADE').AsString := 'Q';
  SelecionouTipoMovim;
end;

procedure TfrmCadTipoMovim.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := False;

  if DBedtOperacao.Text = '' then
  begin
    MsgDlg('O nome deve ser informado.', 'Atenção', mtWarning, [mbOk], 0);
    DBedtOperacao.SetFocus;
    exit;
  end;

  if cds.FieldByName('FLGTPMOVIM').AsString <> 'O' then
  begin
    if trim( cds.FieldByName('FLGENTSAI').AsString ) = '' then
    begin
      MsgDlg('Indique se a movimentação será de entrada ou de saída.', 'Atenção', mtWarning, [mbOk], 0);
      dbgrdEntSai.SetFocus;
      exit;
    end;
  end
  else
  begin
    if not ( cds.State in [dsInsert, dsEdit] ) then
      cds.Edit;
    cds.FieldByName('FLGENTSAI').Clear;
    cds.Post;
  end;

{
  if dbedtNomeParaRegra.Text = '' then
  begin
    MsgDlg('O nome para Regra deve ser informado.', 'Atenção', mtWarning, [mbOk], 0);
    dbedtNomeParaRegra.SetFocus;
    exit;
  end;
}  

  if not CtrlCadTipoMovim.VerificaNome( Cds.FieldByName('IDCPTIPOMOVIM').AsInteger, DBedtOperacao.Text ) then
  begin
    MsgDlg('Nome já cadastrado.', 'Atenção', mtError, [MbOk], 0);
    DBedtOperacao.SetFocus;
    exit;
  end;

  Accept := True;
end;

procedure TfrmCadTipoMovim.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept :=  CtrlCadTipoMovim.GravaDadosMovimenta;
  if Not Accept then
    MsgDlg(CtrlCadTipoMovim.MessageInfo, 'Atenção', mtError, [MbOk], 0);
  Cds.data:= CtrlCadTipoMovim.CarregaMovim;    
end;

procedure TfrmCadTipoMovim.dbgrdTpMovimClick(Sender: TObject);
begin
  inherited;
  SelecionouTipoMovim;
end;

procedure TfrmCadTipoMovim.CdsAfterScroll(DataSet: TDataSet);
begin
  inherited;
  SelecionouTipoMovim;
end;
                                            
procedure TfrmCadTipoMovim.SelecionouTipoMovim;
begin
  dbgrdUnidade.Enabled := ( dbgrdTpMovim.ItemIndex in [0, 3] );

  if dbgrdTpMovim.ItemIndex in [1, 2] then
    if Cds.State in [dsInsert, dsEdit] then
      Cds.FieldByName('TIPOUNIDADE').AsString := 'V';

  dbgrdEntSai.Enabled  := ( dbgrdTpMovim.ItemIndex <> 3 );
  case dbgrdTpMovim.ItemIndex of
    0 : lblDescTipo.Caption := 'Movimenta quantidades de cotas entre contas/fundos.';
    1 : lblDescTipo.Caption := 'Altera a quantidade de cotas através de uma aplicação (compra) ou resgate (venda).';
    2 : lblDescTipo.Caption := 'Altera o valor da cota com base em uma receita ou despesa.';
  else  lblDescTipo.Caption := 'Executa uma operação de ajuste, cálculo ou composição de patrimônio.';
  end;

end;

end.
