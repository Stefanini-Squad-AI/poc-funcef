unit FCadCaixaPeq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Mask, DBCtrls, CMProcuraSubTipo, TREdit, wwdblook,
  CMDBLookupCombo, CmEventosCadastro, ImgList, uCMTypes;

type
  TFrmCadCaixaPeq = class(TfrmCadastroCS)
    qryCODTIPDOC: TFloatField;
    qryIDFORCLI: TFloatField;
    qryIDPESSOA: TFloatField;
    qryDESCCAIXAPEQ: TStringField;
    qryVLRTOTCAIXAPEQ: TFloatField;
    qryVLRMAXLANC: TFloatField;
    qryIDCAIXAPEQUENO: TFloatField;
    Label1: TLabel;
    edDesc: TDBEdit;
    cmpFavo: TCMProcuraForCli;
    edValTot: TDBRealEdit;
    Label2: TLabel;
    Label3: TLabel;
    dblcTipoDoc: TCMDBLookupCombo;
    Label4: TLabel;
    qryTipoDoc: TwwQuery;
    edValLanc: TDBRealEdit;
    qryTipoDocCODTIPDOC: TFloatField;
    qryTipoDocDESCRICAO: TStringField;
    edNumDiasVenc: TDBRealEdit;
    Label5: TLabel;
    qryNUMDIASVENC: TFloatField;
    qryFormaPag: TwwQuery;
    qryFormaPagDESCRICAO: TStringField;
    qryFormaPagCODFORMA: TFloatField;
    qryFormaPagRECPAG: TStringField;
    Label6: TLabel;
    dblcForma: TCMDBLookupCombo;
    qryCODFORMA: TFloatField;
    procedure FormCreate(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
    procedure Sel( n : LongInt );
  public
    { Public declarations }

  end;

var
  FrmCadCaixaPeq: TFrmCadCaixaPeq;

implementation

{$R *.DFM}

uses uDataBase, uMensErro, uSistema;

procedure TFrmCadCaixaPeq.Sel( n : LongInt );
Begin
   qry.Close;
   qry.Params[0].Value := n;
   qry.Open;
End;

procedure TFrmCadCaixaPeq.CmeCadastroInsert(Sender: TObject);
begin
     Inherited;
     edDesc.SetFocus;
end;

procedure TFrmCadCaixaPeq.CmeCadastroEdit(Sender: TObject);
begin
     Inherited;
     edDesc.SetFocus;
end;

procedure TFrmCadCaixaPeq.CmeCadastroFind(Sender: TObject);
begin
     Inherited;
     If MontaSelect.RetornouValor Then
      Begin
          Sel(StrToInt(MontaSelect.ValoresChave[0]));
      End;
end;

Procedure TFrmCadCaixaPeq.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
Begin
  Accept := True;
  If Trim(edDesc.Text) = '' then
      Begin
         MsgDlg('Descrição não preenchido','Erro',mtError,[mbOK],0);
         edDesc.SetFocus;
         Accept := False;
      End
  Else
  If Trim( cmpFavo.Text) = '' then
      Begin
         MsgDlg('Favorecido não preenchido','Erro',mtError,[mbOK],0);
         cmpFavo.SetFocus;
         Accept := False;
      End
  Else
  If (cmpFavo.Valida <> vcOK )  Then
      Begin
         cmpFavo.SetFocus;
         Accept := False;
      End
  Else
  If Trim(dblcTipoDoc.Text) = '' then
      Begin
         MsgDlg('Tipo de documento não preenchido','Erro',mtError,[mbOK],0);
         dblcTipoDoc.SetFocus;
         Accept := False;
      End
  Else
  If edValTot.Value <= 0 then
      Begin
         MsgDlg('Valor do Caixa não pode ser menor ou igual a zero','Erro',mtError,[mbOK],0);
         edValTot.SetFocus;
         Accept := False;
      End;
End;

procedure TFrmCadCaixaPeq.CmeCadastroConfirma(Sender: TObject);
begin
  If qry.State in [dsEdit,dsInsert] Then
    Begin
       If qry.State = dsInsert Then
          qry.FieldByName('IDCAIXAPEQUENO').asInteger := LeUltRegistro(nil,'CAIXAPEQUENA');
       qry.FieldByName('IDPESSOA').asInteger := Sistema.IdEmpresa;
    End;
  Inherited;
end;

procedure TFrmCadCaixaPeq.FormCreate(Sender: TObject);
begin
  inherited;
  Sel(-1);
  //
  QryFormaPag.Close;
  QryFormaPag.ParamByName('PRECPAG').AsString    := 'P';
  QryFormaPag.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
  QryFormaPag.Open;
end;

end.
