unit FSoliPrePronta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe, ExtCtrls, Mask, DBCtrls, TREdit, wwdblook,
  IvDictio, IvMulti, IvEMulti, CmEventosCadastro, ImgList;

type
  TFrmSoliPrePronta = class(TfrmCadMestreDetalheCS)
    qryIDSCPREPRONTA: TFloatField;
    qryIDPESSOA: TFloatField;
    qryCODALMOXARIFADO: TFloatField;
    qryDESCSCPREPRONTA: TStringField;
    EdDesc: TDBEdit;
    Label1: TLabel;
    qryDet: TwwQuery;
    qryUnidMed: TwwQuery;
    pnl: TPanel;
    Label4: TLabel;
    dblcItem: TwwDBLookupCombo;
    Label6: TLabel;
    dblcDesc: TwwDBLookupCombo;
    Label8: TLabel;
    dblcUN: TwwDBLookupCombo;
    Label7: TLabel;
    qryUnidMedCODMEDIDA: TStringField;
    qryUnidMedDESCMEDIDA: TStringField;
    qryDetIDSCPREPRONTA: TFloatField;
    qryDetCODARTIGO: TStringField;
    qryDetCODMEDIDA: TStringField;
    qryDetQTDEPESSOA: TFloatField;
    qryDetNDIAS: TFloatField;
    edQtde: TDBRealEdit;
    qryArtigo: TwwQuery;
    Label2: TLabel;
    lbAlmox: TStaticText;
    qryDetDESCRICAO: TStringField;
    updDet: TUpdateSQL;
    Label3: TLabel;
    edDias: TEdit;
    procedure dblcItemCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcDescCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormCreate(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeDetalheDelete(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
  private
    { Private declarations }
    Procedure SelUnid( S : String );
    Procedure SelMestreDet( n : LongInt );
  public
    { Public declarations }
  end;

var
  FrmSoliPrePronta: TFrmSoliPrePronta;

implementation

{$R *.DFM}
Uses uSistema, uModulo, uMensErro, uDataBase, dBaseDados;

Procedure TFrmSoliPrePronta.CmeCadastroInsert(Sender: TObject);
Begin
    SelMestreDet(-1);
    inherited;
    EdDesc.SetFocus;
End;

Procedure TFrmSoliPrePronta.CmeCadastroEdit(Sender: TObject);
Begin
    inherited;
    EdDesc.SetFocus;
End;


Procedure TFrmSoliPrePronta.CmeCadastroDelete(Sender: TObject);
Begin
    With qryDet do
       Begin
          First;
          While Not Eof do
             Delete;
       End;
    inherited;
End;

Procedure TFrmSoliPrePronta.CmeCadastroConfirma(Sender: TObject);
Begin
   If qry.State in [dsInsert,dsEdit] Then
      Begin
          If qryDet.IsEmpty Then
             Begin
                 MsgDlg('Não há itens cadastrado','Erro',mtError,[mbOK],0);
                 edDesc.SetFocus;
                 Exit;
             End;
          If trim(edDesc.text) = '' Then
             Begin
                 MsgDlg('Descrição não foi preenchida','Erro',mtError,[mbOK],0);
                 edDesc.SetFocus;
                 Exit;
             End;
          With qry Do
              Begin
                If State = dsInsert Then
                   FieldByName('IDSCPREPRONTA').asInteger   := LeUltRegistro(nil,'SCPREPRONTA');
                FieldByName('IDPESSOA').asInteger        := Sistema.IdEmpresa;
                FieldByName('CODALMOXARIFADO').asInteger := Modulo.iCodAlmoxa;
              End;
          qryDet.First;
          While not qryDet.eof do
              begin
                 qryDet.Edit;
                 qryDet.FieldByName('IDSCPREPRONTA').asInteger := qry.FieldByName('IDSCPREPRONTA').asInteger;
                 qryDet.Post;
                 qryDet.Next;
              end;
          AplicaAlteracoes([qry,qrydet]);
      End
    Else
          AplicaAlteracoes([qrydet,qry]);
    inherited;
End;

Procedure TFrmSoliPrePronta.CmeDetalheInsert(Sender: TObject);
Begin
    inherited;
    dblcItem.SetFocus;
End;

Procedure TFrmSoliPrePronta.CmeDetalheEdit(Sender: TObject);
Begin
    inherited;
    dblcItem.SetFocus;
End;

procedure TFrmSoliPrePronta.CmeDetalheDelete(Sender: TObject);
Begin
   If MsgDlg('Confirma a Exclusão desse Item','Confirmação',mtConfirmation,[mbOK,mbCancel],0) = mrOk Then
       inherited;

End;

Procedure TFrmSoliPrePronta.CmeDetalheConfirma(Sender: TObject);
Begin
   If qryDet.State in [dsInsert,dsEdit] Then
      Begin
          If trim(dblcItem.text) = '' Then
               Begin
                   MsgDlg('Item não foi preenchida','Erro',mtError,[mbOK],0);
                   dblcItem.SetFocus;
                   Exit;
               End;
          If trim(dblcUN.text) = '' Then
               Begin
                   MsgDlg('Unidade não foi preenchida','Erro',mtError,[mbOK],0);
                   dblcUN.SetFocus;
                   Exit;
               End;
         qryDet.FieldByName('NDIAS').asInteger         := 1;
         qryDet.FieldByName('Descricao').asString      := dblcDesc.Text;
      End;
    inherited;
End;

procedure TFrmSoliPrePronta.dblcItemCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If dblcItem.Text <> '' Then
    Begin
       dblcDesc.LookUpValue := dblcItem.LookUpValue;
       SelUnid(dblcItem.LookUpValue );
    End;
end;

procedure TFrmSoliPrePronta.dblcDescCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If dblcDesc.Text <> '' Then
     Begin
        dblcItem.LookUpValue := dblcDesc.LookUpValue;
        SelUnid(dblcDesc.LookUpValue );
     End;
end;

Procedure TFrmSoliPrePronta.SelUnid( S : String );
Begin
    qryUnidMed.Close;
    qryUnidMed.Params[0].asString := Copy(s,1,6);
    qryUnidMed.Open;
End;

Procedure TFrmSoliPrePronta.SelMestreDet( n : LongInt );
Begin
    qry.Close;
    qry.Params[0].Value := n;
    qry.Open;
    //
    qryDet.Close;
    qryDet.Params[0].Value := n;
    qryDet.Open;
End;

procedure TFrmSoliPrePronta.FormCreate(Sender: TObject);
begin
  inherited;
  lbAlmox.Caption := '  ' + Modulo.sAlmoxaUsuario + '  ';
  //
  SelMestreDet( -1 );
  //
  MontaSelect.Filtro.Add(' IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
  MontaSelect.Filtro.Add(' CODALMOXARIFADO = '+IntToStr(Modulo.iCodAlmoxa));
end;

Procedure TFrmSoliPrePronta.CmeCadastroFind(Sender: TObject);
Begin
    inherited;
    If MontaSelect.RetornouValor Then
       Begin
            SelMestreDet( StrToInt(MontaSelect.ValoresChave[0]) );
       End;
End;
end.
