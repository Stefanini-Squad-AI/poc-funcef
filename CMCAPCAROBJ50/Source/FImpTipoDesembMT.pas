unit FImpTipoDesembMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, ComCtrls,
  wwdblook, Db, Wwdatsrc, DBTables, wwQuery, uSistema, uAutorizacao,
  uMensErro, TB97Tlbr, IvDictio, IvMulti, IvEMulti, CMTree, DBClient,
  uCMClientDataSet, uCMTreeViewMT, uCtrlTiporecebdesemb, uCtrlTerceirosCapCar;

type
  TFrmImpTipoDesembMT = class(TfrmOkCancelar)
    Panel1: TPanel;
    Label1: TLabel;
    CmbTipoDesemb: TwwDBLookupCombo;
    ds: TwwDataSource;
    Panel2: TPanel;
    Panel3: TPanel;
    CdsEmpresa: TCMClientDataSet;
    CdsTipoDesemb: TCMClientDataSet;
    CdsImporta: TCMClientDataSet;
    treeDesemb: TCMTreeViewMT;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmbTipoDesembCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
    CtrlTiporecebdesemb : TCtrlTiporecebdesemb;
    CtrlTerceirosCapCar : TCtrlTerceirosCapCar;
  public
    { Public declarations }
  end;

var
  FrmImpTipoDesembMT: TFrmImpTipoDesembMT;

implementation

uses DBaseDados, uCtrlParamIntegra;

{$R *.DFM}

