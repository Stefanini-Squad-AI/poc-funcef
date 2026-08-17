unit FUsuxCaixaPeq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, CmEventosCadastro, ImgList;

type
  TFrmUsuxCaixaPeq = class(TfrmCadastroCS)
    Label1: TLabel;
    EdUsu: TEdit;
    plnTransf: TPanel;
    btnAdiciona: TSpeedButton;
    BtnRemove: TSpeedButton;
    BtnAdicionaTudo: TSpeedButton;
    btnRemoveTudo: TSpeedButton;
    grdTranf: TwwDBGrid;
    GrdTodos: TwwDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    updCP: TUpdateSQL;
    qryCP: TwwQuery;
    dsCP: TwwDataSource;
    qryIDCAIXAPEQUENO: TFloatField;
    qryIDUSUARIO: TFloatField;
    qryDESCCAIXAPEQ: TStringField;
    qryCPIDCAIXAPEQUENO: TFloatField;
    qryCPDESCCAIXAPEQ: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btnAdicionaClick(Sender: TObject);
    procedure BtnRemoveClick(Sender: TObject);
    procedure BtnAdicionaTudoClick(Sender: TObject);
    procedure btnRemoveTudoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
    Procedure Sel( n : LongInt );
  public
    { Public declarations }
  end;

var
  FrmUsuxCaixaPeq : TFrmUsuxCaixaPeq;
  iIdUsuario      : LongInt;
implementation

{$R *.DFM}

Uses uSistema, uMensErro;

procedure TFrmUsuxCaixaPeq.FormCreate(Sender: TObject);
begin
  inherited;
   CmeCadastro.RepetirInsert := False;
   Sel(-1 );
   edUsu.Clear;   
end;

Procedure TFrmUsuxCaixaPeq.Sel( n : LongInt );
begin
   iIdUsuario := n;
   //
   qry.Close;
   qry.ParamByName('pIDUSUARIO').asInteger := n;
   qry.Open;
   //
   qryCP.Close;
   qryCP.ParamByName('pIDUSUARIO').asInteger := n;
   qryCP.Open;
end;

procedure TFrmUsuxCaixaPeq.CmeCadastroInsert(Sender: TObject);
Begin
    Inherited;
    If Trim(edUsu.Text) = '' Then
      Begin
          MsgDlg('Não há Nenhum usuário selecionado','Atenção',mtWarning,[mbOk],0);
          bbtnCancelar.Click;
      End
    Else
      qry.Cancel;
End;

procedure TFrmUsuxCaixaPeq.CmeCadastroFind(Sender: TObject);
Begin
    Inherited;
    If MontaSelect.RetornouValor Then
      Begin
           Sel(StrToInt(MontaSelect.ValoresChave[0]) );
           edUsu.Text := MontaSelect.ValoresChave[1];
      End;
End;

procedure TFrmUsuxCaixaPeq.btnAdicionaClick(Sender: TObject);
begin
  inherited;
  If sbtnInserir.down Then
    Begin
       If Not qryCP.IsEmpty Then
         Begin
            With qry Do
               Begin
                 Append;
                 FieldByName('IDUSUARIO').asInteger      := iIdUsuario;
                 FieldByName('IDCAIXAPEQUENO').asInteger := qryCP.FieldByName('IDCAIXAPEQUENO').asInteger;
                 FieldByName('DESCCAIXAPEQ').asString    := qryCP.FieldByName('DESCCAIXAPEQ').asString;
               End;
            qryCP.Delete;
         End;
    End;
end;

procedure TFrmUsuxCaixaPeq.BtnRemoveClick(Sender: TObject);
begin
  inherited;
  If sbtnInserir.down Then
    Begin
      If Not qry.IsEmpty Then
       Begin
          With qryCP Do
             Begin
               Append;
               FieldByName('IDCAIXAPEQUENO').asInteger := qry.FieldByName('IDCAIXAPEQUENO').asInteger;
               FieldByName('DESCCAIXAPEQ').asString    := qry.FieldByName('DESCCAIXAPEQ').asString;
             End;
          qry.Delete;
       End;
    End;
end;

procedure TFrmUsuxCaixaPeq.BtnAdicionaTudoClick(Sender: TObject);
begin
  inherited;
  qryCP.First;
  While Not qryCP.Eof Do
    btnAdiciona.Click;
end;

procedure TFrmUsuxCaixaPeq.btnRemoveTudoClick(Sender: TObject);
begin
  inherited;
  qry.First;
  While Not qry.Eof Do
    btnRemove.Click;
end;

procedure TFrmUsuxCaixaPeq.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  bbtnCancelar.click;
end;

end.
