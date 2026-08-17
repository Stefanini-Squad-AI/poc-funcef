unit FCadUsuxContr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, CmEventosCadastro, ImgList,
  {$IFDEF VERSAO0505} uComum {$ELSE} uCMTypes {$ENDIF};
                                   
type
  TFrmCadUsuarioxContr = class(TfrmCadastroCS)
    Label1: TLabel;
    EdUsu: TEdit;
    plnTransf: TPanel;
    btnAdiciona: TSpeedButton;
    BtnRemove: TSpeedButton;
    grdTranf: TwwDBGrid;
    GrdTodos: TwwDBGrid;
    dsContrato: TwwDataSource;
    qryContrato: TwwQuery;
    updContrato: TUpdateSQL;
    Panel1: TPanel;
    Panel2: TPanel;
    BtnAdicionaTudo: TSpeedButton;
    btnRemoveTudo: TSpeedButton;
    qryIDUSUARIO: TFloatField;
    qryIDCONTRATO: TFloatField;
    qryIDPESSOA: TFloatField;
    qryNOMECONTRATO: TStringField;
    qryContratoIDCONTRATO: TFloatField;
    qryContratoNOMECONTRATO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btnAdicionaClick(Sender: TObject);
    procedure BtnRemoveClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure BtnAdicionaTudoClick(Sender: TObject);
    procedure btnRemoveTudoClick(Sender: TObject);
    procedure GrdTodosCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure grdTranfCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure Sel( n : LongInt );
  end;

var
  FrmCadUsuarioxContr : TFrmCadUsuarioxContr;
  iIdUsuario      : LongInt;
implementation

{$R *.DFM}

Uses uSistema, uMensErro;

procedure TFrmCadUsuarioxContr.FormCreate(Sender: TObject);
begin
  inherited;
   CmeCadastro.RepetirInsert := False;
   Sel(-1 );
   edUsu.Clear;
end;

Procedure TFrmCadUsuarioxContr.Sel( n : LongInt );
begin
   iIdUsuario := n;

   qry.Close;
   qry.ParamByName('pIDUSUARIO').asInteger := n;
   qry.ParamByName('pIDPESSOA').asInteger  := Sistema.IdEmpresa;
   qry.Open;

   qryContrato.Close;
   qryContrato.ParamByName('pIDUSUARIO').asInteger := n;
   qryContrato.ParamByName('pIDPESSOA').asInteger  := Sistema.IdEmpresa;
   qryContrato.Open;
end;

procedure TFrmCadUsuarioxContr.CmeCadastroFind(Sender: TObject);
Begin
    Inherited;
    If MontaSelect.RetornouValor Then
      Begin
         Sel(StrToInt(MontaSelect.ValoresChave[0]) );
         edUsu.Text := MontaSelect.ValoresChave[1];
      End;
End;

procedure TFrmCadUsuarioxContr.CmeCadastroInsert(Sender: TObject);
Begin
    CmeCadastro.RepetirInsert := False;
    Inherited;
    If Trim(edUsu.Text) = '' Then
      Begin
          MsgDlg('Não há Nenhum usuário selecionado','Atenção',mtWarning,[mbOk],0);
          bbtnCancelar.Click;
      End
    Else
      qry.Cancel;
End;

procedure TFrmCadUsuarioxContr.btnAdicionaClick(Sender: TObject);
begin
  inherited;
  If CmeCadastro.Operacao in [opInserir,opAlterar] Then
    Begin
       If Not qryContrato.IsEmpty Then
         Begin
            With qry Do
               Begin
                 Append;
                 FieldByName('IDUSUARIO').asInteger   := iIdUsuario;
                 FieldByName('IDPESSOA').asInteger    := Sistema.IdEmpresa;
                 FieldByName('IDCONTRATO').asInteger  := qryContrato.FieldByName('IDCONTRATO').asInteger;
                 FieldByName('NOMECONTRATO').asString := qryContrato.FieldByName('NOMECONTRATO').asString;
                End;
            qryContrato.Delete;
         End;
    End;
end;

procedure TFrmCadUsuarioxContr.BtnRemoveClick(Sender: TObject);
begin
  inherited;
  If CmeCadastro.Operacao in [opInserir,opAlterar] Then
    Begin
      If Not qry.IsEmpty Then
       Begin
          With qryContrato Do
             Begin
               Append;
               FieldByName('IDCONTRATO').asInteger  := qry.FieldByName('IDCONTRATO').asInteger;
               FieldByName('NOMECONTRATO').asString := qry.FieldByName('NOMECONTRATO').asString;
             End;
          qry.Delete;
       End;
    End;
end;

procedure TFrmCadUsuarioxContr.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  bbtnCancelar.Click;
end;

procedure TFrmCadUsuarioxContr.BtnAdicionaTudoClick(Sender: TObject);
begin
  inherited;
  qryContrato.First;
  While Not qryContrato.Eof Do
    btnAdiciona.Click;
end;

procedure TFrmCadUsuarioxContr.btnRemoveTudoClick(Sender: TObject);
begin
  inherited;
  qry.First;
  While Not qry.Eof Do
    btnRemove.Click;
end;

procedure TFrmCadUsuarioxContr.GrdTodosCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
   //Faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.color := clwhite
         end else begin
            ABrush.Color := $00C0FFFF; //Amarelo Bebê
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;

procedure TFrmCadUsuarioxContr.grdTranfCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
   //Faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.color := clwhite
         end else begin
            ABrush.Color := $00C0FFFF; //Amarelo Bebê
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;

end.
