unit fCadastroMtImob;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  {$IFNDEF VERSAO0505} uCMTypes, {$ENDIF}
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls;

type
  TfrmCadastroMtImob = class(TFrmCadastroMT)
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroMtImob: TfrmCadastroMtImob;

implementation

{$R *.DFM}

procedure TfrmCadastroMtImob.CmeCadastroInsert(Sender: TObject);
begin
  Cds.Close;
  Cds.CreateDataSet;
  inherited;
end;

procedure TfrmCadastroMtImob.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  if (Cds.State = dsbrowse)and not(CmeCadastro.Operacao = opApagar) then
    Cds.Edit;
end;

end.
