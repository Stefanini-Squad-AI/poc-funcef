unit FCadItemVenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadProduto, Db, MontaSelect, DBTables, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, TB97Tlbr, DBCtrls, ComCtrls, CMTree, Mask, Grids, Wwdbigrd,
  Wwdbgrid, StdCtrls, TREdit, Buttons, TB97, TabControlDetalhe, ExtCtrls,
  wwdbedit, wwdblook, CMDBLookupCombo, IvDictio, IvMulti, IvEMulti,
  CMProcuraMask, CmEventosCadastro, ImgList;

type
  TFrmCadItemVenda = class(TfrmCadProduto)
    TbsCorTam: TTabSheet;
    pnlCortam: TPanel;
    LblTam: TLabel;
    dblcCor: TwwDBLookupCombo;
    dblcTam: TwwDBLookupCombo;
    dbgCorTam: TwwDBGrid;
    qryCor: TwwQuery;
    qryTam: TwwQuery;
    DsCorTam: TwwDataSource;
    updCorTam: TUpdateSQL;
    qryCorTam: TwwQuery;
    lblCor: TLabel;
    procedure sbtnAltDetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
  private
    { Private declarations }
    Procedure SelCorTam ( S : String );
  public
    { Public declarations }
    procedure GravarProdutoPadrao; Override;
  end;

var
  FrmCadItemVenda : TFrmCadItemVenda;
  bInclue         : Boolean;
implementation

{$R *.DFM}
Uses UDataBase, DBaseDados, uModulo, uMensErro;

procedure TfrmCadItemVenda.SelCorTam( S : String );
Begin
  QryCorTam.Close;
  QryCorTam.SQL.Text:= ' SELECT A.CodArtigo,' +
                   '        A.CodProduto,   ' +
                   '        A.CodCor,       ' +
                   '        A.CodTamanho,   ' +
                   '        A.CodTipoArtigo,' +
                   '        T.DescTamanho,  ' +
                   '        C.DescCor       ' +
                   '  FROM  Artigo A,         ' +
                   '        Cor C,            ' +
                   '        Tamanho T,         ' +
                   '        Produto P          ' +
                   '  WHERE '+
                   '        (A.CodCor  =  C.CodCor) ' +
                   '   And  (A.CodTamanho  =  T.CodTamanho) '+
                   '   And  (A.CodTipoArtigo = 4)  '+
                   '   And  (A.CodProduto = p.CodProduto)  '+
                   '   And (RTRIM(A.CodProduto) = '''+ Trim( S )+ ''')' ;
  QryCorTam.Open;
  //
End;
procedure TfrmCadItemVenda.CmeCadastroFind(Sender: TObject);
Begin
    inherited;
    if (MontaSelect.ValoresChave.count > 0) and (MontaSelect.ValoresChave[0] <> '') then
        SelCorTam(MontaSelect.ValoresChave[0]);
End;

procedure TFrmCadItemVenda.FormCreate(Sender: TObject);
begin
  inherited;
  SelCorTam('');
  //
  qryCor.Open;
  qryTam.Open;
end;

procedure TFrmCadItemVenda.GravarProdutoPadrao;
Begin
   inherited;
   //
   qryCorTam.ApplyUpdates;
End;

Procedure TFrmCadItemVenda.CmeCadastroCancel(Sender: TObject);
Begin
   inherited;
   qryCorTam.CancelUpdates;
End;

Procedure TFrmCadItemVenda.CmeDetalheInsert(Sender: TObject);
Begin
  inherited;
  if pgctrlDetalhe.ActivePage = tbsCorTam Then
     Begin
        bInclue := True;
        dblcCor.SetFocus;
     End;
End;

Procedure TFrmCadItemVenda.CmeDetalheEdit(Sender: TObject);
Begin
    if pgctrlDetalhe.ActivePage = tbsCorTam Then
      Begin
         MsgDlg('Esta opção não está disponível para cor e Tamanho','Erro',mtError,[mbOk],0);
         Exit;
      End;
    inherited;
End;

Procedure TFrmCadItemVenda.CmeDetalheConfirma(Sender: TObject);
Begin
If pgctrlDetalhe.ActivePage = tbsCorTam Then
  Begin
    If qryCorTam.State in [dsInsert,dsEdit] Then
      Begin
         with QryCorTam Do
           Begin
              FieldByName('CodArtigo').AsString     := edCodProd.Text+dblcTam.LookUpValue+dblcCor.LookUpValue;
              FieldByName('CodProduto').AsString    := edCodProd.Text;
              FieldByName('CodTipoArtigo').AsString := '4';
           End;
         if bInclue = True Then
            Begin
                dblcCor.SetFocus;
            End;

      End;
 End;
   inherited;

End;

procedure TFrmCadItemVenda.sbtnExcluiDetClick(Sender: TObject);
begin
   If MsgDlg('Deseja realmente fazer a exclusão','Exclusão',mtConfirmation,[mbYes,mbNo],0) = mrYes Then
      inherited;
End;

procedure TFrmCadItemVenda.sbtnAltDetClick(Sender: TObject);
begin
  if pgctrlDetalhe.ActivePage = tbsCorTam Then
    Begin
       MsgDlg('Esta opção não está disponível para cor e Tamanho','Erro',mtError,[mbOk],0);
       Exit;
    End;
    inherited;
end;




end.
