unit FUsuxCCusto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Mask, DBCtrls, CmEventosCadastro,
  ImgList,uCMTypes;

type
  TFrmUsuxCCusto = class(TfrmCadastroCS)
    plnTransf: TPanel;
    btnAdiciona: TSpeedButton;
    BtnRemove: TSpeedButton;
    grdTranf: TwwDBGrid;
    grgCCusto: TwwDBGrid;
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    updCCusto: TUpdateSQL;
    qryCCusto: TwwQuery;
    dsCCusto: TwwDataSource;
    qryCCustoCODCENTROCUSTO: TStringField;
    qryCCustoIDEMPRESA: TFloatField;
    qryCCustoNOME: TStringField;
    qryCODCENTROCUSTO: TStringField;
    qryNOME: TStringField;
    qryIDPESSOA: TFloatField;
    qryIDUSUARIO: TFloatField;
    qryIDEMPRESA: TFloatField;
    EdUsu: TEdit;
    btnAdicionaTudo: TSpeedButton;
    btnRemoveTudo: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btnAdicionaClick(Sender: TObject);
    procedure BtnRemoveClick(Sender: TObject);
    procedure grgCCustoDblClick(Sender: TObject);
    procedure grdTranfDblClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnAdicionaTudoClick(Sender: TObject);
    procedure btnRemoveTudoClick(Sender: TObject);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
     Procedure selCCusto( idUsu : LongInt );
     Procedure SelUsu( idUsu : LongInt );
  public
    { Public declarations }
  end;

var
  FrmUsuxCCusto : TFrmUsuxCCusto;
  iIdUsu        : LongInt;
implementation

{$R *.DFM}
Uses uSistema, uMensErro, DBaseDados;

Procedure TFrmUsuxCCusto.selCCusto( idUsu : LongInt );
Begin
    qryCCusto.Close;
    qryCCusto.ParamByName('pIDUSU').Value  := idUsu;
    qryCCusto.ParamByName('pIDEMP').Value  := Sistema.IdEmpresa;
    qryCCusto.ParamByName('pIDEMP2').Value := Sistema.IdEmpresa;
    qryCCusto.Open;
end;

Procedure TFrmUsuxCCusto.selUsu( idUsu : LongInt );
Begin
    qry.Close;
    qry.ParamByName('pIDUSU').Value   := idUsu;
    qry.ParamByName('pIDPESS').Value  := Sistema.IdEmpresa;
    qry.Open;
end;

procedure TFrmUsuxCCusto.FormCreate(Sender: TObject);
begin
  inherited;
  CmeCadastro.RepetirInsert := False;
  iIdUsu         := -1;
  SelUsu( -1 );
  SelCCusto( -1 );
  edUsu.Clear;
end;

Procedure TFrmUsuxCCusto
.CmeCadastroFind(Sender: TObject);
Begin
    inherited;
    If MontaSelect.RetornouValor Then
      Begin
          SelUsu( StrToInt(MontaSelect.ValoresChave[0]) );
          SelCCusto( StrToInt(MontaSelect.ValoresChave[0]) );
          iIdUsu     := StrToInt(MontaSelect.ValoresChave[0]);
          edUsu.Text := MontaSelect.ValoresChave[1];
      End;
End;

Procedure TFrmUsuxCCusto.CmeCadastroInsert(Sender: TObject);
Begin
   If Trim(edUsu.Text) = '' Then
      Begin
          MsgDlg('Não há Nenhum Usuário selecionado','Atenção',mtWarning,[mbOk],0);
          bbtnCancelar.Click;
      End
End;

procedure TFrmUsuxCCusto.btnAdicionaClick(Sender: TObject);
begin
  inherited;
  If sbtnInserir.down Then
    Begin
       If Not qryCCusto.IsEmpty Then
         Begin
            With qry Do
               Begin
                 Append;
                 FieldByName('CODCENTROCUSTO').asString := qryCCusto.FieldByName('CODCENTROCUSTO').asString;
                 FieldByName('IDEMPRESA').asInteger     := qryCCusto.FieldByName('IDEMPRESA').asInteger;
                 FieldByName('NOME').asString           := qryCCusto.FieldByName('NOME').asString;
                End;
            qryCCusto.Delete;
         End;
    End;
end;

Procedure TFrmUsuxCCusto.CmeCadastroConfirma(Sender: TObject);
Begin
    If CmeCadastro.Operacao in [opInserir,opAlterar] Then
      Begin
           If Not qry.IsEmpty Then
              Begin
                 qry.First;
                 While Not qry.Eof Do
                   Begin
                      qry.Edit;
                      qry.FieldByName('IDUSUARIO').asInteger := StrToInt(MontaSelect.ValoresChave[0]);
                      qry.FieldByName('IDPESSOA').asInteger  := Sistema.IdEmpresa;
                      qry.Next;
                   End;
               End;
           qryCCusto.CancelUpdates;
           SelCCusto( StrToInt( MontaSelect.ValoresChave[0] ) );
           DtmBaseDados.dbBaseDados.AplicaUpdates([qry]);
      End;
End;

Procedure TFrmUsuxCCusto.CmeCadastroCancel(Sender: TObject);
Begin
    inherited;
    If Trim(edUsu.Text) <> '' Then
       Begin
          SelUsu( iIdUsu );
          SelCCusto( iIdUsu );
       End
    Else
       Begin
          SelUsu( -1 );
          SelCCusto( -1 );
          edUsu.Clear;
       End;
end;

procedure TFrmUsuxCCusto.BtnRemoveClick(Sender: TObject);
begin
  inherited;
  If CmeCadastro.Operacao in [opInserir,opAlterar] Then
    Begin
       If Not qry.IsEmpty Then
         Begin
            With qryCCusto Do
               Begin
                 Append;
                 FieldByName('CODCENTROCUSTO').asString := qry.FieldByName('CODCENTROCUSTO').asString;
                 FieldByName('IDEMPRESA').asInteger     := qry.FieldByName('IDEMPRESA').asInteger;
                 FieldByName('NOME').asString           := qry.FieldByName('NOME').asString;
                End;
            qry.Delete;
         End;
    End;
end;

procedure TFrmUsuxCCusto.grgCCustoDblClick(Sender: TObject);
begin
  inherited;
  btnAdiciona.Click;
end;

procedure TFrmUsuxCCusto.grdTranfDblClick(Sender: TObject);
begin
  inherited;
  BtnRemove.Click;
end;

procedure TFrmUsuxCCusto.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   bbtnCancelar.Click;
end;

procedure TFrmUsuxCCusto.btnAdicionaTudoClick(Sender: TObject);
begin
  inherited;
  qryCCusto.First;
  While Not qryCCusto.EOF Do
    btnAdiciona.Click;
end;

procedure TFrmUsuxCCusto.btnRemoveTudoClick(Sender: TObject);
begin
  inherited;
  qry.First;
  While Not qry.EOF Do
    btnRemove.Click;
end;

end.
