unit FCadEmissorXTitulo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  wwdblook, Mask, wwdbedit, DBCtrls, CmEventosCadastro, ImgList;

type
  TfrmCadEmissorXTitulo = class(TfrmCadMestreDetalheCS)
    qryEmissor: TwwQuery;
    qryDet: TwwQuery;
    DbLkcTipoTitRenFix: TwwDBLookupCombo;
    lblClasse: TLabel;
    dbeNomeTitulo: TwwDBEdit;
    lblNomeTitulo: TLabel;
    updDet: TUpdateSQL;
    qryCODTIPRENFIXA: TStringField;
    qryDESCTIPRENFIXA: TStringField;
    qryFLGAPURAIR: TStringField;
    qryDetIDEMISSORXTITULO: TFloatField;
    qryDetIDEMISSOR: TFloatField;
    qryDetCODTIPRENFIXA: TStringField;
    qryDetMNEMONICO: TStringField;
    qryTipoTitulo: TwwQuery;
    qryEmissorIDEMISSOR: TFloatField;
    qryEmissorSIGLAEMISSOR: TStringField;
    qryIDCLASSETIT: TFloatField;
    qryDetSIGLAEMISSOR: TStringField;
    DbLkcEmissor: TwwDBLookupCombo;
    lblEmissor: TLabel;
    qryTipoTituloCODTIPRENFIXA: TStringField;
    qryAux: TwwQuery;
    qryTipoTituloDESCTIPRENFIXA: TStringField;
    qryDetDESCTIPRENFIXA: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dsDetStateChange(Sender: TObject);
    procedure DbLkcEmissorCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);

    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;var Accept: Boolean);
    //function  BeforeConfirma(sender,True)Det: Boolean ;
  private
  { Private declarations }

  procedure ControlaBTNDet ;



  public
    { Public declarations }
  end;

var
  frmCadEmissorXTitulo: TfrmCadEmissorXTitulo;

implementation

{$R *.DFM}

Uses UBibliotecaInvest, UDataBase, USistema, UMensErro, DBaseDados;

procedure TfrmCadEmissorXTitulo.FormShow(Sender: TObject);
begin
  inherited;
  sbtnInserir.Visible   := False;
  sbtnAlterar.Visible   := False;
  sbtnApagar.Visible    := False;
  bbtnConfirmar.Visible := False;
  bbtnCancelar.Visible  := False;

// Abre Tabelas
  qryEmissor.Open;
  qryTipoTitulo.Open;
  QryDet.Close;
  QryDet.ParamByName('IDEMISSOR').AsInteger := -1;
  QryDet.Open;

  pnlControlesDet.SendToBack;
  PnlMestre.Enabled     := True;
  DbLkcEmissor.Enabled  := True;
end;

procedure TfrmCadEmissorXTitulo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryEmissor.Close;
  qryTipoTitulo.Close;
  qryDet.Close;
end;

procedure  TfrmCadEmissorXTitulo.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then begin
     with qryDet do begin
        if Active then Close;
        if not Prepared then Prepare;
        ParamByName('IDEMISSOR').AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
        DbLkcEmissor.Value := MontaSelect.ValoresChave[0];
        Open;
     end;
  end;
end;

{function  TfrmCadEmissorXTitulo.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean)Det:Boolean;
begin
   Result := True;
    if Trim(dbeNomeTitulo.Text) = '' then begin
       MsgDlg('Título não Informado.','Erro',MtError,[mbOk],0);
       dbeNomeTitulo.SetFocus;
       Result := False;
    end;
end;}


procedure TfrmCadEmissorXTitulo.CmeDetalheConfirma(Sender: TObject);
var
  Accept : boolean;
begin
  Accept := True;
  CmeCadastroBeforeConfirma(sender,Accept);
end;

procedure TfrmCadEmissorXTitulo.bbtnOkDetClick(Sender: TObject);
Var s : string;
begin
   if Trim(dbeNomeTitulo.Text) = '' then begin
     //mensagem
     Exit;
   end;

   if qryDet.State in [DsInsert] then begin
      qryAux.Close;
      qryAux.ParamByName('pEMISSOR').Value := qryEmissor.FieldByName('IDEMISSOR').AsInteger;
      qryAux.ParamByName('pTIPRENFIXA').Value := qryTipoTitulo.FieldByName('CODTIPRENFIXA').AsString;
      qryAux.Open;
      if qryAux.RecordCount > 0 then begin
         MsgDlg('A aplicação ' + qryTipoTitulo.FieldByName('CODTIPRENFIXA').AsString +
                ' já foi cadastrada para o emissor ' + qryEmissor.FieldByName('SIGLAEMISSOR').AsString,'Mensagem do Sistema',
                MtWarning,[MbOk],0);
         DbLkcTipoTitRenFix.SetFocus;       
         exit;
      end;
      qryDet.FieldByName('IDEMISSORXTITULO').AsFloat:= LeUltRegistro(nil,'EMISSORXTITULO');
      qryDet.FieldByName('IDEMISSOR').AsInteger := qryEmissor.FieldByName('IDEMISSOR').AsInteger;
   end;


  Try
  // Heranca
  // Inherited;

    qryDet.Post;
    qryDet.ApplyUpdates;
    qryDet.CommitUpdates;
    dtmBaseDados.dbBaseDados.Commit;
  Except
    Raise;
    dtmBaseDados.dbBaseDados.Rollback;
    bbtnVoltarDet.Click;
  end;

  qryDet.Close;
  qryDet.Open;

  ControlaBTNDet;

  SbtnProcurar.Enabled := True;
  pnlControlesDet.SendToBack;

  tb97Detalhe.Visible := false;