procedure TFrmImpTipoDesembMT.FormCreate(Sender: TObject);
begin
  inherited;
  if ParamIntegra.RecPag = 'P' then
     Caption := 'Tipos de Desembolso'
  else
     Caption := 'Tipos de Recebimento';
  Panel3.Caption := Caption;
  CtrlTerceirosCapCar   := TCtrlTerceirosCapCar.create;
  CtrlTerceirosCapCar.Initialize(DtmBaseDados.dbBaseDados,false,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CdsEmpresa.data := CtrlTerceirosCapCar.ListEmpresa(Sistema.IdEmpresa, ParamIntegra.RecPag);

  CtrlTiporecebdesemb := TCtrlTiporecebdesemb.create;
  CtrlTiporecebdesemb.Initialize(DtmBaseDados.dbBaseDados,true,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  CtrlTiporecebdesemb.cds := CdsImporta;
  CdsTipoDesemb.Data := CtrlTiporecebdesemb.ListTiporecebdesemb(ParamIntegra.RecPag,sistema.idEMPRESA,'','','');
  CdsImporta.data := CtrlTiporecebdesemb.ListTiporecebdesemb(ParamIntegra.RecPag,0,'','','');
end;

procedure TFrmImpTipoDesembMT.bbtnConfirmarClick(Sender: TObject);
var smascara : string;
begin
  inherited;
Try
  If CdsTipoDesemb.IsEmpty Then
  Begin
     Msgdlg('Não exitem '+Caption+' a serer Copiados','Aviso',mterror,[mbOk],0);
     Exit;
  End;
  if ParamIntegra.RecPag = 'R' then
     smascara := ParamIntegra.MascaraReceb
  else
     smascara := ParamIntegra.MascaraDesemb;

  If CdsEmpresa.FieldByName('MASCARADESEMB').AsString <> sMascara Then
  Begin
     Msgdlg('A máscara de ' + Caption + ' da Empresa de Origem é diferente','Aviso',mterror,[mbOk],0);
     Exit;
  End;
  with CdsTipoDesemb do
  begin
     First;
     While Not Eof Do
     Begin
        If CdsEmpresa.FieldByName('PLANO').AsInteger = ParamIntegra.Plano Then
        Begin
           //Se Plano de Contas igual para as duas empresas, importa todos os dados
           CdsImporta.Append;
           CdsImporta.FieldByName('CODTIPRECDES').asstring     := FieldByName('CODTIPRECDES').AsString;
           CdsImporta.FieldByName('RECPAG').asstring           := ParamIntegra.RecPag;
           CdsImporta.FieldByName('IDPESSOA').asfloat          := Sistema.IdEmpresa;
           CdsImporta.FieldByName('PLANO').asstring            := FieldByName('PLANO').AsString;
           CdsImporta.FieldByName('PLACONTA').asstring         := FieldByName('PLACONTA').AsString;
           CdsImporta.FieldByName('DESCRICAO').asstring        := FieldByName('DESCRICAO').AsString;
           CdsImporta.FieldByName('ANASINT').asstring          := FieldByName('ANASINT').AsString;
           CdsImporta.FieldByName('PLACONTACREDITO').asstring  := FieldByName('PLACONTACREDITO').AsString;
           CdsImporta.FieldByName('IDUSUARIOINCLUSAO').asfloat := Sistema.IdUsuario;
        End
        Else
        Begin
           //Se Plano de Contas # ou nulo importa só os tipos de desembolso
           CdsImporta.Append;
           CdsImporta.FieldByName('CODTIPRECDES').asstring     := FieldByName('CODTIPRECDES').AsString;
           CdsImporta.FieldByName('RECPAG').asstring           := ParamIntegra.RecPag;
           CdsImporta.FieldByName('IDPESSOA').asfloat          := Sistema.IdEmpresa;
           CdsImporta.FieldByName('DESCRICAO').asstring        := FieldByName('DESCRICAO').AsString;
           CdsImporta.FieldByName('ANASINT').asstring          := FieldByName('ANASINT').AsString;
           CdsImporta.FieldByName('IDUSUARIOINCLUSAO').asfloat := Sistema.IdUsuario;
        End;
        CdsImporta.post;
        Next;
     End;
  end;
  If CdsEmpresa.FieldByName('PLANO').AsInteger <> ParamIntegra.Plano Then
     Msgdlg(Caption+' Copiados Com Sucesso, porém ' + (#13 + #10) +
            'Como O Plano Contábil da Empresa de Origem é diferente,  as contas' +
              (#13 + #10) + 'Contábeis e de Crédito não foram ser copiadas.',
              'Aviso',mtInformation,[mbOk],0)
  Else
     Msgdlg(Caption+' Copiados Com Sucesso','Aviso',mtInformation,[mbOk],0);
      Close;
Except
End;
end;

procedure TFrmImpTipoDesembMT.CmbTipoDesembCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
var smascara : string;
begin
  inherited;
  If CmbTipoDesemb.Text = '' Then Exit;
  CdsTipoDesemb.Data := CtrlTiporecebdesemb.ListTiporecebdesemb(ParamIntegra.RecPag,CdsEmpresa.fieldbyname('IDPESSOA').AsInteger,'','','');
  if ParamIntegra.RecPag = 'R' then
     smascara := ParamIntegra.MascaraReceb
  else
     smascara := ParamIntegra.MascaraDesemb;

  treeDesemb.mascara := sMascara;

  treeDesemb.MontaArvore;

  Panel2.Enabled := Not CdsTipoDesemb.IsEmpty;
  If Not CdsTipoDesemb.IsEmpty Then
  Begin
     If CdsEmpresa.FieldByName('PLANO').AsInteger <> ParamIntegra.Plano Then
        Msgdlg('O Plano Contábil da Empresa de Origem é diferente, caso' +
            (#13 + #10) + 'estes '+Caption+' sejam copiados, as contas ' +
            (#13 + #10) + 'Contábeis e de Crédito não podem ser copiadas.',
            'Aviso',mtWarning,[mbOk],0);
     If CdsEmpresa.FieldByName('MASCARADESEMB').AsString <> sMascara  Then
        Msgdlg('A máscara de '+Caption+' da Empresa de Origem é diferente','Aviso',mtWarning,[mbOk],0);
  End;
end;

end.

