unit FMTCadComprador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  DBTables, Wwquery, wwdblook, CMDBLookupCombo, Grids, Wwdbigrd, Wwdbgrid,
  Provider,uCtrlComprador, uCMTypes;

type
  TFrmMTCadComprador = class(TFrmCadastroMT)
    qryUsuario: TwwQuery;
    qryUsuarioNOMEUSUARIO: TStringField;
    qryUsuarioIDUSUARIO: TFloatField;
    Label1: TLabel;
    dblcUsu: TCMDBLookupCombo;
    cdsGrupoProd: TCMClientDataSet;
    plnTransf: TPanel;
    btnAdiciona: TSpeedButton;
    BtnRemove: TSpeedButton;
    BtnAdicionaTudo: TSpeedButton;
    btnRemoveTudo: TSpeedButton;
    grdTranf: TwwDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    GrdTodos: TwwDBGrid;
    dsGrupoProd: TwwDataSource;
    cdsUsuario: TCMClientDataSet;
    dspUsuario: TDataSetProvider;
    procedure FormCreate(Sender: TObject);
    procedure dblcUsuCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnAdicionaClick(Sender: TObject);
    procedure BtnRemoveClick(Sender: TObject);
    procedure BtnAdicionaTudoClick(Sender: TObject);
    procedure btnRemoveTudoClick(Sender: TObject);
    procedure GrdTodosCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure grdTranfCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Comprador : TCtrlComprador;
    Procedure Sel( IdComprador : Double );
  public
    { Public declarations }
  end;

var
  FrmMTCadComprador: TFrmMTCadComprador;

implementation

{$R *.DFM}

Uses uSistema, uMensErro, DBasedados;  

procedure TFrmMTCadComprador.FormCreate(Sender: TObject);
begin
  inherited;
  Comprador := TCtrlComprador.Create;
  Comprador.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  Comprador.cds := cds;
  //
  cdsUsuario.Open;
  //
  Sel(-1);
end;

procedure TFrmMTCadComprador.Sel(IdComprador: Double);
begin
  cds.Data := Comprador.Procurar( IdComprador );

  cdsGrupoProd.Data := Comprador.ListGrupoDisponivel( IdComprador );
end;

procedure TFrmMTCadComprador.dblcUsuCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if Modified And (Trim(dblcUsu.Text) <> '') Then
     Sel(StrToInt(dblcUsu.LookupValue));
end;

procedure TFrmMTCadComprador.btnAdicionaClick(Sender: TObject);
Var
   sStatus : String;
   sAux    : String;
begin
  inherited;
  If CmeCadastro.Operacao in [opInserir,opAlterar] Then
    Begin
         If Not cdsGrupoProd.IsEmpty Then
            Begin
                cds.Append;
                cds.FieldByName('IDCOMPRADOR').asInteger  := StrToInt(dblcUsu.LookupValue);
                cds.FieldByName('CODGRUPOPROD').asString  := cdsGrupoProd.FieldByName('CODGRUPOPROD').asString;
                cds.FieldByName('DESCGRUPOPROD').asString := cdsGrupoProd.FieldByName('DESCGRUPOPROD').asString;
                cds.FieldByName('STATUSGRUPO').asString   := cdsGrupoProd.FieldByName('STATUSGRUPO').asString;
                cds.Post;
                sStatus := cdsGrupoProd.FieldByName('STATUSGRUPO').asString;
                sAux    := Trim(cdsGrupoProd.FieldByName('CODGRUPOPROD').asString);
                cdsGrupoProd.Delete;
                If Trim(sStatus) = 'S' Then
                   Begin
                      While (sAux = Copy(cdsGrupoProd.FieldByName('CODGRUPOPROD').asString,1,Length(sAux)) )  And ( Not cdsGrupoProd.IsEmpty ) Do
                          Begin
                             cds.Append;
                             cds.FieldByName('IDCOMPRADOR').asInteger  := StrToInt(dblcUsu.LookupValue);
                             cds.FieldByName('CODGRUPOPROD').asString  := cdsGrupoProd.FieldByName('CODGRUPOPROD').asString;
                             cds.FieldByName('DESCGRUPOPROD').asString := cdsGrupoProd.FieldByName('DESCGRUPOPROD').asString;
                             cds.FieldByName('STATUSGRUPO').asString   := cdsGrupoProd.FieldByName('STATUSGRUPO').asString;
                             cds.Post;
                             cdsGrupoProd.Delete;
                          End;
                   End;
            End;
    End;
