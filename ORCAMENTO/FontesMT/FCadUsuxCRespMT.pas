//Pendência: 24515
//Descrição: Removido os ListBox e substituir por DBGrid
{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Atualizado Em: Julho/2002                             }
{                                                       }
{*******************************************************}

Unit FCadUsuxCRespMT;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, CmEventosCadastro, ImgList,
  FCadastroMT, DBClient, uCMClientDataSet, uCtrlCadUsuxCResp, uCMTypes,
  ComCtrls, DBGrids, uCtrlParamIntegra;

Type
  TFrmCadUsuxCRespMT = Class(TFrmCadastroMT)
    Label1: TLabel;
    EdUsu: TEdit;
    plnTransf: TPanel;
    btnAdiciona: TSpeedButton;
    BtnRemove: TSpeedButton;
    Panel1: TPanel;
    Panel2: TPanel;
    BtnAdicionaTudo: TSpeedButton;
    btnRemoveTudo: TSpeedButton;
    DBGridCRespon: TwwDBGrid;
    dsUsuario: TwwDataSource;
    DBGridSel: TwwDBGrid;
    CdsRespDisp: TCMClientDataSet;
    Procedure FormCreate(Sender: TObject);
    Procedure btnAdicionaClick(Sender: TObject);
    Procedure BtnRemoveClick(Sender: TObject);
    Procedure BtnAdicionaTudoClick(Sender: TObject);
    Procedure btnRemoveTudoClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure AlternaCoresDoGrid(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure DBGridCResponTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure DBGridSelTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure DBGridCResponDblClick(Sender: TObject);
    procedure DBGridSelDblClick(Sender: TObject);
  Private
    { Private declarations }

    CtrlCadUsuxCResp : TCtrlCadUsuxCResp;
    procedure InsereUsusario;
    procedure ExcluiUsusario;
    procedure MontaQuery (iIdUsuario: integer);


  Public
    { Public declarations }

  End;

Var
  FrmCadUsuxCRespMT : TFrmCadUsuxCRespMT;

Implementation

{$R *.DFM}

Uses
  uSistema, uMensErro, dBaseDados;
//************************************************
Procedure TFrmCadUsuxCRespMT.FormCreate(Sender: TObject);
Begin
  Inherited;

  CtrlCadUsuxCResp := TCtrlCadUsuxCResp.Create;
  CtrlCadUsuxCResp.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                               Sistema.ConnectionSide, Sistema.AppRemoteServer, True );

  CtrlCadUsuxCResp.IdEmpresa := Sistema.IdEmpresa;
  CtrlCadUsuxCResp.IidUsuario := Sistema.IdUsuario;
  CtrlCadUsuxCResp.CdsSelecionados := cds;

End;
//************************************************
Procedure TFrmCadUsuxCRespMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
Begin
  FreeAndNil(CtrlCadUsuxCResp);
  Inherited;

End;
//************************************************
Procedure TFrmCadUsuxCRespMT.CmeCadastroFind(Sender: TObject);
Begin
  Inherited;
  if MontaSelect.RetornouValor then
  begin
    EdUsu.Text := MontaSelect.ValoresChave[1];
    MontaQuery (StrToInt(MontaSelect.ValoresChave[0]));
  end;
End;
//************************************************
Procedure TFrmCadUsuxCRespMT.CmeCadastroInsert(Sender: TObject);
Begin
  CmeCadastro.RepetirInsert := False;

  Inherited;
  If ( Trim(EdUsu.Text) = '' ) Then Begin

    MsgDlg( 'Não há Nenhum usuário selecionado', 'Atenção', mtWarning, [ mbOk ], 0 );
    bbtnCancelar.Click;
  End Else Begin

    CdsRespDisp.Cancel;
  End;
End;
//************************************************

Procedure TFrmCadUsuxCRespMT.btnAdicionaClick(Sender: TObject);
Begin
  if DBGridCRespon.SelectedList.Count = 1 then begin
    InsereUsusario;
    CdsRespDisp.Delete;
  end else if DBGridCRespon.SelectedList.Count > 1 then begin
    Cds.DisableControls;
    CdsRespDisp.DisableControls;
    CdsRespDisp.First;
    while not CdsRespDisp.Eof do begin
      if DBGridCRespon.IsSelectedRecord then begin
        InsereUsusario;
      end;
      CdsRespDisp.Next;
    end;

    // excluir os usuários da grid, se não for de traz pra frente perde o bookmark
    CdsRespDisp.Last;
    while not CdsRespDisp.Bof do begin
      if DBGridCRespon.IsSelectedRecord then
        CdsRespDisp.Delete;
      CdsRespDisp.Prior;
    end;
    Cds.First;
    CdsRespDisp.First;
    DBGridCRespon.UnselectAll;
    DbGridSel.UnselectAll;

    Cds.EnableControls;
    CdsRespDisp.EnableControls;
  end;

End;
//************************************************
Procedure TFrmCadUsuxCRespMT.BtnRemoveClick(Sender: TObject);
Begin
  inherited;
  if DbGridSel.SelectedList.Count = 1 then begin
    ExcluiUsusario;
    Cds.Delete;
  end else if DbGridSel.SelectedList.Count > 1 then begin
    Cds.DisableControls;
    CdsRespDisp.DisableControls;
    Cds.First;
    while not Cds.Eof do begin
      if DbGridSel.IsSelectedRecord then
        ExcluiUsusario;
      Cds.Next;
    end;

    // excluir os usuários da grid, se não for de traz pra frente perde o bookmark
    Cds.Last;
    while not Cds.Bof do begin
      if DbGridSel.IsSelectedRecord then
        Cds.Delete;
      Cds.Prior;
    end;
    Cds.First;
    CdsRespDisp.First;

    DBGridCRespon.UnselectAll;
    DbGridSel.UnselectAll;
    Cds.EnableControls;
    CdsRespDisp.EnableControls;
  end;

