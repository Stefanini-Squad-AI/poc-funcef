unit FCadUsuxAlmox;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, CmEventosCadastro, ImgList,uCMTypes;

type
  TFrmCadUsuxAlmox = class(TfrmCadastroCS)
    Label1: TLabel;
    EdUsu: TEdit;
    plnTransf: TPanel;
    btnAdiciona: TSpeedButton;
    BtnRemove: TSpeedButton;
    grdTranf: TwwDBGrid;
    GrdTodos: TwwDBGrid;
    dsAlmox: TwwDataSource;
    qryAlmox: TwwQuery;
    updAlmox: TUpdateSQL;
    qryIDUSUARIO: TFloatField;
    qryCODALMOXARIFADO: TFloatField;
    qryIDPESSOA: TFloatField;
    qryDESCALMOX: TStringField;
    qryAlmoxCODALMOXARIFADO: TFloatField;
    qryAlmoxDESCALMOX: TStringField;
    Panel1: TPanel;
    Panel2: TPanel;
    BtnAdicionaTudo: TSpeedButton;
    btnRemoveTudo: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btnAdicionaClick(Sender: TObject);
    procedure BtnRemoveClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure BtnAdicionaTudoClick(Sender: TObject);
    procedure btnRemoveTudoClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure Sel( n : LongInt );
  end;

var
  FrmCadUsuxAlmox : TFrmCadUsuxAlmox;
  iIdUsuario      : LongInt;
implementation

{$R *.DFM}

Uses uSistema, uMensErro;

procedure TFrmCadUsuxAlmox.FormCreate(Sender: TObject);
begin
  inherited;
   CmeCadastro.RepetirInsert := False;
   Sel(-1 );
   edUsu.Clear;   
end;

Procedure TFrmCadUsuxAlmox.Sel( n : LongInt );
begin
   iIdUsuario := n;
   //
   qry.Close;
   qry.ParamByName('pIDUSUARIO').asInteger := n;
   qry.ParamByName('pIDPESSOA').asInteger  := Sistema.IdEmpresa;
   qry.Open;
   //
   qryAlmox.Close;
   qryAlmox.ParamByName('pIDUSUARIO').asInteger := n;
   qryAlmox.ParamByName('pIDPESSOA').asInteger  := Sistema.IdEmpresa;
   qryAlmox.Open;
end;

procedure TFrmCadUsuxAlmox.CmeCadastroFind(Sender: TObject);
Begin
    Inherited;
    If MontaSelect.RetornouValor Then
      Begin
         Sel(StrToInt(MontaSelect.ValoresChave[0]) );
         edUsu.Text := MontaSelect.ValoresChave[1];
      End;
End;

procedure TFrmCadUsuxAlmox.CmeCadastroInsert(Sender: TObject);
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

procedure TFrmCadUsuxAlmox.btnAdicionaClick(Sender: TObject);
begin
  inherited;
  If sbtnInserir.down Then
    Begin
       If Not qryAlmox.IsEmpty Then
         Begin
            With qry Do
               Begin
                 Append;
                 FieldByName('IDUSUARIO').asInteger       := iIdUsuario;
                 FieldByName('IDPESSOA').asInteger        := Sistema.IdEmpresa;
                 FieldByName('CODALMOXARIFADO').asInteger := qryAlmox.FieldByName('CODALMOXARIFADO').asInteger;
                 FieldByName('DESCALMOX').asString        := qryAlmox.FieldByName('DESCALMOX').asString;
                End;
            qryAlmox.Delete;
         End;
    End;
end;

procedure TFrmCadUsuxAlmox.BtnRemoveClick(Sender: TObject);
begin
  inherited;
  If CmeCadastro.Operacao in [opInserir,opAlterar] Then
    Begin
      If Not qry.IsEmpty Then
       Begin
          With qryAlmox Do
             Begin
               Append;
               FieldByName('CODALMOXARIFADO').asInteger := qry.FieldByName('CODALMOXARIFADO').asInteger;
               FieldByName('DESCALMOX').asString        := qry.FieldByName('DESCALMOX').asString;
             End;
          qry.Delete;
       End;
    End;
end;

procedure TFrmCadUsuxAlmox.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  bbtnCancelar.Click;
end;

procedure TFrmCadUsuxAlmox.BtnAdicionaTudoClick(Sender: TObject);
begin
  inherited;
  qryAlmox.First;
  While Not qryAlmox.Eof Do
    btnAdiciona.Click;
end;

procedure TFrmCadUsuxAlmox.btnRemoveTudoClick(Sender: TObject);
begin
  inherited;
  qry.First;
  While Not qry.Eof Do
    btnRemove.Click;
end;

end.



