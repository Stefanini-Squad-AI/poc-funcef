unit FMtCadSCPrePronta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask, DBCtrls,
  uCtrlArtigo,uCtrlUnMedida,uCtrlSCPrePronta, TREdit, wwdblook, uCMTypes;

type
  TFrmMtCadSCPrePronta = class(TFrmCadastroMestreDetMT)
    Label2: TLabel;
    lbAlmox: TStaticText;
    Label1: TLabel;
    EdDesc: TDBEdit;
    cdsArtigo: TCMClientDataSet;
    cdsDet: TCMClientDataSet;
    cdsUnMedida: TCMClientDataSet;
    Label4: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    Label3: TLabel;
    dblcItem: TwwDBLookupCombo;
    dblcDesc: TwwDBLookupCombo;
    dblcUN: TwwDBLookupCombo;
    edQtde: TDBRealEdit;
    edDias: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure dblcItemCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcDescCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroDelete(Sender: TObject);
  private
    { Private declarations }
    Artigo       : TCtrlArtigo;
    UnMedida     : TCtrlUnMedida;
    SCPrePronta  : TCtrlSCPrePronta;
    //
    Procedure SelUnid( S : String );
    Procedure SelMestreDet( n : LongInt );
  public
    { Public declarations }
  end;

var
  FrmMtCadSCPrePronta: TFrmMtCadSCPrePronta;

implementation

{$R *.DFM}

{ TFrmMtCadSCPrePronta }

Uses uSistema, uModulo, uMensErro,  dBaseDados;

procedure TFrmMtCadSCPrePronta.FormCreate(Sender: TObject);
begin
  inherited;
  SCPrePronta :=  TCtrlSCPrePronta.Create;
  SCPrePronta.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  SCPrePronta.cds     := cds;
  SCPrePronta.cdsItem := cdsDet;
  //
  Artigo := TCtrlArtigo.Create;
  Artigo.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer);
  //
  unMedida := TCtrlUnMedida.Create;
  unMedida.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer);
  //
  cdsArtigo.Data  := Artigo.ListArtigo( taInsumo );
  SelMestreDet(-1);
  //
  lbAlmox.Caption := '  ' + Modulo.sAlmoxaUsuario + '  ';
  //
  MontaSelect.Filtro.Add(' IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
  MontaSelect.Filtro.Add(' CODALMOXARIFADO = '+IntToStr(Modulo.iCodAlmoxa));

End;

procedure TFrmMtCadSCPrePronta.SelMestreDet(n: Integer);
begin
  cds.Data := SCPrePronta.Procurar( n );

  cdsDet.Data := SCPrePronta.GetItem( n );

end;

procedure TFrmMtCadSCPrePronta.SelUnid(S: String);
begin
   cdsUnMedida.Data := UnMedida.ListUnMedida( s );
end;

procedure TFrmMtCadSCPrePronta.CmeCadastroInsert(Sender: TObject);
begin
  SelMestreDet(-1);
  inherited;
  cds.FieldByName('IDPESSOA').asInteger        := Sistema.IdEmpresa;
  cds.FieldByName('CODALMOXARIFADO').asInteger := Modulo.iCodAlmoxa;
  EdDesc.SetFocus;
end;

procedure TFrmMtCadSCPrePronta.dblcItemCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If dblcItem.Text <> '' Then
    Begin
       dblcDesc.LookUpValue := dblcItem.LookUpValue;
       SelUnid(dblcItem.LookUpValue );
    End;
end;

procedure TFrmMtCadSCPrePronta.dblcDescCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If dblcDesc.Text <> '' Then
     Begin
        dblcItem.LookUpValue := dblcDesc.LookUpValue;
        SelUnid(dblcDesc.LookUpValue );
     End;
end;

procedure TFrmMtCadSCPrePronta.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
     SelMestreDet( StrToInt(MontaSelect.ValoresChave[0]) );

end;

procedure TFrmMtCadSCPrePronta.CmeDetalheConfirma(Sender: TObject);
begin
   If cdsDet.State in [dsInsert,dsEdit] Then
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
        cdsDet.FieldByName('NDIAS').asInteger    := 1;
        cdsDet.FieldByName('DESCRICAO').asString := dblcDesc.Text;
     End;
  inherited;
end;

procedure TFrmMtCadSCPrePronta.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := SCPrePronta.Excluir;
end;

procedure TFrmMtCadSCPrePronta.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := SCPrePronta.Gravar;
end;

procedure TFrmMtCadSCPrePronta.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := SCPrePronta.Gravar;
end;

procedure TFrmMtCadSCPrePronta.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg(SCPrePronta.MessageInfo,'Erro',mtError,[mbOK],0);
end;

procedure TFrmMtCadSCPrePronta.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  EdDesc.SetFocus;
end;

procedure TFrmMtCadSCPrePronta.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  dblcItem.SetFocus;
end;

procedure TFrmMtCadSCPrePronta.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  dblcItem.SetFocus;
end;

procedure TFrmMtCadSCPrePronta.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := True;
  If cdsDet.IsEmpty Then
     Begin
        MsgDlg('Não há itens cadastrado','Erro',mtError,[mbOK],0);
        edDesc.SetFocus;
        Accept := False;
     End;
end;

procedure TFrmMtCadSCPrePronta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  SCPrePronta.Free;
  Artigo.Free;
  unMedida.Free;
end;

procedure TFrmMtCadSCPrePronta.CmeCadastroDelete(Sender: TObject);
begin
 cdsDet.First;
 While Not cdsDet.Eof Do
    cdsDet.Delete;
 inherited;    
end;

end.
