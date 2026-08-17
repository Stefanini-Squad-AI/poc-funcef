(*******************************************************************************
 Analista Responsável: Gustavo Viegas
 - Atualizado em 04/10/2000 
*******************************************************************************)

unit FTermosxBenef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, IvDictio,
  IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery,
  TB97Ctls, MAHlpBtn, StdCtrls, TB97Tlbr, TB97, wwdblook, uMensErro, fTelaAut,
  CmEventosCadastro, ImgList;

type
  {Form para associação de Termos X Benefício X Plano X Patrocinadora X Situação a
   ser ultilizado no momento do atendimento na montagem da RUBS caso o atendimento
   gere uma RUBS}
  TFrmTermosxBenef = class(TfrmCadastroCS)
    Panel2: TPanel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Panel3: TPanel;
    Panel5: TPanel;
    GrdTermosSel: TwwDBGrid;
    PnlCtrls: TPanel;
    BtnInclui: TSpeedButton;
    BtnIncluiTodos: TSpeedButton;
    BtnExclui: TSpeedButton;
    BtnExcluiTodos: TSpeedButton;
    Panel4: TPanel;
    PnlTitDesemb: TPanel;
    GrdTipDesemb: TwwDBGrid;
    Panel1: TPanel;
    qryPatrocinadora: TwwQuery;
    qryPlano: TwwQuery;
    qryBeneficio: TwwQuery;
    QryTermos: TwwQuery;
    Label1: TLabel;
    dblkpPatro: TwwDBLookupCombo;
    dblkpPlano: TwwDBLookupCombo;
    Label2: TLabel;
    Label3: TLabel;
    dblkpBenefServ: TwwDBLookupCombo;
    dblkpSituacao: TwwDBLookupCombo;
    Label4: TLabel;
    DsTermos: TwwDataSource;
    UpdTermos: TUpdateSQL;
    qrySitBenef: TwwQuery;
    BtnReplicar: TToolbarButton97;
    QryProcuraDocxBenef: TwwQuery;
    QryReplicaDocxBenef: TwwQuery;
    QryTermosIDCONFIGRUBS: TFloatField;
    QryTermosDESCRUB: TStringField;
    QryProcuraDocxBenefIDTERMOSXBENEF: TFloatField;
    qryDESCRUB: TStringField;
    qryIDPESSOA: TFloatField;
    qryIDPLANOPREV: TFloatField;
    qryIDBENEFICIO: TFloatField;
    qryIDSITBENEF: TFloatField;
    qryIDCONFIGRUBS: TFloatField;
    qryIDTERMOSXBENEF: TFloatField;
    qryPatrocinadoraIDPESSOA: TFloatField;
    qryPatrocinadoraNOME: TStringField;
    qryPlanoIDPLANOPREV: TFloatField;
    qryPlanoNOME: TStringField;
    qryBeneficioIDSERVICOS: TFloatField;
    qryBeneficioNOME: TStringField;
    qryBeneficioTIPO: TStringField;
    qrySitBenefIDSITBENEF: TFloatField;
    qrySitBenefDESCRICAO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnIncluiClick(Sender: TObject);
    procedure BtnExcluiClick(Sender: TObject);
    procedure dblkpPatroCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure BtnReplicarClick(Sender: TObject);
    procedure GrdTipDesembKeyPress(Sender: TObject; var Key: Char);
    procedure QryTermosAfterOpen(DataSet: TDataSet);
    procedure qryAfterOpen(DataSet: TDataSet);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    procedure dblkpPatroExit(Sender: TObject);
    procedure dblkpPlanoExit(Sender: TObject);
    procedure dblkpBenefServExit(Sender: TObject);
  private
    {Armazena as letra digitadas para pesquisa. Ulitlizado no 'Incremental Search' do Grid de 'Termos Cadastrados'}
    sPalavra :String;
    {Habilita os campos para edição e monta grids de 'Cadastrados' e 'Associados' e chama o método AbreConsultas}
    {Cancela procedimentos de cadastro e chama o método AbreConsultas}
    {Valida associação e verifica as pendências de confirmação de altereção}
    {Trata acesso aos botões Replicar e Alterar}
    {Grava dados e chama o método AbreConsultas}
    {Verifica confirmações pendente e prepara consulta de 'Cadastrados' e 'Associados'}
    Procedure AbreConsultas;
    {Procedura a ser atribuída para o evento ReplicaRelacionamentos do FrmReplicaPatro para
     replicação dos relacionamentos para outras patrocinadoraaas}
    Procedure ReplicaRelacionamentos(idPatroDestino: LongInt);
  public
    { Public declarations }
  end;

