unit FCadUsuxGrpProd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, CmEventosCadastro, ImgList;

type
  TFrmCadUsuxGrpProd = class(TfrmCadastroCS)
    updGrpProd: TUpdateSQL;
    qryGrpProd: TwwQuery;
    dsGrpProd: TwwDataSource;
    plnTransf: TPanel;
    btnAdiciona: TSpeedButton;
    BtnRemove: TSpeedButton;
    BtnAdicionaTudo: TSpeedButton;
    btnRemoveTudo: TSpeedButton;
    grdTranf: TwwDBGrid;
    GrdTodos: TwwDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    EdUsu: TEdit;
    qryGrpProdCODGRUPOPROD: TStringField;
    qryGrpProdDESCGRUPOPROD: TStringField;
    qryIDUSUARIO: TFloatField;
    qryCODGRUPOPROD: TStringField;
    qryIDPESSOA: TFloatField;
    qryDESCGRUPOPROD: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btnAdicionaClick(Sender: TObject);
    procedure BtnRemoveClick(Sender: TObject);
    procedure BtnAdicionaTudoClick(Sender: TObject);
    procedure btnRemoveTudoClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
     iIdUsuario      : LongInt;
     //
     Procedure Sel( n : LongInt );
  public
    { Public declarations }
  end;

var
  FrmCadUsuxGrpProd: TFrmCadUsuxGrpProd;

implementation

{$R *.DFM}

Uses uSistema, uMensErro;

procedure TFrmCadUsuxGrpProd.FormCreate(Sender: TObject);
begin
  inherited;
   CmeCadastro.RepetirInsert := False;
   Sel(-1 );
   edUsu.Clear;  
end;

Procedure TFrmCadUsuxGrpProd.Sel( n : LongInt );
begin
   iIdUsuario := n;
   //
   qry.Close;
   qry.ParamByName('pIDUSUARIO').asInteger := n;
   qry.ParamByName('pIDPESSOA').asInteger  := Sistema.IdEmpresa;
   qry.Open;
   //
   qryGrpProd.Close;
   qryGrpProd.ParamByName('pIDUSUARIO').asInteger := n;
   qryGrpProd.Open;
end;

procedure TFrmCadUsuxGrpProd.CmeCadastroFind(Sender: TObject);
Begin
    Inherited;
    If MontaSelect.RetornouValor Then
      Begin
           Sel(StrToInt(MontaSelect.ValoresChave[0]) );
           edUsu.Text := MontaSelect.ValoresChave[1];
      End;
End;

procedure TFrmCadUsuxGrpProd.CmeCadastroInsert(Sender: TObject);
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

procedure TFrmCadUsuxGrpProd.btnAdicionaClick(Sender: TObject);
begin
  inherited;
  If sbtnInserir.Down Then
    Begin
       If Not qryGrpProd.IsEmpty Then
         Begin
            With qry Do
               Begin
                 Append;
                 FieldByName('IDUSUARIO').asInteger    := iIdUsuario;
                 FieldByName('IDPESSOA').asInteger     := Sistema.IdEmpresa;
                 FieldByName('CODGRUPOPROD').asString  := qryGrpProd.FieldByName('CODGRUPOPROD').asString;
                 FieldByName('DESCGRUPOPROD').asString := qryGrpProd.FieldByName('DESCGRUPOPROD').asString;
                End;
            qryGrpProd.Delete;
         End;
    End;
end;

procedure TFrmCadUsuxGrpProd.BtnRemoveClick(Sender: TObject);
begin
  inherited;
  If sbtnInserir.Down Then
    Begin
      If Not qry.IsEmpty Then
       Begin
          With qryGrpProd Do
             Begin
               Append;
               FieldByName('CODGRUPOPROD').asInteger := qry.FieldByName('CODGRUPOPROD').asInteger;
               FieldByName('DESCGRUPOPROD').asString := qry.FieldByName('DESCGRUPOPROD').asString;
             End;
          qry.Delete;
       End;
    End;
end;

procedure TFrmCadUsuxGrpProd.BtnAdicionaTudoClick(Sender: TObject);
begin
  inherited;
  qryGrpProd.First;
  While Not qryGrpProd.Eof Do
     btnAdiciona.Click;
end;

procedure TFrmCadUsuxGrpProd.btnRemoveTudoClick(Sender: TObject);
begin
  inherited;
  qry.First;
  While Not qry.Eof Do
     btnRemove.Click;
end;

end.
