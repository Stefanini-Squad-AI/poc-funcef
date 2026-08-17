unit FCadRamoxDesembMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, ComCtrls, CMTree, wwdblook, CMDBLookupCombo, Grids, Wwdbigrd,
  Wwdbgrid, CmEventosCadastro, ImgList, FCadastroMT, DBClient, uCtrlRamoFornecedor,
  uCMClientDataSet, uCtrlTiporecebdesemb, uCtrlRamoxdesemb;

type
  TFrmCadRamoxDesembMT = class(TfrmCadastroMT)
    DsTipDesemb: TwwDataSource;
    Splitter1: TSplitter;
    PnlDesemb: TPanel;
    PnlTitDesemb: TPanel;
    PnlCtrls: TPanel;
    BtnIncluiDesemb: TSpeedButton;
    BtnIncluiTodosDesemb: TSpeedButton;
    BtnExcluiDesembAssoc: TSpeedButton;
    BtnExcluiAllDesembAssoc: TSpeedButton;
    PnlCadastro: TPanel;
    GrdTipoDesembAssoc: TwwDBGrid;
    PnlTitDesembAssoc: TPanel;
    PblRamoForn: TPanel;
    Label1: TLabel;
    CmDblRamoForn: TCMDBLookupCombo;
    GrdTipDesemb: TwwDBGrid;
    CdsTipDesemb: TCMClientDataSet;
    CdsRamoForn: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmDblRamoFornCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure BtnIncluiDesembClick(Sender: TObject);
    procedure BtnIncluiTodosDesembClick(Sender: TObject);
    procedure BtnExcluiAllDesembAssocClick(Sender: TObject);
    procedure BtnExcluiDesembAssocClick(Sender: TObject);
    procedure GrdTipDesembCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlTiporecebdesemb : TCtrlTiporecebdesemb;
    CtrlRamoxdesemb     : TCtrlRamoxdesemb;
    CtrlRamoFornecedor : TCtrlRamoFornecedor;
    procedure InsereDirEsq;
    procedure InsereEsqDir;
    procedure montagrid;

  public
    { Public declarations }
  end;

var
  FrmCadRamoxDesembMT: TFrmCadRamoxDesembMT;

implementation

{$R *.DFM}

Uses Usistema, uMensErro, DBasedados, uCtrlParamIntegra;

Procedure TFrmCadRamoxDesembMT.CmeCadastroAtualizaBotoes(Sender: TObject);
Begin
  Inherited;
  sbtnAlterar.Enabled := Not bbtnConfirmar.Enabled;
End;

Procedure TFrmCadRamoxDesembMT.CmeCadastroConfirma(Sender: TObject);
Begin
// Coloquei Como Commentario para ignorar o CmCadastro
//  inherited;
End;

Procedure TFrmCadRamoxDesembMT.CmeCadastroFind(Sender: TObject);
Begin
  Inherited;
  If MontaSelect.RetornouValor Then
  Begin
     CmDblRamoForn.LookupValue := MontaSelect.ValoresChave[0];
     MontaGrid;
  End;
End;

procedure TFrmCadRamoxDesembMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTiporecebdesemb := TCtrlTiporecebdesemb.create;
  CtrlRamoxdesemb   := TCtrlRamoxdesemb.create;
  CtrlRamoxdesemb.Initialize(DtmBaseDados.dbBaseDados,true,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  CtrlTiporecebdesemb.Initialize(DtmBaseDados.dbBaseDados,false,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  CtrlRamoFornecedor := TCtrlRamoFornecedor.create;
  CtrlRamoFornecedor.Initialize(DtmBaseDados.dbBaseDados,false,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  CdsRamoForn.data := CtrlRamoFornecedor.ListaRamoFornecedor;
  CtrlRamoxdesemb.cds := cds;
end;

procedure TFrmCadRamoxDesembMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  If Cds.Active Then Cds.Close;
end;

procedure TFrmCadRamoxDesembMT.CmDblRamoFornCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  MontaGrid;
end;

procedure TFrmCadRamoxDesembMT.BtnIncluiDesembClick(Sender: TObject);
Var
  sCodigoAnalitico: String;
begin
  inherited;
  If Not CdsTipDesemb.IsEmpty Then
  Begin
     If CdsTipDesemb.fieldbyname('ANASINT').AsString = 'S' Then
     Begin
        sCodigoAnalitico := Trim(CdsTipDesemb.fieldbyname('CODTIPRECDES').AsString);
        While Pos(sCodigoAnalitico,Trim(CdsTipDesemb.fieldbyname('CODTIPRECDES').AsString)) = 1 Do
              InsereDirEsq;
     End
     Else
       InsereDirEsq;
  End;
end;

procedure TFrmCadRamoxDesembMT.BtnIncluiTodosDesembClick(Sender: TObject);
begin
  inherited;
  If Not CdsTipDesemb.IsEmpty Then
  Begin
    CdsTipDesemb.First;
    While Not CdsTipDesemb.Eof Do
       BtnIncluiDesemb.click;
  End;
end;

procedure TFrmCadRamoxDesembMT.BtnExcluiAllDesembAssocClick(Sender: TObject);
begin
  inherited;
  If Not Cds.IsEmpty Then
  Begin
    Cds.First;
    While Not Cds.Eof Do
          BtnExcluiDesembAssoc.Click;
  End;
end;

procedure TFrmCadRamoxDesembMT.BtnExcluiDesembAssocClick(Sender: TObject);
Var
  sCodigoAnalitico: String;
begin
  inherited;
  If Not Cds.IsEmpty Then
  Begin
     If Cds.fieldbyname('ANASINT').AsString = 'S' Then
     Begin
        sCodigoAnalitico := Trim(Cds.fieldbyname('CODTIPRECDES').AsString);
        While Pos(sCodigoAnalitico,Trim(Cds.fieldbyname('CODTIPRECDES').AsString)) = 1 Do
              InsereEsqDir;
     End
     Else
       InsereEsqDir;
  End;
end;

procedure TFrmCadRamoxDesembMT.GrdTipDesembCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  If (Not (Sender as TwwDbGrid).Datasource.DataSet.IsEmpty) And
     ((Sender as TwwDbGrid).Datasource.DataSet.FieldByName('ANASINT').AsString = 'S') Then
     Begin
        ABrush.Color := $0080FFFF;
        AFont.Color  := ClNavy;
     End
     Else
     Begin
        ABrush.Color := ClWhite;
        AFont.Color  := ClBlack;
     End
end;

procedure TFrmCadRamoxDesembMT.InsereDirEsq;
begin
  cds.Append;
  Cds.Fieldbyname('CODTIPRECDES').asstring   := CdsTipDesemb.Fieldbyname('CODTIPRECDES').asstring;
  Cds.Fieldbyname('RECPAG').asstring         := CdsTipDesemb.Fieldbyname('RECPAG').asstring;
  Cds.Fieldbyname('IDPESSOA').asfloat        := CdsTipDesemb.Fieldbyname('IDPESSOA').asfloat;
  Cds.Fieldbyname('DESCRICAO').asstring      := CdsTipDesemb.Fieldbyname('DESCRICAO').asstring;
  Cds.Fieldbyname('ANASINT').asstring        := CdsTipDesemb.Fieldbyname('ANASINT').asstring;
  Cds.Fieldbyname('IDRAMOFORNECEDOR').AsInteger := StrToInt(CmDblRamoForn.Lookupvalue);
  Cds.Post;
  CdsTipDesemb.Delete;
end;

procedure TFrmCadRamoxDesembMT.InsereEsqDir;
begin
  CdsTipDesemb.Append;
  CdsTipDesemb.Fieldbyname('CODTIPRECDES').asstring   := Cds.Fieldbyname('CODTIPRECDES').asstring;
  CdsTipDesemb.Fieldbyname('RECPAG').asstring         := Cds.Fieldbyname('RECPAG').asstring;
  CdsTipDesemb.Fieldbyname('IDPESSOA').asfloat        := Cds.Fieldbyname('IDPESSOA').asfloat;
  CdsTipDesemb.Fieldbyname('DESCRICAO').asstring      := Cds.Fieldbyname('DESCRICAO').asstring;
  CdsTipDesemb.Fieldbyname('ANASINT').asstring        := Cds.Fieldbyname('ANASINT').asstring;
  CdsTipDesemb.Post;
  Cds.Delete;
end;

procedure TFrmCadRamoxDesembMT.montagrid;
begin
  inherited;
  if trim(CmDblRamoForn.Lookupvalue) <> '' then
  begin
     Cds.data := CtrlTiporecebdesemb.ListTipoRecebDesembxRamoForn(ParamIntegra.RECPAG,
                     Sistema.IdEmpresa, StrToInt(CmDblRamoForn.Lookupvalue));
     CdsTipDesemb.data := CtrlTiporecebdesemb.ListRamoTiporecebDesenbNaoAssoc( ParamIntegra.RECPAG,
                                              Sistema.IdEmpresa,
                                              StrToInt(CmDblRamoForn.Lookupvalue));
     if ParamIntegra.RecPag = 'P' then
     begin
        Cds.fieldbyname('CODTIPRECDES').EditMask := ParamIntegra.MascaraDesemb + ';0; ';
        CdsTipDesemb.fieldbyname('CODTIPRECDES').EditMask := ParamIntegra.MascaraDesemb + ';0; ';
     end
     else
     begin
        Cds.fieldbyname('CODTIPRECDES').EditMask := ParamIntegra.MascaraReceb + ';0; ';
        CdsTipDesemb.fieldbyname('CODTIPRECDES').EditMask := ParamIntegra.MascaraReceb + ';0; ';
     end;
  end;
end;

procedure TFrmCadRamoxDesembMT.CmeCadastroEdit(Sender: TObject);
begin
// Coloquei Como Commentario para ignorar o CmCadastro
//  inherited;
end;

procedure TFrmCadRamoxDesembMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
// Coloquei Como Commentario para ignorar o CmCadastro
//  inherited;
end;

procedure TFrmCadRamoxDesembMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
if not CtrlRamoxdesemb.GravarRamoxdesemb(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario) then
   MsgDlg(CtrlRamoxdesemb.MessageInfo,'Erro',mtError,[mbOK],0);
end;

end.
