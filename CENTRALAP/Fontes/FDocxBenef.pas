(*******************************************************************************
 Analista Responsável: Gustavo Viegas
 - Atualizado em 15/09/2000
*******************************************************************************)

unit FDocxBenef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, IvDictio,
  IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery,
  TB97Ctls, MAHlpBtn, StdCtrls, TB97Tlbr, TB97, wwdblook, uMensErro, fTelaAut,
  CmEventosCadastro, ImgList, uDataBase;

type
  TFrmDocxBenef = class(TfrmCadastroCS)
    Panel2: TPanel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Panel3: TPanel;
    Panel5: TPanel;
    GrdDocsSel: TwwDBGrid;
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
    qryDocumentos: TwwQuery;
    Label1: TLabel;
    dblkpPatro: TwwDBLookupCombo;
    dblkpPlano: TwwDBLookupCombo;
    Label2: TLabel;
    Label3: TLabel;
    dblkpBenefServ: TwwDBLookupCombo;
    Label4: TLabel;
    dsDocumentos: TwwDataSource;
    UpdDocumentos: TUpdateSQL;
    qryDocumentosIDDOCUMENTO: TFloatField;
    qryDocumentosNOMEDOCUMENTO: TStringField;
    qrySitBenef: TwwQuery;
    BtnReplicar: TToolbarButton97;
    QryProcuraDocxBenef: TwwQuery;
    QryReplicaDocxBenef: TwwQuery;
    QryProcuraDocxBenefIDTIPODOCXBENEF: TFloatField;
    qryPatrocinadoraIDPESSOA: TFloatField;
    qryPatrocinadoraNOME: TStringField;
    qryPlanoIDPLANOPREV: TFloatField;
    qryPlanoNOME: TStringField;
    qryBeneficioIDSERVICOS: TFloatField;
    qryBeneficioNOME: TStringField;
    qryBeneficioTIPO: TStringField;
    qrySitBenefIDSITBENEF: TFloatField;
    qrySitBenefDESCRICAO: TStringField;
    dblkpSituacao: TwwDBLookupCombo;
    qryNOMEDOCUMENTO: TStringField;
    qryIDPESSOA: TFloatField;
    qryIDPLANOPREV: TFloatField;
    qryIDBENEFICIO: TFloatField;
    qryIDSITBENEF: TFloatField;
    qryIDDOCUMENTO: TFloatField;
    qryIDTIPODOCXBENEF: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnIncluiClick(Sender: TObject);
    procedure BtnExcluiClick(Sender: TObject);
    procedure dblkpPatroCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure BtnReplicarClick(Sender: TObject);
    procedure GrdTipDesembKeyPress(Sender: TObject; var Key: Char);
    procedure qryDocumentosAfterOpen(DataSet: TDataSet);
    procedure qryAfterOpen(DataSet: TDataSet);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    procedure dblkpPatroExit(Sender: TObject);
    procedure dblkpPlanoExit(Sender: TObject);
    procedure dblkpBenefServExit(Sender: TObject);
    procedure dblkpSituacaoChange(Sender: TObject);
    procedure dblkpPatroChange(Sender: TObject);
    procedure dblkpPlanoChange(Sender: TObject);
    procedure dblkpBenefServChange(Sender: TObject);
    procedure dblkpSituacaoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
    sPalavra :String;

    Procedure AbreConsultas;
    Procedure ReplicaRelacionamentos(idPatroDestino: LongInt);
  public
    { Public declarations }
  end;

var
  FrmDocxBenef: TFrmDocxBenef;

implementation

Uses uDiasUteis, uFuncaoGeral, FReplicaPatro, FPrincipal;

{$R *.DFM}

procedure TFrmDocxBenef.FormCreate(Sender: TObject);
begin
  inherited;
  If qryPatrocinadora.Active      Then qryPatrocinadora.Close;
  If qryPlano.Active              Then qryPlano.Close;
  If qryBeneficio.Active          Then qryBeneficio.Close;
  If qrySitBenef.Active           Then qryDocumentos.Close;

  qryPatrocinadora.Open;
  qryPlano.Open;
  qryBeneficio.Open;
  qrySitBenef.Open;
 // andre Tavares 21/01/2002
  PnlCtrls.Enabled := (dblkpSituacao.text <> '') and (dblkpBenefServ.text <> '') and
                      (dblkpPlano.text <> '')    and (dblkpPatro.text <> '');

end;

procedure TFrmDocxBenef.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FechaQry([qrypatrocinadora, qryPlano, qryBeneficio, qrySitBenef, qryDocumentos, qry ],false,true);
end;