var
  FrmTermosxBenef: TFrmTermosxBenef;

implementation

Uses uFuncaoGeral, uDataBase, FReplicaPatro, FPrincipal;

{$R *.DFM}

procedure TFrmTermosxBenef.FormCreate(Sender: TObject);
begin
  inherited;
  If qryPatrocinadora.Active      Then qryPatrocinadora.Close;
  If qryPlano.Active              Then qryPlano.Close;
  If qryBeneficio.Active          Then qryBeneficio.Close;
  If qrySitBenef.Active           Then QryTermos.Close;

  qryPatrocinadora.Open;
  qryPlano.Open;
  qryBeneficio.Open;
  qrySitBenef.Open;
end;

procedure TFrmTermosxBenef.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FechaQry([qrypatrocinadora, qryPlano, qryBeneficio, qrySitBenef, QryTermos, qry ],false,true);
end;

Procedure TFrmTermosxBenef.CmeCadastroAtualizaBotoes(Sender: TObject);
Begin
  Inherited;
  sbtnAlterar.Enabled := Not bbtnConfirmar.Enabled;
  BtnReplicar.Enabled := sbtnAlterar.Enabled;
End;

Procedure TFrmTermosxBenef.CmeCadastroEdit(Sender: TObject);
Begin
  Inherited;
  qry.CancelUpdates;
  AbreConsultas;
End;

Procedure TFrmTermosxBenef.AbreConsultas;
Begin
  Inherited;
  If (dblkpPatro.Text <> '')     And
     (dblkpPlano.Text <> '')     And
     (dblkpSituacao.Text <> '')  And
     (dblkpBenefServ.Text <> '') Then
  Begin
     PnlCtrls.Enabled := True;

     If qry.Active And
        qry.UpdatesPending And
        (MsgDlg('Deseja Gravar As Alterações Pendentes','Confirmar',mtConfirmation, [mbYes,mbNo],0)=mrYes) then
        AplicaAlteracoes([qry]);

     If QryTermos.Active Then
     Begin
       If QryTermos.UpdatesPending Then QryTermos.CancelUpdates;
       QryTermos.Close;
     End;

     QryTermos.ParamByName('idpessoa').AsInteger    :=  StrToInt(dblkpPatro.LookupValue);
     QryTermos.ParamByName('idplanoprev').AsInteger :=  StrToInt(dblkpPlano.LookupValue);
     QryTermos.ParamByName('idbeneficio').AsInteger :=  StrToInt(dblkpBenefServ.LookupValue);
     QryTermos.ParamByName('idsitbenef').AsInteger  :=  StrToInt(dblkpSituacao.LookupValue);
     QryTermos.Open;

     If qry.Active Then
     Begin
       If qry.UpdatesPending Then qry.CancelUpdates;
       qry.Close;
     End;

     qry.ParamByName('idpessoa').AsInteger    := StrToInt(dblkpPatro.LookupValue);
     qry.ParamByName('idplanoprev').AsInteger := StrToInt(dblkpPlano.LookupValue);
     qry.ParamByName('idbeneficio').AsInteger := StrToInt(dblkpBenefServ.LookupValue);
     qry.ParamByName('idsitbenef').AsInteger  :=  StrToInt(dblkpSituacao.LookupValue);     
     qry.Open;
  End
  Else
  Begin
     PnlCtrls.Enabled := False;

     If qry.Active And
        qry.UpdatesPending And
        (MsgDlg('Deseja Gravar As Alterações Pendentes','Confirmar',mtConfirmation, [mbYes,mbNo],0)=mrYes) then
        AplicaAlteracoes([qry]);

     If QryTermos.Active Then
     Begin
       If QryTermos.UpdatesPending Then QryTermos.CancelUpdates;
       QryTermos.Close;
     End;

     QryTermos.ParamByName('idpessoa').AsInteger    :=  0;
     QryTermos.ParamByName('idplanoprev').AsInteger :=  0;
     QryTermos.ParamByName('idbeneficio').AsInteger :=  0;
     QryTermos.ParamByName('idsitbenef').AsInteger  :=  0;
     QryTermos.Open;

     If qry.Active Then
     Begin
       If qry.UpdatesPending Then qry.CancelUpdates;
       qry.Close;
     End;

     qry.ParamByName('idpessoa').AsInteger    := 0;
     qry.ParamByName('idplanoprev').AsInteger := 0;
     qry.ParamByName('idbeneficio').AsInteger := 0;
     qry.ParamByName('idsitbenef').AsInteger  := 0;     
     qry.Open;
  End;
