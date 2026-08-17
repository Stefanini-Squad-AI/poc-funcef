{         
Rotina..........: Formulário Novo
N. Sol..........: 90184
N. Kintana......: 492704
Data............: 21/01/2010
Responsável.....: Marilza Colpani
Descrição.......: Implementação na folha de pagamento,
              para que em caso de alteração do gestor da unidade,alterar também
              os cadastros dos empregados subordinados a este gestor.
}

unit fTransfSub;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, CmEventosCadastro,
  MontaSelect, Db, Wwdatsrc, DBClient, uCMClientDataSet, uCtrlPessoaFuncionario;

type
  TfrmTransfSub = class(TfrmOkCancelar)
    edtSubordinado: TEdit;
    Label1: TLabel;
    plnTransf: TPanel;
    btnAdiciona: TSpeedButton;
    BtnRemove: TSpeedButton;
    BtnAdicionaTudo: TSpeedButton;
    btnRemoveTudo: TSpeedButton;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridCSub: TwwDBGrid;
    DBGridSel: TwwDBGrid;
    Label2: TLabel;
    edtTransferencia: TEdit;
    btBuscGrupo: TSpeedButton;
    SpeedButton1: TSpeedButton;
    CmeCadastro: TCmEventosCadastro;
    MontaSelect: TMontaSelect;
    CdsTransferir: TCMClientDataSet;
    dsSubordinados: TwwDataSource;
    dsTransferir: TwwDataSource;
    CdsSubordinados: TCMClientDataSet;
    MSBuscaSub: TMontaSelect;
    MSSub: TMontaSelect;
    ds: TDataSource;
    Cds: TCMClientDataSet;
    procedure SpeedButton1Click(Sender: TObject);
    procedure btBuscGrupoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnAdicionaTudoClick(Sender: TObject);
    procedure btnAdicionaClick(Sender: TObject);
    procedure BtnRemoveClick(Sender: TObject);
    procedure btnRemoveTudoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridSelDblClick(Sender: TObject);
    procedure DBGridCSubDblClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
    //Marilza Colpani - SOL 90184/KTN 492704 - Início
    CtrlPessoaFuncionario : TCtrlPessoaFuncionario;
    procedure InsereUsusario;
    procedure ExcluiUsusario;
    procedure MontaQuery (iIdPessoa: integer);
    //Marilza Colpani - SOL 90184/KTN 492704 - Fim
  public
    { Public declarations }
  end;

var
  frmTransfSub: TfrmTransfSub;

implementation

{$R *.DFM}

uses dBaseDados, uSistema, uMensErro, uCtrlUsoGeralRH;

procedure TfrmTransfSub.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  //Marilza Colpani - SOL 90184/KTN 492704 - Início
  CdsTransferir.EmptyDataSet;
  edtTransferencia.Text := '';
  MSBuscaSub.Executar;
  if MSBuscaSub.RetornouValor then
  begin
    edtSubordinado.Text := MSBuscaSub.ValoresChave[1];
    CdsSubordinados.Data := CtrlPessoaFuncionario.ListSubordinados(StrToFloat(MSBuscaSub.ValoresChave[0]));
  end;
  //Marilza Colpani - SOL 90184/KTN 492704 - Fim
  
end;

procedure TfrmTransfSub.btBuscGrupoClick(Sender: TObject);
begin  
  inherited;
  //Marilza Colpani - SOL 90184/KTN 492704 - Início
  MSSub.Executar;
  if MSSub.RetornouValor then
  begin
    edtTransferencia.Text := MSSub.ValoresChave[1];
    Cds.Data := CtrlPessoaFuncionario.ListFuncionario(MSSub.ValoresChave[0]);
  end;
  //Marilza Colpani - SOL 90184/KTN 492704 - Fim
end;

procedure TfrmTransfSub.FormShow(Sender: TObject);
begin
  inherited;
  //Marilza Colpani - SOL 90184/KTN 492704 - Início
  MontaSelect.Executar;
  if (MontaSelect.RetornouValor) then
  begin
    edtSubordinado.Text := MontaSelect.ValoresChave[1];
    CdsSubordinados.Data := CtrlPessoaFuncionario.ListSubordinados(StrToFloat(MontaSelect.ValoresChave[0]));
    if CdsSubordinados.IsEmpty then
      MsgDlg( 'Não existem pessoas subordinadas a pessoa selecionada na busca', 'Atenção', mtWarning, [ mbOk ], 0 );
  end
  else
    Close;
  //Marilza Colpani - SOL 90184/KTN 492704 - Fim   
end;

procedure TfrmTransfSub.BtnAdicionaTudoClick(Sender: TObject);
//Var
  //Posicao : Integer;
