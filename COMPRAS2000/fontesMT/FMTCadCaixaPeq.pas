unit FMTCadCaixaPeq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, TREdit,
  wwdblook, Spin, uCtrlCaixaPequeno,uCtrlListCAPCAR,
  Mask, wwdbedit, CMDBLookupCombo, DBCtrls, Wwdbspin ,uCMTypes, CMProcuraSubTipo;

type
  TfrmMTCadCaixaPeq = class(TFrmCadastroMT)
    cdsTipoDoc: TCMClientDataSet;
    cdsFormaPgto: TCMClientDataSet;
    Label1: TLabel;
    edDesc: TDBEdit;
    cmpFavo: TCMProcuraForCli;
    Label4: TLabel;
    dblcTipoDoc: TCMDBLookupCombo;
    Label6: TLabel;
    dblcForma: TCMDBLookupCombo;
    Label2: TLabel;
    edValTot: TDBRealEdit;
    Label3: TLabel;
    edValLanc: TDBRealEdit;
    Label5: TLabel;
    edNumDiasVenc: TDBRealEdit;
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
  private
    { Private declarations }
    CaixaPequeno : TCtrlCaixaPequeno;
    ListCAPCAR   : TCtrlListCAPCAR;
  public
    { Public declarations }
  end;

var
  frmMTCadCaixaPeq: TfrmMTCadCaixaPeq;

implementation

Uses uModulo, uSistema, uMensErro, dBaseDados;

{$R *.DFM}

procedure TfrmMTCadCaixaPeq.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
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
end;

procedure TfrmMTCadCaixaPeq.FormCreate(Sender: TObject);
begin
  inherited;
  //
  CaixaPequeno := TCtrlCaixaPequeno.Create;
  CaixaPequeno.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  ListCAPCAR := TCtrlListCAPCAR.Create;
  ListCAPCAR.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  //Atribui os ClientDataSets local a ser persistido pelo objeto de negócios
  CaixaPequeno.CdsCaixaPequeno := cds;
  //
  MontaSelect.Filtro.Add('CAIXAPEQUENO.IDPESSOA = '+IntToStr(Sistema.idEmpresa));
  cds.Data             := CaixaPequeno.ProcurarCxPeq(-1);
  cdsTipoDoc.Data      := ListCAPCAR.ListaTipoDoc('P',True);
  cdsFormaPgto.Data    := ListCAPCAR.ListaFormaRecPag('P',Sistema.idEmpresa);
  //
end;

procedure TfrmMTCadCaixaPeq.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CaixaPequeno.Free;
  ListCAPCAR.Free;
end;

procedure TfrmMTCadCaixaPeq.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  edDesc.SetFocus;
  cds.FieldByName('IDPESSOA').AsFloat       := Sistema.idEmpresa;
end;

procedure TfrmMTCadCaixaPeq.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  edDesc.SetFocus;
end;

procedure TfrmMTCadCaixaPeq.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then Begin
     cds.Data := CaixaPequeno.ProcurarCxPeq(StrToFloat(MontaSelect.ValoresChave[0]));
  end;

end;

procedure TfrmMTCadCaixaPeq.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CaixaPequeno.AplicaOperacaoCxPeq;
end;

procedure TfrmMTCadCaixaPeq.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CaixaPequeno.AplicaOperacaoCxPeq;
end;

procedure TfrmMTCadCaixaPeq.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CaixaPequeno.AplicaOperacaoCxPeq;
end;

procedure TfrmMTCadCaixaPeq.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  if CaixaPequeno.MessageInfo <> '' then
     MsgDlg('Ocorreu o seguinte erro : '+ CaixaPequeno.MessageInfo, 'Aviso', mtError,[mbOK],0);
end;

procedure TfrmMTCadCaixaPeq.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
  cds.Data := CaixaPequeno.ProcurarCxPeq(cds.FieldByName('IDCAIXAPEQUENO').AsFloat);
end;


end.
