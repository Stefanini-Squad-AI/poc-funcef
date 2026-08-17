unit FCadIOF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, StdCtrls, TREdit, IvDictio, IvMulti, IvEMulti, MontaSelect,
  DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, Buttons, TB97Tlbr,
  TB97, ExtCtrls, UmensErro, UDataBase, CmEventosCadastro, ImgList ;

type
  TfrmCadIOF = class(TfrmCadastroCS)
    qryIDTABELAIOF: TFloatField;
    qryPRAZO: TFloatField;
    qryPERCENTUAL: TFloatField;
    Label1: TLabel;
    dbPrazo: TDBRealEdit;
    Label2: TLabel;
    dbPercentual: TDBRealEdit;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
    Procedure Posiciona(fIDTabelaIOF : Double);
  public
    { Public declarations }
  end;

var
  frmCadIOF: TfrmCadIOF;

implementation

uses DBaseDados;

{$R *.DFM}

procedure TfrmCadIOF.FormCreate(Sender: TObject);
begin
  inherited;
  Posiciona(-1);
end;

procedure TfrmCadIOF.CmeCadastroInsert(Sender: TObject);
Begin
   Inherited;
   if dbPrazo.CanFocus then
     dbPrazo.SetFocus;
End;

procedure TfrmCadIOF.CmeCadastroEdit(Sender: TObject);
Begin
   Inherited;
   if dbPrazo.CanFocus then
     dbPrazo.SetFocus;
End;

procedure TfrmCadIOF.CmeCadastroFind(Sender: TObject);
Begin
   Inherited;
   If MontaSelect.RetornouValor Then
      Posiciona(StrToFloat(MontaSelect.ValoresChave[0]))
   Else
      Posiciona(-1);
End;

Procedure TfrmCadIOF.Posiciona(fIDTabelaIOF : Double);
Begin
   qry.Close;
   qry.ParamByName('pIDTABELAIOF').AsFloat := fIDTabelaIOF;
   qry.Open;
End;

procedure TfrmCadIOF.CmeCadastroConfirma(Sender: TObject);
Begin
   dtmBaseDados.DbBaseDados.ApplyUpdates([qry]);
End;

procedure TfrmCadIOF.bbtnConfirmarClick(Sender: TObject);
begin
   If dbPrazo.Value <= 0 Then
   Begin
      MsgDlg('Prazo não pode ser igual ou menor que zero.','Mensagem do Sistema',mtWarning,[mbOK],0);
      dbPrazo.SetFocus;
      Exit;
   End
   Else
   Begin
      If qry.State = dsInsert Then
         qry.FieldByName('IDTABELAIOF').asInteger := LeUltRegistro(nil,'TABELAIOF');
   End;
  inherited;
end;

end.
