unit FMTExportArqInvent;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, ZipMstr,
  uCtrlInventario, Db, DBClient, uCMClientDataSet;

type
  TFrmMTExportArqInvent = class(TfrmSairAjuda)
    Zip: TZipMaster;
    Dlg: TSaveDialog;
    cds: TCMClientDataSet;
    bar: TProgressBar;
    btnGerar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    lbStatus: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    Inventario :   TCtrlInventario;
  end;

var
  FrmMTExportArqInvent: TFrmMTExportArqInvent;

implementation

{$R *.DFM}
Uses uSistema, uMensErro, DBaseDados;

procedure TFrmMTExportArqInvent.FormCreate(Sender: TObject);
begin
  inherited;
  Inventario := TCtrlInventario.Create;
  Inventario.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
end;

procedure TFrmMTExportArqInvent.btnGerarClick(Sender: TObject);
Var
   arq : TStrings;
begin
  inherited;
  lbStatus.Caption := 'Gerando arquivo...';
  arq      := TStringList.Create;
  cds.Data := Inventario.GeraArqInvent;
  Bar.Max  := cds.RecordCount;
  Bar.Visible := True;
  btnGerar.Enabled := False;
  Application.ProcessMessages;
  Try
     cds.First;
     While Not cds.Eof Do
        Begin
           arq.Add(cds.FieldByName('REGISTRO').AsString);
           cds.Next;
           bar.Position := bar.Position + 1;
        End;
     lbStatus.Caption := 'Arquivo gerado';
    Application.ProcessMessages;
  Finally
    If Dlg.Execute Then
       arq.SaveToFile(Dlg.FileName);
    zip.FSpecArgs.Add(Dlg.FileName);
    zip.Add;
    arq.Free;
    Bar.Visible := False;
    btnGerar.Enabled := True;
    lbStatus.Caption := '';
  End;
end;

procedure TFrmMTExportArqInvent.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Inventario.Free;
end;

end.
