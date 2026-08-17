unit FSADExpert;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, TB97, CmDock, StdCtrls, uFormManager, fcButton, fcImgBtn,
  fcShapeBtn, fcClearPanel, fcButtonGroup, jpeg;

type
  TFrmSADExpert = class(TForm)
    PnlFundo: TPanel;
    Image1: TImage;
    CMOkCancelar1: TCMOkCancelar;
    fcButtonGroup1: TfcButtonGroup;
    BtnCadModulo: TfcShapeBtn;
    BtnCadRelatorio: TfcShapeBtn;
    BtncadConsultas: TfcShapeBtn;
    BtnArquivoExport: TfcShapeBtn;
    BtnGeraScript: TfcShapeBtn;
    BtnLiberaVersao: TfcShapeBtn;
    procedure BtnLiberaVersaoClick(Sender: TObject);
    procedure BtnCadModuloClick(Sender: TObject);
    procedure CMOkCancelar1SairClick(Sender: TObject);
    procedure BtnGeraScriptClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSADExpert: TFrmSADExpert;

implementation

Uses fLiberaVersao, FCadModulo, fScripAutoriza;

{$R *.DFM}

procedure TFrmSADExpert.BtnLiberaVersaoClick(Sender: TObject);
begin
  With TfrmLiberaVersao.Create(Application) Do
    Try
       ShowModal;
    finally
       free;
    End;
end;

procedure TFrmSADExpert.BtnCadModuloClick(Sender: TObject);
begin
  With TFrmCadModulo.Create(Application) Do
    Try
       ShowModal;
    finally
       free;
    End;
end;

procedure TFrmSADExpert.CMOkCancelar1SairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmSADExpert.BtnGeraScriptClick(Sender: TObject);
begin
  With TfrmScriptAutoriza.Create(Application) Do
    Try
       ShowModal;
    finally
       free;
    End;
end;

end.
