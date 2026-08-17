unit FCadRamoFor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, Db, DBTables, CMwwQuery, cmseldlg, wwidlg, Wwdatsrc,
  DBCtrls, MAHlpBtn, StdCtrls, Buttons, ComCtrls, ToolWin,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, wwdbedit, TB97,
  TB97Ctls, TB97Tlbr, FCadastro, MontaSelect, IvDictio, IvMulti, IvEMulti,
  CmEventosCadastro, ImgList;

type
  TfrmCadRamoFor = class(TfrmCadastroGridCS)
    Label1: TLabel;
    dbedRamoFor: TwwDBEdit;
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadRamoFor: TfrmCadRamoFor;

implementation

{$R *.DFM}

Uses USistema, dBaseDados, UDataBase, UMensErro;

procedure TfrmCadRamoFor.CmeCadastroInsert(Sender: TObject);
Begin
  inherited;
  qry.FieldByName('IDRAMOFORNECEDOR').value := LeUltRegistro(nil,'RAMOFORNECEDOR');
  dbedRamoFor.SetFocus;
end;


procedure TfrmCadRamoFor.CmeCadastroEdit(Sender: TObject);
Begin
  inherited;
  dbedRamoFor.SetFocus;
end;


procedure TfrmCadRamoFor.FormCreate(Sender: TObject);
begin
  qry.Sql.Text := 'SELECT IDRAMOFORNECEDOR,DESCRAMOFORNECEDOR ' +
                          ' FROM ' + Sistema.PrefixoServidor + 'RAMOFORNECEDOR ';
  qry.Open;
  inherited;
end;

procedure TfrmCadRamoFor.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If (MontaSelect.ValoresChave.Count <> 0) AND (Trim(MontaSelect.ValoresChave[0]) <> '') Then
      Qry.Locate('IDRAMOFORNECEDOR',MontaSelect.ValoresChave[0],[]);
End;

procedure TfrmCadRamoFor.bbtnConfirmarClick(Sender: TObject);
begin
  If Trim(dbedRamoFor.Text) = '' Then
     MsgDlg('O Ramo do Fornecedor não pode estar em branco','Erro',mtError,[mbOk],0)
  Else
    inherited;
end;

end.