End;

Procedure TFrmTermosxBenef.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
Begin
  Accept := ((dblkpPatro.Text <> '') And (dblkpPlano.Text <> '') And (dblkpBenefServ.Text <> '') And (dblkpSituacao.Text <> ''));
  If Not Accept Then
     MsgDlg('Faltam Dados Para Completar a associação','Erro',mtError, [mbOk],0);
End;

Procedure TFrmTermosxBenef.CmeCadastroConfirma(Sender: TObject);
Begin
  Inherited;
  AbreConsultas;
End;

Procedure TFrmTermosxBenef.CmeCadastroCancel(Sender: TObject);
Begin
  Inherited;
  AbreConsultas;
End;


procedure TFrmTermosxBenef.BtnIncluiClick(Sender: TObject);
Var
  bTodos: Boolean;
begin
  inherited;
  If (Sender Is TSpeedButton) Then
  Begin
    bTodos := (Sender as TSpeedButton).Tag = 1;

    If bTodos Then
    Begin
      If (MsgDlg('Deseja Incluir todos os termos','Confirmar',mtConfirmation, [mbYes,mbNo],0)=mrNo) Then Exit;    
      QryTermos.First;
    End;

    While (Not QryTermos.Eof) Do
    Begin
       qry.Append;
       qryIDCONFIGRUBS.AsFloat := QryTermosIDCONFIGRUBS.AsFloat;
       qryDESCRUB.AsString := QryTermosDESCRUB.AsString;
       qryIDSITBENEF.AsFloat := StrToFloat(dblkpSituacao.LookupValue);
       qryIDPESSOA.AsFloat := StrToFloat(dblkpPatro.LookupValue);
       qryIDPLANOPREV.AsFloat := StrToFloat(dblkpPlano.LookupValue);
       qryIDBENEFICIO.AsFloat := StrToFloat(dblkpBenefServ.LookupValue);
       qryIDTERMOSXBENEF.AsFloat := LeultRegistro(nil,'TERMOSXBENEF');
       qry.Post;

       QryTermos.Delete;

       If Not bTodos Then break;
    End;
  End;
end;

procedure TFrmTermosxBenef.BtnExcluiClick(Sender: TObject);
Var
  bTodos: Boolean;
begin
  inherited;
  If (Sender Is TSpeedButton) Then
  Begin
    bTodos := (Sender as TSpeedButton).Tag = 1;

    If bTodos Then
    Begin
       If (MsgDlg('Deseja Excluir todos os termos','Confirmar',mtConfirmation, [mbYes,mbNo],0)=mrNo) Then Exit;
       qry.First;
    End;

    While (Not qry.Eof) Do
    Begin
      QryTermos.Append;
      QryTermosIDCONFIGRUBS.AsFloat := qryIDCONFIGRUBS.AsFloat;
      QryTermosDESCRUB.AsString := qryDESCRUB.AsString;
      QryTermos.Post;

      qry.Delete;

      If Not bTodos Then break;
    End;
  End;

