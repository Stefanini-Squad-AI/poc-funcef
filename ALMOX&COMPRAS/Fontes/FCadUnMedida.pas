unit FCadUnMedida;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGrid, StdCtrls, Mask, DBCtrls, Db, DBTables, Wwquery, cmseldlg,
  wwidlg, Wwdatsrc, MAHlpBtn, Buttons,   ComCtrls, ToolWin, Grids,
  Wwdbigrd, Wwdbgrid, ExtCtrls, TB97, TB97Ctls, TB97Tlbr, MontaSelect,
  FCadastroGridCS, IvDictio, IvMulti, IvEMulti, CmEventosCadastro, ImgList;

type
  TfrmCadUnMedida = class(TFrmCadastroGridCS)
    dbedCodMed: TDBEdit;
    dbedDescMed: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    qryCODMEDIDA: TStringField;
    qryDESCMEDIDA: TStringField;
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
  frmCadUnMedida: TfrmCadUnMedida;

implementation

uses UMensErro,uString;

{$R *.DFM}
procedure TfrmCadUnMedida.CmeCadastroInsert(Sender: TObject);
Begin
     inherited;
     dbedCodMed.Enabled := True;
     qry.FieldByName('CodMedida').asString := '';
     dbedCodMed.SetFocus;

End;
procedure TfrmCadUnMedida.CmeCadastroEdit(Sender: TObject);
Begin
    inherited;
    dbedCodMed.Enabled := False;
    dbedDescMed.SetFocus;
End;
procedure TfrmCadUnMedida.bbtnConfirmarClick(Sender: TObject);
begin
   if Trim(dbedCodMed.Text) = ''
   then begin
      MsgDlg('Campo código está vazio preencha-o por favor','ERRO', mtError,[mbOk], 0);
      dbedCodMed.SetFocus;
      Exit;
   end;
   if Trim(dbedDescMed.Text) = ''
   then begin
      MsgDlg('Campo descrição está vazio preencha-o por favor','ERRO', mtError,[mbOk], 0);
      dbedDescMed.SetFocus;
      Exit;
   end;
   dbedCodMed.ReadOnly := False;
   inherited;
end;

procedure TfrmCadUnMedida.CmeCadastroFind(Sender: TObject);
Var
  sCodigo : String;
Begin
   inherited;
   if (MontaSelect.ValoresChave.count > 0) and (MontaSelect.ValoresChave[0] <> '') then
     Begin
        sCodigo := '';
        sCodigo := Espaco(MontaSelect.ValoresChave[0],4);
        qry.locate('CODMEDIDA',sCodigo,[LopartialKey]);

    end;

End;
end.
