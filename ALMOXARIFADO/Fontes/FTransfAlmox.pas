unit FTransfAlmox;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, wwdblook,
  CMDBLookupCombo, Grids, Wwdbigrd, Wwdbgrid, IvDictio, IvMulti, IvEMulti,
  CmEventosCadastro, ImgList,uCMTypes;

type
  TFrmTransfAlmox = class(TfrmCadastroCS)
    qryCODALMOXARIFADO: TFloatField;
    qryCODALMOXPERMITE: TFloatField;
    plnTransf: TPanel;
    Panel1: TPanel;
    dblcAlmox: TCMDBLookupCombo;
    Label1: TLabel;
    grdTranf: TwwDBGrid;
    btnAdiciona: TSpeedButton;
    BtnRemove: TSpeedButton;
    qryDESCALMOX: TStringField;
    GrdTodos: TwwDBGrid;
    qryAlmox: TwwQuery;
    dsAlmox: TwwDataSource;
    updAlmox: TUpdateSQL;
    qryCombo: TwwQuery;
    qryComboCODALMOXARIFADO: TFloatField;
    qryComboDESCALMOX: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btnAdicionaClick(Sender: TObject);
    procedure BtnRemoveClick(Sender: TObject);
    procedure GrdTodosDblClick(Sender: TObject);
    procedure grdTranfDblClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
    Procedure Sel( n : LongInt );
    Procedure SelAlmox( n : LongInt );
  public
    { Public declarations }
  end;

var
  FrmTransfAlmox: TFrmTransfAlmox;

implementation

{$R *.DFM}
Uses uMensErro, uSistema,dBaseDados, uDataBase;

procedure TFrmTransfAlmox.CmeCadastroInsert(Sender: TObject);
Begin
    Inherited;
    If Trim(dblcAlmox.Text) = '' Then
      Begin
          MsgDlg('Não há Nenhum Almoxarifado selecionado','Atenção',mtWarning,[mbOk],0);
          bbtnCancelar.Click;
      End;
      qry.Cancel;
End;

procedure TFrmTransfAlmox.CmeCadastroConfirma(Sender: TObject);
Begin
    If qry.State in [dsInsert,dsEdit] Then
      Begin
         If Not qry.IsEmpty Then
            Begin
                qry.First;
                While Not qry.Eof Do
                  Begin
                     qry.Edit;
                     qry.FieldByName('CODALMOXARIFADO').asInteger := StrToInt(MontaSelect.ValoresChave[0]);
                     qry.Next;
                  End;
            End;
           qryAlmox.CancelUpdates;
           SelAlmox(StrToInt(MontaSelect.ValoresChave[0]));
      End;
      Inherited;
      
End;

procedure TFrmTransfAlmox.CmeCadastroCancel(Sender: TObject);
Begin
    Inherited;
    If trim(dblcAlmox.lookUpValue) <> '' Then
      Begin
         Sel(StrToInt(dblcAlmox.LookupValue));
         SelAlmox(StrToInt(dblcAlmox.LookupValue));
      End
    Else
      Begin
         Sel(-1);
         SelAlmox( -1);
      End;
End;

procedure TFrmTransfAlmox.FormCreate(Sender: TObject);
begin
   CmeCadastro.RepetirInsert := False;
   qryCombo.Close;
   qryCombo.Params[0].Value := Sistema.IdEmpresa;
   qryCombo.Open;
   //
   Sel( -1 );
   SelALmox( -1 );
   MontaSelect.Filtro.Add('ALMOX.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
End;

Procedure TFrmTransfAlmox.Sel( n : LongInt );
Begin
  qry.Close;
  qry.Params[0].Value := n;
  qry.Open;
End;

Procedure TFrmTransfAlmox.SelAlmox( n : LongInt );
Begin
  qryAlmox.Close;
  qryAlmox.ParamByName('pIDPESS').Value    := Sistema.IdEmpresa;
  qryAlmox.ParamByName('pCODALMOX1').Value := n;
  qryAlmox.ParamByName('pCODALMOX2').Value := n;
  qryAlmox.Open;
End;

procedure TFrmTransfAlmox.CmeCadastroFind(Sender: TObject);
Begin
    Inherited;
    If MontaSelect.RetornouValor Then
      Begin
           Sel(StrToInt(MontaSelect.ValoresChave[0]) );
           SelAlmox(StrToInt(MontaSelect.ValoresChave[0]) );
           dblcAlmox.LookupValue := MontaSelect.ValoresChave[0];
      End;
End;
procedure TFrmTransfAlmox.btnAdicionaClick(Sender: TObject);
begin
  inherited;
  // Faz a adição no Grid do Cadastro
  If sbtnInserir.Down Then
    Begin
       If Not qryAlmox.IsEmpty Then
         Begin
            With qry Do
               Begin
                 Append;
                 FieldByName('CODALMOXPERMITE').asInteger := qryAlmox.FieldByName('CODALMOXARIFADO').asInteger;
                 FieldByName('DESCALMOX').asString        := qryAlmox.FieldByName('DESCALMOX').asString;
                End;
            qryAlmox.Delete;
         End;
    End;
end;

procedure TFrmTransfAlmox.BtnRemoveClick(Sender: TObject);
begin
  inherited;
     // Faz a Remoção no Grid do Cadastro
  If CmeCadastro.Operacao in [opInserir,opAlterar] Then
    Begin
      If Not qry.IsEmpty Then
       Begin
          With qryAlmox Do
             Begin
               Append;
               FieldByName('CODALMOXARIFADO').asInteger := qry.FieldByName('CODALMOXPERMITE').asInteger;
               FieldByName('DESCALMOX').asString        := qry.FieldByName('DESCALMOX').asString;
             End;
          qry.Delete;
       End;
    End;
end;

procedure TFrmTransfAlmox.GrdTodosDblClick(Sender: TObject);
begin
  inherited;
  btnAdiciona.Click;
end;

procedure TFrmTransfAlmox.grdTranfDblClick(Sender: TObject);
begin
  inherited;
  btnRemove.Click;
end;

procedure TFrmTransfAlmox.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   bbtnCancelar.Click;
end;

end.
