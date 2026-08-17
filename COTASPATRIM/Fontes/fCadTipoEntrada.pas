{ --------------------------------------------------------------------------------------------------
Rotina    : Tela de Cadastro de Tipo de Entrada
Data      : 18/08/2006
Autor     : Marcus Santos Oliveira
Pendencia : Falta Cadastrar Pendencia
Descrição : Criar a tela de Cadastro de Ativo de Entrada.
---------------------------------------------------------------------------------------------------}

unit fCadTipoEntrada;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMT, MontaSelect, Db, DBClient, uCMClientDataSet, uCtrlPadroes,
  StdCtrls, ExtCtrls, DBCtrls, Mask, uCmSqlParams, CmEventosCadastro,
  ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, uMensErro, Wwdbgrid,
  uCtrlCadTipoEntrada, uDbCptpentrada, uCMTypes;

type
  TfrmCadTipoEntrada = class(TFrmCadastroGridMT)
    Label1: TLabel;
    Label2: TLabel;
    dbNome: TDBEdit;
    dbmemDescricao: TDBMemo;
    dbgrdEntSai: TDBRadioGroup;
    dbNomeParaRegra: TDBEdit;
    Label3: TLabel;
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure dbGrdDblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
  private
    CtrlCadTipoEntrada: TCtrlCadTipoEntrada;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTipoEntrada: TfrmCadTipoEntrada;

implementation

{$R *.DFM}

procedure TfrmCadTipoEntrada.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept :=  CtrlCadTipoEntrada.GravaDadosEntrada;
  if Not Accept then
    MsgDlg(CtrlCadTipoEntrada.MessageInfo, 'Atenção', mtError, [MbOk], 0);
  Cds.data:= CtrlCadTipoEntrada.CarregaEntrada;
end;

procedure TfrmCadTipoEntrada.FormCreate(Sender: TObject);
begin
  inherited;
  //Cria a classe e carrega o CDS
  CtrlCadTipoEntrada:=TCtrlCadTipoEntrada.Create;
  CtrlCadTipoEntrada.InitializeAs(padroes);
  CtrlCadTipoEntrada._Cds:=Cds;
  Cds.data:= CtrlCadTipoEntrada.CarregaEntrada;
    
  //Atualiza Botoes o Idle carrega quando está vazio.
  CmeCadastro.Operacao := opIdle;
  CmeCadastro.AtualizaBotoes(Self);
end;

procedure TfrmCadTipoEntrada.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  Cds.data := CtrlCadTipoEntrada.CarregaEntrada;
end;

procedure TfrmCadTipoEntrada.dbGrdDblClick(Sender: TObject);
begin
  if not Cds.IsEmpty then sbtnAlterarClick( Self );
end;

procedure TfrmCadTipoEntrada.FormDestroy(Sender: TObject);
begin
  inherited;
  CtrlCadTipoEntrada.Free;
end;

procedure TfrmCadTipoEntrada.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  Cds.FieldByName('TIPOUNIDADE').AsString := 'Q';
end;

procedure TfrmCadTipoEntrada.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := False;

  if dbNome.Text = '' then
  begin
    MsgDlg('O nome deve ser informado.', 'Atenção', mtWarning, [mbOk], 0);
    dbNome.SetFocus;
    exit;
  end;

  if dbNomeParaRegra.Text = '' then
  begin
    MsgDlg('O nome para Regra deve ser informado.', 'Atenção', mtWarning, [mbOk], 0);
    dbNomeParaRegra.SetFocus;
    exit;
  end;

  if not CtrlCadTipoEntrada.VerificaNome( Cds.FieldByName('IDCPTPENTRADA').AsInteger, dbNome.Text ) then
  begin
    MsgDlg('Nome já cadastrado', 'Atenção', mtError, [MbOk], 0);
    dbNome.SetFocus;
    exit;
  end;

  Accept := True;
end;

end.