end;

procedure TFrmMTCadComprador.BtnRemoveClick(Sender: TObject);
Var
   sStatus : String;
   sAux    : String;
begin
  inherited;
  If CmeCadastro.Operacao in [opInserir,opAlterar] Then
    Begin
         If Not cds.IsEmpty Then
            Begin
                cdsGrupoProd.Append;
                cdsGrupoProd.FieldByName('CODGRUPOPROD').asString  := cds.FieldByName('CODGRUPOPROD').asString;
                cdsGrupoProd.FieldByName('DESCGRUPOPROD').asString := cds.FieldByName('DESCGRUPOPROD').asString;
                cdsGrupoProd.FieldByName('STATUSGRUPO').asString   := cds.FieldByName('STATUSGRUPO').asString;
                cdsGrupoProd.Post;
                sStatus := cds.FieldByName('STATUSGRUPO').asString;
                sAux    := Trim(cds.FieldByName('CODGRUPOPROD').asString);
                cds.Delete;
                If Trim(sStatus) = 'S' Then
                   Begin
                      While (sAux = Copy(cds.FieldByName('CODGRUPOPROD').asString,1,Length(sAux)) ) And ( Not cds.IsEmpty ) Do
                          Begin
                             cdsGrupoProd.Append;
                             cdsGrupoProd.FieldByName('CODGRUPOPROD').asString  := cds.FieldByName('CODGRUPOPROD').asString;
                             cdsGrupoProd.FieldByName('DESCGRUPOPROD').asString := cds.FieldByName('DESCGRUPOPROD').asString;
                             cdsGrupoProd.FieldByName('STATUSGRUPO').asString   := cds.FieldByName('STATUSGRUPO').asString;
                             cdsGrupoProd.Post;
                             cds.Delete;
                          End;
                   End;
            End;
    End;
end;

procedure TFrmMTCadComprador.BtnAdicionaTudoClick(Sender: TObject);
begin
  cdsGrupoProd.First;
  While Not cdsGrupoProd.Eof Do
    btnAdiciona.Click;
end;

procedure TFrmMTCadComprador.btnRemoveTudoClick(Sender: TObject);
begin
  cds.First;
  While Not cds.Eof Do
    btnRemove.Click;
end;

procedure TFrmMTCadComprador.GrdTodosCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  If cdsGrupoProd.FieldByName('STATUSGRUPO').AsString = 'S' Then
     ABrush.Color := clSilver;
end;

procedure TFrmMTCadComprador.grdTranfCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  If cds.FieldByName('STATUSGRUPO').AsString = 'S' Then
    ABrush.Color := clSilver;
end;

procedure TFrmMTCadComprador.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  bbtnCancelar.Click;
end;

procedure TFrmMTCadComprador.CmeCadastroConfirma(Sender: TObject);
begin
  If Not Comprador.AtribuirGrupos(StrToIntDef(dblcUsu.LookupValue,0)) Then
  Begin
    MsgDlg(Comprador.MessageInfo,'Erro',mtError,[mbOK],0);
    Abort;
  End;
  Sel(StrToIntDef(dblcUsu.LookupValue,0));
  inherited;
end;

procedure TFrmMTCadComprador.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  CmeCadastro.RepetirInsert := False;  
  cds.Cancel;
end;

procedure TFrmMTCadComprador.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Comprador.Free;
end;

end.