End;

procedure TfrmCadEmissorXTitulo.sbtnInsDetClick(Sender: TObject);
begin
//   inherited;
   SbtnProcurar.Enabled  := False;
   sbtnAltDet.Enabled    := False;
   sbtnExcluiDet.Enabled := False;

   dbgrdDet.SendToBack;
   tb97Detalhe.Visible := true;
   DbLkcTipoTitRenFix.SetFocus;

   if not DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.StartTransaction;

   QryDet.Append;

end;

procedure TfrmCadEmissorXTitulo.sbtnAltDetClick(Sender: TObject);
begin
// Caso Tabela Vazia

  If qryDet.IsEmpty Then Begin
    sbtnAltDet.Down := False;
    Exit;
  End;

  sbtnExcluiDet.Enabled := False;
  sbtnInsDet.Enabled    := False;
  SbtnProcurar.Enabled  := False;

//  Inherited;
  if not DtmBaseDados.dbBaseDados.InTransaction Then
     DtmBaseDados.dbBaseDados.StartTransaction;

  QryDet.Edit;

 // Desabilita Combo
//  DbLkcEmissor.Enabled := False;
  dbgrdDet.SendToBack;
  tb97Detalhe.Visible := true;

end;

procedure TfrmCadEmissorXTitulo.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then begin
    qryEmissor.Locate('IDEMISSOR', MontaSelect.ValoresChave[0], [loPartialKey]);
    DbLkcEmissor.Text := qryEmissor.FieldByName('SIGLAEMISSOR').AsString;
    qryDet.Close;
    qryDet.ParamByName('IDEMISSOR').AsInteger := qryEmissor.FieldByName('IDEMISSOR').AsInteger;
    qryDet.Open;

    ControlaBTNDet;
  end;

  PnlMestre.Enabled := True;

end;

procedure TfrmCadEmissorXTitulo.sbtnExcluiDetClick(Sender: TObject);
begin
// Caso Tabela Vazia
  if QryDet.IsEmpty then begin
    sbtnAltDet.Down := False;
    Exit;
  end;

// Pede Confirmacao
  if (MsgDlg('Deseja realmente excluir este registro ?',
             'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrNo) then begin
    sbtnExcluiDet.Down := False;
    Exit;
  end;

  try
//    Inherited;
    if not DtmBaseDados.dbBaseDados.InTransaction Then
       DtmBaseDados.dbBaseDados.StartTransaction;

    QryDet.Delete;
    QryDet.ApplyUpdates;
    QryDet.CommitUpdates;

    DtmBaseDados.dbBaseDados.Commit;

  except
    DtmBaseDados.dbBaseDados.Rollback;
    raise;
  end;

  QryDet.Close;
  QryDet.Open;

  sbtnExcluiDet.Down      := False;

  ControlaBTNDet;

// Desabilita Combo
//  DbLkcEmissor.Enabled := True;
  sbtnProcurar.Enabled := True;

end;


procedure TfrmCadEmissorXTitulo.bbtnVoltarDetClick(Sender: TObject);
begin
// Desabilita Botoes Principal
  SbtnProcurar.Enabled := True;

// Habilita Combos
  DbLkcEmissor.Enabled := True;
  PnlMestre.Enabled    := True;

  pnlControlesDet.SendToBack;

  qryDet.Cancel;
  qryDet.Close;
  qryDet.Open;

  ControlaBTNDet;
  tb97Detalhe.Visible := false;
end;

procedure TfrmCadEmissorXTitulo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = VK_Return Then      //Enter - Troca de Campo
     SelectNext(ActiveControl,True,True)
end;

procedure TfrmCadEmissorXTitulo.ControlaBTNDet;
begin

  sbtnInsDet.Enabled      := True;
  if qryDet.EOF then begin
     sbtnAltDet.Enabled    := False;
     sbtnExcluiDet.Enabled := False;
     sbtnInsDet.Down       := False;
     end
  else begin
     sbtnAltDet.Enabled    := True;
     sbtnExcluiDet.Enabled := True;
     sbtnInsDet.Down       := True;
     sbtnInsDet.Down       := False;
     sbtnAltDet.Down       := False;
     sbtnExcluiDet.Down    := False;
  end;
  sbtnInsDet.Refresh;
  sbtnAltDet.Refresh;
  sbtnExcluiDet.Refresh;

end;


procedure TfrmCadEmissorXTitulo.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if dsDet.State <> dsBrowse then begin
     DbLkcEmissor.Enabled := False;
     PnlMestre.Enabled    := False;
     end
  else begin
     DbLkcEmissor.Enabled := True;
     PnlMestre.Enabled    := True;
  end;
end;

procedure TfrmCadEmissorXTitulo.DbLkcEmissorCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryDet.Close;
  qryDet.ParamByName('IDEMISSOR').AsInteger  := qryEmissor.FieldByName('IDEMISSOR').AsInteger;
  QryDet.Open;

  ControlaBTNDet;

end;

procedure TfrmCadEmissorXTitulo.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
   Accept := True;
    if Trim(dbeNomeTitulo.Text) = '' then begin
       MsgDlg('Título não Informado.','Erro',MtError,[mbOk],0);
       dbeNomeTitulo.SetFocus;
       Accept := False;
    end;
end;

end.

