unit FCadTamanho;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGrid, Db, DBTables, Wwquery, cmseldlg, wwidlg, Wwdatsrc,
  DBCtrls, MAHlpBtn, StdCtrls, Buttons,   ComCtrls, ToolWin,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, TB97, MontaSelect, TB97Ctls,
  TB97Tlbr, FCadastroGridCS, IvDictio, IvMulti, IvEMulti,
  CmEventosCadastro, ImgList;

type
  TfrmCadTamanho = class(TfrmCadastroGridCS)
    Label1: TLabel;
    dbedCodTamanho: TDBEdit;
    Label2: TLabel;
    dbedDescTamanho: TDBEdit;
    qryCODTAMANHO: TStringField;
    qryDESCTAMANHO: TStringField;
    procedure bbtnConfirmarClick(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTamanho: TfrmCadTamanho;

implementation

uses UMensErro,uString;

{$R *.DFM}
procedure TfrmCadTamanho.CmeCadastroInsert(Sender: TObject);
Begin
  inherited;
  qry.FieldByName('CodTamanho').asString := '';
  dbedCodTamanho.SetFocus;
End;

procedure TfrmCadTamanho.CmeCadastroEdit(Sender: TObject);
Begin
  inherited;
  dbedCodTamanho.ReadOnly := True;
  dbedCodTamanho.SetFocus;
End;

procedure TfrmCadTamanho.bbtnConfirmarClick(Sender: TObject);
begin
   if Trim(dbedCodTamanho.Text) = '' Then
     begin
        MsgDlg('Campo código está vazio preencha-o por favor','ERRO', mtError,[mbOk],0);
        dbedCodTamanho.SetFocus;
        Exit;
     end;
   if Trim(dbedDescTamanho.Text) = '' Then
      begin
        MsgDlg('Campo descrição está vazio preencha-o por favor','ERRO', mtError,[mbOk],0);
        dbedDescTamanho.SetFocus;
        Exit;
      end;
    dbedCodTamanho.ReadOnly := False;
  inherited;
end;

Procedure TfrmCadTamanho.CmeCadastroFind(Sender: TObject);
Var
  sCodigo : String;
Begin
   inherited;
   if (MontaSelect.ValoresChave.count > 0) and (MontaSelect.ValoresChave[0] <> '') then
     Begin
        sCodigo := '';
        sCodigo := Espaco(MontaSelect.ValoresChave[0],3);
        qry.locate('CODTAMANHO',sCodigo,[LopartialKey]);
    end;
End;

end.
