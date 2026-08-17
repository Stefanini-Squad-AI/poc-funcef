unit FCadComprador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, wwdblook, CMDBLookupCombo, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  CMTree, fcdbtreeview, CmEventosCadastro, ImgList,uCMTypes;

type
  TFrmCadComprador = class(TfrmCadastroCS)
    qryUsu: TwwQuery;
    plnTransf: TPanel;
    btnAdiciona: TSpeedButton;
    BtnRemove: TSpeedButton;
    BtnAdicionaTudo: TSpeedButton;
    btnRemoveTudo: TSpeedButton;
    grdTranf: TwwDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    dblcUsu: TCMDBLookupCombo;
    Label1: TLabel;
    qryUsuIDUSUARIO: TFloatField;
    qryUsuNOMEUSUARIO: TStringField;
    qryGrupoProd: TwwQuery;
    qryGrupoProdCODGRUPOPROD: TStringField;
    qryGrupoProdDESCGRUPOPROD: TStringField;
    qryGrupoProdSTATUSGRUPO: TStringField;
    dsUsu: TwwDataSource;
    qryIDCOMPRADOR: TFloatField;
    qryCODGRUPOPROD: TStringField;
    qryDESCGRUPOPROD: TStringField;
    updGrpoProd: TUpdateSQL;
    GrdTodos: TwwDBGrid;
    dsGrupoProd: TwwDataSource;
    updComp: TUpdateSQL;
    qryComp: TwwQuery;
    qryCompIDPESSOA: TFloatField;
    qrySTATUSGRUPO: TStringField;
    procedure dblcUsuCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormCreate(Sender: TObject);
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
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
    Procedure Sel( n : LongInt );
  public
    { Public declarations }
  end;

var
  FrmCadComprador: TFrmCadComprador;
  
implementation

{$R *.DFM}

Uses uDataBase, DbaseDados, uModulo;

procedure TFrmCadComprador.Sel( n : LongInt );
Begin
   qry.DisableControls;
   qryGrupoProd.DisableControls;
   //
   qry.Close;
   qry.ParamByName('IDUSUARIO').asInteger := n;
   qry.Open;
   //
   qryGrupoProd.Close;
   qryGrupoProd.ParamByName('IDUSUARIO').asInteger := n;
   qryGrupoProd.Open;
   //
   qryComp.Close;
   qryComp.ParamByName('pIDPESSOA').asInteger := n;
   qryComp.Open;
   //
   qry.EnableControls;
   qryGrupoProd.EnableControls;
   qryGrupoProdCODGRUPOPROD.EditMask := Modulo.sMascaraGrupoProd + ';0; ';
   qryCODGRUPOPROD.EditMask          := Modulo.sMascaraGrupoProd + ';0; ';   
End;

procedure TFrmCadComprador.CmeCadastroInsert(Sender: TObject);
Begin
    Inherited;
    qry.Cancel;
    dblcUsu.SetFocus;
End;

Procedure TFrmCadComprador.CmeCadastroConfirma(Sender: TObject);
Begin
    If sbtnInserir.Down Then
       Begin
          If (Not qryComp.IsEmpty) And (qry.IsEmpty) Then
             Begin
                qryComp.Delete;
                AplicaAlteracoes([qry,qryComp]);
             End
          Else
          If (qryComp.IsEmpty) And (Not qry.IsEmpty) Then
             Begin
                qryComp.Append;
                qryComp.FieldByName('IDPESSOA').AsInteger := StrToInt(dblcUsu.LookupValue);
                qryComp.Post;
                AplicaAlteracoes([qryComp,qry]);
             End;
       End
    Else
       AplicaAlteracoes([qry,qryComp]);
    Inherited;
End;

procedure TFrmCadComprador.dblcUsuCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified And (Trim(dblcUsu.Text) <> '') Then
    Sel(StrToInt(dblcUsu.LookupValue));
end;

procedure TFrmCadComprador.FormCreate(Sender: TObject);
begin
  inherited;
  Sel(-1);
end;


procedure TFrmCadComprador.btnAdicionaClick(Sender: TObject);
Var
   sStatus : String;
   sAux    : String;
