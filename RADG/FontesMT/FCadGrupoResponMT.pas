unit FCadGrupoResponMT;
                                                                                
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, TREdit,
  wwdblook, Spin, uCtrlGrupoRespon,
  Mask, wwdbedit, CMDBLookupCombo, DBCtrls, Wwdbspin ,uCMTypes, CMProcuraSubTipo,
  Grids, Wwdbigrd, Wwdbgrid, DBTables, Wwquery, uCmSqlParams;

type
  TfrmCadGrupoResponMT = class(TFrmCadastroMT)
    cdsUsuDisp: TCMClientDataSet;
    dsUsuDisp: TwwDataSource;
    Label1: TLabel;
    EdDesGrp: TDBEdit;
    dsDet: TwwDataSource;
    cdsDet: TCMClientDataSet;
    CMSqlParams2: TCMSqlParams;
    CMSqlParams1: TCMSqlParams;
    cdsDetIDUSUARIO: TFloatField;
    cdsDetNOME: TStringField;
    cdsDetIDGRPRESPON: TFloatField;
    cdsDetNOMEUSUARIO: TStringField;
    cdsDetFLGSUBSTITUTO: TFloatField;
    cdsDetFLGAVISORAD: TFloatField;
    btnAdiciona: TSpeedButton;
    BtnRemove: TSpeedButton;
    BtnAdicionaTudo: TSpeedButton;
    btnRemoveTudo: TSpeedButton;
    grdTransf: TwwDBGrid;
    GrdTodos: TwwDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    sBtnProcurarg: TToolbarButton97;
    MontaSelect1: TMontaSelect;
    CMSqlParams3: TCMSqlParams;
    cdsDet2: TCMClientDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    DsDet2: TwwDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure btnAdicionaClick(Sender: TObject);
    procedure BtnRemoveClick(Sender: TObject);
    procedure BtnAdicionaTudoClick(Sender: TObject);
    procedure btnRemoveTudoClick(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure sBtnProcurargClick(Sender: TObject);
    procedure GrdTodosTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure grdTransfTitleButtonClick(Sender: TObject;
      AFieldName: String);
  private
    { Private declarations }
     iordem   : integer;
    _GrupoRespon : TCtrlGrupoRespon;
    Procedure Adiciona;
    Procedure Remove;
    Procedure Sel( n : Double );
    Procedure Sel1( n : Double );
    Procedure SelDet( n : Double );

  public
    { Public declarations }
  end;

var
  frmCadGrupoResponMT: TfrmCadGrupoResponMT;

implementation

Uses uModulo, uSistema, uMensErro, dBaseDados;

{$R *.DFM}

procedure TfrmCadGrupoResponMT.FormCreate(Sender: TObject);
begin
  inherited;
  _GrupoRespon := TCtrlGrupoRespon.Create;
  _GrupoRespon.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  //Atribui os ClientDataSets local a ser persistido pelo objeto de negócios
  _GrupoRespon.CdsGrupoRespon := cds;
  _GrupoRespon.CdsGrpxUsu     := cdsDet;
  
  Sel(-1);
  Sel1(-1);
  
  if sistema.VersaoRad <> '+' then
  begin
  cdsDetFLGAVISORAD.Visible:=false;
  cdsDetFLGSUBSTITUTO.Visible:=false
  end;
 

 
 



end;

procedure TfrmCadGrupoResponMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  _GrupoRespon.Free;
end;

procedure TfrmCadGrupoResponMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then Begin
     Sel(StrToFloat(MontaSelect.ValoresChave[0]));
  end;

end;

procedure TfrmCadGrupoResponMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  if _GrupoRespon.MessageInfo <> '' then
     MsgDlg('Ocorreu o seguinte erro : '+ _GrupoRespon.MessageInfo, 'Aviso', mtError,[mbOK],0);
end;

procedure TfrmCadGrupoResponMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  Sel(cds.FieldByName('IDGRPRESPON').AsFloat);

end;

procedure TfrmCadGrupoResponMT.Adiciona;
begin
   If Not cdsUsuDisp.IsEmpty Then Begin
        With CdsDet Do Begin
         Append;
         FieldByName('IDUSUARIO').AsFloat    := cdsUsuDisp.FieldByName('IDUSUARIO').AsFloat;
         FieldByName('NOMEUSUARIO').asString := cdsUsuDisp.FieldByName('NOMEUSUARIO').asString;
         FieldByName('NOME').asString := cdsUsuDisp.FieldByName('NOME').asString;
         FieldByName('FLGSUBSTITUTO').CLEAR;
         FieldByName('FLGAVISORAD').clear;

      End ;

      cdsUsuDisp.Delete;

   End


end;
procedure TfrmCadGrupoResponMT.Remove;
begin
   If Not cdsDet.IsEmpty Then Begin
      With cdsUsuDisp Do Begin
         Append;
         FieldByName('IDUSUARIO').AsFloat    := cdsDet.FieldByName('IDUSUARIO').AsFloat;
         FieldByName('NOMEUSUARIO').asString := cdsDet.FieldByName('NOMEUSUARIO').asString;
         FieldByName('NOME').asString := cdsDet.FieldByName('NOME').asString;
      End;
      cdsDet.Delete;
   End;
end;

procedure TfrmCadGrupoResponMT.Sel(n: Double);
begin

  cds.Data := _GrupoRespon.Procurar(n);
  SelDet(n);
end;
procedure TfrmCadGrupoResponMT.Sel1(n: Double);
begin
  cds.Data := _GrupoRespon.Procurar(n);
  SelDet(n);
end;

procedure TfrmCadGrupoResponMT.btnAdicionaClick(Sender: TObject);
begin
  inherited;
  Adiciona;
end;

procedure TfrmCadGrupoResponMT.BtnRemoveClick(Sender: TObject);
begin
  inherited;
  Remove;
end;

procedure TfrmCadGrupoResponMT.BtnAdicionaTudoClick(Sender: TObject);
begin
  inherited;
  cdsUsuDisp.First;
  While not cdsUsuDisp.Eof do
     Adiciona;
end;

procedure TfrmCadGrupoResponMT.btnRemoveTudoClick(Sender: TObject);
begin
  inherited;
  cdsDet.First;
  While not cdsDet.Eof do
     Remove;
end;

procedure TfrmCadGrupoResponMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  EdDesGrp.SetFocus;
end;

procedure TfrmCadGrupoResponMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := _GrupoRespon.AplicaOperacao(opAlterar,Sistema.IdEmpresa,Sistema.IdUsuario,Sistema.IdModulo);
end;

procedure TfrmCadGrupoResponMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := _GrupoRespon.AplicaOperacao(opApagar,Sistema.IdEmpresa,Sistema.IdUsuario,Sistema.IdModulo);
end;

procedure TfrmCadGrupoResponMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := _GrupoRespon.AplicaOperacao(opInserir,Sistema.IdEmpresa,Sistema.IdUsuario,Sistema.IdModulo);
end;

procedure TfrmCadGrupoResponMT.SelDet(n: Double);
begin
  
  cdsDet.Data     := _GrupoRespon.ProcurarUsuxGrupo(n);
  cdsUsuDisp.Data := _GrupoRespon.ProcurarUsuDisp(n);
  if sistema.VersaoRad <> '+' then
  begin
  cdsDetFLGAVISORAD.Visible:=false;
  cdsDetFLGSUBSTITUTO.Visible:=false
  end;
end;

procedure TfrmCadGrupoResponMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := False;
  if Trim(EdDesGrp.Text) = '' Then Begin
     MsgDlg('Descrição não preenchida','Erro',mtError,[mbOk],0);
     EdDesGrp.SetFocus;
     Exit;
  End;
  if CdsDet.IsEmpty Then begin
     MsgDlg('Proibido existir um grupo sem usuários','Erro',mtError,[mbOk],0);
     EdDesGrp.SetFocus;
     Exit;
  End;
  Accept := True;
end;

procedure TfrmCadGrupoResponMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  SEL1(-1);
  Sel(-1);
  SelDet(-1);
  EdDesGrp.SetFocus;
end;

procedure TfrmCadGrupoResponMT.sBtnProcurargClick(Sender: TObject);
begin
  inherited;

  montaselect1.Executar;
  If MontaSelect1.RetornouValor Then
     Sel(StrToFloat(MontaSelect1.ValoresChave[0]));

  if cds.IsEmpty then
    CmeCadastro.Operacao := opVazio
  else
    CmeCadastro.Operacao := opIdle;

  CmeCadastro.AtualizaBotoes(Self);
  sbtnprocurarg.down := false;
end;
procedure TfrmCadGrupoResponMT.GrdTodosTitleButtonClick(Sender: TObject;
  AFieldName: String);
  var
  IndexDef : TIndexDef;
begin
  inherited;
//catia   -   27/10/2006 
  if ( iOrdem = 0 ) or ( iOrdem = 2 ) then
    iOrdem := 1
  else
    iOrdem := 2;

  CdsUsuDisp.IndexName := '';
  CdsUsuDisp.IndexDefs.Clear;
  IndexDef := CdsUsuDisp.IndexDefs.AddIndexDef;
  IndexDef.Name := 'i' + IntToStr( GetTickCount );

  if iOrdem = 1 then
  begin
    IndexDef.Fields := AFieldName;
    IndexDef.DescFields := '';
    IndexDef.Options := [];
  end
  else
  begin
    IndexDef.Fields := AFieldName;
    IndexDef.DescFields := AFieldName;
    IndexDef.Options := [ixDescending];
  end;

  CdsUsuDisp.IndexName := IndexDef.Name;
  CdsUsuDisp.First;
//fim
end;

procedure TfrmCadGrupoResponMT.grdTransfTitleButtonClick(Sender: TObject;
  AFieldName: String);
   var
  IndexDef : TIndexDef;
begin
  inherited;
//catia   -   27/10/2006
  if ( iOrdem = 0 ) or ( iOrdem = 2 ) then
    iOrdem := 1
  else
    iOrdem := 2;

  CdsDet.IndexName := '';
  CdsDet.IndexDefs.Clear;
  IndexDef := CdsDet.IndexDefs.AddIndexDef;
  IndexDef.Name := 'i' + IntToStr( GetTickCount );

  if iOrdem = 1 then
  begin
    IndexDef.Fields := AFieldName;
    IndexDef.DescFields := '';
    IndexDef.Options := [];
  end
  else
  begin
    IndexDef.Fields := AFieldName;
    IndexDef.DescFields := AFieldName;
    IndexDef.Options := [ixDescending];
  end;

  CdsDet.IndexName := IndexDef.Name;
  CdsDet.First;
//fim
end;

end.
