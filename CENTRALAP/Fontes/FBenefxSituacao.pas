unit FBenefxSituacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, ComCtrls, wwdblook, Grids, Wwdbigrd, Wwdbgrid, uMensErro, fTelaAut,
  CmEventosCadastro, ImgList;

type
  TFrmBenefxSituacao = class(TfrmCadastroCS)
    qryBeneficioXServicos: TwwQuery;
    qryPlano: TwwQuery;
    qryPatrocinadora: TwwQuery;
    Panel1: TPanel;
    Label1: TLabel;
    dblkpPatro: TwwDBLookupCombo;
    dblkpPlano: TwwDBLookupCombo;
    Label2: TLabel;
    Label3: TLabel;
    dblkpBenefServ: TwwDBLookupCombo;
    Panel2: TPanel;
    Panel3: TPanel;
    PnlCtrls: TPanel;
    BtnInclui: TSpeedButton;
    BtnIncluiTodos: TSpeedButton;
    BtnExclui: TSpeedButton;
    BtnExcluiTodos: TSpeedButton;
    Panel4: TPanel;
    Splitter1: TSplitter;
    PnlTitDesemb: TPanel;
    Panel5: TPanel;
    GrdSituacoes: TwwDBGrid;
    GrdSitxBenef: TwwDBGrid;
    qrySitBenef: TwwQuery;
    dsSitBenef: TwwDataSource;
    qrySitBenefIDSITBENEF: TFloatField;
    qrySitBenefDESCRICAO: TStringField;
    UpdSitBenef: TUpdateSQL;
    qryDESCRICAO: TStringField;
    qryIDPESSJUR: TFloatField;
    qryIDPLANOPREV: TFloatField;
    qryIDBENEFICIO: TFloatField;
    qryIDSITBENEF: TFloatField;
    qryPlanoIDPLANOPREV: TFloatField;
    qryPlanoNOME: TStringField;
    qryPatrocinadoraIDPESSOA: TFloatField;
    qryPatrocinadoraNOME: TStringField;
    BtnReplicar: TToolbarButton97;
    QryProcuraSitxBenef: TwwQuery;
    QryReplicaSitxBenef: TwwQuery;
    QryProcuraSitxBenefIDPESSJUR: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnIncluiClick(Sender: TObject);
    procedure BtnExcluiClick(Sender: TObject);
    procedure BtnReplicarClick(Sender: TObject);
    procedure dblkpPatroCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure GrdSituacoesKeyPress(Sender: TObject; var Key: Char);
    procedure qrySitBenefAfterOpen(DataSet: TDataSet);
    procedure qryAfterOpen(DataSet: TDataSet);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    procedure dblkpPatroExit(Sender: TObject);
    procedure dblkpPlanoExit(Sender: TObject);
  private
    { Private declarations }
    sPalavra :String;
    
    Procedure AbreConsultas;
    Procedure ReplicaRelacionamentos(idPatroDestino: LongInt);
  public
    { Public declarations }
  end;

var
  FrmBenefxSituacao: TFrmBenefxSituacao;

implementation

Uses uFuncaoGeral, uDataBase, FReplicaPatro, FPrincipal;

{$R *.DFM}

Procedure TFrmBenefxSituacao.CmeCadastroAtualizaBotoes(Sender: TObject);
Begin
  Inherited;
  sbtnAlterar.Enabled := Not bbtnConfirmar.Enabled;
  BtnReplicar.Enabled := sbtnAlterar.Enabled;
End;

Procedure TFrmBenefxSituacao.CmeCadastroEdit(Sender: TObject);
Begin
  Inherited;
  qry.CancelUpdates;
  AbreConsultas;
End;