end;

procedure TFrmTermosxBenef.dblkpPatroCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  AbreConsultas;
end;

procedure TFrmTermosxBenef.ReplicaRelacionamentos(idPatroDestino: LongInt);
Begin
  Try
     StartTransacao;
     Qry.First;
     While Not qry.Eof Do
     Begin
       With QryProcuraDocxBenef Do
       Begin
          If Active Then Close;

          ParamByname('IDCONFIGRUBS').AsFloat := qryIDCONFIGRUBS.AsFloat;
          ParamByname('IDPLANOPREV').AsFloat := qryIDPLANOPREV.AsFloat;
          ParamByname('IDBENEFICIO').AsFloat := qryIDBENEFICIO.AsFloat;
          ParamByname('IDSITBENEF').AsFloat := qryIDSITBENEF.AsFloat;
          ParamByname('IDPESSOA').AsFloat := idPatroDestino;

          Open;

          If IsEmpty Then
          Begin
             With QryReplicaDocxBenef Do
             Begin
                ParamByname('IDPESSOA').AsFloat := idPatroDestino;
                ParamByname('IDPLANOPREV').AsFloat :=  qryIDPLANOPREV.AsFloat;
                ParamByname('IDBENEFICIO').AsFloat := qryIDBENEFICIO.AsFloat;
                ParamByname('IDSITBENEF').AsFloat := qryIDSITBENEF.AsFloat;
                ParamByname('IDCONFIGRUBS').AsFloat := qryIDCONFIGRUBS.AsFloat;
                ParamByname('IDTERMOSXBENEF').AsFloat := LeultRegistro(nil,'TERMOSXBENEF');
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

procedure TFrmTermosxBenef.BtnReplicarClick(Sender: TObject);
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

procedure TFrmTermosxBenef.GrdTipDesembKeyPress(Sender: TObject;
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

procedure TFrmTermosxBenef.QryTermosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  If DataSet.IsEmpty Then
     GrdTipDesemb.hint := ''
  Else
     GrdTipDesemb.hint := DataSet.Fields[0].AsString;
end;

procedure TFrmTermosxBenef.qryAfterOpen(DataSet: TDataSet);
begin
  inherited;
  If DataSet.IsEmpty Then
     GrdTermosSel.hint := ''
  Else
     GrdTermosSel.hint := DataSet.Fields[0].AsString;
end;

procedure TFrmTermosxBenef.dblkpPatroExit(Sender: TObject);
begin
  inherited;
  qryPlano.Close;
  qryplano.ParamByName('IDPESSJUR').AsFloat := qryPatrocinadoraIDPESSOA.AsFloat;
  qryPlano.Open;
end;

procedure TFrmTermosxBenef.dblkpPlanoExit(Sender: TObject);
begin
  inherited;
   qryBeneficio.Close;
   qryBeneficio.ParamByName('IDPLANOPREV').AsFloat := qryPlanoIDPLANOPREV.AsFloat;
   qryBeneficio.Open;
end;

procedure TFrmTermosxBenef.dblkpBenefServExit(Sender: TObject);
begin
  inherited;
   qrySitBenef.Close;
   qrySitBenef.ParamByName('IDBENEFICIO').AsFloat := qryBeneficioIDSERVICOS.AsFloat;
   qrySitBenef.ParamByName('idpessoa').AsFloat   := qryPatrocinadoraIDPESSOA.AsFloat;
   qrySitBenef.ParamByName('IDPLANOPREV').AsFloat := qryPlanoIDPLANOPREV.AsFloat;
   qrySitBenef.Open;
end;

end.
