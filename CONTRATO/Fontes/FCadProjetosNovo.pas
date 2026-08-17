 unit FCadProjetosNovo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe, ExtCtrls, wwdbedit,
  wwdblook, IvDictio, IvMulti, IvEMulti, DBCtrls, wwdbdatetimepicker,
  CMDateTimePicker, Mask, CmEventosCadastro, ImgList;

type
  TfrmCadProjetosNovo = class(TfrmCadMestreDetalheCS)
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    qryDet: TwwQuery;
    UpdateQryDet: TUpdateSQL;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBNomeAtividade: TwwDBEdit;
    DBDataInicioAtividade: TCMDateTimePicker;
    DBDataFimAtividade: TCMDateTimePicker;
    DBNomeProjeto: TwwDBEdit;
    DBDataInicio: TCMDateTimePicker;
    DBDataFim: TCMDateTimePicker;
    DBMemo1: TDBMemo;
    Label8: TLabel;
    qryContrato: TwwQuery;
    DBLComboContrato: TwwDBLookupCombo;
    qryIDPROJETO: TFloatField;
    qryNOMEPROJETO: TStringField;
    qryUNIDNEGOC: TFloatField;
    qryDESCRICAOPROJETO: TMemoField;
    qryIDPESSOA: TFloatField;
    qryDATAINICIOPROJETO: TDateTimeField;
    qryDATAFIMPROJETO: TDateTimeField;
    qryContratoIDCONTRATO: TFloatField;
    qryContratoNOMECONTRATO: TStringField;
    qryDetIDPROJETO: TFloatField;
    qryDetIDATIVIDADE: TFloatField;
    qryDetNOMEATIVIDADE: TStringField;
    qryDetIDCONTRATO: TFloatField;
    qryDetDATAINIATIVREAL: TDateTimeField;
    qryDetDATAFIMATIVREAL: TDateTimeField;
    qryDetDURACAOATIVREAL: TFloatField;
    qryDetNOMECONTRATO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure qryDetBeforePost(DataSet: TDataSet);
    function VerificaCamposPreenchidosDetalhe: Boolean;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    Procedure CmeDetalheDelete(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
  private
    { Private declarations }
    Procedure Sel( N : LongInt);
  public
    { Public declarations }
  end;

var
  frmCadProjetosNovo: TfrmCadProjetosNovo;
  bInsert     : Boolean;

implementation

uses uMensErro, uDataBase, DBaseDados, UAutorizacao,uSistema, fTelaAut, Global;

{$R *.DFM}

procedure TfrmCadProjetosNovo.FormCreate(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Add('PROJETO.IDPESSOA = '+ IntToStr(Sistema.IdEmpresa));

  qryContrato.close;
  qryContrato.Sql.Clear;
  qryContrato.Sql.Text := 'SELECT IDCONTRATO,NOMECONTRATO FROM CONTRATOCONTR '+
                          'WHERE (FLGFIMCONTRATO = ''S'') '+
                          'AND (IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+') '+
                          'AND IDCONTRATO IN (SELECT IDCONTRATO FROM CONTRATOUSUARIO '+
                          'WHERE IDUSUARIO = '+IntToStr(Sistema.IDUsuario)+') '+
                          'ORDER BY NOMECONTRATO';
  qryContrato.Open;

  Sel( -1 );
end;

Procedure TfrmCadProjetosNovo.Sel( N : LongInt);
Begin
   qry.Close;
   qry.ParamByName('IDPROJETO').AsInteger := n;
   qry.ParamByName('IDPESSOA').AsInteger  := Sistema.IdEmpresa;
   qry.Open;

   qryDet.Close;
   qryDet.ParamByName('IDPROJETO').AsInteger := n;
   qryDet.Open;
end;

procedure TfrmCadProjetosNovo.CmeCadastroInsert(Sender: TObject);
Begin
   bInsert := True;
   Sel(-1);
   Inherited;
   DBNomeProjeto.Clear;
   DBDataInicio.Clear;
   DBDataFim.Clear;
   DBMemo1.Clear;
   DBNomeProjeto.SetFocus;
End;

Procedure TfrmCadProjetosNovo.CmeCadastroEdit(Sender: TObject);
Begin
   bInsert := False;
   Inherited;
   DBNomeProjeto.SetFocus;
End;

procedure TfrmCadProjetosNovo.CmeCadastroDelete(Sender: TObject);
Begin
   qryDet.First;
   While Not qryDet.Eof Do
      Begin
          qryDet.Delete;
      End;
   Inherited;
End;

procedure TfrmCadProjetosNovo.CmeCadastroFind(Sender: TObject);
Begin
    Inherited;
    if MontaSelect.RetornouValor Then
       Begin
          Sel(StrToInt(MontaSelect.ValoresChave[0]));
          If Not qryDet.IsEmpty Then
             Begin
                DBNomeAtividade.Text         := qryDetNOMEATIVIDADE.AsString;
                DBDataInicioAtividade.Date   := qryDetDATAINIATIVREAL.asDateTime;
                DBDataFimAtividade.Date      := qryDetDATAFIMATIVREAL.asDateTime;
                DBLComboContrato.LookupValue := qryDetIDCONTRATO.AsString;
             End;
       End;
End;

procedure  TfrmCadProjetosNovo.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
Begin
   Accept := True;
   { Verificando se o Nome do Projeto foi preenchido. }
   if qry.FieldByName('NOMEPROJETO').AsString = '' then begin
      MsgDlg('Obrigatório preencher o nome do projeto','Erro',mtError,[mbOk],0);
      DBNomeProjeto.SetFocus;
      Accept := False;
   End
   Else
   { Verificando se a Data foi preenchida. }
   if qry.FieldByName('DATAINICIOPROJETO').AsString = '' then begin
      MsgDlg('Obrigatório preencher a data do início do projeto','Erro',mtError,[mbOk],0);
      DBDataInicio.SetFocus;
      Accept := False;
   End
   Else
   { Verificando se a Data foi preenchida. }
   if qry.FieldByName('DATAFIMPROJETO').AsString = '' then begin
      MsgDlg('Obrigatório preencher a data do término do projeto','Erro',mtError,[mbOk],0);
      DBDataFim.SetFocus;
         Accept := False;
   End
End;

procedure TfrmCadProjetosNovo.CmeCadastroConfirma(Sender: TObject);
Begin
    With qry Do
       Begin
        if State in [dsInsert,dsEdit] Then
           Begin
               If State = dsInsert Then
                   FieldByName('IDPROJETO').asInteger := LeUltRegistro(nil,'PROJETO');
               FieldByName('IDPESSOA').asInteger := Sistema.IdEmpresa;
               qryDet.First;
               While Not qryDet.Eof Do
                 Begin
                    qryDet.Edit;
                    qryDet.FieldByName('IDPROJETO').asInteger := qry.FieldByName('IDPROJETO').asInteger;
                    qryDet.Next;
                 End;
              AplicaAlteracoes([qry,qrydet]);
              if bInsert Then
                Sel(-1);
           End
       else
           AplicaAlteracoes([qrydet,qry]);
     End;
    inherited;
end;

procedure TfrmCadProjetosNovo.CmeDetalheInsert(Sender: TObject);
Begin
   Inherited;
   { Incluindo o próximo código da atividade.     }
   qryDet.FieldByName('IDATIVIDADE').AsInteger := LeUltRegistro(nil,'ATIVIDADESPROJETO');
   { Incluindo o código do projeto no Detail. }
   qryDet.FieldByName('IDPROJETO').AsInteger := qry.FieldByName('IDPROJETO').AsInteger;
   DBNomeAtividade.SetFocus;
End;

Procedure TfrmCadProjetosNovo.CmeDetalheEdit(Sender: TObject);
Begin
   Inherited;
   DBNomeAtividade.SetFocus;
End;

Procedure TfrmCadProjetosNovo.CmeDetalheDelete(Sender: TObject);
Begin
   If MsgDlg('Confirma a exclusão da Atividade','Exclusão',mtConfirmation,[mbOk,mbcancel],0) = mrOk Then
      inherited;
End;

Procedure TfrmCadProjetosNovo.CmeDetalheConfirma(Sender: TObject);
Begin
   If dsDet.State in [dsInsert,dsEdit] Then
      Begin
      { Verificando se o Nome do Projeto foi preenchido. }
      if qryDet.FieldByName('NOMEATIVIDADE').AsString = '' then begin
         MsgDlg('Obrigatório preencher a descrição da atividade','Erro',mtError,[mbOk],0);
         DBNomeAtividade.SetFocus;
      end
      Else
      { Verificando se a Data foi preenchida. }
      if qryDet.FieldByName('DATAINIATIVREAL').AsString = '' then begin
         MsgDlg('Obrigatório preencher a data do início da atividade','Erro',mtError,[mbOk],0);
         DBDataInicioAtividade.SetFocus;
      end
      Else
      { Verificando se a Data foi preenchida. }
      if qryDet.FieldByName('DATAFIMATIVREAL').AsString = '' then begin
         MsgDlg('Obrigatório preencher a data do término da atividade','Erro',mtError,[mbOk],0);
         DBDataFimAtividade.SetFocus;
      end
      Else
         Begin
           qryDet.FieldByName('NOMECONTRATO').asString := DBLComboContrato.Text;
           Inherited;
         End;
      End;
End;

procedure TfrmCadProjetosNovo.qryDetBeforePost(DataSet: TDataSet);
begin
   inherited;
   { Calculando a duração da atividade. }
   qryDet.FieldByName('DURACAOATIVREAL').AsFloat := (qryDet.FieldByName('DATAFIMATIVREAL').AsDateTime - qryDet.FieldByName('DATAINIATIVREAL').AsDateTime);
end;

procedure TfrmCadProjetosNovo.bbtnConfirmarClick(Sender: TObject);
begin
   { Verificando se o Nome do Projeto foi preenchido. }
   if qry.FieldByName('NOMEPROJETO').AsString = '' then begin
      MsgDlg('Obrigatório preencher o nome do projeto','Erro',mtError,[mbOk],0);
      DBNomeProjeto.SetFocus;
      Exit;
   end;
   { Verificando se a Data foi preenchida. }
   if qry.FieldByName('DATAINICIOPROJETO').AsString = '' then begin
      MsgDlg('Obrigatório preencher a data do início do projeto','Erro',mtError,[mbOk],0);
      DBDataInicio.SetFocus;
      Exit;
   end;
   { Verificando se a Data foi preenchida. }
   if qry.FieldByName('DATAFIMPROJETO').AsString = '' then begin
      MsgDlg('Obrigatório preencher a data do término do projeto','Erro',mtError,[mbOk],0);
      DBDataFim.SetFocus;
      Exit;
   end;
   inherited;
end;

function TfrmCadProjetosNovo.VerificaCamposPreenchidosDetalhe: Boolean;
begin
   VerificaCamposPreenchidosDetalhe := False;
   { Verificando se o Nome do Projeto foi preenchido. }
   if qryDet.FieldByName('NOMEATIVIDADE').AsString = '' then begin
      MsgDlg('Obrigatório preencher a descrição da atividade','Erro',mtError,[mbOk],0);
      DBNomeAtividade.SetFocus;
      Exit;
   end;
   { Verificando se a Data foi preenchida. }
   if qryDet.FieldByName('DATAINIATIVREAL').AsString = '' then begin
      MsgDlg('Obrigatório preencher a data do início da atividade','Erro',mtError,[mbOk],0);
      DBDataInicioAtividade.SetFocus;
      Exit;
   end;
   { Verificando se a Data foi preenchida. }
   if qryDet.FieldByName('DATAFIMATIVREAL').AsString = '' then begin
      MsgDlg('Obrigatório preencher a data do término da atividade','Erro',mtError,[mbOk],0);
      DBDataFimAtividade.SetFocus;
      Exit;
   end;
   VerificaCamposPreenchidosDetalhe := True;
end;

procedure TfrmCadProjetosNovo.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   Sel(-1);
end;

end.
