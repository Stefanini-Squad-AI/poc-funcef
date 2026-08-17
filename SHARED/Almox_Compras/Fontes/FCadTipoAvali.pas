unit FCadTipoAvali;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask,
  DBCtrls, TREdit, CmEventosCadastro, ImgList;

type
  TFrmCadTipoAvali = class(TfrmCadMestreDetalheCS)
    qryIDTIPOAVALIACAO: TFloatField;
    qryDESCTIPOAVALIACAO: TStringField;
    Label1: TLabel;
    edDescTipo: TDBEdit;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    qryDetIDCRITAVALIACAO: TFloatField;
    qryDetIDTIPOAVALIACAO: TFloatField;
    qryDetDESCCRITAVALIACAO: TStringField;
    qryDetPESO: TFloatField;
    Label2: TLabel;
    edDescCrit: TDBEdit;
    edPeso: TDBRealEdit;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeDetalheDelete(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
    //
    Procedure SelMestreDet( n : LongInt );
  public
    { Public declarations }
  end;

var
  FrmCadTipoAvali : TFrmCadTipoAvali;
  bInsert         : Boolean;
implementation

{$R *.DFM}

Uses uMensErro,uDataBase, uSistema;

Procedure TFrmCadTipoAvali.SelMestreDet( n : LongInt );
Begin
    qry.Close;
    qry.Params[0].Value := n;
    qry.Open;
    //
    qryDet.Close;
    qryDet.Params[0].Value := n;
    qryDet.Open;
End;

procedure TFrmCadTipoAvali.FormCreate(Sender: TObject);
begin
  inherited;
  SelMestreDet(-1);
end;

Procedure TFrmCadTipoAvali.CmeCadastroInsert(Sender: TObject);
Begin
   bInsert := True;
   SelMestreDet(-1);
   Inherited;
   edDescTipo.SetFocus;
End;

Procedure TFrmCadTipoAvali.CmeCadastroEdit(Sender: TObject);
Begin
   bInsert := False;
   Inherited;
   edDescTipo.SetFocus;
End;

Procedure TFrmCadTipoAvali.CmeCadastroDelete(Sender: TObject);
Begin
   qryDet.First;
   While Not qryDet.Eof Do
      Begin
          qryDet.Delete;
      End;
   Inherited;
End;

Procedure TFrmCadTipoAvali.CmeCadastroFind(Sender: TObject);
Begin
    Inherited;
   If MontaSelect.RetornouValor Then
      Begin
          SelMestreDet(StrToInt(MontaSelect.ValoresChave[0]));
      End;
End;

Procedure TFrmCadTipoAvali.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
Begin
    Accept := True;
    If Trim(edDescTipo.Text) = '' Then
       Begin
           MsgDlg('Obrigatótrio preencher Descrição de Tipo de Avaliação','Erro',mtError,[mbOK],0);
           edDescTipo.SetFocus;
           Accept := False;
       End;
End;

Procedure TFrmCadTipoAvali.CmeCadastroConfirma(Sender: TObject);
Begin
   if qry.State in [dsInsert,dsEdit] Then
      Begin
          If qry.State = dsInsert Then
              qry.FieldByName('IDTIPOAVALIACAO').asInteger := LeUltRegistro(nil,'TIPOAVALIACAO');
          qryDet.First;
          While Not qryDet.Eof Do
            Begin
               qryDet.Edit;
               If qryDet.FieldByName('IDCRITAVALIACAO').IsNull Then
                   qryDet.FieldByName('IDCRITAVALIACAO').asInteger := LeUltRegistro(nil,'CRITAVALIACAO');
               qryDet.FieldByName('IDTIPOAVALIACAO').asInteger := qry.FieldByName('IDTIPOAVALIACAO').asInteger;
               qryDet.Next;
            End;
         AplicaAlteracoes([qry,qrydet]);
         if bInsert Then
           SelMestreDet(-1);
      End
  else
      AplicaAlteracoes([qrydet,qry]);
 inherited;
End;

Procedure TFrmCadTipoAvali.CmeDetalheInsert(Sender: TObject);
Begin
   inherited;
   edDescCrit.SetFocus
End;

Procedure TFrmCadTipoAvali.CmeDetalheEdit(Sender: TObject);
Begin
   inherited;
   edDescCrit.SetFocus
End;

Procedure TFrmCadTipoAvali.CmeDetalheDelete(Sender: TObject);
Begin
  If MsgDlg('Confirma a exclusão do Critério de Avalaição','Exclusão',mtConfirmation,[mbOk,mbcancel],0) = mrOk Then
    inherited;
End;

Procedure TFrmCadTipoAvali.CmeDetalheConfirma(Sender: TObject);
Begin
 If (qryDet.State in [dsInsert,dsEdit]) Then
   Begin
      If trim(edDescCrit.Text) = '' Then
         Begin  
            MsgDlg('Obrigatótrio preencher Descrição do Critério de Avaliação','Erro',mtError,[mbOK],0);
            edDescCrit.SetFocus;
         End
      Else
      If edPeso.Value = 0 Then
         Begin
            MsgDlg('Peso não pode ser zero','Erro',mtError,[mbOK],0);
            edPeso.SetFocus;
         End
      Else
        Inherited;
   End
 Else
   inherited;
End;

procedure TFrmCadTipoAvali.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  SelMestreDet(-1);
end;

end.