End;
//************************************************
Procedure TFrmCadUsuxCRespMT.BtnAdicionaTudoClick(Sender: TObject);
Var
  Posicao : Integer;
Begin
  Inherited;
  Cds.DisableControls;
  CdsRespDisp.DisableControls;
  CdsRespDisp.First;
  while not CdsRespDisp.Eof do begin
    InsereUsusario;
    CdsRespDisp.Delete;
  end;
  CdsRespDisp.First;
  Cds.First;
  Cds.EnableControls;
  CdsRespDisp.EnableControls;

End;
//************************************************
Procedure TFrmCadUsuxCRespMT.btnRemoveTudoClick(Sender: TObject);
Var
  Posicao : Integer;
Begin
  inherited;
  Cds.DisableControls;
  CdsRespDisp.DisableControls;
  Cds.First;
  while not Cds.Eof do begin
    ExcluiUsusario;
    Cds.Delete;
  end;
  CdsRespDisp.First;
  Cds.First;
  Cds.EnableControls;
  CdsRespDisp.EnableControls;

End;
//************************************************
Procedure TFrmCadUsuxCRespMT.AlternaCoresDoGrid(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
Begin
  Inherited;

  //Faz com que as linhas do grid tenham cores alternadas
  AFont.Color  := $00C0FFFF; //Amarelo Bebê

  If ( State <> [gdSelected] ) Then Begin

    If ( Not Highlight ) Then Begin

      If ( ( ( Sender as TwwDBGrid ).CalcCellRow mod 2 ) = 0 ) Then Begin

        ABrush.color := clwhite;
        AFont.Color  := clBlack;
      End Else Begin

        ABrush.Color := $00C0FFFF; //Amarelo Bebê
        AFont.Color  := clBlack;
      End;
    End;
  End Else Begin

    ABrush.Color := clHighLight;
  End;
End;
//************************************************
Procedure TFrmCadUsuxCRespMT.CmeCadastroCancel(Sender: TObject);
Begin
  Inherited;
  MontaQuery (StrToIntDef(MontaSelect.ValoresChave[0],-1));
End;

//************************************************

Procedure TFrmCadUsuxCRespMT.bbtnConfirmarClick(Sender: TObject);
Begin
  CmeCadastro.RepetirInsert := false;
  inherited;

End;

//************************************************

procedure TFrmCadUsuxCRespMT.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  sbtnAlterarClick(sender);
end;

procedure TFrmCadUsuxCRespMT.ExcluiUsusario;
begin
  // insere o usuário na grid usuário disponíveis
  CdsRespDisp.Insert;
  CdsRespDisp.FieldByName('NOME').AsString            := Cds.FieldByName('NOME').AsString;
  CdsRespDisp.FieldByName('CODCENTRORESPON').AsString := Cds.FieldByName('CODCENTRORESPON').AsString;
  CdsRespDisp.FieldByName('CODEXTERNO').AsString      := Cds.FieldByName('CODEXTERNO').AsString;
  CdsRespDisp.Post;
  if DBGridCRespon.CanFocus then
     DBGridCRespon.SetFocus;  
end;

procedure TFrmCadUsuxCRespMT.InsereUsusario;
begin
  Cds.Append;
  Cds.FieldByName('IDPESSOAACESSO').AsString  := MontaSelect.ValoresChave[0];
  Cds.FieldByName('NOME').AsString            := CdsRespDisp.FieldByName('NOME').AsString;
  Cds.FieldByName('IDPESSOA').AsInteger       := Sistema.IdEmpresa;
  Cds.FieldByName('CODCENTRORESPON').AsString := CdsRespDisp.FieldByName('CODCENTRORESPON').AsString;
  Cds.FieldByName('CODEXTERNO').AsString      := CdsRespDisp.FieldByName('CODEXTERNO').AsString;
  Cds.Post;
  if DBGridSel.CanFocus then
     DBGridSel.SetFocus
end;




procedure TFrmCadUsuxCRespMT.MontaQuery(iIdUsuario: integer);
begin
  CdsRespDisp.Data := CtrlCadUsuxCResp.ProcuraDisponiveis(iIdUsuario,Sistema.IdEmpresa);
  Cds.Data         := CtrlCadUsuxCResp.ProcuraSelecionados(iIdUsuario,Sistema.IdEmpresa);
end;



procedure TFrmCadUsuxCRespMT.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  MontaQuery (StrToIntDef(MontaSelect.ValoresChave[0],-1));
end;

procedure TFrmCadUsuxCRespMT.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  // força o botão sempre aceso, pois o cds pode estar vazio
  if (EdUsu.Text <> '') and not(sbtnAlterar.Enabled) then
    sbtnAlterar.Enabled := True;

end;

procedure TFrmCadUsuxCRespMT.DBGridCResponTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  CdsRespDisp.IndexFieldNames := AFieldName;
end;

procedure TFrmCadUsuxCRespMT.DBGridSelTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  Cds.IndexFieldNames := AFieldName;
end;

procedure TFrmCadUsuxCRespMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  Cds.CancelUpdates;  // a edição é feita pelos botões
end;

procedure TFrmCadUsuxCRespMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

    Accept := CtrlCadUsuxCResp.AplicaOperacaoPessoaXCresp;

end;

procedure TFrmCadUsuxCRespMT.DBGridCResponDblClick(Sender: TObject);
begin
  inherited;
  btnAdiciona.Click;
end;

procedure TFrmCadUsuxCRespMT.DBGridSelDblClick(Sender: TObject);
begin
  inherited;
   BtnRemove.Click;
end;

End.
