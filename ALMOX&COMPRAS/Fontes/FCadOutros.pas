unit FCadOutros;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadProduto, Db, MontaSelect, DBTables, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, TB97Tlbr, DBCtrls, ComCtrls, CMTree, Mask, Grids, Wwdbigrd,
  Wwdbgrid, StdCtrls, TREdit, Buttons, TB97, TabControlDetalhe, ExtCtrls,
  wwdbedit, wwdblook, CMDBLookupCombo, IvDictio, IvMulti, IvEMulti,
  CMProcuraMask, CmEventosCadastro, ImgList;

type
  TFrmCadOutros = class(TfrmCadProduto)
    tbsCorTam: TTabSheet;
    pnlCortam: TPanel;
    dbgCorTam: TwwDBGrid;
    dblcCor: TwwDBLookupCombo;
    dblcTam: TwwDBLookupCombo;
    LblTam: TLabel;
    updCorTam: TUpdateSQL;
    qryCorTam: TwwQuery;
    DsCorTam: TwwDataSource;
    qryTam: TwwQuery;
    qryCor: TwwQuery;
    lblCor: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
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
  FrmCadOutros : TFrmCadOutros;
  bInclue      : Boolean;
implementation

{$R *.DFM}
Uses UDataBase, DBaseDados, uModulo, uMensErro;

procedure TfrmCadOutros.SelCorTam( S : String );
Begin
  QryCorTam.Close;
  QryCorTam.SQL.Text:= ' SELECT A.CodArtigo,'+
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
                   '       (A.CodCor  =  C.CodCor) ' +
                   '   And (A.CodTamanho  =  T.CodTamanho) '+
                   '   And (A.CodTipoArtigo = 3) '+
                   '   And (A.CodProduto = p.CodProduto) '+
                   '   And (RTRIM(A.CodProduto) = '''+ Trim( S )+ ''')' ;

  QryCorTam.Open;
  //
End;
procedure TfrmCadOutros.CmeCadastroFind(Sender: TObject);
Begin
    inherited;
    if MontaSelect.RetornouValor Then
       SelCorTam(MontaSelect.ValoresChave[0]);
End;

procedure TFrmCadOutros.FormCreate(Sender: TObject);
begin
  inherited;
  SelCorTam('');
  //
  qryCor.Open;
  qryTam.Open;
end;

procedure TFrmCadOutros.GravarProdutoPadrao;
Begin
   inherited;
   //
   qryCorTam.ApplyUpdates;
End;

Procedure TFrmCadOutros.CmeCadastroCancel(Sender: TObject);
Begin
   inherited;
   qryCorTam.CancelUpdates;
End;

Procedure TFrmCadOutros.CmeDetalheInsert(Sender: TObject);
Begin
    inherited;
  if pgctrlDetalhe.ActivePage = tbsCorTam Then
     Begin
        bInclue := True;
        dblcCor.SetFocus;
     End;
End;

Procedure TFrmCadOutros.CmeDetalheEdit(Sender: TObject);
Begin
    if pgctrlDetalhe.ActivePage = tbsCorTam Then
      Begin
         MsgDlg('Esta opção não está disponível para cor e Tamanho','Erro',mtError,[mbOk],0);
         Exit;
      End;
    inherited;
End;

Procedure TFrmCadOutros.CmeDetalheConfirma(Sender: TObject);
Begin
If pgctrlDetalhe.ActivePage = tbsCorTam Then
  Begin
    If qryCorTam.State in [dsInsert,dsEdit] Then
      Begin
         with QryCorTam Do
           Begin
              FieldByName('CODARTIGO').AsString     := edCodProd.Text+dblcTam.LookUpValue+dblcCor.LookUpValue;
              FieldByName('CODPRODUTO').AsString    := edCodProd.Text;
              FieldByName('DESCCOR').AsString       := dblcCor.Text;
              FieldByName('DESCTAMANHO').AsString   := dblcTam.Text;
              FieldByName('CODTIPOARTIGO').ASString := '3';
           End;
         if bInclue = True Then
            Begin
                dblcCor.SetFocus;
            End;
      End;
 End;
   inherited;

End;

procedure TFrmCadOutros.sbtnExcluiDetClick(Sender: TObject);
begin
   If MsgDlg('Deseja realmente fazer a exclusão','Exclusão',mtConfirmation,[mbYes,mbNo],0) = mrYes Then
      inherited;
End;

procedure TFrmCadOutros.sbtnAltDetClick(Sender: TObject);
begin
  if pgctrlDetalhe.ActivePage = tbsCorTam Then
    Begin
       MsgDlg('Esta opção não está disponível para cor e Tamanho','Erro',mtError,[mbOk],0);
       Exit;
    End;
    inherited;
end;

end.