Procedure TFrmDocxBenef.CmeCadastroAtualizaBotoes(Sender: TObject);
Begin
  Inherited;
  sbtnAlterar.Enabled := Not bbtnConfirmar.Enabled;
  BtnReplicar.Enabled := sbtnAlterar.Enabled;
End;

Procedure TFrmDocxBenef.CmeCadastroEdit(Sender: TObject);
Begin
  Inherited;
  qry.CancelUpdates;
  AbreConsultas;
End;

Procedure TFrmDocxBenef.AbreConsultas;
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

     If qryDocumentos.Active Then
     Begin
       If qryDocumentos.UpdatesPending Then qryDocumentos.CancelUpdates;
       qryDocumentos.Close;
     End;
     qryDocumentos.ParamByName('idpessoa').AsInteger    :=  StrToInt(dblkpPatro.LookupValue);
     qryDocumentos.ParamByName('idplanoprev').AsInteger :=  StrToInt(dblkpPlano.LookupValue);
     qryDocumentos.ParamByName('idbeneficio').AsInteger :=  StrToInt(dblkpBenefServ.LookupValue);
     qryDocumentos.ParamByName('idsitbenef').AsInteger  :=  StrToInt(dblkpSituacao.LookupValue);
     qryDocumentos.Open;

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
//fim andre
     If qry.Active And
        qry.UpdatesPending And
        (MsgDlg('Deseja Gravar As Alterações Pendentes','Confirmar',mtConfirmation, [mbYes,mbNo],0)=mrYes) then
        AplicaAlteracoes([qry]);

     If qryDocumentos.Active Then
     Begin
       If qryDocumentos.UpdatesPending Then qryDocumentos.CancelUpdates;
       qryDocumentos.Close;
     End;

     qryDocumentos.ParamByName('idpessoa').AsInteger    :=  0;
     qryDocumentos.ParamByName('idplanoprev').AsInteger :=  0;
     qryDocumentos.ParamByName('idbeneficio').AsInteger :=  0;
     qryDocumentos.ParamByName('idsitbenef').AsInteger  :=  0;
     qryDocumentos.Open;

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

Procedure TFrmDocxBenef.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
Begin
  Accept := ((dblkpPatro.Text <> '') And (dblkpPlano.Text <> '') And (dblkpBenefServ.Text <> '') And (dblkpSituacao.Text <> ''));
  If Not Accept Then
     MsgDlg('Faltam Dados Para Completar a associação','Erro',mtError, [mbOk],0);
End;

Procedure TFrmDocxBenef.CmeCadastroConfirma(Sender: TObject);
Begin
  Inherited;
  AbreConsultas;
End;

Procedure TFrmDocxBenef.CmeCadastroCancel(Sender: TObject);
Begin
  Inherited;
  AbreConsultas;
End;


procedure TFrmDocxBenef.BtnIncluiClick(Sender: TObject);
Var
  bTodos: Boolean;
begin
  inherited;
  If (Sender Is TSpeedButton) Then
  Begin
    bTodos := (Sender as TSpeedButton).Tag = 1;

    If bTodos Then
    Begin
      If (MsgDlg('Deseja Incluir todos os documentos','Confirmar',mtConfirmation, [mbYes,mbNo],0)=mrNo) Then Exit;

      qryDocumentos.First;
    End;

    While Not qryDocumentos.Eof Do
    Begin
       qry.Append;
       qryIDDOCUMENTO.AsFloat := qryDocumentosIDDOCUMENTO.AsFloat;
       qryNOMEDOCUMENTO.AsString := qryDocumentosNOMEDOCUMENTO.AsString;
       qryIDSITBENEF.AsFloat := StrToFloat(dblkpSituacao.LookupValue);
       qryIDPESSOA.AsFloat := StrToFloat(dblkpPatro.LookupValue);
       qryIDPLANOPREV.AsFloat := StrToFloat(dblkpPlano.LookupValue);
       qryIDBENEFICIO.AsFloat := StrToFloat(dblkpBenefServ.LookupValue);
       qryIDTIPODOCXBENEF.AsFloat := LeultRegistro(nil,'TIPODOCXBENEF');
       qry.Post;

       qryDocumentos.Delete;

       If Not bTodos Then break;
    End;
  End;
end;

procedure TFrmDocxBenef.BtnExcluiClick(Sender: TObject);
Var
  bTodos: Boolean;
