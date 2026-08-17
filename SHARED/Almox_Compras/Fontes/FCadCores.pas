unit FCadCores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ExtCtrls, Mask, DBCtrls, IvDictio, IvMulti, IvEMulti, CmEventosCadastro,
  ImgList;

type
  TFrmCadCores = class(TfrmCadastroGridCS)
    Label1: TLabel;
    Label2: TLabel;
    dbedCodCor: TDBEdit;
    dbedDescCor: TDBEdit;
    qryCODCOR: TStringField;
    qryDESCCOR: TStringField;

    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
  procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadCores: TFrmCadCores;

implementation

{$R *.DFM}
Uses uMensErro, uString;
procedure TfrmCadCores.CmeCadastroInsert(Sender: TObject);
Begin
   inherited;
   qry.FieldByName('CodCor').asString := '';
  dbedCodCor.SetFocus;
End;
procedure TfrmCadCores.CmeCadastroEdit(Sender: TObject);
Begin
    inherited;
    dbedCodCor.ReadOnly := True;
    dbedCodCor.SetFocus;
End;

Procedure TfrmCadCores.CmeCadastroFind(Sender: TObject);
Var
  sCodigo : String;
Begin
   inherited;
   if (MontaSelect.ValoresChave.count > 0) and (MontaSelect.ValoresChave[0] <> '') then
     Begin
        sCodigo := '';
        sCodigo := Espaco(MontaSelect.ValoresChave[0],5);
        qry.locate('CODCOR',sCodigo,[LopartialKey]);
    end;
End;
procedure TFrmCadCores.bbtnConfirmarClick(Sender: TObject);
begin
   if Trim(dbedCodCor.Text) = '' then
     begin
        MsgDlg('Campo código está vazio preencha-o por favor','ERRO', mtError,[mbOk],0);
        dbedCodCor.SetFocus;
        Exit;
     end;
   if Trim(dbedDescCor.Text) = '' Then
     begin
       MsgDlg('Campo descrição está vazio preencha-o por favor','ERRO', mtError,[mbOk],0);
       dbedDescCor.SetFocus;
       Exit;
     end;
  inherited;

end;

end.
