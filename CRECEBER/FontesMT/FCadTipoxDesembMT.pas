// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    : FormCreate
Data      : 28/08/2003
Autor     : David Ayrolla
Descrição : Filtragem dos tipos de desembolso pelo campo ATIVO
Pendência : 14458
---------------------------------------------------------------------------------------------------}

unit FCadTipoxDesembMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, ComCtrls, CMTree, wwdblook, CMDBLookupCombo, Grids, Wwdbigrd,
  Wwdbgrid, CmEventosCadastro, ImgList, FCadastroMT, DBClient,
  uCMClientDataSet, uCtrlTipoclixreceb, uCtrlTiporecebdesemb, uCtrlTipocliente;

type
  TFrmCadTipoxDesembMT = class(TFrmCadastroMT)
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
    CmDblTipoCli: TCMDBLookupCombo;
    GrdTipDesemb: TwwDBGrid;
    CdsTipoCliente: TCMClientDataSet;
    CdsTipReceb: TCMClientDataSet;
    DsCdsTipReceb: TwwDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmDblTipoCliCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure BtnIncluiDesembClick(Sender: TObject);
    procedure BtnIncluiTodosDesembClick(Sender: TObject);
    procedure BtnExcluiAllDesembAssocClick(Sender: TObject);
    procedure BtnExcluiDesembAssocClick(Sender: TObject);
    procedure GrdTipDesembCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlTiporecebdesemb : TCtrlTiporecebdesemb;
    CtrlTipocliente     : TCtrlTipocliente;
    CtrlTipoclixreceb   : TCtrlTipoclixreceb;
    procedure InsereDirEsq;
    procedure InsereEsqDir;
    procedure montagrid;

  public
    { Public declarations }
  end;

var
  FrmCadTipoxDesembMT: TFrmCadTipoxDesembMT;

implementation

{$R *.DFM}

Uses Usistema, uMensErro, DBasedados, uCtrlParamIntegra;

Procedure TFrmCadTipoxDesembMT.CmeCadastroAtualizaBotoes(Sender: TObject);
Begin
  Inherited;
  sbtnAlterar.Enabled := Not bbtnConfirmar.Enabled;
End;

Procedure TFrmCadTipoxDesembMT.CmeCadastroFind(Sender: TObject);
Begin
  Inherited;
  If MontaSelect.RetornouValor Then
  Begin
     CmDblTipoCli.LookupValue := MontaSelect.ValoresChave[0];
     MontaGrid;
  End;
End;

procedure TFrmCadTipoxDesembMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTiporecebdesemb := TCtrlTiporecebdesemb.create;
  CtrlTipocliente     := TCtrlTipocliente.create;
  CtrlTipoclixreceb   := TCtrlTipoclixreceb.create;

  CtrlTipoclixreceb.Initialize(DtmBaseDados.dbBaseDados,true,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  CtrlTiporecebdesemb.Initialize(DtmBaseDados.dbBaseDados,false,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  CtrlTipocliente.Initialize(DtmBaseDados.dbBaseDados,false,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CdsTipoCliente.data := CtrlTipocliente.ListaTipoCliente;

  CtrlTipoclixreceb.cds := cds;
end;

procedure TFrmCadTipoxDesembMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  If Cds.Active Then Cds.Close;
end;

procedure TFrmCadTipoxDesembMT.CmDblTipoCliCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  MontaGrid;
end;

procedure TFrmCadTipoxDesembMT.BtnIncluiDesembClick(Sender: TObject);
Var
  sCodigoAnalitico: String;
begin
  inherited;
  If Not CdsTipReceb.IsEmpty Then
  Begin
     If CdsTipReceb.fieldbyname('ANASINT').AsString = 'S' Then
     Begin
        sCodigoAnalitico := Trim(CdsTipReceb.fieldbyname('CODTIPRECDES').AsString);
        While Pos(sCodigoAnalitico,Trim(CdsTipReceb.fieldbyname('CODTIPRECDES').AsString)) = 1 Do
              InsereDirEsq;
     End
     Else
       InsereDirEsq;
  End;
end;

procedure TFrmCadTipoxDesembMT.BtnIncluiTodosDesembClick(Sender: TObject);
begin
  inherited;
  If Not CdsTipReceb.IsEmpty Then
  Begin
    CdsTipReceb.First;
    While Not CdsTipReceb.Eof Do
       BtnIncluiDesemb.click;
  End;
end;

procedure TFrmCadTipoxDesembMT.BtnExcluiAllDesembAssocClick(Sender: TObject);
begin
  inherited;
  If Not Cds.IsEmpty Then
  Begin
    Cds.First;
    While Not Cds.Eof Do
          BtnExcluiDesembAssoc.Click;
  End;
end;

procedure TFrmCadTipoxDesembMT.BtnExcluiDesembAssocClick(Sender: TObject);
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

procedure TFrmCadTipoxDesembMT.GrdTipDesembCalcCellColors(Sender: TObject;
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

procedure TFrmCadTipoxDesembMT.InsereDirEsq;
begin
  cds.Append;
  Cds.Fieldbyname('CODTIPRECDES').asstring   := CdsTipReceb.Fieldbyname('CODTIPRECDES').asstring;
  Cds.Fieldbyname('RECPAG').asstring         := CdsTipReceb.Fieldbyname('RECPAG').asstring;
  Cds.Fieldbyname('IDPESSOA').asfloat        := CdsTipReceb.Fieldbyname('IDPESSOA').asfloat;
  Cds.Fieldbyname('DESCRICAO').asstring      := CdsTipReceb.Fieldbyname('DESCRICAO').asstring;
  Cds.Fieldbyname('ANASINT').asstring        := CdsTipReceb.Fieldbyname('ANASINT').asstring;
  Cds.Fieldbyname('IDTIPOCLIENTE').AsInteger := StrToInt(CmDblTipoCli.Lookupvalue);
  Cds.Post;
  CdsTipReceb.Delete;
end;

procedure TFrmCadTipoxDesembMT.InsereEsqDir;
begin
  cdsTipReceb.Append;
  CdsTipReceb.Fieldbyname('CODTIPRECDES').asstring   := Cds.Fieldbyname('CODTIPRECDES').asstring;
  CdsTipReceb.Fieldbyname('RECPAG').asstring         := Cds.Fieldbyname('RECPAG').asstring;
  CdsTipReceb.Fieldbyname('IDPESSOA').asfloat        := Cds.Fieldbyname('IDPESSOA').asfloat;
  CdsTipReceb.Fieldbyname('DESCRICAO').asstring      := Cds.Fieldbyname('DESCRICAO').asstring;
  CdsTipReceb.Fieldbyname('ANASINT').asstring        := Cds.Fieldbyname('ANASINT').asstring;
  CdsTipReceb.Post;
  Cds.Delete;
end;

procedure TFrmCadTipoxDesembMT.montagrid;
begin
  inherited;
  if trim(CmDblTipoCli.Lookupvalue) <> '' then
  begin
     Cds.data := CtrlTiporecebdesemb.ListTipoRecebDesembxTipoCli(ParamIntegra.RECPAG,
                       Sistema.IdEmpresa, StrToInt(CmDblTipoCli.Lookupvalue));

     CdsTipReceb.Data := CtrlTiporecebdesemb.ListTiporecebDesenbNaoAssoc(ParamIntegra.RECPAG,
                       Sistema.IdEmpresa,StrToInt(CmDblTipoCli.Lookupvalue), 'S');

     if ParamIntegra.RecPag = 'P' then
     begin
        Cds.fieldbyname('CODTIPRECDES').EditMask := ParamIntegra.MascaraDesemb + ';0; ';
        CdsTipReceb.fieldbyname('CODTIPRECDES').EditMask := ParamIntegra.MascaraDesemb + ';0; ';
     end
     else
     begin
        Cds.fieldbyname('CODTIPRECDES').EditMask := ParamIntegra.MascaraReceb + ';0; ';
        CdsTipReceb.fieldbyname('CODTIPRECDES').EditMask := ParamIntegra.MascaraReceb + ';0; ';
     end;
  end;
end;

procedure TFrmCadTipoxDesembMT.CmeCadastroEdit(Sender: TObject);
begin
// Coloquei Como Commentario para ignorar o CmCadastro
//  inherited;
end;

procedure TFrmCadTipoxDesembMT.CmeCadastroConfirma(Sender: TObject);
begin
// Coloquei Como Commentario para ignorar o CmCadastro
//  inherited;
end;

procedure TFrmCadTipoxDesembMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
// Coloquei Como Commentario para ignorar o CmCadastro
//  inherited;
end;

procedure TFrmCadTipoxDesembMT.CmeCadastroCancel(Sender: TObject);
begin
// Coloquei Como Commentario para ignorar o CmCadastro
//  inherited;
end;

procedure TFrmCadTipoxDesembMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
if not CtrlTipoclixreceb.GravarTipoclixreceb then
   MsgDlg(CtrlTipoclixreceb.MessageInfo,'Erro',mtError,[mbOK],0);
end;

procedure TFrmCadTipoxDesembMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
montagrid;
end;

end.