begin
  inherited;
  If (Sender Is TSpeedButton) Then
  Begin
    bTodos := (Sender as TSpeedButton).Tag = 1;

    If bTodos Then
    Begin
      If (MsgDlg('Deseja Excluir todos os documentos','Confirmar',mtConfirmation, [mbYes,mbNo],0)=mrNo) Then Exit;
      qry.First;
    End;

    While Not qry.Eof Do
    Begin
      qryDocumentos.Append;
      qryDocumentosIDDOCUMENTO.AsFloat    := qryIDDOCUMENTO.AsFloat;
      qryDocumentosNOMEDOCUMENTO.AsString := qryNOMEDOCUMENTO.AsString;
      qryDocumentos.Post;

      qry.Delete;

      If Not bTodos Then break;
    End;
  End;

end;

procedure TFrmDocxBenef.dblkpPatroCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  AbreConsultas;
end;

procedure TFrmDocxBenef.ReplicaRelacionamentos(idPatroDestino: LongInt);
Begin
  Try
     StartTransacao;
     Qry.First;
     While Not qry.Eof Do
     Begin
       With QryProcuraDocxBenef Do
       Begin
          If Active Then Close;

          ParamByname('IDDOCUMENTO').AsFloat := qryIDDOCUMENTO.AsFloat;
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
                ParamByname('IDDOCUMENTO').AsFloat := qryIDDOCUMENTO.AsFloat;
                ParamByname('IDTIPODOCXBENEF').AsFloat := LeultRegistro(nil,'TIPODOCXBENEF');
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

procedure TFrmDocxBenef.BtnReplicarClick(Sender: TObject);
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

procedure TFrmDocxBenef.GrdTipDesembKeyPress(Sender: TObject;
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

procedure TFrmDocxBenef.qryDocumentosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  If DataSet.IsEmpty Then
     GrdTipDesemb.hint := ''
  Else
     GrdTipDesemb.hint := DataSet.Fields[0].AsString;
end;

procedure TFrmDocxBenef.qryAfterOpen(DataSet: TDataSet);
begin
  inherited;
  If DataSet.IsEmpty Then
     GrdDocsSel.hint := ''
  Else
     GrdDocsSel.hint := DataSet.Fields[0].AsString;
end;

procedure TFrmDocxBenef.dblkpPatroExit(Sender: TObject);
begin
  inherited;
  qryPlano.Close;
  qryplano.ParamByName('IDPESSJUR').AsFloat := qryPatrocinadoraIDPESSOA.AsFloat;
  qryPlano.Open;
end;

procedure TFrmDocxBenef.dblkpPlanoExit(Sender: TObject);
begin
  inherited;
   qryBeneficio.Close;
   qryBeneficio.ParamByName('IDPLANOPREV').AsFloat := qryPlanoIDPLANOPREV.AsFloat;
   qryBeneficio.Open;
end;

procedure TFrmDocxBenef.dblkpBenefServExit(Sender: TObject);
begin
  inherited;
   qrySitBenef.Close;
   qrySitBenef.ParamByName('IDBENEFICIO').AsFloat := qryBeneficioIDSERVICOS.AsFloat;
   qrySitBenef.ParamByName('idpessoa').AsFloat   := qryPatrocinadoraIDPESSOA.AsFloat;
   qrySitBenef.ParamByName('IDPLANOPREV').AsFloat := qryPlanoIDPLANOPREV.AsFloat;
   qrySitBenef.Open;
end;

procedure TFrmDocxBenef.dblkpSituacaoChange(Sender: TObject);
begin
  inherited;
  PnlCtrls.Enabled := (dblkpSituacao.text <> '') and (dblkpBenefServ.text <> '') and
                      (dblkpPlano.text <> '')    and (dblkpPatro.text <> '');
end;

procedure TFrmDocxBenef.dblkpPatroChange(Sender: TObject);
begin
  inherited;
  PnlCtrls.Enabled := (dblkpSituacao.text <> '') and (dblkpBenefServ.text <> '') and
                      (dblkpPlano.text <> '')    and (dblkpPatro.text <> '');

end;

procedure TFrmDocxBenef.dblkpPlanoChange(Sender: TObject);
begin
  inherited;
  PnlCtrls.Enabled := (dblkpSituacao.text <> '') and (dblkpBenefServ.text <> '') and
                      (dblkpPlano.text <> '')    and (dblkpPatro.text <> '');

end;

procedure TFrmDocxBenef.dblkpBenefServChange(Sender: TObject);
begin
  inherited;
  PnlCtrls.Enabled := (dblkpSituacao.text <> '') and (dblkpBenefServ.text <> '') and
                      (dblkpPlano.text <> '')    and (dblkpPatro.text <> '');

end;

procedure TFrmDocxBenef.dblkpSituacaoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  AbreConsultas;
end;

end.