Procedure TFrmBenefxSituacao.AbreConsultas;
Begin
  Inherited;

  If (dblkpPatro.Text <> '')     And
     (dblkpPlano.Text <> '')     And
     (dblkpBenefServ.Text <> '') Then
  Begin
     PnlCtrls.Enabled := True;

     If qry.Active And
        qry.UpdatesPending And
        (MsgDlg('Deseja Gravar As Alterações Pendentes','Confirmar',mtConfirmation, [mbYes,mbNo],0)=mrYes) then
        AplicaAlteracoes([qry]);

     If qrySitBenef.Active Then
     Begin
       If qrySitBenef.UpdatesPending Then qrySitBenef.CancelUpdates;
       qrySitBenef.Close;
     End;

     qrySitBenef.ParamByName('idpessoa').AsInteger    :=  StrToInt(dblkpPatro.LookupValue);
     qrySitBenef.ParamByName('idplanoprev').AsInteger :=  StrToInt(dblkpPlano.LookupValue);
     qrySitBenef.ParamByName('idbeneficio').AsInteger :=  StrToInt(dblkpBenefServ.LookupValue);
     qrySitBenef.Open;

     If qry.Active Then
     Begin
       If qry.UpdatesPending Then qry.CancelUpdates;
       qry.Close;
     End;

     qry.ParamByName('idpessoa').AsInteger    := StrToInt(dblkpPatro.LookupValue);
     qry.ParamByName('idplanoprev').AsInteger := StrToInt(dblkpPlano.LookupValue);
     qry.ParamByName('idbeneficio').AsInteger := StrToInt(dblkpBenefServ.LookupValue);
     qry.Open;
  End
  Else
  Begin
     PnlCtrls.Enabled := False;

     If qry.Active And
        qry.UpdatesPending And
        (MsgDlg('Deseja Gravar As Alterações Pendentes','Confirmar',mtConfirmation, [mbYes,mbNo],0)=mrYes) then
        AplicaAlteracoes([qry]);

     If qrySitBenef.Active Then
     Begin
       If qrySitBenef.UpdatesPending Then qrySitBenef.CancelUpdates;
       qrySitBenef.Close;
     End;

     qrySitBenef.ParamByName('idpessoa').AsInteger    :=  0;
     qrySitBenef.ParamByName('idplanoprev').AsInteger :=  0;
     qrySitBenef.ParamByName('idbeneficio').AsInteger :=  0;
     qrySitBenef.Open;

     If qry.Active Then
     Begin
       If qry.UpdatesPending Then qry.CancelUpdates;
       qry.Close;
     End;

     qry.ParamByName('idpessoa').AsInteger    := 0;
     qry.ParamByName('idplanoprev').AsInteger := 0;
     qry.ParamByName('idbeneficio').AsInteger := 0;
     qry.Open;
  End;
End;

Procedure TFrmBenefxSituacao.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
Begin
  Accept := ((dblkpPatro.Text <> '') And (dblkpPlano.Text <> '') And (dblkpBenefServ.Text <> ''));
  If Not Accept Then
     MsgDlg('Faltam Dados Para Completar a associação','Erro',mtError, [mbOk],0);
End;

Procedure TFrmBenefxSituacao.CmeCadastroConfirma(Sender: TObject);
Begin
  Inherited;
  AbreConsultas;
End;

Procedure TFrmBenefxSituacao.CmeCadastroCancel(Sender: TObject);
Begin
  Inherited;
  AbreConsultas;
End;

procedure TFrmBenefxSituacao.FormCreate(Sender: TObject);
begin
  inherited;
  If qrypatrocinadora.Active      Then qrypatrocinadora.Close;
  If qryPlano.Active              Then qryPlano.Close;
  If qryBeneficioXServicos.Active Then qryBeneficioXServicos.Close;

  qrypatrocinadora.Open;
   qryPlano.Open;
  qryBeneficioXServicos.Open;
end;

procedure TFrmBenefxSituacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FechaQry([qrypatrocinadora,qryPlano,qryBeneficioXServicos, qrySitBenef, Qry],false,true);
end;

procedure TFrmBenefxSituacao.BtnIncluiClick(Sender: TObject);
Var
  bTodos: Boolean;
begin
  inherited;
  If (Sender Is TSpeedButton) Then
  Begin
    bTodos := (Sender as TSpeedButton).Tag = 1;

    If bTodos Then
    Begin
      If (MsgDlg('Deseja Incluir todas as situações','Confirmar',mtConfirmation, [mbYes,mbNo],0)=mrNo) Then Exit;    
      qrySitBenef.First;
    End;

    While Not qrySitBenef.Eof Do
    Begin
       qry.Append;
       qryIDSITBENEF.AsFloat  := qrySitBenefIDSITBENEF.AsFloat;
       qryDESCRICAO.AsString  := qrySitBenefDESCRICAO.AsString;
       qryIDPESSJUR.AsFloat   := StrToFloat(dblkpPatro.LookupValue);
       qryIDPLANOPREV.AsFloat := StrToFloat(dblkpPlano.LookupValue);
       qryIDBENEFICIO.AsFloat := StrToFloat(dblkpBenefServ.LookupValue);
       qry.Post;

       qrySitBenef.Delete;

       If Not bTodos Then break;
    End;
  End;
end;

procedure TFrmBenefxSituacao.BtnExcluiClick(Sender: TObject);
Var
  bTodos: Boolean;