begin
  inherited;
  If CmeCadastro.Operacao in [opInserir,opAlterar] Then
    Begin
         If Not qryGrupoProd.IsEmpty Then
            Begin
                qry.Append;
                qry.FieldByName('IDCOMPRADOR').asInteger  := StrToInt(dblcUsu.LookupValue);
                qry.FieldByName('CODGRUPOPROD').asString  := qryGrupoProd.FieldByName('CODGRUPOPROD').asString;
                qry.FieldByName('DESCGRUPOPROD').asString := qryGrupoProd.FieldByName('DESCGRUPOPROD').asString;
                qry.FieldByName('STATUSGRUPO').asString   := qryGrupoProd.FieldByName('STATUSGRUPO').asString;
                qry.Post;
                sStatus := qryGrupoProd.FieldByName('STATUSGRUPO').asString;
                sAux    := Trim(qryGrupoProd.FieldByName('CODGRUPOPROD').asString);
                qryGrupoProd.Delete;
                If Trim(sStatus) = 'S' Then
                   Begin
                      While (sAux = Copy(qryGrupoProd.FieldByName('CODGRUPOPROD').asString,1,Length(sAux)) )  And ( Not qryGrupoProd.IsEmpty ) Do
                          Begin
                             qry.Append;
                             qry.FieldByName('IDCOMPRADOR').asInteger  := StrToInt(dblcUsu.LookupValue);
                             qry.FieldByName('CODGRUPOPROD').asString  := qryGrupoProd.FieldByName('CODGRUPOPROD').asString;
                             qry.FieldByName('DESCGRUPOPROD').asString := qryGrupoProd.FieldByName('DESCGRUPOPROD').asString;
                             qry.FieldByName('STATUSGRUPO').asString   := qryGrupoProd.FieldByName('STATUSGRUPO').asString;
                             qry.Post;
                             qryGrupoProd.Delete;
                          End;
                   End;
            End;
    End;
end;

procedure TFrmCadComprador.BtnRemoveClick(Sender: TObject);
Var
   sStatus : String;
   sAux    : String;
begin
  inherited;
  If CmeCadastro.Operacao in [opInserir,opAlterar] Then
    Begin
         If Not qry.IsEmpty Then
            Begin
                qryGrupoProd.Append;
                qryGrupoProd.FieldByName('CODGRUPOPROD').asString  := qry.FieldByName('CODGRUPOPROD').asString;
                qryGrupoProd.FieldByName('DESCGRUPOPROD').asString := qry.FieldByName('DESCGRUPOPROD').asString;
                qryGrupoProd.FieldByName('STATUSGRUPO').asString   := qry.FieldByName('STATUSGRUPO').asString;
                qryGrupoProd.Post;
                sStatus := qry.FieldByName('STATUSGRUPO').asString;
                sAux    := Trim(qry.FieldByName('CODGRUPOPROD').asString);
                qry.Delete;
                If Trim(sStatus) = 'S' Then
                   Begin
                      While (sAux = Copy(qry.FieldByName('CODGRUPOPROD').asString,1,Length(sAux)) ) And ( Not qry.IsEmpty ) Do
                          Begin
                             qryGrupoProd.Append;
                             qryGrupoProd.FieldByName('CODGRUPOPROD').asString  := qry.FieldByName('CODGRUPOPROD').asString;
                             qryGrupoProd.FieldByName('DESCGRUPOPROD').asString := qry.FieldByName('DESCGRUPOPROD').asString;
                             qryGrupoProd.FieldByName('STATUSGRUPO').asString   := qry.FieldByName('STATUSGRUPO').asString;
                             qryGrupoProd.Post;
                             qry.Delete;
                          End;
                   End;
            End;
    End;
end;


procedure TFrmCadComprador.BtnAdicionaTudoClick(Sender: TObject);
begin
  inherited;
  qryGrupoProd.First;
  While Not qryGrupoProd.Eof Do
    btnAdiciona.Click;
end;

procedure TFrmCadComprador.btnRemoveTudoClick(Sender: TObject);
begin
  inherited;
  qry.First;
  While Not qry.Eof Do
    btnRemove.Click;
end;

procedure TFrmCadComprador.GrdTodosCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  If qryGrupoProd.FieldByName('STATUSGRUPO').AsString = 'S' Then
    ABrush.Color := clLime;
end;

procedure TFrmCadComprador.grdTranfCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  If qry.FieldByName('STATUSGRUPO').AsString = 'S' Then
    ABrush.Color := clLime;
end;

procedure TFrmCadComprador.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  bbtnCancelar.Click;
end;

end.