begin
  inherited;
  //Marilza Colpani - SOL 90184/KTN 492704 - Início
  if  CdsTransferir.State = dsBrowse then
  begin
    CdsTransferir.DisableControls;
    CdsSubordinados.DisableControls;
    CdsSubordinados.First;
    while not CdsSubordinados.Eof do begin
      InsereUsusario;
      CdsSubordinados.Delete;
    end;
    CdsSubordinados.First;
    CdsTransferir.First;
    CdsTransferir.EnableControls;
    CdsSubordinados.EnableControls;
  end;
  //Marilza Colpani - SOL 90184/KTN 492704 - Fim
end;

procedure TfrmTransfSub.InsereUsusario;
begin
  //Marilza Colpani - SOL 90184/KTN 492704 - Início
  CdsTransferir.Append;
  CdsTransferir.FieldByName('IDPESSOA').asinteger         := CdsSubordinados.FieldByName('IDPESSOA').asinteger;// MontaSelect.ValoresChave[0];
  CdsTransferir.FieldByName('NOMEUSUARIO').AsString     := CdsSubordinados.FieldByName('NOMEUSUARIO').AsString;
  CdsTransferir.FieldByName('NOME').AsString            := CdsSubordinados.FieldByName('NOME').AsString;

  CdsTransferir.Post;
  if DBGridSel.CanFocus then
     DBGridSel.SetFocus
 //Marilza Colpani - SOL 90184/KTN 492704 - Fim
end;

procedure TfrmTransfSub.btnAdicionaClick(Sender: TObject);
begin
  inherited;
  //Marilza Colpani - SOL 90184/KTN 492704 - Início
  if not CdsSubordinados.IsEmpty then
  begin
    if DBGridCSub.SelectedList.Count = 1 then begin
      InsereUsusario;
      CdsSubordinados.Delete;
    end else if DBGridCSub.SelectedList.Count > 1 then begin
      CdsTransferir.DisableControls;
      CdsSubordinados.DisableControls;
      CdsSubordinados.First;
      while not CdsSubordinados.Eof do begin
        if DBGridCSub.IsSelectedRecord then begin
          InsereUsusario;
        end;
        CdsSubordinados.Next;
      end;

      // excluir os usuários da grid, se não for de traz pra frente perde o bookmark
      CdsSubordinados.Last;
      while not CdsSubordinados.Bof do begin
        if DBGridCSub.IsSelectedRecord then
          CdsSubordinados.Delete;
        CdsSubordinados.Prior;
      end;
      CdsTransferir.First;
      CdsSubordinados.First;
      DBGridCSub.UnselectAll;
      DbGridSel.UnselectAll;

      CdsTransferir.EnableControls;
      CdsSubordinados.EnableControls;
    end;
  end;
  //Marilza Colpani - SOL 90184/KTN 492704 - Fim
end;

procedure TfrmTransfSub.BtnRemoveClick(Sender: TObject);
begin
  inherited;
  //Marilza Colpani - SOL 90184/KTN 492704 - Início
  if not CdsTransferir.IsEmpty then
  begin
    if DbGridSel.SelectedList.Count = 1 then begin
      ExcluiUsusario;
      CdsTransferir.Delete;
    end else if DbGridSel.SelectedList.Count > 1 then begin
      CdsTransferir.DisableControls;
      CdsSubordinados.DisableControls;
      CdsTransferir.First;
      while not CdsTransferir.Eof do begin
        if DbGridSel.IsSelectedRecord then
          ExcluiUsusario;
        CdsTransferir.Next;
      end;

      // excluir os usuários da grid, se não for de traz pra frente perde o bookmark
      CdsTransferir.Last;
      while not CdsTransferir.Bof do begin
        if DbGridSel.IsSelectedRecord then
          CdsTransferir.Delete;
        CdsTransferir.Prior;
      end;
      CdsTransferir.First;
      CdsSubordinados.First;

      DBGridCSub.UnselectAll;
      DbGridSel.UnselectAll;
      CdsTransferir.EnableControls;
      CdsSubordinados.EnableControls;
    end;
  end;
  //Marilza Colpani - SOL 90184/KTN 492704 - Fim
end;

procedure TfrmTransfSub.btnRemoveTudoClick(Sender: TObject);
begin
  inherited;
  //Marilza Colpani - SOL 90184/KTN 492704 - Início
  begin
    CdsTransferir.DisableControls;
    CdsSubordinados.DisableControls;
    CdsTransferir.First;
    while not CdsTransferir.Eof do begin
        ExcluiUsusario;
        CdsTransferir.Delete;
    end;
    CdsSubordinados.First;
    CdsTransferir.First;
    CdsTransferir.EnableControls;
    CdsSubordinados.EnableControls;
  end;
  //Marilza Colpani - SOL 90184/KTN 492704 - Fim
