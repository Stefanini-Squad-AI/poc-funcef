{ --------------------------------------------------------------------------------------------------
Rotina    : btnProcurarClick
Data      : 09/03/2004
Autor     : Marchetti
Pendencia : 15898
Descrição : Ajuste na procura quando cancela sem escolher nenhum registro
---------------------------------------------------------------------------------------------------}

unit FMTContagem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, wwDataInspector, Db, Wwdatsrc, DBTables,
  Wwquery, MontaSelect, Wwdbigrd, Wwdbgrid, DBClient, uCMClientDataSet,
  uCtrlInventario, TREdit, DBCtrls, wwdblook, uCmSqlParams, ImgList,
  uCtrlUnMedida, uCtrlGrupoProd;

type
  TFrmMTContagem = class(TfrmSairAjuda)
    MontaSelect: TMontaSelect;
    grdinvent: TwwDBGrid;
    Panel2: TPanel;
    lbInvent: TLabel;
    lbAlmox: TLabel;
    btnProcurar: TBitBtn;
    cdsInvent: TCMClientDataSet;
    dsInvent: TwwDataSource;
    cdsUnMedida: TCMClientDataSet;
    Panel1: TPanel;
    Label2: TLabel;
    dblcArtigo: TwwDBLookupCombo;
    Label3: TLabel;
    Label4: TLabel;
    edSaldo: TDBRealEdit;
    Label6: TLabel;
    Label5: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    dblcUN: TwwDBLookupCombo;
    cdsArtigo: TCMClientDataSet;
    btnGravar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    cdsGrupoProd: TCMClientDataSet;
    Label7: TLabel;
    dblcGrupoProd: TwwDBLookupCombo;
    btnFiltrar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
    procedure grdinventTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure dblcUNExit(Sender: TObject);
    procedure edSaldoEnter(Sender: TObject);
    procedure grdinventExit(Sender: TObject);
    procedure dblcArtigoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Inventario : TCtrlInventario;
    UnMedida   : TCtrlUnMedida;
    GrupoProd  : TCtrlGrupoProd;
    //
    Procedure Sel ( n : Integer );
  public
    { Public declarations }
  end;

var
  FrmMTContagem: TFrmMTContagem;

implementation

{$R *.DFM}

uses uMensErro, uSistema, dBaseDados, uModulo;

procedure TFrmMTContagem.FormCreate(Sender: TObject);
begin
  inherited;
  lbAlmox.Caption := 'Almoxarifado : '+ Modulo.sAlmoxaUsuario;

  Inventario := TCtrlInventario.Create;
  Inventario.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  Inventario.cdsContagem := cdsInvent;

  UnMedida := TCtrlUnMedida.Create;
  UnMedida.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  GrupoProd := TCtrlGrupoProd.Create;
  GrupoProd.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  MontaSelect.Filtro.Add('INVENTAR.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
  MontaSelect.Filtro.Add('INVENTAR.CODALMOXARIFADO = '+IntToStr(Modulo.iCodAlmoxa));
  MontaSelect.Filtro.Add('INVENTAR.CONTAGEMENCERRADA <> ''T''');

  Sel(-1);

  cdsGrupoProd.Data := GrupoProd.ListGrupoProd(tgAnaliticos);
end;

procedure TFrmMTContagem.Sel( n : Integer );
begin
   cdsInvent.Data := Inventario.ListContagem(n,Modulo.iCodCusteio,Modulo.iCodAlmoxa,'') ;
   TFloatField(cdsInvent.FieldByName('CUSTOMEDIO')).DisplayFormat  :='#,##0.00';
   TFloatField(cdsInvent.FieldByName('QTDECONTADA')).DisplayFormat :='#,####0.0000';
   cdsArtigo.Data := cdsInvent.Data;
   If n > 0 Then
      lbInvent.Caption := 'Nº Inventário : '+ IntToStr( n )
   Else
      lbInvent.Caption := 'Nº Inventário ';

end;

procedure TFrmMTContagem.btnProcurarClick(Sender: TObject);
begin
  inherited;

  MontaSelect.Executar;
  If MontaSelect.RetornouValor Then
  begin
     Sel( StrToIntDef(MontaSelect.ValoresChave[0],0) );
     cdsInvent.First;
     grdinvent.SetFocus;
  end;

end;

procedure TFrmMTContagem.grdinventTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  cdsInvent.IndexFieldNames := AFieldName;

end;

procedure TFrmMTContagem.dblcUNExit(Sender: TObject);
begin
  inherited;
  If Trim(cdsInvent.FieldByName('CODMEDCUSTO').AsString) <> Trim(dblcUn.LookUpValue) Then
     edSaldo.Value := UnMedida.QtdeToUnCustoMedio(cdsInvent.FieldByName('CODPRODUTO').AsString,
                                                  dblcUn.LookUpValue,
                                                  edSaldo.Value );
  cdsInvent.Post;
  cdsInvent.Next;
  grdInvent.SetFocus;                                         
end;

procedure TFrmMTContagem.edSaldoEnter(Sender: TObject);
begin
  inherited;
  cdsInvent.Edit;
  cdsUnMedida.Data       := UnMedida.ListUnMedida(cdsInvent.FieldByName('CODPRODUTO').AsString);
  dblcUN.LookupValue     := cdsInvent.FieldByName('CODMEDCUSTO').AsString;
  dblcArtigo.LookupValue := cdsInvent.FieldByName('CODARTIGO').AsString;
end;

procedure TFrmMTContagem.grdinventExit(Sender: TObject);
begin
  inherited;
  If (MontaSelect.ValoresChave[1] = 'A') and (CdsInvent.FieldByName('QTDECONTADA').IsNull) then
     Begin
        CdsInvent.Edit;
        CdsInvent.FieldByName('QTDECONTADA').AsFloat := CdsInvent.FieldByName('SALDOQTDE').AsFloat;
        CdsInvent.Post;
     end;

  CdsInvent.Edit;

  edSaldo.SetFocus;
end;

procedure TFrmMTContagem.dblcArtigoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified Then
     cdsInvent.Locate('CODARTIGO',dblcArtigo.LookupValue,[]);
end;

procedure TFrmMTContagem.FormShow(Sender: TObject);
begin
  inherited;
  btnProcurar.SetFocus;
end;

procedure TFrmMTContagem.btnGravarClick(Sender: TObject);
begin
  inherited;
  cdsInvent.Filter   := '';
  cdsInvent.Filtered := False;
  If Inventario.GravarContagem Then
     Begin
        MsgDlg('Contagem gravada !', 'Informação', mtInformation, [mbOk], 0);
        Sel( StrToIntDef(MontaSelect.ValoresChave[0],0) );
     End
  Else
     MsgDlg(Inventario.MessageInfo, 'Erro', mtError, [mbOk], 0);


end;

procedure TFrmMTContagem.btnFiltrarClick(Sender: TObject);
begin
  inherited;
  If Trim(dblcGrupoProd.Text) <> '' Then
     Begin
        cdsInvent.Filtered := False;
        cdsInvent.Filter   := 'CODGRUPOPROD = '+QuotedStr(dblcGrupoProd.LookupValue);
        cdsInvent.Filtered := True;
     End
  Else
     Begin
        cdsInvent.Filter   := '';
        cdsInvent.Filtered := False;
     End;
end;

procedure TFrmMTContagem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  If cdsInvent.ChangeCount > 0 Then
    If MsgDlg('Os dados da contagem não foram salvos. Deseja salvar', 'Pergunta', mtConfirmation, [mbYes,mbNo], 0) = MrYes then
       btnGravar.Click;
  inherited;
end;

end.