begin
  inherited;
  If (Sender Is TSpeedButton) Then
  Begin
    bTodos := (Sender as TSpeedButton).Tag = 1;

    If bTodos Then
    Begin
       If (MsgDlg('Deseja Excluir todas as situações','Confirmar',mtConfirmation, [mbYes,mbNo],0)=mrNo) Then Exit;
       qry.First;
    End;

    While Not qry.Eof Do
    Begin
      qrySitBenef.Append;
      qrySitBenefIDSITBENEF.AsFloat := qryIDSITBENEF.AsFloat;
      qrySitBenefDESCRICAO.AsString := qryDESCRICAO.AsString;
      qrySitBenef.Post;

      qry.Delete;

      If Not bTodos Then break;
    End;
  End;
end;

procedure TFrmBenefxSituacao.BtnReplicarClick(Sender: TObject);
begin
  inherited;
  BtnReplicar.Down := False;
  If dblkpPatro.Text <> '' Then
  Begin
     AbrirForm(FrmReplicaPatro, TFrmReplicaPatro, false);
     FrmReplicaPatro.ReplicaRelacionamentos := ReplicaRelacionamentos;
     FrmReplicaPatro.idPatroOrigen := StrToIntDef(dblkpPatro.LookupValue,0);
     FrmReplicaPatro.MontaListaPatro;
  End;
end;

procedure TFrmBenefxSituacao.ReplicaRelacionamentos(idPatroDestino: LongInt);
Begin
  Try
     StartTransacao;
     Qry.First;
     While Not qry.Eof Do
     Begin
       With QryProcuraSitxBenef Do
       Begin
          If Active Then Close;
          ParamByname('IDPESSJUR').AsFloat := idPatroDestino;
          ParamByname('IDPLANOPREV').AsFloat := qryIDPLANOPREV.AsFloat;
          ParamByname('IDBENEFICIO').AsFloat := qryIDBENEFICIO.AsFloat;
          ParamByname('IDSITBENEF').AsFloat := qryIDSITBENEF.AsFloat;
          Open;

          If IsEmpty Then
          Begin
             With QryReplicaSitxBenef Do
             Begin
                ParamByname('IDSITBENEF').AsFloat := qryIDSITBENEF.AsFloat;
                ParamByname('IDPESSJUR').AsFloat :=  idPatroDestino;
                ParamByname('IDPLANOPREV').AsFloat := qryIDPLANOPREV.AsFloat;
                ParamByname('IDBENEFICIO').AsFloat := qryIDBENEFICIO.AsFloat;
                ExecSql;
             End;
          End;
          Close;
       End;
       qry.Next;
     End;
     CommitTransacao;
  Except
     RollBackTransacao;
     Raise;
  End;
End;


procedure TFrmBenefxSituacao.dblkpPatroCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  AbreConsultas;
end;

procedure TFrmBenefxSituacao.GrdSituacoesKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Case Key Of
  'A'..'Z','a'..'z','0'..'9':
  Begin
    sPalavra := sPalavra + Key;
    (Sender as TwwDbGrid).DataSource.DataSet.Locate(
        (Sender as TwwDbGrid).DataSource.DataSet.Fields[0].FieldName,
        sPalavra,
        [LoPartialKey,LoCaseInsensitive]);
  End;
  Else
    sPalavra := ''
  End;
end;

procedure TFrmBenefxSituacao.qrySitBenefAfterOpen(DataSet: TDataSet);
begin
  inherited;
  If DataSet.IsEmpty Then
     GrdSituacoes.hint := ''
  Else
     GrdSituacoes.hint := DataSet.Fields[0].AsString;
end;

procedure TFrmBenefxSituacao.qryAfterOpen(DataSet: TDataSet);
begin
  inherited;
  If DataSet.IsEmpty Then
     GrdSitxBenef.hint := ''
  Else
     GrdSitxBenef.hint := DataSet.Fields[0].AsString;
end;

procedure TFrmBenefxSituacao.dblkpPatroExit(Sender: TObject);
begin
  inherited;
  If qryPlano.Active              Then qryPlano.Close;
  qryplano.ParamByName('IDPESSJUR').AsFloat := qryPatrocinadoraIdpessoa.AsFloat;
  qryPlano.Open;
end;

procedure TFrmBenefxSituacao.dblkpPlanoExit(Sender: TObject);
begin
  inherited;

  If qryBeneficioXServicos.Active Then qryBeneficioXServicos.Close;

  qryBeneficioXServicos.ParamByName('IDPLANOPREV').AsFloat := QRYPLANOIDPLANOPREV.AsFloat;
  qryBeneficioXServicos.Open;

end;

end.