end;

procedure TfrmTransfSub.FormCreate(Sender: TObject);
begin
  inherited;
  //Marilza Colpani - SOL 90184/KTN 492704 - Início
  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.Initialize(dtmBaseDados.dbBaseDados,True);

  CdsSubordinados.Data := CtrlPessoaFuncionario.ListSubordinados(-1); //Vazio
  CdsTransferir.Data := CtrlPessoaFuncionario.ListNotInSubordinados(-1); //Vazio
  //Marilza Colpani - SOL 90184/KTN 492704 - Fim
end;

procedure TfrmTransfSub.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  //Marilza Colpani - SOL 90184/KTN 492704
  CtrlPessoaFuncionario.Free;
end;

procedure TfrmTransfSub.ExcluiUsusario;
begin
  //Marilza Colpani - SOL 90184/KTN 492704 - Início
  // insere o usuário na grid usuário disponíveis
  CdsSubordinados.Insert;
  CdsSubordinados.FieldByName('NOMEUSUARIO').AsString     := CdsTransferir.FieldByName('NOMEUSUARIO').AsString;
  CdsSubordinados.FieldByName('NOME').AsString            := CdsTransferir.FieldByName('NOME').AsString;

  CdsSubordinados.Post;
  if DBGridCSub.CanFocus then
     DBGridCSub.SetFocus;
  //Marilza Colpani - SOL 90184/KTN 492704 - Fim
end;

procedure TfrmTransfSub.DBGridSelDblClick(Sender: TObject);
begin
  inherited;
  //Marilza Colpani - SOL 90184/KTN 492704
  BtnRemove.Click;
end;

procedure TfrmTransfSub.DBGridCSubDblClick(Sender: TObject);
begin
  inherited;
  //Marilza Colpani - SOL 90184/KTN 492704
  btnAdiciona.Click;
end;

procedure TfrmTransfSub.bbtnConfirmarClick(Sender: TObject);
begin
  //Marilza Colpani - SOL 90184/KTN 492704 - Início
  CmeCadastro.RepetirInsert := False;

  if CdsTransferir.IsEmpty then
  begin
    MsgDlg('É necessário selecionar pelo menos um Empregado a Transferir',
      'Erro', mtError, [mbOk], 0);
    Exit;
  end;

  if (edtTransferencia.Text = '') then
  begin
    MsgDlg('É necessário informar um empregado no campo Transferir Subordinação a',
          'Erro', mtError, [mbOk], 0);
    Exit;
  end;

  CdsTransferir.First;
  while not (CdsTransferir.Eof) do
  begin
    if CdsTransferir.FieldByName('NOME').AsString = edtTransferencia.Text then
    begin
      MsgDlg('O empregado selecionado não pode ser subordinado a ele mesmo. ',
          'Erro', mtConfirmation, [mbOk], 0);
      Exit;
    end;
    CdsTransferir.Next;       
  end;

  CtrlPessoaFuncionario.GravarNovoChefeFunc(CdsTransferir, StrToInt(MSSub.ValoresChave[0]));

  MsgDlg('Transferência realizada com sucesso. ', 'Confirmação', mtInformation, [mbOk], 0);

  inherited;
  //Marilza Colpani - SOL 90184/KTN 492704 - Fim
end;

procedure TfrmTransfSub.MontaQuery(iIdPessoa: integer);
begin
  //Marilza Colpani - SOL 90184/KTN 492704 - Início
  CdsSubordinados.Data := CtrlPessoaFuncionario.ListSubordinados(iIdPessoa); //Vazio
  CdsTransferir.Data := CtrlPessoaFuncionario.ListNotInSubordinados(iIdPessoa); //Vazio
  //Marilza Colpani - SOL 90184/KTN 492704 - Fim
end;

procedure TfrmTransfSub.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  //Marilza Colpani - SOL 90184/KTN 492704
  MontaQuery (StrToIntDef(MontaSelect.ValoresChave[0], -1));
end;

procedure TfrmTransfSub.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  //Marilza Colpani - SOL 90184/KTN 492704 - Início
  CdsTransferir.CancelUpdates;  // a edição é feita pelos botões
end;

procedure TfrmTransfSub.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  //Marilza Colpani - SOL 90184/KTN 492704 - Início
  CmeCadastro.RepetirInsert := False;

  If ( Trim(edtSubordinado.Text) = '' ) Then
  Begin
    MsgDlg( 'Não há Nenhum usuário selecionado', 'Atenção', mtWarning, [ mbOk ], 0 );
    bbtnCancelar.Click;
  End
  Else
  Begin
    CdsSubordinados.Cancel;
  End;
  //Marilza Colpani - SOL 90184/KTN 492704 - Fim
end;

end.
