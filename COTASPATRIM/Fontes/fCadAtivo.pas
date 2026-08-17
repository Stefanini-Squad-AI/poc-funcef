{ --------------------------------------------------------------------------------------------------
Rotina    : Tela de Cadastro de Ativo
Data      : 07/08/2006
Autor     : Marcus Santos Oliveira
Pendencia : 23004
Descrição : Criar a tela de Cadastro do Ativo
---------------------------------------------------------------------------------------------------}
unit fCadAtivo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, wwdblook, Mask, DBCtrls, uCmSqlParams,
  CMDBLookupCombo, uCtrlPatro,  uCtrlPlanPrevContabil, uCtrlPadroes, uSistema,
  uctrlAtivo, uMensErro, uCMTypes, uRegraMT;

type
  TfrmCadAtivo = class(TFrmCadastroGridMT)
    lblDescricao: TLabel;
    lblNome: TLabel;
    dbNome: TDBEdit;
    lblPrevidenciario: TLabel;
    lblPatrocinadora: TLabel;
    lblRCalculo: TLabel;
    dblkcmbPlanoPrevidenciarioContabil: TwwDBLookupCombo;
    dblkcmbPatrocinadora: TwwDBLookupCombo;
    dblkcmbRegraCalculo: TwwDBLookupCombo;
    cdsPrevi: TCMClientDataSet;
    cdsPatro: TCMClientDataSet;
    cdsRegra: TCMClientDataSet;
    dbmemDescricao: TDBMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure dbGrdDblClick(Sender: TObject);
    procedure dbGrdTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);

  protected

  private
    { Private declarations }

    CtrlPatro: TCtrlPatro;
    CtrlPlanPrevContabil: TCtrlPlanPrevContabil;
    CtrlAtivo: TCtrlAtivo;

  public
    { Public declarations }
  end;

var
  frmCadAtivo: TfrmCadAtivo;

implementation

{$R *.DFM}

procedure TfrmCadAtivo.FormCreate(Sender: TObject);
begin
  inherited;
  //Cria a classe e carrega o CDS
  CtrlAtivo:=TCtrlAtivo.Create;
  CtrlAtivo.InitializeAs(padroes);
  CtrlAtivo.Cds:=Cds;

  cds.data:= CtrlAtivo.CarregaAtivo;

  cdsRegra.data:= CtrlAtivo.CarregaRegra;
 
  //Uso do método CtrlPatro.
  CtrlPatro:=TCtrlPatro.Create;
  CtrlPatro.InitializeAs(padroes);
  cdsPatro.data:= CtrlPatro.ListaPatroParaOrcamento;

  //Uso do método do CtrlPlanPrevContabil
  CtrlPlanPrevContabil:= TCtrlPlanPrevContabil.Create;
  CtrlPlanPrevContabil.InitializeAs(padroes);
  cdsPrevi.Data:= CtrlPlanPrevContabil.ListaPlanPrevContabil;

  //Atualiza Botoes o Idle carrega quando está vazio.
  CmeCadastro.Operacao := opIdle;
  CmeCadastro.AtualizaBotoes(Self);
end;


procedure TfrmCadAtivo.FormDestroy(Sender: TObject);
begin
  inherited;
  CtrlPatro.Free;
  CtrlPlanPrevContabil.Free;
  CtrlAtivo.Free;
end;


procedure TfrmCadAtivo.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin        
  inherited;
  if Cds.FieldByName('DTABERT').AsDateTime <= 0 then
  begin
    if not ( Cds.State in [dsInsert, dsEdit] ) then
      Cds.Edit;
    Cds.FieldByName('DTABERT').Clear;
    Cds.FieldByName('VLABERT').Clear;
    Cds.Post;
  end;
  Accept := CtrlAtivo.GravaDados;
  if Not Accept then
    MsgDlg( CtrlAtivo.MessageInfo, 'Atenção', mtError, [MbOk], 0 );
  Cds.data := CtrlAtivo.CarregaAtivo;
end;


procedure TfrmCadAtivo.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  Cds.data := CtrlAtivo.CarregaAtivo;
end;


procedure TfrmCadAtivo.dbGrdDblClick(Sender: TObject);
begin
  if not Cds.IsEmpty then sbtnAlterarClick( Self );
end;


procedure TfrmCadAtivo.dbGrdTitleButtonClick(Sender: TObject; AFieldName: String);
begin
  inherited;
  Cds.IndexFieldNames := AFieldName;
end;


procedure TfrmCadAtivo.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := False;

  if dbNome.Text = '' then
  begin
    MsgDlg('O nome deve ser informado.', 'Atenção', mtWarning, [mbOk], 0);
    dbNome.SetFocus;
    exit;
  end;

  if ( dblkcmbPlanoPrevidenciarioContabil.Text = '' ) and ( dblkcmbPatrocinadora.Text = '' ) then
  begin
    MsgDlg('O plano previdenciário contábil e/ou a patrocinadora deve(m) ser informado(s).', 'Atenção', mtWarning, [mbOk], 0);
    dblkcmbPlanoPrevidenciarioContabil.SetFocus;
    exit;
  end;

  //Critica Plano e Patrocinadora já inseridos.
  if not CtrlAtivo.VerificaNome( Cds.FieldByName('IDCPATIVO').AsInteger, dblkcmbPlanoPrevidenciarioContabil.LookupValue, dblkcmbPatrocinadora.LookupValue ) then
  begin
    if ( dblkcmbPlanoPrevidenciarioContabil.Text <> '' ) and ( dblkcmbPatrocinadora.Text <> '' ) then
      MsgDlg( 'O plano previdenciário contábil e a patrocinadora já foram cadastrados.', 'Atenção', mtError, [MbOk], 0 )
    else
      if ( dblkcmbPlanoPrevidenciarioContabil.Text = '' ) and ( dblkcmbPatrocinadora.Text <> '' ) then
        MsgDlg('Patrocinadora já cadastrada.', 'Atenção', mtError, [MbOk], 0 )
      else
        if ( dblkcmbPlanoPrevidenciarioContabil.Text <> '' ) and ( dblkcmbPatrocinadora.Text = '' ) then
          MsgDlg('Plano previdenciário contábil já cadastrado.', 'Atenção', mtError, [MbOk], 0 );
    exit; 
  end;

  Accept := True;
end;

end.
